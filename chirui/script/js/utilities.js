/*
Method:   checkNum(theObj)
Purpose:  Display Error
Return:    alert
*/
function displayMessage(errNo,className){
 if( className==null){ alert(errNo);}
                 else{ alert('"'+className+'"'+errNo);}
}

/*
Method:   checkNum(theObj)
Purpose:  Try to check if input string is a number
Return:   true/false alert
*/
function checkTelAlt(theObj,message)
{
  theObj = eval(theObj);
  var str = theObj.value;
  if( isEmpty(str)){ return true;}
 if( !isNSpaceAlt(str,message)){
      theObj.focus();
      return false;}
 if(isInt(str)) { return true;}
   else {
                         displayMessage(M01006,message);
      theObj.focus();
    return false;
  }
}

/*
Method:   checkNum(theObj)
Purpose:  Try to check if input string is a number
Return:   true/false alert
*/
function checkNum(theObj)
{

   theObj = eval(theObj);
 var str = theObj.value;
   if( isEmpty(str)){ return true;}
 if( !isNSpace(str)){ return false;}
 if(isInt(str)) { return true;}
   else { return false;}
}

/*
Method:   checkNumAlt(theObj,message)
Purpose:  Try to check if input string is a number
Return:   true/false alert
*/
function checkNumAlt(theObj,message)
{
  theObj = eval(theObj);
  var str = theObj.value;
  if( isEmpty(str)){ return true;}
 if( !isNSpaceAlt(str,message)){
      theObj.focus();
      return false;}
 if(isInt(str)) { return true;}
   else {
                         displayMessage(M01007,message);
      theObj.focus();
    return false;
  }
}

/*
Method:   Try to check if input is a date
Purpose:  function checkDate(theObj,pStr)
Return:   true/false
*/
function checkDate(theObj,pStr){
  theObj = eval(theObj);
 return isDate(theObj.value,pStr);
}

/*
Method:   Try to check if input is a date in form of YYYY/MM/DD
Purpose:  function checkDateYMD(theObj,pStr)
Return:   true/false
*/
function checkDateYMD(theObj, pStr, message){
  theObj = eval(theObj);
  if(isDateYMD(theObj.value)) {
    return true;
  } else {
    displayMessage( M01011, message );
    theObj.focus();
    return false;
  }
}

