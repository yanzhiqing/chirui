// JavaScript Document
/******************************************************************************
*程序名称：目录树 for ALL 2.0
*程序功能：完全基于Javascript的动态树形目录
*涉及函数：menu ；itemExists ； chengstate ； setupcookie ； initialize ； objExists ； saveCookie ； getCookie ； checkCookieExist ； deleteCookie
*函数意义：
	menu				：生成树代码 ；
	itemExists			：判断是否有childer；
	chengstate			：切换节点状态（open/close）；
	setupcookie			：将节点状态存入Cookie ；
	initialize			：初始化节点状态（读取Cookie）；
	objExists			：验证对象是否存在 ；
	saveCookie			：执行保存Cookie ；
	getCookie			：执行读取Cookie ；
	checkCookieExist	：验证Cookie是否存在 ；
	deleteCookie		：删除Cookie ；
*******************************************************************************/
treedata	= new Array();
path		= "";
function treemenu(tree_path,tree_name,tree_ico)
{
	path	= tree_path;
	name	= tree_name;
	ico	= tree_ico;

	document.write("<div style='font-size:15px;font-weight:bold'><img src='"+path+ico+"' align=top border=0>"+name+"</div>");

}
/**
 * 方法add_item初始菜单项
 */
//                 0 id      1 父id      2  名称   3 关闭图标     4 打开图标      5  地址    6 指向窗口 7菜单复选框 8操作动作 9操作标记
function add_item(tree_id,tree_prarent,tree_name,tree_close_ico,tree_open_ico,tree_url,tree_target,chabox,chvalue,chflag,chname)
{
	if(tree_close_ico=="")
		tree_close_ico=location.href.substring(0, location.href.lastIndexOf('/'))+"/images/treeimg/close.gif";
	if(tree_open_ico=="")
		tree_open_ico=location.href.substring(0, location.href.lastIndexOf('/'))+"/images/treeimg/open.gif";
	//                                       0 id      1 父id      2  名称    3  地址   4  关闭图标    5 打开图标     6 指向窗口 7菜单复选框 8操作动作 9操作标记
	treedata[treedata.length]	= new Array(tree_id,tree_prarent,tree_name,tree_url,tree_close_ico,tree_open_ico,tree_target,chabox,chvalue,chflag,chname);
}


function print_arr()
{
	var i;
	var j;
	var n	= treedata.length;
	var m	= treedata[0].length;

	for(var i=0; i<n; i++)
	{
		for(j=0; j<m;j++)
		{
			//"  treedata["+i+"]["+j+"]="
			document.write(" "+j+":"+treedata[i][j]);
		}

		document.write(" <br>\n");
	}

}

/**
 * 画菜单
 */
function menu(id){
	var currdata	= new Array();
	var i			= 0;
	var printstr	= "<table border='0' cellspacing='0' cellpadding='0'>\n";
	var listtype	= "";
	var menutype	= "";
	var	ico_url ="";
	
	for(; i<treedata.length; i++){	//判断有无此节点
		if(treedata[i][1]==id){
			currdata[currdata.length] = treedata[i];
		}
	}


	for(var i=0; i<currdata.length; i++){
          //遍历数组，执行判断
		if(itemExists(currdata[i][0])){	//判断是否有子节点
			if(i==currdata.length-1){			// 最后一个
				ico_url = location.href.substring(0, location.href.lastIndexOf('/'))+"/images/treeimg/folder3.gif";
				menutype	= "menu3";
				listtype	= "list1";
			}else{
				ico_url = location.href.substring(0, location.href.lastIndexOf('/'))+"/images/treeimg/folder1.gif";
				menutype	= "menu1";
				listtype	= "list";
			}

			onmouseup	= "chengstate("+currdata[i][0]+")";
			if(currdata[i][7]==1){
				menuname	= "<input name='role' id='p_"+currdata[i][1]+"_"+currdata[i][0]+"' value='p"+currdata[i][1]+"_"+currdata[i][0]+"' type='checkbox' onclick='selectParent(this);' checked='checked'/><span onMouseUp="+onmouseup+">"+currdata[i][2]+"</span>";
			}else{
				menuname	= "<input name='role' id='p_"+currdata[i][1]+"_"+currdata[i][0]+"' value='p"+currdata[i][1]+"_"+currdata[i][0]+"' onclick='selectParent(this);' type='checkbox'/><span onMouseUp="+onmouseup+">"+currdata[i][2]+"</span> ";
			}
		}else{					//没有子节点
			if(i==currdata.length-1){// 最后一个
				
				menutype	= "file1";
				ico_url = location.href.substring(0, location.href.lastIndexOf('/'))+"/images/treeimg/file1.gif";
			}else{
				menutype	= "file";
				ico_url = location.href.substring(0, location.href.lastIndexOf('/'))+"/images/treeimg/file.gif";
			}

			if(currdata[i][7]==1){
				
				menuname = "<input name='role' id='p_"+currdata[i][1]+"_"+currdata[i][0]+"' onclick='selectChild(this);' value='p"+currdata[i][1]+"_"+currdata[i][0]+"' type='checkbox' checked='checked'/> "+currdata[i][2]+" ";
			}else{
				menuname = "<input name='role' id='p_"+currdata[i][1]+"_"+currdata[i][0]+"' onclick='selectChild(this);' value='p"+currdata[i][1]+"_"+currdata[i][0]+"' type='checkbox'/>"+currdata[i][2]+" ";
	
			}
			
			onmouseup = "";
		}

		
		ico			= "<img src='"+ico_url+"' id='img_ico"+currdata[i][0]+"' onMouseUp='"+onmouseup+"'>"+"<img src='"+path+currdata[i][4]+"' id='ico"+currdata[i][0]+"' align=middle border=0  onMouseUp="+onmouseup+">";
		printstr	+= "<tr><td id='pr"+currdata[i][0]+"' valign=middle class="+menutype+">"+ico+"<span onMouseOver='over_str(this)' valign='bottom' onMouseOut='out_str(this)' class='item'> "+menuname+" </span></td></tr>\n";
		printstr	+= "<tr id='item"+currdata[i][0]+"' style='display:none'><td class="+listtype+">" + menu(currdata[i][0])+"</td></tr>\n";

	}
	printstr	+= "</table>\n";
	return printstr;
}


