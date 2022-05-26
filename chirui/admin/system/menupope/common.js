/*
==模块功能：菜单信息的公共javascript
==作者：吴江栋
==时间：2006-08-23
*/

function checkall() {
/*
对常见数据类型进行效验rigorCheckValue()光标自动定位
参数args1代表参数对象，例如：document.form1.name.value
参数args2代表是否为空:0代表空 1代表非空
参数args3代表参数类型:1代表"不可有< > 的string" ， 2代表"number"， 3代表"float"， 4代表"date"代表，5代表"只能是数字和字母的组合"
参数args4代表字符串长度：0：代表不限制
参数args5代表数字小数点位数（仅对float类型有效）：0：代表不限制
参数args6代表参数的实际意义，以便能准确通知用户。
*/
	if(!rigorCheckValue(document.all["menuPopeVO.popeName"],1,1,20,0,"菜单操作名称")){
	    return false;
	}else if(!rigorCheckValue(document.all["menuPopeVO.popeUrl"],1,1,100,0,"菜单操作URL")){
	    return false;
	}
	
	return true;
}

/*===================================================
功能：使【菜单编号（menuId）】输入框只能输入数字
输入：
输出：
===================================================*/
function checkMenuId() {
	var num = document.all["menuPopeVO.menuId"];
    
    checkNum(num);

	return;
} 

/*===================================================
功能：使【菜单操作名称（popeName）】输入框只能输入英文字母
输入：
输出：
===================================================*/
function checkPopeName() {
	var en = document.all["menuPopeVO.popeName"];
    
    checkEn(en);

	return;
} 

/*===================================================
功能：使【备注（col1）】输入框只能输入长度为maxlen的信息
输入：
输出：
===================================================*/
function checkcCol1() {
	var obj = document.all["menuPopeVO.col1"];
	var maxlen = 100;
    
    checkMaxlen(obj,maxlen);

	return;
} 


