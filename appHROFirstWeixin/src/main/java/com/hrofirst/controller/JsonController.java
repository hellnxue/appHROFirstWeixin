package com.hrofirst.controller;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.hrofirst.common.ZimuSort;
import com.hrofirst.entity.City;
import com.hrofirst.entity.Province;
import com.hrofirst.entity.Salary;
import com.hrofirst.service.CityService;
import com.hrofirst.service.ProvinceService;
import com.hrofirst.service.SalaryService;
import com.hrofirst.util.Config;


import com.hrofirst.util.MobileValidHelp;
import com.hrofirst.util.ValidatorBasic;
import com.hrofirst.util.mail.MailFactory;
import com.hrofirst.util.mail.SimpleMail;
import com.service.provider.HROFirstUserService;
import com.service.provider.IntentMgtService;
import com.service.provider.QuQuIntentService;
import com.service.provider.entity.HROFirstUserInfo;
import com.service.provider.entity.IntentInfo;
import com.service.provider.entity.ReturnS;

import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.DependsOn;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by qixb.fnst on 2015/02/11.
 */
@RestController
@DependsOn("config")
public class JsonController {
	
	HttpClient client = HttpClientBuilder.create().build();
	
	@Autowired
	private HROFirstUserService hrofirstUserService;
	
	@Autowired
	private QuQuIntentService quQuIntentService;
	
    @Autowired
    private ProvinceService provinceService;
    @Autowired
    private CityService cityService;
    @Autowired
    private SalaryService salaryService;
    @Autowired(required=false)
	private IntentMgtService intentMgtService;
    @RequestMapping("province")
    public List<Province> findAllProvince() {
        return provinceService.findByTypeNot(ProvinceService.ProvinceType.其他国家);
    }

    @RequestMapping("province/{pid}/city")
    public List<City> findAllCity(@PathVariable long pid) {
        return cityService.findByProvince(pid);
    }

    
	/**
	 * 模拟浏览器post提交
	 * 
	 * @param url
	 * @return
	 */
	public static HttpPost getPostMethod(String url) {
		HttpPost pmethod = new HttpPost(url); // 设置响应头信�?
//		pmethod.addHeader("Connection", "keep-alive");
//		pmethod.addHeader("Accept", "*/*");
//		pmethod.addHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
//		pmethod.addHeader("X-Requested-With", "XMLHttpRequest");
//		pmethod.addHeader("Cache-Control", "max-age=0");
//		pmethod.addHeader("User-Agent",
//				"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0) ");
		return pmethod;
	}
	
 
    
