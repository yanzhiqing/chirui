<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="crjd.common.SessionContainer" %>
<%@ page import="java.util.List,java.util.ArrayList,crjd.common.ButtonPage"%>
<%
SessionContainer sessionCon = (SessionContainer)session.getAttribute("sessionContainer");
String menuid = sessionCon.getMenuId();
String[] roles = sessionCon.getRoleId();//��Ҫ�ӵ�ǰ��session ��ȡ�ò���

String list=(String)ButtonPage.getPopButton(pageContext,menuid,roles);
String bb="";
%>
<Script language="javaScript">
function onlaoding(){
//  alert("begin2");
  var str="<%=list%>";

  document.all["popmun"].value=str;
  var buttons=str.split('@');
//   alert(str);
  for(var i=0;i<buttons.length-1;i++){

//    alert(buttons[i].length);
//    alert(typeof(document.all[buttons[i]]));
//    alert("begin");
    if(typeof(document.all[buttons[i]])=="object"){
      for(var j=0;j<document.all[buttons[i]].length;j++){
//         alert("wwrrr22");
        document.all[buttons[i]][j].style.display= 'block';
        }
      }else{
//        alert("weiyi22");
//         document.all[buttons[i]].style.display= 'block';
        }

    }
  }


function RZdel(){
    var num = 0;
	
	for(var i=0;i<document.all["keys"].length;i++){
		if(document.all["keys"][i].checked==true){
			num++;
		}
	}

	//�����ȴ���1ʱ keys ��һ�����飬����1��keys��������
	if(num==0 && document.all["keys"].checked==true) {
		num++;
	}

	if(num==0){
	    alert("ɾ��ʱ����ѡ��һ��!");
		return false;
	}
	else {
	    if(confirm("�����Ҫɾ����")) {
		    document.all["actionType"].value="8";
			document.forms[0].submit();
			
            return true;
		}
		else {
		    return false;
		}
	}
}


        function RZquery(){
        	document.all["actionType"].value="7";
                //document.forms[0].submit();
        }



        function RZchose(){
    		if(document.all["keys"].length > 0){
                      	if(document.all["delkeys"].checked==true){
       				for(i=0;i<document.all["keys"].length;i++){
         				document.all["keys"][i].checked=true;
       				}
                      	}else{
       				for(i=0;i<document.all["keys"].length;i++){
         				document.all["keys"][i].checked=false;
       				}
                      	}
    		}else{
                      	if(document.all["delkeys"].checked==true){
         				document.all["keys"].checked=true;
                      	}else{
         				document.all["keys"].checked=false;
                      	}
    		}
        }

</script>


