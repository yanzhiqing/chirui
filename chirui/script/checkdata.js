/**
 * Copyright:   txl co.ltd
 * Author:      ������
 * Description: JavaScript�ű��ļ����ṩ���÷�������JSP��ҳ����
 * CodeDate:    2004-09-11
 */

/**
 * ����: ȥ���ַ�����ո�
 * ����: str: �ַ���
 * ����: ȥ����ո����ַ���
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
 * ����: ȥ���ַ����ҿո�
 * ����: str: �ַ���
 * ����: ȥ���ҿո����ַ���

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
//ȥ���ִ��ұߵĿո�
function rTrim(str)
{
var iLength;

iLength = str.length;
if (str.charAt(iLength - 1) == " ")
{
//����ִ��ұߵ�һ���ַ�Ϊ�ո�
str = str.slice(0, iLength - 1);//���ո���ִ���ȥ��
//��һ��Ҳ�ɸĳ� str = str.substring(0, iLength - 1);
str = rTrim(str); //�ݹ����
}
return str;
}


/**
 * ����: ȥ���ַ������ҿո�
 * ����: str: �ַ���
 * ����: ȥ�����ҿո����ַ���
 */
function trim(str){
	return(lTrim(rTrim(str)));
}

/**
 * ����: ���ݴ���ţ���ʾ��ʾ��Ϣ
 * ����: (1) errNo: ����ţ���message.js�ļ���Ӧ��; (2) objName: ����������ѡ������
 * ����: alert�Ի���
 */
function displayMessage(errNo,objName) {
  if( objName==null ){
    alert(errNo);
  } else {
    alert('"'+objName+'"'+errNo);
  }
}

/**
 * ����: ����Ƿ�Ϊ��
 * ����: obj: Ҫ�����������
 * ����: true/false
 */
function isEmpty(obj) {
	var val=obj.value;
	if(trim(val)==""){
		return true;
	}
  return false;
}

/**
 * ����: ����Ƿ�Ϊ�գ����Ϊ�գ���ʾ��ʾ��Ϣ
 * ����: (1) obj: Ҫ�����������; (2) message: �ڴ�����ʾ����ʾ�Ķ������ƣ���ѡ��
 * ����: true/false alert
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
���ܣ�ʹ�����ֻ��������Ӧ���ȵ���Ϣ
���룺obj �������
      maxlen �������󳤶�
�����
���ߣ��⽭��
ʱ�䣺2006-08-20
�޸�ʱ�䣺
===================================================*/
function checkMaxlen(obj,maxlen) {

	//ȥ������������
	if(obj.value.length > maxlen){
        obj.value = obj.value.substring(0, maxlen);
    }

	return;
}

/**
 * ����: ������֣�����һλ����
 * ����: value: Ҫ��������ֵ
 * ����: true/false
 */
function isNumber(value) {
	var str=trim(value);
	var regexp=/^(\d+)$/;
	return regexp.test(str);
}




//�ж��Ƿ�Ӣ��
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

//�Ѱ�ǵ�"&",תΪȫ�ǵ�"&";
//˵��:1����xml����"&"�ǹؼ���
//     2��"&"�İ����Ϊ38��ȫ����Ϊ65286( = 38 + 65248)
//�⽭�� 2006-11-06
function and2Quanjiao(en) {
	var tLen = en.value.length; //��Ϣ���ܳ���
	var fLen = 0; //��Ϣǰ�沿�ֵĳ���
	var tv = null; //������ʱֵ
	
	for(var i=0;i<en.value.length;i++) {
		tv = en.value.substring(i, parseInt(i) + 1);
		
		if(tv.charCodeAt(0) == 38) {
			tv = toSBC(tv);
			en.value = en.value.substring(0, i) + tv +
					en.value.substring(parseInt(i) + 1, tLen);
		}
	}
}



//�жϵ绰����
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
 * ����: ������֣�����һλ���ȣ�����������֣���ʾ��ʾ��Ϣ
 * ����: obj: Ҫ�����������; (2) message: �ڴ�����ʾ����ʾ�Ķ������ƣ���ѡ��
 * ����: true/false alert
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
 * ����: ���int�����ȷ�Χ��1���޶�����
 * ����: (1) num: ���������; (2) len: ���ֵ��޶����ȣ�Ĭ����8��
 * ����: true/false
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
 * ����: ���int�����ȷ�Χ��1���޶����ȣ��������������ʾ��ʾ��Ϣ
 * ����: (1) num: ���������; (2) len: ���ֵ��޶����ȣ�Ĭ����8��; (3) message: �ڴ�����ʾ����ʾ�Ķ������ƣ���ѡ��
 * ����: true/false alert
 */
function isIntAlt(num,len,message) {
  if( isInt(num,len) ){
    return true;
  }
  displayMessage(M01003,message);
  return false;
}

