<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="../../../common/taglibs.jsp" %>
<%@ page import="crjd.common.Toolkit"%>
<html>
<%
String conditionString = Toolkit.dealNull(request.getParameter("conditionString"));
String conditionStringFlag = "";
String sucFlag = Toolkit.dealNull(request.getParameter("sucFlag"));


int conditionStringLen = conditionString.length();

if(conditionStringLen > 4) {
    conditionStringFlag = conditionString.substring(0,4);
}

if(conditionStringFlag.equals("0101")) {
    conditionString = conditionString.substring(4,conditionStringLen);
}
if(conditionStringFlag.equals("0101") && !(sucFlag.equals("1") || sucFlag.equals("0"))) {
%>
<script language="JavaScript" type="text/JavaScript">
//解决记住查询条件
var conditionString = "&conditionString=<%=conditionString%>";
var state = "&state=0&type=0";
window.location.replace("<%=request.getContextPath()%>/somInfomationAction.do?actionType=7"+conditionString + state);
</script>
<%
}
else {
%>
<%
String title = Toolkit.dealNull(request.getParameter("title"));
String menuName = Toolkit.dealNull(request.getParameter("menuName"));
String content = Toolkit.dealNull(request.getParameter("content"));
String releasetime_start = Toolkit.dealNull(request.getParameter("releasetime_start"));
String releasetime_end = Toolkit.dealNull(request.getParameter("releasetime_end"));
//System.out.println(menuName);
%>
<head>
	<meta http-equiv="Content-Type" content="text/html;" />
	<title>栏目信息管理</title>
	<link href="<%=request.getContextPath()%>/css/border.css" rel="stylesheet" type="text/css" />
	<script language="javascript" src="<%=request.getContextPath()%>/script/calendar.js"></script>
	<style type="text/css">
		table#list tbody.tb1 td {
			background-color: #ECFBFF;
		}
		table#list tbody.tb2 td {
			background-color: #FFFFEC;
		}
	</style>
	<script type="text/javascript">
	function add(){
		window.location.href = "<%=request.getContextPath()%>/admin/sommanage/information/apply.jsp";
	}
	
	function getConditionString(){
	
		var title = document.all["title"].value;
		var menuName = document.all["menuName"].value;
		var content = document.all["content"].value;
		var releasetime_start = document.all["releasetime_start"].value;
		var releasetime_end = document.all["releasetime_end"].value;
		
		//获取当前页码
		var currentPageNum = document.all["currentPageNum"].value;
	
		var conditionString = "&title="+title+"&menuName="+menuName+"&content="+content+"&releasetime_start="+releasetime_start+"&releasetime_end="+releasetime_end+"&currentPageNum="+currentPageNum;
	
		return conditionString;
	}
	
	function goLookOrEdit(actionType,key){

		document.all["actionType"].value = actionType;
   		document.all["key"].value = key;

   		document.all["conditionString"].value = getConditionString(); 
   		
		document.somInfomationForm.action="<%=request.getContextPath()%>/somInfomationAction.do";
		document.somInfomationForm.submit();
    }
    function RZback(){
		window.location.replace("<%=request.getContextPath()%>/admin/sommanage/information/info_NewsinfoEdit.jsp");
	}
	
	/****** --ajax 李小鹏 2009-07-14 ************************************/
	var xmlHttp;
	function creatXMLHttpRequest() {
		if (window.ActiveXObject) {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		else if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		}
	}
	/**-- 更改秋波阅读状态  参数 登录会员ID --*/
	function UpdataInfoState(infoid){
		creatXMLHttpRequest();
		var url = "<%=request.getContextPath()%>/servlet/updataInfoState?infoid=" + infoid;
		xmlHttp.open("GET",url,true);
		xmlHttp.send(null);
	}
	
function RZdel2(){
    var conditionString = getConditionString();
	document.all["conditionString"].value = "0101" +  conditionString;

	if(!RZdel()) {
	    document.all["conditionString"].value = conditionString;
	};
}
	</script>
