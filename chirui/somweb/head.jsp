<%@ page contentType="text/html; charset=utf-8" %>
<link rel="stylesheet" rev="stylesheet" href="<%=request.getContextPath()%>/css/home/style.css"  type="text/css" media="all" /> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>西安驰瑞机电设备有限公司</title>
<script type="text/javascript"> 
function displaySubMenu(li) { 
	var subMenu = li.getElementsByTagName("ul")[0]; 
	subMenu.style.display = "block"; 
} 
function hideSubMenu(li) { 
	var subMenu = li.getElementsByTagName("ul")[0]; 
	subMenu.style.display = "none"; 
}

<script type="text/javascript">
function AddFavorite(sURL, sTitle)
{
    try
    {
        window.external.addFavorite(sURL, sTitle);
    }
    catch (e)
    {
        try
        {
            window.sidebar.addPanel(sTitle, sURL, "");
        }
        catch (e)
        {
            alert("加入收藏失败，请使用Ctrl+D进行添加");
        }
    }
}
//设为首页 <a onclick="SetHome(this,window.location)">设为首页</a>
function SetHome(obj,vrl){
        try{
                obj.style.behavior='url(#default#homepage)';obj.setHomePage(vrl);
        }
        catch(e){
                if(window.netscape) {
                        try {
                                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
                        }
                        catch (e) {
                                alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。");
                        }
                        var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
                        prefs.setCharPref('browser.startup.homepage',vrl);
                 }
        }
}
</script>
</script> 
<!-- Title begin -->
<div class="header">
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0 auto; text-align:center" >
      <tr>
        <td  >&nbsp;</td>
        <td  width="652" >
		            <img src="<%=request.getContextPath()%>/images/home/logo.jpg" width="652" height="128" />     	
        </td>
        <td >&nbsp;</td>
        <td width="200">
        <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td colspan="2" width="100%" height="45" align="right">
            </td>
          </tr>         	
          <tr>
            <td colspan="2" width="100%" height="28">
             	<div style="position:relative;top:5px;left:0px;width:200;height:70%;background:none;text-align:right"><a href="javascript:window.external.AddFavorite('http://www.cnchirui.com','西安驰瑞机电设备有限公司')" >加&nbsp;入&nbsp;收&nbsp;藏&nbsp;&nbsp;</a>&nbsp;&nbsp;
            	|&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">ENGLISH&nbsp;&nbsp;&nbsp;&nbsp;</a>            	</div>
            </td>
          </tr>
        </table>
        </td>
      </tr>
    </table>
</div>
<!-- Title end -->

<!-- nav -->
<div id="navigationbg">
<ul id="navigation" > 
<li style="margin-left:80px" onmouseover="displaySubMenu(this)" onmouseout="hideSubMenu(this)"> 
<a href="<%=request.getContextPath()%>/somweb/index.jsp">首页</a> 
</li> 
<li ><img src="<%=request.getContextPath()%>/images/home/menuline.jpg" /></li>
<li onmouseover="displaySubMenu(this)" onmouseout="hideSubMenu(this)"> 
<a href="<%=request.getContextPath()%>/somweb/gsgk/gsjj.jsp">公司概况</a> 
<ul> 
<li><a href="<%=request.getContextPath()%>/somweb/gsgk/gsjj.jsp">公司简介</a></li> 
<li><a href="<%=request.getContextPath()%>/somweb/gsgk/qywh.jsp">企业文化</a></li> 
</ul> 
</li>
<li ><img src="<%=request.getContextPath()%>/images/home/menuline.jpg" /></li>
<li onmouseover="displaySubMenu(this)" onmouseout="hideSubMenu(this)"> 
<a href="<%=request.getContextPath()%>/somweb/zxzx/gsxw.jsp" >资讯中心</a> 
<ul> 
<li><a href="<%=request.getContextPath()%>/somweb/zxzx/gsxw.jsp">公司新闻</a></li> 
<li><a href="<%=request.getContextPath()%>/somweb/zxzx/hydt.jsp">行业信息</a></li> 
</ul> 
</li>
<li ><img src="<%=request.getContextPath()%>/images/home/menuline.jpg" /></li>
<li onmouseover="displaySubMenu(this)" onmouseout="hideSubMenu(this)"> 
<a href="<%=request.getContextPath()%>/somweb/cpzs/cpzs.jsp">产品展示</a> 
<ul> 
<li><a  href="<%=request.getContextPath()%>/somweb/cpzs/cameron.jsp">卡麦隆全焊接球阀</a></li> 
<li><a  href="<%=request.getContextPath()%>/somweb/cpzs/orbit.jsp">欧比特轨道球阀</a></li>
<li><a  href="<%=request.getContextPath()%>/somweb/cpzs/grove.jsp">格罗夫球阀及闸阀</a></li> 
<li><a  href="<%=request.getContextPath()%>/somweb/cpzs/general.jsp">将军轨道旋塞阀</a></li>
<li><a  href="<%=request.getContextPath()%>/somweb/cpzs/tbv.jsp">低温及仪表阀</a></li>
<li><a  href="<%=request.getContextPath()%>/somweb/cpzs/sst.jsp">金属密封球阀</a></li> 
<li><a  href="<%=request.getContextPath()%>/somweb/cpzs/mypts.jsp">麦普兹电子开关</a></li>
<!--  
<li><a  href="<%=request.getContextPath()%>/somweb/cpzs/cdc.jsp">CDC爆破片</a></li>
<li><a  href="<%=request.getContextPath()%>/somweb/cpzs/groth.jsp">格鲁斯呼吸阀</a></li>
-->
<li><a  href="<%=request.getContextPath()%>/somweb/cpzs/sonTech.jsp">Som-Tek</a></li>
</ul> 
</li>
<li ><img src="<%=request.getContextPath()%>/images/home/menuline.jpg" /></li>
<li onmouseover="displaySubMenu(this)" onmouseout="hideSubMenu(this)"> 
<a href="<%=request.getContextPath()%>/somweb/cpzs/service.jsp">4S服务</a> 
<!-- 
<ul>
<li><a href="#">产品咨询</a></li>
<li><a href="#">检修维护</a>
	<ul> 
		<li><a href="#">检修业务</a></li>
		<li><a href="#">典型案例</a></li> 
		
	</ul> 
</li> 
<li><a href="#">备件供应</a></li> 
</ul>
 --> 
</li>
<!--<li><img src="<%=request.getContextPath()%>/images/home/menuline.jpg" /></li>
<li onmouseover="displaySubMenu(this)" onmouseout="hideSubMenu(this)"> 
<a href="<%=request.getContextPath()%>/somweb/rczp/rczp.jsp" >人才招聘</a> 
</li>
-->
<li ><img src="<%=request.getContextPath()%>/images/home/menuline.jpg" /></li>
<li onmouseover="displaySubMenu(this)" onmouseout="hideSubMenu(this)"> 
<a href="<%=request.getContextPath()%>/somweb/lxwm/lxwm.jsp" >联系我们</a> 
</li>
</ul> 
</div>
<!-- nav end -->