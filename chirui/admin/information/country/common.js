/*
==ģ�鹦�ܣ�������Ϣ�Ĺ���javascript
==���ߣ�������
==ʱ�䣺2006-08-20
*/


function checkall() {
/*
�Գ����������ͽ���Ч��rigorCheckValue()����Զ���λ
����args1��������������磺document.form1.name.value
����args2�����Ƿ�Ϊ��:0����� 1����ǿ�
����args3�����������:1����"������< > ��string" �� 2����"number"�� 3����"float"�� 4����"date"����5����"ֻ�������ֺ���ĸ�����"
����args4�����ַ������ȣ�0����������
����args5��������С����λ��������float������Ч����0����������
����args6���������ʵ�����壬�Ա���׼ȷ֪ͨ�û���
*/
	/*if(!rigorCheckValue(document.all["countryInfoVO.continentCode"],1,1,10,0,"������")){
		return false;
	}else*/ 
	if(!rigorCheckValue(document.all["countryInfoVO.continent"],1,1,100,0,"��")){
	    return false;
	}else 
	if(!rigorCheckValue(document.all["countryInfoVO.countryNo"],1,1,100,0,"���Ҵ���")){
	    return false;
	}else if(!rigorCheckValue(document.all["countryInfoVO.country"],1,1,100,0,"���һ����")){
	    return false;
	/*}else if(!rigorCheckValue(document.all["countryInfoVO.countryCode"],1,1,100,0,"��������")){
	    return false;*/
	}
	
	return true;
}

/*===================================================
���ܣ�ʹ����Ӣ�����ƣ�countryInfoVO.continentEn���������ֻ������Ӣ���ַ���
���룺
�����
===================================================*/
function checkContinentEn() {
	var en = document.all["countryInfoVO.continentEn"];

	checkEn(en);

	return;
}
/*===================================================
���ܣ�ʹ�����һ����Ӣ�����ƣ�countryInfoVO.countryEn���������ֻ������Ӣ���ַ���
���룺
�����
===================================================*/
function checkCountryEn() {
	var en = document.all["countryInfoVO.countryEn"];

	checkEn(en);

	return;
}
/*===================================================
���ܣ���ѯ���������������20060925add Ŀ�ģ������ס��ѯ�������⣩
���룺 
�����
===================================================*/
function getConditionString(){
	var continentCode = document.all["countryInfoVO.continentCode"].value;
	var continent = document.all["countryInfoVO.continent"].value;
	var countryNo = document.all["countryInfoVO.countryNo"].value;
	var country = document.all["countryInfoVO.country"].value;
	var hiddenFlag = document.all["countryInfoVO.hiddenFlag"].value;
	
	//��ȡ��ǰҳ��
	var currentPageNum = document.all["currentPageNum"].value;

	var conditionString = "&countryInfoVO.continentCode="+continentCode+"&countryInfoVO.continent="+continent+"&countryInfoVO.countryNo="+countryNo+"&countryInfoVO.country="+country+"&countryInfoVO.hiddenFlag="+hiddenFlag+"&currentPageNum="+currentPageNum;

	return conditionString;
}