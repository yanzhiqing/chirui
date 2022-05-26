/*
==模块功能：角色信息的公共javascript
==作者：李永祥
==时间：2006-08-25
*/

/*===================================================
功能：使【角色编码（roleInfoVO.roleId）】输入框只能输入数据
输入：
输出：
===================================================*/
function checkRoleId() {
	var num = document.all["roleInfoVO.roleId"];

	checkNum(num);

	return;
}


/*===================================================
功能：使【备注（roleInfoVO.roleRemark）】输入框只能输入
      最大长度为maxlen的信息
输入： 
输出：
===================================================*/
function checkRoleRemark() {
	var maxlen = 150;
	var obj = document.all["roleInfoVO.roleRemark"];

	checkMaxlen(obj,maxlen);

	return;
}

