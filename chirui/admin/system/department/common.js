/*
==ģ�鹦�ܣ���������Ĺ���javascript
==���ߣ�������
==ʱ�䣺2006-08-25
*/



/*===================================================
���ܣ�ʹ���������루departmentVO.depId���������ֻ����������
���룺
�����
===================================================*/
function checkDepId() {
	var num = document.all["departmentVO.depId"];

	checkNum(num);

	return;
}



/*===================================================
���ܣ�ʹ����ϵ�绰��departmentVO.depPhone���������ֻ������绰��ʽ���ַ�
���룺
�����
===================================================*/
function checkDepPhone() {
	var phone = document.all["departmentVO.depPhone"];

	checkPhone(phone);

	return;
}

/*===================================================
���ܣ�ʹ����ע��departmentVO.depRemark���������ֻ��������󳤶�Ϊmaxlen����Ϣ
���룺 
�����
===================================================*/
function checkDepRemark() {
	var maxlen = 150;
	var obj = document.all["departmentVO.depRemark"];

	checkMaxlen(obj,maxlen);

	return;
}