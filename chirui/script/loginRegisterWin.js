	
				
	//var email = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
	var email = /^[_a-zA-Z0-9\-\.]+@([\-_a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,3}$/;
	
	/**������¼��*/
	function showModeWindow(type){
		if(type == undefined){
			dialogOpen("loginWin");
		}else if(type == "0"){
			dialogOpenNew("loginWin");
		}else if(type == "1"){
			dialogOpenNew("registerWin");
		
			InitCitySelect_P("areaprovince","areacity","cententBox");	//���ڵ���
			inityear($("#cententBox #dateyear"));
			initmonth($("#cententBox #datemonth"));
			
		}else if(type == "2"){
			dialogOpen("registerWin");
			InitCitySelect_P("areaprovince","areacity","cententBox");	//���ڵ���
			inityear($("#cententBox #dateyear"));
			initmonth($("#cententBox #datemonth"));
		}
	}
	
	
	
	/** ��¼ */
	function doLogin(){
		var email = $("#cententBox #login_email").val();
		var pwd = $("#cententBox #login_password").val();
		if($.trim(email) == ""){
			alert("���������䣡");
			$("#cententBox #login_email").focus();
			return;
		}
		if($.trim(pwd) == ""){
			alert("���������룡");
			$("#cententBox #login_password").focus();
			return;
		}		
		$.ajax({
			type: "GET",
	        url: pathStr + "/webLoginAction.do",
	        data: "hyemail="+email+"&password="+pwd,
	        dataType: "text",
	        success: function(msg){
	        	/* msg��[ 0����½�ɹ� | 1���û������������ | 2��ϵͳ�쳣 ] */
	        	if(msg == "0"){
	        		window.location.reload();
	        	}else if(msg == "1"){
					alert("�û������������!�����µ�½");
				}else if(msg == "2"){
					alert("ϵͳ�쳣���������Ա��ϵ");
				}
	 		}
		});
	}
	
	//ע��
	function register(){
		location = "<%=request.getContextPath()%>/jyweb/register/peopleInfo.jsp";
	}
	
	//�ӻس��¼�
	function enter(event){
		e = event ? event :(window.event ? window.event : null);
		if(e.keyCode==13){			
			if($("#cententBox #login_email").val() != null){
				doLogin();
			}		 		
		}
	}
	
	
	

	//ע�����֤
	function regForm_new(objForm){
	
	
	 	for(var i=0;i<email.length;i++){   
	 	   strCode=email.charCodeAt(i);   
	 	   if((strCode>65248)||(strCode==12288)){   
	 	             alert("��ע�����䡿��ȫ���ַ������л����뷨���������ַ�");
	 	             objForm.hyemail.focus();
	 	           return false;
	 	   } 
	 	}  
	 	
		if (email == "" || (!email.match(email))){
			alert("��ע�����䡿����Ϊ�ջ��ʽ�����Ϲ淶\n");
			objForm.hyemail.focus();
			return false;
		}
	
		if (password == "" || (password.length < 6 || password.length > 20)){
			alert("����Ե���롿����Ϊ�ջ򳤶Ȳ����Ϲ淶\n");
			objForm.password.focus();
			return false;
		}
	
		if (objForm.password.value != objForm.repassword.value){
			alert("��ȷ�����롿�����벻һ��\n");
			objForm.repassword.focus();
			return false;
		}
	
		if (nickname == "" || (nickname.trim().ByteCount()<2 || nickname.trim().ByteCount()>12))
		{
			alert("����Ա�ǳơ�����Ϊ�ջ��ʽ�����Ϲ淶\n");
			objForm.nc.focus();
			return false;
		}
	
		if(!document.getElementById("readme").checked){
			//regreadmeinfo.className="show err xianding";
			//regreadmeinfo.innerHTML="����ͬ�Ȿ�������ע��";
			alert("������ͬ�⡾��Ե��Ա��������������ע��\n");
			return false;
		}
	
		return true;
	}
	
	/** ע������ʧȥ������֤ */
	var emailBlur = function(o){
		var mail = o.value;
		var msg = initOjb(o);
		msg.addClass("msg_f");
	 	
		if($.trim(mail) == ""){
			msg.html("���䲻��Ϊ�գ�");
			return false;
		}
		
	}

	/** ע������ı�ֵʱ��֤*/
	var emailChange = function(o){
		var mail = o.value;
		var msg = initOjb(o);
		msg.addClass("msg_f");
	 	
		if(!email.test(mail)){
			msg.html("�����ʽ����");
			return false;
		}
				
		/** ��֤�Ƿ�ʹ�� */
		 msg.html("���ڼ���Ƿ����...");
	 	 $.ajax({
		        type: "GET",
		        url: pathStr + "/regAjaxAction.do",
		        data: "method=check&regmail="+ mail,
		        dataType: "html",
		        success: function(state){
		        	if(state == '0'){
		        		msg.html("�ѱ�ʹ��,��ʹ����������ע�ᣡ");
		        		 msg.addClass("msg_f");
					  	o.focus(); 
		        	}
		        	if(state == '1'){
		        		msg.html("�������ʹ�ã�");
	 					msg.addClass("msg_s");
	 					msg.removeClass("msg_f");
		        	}
		        	if(state == '2'){
					  	msg.html("���ʧ��,����������");
		 				msg.addClass("msg_f");
					  	o.focus(); 
		        	}
	 				
				},
				error:function(){
					msg.html("���ʧ��,����������");
		 			 msg.addClass("msg_f");
					o.focus(); 
				}
				
		});
		
		
	}

	/** ��֤���� */
	var checkpassword = function(o){
		var pwd = $.trim(o.value);
		var msg = initOjb(o);
		if(pwd == ""){
			msg.html("���벻��Ϊ�գ�");
			msg.addClass("msg_f");
			return false;
		}
		
		if(pwd.length < 6 ||pwd.length > 20){
			msg.html("���Ȳ��������뷶Χ��");
			msg.addClass("msg_f");
			return false;
		}
		
		//��[\u4e00-\u9fa5] ֻ����֤���֣����������ַ�û�취����[\u0391-\uFFE5]����ԣ���:������������
		if(/.*[\u0391-\uFFE5]+.*$/.test(pwd)){
            msg.html("���벻�ܺ��������ַ�");
			msg.addClass("msg_f");
			return false;            
        }
	 	
		
		msg.html("�������ʹ�ã�");
	 	msg.addClass("msg_s");

	}
	
	/** ��֤�ظ����� */
	var checkpassword_r = function(o){
		var msg = initOjb(o);
	 	 
		if($.trim(o.value) == ""){
			msg.html("�ظ����벻��Ϊ�գ�");
			msg.addClass("msg_f");
			return false;
		}
		
		if($.trim($("#cententBox #password").val()) != $.trim(o.value)){
			msg.html("�ظ���������");
			msg.addClass("msg_f");
			return false;
		}
		msg.html("�ظ�������ȷ��");
	 	msg.addClass("msg_s");
	  
	}
	
	/** ��֤�ǳ� */
	var checknechen = function(o){
		var msg = initOjb(o);
	 	
		if($.trim(o.value) == ""){
			msg.html("�ǳƲ���Ϊ�գ�");
			msg.addClass("msg_f");
			return false;
		}
		
		if($.trim(o.value).ByteCount() < 2 ||$.trim(o.value).ByteCount() > 12){
			msg.html("���Ȳ������ǳƷ�Χ��");
			msg.addClass("msg_f");
			return false;
		}
		msg.html("�ǳƿ���ʹ�ã�");
	 	msg.addClass("msg_s");
	}
	
	//ѡ���ĵ�change�¼�
	var checkselect = function(o){
			//alert(o.id);
			if(o.value == ""){
				setMsg(o.id);
			}else{
				$("#cententBox #msg_" + o.id).removeClass("msg_f");
				$("#cententBox #msg_" + o.id).html("");
			}
			
	}
	
	/*** ע��form�ύ */
	var sub_from = function(){
	
		//�ж��Ƿ��п���
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
		
		//����пգ���ֹͣ�ύ
		if( count >0 ) return false;
		
		//���ݶ����Ƿ��п�ֵ
		if($("#cententBox #innmonologue").attr("class").indexOf("selected") > -1 ){
			$("#cententBox #msg_innmonologue").addClass("msg_f");	
			$("#cententBox #msg_innmonologue").html("���Ķ��ײ���Ϊ�գ�");
			return false;
		}
		
		//�����������������Ƿ�һ��
		if($.trim($("#cententBox #password").val()) != $.trim($("#cententBox #password_r").val())){
			$("#cententBox #msg_password_r").removeClass("msg_s");
			$("#cententBox #msg_password_r").addClass("msg_f");
			$("#cententBox #msg_password_r").html("�ظ���������");
			$("#cententBox #password_r").focus();
			return false;
		}
		
		//���ҳ���Ƿ�����classΪmsg_f�ı�ǣ���ɫ���󣩡�����о�ֹͣ�ύ
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
			alert("��Ǹ����δ�Ķ���ͬ���Ե�������������ע��Ϊ��Ե����Ա��");
			return false;
		}
	
		/**  ajax �ύע��� */
       $("#cententBox #registerForm").ajaxSubmit({ 
							url:pathStr + "/regAjaxAction.do?method=add",
	       					beforeSubmit:  function(formData, jqForm, options){
								//	alert("�������.....");	           
								//	alert(formData);	           
							},
	       					dataType: 'text',
	        				success:  function(responseText, statusText)  {
								if(responseText == "0"){
									alert("��ϲ��! ע��ɹ�!");
									window.location.reload();
								}else if(responseText == "1"){
									alert("��ϲ��!ע��ɹ�! \n\r\n\r����:����ע�����䲻��ʵ,���������ʼ�ʧ��!");
									window.location.reload();
								}else if(responseText == "2"){
									var o = $("#cententBox #regmail")[0];
									var msg = initOjb(o);
									msg.html("�ѱ�ʹ��,��ʹ����������ע�ᣡ");
					        		msg.addClass("msg_f");
								  	o.focus();
								}else{
									alert("ע��ʧ��,��������������!");
								}
							},
		        			error:function(){
	        					alert("ע��ʧ��,�ύ���ݷ�������!");
	        				}
        				});
       
	}
	
	/** ���ô�����Ϣ */
	var setMsg = function(id){
		var mg = $("#cententBox #msg_" + id);
		if(id == "regmail"){
			mg.addClass("msg_f");
			mg.html("���䲻��Ϊ�գ�");
			return false;
		}
				
		if(id == "password"){
			mg.addClass("msg_f");
			mg.html("���벻��Ϊ�գ�");
			return false;
		}
		if(id == "password_r"){
			mg.addClass("msg_f");
			mg.html("�ظ����벻��Ϊ�գ�");
			return false;
		}
		if(id == "nechen"){
			mg.addClass("msg_f");
			mg.html("�ǳƲ���Ϊ�գ�");
			return false;
		}
		if(id == "dateyear"){
			mg.addClass("msg_f");
			mg.html("��ѡ���꣡");
			return false;
		}
		if(id == "datemonth"){
			mg.addClass("msg_f");
			mg.html("��ѡ���£�");
			return false;
		}
		if(id == "dateday"){
			mg.addClass("msg_f");
			mg.html("��ѡ���գ�");
			return false;
		}
		if(id == "areaprovince"){
			mg.addClass("msg_f");
			mg.html("��ѡ��ʡ��");
			return false;
		}
		if(id == "areacity"){
			mg.addClass("msg_f");
			mg.html("��ѡ���У�");
			return false;
		}
		if(id == "marstatus"){
			mg.addClass("msg_f");
			mg.html("��ѡ�����״����");
			return false;
		}
		if(id == "education"){
			mg.addClass("msg_f");
			mg.html("��ѡ��ѧ����");
			return false;
		}
		if(id == "monthly"){
			mg.addClass("msg_f");
			mg.html("��ѡ����н��");
			return false;
		}
	
		return true;	
	}
	
	//���Ķ���ʧȥ����
	var selectBlur = function(o){
	    var mg = initOjb(o);
		if($(o).val() == ""){
	          $(o).val("(30��500�ַ�֮��)");
	          $(o).addClass("selected");	          
	          mg.addClass("msg_f");
			  mg.html("���Ķ��ײ���Ϊ�գ�");
			  
	    }else if($.trim(o.value).length < 30 || $.trim(o.value).length > 500){
	          mg.addClass("msg_f");
			  mg.html("���Ķ������벻���Ϸ�Χ��30��500�ַ�֮��!"); // �ϵ��жϽ�length����.ByteCount()�Ϳ��ж���Ӣ�ģ�1������Ϊ2���ַ���
			  o.focus();
	    }else{
	    	mg.html("");
	    }
	}
	
	//���Ķ��׵õ�����
	var selectFocus = function(o){
		if($(o).attr("class").indexOf("selected") > -1 ){
	         	$(o).val("");
	         	$(o).removeClass("selected");
	    }
	}
	    
		
	//��ʼ��Ϣ����
	var initOjb = function(o){
		var msg = $("#cententBox #msg_" + o.id);
		msg.removeClass("msg_s");
	 	msg.removeClass("msg_f");
	 	return msg;
	}

	//�����ַ����ĵĳ��ȡ�
	String.prototype.ByteCount = function(){
		txt = this.replace(/(<.*?>)/ig,"");
		txt = txt.replace(/([\u0391-\uFFE5])/ig, "11");
		var count = txt.length;
		return count;
	}
