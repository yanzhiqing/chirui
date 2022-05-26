		///复选框
		function RZchose(){
    		if(document.all["keys"].length > 0){
               	if(document.all["delkeys"].checked==true){
	  				for(i=0;i<document.all["keys"].length;i++){
	    				document.all["keys"][i].checked=true;
	  				}
               	}else{
	  				for(i=0;i<document.all["keys"].length;i++){
	    				document.all["keys"][i].checked=false;
	  				}
               	}
    		}else{
               	if(document.all["delkeys"].checked==true){
  					document.all["keys"].checked=true;
               	}else{
  					document.all["keys"].checked=false;
               	}
    		}
        }
        ///邮件、秋波删除
        function DelMaildd(state){
  		    var keys = document.all["keys"];
			var checkedkeys = "";
			var num = 0;
			var flag = 0;

			for(var i=0;i<keys.length;i++){
				if(keys[i].checked==true){
					checkedkeys = checkedkeys + keys[i].value + ",";
					
				}
			}
			// 一个选项的时候
			if (keys[0]==undefined){
				if(keys.checked==true){
					var key = document.all["keys"].value;
					delBackWindow(key,'0',state);
				}else{
					alert("至少选择一个删除对象--!");
					return false;
				}
			}
			// 多个选项的时候
			else if (keys[0]!=undefined){
				while(num<keys.length){
					if(keys[num++].checked == true){
						delBackWindow(checkedkeys,'0',state);
						flag++;
					}
				}
				if(flag==0){
					alert("至少选择一个删除对象++!");
					return false;
				}
			}
			
		}
		
		
		///删除
		function RZdel(){
		    var num = 0;
			for(var i=0;i<document.all["keys"].length;i++){
				if(document.all["keys"][i].checked==true){
					num++;
				}
				
			}
		
			//当长度大于1时 keys 是一个数组，等于1是keys不是数组
			if(num==0 && document.all["keys"].checked==true) {
				num++;
			}
		
			if(num==0){
			    alert("删除时必须选中一个!");
				return false;
			}
			else {
			    if(confirm("你真的要删除吗？")) {
				    document.all["actionType"].value="8";
					document.splitForm.submit();
					
		            return true;
				}
				else {
				    return false;
				}
			}
		}
		
		///信息隐藏处理
		function Change_Dispaly(obj_id){
			var Display = document.all[obj_id].style.display;
			document.all[obj_id].style.display= (Display=='none')?'':'none'
		}
		
		///详细资料 参数：URL、被浏览人ID
		function MemberInfo(url,memberInfo){
			var url = url + "/membernfoAction.do?actionType=3&key="+memberInfo;
			window.open(url);
		}
		
		///写信 参数：URL、收信人昵称、ID、性别
 		function WriteMail(url,nichen,id,sex){
 			window.location.href = url +"/jyweb/loveinfo/mymail/mailwrite.jsp?id="+ id +"&nichen="+ nichen +"&sex="+ sex;
 		}
 		
		///真修改假删除 参数：不同页面的状态值
		function RZdelete(state){
			var keys = document.all["keys"];
			var num = 0;
		
			// 一个选项的时候
			if (keys[0]==undefined){
				if(keys.checked==true){
					if(confirm("你真的要删除吗？")) {
						document.all["actionType"].value="5";
						document.all["state"].value=state;
						///document.splitForm.action="/jyxt/jyweb/loveinfo/back.jsp";
						document.splitForm.submit();
						return true;
					}
				}else{
					alert("删除时必须选中一个!");
					return false;
				}
			}
			// 多个选项的时候
			else if (keys[0]!=undefined){
				while(num<keys.length){
					if(keys[num++].checked == true){
						if(confirm("你真的要删除吗？")) {
							document.all["actionType"].value="5";
							document.all["state"].value=state;
							///document.splitForm.action="/jyxt/jyweb/loveinfo/back.jsp";
							document.splitForm.submit();
							return true;
						}
					}
				}
					alert("删除时必须选中一个!");
					return false;
			}
		}
		
		///删除单个邮件 参数：不同页面的状态值
		function DelMail(key,state){
		///alert(key+"==="+state);
			delBackWindow(key,'0',state);
			///if(confirm("你真的要删除吗？")) {
			///	document.all["actionType"].value="5";
			///	document.all["state"].value=state;
			///	document.splitForm.submit();
			///	return true;
			///}
		}
		
		
		/****** --ajax 李小鹏 2008-02-09 ************************************/
		var mailid;///会员ID
		var nichen;///昵称
		
		var xmlHttp;
		function creatXMLHttpRequest() {
			if (window.ActiveXObject) {
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			else if (window.XMLHttpRequest) {
				xmlHttp = new XMLHttpRequest();
			}
		}
		
		/**-- 更改关注状态 参数 登录会员ID -- */
		function UpdataAttentionState(url,memberInfoID){
			creatXMLHttpRequest();
			var url = url+"/servlet/updataAttentionState?memberInfoid=" + memberInfoID;
			xmlHttp.open("GET",url,true);
			xmlHttp.send(null);
		}
		
		/**-- 更改秋波阅读状态  参数 登录会员ID --*/
		function UpdataReadState(url,memberInfoID){
			creatXMLHttpRequest();
			var url = url +"/servlet/updataReadState?memberInfoid=" + memberInfoID;
			xmlHttp.open("GET",url,true);
			xmlHttp.send(null);
		}
		
		/**-- 增加人气值  参数 被操作会员ID、不同操作状态值（0：24小时内登录一次加人气值5；1：收到邮件1封加人气值99；2：收到一个秋波加人气值69；3：被加为关注一次加人气值49；4：被浏览一次加人气值19.） --*/
		function AddPopularity(url,memberInfoID,state){
			creatXMLHttpRequest();
			var url = url +"/servlet/addPopularity?memberInfoid=" + memberInfoID + "&state=" + state;
			xmlHttp.open("GET",url,true);
			xmlHttp.send(null);
		}
		
		/**-- 加为关注 参数 URL、关注人ID、被关注人ID、关注人性别、被关注人性别、被关注人昵称 --*/
		function AddAttention(url,myattentionid,byattentionid,mysex,bysex,nechen){
			nichen = nechen;
			mailid = byattentionid;
			if(mysex==bysex){
 				showBackWindow(nichen,6);///加为关注失败
 			}else{
				AddPopularity(url,byattentionid,3); ///增加人气值
			
				creatXMLHttpRequest();
				
				var url = url+"/servlet/addAttention?myattentionid=" + myattentionid + "&byattentionid=" + byattentionid;
				xmlHttp.open("GET",url,true);
				xmlHttp.onreadystatechange = callbackitem;
				xmlHttp.send(null);
			}
			
		}
		
		function callbackitem(){
			if (xmlHttp.readyState == 4) {
				if (xmlHttp.status == 200) {
					if(xmlHttp.responseXML.getElementsByTagName("ISNULL")[0].firstChild.data == "1"){
						showBackWindow(nichen,6);///加为关注失败
					}else if(xmlHttp.responseXML.getElementsByTagName("ISNULL")[0].firstChild.data == "0"){
						showBackWindow(nichen,5);///加为关注成功
					}
				}else if (xmlHttp.status == 204) {
					
				}
			}
		}
		/**-- 加为关注 --*/
		
		/**-- 回复秋波 参数 URL、发秋波人ID、接受秋波人ID、发秋波人性别、接收秋波人性别、接收秋波人昵称 --*/
		function WriteLeer(url,myleerid,byleerid,mysex,bysex,nechen){
			mailid = byleerid;
			nichen = nechen;
			
			if(mysex==bysex){
				showBackWindow(nichen,4);///发送秋波失败
			}else{
				AddPopularity(url,byleerid,2); ///增加人气值
	 			
	 			creatXMLHttpRequest();
				var url = url+"/servlet/writeLeer?myleerid=" + myleerid + "&byleerid=" + mailid;
				xmlHttp.open("GET",url,true);
				xmlHttp.onreadystatechange = callbackitem2;
				xmlHttp.send(null);
			}
 		}
 		
 		function callbackitem2(){
			if (xmlHttp.readyState == 4) {
				if (xmlHttp.status == 200) {
					if(xmlHttp.responseXML.getElementsByTagName("ISNULL")[0].firstChild.data == "0"){
						showBackWindow(nichen,3);///发送秋波成功
					}else if(xmlHttp.responseXML.getElementsByTagName("ISNULL")[0].firstChild.data != "0"){
						showBackWindow(nichen,4);///发送秋波失败
					}
				}else if (xmlHttp.status == 204) {
					
				}
			}
		}
 		/**-- 回复秋波 --*/
 		
 		/**-- 发邮件 参数 url、接受邮件人ID、邮件标题、邮件内容、发邮件人性别、接收邮件人性别、接收邮件人昵称 --*/
		function WriteMails(url,bymailid,mailtitles,mailcontents,mysex,bysex,nechen){
			nichen = nechen;
			mailid = bymailid;
			var mailtitle = document.all[mailtitles].value;
			var mailcontent = document.all[mailcontents].value;
			
			if(mysex==bysex){
 				showBackWindow(nichen,2);///发送邮件失败
 			}else{
				AddPopularity(url,bymailid,1); ///增加人气值
	 				 			
	 			creatXMLHttpRequest();
				var url =  url + "/servlet/writeMail?bymailid=" + bymailid + "&mailtitle=" + mailtitle + "&mailcontent=" + mailcontent;
				
				xmlHttp.onreadystatechange = callbackitem5;
				xmlHttp.open("GET",url,true);
				xmlHttp.send(null);
			}
 		}
 		
 		function callbackitem5(){
 			if (xmlHttp.readyState == 4) {
				if (xmlHttp.status == 200) {
					if(xmlHttp.responseXML.getElementsByTagName("ISNULL")[0].firstChild.data == "0"){
						showBackWindow(nichen,1);///发送邮件成功
					}else if(xmlHttp.responseXML.getElementsByTagName("ISNULL")[0].firstChild.data != "0"){
						showBackWindow(nichen,2);///发送邮件失败
					}
				}else if (xmlHttp.status == 204) {
					
				}
			}
		}
 		/**-- 发邮件 --*/
 		
		/**-- 更改浏览状态 参数 浏览人ID --*/
		function UpdataSkimState(url,memberInfoID){
			creatXMLHttpRequest();
			var url = url+"/servlet/updataSkimState?memberInfoid=" + memberInfoID;
			xmlHttp.open("GET",url,true);
			xmlHttp.send(null);
		}
		
		/**-- 插入会员修改资料信息 参数 URL、会员ID，会员昵称，更改状态，更改内容，更改属性名 --*/
		function InsertLinkmanDynamic(url,memberInfoID,nechen,state,content,propertys){   
			creatXMLHttpRequest();
			
			var url = url+"/servlet/insertLinkmanDynamic?memberInfoid=" + memberInfoID+"&nechen=" +nechen+"&state=" +state+ "&content=" + content+ "&propertys=" + propertys;
			
			removeLinkmanDynamic(memberInfoID,nechen,state,content,propertys);
			
			xmlHttp.open("GET",url,true);
			xmlHttp.send(null);	
		}
		
		/**-- 加为浏览 参数 URL、浏览人ID、被浏览人ID、浏览人性别、被浏览人性别 --*/
		function AddSkim(url,myskimid,byskimid,mysex,bysex){
			if(mysex==bysex){
				removeSkim(myskimid,byskimid,mysex,bysex);
			}else{
				creatXMLHttpRequest();
			
				var url = url+"/servlet/addSkim?myskimid=" + myskimid +"&byskimid=" + byskimid;

				xmlHttp.open("GET",url,true);
				xmlHttp.send(null);
			}
		}
		
		/**-- 发送系统消息 参数 URL、被审核人ID、审核类型、审核状态（0：通过，1：未通过）--*/
		function WriteSysMail(url,byexaminepopid,examinetype,examinestate){
			creatXMLHttpRequest();
			
			var url = url+"/servlet/writeSysMail?byexaminepopid=" + byexaminepopid + "&examinetype=" + examinetype + "&examinestate=" + examinestate;
			xmlHttp.open("GET",url,true);
			xmlHttp.send(null);
			removeSysMail(byexaminepopid,examinetype,examinestate);
		}
		
		/**-- 屏蔽会员 参数 url、登录会员ID、被屏蔽会员ID、被屏蔽会员昵称、被屏蔽会员主键ID --*/
		var onlystate;
		function ShieldMember(url,mymemberid,bymemberid,nechen,memberid,state){
			onlystate = state;
			nichen = nechen;
			creatXMLHttpRequest();
			var url = url+"/servlet/screenMember?mymemberid=" + mymemberid + "&bymemberid=" + bymemberid + "&nechen=" + nechen + "&memberid=" + memberid;
			
			xmlHttp.open("GET",url,true);
			xmlHttp.onreadystatechange = callbackitem3;
			xmlHttp.send(null);
		}
 		function callbackitem3(){
			if (xmlHttp.readyState == 4) {
				if (xmlHttp.status == 200) {
					if(xmlHttp.responseXML.getElementsByTagName("ISNULL")[0].firstChild.data == "0"){
						showBackWindow(nichen,9);///屏蔽会员成功
					}else if(xmlHttp.responseXML.getElementsByTagName("ISNULL")[0].firstChild.data == "1"){
						showBackWindow(nichen,10);///屏蔽会员失败
					}
				}else if (xmlHttp.status == 204) {
					
				}
			}
		}
		
		/**-- 发邮件 参数 url、接受邮件人ID、邮件标题、邮件内容、发邮件人性别、接收邮件人性别、接收邮件人昵称 --*/
		function LookMailWrite(url,bymailid,mailtitles,mailcontents,mysex,bysex,nechen){
			nichen = nechen;
			mailid = bymailid;
			var mailtitle = document.all[mailtitles].value;
			var mailcontent = document.all[mailcontents].value;
			
			if(mysex==bysex){
 				showBackWindow(nichen,8);///发送邮件失败
 			}else{
				AddPopularity(url,bymailid,1); ///增加人气值
	 				 			
	 			creatXMLHttpRequest();
				var url =  url + "/servlet/writeMail?bymailid=" + bymailid + "&mailtitle=" + mailtitle + "&mailcontent=" + mailcontent;
				
				xmlHttp.onreadystatechange = callbackitem8;
				xmlHttp.open("GET",url,true);
				xmlHttp.send(null);
			}
 		}
 		
 		function callbackitem8(){
 			if (xmlHttp.readyState == 4) {
				if (xmlHttp.status == 200) {
					if(xmlHttp.responseXML.getElementsByTagName("ISNULL")[0].firstChild.data == "0"){
						showBackWindow(nichen,7);///发送邮件成功
					}else if(xmlHttp.responseXML.getElementsByTagName("ISNULL")[0].firstChild.data != "0"){
						showBackWindow(nichen,8);///发送邮件失败
					}
				}else if (xmlHttp.status == 204) {
					
				}
			}
		}
 		/**-- 发邮件 --*/
		//清空联系人动态信息  2009-04-10 李小鹏
		function removeLinkmanDynamic(memberInfoID,nechen,state,content,propertys){
			memberInfoID = ""; 
			nechen = ""; 
			state = ""; 
			content = ""; 
			propertys = ""; 
		}
		///清空系统消息信息
		function removeSysMail(byexaminepopid,examinetype,examinestate){
			byexaminepopid = ""; 
			examinetype = ""; 
			examinestate = "";
		}
