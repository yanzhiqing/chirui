<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>
<title>
用户菜单授权
</title>
<script language="javascript" src="<%=request.getContextPath()%>/script/menuTree.js"></script>
<link href="<%=request.getContextPath()%>/css/menutree.css" rel="stylesheet" type="text/css" />
<script language="JavaScript">
function window_onload(){

	//initialize();
	
}

//提交更改的用户菜单权限
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
			// add_item 的参数意义依次为：该项编号，不能重复；父id，所属的上一层的编号；该项显示的内容；折叠时的图标；展开时的图标；网址或命令；指向的窗口
		        add_item(0,-1,"所有菜单","","","","",2,"","","");
		       <logic:present name="list">
		          <logic:iterate id="menu" name="list" type="java.util.HashMap">
		          
		      // alert("${menu.menuid}---${menu.upmenuid}---${menu.menename}---${menu.chek}");   
		     	 add_item(${menu.menuid},${menu.upmenuid},"${menu.menename}","","","","",${menu.chek},"","","");
		              
		          </logic:iterate>
		  		</logic:present>
		
			// menu 的参数意义为：所要显示的树的父id；
			// 该函数返回树的html代码，需要由 write 函数输出。
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
		  		<input type="submit" class="ziti" value="确定" onclick="return go_sub();"/>
		        <input type="button" class="ziti" onclick="javascript:history.back();" value="取消"/>
		        <input type="hidden" name="menus" value=""/>
		        <input type="hidden" name="userId" value="${userId }"/>
	        </form>
	    </td>
  </tr>
</table>
</body>
</html>
