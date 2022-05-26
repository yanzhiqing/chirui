/**
 * �ж�ʱ���Ⱥ�
 * ������startDate ��YYYY-MM-dd�� ��ʼʱ��
 * ������endDate   ��YYYY-MM-dd�� ����ʱ��
 * ���أ�true�� ��ʼʱ��С�ڽ���ʱ�䣬false�� ��ʼʱ����ڽ���ʱ��
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
 * �ж����ִ�С
 * ������a
 * ������b
 * ���أ�true��aС��b��false��a����b
 */
function compareInteger(a,b){
	if(a-b>0){
		return false;
	}
	return true;
}
/**
 * ip��ַ��ʽ��֤
 * ������strIP ip��ַ�ַ���
 * ���أ�true�� ��ȷ��ip��false�� �����ip
 */
function isIP(strIP) {
	var re=/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/g //ƥ��IP���ε�������ʽ
	if(re.test(strIP)){
		if( RegExp.$1 <256 && RegExp.$2<256 && RegExp.$3<256 && RegExp.$4<256 ){
			return true;
		}
		return false;
	}
}
  
/**
 * mac��ַ��ʽ��֤
 * ������e1 ��Ҫ��֤�ı����� 
 * ���أ�true ��֤ͨ���� false ��֤δͨ����
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
 * ������֤
 * ������strValue ��Ҫ��֤���ַ���
 * ���أ�true ��������Ϊ������false �������ݲ���������
 */
function isInteger(strValue){   
	var objExp = /(^-?\d\d*$)/;   
	return objExp.test(strValue);   
}
  
/**
 * ������֤(������)
 * ������strValue ��Ҫ��֤���ַ���
 * ���أ�true ��������Ϊ������false �������ݲ���������
 */
function isAllInteger(strValue){   
	var objExp = "^[0-9]*[1-9][0-9]*$";   
	return objExp.test(strValue);   
}
    ��
/**
 * ���ڸ�ʽ��֤��YYYY-MM-dd��
 * ������str ��Ҫ��֤���ַ���
 * ���أ�true ��������Ϊ������false �������ݲ���������
 */ 
function strDateTime(str){
	var r = str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/); 
	if(r==null)return false; 
	var d= new Date(r[1], r[3]-1, r[4]); 
	return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]);
}
  
/**
 * �绰����ǿո�ʽ��֤
 * ��ʽ��Ϊ��1234567,12345678,123-12345678,1234-1234567,1234-12345678�����ֻ���ʱ�ÿո�ָ���
 * ������ strTel ��Ҫ��֤�ĵ绰����
 * ���أ�true Ϊͨ��,falseΪͨ��
 */
function  check_tel(strTel){  	
	var e= /^(((0*\d{2,3})-)?(\d{7,8})(-(\d{2,}))?)?((\s)?1\d{10})*$/;
	if(! e.test(strTel) && strTel != ""){
		alert('�绰����ֻ�����֣���λ�ź�����"-"�ַ�\r\n��ʽΪ��0123-12345678 �� 00000000\r\n\t���ֻ���');
		return false;
	}
	return true;
} 
  
/**
 * �ո������֤
 * ������inputString ��Ҫ��֤���ַ���
 * ���أ�true ��֤ͨ���� false ��֤δͨ����
 */ 
function trim(inputString) {
	if (typeof inputString != "string"){
		return inputString;
	}
	var retValue = inputString;
	var ch = retValue.substring(0, 1);
	while (ch == " ") { 
		//����ַ�����ʼ���ֵĿո�
	    retValue = retValue.substring(1, retValue.length);
	    ch = retValue.substring(0, 1);
	}
	ch = retValue.substring(retValue.length-1, retValue.length);
	while (ch == " ") {
		//����ַ����������ֵĿո�
	   retValue = retValue.substring(0, retValue.length-1);
	   ch = retValue.substring(retValue.length-1, retValue.length);
	}
	while (retValue.indexOf("  ") != -1) { 
		//�������м��������Ŀո��Ϊһ���ո�
	   retValue = retValue.substring(0, retValue.indexOf("  ")) + retValue.substring(retValue.indexOf("  ")+1, retValue.length); 
	}
	return retValue;
} 
/**
 * ���������ַ�
 * ������inputString ��Ҫ��֤���ַ���
 * ���أ�true ��֤ͨ���� false ��֤δͨ����
 */ 
function CheckIfEnglish(String){
	var Letters = "(!@#$%^&*;':,.?/����";
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
 * �������ַ�Ϊ�����ַ�
 * ������inputString ��Ҫ��֤���ַ���
 * ���أ�true ��֤ͨ���� false ��֤δͨ����
 */ 
function CheckFirstChar(String){ 
	var Letters = "(!@#$%^&*;':,.?/����-";
	var c = String.substring(0,1);
	if (Letters.indexOf(c) > 0){
		return false;        
	}
	return true;
}
/**
 * �ж��������Ϣ�Ƿ񳬹��Ϸ��ĳ��ȡ���������У�nLenΪ���������Ӣ���ַ�����
 *
 * ������str �������ַ���,maxLength ���������Ӣ���ַ�����
 * ���أ� true if str's length<=maxLength, false otherwise.
 */
function isLegal( str, maxLength ) {
    var realLength = getStringLength(str);
    return (realLength <= maxLength);
}


/**
 * str �������ַ���
 * str�ĳ���(Ӣ���ַ�����)
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
 * �ж��ַ����Ƿ�Ϊ����
 *
 * ע��: ����ֻ��ͨ���ַ�ascii���жϣ������ϸ�ı��뷶Χ�жϣ�
 * ������������ַ���Ϊ�������޹������֣�Ҳ�᷵��true
 *
 * ����: str
 * ���أ� true ���str�������ַ���, false���strΪ�ջ��߲��������ַ���
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
 * �ж��ַ����Ƿ�Ϊ���ģ�ȫ���������ģ�
 *
 * ע��: ����ֻ��ͨ���ַ�ascii���жϣ������ϸ�ı��뷶Χ�жϣ�
 * ������������ַ���Ϊ�������޹������֣�Ҳ�᷵��true
 *
 * ����: str
 * ���أ� true ���str�������ַ���, false���strΪ�ջ��߲��������ַ���
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

//�ж��������ַ�����Ϊ0
function isZero(str){
     var charCode = str.substring(0,1);
     if (charCode.indexOf("0")==-1){
          return true;
     }
     return false;
}