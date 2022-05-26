//trim spaces with regular expression
String.prototype.trim = function()
{
	return this.replace(/(^\s*)|(\s*$)/g, "");
}

//Count string byte number, return integer
String.prototype.ByteCount = function()
{
	txt = this.replace(/(<.*?>)/ig,"");
	txt = txt.replace(/([\u0391-\uFFE5])/ig, "11");
	var count = txt.length;
	return count;
}

//filter keywords
function check_durty_words(thisinput)
{
	var durty_words = new Array("ϵͳ","����","��Ե","master","����","�ͷ�","root","�佱","�","��ʾ","�ҽ�","֪ͨ");
	for(i=0;i<durty_words.length;i++)
	{
		if (thisinput.indexOf(durty_words[i])	>=	0)
		{
			return durty_words[i];
		}
	}
	return false;
}
//Check submit form error
function chkForm_new(objForm){
	var objForm;
	
	var telnumber	   = objForm.telnumber.value;
	var phonenumber = objForm.phonenumber.value;

 	

   if (phonenumber.length!=11)
	{
	    alert("���ֻ����롿����Ϊ�ջ��ʽ�����Ϲ淶\n");
		objForm.phonenumber.focus();
		return false;
	}

	return true;
}