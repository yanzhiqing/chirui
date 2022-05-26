<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="crjd.model.admin.system.menu.MenuVO,crjd.common.SessionContainer" %>
<%
/**
 *修改历史：
 *2006-10-18	陈应祥	增加对Session失效的判断
**/
%>
<html>
<head>
<title>
sysinfo
</title>
<link href="left.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#eef8f9">
<table height="17" width="100%"  border="0" cellspacing="0" background="<%=request.getContextPath()%>/images/botbg.gif" >
<tr>
<td></td>
</tr>
</table>
<table height="10" width="100%"  border="0" cellspacing="0" >
<tr>
<td></td>
</tr>
</table>
<!--table border=0  align="center" >
      <div class="ziti" width="100%">
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="25"></td>
          <td width="100" class="ziti" nowrap="nowrap" >系统信息</td>
          <td width="50"></td>
          <td class="tabBg"></td>
        </tr>
      </table>
    </div>
  </table-->
  <%			   
			   SessionContainer sc=(SessionContainer)session.getAttribute("sessionContainer");
			   if (sc!=null){
  %>
  <table width="100%"  border="0" cellspacing="1" class="fontss">
            <tr>
               
              <td width="23%" height="20"><div align="right"><img src="<%=request.getContextPath()%>/images/iconman.GIF" width="16" height="16"></div></td>
              <td width="77%" class="menu_list">用户：<%=sc.getUserName()%> </td>
            </tr>
            <tr>
              <td height="4"><div align="right"><img style="cursor: hand;" src="<%=request.getContextPath()%>/images/timer.gif" width="16" height="16"></div></td>
                <td height="4" class="menu_list">
                  <script language="JavaScript">
                  today=new Date();
                  function initArray(){
                    this.length=initArray.arguments.length
                    for(var i=0;i<this.length;i++)
                    this[i+1]=initArray.arguments[i]  }
                    var d=new initArray(
                    "星期日",
                    "星期一",
                    "星期二",
                    "星期三",
                    "星期四",
                    "星期五",
                    "星期六");
                    document.write(
                    "<font color=#476884 style='font-size:12px;font-family: 新宋体'> ",
                    today.getYear(),"年",
                    today.getMonth()+1,"月",
                    today.getDate(),"日",
                    "</font>" );
                    </script>
                </td>
            </tr>
            <tr>
              <td height="5">&nbsp;</td>
              <td height="5" class="menu_list">
                <script language="JavaScript">
                if (document.layers)
                document.write('<ilayer id="clockmain" height=20><layer id="clock" width="100%"></layer></ilayer>');
                else
                document.write("<div><span id='clock'></span></div>");
                var now,hours,minutes,seconds,timeValue;
                function showtime(){
                  if (!document.layers&&!document.all) return;
                  now = new Date();
                  hours = now.getHours();
                  minutes = now.getMinutes();
                  seconds = now.getSeconds();
                  timeValue ="";
                  timeValue += ((hours > 12) ? hours : hours) + "时";
                  if(10>minutes){
                    timeValue += "0" + minutes + "分";
                  }else{
                    timeValue += minutes + "分";
                  }
                  if(10>seconds){
                    timeValue += "0" + seconds + "秒";
                  }else{
                    timeValue += seconds + "秒";
                  }
                  if (document.layers){
                    document.clockmain.document.clock.document.write(timeValue);
                    document.clockmain.document.clock.document.close();
                    }
                    else if (document.all)
                    clock.innerHTML = timeValue;
                    setTimeout("showtime()",100);
                    }
                    window.onload=showtime;
                </script>
              </td>
            </tr>
          </table>
		  <%
		  }
		  %>
      </body>
</html>
