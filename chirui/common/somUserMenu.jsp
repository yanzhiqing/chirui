<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="taglibs.jsp" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;" />
	<title>som用户菜单下拉框级联</title>
	
	<script language="javascript" src="<%=request.getContextPath()%>/script/jquery.js"></script>
	<script type="text/javascript">

	/** 初始化 */
	$(function(){
		chengMenu(0);
	})
	
	/** 三级菜单的级联　*/
	var chengMenu =  function(m){
		var curMenu = $("#menu" + m);									//当前菜单
		var subMenu = $("#menu" + (m + 1));　							//当前菜单的下级菜单
		var pid = (curMenu.val() == undefined )? "" : curMenu.val();	//当然菜单val，即菜单id
		
		/** 重置下级和下下级菜单*/
	    subMenu[0].options.length = 1;
	    subMenu[0].options.selectedIndex= 0 ;
	    if(m==1){
	   		$("#menu" + (m + 2))[0].options.length = 1;	
	   		$("#menu" + (m + 2))[0].options.selectedIndex= 0 ;
	    }
	    
	    //当菜单id为空时就退出，即不用查询下极菜单。
	    if(m != 0 && pid =="") return;

	    //ajax获取子菜单数据
		$.ajax({
			type: "get",
	        url: "<%=request.getContextPath()%>/menuAuthorityAction.do",
	        data: "actionType=10&pid=" + pid + "&date=" + new Date(),
	        dataType: "xml",
	        success: function(responseXML){
	        	var state = $(responseXML).find("state").text(); 
	       		if(state == "1"){
	       			$(responseXML).find("option").each(function(){
	       				//alert($(this)[0].tagName + "---"+ $(this).attr("value") + "---"+ $(this)[0].text);
	       				subMenu.append("<option value='" + $(this).attr("value") +"'>" + $(this).text() + "</option>");
	       			});
	       		}else if(state == "0"){
	       			//alert("没有子菜单");
	       		}else if(state == "2"){
	       			alert("网页超时，很重新登录！");
	       		}else if(state == "3"){
	       			alert("服务器错误，请与管理员联系！");
	       		}
	 		},
	 		error:function(s,s1){
	 			alert("网页超时或服务错误，请重新登录或与管理员联系!");
	 			//alert(s1);	//错误信息
	 		}
		});
	}
	

	</script>
</head>
<body>
<table>
	<tr>
		<td>&nbsp;&nbsp;
			<select name="menuName1" id="menu1" style="width: 150px;" onchange="chengMenu(1);">
			<option value=''>--不限--</option>
			</select>
		</td>
		<td>
			<select name="menuName2" id="menu2" style="width: 150px;" onchange="chengMenu(2);">
			<option value=''>--不限--</option>
			</select>
		</td>
		<td>
			<select name="menuName3" id="menu3" style="width: 150px;">
			<option value=''>--不限--</option>
			</select>
		</td>
	</tr>
</table>

<%--<button onclick="show()">测试</button>
--%>

</body>
</html>
