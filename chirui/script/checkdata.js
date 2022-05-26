/**
 * Copyright:   txl co.ltd
 * Author:      唐玺良
 * Description: JavaScript脚本文件，提供公用方法，供JSP网页调用
 * CodeDate:    2004-09-11
 */

/**
 * 作用: 去除字符串左空格
 * 参数: str: 字符串
 * 返回: 去除左空格后的字符串
 */
function lTrim(str){
	var rtnStr;
	rtnStr=""
	for (var i=0;i<str.length;i++){
		if (str.charAt(i)!=" "){
			rtnStr=str.substr(i);
			break;
		}
	}
	return rtnStr;
}

/**
 * 作用: 去除字符串右空格
 * 参数: str: 字符串
 * 返回: 去除右空格后的字符串

function rTrim(str){
	var rtnStr;
	rtnStr=""
	for (var i=str.length-1;i>=0;i--){
		if (str.charAt(i)!=" "){
			rtnStr=str.substring(0,i+1);
			break;
		}
	}
	return rtnStr;
}
 */
//去掉字串右边的空格
function rTrim(str)
{
var iLength;

iLength = str.length;
if (str.charAt(iLength - 1) == " ")
{
//如果字串右边第一个字符为空格
str = str.slice(0, iLength - 1);//将空格从字串中去掉
//这一句也可改成 str = str.substring(0, iLength - 1);
str = rTrim(str); //递归调用
}
return str;
}


/**
 * 作用: 去除字符串左右空格
 * 参数: str: 字符串
 * 返回: 去除左右空格后的字符串
 */
function trim(str){
	return(lTrim(rTrim(str)));
}

/**
 * 作用: 根据错误号，显示提示信息
 * 参数: (1) errNo: 错误号（与message.js文件对应）; (2) objName: 对象名（可选参数）
 * 返回: alert对话框
 */
function displayMessage(errNo,objName) {
  if( objName==null ){
    alert(errNo);
  } else {
    alert('"'+objName+'"'+errNo);
  }
}

/**
 * 作用: 检测是否为空
 * 参数: obj: 要检查的输入对象
 * 返回: true/false
 */
function isEmpty(obj) {
	var val=obj.value;
	if(trim(val)==""){
		return true;
	}
  return false;
}

/**
 * 作用: 检测是否为空；如果为空，显示提示信息
 * 参数: (1) obj: 要检查的输入对象; (2) message: 在错误提示中显示的对象名称（可选）
 * 返回: true/false alert
 */
function isEmptyAlt(obj,message) {
  if( isEmpty(obj) ){
    displayMessage(M01001,message);
    obj.focus();
    return true;
  }
  return false;
}

/*===================================================
功能：使输入框只能输入相应长度的信息
输入：obj 输入框名
      maxlen 容许的最大长度
输出：
作者：吴江栋
时间：2006-08-20
修改时间：
===================================================*/
function checkMaxlen(obj,maxlen) {

	//去掉过长的数据
	if(obj.value.length > maxlen){
        obj.value = obj.value.substring(0, maxlen);
    }

	return;
}

/**
 * 作用: 检测数字，至少一位长度
 * 参数: value: 要检查的输入值
 * 返回: true/false
 */
function isNumber(value) {
	var str=trim(value);
	var regexp=/^(\d+)$/;
	return regexp.test(str);
}




//判断是否英文
function isEng(engchar){
	var bolon=true;
	var c;
	var i,j;
	
	for(i=0;i<engchar.length;i++)
	{
		var bolonchar=false;
		c=engchar.charAt(i);
		var charString="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~!@#$%^&*()-_+;:'\"<,.>?/";
		
		for (j=0;j<=charString.length;j++) {
			if((c==charString.charAt(j))||(c==' ')) {  
				bolonchar=true; 
				break;
			}
		}
        
        if (bolonchar==false){  
			bolon=false;
			break;
		}
	}
    return bolon;
}

//把半角的"&",转为全角的"&";
//说明:1、在xml里半角"&"是关键字
//     2、"&"的半角码为38，全角码为65286( = 38 + 65248)
//吴江栋 2006-11-06
function and2Quanjiao(en) {
	var tLen = en.value.length; //信息的总长度
	var fLen = 0; //信息前面部分的长度
	var tv = null; //过程临时值
	
	for(var i=0;i<en.value.length;i++) {
		tv = en.value.substring(i, parseInt(i) + 1);
		
		if(tv.charCodeAt(0) == 38) {
			tv = toSBC(tv);
			en.value = en.value.substring(0, i) + tv +
					en.value.substring(parseInt(i) + 1, tLen);
		}
	}
}



//判断电话号码
function isPhone(phone){
	var len=phone.length;
	var flag=true;
	var i,j;
	var numStr="0123456789";
	for(i=0;i<len;i++){
		var num=phone.charAt(i);
		var flage=false;
		for(j=0;j<10;j++){
			if((num==numStr.charAt(j))||(num=='-') || (num=='(') || (num==')')){
				flage=true;
				break;
			}
		}
		if(flage==false){
			flag=false;
			break;
		}
	}/**/
	return flag;

}

/**
 * 作用: 检测数字，至少一位长度；如果不是数字，显示提示信息
 * 参数: obj: 要检查的输入对象; (2) message: 在错误提示中显示的对象名称（可选）
 * 返回: true/false alert
 */
function isNumberAlt(obj,message) {
  if( isNumber(obj.value) ){
    return true;
  }
  displayMessage(M01002,message);
  obj.focus();
  return false;
}

/**
 * 作用: 检测int，长度范围：1－限定长度
 * 参数: (1) num: 输入的数字; (2) len: 数字的限定长度（默认是8）
 * 返回: true/false
 */
function isInt(num,len){
  var regexp;
  var leng;
  if( len==null ){
    regexp = /^(\d){1,8}$/;
  } else {
    regexp = /^(\d){1,leng}$/;
  }
  return(regexp.test(num));
}

/**
 * 作用: 检测int，长度范围（1－限定长度）；如果不符，显示提示信息
 * 参数: (1) num: 输入的数字; (2) len: 数字的限定长度（默认是8）; (3) message: 在错误提示中显示的对象名称（可选）
 * 返回: true/false alert
 */
function isIntAlt(num,len,message) {
  if( isInt(num,len) ){
    return true;
  }
  displayMessage(M01003,message);
  return false;
}

//检测float，长度范围：整数1－11位，浮点精度4位
//如：12 12.12 12.1234 为合法的，12.12345为非法
function isFloat(obj){
  //var regexp = /^(\d){1,11}((.)(\d){1,4})?$/;
// 2004-07-26 李诚修改
//   var regexp = /^(-?)?(\d){1,11}((.)(\d){1,4})?$/;
  var regexp = /^(-?)?(\d){1,11}((\.)(\d){1,4})?$/;
  return(regexp.test(trim(obj.value)));
}

