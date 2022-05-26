<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>		
<%@ page import="crjd.common.Resource_Upload"%>	
<jsp:useBean id="jspsmart" scope="page" class="crjd.common.upload.SmartUpload" />

<%
	// String  dataSource = GlobalParameter.getDataSourceName();
	Resource_Upload  upload = new Resource_Upload(application);
	
	String fujianSM = "";
	String fujianBH = "0";
	String delfujianBH = "0";
	String action = "";
	
	String name = "";
	String fujianpath = "";
	String fujianname = "";
	String filesID = "";
	
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	String datetime = sdf.format(date);
	try {
		jspsmart.initialize(pageContext);
		//  jspsmart.setAllowedFilesList("jpg,jpeg,gif,bmp");
		jspsmart.upload();

		action = jspsmart.getRequest().getParameter("action");

		if (action.equals("add")) {
			fujianSM = jspsmart.getFiles().getFile(0).getFileName(); //无路径的文件名称 xxx.xxx
			
			if (fujianSM == null)
				fujianSM = "";
			fujianSM = fujianSM.trim();
			int pos = fujianSM.indexOf('.');
			name = fujianSM.substring(pos);
			fujianname = datetime +"_"+ fujianSM; //如：20090825155532_xxx.xxx
			fujianpath = "uploadimg/tupian/" + datetime + name; //uploadimg/fujian/20090825155532.xxx
			filesID = filesID + datetime + ",";
			crjd.common.upload.File fujianWenjian = jspsmart.getFiles().getFile(0); //判断存在位置

			String info = "上传失败,请检查输入是否合法!";
			
			if (name.equals(".jpg") || name.equals(".gif")
					|| name.equals(".GIF") || name.equals(".JPG")
					|| name.equals(".bmp") || name.equals(".BMP")) {
					
				fujianWenjian.saveAs(fujianpath);
			}
			
			if (!fujianWenjian.isMissing()) {
				if (upload.WriteImgInDB(datetime,fujianSM,fujianpath)){
					info = "图片上传成功！";
				}
			}
			//fujianBH = new Integer(upload.GetFujianBH()).toString();
			//System.out.println(fujianBH);
			fujianBH = datetime;
		}

		else if (action.equals("del")) {
			delfujianBH = jspsmart.getRequest()
					.getParameter("fujianBH");
			if ((delfujianBH == null) || (delfujianBH.equals("null"))
					|| (delfujianBH.equals("")))
				delfujianBH = "0";
			upload.Deletefujian(delfujianBH);
		}

	} catch (Exception e) {
	}
%>
<html>
	<head>
		<title>添加图片</title>
		<script language="JavaScript" src="../../script/js/basecss.js"></script>
		<script language="JavaScript" src="../../script/js/utilities.js"></script>
	</head>
	<body>
		<form action="" method="post" enctype="multipart/form-data" name="fileform">
			<input type="hidden" name="action" value="">
			<table width="380" border="0" align="center" cellpadding="0"
				bordercolor="#DEE5EF" cellspacing="0">
				<tr>
					<td height="35" align="left" valign="top" colspan=2>
						<table border="0" cellpadding="2" cellspacing="0" width="186">
							<tr class=style2>
								<td>
									<span class=style1><b>添加图片</b> </span>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="35" colspan=2 align="left" class=style1>
						1.打开文件
					</td>
				</tr>
				<tr>
					<td height="35" colspan=2 align="center" class=style1>
						<input name="fujianWenjian" type="file" size="40">
					</td>
				</tr>

				<tr>
					<td class=style1>
						2.粘贴
					</td>
					<td height="35" class=style1>
						<div align="center">
							<input type="button" name="Submit" value="粘 贴"
								onclick="javascript:add()">
						</div>
					</td>
				</tr>
				<tr>
					<td class=style1>
						3.完成
					</td>
					<td height="35" class=style1>
						<div align="center">
							<input type="button" name="button3" value="完 成"
								onclick="javascript:done()">
						</div>
					</td>
				</tr>

				<tr>
					<td class=style1>
						已经粘贴的文件：
						<select name="fujianBH" style="WIDTH: 280px">
							<option value="-1">
								---
							</option>
						</select>

					</td>
					<td height="35" align="center" class=style1>
						<input type="button" name="button5" value="预 览"
							onclick="javascript:view()">
						<input type="button" name="button5" value="删 除"
							onclick="javascript:del()">
					</td>
				</tr>

			</table>
		</form>
	</body>
	<script>
	<!--
	<%
	if(!fujianBH.equals("0")){
	%>
		var i = window.opener.Dvform.nimgfujian.length;
		window.opener.Dvform.nimgfujian.length=i+1;
		window.opener.Dvform.nimgfujian.options[i].text="<%=fujianBH%>_<%=fujianSM%>";
		window.opener.Dvform.nimgfujian.options[i].value="<%=fujianBH%>";
		window.opener.Dvform.nimgfujian_Name.value +=  "," + "<%=fujianBH%>";
	<%
	}else if(!delfujianBH.equals("0")){
	%>
		var value = new Array();
		var text = new Array();
		var index = 0;
		for(i=0;i<window.opener.Dvform.nimgfujian.length;i++){
			if(window.opener.Dvform.nimgfujian.options[i].value != "<%=delfujianBH%>"){
				value[index] = window.opener.Dvform.nimgfujian.options[i].value;
		        text[index] = window.opener.Dvform.nimgfujian.options[i].text;
					index++
			}
		}
		window.opener.Dvform.nimgfujian.length = value.length;
		for(i=0;i<value.length;i++){
			window.opener.Dvform.nimgfujian.options[i].text=text[i];
			window.opener.Dvform.nimgfujian.options[i].value=value[i];
		}
	<%
	}
	%>
		document.fileform.fujianBH.length = window.opener.Dvform.nimgfujian.length;
		for(j=0;j<window.opener.Dvform.nimgfujian.length;j++){
			document.fileform.fujianBH.options[j].text=window.opener.Dvform.nimgfujian.options[j].text
			document.fileform.fujianBH.options[j].value=window.opener.Dvform.nimgfujian.options[j].value
		}
	
		function add(){
			document.fileform.action.value="add";
			document.fileform.submit();
		}
		function del(){
			var fnames = window.opener.Dvform.nimgfujian_Name.value.split(",");
			var fname  = document.getElementById("fujianBH").value;
			var newFname = "";
			for(var i = 0; i < fnames.length; i++){
				if(fnames[i] != fname){
				 newFname += "," + fnames[i];
				}
			}
			window.opener.Dvform.nimgfujian_Name.value = newFname;
			document.fileform.action.value="del";
			document.fileform.submit();
		}
		
		function view(){
			var fujianBH = document.fileform.fujianBH.value;
			var URL = 'news_imageShow.jsp?fujianBH='+fujianBH; 
			window.open(URL,'showimage','toolbar=yes,location=yes,top=50,left=200,directories=yes,status=no,menubar=yes,scrollbars=yes,resizable=true')
		}
		
		function done(){
			
		   window.close();
		}
	
		-->
	</script>
</html>
