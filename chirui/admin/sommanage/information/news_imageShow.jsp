<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*"%>
<%@ page import="crjd.common.upload.ToolKit"%>
<%@ page import="crjd.common.Toolkit"%>

<%@ page import="org.hibernate.Session"%>
<%@ page import="org.hibernate.SessionFactory"%>
<%@ page import="org.springframework.context.ApplicationContext"%>
<%@ page import="org.springframework.orm.hibernate3.SessionFactoryUtils"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%
	String fujianBH = ToolKit.toUnicode(request.getParameter("fujianBH").trim());
	String SqlStr = " Select FILEPATH  From  SOM_FILE Where FILE_ID='" + fujianBH + "'";
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

		rs = stmt.executeQuery(SqlStr);// ²éÑ¯

		if (rs.next()) {
			fujianpath = rs.getString("FILEPATH");
		} else {
			out.println("ÎÞÍ¼Æ¬");
		}
	} catch (SQLException ex) {
		throw new ServletException("Í¼Æ¬Ô¤ÀÀ³ö´í£¡");
	} finally {
		Toolkit.closeJdbcArgs(rs, stmt, conn);
		SessionFactoryUtils.releaseSession(sessions, sessionFactory);
	}
%>
<img src="<%=request.getContextPath()%>/<%=fujianpath%>" />