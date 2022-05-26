<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="java.util.ArrayList"  %>
<%@ page import="java.util.List"  %>
<html>
<head>
  <html:base/>
<title>用户菜单 </title>
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
		o.alt='全部折叠';
	}
	else
	{
		openAll();
		judge=0;
		o.src='/pagelay/images/public/iOpenapseAll.gif';
		o.alt='全部展开';
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
	// treemenu 的参数意义依次为：资源目录，如"treemenu/image/";树名称；树图标
	// add_item 的参数意义依次为：该项编号，不能重复；父id，所属的上一层的编号；该项显示的内容；折叠时的图标；展开时的图标；网址或命令；指向的窗口
       <logic:present name="list">
          <logic:iterate id="reporttype" name="list" >
          add_item(<bean:write name="reporttype" property="menuid"/>,<bean:write name="reporttype" property="upmenuid"/>,"<bean:write name="reporttype" property="menename"/>","","","<%=request.getContextPath()%>/<bean:write name="reporttype" property="url"/>?actionType=0&sysMenuId=<bean:write name="reporttype" property="menuid"/>","topmainFrame");
          </logic:iterate>
  </logic:present>
	//add_item(8,-1,"退出系统","pagelay/images/elecreport/childicon.gif","","javascript:exitsys();","");

	// menu 的参数意义为：所要显示的树的父id；
	// 该函数返回树的html代码，需要由 write 函数输出。
	document.write(menu(1));
	</script>
    </td>
  </tr>
</table>
</body>
</html>