/**
 * 判断有没有子节点
 */

function itemExists(id)
{
	for(var i=0;i<treedata.length;i++)
	{
		if(treedata[i][1]==id)return true;
	}
	return false;
}

/**
 *  所有节点全部折叠
 */
function closeAll()
{
	var len	= treedata.length;
	for(var i=0; i<len; i++)
	{
          //遍历数组，执行判断
		obj		= eval("pr"+treedata[i][0]);
		if(obj.className == "menu2" || obj.className == "menu4")
		{
                  //判断是否有子节点
			chengstate(treedata[i][0]);
		}
	}

}
/**
 * 所有节点全部展开
 */

function openAll()
{
	var len	= treedata.length;
	for(var i=0; i<len; i++)
	{
          //遍历数组，执行判断
		obj		= eval("pr"+treedata[i][0]);
		if(obj.className == "menu1" || obj.className == "menu3")
		{
                  //判断是否有子节点
			chengstate(treedata[i][0]);
		}
	}
}

function over_str(obj)
{
	obj.style.background	= "#EEEEEE";
	obj.style.border		= "1px solid #999999";
}

function out_str(obj)
{
	obj.style.background	= "";
	obj.style.border		= "1px solid #FFFFFF";
}

/**
 * 切换节点的开放/关闭
 */

function chengstate(menuid,save)
{

	menuobj	= eval("item"+menuid);
	obj		= eval("pr"+menuid);
	ico		= eval("ico"+menuid);
	img_ico		= eval("img_ico"+menuid);
	var len	= treedata.length;
	for(var i=0; i<len; i++)
	{
		if(treedata[i][0]==menuid)
		{
			break;
		}
	}

	if(menuobj.style.display == '')
	{
		menuobj.style.display	= 'none';
		ico.src					= path+treedata[i][4];
	}else{
		menuobj.style.display	= '';
		ico.src					= path+treedata[i][5];
	}
	switch (obj.className)
	{
		case "menu1":
			obj.className	= "menu2";
			img_ico.src= location.href.substring(0, location.href.lastIndexOf('/'))+"/images/treeimg/folder2.gif";
			break;
		case "menu2":
			obj.className	= "menu1";
			img_ico.src= location.href.substring(0, location.href.lastIndexOf('/'))+"/images/treeimg/folder1.gif";
			break;
		case "menu3":
			obj.className	= "menu4";
			img_ico.src= location.href.substring(0, location.href.lastIndexOf('/'))+"/images/treeimg/folder4.gif";
			break;
		case "menu4":
			obj.className	= "menu3";
			img_ico.src= location.href.substring(0, location.href.lastIndexOf('/'))+"/images/treeimg/folder3.gif";
			break;
	}

	if(save!=false)
	{
		setupcookie(menuid);			//保存状态
	}
}

/**
 * 存入cookie  保存节点状态
 */

function setupcookie(menuid)
{
	var menu	= new Array();
	var menustr	= new String();
	menuOpen	= false;
	if(checkCookieExist("som_menu"))
	{
          //判断是否是是否已经保存过cookie
		menustr		= getCookie("som_menu");

		if(menustr.length>0)
		{
                  //判断menu是否为空，，，否则分解为数组
			menu	= menustr.split(",");
			for(var i=0;i<menu.length;i++)
			{
				if(menu[i]==menuid)
				{
                                  //如果是打开状态，，，删除记录
					menu[i]='';
					menuOpen	= true;
				}
			}
			if(menuOpen==false)menu[i] = menuid;
		}else{
			menu[0]	= menuid;
		}
	}else{
		menu[0]	= menuid;
	}
	menu.sort();
	menustr	= menu.join(",");
	menustr	= menustr.replace(",,",",");
	if(menustr.substr(menustr.length-1,1)==',')menustr = menustr.substr(0,menustr.length-1);		//去掉最后的 ","
	if(menustr.substr(0,1)==',')menustr = menustr.substr(1,menustr.length-1);		//去掉开始的 ","
	saveCookie("som_menu",menustr,1000);

}

