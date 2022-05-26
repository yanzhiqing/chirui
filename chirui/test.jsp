<%@page contentType="text/html; charset=gbk"%>
<HTML>
<HEAD>
<TITLE>eWebEditor - 在线文本编辑器</TITLE>

<style type="text/css">body,td,input,textarea {font-size:9pt}</style>
<script language="javascript"> 
function subchk() // 
{ 
 document.form1.content1.value= window.content_html.getHTML(); 
  alert(document.form1.content.value);
} 
</script> 
</HEAD>
<BODY>
<FORM method="POST" name="form1" action="submit.jsp"  onsubmit="subchk()">
<TABLE border="0" cellpadding="2" cellspacing="1">
  <TR>
    <TD>
     <!--  <IFRAME ID="eWebEditor1" src="eWebEditor.jsp?id=content1&style=standard" frameborder="0" scrolling="no" width="700" height="500">  </IFRAME> -->
      <IFRAME ID="eWebEditor1" name="content_html" src="eWebEditor.jsp?id=content1&style=standard" frameborder="0" scrolling="no" width="650" height="450"></IFRAME> 
    
    </TD>
  </TR>
  <TR>
    <TD colspan=2 align=right>
      <input type="hidden" name="content1" value='<b>为偶的</b>'/>
      <INPUT type=submit name=b1 value="提交">
      <INPUT type=reset name=b2 value="重填">
    </TD>
  </TR>
</TABLE>
</FORM>
</BODY>
</HTML>
