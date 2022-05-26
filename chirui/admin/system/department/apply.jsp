<%
/**
 * 增加机构信息页面
 * <p>Title: admin/system/department/show.jsp </p>
 * <p>Description: 2006-06-04</p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: RZGL</p>
 * @author eqzhou
 * @version 1.0
 */
%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/user-tag.tld" prefix="user-tag" %>
<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="crjd.model.admin.system.user.UserInfoVO,crjd.common.SessionContainer" %>

<html:html>
<head>
  <html:base/>
<meta http-equive="Cache-Control" content="no-cache"/>
<title>机构信息添加</title>
<link href="<%=request.getContextPath()%>/css/border.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
<script  language="javascript" src="<%=request.getContextPath()%>/script/checkdata.js"></script>
<script  language="javascript" src="<%=request.getContextPath()%>/script/message.js"></script>
<script  language="javascript" src="common.js"></script>
<script language="JavaScript" type="text/JavaScript">
  function oncheck(){
/*
对常见数据类型进行效验rigorCheckValue()光标自动定位
参数args1代表参数对象，例如：document.form1.name.value
参数args2代表是否为空:0代表空 1代表非空
参数args3代表参数类型:1代表"不可有< > 的string" ， 2代表"number"， 3代表"float"， 4代表"date"代表，5代表"只能是数字和字母的组合"
参数args4代表字符串长度：0：代表不限制
参数args5代表数字小数点位数（仅对float类型有效）：0：代表不限制
参数args6代表参数的实际意义，以便能准确通知用户。
*/

   if(!rigorCheckValue(document.all["departmentVO.depId"],1,1,8,0,"机构编码")){
     return false;
   }else if(!rigorCheckValue(document.all["departmentVO.depName"],1,1,20,0,"机构名称")){
     return false;
   }
   /*else if(!rigorCheckValue(document.all["departmentVO.depUpId"],1,1,8,0,"上级机构")){
     return false;
   }
   */
   return true;
}
function RZback(){
  window.location.replace("<%=request.getContextPath()%>/departmentAction.do?actionType=0");
}

</script>

</head>

<body >
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="wudi">&nbsp;您现在的位置：系统维护 → 机构管理 → 机构信息添加</td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="43">&nbsp;</td>
  </tr>
</table>

<html:form action="/departmentAction.do" method="post" focus="departmentVO.depId">

  <input type="hidden" name="actionType" value="1"/>

<table width="70%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
      <tr>
        <td height="24" colspan="3" class="ziti" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center"><span class="header">机构信息添加</span></div></td>
      </tr>
      <tr>
        <td  height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;机构编码</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" maxlength="8" property="departmentVO.depId" value="" onkeyup ="javascript:checkDepId();"/>
          <span class="style1">*</span>&nbsp;</td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;机构名称</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" maxlength="20" property="departmentVO.depName" value=""/>
          <span class="style1">*</span></td>
      </tr>
      <!-- 
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;上级机构</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <user-tag:department property="departmentVO.depUpId" upDepartmentId="" value="" styleClass="shuru" style="width=133px;" />
          <span class="style1">*</span></td>
      </tr>
       -->
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;主管</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <input type="text" class="shuru" maxlength="30" name="departmentVO.depMaster"/>
          <span class="style1"></span></td>
      </tr>
      <tr>
		 <td height="5" bgcolor="#ECFBFF" class="ziti">&nbsp;联系电话</td>
        <td width="38%" class="right" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" maxlength="20" property="departmentVO.depPhone" value="" onkeyup ="javascript:checkDepPhone();"/>
          <span class="style1"></span></td>
        <td class="left" bgcolor="#FFFFEC">&nbsp;</td>
      </tr>
      <tr>
       <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;地址</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" maxlength="200" style="width:286pt" property="departmentVO.depAddress" value=""/>
          <span class="style1"></span></td>
      </tr>
      <tr>
        <td height="5" bgcolor="#ECFBFF" class="ziti">&nbsp;备注</td>
        <td class="right" bgcolor="#FFFFEC">&nbsp;
          <html:textarea cols="60" styleClass="shuru" rows="3" property="departmentVO.depRemark" value="" onkeyup ="javascript:checkDepRemark();"></html:textarea></td>
        <td width="33%" class="left" bgcolor="#FFFFEC">&nbsp;&nbsp; 限字 150</td>
      </tr>
      <tr bgcolor="#ECFBFF">
        <td height="27" colspan="3">&nbsp;<span class="ziti">加 <span class="style1">*</span> 的内容必须填写</span></td>
      </tr>
      <tr >
        <td height="24" colspan="3" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center">
            <html:submit styleClass="ziti" value="确定" onclick="return oncheck();"/>
            <!-- &nbsp;
            <html:reset styleClass="ziti" value="重置"/> -->
            &nbsp;
            <html:button styleClass="ziti" value="取消" property="Submit3" onclick="return RZback();"/>
        </div></td>
      </tr>
</table>

</html:form>
<p>　</p>
</body>
</html:html>
