/*
==ģ�鹦�ܣ��˵���Ϣ�Ĺ���javascript
==���ߣ��⽭��
==ʱ�䣺2006-08-23
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
	if(!rigorCheckValue(document.all["menuPopeVO.popeName"],1,1,20,0,"�˵���������")){
	    return false;
	}else if(!rigorCheckValue(document.all["menuPopeVO.popeUrl"],1,1,100,0,"�˵�����URL")){
	    return false;
	}
	
	return true;
}

/*===================================================
���ܣ�ʹ���˵���ţ�menuId���������ֻ����������
���룺
�����
===================================================*/
function checkMenuId() {
	var num = document.all["menuPopeVO.menuId"];
    
    checkNum(num);

	return;
} 

/*===================================================
���ܣ�ʹ���˵��������ƣ�popeName���������ֻ������Ӣ����ĸ
���룺
�����
===================================================*/
function checkPopeName() {
	var en = document.all["menuPopeVO.popeName"];
    
    checkEn(en);

	return;
} 

/*===================================================
���ܣ�ʹ����ע��col1���������ֻ�����볤��Ϊmaxlen����Ϣ
���룺
�����
===================================================*/
function checkcCol1() {
	var obj = document.all["menuPopeVO.col1"];
	var maxlen = 100;
    
    checkMaxlen(obj,maxlen);

	return;
} 


