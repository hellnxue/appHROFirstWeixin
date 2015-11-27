<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/taglibs.jspf" %>
<!-- 修改密码 -->
<es:webAppNewHeader title="${appName}" description="智阳网络技术" keywords="智阳网络技术"/>
<header class="am-header am-header-default am-no-layout" data-am-widget="header">
  <div class="am-titlebar-left"> <a class="bak_ico" title="返回" href="javascript:history.go(-1)"><em></em></a> </div>
  <h1 class="am-header-title">用户密码</h1>
  <div class="am-titlebar-right"> <a title="" class="home_ico" href="${ctx}/webApp/index"><em></em></a> </div>
</header>
<div class="vip-center_form">
<div class="yz_step yz_step_mm">
    	<span>验证手机号码</span><span>验证身份证</span><span class="cur">密码设置</span>
        <p class="line am-cf"><em class="am-fl"></em><em class="am-fl am-s"></em><em class="am-fr cur"></em></p>
    </div>
  <div class="input_list" id="widget-list">
  <form id="form1" name="form1" enctype="multipart/form-data" class="form-horizontal">
    <ul class="am-list m-widget-list" style="transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1); transition-duration: 0ms; transform: translate(0px, 0px) translateZ(0px);">
      <li>
        <div class="lines"><span>
          <input class="am-form-field am-input-lg" type="password" placeholder="请输入原密码" id="old_password" name="old_password">
          </span></div>
      </li>
       <span id="errorM0" style="color:red"></span>
      <li>
        <div class="lines"><span>
          <input class="am-form-field am-input-lg" type="password" placeholder="请输入新密码" id="new_password" name="new_password">
          </span></div>
      </li>
       <span id="errorM1" style="color:red"></span>
      <li>
        <div class="lines"><span>
          <input class="am-form-field am-input-lg" type="password" placeholder="请再次输入新密码" id="a_new_password" name="a_new_password">
          </span></div>
      </li>
    </ul>
    <span id="errorM2" style="color:red"></span>
    <p align="center" style="padding:0 2rem;">
      <input type="button" class="am-btn am-btn-primary am-radius am-btn-block am-btn-lg" value="完成" id="btn_submit">
    </p>
      </form>
  </div>
</div>
<es:webAppNewFooter/>
<script src="${ctx}/static/assets/js/rulesValidation.js"></script> 
<script type="text/javascript">
$(function() {

	$("#btn_submit").on("click",function(){	
		console.log(111);
		var old_password=$("#old_password").val();
		var new_password=$("#new_password").val();
		var a_new_password=$("#a_new_password").val();
		//密码验证
		if(!required(old_password)){
			$("#errorM0").html("请填写原始密码！");
			return false;
		}
		if(!required(new_password)){
			$("#errorM1").html("请填写密码！");
			return false;
		}
		if(!rangeLength(new_password)){
			$("#errorM1").html("密码长度为6-18位！");
			return false;
		}
		if(numberCheck(new_password)===false){
			$("#errorM1").html("密码不能全是数字！");
			return false;
		}
		if(!passwordCheck(new_password)){
			$("#errorM1").html("密码格式不正确！");
			return false;
		}
		if (new_password == a_new_password){
			//return true;
			$("#form1").submit();
		}else{
			//alert("两次输入的密码不一致");
		    $("#errorM2").html("两次输入的密码不一致！");
			return false;
		}
	});
});
</script>
</body>
</html>