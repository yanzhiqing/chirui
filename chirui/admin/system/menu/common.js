/*
==ģ�鹦�ܣ��˵�ά���Ĺ���javascript
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
	if(!rigorCheckValue(document.all["menuVO.menuCol1"],1,1,0,0,"�˵�ģ��")){
		return false;
	}else if(!rigorCheckValue(document.all["menuVO.menuUpId"],1,1,8,0,"�ϼ��˵�")){
		return false;
	}else if(!rigorCheckValue(document.all["menuVO.menuId"],1,2,8,0,"�˵�����")){
		return false;
	}else if(!rigorCheckValue(document.all["menuVO.menuName"],1,1,20,0,"�˵�����")){
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
	var num = document.all["menuVO.menuId"];
    
    checkNum(num);

	return;
} 

/*===================================================
���ܣ�ʹ����ע��menuRemark���������ֻ�����볤��Ϊmaxlen����Ϣ
���룺
�����
===================================================*/
function checkMenuRemark() {
	var obj = document.all["menuVO.menuRemark"];
	var maxlen = 150;
    
    checkMaxlen(obj,maxlen);

	return;
} 


