<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="crjd.common.SplitPageParameter,crjd.common.SessionContainer" %>
<link href="border.css" rel="stylesheet" type="text/css">
<%
	SessionContainer sContainer = (SessionContainer)session.getAttribute("sessionContainer");
	//System.out.println("flag 4444444= "+sContainer.getActionType());
    crjd.common.SplitPageParameter  splitPageParameter = (crjd.common.SplitPageParameter)session.getAttribute("splitPageParameterSys");
    String key = (String) request.getAttribute("key"); //��ԱID
    String memberid = (String) request.getAttribute("memberid"); //��ԱID
    
    if(splitPageParameter.getIsSplitPage().equals("0")){
%>
    <script >
     function onSplit(pageNum){
         var conditionString = "";

		 if(document.all["conditionString"] != null) {
		    //�⽭��20060829add Ŀ�ģ������ס��ѯ��������
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
		  pageNum = document.all["currentPageNum"].value;//��ȡҪ��ת��ҳ��
		  
          onSplit(pageNum); //�⽭��20060829add Ŀ�ģ������ס��ѯ��������
     }
   </script>

<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="55"><div align="center" class="ziti"> ����<%=splitPageParameter.getTotalRecordNum()%>����¼&nbsp;&nbsp;��ǰ<%=splitPageParameter.getStartRecordNum()+1%>-<%=splitPageParameter.getEndRecordNum()%>��&nbsp;&nbsp;��<%=splitPageParameter.getCurrentPageNum()%>/<%=splitPageParameter.getMaxPageNum()%>ҳ&nbsp;&nbsp;
    	<%if(splitPageParameter.getCurrentPageNum()>1){%>
          	<span onclick="onSplit(1)" style="CURSOR: hand"><u><font color="#419BF5">��ҳ</font></u></span>
          	<span onclick="onSplit(<%=splitPageParameter.getCurrentPageNum()-1 %>)" style="CURSOR: hand">
          	<u><font color="#419BF5">��ҳ</font></u></span>
        	
       <%}else {%>
       <span  style="CURSOR: hand"><font color="black">��ҳ</font></span>
          	<span style="CURSOR: hand">
          	<font color="black">��ҳ</font></span>
       <%}%>
       <%if(splitPageParameter.getMaxPageNum()>splitPageParameter.getCurrentPageNum()){%>
              <span onclick="onSplit(<%=splitPageParameter.getCurrentPageNum()+1 %>)" style="CURSOR: hand"><u><font color="#419BF5">��ҳ</font></u></span>
              <span onclick="onSplit(<%=splitPageParameter.getMaxPageNum() %>)" style="CURSOR: hand"><u><font color="#419BF5">βҳ</font></u></span>&nbsp;&nbsp;
       <%}else{%>
          <span style="CURSOR: hand"><font color="black">��ҳ</font></span>
              <span style="CURSOR: hand"><font color="black">βҳ</font></span>&nbsp;&nbsp;

       <%}%>
       ��ת��
           <select name="currentPageNum" class="shuru"  onChange="forwardNextPage()">
             <%for(int i = 1 ; i < splitPageParameter.getMaxPageNum() + 1 ;i++){%>
             <option <%=splitPageParameter.getCurrentPageNum()==i?"selected":""%> value="<%=i%>"><%=i%></option>
             <%}%>
           </select>
    ҳ&nbsp;&nbsp;ÿҳ<%=splitPageParameter.getViewRecordNum() %>��</div></td>
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
