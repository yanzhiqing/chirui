/**

 * 分页函数

 * pno--页数

 * psize--每页显示记录数

 * 分页部分是从真实数据行开始，因而存在加减某个常数，以确定真正的记录数

 * 纯js分页实质是数据行全部加载，通过是否显示属性完成分页功能

 **/

function goPage(pno,psize){

	var itable = document.getElementById("idData");
	var num = itable.rows.length;//表格行数
	var totalPage = 0;//总页数
	var pageSize = psize;//每页显示行数
	if((num-1)/pageSize > parseInt((num-1)/pageSize)){   
   		totalPage=parseInt((num-1)/pageSize)+1;   
   	}else{   
   		totalPage=parseInt((num-1)/pageSize);   
   	}   

	var currentPage = pno;//当前页数
	var startRow = (currentPage - 1) * pageSize+1;//开始显示的行   
   	var endRow = currentPage * pageSize+1;//结束显示的行   
   	endRow = (endRow > num)? num : endRow;
	//前三行始终显示
	for(i=0;i<1;i++){
		var irow = itable.rows[i];
		irow.style.display = "block";
	}

	

	for(var i=1;i<num;i++){
		var irow = itable.rows[i];
		if(i>=startRow&&i<endRow){
			irow.style.display = "block";	
		}else{
			irow.style.display = "none";
		}

	}
	var pageEnd = document.getElementById("pageEnd");
	var tempStr = "共"+(num-1)+"条记录 分"+totalPage+"页 当前第"+currentPage+"页";
	//var tempStr = "";
	if(currentPage>1){
		tempStr += "<a href=\"#\" onClick=\"goPage("+(1)+","+psize+")\">首 页</a>&nbsp;&nbsp;";
	}else{
		tempStr += "首 页&nbsp;&nbsp;";
	}
	if(currentPage>1){
		tempStr += "<a href=\"#\" onClick=\"goPage("+(currentPage-1)+","+psize+")\">上一页</a>&nbsp;&nbsp;"
	}else{
		tempStr += "上一页</li>&nbsp;&nbsp;";	

	}
	if(currentPage<totalPage){
		tempStr += "<a href=\"#\" onClick=\"goPage("+(currentPage+1)+","+psize+")\">下一页</a>&nbsp;&nbsp;";
	}else{
		tempStr += "下一页</li>&nbsp;&nbsp;";	
	}
	if(currentPage<totalPage){
		tempStr += "<a href=\"#\" onClick=\"goPage("+(totalPage)+","+psize+")\">尾 页</a>&nbsp;&nbsp;";
	}else{
		tempStr += "尾 页</li></ul>&nbsp;&nbsp;";
	}

	document.getElementById("pagelist").innerHTML = tempStr;

	

}

