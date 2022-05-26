<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="crjd.common.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java"%>
<%@ page import="crjd.common.upload.ToolKit"%>
<%@ page import="crjd.common.Toolkit"%>

<%@ page import="org.hibernate.Session"%>
<%@ page import="org.hibernate.SessionFactory"%>
<%@ page import="org.springframework.context.ApplicationContext"%>
<%@ page import="org.springframework.orm.hibernate3.SessionFactoryUtils"%>
<%@ page
	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%
	out.println("您上传的这张图片地址为:");
%><html>
	<head>
		<title>获取图片地址</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<style type="text/css">
<!--
.cn1 {
	font-family: "宋体";
	font-size: 14px;
	font-weight: bold;
	color: #000000
}

.cn2 {
	font-family: "宋体";
	font-size: 9pt;
	color: #CC0000
}

.cn3 {
	font-family: "宋体";
	font-size: 9pt;
	line-height: 18px;
	color: #666666
}
-->
</style>
	</head>
	<%
		String fujianBH = ToolKit.toUnicode(request
				.getParameter("fujianBH").trim());
		String SqlStr = " Select FILEPATH  From  SOM_FILE Where FILE_ID='"
				+ fujianBH + "'";
		String fujianpath = "";

		SessionFactory sessionFactory = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Session sessions = null;

		try {
			ApplicationContext app = WebApplicationContextUtils
					.getWebApplicationContext(this.getServletContext());
			sessionFactory = (SessionFactory) app.getBean("sessionFactory");
			sessions = sessionFactory.openSession();
			conn = sessions.connection();
			stmt = conn.createStatement();

			rs = stmt.executeQuery(SqlStr);// 查询

			if (rs.next()) {
				fujianpath = rs.getString("FILEPATH");
			} else {
				out.println("无图片");
			}
		} catch (SQLException ex) {
			throw new ServletException("图片预览出错！");
		} finally {
			Toolkit.closeJdbcArgs(rs, stmt, conn);
			SessionFactoryUtils.releaseSession(sessions, sessionFactory);
		}
	%>
	<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="7">
		<table width="500" border="0" cellspacing="2" cellpadding="2"
			class="cn9" align="center">
			<tr>
				<td class="cn3" valign="top">
					<br>
					<input type="hidden" id="GoodLuckURL" value='' name="hidden">
					<input type="hidden" id="fujianpath" value='<%=fujianpath%>'
						name="fujianpath">
					<SCRIPT LANGUAGE="JavaScript">
					var fujianpath = document.all["fujianpath"].value;
	  var local = window.location.protocol + '//'+ window.location.host +'<%=request.getContextPath()%>/'+fujianpath;
	  window.hidden.value = local;
	  </script>
					<br>
					<br>
					<font face="Verdana, Arial, Helvetica, sans-serif" color="#CC0000"
						size="3"><script language="javascript">document.write(local);</script>
					</font>
					<br>
					<br>
					请您点击右侧的按钮复制上面的地址到您下面添加图片的地方
					<input type="button" name="Submit3" value="复制图片地址"
						onClick="javascript:GoodLuckURL.createTextRange().execCommand('Copy');this.value='成功复制';">
					<br>

				</td>
			</tr>
			<tr>
				<td class="cn2" valign="bottom" height="100" align="right">
					<a href=javascript:window.close()>－关闭窗口－</a>
				</td>
			</tr>
		</table>
	</body>
</html>