/**
 * 取得cookie  设置节点的缩放,,初始化菜单状态
 */

function initialize()
{
	var menu	= new Array();
	var menustr	= new String();

	if(checkCookieExist("som_menu"))
	{
          //判断是否是是否已经保存过cookie
		menustr		= getCookie("som_menu");
		if(menustr.length>0)
		{
                  //判断长度是否合法
			menu	= menustr.split(",");
			for(var i=0;i<menu.length;i++)
			{
				if(objExists(menu[i]))
				{
                                  //验证对象是否存在
					chengstate(menu[i],false);
				}
			}
			objExists(99);
		}
	}
}

/**
 * 验证对象是否存在
 */

function objExists(objid)
{
	try
	{
		obj = eval("item"+objid);
	}
	catch(obj)
	{
		return false;
	}

	if(typeof(obj)=="object")
	{
		return true;
	}
	return false;
}


//--------------------------------------------------↓↓↓↓↓↓↓↓↓↓↓↓  执行Cookie 操作

/**
 *  保存Cookie
 */
function saveCookie(name, value, expires, path, domain, secure)
{
  var strCookie = name + "=" + value;
  if (expires)
  {
    // 计算Cookie的期限, 参数为天数
     var curTime = new Date();
     curTime.setTime(curTime.getTime() + expires*24*60*60*1000);
     strCookie += "; expires=" + curTime.toGMTString();
  }
  strCookie +=  (path) ? "; path=" + path : "";
  // Cookie的Domain
  strCookie +=  (domain) ? "; domain=" + domain : "";
  // 是否需要保密传送,为一个布尔值
  strCookie +=  (secure) ? "; secure" : "";
  document.cookie = strCookie;
}

/**
 * 使用名称参数取得Cookie值, null表示Cookie不存在
 */

function getCookie(name)
{
  var strCookies = document.cookie;
  var cookieName = name + "=";  // Cookie名称
  var valueBegin, valueEnd, value;
  // 寻找是否有此Cookie名称
  valueBegin = strCookies.indexOf(cookieName);
  if (valueBegin == -1) return null;  // 没有此Cookie
  // 取得值的结尾位置
  valueEnd = strCookies.indexOf(";", valueBegin);
  if (valueEnd == -1)
      valueEnd = strCookies.length;  // 最後一个Cookie
  // 取得Cookie值
  value = strCookies.substring(valueBegin+cookieName.length,valueEnd);
  return value;
}

/**
 * 检查Cookie是否存在
 */
function checkCookieExist(name)
{
  if (getCookie(name))
      return true;
  else
      return false;
}
/**
 * 删除Cookie
 */

function deleteCookie(name, path, domain)
{
  var strCookie;
  // 检查Cookie是否存在
  if (checkCookieExist(name))
  {
    // 设置Cookie的期限为己过期
    strCookie = name + "=";
    strCookie += (path) ? "; path=" + path : "";
    strCookie += (domain) ? "; domain=" + domain : "";
    strCookie += "; expires=Thu, 01-Jan-70 00:00:01 GMT";
    document.cookie = strCookie;
  }
}

//选择节点有子点节点
function selectParent(test){

	var id = test.value.substring(test.value.indexOf("_")+1);	
	var roleBox = document.getElementsByName("role");
	
	for(var i = 0; i < roleBox.length; i++){
		var v = roleBox[i].value;			
		if(v.substring(0,v.indexOf("_") + 1) == "p" + id + "_" ){
			//alert(v + "截取后"　+  v.substring(0,v.indexOf("_") + 1));			
			roleBox[i].checked = test.checked;
			
			var cId = v.substring(v.indexOf("_")+1);
			for(var j = 0; j< roleBox.length; j++){
				var v1 = roleBox[j].value;
				//如果有子节点时，就递归
				if(v1.substring(0,v1.indexOf("_") + 1) == "p" + cId + "_" ){
				//alert(cId + "---" + v+ " ---"+v.substring(0,v.indexOf("_") + 1));
					roleBox[j].checked=roleBox[i].checked;
					selectParent(roleBox[j]);
				}				
			}
		}
	}
	
	selectChild(test);
	
}

//选择子节点选择父节点
function selectChild(o){
	if(o.checked){	
		var pid = o.id.split("_")[1];
		if(pid == "-1") return;
		var roleBox = document.getElementsByName("role");
		for(var i = 0; i < roleBox.length; i++){
			var cid = roleBox[i].id.split("_")[2];
			
			if(pid == cid){
				roleBox[i].checked = true;
				selectChild(roleBox[i]);
			}
		}
	}
	
}