<%-- 
  -- Author:lxp
  --%>

<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>		
<%@ page import="crjd.common.Resource_Upload"%>	
<jsp:useBean id="jspsmart" scope="page" class="crjd.common.upload.SmartUpload" />
<%
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
		jspsmart.upload();

		action = jspsmart.getRequest().getParameter("action");

		if (action.equals("add")) {
			fujianSM = jspsmart.getFiles().getFile(0).getFileName(); //��·�����ļ����� xxx.xxx
			
			if (fujianSM == null)
				fujianSM = "";
			fujianSM = fujianSM.trim();
			int pos = fujianSM.indexOf('.');
			name = fujianSM.substring(pos);
			fujianname = datetime +"_"+ fujianSM; //�磺20090825155532_xxx.xxx
			fujianpath = "uploadimg/fujian/" + datetime + name; //uploadimg/fujian/20090825155532.xxx
			filesID = filesID + datetime + ",";
			crjd.common.upload.File fujianWenjian = jspsmart.getFiles().getFile(0); //�жϴ���λ��

			String info = "�ϴ�ʧ��,���������Ƿ�Ϸ�!";
			
			fujianWenjian.saveAs(fujianpath);

			if (!fujianWenjian.isMissing()) {
				if (upload.WriteInDB(datetime,fujianSM,fujianpath)){
					info = "�ļ��ϴ��ɹ���";
				}
			}
			//fujianBH = new Integer(upload.GetFujianBH()).toString();
			//System.out.println(fujianBH);
			fujianBH = datetime;
		} else if (action.equals("del")) {

			delfujianBH = jspsmart.getRequest().getParameter("fujianBH");
			//out.print(delfujianBH);
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
		<title>����ļ�</title>
		<script language="JavaScript1.3" src="../../script/basecss.js"></script>
		<script language="JavaScript1.3" src="../../script/utilities.js"></script>

	</head>

	<body>
		<form action="" method="post" enctype="multipart/form-data" name="fileform">
			<input type="hidden" name="action" value="">
			<table width="380" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td height="35" align="left" valign="left" colspan=2>
						<table border="0" cellpadding="2" cellspacing="0" width="186">
							<tr class=style2>
								<td>
									<span class=style1>&nbsp;<b>����ļ�</b>
									</span>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="35" colspan=2 align="left" class=style1>
						1.���ļ�
					</td>
				</tr>
				<tr>
					<td height="35" colspan=2 align="center" class=style1>
						<input name="fujianWenjian" type="file" size="40">
					</td>
				</tr>

				<tr>
					<td class=style1>
						2.ճ��
					</td>
					<td height="35" class=style1>
						<div align="center">
							<input type="button" name="Submit" value="ճ ��"
								onclick="javascript:add()">
						</div>
					</td>
				</tr>
				<tr>
					<td class=style1>
						3.���
					</td>
					<td height="35" class=style1>
						<div align="center">
							<input type="button" name="button3" value="�� ��"
								onclick="javascript:done()">
						</div>
					</td>
				</tr>
				<tr>
					<td class=style1>
						�Ѿ�ճ�����ļ���
						<select name="fujianBH" id="fujianBH" style="WIDTH: 180px">
							<option value="-1">
								---
							</option>
						</select>

					</td>
					<td height="35" align="center" class=style1>
						<input type="button" name="button5" value="ɾ ��"
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
var i = window.opener.Dvform.nfujian.length;

window.opener.Dvform.nfujian.length = i+1;
window.opener.Dvform.nfujian.options[i].text="<%=fujianBH%>_<%=fujianSM%>";
window.opener.Dvform.nfujian.options[i].value="<%=fujianBH%>";
window.opener.Dvform.nfujian_Name.value += ","+"<%=fujianBH%>";
<%
}else if(!delfujianBH.equals("0")){
%>
var value = new Array();
var text = new Array();
var index = 0;
for(i=0;i<window.opener.Dvform.nfujian.length;i++){
	if(window.opener.Dvform.nfujian.options[i].value != "<%=delfujianBH%>"){
		value[index] = window.opener.Dvform.nfujian.options[i].value;
        text[index] = window.opener.Dvform.nfujian.options[i].text;
			index++
	}
}
window.opener.Dvform.nfujian.length = value.length;
for(i=0;i<value.length;i++){
                window.opener.Dvform.nfujian.options[i].text=text[i];
                window.opener.Dvform.nfujian.options[i].value=value[i];
}
<%
}
%>
document.fileform.fujianBH.length = window.opener.Dvform.nfujian.length;
for(j=0;j<window.opener.Dvform.nfujian.length;j++){
document.fileform.fujianBH.options[j].text=window.opener.Dvform.nfujian.options[j].text
document.fileform.fujianBH.options[j].value=window.opener.Dvform.nfujian.options[j].value
}


function add(){
document.fileform.action.value="add";
document.fileform.submit();
}
function del(){
//fujianBH
var fnames = window.opener.Dvform.nfujian_Name.value.split(",");
var fname  = document.getElementById("fujianBH").value;
var newFname = "";
for(var i = 0; i < fnames.length; i++){
	if(fnames[i] != fname){
	 newFname += "," + fnames[i];
	}
}
window.opener.Dvform.nfujian_Name.value = newFname;
document.fileform.action.value="del";
document.fileform.submit();
}

function done(){
	
   window.close();
}

-->
</script>
</html>
