	
				
	//var email = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
	var email = /^[_a-zA-Z0-9\-\.]+@([\-_a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,3}$/;
	
	/**弹出登录框*/
	function showModeWindow(type){
		if(type == undefined){
			dialogOpen("loginWin");
		}else if(type == "0"){
			dialogOpenNew("loginWin");
		}else if(type == "1"){
			dialogOpenNew("registerWin");
		
			InitCitySelect_P("areaprovince","areacity","cententBox");	//所在地区
			inityear($("#cententBox #dateyear"));
			initmonth($("#cententBox #datemonth"));
			
		}else if(type == "2"){
			dialogOpen("registerWin");
			InitCitySelect_P("areaprovince","areacity","cententBox");	//所在地区
			inityear($("#cententBox #dateyear"));
			initmonth($("#cententBox #datemonth"));
		}
	}
	
	
	
	/** 登录 */
	function doLogin(){
		var email = $("#cententBox #login_email").val();
		var pwd = $("#cententBox #login_password").val();
		if($.trim(email) == ""){
			alert("请输入邮箱！");
			$("#cententBox #login_email").focus();
			return;
		}
		if($.trim(pwd) == ""){
			alert("请输入密码！");
			$("#cententBox #login_password").focus();
			return;
		}		
		$.ajax({
			type: "GET",
	        url: pathStr + "/webLoginAction.do",
	        data: "hyemail="+email+"&password="+pwd,
	        dataType: "text",
	        success: function(msg){
	        	/* msg：[ 0：登陆成功 | 1：用户名或密码错误 | 2：系统异常 ] */
	        	if(msg == "0"){
	        		window.location.reload();
	        	}else if(msg == "1"){
					alert("用户名或密码错误!请重新登陆");
				}else if(msg == "2"){
					alert("系统异常！请与管理员联系");
				}
	 		}
		});
	}
	
	//注册
	function register(){
		location = "<%=request.getContextPath()%>/jyweb/register/peopleInfo.jsp";
	}
	
	//加回车事件
	function enter(event){
		e = event ? event :(window.event ? window.event : null);
		if(e.keyCode==13){			
			if($("#cententBox #login_email").val() != null){
				doLogin();
			}		 		
		}
	}
	
	
	

	//注册表单验证
	function regForm_new(objForm){
	
	
	 	for(var i=0;i<email.length;i++){   
	 	   strCode=email.charCodeAt(i);   
	 	   if((strCode>65248)||(strCode==12288)){   
	 	             alert("【注册邮箱】含全角字符，请切换输入法，输入半角字符");
	 	             objForm.hyemail.focus();
	 	           return false;
	 	   } 
	 	}  
	 	
		if (email == "" || (!email.match(email))){
			alert("【注册邮箱】不能为空或格式不符合规范\n");
			objForm.hyemail.focus();
			return false;
		}
	
		if (password == "" || (password.length < 6 || password.length > 20)){
			alert("【聚缘密码】不能为空或长度不符合规范\n");
			objForm.password.focus();
			return false;
		}
	
		if (objForm.password.value != objForm.repassword.value){
			alert("【确认密码】与密码不一致\n");
			objForm.repassword.focus();
			return false;
		}
	
		if (nickname == "" || (nickname.trim().ByteCount()<2 || nickname.trim().ByteCount()>12))
		{
			alert("【会员昵称】不能为空或格式不符合规范\n");
			objForm.nc.focus();
			return false;
		}
	
		if(!document.getElementById("readme").checked){
			//regreadmeinfo.className="show err xianding";
			//regreadmeinfo.innerHTML="必须同意本条款才能注册";
			alert("您必须同意【聚缘会员服务条款】才能完成注册\n");
			return false;
		}
	
		return true;
	}
	
	/** 注册邮箱失去焦点验证 */
	var emailBlur = function(o){
		var mail = o.value;
		var msg = initOjb(o);
		msg.addClass("msg_f");
	 	
		if($.trim(mail) == ""){
			msg.html("邮箱不能为空！");
			return false;
		}
		
	}

	/** 注册邮箱改变值时验证*/
	var emailChange = function(o){
		var mail = o.value;
		var msg = initOjb(o);
		msg.addClass("msg_f");
	 	
		if(!email.test(mail)){
			msg.html("邮箱格式错误！");
			return false;
		}
				
		/** 验证是否被使用 */
		 msg.html("正在检测是否可用...");
	 	 $.ajax({
		        type: "GET",
		        url: pathStr + "/regAjaxAction.do",
		        data: "method=check&regmail="+ mail,
		        dataType: "html",
		        success: function(state){
		        	if(state == '0'){
		        		msg.html("已被使用,请使用其他邮箱注册！");
		        		 msg.addClass("msg_f");
					  	o.focus(); 
		        	}
		        	if(state == '1'){
		        		msg.html("邮箱可以使用！");
	 					msg.addClass("msg_s");
	 					msg.removeClass("msg_f");
		        	}
		        	if(state == '2'){
					  	msg.html("检测失败,服务器错误");
		 				msg.addClass("msg_f");
					  	o.focus(); 
		        	}
	 				
				},
				error:function(){
					msg.html("检测失败,服务器错误");
		 			 msg.addClass("msg_f");
					o.focus(); 
				}
				
		});
		
		
	}

	/** 验证密码 */
	var checkpassword = function(o){
		var pwd = $.trim(o.value);
		var msg = initOjb(o);
		if(pwd == ""){
			msg.html("密码不能为空！");
			msg.addClass("msg_f");
			return false;
		}
		
		if(pwd.length < 6 ||pwd.length > 20){
			msg.html("长度不符合密码范围！");
			msg.addClass("msg_f");
			return false;
		}
		
		//用[\u4e00-\u9fa5] 只能验证汉字，而对中文字符没办法。而[\u0391-\uFFE5]则可以，如:！￥……——
		if(/.*[\u0391-\uFFE5]+.*$/.test(pwd)){
            msg.html("密码不能含有中文字符");
			msg.addClass("msg_f");
			return false;            
        }
	 	
		
		msg.html("密码可以使用！");
	 	msg.addClass("msg_s");

	}
	
	/** 验证重复密码 */
	var checkpassword_r = function(o){
		var msg = initOjb(o);
	 	 
		if($.trim(o.value) == ""){
			msg.html("重复密码不能为空！");
			msg.addClass("msg_f");
			return false;
		}
		
		if($.trim($("#cententBox #password").val()) != $.trim(o.value)){
			msg.html("重复密码有误！");
			msg.addClass("msg_f");
			return false;
		}
		msg.html("重复密码正确！");
	 	msg.addClass("msg_s");
	  
	}
	
	/** 验证昵称 */
	var checknechen = function(o){
		var msg = initOjb(o);
	 	
		if($.trim(o.value) == ""){
			msg.html("昵称不能为空！");
			msg.addClass("msg_f");
			return false;
		}
		
		if($.trim(o.value).ByteCount() < 2 ||$.trim(o.value).ByteCount() > 12){
			msg.html("长度不符合昵称范围！");
			msg.addClass("msg_f");
			return false;
		}
		msg.html("昵称可以使用！");
	 	msg.addClass("msg_s");
	}
	
	//选择框的的change事件
	var checkselect = function(o){
			//alert(o.id);
			if(o.value == ""){
				setMsg(o.id);
			}else{
				$("#cententBox #msg_" + o.id).removeClass("msg_f");
				$("#cententBox #msg_" + o.id).html("");
			}
			
	}
	
	/*** 注册form提交 */
	var sub_from = function(){
	
		//判断是否有空项
		var count = 0;
		$("#cententBox :input").each(function(){
			var o = $(this);
			var id = o.attr("id");
			var val = o.attr("value");
			if(id != "" && val == ""){
				if(!setMsg(id)){
					o.focus();
					count = count + 1;
					return false;
				};
			}
		});
		
		//如果有空，就停止提交
		if( count >0 ) return false;
		
		//数据独白是否有空值
		if($("#cententBox #innmonologue").attr("class").indexOf("selected") > -1 ){
			$("#cententBox #msg_innmonologue").addClass("msg_f");	
			$("#cententBox #msg_innmonologue").html("内心独白不能为空！");
			return false;
		}
		
		//检测两次输入出密码是否一致
		if($.trim($("#cententBox #password").val()) != $.trim($("#cententBox #password_r").val())){
			$("#cententBox #msg_password_r").removeClass("msg_s");
			$("#cententBox #msg_password_r").addClass("msg_f");
			$("#cententBox #msg_password_r").html("重复密码有误！");
			$("#cententBox #password_r").focus();
			return false;
		}
		
		//检测页面是否还有以class为msg_f的标记（红色错误）。如果有就停止提交
		var msg = $("#cententBox .msg_f");
		if(msg.size() > 0){
			msg.each(function(){
				//alert($(this).attr("id"));
				var id = $(this).attr("id").substring(4);
				$("#cententBox #" + id).focus();
				return;
			});
			return false;
		}
		
		if(!$("#cententBox #ok_chk").attr("checked")){
			alert("抱歉，您未阅读或不同意聚缘网服务条款，不能注册为聚缘网会员！");
			return false;
		}
	
		/**  ajax 提交注册表单 */
       $("#cententBox #registerForm").ajaxSubmit({ 
							url:pathStr + "/regAjaxAction.do?method=add",
	       					beforeSubmit:  function(formData, jqForm, options){
								//	alert("添加数据.....");	           
								//	alert(formData);	           
							},
	       					dataType: 'text',
	        				success:  function(responseText, statusText)  {
								if(responseText == "0"){
									alert("恭喜您! 注册成功!");
									window.location.reload();
								}else if(responseText == "1"){
									alert("恭喜您!注册成功! \n\r\n\r提醒:您的注册邮箱不真实,以至发送邮件失败!");
									window.location.reload();
								}else if(responseText == "2"){
									var o = $("#cententBox #regmail")[0];
									var msg = initOjb(o);
									msg.html("已被使用,请使用其他邮箱注册！");
					        		msg.addClass("msg_f");
								  	o.focus();
								}else{
									alert("注册失败,服务器发生错误!");
								}
							},
		        			error:function(){
	        					alert("注册失败,提交数据发生错误!");
	        				}
        				});
       
	}
	
	/** 设置错误消息 */
	var setMsg = function(id){
		var mg = $("#cententBox #msg_" + id);
		if(id == "regmail"){
			mg.addClass("msg_f");
			mg.html("邮箱不能为空！");
			return false;
		}
				
		if(id == "password"){
			mg.addClass("msg_f");
			mg.html("密码不能为空！");
			return false;
		}
		if(id == "password_r"){
			mg.addClass("msg_f");
			mg.html("重复密码不能为空！");
			return false;
		}
		if(id == "nechen"){
			mg.addClass("msg_f");
			mg.html("昵称不能为空！");
			return false;
		}
		if(id == "dateyear"){
			mg.addClass("msg_f");
			mg.html("请选择年！");
			return false;
		}
		if(id == "datemonth"){
			mg.addClass("msg_f");
			mg.html("请选择月！");
			return false;
		}
		if(id == "dateday"){
			mg.addClass("msg_f");
			mg.html("请选择日！");
			return false;
		}
		if(id == "areaprovince"){
			mg.addClass("msg_f");
			mg.html("请选择省！");
			return false;
		}
		if(id == "areacity"){
			mg.addClass("msg_f");
			mg.html("请选择市！");
			return false;
		}
		if(id == "marstatus"){
			mg.addClass("msg_f");
			mg.html("请选择婚姻状况！");
			return false;
		}
		if(id == "education"){
			mg.addClass("msg_f");
			mg.html("请选择学历！");
			return false;
		}
		if(id == "monthly"){
			mg.addClass("msg_f");
			mg.html("请选择月薪！");
			return false;
		}
	
		return true;	
	}
	
	//内心独白失去焦点
	var selectBlur = function(o){
	    var mg = initOjb(o);
		if($(o).val() == ""){
	          $(o).val("(30到500字符之间)");
	          $(o).addClass("selected");	          
	          mg.addClass("msg_f");
			  mg.html("内心独白不能为空！");
			  
	    }else if($.trim(o.value).length < 30 || $.trim(o.value).length > 500){
	          mg.addClass("msg_f");
			  mg.html("内心独白输入不符合范围：30到500字符之间!"); // 上的判断将length换成.ByteCount()就可判断中英文（1个汉字为2个字符）
			  o.focus();
	    }else{
	    	mg.html("");
	    }
	}
	
	//内心独白得到焦点
	var selectFocus = function(o){
		if($(o).attr("class").indexOf("selected") > -1 ){
	         	$(o).val("");
	         	$(o).removeClass("selected");
	    }
	}
	    
		
	//初始消息对象。
	var initOjb = function(o){
		var msg = $("#cententBox #msg_" + o.id);
		msg.removeClass("msg_s");
	 	msg.removeClass("msg_f");
	 	return msg;
	}

	//记数字符串的的长度。
	String.prototype.ByteCount = function(){
		txt = this.replace(/(<.*?>)/ig,"");
		txt = txt.replace(/([\u0391-\uFFE5])/ig, "11");
		var count = txt.length;
		return count;
	}
