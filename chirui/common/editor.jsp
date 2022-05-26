<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="taglibs.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;" />
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/image/information/post/Main.js"></script>
		<Script
			src="<%=request.getContextPath()%>/image/information/post/DhtmlEdit.som.js"></Script>

		<script type="text/javascript">
		//字体颜色
		function Dvbbs_foreColor(){
			if (!Dvbbs_validateMode()) return;
			if (Dvbbs_bIsIE5){
				var arr = showModalDialog("<%=request.getContextPath()%>/image/information/post/selcolor.html", "", "dialogWidth:18.5em; dialogHeight:17.5em; status:0; help:0");
				if (arr != null) FormatText('forecolor', arr);
				else IframeID.focus();
			}else{
				FormatText('forecolor', '');
			}
		}
		
		//背景颜色
		function Dvbbs_backColor(){
			if (!Dvbbs_validateMode()) return;
			if (Dvbbs_bIsIE5){
				var arr = showModalDialog("<%=request.getContextPath()%>/image/information/post/selcolor.html", "", "dialogWidth:18.5em; dialogHeight:17.5em; status:0; help:0");
				if (arr != null) FormatText('backcolor', arr);
				else IframeID.focus();
			}else{
				FormatText('backcolor', '');
			}

		}
		
		//插入特殊字符
		function insertSpecialChar(){
			var arr = showModalDialog("<%=request.getContextPath()%>/image/information/post/specialchar.html", "","dialogWidth:25em; dialogHeight:15em; status:0; help:0");
			if (arr != null) Dvbbs_InsertSymbol(arr);
			IframeID.focus() ;
		}

