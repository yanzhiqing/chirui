var Dvbbs_filterScript = true;
var Dvbbs_charset="UTF-8";
var Dvbbs_bLoad=false
var Dvbbs_bTextMode=3;

function Dvbbs_InitDocument(hiddenid, charset)
{
	if (charset!=null){Dvbbs_charset=charset;}
	if (Dvbbs_bIsIE5){
		var Dvbbs_bodyTag="<style type=text/css>.quote{margin:5px 20px;border:1px solid #CCCCCC;padding:5px; background:#F3F3F3 }\nbody{boder:0px}.HtmlCode{margin:5px 20px;border:1px solid #CCCCCC;padding:5px;background:#FDFDDF;font-size:14px;font-family:Tahoma;font-style : oblique;line-height : normal ;font-weight:bold;}\nbody{boder:0px}</style></head><BODY bgcolor=\"#FFFFFF\" title=\"Ctrl+Enterֱ���ύ����\" onkeydown=\"ctlent();\">";
	}else
	{
		var Dvbbs_bodyTag="<style type=text/css>.quote{margin:5px 20px;border:1px solid #CCCCCC;padding:5px; background:#F3F3F3 }\nbody{boder:0px}.HtmlCode{margin:5px 20px;border:1px solid #CCCCCC;padding:5px;background:#FDFDDF;font-size:14px;font-family:Tahoma;font-style : oblique;line-height : normal ;font-weight:bold;}\nbody{boder:0px}</style></head><BODY bgcolor=\"#FFFFFF\" >";
	}
	var editor=IframeID
	var h=document.getElementById(hiddenid).value;
	if (navigator.appVersion.indexOf("MSIE 6.0",0)==-1){
	editor.document.designMode="On"
	}
	editor.document.open();
	editor.document.write ('<html><head>');
	if (Dvbbs_bIsIE5){
	editor.document.write ('<script language="javascript">');
	editor.document.write ('var ispost=0;');
	editor.document.write ('	function ctlent()');
	editor.document.write ('	{');
	editor.document.write ('		if(event.ctrlKey && window.event.keyCode==13&&ispost==0)');
	editor.document.write ('		{');
	editor.document.write ('			ispost=1;');
	editor.document.write ('			parent.Dvbbs_CopyData("'+hiddenid+'"); ');
	editor.document.write ('			parent.document.Dvform.submit();');
	editor.document.write ('		}');
	editor.document.write ('	}');
	editor.document.write ('<\/script>');
	}
	editor.document.write(Dvbbs_bodyTag);
	if (h!="")
	{
		editor.document.write(h);
	}
	editor.document.write ("</body>");
	editor.document.write ("</html>");
	editor.document.close();
	editor.document.body.contentEditable = "True";
	editor.document.charset=Dvbbs_charset;
	Dvbbs_bLoad=true;
	Dvbbs_setStyle();
}

function Dvbbs_setStyle()
{
	//var bs = IframeID.document.body.runtimeStyle;
	var bs = IframeID.document.body.style;
	//����mode����iframe��ʽ��	
	if (Dvbbs_bTextMode==2) {
		bs.fontFamily="Arial";
		bs.fontSize="10pt";
	}else{
		bs.fontFamily="Arial";
		bs.fontSize="10.5pt";
	}
	bs.scrollbar3dLightColor= '#D4D0C8';
	bs.scrollbarArrowColor= '#000000';
	bs.scrollbarBaseColor= '#D4D0C8';
	bs.scrollbarDarkShadowColor= '#D4D0C8';
	bs.scrollbarFaceColor= '#D4D0C8';
	bs.scrollbarHighlightColor= '#808080';
	bs.scrollbarShadowColor= '#808080';
	bs.scrollbarTrackColor= '#D4D0C8';
	bs.border='1';
}

function Dvbbs_CopyData(hiddenid)
{
	Dvbbs_formatimg()
	d = IframeID.document;
	cont = d.body.innerHTML;
	cont = Dvbbs_correctUrl(cont);
	cont = Dvbbs_cleanHtml(cont);
	cont = Dvbbs_FilterScript(cont);
	document.getElementById(hiddenid).value = cont;
}

//��ʽ������
function Dvbbs_correctUrl(cont)
{
	var regExp;
	regExp = /<a([^>]*) href\s*=\s*([^\s|>]*)([^>]*)/gi
	cont = cont.replace(regExp, "<a href=$2 target=\"_blank\" ");
	regExp = /<a([^>]*)><\/a>/gi
	cont = cont.replace(regExp, "");
	return cont;
}

