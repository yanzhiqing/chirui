<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.regex.*"%>
<%@ page import="crjd.common.upload.*"%> 
<%@ page import="net.fairy.edit.RemotePic"%>
<jsp:useBean id="date" scope="page" class="net.fairy.edit.TimeStamp"/>
<%@ page import="net.fairy.edit.UploadWebHelper,net.fairy.edit.UploadBean"%>
<%@ page import="crjd.common.Resource_Upload"%>	

<%!
// ��������
String sType, sStyleName;
//' ���ñ���
String sAllowExt, sUploadDir,sBaseUrl,sContentPath;
int  nAllowSize;
//' �ӿڱ���
String sFileExt,sSaveFileName,sOriginalFileName,sPathFileName,FileName, nFileNum;
String sAction;
Connection connect = null;
%>
<%!
/*' ============================================
' ȥ��Html��ʽ�����ڴ����ݿ���ȡ��ֵ���������ʱ
' ע�⣺value="?"���һ��Ҫ��˫����
' ============================================*/
public String inHTML(String str)
{
	String sTemp;
	sTemp = str;
	if(sTemp.equals(""))
	{
		System.exit(0);
	}
	sTemp = sTemp.replaceAll("&", "&amp;");
	sTemp = sTemp.replaceAll("<", "&lt;");
	sTemp = sTemp.replaceAll(">", "&gt;");
	sTemp = sTemp.replaceAll("\"", "&quot;");
    sTemp = sTemp.replaceAll("'", "&nbsp;");
	return sTemp;
}
//��ʼ���ϴ���������
public void InitUpload(String realpath) throws Exception{
      System.out.println("realpath=="+realpath);
	UploadWebHelper uw = new UploadWebHelper();
	uw.filename = realpath+"WEB-INF/Style.xml";
	uw.getInstance();
	UploadBean bean = uw.InitPara();
	try{

		//sUploadDir = bean.getSuploaddir();
        //System.out.println(sUploadDir);
		  Calendar calendar = Calendar.getInstance();

		//�˴������ϴ��ļ�����·��,ע��·��Ҫ��ROOT��ʼ=========================
		//�޸Ĵ˴����޸�WEB-INF/Style.xml�ļ���Ӧ��<suploaddir>/UploadFile/</suploaddir>=========
		//�޸Ĵ˴����޸�eWebEditor.jsp�ļ���Ӧ��=========www.ITstudy.cn=========
		String sUploadFilePath="/uploadimg/tupian/";
		sUploadDir =realpath+ sUploadFilePath +calendar.get(Calendar.YEAR) + "/"+ (calendar.get(Calendar.MONTH)+1) + "/" + calendar.get(Calendar.DAY_OF_MONTH) + "/";

			 //sUploadDir = realpath+"articlemanage/article/";

				//sUploadDir = bean.getSuploaddir();
				//sUploadDir = realpatha;
				//System.out.println(sUploadDir);
        System.out.println("sUploadDir33333=="+sUploadDir);
		if(sType.equalsIgnoreCase("remote"))
		{
			sAllowExt =  bean.getSremoteext();
                        sAllowExt = sAllowExt + "|" + sAllowExt.toUpperCase();
			nAllowSize =  Integer.parseInt(bean.getSremotesize()) ;
                        System.out.println(sAllowExt+nAllowSize);
		}
                else if(sType.equalsIgnoreCase("file"))
               {
			sAllowExt = bean.getSfileext();
                        sAllowExt = sAllowExt + "|" + sAllowExt.toUpperCase();
			nAllowSize = Integer.parseInt(bean.getSfilesize());
                        System.out.println(sAllowExt+nAllowSize);
               }
               else if(sType.equalsIgnoreCase("media"))
		{
			sAllowExt =  bean.getSmediaext();
                        sAllowExt = sAllowExt + "|" + sAllowExt.toUpperCase();
			nAllowSize = Integer.parseInt(bean.getSmediasize());
                        System.out.println(sAllowExt+nAllowSize);
		}
                else if(sType.equalsIgnoreCase("flash"))
                {
			sAllowExt =  bean.getSflashext();
                        sAllowExt = sAllowExt + "|" + sAllowExt.toUpperCase();
			nAllowSize = Integer.parseInt(bean.getSflashsize());
                        System.out.println(sAllowExt+nAllowSize);
                }
		else
                {
			sAllowExt =  bean.getSimageext();
                        sAllowExt = sAllowExt + "|" + sAllowExt.toUpperCase();
			nAllowSize = Integer.parseInt(bean.getSimagesize());
                        System.out.println(sAllowExt+nAllowSize);
                }
	}
	catch(Exception e){
        }
}
%>
<%
//��������
sType=request.getParameter("type");
if(sType==null)
{
sType="image";
}
else
sType=request.getParameter("type").trim();
//������ʽ
sStyleName=request.getParameter("style");
if (sStyleName==null)
{
  sStyleName="standard";
}
else
sStyleName=request.getParameter("style").trim();
//���ö���
sAction=request.getParameter("action");
if(sAction==null)
{
  sAction="sun";
}
else
sAction=request.getParameter("action").trim();
%>
<%
//��ʼ���ϴ�����
try{
InitUpload(config.getServletContext().getRealPath("/"));
}catch(Exception e){
  e.printStackTrace();
}
//�Ͽ����ݿ�����
//sAction = UCase(Trim(Request.QueryString("action"))
if(sAction.equalsIgnoreCase("remote"))
{    //Զ���Զ���ȡ
	String sContent;
		String RemoteFileurl=null;
	String Protocol,sUrl;
	int Port;
	String LocalFileurl=null;
	String SrcFileurl=null;
	String SaveFileName=null;
	sContent=request.getParameter("eWebEditor_UploadText");
    if(sContent==null)
	{
		sContent="sunshanfeng";
	}
	else
		sContent=new String(request.getParameter("eWebEditor_UploadText").getBytes("GBK"));

    System.out.println("�滻ǰ��html���Ϊ:"+"\n"+sContent);
	if(sAllowExt!="")
	{
	Pattern pRemoteFileurl = Pattern.compile("((http|https|ftp|rtsp|mms):(//|\\\\){1}(([A-Za-z0-9_-])+[.]){1,}(net|com|cn|org|cc|tv|[0-9]{1,3})(\\S*/)((\\S)+[.]{1}("+sAllowExt+")))");//ȡ����ҳ��URL��������ʽ
    Matcher mRemoteFileurl = pRemoteFileurl.matcher(sContent);//�Դ�����ַ�������ƥ��
	Protocol=request.getProtocol();//ȡ��ͨѶ��Э��
	String ProtocolA[]=Protocol.split("/");//ȡ��Э��ǰ�����ĸ����HTTP/1.1,��Ϊ"HTTP","1.1"
	sUrl = ProtocolA[0]+"://"+request.getServerName();//ȡ�ñ���URL·��,��http://localhost
	//ProtocolA[]=null;
	Port=request.getServerPort();//ȡ�ö˿�ֵ
	if(Port!=80)
	{//�鿴�˿��Ƿ�Ϊ80��������ǻ���Ҫ�������ϼ��϶˿�
	out.println("p===");
     sUrl=sUrl+":"+Port;
     System.out.println("ccccc");
	}
	String context=request.getContextPath();
	System.out.println("context==="+context);
	sUrl=sUrl+context+"/"+sUploadDir;
	System.out.println("sUrl====="+sUrl);
	StringBuffer sb=new StringBuffer();
	boolean result=mRemoteFileurl.find();
	int i=0;

       while(result)
			{

             i++;
             RemoteFileurl=mRemoteFileurl.group(0);
			 System.out.println();
			 System.out.println();
			 System.out.println();
			 System.out.println();
			 System.out.println("��Ҫ�滻��Զ�����ӣ�"+"\n"+RemoteFileurl);
			 sOriginalFileName=RemoteFileurl.substring(RemoteFileurl.lastIndexOf("/"));
			 Pattern pFileType=Pattern.compile("[.]{1}("+sAllowExt+")");//����ƥ��ȡ���ļ�������
			 Matcher mFileType=pFileType.matcher(RemoteFileurl);
			 while(mFileType.find())
				{
				 String SaveFileType=mFileType.group();
				 LocalFileurl=sUploadDir+(String)date.Time_Stamp()+i+SaveFileType;//�ļ���·������ʱ�������
				}

			   String LoadFile=sUploadDir.substring(0,sUploadDir.length()-1);	SaveFileName=config.getServletContext().getRealPath("/")+LoadFile+"\\"+LocalFileurl.substring(LocalFileurl.lastIndexOf("/")+1);
			   System.out.println();
			   System.out.println();
			   System.out.println();
				System.out.println("Զ���ļ������·�����ļ�����"+"\n"+SaveFileName);
                sSaveFileName=LocalFileurl.substring(LocalFileurl.lastIndexOf("/"));
                RemotePic Down=new RemotePic();
				Down.picurl=RemoteFileurl;
				Down.savepath=SaveFileName;
                                try{
             if (Down.download())//������ر���ɹ��������html�������ļ�·��
				{
				 mRemoteFileurl.appendReplacement(sb,LocalFileurl);//�滻·��
				}}catch(Exception ex){
                                ex.printStackTrace();
                                }
             result=mRemoteFileurl.find();
			}
			mRemoteFileurl.appendTail(sb);
		sContent=sb.toString();
	}
	sContent=inHTML(sContent);
	System.out.println();
	System.out.println();
	System.out.println();
	System.out.print("�滻���html���:"+"\n"+sContent);
	out.println("<HTML><HEAD><TITLE>Զ���ϴ�</TITLE><meta http-equiv='Content-Type' content='text/html; charset=gb2312'></head><body>");
	out.print("<input type=hidden id=UploadText value=\"");
	out.print(sContent);
	out.println("\">");
	out.println("</body></html>");
	out.println("<script language=javascript>");
	out.print("parent.setHTML(UploadText.value);try{parent.addUploadFile('");//Ϊʲôֻȡһ���ֵ����ֻȡ������ҳ����λ��֮ǰ��ֵ��
	out.print(sOriginalFileName);
	out.print("', '");
	out.print(sSaveFileName);
	out.print("', '");
	out.print(SaveFileName);
	out.println("');} catch(e){} parent.remoteUploadOK();");
	out.println("</script>");

  //DoRemote();
}
else if(sAction.equalsIgnoreCase("save"))
{
   
  //��ʾ�ϴ��˵�
 out.println("<HTML>");
        out.println("<HEAD>");
        out.println("<TITLE>�ļ��ϴ�</TITLE>");
        out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\">");
        out.println("<style type=\"text/css\">");
        out.println("body, a, table, div, span, td, th, input, select{font:9pt;font-family: \"����\", Verdana, Arial, Helvetica, sans-serif;}");
        out.println("body {padding:0px;margin:0px}");
        out.println("</style>");
        out.println("<script language=\"JavaScript\" src=\"dialog/dialog.js\">");
        out.println("</script>");
        out.println("</head>");
        out.println("<body bgcolor=menu>");
        out.print("<form action=\"?action=save&type=");//ע��˴�Ϊʲô����println()
        out.print(sType);
        out.print("&style=");
        out.print(sStyleName);
        out.println("\" method=post name=myform enctype=\"multipart/form-data\">");
        out.println("<input type=file name=uploadfile size=1 style=\"width:100%\" onchange=\"originalfile.value=this.value\">");
        out.println("<input type=hidden name=originalfile value=\"\">");
        out.println("</form>");
        out.println("<script language=javascript>");
        out.print("var sAllowExt = \"");
        out.print(sAllowExt);
        out.println("\";");
        out.println("// ����ϴ���");
        out.println("function CheckUploadForm() {");
        out.println("if (!IsExt(document.myform.uploadfile.value,sAllowExt)){");
        out.println("parent.UploadError(\"��ʾ��\\n\\n��ѡ��һ����Ч���ļ���\\n֧�ֵĸ�ʽ�У�\"+sAllowExt+\"����\");");
        out.println("return false;");
        out.println("}");
        out.println("return true");
        out.println("}");
        out.println("// �ύ�¼��������");
        out.println("var oForm = document.myform;");
        out.println("oForm.attachEvent(\"onsubmit\", CheckUploadForm) ;");
        out.println("if (! oForm.submitUpload) oForm.submitUpload = new Array() ;");
        out.println("oForm.submitUpload[oForm.submitUpload.length] = CheckUploadForm ;");
        out.println("if (! oForm.originalSubmit) {");
        out.println("oForm.originalSubmit = oForm.submit ;");
        out.println("oForm.submit = function() {");
        out.println("if (this.submitUpload) {");
        out.println("for (var i = 0 ; i < this.submitUpload.length ; i++) {");
        out.println("this.submitUpload[i]() ;");
        out.println("			}");
        out.println("		}");
        out.println("		this.originalSubmit() ;");
        out.println("	}");
        out.println("}");
        out.println("// �ϴ�����װ�����");
        out.println("try {");
        out.println("	parent.UploadLoaded();");
        out.println("}");
        out.println("catch(e){");
        out.println("}");
        out.println("</script>");
        out.println("</body>");
        out.println("</html>");
  //���ļ�
  //DoSave();
    SmartUpload up = new SmartUpload();
   //��ʼ���ϴ����
     up.initialize(pageContext);
   //�����ϴ��ļ���С
     up.setMaxFileSize(nAllowSize*10240);
   //�����ϴ��ļ�����
     String setExt=sAllowExt.replace('|',',');
     up.setAllowedFilesList(setExt);

	// Upload
        try {
          up.upload();


          // Select each file
          for (int i=0;i<up.getFiles().getCount();i++){
            // Retreive the current file
            crjd.common.upload.File myFile = up.getFiles().getFile(i);
            if (!myFile.isMissing()) {
              //������ļ�id��������ļ���
              FileName=(String)date.Time_Stamp();
              //����ϴ����ļ���
              sOriginalFileName=myFile.getFileName();
              
              myFile.saveAs("/"+sUploadDir+FileName+"."+myFile.getFileExt());
              
              sSaveFileName=FileName+"."+myFile.getFileExt();
              
              sPathFileName=sUploadDir+sSaveFileName;
             Calendar calendar = Calendar.getInstance();
             //�ϴ����ļ�·��
             String  sUploadFilePath="/uploadimg/tupian/" +calendar.get(Calendar.YEAR) + "/"+ (calendar.get(Calendar.MONTH)+1) + "/" + calendar.get(Calendar.DAY_OF_MONTH) + "/"+sSaveFileName;
              
                //��ӱ������ݿ�
              	Resource_Upload  upload = new Resource_Upload(application);
              	//FileName ������ļ�id ������ϴ����ļ������ϴ��ļ���·����
                upload.WriteImgInDB(FileName,sOriginalFileName,sUploadFilePath);
                String sessionFileName=(String)session.getAttribute("FileName");
                if(!"".equals(sessionFileName)&&!"null".equals(sessionFileName)){
                    sessionFileName=FileName+","+sessionFileName;
                    session.setAttribute("FileName",sessionFileName);
                }else{
                  session.setAttribute("FileName",FileName);
                }
               
                
            }
          }
        }
        catch (Exception ex) {
          ex.printStackTrace();
        }
   out.println("<script language=javascript>");
	out.print("parent.UploadSaved('");
	out.print(sSaveFileName);
	out.print("');var obj=parent.dialogArguments.dialogArguments;if (!obj) obj=parent.dialogArguments;try{obj.addUploadFile('");
	out.print(sOriginalFileName);
	out.print("', '");
	out.print(sSaveFileName);
	out.print("', '");
	out.print(sPathFileName);
	out.print("');} catch(e){}");
	out.println(";history.back()</script>");
	%>
	
