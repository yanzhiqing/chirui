if (Dvbbs_bIsNC){document.write('<iframe width="260" height="165" id="colourPalette" src="images/post/nc_selcolor.htm" style="visibility:hidden; position: absolute; left: 0px; top: 0px;" frameborder="0" scrolling="no" ></iframe>');}
//数据传递
function Dvbbs_CopyData(hiddenid)
{
	//alert(document.getElementById(hiddenid).value)
	ischeck=true
	d = IframeID.document;
	//Dvbbs_formatimg();
	if(Dvbbs_bTextMode!=1){
		cont=d.body.innerText;
	}else{cont = d.body.innerHTML;}
	cont = Dvbbs_correctUrl(cont);
	cont = Dvbbs_cleanHtml(cont);
	
	
	document.getElementById(hiddenid).value = cont;
	//alert(document.getElementById(hiddenid).value)
}

function Dvbbs_CopyData1(hiddenid)
{
	//alert(document.getElementById(hiddenid).value)
	ischeck=true
	//document.schoolfellowForm.Submit.disabled=true;
	d = IframeID.document;
	//Dvbbs_formatimg();
	if(Dvbbs_bTextMode!=1){
		cont=d.body.innerText;
	}else{cont = d.body.innerHTML;}
	cont = Dvbbs_correctUrl(cont);
	cont = Dvbbs_cleanHtml(cont);
	//图片及附件
/*
	 for( i=0 ; i<document.schoolfellowForm.nimgfujian.length ; i++){
     document.schoolfellowForm.nimgfujian.options[i].selected = true;}

     for( i=0 ; i<document.schoolfellowForm.nfujian.length ; i++){
     document.schoolfellowForm.nfujian.options[i].selected = true;}
	 */
	//代码过滤及JS提取
	
	document.getElementById(hiddenid).value = cont;
	//alert(document.getElementById(hiddenid).value)
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
		if(tmp[i].align!=''){tempstr=" align="+tmp[i].align;}
		if(tmp[i].border!=''){tempstr=tempstr+" border="+tmp[i].border;}
		tmp[i].outerHTML="<IMG src=\""+tmp[i].src+"\""+tempstr+">";
	}
}