//----------------
function Dvbbs_formatimg()
{
		if (Dvbbs_bIsIE5){
			var tmp=IframeID.document.body.all.tags("IMG");
		}else{
			var tmp=IframeID.document.getElementsByTagName("IMG");
		}
		for(var i=0;i<tmp.length;i++){
			var tempstr='';
			if(tmp[i].align!=''){tempstr="align="+tmp[i].align;}
			if(tmp[i].border!=''){tempstr=tempstr+"border="+tmp[i].border;}
			tmp[i].outerHTML="<IMG src=\""+tmp[i].src+"\""+tempstr+">"
		}
}
//�������HTML����
function Dvbbs_cleanHtml(content)
{
	if(Dvbbs_bTextMode!=1){
		content = content.replace(/<img([^>]*) (src\s*=\s*([^\s|>])*)([^>]*)>/gi,"<img $2>");
	}
	content = content.replace(/<p>&nbsp;<\/p>/gi,"")
	content = content.replace(/<p><\/p>/gi,"<p>")
	content = content.replace(/<div><\/\1>/gi,"")
	content = content.replace(/<p>/,"<br>")
	content = content.replace(/(<(meta|iframe|frame|span|tbody|layer)[^>]*>|<\/(iframe|frame|meta|span|tbody|layer)>)/gi, "");
	content = content.replace(/<\\?\?xml[^>]*>/gi, "") ;
	content = content.replace(/o:/gi, "");
	content = content.replace(/&nbsp;/gi, " ");
	content = content.replace(/\r\n/g, '');
    content = content.replace(/\n/g, '');
    content = content.replace(/\r/g, '');
return content;
}

