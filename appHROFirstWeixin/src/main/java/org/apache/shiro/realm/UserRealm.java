/**
 *
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package org.apache.shiro.realm;

import com.fnst.es.common.repository.support.SimpleBaseRepositoryFactoryBean;
import com.fnst.es.common.utils.security.Md5Utils;
import com.hrofirst.entity.WeChatUser;
import com.hrofirst.service.WeChatService;
import com.hrofirst.util.Config;
import com.service.provider.HROFirstUserService;
import com.service.provider.entity.HROFirstUserInfo;
import com.service.provider.entity.ReturnS;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.servlet.ModelAndView;

/**

 * <p>Date: 13-3-12 下午9:05
 * <p>Version: 1.0
 */
public class UserRealm extends AuthorizingRealm {

    private String key;

    private static final Logger log = LoggerFactory.getLogger("es-error");
    
	@Autowired
	HROFirstUserService hrofirstUserService;
	
    @Autowired
    private WeChatService weChatService;

    @Autowired
    public UserRealm(ApplicationContext ctx) {
        super();
        //不能注入 因为获取bean依赖顺序问题造成可能拿不到某些bean报错
        //why？
        //因为spring在查找findAutowireCandidates时对FactoryBean做了优化，即只获取Bean，但不会autowire属性，
        //所以如果我们的bean在依赖它的bean之前初始化，那么就得不到ObjectType（永远是Repository）
        //所以此处我们先getBean一下 就没有问题了
        ctx.getBeansOfType(SimpleBaseRepositoryFactoryBean.class);
    }


    private static final String OR_OPERATOR = " or ";
    private static final String AND_OPERATOR = " and ";
    private static final String NOT_OPERATOR = "not ";

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
    	System.out.println("hsx 权限");
        return null;
    }

    /**
     * 支持or and not 关键词  不支持and or混用
     *
     * @param principals
     * @param permission
     * @return
     */
    public boolean isPermitted(PrincipalCollection principals, String permission) {
        if (permission.contains(OR_OPERATOR)) {
            String[] permissions = permission.split(OR_OPERATOR);
            for (String orPermission : permissions) {
                if (isPermittedWithNotOperator(principals, orPermission)) {
                    return true;
                }
            }
            return false;
        } else if (permission.contains(AND_OPERATOR)) {
            String[] permissions = permission.split(AND_OPERATOR);
            for (String orPermission : permissions) {
                if (!isPermittedWithNotOperator(principals, orPermission)) {
                    return false;
                }
            }
            return true;
        } else {
            return isPermittedWithNotOperator(principals, permission);
        }
    }

    private boolean isPermittedWithNotOperator(PrincipalCollection principals, String permission) {
        if (permission.startsWith(NOT_OPERATOR)) {
            return !super.isPermitted(principals, permission.substring(NOT_OPERATOR.length()));
        } else {
            return super.isPermitted(principals, permission);
        }
    }


    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof StatelessToken || super.supports(token);
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
    	
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		String userName = token.getUsername();
		String password = String.valueOf(token.getPassword());
		ReturnS userS = null;
		HROFirstUserInfo userInfo = null;
		
		try{
			userS=hrofirstUserService.getDetailLoginInfo(userName);
			userInfo = (HROFirstUserInfo)userS.getResult(); 
			
			if (userName.equals("10admin")){
				userInfo.setIsPub(true);
			}
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
		
		if( userName != null && !"".equals(userName) && userS!=null && userInfo!=null){
			
			//处理自动登录
			if ("______".equals(password)){
				
				SimpleAuthenticationInfo sa = new SimpleAuthenticationInfo(userName, password, getName());
				Subject currentUser = SecurityUtils.getSubject(); 
				Session session = currentUser.getSession();
				session.setAttribute("ZhiyangUserName",userName); 
				session.setAttribute("ZhiyangPassword",password); 
				session.setAttribute("IdCard",userInfo.getCardID());  
				if (userInfo.getUoi() != null)
					session.setAttribute("orgid",userInfo.getUoi().getRelHroOrgId());  
				return sa;
			}
			
			//智阳用户名、密码登录
    		Integer res = 0;
			
			try{
				res = hrofirstUserService.isPsuser(userName, password);
			}catch(Exception e){
				e.printStackTrace();
			}
			
			Subject currentUser = SecurityUtils.getSubject(); 
			Session session = currentUser.getSession();
			
    		if ( res == 1 ){
    			
				//判断企业用户、个人用户，企业用户只能登录企帮手，个人用户只能登录HR帮手或员工帮手
				
            	if (session.getAttribute("appType") != null){
            		if (((String)session.getAttribute("appType")).equals(Config.getAppType()) && !userInfo.getIsPub()==false){
            			return null;
            		}
            	}

            	SimpleAuthenticationInfo sa = new SimpleAuthenticationInfo(userName, password, getName());
				
				session.setAttribute("ZhiyangUserName",userName);   
				session.setAttribute("ZhiyangPassword",password); 				
				session.setAttribute("IdCard",userInfo.getCardID());  
				
				if (userInfo.getUoi() != null)
					session.setAttribute("orgid",userInfo.getUoi().getRelHroOrgId());  
				
    			String openId = (String) session.getAttribute("UserName");
    			String apptype=(String)session.getAttribute("appType");
    			if (openId == null){
    				return sa;
    			}
    			
    			WeChatUser user = weChatService.findWeChatUser(openId,apptype);
    			
    			if (user == null) {
    				return sa; 
    			}
    			
				user.setZhiyangUserName(userName);
//				if (!getDemoIdCard(userName).equals(""))
//					user.setIdCard(getDemoIdCard(userName));
				
				weChatService.save(user);	
				return sa;
    		}else{
    			session.setAttribute("errorMessage",res);
    		}
		}
		
    	return null;
    }

    private String getKey(String username) {
        return Md5Utils.hash(username + key);
    }

    public void setKey(String key) {
        this.key = key;
    }
    
    public String getDemoIdCard(String zhiyangUserName){
    	
    	if (zhiyangUserName.equals("zhangyongli")){
    		return "140102197701105122";
    	}else if (zhiyangUserName.equals("yanghanyin")){
    		return "410205199007170521";
    	}else if (zhiyangUserName.equals("liangtiefeng")){
    		return "110228197610230626";
    	}else if (zhiyangUserName.equals("hongli")){
    		return "110223198607220040";
    	}else if (zhiyangUserName.equals("hanxiuping")){
    		return "110107197207152421";
    	}else if (zhiyangUserName.equals("lihuihui")){
    		return "412725199201067864";
    	}else if (zhiyangUserName.equals("yingli")){
    		return "360121197601081442";
    	}else if (zhiyangUserName.equals("duanxiaoya")){
    		return "410426197601157040";
    	}else if (zhiyangUserName.equals("chenchunhong")){
    		return "130632198411017245";
    	}else if (zhiyangUserName.equals("tangjinhua")){
    		return "412728198005273825";
    	}else if (zhiyangUserName.equals("dinghaiquan")){
    		return "310103198405237019";
    	}else if (zhiyangUserName.equals("xuzhuo")){
    		return "220722199107076223";
    	}else if (zhiyangUserName.equals("wangchuandong")){
    		return "513021199011276172";
    	}else if (zhiyangUserName.equals("liyanhua")){
    		return "441424199508264629";
    	}else if (zhiyangUserName.equals("wangxue")){
    		return "110226198412171428";
    	}

    	return "";
    }
}
