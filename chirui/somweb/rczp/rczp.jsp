<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="crjd.model.somweb.main.GetRLZY" %>
<%@page import="java.util.*" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%
GetRLZY rlzyInfo= new GetRLZY(application);
ArrayList listInfo = rlzyInfo.getMainRLZY("201"); //人才招聘
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" rev="stylesheet" href="<%=request.getContextPath()%>/css/home/style.css"  type="text/css" media="all" /> 

<script type="text/javascript" src="page.js"  charset="GBK"></script>
<title>西安驰瑞机电设备有限公司</title>
</head>
<body >
<jsp:include page="../head.jsp"/>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>

<!-- banner -->
<div style=" text-align:center; margin:0 auto">
<div class="banner5">
</div>
<!-- banner end -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<!-- cont  -->
<div class="con">
<table width="1000px" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="20" height="20"></td>
    <td ></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td width="205" valign="top">
    <div class="menutop"><span style="margin-left:40px">人才招聘</span></div>
<div class="box">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="28" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="60"></td>
    <td width="5"><img src="<%=request.getContextPath()%>/images/home/arr.gif" width="5" height="5" /></td>
    <td width="10"></td>
    <td align="left" class="menu"><a  href="<%=request.getContextPath()%>/somweb/rczp/rczp.jsp">人才招聘</a></td>
  </tr>
</table>
</td>
  </tr>
  <tr>
    <td height="2"><img src="<%=request.getContextPath()%>/images/home/line2.jpg" /></td>
  </tr>
</table>

</div>
<a href="<%=request.getContextPath()%>/somweb/lxwm/lxwm.jsp">
	<div class="contact"></div>
</a>

</td>
    <td width="20"></td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="5" ></td>
            <td  width="11"><img src="<%=request.getContextPath()%>/images/home/arrow.gif" width="11" height="11" /></td>
            <td width="5"></td>
            <td height="18" align="left" ><span style="font-weight:bold;  ">当前位置：</span><a href="#">首页</a> > <a href="#">人才招聘</a></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td align="left" height="5"><img src="<%=request.getContextPath()%>/images/home/line1.jpg" width="694" height="1" /></td>
      </tr>
    </table>
    <table width="100%" id="idData" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="20" ></td>
          <td  ></td>
          <td ></td>
        </tr>
        <tr>
          <td  ></td>
          <td ><h2>人才招聘</h2></td>
          <td ></td>
        </tr>
        <tr>
          <td height="20" ></td>
          <td  ></td>
          <td ></td>
        </tr>
<%

 for(int i=0;i<listInfo.size();i++){
 Hashtable ht = (Hashtable)listInfo.get(i);
%>
        <tr>
          <td width="50"   align="center"><img src="<%=request.getContextPath()%>/images/home/con2.jpg" /></td>
          <td  width="580" align="left" height="25"  ><a href="<%=request.getContextPath()%>/somweb/rczp/rczpDetil.jsp?id=<%=ht.get("ID")%>" target="_blank"><%=ht.get("TITLE")%></a></td>
          <td align="left" style="color: #999999" >[<%=ht.get("CREATETIME")%>]</td>
        </tr>
<%
}
%>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <tr>
		    <td><div id="pagelist"></div></td>
		  </tr>
		</table>
</td>
    <td width="20"></td>
  </tr>
</table>

<!-- right  -->
</div> 
<!-- cont end -->
<jsp:include page="../foot.jsp"/>
</div>
</body>
</html>
