<%@ page contentType="text/html; charset=gb2312"%>

<html>
	<head>
		<link href="<%=request.getContextPath()%>/css/border.css"
			rel="stylesheet" type="text/css">

		<style type="text/css">
		<!--
		.style1 {
			font-size: 10px
		}
		;
		
		-->
		</style>
		<script language="JavaScript1.3" src="../script/basecss.js"></script>
		<script language="JavaScript1.3" src="../script/utilities.js"></script>
		<script language="JavaScript1.3" src="../script/message.js"></script>
		<script language="javascript"
			src="<%=request.getContextPath()%>/script/checkdata.js"></script>
		<script language="javascript"
			src="<%=request.getContextPath()%>/script/message.js"></script>
		<script language="javascript"
			src="<%=request.getContextPath()%>/script/usecalendar.js"></script>
		<script language="javascript"
			src="<%=request.getContextPath()%>/script/calendar.js"></script>
		<script language=javascript>

		function done()
		{		
			if(!check()){
				return;
			}
		    window.document.form1.MAIN_PURPOSE.value = "/jsp/information/info_newsInfoEditRslt.jsp";
		    window.document.form1.submit();
				
		}
		
		function check(){
		if (document.form1.dateFrom.value.length>0)
		{
			if (document.form1.dateFrom.value.length!=10){
			  alert("日期格式不符合规范");
			  document.form1.dateFrom.focus();
			  return false;
		}
		
		if (isDate(document.form1.dateFrom.value,'/')==false)
		{
		  alert("日期格式不符合规范");
		  document.form1.dateFrom.focus();
			  return false;
		}
		
		}
		if (document.form1.dateTo.value.length>0)
		{
			if (document.form1.dateTo.value.length!=10){
			  alert("日期格式不符合规范");
			  document.form1.dateTo.focus();
			  return false;
			}
		
		if (isDate(document.form1.dateTo.value,'/')==false)
		{
		  alert("日期格式不符合规范");
		  document.form1.dateTo.focus();
			  return false;
		}
		}
		return true;
		}
		
		function changekind(){
		   var value = document.form1.kind.options[document.form1.kind.selectedIndex].value;
		   var t_name = document.form1.kind.options[document.form1.kind.selectedIndex].text;
		   document.form1.newskind.value=t_name;
		}
		
		function getMenuName(){
			var menu1 = document.getElementById("menu1").value;
			var menu2 = document.getElementById("menu2").value;
			var menu3 = document.getElementById("menu3").value;
			if(menu3!=""){
				document.all["menuName"].value = menu3;
			}else if(menu2!=""){
				document.all["menuName"].value = menu2;
			}else if(menu1!=""){
				document.all["menuName"].value = menu1;
			}
			window.document.form1.submit();
		}
				
		</script>
	</head>
	<body>
		<br>
		<br>

		<form method="post" action="<%=request.getContextPath() %>/somInfomationAction.do" name="form1">
			<input type="hidden" name="actionType" value="7" />
			<input type="hidden" name="menuName" value="" id="menuName" />
			<input type="hidden" name="state" value="0"/>
			<table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td>
						<table width="90%" border="0" cellspacing="1" cellpadding="1"
							bgcolor="#B7DBFF">
							<tr>
								<td width="" bgcolor="#663399" colspan="2">
									<font color="#FFFFE8"><b> <font color="#FFFFFF">搜索信息</font>
									</b>
									</font>
								</td>
							</tr>

							<tr>
								<td bgcolor="#ECFBFF" width="">
									<span class="ziti">&nbsp;新闻标题</span>
								</td>
								<td bgcolor="#FFFFE8" colspan="">
									&nbsp;&nbsp;
									<input type="text" name="title" id="title" size="64" />
								</td>
							</tr>
							<tr>
								<td bgcolor="#ECFBFF">
									<span class="ziti">&nbsp;栏目信息</span>
								</td>
								<td bgcolor="#FFFFE8">
									<jsp:include page="../../../common/somUserMenu.jsp" />
								</td>
							</tr>
							<tr>
								<td bgcolor="#ECFBFF">
									<span class="ziti">&nbsp;信息发布日期</span>
								</td>
								<td colspan="" bgcolor="#FFFFE8">
									&nbsp;&nbsp;
									<input type="text" name="releasetime_start" value=""
										class="shuru" size="9" />
									&nbsp;
									<img style="cursor: hand;" id="releasetime_start_img"
										src="<%=request.getContextPath()%>/image/timer.gif" width="16"
										height="16" border="0" alt="请选择日期"
										onClick="setday(this,document.all.releasetime_start);">
									&nbsp;至&nbsp;
									<input type="text" name="releasetime_end" value=""
										class="shuru" size="9" />
									&nbsp;
									<img style="cursor: hand;" id="releasetime_end_img"
										src="<%=request.getContextPath()%>/image/timer.gif" width="16"
										height="16" border="0" alt="请选择日期"
										onClick="setday(this,document.all.releasetime_end);">
								</td>
							</tr>
							<tr>
								<td bgcolor="#ECFBFF">
									<span class="ziti">&nbsp;内容</span>
								</td>
								<td width=80% class=tablebody2 bgcolor="#FFFFE8">
									&nbsp;&nbsp;
									<input type="text" name="content" id="content" size="64" />
								</td>
							</tr>

							<tr align="center">
								<td colspan="2" bgcolor="#FFFFE8">
									<input type="button" name="Submit1" value="查询"
										onclick="javascript:getMenuName(); return false;">
									&nbsp;&nbsp;&nbsp;
									<input type="button" name="Submit2" value="取消"
										onclick="javacript:document.form1.reset(); return false;">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>