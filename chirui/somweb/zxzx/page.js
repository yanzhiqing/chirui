/**

 * ��ҳ����

 * pno--ҳ��

 * psize--ÿҳ��ʾ��¼��

 * ��ҳ�����Ǵ���ʵ�����п�ʼ��������ڼӼ�ĳ����������ȷ�������ļ�¼��

 * ��js��ҳʵ����������ȫ�����أ�ͨ���Ƿ���ʾ������ɷ�ҳ����

 **/

function goPage(pno,psize){

	var itable = document.getElementById("idData");
	var num = itable.rows.length;//�������
	var totalPage = 0;//��ҳ��
	var pageSize = psize;//ÿҳ��ʾ����
	if((num-1)/pageSize > parseInt((num-1)/pageSize)){   
   		totalPage=parseInt((num-1)/pageSize)+1;   
   	}else{   
   		totalPage=parseInt((num-1)/pageSize);   
   	}   

	var currentPage = pno;//��ǰҳ��
	var startRow = (currentPage - 1) * pageSize+1;//��ʼ��ʾ����   
   	var endRow = currentPage * pageSize+1;//������ʾ����   
   	endRow = (endRow > num)? num : endRow;
	//ǰ����ʼ����ʾ
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
	var tempStr = "��"+(num-1)+"����¼ ��"+totalPage+"ҳ ��ǰ��"+currentPage+"ҳ";
	//var tempStr = "";
	if(currentPage>1){
		tempStr += "<a href=\"#\" onClick=\"goPage("+(1)+","+psize+")\">�� ҳ</a>&nbsp;&nbsp;";
	}else{
		tempStr += "�� ҳ&nbsp;&nbsp;";
	}
	if(currentPage>1){
		tempStr += "<a href=\"#\" onClick=\"goPage("+(currentPage-1)+","+psize+")\">��һҳ</a>&nbsp;&nbsp;"
	}else{
		tempStr += "��һҳ</li>&nbsp;&nbsp;";	

	}
	if(currentPage<totalPage){
		tempStr += "<a href=\"#\" onClick=\"goPage("+(currentPage+1)+","+psize+")\">��һҳ</a>&nbsp;&nbsp;";
	}else{
		tempStr += "��һҳ</li>&nbsp;&nbsp;";	
	}
	if(currentPage<totalPage){
		tempStr += "<a href=\"#\" onClick=\"goPage("+(totalPage)+","+psize+")\">β ҳ</a>&nbsp;&nbsp;";
	}else{
		tempStr += "β ҳ</li></ul>&nbsp;&nbsp;";
	}

	document.getElementById("pagelist").innerHTML = tempStr;

	

}