    /**
     * 根据用户名查询其所在的企业名称  接口，返回json
     */
    @RequestMapping("hrhelper-platform/orgName")
    public String orgName(HttpServletRequest request, @RequestParam String userName) {
    	String result="{\"errorMessage\":\"该用户不存在！\",\"userName\":\""+userName+"\"}";
    	HttpPost httpost = new HttpPost(Config.getDatacenterUrl()+"tokenget.e?username=weixin&secret=123456&type=weixin1&user_name="+userName);
        try {
    		HttpResponse response = client.execute(httpost);
    		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
//        	String jsonStr ={"tables":[{"tablename":"ORG_NAME", "records":[{"USER_ID":"780278","USER_NAME":"songjing","ORG_CHINESE_NAME":"鏄婂熀浜哄姏璧勬簮鏈嶅姟锛堜笂娴凤級鏈夐檺鍏徃",},]},]}
	    	JSONObject object0 = JSON.parseObject(jsonStr);
	    	com.alibaba.fastjson.JSONArray list0 = JSON.parseArray(object0.getString("tables"));
	    	String records = ((JSONObject)list0.get(0)).getString("records");
	   		com.alibaba.fastjson.JSONArray list = JSON.parseArray(records);
	   		if(list!=null&&list.size()>0){
	   			result=list.get(0).toString();
	   		}
	    	System.out.println("result="+result);
	   		return result;
    		
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }   
        return result;
    }
    /**
     * 调用通讯录接口，返回json
     */
    @RequestMapping("hrhelper-platform/contantList")
    public String contantList(HttpServletRequest request, @RequestParam String orgId) {
    	String result="{\"errorMessage\":\"该用户不存在！\",\"orgId\":\""+orgId+"\"}";
    	HttpPost httpost = new HttpPost(Config.getDatacenterUrl()+"tokenget.e?username=weixin&secret=123456&type=weixin2&org_id="+orgId);
        try {
    		HttpResponse response = client.execute(httpost);
    		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
//        	String jsonStr ={"tables":[{"tablename":"ORG_NAME", "records":[{"USER_ID":"780278","USER_NAME":"songjing","ORG_CHINESE_NAME":"鏄婂熀浜哄姏璧勬簮鏈嶅姟锛堜笂娴凤級鏈夐檺鍏徃",},]},]}
	    	JSONObject object0 = JSON.parseObject(jsonStr);
	    	com.alibaba.fastjson.JSONArray list0 = JSON.parseArray(object0.getString("tables"));
	    	String records = ((JSONObject)list0.get(0)).getString("records");
	   		com.alibaba.fastjson.JSONArray list = JSON.parseArray(records);
	   		ZimuSort zimuSort = new ZimuSort();  
	   	    ArrayList<HashMap> tempList=new ArrayList<HashMap>();
	   		for(int i=0; i<list.size(); i++){
	   			JSONObject detail = (JSONObject)list.get(i);
	   			//各个值放入map
	   		    HashMap tempMap=new HashMap();
	   		    tempMap.put("DEPT_ID", detail.getString("DEPT_ID"));
		   		tempMap.put("CNAME", detail.getString("CNAME"));
		   		tempMap.put("USER_ID", detail.getString("USER_ID"));
		   		tempMap.put("USER_NAME", detail.getString("USER_NAME"));
		   		tempMap.put("DEPT_NAME", detail.getString("DEPT_NAME"));
		   		tempMap.put("mobile", detail.getString("mobile"));
		   		tempMap.put("email", detail.getString("email"));
		   		tempList.add(tempMap);
	   		}
	   		String resultStr = zimuSort.sort(tempList);
	   		Object todaySum1 = JSON.parse(resultStr);
	   		//System.out.println("tempList="+tempList);
	   		//System.out.println("todaySum1="+todaySum1);
	   		result=todaySum1.toString();
	   		return result;
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }   
        return result;
    }
    

    
    /**
     * 移动签到
     * @param request
     * @param addressStr
     * @return
     */
    @RequestMapping("hrhelper-platform/empCheck")
    public String empCheck(HttpServletRequest request, @RequestParam String aType, @RequestParam String aForget, @RequestParam String idCard) {
 
		String username = (String) request.getSession().getAttribute("ZhiyangUserName");   
		String password = (String) request.getSession().getAttribute("ZhiyangPassword");   
		if (username.equals("1admin"))
			password = "hrofirst2015";
		
		String longitude = request.getParameter("longitude");
		String latitude = request.getParameter("latitude");
		String address = request.getParameter("address");
		
    	System.out.println(longitude+"|"+latitude+"|"+address);
//    	
//    	return "{\"code\":\"0\", \"message\":\"success\"}";
		
    	HttpPost httpost = getPostMethod("http://221.226.56.210:28380/backend/attendance/ajax/create.e?idCard="+idCard+"&aForget="+aForget+"&aType="+aType);
    	httpost.addHeader("Accept", "application/json");
    	
        try {
    		HttpResponse response = client.execute(httpost);
    		String result = EntityUtils.toString(response.getEntity(), "utf-8");
            return result;
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }    
        
        return "{\"message\":\"success\"}";
    }  
    /**
     *  根据手机号码判断账户是否被激活
     * @param mobile
     * @return
     */
    @RequestMapping("hrhelper-platform/isToBeActiveAccountInfo")
    public String isToBeActiveAccountInfo(String mobile){
    	//如果不包含该手机号对应的雇员，返回错误
		ReturnS result = hrofirstUserService.isToBeActiveAccountInfo(mobile);
    	if (result.getSuccess() == false){
			return "{\"message\":\"false\""+"\"code\":\""+result.getMsg()+"\"}";
		}
    	return "{\"message\":\"true\"}";
    }
    
