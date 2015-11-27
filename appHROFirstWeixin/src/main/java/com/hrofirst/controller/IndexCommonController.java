package com.hrofirst.controller;

import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.hrofirst.entity.News;
import com.hrofirst.entity.Policy;
import com.hrofirst.entity.Province;
import com.hrofirst.entity.WeChatUser;
import com.hrofirst.entity.WebAppMenu;
import com.hrofirst.jms.sender.apiDataJMSSender;
import com.hrofirst.service.ProvinceService;
import com.hrofirst.util.Config;
import com.hrofirst.util.ValidatorBasic;
import com.hrofirst.util.casUtils;
import com.service.provider.HROFirstUserService;
import com.service.provider.entity.HROFirstUserInfo;
import com.service.provider.entity.LoginUserInfo;
import com.service.provider.entity.ReturnS;

@Controller
public class IndexCommonController extends baseController{
	
	public String apptype="";//登出时保存apptype类型
	public String openid="";//登出时保存openid参数

    /**
     * 新版微信公众号的login页面，具体登录验证见shiro的UserRealm类的doGetAuthenticationInfo方法，内部会整合openId和智阳用户的关系
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/webApp/login")
    public ModelAndView webApp_login(HttpServletRequest request, HttpServletResponse response, Model model) {
    	if(request.getSession().getAttribute("errorMessage")!=null){
           model.addAttribute("errorMessage", request.getSession().getAttribute("errorMessage"));
    	}
    	System.out.println(request.getAttribute("appName"));
    	//处理退出时session停掉导致的登录页面样式不显示bug
    	if(apptype!=null&&!apptype.equals("")){
    		request.getSession().setAttribute("appType", apptype);
    	}
    	if(openid!=null&&!openid.equals("")){
    		request.getSession().setAttribute("UserName", openid);
    	}
    	return new ModelAndView("webApp/login");
    }  
    
    /**
     * 首页
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/webApp/index")
    public String webApp_index(HttpServletRequest request, HttpServletResponse response, Model model) {
    	Object s=request.getSession().getAttribute("appName");
    	if (request.getSession().getAttribute("appName")!=null){
    		model.addAttribute("appName", request.getSession().getAttribute("appName"));
    		model.addAttribute("appType", request.getSession().getAttribute("appType"));
    	}else{
    		request.getSession().setAttribute("appName", "智阳帮手");
    	}
    	
    	String receiver = "333232312143314";
    	
        Page<News> publicNews =
                newsService.findByReceiverAndType(receiver, News.NewsType.PERSONAL, 0, 4);
        long unReadPublic = newsService.countUnRead(receiver, News.NewsType.PERSONAL);

        model.addAttribute("publicNews", publicNews);
        model.addAttribute("unReadPublic", unReadPublic);
        
    	if (request.getSession().getAttribute("ZhiyangUserName") != null){
    		String name = (String) request.getSession().getAttribute("ZhiyangUserName");
        	//ReturnS res = userService.getLoginInfo(name, 1);
    		ReturnS res = hrofirstUserService.getDetailLoginInfo(name);
    		HROFirstUserInfo userInfo = (HROFirstUserInfo)res.getResult();    
    		if (name.equals("10admin")){
            	model.addAttribute("isPub", true);
    		}else
        	model.addAttribute("isPub", userInfo.getIsPub());
        	
        	model.addAttribute("userName", userInfo.getUserName());
        	model.addAttribute("userID", userInfo.getLoginId());
    	}       
    	
    	long unReadPersonal = newsService.countUnRead(receiver, News.NewsType.PERSONAL);
    	model.addAttribute("unReadPersonal", unReadPersonal);
    	
        return "webApp/index";
    }
    
    /**
     * 用户页
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/webApp/user")
    public ModelAndView webApp_user(HttpServletRequest request, Model model) {
    	
//    	smsService.sendMessage("13811431906", "test");
    	
    	if (request.getSession().getAttribute("ZhiyangUserName") != null){
    		String name = (String) request.getSession().getAttribute("ZhiyangUserName");
    		//ReturnS res = userService.getLoginInfo(name, 1);
    		ReturnS res = hrofirstUserService.getDetailLoginInfo(name);
    		HROFirstUserInfo userInfo = (HROFirstUserInfo)res.getResult();    
        	
        	model.addAttribute("userName", userInfo.getUserName());
        	model.addAttribute("userID", userInfo.getLoginId());
    	}
        return new ModelAndView("webApp/user/user");
    }
    
    
    /**
     * 移动签到页，假的
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/webApp/checkin")
    public ModelAndView webApp_checkin(HttpServletRequest request, Model model) {

    	return new ModelAndView("webApp/user"); 
    }
    
    /**
     * 个人消息页
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/webApp/msgs")
    public ModelAndView webApp_msgs(HttpServletRequest request, Model model) {
    	
    	String receiver = "333232312143314";
        Page<News> personal =
                newsService.findByReceiverAndType(receiver, News.NewsType.PERSONAL, 0, INDEX_NEWS_SIZE);
        long unReadPersonal = newsService.countUnRead(receiver, News.NewsType.PERSONAL);
        Page<News> publicNews =
                newsService.findByReceiverAndType(receiver, News.NewsType.PUBLIC, 0, INDEX_NEWS_SIZE);
        long unReadPublic = newsService.countUnRead(receiver, News.NewsType.PUBLIC);
        Page<News> thirdNews =
                newsService.findByReceiverAndType(receiver, News.NewsType.THIRD, 0, INDEX_NEWS_SIZE);
        long unReadThird = newsService.countUnRead(receiver, News.NewsType.THIRD);
        
        model.addAttribute("personal", personal);
        model.addAttribute("public", publicNews);
        model.addAttribute("third", thirdNews);
        model.addAttribute("unReadThird", unReadThird);
        model.addAttribute("unReadPersonal", unReadPersonal);
        model.addAttribute("unReadPublic", unReadPublic);

    	return new ModelAndView("webApp/news/msgs"); 
    }
    
    @RequestMapping("/webApp/news")
    public ModelAndView webApp_news(HttpServletRequest request, Model model) {
    	
    	String receiver = "333232312143314";
        Page<News> personal =
                newsService.findByReceiverAndType(receiver, News.NewsType.PERSONAL, 0, INDEX_NEWS_SIZE);
        long unReadPersonal = newsService.countUnRead(receiver, News.NewsType.PERSONAL);
        Page<News> publicNews =
                newsService.findByReceiverAndType(receiver, News.NewsType.PUBLIC, 0, INDEX_NEWS_SIZE);
        long unReadPublic = newsService.countUnRead(receiver, News.NewsType.PUBLIC);
        Page<News> thirdNews =
                newsService.findByReceiverAndType(receiver, News.NewsType.THIRD, 0, INDEX_NEWS_SIZE);
        long unReadThird = newsService.countUnRead(receiver, News.NewsType.THIRD);
        model.addAttribute("personal", personal);
        model.addAttribute("public", publicNews);
        model.addAttribute("third", thirdNews);
        model.addAttribute("unReadThird", unReadThird);
        model.addAttribute("unReadPersonal", unReadPersonal);
        model.addAttribute("unReadPublic", unReadPublic);

    	return new ModelAndView("webApp/news/news"); 
    }
    
    /**
     * 登出
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/webApp/logout")
    public ModelAndView webApp_logout(HttpServletRequest request, Model model) {
    	String appTypel=(String)request.getSession().getAttribute("appType");
    	String openId1=(String)request.getSession().getAttribute("UserName");
    	
    	//如果微信号和智阳用户已经绑定，那么解除绑定
    	if ( request.getSession().getAttribute("UserName") != null){
    		String openId = (String)request.getSession().getAttribute("UserName");
    		String apptype=(String)request.getSession().getAttribute("appType");
    		WeChatUser user = weChatService.findWeChatUser(openId,apptype);
    		if (user != null) {
    			user.setZhiyangUserName(null);
    			weChatService.save(user);	
    		}
    		request.getSession().removeAttribute("ZhiyangUserName");
    	}
    	Subject subject = SecurityUtils.getSubject();
    	if (subject.isAuthenticated()) {
    		subject.logout(); // session 会销毁，在SessionListener监听session销毁，清理权限缓存
    	}
    	
    	apptype=appTypel;
    	openid=openId1;
    	return new ModelAndView("webApp/logout"); 
    }
    
    
    /**
     * 消息详情页
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/webApp/news/msgDetail")
    public String webApp_msgDetail(HttpServletRequest request, Model model) {
    	Long id = Long.valueOf(request.getParameter("id"));
        News news = newsService.findOne(id);
        model.addAttribute("news", news);
        newsService.markRead(id);
        return "webApp/news/msgDetail";
    }
    
    @RequestMapping("/webApp/news/newDetail")
    public String webApp_newsDetail(HttpServletRequest request, Model model) {
    	Long id = Long.valueOf(request.getParameter("id"));
        News news = newsService.findOne(id);
        model.addAttribute("news", news);
        newsService.markRead(id);
        return "webApp/news/newsDetail";
    }
    /**
     * 通讯录
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/webApp/tongxunlu")
    public String webApp_userTongxunlu(HttpServletRequest request, Model model) {
        return "webApp/tongxunlu";
    } 
    /**
     * 通讯录详情
     * @param request
     * @param model
     * @return
     * @throws UnsupportedEncodingException 
     */
    @RequestMapping("/webApp/tongxunluDetail")
    public ModelAndView webApp_userTongxunluDetail(HttpServletRequest request, Model model) {
    	model.addAttribute("tusername", request.getParameter("tusername"));
    	model.addAttribute("tdept", request.getParameter("tdept"));
    	model.addAttribute("tposition", request.getParameter("tposition"));
    	model.addAttribute("tmobile", request.getParameter("tmobile"));
    	model.addAttribute("tphone", request.getParameter("tphone"));
    	model.addAttribute("temail", request.getParameter("temail"));
        return new ModelAndView("webApp/tongxunluDetail");
    } 
    /**
     * 安全认证
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/webApp/user/accountSecurityCertify")
    public ModelAndView webApp_useraccountSecurityCertify(HttpServletRequest request, Model model) {
    	
    	String username = (String) request.getSession().getAttribute("ZhiyangUserName");
    	ReturnS result = hrofirstUserService.getDetailLoginInfo(username);
    	HROFirstUserInfo userInfo = (HROFirstUserInfo)result.getResult();   
    	String mobile = userInfo.getMobile();
    	model.addAttribute("handleMobile", mobile.replace(mobile.substring(3,8), "xxxx"));
    	model.addAttribute("mobile", mobile);
    	
    	String checkCode = (String) request.getSession().getAttribute("activeCode");
    	String inputCode = request.getParameter("messagecode");
    	
    	if (mobile == null || checkCode == null || inputCode == null || !checkCode.equals(inputCode)){
    		return new ModelAndView("/webApp/user/accountSecurityCertify");
    	}
    	else{
    		return new ModelAndView("redirect:/webApp/user/accountSecurityCertify2");
    	}
    } 
    
    /**
     * 安全认证2
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/webApp/user/accountSecurityCertify2")
    public ModelAndView webApp_useraccountSecurityCertify2(HttpServletRequest request, Model model) {
    	String username = (String) request.getSession().getAttribute("ZhiyangUserName");
    	ReturnS result = hrofirstUserService.getDetailLoginInfo(username);
    	HROFirstUserInfo userInfo = (HROFirstUserInfo)result.getResult();   
    	String cardId = userInfo.getCardID();
    	String passportCode = request.getParameter("passportCode");
    	if (passportCode != null && !passportCode.equals("") &&passportCode.equals(cardId)){
    		return new ModelAndView("redirect:/webApp/user/update_password");
    	}
    	
        return new ModelAndView("webApp/user/accountSecurityCertify2");
    }   
    
    /**
     * 安全认证---修改邮箱  发送手机验证码
     */
    @RequestMapping("/webApp/user/emailSecurityCertify")
    public ModelAndView webApp_userEmailSecurityCertify(HttpServletRequest request, Model model) {
    	
    	String username = (String) request.getSession().getAttribute("ZhiyangUserName");
    	ReturnS result = hrofirstUserService.getDetailLoginInfo(username);
    	HROFirstUserInfo userInfo = (HROFirstUserInfo)result.getResult();   
    	String mobile = userInfo.getMobile();
    	model.addAttribute("handleMobile", mobile.replace(mobile.substring(3,8), "xxxx"));
    	model.addAttribute("mobile", mobile);
    	String checkCode = (String) request.getSession().getAttribute("activeCode");
    	String inputCode = request.getParameter("messagecode");
    	
    	if (mobile == null || checkCode == null || inputCode == null || !checkCode.equals(inputCode)){
    		return new ModelAndView("/webApp/user/emailSecurityCertify");
    	}
    	else{
    		
    		return new ModelAndView("redirect:/webApp/user/mailbox");
    	}
    } 
    
