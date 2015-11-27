<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/taglibs.jspf" %>

<es:webAppZhongqiuHeader title="中秋福利欢乐奉献-智阳网络" description="智阳网络技术" keywords="智阳网络技术"/>
<div class="pageBox">
  <div class="topbg"> <a href="javascript:history.go(-1)"></a><h1>预购单</h1></div>
  <div class="pageHeader">
  <c:if test="${type==1}">
  <img src="${ctx}/static/zhongqiu/images/list_01imgs.jpg" width="100%">
  </c:if>  
  <c:if test="${type==2}">
  <img src="${ctx}/static/zhongqiu/images/list_02imgs.jpg" width="100%">
  </c:if>  
  <c:if test="${type==3}">
  <img src="${ctx}/static/zhongqiu/images/list_03imgs.jpg" width="100%">
  </c:if>  
  <c:if test="${type==4}">
  <img src="${ctx}/static/zhongqiu/images/list_04imgs.jpg" width="100%">
  </c:if>  
  </div>
  
  <!--列表-->
  <div class="container">
    <p class="inuts_text">咬上一口月饼，品味甜蜜，让快乐升华！</p>
    <div class="inuts_lists">
      <form method="post" id="ajaxForm">
      <ul>
        <li><span>订购数量</span>
        <div class="dataBorderBox Js_cart_goto"> <span class="CandP J_minus">-</span>
            <input name="tb_buynum" type="text" class="ticNum J_input" id="buy_goods_num" value="1" maxlength="4">
            <span class="CandP blue J_add">+</span> </div>
            </li>
        <li><span>公司名称</span>
          <input id="corpname" type="text" class="inputs" placeholder="请输入公司名称" reg="[^ \f\n\r\t\v]" tip="公司名称不能为空" ok-tip="你输入的公司名称正确"><span class="form-tip error-tip"></span>
        </li>
        <li><span>联系人姓名</span>
          <input id="name" type="text" class="inputs" placeholder="请输入联系人姓名" reg="^\s*[\s\S]{1,10}\s*$" tip="联系人姓名不能超过10个汉字或为空" ok-tip="你输入的联系人姓名正确"><span class="form-tip error-tip"></span>
        </li>
        <li><span>手机号码</span>
          <input id="mobile" type="text" class="inputs" placeholder="请输入手机号码" reg="^13[0-9]{9}$|^14[5|7][0-9]{8}$|^15[012356789][0-9]{8}$|^17[0|6-8][0-9]{8}$|^18[0-9]{9}$" tip="手机格式错误" ok-tip="输入正确"><span class="form-tip error-tip"></span>
        </li>
        <li><span>电子邮箱</span>
          <input id="email" type="text" class="inputs" placeholder="请输入电子邮箱" reg="^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" tip="邮箱格式错误" ok-tip="输入正确"><span class="form-tip error-tip"></span>
        </li>
        <li><p align="center"><input type="submit" value="提 交" class="sub_but but_submit"  id="t1"></p></li>
      </ul>
      </form>
    </div>
    <div id="detail">
    <div class="layer_order"></div>
    <div class="order-notice">
      <p align="right"><a class="closeico close" href="index"></a></p>
      <p class="tit_cont"></p>
      <p align="center"><a class="sub_but but_submit close" href="index">确 定</a></p>
    </div>
    </div>
  </div>
  <!--列表 end--> 
</div>

<script>
var isExtendsValidate = true;	//如果要试用扩展表单验证的话，该属性一定要申明
function extendsValidate(){	//函数名称，固定写法
		//获取表单对象和用户信息值
		var f = $("#ajaxForm"),postStr = f.serialize();
		var mobile = document.getElementById("mobile").value;
		var name = document.getElementById("name").value+"|"+document.getElementById("corpname").value+"|"+document.getElementById("email").value;
		var email = document.getElementById("email").value;

		
		if($('.error-ipt-tip').length < 1){
			$.ajax({ 
			  async:false,
			  contentType: "application/json",
			  dataType: "json",
			  type: "GET", 
			  url: "${ctx}/hrhelper-platform/zhongqiuDemand?type=${type}", 
			  data: "name="+encodeURI(encodeURI(name))+"&mobile="+mobile+"&email="+email, 
			  success: function(objarray){
				  $("#detail").show().find(".tit_cont").html(objarray['message']);
			  },
			  error: function(){
				  alert("机制错误");
			  }
			});
		}
		return false;
	
}
</script>

</body>
</html>