    /**
     * 发送手机验证码
     * @param request
     * @param mobile
     * @param functionCode
     * @return
     */
    private String sendMess(HttpServletRequest request, String mobile, String functionCode){
    	if(StringUtils.isNotBlank(mobile)){
			if(ValidatorBasic.isMobile(mobile)){
				//激活账号时做是否已经激活的判断
				if(functionCode.equals("personregister")){
					//如果不包含该手机号对应的雇员，返回错误
					ReturnS result = hrofirstUserService.isToBeActiveAccountInfo(mobile);
					if (result.getSuccess() == false){
						return "{\"code\":\""+result.getMsg()+"\"}";
					}
				}
		    	String VALID_CODE_VALUE_RANGE = "0123456789";
		    	// 获取随机验证码
				Random random = new Random();
				StringBuffer sb = new StringBuffer();
				for (int i = 0; i < 6; i++) {
					int number = random.nextInt(VALID_CODE_VALUE_RANGE.length());
					sb.append(VALID_CODE_VALUE_RANGE.charAt(number));
				}
				
				String randomCode = sb.toString();
				String content = "验证码为【" + randomCode
						+ "】,感谢您使用智阳网络平台邮箱绑定服务，若非本人操作，请忽略此条信息。";
				
				
				if( MobileValidHelp.sendMsg(mobile, content)){
					request.getSession().setAttribute("activeCode", randomCode);
		        	request.getSession().setAttribute("activeMobile", mobile);

					return "true";				
				}else{
					return "{\"code\":\"验证码发送失败\"}";
				}
			}else{
				return "{\"code\":\"手机号码格式不正确\"}";
			}
		}else{
			return  "{\"code\":\"手机号码为空\"}";
		}    	
    }
   
    /**
     * 雇员激活发送验证码接口，返回json
     * @return
     */
    @RequestMapping("hrhelper-platform/anon/sendMessage")
    @ResponseBody
    public String sendMessage(HttpServletRequest request, @RequestParam String mobile, @RequestParam String functionCode) {
    	
    	return sendMess(request, mobile, functionCode);
    }
    
    /**
     * 安全验证送验证码接口，返回json
     * @return
     */
    @RequestMapping("hrhelper-platform/anon/sendCertifyMessage")
    @ResponseBody
    public String sendCertifyMessage(HttpServletRequest request) {
    	String username = (String) request.getSession().getAttribute("ZhiyangUserName");   
    	ReturnS result = hrofirstUserService.getDetailLoginInfo(username);
    	HROFirstUserInfo userInfo = (HROFirstUserInfo)result.getResult();   
    	String mobile = userInfo.getMobile();
    	
    	return sendMess(request, mobile, "certify");
    }
    
    /**
     * 修改手机号码发送验证码接口，返回json
     * @return
     */
    @RequestMapping("hrhelper-platform/anon/sendMobileMessage")
    @ResponseBody
    public String sendMobile(HttpServletRequest request, @RequestParam String mobile, @RequestParam String functionCode) {
    	
    	return sendMess(request, mobile, functionCode);
    }
    
    @RequestMapping("hrhelper-platform/anon/checkCode")
    public String checkCode(HttpServletRequest request, @RequestParam String code) {
    	
    	String sessionCode = (String) request.getSession().getAttribute("activeCode");
    	if (sessionCode.equals(code)){
    		return "true";
    	}else{
    		return "false";
    	}
    }
    