//检测float，长度范围：整数1－11位，浮点精度4位
//如果不符，显示提示信息
function isFloatAlt(obj,message) {
  if( isFloat(obj) ){
    return true;
  }
  displayMessage(M01004,message);
  obj.focus();
  return false;
}

//检测字符串,为数字与字母组合
function isString(value){
	var str=trim(value);
	var regexp=/^(\w+)$/;
	return regexp.test(str);
}

//检测字符串,为数字与字母组合；如果不符，显示提示信息
function isStringAlt(obj,message) {
  if( isString(obj.value) ){
    return true;
  }
  displayMessage(M01005,message);
  obj.focus();
  return false;
}

//电子信箱检测
function isEmail(str) {
	var regexp = /^(\w)[^@]{0,100}(@)(\w){1,50}(.(\w){1,20})+$/;
	return(regexp.test(str));
}

//电子信箱检测；如果不符，显示提示信息
function isEmailAlt(str,message) {
  if( isEmail(str) ){
    return true;
  }
  displayMessage(M01006,message);
  return false;
}

//身份证号码检测
function isIDCard(str) {
	var regexp;
	if(str.length==15){             //15位
		regexp=/^(\d{15})$/;
   	return regexp.test(str);
	}
  if(str.length==18){             //18位
	  regexp=/^(\d{17})([1]{1})$/;
    if(!regexp.test(str))
	    regexp=/^(\d{17})(\w{1})$/;
		return regexp.test(str);
	}
	return false;
}

//身份证号码检测；如果格式不符，显示提示信息
function isIDCardAlt(str,message) {
  if( isIDCard(str) ){
    return true;
  }
  displayMessage(M01007,message);
  return false;
}

//用户ID检测，可以包含字母数字及除字符：’ ” 外的其他字符，长度1－16位
function isUserID(str) {
	regexp = /^(\w){1,16}$/;
  return(regexp.test(str));
}

//用户ID检测，可以包含字母数字及除字符：’ ” 外的其他字符，长度1－16位
//如果格式不符，显示提示信息
function isUserIDAlt(str,message) {
  if( isUserID(str) ){
    return true;
  }
  displayMessage(M01008,message);
  return false;
}

//检测字符串 不能包含><'"
function isStr(obj){
	var tf=false;
	var str=trim(obj.value);
	//if(str.indexOf("'")>-1||str.indexOf(">")>-1||str.indexOf("<")>-1||str.indexOf("\"")>-1)
	// 取消对 "'" 的限制 ,英文报告模版中需要输入"'" (陈应祥 2007-03-23).
	if(str.indexOf(">")>-1||str.indexOf("<")>-1||str.indexOf("\"")>-1)
		tf=false;
	else
		tf=true;
	return tf;
}

//检测字符串 不能包含><'"；如果格式不符，显示提示信息
function isStrAlt(obj,message) {
  if( isStr(obj) ){
    return true;
  }
  displayMessage(M01009,message);
  obj.focus();
  return false;
}

//检测日期（1900~2099），合法格式为 2002-09-30
function isDate(obj)
{
 var dt=trim(obj.value);
 var dtYear = dt.substring(0,4);
 var joinStr1 = dt.substring(4,5);
 var dtMonth = dt.substring(5,7);
 var joinStr2 = dt.substring(7,8);
 var dtDay = dt.substring(8,10);
 var leapYear = false;     //闰年标志
 var tf = true;
 if (!isInt(dtYear))
   return false;
 if (!isInt(dtMonth))
   return false;
 if (!isInt(dtDay))
   return false;
 if(joinStr1!="-"||joinStr2!="-")
   return false;
 if((dt.length)!=10)
   tf = false;
 if(dtYear<1900)
   tf = false;
 if(dtYear>2099)
   tf = false;
 if((dtYear%400)==0)
   leapYear = true;
 else
   if((dtYear%100)!=0)
     if(dtYear%4==0)
       leapYear = true;
 if(dtMonth<1)
   tf = false;
 if(dtMonth>12)
   tf = false;
 switch(dtMonth) {
   case '01':
   case '03':
   case '05':
   case '07':
   case '08':
   case '10':
   case '12':
     if(dtDay<1)
       tf = false;
     if(dtDay>31)
       tf = false;
     break;
   case '04':
   case '06':
   case '09':
   case '11':
     if(dtDay<1)
       tf = false;
     if(dtDay>30)
       tf = false;
     break;
   case '02':
     if(leapYear) {
       if(dtDay<1)
         tf = false;
       if(dtDay>29)
         tf = false;
     }
     else {
       if(dtDay<1)
         tf = false;
       if(dtDay>28)
         tf = false;
     }
     break;
 }

 if(tf)
   return true;
 else
   return false;
}

//检测日期只有年月的格式，合法格式为 2002-09
function isYM(obj){
	var dt=trim(obj.value);
	var reFlag = false;
	
	if(dt.length == 7){
		var dtYear = dt.substring(0,4);
        var joinStr1 = dt.substring(4,5);
		var dtMonth = dt.substring(5,7);

		if (isInt(dtYear) && joinStr1 == "-" && isInt(dtMonth)) {
			if((dtMonth >= 01) && (dtMonth <= 12)) {
				reFlag = true;
			}
		}
	}
	
	return reFlag;
 
}
//检测日期（1900~2099），合法格式为 2002-09-30；如果格式不符，显示提示信息
function isDateAlt(obj,message) {
  if( isDate(obj) ){
    return true;
  }
  displayMessage(M01010,message);
  obj.focus();
  return false;
}
//检测日期（1900~2099），合法格式为 2002-09-30
function isTempDate(obj)
{
 var dt=obj;
 var dtYear = dt.substring(0,4);
 var joinStr1 = dt.substring(4,5);
 var dtMonth = dt.substring(5,7);
 var joinStr2 = dt.substring(7,8);
 var dtDay = dt.substring(8,10);
 var leapYear = false;     //闰年标志
 var tf = true;
 if (!isInt(dtYear))
   return false;
 if (!isInt(dtMonth))
   return false;
 if (!isInt(dtDay))
   return false;
 if(joinStr1!="-"||joinStr2!="-")
   return false;
 if((dt.length)!=10)
   tf = false;
 if(dtYear<1900)
   tf = false;
 if(dtYear>2099)
   tf = false;
 if((dtYear%400)==0)
   leapYear = true;
 else
   if((dtYear%100)!=0)
     if(dtYear%4==0)
       leapYear = true;
 if(dtMonth<1)
   tf = false;
 if(dtMonth>12)
   tf = false;
 switch(dtMonth) {
   case '01':
   case '03':
   case '05':
   case '07':
   case '08':
   case '10':
   case '12':
     if(dtDay<1)
       tf = false;
     if(dtDay>31)
       tf = false;
     break;
   case '04':
   case '06':
   case '09':
   case '11':
     if(dtDay<1)
       tf = false;
     if(dtDay>30)
       tf = false;
     break;
   case '02':
     if(leapYear) {
       if(dtDay<1)
         tf = false;
       if(dtDay>29)
         tf = false;
     }
     else {
       if(dtDay<1)
         tf = false;
       if(dtDay>28)
         tf = false;
     }
     break;
 }

 if(tf)
   return true;
 else
   return false;
}

