/**
 * 判断时间先后
 * 参数：startDate （YYYY-MM-dd） 起始时间
 * 参数：endDate   （YYYY-MM-dd） 结束时间
 * 返回：true： 起始时间小于结束时间，false： 起始时间大于结束时间
 */
function compareDate(startDate,endDate){
	var date1 = new Date(Date.parse(startDate.replace(/\-/g,   '/')));  
	var date2 = new Date(Date.parse(endDate.replace(/\-/g,   '/')));
	if(date1 - date2 > 0){
		return false;
	}
	return true;
}
   
/**
 * 判断数字大小
 * 参数：a
 * 参数：b
 * 返回：true：a小于b，false：a大于b
 */
function compareInteger(a,b){
	if(a-b>0){
		return false;
	}
	return true;
}
/**
 * ip地址格式验证
 * 参数：strIP ip地址字符串
 * 返回：true： 正确的ip，false： 错误的ip
 */
function isIP(strIP) {
	var re=/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/g //匹配IP网段的正则表达式
	if(re.test(strIP)){
		if( RegExp.$1 <256 && RegExp.$2<256 && RegExp.$3<256 && RegExp.$4<256 ){
			return true;
		}
		return false;
	}
}
  
/**
 * mac地址格式验证
 * 参数：e1 需要验证的表单对象 
 * 返回：true 验证通过； false 验证未通过。
 */
function check_mac(e1){
	chkstr=e1.value;
	var pattern="/^([0-9A-Fa-f]{2})(-[0-9A-Fa-f]{2}){5}|([0-9A-Fa-f]{2})(:[0-9A-Fa-f]{2}){5}/";
	eval("var pattern=" + pattern);
	var add_p1 = pattern.test(chkstr);

	if(add_p1==false){
		return false;
	}
	return true;
}
  
/**
 * 数字验证
 * 参数：strValue 需要验证的字符串
 * 返回：true 输入内容为整数；false 输入内容不是整数。
 */
function isInteger(strValue){   
	var objExp = /(^-?\d\d*$)/;   
	return objExp.test(strValue);   
}
  
/**
 * 数字验证(正整数)
 * 参数：strValue 需要验证的字符串
 * 返回：true 输入内容为整数；false 输入内容不是整数。
 */
function isAllInteger(strValue){   
	var objExp = "^[0-9]*[1-9][0-9]*$";   
	return objExp.test(strValue);   
}
    　
/**
 * 日期格式验证（YYYY-MM-dd）
 * 参数：str 需要验证的字符串
 * 返回：true 输入内容为整数；false 输入内容不是整数。
 */ 
function strDateTime(str){
	var r = str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/); 
	if(r==null)return false; 
	var d= new Date(r[1], r[3]-1, r[4]); 
	return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]);
}
  
/**
 * 电话号码非空格式验证
 * 格式分为：1234567,12345678,123-12345678,1234-1234567,1234-12345678，有手机号时用空格分隔。
 * 参数： strTel 需要验证的电话号码
 * 返回：true 为通过,false为通过
 */
function  check_tel(strTel){  	
	var e= /^(((0*\d{2,3})-)?(\d{7,8})(-(\d{2,}))?)?((\s)?1\d{10})*$/;
	if(! e.test(strTel) && strTel != ""){
		alert('电话号码只是数字，区位号后需有"-"字符\r\n格式为：0123-12345678 或 00000000\r\n\t或手机号');
		return false;
	}
	return true;
} 
  
/**
 * 空格过滤验证
 * 参数：inputString 需要验证的字符串
 * 返回：true 验证通过； false 验证未通过。
 */ 
