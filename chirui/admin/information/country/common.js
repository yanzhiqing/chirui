/*
==模块功能：国家信息的公共javascript
==作者：李永祥
==时间：2006-08-20
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
	/*if(!rigorCheckValue(document.all["countryInfoVO.continentCode"],1,1,10,0,"洲区号")){
		return false;
	}else*/ 
	if(!rigorCheckValue(document.all["countryInfoVO.continent"],1,1,100,0,"洲")){
	    return false;
	}else 
	if(!rigorCheckValue(document.all["countryInfoVO.countryNo"],1,1,100,0,"国家代号")){
	    return false;
	}else if(!rigorCheckValue(document.all["countryInfoVO.country"],1,1,100,0,"国家或地区")){
	    return false;
	/*}else if(!rigorCheckValue(document.all["countryInfoVO.countryCode"],1,1,100,0,"地名代码")){
	    return false;*/
	}
	
	return true;
}

/*===================================================
功能：使【洲英文名称（countryInfoVO.continentEn）】输入框只能输入英文字符串
输入：
输出：
===================================================*/
function checkContinentEn() {
	var en = document.all["countryInfoVO.continentEn"];

	checkEn(en);

	return;
}
/*===================================================
功能：使【国家或地区英文名称（countryInfoVO.countryEn）】输入框只能输入英文字符串
输入：
输出：
===================================================*/
function checkCountryEn() {
	var en = document.all["countryInfoVO.countryEn"];

	checkEn(en);

	return;
}
/*===================================================
功能：查询条件打包（李永祥20060925add 目的：解决记住查询条件问题）
输入： 
输出：
===================================================*/
function getConditionString(){
	var continentCode = document.all["countryInfoVO.continentCode"].value;
	var continent = document.all["countryInfoVO.continent"].value;
	var countryNo = document.all["countryInfoVO.countryNo"].value;
	var country = document.all["countryInfoVO.country"].value;
	var hiddenFlag = document.all["countryInfoVO.hiddenFlag"].value;
	
	//获取当前页码
	var currentPageNum = document.all["currentPageNum"].value;

	var conditionString = "&countryInfoVO.continentCode="+continentCode+"&countryInfoVO.continent="+continent+"&countryInfoVO.countryNo="+countryNo+"&countryInfoVO.country="+country+"&countryInfoVO.hiddenFlag="+hiddenFlag+"&currentPageNum="+currentPageNum;

	return conditionString;
}