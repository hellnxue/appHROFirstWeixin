package com.hrofirst.service;

import com.fnst.es.common.entity.search.Searchable;
import com.fnst.es.common.service.BaseService;
import com.github.sd4324530.fastweixin.message.BaseMsg;
import com.github.sd4324530.fastweixin.message.TextMsg;
import com.github.sd4324530.fastweixin.message.req.BaseEvent;
import com.github.sd4324530.fastweixin.message.req.BaseReq;
import com.github.sd4324530.fastweixin.message.req.BaseReqMsg;
import com.github.sd4324530.fastweixin.message.req.ImageReqMsg;
import com.github.sd4324530.fastweixin.message.req.TextReqMsg;
import com.google.common.collect.Maps;
import com.hrofirst.entity.Menu;
import com.hrofirst.entity.News;
import com.hrofirst.entity.WeChatUser;
import com.hrofirst.reflect.WeChatReflectMethod;
import com.hrofirst.repository.WeChatRepository;
import com.hrofirst.util.Config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by qixb.fnst on 2015/02/11.
 */
@Service
public class WeChatService extends BaseService<WeChatUser, Long> {
    private static final Logger log = LoggerFactory.getLogger(WeChatService.class);
    public static HashMap<String, Method> methodMap = Maps.newHashMap();

    static {
        Method[] methods = WeChatReflectMethod.class.getDeclaredMethods();
        for (Method method : methods) {
            method.setAccessible(true);
            methodMap.put(method.getName(), method);
        }
    }

    @Autowired
    private MenuService menuService;

    private WeChatRepository getWeChatRepository() {
        return (WeChatRepository) baseRepository;
    }

    public WeChatUser findByUsername_bak(String userName) {
        return getWeChatRepository().findByUsername(userName);
    }

    /**
     * 根据用户名和apptype查询用户信息
     * @param userName
     * @param apptype
     * @return
     */
    public Page<WeChatUser> findByUsernameAndappType(String userName, String apptype) {
        Searchable searchable =
                Searchable.newSearchable().addSearchParam("username_eq", userName).addSearchParam("apptype_eq", apptype);
        return findAll(searchable);
    }
    /**
     * 处理用findByUsernameAndappType方法查询的用户
     */
    public WeChatUser findWeChatUser(String username,String apptype){
    	WeChatUser user=null;
    	List<WeChatUser> userList = findByUsernameAndappType(username, apptype).getContent();
    	if(userList!=null && userList.size()>0){
    		user=userList.get(0);
    	}
    	return user;
    }
    
    public WeChatUser save(WeChatUser weChatUser) {
        return getWeChatRepository().save(weChatUser);
    }

    public WeChatUser saveFollowTime(String weChatUser,String apptype) {
        WeChatUser user = findWeChatUser(weChatUser,apptype);
        if (user != null) {
            user.setFollowDate(new Date());
            user = save(user);
        }
        return user;
    }

    public WeChatUser unSubscribe(String weichatId,String apptype) {
        WeChatUser weChatUser = findWeChatUser(weichatId,apptype);
        if (weChatUser != null) {
            weChatUser.setCurrentMenu(null);
            weChatUser.setIdCard(null);
        }
        return weChatUser;
    }

    public WeChatUser updateMenuId(String weichatId,String apptype, Long menuId) {
        WeChatUser weChatUser = findWeChatUser(weichatId,apptype);
        if (weChatUser != null) {
            weChatUser.setCurrentMenu(menuId);
        }
        return weChatUser;
    }

    public WeChatUser updateMenuId(WeChatUser weChatUser, Long menuId) {
        if (weChatUser != null) {
            weChatUser.setCurrentMenu(menuId);
        }
        return weChatUser;
    }

    public Menu findByWeiChatAndKeyWord(String weichatId,String apptype, String keyWord) {
        WeChatUser weChatUser = findWeChatUser(weichatId,apptype);
        if (weChatUser != null) {
            Menu menu = menuService.findByKeywordAndPId(keyWord, weChatUser.getCurrentMenu());
            if (menu != null) {
                weChatUser = updateMenuId(weChatUser, menu.getId());
            } else {
                //keywords 错误则自动返回最上级
                updateMenuId(weChatUser, null);
            }
            return menu;
        }
        return null;
    }

