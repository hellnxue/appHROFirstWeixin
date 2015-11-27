package com.hrofirst.controller;

import com.hrofirst.service.*;
import com.service.provider.HROFirstUserService;
import com.service.provider.SMSService;
import com.service.provider.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.DependsOn;
import org.springframework.stereotype.Controller;


/**
 * Created by qixb.fnst on 2015/02/10.
 */
@DependsOn("config")
public class baseController {
    
	@Autowired
    ProvinceService provinceService;
    
    @Autowired
    CityService cityService;
    
    @Autowired
    PolicyService policyService;
    
    @Autowired
    NewsService newsService;

    @Autowired
    WeChatService weChatService;
    
    static int INDEX_NEWS_SIZE = 20;
    
	@Autowired
	UserService userService;
	
	@Autowired
	HROFirstUserService hrofirstUserService;

	@Autowired
	SMSService smsService;

    @Autowired
    WebAppMenuService webappmenuService;
	
}