</script>
		<table>
			<tr>
				<td width=80% class=tablebody1 valign=top>
					<!--post.asp##Dvbbs多功能编辑器-->
					<link rel="STYLESHEET" type="text/css"
						href="<%=request.getContextPath()%>/image/information/post/edit.css" />
					<table id="Dvbbs_Container" class="Dvbbs_Body" height="300"
						width="440" cellpadding=3 cellspacing=0 border=0>
						<tr>
							<td>
								<table cellpadding=0 cellspacing=0>
									<tr class="yToolbar" ID="ExtToolbar0">
										<td>
											<select ID="Dvbbs_formatSelect" class="Dvbbs_TBGen"
												onchange="Dvbbs_doSelectClick('FormatBlock',this)">
												<option>
													段落格式
												</option>
												<option VALUE="&lt;P&gt;">
													普通格式
												</option>
												<option VALUE="&lt;H1&gt;">
													标题 1
												</option>
												<option VALUE="&lt;H2&gt;">
													标题 2
												</option>
												<option VALUE="&lt;H3&gt;">
													标题 3
												</option>
												<option VALUE="&lt;H4&gt;">
													标题 4
												</option>
												<option VALUE="&lt;H5&gt;">
													标题 5
												</option>
												<option VALUE="&lt;H6&gt;">
													标题 6
												</option>
												<option VALUE="&lt;H7&gt;">
													标题 7
												</option>
												<option VALUE="&lt;PRE&gt;">
													已编排格式
												</option>
												<option VALUE="&lt;ADDRESS&gt;">
													地址
												</option>
											</select>
										</td>
										<td>
											<select language="javascript" class="Dvbbs_TBGen"
												id="FontName"
												onchange="FormatText ('fontname',this[this.selectedIndex].value);">
												<option class="heading" selected>
													字体
												</option>
												<option value="宋体">
													宋体
												</option>
												<option value="黑体">
													黑体
												</option>
												<option value="楷体_GBK">
													楷体
												</option>
												<option value="仿宋_GBK">
													仿宋
												</option>
												<option value="隶书">
													隶书
												</option>
												<option value="幼圆">
													幼圆
												</option>
												<option value="新宋体">
													新宋体
												</option>
												<option value="细明体">
													细明体
												</option>
												<option value="Arial">
													Arial
												</option>
												<option value="Arial Black">
													Arial Black
												</option>
												<option value="Arial Narrow">
													Arial Narrow
												</option>
												<option value="Bradley Hand ITC">
													Bradley Hand ITC
												</option>
												<option value="Brush Script	MT">
													Brush Script MT
												</option>
												<option value="Century Gothic">
													Century Gothic
												</option>
												<option value="Comic Sans MS">
													Comic Sans MS
												</option>
												<option value="Courier">
													Courier
												</option>
												<option value="Courier New">
													Courier New
												</option>
												<option value="MS Sans Serif">
													MS Sans Serif
												</option>
												<option value="Script">
													Script
												</option>
												<option value="System">
													System
												</option>
												<option value="Times New Roman">
													Times New Roman
												</option>
												<option value="Viner Hand ITC">
													Viner Hand ITC
												</option>
												<option value="Verdana">
													Verdana
												</option>
												<option value="Wide Latin">
													Wide Latin
												</option>
												<option value="Wingdings">
													Wingdings
												</option>
											</select>
											<select language="javascript" class="Dvbbs_TBGen"
												id="FontSize"
												onchange="FormatText('fontsize',this[this.selectedIndex].value);">
												<option class="heading" selected>
													字号
												</option>
												<option value="1">
													1
												</option>
												<option value="2">
													2
												</option>
												<option value="3">
													3
												</option>
												<option value="4">
													4
												</option>
												<option value="5">
													5
												</option>
												<option value="6">
													6
												</option>
												<option value="7">
													7
												</option>
											</select>
										</td>
										<td id="forecolor" name=forecolor class="Dvbbs_Btn"
											TITLE="字体颜色" LANGUAGE="javascript"
											onclick="Dvbbs_foreColor();this.className='Dvbbs_TabOn';"
											onmouseover="this.className=
															'Dvbbs_BtnMouseOverUp';"
											onmouseout="this.className='Dvbbs_Btn';">
											<img class="Dvbbs_Ico"
												src="<%=request.getContextPath()%>/image/information/post/fgcolor.gif" WIDTH="16"
												HEIGHT="16" unselectable="on">
										</td>
										<td id="backcolor" class="Dvbbs_Btn" TITLE="字体背景颜色"
											LANGUAGE="javascript"
											onclick="Dvbbs_backColor();this.className='Dvbbs_TabOn';ondrag='return false;'"
											onmouseover="this.className=
															'Dvbbs_BtnMouseOverUp';"
											onmouseout="this.className='Dvbbs_Btn';">
											<img class="Dvbbs_Ico"
												src="<%=request.getContextPath()%>/image/information/post/fbcolor.gif" WIDTH="16"
												HEIGHT="16" unselectable="on">
										</td>
										<td class="Dvbbs_Btn" TITLE="插入特殊符号" LANGUAGE="javascript"
											onclick="insertSpecialChar();this.className='Dvbbs_TabOn';"
											onmouseover="this.className=
															'Dvbbs_BtnMouseOverUp';"
											onmouseout="this.className='Dvbbs_Btn';">
											<img class="Dvbbs_Ico"
												src="<%=request.getContextPath()%>/image/information/post/specialchar.gif">
										</td>

									</tr>
								</table>

								<table cellpadding=0 cellspacing=0>
									<tr class="yToolbar" ID="ExtToolbar2">
										<td class="Dvbbs_Btn" TITLE="加粗" LANGUAGE="javascript"
											onclick="FormatText('bold', '');this.className='Dvbbs_TabOn';ondrag='return false;'"
											onmouseover="this.className=
															'Dvbbs_BtnMouseOverUp';"
											onmouseout="this.className='Dvbbs_Btn';">
											<img class="Dvbbs_Ico"
												src="<%=request.getContextPath()%>/image/information/post/bold.gif" WIDTH="16"
												HEIGHT="16" unselectable="on">
										</td>
										<td class="Dvbbs_Btn" TITLE="斜体" LANGUAGE="javascript"
											onclick="FormatText('italic', '');this.className='Dvbbs_TabOn';ondrag='return false;'"
											onmouseover="this.className=
															'Dvbbs_BtnMouseOverUp';"
											onmouseout="this.className='Dvbbs_Btn';">
											<img class="Dvbbs_Ico"
												src="<%=request.getContextPath()%>/image/information/post/italic.gif" WIDTH="16"
												HEIGHT="16" unselectable="on">
										</td>
										<td class="Dvbbs_Btn" TITLE="下划线" LANGUAGE="javascript"
											onclick="FormatText('underline', '');this.className='Dvbbs_TabOn';ondrag='return false;'"
											onmouseover="this.className=
															'Dvbbs_BtnMouseOverUp';"
											onmouseout="this.className='Dvbbs_Btn';">
											<img class="Dvbbs_Ico"
												src="<%=request.getContextPath()%>/image/information/post/underline.gif"
												WIDTH="16" HEIGHT="16" unselectable="on">
										</td>
										<td class="Dvbbs_Btn" TITLE="上标" LANGUAGE="javascript"
											onclick="FormatText('superscript', '');this.className='Dvbbs_TabOn';ondrag='return false;'"
											onmouseover="this.className=
															'Dvbbs_BtnMouseOverUp';"
											onmouseout="this.className='Dvbbs_Btn';">
											<img class="Dvbbs_Ico"
												src="<%=request.getContextPath()%>/image/information/post/superscript.gif"
												WIDTH="16" HEIGHT="16" unselectable="on">
										</td>
										<td class="Dvbbs_Btn" TITLE="下标" LANGUAGE="javascript"
											onclick="FormatText('subscript', '');this.className='Dvbbs_TabOn';ondrag='return false;'"
											onmouseover="this.className=
															'Dvbbs_BtnMouseOverUp';"
											onmouseout="this.className='Dvbbs_Btn';">
											<img class="Dvbbs_Ico"
												src="<%=request.getContextPath()%>/image/information/post/subscript.gif"
												WIDTH="16" HEIGHT="16" unselectable="on">
										</td>
										<td class="Dvbbs_Btn" TITLE="删除线" LANGUAGE="javascript"
											onclick="FormatText('strikethrough', '');this.className='Dvbbs_TabOn';ondrag='return false;'"
											onmouseover="this.className=
															'Dvbbs_BtnMouseOverUp';"
											onmouseout="this.className='Dvbbs_Btn';">
											<img class="Dvbbs_Ico"
												src="<%=request.getContextPath()%>/image/information/post/strikethrough.gif"
												WIDTH="16" HEIGHT="16" unselectable="on">
										</td>
										<td class="Dvbbs_Btn" TITLE="取消格式" LANGUAGE="javascript"
											onclick="FormatText('RemoveFormat', '');this.className='Dvbbs_TabOn';ondrag='return false;'"
											onmouseover="this.className=
															'Dvbbs_BtnMouseOverUp';"
											onmouseout="this.className='Dvbbs_Btn';">
											<img class="Dvbbs_Ico"
												src="<%=request.getContextPath()%>/image/information/post/removeFormat.gif"
												WIDTH="16" HEIGHT="16" unselectable="on">
										</td>
										<td>
											<img src="<%=request.getContextPath()%>/image/information/post/separator.gif">
										</td>
										<td class="Dvbbs_Btn" TITLE="左对齐" NAME="Justify"
											LANGUAGE="javascript"
											onclick="FormatText('justifyleft', '');this.className='Dvbbs_TabOn';ondrag='return false;'"
											onmouseover="this.className=
															'Dvbbs_BtnMouseOverUp';"
											onmouseout="this.className='Dvbbs_Btn';">
											<img class="Dvbbs_Ico"
												src="<%=request.getContextPath()%>/image/information/post/aleft.gif" WIDTH="16"
												HEIGHT="16" unselectable="on">
										</td>
										<td class="Dvbbs_Btn" TITLE="居中" NAME="Justify"
											LANGUAGE="javascript"
											onclick="FormatText('justifycenter', '');this.className='Dvbbs_TabOn';ondrag='return false;'"
											onmouseover="this.className=
															'Dvbbs_BtnMouseOverUp';"
											onmouseout="this.className='Dvbbs_Btn';">
											<img class="Dvbbs_Ico"
												src="<%=request.getContextPath()%>/image/information/post/center.gif" WIDTH="16"
												HEIGHT="16" unselectable="on">
										</td>
										<td class="Dvbbs_Btn" TITLE="右对齐" NAME="Justify"
											LANGUAGE="javascript"
											onclick="FormatText('justifyright', '');this.className='Dvbbs_TabOn';ondrag='return false;'"
											onmouseover="this.className=
															'Dvbbs_BtnMouseOverUp';"
											onmouseout="this.className='Dvbbs_Btn';">
											<img class="Dvbbs_Ico"
												src="<%=request.getContextPath()%>/image/information/post/aright.gif" WIDTH="16"
												HEIGHT="16" unselectable="on">
										</td>
										<td>
											<img src="<%=request.getContextPath()%>/image/information/post/separator.gif">
										</td>
										<td class="Dvbbs_Btn" TITLE="编号" LANGUAGE="javascript"
											onclick="FormatText('insertorderedlist', '');this.className='Dvbbs_TabOn';ondrag='return false;'"
											onmouseover="this.className=
															'Dvbbs_BtnMouseOverUp';"
											onmouseout="this.className='Dvbbs_Btn';">
											<img class="Dvbbs_Ico"
												src="<%=request.getContextPath()%>/image/information/post/numlist.gif" WIDTH="16"
												HEIGHT="16" unselectable="on">
										</td>
										<td class="Dvbbs_Btn" TITLE="项目符号" LANGUAGE="javascript"
											onclick="FormatText('insertunorderedlist', '');this.className='Dvbbs_TabOn';ondrag='return false;'"
											onmouseover="this.className=
															'Dvbbs_BtnMouseOverUp';"
											onmouseout="this.className='Dvbbs_Btn';">
											<img class="Dvbbs_Ico"
												src="<%=request.getContextPath()%>/image/information/post/bullist.gif" WIDTH="16"
												HEIGHT="16" unselectable="on">
										</td>
										<td class="Dvbbs_Btn" TITLE="减少缩进量" LANGUAGE="javascript"
											onclick="FormatText('outdent', '');this.className='Dvbbs_TabOn';ondrag='return false;'"
											onmouseover="this.className=
															'Dvbbs_BtnMouseOverUp';"
											onmouseout="this.className='Dvbbs_Btn';">
											<img class="Dvbbs_Ico"
												src="<%=request.getContextPath()%>/image/information/post/outdent.gif" WIDTH="16"
												HEIGHT="16" unselectable="on">
										</td>
										<td class="Dvbbs_Btn" TITLE="增加缩进量" LANGUAGE="javascript"
											onclick="FormatText('indent', '');this.className='Dvbbs_TabOn';ondrag='return false;'"
											onmouseover="this.className=
															'Dvbbs_BtnMouseOverUp';"
											onmouseout="this.className='Dvbbs_Btn';">
											<img class="Dvbbs_Ico"
												src="<%=request.getContextPath()%>/image/information/post/indent.gif" WIDTH="16"
												HEIGHT="16" unselectable="on">
										</td>



									</tr>
								</table>
								<table cellpadding=0 cellspacing=0>
									<tr class="yToolbar" id="old_Toolbars" style="display: none">
										<td>
											<img onclick="Dv_ubb('B')" src="Skins/Default/ubb/bold.gif"
												alt="粗体" border="0">
											<img onclick="Dv_ubb('I')"
												src="Skins/Default/ubb/italicize.gif" alt="斜体" border="0">
											<img onclick="Dv_ubb('U')"
												src="Skins/Default/ubb/underline.gif" alt="下划线" border="0">
											<img onclick="Dv_ubb('center')"
												src="Skins/Default/ubb/center.gif" alt="居中" border="0">
											<img onclick="Curl()" src="Skins/Default/ubb/url1.gif"
												alt="超级连接" border="0">
											<img onclick="Dv_Signal('EMAIL')"
												src="Skins/Default/ubb/email1.gif" alt="Email连接" border="0">
											<img onclick="Dv_Signal('IMG')"
												src="Skins/Default/ubb/image.gif" alt="图片" border="0">
											<img onclick="Cswf()" src="Skins/Default/ubb/swf.gif"
												alt="Flash图片" border="0">
											<img onclick="Cdir()" src="Skins/Default/ubb/Shockwave.gif"
												alt="Shockwave文件" border="0">
											<img onclick="Crm()" src="Skins/Default/ubb/rm.gif"
												alt="realplay视频文件" border="0">
											<img onclick="Cwmv()" src="Skins/Default/ubb/mp.gif"
												alt="Media Player视频文件" border="0">
											<img onclick="Cmov()" src="Skins/Default/ubb/qt.gif"
												alt="QuickTime视频文件" border="0">
											<img onclick="Dv_ubb('QUOTE')"
												src="Skins/Default/ubb/quote1.gif" alt="引用" border="0">
											<IMG onclick="Dv_ubb('fly')" src="Skins/Default/ubb/fly.gif"
												alt="飞行字" border="0">
											<IMG onclick="Dv_ubb('move')"
												src="Skins/Default/ubb/move.gif" alt="移动字" border=0>
											<IMG onclick="Cguang()" src="Skins/Default/ubb/glow.gif"
												alt="发光字" border="0">
											<IMG onclick="Cying()" src="Skins/Default/ubb/shadow.gif"
												alt="阴影字" border="0">
											<IMG onclick="openScript('smiley.asp',450,250)"
												src="Skins/Default/ubb/ubb_smilie.gif" alt="查看更多的心情图标"
												border=0>
											<img onclick="Dv_Signal('SOUND')"
												src="Skins/Default/ubb/csound.gif" alt="背景音乐" border="0">
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="100%" id=PostiFrame>
								<div id="div_content">
									<iframe class="Dvbbs_Composition" name="Dvbbs_Composition"
										ID="Dvbbs_Composition" MARGINHEIGHT="5" MARGINWIDTH="5"
										width="648" height="350"></iframe>
								</div>
							</td>
						</tr>

					</table>
						<Script type="text/javascript">
							
							var Dvbbs_bIsIE5 = document.all
							if (Dvbbs_bIsIE5) {
								var IframeID = frames["Dvbbs_Composition"];
							} else {
								var IframeID = document.getElementById("Dvbbs_Composition").contentWindow;
								var Dvbbs_bIsNC = true;
							}
							if (Dvbbs_bLoad == false) {
								Dvbbs_InitDocument("resume", "GBK");
							}
						</script>
						<div id=constr></div>
				</td>
			</tr>
		</table>

<Script src="<%=request.getContextPath()%>/image/information/post/DhtmlEdit1.som.js"></Script>
</html>

