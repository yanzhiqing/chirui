// JavaScript Document
/******************************************************************************
*�������ƣ�Ŀ¼�� for ALL 2.0
*�����ܣ���ȫ����Javascript�Ķ�̬����Ŀ¼
*�漰������menu ��itemExists �� chengstate �� setupcookie �� initialize �� objExists �� saveCookie �� getCookie �� checkCookieExist �� deleteCookie
*�������壺
	menu				������������ ��
	itemExists			���ж��Ƿ���childer��
	chengstate			���л��ڵ�״̬��open/close����
	setupcookie			�����ڵ�״̬����Cookie ��
	initialize			����ʼ���ڵ�״̬����ȡCookie����
	objExists			����֤�����Ƿ���� ��
	saveCookie			��ִ�б���Cookie ��
	getCookie			��ִ�ж�ȡCookie ��
	checkCookieExist	����֤Cookie�Ƿ���� ��
	deleteCookie		��ɾ��Cookie ��
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
 * ����add_item��ʼ�˵���
 */
//                 0 id      1 ��id      2  ����   3 �ر�ͼ��     4 ��ͼ��      5  ��ַ    6 ָ�򴰿� 7�˵���ѡ�� 8�������� 9�������
function add_item(tree_id,tree_prarent,tree_name,tree_close_ico,tree_open_ico,tree_url,tree_target,chabox,chvalue,chflag,chname)
{
	if(tree_close_ico=="")
		tree_close_ico="/images/treeimg/close.gif";
	if(tree_open_ico=="")
		tree_open_ico="/images/treeimg/open.gif";
	//                                       0 id      1 ��id      2  ����    3  ��ַ   4  �ر�ͼ��    5 ��ͼ��     6 ָ�򴰿� 7�˵���ѡ�� 8�������� 9�������
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
 * ���˵�
 */


function menu(id)
{
	var currdata	= new Array();
	var i			= 0;
	var printstr	= "<table border='0' cellspacing='0' cellpadding='0'>\n";
	var listtype	= "";
	var menutype	= "";


	for(; i<treedata.length; i++)
	{					//�ж����޴˽ڵ�
		if(treedata[i][1]==id)	currdata[currdata.length] = treedata[i];
	}//end for


	for(var i=0; i<currdata.length; i++)
	{
           var chekboxs ="";
          //�������飬ִ���ж�
		if(itemExists(currdata[i][0]))
		{						//�ж��Ƿ����ӽڵ�
			if(i==currdata.length-1)
			{			// ���һ��
				menutype	= "menu3";
				listtype	= "list1";
			}
			else
			{
				menutype	= "menu1";
				listtype	= "list";
			}//end if
			onmouseup	= "chengstate("+currdata[i][0]+")";
			if(currdata[i][7]==1){
			menuname	= " <input name='role' value='"+currdata[i][0]+"' type='checkbox' onclick='return chekb(this)' checked='checked'/> "+currdata[i][2]+" ";
		}
		else{
			menuname	= "<input name='role' value='"+currdata[i][0]+"' onclick='return chekb(this)' type='checkbox'/> "+currdata[i][2]+" ";

		}
			//menuname	= "<a href='"+currdata[i][3]+"' target='"+currdata[i][6]+"'>"+currdata[i][2]+"</a> ";
			chekboxs="  <input name='ls"+currdata[i][0]+"' style='display:none' type='checkbox' value=''/>";
//			menuname	= currdata[i][2];
		}
		else
		{					//û���ӽڵ�
			if(i==currdata.length-1)
			{			// ���һ��
				menutype	= "file1";
			}
			else
			{
				menutype	= "file";
			}//end if
			if(currdata[i][7]==1){
			menuname	= " <input name='role' onclick='return chekb(this)' value='"+currdata[i][0]+"' type='checkbox' checked='checked'/> "+currdata[i][2]+" ";
		}
		else{
			menuname	= "<input name='role' onclick='return chekb(this)' value='"+currdata[i][0]+"' type='checkbox'/> "+currdata[i][2]+" ";

		}
		if(currdata[i][8]!=""){
       var box=currdata[i][8].split('_');
       var boxname=currdata[i][10].split('_');
			var chex=currdata[i][9].split('_');
			var cheks="";
                        var muName="";

			for(var m=0;m<box.length;m++){
				var str1=chex[m];
				str1=str1.replace(/(^\s+|\s+$)/g,"")
                                switch (boxname[m])
				{
					case "RZlook":
						muName = "��ϸ";
						break;
					case "RZadd":
                        muName = "���";
						break;
					case "RZdel":
						muName = "ɾ��";
						break;
					case "RZedit":
						muName = "�޸�";
						break;
                    case "RZsearch":
						muName = "��ϸ��ѯ";
						break;
                    case "RZtjczt":
						muName = "��Ӳ˵�����";
						break;
                    case "RZaccredit":
						muName = "��Ȩ";
						break;
                    case "RZdis":
						muName = "�����ɫ";
						break;
                    case "RZembdiv":
						muName = "ʹ���ŷ�";
						break;
                    case "RZbackdiv":
						muName = "�����ŷ�";
						break;
                    case "RZprint":
						muName = "��ӡ";
						break;
                    case "RZpay":
						muName = "�ɷ�";
						break;
                    default :
                        muName	= "����";
						break;
				}
				if(chex[m]==1){
					cheks+="  <input name='ls"+currdata[i][0]+"' onclick='return chekbs(this)' type='checkbox' checked ='checked' value='"+box[m]+"'/>"+muName+"";
					}
					else{
						cheks+="  <input name='ls"+currdata[i][0]+"' onclick='return chekbs(this)' type='checkbox' value='"+box[m]+"'/>"+muName+"";
						}
				}
                                chekboxs=cheks;
			}else{
                           chekboxs="  <input name='ls"+currdata[i][0]+"' style='display:none' type='checkbox' value=''/>";
                          }
			onmouseup	= "";
		}//end if
		ico			= "<img src='"+path+currdata[i][4]+"' id='ico"+currdata[i][0]+"' align=middle border=0>";
		printstr	+= "<tr><td id='pr"+currdata[i][0]+"' valign=middle class="+menutype+" onMouseUp="+onmouseup+">"+ico+"<span onMouseOver='over_str(this)' valign='bottom' onMouseOut='out_str(this)' class='item'> "+menuname+" </span>"+chekboxs+"</td></tr>\n";
		printstr	+= "<tr id='item"+currdata[i][0]+"' style='display:none'><td class="+listtype+">"+menu(currdata[i][0])+"</td></tr>\n";

	}//end for
	printstr	+= "</table>\n";

	return printstr;
}
/**
 * �ж���û���ӽڵ�
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
 *  ���нڵ�ȫ���۵�
 */
function closeAll()
{
	var len	= treedata.length;
	for(var i=0; i<len; i++)
	{
          //�������飬ִ���ж�
		obj		= eval("pr"+treedata[i][0]);
		if(obj.className == "menu2" || obj.className == "menu4")
		{
                  //�ж��Ƿ����ӽڵ�
			chengstate(treedata[i][0]);
		}
	}

}
/**
 * ���нڵ�ȫ��չ��
 */

function openAll()
{
	var len	= treedata.length;
	for(var i=0; i<len; i++)
	{
          //�������飬ִ���ж�
		obj		= eval("pr"+treedata[i][0]);
		if(obj.className == "menu1" || obj.className == "menu3")
		{
                  //�ж��Ƿ����ӽڵ�
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
 * �л��ڵ�Ŀ���/�ر�
 */

function chengstate(menuid,save)
{

	menuobj	= eval("item"+menuid);
	obj		= eval("pr"+menuid);
	ico		= eval("ico"+menuid);
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
			break;
		case "menu2":
			obj.className	= "menu1";
			break;
		case "menu3":
			obj.className	= "menu4";
			break;
		case "menu4":
			obj.className	= "menu3";
			break;
	}

	if(save!=false)
	{
		setupcookie(menuid);			//����״̬
	}
}

/**
 * ����cookie  ����ڵ�״̬
 */

function setupcookie(menuid)
{
	var menu	= new Array();
	var menustr	= new String();
	menuOpen	= false;
	if(checkCookieExist("menu"))
	{
          //�ж��Ƿ����Ƿ��Ѿ������cookie
		menustr		= getCookie("menu");

		if(menustr.length>0)
		{
                  //�ж�menu�Ƿ�Ϊ�գ���������ֽ�Ϊ����
			menu	= menustr.split(",");
			for(var i=0;i<menu.length;i++)
			{
				if(menu[i]==menuid)
				{
                                  //����Ǵ�״̬������ɾ����¼
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
	if(menustr.substr(menustr.length-1,1)==',')menustr = menustr.substr(0,menustr.length-1);		//ȥ������ ","
	if(menustr.substr(0,1)==',')menustr = menustr.substr(1,menustr.length-1);		//ȥ����ʼ�� ","
	saveCookie("menu",menustr,1000);

}

/**
 * ȡ��cookie  ���ýڵ������,,��ʼ���˵�״̬
 */

function initialize()
{
	var menu	= new Array();
	var menustr	= new String();

	if(checkCookieExist("menu"))
	{
          //�ж��Ƿ����Ƿ��Ѿ������cookie
		menustr		= getCookie("menu");
		if(menustr.length>0)
		{
                  //�жϳ����Ƿ�Ϸ�
			menu	= menustr.split(",");
			for(var i=0;i<menu.length;i++)
			{
				if(objExists(menu[i]))
				{
                                  //��֤�����Ƿ����
					chengstate(menu[i],false);
				}
			}
			objExists(99);
		}
	}
}

/**
 * ��֤�����Ƿ����
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


//--------------------------------------------------������������������������  ִ��Cookie ����

/**
 *  ����Cookie
 */
function saveCookie(name, value, expires, path, domain, secure)
{
  var strCookie = name + "=" + value;
  if (expires)
  {
    // ����Cookie������, ����Ϊ����
     var curTime = new Date();
     curTime.setTime(curTime.getTime() + expires*24*60*60*1000);
     strCookie += "; expires=" + curTime.toGMTString();
  }
  strCookie +=  (path) ? "; path=" + path : "";
  // Cookie��Domain
  strCookie +=  (domain) ? "; domain=" + domain : "";
  // �Ƿ���Ҫ���ܴ���,Ϊһ������ֵ
  strCookie +=  (secure) ? "; secure" : "";
  document.cookie = strCookie;
}

/**
 * ʹ�����Ʋ���ȡ��Cookieֵ, null��ʾCookie������
 */

function getCookie(name)
{
  var strCookies = document.cookie;
  var cookieName = name + "=";  // Cookie����
  var valueBegin, valueEnd, value;
  // Ѱ���Ƿ��д�Cookie����
  valueBegin = strCookies.indexOf(cookieName);
  if (valueBegin == -1) return null;  // û�д�Cookie
  // ȡ��ֵ�Ľ�βλ��
  valueEnd = strCookies.indexOf(";", valueBegin);
  if (valueEnd == -1)
      valueEnd = strCookies.length;  // ����һ��Cookie
  // ȡ��Cookieֵ
  value = strCookies.substring(valueBegin+cookieName.length,valueEnd);
  return value;
}

/**
 * ���Cookie�Ƿ����
 */
function checkCookieExist(name)
{
  if (getCookie(name))
      return true;
  else
      return false;
}
/**
 * ɾ��Cookie
 */

function deleteCookie(name, path, domain)
{
  var strCookie;
  // ���Cookie�Ƿ����
  if (checkCookieExist(name))
  {
    // ����Cookie������Ϊ������
    strCookie = name + "=";
    strCookie += (path) ? "; path=" + path : "";
    strCookie += (domain) ? "; domain=" + domain : "";
    strCookie += "; expires=Thu, 01-Jan-70 00:00:01 GMT";
    document.cookie = strCookie;
  }
}
