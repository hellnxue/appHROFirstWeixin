<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/taglibs.jspf" %>
<es:webAppNewHeader title="${appName}" description="智阳网络技术" keywords="智阳网络技术"/>

<header class="am-header am-header-default am-no-layout" data-am-widget="header">
  <div class="am-titlebar-left"> <a class="bak_ico" title="返回" href="javascript:history.go(-1)"><em></em></a> </div>
  <h1 class="am-header-title">手机号码</h1>
  <div class="am-titlebar-right"> <a title="" class="home_ico" href="${ctx}/webApp/index"><em></em></a> </div>
</header>
  <div class="yz_step">
   	<span> 验证身份信息</span><span class="cur">修改手机号码</span>
       <p class="line am-cf"><em class="cur am-fl"></em><em class="am-fr"></em></p>
   </div>
<div class="vip-center_form">
 
  <div class="input_list" id="widget-list">
  <form id="form1" name="form1" enctype="multipart/form-data" class="form-horizontal">
    <ul class="am-list m-widget-list" style="transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1); transition-duration: 0ms; transform: translate(0px, 0px) translateZ(0px);">
      <li>
        <div class="lines"><span>
          <input id="mobile" name="mobile" class="am-form-field am-input-lg" type="number" placeholder="请填写手机号码">
          </span></div>
      </li>
      <li>
        <div class="am-g lines"><span class="am-u-sm-8">
          <input id="messagecode" name="messagecode" type="number" class="am-form-field am-input-lg" placeholder="请输入验证码">
          </span> <span class="am-u-sm-4">
          <input type="button" onClick="sendmobileCaptcha();" class="am-btn am-btn-warning am-radius am-btn-sm" value="获取验证码" id="sendcaptcha">
          <span class="Time" style="display:none"><em class="time_sub" id="time_sub"></em>秒后重新发送</span>
          </span></div>
      </li>
    </ul>
    <p align="center" style="padding:0 2rem;">
      <input type="submit" class="am-btn am-btn-primary am-radius am-btn-block am-btn-lg" value="完成" id="submit">
    </p>
    </form>
  </div>
</div>

<es:webAppNewFooter/>
<!--在这里编写你的代码-->
<script type="text/javascript">
$(function() {

	var timerc1=60; //全局时间变量（秒数）
	var timerc2=60; //全局时间变量（秒数）
	var timer_add1=setInterval(add1,1000);
	function add1(){ //加时函数
		if(timerc1 > 0){ //如果不到1秒
		    --timerc1; //时间变量自减1
		    $(".Time #time_sub").html(parseInt(timerc1)); //写入分秒数
		   // $("#time_sub").html(Number(parseInt(timerc%60/10)).toString()+(timerc%10)); //写入秒数（两位）
		};
		if (timerc1==0) {
			  $("#sendcaptcha").show().siblings('span.Time').hide();
		       timerc1=15;
		 }
	};
		
	/**
	 * 获取验证码（个人）
	 * 
	 */
	$("#sendcaptcha").on("click",function(){
		var mobile=$("#mobile").val();

		var isempty=false;
		if(mobile!==""){//验证是否为空
			isempty=true;
		}
		if(!isempty ){
			alert("请填写正确的手机号码！");
			return false;
		}

	    
  	    $.getJSON("${ctx}/hrhelper-platform/anon/sendMobileMessage.e", {
           mobile: mobile, functionCode: "modifyMobile"
		}, function (data) {
			if (data == true){
				timerc1=60;
				$("#sendcaptcha").hide().siblings('.Time').show();
			    setTimeout(timer_add1);				
			}else{
				alert(data.code);	     
			}
		});	  
	});
	
	$("#submit").on("click",function(){	
		var messagecode=$("#messagecode").val();
		var newMobile=$.trim($("#mobile").val());
		var isempty=false;
	    if("${mobile}"==newMobile){
	    	alert("输入的手机号码与原始手机号码重复！");
	    	return false;
	    }
		if(messagecode!==""){//验证是否为空
			isempty=true;
		    return true;
		}
		
		if(!isempty ){
			alert("请填写验证码！");
			return false;
		}
		return true;
		
	});
});
</script>
</body>
</html>