//检测日期时间（1900~2099），合法格式为 2002-09-30 09：34；
function isDatetime(obj) {
  //alert("come in two!");
  obj=trim(obj.value);
  if(obj.length<16)return false;
  var objDate=obj.substring(0,10);
  //alert("objDate="+objDate);
  var objConnect=obj.substring(10,11);
  //alert("objConnect="+objConnect);
  var objTime=obj.substring(11,16);
  //alert("objTime="+objTime);
  if(isTempDate(objDate)&&objConnect==' '&&isTimeHM(objTime)){
    return true;
  }
  return false;
}

//检测日期时间（1900~2099），合法格式为 2002-09-30 09：34；如果格式不符，显示提示信息
function isDatetimeAlt(obj,message) {
  //alert("come in!");
  if( isDatetime(obj) ){
    return true;
  }
  displayMessage(M01023,message);
  obj.focus();
  return false;
}
//检测URL地址
function isURL(obj) {
  if( isEmpty(obj)){
    return false;
	}
	var str = trim(obj.value);
  if( (str.indexOf ('http://') != -1) ||
      (str.indexOf ('https://') != -1) ||
      (str.indexOf ('HTTP://')  != -1) ||
      (str.indexOf ('HTTPS://') != -1)) {
    if( (str=='http://' ) || (str=='https://') ||
        (str=='HTTP://' ) || (str=='HTTPS://')) {
      obj.value="";
    }
    return true;
  }
  displayMessage( M01011 );
  obj.focus();
  return false;
}

//检测URL地址；如果格式不符，显示提示信息
function isURLAlt(obj,message) {
  if( isURL(obj) ){
    return true;
  }
  displayMessage(M01011,message);
	obj.focus();
  return false;
}

//检测输入的日期是否是正确的创建日期，Max time <= System Time
function checkCreateDate(obj)
{
	var SystemTime = new Date();
  var dtValue   = trim(obj.value);

  if( !isDate(obj) )
  {
    return false;
  }
  dtArray   = dtValue.split('-');

  // Jason   SystemTime.getMonth() => SystemTime.getMonth() + 1

  if( (dtArray[0] - SystemTime.getFullYear() > 0  )  ||
      (dtArray[0] - SystemTime.getFullYear() == 0 ) && (dtArray[1] -1  - SystemTime.getMonth() > 0)  ||
      (dtArray[0]-SystemTime.getFullYear() == 0) && (dtArray[1] - 1 - SystemTime.getMonth() == 0 ) && (dtArray[2] - SystemTime.getDate() > 0 ) )
  {
    return false;
  }
  return true;
}

//检测输入的日期是否是正确的创建日期，Max time <= System Time
//如果格式不符，显示提示信息
function checkCreateDateAlt(obj,message) {
  if( checkCreateDate(obj) ){
    return true;
  }
  displayMessage(M01012,message);
	obj.focus();
  return false;
}

//检测输入的小时的值是否有效
function checkHour(h)
{
  var hour = trim(h);
  if (hour.length!=0){
    if ((isNaN(hour)==true)||(hour>=24)||(hour="")){
      return false;
    }
  }
  return true;
}

//检测输入的是否有SpaceBar
function isNSpace(obj) {
	var str=trim(obj.value);
  if ( (str.indexOf (' ') == -1) || (str.indexOf ('\uFFFD@') == -1)){
    return true;
  }else{
    return false;
  }
}

//检测输入的是否有SpaceBar；如果是，给出提示信息
function isNSpaceAlt(obj,message) {
  if (!isNSpace(obj)){
    return true;
  }
  displayMessage(M01014,message);
	obj.focus();
  return false;
}

//检测邮政编码
function isZip(num){
  var regexp = /^(\d){6}$/;
  return(regexp.test(num));
}

//检测邮政编码；如果不符，给出错误提示
function isZipAlt(obj,message) {
	var num=trim(obj.value);
  if( isZip(num) ){
    return true;
  }
  displayMessage(M01015,message);
	obj.focus();
  return false;
}

//得到输入的字符串的长度(full and half)
function getLength(theStr) {
  var i, cnt = 0;
  for (i=0; i<theStr.length; i++) {
    code  = escape(theStr.substring(i,i+1));
    if ( code.length == 6) {cnt+=2;}
    if ( code.length == 3) {
	//modified by zhangkw 2002/1/2
	  if(theStr.substring(i,i+1) == '<'){
	    cnt += 2;
	  } else if(theStr.substring(i,i+1) == '>') {
	    cnt += 2;
	  } else if(theStr.substring(i,i+1) == '\"') {
	    cnt += 2;
	  } else if( theStr.substring(i,i+1) == '\'') {
	    cnt += 2;
	  } else if(theStr.substring(i,i+1) == '&') {
	    cnt += 2;
	  } else if(theStr.substring(i,i+1) == '\\') {
	    cnt += 2;
	  } else {
	    cnt+=1;
	  }
   //end of modify
	}
  if ( code.length == 1) {cnt+=1;}
  }
  return cnt;
}

//检测输入的字符串长度是否是 half
function isHalfChar(theStr) {
  var fristInt  = getLength(theStr);
  var secondInt = theStr.length;
  if ( fristInt == secondInt)
  { return true;
  }
  return false;
}

//检测输入的字符串长度是否是 full
function isFullChar(theStr) {
  var fristInt  = getLength(theStr);
  var secondInt = theStr.length;
  if ( fristInt == secondInt*2)
  { return true;
  }
  return false;
}

//检测输入的日期是否是：YYYY-MM-DD格式
function isDateYMD(str){
  if(str.search(/^(\d){4}\-(\d){1,2}\-(\d){1,2}$/) != -1) {
    var a = str.split(/-/);
    if((a[0] > 1000) || (a[0] < 3000)) {
      return false;
    } if((a[1] > 0) || (a[1] < 13)) {
      return false;
    } if((a[2] > 0) || (a[2] < 32)) {
      return false;
    }
    return true;
  } else {
    return false;
  }
}

//检测输入的日期是否是：YYYY-MM格式
function isDateYM(str){
  if(str.search(/^(\d){4}\-(\d){2}$/) != -1) {
    var a = str.split(/-/);
    if((a[0] > 1000) || (a[0] < 3000)) {
      return false;
    } if((a[1] > 0) || (a[1] < 13)) {
      return false;
    }
    return true;
  } else {
    return false;
  }
}

