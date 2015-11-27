$(document).ready(function() {
	//$(".section-box").height($(window).height());
	$(".m-page").height($(window).height());
	
	$(".series-list li").click(function(){
		if($(this).hasClass('cur')){
			var e = e||event;
			if($(e.target).parents(".series-mian").length==0){
				$(this).removeClass('cur').find(".series-mian").hide();
			}
			
		}else{
			$(this).addClass('cur').find(".series-mian").show();
			$(this).siblings().removeClass('cur').find(".series-mian").hide();
			var idfix = $(this).find(".Fixcent").attr('id'),idexit = $(this).find(".Fixexit").attr('id');
			$("#"+idfix).scrollFix({endPos:"#"+idexit});
			
			console.log($(this).offset().top);
			$("body").scrollTop($(this).offset().top);;
			
			
			var idsdl = $(this).find(".waterlist").attr('id'),idurl = $(this).find(".waterlist").data('url');
			$('#'+idsdl).waterfall({
			  colWidth: ($(window).width()*0.499999),			// 列宽
			  url: idurl,
			  marginLeft: -1,			// 每列的左间宽
			  marginTop: -1,			// 每列的上间宽
			  perNum: 30,			// 每次显示五个
			  ajaxTimes: 1 		// 只发送一次请求
			});
			
		}
	});
	
	//调用加减
	if($('.Js_cart_goto').length > 0){
	  $('.Js_cart_goto').iVaryVal({},flowcakbak);
	};
	
	$(".close").click(function(){
		$("#detail").hide();
	});	
});
function flowcakbak(value,index,obg)
{
  
  
  return false;
}