/*
==ģ�鹦�ܣ���ɫ��Ϣ�Ĺ���javascript
==���ߣ�������
==ʱ�䣺2006-08-25
*/

/*===================================================
���ܣ�ʹ����ɫ���루roleInfoVO.roleId���������ֻ����������
���룺
�����
===================================================*/
function checkRoleId() {
	var num = document.all["roleInfoVO.roleId"];

	checkNum(num);

	return;
}


/*===================================================
���ܣ�ʹ����ע��roleInfoVO.roleRemark���������ֻ������
      ��󳤶�Ϊmaxlen����Ϣ
���룺 
�����
===================================================*/
function checkRoleRemark() {
	var maxlen = 150;
	var obj = document.all["roleInfoVO.roleRemark"];

	checkMaxlen(obj,maxlen);

	return;
}

