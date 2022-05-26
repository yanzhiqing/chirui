
/*
 *  日期下拉框。
 * Copyright: Copyright (c) 2007 Company: 西安秦码软件科技有限公司 * 
 * @author 蒋华涛
 * @date 2009-4-07
 */

	/**
	* @param jqueryObj jquery类型 年下拉框
	* @param defaultValue string 默认值
	*/
	function inityear(jqueryObj, defaultValue){			
		//jqueryObj.append("<option value=''>--不限--</option>");
		defaultValue = (defaultValue == undefined) ? "0" : defaultValue;
		for (var i = 1990; i >= 1930; i--){		
			jqueryObj.append("<option value='" + i + ((i != defaultValue)?"'>":"' selected>") + i + "</option>");
		}		
	}	
		
	/**
	* @param jqueryObj jquery类型 月下拉框
	* @param defaultValue string 默认值
	*/
	function initmonth(jqueryObj, defaultValue){			
		//jqueryObj.append("<option value=''>--不限--</option>");
		defaultValue = (defaultValue == undefined) ? "0" : defaultValue;
		for (var i = 1; i <= 12; i++){		
			jqueryObj.append("<option value='" + ((i<10)? ("0" + i) : i)  + ((i != defaultValue)?"'>":"' selected>") + ((i<10)? ("0" + i) : i)  + "</option>");
		}		
	}
		
	/**
	* @param jqueryObj jquery类型 日下拉框
	* @param days int 天数
	* @param defaultValue string 默认值
	*/
	function initday(jqueryObj, days,defaultValue){	
		//jqueryObj.append("<option value=''>--不限--</option>");
		jqueryObj[0].options.length = 1;	
		days = (days == undefined) ? 31 : days;		
		defaultValue = (defaultValue == undefined) ? "0" : defaultValue;
		for (var i = 1; i <= days; i++){		
			jqueryObj.append("<option value='" + ((i<10)? ("0" + i) : i) + ((i != defaultValue)?"'>":"' selected>") + ((i<10)? ("0" + i) : i) + "</option>");
		}		
	}
	
	/**
	* @param yearId string 年下拉框id
	* @param monthId string 月下拉框id
	* @param dayId string 日下拉框id
	*/
	function changedate(yearId,monthId,dayId,parentId){
		var jqyear;
		var jqmonth;
		var jqday;
		if(parentId != undefined && parentId != ""){
			jqyear = $("#" + parentId + " #"+ yearId);
			jqmonth = $("#" + parentId + " #"+ monthId);
			jqday = $("#" + parentId + " #"+ dayId);
		}else{
			jqyear = $("#" + yearId);
			jqmonth = $("#" + monthId);
			jqday = $("#" + dayId);
		}
		
		var year = parseInt(jqyear.val(),10);
		var month = parseInt(jqmonth.val(),10);	
		var day = parseInt(jqday.val(),10);
		
		if(isNaN(year))	return;		
		if(isNaN(month)) return;
		
		var isLeapYear=((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) ? true : false;
		var daysOfMonth=[31,28,31,30,31,30,31,31,30,31,30,31];
		daysOfMonth[1] = isLeapYear ? 29 : 28;
		initday(jqday,daysOfMonth[month - 1],day);	
	}	
				
				