//检测输入的时间是否是 HH:MM 格式
function isTimeHM(str){
  if(str.search(/^(\d){1,2}\:(\d){2}$/) != -1) {
    var a = str.split(/:/);
    if((a[0] > 23) || (a[0] < 0)) {
      return false;
    } if((a[1] > 59) || (a[1] < 0)) {
      return false;
    }
    return true;
  } else {
    return false;
  }
}

//检测输入的时间是否是 HH:MM 格式；如果不符，给出错误提示
function checkTimeHMAlt(obj, message) {
  if(isTimeHM(obj.value)) {
    return true;
  } else {
    displayMessage( M01013, message);
    obj.focus();
    return false;
  }
}

//检测输入的分钟的值是否有效
function checkMinute(h,m)
{
  var minute = trim(m);
  var hour = trim(h);
  if (minute.length!=0){
    if ((isNaN(minute)==true)||(minute>=60)){
      return false;
    }
    if (hour.length==0){
      return false;
    }
  }
  return true;
}

//检测输入 "hour:minute~hour:minute" 是否正确
function checkTimePair(starth,startm,finishh,finishm,flag)
{
  sh=trim(starth);
  sm=trim(startm);
  fh=trim(finishh);
  fm=trim(finishm);

  if (sh.length == 1)
    sh = '0' + sh;
  if (sm.length == 1)
    sm = '0' + sm;
  if (fh.length == 1)
    fh = '0' + fh;
  if (fm.length == 1)
    fm = '0' + fm;

  begin=sh+sm;
  finish=fh+fm;

  if (!checkHour(sh)||!checkMinute(sh,sm)){
   /*   alert(starth+":"+startm+" has a wrong :time wrong");*/
    return false;
  }
  if (!checkHour(fh)||!checkMinute(fh,fm)){
   /*   alert(finishh+":"+finishm+" has a wrong :time wrong");*/
    return false;
  }
  if (flag==1){
    if ((sh.length!=0)&&(fh.length==0)){
  /*         alert(starth+":"+startm+" need the finishtime");*/
      return false;
    }
    if ((sh.length==0)&&(fh.length!=0)){
  /*       alert(finishh+":"+finishm+" need the begintime");*/
      return false;
    }
  }
    if ((sh.length!=0)&&(fh.length!=0)&&(begin>=finish)){
     /*     alert(starth+":"+startm+" or "+finishh+":"+finishm+" has a wrong :"
            +" The first one must less than the last one!");*/
      return false;
    }
  return true;
}

//计算年龄
function countAge(dateStr) {
  var birth = new Date(dateStr.substring(0,4),
                       parseInt(dateStr.substring(4,6)) - 1,
                       dateStr.substring(6,8));
  var today = new Date();

  var age = Math.abs(today.getFullYear() - birth.getFullYear())
  var diffMon = today.getMonth() - birth.getMonth();
  var diffDate = today.getDate() - birth.getDate();
  var age = (diffMon > 0)||((diffMon == 0)&&(diffDate >= 0)) ? age : (age - 1);
  return age;
}

//转换 yyyymmdd 到 yyyy年mm月dd日
function dateDisplay(dateStr) {
  var newDateStr = "";
  if(dateStr.length == 6) {
    newDateStr = dateStr.substring(0,4) +'年'+
                 dateStr.substring(4,6) + '月';
  } else if(dateStr.length == 8) {
    newDateStr = dateStr.substring(0,4) + '年'+
                 dateStr.substring(4,6) + '月'+
                 dateStr.substring(6,8) + '日';

  } else {
    newDateStr = "&nbsp&nbsp&nbsp&nbsp";
  }
  return newDateStr;
}

//计算输入的字符串长度
function getLen(str) {
  return str.length;
}

//计算输入的字符串的实际长度，不包含前后的空格
function getLenTrim(str) {
  var str = trim(str);
  return str.length;
}

//显示字符串的长度
function dispLen(str) {
  alert('文字长度：' + str.length);
}

/*
对常见数据类型进行效验checkValue()光标自动定位
参数args1代表参数对象，例如：document.form1.name.value
参数args2代表是否为空:0代表空 1代表非空
参数args3代表参数类型:1代表"不可有< > 的string" ， 2代表"number"， 3代表"float"， 4代表"date"代表，5代表"只能是数字和字母的组合"
参数args4代表参数的实际意义，以便能准确通知用户。
*/

function checkValue(args1,args2,args3,args4){
  var temArg=args1;
   //alert("检查args2是0代表空:1代表非空");
  if(args2==0){
	// alert("可以为空，检查是否为空");
    if(!isEmpty(temArg)){
       //alert("检查后不是空");
     if(onCheckValue(temArg,args3,args4)){
		 //alert("不为空后检查后是合适的数值");
		 return true;
	 }
	 //alert("为空后检查后不是合适的数值");
	 return false;
    }
	 //alert("检查后是空");
	return true;
  }else if(args2==1){
	  //alert("不可以为空，检查是否为空");
    if(!isEmptyAlt(temArg,args4)){
     //alert("检查后不是空2");
    if(onCheckValue(temArg,args3,args4)){
		//alert("不为空后检查后是合适的数值2");
		return true;
     }
	//alert("为空后检查后不是合适的数值2");
	return false;
    }
	//alert("检查后是空2");
	return false;
  }
}

/*
对常见数据类型进行效验rigorCheckValue()光标自动定位
参数args1代表参数对象，例如：document.form1.name.value
参数args2代表是否为空:0代表空 1代表非空
参数args3代表参数类型:1代表"不可有< > 的string" ， 2代表"number"， 3代表"float"， 4代表"date"代表，5代表"只能是数字和字母的组合"
参数args4代表字符串长度：0：代表不限制
参数args5代表数字小数点位数（仅对float类型有效）：0：代表不限制
参数args6代表参数的实际意义，以便能准确通知用户。
*/
function rigorCheckValue(args1,args2,args3,args4,args5,args6){
  var temArg=args1;
  if(args2==0){
	// alert("可以为空，检查是否为空");
    if(!isEmpty(temArg)){
       //alert("检查后不是空");
     if(onCheckValue(temArg,args3,args6)){
		 //alert("不为空后检查后是合适的数值");
          if(args4!=0){
            //alert("要求检验长度");
            if(rigorCheck(temArg,args3,args4,args5,args6)){
              //alert("进行精确度检查通过");
	      return true;
	    }
          }
	  else{
	    return true;
	  }
	 }
	 //alert("为空后检查后不是合适的数值");
	 return false;
    }
	 //alert("检查后是空");
	return true;
  }else if(args2==1){
	  //alert("不可以为空，检查是否为空");
    if(!isEmptyAlt(temArg,args6)){
     //alert("检查后不是空2");
    if(onCheckValue(temArg,args3,args6)){
		//alert("不为空后检查后是合适的数值2");
          if(args4!=0){
            //alert("要求检验长度2");
            if(rigorCheck(temArg,args3,args4,args5,args6)){
              //alert("精确度检查通过2");
	      return true;
	    }
          }
	  else{
	    return true;
	  }
     }
	//alert("为空后检查后不是合适的数值2");
	return false;
    }
	//alert("检查后是空2");
	return false;
  }
}

