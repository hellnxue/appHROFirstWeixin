package com.hrofirst.controller;

import com.github.sd4324530.fastweixin.handle.EventHandle;
import com.github.sd4324530.fastweixin.handle.MessageHandle;
import com.github.sd4324530.fastweixin.message.BaseMsg;
import com.github.sd4324530.fastweixin.message.TextMsg;
import com.github.sd4324530.fastweixin.message.req.*;
import com.github.sd4324530.fastweixin.servlet.WeixinControllerSupport;
import com.hrofirst.service.WeChatService;
import com.hrofirst.util.Config;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by qixb.fnst on 2015/03/20.
 */
@RestController
@RequestMapping("/weChat")
public class WeChatController extends WeixinControllerSupport {
    private static final Logger log = LoggerFactory.getLogger(WeChatController.class);
    private static final String TOKEN = Config.getWechatToken();

    @Autowired
    private WeChatService weChatService;


    //设置TOKEN，用于绑定微信服务器
    @Override
    protected String getToken() {
        return TOKEN;
    }

    //使用安全模式时设置：APPID
    @Override
    protected String getAppId() {
        return null;
    }

    //使用安全模式时设置：密钥
    @Override
    protected String getAESKey() {
        return null;
    }



    @Override
    protected BaseMsg handleQrCodeEvent(QrCodeEvent event) {
        return super.handleQrCodeEvent(event);
    }

    @Override
    protected BaseMsg handleLocationEvent(LocationEvent event) {
        return super.handleLocationEvent(event);
    }


    @Override
    protected BaseMsg handleMenuViewEvent(MenuEvent event) {
        return super.handleMenuViewEvent(event);
    }

    @Override
    protected BaseMsg handleSubscribe(BaseEvent event) {
        weChatService.saveFollowTime(event.getFromUserName(),"weixinHR");
        return weChatService.showTopMenu(new TextMsg(Config.getWechatSubscribe()).addln());
    }

    @Override
    protected BaseMsg handleUnsubscribe(BaseEvent event) {
        weChatService.unSubscribe(event.getFromUserName(),"weixinHR");
        return super.handleUnsubscribe(event);
    }

    @Override
    protected BaseMsg handleDefaultMsg(BaseReqMsg msg) {
        return super.handleDefaultMsg(msg);
    }

    @Override
    protected BaseMsg handleDefaultEvent(BaseEvent event) {
        return super.handleDefaultEvent(event);
    }

    @Override
    protected List<MessageHandle> initMessageHandles() {
        return super.initMessageHandles();
    }

    @Override
    protected List<EventHandle> initEventHandles() {
        return super.initEventHandles();
    }
}
