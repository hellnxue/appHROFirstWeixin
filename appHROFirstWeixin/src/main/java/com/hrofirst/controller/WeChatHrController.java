package com.hrofirst.controller;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.github.sd4324530.fastweixin.handle.EventHandle;
import com.github.sd4324530.fastweixin.handle.MessageHandle;
import com.github.sd4324530.fastweixin.message.BaseMsg;
import com.github.sd4324530.fastweixin.message.TextMsg;
import com.github.sd4324530.fastweixin.message.req.BaseEvent;
import com.github.sd4324530.fastweixin.message.req.BaseReqMsg;
import com.github.sd4324530.fastweixin.message.req.ImageReqMsg;
import com.github.sd4324530.fastweixin.message.req.LinkReqMsg;
import com.github.sd4324530.fastweixin.message.req.LocationEvent;
import com.github.sd4324530.fastweixin.message.req.LocationReqMsg;
import com.github.sd4324530.fastweixin.message.req.MenuEvent;
import com.github.sd4324530.fastweixin.message.req.QrCodeEvent;
import com.github.sd4324530.fastweixin.message.req.TextReqMsg;
import com.github.sd4324530.fastweixin.message.req.VideoReqMsg;
import com.github.sd4324530.fastweixin.message.req.VoiceReqMsg;
import com.github.sd4324530.fastweixin.servlet.WeixinControllerSupport;
import com.hrofirst.entity.WeChatUser;
import com.hrofirst.service.WeChatService;
import com.hrofirst.util.Config;

/**
 * HR帮手
 * @ClassName: WeChatHrController
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author hsx
 * @date 2015年7月1日 上午10:03:59
 */
@RestController
@RequestMapping("/weChatHroFirst")
public class WeChatHrController extends WeixinControllerSupport {
    private static final Logger log = LoggerFactory.getLogger(WeChatHrController.class);
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

    //重写父类方法，处理对应的微信消息
    @Override
    protected BaseMsg handleTextMsg(TextReqMsg msg) {
        return weChatService.checkHRAndResponseMenu(msg);
    }
    
    //处理发送的图片
    @Override
    protected BaseMsg handleImageMsg(ImageReqMsg msg) {
        return weChatService.checkHRAndResponseMenu(msg);
    }

    @Override
    protected BaseMsg handleVoiceMsg(VoiceReqMsg msg) {
        return weChatService.checkHRAndResponseMenu(msg);
    }

    @Override
    protected BaseMsg handleVideoMsg(VideoReqMsg msg) {
        return weChatService.checkHRAndResponseMenu(msg);
    }

    @Override
    protected BaseMsg handleLocationMsg(LocationReqMsg msg) {
        return weChatService.checkHRAndResponseMenu(msg);
    }

    @Override
    protected BaseMsg handleLinkMsg(LinkReqMsg msg) {
        return weChatService.checkHRAndResponseMenu(msg);
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
    protected BaseMsg handleMenuClickEvent(MenuEvent event) {
    	return super.handleMenuClickEvent(event);
    }

    @Override
    protected BaseMsg handleMenuViewEvent(MenuEvent event) {
        return super.handleMenuViewEvent(event);
    }
    //关注HROFirst帮手
    @Override
    protected BaseMsg handleSubscribe(BaseEvent event) {
//        weChatService.saveFollowTime(event.getFromUserName());
    	 String weichatId = event.getFromUserName();
         if (weichatId != null) {
        	 WeChatUser user = weChatService.findWeChatUser(weichatId, Config.getAppType());
	    	 if (user == null) {
             	 //创建用户
                 user = new WeChatUser(weichatId);
             }
             user.setApptype(Config.getAppType());
             //修改时间
             user.setLastAccessDate(new Date());
             user = weChatService.save(user);
         }
        //只显示欢迎词
         TextMsg tm=new  TextMsg();
         tm.add("HI，欢迎来到“第一人力”官微！沙发伺候~\n\n");
         tm.add("想了解社保、福利、企业信息？下方菜单栏应有尽有。\n\n");
         tm.add("不够？通过下列方式了解更多第一人力的魅力哦！\n");
         tm.add("官网：").addLink("www.hrofirst.com", "www.hrofirst.com");
         tm.add("\n电话：400-921-7700\n");
         return tm;
    }

    @Override
    protected BaseMsg handleUnsubscribe(BaseEvent event) {
        weChatService.unSubscribe(event.getFromUserName(),Config.getAppType());
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
