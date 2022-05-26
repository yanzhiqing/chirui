<%
/**
 * 查询系统日志信息页面
 * <p>Title: admin/system/user/show.jsp </p>
 * <p>Description: 2006-06-01</p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: RZGL</p>
 * @author eqzhou
 * @version 1.0
 */
%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="crjd.model.admin.system.user.UserInfoVO,crjd.common.SessionContainer" %>

<html:html>
<head>
  <html:base/>
<meta http-equive="Cache-Control" content="no-cache"/>
<title>系统日志查询</title>
<link href="<%=request.getContextPath()%>/css/border.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>

<script  language="javascript" src="<%=request.getContextPath()%>/script/checkdata.js"></script>
<script  language="javascript" src="<%=request.getContextPath()%>/script/message.js"></script>
<script  language="javascript" src="<%=request.getContextPath()%>/script/calendar.js"></script>
<script language="JavaScript" type="text/JavaScript">
function riqi(para){
  inputDate(para);
}
function RZback(){
  window.location.replace("<%=request.getContextPath()%>/systemLogAction.do?actionType=0");
}
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

   if(!rigorCheckValue(document.all["systemLogVO.startTime"],0,4,0,0,"查询开始时间")){
     return false;
   }else if(!rigorCheckValue(document.all["systemLogVO.endTime"],0,4,0,0,"查询结束时间")){
     return false;
   }
   return true;
}
/*===================================================
功能：使【查询开始时间（systemLogVO.startTime）】输入框只能输入数据
输入：
输出：
作者：李永祥
===================================================*/
function checkStartTime() {
	var num = document.all["systemLogVO.startTime"];

	checkNum(num);

	return;
}

/*===================================================
功能：使【查询结束时间（systemLogVO.endTime）】输入框只能输入数据
输入：
输出：
作者：李永祥
===================================================*/
function checkEndTime() {
	var num = document.all["systemLogVO.endTime"];

	checkNum(num);

	return;
}
</script>

</head>

<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="wudi">&nbsp;您现在的位置：系统维护  → 系统日志 → 系统日志查询</td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="43">&nbsp;</td>
  </tr>
</table>

<html:form action="/systemLogAction.do" method="post">

  <input type="hidden" name="actionType" value="7"/>

<table width="70%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
      <tr>
        <td height="24" colspan="3" class="ziti" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center"><span class="header">系统日志查询</span></div></td>
      </tr>
      <tr>
        <td  height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;查询开始时间</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="systemLogVO.startTime"  size="20" maxlength="12"/>&nbsp;
          <img alt="请选择日期" style="cursor: hand;" src="<%=request.getContextPath()%>/images/timer.gif" onClick="setday(this,document.all['systemLogVO.startTime']);"/>
		  </td>
      </tr>
      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;查询结束时间</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="systemLogVO.endTime"  size="20" maxlength="12"/>&nbsp;
          <img alt="请选择日期" style="cursor: hand;" src="<%=request.getContextPath()%>/images/timer.gif" onClick="setday(this,document.all['systemLogVO.endTime']);"/>
          </td>
      </tr>

      <tr>
        <td height="22" bgcolor="#ECFBFF" class="ziti">&nbsp;操作人员</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="systemLogVO.operationUser" size="20" maxlength="30"/>
          <span class="style1"></span></td>
      </tr>
      <tr>
        <td height="5" bgcolor="#ECFBFF" class="ziti">&nbsp;操作内容</td>
        <td width="38%" class="right" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="systemLogVO.operationContent" size="20" maxlength="200"/>
          <span class="style1"></span></td>
        <td class="left" bgcolor="#FFFFEC"> &nbsp;</td>
      </tr>
      <tr>
        <td height="5" bgcolor="#ECFBFF" class="ziti">&nbsp;操作类型</td>
        <td width="38%" class="right" bgcolor="#FFFFEC">&nbsp;
    <html:select property="systemLogVO.operationType" style="width=133px;">
      <html:option value="">--请选择--</html:option>
      <html:option value="添加">添加</html:option>
      <html:option value="修改">修改</html:option>
      <html:option value="删除">删除</html:option>
    </html:select>
          <span class="style1"></span></td>
        <td class="left" bgcolor="#FFFFEC">&nbsp;</td>
      </tr>
      <tr>
        <td height="5" bgcolor="#ECFBFF" class="ziti">&nbsp;日志类型</td>
        <td width="38%" class="right" bgcolor="#FFFFEC">&nbsp;
    <html:select property="systemLogVO.operatorRole" style="width=133px;">
      <html:option value="">--请选择--</html:option>
      <html:option value="系统管理日志">系统管理日志</html:option>
      <html:option value="系统操作日志">系统操作日志</html:option>
    </html:select>
          <span class="style1"></span></td>
        <td class="left" bgcolor="#FFFFEC">&nbsp;</td>
      </tr>
      <tr >
        <td height="24" colspan="3" background="<%=request.getContextPath()%>/images/di.jpg"><div align="center">
            <html:submit styleClass="ziti" value="查询"  onclick="return oncheck()"/>
             &nbsp;
            <html:reset styleClass="ziti" value="重置"/>
            &nbsp;
            <html:button styleClass="ziti" value="取消" property="Submit3" onclick="return RZback();"/>
        </div></td>
      </tr>
</table>
</html:form>
<p>　</p>
</body>
</html:html>
