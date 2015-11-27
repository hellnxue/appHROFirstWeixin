/*
	Copyright (C) 2013 - 2015
	WebSite:	http://www.mohism.cn/
	Author:		Qizhugong
*/
$(function(){
	var xOffset = -20; // x distance from mouse
    var yOffset = 20; // y distance from mouse  
	
	
	//input action
	$(document).on({
	  "mouseover":
	  function(e) {
		  if($(this).attr('tip') != undefined){
			  //$(this).next(".error-tip").show().html($(this).attr('tip'));
			  
			  var top = (e.pageY + yOffset);
			  var left = (e.pageX + xOffset);
			  $('body').append( '<p id="vtip"><img id="vtipArrow" src="./images/vtip_arrow.png"/>' + $(this).attr('tip') + '</p>' );
			  $('p#vtip').css("top", top+"px").css("left", left+"px");
			  $('p#vtip').bgiframe();
		  }
	  },
	  "mousemove":
	  function(e) {
		  if($(this).attr('tip') != undefined){
			  var top = (e.pageY + yOffset);
			  var left = (e.pageX + xOffset);
			  $("p#vtip").css("top", top+"px").css("left", left+"px");
		  }
	  },
	  "mouseout":
	  function(e) {
		  if($(this).attr('tip') != undefined){
			  $("p#vtip").remove();
			  //$(this).next(".error-tip").hide().html("");
		  }
	  },
	  "blur":
	  function(){
		  if($(this).attr("url") != undefined){
			  ajax_validate($(this));
		  }else if($(this).attr("reg") != undefined){
			  validate($(this));
		  }
	  }
	},"[reg],[url]:not([reg]),[tip]");
	
	
	//提交触发
	$(document).on('submit', 'form', function () {
		var isSubmit = true;
		$(this).find("[reg],[url]:not([reg])").each(function(){
			if($(this).attr("reg") == undefined){
				if(!ajax_validate($(this))){
					isSubmit = false;
				}
			}else{
				if(!validate($(this))){
					isSubmit = false;
				}
			}
		});
		if(typeof(isExtendsValidate) != "undefined"){
   			if(isSubmit && isExtendsValidate){
				return extendsValidate();
			}
   		}
		
		if($('.validatorerrpr').length > 0){
		  if(!isSubmit){
			  $('.validatorerrpr').show();
		  }else{
			  $('.validatorerrpr').hide();
		  }
		}
		
		return false;
		
		return isSubmit;
	});
	
});

function validate(obj){
	var reg = new RegExp(obj.attr("reg"));
	var objValue = obj.val();
	
	if(!reg.test(objValue)){
		change_error_style(obj,"add");
		change_tip(obj,null,"remove");
		return false;
	}else{
		if(obj.attr("url") == undefined){
			change_error_style(obj,"remove");
			change_tip(obj,null,"remove");
			return true;
		}else{
			return ajax_validate(obj);
		}
	}
}

function ajax_validate(obj){
	
	var url_str = obj.attr("url");
	if(url_str.indexOf("?") != -1){
		url_str = url_str+"&"+obj.attr("name")+"="+obj.val();
	}else{
		url_str = url_str+"?"+obj.attr("name")+"="+obj.val();
	}
	var feed_back = $.ajax({url: url_str,cache: false,async: false}).responseText;
	feed_back = feed_back.replace(/(^\s*)|(\s*$)/g, "");
	if(feed_back == 'success'){
		change_error_style(obj,"remove");
		change_tip(obj,null,"remove");
		obj.siblings(".oktip").show();
		return true;
	}else{
		change_error_style(obj,"add");
		change_tip(obj,feed_back,"add");
		obj.siblings(".oktip").hide();
		return false;
	}
}

function change_tip(obj,msg,action_type){
	
	if(obj.attr("tip") == undefined){//初始化判断TIP是否为空
		obj.attr("is_tip_null","yes");
	}
	if(action_type == "add"){
		if(obj.attr("is_tip_null") == "yes"){
			obj.attr("tip",msg);
		}else{
			if(msg != null){
				if(obj.attr("tip_bak") == undefined){
					obj.attr("tip_bak",obj.attr("tip"));
				}
				obj.attr("tip",msg);
				change_error_style(obj,"add");
			}
		}
	}else{
		if(obj.attr("is_tip_null") == "yes"){
			obj.removeAttr("tip");
			obj.removeAttr("tip_bak");
		}else{
			obj.attr("tip",obj.attr("tip_bak"));
			obj.removeAttr("tip_bak");
		}
	}
}

function change_error_style(obj,action_type){
	if(action_type == "add"){
		obj.addClass("error-ipt-tip").removeClass("ok-ipt-tip");
		obj.show().next(".form-tip").addClass("error-tip").removeClass("ok-tip").html("<em></em>"+obj.attr('tip'));
	}else{
		obj.show().next(".form-tip").addClass("ok-tip").removeClass("error-tip").html("<em></em>"+obj.attr('ok-tip'));
		obj.removeClass("error-ipt-tip").addClass("ok-ipt-tip");
	}
}


$.fn.validate_callback = function(msg,action_type,options){
	this.each(function(){
		if(action_type == "failed"){
			change_error_style($(this),"add");
			change_tip($(this),msg,"add");
		}else{
			change_error_style($(this),"remove");
			change_tip($(this),null,"remove");
		}
	});
};