/*
对常见数据类型长度进行效验
参数arg代表参数对象，例如：document.form1.name.value
参数strType代表参数类型:1代表"不可有< > 的string" ， 2代表"number"， 3代表"float"， 4代表"date"代表，5代表"只能是数字和字母的组合"
参数maxLen代表字符串长度：0：代表不限制
参数pointLen代表数字小数点位数（仅对float类型有效）：0：代表不限制
参数message代表参数的实际意义，以便能准确通知用户。
*/
function rigorCheck(arg,strType,maxLen,pointLen,message){
  var str = arg.value;
  if(strType==2){
    //alert("int类型检查长度");
    if(str.length<=maxLen){
      //alert("int类型检查长度通过");
      return true;
    }
    displayMessage(M12002,message);
    arg.focus();
    return false;
  }
  else if(strType==3){
    //alert("float类型检查长度");
    var point = str.indexOf(".");
    if(point==-1){
      //alert(str+"中没有小数点");
      if(str.length<=(maxLen-pointLen)){
        //alert(str+"输入正确");
        return true;
      }
      else{
        displayMessage(M12002,message);
        arg.focus();
        return false;
      }
    }
    else{
      //alert(str+"中含有小数点");
      var strInt = str.substring(0,point);
      var strPoint = str.substring(point+1,str.length);
      if(strInt.length<=(maxLen-pointLen)){
        if(strPoint.length<=pointLen){
          //alert("float数据检查通过");
          return true;
        }
        else{
          //alert("小数点后的位数太多");
          displayMessage(M12003,message);
        }
      }
      else{
        //alert("小数点前的数据太大");
        displayMessage(M12002,message);
      }
      arg.focus();
      return false;
    }
  }
  else if(strType==1 || strType==5){
    //alert("字符串类型检查长度");
    if(checkChinese(str)<=maxLen){
      //alert("字符串类型检查长度通过");
      return true;
    }
    displayMessage(M12001,message);
    arg.focus();
    return false;
  }
}

/*
YunFan于2004-02-23新增，增加了对字符串中含有汉字字符的判断
参数说明
str：字符串
返回值：字符串长度，一个汉字字符的长度为2
*/
function checkChinese(str)
{
	var num = str.length;
	for (i=0;i<str.length;i++)
	{
		if(str.charAt(i)>'　')
		{
			 num++;
		}
	}
	return num;
}

function onCheckValue(arg,args3,args4){
  //alert("输入有值是进行数据类型的效验");
  if(args3==1){
    //alert("检查是否字符串");
    if(isStrAlt(arg,args4)) return true;
	return false;
  }else if(args3==2){
    //alert("检查是否NUMBER");
    if(isNumberAlt(arg,args4))return true;
	return false;
  }else if(args3==3){
    //alert("检查是否FLOAT");
    if(isFloatAlt(arg,args4))return true;
	return false;
  }else if(args3==4){
    //alert("检查是否DATE");
    if(isDateAlt(arg,args4))return true;
	return false;
  }else if(args3==5){
    //alert("检查是否只能是数字和字母的组合");
    if(isStringAlt(arg,args4))return true;
	return false;
  }else if(args3==6){
    //alert("检查是否是DATETIME");
    if(isDatetimeAlt(arg,args4))return true;
	return false;
  }
}
/*
在有多条（或者一条）记录的情况下执行删除操作（可删除多条记录）时而需要的效验：multDelAct（）
参数args1代表复选框对象，例如：document.form1.name
*/
function multDelAct(args1){
   if(!args1){
      alert("没有记录要删除！");
      return false;
   }else if(args1.length){
      var a=0;
      for(i=0;i<args1.length;i++){
	if(args1[i].checked)a++;
      }
      if(a==0){
	alert("你还没有选择要删除的记录！");
	return false;
      }else{
        if(confirm("你真的要删除吗？")){
	  return true;
	}
	  return false;
      }
    }else{
      if(!args1.checked){
        alert("你还没有选择要删除的记录！");
	return false;
      }else {
	if(confirm("你真的要删除吗？")){
	   return true;
	}
	return false;
      }
    }
}
/*
在有多条（或者一条）记录的情况下执行必须对一条记录操作而需要的效验：multAct（）
参数args1代表复选框对象，例如：document.form1.name
参数args2代表显示信息，例如："删除"，"修改"
参数args3代表是否提醒用户进行的此操作，1代表提醒，0代表不提醒
*/
function multAct(args1,args3,args2){
	if(!args1){
		alert("没有记录要"+args2+"！");
		return false;
	}else if(args1.length){
	  var a=0;
	  for(i=0;i<args1.length;i++)
	   if(args1[i].checked)a++;
	   if(a>1){
           alert("只能"+args2+"一个记录！");
	     return false;
	   }else if(a<1){
	     alert("你还没有选择要"+args2+"的记录！");
	     return false;
	   }else if(args3==1){
           if(confirm("你真的要"+args2+"吗？")){
		      return true;
	       }
	      return false;
	   }else{
            return true;
          }

	}else{
	  if(!args1.checked){
         alert("你还没有选择要"+args2+"的记录！");
		 return false;
	  }else if(args3==1){
	    if(confirm("你真的要"+args2+"吗？")){
		      return true;
	       }
	      return false;
	 }else{
          return true;
     }
	}
   return false;
}
/*
在有多条（或者一条）记录的情况下执行必须对一条记录操作而需要的效验：multAct（）
参数args1代表复选框对象，例如：document.form1.name
参数args2代表显示信息，例如："删除"，"修改"
参数args3代表是否提醒用户进行的此操作，1代表提醒，0代表不提醒
参数args4代表是否可以多选 0 代表不可以 1代表可以
参数args5是当前项是否可以删除 0 代表可以 1 代表不可以
*/
function wwmultAct(args1,args3,args2,args4,args5){
	if(!args1){
		alert("没有目录要"+args2+"！");
		return false;
	}else if(args1.length){
          if(args4==0){

	  var a=0;
	  for(i=0;i<args1.length;i++)
	   if(args1[i].checked)a++;

	   if(a>1){
           alert("只能"+args2+"一个目录！");
	     return false;
	   }else if(a<1){
	     alert("你还没有选择要"+args2+"的目录！");
	     return false;
	   }else if(args3==1){

           for(i=0;i<args1.length;i++)
	   { if(args5!=null){
              if(args1[i].checked)
              {
               if(args5[i].value=='1')
                {   a++;
                   // alert(i);
                    alert("你选择的目录里含有不允许删除的目录，请检查！");
                   return  false;
                   break;;
                }
	     }
	   }
	     }
           /* if(a>1){
              alert("只能"+args2+"一个目录！");
	     return false;
	   }*/

            if(confirm("你真的要"+args2+"吗？")){

		      return true;
	       }
	      return false;
	   }else{
            return true;
          }
	}else if(args4==1){
           var a=0;
          for(i=0;i<args1.length;i++)
	   { if(args5!=null){
              if(args1[i].checked)
              {  a++;
               if(args5[i].value=='1')
                {
                    alert("你选择的目录里含有不允许删除的目录，请检查！");
                   return  false;
                   break;;
                }
	     }
	   }
	   }
           if(a<1){
	     alert("你还没有选择要"+args2+"的目录！");
	     return false;
	   }else {
             return  true;
	   }
	 }
	}else{
	  if(!args1.checked){
         alert("你还没有选择要"+args2+"的目录！");
		 return false;
	  }else if(args3==1){
             if(args5!=null){
              if(args5.value=='1'){
                      alert("你选择的目录里含有不允许删除的目录，请检查！");
                     return  false;
                  }
             }

	    if(confirm("你真的要"+args2+"吗？")){

		      return true;
	       }
	      return false;
	 }else{
           if(args5!=null){
              if(args5.value=='1'){
                      alert("你选择的目录里含有不允许删除的目录，请检查！");
                     return  false;
                  }
           }
          return true;
     }
	}
   return false;
}