//���float�����ȷ�Χ������1��11λ�����㾫��4λ
//�磺12 12.12 12.1234 Ϊ�Ϸ��ģ�12.12345Ϊ�Ƿ�
function isFloat(obj){
  //var regexp = /^(\d){1,11}((.)(\d){1,4})?$/;
// 2004-07-26 ����޸�
//   var regexp = /^(-?)?(\d){1,11}((.)(\d){1,4})?$/;
  var regexp = /^(-?)?(\d){1,11}((\.)(\d){1,4})?$/;
  return(regexp.test(trim(obj.value)));
}

//���float�����ȷ�Χ������1��11λ�����㾫��4λ
//�����������ʾ��ʾ��Ϣ
function isFloatAlt(obj,message) {
  if( isFloat(obj) ){
    return true;
  }
  displayMessage(M01004,message);
  obj.focus();
  return false;
}

//����ַ���,Ϊ��������ĸ���
function isString(value){
	var str=trim(value);
	var regexp=/^(\w+)$/;
	return regexp.test(str);
}

//����ַ���,Ϊ��������ĸ��ϣ������������ʾ��ʾ��Ϣ
function isStringAlt(obj,message) {
  if( isString(obj.value) ){
    return true;
  }
  displayMessage(M01005,message);
  obj.focus();
  return false;
}

//����������
function isEmail(str) {
	var regexp = /^(\w)[^@]{0,100}(@)(\w){1,50}(.(\w){1,20})+$/;
	return(regexp.test(str));
}

//���������⣻�����������ʾ��ʾ��Ϣ
function isEmailAlt(str,message) {
  if( isEmail(str) ){
    return true;
  }
  displayMessage(M01006,message);
  return false;
}

//���֤������
function isIDCard(str) {
	var regexp;
	if(str.length==15){             //15λ
		regexp=/^(\d{15})$/;
   	return regexp.test(str);
	}
  if(str.length==18){             //18λ
	  regexp=/^(\d{17})([1]{1})$/;
    if(!regexp.test(str))
	    regexp=/^(\d{17})(\w{1})$/;
		return regexp.test(str);
	}
	return false;
}

//���֤�����⣻�����ʽ��������ʾ��ʾ��Ϣ
function isIDCardAlt(str,message) {
  if( isIDCard(str) ){
    return true;
  }
  displayMessage(M01007,message);
  return false;
}

//�û�ID��⣬���԰�����ĸ���ּ����ַ����� �� ��������ַ�������1��16λ
function isUserID(str) {
	regexp = /^(\w){1,16}$/;
  return(regexp.test(str));
}

//�û�ID��⣬���԰�����ĸ���ּ����ַ����� �� ��������ַ�������1��16λ
//�����ʽ��������ʾ��ʾ��Ϣ
function isUserIDAlt(str,message) {
  if( isUserID(str) ){
    return true;
  }
  displayMessage(M01008,message);
  return false;
}

//����ַ��� ���ܰ���><'"
function isStr(obj){
	var tf=false;
	var str=trim(obj.value);
	//if(str.indexOf("'")>-1||str.indexOf(">")>-1||str.indexOf("<")>-1||str.indexOf("\"")>-1)
	// ȡ���� "'" ������ ,Ӣ�ı���ģ������Ҫ����"'" (��Ӧ�� 2007-03-23).
	if(str.indexOf(">")>-1||str.indexOf("<")>-1||str.indexOf("\"")>-1)
		tf=false;
	else
		tf=true;
	return tf;
}

//����ַ��� ���ܰ���><'"�������ʽ��������ʾ��ʾ��Ϣ
function isStrAlt(obj,message) {
  if( isStr(obj) ){
    return true;
  }
  displayMessage(M01009,message);
  obj.focus();
  return false;
}

