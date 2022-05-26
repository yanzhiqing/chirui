<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="crjd.common.SplitPageParameter,crjd.common.SessionContainer" %>
<link href="border.css" rel="stylesheet" type="text/css">
<%
	SessionContainer sContainer = (SessionContainer)session.getAttribute("sessionContainer");
	//System.out.println("flag 4444444= "+sContainer.getActionType());
    crjd.common.SplitPageParameter  splitPageParameter = (crjd.common.SplitPageParameter)session.getAttribute("splitPageParameterSys");
    String key = (String) request.getAttribute("key"); //会员ID
    String memberid = (String) request.getAttribute("memberid"); //会员ID
    
    if(splitPageParameter.getIsSplitPage().equals("0")){
%>
    <script >
     function onSplit(pageNum){
         var conditionString = "";

		 if(document.all["conditionString"] != null) {
		    //吴江栋20060829add 目的：解决记住查询条件问题
			//alert("wjd111");
			
			conditionString = getConditionString();
			
		 }
		 //viewRecordNum = document.forms[0].viewRecordNum.value;
         //alert(document.forms["0"].titleQuery.value);
		 //alert("wjd222");
		 
         window.location.replace(document.forms["0"].action+"?actionType=<%=sContainer.getActionType()%>&currentPageNum="+pageNum+conditionString + "&key=<%=key%>" + "&memberid=<%=memberid%>&flag="+document.forms["0"].flag.value+"&titleQuery="+document.forms["0"].titleQuery.value);
     }
     function forwardNextPage(){
         // pageNum = document.forms["0"].currentPageNum.value;
		  pageNum = document.all["currentPageNum"].value;//获取要跳转的页面
		  
          onSplit(pageNum); //吴江栋20060829add 目的：解决记住查询条件问题
     }
   </script>

<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="55"><div align="center" class="ziti"> 共有<%=splitPageParameter.getTotalRecordNum()%>条记录&nbsp;&nbsp;当前<%=splitPageParameter.getStartRecordNum()+1%>-<%=splitPageParameter.getEndRecordNum()%>条&nbsp;&nbsp;第<%=splitPageParameter.getCurrentPageNum()%>/<%=splitPageParameter.getMaxPageNum()%>页&nbsp;&nbsp;
    	<%if(splitPageParameter.getCurrentPageNum()>1){%>
          	<span onclick="onSplit(1)" style="CURSOR: hand"><u><font color="#419BF5">首页</font></u></span>
          	<span onclick="onSplit(<%=splitPageParameter.getCurrentPageNum()-1 %>)" style="CURSOR: hand">
          	<u><font color="#419BF5">上页</font></u></span>
        	
       <%}else {%>
       <span  style="CURSOR: hand"><font color="black">首页</font></span>
          	<span style="CURSOR: hand">
          	<font color="black">上页</font></span>
       <%}%>
       <%if(splitPageParameter.getMaxPageNum()>splitPageParameter.getCurrentPageNum()){%>
              <span onclick="onSplit(<%=splitPageParameter.getCurrentPageNum()+1 %>)" style="CURSOR: hand"><u><font color="#419BF5">下页</font></u></span>
              <span onclick="onSplit(<%=splitPageParameter.getMaxPageNum() %>)" style="CURSOR: hand"><u><font color="#419BF5">尾页</font></u></span>&nbsp;&nbsp;
       <%}else{%>
          <span style="CURSOR: hand"><font color="black">下页</font></span>
              <span style="CURSOR: hand"><font color="black">尾页</font></span>&nbsp;&nbsp;

       <%}%>
       跳转第
           <select name="currentPageNum" class="shuru"  onChange="forwardNextPage()">
             <%for(int i = 1 ; i < splitPageParameter.getMaxPageNum() + 1 ;i++){%>
             <option <%=splitPageParameter.getCurrentPageNum()==i?"selected":""%> value="<%=i%>"><%=i%></option>
             <%}%>
           </select>
    页&nbsp;&nbsp;每页<%=splitPageParameter.getViewRecordNum() %>条</div></td>
  </tr>
</table>

  <%}else{%>
        <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
         <tr class="ziti">
           <td height="25"  class="ziti">&nbsp;&nbsp; </td>
           <td height="25" align=right class="ziti">&nbsp;&nbsp;</td>
        <td height="25" align=right  class="ziti">&nbsp;&nbsp;</td>
         </tr>
        </table>
  <%}%>
