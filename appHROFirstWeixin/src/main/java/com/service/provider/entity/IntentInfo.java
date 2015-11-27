package com.service.provider.entity;

import java.util.Date;

/**
 * 投保预约
 *
 * @version $Id: IntentEntity.java, 
 * v 0.1 2015年7月23日 下午3:59:08 
 * <pre>
 * @author steven.chen
 * @date 2015年7月23日 下午3:59:08 
 * </pre>
 */
public class IntentInfo implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6183243639717425741L;
	
	/** 联系人名称  必填*/
	private String  name;
	/** 手机号码  必填*/
	private String mobile;
	/** 服务人数 必填*/
    private Long serviceNum;   
	/** 服务区域  必填*/
    private String serviceArea;
	/** 服务类别  需求单选填*/
    private String serviceType;  
	/** 选择基数*/
    private String base;
	/** 缴纳方式*/
    private String payment;
	/** 产品ID 意向单必填*/   
	private String prodId;  
	/** 产品Code 必填*/
	private String prodCode;  
	/** 产品名称  意向单必填*/
	private String prodName;  
	/** 接收商户ID */
	private Long storeId;   
	/** 来源渠道 */
	private String channel;   
	
	//注册信息
	/** 用户名 */
	private String loginName;
	/** 密码 */
	private String password;
	/** 企业名称 */
	private String orgName;  
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public Long getServiceNum() {
		return serviceNum;
	}
	public void setServiceNum(Long serviceNum) {
		this.serviceNum = serviceNum;
	}
	public String getServiceArea() {
		return serviceArea;
	}
	public void setServiceArea(String serviceArea) {
		this.serviceArea = serviceArea;
	}
	public String getServiceType() {
		return serviceType;
	}
	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}
	public String getBase() {
		return base;
	}
	public void setBase(String base) {
		this.base = base;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getProdId() {
		return prodId;
	}
	public void setProdId(String prodId) {
		this.prodId = prodId;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public Long getStoreId() {
		return storeId;
	}
	public void setStoreId(Long storeId) {
		this.storeId = storeId;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getChannel() {
		return channel;
	}
	public void setChannel(String channel) {
		this.channel = channel;
	}
	public String getProdCode() {
		return prodCode;
	}
	public void setProdCode(String prodCode) {
		this.prodCode = prodCode;
	}
	
	

}
