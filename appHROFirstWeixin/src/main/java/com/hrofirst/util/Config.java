package com.hrofirst.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * Created by qixb.fnst on 2014/10/24.
 */
@Component
public class Config {

    private static  int forbidSign;
    private static String uploadDir;


    private static String openOfficeInstall;


    private static int threadSize;

    private static String pdf2htmlEXInstall;

    private static long fileMaxSize;

    private static String ak;

    private static String baeApiKey;

    private static String baeSecretKey;

    private static String iosDownloadPath;

    private static String iosPushPath;

    private static boolean debug;

    private static String uploadRoot;

    private static Double allowRadius;
    private static boolean checkGps;

    private static int scheduleAllow;

    private static int scheduleUpdateAllow;

    private static int notLateSignIn;

    private static int notEarlySignOut;

    private static String apiSuffix;

    private static String messageTitle;

    private static int baiduPushType;

    private static int iosDeployStatus;
    private static String iosPushPassword;
    private static int iosExpireMinute;
    private static String iosPushSound;
    private static String wechatToken;
    private static String wechatSubscribe;

    private static String wechatMenuDesc;

    private static String wechatMenuKey;

    private static String wechatBackKey;

    private static String wechatErrorMenu;

    private static String wechatErrorInput;

    private static String datacenterUrl;    
    private static String casservice;    

    private static String cascookiedomain;   

    private static String wallet_url;   
    
    private static String hrofirstappid;  
    
    private static String hrofirstappsecret;

	private static String appType;  
    
    private static String appName;


    public static boolean isCheckGps() {
        return checkGps;
    }

    public static String getIosPushPassword() {
        return iosPushPassword;
    }

    public static String getIosPushSound() {
        return iosPushSound;
    }
    @Value("${ios_push_sound}")
    public  void setIosPushSound(String iosPushSound) {
        Config.iosPushSound = iosPushSound;
    }

    @Value("${ios_push_password}")
    public void setIosPushPassword(String iosPushPassword) {
        Config.iosPushPassword = iosPushPassword;
    }

    @Value("${checkGps}")
    public void setCheckGps(boolean checkGps){
        Config.checkGps=checkGps;
    }

    @Value("${uploadDir}")
    public void setUploadDir(String uploadDir) {
        Config.uploadDir = uploadDir;
    }

    @Value("${openOfficeInstall}")
    public void setOpenOfficeInstall(String openOfficeInstall) {
        Config.openOfficeInstall = openOfficeInstall;
    }

    @Value("${threadSize}")
    public void setThreadSize(int threadSize) {
        Config.threadSize = threadSize;
    }

    @Value("${pdf2htmlEXInstall}")
    public void setPdf2htmlEXInstall(String pdf2htmlEXInstall) {
        Config.pdf2htmlEXInstall = pdf2htmlEXInstall;
    }

    public static String getUploadDir() {
        return uploadDir;
    }

    public static String getOpenOfficeInstall() {
        return openOfficeInstall;
    }

    public static int getThreadSize() {
        return threadSize;
    }

    public static String getPdf2htmlEXInstall() {
        return pdf2htmlEXInstall;
    }

    public static int getForbidSign() {
        return forbidSign;
    }
    @Value("${forbidSign}")
    public  void setForbidSign(int forbidSign) {
        Config.forbidSign = forbidSign;
    }

    public static long getFileMaxSize() {
        return fileMaxSize;
    }
    @Value("${file_max}")
    public  void setFileMaxSize(long fileMaxSize) {
        Config.fileMaxSize = fileMaxSize;
    }

    public static String getAk() {
        return ak;
    }
    @Value("${lbs_ak}")
    public  void setAk(String ak) {
        Config.ak = ak;
    }

    public static String getBaeApiKey() {
        return baeApiKey;
    }
    @Value("${bae_api_key}")
    public  void setBaeApiKey(String baeApiKey) {
        Config.baeApiKey = baeApiKey;
    }

    public static String getBaeSecretKey() {
        return baeSecretKey;
    }
    @Value("${bae_secret_key}")
    public  void setBaeSecretKey(String baeSecretKey) {
        Config.baeSecretKey = baeSecretKey;
    }

    public static String getIosDownloadPath() {
        return iosDownloadPath;
    }
    @Value("${ios_download_path}")
    public  void setIosDownloadPath(String iosDownloadPath) {
        Config.iosDownloadPath = iosDownloadPath;
    }

    public static boolean isDebug() {
        return debug;
    }
    @Value("${debug}")
    public void setDebug(boolean debug) {
        Config.debug = debug;
    }

    public static String getIosPushPath() {
        return iosPushPath;
    }

    @Value("${ios_push_path}")
    public void setIosPushPath(String iosPushPath) {
        Config.iosPushPath = iosPushPath;
    }

    public static String getUploadRoot() {
        return uploadRoot;
    }
    @Value("${file.upload.root}")
    public  void setUploadRoot(String uploadRoot) {
        Config.uploadRoot = uploadRoot;
    }

    public static Double getAllowRadius() {
        return allowRadius;
    }
    @Value("${allow_radius}")
    public  void setAllowRadius(Double allowRadius) {
        Config.allowRadius = allowRadius;
    }

    public static int getScheduleAllow() {
        return scheduleAllow;
    }
    @Value("${schedule_allow}")
    public void setScheduleAllow(int scheduleAllow) {
        Config.scheduleAllow = scheduleAllow;
    }