<%
  }
   else
{
  //��ʾ�ϴ���
         out.println("<HTML>");
        out.println("<HEAD>");
        out.println("<TITLE>�ļ��ϴ�</TITLE>");
        out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\">");
        out.println("<style type=\"text/css\">");
        out.println("body, a, table, div, span, td, th, input, select{font:9pt;font-family: \"����\", Verdana, Arial, Helvetica, sans-serif;}");
        out.println("body {padding:0px;margin:0px}");
        out.println("</style>");
        out.println("<script language=\"JavaScript\" src=\"dialog/dialog.js\">");
        out.println("</script>");
        out.println("</head>");
        out.println("<body bgcolor=menu>");
        out.print("<form action=\"?action=save&type=");
        out.print(sType);
        out.print("&style=");
        out.print(sStyleName);
        out.println("\" method=post name=myform enctype=\"multipart/form-data\">");
        out.println("<input type=file name=uploadfile size=1 style=\"width:100%\" onchange=\"originalfile.value=this.value\">");
        out.println("<input type=hidden name=originalfile value=\"\">");
        out.println("</form>");
        out.println("<script language=javascript>");
        out.print("var sAllowExt = \"");
        out.print(sAllowExt);
        out.println("\";");
        out.println("// ����ϴ���");
        out.println("function CheckUploadForm() {");
        out.println("	if (!IsExt(document.myform.uploadfile.value,sAllowExt)){");
        out.println("		parent.UploadError(\"��ʾ��\\n\\n��ѡ��һ����Ч���ļ���\\n֧�ֵĸ�ʽ�У�\"+sAllowExt+\"����\");");
        out.println("		return false;");
        out.println("	}");
        out.println("	return true");
        out.println("}");
        out.println("// �ύ�¼��������");
        out.println("var oForm = document.myform ;");
        out.println("oForm.attachEvent(\"onsubmit\", CheckUploadForm) ;");
        out.println("if (! oForm.submitUpload) oForm.submitUpload = new Array() ;");
        out.println("oForm.submitUpload[oForm.submitUpload.length] = CheckUploadForm ;");
        out.println("if (! oForm.originalSubmit) {");
        out.println("	oForm.originalSubmit = oForm.submit ;");
        out.println("	oForm.submit = function() {");
        out.println("		if (this.submitUpload) {");
        out.println("			for (var i = 0 ; i < this.submitUpload.length ; i++) {");
        out.println("				this.submitUpload[i]() ;");
        out.println("			}");
        out.println("		}");
        out.println("		this.originalSubmit() ;");
        out.println("	}");
        out.println("}");
        out.println("// �ϴ�����װ�����");
        out.println("try {");
        out.println("	parent.UploadLoaded();");
        out.println("}");
        out.println("catch(e){");
        out.println("}");
        out.println("</script>");
        out.println("</body>");
        out.println("</html>");
        //out.println("123");

}
%>