function trim(inputString) {
	if (typeof inputString != "string"){
		return inputString;
	}
	var retValue = inputString;
	var ch = retValue.substring(0, 1);
	while (ch == " ") { 
		//检查字符串开始部分的空格
	    retValue = retValue.substring(1, retValue.length);
	    ch = retValue.substring(0, 1);
	}
	ch = retValue.substring(retValue.length-1, retValue.length);
	while (ch == " ") {
		//检查字符串结束部分的空格
	   retValue = retValue.substring(0, retValue.length-1);
	   ch = retValue.substring(retValue.length-1, retValue.length);
	}
	while (retValue.indexOf("  ") != -1) { 
		//将文字中间多个相连的空格变为一个空格
	   retValue = retValue.substring(0, retValue.indexOf("  ")) + retValue.substring(retValue.indexOf("  ")+1, retValue.length); 
	}
	return retValue;
} 
/**
 * 过滤特殊字符
 * 参数：inputString 需要验证的字符串
 * 返回：true 验证通过； false 验证未通过。
 */ 
function CheckIfEnglish(String){
	var Letters = "(!@#$%^&*;':,.?/，。";
	var i;
	var c;
	if(String.charAt( 0 )=='-')
		return false;
	if( String.charAt( String.length - 1 ) == '-' )
		return false;
	for(i = 0; i < String.length; i++){
		c = String.charAt( i );
		if (Letters.indexOf( c ) > 0)
			return false;        
	}
	return true;
}
/**
 * 过滤首字符为特殊字符
 * 参数：inputString 需要验证的字符串
 * 返回：true 验证通过； false 验证未通过。
 */ 
function CheckFirstChar(String){ 
	var Letters = "(!@#$%^&*;':,.?/，。-";
	var c = String.substring(0,1);
	if (Letters.indexOf(c) > 0){
		return false;        
	}
	return true;
}
/**
 * 判断输入的信息是否超过合法的长度。传入参数中，nLen为允许输入的英文字符个数
 *
 * 参数：str 待检测的字符串,maxLength 允许输入的英文字符个数
 * 返回： true if str's length<=maxLength, false otherwise.
 */
function isLegal( str, maxLength ) {
    var realLength = getStringLength(str);
    return (realLength <= maxLength);
}


/**
 * str 待检测的字符串
 * str的长度(英文字符个数)
 */
function getStringLength(str) {
    if (str == null || str.length == 0) {
        return 0;
    }
    var strLong = 0;
    var browserLen  = str.length;
    var result      = 0;
    var charCode    = 0;
    for (i=0; i<browserLen; i++) {
        charCode = str.charCodeAt(i);
        if (charCode > 255) {
               strLong += 2;
        } else {
            strLong += 1;
        }
    }
    return strLong;
}

/**
 * 判断字符串是否为中文
 *
 * 注意: 函数只是通过字符ascii码判断，不是严格的编码范围判断，
 * 所以如果输入字符串为其它亚洲国家文字，也会返回true
 *
 * 参数: str
 * 返回： true 如果str是中文字符串, false如果str为空或者不是中文字符串
 */
function isChinese(str) {
    if (str == null || str.length == 0) {
        return false;
    }
    var browserLen  = str.length;
    var charCode = 0;
    for (i=0; i<browserLen; i++) {
        charCode = str.charCodeAt(i);
        if (charCode > 255) {
               return true;
        }
    }
    return false;
}

/**
 * 判断字符串是否为中文（全部都是中文）
 *
 * 注意: 函数只是通过字符ascii码判断，不是严格的编码范围判断，
 * 所以如果输入字符串为其它亚洲国家文字，也会返回true
 *
 * 参数: str
 * 返回： true 如果str是中文字符串, false如果str为空或者不是中文字符串
 */
function isAllChinese(str) {
    if (str == null || str.length == 0) {
        return false;
    }
    var browserLen  = str.length;
    var charCode = 0;
    for (i=0; i<browserLen; i++) {
        charCode = str.charCodeAt(i);
        if (charCode < 255) {
               return false;
        }
    }
    return true;
}

//判断整数首字符不能为0
function isZero(str){
     var charCode = str.substring(0,1);
     if (charCode.indexOf("0")==-1){
          return true;
     }
     return false;
}