</head>
<body>
<jsp:include page="../../../common/buttonPage.jsp" />
<form name="somInfomationForm" action="<%=request.getContextPath() %>/somInfomationAction.do" method="post">
	<input type="hidden" id="actionType" name="actionType" value=""/>
	<input type="hidden" id="key" name="key" value=""/>
	<input type="hidden" id="conditionString" name="conditionString" value=""/>
	<input type="hidden" id="state" name="state" value=""/>
	
	<input type="hidden" id="menuId" name="parentMenuId" value="${menuId}"/>
	<input type="hidden" id="menuLevel" name="menuLevel" value="${menuLevel}"/>
	
	<input type="hidden" id="title" name="title" value="<%=title %>"/>
	<input type="hidden" id="menuName" name="menuName" value="<%=menuName %>"/>
	<input type="hidden" id="content" name="content" value="<%=content %>"/>
	<input type="hidden" id="releasetime_start" name="releasetime_start" value="<%=releasetime_start %>"/>
	<input type="hidden" id="releasetime_end" name="releasetime_end" value="<%=releasetime_end %>"/>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="wudi">
				&nbsp;您现在的位置：网站管理 → 栏目管理 → 栏目信息管理
			</td>
		</tr>
	</table>
	
	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="20"></td>
	  </tr>
	</table>
	<table id="list" width="100%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
		<tr align="center" bgcolor="#B7DBFF">
			<td width="10%" height="20">
				<input type="checkbox" name="delkeys" onClick="return RZchose();" />
			</td>
			<td width="50%" align="left">
				<span class="ziti">&nbsp;&nbsp;新闻标题</span>&nbsp;
			</td>
			<td width="15%">
				<span class="ziti">创建日期</span>&nbsp;
			</td>
			<td width="*%">
				<span class="ziti">&nbsp;新闻发布人</span>&nbsp;
			</td>			
			<td width="*%">
				<span class="ziti">操作</span>&nbsp;
			</td>
		</tr>
		<%int i=0; %>
		<c:forEach items="${list}" var="somInfomation" varStatus="index" >
			
				<tbody class="${ (index.count%2 != 0) ? 'tb1' : 'tb2' }">
					<tr bgcolor="#E2FAFE">
						<td>
							<div align="center">
								<input type="checkbox" name="keys"
											value="${somInfomation.id}" />
							</div>
						</td>
						<input type="hidden" name="infoid<%=i%>" value="${somInfomation.id}" />
						<td>
							<div align="left">&nbsp;
								<c:out value="${somInfomation.titles}"/>
							</div>
						</td>
						<td>
							<div align="center">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${somInfomation.createtime}"/>
							</div>
						</td>
						<td>
							<div align="center">
								<c:out value="${somInfomation.promulgator}"/>
							</div>
						</td>
						<td align="center">
							<a href="javascript:goLookOrEdit('3','${somInfomation.id}')">修改</a> &nbsp;&nbsp;&nbsp;&nbsp;
							<a href="<%=request.getContextPath()%>/somInfomationAction.do?actionType=4&key=${somInfomation.id}" title="查看栏目详细">详细</a>
						</td>
					</tr>
					<%i++; %>
				</tbody>
		</c:forEach>
	
	</table>
	<table width="100%" height="33" border="1" cellpadding="0" cellspacing="0" bordercolor="#DEE5EF" style="border-collapse: collapse">
		<tr>
			<td height="30" class="wushang" width="100%" valign="middle">
				<table width="15%" border="0">
					<tr>
						<td valign="middle" width="30" id="RZdel" style="">
							<input type="button" class="ziti" value="删除" onClick="return RZdel2();"/>
						</td>
						<c:if test='${menuLevel !=1}'>
						<td id="RZdel">
							<input type="button" class="ziti" value="返回" onClick="return RZback();"/>	
							
						</td>
						</c:if>
					
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<jsp:include page="../../../common/splitPage.jsp" />
</form>

</body>
	<%if(i!=0){ %>
	<script type="text/javascript">
	function UpdataInfoID(){
		var infoid = document.all["infoid0"].value;
		//alert("infoid=="+infoid);
		UpdataInfoState(infoid);
	}
	UpdataInfoID();
	</script>
	<%} %>
</html>
<%
}
%>