//清理多余HTML代码
function Dvbbs_cleanHtml(content)
{
	content = content.replace(/<p>&nbsp;<\/p>/gi,"")
	content = content.replace(/<p><\/p>/gi,"<p>")
	content = content.replace(/<div><\/\1>/gi,"")
	content = content.replace(/<p>/,"<br>")
	content = content.replace(/(<(meta|iframe|frame|span|tbody|layer)[^>]*>|<\/(iframe|frame|meta|span|tbody|layer)>)/gi, "");
	content = content.replace(/<\\?\?xml[^>]*>/gi, "") ;
	content = content.replace(/o:/gi, "");
	content = content.replace(/&nbsp;/gi, " ");
	if(Dvbbs_bTextMode!=1){
	content = content.replace(/<img([^>]*) (src\s*=\s*([^\s|>])*)([^>]*)>/gi,"<img $2>");
	}
	//content = content.replace(/\r\n/g, '');
    //content = content.replace(/\n/g, '');
    //content = content.replace(/\r/g, '');
	//alert(content);
return content;
}
//代码过滤及JS提取
function Dvbbs_FilterScript(content)
{
	//content = Dvbbs_rCode(content, 'javascript:', '<b>javascript</b> :');
	content = content.replace(/<(\w[^div|>]*) class\s*=\s*([^>|\s]*)([^>]*)/gi,"<$1$3") ;
	content = content.replace(/<(\w[^font|>]*) style\s*=\s*\"[^\"]*\"([^>]*>)/gi,"<$1 $2") ;
	content = content.replace(/<(\w[^>]*) lang\s*=\s*([^>|\s]*)([^>]*)/gi,"<$1$3") ;
	var RegExp = /<(script[^>]*)>(.*)<\/script>/gi;
	content = content.replace(RegExp, "[code]&lt;$1&gt;<br>$2<br>&lt;script&gt;[\/code]");
	RegExp = /<(\w[^>|\s]*)([^>]*)(on(finish|mouse|Exit|error|click|key|load|change|focus|blur))(.[^>]*)/gi;
	content = content.replace(RegExp, "<$1")
	RegExp = /<(\w[^>|\s]*)([^>]*)(&#|window\.|javascript:|js:|about:|file:|Document\.|vbs:|cookie| name| id)(.[^>]*)/gi;
	content = content.replace(RegExp, "<$1")
	//alert(content);
	return content;
}

function Checkpostdata()
{
	Checkdata()
	if (ischeck==false)
	{
		return false
	}
	else return true;
}
function Checkdata()
{
	document.getElementById("titlestr").innerHTML="";
	document.getElementById("constr").innerHTML="";
	ischeck=true
	CheckUbbUse('UserName',1,document.getElementById('Body').value)	
	if (document.schoolfellowForm.topic.value.length==0 && ispostnew==1)
	{
		document.getElementById("titlestr").innerHTML=" <font color=\"#FF0000\">←您忘记填写标题</font>"
		document.schoolfellowForm.topic.focus();
		ischeck=false
	}
	if (document.schoolfellowForm.topic.value.length>Maxtitlelength)
	{
		document.getElementById("titlestr").innerHTML=" <font color=\"#FF0000\">←标题长度不能大于"+Maxtitlelength+"</font>"
		document.schoolfellowForm.topic.focus();
		ischeck=false
	}
	if (document.schoolfellowForm.source.value.length==0)
	{
		document.getElementById("sourcestr").innerHTML=" <font color=\"#FF0000\">←您忘记填写信息来源</font>"
		document.schoolfellowForm.source.focus();
		ischeck=false
	}
	if (document.schoolfellowForm.source.value.length>Maxsourcelength)
	{
		document.getElementById("sourcestr").innerHTML=" <font color=\"#FF0000\">←信息来源长度不能大于"+Maxsourcelength+"</font>"
		document.schoolfellowForm.source.focus();
		ischeck=false
	}
	if(!isDateYMD(document.schoolfellowForm.date.value)){
		document.getElementById("datestr").innerHTML=" <font color=\"#FF0000\">←日期格式有误</font>"
		document.schoolfellowForm.date.focus();
		ischeck=false
	}
	if (document.getElementById('Body').value.length==0)
	{
		document.getElementById("constr").innerHTML=" <font color=\"#FF0000\">←请填写信息内容</font>"
		IframeID.focus();
		ischeck=false
	}
}

function Dvbbs_PasteData()
{
	var regExp;
	cont = IframeID.document.body.innerHTML;
	IframeID.document.body.innerHTML = cont
}

/*function ShowForum_Emot(thepage)
{
	var Emot_PageCount
	var Emot_Count=44;//Forum_Emot.length-2;
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
	{EmotStr+='<img style="cursor: pointer;" onClick="ShowForum_Emot('+(thepage-1)+');" src="Images/post/Previous.gif" width="14" height="14" title="上一页">&nbsp;';}
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
	{EmotStr+='<img style="cursor: pointer;" onClick="ShowForum_Emot('+(thepage+1)+');" src="Images/post/Next.gif" width="14" height="14" title="下一页">&nbsp;';}
	EmotStr+='第<b> '+thepage+' </b>页,共<b> '+Emot_PageCount+' </b>页，<b> '+(Emot_Count)+' </b>个';
	var Forum_EmotObj=document.getElementById("emot")
	Forum_EmotObj.innerHTML=EmotStr
	}
	IframeID.focus();
}*/
function putEmot(thenNo)
{
	var ToAdd = '['+thenNo+']';
	IframeID.document.body.innerHTML+=ToAdd;
	IframeID.focus();
}
function gopreview()
{
document.preview.Dvtitle.value=document.schoolfellowForm.topic.value;
document.preview.theBody.value=IframeID.document.body.innerHTML;
var popupWin = window.open('', 'preview_page', 'scrollbars=yes,width=750,height=450');
document.preview.submit()
}

//ShowForum_Emot(1);
//--------------------------------------------------------------------------------



function Dvbbs_correctUrl(cont)
{
	var regExp;
	//var url=location.href.substring(0,location.href.lastIndexOf("/")+1);
	//cont=Dvbbs_rCode(cont,location.href+"#","#");
	//cont=Dvbbs_rCode(cont,url,"");
	regExp = /<a([^>]*) href\s*=\s*([^\s|>]*)([^>]*)/gi
	cont = cont.replace(regExp, "<a href=$2 target=\"_blank\" ");
	regExp = /<a([^>]*)><\/a>/gi
	cont = cont.replace(regExp, "");
	return cont;
}

function Dvbbs_rCode(s,a,b,i){
	//s原字串，a要换掉pattern，b换成字串，i是否区分大小写
	a = a.replace("?","\\?");
	if (i==null)
	{
		var r = new RegExp(a,"gi");
	}else if (i) {
		var r = new RegExp(a,"g");
	}
	else{
		var r = new RegExp(a,"gi");
	}
	return s.replace(r,b); 
}

function Dvbbs_cleanHtmlOLD()
{
	if (Dvbbs_bIsIE5){
	var fonts = IframeID.document.body.all.tags("FONT");
	}else{
	var fonts = IframeID.document.getElementsByTagName("FONT");
	}
	var curr;
	for (var i = fonts.length - 1; i >= 0; i--) {
		curr = fonts[i];
		if (curr.style.backgroundColor == "#ffffff") curr.outerHTML = curr.innerHTML;
	}
}

function Dvbbs_getPureHtml()
{
	var str = "";
	str = IframeID.document.body.innerHTML;
	str=Dvbbs_correctUrl(str);
	return str;
}

function FormatUrl(html)
{
	var regExp = /<a.*href=\"(.*)\"[^>]*>/gi;
	html = html.replace(regExp,"<a href=$1 target=\"_blank\" >")
  return html;
}

function Dvbbs_getEl(sTag,start)
{
	while ((start!=null) && (start.tagName!=sTag)) start = start.parentElement;
	return start;
}

//选择内容替换文本
function Dvbbs_InsertSymbol(str1)
{
	IframeID.focus();
	if (Dvbbs_bIsIE5) Dvbbs_selectRange();
	Dvbbs_edit.pasteHTML(str1);
}


//选择事件
function Dvbbs_selectRange(){
	Dvbbs_selection =	IframeID.document.selection;
	Dvbbs_edit		=	Dvbbs_selection.createRange();
	Dvbbs_RangeType =	Dvbbs_selection.type;
}

//应用html
function Dvbbs_specialtype(Mark1, Mark2){
	var strHTML;
	if (Dvbbs_bIsIE5){
		Dvbbs_selectRange();
		if (Dvbbs_RangeType == "Text"){
			if (Mark2==null)
			{
				strHTML = "<" + Mark1 + ">" + Dvbbs_edit.htmlText + "</" + Mark1 + ">"; 
			}else{
				strHTML = Mark1 + Dvbbs_edit.htmlText +  Mark2; 
			}
			Dvbbs_edit.pasteHTML(strHTML);
			IframeID.focus();
			Dvbbs_edit.select();
		}
		else{window.alert("请选择相应内容！")}	
	}
	else{
		if (Mark2==null)
		{
		strHTML	=	"<" + Mark1 + ">" + IframeID.document.body.innerHTML + "</" + Mark1 + ">"; 
		}else{
		strHTML = Mark1 + IframeID.document.body.innerHTML +  Mark2; 
		}
		IframeID.document.body.innerHTML=strHTML
		IframeID.focus();
	}
}

// 修改编辑栏高度
function Dvbbs_Size(num)
{
	var obj=document.getElementById("Dvbbs_Container");
	if (parseInt(obj.offsetHeight)+num>=300) {
		//alert(obj.offsetHeight)
		obj.height = (parseInt(obj.offsetHeight) + num);
	}
	if (num>0)
	{
		obj.width="80%";
	}
}

function Dvbbs_getText()
{
	Dvbbs_cleanHtml();
	return IframeID.document.body.innerHTML;
	
}

function Dvbbs_putText(v)
{
	IframeID.document.body.innerHTML = v;
}
function Dvbbs_doSelectClick(str, el)
{
	var Index = el.selectedIndex;
	if (Index != 0){
		el.selectedIndex = 0;
		FormatText(str,el.options[Index].value);
	}
}
//查找配对字符出现次数,没有结果为0
function TabCheck(word,str){
	var tp=0
	chktp=str.search(word);
	if (chktp!=-1)
	{
	eval("var tp=\""+str+"\".match("+word+").length")
	}
	return tp;
}

/*function Dvbbs_help()
{
	showModalDialog("<%= request.getContextPath()%>/image/information/post/help.html", "", "dialogWidth:14em; dialogHeight:15em; status:0; help:0");
}*/

function openEditScript(url, width, height){
	var Win = window.open(url,"openEditScript",'width=' + width + ',height=' + height + ',resizable=1,scrollbars=yes,menubar=no,status=no' );
}

//预览
function Dvbbs_View()
{
	if (Dvbbs_bTextMode!==1) {
		cont=IframeID.document.body.innerText;
	} else {
		cont=IframeID.document.body.innerHTML;
	}
	//alert(document.schoolfellowForm.autofix.checked)
	bodyTag="<html><head><style type=text/css>.quote{margin:5px 20px;border:1px solid #CCCCCC;padding:5px; background:#F3F3F3 }\nbody{boder:0px}.HtmlCode{margin:5px 20px;border:1px solid #CCCCCC;padding:5px;background:#FDFDDF;font-size:14px;font-family:Tahoma;font-style : oblique;line-height : normal ;font-weight:bold;}\nbody{boder:0px}.f12-l {FONT-SIZE: 12px; COLOR: #3b78ad; LINE-HEIGHT: 150%; FONT-FAMILY: \"宋体\"}</style></head><BODY bgcolor=\"#FFFFFF\" ><center><table width=778 class=f12-l><TR><TD align=middle bgColor=#f6f6f6><TABLE class=f12-l cellSpacing=0 cellPadding=0 width=80% border=0><TBODY><TR><TD><BR><BLOCKQUOTE>";
	cont=Dvbbs_rCode(cont,"\\[dvnews_ad]","<img src='images/post/images/pic_ad.jpg' vspace=10 hspace=10 align=left border=1 title='Advertising'>");
	cont=Dvbbs_rCode(cont,"\\[dvnews_page]","<br><br><hr size=2 width=95% align=left>&nbsp; <font color=red face='Tahoma,Arail' size=2><b>Next Page ...</b></font><br><hr size=2 width=95% align=left>");
	preWin=window.open('preview','','left=0,top=0,width=550,height=400,resizable=1,scrollbars=1, status=1, toolbar=1, menubar=0');
	preWin.document.open();
	preWin.document.write(bodyTag);
	preWin.document.write(cont);
	preWin.document.write("</BLOCKQUOTE></TD></TR></TBODY></TABLE></TD></TR></table></center></body></html>");
	preWin.document.close();
	preWin.document.title="Preview";
	preWin.document.charset=Dvbbs_charset;
}

//Colour pallete top offset
function getOffsetTop(elm) {
	var mOffsetTop = elm.offsetTop;
	var mOffsetParent = elm.offsetParent;
	while(mOffsetParent){
		mOffsetTop += mOffsetParent.offsetTop;
		mOffsetParent = mOffsetParent.offsetParent;
	}
	return mOffsetTop;
}

//Colour pallete left offset
function getOffsetLeft(elm) {
	var mOffsetLeft = elm.offsetLeft;
	var mOffsetParent = elm.offsetParent;
	while(mOffsetParent) {
		mOffsetLeft += mOffsetParent.offsetLeft;
		mOffsetParent = mOffsetParent.offsetParent;
	}
	return mOffsetLeft;
}

//Function to hide colour pallete
function hideColourPallete() {
	document.getElementById("colourPalette").style.visibility="hidden";
}


//------------------------------------------------------
/*function OpenSmiley()
{
	var arr = showModalDialog("<%= request.getContextPath()%>/image/information/post/smiley.htm", "", "dialogWidth:60em; dialogHeight:15.5em; status:0; help:0");
	if (arr != null){
		var ss;
		ss=arr.split("*")
		path=ss[0];
		ubbstring=ss[1];
		IframeID.document.body.innerHTML+=ubbstring;
	}
	else IframeID.focus();
}

function Dvbbs_forswf()
{
	var arr = showModalDialog("<%= request.getContextPath()%>/image/information/post/swf.htm", "", "dialogWidth:30em; dialogHeight:10em; status:0; help:0");
	if (arr != null){
		var ss;
		ss=arr.split("*")
		path=ss[0];
		row=ss[1];
		col=ss[2];
		var string;
		//string="<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000'  codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0' width="+row+" height="+col+"><param name=movie value="+path+"><param name=quality value=high><embed src="+path+" pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width="+row+" height="+col+"></embed></object>"
		string="[flash="+row+","+col+"]"+path+"[/flash]"
		IframeID.document.body.innerHTML+=string;
	}
	else IframeID.focus();
}

function Dvbbs_forwmv()
{
	var arr = showModalDialog("<%= request.getContextPath()%>/image/information/post/wmv.htm", "", "dialogWidth:30em; dialogHeight:13em; status:0; help:0");
	
	if (arr != null){
		var ss;
		ss=arr.split("*")
		path=ss[0];
		autostart=ss[1];
		width=ss[2];
		height=ss[3];
		ran=rand();
		var string;
		var ubbstring;
		//string="<object align=center classid=CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95 hspace=5 vspace=5 width="+ width +" height="+ height +"><param name=Filename value="+ path +"><param name=ShowStatusBar value=1><embed type=application/x-oleobject codebase=http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701 flename=mp src="+ path +"  width="+ width +" height="+ height +"></embed></object>";
		//string="<EMBED id=MediaPlayer"+ran+" src="+ path +" width="+ width +" height="+ height +" autostart=\""+ autostart +"\" loop=\"false\"></EMBED><p></p>";
		string="[MP="+ width +","+ height +","+ autostart +"]"+ path +"[/MP]";
		IframeID.document.body.innerHTML+=string;
	}
	else IframeID.focus();
}

function rand() {
	return parseInt((1000)*Math.random()+1);
}

function Dvbbs_forrm()
{
	var arr = showModalDialog("<%= request.getContextPath()%>/image/information/post/rm.htm", "", "dialogWidth:30em; dialogHeight:13em; status:0; help:0");
	
	if (arr != null)
	{
		var ss;
		ss = arr.split("*")
		path = ss[0];
		row = ss[1];
		col = ss[2];
		autostart = ss[3];
		ran = rand();
		var string;
		//string="<object classid='clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA' width='"+row+"' height='"+col+"'><param name='CONTROLS' value='ImageWindow'><param name='CONSOLE' value='Clip'><param name='AUTOSTART' value='"+ autostart +"'><param name=src value="+path+"></object><br><object classid='clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA'  width="+row+" height=32><param name='CONTROLS' value='ControlPanel,StatusBar'><param name='CONSOLE' value='Clip'></object>";
		string = "[RM="+ row +","+ col +","+ autostart +"]"+ path +"[/RM]";
		IframeID.document.body.innerHTML+=string;
	}
	else IframeID.focus();
}

//图片与链接事件


function Dvbbs_fortable()
{
	if (!Dvbbs_validateMode())	return;
	IframeID.focus();
	var arr = showModalDialog("<%= request.getContextPath()%>/image/information/post/table.html", window, "dialogWidth:22em; dialogHeight:18em; status:0; help:0;scroll:no;");
	if (arr)
	{
		IframeID.document.body.innerHTML+=arr;
	}
	IframeID.focus();
}*/

function Dvbbs_GetRangeReference(editor)
{
	editor.focus();
	var objReference = null;
	var RangeType = editor.document.selection.type;
	var selectedRange = editor.document.selection.createRange();
	
	switch(RangeType)
	{
	case 'Control' :
		if (selectedRange.length > 0 ) 
		{
			objReference = selectedRange.item(0);
		}
	break;
	case 'None' :
		objReference = selectedRange.parentElement();
		break;
	case 'Text' :
		objReference = selectedRange.parentElement();
		break;
	}
	return objReference
}

function Dvbbs_CheckTag(item,tagName)
{
	if (item.tagName.search(tagName)!= -1)
	{
		return item;
	}
	if (item.tagName == 'BODY')
	{
		return false;
	}
	item=item.parentElement;
	return Dvbbs_CheckTag(item,tagName);
}

function Dvbbs_code()
{
	//Dvbbs_specialtype("<div class=HtmlCode style='cursor: pointer'; title='点击运行该代码！' onclick=\"preWin=window.open('','','');preWin.document.open();preWin.document.write(this.innerText);preWin.document.close();\">","</div>");	
	Dvbbs_specialtype("<div class=HtmlCode>","</div>");	
}

/*function Dvbbs_replace()
{
	var arr = showModalDialog("<%= request.getContextPath()%>/image/information/post/replace.html", "", "dialogWidth:16.5em; dialogHeight:13em; status:0; help:0");
	if (arr != null){
		var ss;
		ss = arr.split("*")
		a = ss[0];
		b = ss[1];
		i = ss[2];
		con = IframeID.document.body.innerHTML;
		if (i == 1)
		{
			con = Dvbbs_rCode(con,a,b,true);
		}else{
			con = Dvbbs_rCode(con,a,b);
		}
		IframeID.document.body.innerHTML = con;
	}
	else IframeID.focus();
}

function insertSpecialChar()
{
	var arr = showModalDialog("<%= request.getContextPath()%>/image/information/post/specialchar.html", "","dialogWidth:25em; dialogHeight:15em; status:0; help:0");
	if (arr != null) Dvbbs_InsertSymbol(arr);
	IframeID.focus() ;
}*/

function doZoom( sizeCombo ) 
{
	if (sizeCombo.value != null || sizeCombo.value != "")
	if (Dvbbs_bIsIE5){
	var z = IframeID.document.body.runtimeStyle;}
	else{
	var z = IframeID.document.body.style;
	}
	z.zoom = sizeCombo.value + "%" ;
}
//--------------------

function Dvbbs_InsertRow()
{
	editor = IframeID;
	objReference = Dvbbs_GetRangeReference(editor);
	objReference = Dvbbs_CheckTag(objReference,'/^(TABLE)|^(TR)|^(TD)|^(TBODY)/');
	switch(objReference.tagName)
	{
	case 'TABLE' :
		var newTable = objReference.cloneNode(true);
		var newRow = newTable.insertRow();
		for(x = 0; x<newTable.rows[0].cells.length; x++)
			{
			var newCell = newRow.insertCell();
			}
		objReference.outerHTML = newTable.outerHTML;
		break;
	case 'TBODY' :
		var newTable = objReference.cloneNode(true);
		var newRow = newTable.insertRow();
		for(x = 0; x<newTable.rows[0].cells.length; x++)
			{
			var newCell = newRow.insertCell();
			}
		objReference.outerHTML=newTable.outerHTML;
		break;
	case 'TR' :
		var rowIndex = objReference.rowIndex;
		var parentTable = objReference.parentElement.parentElement;
		var newTable = parentTable.cloneNode(true);
		var newRow = newTable.insertRow(rowIndex+1);
		for(x = 0; x< newTable.rows[0].cells.length; x++)
		{
			var newCell = newRow.insertCell();
		}
		parentTable.outerHTML = newTable.outerHTML;
		break;
	case 'TD' :
		var parentRow = objReference.parentElement;
		var rowIndex = parentRow.rowIndex;
		var cellIndex = objReference.cellIndex;
		var parentTable = objReference.parentElement.parentElement.parentElement;
		var newTable = parentTable.cloneNode(true);
		var newRow = newTable.insertRow(rowIndex+1);
		for(x = 0; x< newTable.rows[0].cells.length; x++)
			{
			var newCell = newRow.insertCell();
			if (x == cellIndex)newCell.id='ura';
			}
		parentTable.outerHTML = newTable.outerHTML;
		var r = editor.document.body.createTextRange();
		var item = editor.document.getElementById('ura');
		item.id = '';
		r.moveToElementText(item);
		r.moveStart('character',r.text.length);
		r.select();
		break;
	default :
	return;
	}
}

function Dvbbs_DeleteRow()
{
	editor=IframeID;
	objReference=Dvbbs_GetRangeReference(editor);
	objReference=Dvbbs_CheckTag(objReference,'/^(TABLE)|^(TR)|^(TD)|^(TBODY)/');
	switch(objReference.tagName)
	{
	case 'TR' :var rowIndex = objReference.rowIndex;//Get rowIndex
	var parentTable=objReference.parentElement.parentElement;
	parentTable.deleteRow(rowIndex);
	break;
	case 'TD' :var cellIndex=objReference.cellIndex;
	var parentRow=objReference.parentElement;//Get Parent Row
	var rowIndex = parentRow.rowIndex;//Get rowIndex
	var parentTable=objReference.parentElement.parentElement.parentElement;
	parentTable.deleteRow(rowIndex);
	if (rowIndex>=parentTable.rows.length)
	{
	rowIndex=parentTable.rows.length-1;
	}
	if (rowIndex>=0)
	{
	var r = editor.document.body.createTextRange();
	r.moveToElementText(parentTable.rows[rowIndex].cells[cellIndex]);
	r.moveStart('character',r.text.length);
	r.select();
	}
	else
	{
	parentTable.removeNode(true);
	}
	break;
	default :return;
	}
}

function Dvbbs_InsertColumn()
{
	editor = IframeID;
	objReference= Dvbbs_GetRangeReference(editor);
	objReference=Dvbbs_CheckTag(objReference,'/^(TABLE)|^(TR)|^(TD)|^(TBODY)/');
	switch(objReference.tagName)
	{
	case 'TABLE' :// IF a table is selected, it adds a new column on the right hand side of the table.
	var newTable=objReference.cloneNode(true);
	for(x=0; x<newTable.rows.length; x++)
	{
	var newCell = newTable.rows[x].insertCell();
	}
	newCell.focus();
	objReference.outerHTML=newTable.outerHTML;
	break;
	case 'TBODY' :// IF a table is selected, it adds a new column on the right hand side of the table.
	var newTable=objReference.cloneNode(true);
	for(x=0; x<newTable.rows.length; x++)
	{
	var newCell = newTable.rows[x].insertCell();
	}
	objReference.outerHTML=newTable.outerHTML;
	break;
	case 'TR' :// IF a table is selected, it adds a new column on the right hand side of the table.
	objReference=objReference.parentElement.parentElement;
	var newTable=objReference.cloneNode(true);
	for(x=0; x<newTable.rows.length; x++)
	{
	var newCell = newTable.rows[x].insertCell();
	}
	objReference.outerHTML=newTable.outerHTML;
	break;
	case 'TD' :// IF the cursor is in a cell, or a cell is selected, it adds a new column to the right of that cell.
	var cellIndex = objReference.cellIndex;//Get cellIndex
	var rowIndex=objReference.parentElement.rowIndex;
	var parentTable=objReference.parentElement.parentElement.parentElement;
	var newTable=parentTable.cloneNode(true);
	for(x=0; x<newTable.rows.length; x++)
	{
	var newCell = newTable.rows[x].insertCell(cellIndex+1);
	if (x==rowIndex)newCell.id='ura';
	}
	parentTable.outerHTML=newTable.outerHTML;
	var r = editor.document.body.createTextRange();
	var item=editor.document.getElementById('ura');
	item.id='';
	r.moveToElementText(item);
	r.moveStart('character',r.text.length);
	r.select();
	break;
	default :
	return;
	}
}
function Dvbbs_DeleteColumn()
{
	editor = IframeID;
	objReference=Dvbbs_GetRangeReference(editor);
	objReference=Dvbbs_CheckTag(objReference,'/^(TABLE)|^(TR)|^(TD)|^(TBODY)/');
	switch(objReference.tagName)
	{
	
	case 'TD' :var rowIndex=objReference.parentElement.rowIndex;
	var cellIndex = objReference.cellIndex;//Get cellIndex
	var parentTable=objReference.parentElement.parentElement.parentElement;
	var newTable=parentTable.cloneNode(true);
	if (newTable.rows[0].cells.length==1)
	{
	parentTable.removeNode(true);
	return;
	}
	for(x=0; x<newTable.rows.length; x++)
	{
	if (newTable.rows[x].cells[cellIndex]=='[object]')
	{
	newTable.rows[x].deleteCell(cellIndex);
	}
	}
	if (cellIndex>=newTable.rows[0].cells.length)
	{
	cellIndex=newTable.rows[0].cells.length-1;
	}
	if (cellIndex>=0)  newTable.rows[rowIndex].cells[cellIndex].id='ura';
	parentTable.outerHTML=newTable.outerHTML;
	if (cellIndex>=0){
	var r = editor.document.body.createTextRange();
	var item=editor.document.getElementById('ura');
	item.id='';
	r.moveToElementText(item);
	r.moveStart('character',r.text.length);
	r.select();
	}
	break;
	default :return;
	}
}