    /**
     * 个人邮箱
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/webApp/user/mailbox")
    public ModelAndView webApp_userMailbox(HttpServletRequest request, Model model) {
    	String username = (String) request.getSession().getAttribute("ZhiyangUserName");
    	ReturnS result = hrofirstUserService.getDetailLoginInfo(username);
    	HROFirstUserInfo userInfo = (HROFirstUserInfo)result.getResult();   
    	
    	String email = userInfo.getEmail();
    	
    	model.addAttribute("email", email);
    	
    	String newEmail = request.getParameter("email");
    	System.out.println(ValidatorBasic.isEmail(newEmail));
    	if (newEmail != null && !newEmail.equals("")&&ValidatorBasic.isEmail(newEmail) ){
    		//修改邮箱
    		hrofirstUserService.updateEmailInfo(username, newEmail);
    		return new ModelAndView("redirect:/webApp/user/");
    	}
    	
        return new ModelAndView("/webApp/user/mailbox");
    }    
    
    /**
     * 用户修改支付密码(用户已设置过支付密码  跳转到修改支付密码页面,需输入原始密码)
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/webApp/user/update_payment_password")
    public String webApp_userPayPass_update(HttpServletRequest request, Model model) {
        return "webApp/user/update_payment_password";
    }
    
    /**
     * 用户设置支付密码(用户未设置过支付密码  跳转到设置支付密码页面)
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/webApp/user/payment_password")
    public String webApp_userPayPass(HttpServletRequest request, Model model) {
        return "webApp/user/payment_password";
    }
    /**
     * 所在城市
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/webApp/user/city")
    public ModelAndView webApp_userCity(HttpServletRequest request, Model model) {
    	String username = (String) request.getSession().getAttribute("ZhiyangUserName");
    	String city="上海";//此城市后期要根据登录用户的详细信息获取的
    	//String ccity=request.getParameter("ccity");
    	if(city!=null&&!city.equals("")){
    		//修改城市，接口有问题，暂时注掉
    		//hrofirstUserService.updateCityInfo(username, ccity);
    		model.addAttribute("city",city);
    	}
        return new ModelAndView("webApp/user/city");
    }
    
    /**
     * 安全认证---修改手机号码 发送手机验证码
     */
    @RequestMapping("/webApp/user/mobileSecurityCertify")
    public ModelAndView webApp_userMobileSecurityCertify(HttpServletRequest request, Model model) {
    	
    	String username = (String) request.getSession().getAttribute("ZhiyangUserName");
    	ReturnS result = hrofirstUserService.getDetailLoginInfo(username);
    	HROFirstUserInfo userInfo = (HROFirstUserInfo)result.getResult();   
    	String mobile = userInfo.getMobile();
    	
    	model.addAttribute("mobile", mobile);
    	model.addAttribute("handleMobile", mobile.replace(mobile.substring(3,8), "xxxx"));
    	String checkCode = (String) request.getSession().getAttribute("activeCode");
    	String inputCode = request.getParameter("messagecode");
    	
    	if (checkCode == null || inputCode == null || !checkCode.equals(inputCode)){
    		return new ModelAndView("/webApp/user/mobileSecurityCertify");
    	}
    	else{
    		//跳转到修改手机号码页面
    		return new ModelAndView("redirect:/webApp/user/phone_number");
    	}
    } 
    /**
     * 用户手机号
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/webApp/user/phone_number")
    public ModelAndView webApp_userPhoneNum(HttpServletRequest request, Model model) {

    	String username = (String) request.getSession().getAttribute("ZhiyangUserName");
    	ReturnS result = hrofirstUserService.getDetailLoginInfo(username);
    	HROFirstUserInfo userInfo = (HROFirstUserInfo)result.getResult();   
    	String mobile = userInfo.getMobile();
    	model.addAttribute("mobile", mobile);
    	String checkCode = (String) request.getSession().getAttribute("activeCode");
    	String inputCode = request.getParameter("messagecode");
    	String inputMobile = request.getParameter("mobile");
    	
    	if (inputMobile == null || checkCode == null || inputCode == null || !checkCode.equals(inputCode)){
    		return new ModelAndView("/webApp/user/phone_number");
    	}else{
    		//修改手机号码
    		hrofirstUserService.updateMobileInfo(username, inputMobile);
    		 return new ModelAndView("redirect:/webApp/user");
    	}
    	
       
    }

    
    
    /**
     * 用户安全校验
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/webApp/user/securityCheck")
    public String webApp_usersecCheck(HttpServletRequest request, Model model) {
        return "webApp/user/securityCheck";
    }
    
    /**
     * 忘记密码，找回密码
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/webApp/user/find_password")
    public String webApp_userUpPass(HttpServletRequest request, Model model) {
    	
        return "webApp/user/find_password";
    }
    
    /**
     * 用户修改密码
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/webApp/user/update_password")
    public ModelAndView  webApp_userUserPass(HttpServletRequest request) {
    	String username = (String) request.getSession().getAttribute("ZhiyangUserName");
    	String userPassword=(String)request.getSession().getAttribute("ZhiyangPassword");
    	String inputOldPassword = request.getParameter("old_password");
    	String inputPassword = request.getParameter("new_password");
    	String inputPassword2 = request.getParameter("a_new_password");
    	if (inputPassword == null || inputPassword2 == null || inputPassword.equals("") || inputPassword2.equals("")||!inputOldPassword.endsWith(userPassword)){
    		
    		 return new ModelAndView("webApp/user/update_password");
    	}else{
    		//执行修改密码
    		//BCryptPasswordEncoder bcr=new BCryptPasswordEncoder();
    		hrofirstUserService.updatePasswordInfo(username, inputPassword);
    		return new ModelAndView("redirect:/webApp/logout");
    	}
    	
    }
    
    
    @RequestMapping("/webApp/empCheck")
    public ModelAndView empCheck(HttpServletRequest request, Model model) {
    	String cardId = request.getParameter("cardId");
    	
    	if (cardId == null)
    		cardId = "xxx";

    	if ( request.getSession().getAttribute("IdCard") != null){
    		cardId = (String) request.getSession().getAttribute("IdCard"); 
    	}
    	
    	if (cardId.equals("")){
    		String name = (String) request.getSession().getAttribute("ZhiyangUserName");
    		ReturnS rets = hrofirstUserService.getDetailLoginInfo(name);
    		HROFirstUserInfo info = (HROFirstUserInfo) rets.getResult();
    		cardId = info.getCardID();
    	}
    	
        model.addAttribute("cardId", cardId);

        return new ModelAndView("webApp/empCheck");
    }	
    
    
    
    
    @RequestMapping("/aboutUs")
    public String aboutUs() {
        return "/about";
    }

    @RequestMapping("/selectCity")
    public String selectCity(Model model) {
        List<Province> provinces = provinceService.findByTypeNot(ProvinceService.ProvinceType.其他国家);
        model.addAttribute("provinces", provinces);
        model.addAttribute("cities", cityService.findByProvince(provinces.get(0).getId()));

        return "/selectCity";
    }

    @RequestMapping("/policy")
    public String policy(@RequestParam long city, Model model) {
        List<Policy> policy = policyService.findByCity(city);
        if (policy != null && !policy.isEmpty()) {
            model.addAttribute("url", policy.get(0).getUrl());
        }
        
        return "/policy";
    }
    


    /**
     * url:/service/ewage.e?login="???"
     * 姓名:001
     * 薪资年月：002
     * 基本工资：003
     * 应发合计：004
     * 保险个人缴纳合计：005
     * 保险单位合计：006
     * 个税所得税：007
     * 实发工资：008
     * <p/>
     * errorMessage:"异常信息" ，success:"true/false"，"001":"8999",….
     * *
     */
    @RequestMapping("/salary")
    public String salary(@RequestParam String cardId, @RequestParam String month, Model model) {
        model.addAttribute("cardId", cardId);
        model.addAttribute("month", month);
        return "/salary";
    }

