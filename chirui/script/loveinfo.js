		///��ѡ��
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
        ///�ʼ����ﲨɾ��
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
			// һ��ѡ���ʱ��
			if (keys[0]==undefined){
				if(keys.checked==true){
					var key = document.all["keys"].value;
					delBackWindow(key,'0',state);
				}else{
					alert("����ѡ��һ��ɾ������--!");
					return false;
				}
			}
			// ���ѡ���ʱ��
			else if (keys[0]!=undefined){
				while(num<keys.length){
					if(keys[num++].checked == true){
						delBackWindow(checkedkeys,'0',state);
						flag++;
					}
				}
				if(flag==0){
					alert("����ѡ��һ��ɾ������++!");
					return false;
				}
			}
			
		}
		
		
		///ɾ��
		function RZdel(){
		    var num = 0;
			for(var i=0;i<document.all["keys"].length;i++){
				if(document.all["keys"][i].checked==true){
					num++;
				}
				
			}
		
			//�����ȴ���1ʱ keys ��һ�����飬����1��keys��������
			if(num==0 && document.all["keys"].checked==true) {
				num++;
			}
		
			if(num==0){
			    alert("ɾ��ʱ����ѡ��һ��!");
				return false;
			}
			else {
			    if(confirm("�����Ҫɾ����")) {
				    document.all["actionType"].value="8";
					document.splitForm.submit();
					
		            return true;
				}
				else {
				    return false;
				}
			}
		}
		
		///��Ϣ���ش���
		function Change_Dispaly(obj_id){
			var Display = document.all[obj_id].style.display;
			document.all[obj_id].style.display= (Display=='none')?'':'none'
		}
		
		///��ϸ���� ������URL���������ID
		function MemberInfo(url,memberInfo){
			var url = url + "/membernfoAction.do?actionType=3&key="+memberInfo;
			window.open(url);
		}
		
		///д�� ������URL���������ǳơ�ID���Ա�
 		function WriteMail(url,nichen,id,sex){
 			window.location.href = url +"/jyweb/loveinfo/mymail/mailwrite.jsp?id="+ id +"&nichen="+ nichen +"&sex="+ sex;
 		}
 		
		///���޸ļ�ɾ�� ��������ͬҳ���״ֵ̬
		function RZdelete(state){
			var keys = document.all["keys"];
			var num = 0;
		
			// һ��ѡ���ʱ��
			if (keys[0]==undefined){
				if(keys.checked==true){
					if(confirm("�����Ҫɾ����")) {
						document.all["actionType"].value="5";
						document.all["state"].value=state;
						///document.splitForm.action="/jyxt/jyweb/loveinfo/back.jsp";
						document.splitForm.submit();
						return true;
					}
				}else{
					alert("ɾ��ʱ����ѡ��һ��!");
					return false;
				}
			}
			// ���ѡ���ʱ��
			else if (keys[0]!=undefined){
				while(num<keys.length){
					if(keys[num++].checked == true){
						if(confirm("�����Ҫɾ����")) {
							document.all["actionType"].value="5";
							document.all["state"].value=state;
							///document.splitForm.action="/jyxt/jyweb/loveinfo/back.jsp";
							document.splitForm.submit();
							return true;
						}
					}
				}
					alert("ɾ��ʱ����ѡ��һ��!");
					return false;
			}
		}
		
		///ɾ�������ʼ� ��������ͬҳ���״ֵ̬
		function DelMail(key,state){
		///alert(key+"==="+state);
			delBackWindow(key,'0',state);
			///if(confirm("�����Ҫɾ����")) {
			///	document.all["actionType"].value="5";
			///	document.all["state"].value=state;
			///	document.splitForm.submit();
			///	return true;
			///}
		}
		
		
		/****** --ajax ��С�� 2008-02-09 ************************************/
		var mailid;///��ԱID
		var nichen;///�ǳ�
		
		var xmlHttp;
		function creatXMLHttpRequest() {
			if (window.ActiveXObject) {
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			else if (window.XMLHttpRequest) {
				xmlHttp = new XMLHttpRequest();
			}
		}
		
		/**-- ���Ĺ�ע״̬ ���� ��¼��ԱID -- */
		function UpdataAttentionState(url,memberInfoID){
			creatXMLHttpRequest();
			var url = url+"/servlet/updataAttentionState?memberInfoid=" + memberInfoID;
			xmlHttp.open("GET",url,true);
			xmlHttp.send(null);
		}
		
		/**-- �����ﲨ�Ķ�״̬  ���� ��¼��ԱID --*/
		function UpdataReadState(url,memberInfoID){
			creatXMLHttpRequest();
			var url = url +"/servlet/updataReadState?memberInfoid=" + memberInfoID;
			xmlHttp.open("GET",url,true);
			xmlHttp.send(null);
		}
		
		/**-- ��������ֵ  ���� ��������ԱID����ͬ����״ֵ̬��0��24Сʱ�ڵ�¼һ�μ�����ֵ5��1���յ��ʼ�1�������ֵ99��2���յ�һ���ﲨ������ֵ69��3������Ϊ��עһ�μ�����ֵ49��4�������һ�μ�����ֵ19.�� --*/
		function AddPopularity(url,memberInfoID,state){
			creatXMLHttpRequest();
			var url = url +"/servlet/addPopularity?memberInfoid=" + memberInfoID + "&state=" + state;
			xmlHttp.open("GET",url,true);
			xmlHttp.send(null);
		}
		
		/**-- ��Ϊ��ע ���� URL����ע��ID������ע��ID����ע���Ա𡢱���ע���Ա𡢱���ע���ǳ� --*/
		function AddAttention(url,myattentionid,byattentionid,mysex,bysex,nechen){
			nichen = nechen;
			mailid = byattentionid;
			if(mysex==bysex){
 				showBackWindow(nichen,6);///��Ϊ��עʧ��
 			}else{
				AddPopularity(url,byattentionid,3); ///��������ֵ
			
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
						showBackWindow(nichen,6);///��Ϊ��עʧ��
					}else if(xmlHttp.responseXML.getElementsByTagName("ISNULL")[0].firstChild.data == "0"){
						showBackWindow(nichen,5);///��Ϊ��ע�ɹ�
					}
				}else if (xmlHttp.status == 204) {
					
				}
			}
		}
		/**-- ��Ϊ��ע --*/
		
		/**-- �ظ��ﲨ ���� URL�����ﲨ��ID�������ﲨ��ID�����ﲨ���Ա𡢽����ﲨ���Ա𡢽����ﲨ���ǳ� --*/
		function WriteLeer(url,myleerid,byleerid,mysex,bysex,nechen){
			mailid = byleerid;
			nichen = nechen;
			
			if(mysex==bysex){
				showBackWindow(nichen,4);///�����ﲨʧ��
			}else{
				AddPopularity(url,byleerid,2); ///��������ֵ
	 			
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
						showBackWindow(nichen,3);///�����ﲨ�ɹ�
					}else if(xmlHttp.responseXML.getElementsByTagName("ISNULL")[0].firstChild.data != "0"){
						showBackWindow(nichen,4);///�����ﲨʧ��
					}
				}else if (xmlHttp.status == 204) {
					
				}
			}
		}
 		/**-- �ظ��ﲨ --*/
 		
 		/**-- ���ʼ� ���� url�������ʼ���ID���ʼ����⡢�ʼ����ݡ����ʼ����Ա𡢽����ʼ����Ա𡢽����ʼ����ǳ� --*/
		function WriteMails(url,bymailid,mailtitles,mailcontents,mysex,bysex,nechen){
			nichen = nechen;
			mailid = bymailid;
			var mailtitle = document.all[mailtitles].value;
			var mailcontent = document.all[mailcontents].value;
			
			if(mysex==bysex){
 				showBackWindow(nichen,2);///�����ʼ�ʧ��
 			}else{
				AddPopularity(url,bymailid,1); ///��������ֵ
	 				 			
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
						showBackWindow(nichen,1);///�����ʼ��ɹ�
					}else if(xmlHttp.responseXML.getElementsByTagName("ISNULL")[0].firstChild.data != "0"){
						showBackWindow(nichen,2);///�����ʼ�ʧ��
					}
				}else if (xmlHttp.status == 204) {
					
				}
			}
		}
 		/**-- ���ʼ� --*/
 		
		/**-- �������״̬ ���� �����ID --*/
		function UpdataSkimState(url,memberInfoID){
			creatXMLHttpRequest();
			var url = url+"/servlet/updataSkimState?memberInfoid=" + memberInfoID;
			xmlHttp.open("GET",url,true);
			xmlHttp.send(null);
		}
		
		/**-- �����Ա�޸�������Ϣ ���� URL����ԱID����Ա�ǳƣ�����״̬���������ݣ����������� --*/
		function InsertLinkmanDynamic(url,memberInfoID,nechen,state,content,propertys){   
			creatXMLHttpRequest();
			
			var url = url+"/servlet/insertLinkmanDynamic?memberInfoid=" + memberInfoID+"&nechen=" +nechen+"&state=" +state+ "&content=" + content+ "&propertys=" + propertys;
			
			removeLinkmanDynamic(memberInfoID,nechen,state,content,propertys);
			
			xmlHttp.open("GET",url,true);
			xmlHttp.send(null);	
		}
		
		/**-- ��Ϊ��� ���� URL�������ID���������ID��������Ա𡢱�������Ա� --*/
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
		
		/**-- ����ϵͳ��Ϣ ���� URL���������ID��������͡����״̬��0��ͨ����1��δͨ����--*/
		function WriteSysMail(url,byexaminepopid,examinetype,examinestate){
			creatXMLHttpRequest();
			
			var url = url+"/servlet/writeSysMail?byexaminepopid=" + byexaminepopid + "&examinetype=" + examinetype + "&examinestate=" + examinestate;
			xmlHttp.open("GET",url,true);
			xmlHttp.send(null);
			removeSysMail(byexaminepopid,examinetype,examinestate);
		}
		
		/**-- ���λ�Ա ���� url����¼��ԱID�������λ�ԱID�������λ�Ա�ǳơ������λ�Ա����ID --*/
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
						showBackWindow(nichen,9);///���λ�Ա�ɹ�
					}else if(xmlHttp.responseXML.getElementsByTagName("ISNULL")[0].firstChild.data == "1"){
						showBackWindow(nichen,10);///���λ�Աʧ��
					}
				}else if (xmlHttp.status == 204) {
					
				}
			}
		}
		
		/**-- ���ʼ� ���� url�������ʼ���ID���ʼ����⡢�ʼ����ݡ����ʼ����Ա𡢽����ʼ����Ա𡢽����ʼ����ǳ� --*/
		function LookMailWrite(url,bymailid,mailtitles,mailcontents,mysex,bysex,nechen){
			nichen = nechen;
			mailid = bymailid;
			var mailtitle = document.all[mailtitles].value;
			var mailcontent = document.all[mailcontents].value;
			
			if(mysex==bysex){
 				showBackWindow(nichen,8);///�����ʼ�ʧ��
 			}else{
				AddPopularity(url,bymailid,1); ///��������ֵ
	 				 			
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
						showBackWindow(nichen,7);///�����ʼ��ɹ�
					}else if(xmlHttp.responseXML.getElementsByTagName("ISNULL")[0].firstChild.data != "0"){
						showBackWindow(nichen,8);///�����ʼ�ʧ��
					}
				}else if (xmlHttp.status == 204) {
					
				}
			}
		}
 		/**-- ���ʼ� --*/
		//�����ϵ�˶�̬��Ϣ  2009-04-10 ��С��
		function removeLinkmanDynamic(memberInfoID,nechen,state,content,propertys){
			memberInfoID = ""; 
			nechen = ""; 
			state = ""; 
			content = ""; 
			propertys = ""; 
		}
		///���ϵͳ��Ϣ��Ϣ
		function removeSysMail(byexaminepopid,examinetype,examinestate){
			byexaminepopid = ""; 
			examinetype = ""; 
			examinestate = "";
		}
