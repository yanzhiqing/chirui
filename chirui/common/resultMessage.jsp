<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="crjd.common.SessionContainer" %>

<%

        SessionContainer sc = (SessionContainer)session.getAttribute("sessionContainer");
        if(sc == null){
          sc = new SessionContainer();
        }
	String type=(String)sc.getReturnType();
	if(type==null){
  		type="";
	}

        if(type.equals("1")){ %>

		<script language="javaScript">
                	alert("�����Ϣ�ɹ�");

                </script>

<%        }else if(type.equals("5")){ %>

		<script language="javaScript">
                	alert("�޸���Ϣ�ɹ�");
                </script>

<%        }else if(type.equals("8")||type.equals("2")){ %>

		<script language="javaScript">
                	alert("ɾ����Ϣ�ɹ�");
                </script>

<%        }

sc.setReturnType("0");
session.setAttribute("sessionContainer",sc);

%>