/*
在有多条（或者一条）记录的情况下执行必须对一条记录操作而需要的效验：multAct（）
参数args1代表复选框对象，例如：document.form1.name
参数args2代表显示信息，例如："删除"，"修改"
参数args3代表是否提醒用户进行的此操作，1代表提醒，0代表不提醒
参数args4代表是否可以多选,1代表可以,0代表不可以
@ author wangxinliang
*/
function wmultAct(args1,args3,args2,args4,args5){
	if(!args1){
		alert("没有记录要"+args2+"！");
		return false;
	}else if(args1.length){
          if(args4==0){
	  var a=0;
	  for(i=0;i<args1.length;i++)
	   if(args1[i].checked)a++;
	   if(a>1){
           alert("只能"+args2+"一个目录！");
	     return false;
	   }else if(a<1){
	     alert("你还没有选择要"+args2+"的目录！");
	     return false;
	   }else if(args3==1){
           if(confirm("你真的要"+args2+"吗？")){
		      return true;
	       }
	      return false;
	   }else{
            return true;
          }
	}else if(args4==1){
           var a=0;
          for(i=0;i<args1.length;i++)
	   {
              if(args1[i].checked)
              {  a++;
               if(args5[i].value=='0')
                {
                    alert("你选择的目录里含有不允许删除的目录，请检查！");
                   return  false;
                   break;;
                }
	     }
	   }
           if(a<1){
	     alert("你还没有选择要"+args2+"的目录！");
	     return false;
	   }else {
             return  true;
	   }
	 }
	}else{
	  if(!args1.checked){
         alert("你还没有选择要"+args2+"的目录！");
		 return false;
	  }else if(args3==1){
	    if(confirm("你真的要"+args2+"吗？")){
		      return true;
	       }
	      return false;
	 }else{
          return true;
     }
	}
   return false;
}
/**
 * 作用: 检查起始日期及结束日期是否正确，并加以错误提示
 * 参数: startObj－起始日期的输入对象，msgStart－起始日期说明，noEmptyS－起始日期是否可以为空 "0"为可以为空
 *      endObj－结束日期的输入对象，msgEnd－结束日期说明，noEmptyE－结束日期是否可以为空 "0"为可以为空
 * 返回: 是否正确
 */
function checkDatePair(startObj,msgStart,noEmptyS,endObj,msgEnd,noEmptyE)
{
	var startIsEmpty=false; //开始日期是否为空
	var endIsEmpty=false;//结束日期是否为空

	//开始日期的空值判断及设定
	if(noEmptyS=="0"){
		if(isEmpty(startObj)){
			startIsEmpty=true;
		}else{
      if(!isDateAlt(startObj,msgStart)){
			return false;
		}
		}
	}else{
		if(isEmptyAlt(startObj,msgStart)){
			return false;
		}
		if(!isDateAlt(startObj,msgStart)){
			return false;
		}
	}

	//结束日期的空值判断及设定
	if(noEmptyE=="0"){
		if(isEmpty(endObj)){
			endIsEmpty=true;
		}else{
      if(!isDateAlt(endObj,msgEnd)){
			return false;
		}
		}
	}else{
		if(isEmptyAlt(endObj,msgEnd)){
			return false;
		}
		if(!isDateAlt(endObj,msgEnd)){
			return false;
		}
	}

	//如果开始及结束时间有一个为空，则不进行比较
  if(startIsEmpty||endIsEmpty){
		return true;
	}

  var arrayOfStart = trim(startObj.value).split("-");
  var arrayOfEnd = trim(endObj.value).split("-");

  var startdate=Date.UTC(arrayOfStart[0],arrayOfStart[1],arrayOfStart[2],0,0,0);
  var enddate=Date.UTC(arrayOfEnd[0],arrayOfEnd[1],arrayOfEnd[2],0,0,0);
  if(startdate>enddate){
    alert('"'+msgEnd+'"不能小于"'+msgStart+'"，请重新输入。');
		endObj.focus();
    return false;
  }
  return true;
}
/*
对常见数据大小进行效验dataCompare()，后一个值一定要大于前一个值，若不是提示信息，光标自动定位
参数args1代表小参数对象，例如：document.form1.name.value
参数args2代表大参数对象，例如：document.form1.name.value
参数args3代表参数类型: 2代表"number"， 3代表"float"， 4代表"date"代表
参数args4代表参数的实际意义，以便能准确通知用户。
*/
function dataCompare(args1,args2,args3,args4){
  if(!isEmpty(args1)&&!isEmpty(args2)){
    switch(args3){
     case 2 : return numberCompare(args1,args2,args4);
     case 3 : return floatCompare(args1,args2,args4);
     case 4 : return dateCompare(args1,args2,args4);
	 case 6 : return datetimeCompare(args1,args2,args4);
	}
  }
  return true;
}
/*
对number数据大小进行效验numberCompare()，后一个值一定要大于前一个值，若不是提示信息，光标自动定位
参数args1代表小参数对象，例如：document.form1.name.value
参数args2代表大参数对象，例如：document.form1.name.value
参数args3代表参数的实际意义，以便能准确通知用户。
*/
function numberCompare(args1,args2,args3){
 var firstNumber=parseInt(args1.value);
 var twoNumber=parseInt(args2.value);
 if(firstNumber<=twoNumber){
   return true;
 }else{
   alert("起始"+args3+"输入的值应该小于终止"+args3+"值!");
   args1.focus();
   return false;
 }
}
/*
对float数据大小进行效验floatCompare，后一个值一定要大于前一个值，若不是提示信息，光标自动定位
参数args1代表小参数对象，例如：document.form1.name.value
参数args2代表大参数对象，例如：document.form1.name.value
参数args3代表参数的实际意义，以便能准确通知用户。
*/
function floatCompare(args1,args2,args3){
 var firstNumber=parseFloat(args1.value);
 var twoNumber=parseFloat(args2.value);
 if(firstNumber<=twoNumber){
   return true;
 }else{
   alert("起始"+args3+"输入的值应该小于终止"+args3+"值!");
   args1.focus();
   return false;
 }
}
/*
对date数据大小进行效验dateCompare，后一个值一定要大于前一个值，若不是提示信息，光标自动定位
参数args1代表小参数对象，例如：document.form1.name.value
参数args2代表大参数对象，例如：document.form1.name.value
参数args3代表参数的实际意义，以便能准确通知用户。
*/
function dateCompare(args1,args2,args3){
 var arrayOfStart = trim(args1.value).split("-");
 var arrayOfEnd = trim(args2.value).split("-");
 //alert(""+arrayOfEnd);
 var startDate=new Date(arrayOfStart[0],arrayOfStart[1],arrayOfStart[2]);
 //alert("startDate="+startDate);
 var endDate=new Date(arrayOfEnd[0],arrayOfEnd[1],arrayOfEnd[2]);
 //alert("endDate="+endDate);
 //alert(startDate<=endDate);
 if(startDate<=endDate){
  //alert("判断合法已进入！");
  return true;
 }else{
   alert("起始"+args3+"输入的值应该小于终止"+args3+"值!");
   args1.focus();
   return false;
 }
}

