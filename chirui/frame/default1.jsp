<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page contentType="text/html; charset=GBK" %>

<%
String modcode = request.getParameter("upid");
%>
<html>
<head>
  <html:base/>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta http-equiv="pragma" content="no-cache">
<title>Untitled Document</title>
 <!--
 * *<frameset rows="*" cols="193,*" framespacing="0" frameborder="NO" border="0">
 *  <frame src="/inspect/menu.jsp?modcode=&modName=" name="leftFrame" FRAMEBORDER="no" TOPMARGIN="0" LEFTMARGIN="0" MARGINHEIGHT="0" MARGINWIDTH="0" scrolling="no">
 *  <frame src="/inspect/main.htm" name="main" FRAMEBORDER="no" TOPMARGIN="0" LEFTMARGIN="0" MARGINHEIGHT="0" MARGINWIDTH="0" scrolling="yes">
 * </frameset>
 * <noframes><body>
 * </body></noframes>
 *-->
<!--
   陈振宇修改，菜单窗口隐藏
   如果不需要点击触发隐藏，则注销 方法findObj()
   去掉onmouseup="with(findObj('frmTitle').style){display=display=='none'?'':'none';this.innerText=display=='none'?'>':'<'}"
-->
<script>
function findObj(theObj, theDoc)
{
  var p, i, foundObj;

  if(!theDoc) theDoc = document;
  if( (p = theObj.indexOf("?")) > 0 && parent.frames.length)
  {
    theDoc = parent.frames[theObj.substring(p+1)].document;
    theObj = theObj.substring(0,p);
  }
  if(!(foundObj = theDoc[theObj]) && theDoc.all) foundObj = theDoc.all[theObj];
  for (i=0; !foundObj && i < theDoc.forms.length; i++)
    foundObj = theDoc.forms[i][theObj];
  for(i=0; !foundObj && theDoc.layers && i < theDoc.layers.length; i++)
    foundObj = findObj(theObj,theDoc.layers[i].document);
  if(!foundObj && document.getElementById) foundObj = document.getElementById(theObj);

  return foundObj;
}
//function kkk(){
//
//		document.all("frmTitle").style.display="none"
//	}

//function fff(){
//
//		document.all("frmTitle").style.display=""
//	}
</script>



<style type="text/css">
<!--
body {
	margin: 0px;
	background-color: #E3EEFF;
}
.explorer {
	background-color:#E3EEFF;
}
.ctbutton {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 8px;
	background-color: #00aaFF;
	border-width: 1px;
	width: 9px;
	height: 30px;
	margin-bottom: 100px;
}
-->
</style>

</head>

<body scroll=no>
  <table width="100%" height="100%" cellpadding="0" cellspacing="0">
  <tr>
    <td width="220" align="center" valign="top" class="explorer" id="frmTitle"  >
    	<iframe id="leftFrame" width="100%" height="100%" src="<%=request.getContextPath()%>/frame/left.jsp?modcode=<%=modcode%>" name="leftFrame" FRAMEBORDER="no" TOPMARGIN="0" LEFTMARGIN="0" MARGINHEIGHT="0" MARGINWIDTH="0" scrolling="yes"></iframe>
    </td>
    <td width="1" ><button class="ctbutton" onfocus="blur();" onmouseup="with(findObj('frmTitle').style){display=display=='none'?'':'none';this.innerText=display=='none'?'>':'<'}"   ></button></td>
    <td class="explorer" >
	<iframe  id="browserframe" width="100%" height="100%" src="<%=request.getContextPath()%>/frame/main.jsp" name="main" FRAMEBORDER="no"  LEFTMARGIN="0" MARGINHEIGHT="99" MARGINWIDTH="0" scrolling=auto></iframe></td>
  </tr>
</table>
</body>



</html>
