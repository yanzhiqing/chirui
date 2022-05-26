<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="java.util.ArrayList"  %>
<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>
<title>
分配角色菜单
</title>
<script language="javascript" src="<%=request.getContextPath()%>/script/checkTree.js"></script>
<link href="<%=request.getContextPath()%>/script/css/tree.css" rel="stylesheet" type="text/css" />
<script language="JavaScript">
function window_onload()
{
	initialize();
}//

var judge=0;
function expandall(o)
{
	if (judge==0)
	{

		closeAll();
		judge=1;
		o.src='icon-closeall.gif';
		o.alt='全部折叠';
	}
	else
	{
		openAll();
		judge=0;
		o.src='icon-expandall.gif';
		o.alt='全部展开';
	}
}
 function chekb(rr){
 	//alert(window.document.getElementByName());

 var ids= "ls"+rr.value;
  if(document.all[ids].length){
     if(rr.checked){

   for(var i=0;i<document.all[ids].length;i++){
     document.all[ids][i].checked=true;
     }
    }else{
      for(var i=0;i<document.all[ids].length;i++){
        document.all[ids][i].checked=false;
        }
      }
     }else{
       if(rr.checked){
     document.all[ids].checked=true;
     }else{
        document.all[ids].checked=false;
      }
  }

}
 function chekbs(rr){
   if(document.all[rr.name].length){
      for(var k=0;k<document.all["role"].length;k++){
     if(("ls"+document.all["role"][k].value)==rr.name){
       document.all["role"][k].checked=false;
       }
    }
    for(var i=0;i<document.all[rr.name].length;i++){
 	if(document.all[rr.name][i].checked){
 		for(var k=0;k<document.all["role"].length;k++){
 			if(("ls"+document.all["role"][k].value)==rr.name){
 				document.all["role"][k].checked=true;
 				}
 			}
 		}

 	}
     }else{
       if(document.all[rr.name].checked){
        for(var k=0;k<document.all["role"].length;k++){
          if(("ls"+document.all["role"][k].value)==rr.name){
            document.all["role"][k].checked=true;
            }
            }
         }else{
           for(var k=0;k<document.all["role"].length;k++){
             if(("ls"+document.all["role"][k].value)==rr.name){
               document.all["role"][k].checked=false;
               }
               }
           }
       }

}
function RZback(){
  window.location.replace("<%=request.getContextPath()%>/roleInfoAction.do?actionType=0");
}

</SCRIPT>
</head>
<%
 ArrayList list= new ArrayList();
 list=(ArrayList)request.getAttribute("list") ;
 String roleid=request.getParameter("roleid");
%>
<body bgcolor="#FFFFFF" text="#000000" onLoad="window_onload();">
<br />
<br />


<table border=0 >
  <tr>
    <td width="5%">
      </td>
    <td>
	<script language="javascript" type="text/javascript">
	// treemenu 的参数意义依次为：资源目录，如"treemenu/image/";树名称；树图标
	//objTree	= new treemenu("","角色菜单分配","pagelay/images/elecreport/usericon.gif");
	// add_item 的参数意义依次为：该项编号，不能重复；父id，所属的上一层的编号；该项显示的内容；折叠时的图标；展开时的图标；网址或命令；指向的窗口
        add_item(0,-1,"菜单目录","","","","",2,"","","");
       <logic:present name="list">
          <logic:iterate id="reporttype" name="list" type="java.util.HashMap" >
          add_item(<bean:write name="reporttype" property="menuid"/>,<bean:write name="reporttype" property="upmenuid"/>,"<bean:write name="reporttype" property="menename"/>","","","","",<bean:write name="reporttype" property="chek"/>,"<bean:write name="reporttype" property="popid"/>","<bean:write name="reporttype" property="opflag"/>","<bean:write name="reporttype" property="popname"/>");
          </logic:iterate>
  </logic:present>

	// menu 的参数意义为：所要显示的树的父id；
	// 该函数返回树的html代码，需要由 write 函数输出。
	document.write(menu(-1));
//sysrolemenuAction.do?actionType=save

	</script>
    </td>
  </tr>
  <form action="roleMenuAction.do?actionType=fpmenu" method="POST">
  <tr>
      <script language="javascript" type="text/javascript">
              function ggok(){
//		alert("begin");
                var str="";
		   if(document.all["role"].length){
                     for(var i=0;i<document.all["role"].length;i++){
//                       alert(i);
                       var n=0;
                       var arrays=new Array();
                       if(document.all["role"][i].checked==true){
                       var id=document.all["role"][i].value;
       		      var ids="ls"+document.all["role"][i].value;
       		      if(document.all[ids].length){
       		 	for(var k=0;k<document.all[ids].length;k++){
       		 		if(document.all[ids][k].checked==true){
       		 		id+="_";
       		 		id+=document.all[ids][k].value;
       		 		}else{
                                 id=id+"_";
                                }
       		 	}
       		 	arrays[n]=id;
//       		 	alert(arrays[n]);
                       str=str+id+"&";
//                        alert("str="+str);
       		 	n++;
       		} else{
                str=str+id+""+"_"+document.all[ids].value+"&";
//                alert("str2="+str);
       		}
       }
      document.all["menus"].value=str;
//      alert(str);
    }
  }
  }
  </script>

<td width="5%">
  	</td>
  	<td>
  	<input type="submit" class="ziti" value="确定" onclick="return ggok()"/>
        <input type="button" class="ziti" onclick="return RZback()" value="取消"/>
        </td>
        <input type="hidden" name="menus" value=""/>
        <input  type="hidden" name="roleid" value="<%=roleid%>"/>

  </tr>

</table>


</body>
</html>