/*
对datetime数据大小进行效验datetimeCompare，后一个值一定要大于前一个值，若不是提示信息，光标自动定位
参数args1代表小参数对象，例如：document.form1.name.value
参数args2代表大参数对象，例如：document.form1.name.value
参数args3代表参数的实际意义，以便能准确通知用户。
*/
function datetimeCompare(args1,args2,args3){
 //alert("来了");
 var objDateStart=args1.value.substring(0,10);
 var objTimeStart=args1.value.substring(11,16);
 var dateArrayOfStart = trim(objDateStart).split("-");
 var timeArrayOfStart = trim(objTimeStart).split(":");

 var objDateEnd=args2.value.substring(0,10);
 var objTimeEnd=args2.value.substring(11,16);
 var dateArrayOfEnd = trim(objDateEnd).split("-");
 var timeArrayOfEnd = trim(objTimeEnd).split(":");
 //alert(""+arrayOfEnd);
 var startDate=new Date(dateArrayOfStart[0],dateArrayOfStart[1],dateArrayOfStart[2],timeArrayOfStart[0],timeArrayOfStart[1],0);
 //alert("startDate="+startDate);
 var endDate=new Date(dateArrayOfEnd[0],dateArrayOfEnd[1],dateArrayOfEnd[2],timeArrayOfEnd[0],timeArrayOfEnd[1],0);
 //alert("endDate="+endDate);
 //alert(startDate<=endDate);
 if(startDate<=endDate){
  //alert("判断合法已进入！");
  return true;
 }else{
   alert("起始"+args3+"输入的值应该小于终止"+args3+"值!");
   args1.focus();
   return false;
 }
}

/*
对输入的数据用指定操作附进行分割
参数strData代表要分割的数据
参数actionPoint代表操作附
返回一个数组，顺序排列
*/
function splitString(strData,actionPoint){
  var tempStr=strData;
  var args=new Array();
  var index=0;
  while(tempStr.indexOf(actionPoint)!=-1){
    args[index]=tempStr.substring(0,tempStr.indexOf(actionPoint));
	tempStr=tempStr.substring(tempStr.indexOf(actionPoint)+1);
	index++;
  }
  args[index]=tempStr;
  return args;
}

/*
在有多条（或者一条）记录的情况下执行必须对一条记录删除操作而需要的效验：deleteAct（）
参数args1代表复选框对象，例如：document.form1.checkNO
参数args2代表主键字段，有多个用逗号割开，例如："wellno,jsjg"
参数args4代表主键字段值，有多个用逗号割开，例如："4052033,345"
参数args3代表是否提醒用户进行的此操作，1代表提醒，0代表不提醒
*/
function deleteAct(args1,args3,args2,args4){
	 if(args1.length){
	  var a=0;
	  for(i=0;i<args1.length;i++)
	   if(args1[i].checked)a++;
	   if(a>1){
           alert("只能删除一个记录！");
	     return false;
	   }else if(a<1){
	     alert("你还没有选择要删除的记录！");
	     return false;
	   }else if(args3==1){
           if(confirm("你真的要删除吗？")){
                 if(!isDelData(document.form1.action,args2,args4)){
                    return false;
		 }
	      return true;
	       }
	      return false;
	   }else{
		 if(!isDelData(document.form1.action,args2,args4)){
                    return false;
		 }
	      return true;
      }
	}else{
	  if(!args1.checked){
         alert("你还没有选择要删除的记录！");
		 return false;
	  }else if(args3==1){
	    if(confirm("你真的要删除吗？")){
		if(!isDelData(document.form1.action,args2,args4)){
                    return false;
		}
		    return true;
	       }
	      return false;
	 }else{
        if(!isDelData(document.form1.action,args2,args4)){
                    return false;
		}
		    return true;
     }
  }
   return false;
}

 function isDelData(servleturl,deletename,deletevalue){
  var r=window.showModalDialog('/servlets/common/deleteactionservlet?servleturl=' + servleturl+'&deletename='+deletename+'&deletevalue='+deletevalue,'','dialogheight=470px;dialogwidth=560px;status=no;center=yes');

// var parameter= "?url=/servlets/common/deleteactionservlet&servleturl=" + servleturl+"&deletename="+deletename+"&deletevalue="+deletevalue;
// var r = window.showModalDialog("/pro/complication/idiographicAccident/SelectIdiographicAccident.jsp"+parameter,window,'dialogheight=470px;dialogwidth=560px;status=no;center=yes');


 //var r=window.showModalDialog('/servlets/common/deleteactionservlet?servleturl=' + servleturl+'&deletename='+deletename+'&deletevalue='+deletevalue,'','dialogheight=470px;dialogwidth=560px;status=no;center=yes');

 // alert(r);
  if (r=="1")
  {
    return true;
  }
  return false;
}
/*
对传入的表进行删除操作而需要的效验：isDelDataFromTable（）
参数tablename代表 表名，例如：document.form1.checkNO
参数deletename代表主键字段，有多个用逗号割开，例如："wellno,jsjg"
参数deletevalue代表主键字段值，有多个用逗号割开，例如："4052033,345"
*/
function isDelDataFromTable(tablename,deletename,deletevalue){
  var r=window.showModalDialog('/servlets/common/deleteactionservlet?tablename=' + tablename+'&deletename='+deletename+'&deletevalue='+deletevalue,'','dialogheight=470px;dialogwidth=560px;status=no;center=yes');

  if (r=="1")
  {
    return true;
  }
  return false;
}
/*
取得删除记录的主键顺序号：getDelPoint()
参数args1代表复选框对象，例如：document.form1.checkNO
*/

