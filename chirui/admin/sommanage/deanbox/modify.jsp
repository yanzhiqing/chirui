<%@ page language="java" pageEncoding="GBK"%>
<%@ page import="crjd.common.Toolkit;"%>
<%@ include file="../../../common/taglibs.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;" />
		<title>SOM网站管理-领导信箱</title>
		<link href="<%=request.getContextPath()%>/css/border.css"
			rel="stylesheet" type="text/css" />
		<style type="text/css">
<!--
.style1 {
	color: #FF0000
}

table td {
	padding-right: 5px;
}
-->
</style>

	<script language="javascript" src="<%=request.getContextPath()%>/script/calendar.js"></script>

<script type="text/javascript">
	//返回
	function goback(){
		window.location.href = "<%=request.getContextPath()%>/deanBoxAction.do?actionType=0";
	}
	function goSub(){
		var name = document.getElementById("reply");
		 var ss=name.value;
		 var s=LTrim(ss);
		 
		if(s == ""){
		
		
			alert("请输入回复内容！");
			name.focus();
			return false;
		}
		return true;
	}
	function LTrim(str){ 
        var i;
        for(i=0;i<str.length; i++) {
            if(str.charAt(i)!=" ") break;
        }
        str = str.substring(i,str.length);
        return str;
    }
    var oldValue=new Array();
   function checkMaxLen(obj,maxlength,num){
   alert("测试长度:"+obj.value.length);
    if(obj.value.length>maxlength){
     obj.value=oldValue[num];
    }
    else{
     oldValue[num]=obj.value;
    }
   }
    
	
	
</script>
	</head>
	<body>
		<form action="<%=request.getContextPath()%>/deanBoxAction.do" method="post" enctype="multipart/form-data">
			<input type="hidden" id="actionType" name="actionType" value="5"/>
			<input type="hidden" name="deanbox.id" id="id" value='${object.id }' />

			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="wudi" style="padding-left: 0px">
						&nbsp;您现在的位置：网站管理 → 领导信箱 →回复 
					</td>
				</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="43">
						&nbsp;
					</td>
				</tr>
			</table>
			<table width="80%" border="1" align="center" cellpadding="0"
				cellspacing="0" bordercolor="#DEE5EF"
				style="border-collapse: collapse">
				<tr>
					<td height="24" colspan="2" class="ziti"
						background="<%=request.getContextPath()%>/images/di.jpg">
						<div align="center">
							<span class="header">领导回复</span>
						</div>
					</td>
				</tr>
				<tr>
					<td width="30%" align="right" bgcolor="#ECFBFF" class="ziti">
						标&nbsp;&nbsp;&nbsp;&nbsp;题：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						${object.title}
						<input type="hidden" name="deanbox.title" value="${object.title}"/>
					</td>
				</tr>
				<tr>
					<td width="30%" align="right" bgcolor="#ECFBFF" class="ziti">
						内&nbsp;&nbsp;&nbsp;&nbsp;容：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
					     <textarea  name="deanbox.content"  rows="5" cols="50" readonly="readonly"> ${object.content} </textarea>
						
					</td>
				</tr>
				
				<tr>
					<td width="30%" align="right" bgcolor="#ECFBFF" class="ziti">
						提交人：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
						${object.author}
						<input type="hidden" name="deanbox.author" value="${object.author}"/>
					</td>
				</tr>
				
				<tr>
					<td width="30%" align="right" bgcolor="#ECFBFF" class="ziti">
						提交时间：
					</td>
					<td width="*%"  bgcolor="#FFFFEC">
<fmt:formatDate pattern="yyyy-MM-dd" value="${object.createtime}"/>

						<input type="hidden" name="deanbox.createtime" value="${object.createtime}"/>
						<input type="hidden" name="deanbox.yx" value="${object.yx}"/>
					</td>
				</tr>
				
				
				
				<tr>
					<td align="right" bgcolor="#ECFBFF" class="ziti" valign="top">
						回&nbsp;&nbsp;&nbsp;&nbsp;复：
					</td>
					<td bgcolor="#FFFFEC">
                        
                        <textarea id="reply" name="deanbox.reply"  rows="5" cols="50"></textarea>
					</td>
				</tr>
				
				<tr>
					<td height="24" colspan="2"
						background="<%=request.getContextPath()%>/images/di.jpg">
						<div align="center">
							<input type="submit" name="confirm" value="确认" onclick="return goSub();"/>
							<input type="button" value="返回" onclick="goback();" />
						</div>
					</td>
				</tr>
			</table>
			<%@ include file="../../../common/token.jsp"%>

		</form>
	</body>
</html>