//������ڣ�1900~2099�����Ϸ���ʽΪ 2002-09-30
function isDate(obj)
{
 var dt=trim(obj.value);
 var dtYear = dt.substring(0,4);
 var joinStr1 = dt.substring(4,5);
 var dtMonth = dt.substring(5,7);
 var joinStr2 = dt.substring(7,8);
 var dtDay = dt.substring(8,10);
 var leapYear = false;     //�����־
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

//�������ֻ�����µĸ�ʽ���Ϸ���ʽΪ 2002-09
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
//������ڣ�1900~2099�����Ϸ���ʽΪ 2002-09-30�������ʽ��������ʾ��ʾ��Ϣ
function isDateAlt(obj,message) {
  if( isDate(obj) ){
    return true;
  }
  displayMessage(M01010,message);
  obj.focus();
  return false;
}
//������ڣ�1900~2099�����Ϸ���ʽΪ 2002-09-30
function isTempDate(obj)
{
 var dt=obj;
 var dtYear = dt.substring(0,4);
 var joinStr1 = dt.substring(4,5);
 var dtMonth = dt.substring(5,7);
 var joinStr2 = dt.substring(7,8);
 var dtDay = dt.substring(8,10);
 var leapYear = false;     //�����־
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

//�������ʱ�䣨1900~2099�����Ϸ���ʽΪ 2002-09-30 09��34��
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

//�������ʱ�䣨1900~2099�����Ϸ���ʽΪ 2002-09-30 09��34�������ʽ��������ʾ��ʾ��Ϣ
function isDatetimeAlt(obj,message) {
  //alert("come in!");
  if( isDatetime(obj) ){
    return true;
  }
  displayMessage(M01023,message);
  obj.focus();
  return false;
}
//���URL��ַ
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

//���URL��ַ�������ʽ��������ʾ��ʾ��Ϣ
function isURLAlt(obj,message) {
  if( isURL(obj) ){
    return true;
  }
  displayMessage(M01011,message);
	obj.focus();
  return false;
}

//�������������Ƿ�����ȷ�Ĵ������ڣ�Max time <= System Time
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

//�������������Ƿ�����ȷ�Ĵ������ڣ�Max time <= System Time
//�����ʽ��������ʾ��ʾ��Ϣ
function checkCreateDateAlt(obj,message) {
  if( checkCreateDate(obj) ){
    return true;
  }
  displayMessage(M01012,message);
	obj.focus();
  return false;
}

//��������Сʱ��ֵ�Ƿ���Ч
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

//���������Ƿ���SpaceBar
function isNSpace(obj) {
	var str=trim(obj.value);
  if ( (str.indexOf (' ') == -1) || (str.indexOf ('\uFFFD@') == -1)){
    return true;
  }else{
    return false;
  }
}

//���������Ƿ���SpaceBar������ǣ�������ʾ��Ϣ
function isNSpaceAlt(obj,message) {
  if (!isNSpace(obj)){
    return true;
  }
  displayMessage(M01014,message);
	obj.focus();
  return false;
}

//�����������
function isZip(num){
  var regexp = /^(\d){6}$/;
  return(regexp.test(num));
}

//����������룻�������������������ʾ
function isZipAlt(obj,message) {
	var num=trim(obj.value);
  if( isZip(num) ){
    return true;
  }
  displayMessage(M01015,message);
	obj.focus();
  return false;
}

//�õ�������ַ����ĳ���(full and half)
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

//���������ַ��������Ƿ��� half
function isHalfChar(theStr) {
  var fristInt  = getLength(theStr);
  var secondInt = theStr.length;
  if ( fristInt == secondInt)
  { return true;
  }
  return false;
}

//���������ַ��������Ƿ��� full
function isFullChar(theStr) {
  var fristInt  = getLength(theStr);
  var secondInt = theStr.length;
  if ( fristInt == secondInt*2)
  { return true;
  }
  return false;
}

//�������������Ƿ��ǣ�YYYY-MM-DD��ʽ
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

//�������������Ƿ��ǣ�YYYY-MM��ʽ
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

//��������ʱ���Ƿ��� HH:MM ��ʽ
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

//��������ʱ���Ƿ��� HH:MM ��ʽ���������������������ʾ
function checkTimeHMAlt(obj, message) {
  if(isTimeHM(obj.value)) {
    return true;
  } else {
    displayMessage( M01013, message);
    obj.focus();
    return false;
  }
}

//�������ķ��ӵ�ֵ�Ƿ���Ч
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

//������� "hour:minute~hour:minute" �Ƿ���ȷ
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

//��������
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

//ת�� yyyymmdd �� yyyy��mm��dd��
function dateDisplay(dateStr) {
  var newDateStr = "";
  if(dateStr.length == 6) {
    newDateStr = dateStr.substring(0,4) +'��'+
                 dateStr.substring(4,6) + '��';
  } else if(dateStr.length == 8) {
    newDateStr = dateStr.substring(0,4) + '��'+
                 dateStr.substring(4,6) + '��'+
                 dateStr.substring(6,8) + '��';

  } else {
    newDateStr = "&nbsp&nbsp&nbsp&nbsp";
  }
  return newDateStr;
}

//����������ַ�������
function getLen(str) {
  return str.length;
}

//����������ַ�����ʵ�ʳ��ȣ�������ǰ��Ŀո�
function getLenTrim(str) {
  var str = trim(str);
  return str.length;
}

//��ʾ�ַ����ĳ���
function dispLen(str) {
  alert('���ֳ��ȣ�' + str.length);
}

/*
�Գ����������ͽ���Ч��checkValue()����Զ���λ
����args1��������������磺document.form1.name.value
����args2�����Ƿ�Ϊ��:0����� 1����ǿ�
����args3�����������:1����"������< > ��string" �� 2����"number"�� 3����"float"�� 4����"date"����5����"ֻ�������ֺ���ĸ�����"
����args4���������ʵ�����壬�Ա���׼ȷ֪ͨ�û���
*/

function checkValue(args1,args2,args3,args4){
  var temArg=args1;
   //alert("���args2��0�����:1����ǿ�");
  if(args2==0){
	// alert("����Ϊ�գ�����Ƿ�Ϊ��");
    if(!isEmpty(temArg)){
       //alert("�����ǿ�");
     if(onCheckValue(temArg,args3,args4)){
		 //alert("��Ϊ�պ�����Ǻ��ʵ���ֵ");
		 return true;
	 }
	 //alert("Ϊ�պ�����Ǻ��ʵ���ֵ");
	 return false;
    }
	 //alert("�����ǿ�");
	return true;
  }else if(args2==1){
	  //alert("������Ϊ�գ�����Ƿ�Ϊ��");
    if(!isEmptyAlt(temArg,args4)){
     //alert("�����ǿ�2");
    if(onCheckValue(temArg,args3,args4)){
		//alert("��Ϊ�պ�����Ǻ��ʵ���ֵ2");
		return true;
     }
	//alert("Ϊ�պ�����Ǻ��ʵ���ֵ2");
	return false;
    }
	//alert("�����ǿ�2");
	return false;
  }
}

/*
�Գ����������ͽ���Ч��rigorCheckValue()����Զ���λ
����args1��������������磺document.form1.name.value
����args2�����Ƿ�Ϊ��:0����� 1����ǿ�
����args3�����������:1����"������< > ��string" �� 2����"number"�� 3����"float"�� 4����"date"����5����"ֻ�������ֺ���ĸ�����"
����args4�����ַ������ȣ�0����������
����args5��������С����λ��������float������Ч����0����������
����args6���������ʵ�����壬�Ա���׼ȷ֪ͨ�û���
*/
function rigorCheckValue(args1,args2,args3,args4,args5,args6){
  var temArg=args1;
  if(args2==0){
	// alert("����Ϊ�գ�����Ƿ�Ϊ��");
    if(!isEmpty(temArg)){
       //alert("�����ǿ�");
     if(onCheckValue(temArg,args3,args6)){
		 //alert("��Ϊ�պ�����Ǻ��ʵ���ֵ");
          if(args4!=0){
            //alert("Ҫ����鳤��");
            if(rigorCheck(temArg,args3,args4,args5,args6)){
              //alert("���о�ȷ�ȼ��ͨ��");
	      return true;
	    }
          }
	  else{
	    return true;
	  }
	 }
	 //alert("Ϊ�պ�����Ǻ��ʵ���ֵ");
	 return false;
    }
	 //alert("�����ǿ�");
	return true;
  }else if(args2==1){
	  //alert("������Ϊ�գ�����Ƿ�Ϊ��");
    if(!isEmptyAlt(temArg,args6)){
     //alert("�����ǿ�2");
    if(onCheckValue(temArg,args3,args6)){
		//alert("��Ϊ�պ�����Ǻ��ʵ���ֵ2");
          if(args4!=0){
            //alert("Ҫ����鳤��2");
            if(rigorCheck(temArg,args3,args4,args5,args6)){
              //alert("��ȷ�ȼ��ͨ��2");
	      return true;
	    }
          }
	  else{
	    return true;
	  }
     }
	//alert("Ϊ�պ�����Ǻ��ʵ���ֵ2");
	return false;
    }
	//alert("�����ǿ�2");
	return false;
  }
}

/*
�Գ����������ͳ��Ƚ���Ч��
����arg��������������磺document.form1.name.value
����strType�����������:1����"������< > ��string" �� 2����"number"�� 3����"float"�� 4����"date"����5����"ֻ�������ֺ���ĸ�����"
����maxLen�����ַ������ȣ�0����������
����pointLen��������С����λ��������float������Ч����0����������
����message���������ʵ�����壬�Ա���׼ȷ֪ͨ�û���
*/
function rigorCheck(arg,strType,maxLen,pointLen,message){
  var str = arg.value;
  if(strType==2){
    //alert("int���ͼ�鳤��");
    if(str.length<=maxLen){
      //alert("int���ͼ�鳤��ͨ��");
      return true;
    }
    displayMessage(M12002,message);
    arg.focus();
    return false;
  }
  else if(strType==3){
    //alert("float���ͼ�鳤��");
    var point = str.indexOf(".");
    if(point==-1){
      //alert(str+"��û��С����");
      if(str.length<=(maxLen-pointLen)){
        //alert(str+"������ȷ");
        return true;
      }
      else{
        displayMessage(M12002,message);
        arg.focus();
        return false;
      }
    }
    else{
      //alert(str+"�к���С����");
      var strInt = str.substring(0,point);
      var strPoint = str.substring(point+1,str.length);
      if(strInt.length<=(maxLen-pointLen)){
        if(strPoint.length<=pointLen){
          //alert("float���ݼ��ͨ��");
          return true;
        }
        else{
          //alert("С������λ��̫��");
          displayMessage(M12003,message);
        }
      }
      else{
        //alert("С����ǰ������̫��");
        displayMessage(M12002,message);
      }
      arg.focus();
      return false;
    }
  }
  else if(strType==1 || strType==5){
    //alert("�ַ������ͼ�鳤��");
    if(checkChinese(str)<=maxLen){
      //alert("�ַ������ͼ�鳤��ͨ��");
      return true;
    }
    displayMessage(M12001,message);
    arg.focus();
    return false;
  }
}

/*
YunFan��2004-02-23�����������˶��ַ����к��к����ַ����ж�
����˵��
str���ַ���
����ֵ���ַ������ȣ�һ�������ַ��ĳ���Ϊ2
*/
function checkChinese(str)
{
	var num = str.length;
	for (i=0;i<str.length;i++)
	{
		if(str.charAt(i)>'��')
		{
			 num++;
		}
	}
	return num;
}

function onCheckValue(arg,args3,args4){
  //alert("������ֵ�ǽ����������͵�Ч��");
  if(args3==1){
    //alert("����Ƿ��ַ���");
    if(isStrAlt(arg,args4)) return true;
	return false;
  }else if(args3==2){
    //alert("����Ƿ�NUMBER");
    if(isNumberAlt(arg,args4))return true;
	return false;
  }else if(args3==3){
    //alert("����Ƿ�FLOAT");
    if(isFloatAlt(arg,args4))return true;
	return false;
  }else if(args3==4){
    //alert("����Ƿ�DATE");
    if(isDateAlt(arg,args4))return true;
	return false;
  }else if(args3==5){
    //alert("����Ƿ�ֻ�������ֺ���ĸ�����");
    if(isStringAlt(arg,args4))return true;
	return false;
  }else if(args3==6){
    //alert("����Ƿ���DATETIME");
    if(isDatetimeAlt(arg,args4))return true;
	return false;
  }
}
/*
���ж���������һ������¼�������ִ��ɾ����������ɾ��������¼��ʱ����Ҫ��Ч�飺multDelAct����
����args1����ѡ��������磺document.form1.name
*/
function multDelAct(args1){
   if(!args1){
      alert("û�м�¼Ҫɾ����");
      return false;
   }else if(args1.length){
      var a=0;
      for(i=0;i<args1.length;i++){
	if(args1[i].checked)a++;
      }
      if(a==0){
	alert("�㻹û��ѡ��Ҫɾ���ļ�¼��");
	return false;
      }else{
        if(confirm("�����Ҫɾ����")){
	  return true;
	}
	  return false;
      }
    }else{
      if(!args1.checked){
        alert("�㻹û��ѡ��Ҫɾ���ļ�¼��");
	return false;
      }else {
	if(confirm("�����Ҫɾ����")){
	   return true;
	}
	return false;
      }
    }
}
/*
���ж���������һ������¼�������ִ�б����һ����¼��������Ҫ��Ч�飺multAct����
����args1����ѡ��������磺document.form1.name
����args2������ʾ��Ϣ�����磺"ɾ��"��"�޸�"
����args3�����Ƿ������û����еĴ˲�����1�������ѣ�0��������
*/
function multAct(args1,args3,args2){
	if(!args1){
		alert("û�м�¼Ҫ"+args2+"��");
		return false;
	}else if(args1.length){
	  var a=0;
	  for(i=0;i<args1.length;i++)
	   if(args1[i].checked)a++;
	   if(a>1){
           alert("ֻ��"+args2+"һ����¼��");
	     return false;
	   }else if(a<1){
	     alert("�㻹û��ѡ��Ҫ"+args2+"�ļ�¼��");
	     return false;
	   }else if(args3==1){
           if(confirm("�����Ҫ"+args2+"��")){
		      return true;
	       }
	      return false;
	   }else{
            return true;
          }

	}else{
	  if(!args1.checked){
         alert("�㻹û��ѡ��Ҫ"+args2+"�ļ�¼��");
		 return false;
	  }else if(args3==1){
	    if(confirm("�����Ҫ"+args2+"��")){
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
���ж���������һ������¼�������ִ�б����һ����¼��������Ҫ��Ч�飺multAct����
����args1����ѡ��������磺document.form1.name
����args2������ʾ��Ϣ�����磺"ɾ��"��"�޸�"
����args3�����Ƿ������û����еĴ˲�����1�������ѣ�0��������
����args4�����Ƿ���Զ�ѡ 0 �������� 1�������
����args5�ǵ�ǰ���Ƿ����ɾ�� 0 ������� 1 ��������
*/
function wwmultAct(args1,args3,args2,args4,args5){
	if(!args1){
		alert("û��Ŀ¼Ҫ"+args2+"��");
		return false;
	}else if(args1.length){
          if(args4==0){

	  var a=0;
	  for(i=0;i<args1.length;i++)
	   if(args1[i].checked)a++;

	   if(a>1){
           alert("ֻ��"+args2+"һ��Ŀ¼��");
	     return false;
	   }else if(a<1){
	     alert("�㻹û��ѡ��Ҫ"+args2+"��Ŀ¼��");
	     return false;
	   }else if(args3==1){

           for(i=0;i<args1.length;i++)
	   { if(args5!=null){
              if(args1[i].checked)
              {
               if(args5[i].value=='1')
                {   a++;
                   // alert(i);
                    alert("��ѡ���Ŀ¼�ﺬ�в�����ɾ����Ŀ¼�����飡");
                   return  false;
                   break;;
                }
	     }
	   }
	     }
           /* if(a>1){
              alert("ֻ��"+args2+"һ��Ŀ¼��");
	     return false;
	   }*/

            if(confirm("�����Ҫ"+args2+"��")){

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
                    alert("��ѡ���Ŀ¼�ﺬ�в�����ɾ����Ŀ¼�����飡");
                   return  false;
                   break;;
                }
	     }
	   }
	   }
           if(a<1){
	     alert("�㻹û��ѡ��Ҫ"+args2+"��Ŀ¼��");
	     return false;
	   }else {
             return  true;
	   }
	 }
	}else{
	  if(!args1.checked){
         alert("�㻹û��ѡ��Ҫ"+args2+"��Ŀ¼��");
		 return false;
	  }else if(args3==1){
             if(args5!=null){
              if(args5.value=='1'){
                      alert("��ѡ���Ŀ¼�ﺬ�в�����ɾ����Ŀ¼�����飡");
                     return  false;
                  }
             }

	    if(confirm("�����Ҫ"+args2+"��")){

		      return true;
	       }
	      return false;
	 }else{
           if(args5!=null){
              if(args5.value=='1'){
                      alert("��ѡ���Ŀ¼�ﺬ�в�����ɾ����Ŀ¼�����飡");
                     return  false;
                  }
           }
          return true;
     }
	}
   return false;
}

/*
���ж���������һ������¼�������ִ�б����һ����¼��������Ҫ��Ч�飺multAct����
����args1����ѡ��������磺document.form1.name
����args2������ʾ��Ϣ�����磺"ɾ��"��"�޸�"
����args3�����Ƿ������û����еĴ˲�����1�������ѣ�0��������
����args4�����Ƿ���Զ�ѡ,1�������,0��������
@ author wangxinliang
*/
function wmultAct(args1,args3,args2,args4,args5){
	if(!args1){
		alert("û�м�¼Ҫ"+args2+"��");
		return false;
	}else if(args1.length){
          if(args4==0){
	  var a=0;
	  for(i=0;i<args1.length;i++)
	   if(args1[i].checked)a++;
	   if(a>1){
           alert("ֻ��"+args2+"һ��Ŀ¼��");
	     return false;
	   }else if(a<1){
	     alert("�㻹û��ѡ��Ҫ"+args2+"��Ŀ¼��");
	     return false;
	   }else if(args3==1){
           if(confirm("�����Ҫ"+args2+"��")){
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
                    alert("��ѡ���Ŀ¼�ﺬ�в�����ɾ����Ŀ¼�����飡");
                   return  false;
                   break;;
                }
	     }
	   }
           if(a<1){
	     alert("�㻹û��ѡ��Ҫ"+args2+"��Ŀ¼��");
	     return false;
	   }else {
             return  true;
	   }
	 }
	}else{
	  if(!args1.checked){
         alert("�㻹û��ѡ��Ҫ"+args2+"��Ŀ¼��");
		 return false;
	  }else if(args3==1){
	    if(confirm("�����Ҫ"+args2+"��")){
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
 * ����: �����ʼ���ڼ����������Ƿ���ȷ�������Դ�����ʾ
 * ����: startObj����ʼ���ڵ��������msgStart����ʼ����˵����noEmptyS����ʼ�����Ƿ����Ϊ�� "0"Ϊ����Ϊ��
 *      endObj���������ڵ��������msgEnd����������˵����noEmptyE�����������Ƿ����Ϊ�� "0"Ϊ����Ϊ��
 * ����: �Ƿ���ȷ
 */
function checkDatePair(startObj,msgStart,noEmptyS,endObj,msgEnd,noEmptyE)
{
	var startIsEmpty=false; //��ʼ�����Ƿ�Ϊ��
	var endIsEmpty=false;//���������Ƿ�Ϊ��

	//��ʼ���ڵĿ�ֵ�жϼ��趨
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

	//�������ڵĿ�ֵ�жϼ��趨
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

	//�����ʼ������ʱ����һ��Ϊ�գ��򲻽��бȽ�
  if(startIsEmpty||endIsEmpty){
		return true;
	}

  var arrayOfStart = trim(startObj.value).split("-");
  var arrayOfEnd = trim(endObj.value).split("-");

  var startdate=Date.UTC(arrayOfStart[0],arrayOfStart[1],arrayOfStart[2],0,0,0);
  var enddate=Date.UTC(arrayOfEnd[0],arrayOfEnd[1],arrayOfEnd[2],0,0,0);
  if(startdate>enddate){
    alert('"'+msgEnd+'"����С��"'+msgStart+'"�����������롣');
		endObj.focus();
    return false;
  }
  return true;
}
/*
�Գ������ݴ�С����Ч��dataCompare()����һ��ֵһ��Ҫ����ǰһ��ֵ����������ʾ��Ϣ������Զ���λ
����args1����С�����������磺document.form1.name.value
����args2���������������磺document.form1.name.value
����args3�����������: 2����"number"�� 3����"float"�� 4����"date"����
����args4���������ʵ�����壬�Ա���׼ȷ֪ͨ�û���
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
��number���ݴ�С����Ч��numberCompare()����һ��ֵһ��Ҫ����ǰһ��ֵ����������ʾ��Ϣ������Զ���λ
����args1����С�����������磺document.form1.name.value
����args2���������������磺document.form1.name.value
����args3���������ʵ�����壬�Ա���׼ȷ֪ͨ�û���
*/
function numberCompare(args1,args2,args3){
 var firstNumber=parseInt(args1.value);
 var twoNumber=parseInt(args2.value);
 if(firstNumber<=twoNumber){
   return true;
 }else{
   alert("��ʼ"+args3+"�����ֵӦ��С����ֹ"+args3+"ֵ!");
   args1.focus();
   return false;
 }
}
/*
��float���ݴ�С����Ч��floatCompare����һ��ֵһ��Ҫ����ǰһ��ֵ����������ʾ��Ϣ������Զ���λ
����args1����С�����������磺document.form1.name.value
����args2���������������磺document.form1.name.value
����args3���������ʵ�����壬�Ա���׼ȷ֪ͨ�û���
*/
function floatCompare(args1,args2,args3){
 var firstNumber=parseFloat(args1.value);
 var twoNumber=parseFloat(args2.value);
 if(firstNumber<=twoNumber){
   return true;
 }else{
   alert("��ʼ"+args3+"�����ֵӦ��С����ֹ"+args3+"ֵ!");
   args1.focus();
   return false;
 }
}
/*
��date���ݴ�С����Ч��dateCompare����һ��ֵһ��Ҫ����ǰһ��ֵ����������ʾ��Ϣ������Զ���λ
����args1����С�����������磺document.form1.name.value
����args2���������������磺document.form1.name.value
����args3���������ʵ�����壬�Ա���׼ȷ֪ͨ�û���
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
  //alert("�жϺϷ��ѽ��룡");
  return true;
 }else{
   alert("��ʼ"+args3+"�����ֵӦ��С����ֹ"+args3+"ֵ!");
   args1.focus();
   return false;
 }
}

/*
��datetime���ݴ�С����Ч��datetimeCompare����һ��ֵһ��Ҫ����ǰһ��ֵ����������ʾ��Ϣ������Զ���λ
����args1����С�����������磺document.form1.name.value
����args2���������������磺document.form1.name.value
����args3���������ʵ�����壬�Ա���׼ȷ֪ͨ�û���
*/
function datetimeCompare(args1,args2,args3){
 //alert("����");
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
  //alert("�жϺϷ��ѽ��룡");
  return true;
 }else{
   alert("��ʼ"+args3+"�����ֵӦ��С����ֹ"+args3+"ֵ!");
   args1.focus();
   return false;
 }
}

/*
�������������ָ�����������зָ�
����strData����Ҫ�ָ������
����actionPoint���������
����һ�����飬˳������
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
���ж���������һ������¼�������ִ�б����һ����¼ɾ����������Ҫ��Ч�飺deleteAct����
����args1����ѡ��������磺document.form1.checkNO
����args2���������ֶΣ��ж���ö��Ÿ�����磺"wellno,jsjg"
����args4���������ֶ�ֵ���ж���ö��Ÿ�����磺"4052033,345"
����args3�����Ƿ������û����еĴ˲�����1�������ѣ�0��������
*/
function deleteAct(args1,args3,args2,args4){
	 if(args1.length){
	  var a=0;
	  for(i=0;i<args1.length;i++)
	   if(args1[i].checked)a++;
	   if(a>1){
           alert("ֻ��ɾ��һ����¼��");
	     return false;
	   }else if(a<1){
	     alert("�㻹û��ѡ��Ҫɾ���ļ�¼��");
	     return false;
	   }else if(args3==1){
           if(confirm("�����Ҫɾ����")){
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
         alert("�㻹û��ѡ��Ҫɾ���ļ�¼��");
		 return false;
	  }else if(args3==1){
	    if(confirm("�����Ҫɾ����")){
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
�Դ���ı����ɾ����������Ҫ��Ч�飺isDelDataFromTable����
����tablename���� ���������磺document.form1.checkNO
����deletename���������ֶΣ��ж���ö��Ÿ�����磺"wellno,jsjg"
����deletevalue���������ֶ�ֵ���ж���ö��Ÿ�����磺"4052033,345"
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
ȡ��ɾ����¼������˳��ţ�getDelPoint()
����args1����ѡ��������磺document.form1.checkNO
*/

function getDelPoint(args1){
  if(!args1){
		alert("û�м�¼Ҫɾ����");
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
 * ���������ַ����Ƿ���ƴ����ʽ:Zhou Erqiang��Zhao Xiang'an
 */
 function isPinYin(arg){
	var str=trim(arg.value);
	var regexp = /^([A-Z]{1})([a-z]{0,28})(\s)([A-Z]{1})([a-z|\']{0,38})$/;
  //var regexp = /^([A-Z]{1})([a-z]{0,28})(\s)([A-Z]{1})([a-z]{0,38})$/;
	return regexp.test(str);
 }

 /*
 ��������ַ���ת��Ϊ��ǣ���ǲ�ת��ȫ��ת��ǣ�
 input�� Str    �����ַ���
 output��DBCStr ����ַ���
 ���ߣ�  �⽭��
 ��д���ڣ�2006-11-06

 ˵����1��ȫ�ǿո�Ϊ12288����ǿո�Ϊ32
       2�������ַ����(33-126)��ȫ��(65281-65374)�Ķ�Ӧ��ϵ�ǣ������65248
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
 ��������ַ���ת��Ϊȫ�ǣ�ȫ�ǲ�ת�����תȫ�ǣ�
 input�� Str    �����ַ���
 output��SBCStr ȫ���ַ���
 ���ߣ�  �⽭��
 ��д���ڣ�2006-11-06

 ˵����1��ȫ�ǿո�Ϊ12288����ǿո�Ϊ32
       2�������ַ����(33-126)��ȫ��(65281-65374)�Ķ�Ӧ��ϵ�ǣ������65248
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
 �����ʵ���ַ������ȣ���Ǽ�ȫ�ǵ��ַ�����
 input�� Str
 output��len
 ���ߣ�  �⽭��
 ��д���ڣ�2006-11-06
 */
function ChkLen(str){
   var len=0;
   for(var i=0; i<str.length; i++){
     var c=str.charCodeAt(i);
     
	 if(c<256||(c>=0xff61&&c<=0xff9f)){ //���
       len=len+1;
     }
     else{ //ȫ��
       len=len+2;
     }
   }
   return len;
}

/*
 �ı����궨λ
 input�� obj    ����
 output��place  Ҫ��λ����λ��
 ���ߣ�  �⽭��
 ��д���ڣ�2006-11-06
*/
function movePoint(obj,place) { 
	
	var rng = obj.createTextRange(); 

	rng.moveStart("character",place); 
    rng.collapse(true); 
    rng.select(); 
}

/*
 ��ȡtextarea��ǰ���λ��
 input�� 
 output��
 ���ߣ�  �⽭��
 ��д���ڣ�2006-11-06
*/
function tellPoint() { 
	var rng = event.srcElement.createTextRange(); 

	rng.moveToPoint(event.x,event.y); 
	rng.moveStart("character",-event.srcElement.value.length); 

	return  rng.text.length;
} 


/*===================================================
���ܣ�ʹ�����ֻ����������Ҫ�������
���룺obj ��������
      flag 
����� 
���ߣ��⽭��
ʱ�䣺2007-05-18
�޸�ʱ�䣺
===================================================*/
function checkData(obj,flag) {
    var tLen = obj.value.length; //��Ϣ���ܳ���
	var fLen = 0; //��Ϣǰ�沿�ֵĳ���
	var tv_begin = null; //������ʱֵ
	var tv_end = null; //������ʱֵ
	var errorplace = -1; //ֵ�������λ��
   
	//��ͷ��ʼ�������ݣ�ȥ�������ʵ�����
	while(checkDataswich(obj.value,flag) && obj.value.length != 0) {
        tv_begin = obj.value.substring(fLen, parseInt(fLen) + 1);
        
		tv_begin = toDBC(tv_begin);
		tv_end = checkDataswich(tv_begin,flag)?"":tv_begin; //���ʱ�����������ɾ��

        obj.value = obj.value.substring(0, fLen) + tv_end +
		            obj.value.substring(parseInt(fLen) + 1, tLen);

		tLen = obj.value.length;
		fLen = parseInt(fLen)+ tv_end.length;
		errorplace = fLen;
    }

	//��궨λ
	if(errorplace > -1) {
	    movePoint(obj,errorplace);
	}

	return;
}


function checkDataswich(value,flag){
	switch(flag) {
		case '01': //����
			return (!isNumber(value));
			break;
		case '02': //Ӣ��
			return (!isEng(value));
			break;
		case '03': //�绰����
			return (!isPhone(value));
			break;
		case '04': //������
			return (isNaN(value));
			break;
		case '05': //�����
			return (toDBC(value) != value);
			break;
		case '06': //��������ĸ���
			return (!isString(value));
			break;
		default:
			break;
	}
}

/*ʹ�����ֻ����������*/
function checkNum(num) {
	checkData(num,'01');
}

/*ʹ�ʱ������ֻ����������*/
function checkPos(num) {
	checkData(num,'01');
}

/*ʹ�����ֻ������Ӣ����ĸ*/
function checkEn(en) {
	checkData(en,'02');
}

/*ʹ�����ֻ��������ʵĸ�ʽ�ĵ绰����*/
function checkPhone(phone) {
	checkData(phone,'03');
}

/*ʹ�����ֻ�����븡����*/
function checkFloat(floats) {
	checkData(floats,'04');
}

/*��������ֵת�ɶ��ǰ�ǵģ����ҹ���ܶ�λ*/
 function DBCOnly(obj){
	checkData(obj,'05');
 }

 /*ʹ�����ֻ��������������ĸ���*/
function checkNumAndEn(str) {
	checkData(str,'06');
}