    @RequestMapping("hrhelper-platform/zhongqiuDemand")
    public String zhongqiuDemand(HttpServletRequest request, @RequestParam String type, @RequestParam String name, @RequestParam String mobile) {
    	
    	String inname = name;
		try {
			inname = URLDecoder.decode(name, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 

    	ReturnS ret = quQuIntentService.addIntent("{\"mobile\":\""+mobile+"\",\"name\":\"zhiyang|"+inname+"\",\"storeId\":1}");
    	
    	if (ret.getSuccess())
    		return "{\"staus\":\"true\",\"message\":\"您的预购单已提交成功，感谢您预购本次中秋礼品，我们客服人员将于2个工作日内与您取得联系，谢谢！ \"}";
    	else
    		return "{\"staus\":\"false\",\"message\":\"订单提交失败！ \"}";
    }
    
    /**
     * 安心社保
     * @param request
     * @param type
     * @param name
     * @param mobile
     * @return
     */
    @RequestMapping("hrhelper-platform/anxinshebaoDemand")
    public String anxinshebaoDemand(HttpServletRequest request, @RequestParam String name, @RequestParam String mobile) {
    	
    	String inname = name;
		try {
			inname = URLDecoder.decode(name, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} 

		System.out.println("inname===="+inname);
    	ReturnS ret = quQuIntentService.addIntent("{\"mobile\":\""+mobile+"\",\"name\":\"zhiyang|"+inname+"\",\"storeId\":1}");
    	
    	if (ret.getSuccess())
    		return "{\"staus\":\"true\",\"message\":\"小安收到您的意向单啦，请保持手机畅通哦，小安正在马力全开，2个工作日内一定会与您联系，请耐心等待哦！\"}";
    	else
    		return "{\"staus\":\"false\",\"message\":\"订单提交失败！ \"}";
    }
    
    /**
     * 安心社保(修改后的)
     * @param request
     * @param type
     * @param name
     * @param mobile
     * @return
     */
    @RequestMapping("hrhelper-platform/anxinshebaoDemandUpdate")
    public String anxinshebaoDemandUpdate(@RequestBody  IntentInfo intentInfo) {
    	
    	intentInfo.setChannel("第一人力微信");     //来源渠道
		ReturnS ret = intentMgtService.addSocialSecurity(intentInfo);
		
    	if (ret.getSuccess())
    		return "{\"staus\":\"true\",\"message\":\"小安收到您的意向单啦，请保持手机畅通哦，小安正在马力全开，2个工作日内一定会与您联系，请耐心等待哦！\"}";
    	else
    		return "{\"staus\":\"false\",\"message\":\""+ret.getMsg()+"！ \"}";
    }
    
    @RequestMapping("/service/ewage.e")
    public BaseResponse<Salary> salary(
            @RequestParam String cardId, @RequestParam String month) {
        BaseResponse<Salary> response = new BaseResponse<Salary>();
        Salary salary = salaryService.findSalaryByIdCardAndMonth(cardId, month);
        if (salary == null) {
            response.setErrorMessage("不存在该账户或无数据");
        }
        response.setData(salary);
        return response;

    }

    public static class BaseResponse<T> {
        private T data;
        private String errorMessage;

        public T getData() {
            return data;
        }

        public void setData(T t) {
            this.data = t;
        }

        public String getErrorMessage() {
            return errorMessage;
        }

        public void setErrorMessage(String errorMessage) {
            this.errorMessage = errorMessage;
        }
    }



    private static final int BUFFER_SIZE = 1024 * 1024;

    public static String inputStreamTOString(InputStream in, String encoding) throws Exception {

        ByteArrayOutputStream outStream = new ByteArrayOutputStream();
        byte[] data = new byte[BUFFER_SIZE];
        int count = -1;
        while ((count = in.read(data, 0, BUFFER_SIZE)) != -1)
            outStream.write(data, 0, count);

        data = null;
        String temp = new String(outStream.toByteArray(), encoding);
        outStream.close();
        return temp;
    }
}