    //处理HROFirst帮手菜单指令
    public BaseMsg checkHRAndResponseMenu(BaseReq arg) {

        if (arg == null || arg instanceof BaseEvent) {
            //weChat error
            return null;
        }
        String weichatId = arg.getFromUserName();
        WeChatUser user = null;
        if (weichatId != null) {
            user = findWeChatUser(weichatId,"weixinHROFirst");
            if (user == null) {
                user = new WeChatUser(weichatId);
                user.setApptype("weixinHROFirst");
            }
            user.setLastAccessDate(new Date());
//            //只接受菜单2，上传资料的操作
//            user.setCurrentMenu((long) 2);
            user = save(user);
        }
        Long menuId = user.getCurrentMenu();
        Menu menu = menuService.findOne(menuId);
        Menu nextMenu;
        //不回复任何信息
        TextMsg msg = new TextMsg();
        
        //接收图片信息
//        if (arg instanceof ImageReqMsg){
//            try {
//                return handleReflect(arg, menu);
//            } catch (InvocationTargetException e) {
//                log.error(e.getMessage(), e);
//            } catch (IllegalAccessException e) {
//                log.error(e.getMessage(), e);
//            }         	
//        }else{
//        	return showMenu(menuId, menu, msg,1);
//        }
       
        return null;
        
    }

    private BaseMsg handleReflect(BaseReq baseReq, Menu menu) throws InvocationTargetException, IllegalAccessException {
        if (menu != null) {
            Method method = methodMap.get(menu.getOperation());
            if (method != null) {
                String[] arguments = null;
                if (menu.getArgument() != null) {
                    arguments = menu.getArgument().split(",");
                }

                Class<?>[] types = method.getParameterTypes();
                if (arguments != null && arguments.length != types.length - 1) {
                    //error some arguments missing
                    log.error("arguments length!=types.length-1");
                    return null;

                }
                Object[] params = new Object[types.length];
                if (arguments != null && arguments.length >= 1) {
                    System.arraycopy(arguments, 0, params, 0, arguments.length);
                }
                params[params.length - 1] = baseReq;
                //static method
                return (BaseMsg) method.invoke(null, params);
            }
        }
        return null;
    }
    //顶级菜单 
    private TextMsg showParentMenu(WeChatUser user, Long menuId, Menu menu, TextMsg msg) {
        List<Menu> menus;
        if (menuId == null) {
            //show top menu
        	//根据菜单的pId与appType查询对应的菜单集
            Page<Menu> mm = menuService.findByPidAndApptype(null, "weixinPerson");
            menus = (List<Menu>) mm.getContent();
        } else {
            if (menu != null) {
            	//设置currentMenu为空
                user.setCurrentMenu(menu.getpId());
                user = save(user);
                //根据菜单的pId与appType查询对应的菜单集
                Page<Menu> mm = menuService.findByPidAndApptype(menu.getpId(), "weixinPerson");
                menus = (List<Menu>) mm.getContent();
            } else {
            	//根据菜单的pId与appType查询对应的菜单集
                Page<Menu> mm = menuService.findByPidAndApptype(null, "weixinPerson");
                menus = (List<Menu>) mm.getContent();
            }
        }
        buildMenus(msg, menus);
        return msg;
    }

    public TextMsg showTopMenu(TextMsg msg) {
        return showMenu(null, null, msg,1);
    }

    /**
     * 
     * @param menuId
     * @param menu
     * @param msg
     * @param flag 输入错误的菜单时flag设置为2，处理正确的菜单返回信息
     * @return
     */
    private TextMsg showMenu(Long menuId, Menu menu, TextMsg msg,int flag) {
        List<Menu> menus;
        if (menuId == null) {
            //show top menu
             //输入有误时，根据pid和apptype查询菜单项集合
        	  Page<Menu> mm = menuService.findByPidAndApptype(null, "weixinPerson");
              menus = (List<Menu>) mm.getContent();
              buildMenus(msg, menus);
        } else {
        	 //根据输入的keyword和appType查询菜单项
        	 Page<Menu> mm= menuService.findByKeywordAndAppType(menu.getKeyword(), "weixinPerson");
              menus = (List<Menu>) mm.getContent();
            if (menu != null) {
                msg.add(menu.getDetail()).addln().add(menu.getDesc()).addln();
            }
            	//输入正确时组建菜单，没有默认提示wechat_menu_des
              	buildMenus(msg, null);

        }
        return msg;
    }

    private static void buildMenus(TextMsg msg, List<Menu> menus) {
        if (menus != null && !menus.isEmpty()) {
            msg.add(Config.getWechatMenuDesc()).addln();
            for (Menu menuTmp : menus) {
                msg.add(menuTmp.getKeyword()).add(":").add(menuTmp.getDetail()).addln();
            }
        }
        msg.addln()
                .add("按").add(Config.getWechatBackKey()).addln("返回上级菜单")
                .add("按").add(Config.getWechatMenuKey()).addln("显示菜单");
    }

}
