<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>
<title>
�û��˵���Ȩ
</title>
<script language="javascript" src="<%=request.getContextPath()%>/script/menuTree.js"></script>
<link href="<%=request.getContextPath()%>/css/menutree.css" rel="stylesheet" type="text/css" />
<script language="JavaScript">
function window_onload(){

	//initialize();
	
}

//�ύ���ĵ��û��˵�Ȩ��
function go_sub(){
    var str="";
	if(document.all["role"].length){
        for(var i=0;i<document.all["role"].length;i++){	        
			if(document.all["role"][i].checked==true){
				str +=document.all["role"][i].value +",";
	  		}
	      	document.all["menus"].value=str;
    	}
  	}
  	//alert(document.all["menus"].value);
  	return true;
}

</SCRIPT>
</head>
<body bgcolor="#FFFFFF" text="#000000" onLoad="window_onload();">
<br />
<br />
<table border=0 >
  <tr>
    	<td width="5%"></td>
	    <td>
			<script language="javascript" type="text/javascript">
			// add_item �Ĳ�����������Ϊ�������ţ������ظ�����id����������һ��ı�ţ�������ʾ�����ݣ��۵�ʱ��ͼ�ꣻչ��ʱ��ͼ�ꣻ��ַ�����ָ��Ĵ���
		        add_item(0,-1,"���в˵�","","","","",2,"","","");
		       <logic:present name="list">
		          <logic:iterate id="menu" name="list" type="java.util.HashMap">
		          
		      // alert("${menu.menuid}---${menu.upmenuid}---${menu.menename}---${menu.chek}");   
		     	 add_item(${menu.menuid},${menu.upmenuid},"${menu.menename}","","","","",${menu.chek},"","","");
		              
		          </logic:iterate>
		  		</logic:present>
		
			// menu �Ĳ�������Ϊ����Ҫ��ʾ�����ĸ�id��
			// �ú�����������html���룬��Ҫ�� write ���������
			var menudom = menu(-1);
			//alert(menudom);
			document.write(menudom);
			
			</script>
	    </td>
  </tr>
  <tr>
		<td width="5%"></td>
	  	<td>
	  		<form action="<%=request.getContextPath()%>/menuAuthorityAction.do?actionType=2" method="POST">
		  		<input type="submit" class="ziti" value="ȷ��" onclick="return go_sub();"/>
		        <input type="button" class="ziti" onclick="javascript:history.back();" value="ȡ��"/>
		        <input type="hidden" name="menus" value=""/>
		        <input type="hidden" name="userId" value="${userId }"/>
	        </form>
	    </td>
  </tr>
</table>
</body>
</html>
