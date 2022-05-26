<%/**
 * 展示国家信息列表页面
 * <p>Title:admin/information/country/show.jsp</p>
 * <p>Description: 2006-11-08</p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: RZGL</p>
 * @author 李永祥
 * @version 1.0
 */%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/user-tag.tld" prefix="user-tag" %>
<!-- 李永祥20060924add 目的：解决记住查询条件问题 -->
<%@ page import="crjd.model.admin.information.country.CountryInfoVO" %>
<%@ page import="crjd.common.Toolkit" %>
<%@ page contentType="text/html; charset=GBK" %>
<%
	String conditionString = Toolkit.dealNull(request.getParameter("conditionString"));
String conditionStringFlag = "";
String sucFlag = Toolkit.dealNull(request.getParameter("sucFlag"));


int conditionStringLen = conditionString.length();

if(conditionStringLen > 4) {
    conditionStringFlag = conditionString.substring(0,4);
}
////"0101"表示点击【添加】【删除】或【修改】返回（李永祥20060924 目的：解决记住查询条件问题）
if(conditionStringFlag.equals("0101")) {
    conditionString = conditionString.substring(4,conditionStringLen);
}
if(conditionStringFlag.equals("0101") && !(sucFlag.equals("1") || sucFlag.equals("0"))) {
%>
<script language="JavaScript" type="text/JavaScript">
//（李永祥20060924add 目的：解决记住查询条件问题）
var conditionString = "&conditionString=<%=conditionString%>";

window.location.replace("<%=request.getContextPath()%>/countryInfoAction.do?actionType=7"+conditionString);
</script>
<%
	}
