
/**ģ̬�Ի���****
  Description��ʹ��˵������
	1��ҳ������jquery-1.2.6.js(����Ŀ������script/jquery.js)
	2���򿪶Ի������ dialogOpen
	3���رնԻ������ dialogClose
  Copyright: Copyright (c) 2009 Company: ������������Ƽ����޹�˾ 
  author�� ������
  date��2009-04-23
**/
 
 
	/** �򿪶Ի���
	* @param divId(string) �Ի��������ݵ�id(div��id����div�������øߺͿ�)
	* @param isMode(boolean) �Ƿ�ģ̬��ʾ,��������true Ϊ������false��������Ĭ��Ϊtrue��
	* @param isSelect(boolean) ҳ��������������trueΪ�У�falseΪ�ޣ�Ĭ��Ϊtrue����������ʱie6��������ڵ���ס������
	* @param position(boolean) �Ի�����ʾλ�ã���!!! �ݲ���ʹ��
	*/
	var dialogOpen = function(divId,isMode,isSelect,position){
		isMode = (isMode || isMode == undefined) ? true : false;			//�Ի���ģʽ������/��������
		isSelect = (isSelect || isSelect == undefined) ? true : false;
	//	position = (position == "0" || position == undefined) ? "0" : "1";
	
		var o =  $("#" + divId);	//���������
		var width = o.width();		//������߶�
		var height = o.height();	//������߶�
		var winWidth = 0;			//ҳ��ʵ�ʿ��
		var winHeight = 0;			//ҳ��ʵ�ʸ߶�
		var tempLeft = 0;			//����x����
		var tempTop = 0;			//����y����
	
		var docW =($(document).width()- ($.browser.msie && $.browser.version != "7.0"? 22:0));	//�����ie������Ҳ���ie7�����-22
		var docH =$(document).height();
			
		//��ȡ���ڿ�� �߶� 
		 if (window.innerHeight){
			winWidth = window.innerWidth;  
			winHeight = window.innerHeight; 
		 }else if ((document.body) && (document.body.clientHeight)){
			winWidth = document.body.clientWidth;   
			winHeight = document.body.clientHeight;
		 }   
		
		//ͨ������Document�ڲ���body���м�⣬��ȡ���ڴ�С  $.browser.msie ��֤��ie
		 if ($.browser.msie && document.documentElement && document.documentElement.clientHeight && document.documentElement.clientWidth){  
			winWidth = document.documentElement.clientWidth;  
			winHeight = document.documentElement.clientHeight;  
		 }
		 
		
	  	tempLeft = $(document).scrollLeft() + parseInt((winWidth - width) / 2);		  			
	  	tempTop = $(document).scrollTop() +  parseInt((winHeight - height) / 2);
	  	
		
		var temp_float= "";			//�´������ַ���
		if(isMode){
			temp_float = "<div id=\"dialogBg\" style=\"z-index: 1003;height:" + docH + "px;width:" + docW + "px;filter:alpha(opacity=0);opacity:0;\"></div>";
			$("select").attr("disabled","true");	//��ֹie6���ƽ���������
			
		}
	 	if(isSelect){
			//iframe ��Ϊ��ס������
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
	 	$("#cententBox").css({width:width,height:height,position:"absolute"});  //ȥ������
	
		
		
	  	
		/*
		var s = "��ҳ��"+winWidth+ "--��ҳ�ߣ�" + winHeight;
		s +="\n\r ���ڿ�" +width+ "--���ڸߣ�" + height;
		s +="\n\r tempLeft:" +tempLeft+ "--tempTop:" +tempTop;
		s +="\n\r scrollLeft:" +$(document).scrollLeft()+ "--scrollTop:" +$(document).scrollTop();
		alert(s);
		*/
		
		/** ֱ����ʾ  **	*/
		$("#cententBox").css({display:"none",left:tempLeft + "px",top:tempTop + "px"});	//��λֱ����ʾλ��
		$("#cententBox select").removeAttr("disabled");	//��ֹ����������������
		$("#cententBox").fadeIn(500);	//fadeIn

	  	/*** �ɶ����»�Ч��*****
	  	$("#cententBox").css({left:tempLeft + "px",top:($(document).scrollTop() - height) +"px"});	//��λ�»���ʾλ��
	  	$("#cententBox").animate({top:tempTop + "px"},"normal"); 				//�»�Ч��	
		//$("#cententBox").animate({top:tempTop + "px"}, { duration: 3000});	//3000����С���ٶ�
		*/
		
		//���õ�һ���ɿص�input�ı�Ԫ�ػ�ý���	
		$("#centent :input").eq(0).focus();
		
		/** �رնԻ��� **/
	 	dialogClose = function(){
	 		$("select").removeAttr("disabled");	 	
			$("#dialogBg").animate({opacity:"0"},"normal",function(){$(this).remove();});	
			
			//�Ի��򵭳�
			$("#cententBox").fadeOut(500,function(){$("#cententBox").remove();});
			
			//iframe�Ƴ�
			$("#iframe_div").fadeOut(500,function(){$("#iframe_div").remove();});
			
		
			//�Ի��򻬳�
			//$("#cententBox").animate({top:($(document).scrollTop()-(height=="auto"?10:parseInt(height)))+"px"},"normal",function(){$(this).remove();}); 
		}
		
		
		//���µĴ��ڡ�
		dialogOpenNew = function(newDivId){
		
			var o1 =  $("#" + newDivId);	//���������
			width = o1.width();		//������߶�
			height = o1.height();
			
			//��ȡ���ڿ�� �߶� 
			 if (window.innerHeight){
				winWidth = window.innerWidth;  
				winHeight = window.innerHeight; 
			 }else if ((document.body) && (document.body.clientHeight)){
				winWidth = document.body.clientWidth;   
				winHeight = document.body.clientHeight;
			 }   
			
			//ͨ������Document�ڲ���body���м�⣬��ȡ���ڴ�С  $.browser.msie ��֤��ie
			 if ($.browser.msie && document.documentElement && document.documentElement.clientHeight && document.documentElement.clientWidth){  
				winWidth = document.documentElement.clientWidth;  
				winHeight = document.documentElement.clientHeight;  
			 }
			
		  	tempLeft = $(document).scrollLeft() + parseInt((winWidth - width) / 2);		  			
		  	tempTop = $(document).scrollTop() +  parseInt((winHeight - height) / 2);
		  	
			temp_float = '<iframe id="iframeBg" style="z-index: 10004; border-bottom: medium none; position: absolute; filter: alpha(opacity=0); BORDER-LEFT: medium none; padding-bottom: 0px; margin: 0px; padding-left: 0px; width: '+ width +'; padding-right: 0px; zoom: 1; height: ' + height + '; border-top: medium none; top: ' + tempTop + 'px; border-right: medium none; padding-top: 0px; left: '+ tempLeft +'px;"/>';
			//������ס�������iframe
			$("#iframe_div").html(temp_float);
			temp_float = "<div id=\"centent\" style=\"z-index: 10011;\"></div>";
			$("#cententBox").html(temp_float);
			$("#centent").html(o1.html());
			
			$("#cententBox").css({width:width,height:height,position:"absolute"});  //ȥ������
			$("#cententBox select").removeAttr("disabled");	//��ֹ����������������
			
		  	
			
			/** ֱ����ʾ  **	*/
			$("#cententBox").css({display:"none",left:tempLeft + "px",top:tempTop + "px"});	//��λֱ����ʾλ��
			$("#cententBox").fadeIn(500);	//fadeIn
			
			$("#centent :input").eq(0).focus();
			
			
		}
		
	}