//������˼�JS��ȡ
function Dvbbs_FilterScript(content)
{
	content = content.replace(/<(\w[^div|>]*) class\s*=\s*([^>|\s]*)([^>]*)/gi,"<$1$3") ;
	content = content.replace(/<(\w[^font|>]*) style\s*=\s*([^>|\s]*)([^>]*)/gi,"<$1$3") ;
	content = content.replace(/<(\w[^>]*) lang\s*=\s*([^>|\s]*)([^>]*)/gi,"<$1$3") ;
	var RegExp = /<(script[^>]*)>(.*)<\/script>/gi;
	content = content.replace(RegExp, "[code]&lt;$1&gt;<br>$2<br>&lt;script&gt;[\/code]");
	RegExp = /<(\w[^>|\s]*)([^>]*)(on(finish|mouse|Exit|error|click|key|load|change|focus|blur))(.[^>]*)/gi;
	content = content.replace(RegExp, "<$1")
	RegExp = /<(\w[^>|\s]*)([^>]*)(&#|window\.|javascript:|js:|about:|file:|Document\.|vbs:|cookie| name| id)(.[^>]*)/gi;
	content = content.replace(RegExp, "<$1")
	return content;
}

function Dvbbs_CleanCode()
{
	var editor=IframeID;
	editor.focus();
	if (Dvbbs_bIsIE5){
	// 0bject based cleaning
		var body = editor.document.body;
		for (var index = 0; index < body.all.length; index++) {
			tag = body.all[index];
		//*if (tag.Attribute["className"].indexOf("mso") > -1)
			tag.removeAttribute("className","",0);
			tag.removeAttribute("style","",0);
		}
	// Regex based cleaning
		var html = editor.document.body.innerHTML;
		html = html.replace(/\<p>/gi,"[$p]");
		html = html.replace(/\<\/p>/gi,"[$\/p]");
		html = html.replace(/\<br>/gi,"[$br]");
		html = html.replace(/\<[^>]*>/g,"");        ///������������"<...>"��ǩ
		html = html.replace(/\[\$p\]/gi,"<p>");
		html = html.replace(/\[\$\/p\]/gi,"<\/p>");
		html = html.replace(/\[\$br\]/gi,"<br>");
		editor.document.body.innerHTML = html;
	}else
	{
		var html = IframeID.document.body.ownerDocument.createRange();
		html.selectNodeContents(IframeID.document.body);
		IframeID.document.body.innerHTML = html.toString();
	}
}

var colour
function FormatText(command, option)
{
var codewrite
if (Dvbbs_bIsIE5){
		if (option=="removeFormat"){
		command=option;
		option=null;}
	  	IframeID.document.execCommand(command, false, option);
		Dvbbs_pureText = false;
		IframeID.focus();
		
}else{
		if ((command == 'forecolor') || (command == 'backcolor')) {
			parent.command = command;
			buttonElement = document.getElementById(command);
			IframeID.focus();
			document.getElementById("colourPalette").style.left = getOffsetLeft(buttonElement) + "px";
			document.getElementById("colourPalette").style.top = (getOffsetTop(buttonElement) + buttonElement.offsetHeight) + "px";
		
			if (document.getElementById("colourPalette").style.visibility=="hidden")
				{document.getElementById("colourPalette").style.visibility="visible";
			}else {
				document.getElementById("colourPalette").style.visibility="hidden";
			}
			var sel = IframeID.document.selection; 
			if (sel != null) {
				colour = sel.createRange();
			}
		}
		else{
	  	IframeID.document.execCommand(command, false, option);
		Dvbbs_pureText = false;
		IframeID.focus();
		}
	}

}

function setColor(color)
{
	IframeID.document.execCommand(parent.command, false, color);
	IframeID.focus();
	document.getElementById("colourPalette").style.visibility="hidden";
}

function Dvbbs_doSelectClick(str, el)
{
	var Index = el.selectedIndex;
	if (Index != 0){
		el.selectedIndex = 0;
		FormatText(str,el.options[Index].value);
	}
}
function Dvbbs_foreColor()
{
	if (Dvbbs_bIsIE5){
		var arr = showModalDialog("images/post/selcolor.html", "", "dialogWidth:18.5em; dialogHeight:17.5em; status:0; help:0");
		if (arr != null) FormatText('forecolor', arr);
		else IframeID.focus();
	}else
		{
		FormatText('forecolor', '');
		//var arr = openEditScript('images/post/nc_selcolor.htm',250,100)}
		}
}

function Dvbbs_backColor()
{
	if (Dvbbs_bIsIE5)
	{
		var arr = showModalDialog("images/post/selcolor.html", "", "dialogWidth:18.5em; dialogHeight:17.5em; status:0; help:0");
		if (arr != null) FormatText('backcolor', arr);
		else IframeID.focus();
	}else
		{
		FormatText('backcolor', '');
		}
}

function ShowForum_Emot(thepage)
{
	var Emot_PageCount;
	var Emot_Count=Forum_Emot.length-2;
	if(Emot_Count%Emot_PageSize==0)
	{
		Emot_PageCount=(Emot_Count)/Emot_PageSize
	}else{
		Emot_PageCount=Math.floor((Emot_Count)/Emot_PageSize)+1
	}
	if (thepage<=Emot_PageCount){
	var istr
	var EmotStr='&nbsp;';
	var EmotPath=Forum_Emot[0];
	if (thepage!=1 && Emot_PageCount>1)
	{EmotStr+='<img style="cursor: pointer;" onClick="ShowForum_Emot('+(thepage-1)+');" src="Images/post/Previous.gif" width="14" height="14" title="��һҳ">&nbsp;';}
	for(i=(thepage-1)*Emot_PageSize;i<(thepage-1)*Emot_PageSize+Emot_PageSize;i++)
	{
		if (i==Emot_Count){break}
		if (i<9)
			{istr='em0'+(i+1)}
			else
			{istr='em'+(i+1)}
		EmotStr+='<img title="'+istr+'" style="cursor: pointer;" onClick=putEmot("'+istr+'"); src="'+EmotPath+Forum_Emot[i+1]+'">&nbsp;';
	}
	if (thepage!=Emot_PageCount)
	{EmotStr+='<img style="cursor: pointer;" onClick="ShowForum_Emot('+(thepage+1)+');" src="Images/post/Next.gif" width="14" height="14" title="��һҳ">&nbsp;';}
	EmotStr+='��<b> '+thepage+' </b>ҳ,��<b> '+Emot_PageCount+' </b>ҳ��<b> '+(Emot_Count)+' </b>��';
	var Forum_EmotObj=document.getElementById("emot")
	Forum_EmotObj.innerHTML=EmotStr;
	}
}

function putEmot(thenNo)
{
	var ToAdd = '['+thenNo+']';
	IframeID.document.body.innerHTML+=ToAdd;
}

function CheckCount(message,total)
{
//onkeydown
//onkeyup
Dvbbs_CopyData(message);
var Getmessage=document.getElementById(message);
var Gettotal=document.getElementById(total);
	var max;
	max = Gettotal.value;
	if (Getmessage.value.length > max) {
	Getmessage.value = Getmessage.value.substring(0,max);
	alert("���ݲ��ܳ��� " + max + " ����!");
	document.Dvform.Submit.disabled=true;
	}
	else {
	document.Dvform.Submit.disabled=false;
	}
}

var ispost=0;
function ctlent(){
	if (document.all)
	{
		if(event.ctrlKey && event.keyCode==13&&ispost==0)
		{
		ispost=1;
		Dvbbs_CopyData('Body')
		this.document.Dvform.submit();
		}
	}
}