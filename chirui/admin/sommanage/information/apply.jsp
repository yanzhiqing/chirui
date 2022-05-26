<%@ page language="java" pageEncoding="GBK"%>
<%@ page import="java.util.Set,java.util.Calendar,java.text.SimpleDateFormat" %>
<%@page import="crjd.common.Toolkit"%>
<%@ include file="../../../common/taglibs.jsp"%>
<%@ page import="crjd.common.SessionContainer" %>
<%
SessionContainer sessionContainer = (SessionContainer)session.getAttribute("sessionContainer");
if(sessionContainer == null){
	sessionContainer = new SessionContainer();
}
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK">
		<title>栏目信息发布</title>
		<link href="<%=request.getContextPath()%>/css/border.css"
			rel="stylesheet" type="text/css">
		<style type="text/css"> 
		<!--
		.style1 {color: #FF0000}
		-->
		</style>
		
		<script language="javascript" src="<%=request.getContextPath()%>/script/checkdata.js"></script>
		<script language="javascript" src="<%=request.getContextPath()%>/script/calendar.js"></script>
	
		<script language="JavaScript" src = "../../../image/information/post/Main.js"></script>
		<script language="JavaScript" src="<%=request.getContextPath()%>/script/js/basecss.js"></script>
		<script language="JavaScript" src="<%=request.getContextPath()%>/script/js/utilities.js"></script>
		<script language="JavaScript" src="<%=request.getContextPath()%>/script/js/message.js"></script>
		<script language="JavaScript" type="text/JavaScript">
		<!--
		var xmlHttp;
		function creatXMLHttpRequest() {
			if (window.ActiveXObject) {
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			else if (window.XMLHttpRequest) {
				xmlHttp = new XMLHttpRequest();
			}
		}
		
		function iif(str,str1,str2){
		if (str==1){str=str1}else{str=str2}
			return(str)
		}
		function giif(str,str1,str2){
			if (str==1 || str==2){str=str1}else{str=str2}
			return(str)
		}
			
		function Dvbbs_UserDialog(what)
		{
			if (!Dvbbs_validateMode()) return;
			IframeID.focus();
			//插入链接
			if (what == "CreateLink") {
				if (Dvbbs_bIsNC)
				{
					insertLink = prompt("请填写超级链接地址信息：", "http://");			
					if ((insertLink != null) && (insertLink != "") && (insertLink != "undefined")) {
					IframeID.document.execCommand('CreateLink', false, insertLink);
					}else{
					IframeID.document.execCommand('unlink', false, null);
					}
				}
				else {
					IframeID.document.execCommand(what, true, null);
				}
			}
			//去掉添加图片时的src="file://
			if(what == "InsertImage"){
				if (Dvbbs_bIsNC)
				{
				imagePath = prompt('请填写图片链接地址信息：', 'http://');			
				if ((imagePath != null) && (imagePath != "")) {
					IframeID.document.execCommand('InsertImage', false, imagePath);
				}
				IframeID.document.body.innerHTML = (IframeID.document.body.innerHTML).replace("src=\"file://","src=\"");
				}else{
				Dvbbs_forimage();
				}
			}
			Dvbbs_pureText = false;
			IframeID.focus();
		}
		
		//--------------------
		
		function Dvbbs_forimage()
		{
			var arr = showModalDialog("<%= request.getContextPath()%>/image/information/post/img.htm", window, "dialogWidth:50em; dialogHeight:30em; status:0; help:0");
			if (arr)
			{
				IframeID.document.body.innerHTML+=arr;
			}
			IframeID.focus();
		}
		
		function OpenSmiley()
		{
			var arr = showModalDialog("<%= request.getContextPath()%>/image/information/post/smiley.htm", "", "dialogWidth:60em; dialogHeight:15.5em; status:0; help:0");
			if (arr != null){
				var ss;
				ss=arr.split("*")
				path=ss[0];
				ubbstring=ss[1];
				IframeID.document.body.innerHTML+=ubbstring;
			}
			else IframeID.focus();
		}
		
		function Dvbbs_forswf()
		{
			var arr = showModalDialog("<%= request.getContextPath()%>/image/information/post/swf.htm", "", "dialogWidth:30em; dialogHeight:10em; status:0; help:0");
			if (arr != null){
				var ss;
				ss=arr.split("*")
				path=ss[0];
				row=ss[1];
				col=ss[2];
				var string;
				string="[flash="+row+","+col+"]"+path+"[/flash]"
				IframeID.document.body.innerHTML+=string;
			}
			else IframeID.focus();
		}
		
		function Dvbbs_forwmv()
		{
			var arr = showModalDialog("<%= request.getContextPath()%>/image/information/post/wmv.htm", "", "dialogWidth:30em; dialogHeight:13em; status:0; help:0");
			
			if (arr != null){
				var ss;
				ss=arr.split("*")
				path=ss[0];
				autostart=ss[1];
				width=ss[2];
				height=ss[3];
				ran=rand();
				var string;
				var ubbstring;
				
				string="[MP="+ width +","+ height +","+ autostart +"]"+ path +"[/MP]";
				IframeID.document.body.innerHTML+=string;
			}
			else IframeID.focus();
		}
		
		function rand() {
			return parseInt((1000)*Math.random()+1);
		}
		
		function Dvbbs_forrm()
		{
			var arr = showModalDialog("<%= request.getContextPath()%>/image/information/post/rm.htm", "", "dialogWidth:30em; dialogHeight:13em; status:0; help:0");
			
			if (arr != null)
			{
				var ss;
				ss = arr.split("*")
				path = ss[0];
				row = ss[1];
				col = ss[2];
				autostart = ss[3];
				ran = rand();
				var string;
				
				string = "[RM="+ row +","+ col +","+ autostart +"]"+ path +"[/RM]";
				IframeID.document.body.innerHTML+=string;
			}
			else IframeID.focus();
		}
		
		//图片与链接事件
		
		
		function Dvbbs_fortable()
		{
			if (!Dvbbs_validateMode())	return;
			IframeID.focus();
			var arr = showModalDialog("<%= request.getContextPath()%>/image/information/post/table.html", window, "dialogWidth:22em; dialogHeight:18em; status:0; help:0;scroll:no;");
			if (arr)
			{
				IframeID.document.body.innerHTML+=arr;
			}
			IframeID.focus();
		}
		
		function Dvbbs_replace()
		{
			var arr = showModalDialog("<%= request.getContextPath()%>/image/information/post/replace.html", "", "dialogWidth:16.5em; dialogHeight:13em; status:0; help:0");
			if (arr != null){
				var ss;
				ss = arr.split("*")
				a = ss[0];
				b = ss[1];
				i = ss[2];
				con = IframeID.document.body.innerHTML;
				if (i == 1)
				{
					con = Dvbbs_rCode(con,a,b,true);
				}else{
					con = Dvbbs_rCode(con,a,b);
				}
				IframeID.document.body.innerHTML = con;
			}
			else IframeID.focus();
		}
		
		function insertSpecialChar()
		{
			var arr = showModalDialog("<%= request.getContextPath()%>/image/information/post/specialchar.html", "","dialogWidth:25em; dialogHeight:15em; status:0; help:0");
			if (arr != null) Dvbbs_InsertSymbol(arr);
			IframeID.focus() ;
		}
		
		function Dvbbs_foreColor()
		{
			if (!Dvbbs_validateMode()) return;
			if (Dvbbs_bIsIE5){
				var arr = showModalDialog("<%= request.getContextPath()%>/image/information/post/selcolor.html", "", "dialogWidth:18.5em; dialogHeight:17.5em; status:0; help:0");
				if (arr != null) FormatText('forecolor', arr);
				else IframeID.focus();
			}else
				{
				FormatText('forecolor', '');
				}
		}
		
		function Dvbbs_backColor()
		{
			if (!Dvbbs_validateMode()) return;
			if (Dvbbs_bIsIE5)
			{
				var arr = showModalDialog("<%= request.getContextPath()%>/image/information/post/selcolor.html", "", "dialogWidth:18.5em; dialogHeight:17.5em; status:0; help:0");
				if (arr != null) FormatText('backcolor', arr);
				else IframeID.focus();
			}else
				{
				FormatText('backcolor', '');
				}
		}
		
		function doSubmit(){
			if(check()==true){
				//Dvbbs_CopyData('Body')
				 document.Dvform.content1.value= window.content_html.getHTML()+"   "; 
				 
				if (confirm("您确定提交这条信息吗?")==true){
				   
					if(document.Dvform.nfujian.selectedIndex < 0){
						document.Dvform.nfujian.selectedIndex = 0;
					}
					if(document.Dvform.video.selectedIndex < 0){
						document.Dvform.video.selectedIndex = 0;
					}
				  
					var nfujianNames = document.Dvform.nfujian_Name.value;
					var videoNames = document.Dvform.video_Name.value;
					
					if(nfujianNames.length>0){
				  		if(nfujianNames.substring(0,1)==","){
							document.Dvform.nfujian_Name.value = nfujianNames.substring(1,nfujianNames.length);
						}else{
							document.Dvform.nfujian_Name.value = nfujianNames.substring(0,nfujianNames.length);
						}
					}
					if(videoNames.length>0){
				  		if(videoNames.substring(0,1)==","){
							document.Dvform.video_Name.value = videoNames.substring(1,videoNames.length);
						}else{
							document.Dvform.video_Name.value = videoNames.substring(0,videoNames.length);
						}
					}
					
				  	getMenuName();
					//window.document.Dvform.submit();
					//if(document.all["tpflag"].checked == true){
					//	insertTPXW();
					//}
					
				}
			}
		}
		
		function insertTPXW(){
			creatXMLHttpRequest();
			var tpflag = document.all["tpflag"].value;
			var title = document.all["title"].value; //新闻标题
			var choose = document.all["choose"].value; //是否在首页显示
			var titlehref = document.all["titlehref"].value; //新闻标题超级连接
			var content1 = document.all["content1"].value;//新闻内容
		    var filesid = document.all["nfujian_Name"].value;//新闻附件名称
		    var videosid = document.all["video_Name"].value;//新闻视频
			var url = "<%=request.getContextPath()%>/insertTPXW?tpflag=" + tpflag;
			xmlHttp.open("GET",url,true);
			//xmlHttp.onreadystatechange = callbackEmbinfo;
			xmlHttp.send(null);
		}
		function addfile()
		{
		  var URL = '<%=request.getContextPath()%>/admin/sommanage/information/news_addImg.jsp';
		  window.open(URL,'addfile','height=280,width=400,toolbar=no,location=no,top=400,left=450,directories=no,status=no,menubar=no,scrollbars=no,resizable=false')
		
		}
		
		function addfile1()
		{
		  var URL = '<%=request.getContextPath()%>/admin/sommanage/information/news_AddFile.jsp';
		  window.open(URL,'addfile1','height=280,width=400,toolbar=no,location=no,top=400,left=450,directories=no,status=no,menubar=no,scrollbars=no,resizable=false')
		
		}
		
		function addfile2()
		{
		  var URL = '<%=request.getContextPath()%>/admin/sommanage/information/news_AddVideo.jsp';
		  window.open(URL,'addfile2','height=280,width=400,toolbar=no,location=no,top=400,left=450,directories=no,status=no,menubar=no,scrollbars=no,resizable=false')
		
		}
		function getMenuName(){
			var menu1 = document.getElementById("menu1").value;
			var menu2 = document.getElementById("menu2").value;
			var menu3 = document.getElementById("menu3").value;
			
			var str1 = document.getElementById("menu1").options[document.getElementById("menu1").selectedIndex].text;
			var str2 = document.getElementById("menu2").options[document.getElementById("menu2").selectedIndex].text;
			var str3 = document.getElementById("menu3").options[document.getElementById("menu3").selectedIndex].text;
			
			if(menu3!=""){
			    document.all["menuName"].value = menu3;
				document.all["menuStrName"].value = str1+"_"+str2+"_"+str3;
				
			}else if(menu2!=""){
			    document.all["menuName"].value = menu2;
				document.all["menuStrName"].value = str1+"_"+str2;
			}else if(menu1!=""){
			    document.all["menuName"].value = menu1;
				document.all["menuStrName"].value = str1;
			}
			
		}
		function check(){
			if (document.Dvform.menu1.value.length==0){
				alert("栏目信息不能为空");
				document.Dvform.menu1.focus();
				return false;
			}else{
				return true;
			}
		}
		-->
		</script>
	</head>
	<body>
		<table width="99%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td class="wudi">
					&nbsp;您现在的位置：网站管理 → 栏目管理 → 栏目信息管理 → 栏目信息发布
				</td>
			</tr>
		</table>
		<p> </p>

		<form name="Dvform" action="<%=request.getContextPath()%>/somInfomationAction.do"
			method="post">
			  <input type="hidden" name="content1" value="&nbsp;&nbsp;"/>
			<input type="hidden" name="temporaryFrame" value=""/>
			<input type="hidden" name="upfilerename">
			<input type="hidden" name="dvbbs" value="">
	        <input type="hidden" name="act" value="">
	
			<input type=hidden name="star" value="1">
			<input type=hidden name="page" value="1">
			<input type=hidden name="update" value="">
			<input type=hidden name="TotalUseTable" value="dv_bbs1">
			<input type=hidden name="action" value="1">
			<input type=hidden name="zxChecked" value="0">
			<input type=hidden name="fwChecked" value="0">
			
			
			<input type=hidden name= "Userid" value="">
	        <input type="hidden" name="MAIN_TYPE" value="4">
			<input type="hidden" name="MAIN_NEXT_ACTION" value="">
			<input type="hidden" name="MAIN_PURPOSE" value="">  
			
			<div onkeydown="ctlent();" >
			<div class=menuskin id=popmenu 
			      onmouseover="clearhidemenu();highlightmenu(event,'on')" 
			      onmouseout="highlightmenu(event,'off');dynamichide(event)" style="Z-index:100"></div>

			<Script src="<%=request.getContextPath()%>/image/information/post/DhtmlEdit.js"></Script>
			
			<input type="hidden" name="actionType" value="1" />
			<input type="hidden" name="menuName" value="" id="menuName" />
			<input type="hidden" name="menuStrName" value="" id="menuStrName" />
			<input type="hidden" name="filesID" value="" id="filesID" />
			<table id="list" width="95%" border="1" align="center"
				cellpadding="0" cellspacing="0" bordercolor="#DEE5EF"
				style="border-collapse: collapse">
				<tr>
					<td height="24" colspan="6" class="ziti" bgcolor="#B7DBFF">
						<div align="center">
							<span class="header">新闻发布</span>
						</div>
					</td>
				</tr>

				<tr>
					<td height="20" width="15%" bgcolor="#F8F8FC" class="ziti">
						&nbsp;新闻标题
					</td>
					<td colspan="2">
						&nbsp;&nbsp;&nbsp;
						<html:text styleClass="shuru" property="title" value="" size="74"
							maxlength="200" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox" name="choose" value="1"><font color=#FF0000><b>&nbsp;是否显示在网站首页</b></font></checkbox>
					</td>
				</tr>
				<tr>
					<td height="20" bgcolor="#F8F8FC" class="ziti">
						&nbsp;新闻标题超级连接
					</td>
					<td colspan="2" bgcolor="">
						&nbsp;&nbsp;&nbsp;
						<input type="text" id="titlehref" name="titlehref" value="" size="74">
					</td>
				</tr>
				<tr>
					<td height="20" bgcolor="#F8F8FC" class="ziti">
						&nbsp;新闻栏目
					</td>
					<td colspan="2" bgcolor="">
					    <table>
					    	<tr>
					    		<td>
					    			<jsp:include page="../../../common/somUserMenu.jsp" />
					    		</td>
					    		<td>
									<%if(sessionContainer.getUserName().equals("系统管理员")){%>
					    		 
									<input type="checkbox" name="tpflag" value="1"><font color=#FF0000><b>&nbsp;是否显示在图片新闻</b></font></checkbox>
									
									<% }%>
								</td>
					    	</tr>
					    </table>
					</td>
				</tr>
				<!--<tr>
					<td colspan="3">
						<input type="checkbox" name="tpflag" value="1"><font color=#FF0000><b>&nbsp;是否显示在图片新闻</b></font></checkbox>
					</td>
				</tr>
				 -->
				<tr>
					<td width=20% bgcolor="#F8F8FC" class="ziti" >&nbsp;附件上传</td>
					<td width=80% class=tablebody2>
						&nbsp;&nbsp;&nbsp;
						<input type="button" name="Submit3" value="-单击此处添加附件-" onclick="javascript:addfile1();return false;">&nbsp;&nbsp;<font color=#FF0000><b>*&nbsp;</b></font>课件在此上传.
						<br>&nbsp;&nbsp;&nbsp;
						<input type="hidden" id="nfujian_Name" name="nfujian_Name">
						<select name="nfujian" size=1 multiple style="WIDTH: 340px" >
					</td>
				</tr>
				
				<tr>
					<td width=20% bgcolor="#F8F8FC" class="ziti" >&nbsp;视频上传</td>
					<td width=80% class=tablebody2>
						&nbsp;&nbsp;&nbsp;
						<input type="button" name="Submit3" value="-单击此处添加视频-" onclick="javascript:addfile2();return false;">&nbsp;&nbsp;
						<br>&nbsp;&nbsp;&nbsp;
						<input type="hidden" id="video_Name" name="video_Name">
						<select name="video" size=1 multiple style="WIDTH: 340px" >
					</td>
				</tr>

				<!-- 多功能文本编辑框 start -->
				<tr>
					<td height="20" bgcolor="#F8F8FC" class="ziti" valign="top">
						&nbsp;新闻内容
					</td>
					<td>&nbsp;&nbsp;&nbsp;
				     <IFRAME ID="eWebEditor1" name="content_html" src="<%=request.getContextPath()%>/eWebEditor.jsp?id=content1&style=standard" frameborder="0" scrolling="no" width="660" height="350">
				     </IFRAME> 
						
					</td>
				</tr>
				<!-- 多功能文本编辑框 end -->
				
				<tr>
					<td height="20" bgcolor="#F8F8FC" class="ziti" valign="top">
						&nbsp;备注
					</td>
					<td colspan="2" bgcolor="">
						&nbsp;&nbsp;&nbsp;
						<textarea rows="5" cols="80" name="abstract"></textarea>
					</td>
				</tr>
				<tr>
					<td height="20" bgcolor="#F8F8FC" class="ziti">
						&nbsp;发布时间
					</td>
					<td colspan="2" bgcolor="">
						<%
						Calendar date = Calendar.getInstance();
				        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				        String nowDate = format.format(date.getTime());
        				%>
						&nbsp;&nbsp;&nbsp;
						<input type="text" name="createtime" value="<%=nowDate%>" class="shuru" size="9" />
						&nbsp;
						<img style="cursor: hand;" id="createtime_img"
							src="<%=request.getContextPath()%>/image/timer.gif" width="16"
							height="16" border="0" alt="请选择日期"
							onClick="setday(this,document.all.createtime);">
					</td>
				</tr>
				<tr>
					<td height="20" bgcolor="#F8F8FC" class="ziti">
						&nbsp;新闻发布人
					</td>
					<td colspan="2" bgcolor="">
						&nbsp;&nbsp;&nbsp;
						<%
						String userName = Toolkit.dealNull(sessionContainer.getUserName()); 
						out.println(userName);
						%>
						<input type="hidden" name="promulgator" value="<%=userName %>" id="promulgator" />
					</td>
				</tr>
				<tr>
					<td height="22" colspan="6" class="ziti" bgcolor="#B7DBFF"> 
						<div align="center">
							<input type=submit name="btnSave" value="录 入" onclick="return doSubmit();">
							<input type=reset name=Submit2 value="清 除" onclick="ClearReset()"> 
						</div>
					</td>
				</tr>
			</table>
		</form>
		<form name=preview action="preview.asp?boardid=2" method=post target=preview_page>
			<input type=hidden name=Dvtitle value=><input type=hidden name=theBody value="">
		</form>
		<!--  <Script Src="../../../image/information/post/DhtmlEdit1.js"></Script>-->
		<Script Src="../../../image/information/post/post.js"></script>
		<script language="javascript">
		Maxtitlelength=50;
		ispostnew=1;
		MaxConlength=16240;
		</script>
	</body>
</html>