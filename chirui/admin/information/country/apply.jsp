<%
/**
 * 增加国家信息页面
 * <p>Title: admin/information/country/apply.jsp </p>
 * <p>Description: 2006-11-07</p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: RZGL</p>
 * @author 李永祥
 * @version 1.0
 */
%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="crjd.model.admin.information.country.CountryInfoVO,crjd.common.SessionContainer" %>
<%@page import="java.util.Vector,java.sql.*,java.text.*" %>

<!-- 李永祥20060925add 目的：解决记住查询条件问题 -->
<%@ page import="crjd.common.Toolkit" %>
<%@ page contentType="text/html; charset=GBK" %>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>国家信息</title>
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
    if(checkall()) {
	    
		//"0101"表示点击【添加】【删除】或【修改】返回（李永祥20060925add 目的：解决记住查询条件问题）
		document.all["conditionString"].value = "0101" +  document.all["conditionString"].value;

		return true;
	}
	else {
		return false;
	}
}
function RZback(){
  //（李永祥20060925add 目的：解决记住查询条件问题）
  var conditionString = document.all["conditionString"].value;

  window.location.replace("<%=request.getContextPath()%>/countryInfoAction.do?actionType=7"
  +conditionString);
}

  function checktype(valu){
    if(valu=="1"){
      document.all["div1"].style.display="block";
      }else{
         document.all["div1"].style.display="none";
        }
    }
</script>
</head>
<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="wudi">&nbsp;您现在的位置：信息维护 → 国家信息 → 国家信息添加</td>
  </tr>
</table>
<p>　</p>

<html:form action="/countryInfoAction.do" method="post" focus="countryInfoVO.continentCode">
<html:hidden property="temporaryFrame" value=""/> <!-- 用于临时倒信息 -->
  <input type="hidden" name="actionType" value="1"/>
<%
//上次提交的查询条件（李永祥20060925add  目的：解决记住查询条件问题）
String continentCode = Toolkit.dealNull(request.getParameter("countryInfoVO.continentCode"));
String continent = Toolkit.dealNull(request.getParameter("countryInfoVO.continent"));
String countryNo = Toolkit.dealNull(request.getParameter("countryInfoVO.countryNo"));
String country = Toolkit.dealNull(request.getParameter("countryInfoVO.country"));
String hiddenFlag = Toolkit.dealNull(request.getParameter("countryInfoVO.hiddenFlag"));
String currentPageNum = Toolkit.dealNull(request.getParameter("currentPageNum"));

String conditionString = "&countryInfoVO.continentCode="+continentCode+"&countryInfoVO.continent="+continent+"&countryInfoVO.countryNo="+countryNo+"&countryInfoVO.country="+country+"&currentPageNum="+currentPageNum;
%>
<!-- 李永祥20060925add 目的：解决记住查询条件问题 -->
<html:hidden property="conditionString" value="<%=conditionString%>"/>

	<table width="80%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
      <tr>
        <td height="24" colspan="6" class="ziti"  background="<%=request.getContextPath()%>/images/di.jpg"><div align="center"><span class="header">国家信息添加</span></div></td>
      </tr>
     <tr>
        <td height="20" bgcolor="#ECFBFF" class="ziti">&nbsp;洲区号</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="countryInfoVO.continentCode" value="" size="30" maxlength="30"/>
        </td>
        <td width="20%" height="24" bgcolor="#ECFBFF" class="ziti">&nbsp;洲</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="countryInfoVO.continent" value="" size="30" maxlength="100"/>
          <span class="style1">*</span></td>
      </tr>
      <tr>
        <td height="20" bgcolor="#ECFBFF" class="ziti">&nbsp;洲英文名</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="countryInfoVO.continentEn" value="" size="30" maxlength="100" onkeyup ="javascript:checkContinentEn();"/>
        </td>
        <td height="20" bgcolor="#ECFBFF" class="ziti">&nbsp;国家代号</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="countryInfoVO.countryNo" value="" size="30" maxlength="10"/>
          <span class="style1">*</span></td>
      </tr>
      <tr>
        <td height="20" bgcolor="#ECFBFF" class="ziti">&nbsp;国家或地区</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="countryInfoVO.country" value="" size="30" maxlength="100"
		  />
          <span class="style1">*</span></td>
        <td height="20" bgcolor="#ECFBFF" class="ziti">&nbsp;国家或地区英文名</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="countryInfoVO.countryEn" size="30" value="" maxlength="100"
		  onkeyup ="javascript:checkCountryEn();"/>
        </td>
      </tr>
	   <tr>
        <td height="20" bgcolor="#ECFBFF" class="ziti">&nbsp;地名代码</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="countryInfoVO.countryCode" size="30" value="" maxlength="10"/>
        <td height="20" bgcolor="#ECFBFF" class="ziti">&nbsp;邮政编码</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="countryInfoVO.postalCode" size="30" value="" maxlength="10"/>
          </td>
      </tr>
	  	  <tr>
        <td height="20" bgcolor="#ECFBFF" class="ziti">&nbsp;货币中文名称</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="countryInfoVO.curchNam" size="30" value="" maxlength="10"/>
		 </td>
        <td height="20" bgcolor="#ECFBFF" class="ziti">&nbsp;货币英文名称</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="countryInfoVO.curenNam" size="30" value="" maxlength="10"/>
          </td>
      </tr>
	  <tr>
        <td height="20" bgcolor="#ECFBFF" class="ziti">&nbsp;货币原有符号</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="countryInfoVO.oldSign" size="30" value="" maxlength="10"/>
		 </td>
        <td height="20" bgcolor="#ECFBFF" class="ziti">&nbsp;货币标准符号</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
          <html:text styleClass="shuru" property="countryInfoVO.staSign" size="30" value="" maxlength="10"/>
          </td>
      </tr>
	   <tr>
        <td height="20" bgcolor="#ECFBFF" class="ziti">&nbsp;是否上架</td>
        <td colspan="2" bgcolor="#FFFFEC">&nbsp;
	    <html:select styleClass="shuru" property="countryInfoVO.hiddenFlag" value="" style="width:100pt">
                <html:option value="0" >下架</html:option>
                <html:option value="1" >上架</html:option>
          </html:select></td>
		<td height="20" bgcolor="#ECFBFF" class="ziti">&nbsp;</td>
        <td bgcolor="#FFFFEC">&nbsp;</td>
		</tr>
      <tr bgcolor="#ECFBFF">
        <td height="27" colspan="6">&nbsp;<span class="ziti">加 <span class="style1">*</span> 的内容必须填写</span></td>
      </tr>
      <tr >
        <td height="22" colspan="6"  background="<%=request.getContextPath()%>/images/di.jpg"><div align="center">
            <html:submit styleClass="ziti" value="确定" onclick="return oncheck();"/>
            <!-- &nbsp;<html:reset styleClass="ziti" value="重置"/> -->
            &nbsp;<html:button styleClass="ziti" value="取消" property="fanhui" onclick="return RZback();"/>
        </div></td>
      </tr>
</table>
</html:form>
<p>　</p>
</body>
</html:html>