<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.util.*"%>
<%
	//String sContent = new String(request.getParameter("content1").getBytes("iso-8859-1"));
	
	String sContent= request.getParameter("content");
	String b3=request.getParameter("b3");
	System.out.print("ȡ�õ�html��ǣ�"+"\n"+sContent+b3+"\n"+"222��Ҫ������ܳ�����upload.jsp��ĵ�202�е�setHtml()");
        out.println("�༭���������£�<br><br>"+sContent);
        out.println(
        "<br><br><p><input type=button value=' �˻� ' onclick='history.back()'></p>");
%>
