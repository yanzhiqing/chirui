/*
==模块功能：机构管理的公共javascript
==作者：李永祥
==时间：2006-08-25
*/



/*===================================================
功能：使【机构编码（departmentVO.depId）】输入框只能输入数据
输入：
输出：
===================================================*/
function checkDepId() {
	var num = document.all["departmentVO.depId"];

	checkNum(num);

	return;
}



/*===================================================
功能：使【联系电话（departmentVO.depPhone）】输入框只能输入电话格式的字符
输入：
输出：
===================================================*/
function checkDepPhone() {
	var phone = document.all["departmentVO.depPhone"];

	checkPhone(phone);

	return;
}

/*===================================================
功能：使【备注（departmentVO.depRemark）】输入框只能输入最大长度为maxlen的信息
输入： 
输出：
===================================================*/
function checkDepRemark() {
	var maxlen = 150;
	var obj = document.all["departmentVO.depRemark"];

	checkMaxlen(obj,maxlen);

	return;
}