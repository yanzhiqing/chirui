<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="taglibs.jsp" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;" />
	<title>som�û��˵���������</title>
	
	<script language="javascript" src="<%=request.getContextPath()%>/script/jquery.js"></script>
	<script type="text/javascript">

	/** ��ʼ�� */
	$(function(){
		chengMenu(0);
	})
	
	/** �����˵��ļ�����*/
	var chengMenu =  function(m){
		var curMenu = $("#menu" + m);									//��ǰ�˵�
		var subMenu = $("#menu" + (m + 1));��							//��ǰ�˵����¼��˵�
		var pid = (curMenu.val() == undefined )? "" : curMenu.val();	//��Ȼ�˵�val�����˵�id
		
		/** �����¼������¼��˵�*/
	    subMenu[0].options.length = 1;
	    subMenu[0].options.selectedIndex= 0 ;
	    if(m==1){
	   		$("#menu" + (m + 2))[0].options.length = 1;	
	   		$("#menu" + (m + 2))[0].options.selectedIndex= 0 ;
	    }
	    
	    //���˵�idΪ��ʱ���˳��������ò�ѯ�¼��˵���
	    if(m != 0 && pid =="") return;

	    //ajax��ȡ�Ӳ˵�����
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
	       			//alert("û���Ӳ˵�");
	       		}else if(state == "2"){
	       			alert("��ҳ��ʱ�������µ�¼��");
	       		}else if(state == "3"){
	       			alert("�����������������Ա��ϵ��");
	       		}
	 		},
	 		error:function(s,s1){
	 			alert("��ҳ��ʱ�������������µ�¼�������Ա��ϵ!");
	 			//alert(s1);	//������Ϣ
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
			<option value=''>--����--</option>
			</select>
		</td>
		<td>
			<select name="menuName2" id="menu2" style="width: 150px;" onchange="chengMenu(2);">
			<option value=''>--����--</option>
			</select>
		</td>
		<td>
			<select name="menuName3" id="menu3" style="width: 150px;">
			<option value=''>--����--</option>
			</select>
		</td>
	</tr>
</table>

<%--<button onclick="show()">����</button>
--%>

</body>
</html>
