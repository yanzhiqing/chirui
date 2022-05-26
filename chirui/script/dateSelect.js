
/*
 *  ����������
 * Copyright: Copyright (c) 2007 Company: ������������Ƽ����޹�˾ * 
 * @author ������
 * @date 2009-4-07
 */

	/**
	* @param jqueryObj jquery���� ��������
	* @param defaultValue string Ĭ��ֵ
	*/
	function inityear(jqueryObj, defaultValue){			
		//jqueryObj.append("<option value=''>--����--</option>");
		defaultValue = (defaultValue == undefined) ? "0" : defaultValue;
		for (var i = 1990; i >= 1930; i--){		
			jqueryObj.append("<option value='" + i + ((i != defaultValue)?"'>":"' selected>") + i + "</option>");
		}		
	}	
		
	/**
	* @param jqueryObj jquery���� ��������
	* @param defaultValue string Ĭ��ֵ
	*/
	function initmonth(jqueryObj, defaultValue){			
		//jqueryObj.append("<option value=''>--����--</option>");
		defaultValue = (defaultValue == undefined) ? "0" : defaultValue;
		for (var i = 1; i <= 12; i++){		
			jqueryObj.append("<option value='" + ((i<10)? ("0" + i) : i)  + ((i != defaultValue)?"'>":"' selected>") + ((i<10)? ("0" + i) : i)  + "</option>");
		}		
	}
		
	/**
	* @param jqueryObj jquery���� ��������
	* @param days int ����
	* @param defaultValue string Ĭ��ֵ
	*/
	function initday(jqueryObj, days,defaultValue){	
		//jqueryObj.append("<option value=''>--����--</option>");
		jqueryObj[0].options.length = 1;	
		days = (days == undefined) ? 31 : days;		
		defaultValue = (defaultValue == undefined) ? "0" : defaultValue;
		for (var i = 1; i <= days; i++){		
			jqueryObj.append("<option value='" + ((i<10)? ("0" + i) : i) + ((i != defaultValue)?"'>":"' selected>") + ((i<10)? ("0" + i) : i) + "</option>");
		}		
	}
	
	/**
	* @param yearId string ��������id
	* @param monthId string ��������id
	* @param dayId string ��������id
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
				
				