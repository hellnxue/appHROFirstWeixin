package com.service.provider;

import java.util.List;

import com.service.provider.entity.ReturnS;


public interface HROFirstUserService {
	
	//用户中心 登录 验证  平台帐号 密码
	Integer isPsuser(String login,String password);
	
	//用户中心 登录 验证  平台帐号 密码
	Integer isPsuserByType(String login, String password, String usertype);
	
	//用户中心 注册帐号
	ReturnS registerHro(String login,String password,String mobile,String email);
	
	/**
	 * 绑定第三方账号
	 * <pre>
	 * @author steven.chen
	 * @date 2015年6月16日 下午7:05:45 
	 * </pre>
	 *
	 * @param otherPassPortId
	 * @param channel
	 * @param login
	 * @param password
	 * @param mobile
	 * @param email
	 * @return
	 */
	Integer registerOther(Long otherPassPortId,String channel,String login,
			String password,String mobile,String email);
	
	//获得 hro 平台帐号
	String getOtherLogin(String ucLogin,Integer channel);
	
	//hro 平台同步账户
	ReturnS mHroLogin(String login,String password,String mobile,String email);
	
	//获取 账户基本信息
	ReturnS getLoginInfo(String login,Integer channel);
	
	ReturnS getLoginInfo(Long id);
	
	/**
	 * 获取待激活用户信息
	 * @param mobile，雇员手机号
	 * @return
	 */
	ReturnS isToBeActiveAccountInfo(String mobile);
	
	ReturnS activeAccountFromOther(String mobile, String loginName, String password);
	
	/**
	 * 获取hrofirst账户详细信息，详细信息包括，姓名、身份证号，电邮、手机、所属企业名称、所属企业ID
	 * @param login，登录名
	 * @return
	 */
	ReturnS getDetailLoginInfo(String login);
	
	ReturnS updateMobileInfo(String login, String mobile);
	ReturnS updatePasswordInfo(String login, String password);
	ReturnS updateEmailInfo(String login, String email);
	ReturnS updateCityInfo(String login, String city);
	
	ReturnS insertOtherLoginPatchInfo(List<Object> data);
	
}
