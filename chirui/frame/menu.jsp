<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="java.util.ArrayList"  %>
<%@ page import="java.util.List"  %>
<html>
<head>
  <html:base/>
<title>�û��˵� </title>
<script language="javascript" src="<%=request.getContextPath()%>/script/MenuTrees.js"></script>
<link href="<%=request.getContextPath()%>/script/css/tree.css" rel="stylesheet" type="text/css">


<script language="JavaScript">
function window_onload()
{
	initialize();
}//

var judge=0;
function expandall(o)
{
	if (judge==0)
	{

		closeAll();
		judge=1;
		o.src='/pagelay/images/public/iCollapseAll.gi';
		o.alt='ȫ���۵�';
	}
	else
	{
		openAll();
		judge=0;
		o.src='/pagelay/images/public/iOpenapseAll.gif';
		o.alt='ȫ��չ��';
	}
}

</SCRIPT>
</head>
<%
//groupid="222";
List list=new ArrayList();
list=(ArrayList)request.getAttribute("list");
%>
<body bgcolor="#eef8f9" text="#476884"  onselectstart="return false;"  onLoad="window_onload();">
<table border="0" >
  <tr>
    <td align="center">
      <br />
	<script language="javascript" type="text/javascript">
	// treemenu �Ĳ�����������Ϊ����ԴĿ¼����"treemenu/image/";�����ƣ���ͼ��
	// add_item �Ĳ�����������Ϊ�������ţ������ظ�����id����������һ��ı�ţ�������ʾ�����ݣ��۵�ʱ��ͼ�ꣻչ��ʱ��ͼ�ꣻ��ַ�����ָ��Ĵ���
       <logic:present name="list">
          <logic:iterate id="reporttype" name="list" >
          add_item(<bean:write name="reporttype" property="menuid"/>,<bean:write name="reporttype" property="upmenuid"/>,"<bean:write name="reporttype" property="menename"/>","","","<%=request.getContextPath()%>/<bean:write name="reporttype" property="url"/>?actionType=0&sysMenuId=<bean:write name="reporttype" property="menuid"/>","topmainFrame");
          </logic:iterate>
  </logic:present>
	//add_item(8,-1,"�˳�ϵͳ","pagelay/images/elecreport/childicon.gif","","javascript:exitsys();","");

	// menu �Ĳ�������Ϊ����Ҫ��ʾ�����ĸ�id��
	// �ú�����������html���룬��Ҫ�� write ���������
	document.write(menu(1));
	</script>
    </td>
  </tr>
</table>
</body>
</html>