    /**
     * 新闻
     * @param receiver
     * @param model
     * @return
     */
    @RequestMapping("/news")
    public String news(
            @RequestParam String receiver, Model model) {
        Page<News> personal =
                newsService.findByReceiverAndType(receiver, News.NewsType.PERSONAL, 0, INDEX_NEWS_SIZE);
        long unReadPersonal = newsService.countUnRead(receiver, News.NewsType.PERSONAL);
        Page<News> publicNews =
                newsService.findByReceiverAndType(receiver, News.NewsType.PUBLIC, 0, INDEX_NEWS_SIZE);
        long unReadPublic = newsService.countUnRead(receiver, News.NewsType.PUBLIC);
        Page<News> thirdNews =
                newsService.findByReceiverAndType(receiver, News.NewsType.THIRD, 0, INDEX_NEWS_SIZE);
        long unReadThird = newsService.countUnRead(receiver, News.NewsType.THIRD);
        model.addAttribute("personal", personal);
        model.addAttribute("public", publicNews);
        model.addAttribute("third", thirdNews);
        model.addAttribute("unReadThird", unReadThird);
        model.addAttribute("unReadPersonal", unReadPersonal);
        model.addAttribute("unReadPublic", unReadPublic);

        return "/news/news";
    }

    /**
     * 根据新闻类型查询
     * @param receiver
     * @param type
     * @param page
     * @param size
     * @param model
     * @return
     */
    @RequestMapping("/news/types")
    public String news(
            @RequestParam String receiver,
            @RequestParam News.NewsType type,
            @RequestParam(defaultValue = "0", required = false) int page,
            @RequestParam(defaultValue = "10", required = false) int size,
            Model model) {
        model.addAttribute("unRead", newsService.countUnRead(receiver, type));
        Page<News> news =
                newsService.findByReceiverAndType(receiver, type, page, size);
        model.addAttribute("page", news);
        return "/news/type";
    }
    