/*
Method:   Try to check if input is a date in form of YYYY/MM/DD
Purpose:  function isDateYMD(theStr)
Return:   true/false
*/
function isDateYMD(theStr){
  if(theStr.search(/^(\d){4}\/(\d){1,2}\/(\d){1,2}$/) != -1) {
    var a = theStr.split(/:/);

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

/*
Method:   Try to check if input is a date in form of YYYY/MM
Purpose:  function isDateYM(theStr)
Return:   true/false
*/
function isDateYM(theStr){
  if(theStr.search(/^(\d){4}\/(\d){2}$/) != -1) {
    return true;
  } else {
    return false;
  }
}

/*
Method:   Try to check if input is a date in form of YYYY/MM
Purpose:  function isDate(theStr)
Return:   true/false
*/
function isTimeHM(theStr){

  if(theStr.search(/^(\d){1,2}\:(\d){2}$/) != -1) {

    var a = theStr.split(/:/);

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

/*
Method:   Try to check if input is a date
Purpose:  function checkTimeHMAlt(theObj,pStr,message)
Return:   true/false  alert
*/
function checkTimeHMAlt(theObj, message) {

  if(isTimeHM(theObj.value)) {
    return true;
  } else {
    displayMessage( M01014, message);
    theObj.focus();
    return false;
  }
}

/*
Method:   Try to check if input is a date
Purpose:  function isDate(theStr,pStr)
Return:   true/false
*/
function isDate(theStr,pStr){
  if( isEmpty(theStr)){ return false;}  // modify by Joe - true => false
  if( !isNSpace(theStr)){ return false;}
  if ( isDateChar(theStr)){
    var the1st=theStr.indexOf(pStr);
    var the2nd=theStr.lastIndexOf(pStr);
    if(the1st==the2nd){ return false;}
    else{
      var y=theStr.substring(0,the1st);
      var m=theStr.substring(the1st+1,the2nd);
      var d=theStr.substring(the2nd+1,theStr.length);
      var maxDays=31;
      if(isInt(m)==false||isInt(d)==false||isInt(y)==false){
        return false;
      }
      else if(y.length<4||y.length>4){return false;}
      else if(m<1||m>12){ return false;}
      else if(m==4||m==6||m==9||m==11)maxDays=30;
      else if(m==2){
        if(y%4>0)maxDays=28;
        else if(y%100==0&&y%400>0)maxDays=28;
        else maxDays=29;
      }
      if(d<1||d>maxDays){ return false;}
      else{return true;}
    }
  }
  else{return false}
}

/*
Method:   Try to check if input is a date
Purpose:  function checkDateAlt(theObj,pStr,message)
Return:   true/false  alert
*/
function checkDateAlt(theObj,pStr,message){
  theObj = eval(theObj);
  if( isDateAlt(theObj.value,pStr,message)){  return true;}
    else {
            theObj.focus();
        return false;
    }
}

/*
Method:   Try to check if input is a date
Purpose:  function isDateAlt(theStr,pStr,message)
Return:   true/false  alert
*/
function isDateAlt(theStr,pStr,message){
   if( isEmpty(theStr)){ return true;}
   if( !isNSpaceAlt(theStr,message)){ return false;}
  if ( isDateChar(theStr)){
    var the1st=theStr.indexOf(pStr);
    var the2nd=theStr.lastIndexOf(pStr);
  if(the1st==the2nd){
                             displayMessage(M01011,message);
      return false;}
  else{
      var y=theStr.substring(0,the1st);
    var m=theStr.substring(the1st+1,the2nd);
    var d=theStr.substring(the2nd+1,theStr.length);
    var maxDays=31;
    if(isInt(m)==false||isInt(d)==false||isInt(y)==false){
                             displayMessage( M01011,message );
     return false;}
  else if(y.length<4||y.length>4){
                             displayMessage( M01011,message );
          return false;}
  else if(m<1||m>12){
                             displayMessage( M01013,message );
         return false;}
  else if(m==4||m==6||m==9||m==11)maxDays=30;
  else if(m==2){
       if(y%4>0)maxDays=28;
     else if(y%100==0&&y%400>0)maxDays=28;
     else maxDays=29;
     }
  if(d<1||d>maxDays){
                             displayMessage( M01013,message );
       return false;}
  else{return true;}
  }
 }
 else{
                             displayMessage( M01011 ,message);
 return false;}
}


/*
Method:   Try to check if input is a date
Purpose:  function checkShortDate(theObj,pStr)
Return:   true/false
*/
function checkShortDate(theObj,pStr){
  theObj = eval(theObj);
 return isShortDate(theObj.value,pStr);
}

/*
Method:   Try to check if input is a date
Purpose:  function isShortDate(theStr,pStr)
Return:   true/false
*/
function isShortDate(theStr,pStr){
   if( isEmpty(theStr)){ return true;}
   if( !isNSpace(theStr)){ return false;}
  if ( isDateChar(theStr)){
    var the1st=theStr.indexOf(pStr);
    var y=theStr.substring(0,the1st);
    var m=theStr.substring(the1st+1,theStr.length);
  if(isInt(m)==false||isInt(y)==false){ return false;}
  else if(y.length<4||y.length>4){return false;}
  else if(m<1||m>12){ return false;}
  else{return true;}
  }
 else{return false}
}
/*
Method:   Try to check if input is a date
Purpose:  function IsShortDate(theStr,partitionStr)
Return:   true/false  alert
*/
function checkShortDateAlt(theObj,pStr,message){
  theObj = eval(theObj);
    if(  isShortDateAlt(theObj.value,pStr,message)){  return true;}
    else {
            theObj.focus();
        return false;
    }
}
/*
Method:   Try to check if input is a date
Purpose:  function isShortDateAlt(theStr,pStr,message)
Return:   true/false alert
*/
function isShortDateAlt(theStr,pStr,message){
   if( isEmpty(theStr)){ return true;}
  if( !isNSpaceAlt(theStr,message)){ return false;}
  if ( isDateChar(theStr)){
    if ( theStr.indexOf(pStr) == -1) {
                           displayMessage( M01011, message);
    return false;}
    var the1st=theStr.indexOf(pStr);
    var y=theStr.substring(0,the1st);
    var m=theStr.substring(the1st+1,theStr.length);
  if(isInt(m)==false||isInt(y)==false){ 
	                       displayMessage( M01011, message);
	  return false;}
  else if(y.length<4||y.length>4){
                           displayMessage( M01013 ,message);
          return false;}
  else if(m<1||m>12){
                           displayMessage( M01013, message);
          return false;}
  else{return true;}
        }
  else{
                           displayMessage( M01011,message);
   return false}
}

/*
Method:   isDateChar(num)
Purpose:  Try to check if input string is "0123456789/"
Return:   true/false
*/
function isDateChar(num){
  num = escape(num);
  var valid = "0123456789/."
  var temp;
  for (var i=0; i<num.length; i++) {
    temp = "" + num.substring(i, i+1);
    if (valid.indexOf(temp) == "-1"){
    return false;}
  }
 return true;
}
/*
Method:   isInt(num)
Purpose:  Try to check if input string is a number
Return:   true/false
*/
function isInt(theStr){
  num = escape(theStr);
  var valid = "0123456789"
  var temp;
  for (var i=0; i<num.length; i++) {
  temp = "" + num.substring(i, i+1);
  if (valid.indexOf(temp) == "-1") { return false;}
  }
 return true;
}

/*
Method:   checkZip(theObj)
Purpose:  Try to check if input string is a number
Return:   true/false
*/
function checkZip(theObj){
  theObj = eval(theObj);
 return isZip(theObj.value);
}
/*
Method:   isZip(theStr)
Purpose:  Try to check if input string is a number
Return:   true/false
*/
function isZip(theStr)
{   if( isEmpty(theStr)){ return true;}
   if( !isNSpace(theStr)){ return false;}
   if (isInt(theStr) == false){
     return false;
    }
   if ((theStr.length !=3)&&(theStr.length!=7)) {
     return false;
    }
  return true;
}
/*
Method:   checkZipAlt(theObj,message)
Purpose:  Try to check if input string is a number
Return:   true/false alert
*/
function checkZipAlt(theObj,message){
  theObj = eval(theObj);
 return seZipAlt(theObj.value,message);
}

/*
Method:   seZipAlt(theStr,message)
Purpose:  Try to check if input string is a number
Return:   true/false alert
*/
function seZipAlt(theStr,message)
{   if( isEmpty(theStr)){ return true;}
    if( !isNSpaceAlt(theStr,message)){ return false;}
   if (isInt(theStr) == false){
                           displayMessage( M01007,message);
     return false;
    }
   if ((theStr.length !=3)&&(theStr.length!=6)) {
                           displayMessage( M01020 );
     return false;
    }
  return true;
}

/*
Method:   checkZipAlt(theObj,message)
Purpose:  Try to check if input string is a number
Return:   true/false alert
*/
function checkFullZipAlt(theObj,message){
  theObj = eval(theObj);
    if(  isZipAlt(theObj.value,message)){  return true;}
    else {
            theObj.focus();
        return false;
    }
}
/*
Method:   isZipAlt(theStr,message)
Purpose:  Try to check if input string is a number
Return:   true/false alert
*/
function isZipAlt(theStr,message)
{   if( isEmpty(theStr)){ return true;}
    if( !isNSpaceAlt(theStr,message)){ return false;}
   if (isInt(theStr) == false){
                           displayMessage(M01007,message);
     return false;
    }
   if ( ( theStr.length!=6 ) && ( theStr.length!=3 ) ) {
                           displayMessage( M01020 );
     return false;
    }
  return true;
}
/*
Method:   checkEmail(theObj)
Purpose:  Try to check if input string is standard Email address.
Return:   true/false
*/
function checkEmail(theObj){
  theObj = eval(theObj);
  return isEmail(theObj.value);
}

/*
Method:   isEmail(theStr)
Purpose:  Try to check if input string is standard Email address.
Return:   true/false
*/

function isEmail(theStr) {
/****  modify by Joe */
  if( isEmpty(theStr)){ return true;}
  if (   (theStr.indexOf ('@') == -1)
      || (theStr.indexOf ('.') == -1)){
   return false;
  }

/****  modi source 2001/12/22
  if (theStr.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1)
    return true;
  else
    return false;
*/

/*  2002/8/22É¾³ı

  txt = "±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÚÛÜ¦İ§¨©ª«¬­®¤¡¢£Şß";
  for (i=0; i<theStr.length; i++)
  {
	if (txt.indexOf(theStr.charAt(i),0) >= 0)
  {
    return false;
  }
  }
  */
  return true;

}


/*
Method:   checkEmailAlt(theObj)
Purpose:  Try to check if input string is standard Email address.
Return:   true/false
*/
function checkEmailAlt(theObj){
  theObj = eval(theObj);
      if(  isEmailAlt(theObj.value)){  return true;}
    else {
            theObj.focus();
        return false;
    }
}
/*
Method:   isEmailAlt(theStr)
Purpose:  Try to check if input string is standard Email address.
Return:   true/false alert
*/

function isEmailAlt(theStr) {
  if( isEmpty(theStr)){ return true;}
  if (   (theStr.indexOf ('@') == -1)
      || (theStr.indexOf ('.') == -1)){
                           displayMessage( M01018 );
   return false;
  }
return true;
}
/*
Method:   checkCompare(theObj,sedObj)
Purpose:  Try to Compare  input number.
Return:   true/false
*/
function checkCompare(theObj,sedObj){
  theObj = eval(theObj);
  sedObj = eval(sedObj);
  return isCompare(theObj.value,sedObj.value);
}

/*
Method:   isCompare(theStr,sedStr)
Purpose:  Try to Compare  input number.
Return:   true/false
*/

function isCompare(theStr,sedStr){
 if( isEmpty(sedStr)){ return true;}
 if( isEmpty(theStr)){ return false;}
  if( !isNSpace(theStr)){ return false;}
  if( !isNSpace(sedStr)){ return false;}
 if (!isInt(theStr)){ return false;}
 if (!isInt(sedStr)){ return false;}
 if ( (theStr-sedStr) > 0){ return false;}
   return true;
}

/*
Method:   checkCompareAlt(theObj,sedObj,message)
Purpose:  Try to Compare  input number.
Return:   true/false alert
*/
function checkCompareAlt(theObj,sedObj,message){
  theObj = eval(theObj);
  sedObj = eval(sedObj);
 if( isEmpty(sedObj.value)){   return true;}
 if( !isEmptyAlt(theObj.value,message)){  theObj.focus(); return false;}
 if( !isNSpaceAlt(theObj.value,message)){ theObj.focus();  return false;}
 if( !isNSpaceAlt(sedObj.value,message)){ sedObj.focus();  return false;}
 if (!isInt(theObj.value)){
                             displayMessage( M01007,message);
                theObj.focus();
    return false;
    }
 if (!isInt(sedObj.value)){
                           displayMessage( M01007,message);
                sedObj.focus();
    return false;
    }
 if ( (theObj.value-sedObj.value) > 0){
                           displayMessage( M11005,message);
                sedObj.focus();
    return false;
    }
  return true;

}


/*
Method:   isCompareAlt(theStr,sedStr,message)
Purpose:  Try to Compare  input number.
Return:   true/false alert
*/

function isCompareAlt(theStr,sedStr,message){
 if( isEmpty(sedStr)){ return true;}
 if( !isEmptyAlt(theStr,message)){ return false;}
 if( !isNSpaceAlt(theStr,message)){ return false;}
 if( !isNSpaceAlt(sedStr,message)){ return false;}
 if (!isInt(theStr)){
                             displayMessage(M01007,message);
    return false;
    }
 if (!isInt(sedStr)){
                           displayMessage(M01007,message);
    return false;
    }
 if ( (theStr-sedStr) > 0){
                           displayMessage(M11005,message);
    return false;
    }
  return true;

}
/*
Method:   checkLengthMax(theObj,maxInt)
Purpose:  Try to check  input string is length full and half don't                  overtake max.
Return:   true/false
*/
function checkLengthMax(theObj){
  theObj = eval(theObj);
  return  isLengthMax(theObj.value ,theObj.maxLength);
}
/*
Method:   isLengthMax(theStr,maxInt,message)
Purpose:  Try to check  input string is length full and half don't                  overtake max.
Return:   true/false
*/
function isLengthMax(theStr,maxInt){
  var theInt = getLength(theStr);
  if ( (theInt- maxInt)>0){
  return false;
  }
  return true;
}

/*
Method:   checkLengthMaxAlt(theObj,maxInt,message)
Purpose:  Try to check  input string is length full and half don't                  overtake max.
Return:   true/false
*/
function checkLengthMaxAlt(theObj,message){
  theObj = eval(theObj);
      if( isLengthMaxAlt(theObj.value,theObj.maxLength,message)){  return true;}
    else {
            theObj.focus();
        return false;
    }
}
/*
Method:   isLengthMaxAlt(theStr,maxInt,message)
Purpose:  Try to check  input string is length full and half don't                  overtake max.
Return:   true/false
*/
function isLengthMaxAlt(theStr,maxInt,message){
  var theInt = getLength(theStr);
  if ( (theInt- maxInt)>0){
                             displayMessage(M01002,message);
  return false;
  }
  return true;
}

/*
Method:   getLength(theStr)
Purpose:  Try to check  input string is length full and half.
Return:   length
*/
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

/*
Method:   checkEmpty(theObj)
Purpose:  Try to check  input string is Empty
Return:   true/false
*/
function checkEmpty(theObj) {
  theObj = eval(theObj);
  if( isEmpty(theObj.value)){  return false;}
  return  true;
}

/*
Method:   checkEmptyAlt(theObj,message)
Purpose:  Try to check  input string is Empty
Return:   true/false alert
*/
function checkEmptyAlt(theObj,message) {
  theObj = eval(theObj);
  if( isEmpty(theObj.value)){
                           displayMessage( M01001,message);
               theObj.focus();
  return false;}
return  true;
}

function isEmptyAlt(theStr,message) {

  if( isEmpty(theStr)){
                           displayMessage(M01001,message);
  return false;}
return  true;
}

/*
Method:   isEmpty(theStr)
Purpose:  Try to check  input string is Empty
Return:   true/false
*/

function isEmpty(theStr) {
return (theStr.length <= 0);
}

/*
Method:   checkSpaceAlt(theObj,message)
Purpose:  Try to check  input string is isSpacebar
Return:   true/false alert
*/
function checkSpaceAlt(theObj,message) {
  theObj = eval(theObj);
  if (isNSpace(theObj.value)){ return true;}
                             displayMessage(M01003,message);
               theObj.focus();
    return false;
}

/*
Method:   isNSpace(theStr)
Purpose:  Try to check  input string is isSpacebar
Return:   true/false
*/
function isNSpaceAlt(theStr,message) {
  if (isNSpace(theStr)){ return true;}
                             displayMessage(M01003,message);
    return false;
}

/*
Method:   isNSpace(theStr)
Purpose:  Try to check  input string is isSpacebar
Return:   true/false
*/
function isNSpace(theStr) {
 if ( (theStr.indexOf (' ') == -1) || (theStr.indexOf ('@') == -1)){ return true;}
 else{ return false;}
}

/*
Method:   checkHalfChar(theObj)
Purpose:  Try to check  input string is  Half-width
Return:   true/false
*/

function checkHalfChar(theObj){
  theObj = eval(theObj);
 return isHalfChar(theObj.value);
}

/*
Method:   isHalfChar(theStr)
Purpose:  Try to check  input string is  Half-width
Return:   true/false
*/

function isHalfChar(theStr) {
  var fristInt  = getLength(theStr);
  var secondInt = theStr.length;
  if ( fristInt == secondInt)
  { return true;
  }
  return false;
}
/*
Method:    checkHalfCharAlt(theObj,message)
Purpose:  Try to check  input string is Half-width
Return:   true/false alert
*/

function checkHalfCharAlt(theObj,message){
  theObj = eval(theObj);
    if(isHalfCharAlt(theObj.value,message)){  return true;}
    else {
            theObj.focus();
        return false;
    }
}

/*
Method:   isHalfCharAlt(theStr)
Purpose:  Try to check  input string is Half-width
Return:   true/false alert
*/

function isHalfCharAlt(theStr,message) {
  var fristInt  = getLength(theStr);
  var secondInt = theStr.length;
  if ( fristInt == secondInt)
  { return true;
  }
                             displayMessage(M01005,message);
  return false;
}

/*
Method:   checkFullChar(theObj)
Purpose:  Try to check  input string is Full-width
Return:   true/false
*/

function checkFullChar(theObj){
  theObj = eval(theObj);
 return isFullChar(theObj.value);
}

/*
Method:   isFullChar(theStr)
Purpose:  Try to check  input string is Full-width
Return:   true/false
*/

function isFullChar(theStr) {
  var fristInt  = getLength(theStr);
  var secondInt = theStr.length;
  if ( fristInt == secondInt*2)
  { return true;
  }
  return false;
}
/*
Method:    checkFullCharAlt(theObj)
Purpose:  Try to check  input string is Full-width
Return:   true/false alert
*/

function checkFullCharAlt(theObj,message){
  theObj = eval(theObj);
     if( isFullCharAlt(theObj.value,message)){  return true;}
    else {
            theObj.focus();
        return false;
    }
}

/*
Method:   isFullCharAlt(theStr)
Purpose:  Try to check  input string is Full-width
Return:   true/false alert
*/

function isFullCharAlt(theStr,message) {
  var fristInt  = getLength(theStr);
  var secondInt = theStr.length;
  if ( fristInt == secondInt*2)
  { return true;
  }
                             displayMessage(M01004,message);
  return false;
}
/*
Method:   checkCompDateAlt(theObj,sedObj,message)
Purpose:  Try to check  input string is Full-width
Return:   true/false alert
*/
function checkCompDateAlt(theObj,sedObj,message){

    theObj = eval(theObj);
  sedObj = eval(sedObj);
  if (!isDateAlt(theObj.value,'/',message)){ theObj.focus(); return false;}
  if (!isDateAlt(sedObj.value,'/',message)){ sedObj.focus(); return false;}
  firDate = linkDate(theObj.value,'/');
  sedDate = linkDate(sedObj.value,'/');
  if ((firDate-sedDate) > 0){
    //displayMessage( M0314,message );
	displayMessage( M11006,message );
    sedObj.focus();
    return false;
  }
  return true;
}

/*
Method:   checkCompShortDateAlt(theObj,sedObj,message)
Purpose:  Try to check  input string is Full-width
Return:   true/false alert
*/
function checkCompShortDateAlt(theObj,sedObj,message){
    theObj = eval(theObj);
  sedObj = eval(sedObj);
  if (!isShortDateAlt(theObj.value,'/',message)){ theObj.focus(); return false;}
  if (!isShortDateAlt(sedObj.value,'/',message)){ sedObj.focus(); return false;}
  firDate = linkShortDate(theObj.value,'/');
  sedDate = linkShortDate(sedObj.value,'/');
  if ((firDate-sedDate) > 0){
                             displayMessage( M11006 , message );
               sedObj.focus();
    return false;
  }
  return true;
}
/*
Method:   isCompDateAlt(theStr,sedStr,message)
Purpose:  Try to check  input string is Full-width
Return:   true/false alert
*/

function isCompDateAlt(theStr,sedStr,message){
  if (!isDateAlt(theStr,'/',message)){ return false;}
  if (!isDateAlt(sedStr,'/',message)){ return false;}
  firDate = linkDate(theStr,'/');
  sedDate = linkDate(sedStr,'/');
  if ((firDate-sedDate) > 0){
                             displayMessage( M11006 , message );
    return false;
  }
  return true;
}

/*
Method:   linkDate( theStr,pStr)
Purpose:  Try to check  input string is Full-width
Return:   int
*/
function linkDate( theStr,pStr){
  var the1st=theStr.indexOf(pStr);
  var the2nd=theStr.lastIndexOf(pStr);
  var y=theStr.substring(0,the1st);
  var m=theStr.substring(the1st+1,the2nd);
  var d=theStr.substring(the2nd+1,theStr.length);

  if (m.length==1) { m='0'+m; }
  if (d.length==1) { d='0'+d; }
  return (y+m+d);
}

/*
Method:   StandardDateFormat( theStr,pStr)
Purpose:  Try to check  input string is Full-width
Return:   int
*/
function StandardDateFormat( theStr,pStr){
  var the1st=theStr.indexOf(pStr);
  var the2nd=theStr.lastIndexOf(pStr);
  var y=theStr.substring(0,the1st);
  var m=theStr.substring(the1st+1,the2nd);
  var d=theStr.substring(the2nd+1,theStr.length);

  if (m.length==1) { m='0'+m; }
  if (d.length==1) { d='0'+d; }
  return (y+pStr+m+pStr+d);
}

/*
Method:   linkShortDate( theStr,pStr)
Purpose:  Try to check  input string is Full-width
Return:   int
*/
function linkShortDate( theStr,pStr){
  var the1st=theStr.indexOf(pStr);
  var y=theStr.substring(0,the1st);
  var m=theStr.substring(the1st+1,theStr.length);
  if (m.length==1) { m='0'+m; }
  return (y+m);
}

/*
Method:   checkURLAlt( theStr,pStr)
Purpose:  Try to check  input string is Full-width
Return:   int
*/

function checkURLAlt(theObj) {
    theObj = eval(theObj);
    theStr =theObj.value;	
    if( isEmpty(theStr)){ return true;}

/*2002/8/22É¾³ı
	txt = "±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÚÛÜ¦İ§¨©ª«¬­®¤¡¢£Şß";
	for (i=0; i<theStr.length; i++)
	{
		if (txt.indexOf(theStr.charAt(i),0) >= 0)
          {
           alert("¢URL£”¼ŠpƒJƒi‚Íg—p‚Å‚«‚Ü‚¹‚ñ");
           theObj.focus();
           return false;
         }
	}
*/
  if (   (theStr.indexOf ('http://')  != -1)
      || (theStr.indexOf ('https://') != -1)
	  || (theStr.indexOf ('HTTP://')  != -1)
	  || (theStr.indexOf ('HTTPS://') != -1)){
  if(    (theStr=='http://' )
      || (theStr=='https://')
	  || (theStr=='HTTP://' )
	  || (theStr=='HTTPS://')){
      theObj.value="";
      }
   return true;
  }
                             displayMessage( M01017 );
   theObj.focus();
return false;
}

/*
 check the input of parameter "hour" is right
 */
function CheckHour(h)
{
    var hour = trim(h);
  if (hour.length!=0){
        if ((isNaN(hour)==true)||(hour>=24)||(hour="")){
        return false;
      }
       }
     return true;
}
/*
 check the input of parameter "minute" is right
 */
function CheckMinute(h,m)
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



/*
 check the input of "hour:minute~hour:minute" is right
 */
function CheckTimePair(starth,startm,finishh,finishm,flag)
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

    if (!CheckHour(sh)||!CheckMinute(sh,sm)){
   /*   alert(starth+":"+startm+" has a wrong :time wrong");*/
      return false;
  }
  if (!CheckHour(fh)||!CheckMinute(fh,fm)){
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

function dispLen() {
  var x = document.f.x.value;
  //alert('ÎÄ×ÖÁĞéL¤µ£º' + x.length);
  //alert('ÎÄ×ÖÁĞéL¤µ£¨¥Ğ¥¤¥È£©' + getLength );
  alert('ÎÄ×Ö³¤¶È£º' + x.length);
  alert('ÎÄ×Ö³¤¶È' + getLength );
}


//‘SŠpƒ`ƒFƒbƒN
function isZenkaku(str){
  for (i=0;i<str.length;i++){
    code  = escape(str.substring(i,i+1));
    if(code.length==3){
      c = code.substring(1,3);
      if((c<"80")||((c>="A1")&&(c<="DF")))
        return false;
    }else if(code.length==6){
      c = code.substring(2,6);
      if((c>="FF61")&&(c<="FF9F"))
        return false;
    }else return false;
  }
  return true;
}
//”¼Špƒ`ƒFƒbƒN
function isHankaku(str){
  for (i=0;i<=str.length-1;i++){
    code  = escape(str.substring(i,i+1));
    if(code.length==3){
      c = code.substring(1,3);
      if(c != "20"){
        return false;
      }
    }else if(code.length==6){
      c = code.substring(2,6);
      if((c<"FF61")||(c>"FF9F"))
        return false;
    }else{// if(code.length!=1){
      return false;
    }
  }
  return true;
}

// set necessary parameters for MainServlet,
// goStr represents the next page this page should go to
// formName represents the name of the form tag
function setArgsForMain(goStr, formName) {
  var valueStr = eval("window.document." + formName+ "");
  valueStr.MAIN_TYPE.value = "2";
  valueStr.MAIN_PURPOSE.value = goStr;
  if(valueStr._DATA != null) {
    assignHiddenValue(formName);
  }
  return true;
}

// remove spaces preceding and succeeding the string x
function trim(x) {
  var i = 0;
  var xLen=x.length;
  var xLenM1=xLen-1;

  for(i=0;i<xLen,x.charAt(i)==" ";i++) {
  };

  for(n=xLenM1;n>i,x.charAt(n)==" ";n--) {
  };

  if(i == xLen) {
    return "";
  }
  return x.substring(i,n+1);
}

// count the age of applicant
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

// convert yyyymmdd to yyyy”NmmŒdd“ú
function dateDisplay(dateStr) {
  var newDateStr = "";
  if(dateStr.length == 6) {
    newDateStr = dateStr.substring(0,4) +'Äê'+
                 dateStr.substring(4,6) + 'ÔÂ';
  } else if(dateStr.length == 8) {
    newDateStr = dateStr.substring(0,4) + 'Äê'+
                 dateStr.substring(4,6) + 'ÔÂ'+
                 dateStr.substring(6,8) + 'ÈÕ';

  } else {
    newDateStr = "&nbsp&nbsp&nbsp&nbsp";
  }
  return newDateStr;
}


// parse a string whose format is name=value&name1=value2 and return a hashtable
function getArgs(query) {
  var args = new Object();

  // Split query at the comma
  var pairs = query.split("&");

  // Begin loop through the querystring
  for(var i = 0; i < pairs.length; i++) {

    // Look for "name=value"
    var pos = pairs[i].indexOf('=');
    // if not found, skip to next
    if (pos == -1) continue;
    // Extract the name
    var argname = pairs[i].substring(0,pos);

    // Extract the value
    var value = pairs[i].substring(pos+1);
    // Store as a property
    args[argname] = value;
  }
  return args; // Return the Object
}

// restore the information of the page
function restoreFields(args2) {
  var k = 0;
  for(i = 0;i < document.forms.length;i++) {
    for(j = 0;j < document.forms[i].elements.length;j++) {
      if(document.forms[i].elements[j].name != '_DATA') {
        if(args2[document.forms[i].elements[j].name] != null) {
          if(document.forms[i].elements[j].type == 'checkbox') {
            document.forms[i].elements[j].checked =
              (args2[document.forms[i].elements[j].name] != '' ? 'true' : 'false') ;
          } else if (document.forms[i].elements[j].type == 'radio') {
            document.forms[i].elements[j].checked =
              (args2[document.forms[i].elements[j].name] != '' ? 'true' : 'false') ;
          } else {
            document.forms[i].elements[j].value =
              args2[document.forms[i].elements[j].name];
          }
        }
        k++;
      }
    }//for
  }//for
}

/*
Method:   isNumeric(str)
Purpose:  Try to check if input string is a number
Return:   true/false
*/
function isNumeric(str)
{
for (var i=0; i < str.length; i++)
    {
var ch = str.substring(i, i+1)
if( ch < "0" || ch>"9" || str.length == null)
        {
return false
    }
  }
return true
}


/*
Method:   hkCheck(motoText)
Purpose:  Try to check if input string is a kale half char
Return:   true/false
*/
function hkCheck(motoText,message)
{
/*2002/8/22É¾³ı
	txt = "±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÚÛÜ¦İ§¨©ª«¬­®¤¡¢£Şß";
	for (i=0; i<motoText.length; i++)
	{
		if (txt.indexOf(motoText.charAt(i),0) >= 0)
    {
        displayMessage(M01010,message);
        return false;
    }
	}
*/
  return true;
}

/*
Method:   CreateDateCheck(From,To)
Purpose:  Try to check if input Date is correct Create Date, which is created in 100 years ago, Max time <= System Time
Return:   true/false
*/
function CreateDateFromCheck(From)
{
	var SystemTime = new Date();
  var FromValue = new String( From );

  if( FromValue=="" )
  { 
    return true;
  }
  FromArray = FromValue.split('/');

  var age = SystemTime.getFullYear() - FromArray[0];

  if( age > 100 ) {
    return false;
  }
  return true;
}

/*
Method:   CreateDateCheck(From,To)
Purpose:  Try to check if input Date is correct Create Date, Max time <= System Time
Return:   true/false
*/
function CreateDateToCheck(To)
{
	var SystemTime = new Date();
  var ToValue   = new String( To );

  if( ToValue=="" )
  { 
    return true;
  }
  ToArray   = ToValue.split('/');

  // Joe   SystemTime.getMonth() => SystemTime.getMonth() + 1
  
  if( (ToArray[0] - SystemTime.getFullYear() > 0  )  ||
      (ToArray[0] - SystemTime.getFullYear() == 0 ) && (ToArray[1] -1  - SystemTime.getMonth() > 0)  || 
      (ToArray[0]-SystemTime.getFullYear() == 0) && (ToArray[1] - 1 - SystemTime.getMonth() == 0 ) && (ToArray[2] - SystemTime.getDate() > 0 ) ) 
  {
    return false;
  }
  return true;
}

/*
Method:   check_full_char(motoText)
Purpose:  Try to check if input string is a full char
Return:   true/false
used: for the web easy form and web full form
add:  zhangkw (2001/12/23)
*/
function check_full_char(motoText)
{
/*2002/8/22É¾³ı
	txt = "±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÚÛÜ¦İ§¨©ª«¬­®¤¡¢£Şß1234567890";
	for (i=0; i<motoText.length; i++)
	{
		if (txt.indexOf(motoText.charAt(i),0) >= 0)
    {
        displayMessage(M01010)
        return false;
    }
	}
*/
  return true;
}

/*
Method:   isFullKalaAlt(theStr)
Purpose:  Try to check if input string is a full char kala
Return:   true/false
used: for the web easy form and web full form
add:  weiqiang (2002/1/17)
*/
function isFullKalaAlt(theStr,message)
{
/*2002/8/22É¾³ı
	txt = "ƒAƒAƒCƒEƒGƒIƒJƒLƒNƒPƒRƒTƒVƒXƒZƒ\ƒ^ƒ`ƒcƒeƒgƒiƒjƒkƒlƒmƒnƒqƒtƒwƒzƒ}ƒ~ƒ€ƒƒ‚ƒ„ƒ†ƒˆƒ‰ƒŠƒ‹ƒŒƒƒƒ’ƒ“ƒKƒMƒOƒQƒSƒUƒWƒYƒ[ƒ]ƒ_ƒaƒWƒfƒhƒoƒrƒuƒxƒ{ƒpƒsƒvƒyƒ|";
	txt =txt+"ƒ@ƒBƒDƒFƒHƒ•ƒ–ƒbƒƒƒ…ƒ‡ƒƒA";
	txt =txt+"‚`‚a‚b‚c‚d‚e‚f‚g‚h‚i‚j‚k‚l‚m‚n‚o‚p‚q‚r‚s‚t‚u‚v‚w‚x‚y‚‚‚‚ƒ‚„‚…‚†‚‡‚ˆ‚‰‚Š‚‹‚Œ‚‚‚‚‚‘‚’‚“‚”‚•‚–‚—‚˜‚™‚š";
	for (i=0; i<theStr.length; i++)
	{
		if (txt.indexOf(theStr.charAt(i),0) <= 0)
    {
        //alert("‘SŠpƒJƒi‚Æ‰pš‚ğ“ü—Í‚µ‚Ä‚­‚¾‚³‚¢");
		displayMessage(M01033,message)
        return false;
    }
	}
*/
  return true;
}