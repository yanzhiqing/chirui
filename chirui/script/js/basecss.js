/** 
 *  Copyright:   Source Soft (C) 2002
 *  Updated by:  An Xifeng
 *  Description: A StyleSheet designed for NWPU Graduate School
 *  CodeDate:    2002-12-06
 */
mac=(navigator.appVersion.indexOf("Mac",0) != -1)?true:false;
ie=(navigator.appName.charAt(0) == "M")?true:false;

document.write("<style type='text/css'><!--")
if(mac){
    //For Macintosh IE NS
} else {
    if(ie){
    //For Windows IE
    document.write("body{background:#FFFFFF; font-family:Times, sans-serif, Arial; " +
                   ";line-height:125% ;color:#333333;}");
    document.write("td.title1{font-size:12px; background-color:#663399;");
    document.write("color:#FFFFFF;}");
    
    // in order to fix the size of font
    document.write("td{ font-family:Times, sans-serif, Arial; font-size:12px}");    
    // define the color of separators
    document.write("td.line1{background-color:#003399;}");
    
    // define the diverse attributes for td tags
    document.write("td.style1{font-size:12px; background-color:#F0F8FF; text-align:left;}");
    document.write("td.style2{font-size:12px; background-color:#FFFFFF; vertical-align:middle;}");
    document.write("td.style3{font-size:12px; background-color:#F0F8FF; vertical-align:middle; text-align:right;}");
	document.write("td.style4{font-size:12px; background-color:#FFFFFF; vertical-align:middle; text-align:left;}");
    document.write("td.style5{font-size:12px; background-color:#BFFBE4; vertical-align:middle;}");
    document.write("td.style6{font-size:12px; background-color:#F6F6F6}");
    document.write("td.style7{font-size:12px; background-color:#DDFFDD}");
    document.write("td.style8{font-size:12px; background-color:#663399}");
    document.write("td.style9{font-size:12px; background-color:#CCFFCC}");
    document.write("td.style10{font-size:12px; background-color:#FFFFEB}");
    document.write("td.style11{font-size:12px; background-color:#ECFBFF}");
	document.write("td.style12{font-size:12px; background-color:#F2F2F2}");
    document.write("td.style14{font-size:12px; background-color:#F0F8FF; vertical-align:middle;}");    
	document.write("td.style15{font-size:12px; background-color:#FFFFE8; text-align:left;}");
    document.write("td.style16{font-size:12px; background-color:#B7DBFF; text-align:left;}");

	document.write("td.indent1{font-size:12px; text-indent:1em;}");

    // deine the color for the number of total pages and individual page
	document.write("td.sum{font-size:12px; color:blue}");
    
    // define the color for span
    document.write("span.style1{font-size:12px; color:#FFFFFF}");
    document.write("span.style2{font-size:12px; color:#FF0000}");
	
    // define the color for font
    document.write("font.style1{font-size:12px; color:#FF6666}");
    document.write("font.style2{font-size:12px; color:#6666FF}");
    document.write("font.style3{font-size:12px; color:#999999}");
	// for pagenow
	document.write("font.style4{font-size:16px}");
    document.write("font.style5{font-size:12px; color:#FF0000}");
	
    // define the color for tr
    document.write("tr.style1{font-size:12px; background=#bffbe4}");
    document.write("tr.style2{font-size:12px; background=#663399}");
    
    // define the border colot of the outermost table
    document.write("table.style1{font-size:12px; border:1px solid #BFFBE4; background-color:#BFFBE4}");
    document.write("table.style2{font-size:12px; border:1px solid #FF6600; background-color:#FF6600}");
    
    //define the various color and font attributes for links
    document.write("a:link{color:blue; font-size:12px; text-decoration:none;}");
    document.write("a:visited{color:blue; font-size:12px; text-decoration:none;}");
    document.write("a:active{color:#ff0000; font-size:12px; text-decoration:none;}");
    document.write("a:hover{color:#000000; font-size:12px; text-decoration:none;}");    


    } else {
    //For Windows NS
    }
}
document.write("--></style>");


/**
  * start to define the global parameter for html
  */
// table is 529