    public static int getScheduleUpdateAllow() {
        return scheduleUpdateAllow;
    }
    @Value("${schedule_update_allow}")
    public  void setScheduleUpdateAllow(int scheduleUpdateAllow) {
        Config.scheduleUpdateAllow = scheduleUpdateAllow;
    }

    public static int getNotLateSignIn() {
        return notLateSignIn;
    }

    @Value("${schedule_not_late_sign_in}")
    public void setNotLateSignIn(int notLateSignIn) {
        Config.notLateSignIn = notLateSignIn;
    }

    public static int getNotEarlySignOut() {
        return notEarlySignOut;
    }

    @Value("${schedule_not_early_sign_out}")
    public void setNotEarlySignOut(int notEarlySignOut) {
        Config.notEarlySignOut = notEarlySignOut;
    }

    public static String getApiSuffix() {
        return apiSuffix;
    }

    @Value("${api_suffix}")
    public void setApiSuffix(String apiSuffix) {
        Config.apiSuffix = apiSuffix;
    }

    public static String getMessageTitle() {
        return messageTitle;
    }
    @Value("${message_title}")
    public  void setMessageTitle(String messageTitle) {
        Config.messageTitle = messageTitle;
    }

    public static int getBaiduPushType() {
        return baiduPushType;
    }
    @Value("${baidu_push_type}")
    public  void setBaiduPushType(int baiduPushType) {
        Config.baiduPushType = baiduPushType;
    }

    public static int getIosDeployStatus() {
        return iosDeployStatus;
    }
    @Value("${expire_ios_minute}")
    public  void setIosExpireMinute(int iosExpireMinute) {
        Config.iosExpireMinute = iosExpireMinute;
    }

    public static int getIosExpireMinute() {
        return iosExpireMinute;
    }
    @Value("${ios_deploy_status}")
    public  void setIosDeployStatus(int iosDeployStatus) {
        Config.iosDeployStatus = iosDeployStatus;
    }

    public static String getWechatToken() {
        return wechatToken;
    }
    @Value("${wechat_token}")
    public  void setWechatToken(String wechatToken) {
        Config.wechatToken = wechatToken;
    }

    public static String getWechatSubscribe() {
        return wechatSubscribe;
    }
    @Value("${wechat_subscribe}")
    public  void setWechatSubscribe(String wechatSubscribe) {
        Config.wechatSubscribe = wechatSubscribe;
    }

    public static String getWechatMenuDesc() {
        return wechatMenuDesc;
    }
    @Value("${wechat_menu_des}")
    public  void setWechatMenuDesc(String wechatMenuDesc) {
        Config.wechatMenuDesc = wechatMenuDesc;
    }

    public static String getWechatMenuKey() {
        return wechatMenuKey;
    }
    @Value("${menu}")
    public  void setWechatMenuKey(String wechatMenuKey) {
        Config.wechatMenuKey = wechatMenuKey;
    }

    public static String getWechatBackKey() {
        return wechatBackKey;
    }
    @Value("${back}")
    public  void setWechatBackKey(String wechatBackKey) {
        Config.wechatBackKey = wechatBackKey;
    }

    public static String getWechatErrorMenu() {
        return wechatErrorMenu;
    }
    @Value("${error_menu}")
    public  void setWechatErrorMenu(String wechatErrorMenu) {
        Config.wechatErrorMenu = wechatErrorMenu;
    }

    public static String getWechatErrorInput() {
        return wechatErrorInput;
    }
    @Value("${error_input}")
    public  void setWechatErrorInput(String wechatErrorInput) {
        Config.wechatErrorInput = wechatErrorInput;
    }

	public static String getDatacenterUrl() {
		return datacenterUrl;
	}

	@Value("${datacenter_url}")
	public void setDatacenterUrl(String datacenterUrl) {
		Config.datacenterUrl = datacenterUrl;
	}

	public static String getCasservice() {
		return casservice;
	}

	@Value("${casservice}")
	public void setCasservice(String casservice) {
		Config.casservice = casservice;
	}

	public static String getCascookiedomain() {
		return cascookiedomain;
	}

	@Value("${cascookiedomain}")
	public void setCascookiedomain(String cascookiedomain) {
		Config.cascookiedomain = cascookiedomain;
	}

	public static String getWallet_url() {
		return wallet_url;
	}

	@Value("${wallet_url}")
	public void setWallet_url(String wallet_url) {
		Config.wallet_url = wallet_url;
	}

	public static String getHrofirstappid() {
		return hrofirstappid;
	}
	
	@Value("${hrofirstappid}")
	public  void setHrofirstappid(String hrofirstappid) {
		Config.hrofirstappid = hrofirstappid;
	}

	public static String getHrofirstappsecret() {
		return hrofirstappsecret;
	}

	@Value("${hrofirstappsecret}")
	public  void setHrofirstappsecret(String hrofirstappsecret) {
		Config.hrofirstappsecret = hrofirstappsecret;
	}

	public static String getAppType() {
		return appType;
	}

	@Value("${appType}")
	public   void setAppType(String appType) {
		Config.appType = appType;
	}

	public static String getAppName() {
		return appName;
	}

	@Value("${appName}")
	public   void setAppName(String appName) {
		Config.appName = appName;
	}

}
