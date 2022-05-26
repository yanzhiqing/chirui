<%@ page contentType="text/html; charset=GBK"%>



<Script language="javaScript">



function RZdel(){
    var num = 0;
	
	for(var i=0;i<document.all["keys"].length;i++){
		if(document.all["keys"][i].checked==true){
			num++;
		}
	}

	//当长度大于1时 keys 是一个数组，等于1是keys不是数组
	if(num==0 && document.all["keys"].checked==true) {
		num++;
	}

	if(num==0){
	    alert("删除时必须选中一个!");
		return false;
	}
	else {
	    if(confirm("你真的要删除吗？")) {
		    document.all["actionType"].value="8";
			document.forms[0].submit();
			
            return true;
		}
		else {
		    return false;
		}
	}
}


        function RZquery(){
        	document.all["actionType"].value="7";
                //document.forms[0].submit();
        }



        function RZchose(){
    		if(document.all["keys"].length > 0){
                      	if(document.all["delkeys"].checked==true){
       				for(i=0;i<document.all["keys"].length;i++){
         				document.all["keys"][i].checked=true;
       				}
                      	}else{
       				for(i=0;i<document.all["keys"].length;i++){
         				document.all["keys"][i].checked=false;
       				}
                      	}
    		}else{
                      	if(document.all["delkeys"].checked==true){
         				document.all["keys"].checked=true;
                      	}else{
         				document.all["keys"].checked=false;
                      	}
    		}
        }

</script>