    /**
     * 新闻详情页
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/news/{id}")
    public String news(
            @PathVariable Long id, Model model) {
        News news = newsService.findOne(id);
        model.addAttribute("news", news);
        newsService.markRead(id);
        return "/news/detail";
    }

    @RequestMapping(value={"/"})
    public ModelAndView index() {
    	
    	return new ModelAndView("redirect:/webApp/index");
    }

    @RequestMapping(value = {"/apps"})
    public String apps(Model model) {
        model.addAttribute("ios_download_path", Config.getIosDownloadPath());
        return "/apps";
    }
    @RequestMapping(value = {"/baidu"})
    public String baidu() {
        return "/baidu";
    }
    
    @Autowired
    private apiDataJMSSender apiDataJMSSender;
    
    /**
     * activeMQ发送消息
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = {"/jmssender/{id}"})
    public String jmssender(@PathVariable String id, Model model) {
    	
    	apiDataJMSSender.testDatacenterSend(id);  
        return "";
    }
    
    /**
     * activeMQ接收消息
     * @param response
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = {"/jmsreceiver/{id}"})
    public String jmsreceiver(HttpServletResponse response, @PathVariable String id, Model model) {
    	
        try {  
            OutputStream os = response.getOutputStream();  
            os.write(apiDataJMSSender.getData(id).getBytes("UTF-8"));  
            os.flush();  
            os.close();  
        } catch (Exception e) {  
            e.printStackTrace();  
        }

        return null;
    }    
    
    @RequestMapping("/zhongqiu/index")
    public ModelAndView zhongqiu_index(HttpServletRequest request, HttpServletResponse response, Model model) {
    	return new ModelAndView("zhongqiu/index");
    }
    
    @RequestMapping("/zhongqiu/detail")
    public ModelAndView zhongqiu_detail(HttpServletRequest request, HttpServletResponse response, Model model) {
    	
    	String type = "1";
    	
    	if (request.getParameter("type")!=null)
    		type = request.getParameter("type");
    	
    	model.addAttribute("type", type);
    	
    	return new ModelAndView("zhongqiu/detail");
    }      
    
    /**
     * 安心社保
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping("/anxinshebao/index")
    public ModelAndView anxinshebao_index(HttpServletRequest request, HttpServletResponse response, Model model) {
    	return new ModelAndView("shebao-m/index");
    }
    
    @RequestMapping("/anxinshebao/form")
    public ModelAndView anxinshebao_detail(HttpServletRequest request, HttpServletResponse response, Model model) {
    	
    	return new ModelAndView("shebao-m/form");
    } 
    /**
     * 社保意向单提交（修改后的）
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping("/anxinshebao/formUpdate")
    public ModelAndView anxinshebaoupdate_detail(HttpServletRequest request, HttpServletResponse response, Model model) {
    	
    	return new ModelAndView("shebao-m/formUpdate");
    }   
    @RequestMapping("/html/index")
    public ModelAndView html_index(HttpServletRequest request, HttpServletResponse response, Model model) {
    	return new ModelAndView("html/index");
    }
    /**
     * 31会议页面
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping("/1018/t2")
    public ModelAndView t2_index(HttpServletRequest request, HttpServletResponse response, Model model) {
    	return new ModelAndView("1018/t2");
    }
}
