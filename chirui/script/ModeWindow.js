
/**模态对话框****
  Description（使用说明）：
	1、页面引用jquery-1.2.6.js(本项目中引用script/jquery.js)
	2、打开对话框调用 dialogOpen
	3、关闭对话框调用 dialogClose
  Copyright: Copyright (c) 2009 Company: 西安秦码软件科技有限公司 
  author： 蒋华涛
  date：2009-04-23
**/
 
 
	/** 打开对话框
	* @param divId(string) 对话框中内容的id(div的id，此div必需设置高和宽)
	* @param isMode(boolean) 是否模态显示,即排他（true 为排它，false不排他，默认为true）
	* @param isSelect(boolean) 页面中有无下拉框（true为有，false为无，默认为true。有下拉框时ie6出会出现遮挡不住的现象）
	* @param position(boolean) 对话框显示位置（）!!! 暂不能使用
	*/
	var dialogOpen = function(divId,isMode,isSelect,position){
		isMode = (isMode || isMode == undefined) ? true : false;			//对话框模式（排他/不排他）
		isSelect = (isSelect || isSelect == undefined) ? true : false;
	//	position = (position == "0" || position == undefined) ? "0" : "1";
	
		var o =  $("#" + divId);	//弹出框对象
		var width = o.width();		//弹出框高度
		var height = o.height();	//弹出框高度
		var winWidth = 0;			//页面实际宽度
		var winHeight = 0;			//页面实际高度
		var tempLeft = 0;			//计算x座标
		var tempTop = 0;			//计算y座标
	
		var docW =($(document).width()- ($.browser.msie && $.browser.version != "7.0"? 22:0));	//如果是ie浏览器且不是ie7，宽度-22
		var docH =$(document).height();
			
		//获取窗口宽度 高度 
		 if (window.innerHeight){
			winWidth = window.innerWidth;  
			winHeight = window.innerHeight; 
		 }else if ((document.body) && (document.body.clientHeight)){
			winWidth = document.body.clientWidth;   
			winHeight = document.body.clientHeight;
		 }   
		
		//通过深入Document内部对body进行检测，获取窗口大小  $.browser.msie 验证是ie
		 if ($.browser.msie && document.documentElement && document.documentElement.clientHeight && document.documentElement.clientWidth){  
			winWidth = document.documentElement.clientWidth;  
			winHeight = document.documentElement.clientHeight;  
		 }
		 
		
	  	tempLeft = $(document).scrollLeft() + parseInt((winWidth - width) / 2);		  			
	  	tempTop = $(document).scrollTop() +  parseInt((winHeight - height) / 2);
	  	
		
		var temp_float= "";			//新创建层字符串
		if(isMode){
			temp_float = "<div id=\"dialogBg\" style=\"z-index: 1003;height:" + docH + "px;width:" + docW + "px;filter:alpha(opacity=0);opacity:0;\"></div>";
			$("select").attr("disabled","true");	//防止ie6控制禁不下拉框
			
		}
	 	if(isSelect){
			//iframe 是为遮住下拉框
			temp_float += '<div id="iframe_div"><iframe id="iframeBg" style="z-index: 10004; border-bottom: medium none; position: absolute; filter: alpha(opacity=0); BORDER-LEFT: medium none; padding-bottom: 0px; margin: 0px; padding-left: 0px; width: '+ width +'; padding-right: 0px; zoom: 1; height: ' + (height - 3) + '; border-top: medium none; top: ' + tempTop + 'px; border-right: medium none; padding-top: 0px; left: '+ tempLeft +'px;"/></div>';
	
		}
		
		temp_float += "<div id=\"cententBox\" style=\"z-index: 10010;\"><div style=\"z-index: 10011;\" id=\"centent\" ></div>";
		temp_float += "</div>"; 
	  	$("body").append(temp_float);
	    $("#dialogBg").css({display:"none",background:"#000",position:"absolute",top:"0",left:"0"});
		$("#dialogBg").show()
		$("#dialogBg").animate({opacity:"0.4"},"normal");
	  	$("#centent").html((o.html()==null ) ? "error:not find your div" : o.html());
	 // $("#cententBox").css({background:"#fff", border:"1px solid #dd0094",width:width,height:height,position:"absolute"});
	 	$("#cententBox").css({width:width,height:height,position:"absolute"});  //去掉背景
	
		
		
	  	
		/*
		var s = "网页宽："+winWidth+ "--网页高：" + winHeight;
		s +="\n\r 窗口宽：" +width+ "--窗口高：" + height;
		s +="\n\r tempLeft:" +tempLeft+ "--tempTop:" +tempTop;
		s +="\n\r scrollLeft:" +$(document).scrollLeft()+ "--scrollTop:" +$(document).scrollTop();
		alert(s);
		*/
		
		/** 直接显示  **	*/
		$("#cententBox").css({display:"none",left:tempLeft + "px",top:tempTop + "px"});	//定位直接显示位置
		$("#cententBox select").removeAttr("disabled");	//防止弹出框上有下拉框。
		$("#cententBox").fadeIn(500);	//fadeIn

	  	/*** 由顶部下滑效果*****
	  	$("#cententBox").css({left:tempLeft + "px",top:($(document).scrollTop() - height) +"px"});	//定位下滑显示位置
	  	$("#cententBox").animate({top:tempTop + "px"},"normal"); 				//下滑效果	
		//$("#cententBox").animate({top:tempTop + "px"}, { duration: 3000});	//3000控制小滑速度
		*/
		
		//设置第一个可控的input的表单元素获得焦点	
		$("#centent :input").eq(0).focus();
		
		/** 关闭对话框 **/
	 	dialogClose = function(){
	 		$("select").removeAttr("disabled");	 	
			$("#dialogBg").animate({opacity:"0"},"normal",function(){$(this).remove();});	
			
			//对话框淡出
			$("#cententBox").fadeOut(500,function(){$("#cententBox").remove();});
			
			//iframe移出
			$("#iframe_div").fadeOut(500,function(){$("#iframe_div").remove();});
			
		
			//对话框滑出
			//$("#cententBox").animate({top:($(document).scrollTop()-(height=="auto"?10:parseInt(height)))+"px"},"normal",function(){$(this).remove();}); 
		}
		
		
		//打开新的窗口。
		dialogOpenNew = function(newDivId){
		
			var o1 =  $("#" + newDivId);	//弹出框对象
			width = o1.width();		//弹出框高度
			height = o1.height();
			
			//获取窗口宽度 高度 
			 if (window.innerHeight){
				winWidth = window.innerWidth;  
				winHeight = window.innerHeight; 
			 }else if ((document.body) && (document.body.clientHeight)){
				winWidth = document.body.clientWidth;   
				winHeight = document.body.clientHeight;
			 }   
			
			//通过深入Document内部对body进行检测，获取窗口大小  $.browser.msie 验证是ie
			 if ($.browser.msie && document.documentElement && document.documentElement.clientHeight && document.documentElement.clientWidth){  
				winWidth = document.documentElement.clientWidth;  
				winHeight = document.documentElement.clientHeight;  
			 }
			
		  	tempLeft = $(document).scrollLeft() + parseInt((winWidth - width) / 2);		  			
		  	tempTop = $(document).scrollTop() +  parseInt((winHeight - height) / 2);
		  	
			temp_float = '<iframe id="iframeBg" style="z-index: 10004; border-bottom: medium none; position: absolute; filter: alpha(opacity=0); BORDER-LEFT: medium none; padding-bottom: 0px; margin: 0px; padding-left: 0px; width: '+ width +'; padding-right: 0px; zoom: 1; height: ' + height + '; border-top: medium none; top: ' + tempTop + 'px; border-right: medium none; padding-top: 0px; left: '+ tempLeft +'px;"/>';
			//更新遮住下拉框的iframe
			$("#iframe_div").html(temp_float);
			temp_float = "<div id=\"centent\" style=\"z-index: 10011;\"></div>";
			$("#cententBox").html(temp_float);
			$("#centent").html(o1.html());
			
			$("#cententBox").css({width:width,height:height,position:"absolute"});  //去掉背景
			$("#cententBox select").removeAttr("disabled");	//防止弹出框上有下拉框。
			
		  	
			
			/** 直接显示  **	*/
			$("#cententBox").css({display:"none",left:tempLeft + "px",top:tempTop + "px"});	//定位直接显示位置
			$("#cententBox").fadeIn(500);	//fadeIn
			
			$("#centent :input").eq(0).focus();
			
			
		}
		
	}