else {
%>
<html>
<head>
  <html:base/>
<meta http-equive="Cache-Control" content="no-cache"/>
<title>国家信息</title>
<link href="<%=request.getContextPath()%>/css/border.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {font-size: 10px};
-->
</style>

<script language="javascript" src="<%=request.getContextPath()%>/script/checkdata.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/script/message.js"></script>
<script  language="javascript" src="common.js"></script>
<script language="JavaScript" type="text/JavaScript">
 function RZdel2() {

    var conditionString = getConditionString();

    //"0101"表示点击【添加】【删除】或【修改】返回（李永祥20060925add  目的：解决记住查询条件问题）
	document.all["conditionString"].value = "0101" +  conditionString ;
  
	if(!RZdel()) {
	    document.all["conditionString"].value = conditionString;
	};
}

/*===================================================
功能：在查询页面点击【添加】键触发的事件
===================================================*/
function RZadd(){
    var conditionString = getConditionString();
	//alert(conditionString);

	window.location.replace("<%=request.getContextPath()%>/admin/information/country/apply.jsp?"
	+ conditionString );
}


/*===================================================
功能：进入“详细”或“修改”页面
===================================================*/
function goLookOrEdit(actionType,key){
	document.all["actionType"].value = actionType;
    document.all["key"].value = key;
    document.all["conditionString"].value = getConditionString();

	document.forms[0].action="<%=request.getContextPath()%>/countryInfoAction.do";
	document.forms[0].submit();
}

</script>
</head>

<jsp:include page="../../../common/buttonPage.jsp"/>
<body onLoad="return onlaoding();">

  <html:form action="/countryInfoAction.do" method="post" focus="countryInfoVO.continentCode">

<html:hidden property="actionType" value="0"/>
<!-- 李永祥20060925add  目的：解决记住查询条件问题 -->
  <html:hidden property="conditionString" value=""/>
  <html:hidden property="key" value=""/>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="wudi">&nbsp;您现在的位置：信息维护 → 国家信息</td>
  </tr>
</table>
<table width="100%"  border="0" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="20"></td>
  </tr>
</table>
<table width="100%" height="27"  border="0" cellpadding="0" cellspacing="0" bordercolor="#B7DBFF" style="border-collapse: collapse"  background="<%=request.getContextPath()%>/images/di.jpg">
  <tr> 
<%
 	//上次提交的查询条件（李永祥20060924add 目的：解决记住查询条件问题）
 String continentCode = Toolkit.dealNull(request.getParameter("countryInfoVO.continentCode"));
 String continent = Toolkit.dealNull(request.getParameter("countryInfoVO.continent"));
 String countryNo = Toolkit.dealNull(request.getParameter("countryInfoVO.countryNo"));
 String country = Toolkit.dealNull(request.getParameter("countryInfoVO.country"));
 String hiddenFlag = Toolkit.dealNull(request.getParameter("countryInfoVO.hiddenFlag"));
 %>
    <td width="9%" ><div align="right"><span class="ziti">洲区号&nbsp;</span></div></td>
    <td width="9%" bordercolor="#B7DBFF"><span class="ziti">&nbsp;
    <html:text styleClass="shuru" maxlength="30" property="countryInfoVO.continentCode" size="7" value="<%=continentCode%>"/>
    </span>
	</td>
    <td width="4%"><div align="right"><span class="ziti">&nbsp;洲&nbsp;</span></div></td>
    <td width="9%"><span class="ziti">
    <html:text styleClass="shuru" maxlength="100" property="countryInfoVO.continent" size="8" value="<%=continent%>"/>
    </span></td>
    <td width="9%"><div align="right"><span class="ziti">&nbsp;国家代号&nbsp;</span></div></td>
    <td width="10%"><span class="ziti">
    <html:text styleClass="shuru" maxlength="10" property="countryInfoVO.countryNo" size="10" value="<%=countryNo%>"/>
    </span></td>
    <td width="10%" ><div align="right" ><span class="ziti">&nbsp;国家或地区</span></div></td>
    <td width="16%"><span class="ziti">&nbsp;
    <user-tag:countryTag styleClass="shuru" property="countryInfoVO.country" style="width:150px;" value="<%=country%>"/>
    <!-- <html:text styleClass="shuru" maxlength="10" property="countryInfoVO.country" size="15" value="<%=country%>"/> -->
    </span></td>
	<td width="8%">&nbsp;是否上架</td>
    <td width="">&nbsp;
	    <html:select styleClass="shuru" property="countryInfoVO.hiddenFlag" value="<%=hiddenFlag%>">
		        <html:option value="">-请选择-</html:option>
                <html:option value="0" >下架</html:option>
                <html:option value="1" >上架</html:option>
          </html:select>
    <td width="11%">&nbsp;&nbsp;
	  <html:submit styleClass="ziti" value="查询" property="Submit4" onclick="return RZquery();"/>
    </td>
  </tr>
</table>
<table width="100%"  border="0" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="20"></td>
  </tr>
</table>
<table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
  <tr align="center" bgcolor="#B7DBFF">
    <td width="6%" height="20"><input type="checkbox" name="delkeys" onClick="return RZchose();"/></td>
    <td width="10%"><div align="center" class="ziti"> 洲区号</div></td>
    <td width="18%"><span class="ziti">洲</span>&nbsp;</td>
	<td width="14%"><span class="ziti">国家代号</span>&nbsp;</td>
	<td width="22%"><span class="ziti">国家或地区</span>&nbsp;</td>
    <td width="10%"><div align="center" class="ziti">操作</div></td>
  </tr>
  <logic:present name="list" scope="request">
    <logic:iterate id="bean" name="list" scope="request" type="crjd.model.admin.information.country.CountryInfoVO" indexId="ind">
<%
String bgcol = "#FFFFEC";

if( (ind.intValue()%2) != 0){
    bgcol = "#ECFBFF";
}
%>
  		<tr bgcolor="#E2FAFE">
    			<td height="21" bgcolor="<%=bgcol%>"><div align="center">
      				<input type="checkbox" name="keys" value="<bean:write name="bean" property="couRowId"/>"/>
    			</div></td>
                <td bgcolor="<%=bgcol%>"><div align="center" class="ziti">&nbsp;<bean:write name="bean" property="continentCode"/></div></td>
    			<td bgcolor="<%=bgcol%>"><div align="center" class="ziti">&nbsp;<bean:write name="bean" property="continent"/></div></td>
    			<td bgcolor="<%=bgcol%>"><div align="center">&nbsp;<bean:write name="bean" property="countryNo"/></div></td>
				<td bgcolor="<%=bgcol%>"><div align="center">&nbsp;<bean:write name="bean" property="country"/></div></td>
    			<td bgcolor="<%=bgcol%>">
				  <table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
				   <td>
		                        <div align="center" id="RZlook" style="display:none">
					 <a href="javascript:goLookOrEdit('4','<bean:write name='bean' property='couRowId'/>')">详细</a>
				        </div>
                                  </td>
                                  <td>
	                            <div align="center" id="RZedit" style="display:none">
				    <a href="javascript:goLookOrEdit('3','<bean:write name='bean' property='couRowId'/>')">修改</a>
	                           </div>
	                       </td>
            <td id="RZlook"></td>
            <td id="RZedit"></td>
				  </table>
				</td>
  		</tr>

    </logic:iterate>
  </logic:present>
</table>
<table width="100%" height="33"  border="1" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
  <tr>
    <td height="30" class="wushang" width="100%" valign="middle">
      <table width="15%" border="0">
        <tr>
            <td valign="middle" width="30" id="RZdel" style="display:none">
               <html:button styleClass="ziti"  value="删除"   property="del2" onclick="return RZdel2();"/></td>  
               <td valign="middle" width="30" style="display:none" id="RZadd">
			   <html:button  styleClass="ziti" value="添加"   property="add13" onclick="return RZadd();"/></td>
               <!-- <td valign="middle" width="30" style="display:none" id="RZsearch"><html:button styleClass="ziti"  value="详细查询"  property="add132" onclick="return RZsearch();"/> -->
           
            <td id="RZadd"></td>
            <td id="RZdel"></td>
        </tr>
      </table>
     </td>
  </tr>
</table>
<input type="hidden" name="popmun" value=""/>
<jsp:include page="../../../common/splitPage.jsp"/>
<jsp:include page="../../../common/resultMessage.jsp"/>
 </html:form>
</body>
</html>
<%
}
%>
