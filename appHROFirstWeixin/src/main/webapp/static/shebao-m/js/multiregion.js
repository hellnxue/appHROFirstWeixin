$(document).ready(function() {
	$(document).bind("touchstart",function(event){
		if($(event.target).parents(".rs_cityselect").length==0){ $(".region-wrapper").hide(); }
	});
	
	$('.data-multi-select').click(function() {
		$(".rs_selectlist").find("input").toggle();
		$(".data-multi-but").toggle();
	});
	$('.data-multi-close').click(function() {
		$(".rs_selectlist").find("input").toggle();
		$(".data-multi-but").toggle();
	});
	
	
	$('.region-trigger').click(function() {
		$(".region-wrapper").toggle();
	});
	
	$('.unfold').click(function() {
		if(!$(this).hasClass("fold")){
			$(this).parents("ul").find("dd").removeClass("light").find(".unfold").removeClass("fold").siblings(".city").hide();　
			$(this).addClass("fold").next(".city").show().parents("dd").addClass("light");
		}else{
			$(this).removeClass("fold").next(".city").hide().parents("dd").removeClass("light");　
		}
	});
	$('span.go-ico-del').click(function() {
		$(this).parents("dd").removeClass("light").find(".unfold").removeClass("fold").next(".city").hide();　
	});
	$('a.go-ico-del').click(function() {
		$(".region-wrapper").hide();
	});
	
	
	$('input.prov').change(function() {
		if ($(this).prop("checked")) {
			$(this).attr('checked',true);
			$(this).siblings(".city").find("input").prop("checked",true);
		}else{
			$(this).removeAttr("checked");
			$(this).siblings(".city").find("input").prop("checked",false);
		}
		if($(this).parents("li").find("input.prov:checked").length == $(this).parents("li").find("input.prov").length){
			$(this).parents("li").find("input.reg").prop("checked",true);
		}else{
			$(this).parents("li").find("input.reg").prop("checked",false);
		}
		allvartool();
	});
	$('input.reg').change(function() {
		if ($(this).prop("checked")) {
			$(this).parents("li").find("dd").find("input").prop("checked",true);
		}else{
			$(this).parents("li").find("dd").find("input").prop("checked",false);
		}
		allvartool();
	});
	
	$('li.cit input').change(function() {
		console.log($(this).parents(".city").find("input:checked").length);
		if($(this).parents(".city").find("input:checked").length == $(this).parents(".city").find("input").length){
			$(this).parents("dd").find("input.prov").prop("checked",true);
		}else{
			$(this).parents("dd").find("input.prov").prop("checked",false);
		}
		allvartool();
	});
	
	
	function allvartool(){
		var arrList = new Array(),arrListstr = "";
		$('input.prov').each(function(){
			if ($(this).prop("checked")) {
				$(this).siblings(".num").html("("+$(this).siblings(".city").find("input").length+")");
				arrList.push($(this).next("label").html());
			}else{
				var twoarrList = new Array(),twoarrListstr = "";
				$(this).siblings(".city").find("input").each(function(){
					if ($(this).prop("checked")) {
						twoarrList.push($(this).next("label").html());
					}
				});
				if(twoarrList.length > 0){
					$(this).siblings(".num").html("("+$(this).siblings(".city").find("input:checked").length+")");
					twoarrListstr += "("+twoarrList.join(",")+")";
				    twoarrListstr = $(this).next("label").html()+twoarrListstr;
					arrList.push(twoarrListstr);
				}else{
					$(this).siblings(".num").html("");
				}
				//console.log(twoarrListstr);
				
			}
			//console.log(arrList);
			arrListstr = arrList.join(",");
			$(".region-select").find("span").html(arrListstr);
			$("#region-data").val(arrListstr);
		});
		
		$(".region-wrapper").css({"top":$(".region-select").height()+29});
	};
	
});

$(window).resize(function () { 
  
});