function getDelPoint(args1){
  if(!args1){
		alert("没有记录要删除！");
		return 200;
	}else if(args1.length){
      for(i=0;i<args1.length;i++){
       if(args1[i].checked){
		 return i;
	   }
     }
   }else{
    return 100;
   }
}



/**
 * 检查输入的字符串是否是拼音格式:Zhou Erqiang或Zhao Xiang'an
 */
 function isPinYin(arg){
	var str=trim(arg.value);
	var regexp = /^([A-Z]{1})([a-z]{0,28})(\s)([A-Z]{1})([a-z|\']{0,38})$/;
  //var regexp = /^([A-Z]{1})([a-z]{0,28})(\s)([A-Z]{1})([a-z]{0,38})$/;
	return regexp.test(str);
 }

 /*
 把输入的字符串转换为半角（半角不转，全角转半角）
 input： Str    任意字符串
 output：DBCStr 半角字符串
 作者：  吴江栋
 编写日期：2006-11-06

 说明：1、全角空格为12288，半角空格为32
       2、其他字符半角(33-126)与全角(65281-65374)的对应关系是：均相差65248
 */
function toDBC(Str) {
	var DBCStr = "";

	for(var i=0; i<Str.length; i++){
		var c = Str.charCodeAt(i);

		if(c == 12288) {
			DBCStr += String.fromCharCode(32);
			continue;
		}
		if (c > 65280 && c < 65375) {
			DBCStr += String.fromCharCode(c - 65248);
			continue;
		}

		DBCStr += String.fromCharCode(c);
	}

	return DBCStr;
}

/*
 把输入的字符串转换为全角（全角不转，半角转全角）
 input： Str    任意字符串
 output：SBCStr 全角字符串
 作者：  吴江栋
 编写日期：2006-11-06

 说明：1、全角空格为12288，半角空格为32
       2、其他字符半角(33-126)与全角(65281-65374)的对应关系是：均相差65248
 */
function toSBC(Str) {
	var SBCStr = "";

	for(var i=0; i<Str.length; i++){
		var c=Str.charCodeAt(i);

		if(c == 32) {
			SBCStr += String.fromCharCode(12288);
			continue;
		}

		if (c < 127) {
			SBCStr += String.fromCharCode(c + 65248);
			continue;
		}

		SBCStr += String.fromCharCode(c);
	}

	return SBCStr;
}

/*
 获得真实的字符串长度（半角加全角的字符串）
 input： Str
 output：len
 作者：  吴江栋
 编写日期：2006-11-06
 */
function ChkLen(str){
   var len=0;
   for(var i=0; i<str.length; i++){
     var c=str.charCodeAt(i);
     
	 if(c<256||(c>=0xff61&&c<=0xff9f)){ //半角
       len=len+1;
     }
     else{ //全角
       len=len+2;
     }
   }
   return len;
}

/*
 文本框光标定位
 input： obj    对象
 output：place  要定位到的位置
 作者：  吴江栋
 编写日期：2006-11-06
*/
function movePoint(obj,place) { 
	
	var rng = obj.createTextRange(); 

	rng.moveStart("character",place); 
    rng.collapse(true); 
    rng.select(); 
}

/*
 获取textarea当前光标位置
 input： 
 output：
 作者：  吴江栋
 编写日期：2006-11-06
*/
function tellPoint() { 
	var rng = event.srcElement.createTextRange(); 

	rng.moveToPoint(event.x,event.y); 
	rng.moveStart("character",-event.srcElement.value.length); 

	return  rng.text.length;
} 


/*===================================================
功能：使输入框只能输入满足要求的数据
输入：obj 输入框对象
      flag 
输出： 
作者：吴江栋
时间：2007-05-18
修改时间：
===================================================*/
function checkData(obj,flag) {
    var tLen = obj.value.length; //信息的总长度
	var fLen = 0; //信息前面部分的长度
	var tv_begin = null; //过程临时值
	var tv_end = null; //过程临时值
	var errorplace = -1; //值出问题的位置
   
	//从头开始遍历数据，去掉不合适的输入
	while(checkDataswich(obj.value,flag) && obj.value.length != 0) {
        tv_begin = obj.value.substring(fLen, parseInt(fLen) + 1);
        
		tv_begin = toDBC(tv_begin);
		tv_end = checkDataswich(tv_begin,flag)?"":tv_begin; //合适保留，不合适删掉

        obj.value = obj.value.substring(0, fLen) + tv_end +
		            obj.value.substring(parseInt(fLen) + 1, tLen);

		tLen = obj.value.length;
		fLen = parseInt(fLen)+ tv_end.length;
		errorplace = fLen;
    }

	//光标定位
	if(errorplace > -1) {
	    movePoint(obj,errorplace);
	}

	return;
}


function checkDataswich(value,flag){
	switch(flag) {
		case '01': //数据
			return (!isNumber(value));
			break;
		case '02': //英文
			return (!isEng(value));
			break;
		case '03': //电话号码
			return (!isPhone(value));
			break;
		case '04': //浮点数
			return (isNaN(value));
			break;
		case '05': //半角码
			return (toDBC(value) != value);
			break;
		case '06': //数字与字母组合
			return (!isString(value));
			break;
		default:
			break;
	}
}

/*使输入框只能输入数据*/
function checkNum(num) {
	checkData(num,'01');
}

/*使邮编输入框只能输入数据*/
function checkPos(num) {
	checkData(num,'01');
}

/*使输入框只能输入英文字母*/
function checkEn(en) {
	checkData(en,'02');
}

/*使输入框只能输入合适的格式的电话号码*/
function checkPhone(phone) {
	checkData(phone,'03');
}

/*使输入框只能输入浮点数*/
function checkFloat(floats) {
	checkData(floats,'04');
}

/*把输入框的值转成都是半角的，并且光标能定位*/
 function DBCOnly(obj){
	checkData(obj,'05');
 }

 /*使输入框只能输入数字与字母组合*/
function checkNumAndEn(str) {
	checkData(str,'06');
}
