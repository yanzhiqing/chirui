//<!-- 
var g_selProvince; 
var g_selCity; 
var Provinces=new Array( 
new Array("110000","����"),    
new Array("120000","���"), 
new Array("310000","�Ϻ�"),
new Array("500000","����"),
new Array("610000","����"),    
new Array("130000","�ӱ�"), 
new Array("140000","ɽ��"), 
new Array("150000","���ɹ�"), 
new Array("210000","����"), 
new Array("220000","����"), 
new Array("230000","������"),  
new Array("320000","����"), 
new Array("330000","�㽭"), 
new Array("340000","����"), 
new Array("350000","����"), 
new Array("360000","����"), 
new Array("370000","ɽ��"), 
new Array("410000","����"), 
new Array("420000","����"), 
new Array("430000","����"), 
new Array("440000","�㶫"), 
new Array("450000","����"), 
new Array("460000","����"), 
new Array("510000","�Ĵ�"), 
new Array("520000","����"), 
new Array("530000","����"), 
new Array("540000","����"), 
new Array("620000","����"), 
new Array("630000","�ຣ"), 
new Array("640000","����"), 
new Array("650000","�½�"), 
new Array("710000","̨��"), 
new Array("810000","���"), 
new Array("820000","����") 
); 

var Citys=new Array( 
new Array("110101","����"), 
new Array("110102","����"), 
new Array("110103","����"), 
new Array("110104","����"), 
new Array("110105","����"), 
new Array("110106","��̨"), 
new Array("110107","ʯ��ɽ"), 
new Array("110108","����"), 
new Array("110109","��ͷ��"), 
new Array("110111","��ɽ"), 
new Array("110112","ͨ��"), 
new Array("110113","˳��"), 
new Array("110114","��ƽ"), 
new Array("110115","����"), 
new Array("110116","����"), 
new Array("110117","ƽ��"), 
new Array("110228","����"), 
new Array("110229","����"), 
new Array("120101","��ƽ"),
new Array("120102","�Ӷ�"),
new Array("120103","����"),
new Array("120104","�Ͽ�"),
new Array("120105","�ӱ�"),
new Array("120106","����"),
new Array("120107","����"),
new Array("120108","����"),
new Array("120109","���"),
new Array("120110","����"),
new Array("120111","����"),
new Array("120112","����"),
new Array("120113","����"),
new Array("120114","����"),
new Array("120115","����"),
new Array("120221","����"),
new Array("120223","����"),
new Array("120225","����"), 
new Array("130101","ʯ��ׯ"), 
new Array("130201","��ɽ"), 
new Array("130301","�ػʵ�"), 
new Array("130701","�żҿ�"), 
new Array("130801","�е�"), 
new Array("131001","�ȷ�"), 
new Array("130401","����"), 
new Array("130501","��̨"), 
new Array("130601","����"), 
new Array("130901","����"), 
new Array("133001","��ˮ"), 
new Array("140101","̫ԭ"), 
new Array("140201","��ͬ"), 
new Array("140301","��Ȫ"), 
new Array("140501","����"), 
new Array("140601","˷��"), 
new Array("142201","����"), 
new Array("142331","��ʯ"), 
new Array("142401","�ܴ�"), 
new Array("142601","�ٷ�"), 
new Array("142701","�˳�"), 
new Array("140401","����"), 
new Array("150101","���ͺ���"), 
new Array("150201","��ͷ"), 
new Array("150301","�ں�"), 
new Array("152601","����"), 
new Array("152701","��ʤ"), 
new Array("152801","�ٺ�"), 
new Array("152921","����������"), 
new Array("150401","���"), 
new Array("152301","ͨ��"), 
new Array("152502","���ֺ���"), 
new Array("152101","������"), 
new Array("152201","��������"), 
new Array("210101","����"), 
new Array("210201","����"), 
new Array("210301","��ɽ"), 
new Array("210401","��˳"), 
new Array("210501","��Ϫ"), 
new Array("210701","����"), 
new Array("210801","Ӫ��"), 
new Array("210901","����"), 
new Array("211101","�̽�"), 
new Array("211201","����"), 
new Array("211301","����"), 
new Array("211401","����"), 
new Array("210601","����"), 
new Array("220101","����"), 
new Array("220201","����"), 
new Array("220301","��ƽ"), 
new Array("220401","��Դ"), 
new Array("220601","�뽭"), 
new Array("222301","�׳�"), 
new Array("222401","�Ӽ�"), 
new Array("220501","ͨ��"), 
new Array("230101","������"), 
new Array("230301","����"), 
new Array("230401","�׸�"), 
new Array("230501","˫Ѽɽ"), 
new Array("230701","����"), 
new Array("230801","��ľ˹"), 
new Array("230901","��̨��"), 
new Array("231001","ĵ����"),     
new Array("232301","�绯"), 
new Array("230201","�������"), 
new Array("230601","����"), 
new Array("232601","�ں�"), 
new Array("232700","�Ӹ����"), 
new Array("310101","����"), 
new Array("310103","¬��"), 
new Array("310104","���"), 
new Array("310105","����"), 
new Array("310106","����"), 
new Array("310107","����"), 
new Array("310108","բ��"), 
new Array("310109","���"), 
new Array("310110","����"), 
new Array("310112","����"), 
new Array("310113","��ɽ"), 
new Array("310114","�ζ�"), 
new Array("310115","�ֶ�����"), 
new Array("310116","��ɽ"), 
new Array("310117","�ɽ�"), 
new Array("310118","����"), 
new Array("310119","�ϻ�"), 
new Array("310120","����"), 
new Array("310230","����"), 
new Array("320101","�Ͼ�"), 
new Array("320201","����"), 
new Array("320301","����"), 
new Array("320401","����"), 
new Array("320501","����"), 
new Array("320600","��ͨ"), 
new Array("320701","���Ƹ�"), 
new Array("320801","����"), 
new Array("320901","�γ�"), 
new Array("321001","����"), 
new Array("321101","��"), 
new Array("330101","����"), 
new Array("330201","����"), 
new Array("330301","����"), 
new Array("330401","����"), 
new Array("330501","����"), 
new Array("330601","����"), 
new Array("330701","��"), 
new Array("330801","����"), 
new Array("330901","��ɽ"), 
new Array("332501","��ˮ"), 
new Array("332602","�ٺ�"), 
new Array("340101","�Ϸ�"), 
new Array("340201","�ߺ�"), 
new Array("340301","����"), 
new Array("340401","����"), 
new Array("340501","��ɽ"), 
new Array("340601","����"), 
new Array("340701","ͭ��"), 
new Array("340801","����"), 
new Array("341001","��ɽ"), 
new Array("342101","����"), 
new Array("342201","����"), 
new Array("342301","����"), 
new Array("342401","����"), 
new Array("342501","����"), 
new Array("342601","����"), 
new Array("342901","���"), 
new Array("350101","����"), 
new Array("350201","����"), 
new Array("350301","����"), 
new Array("350401","����"), 
new Array("350501","Ȫ��"), 
new Array("350601","����"), 
new Array("352101","��ƽ"), 
new Array("352201","����"), 
new Array("352601","����"), 
new Array("360101","�ϲ�"), 
new Array("360201","������"), 
new Array("362101","����"), 
new Array("360301","Ƽ��"), 
new Array("360401","�Ž�"), 
new Array("360501","����"), 
new Array("360601","ӥ̶"), 
new Array("362201","�˴�"), 
new Array("362301","����"), 
new Array("362401","����"), 
new Array("362502","�ٴ�"), 
new Array("370101","����"), 
new Array("370201","�ൺ"), 
new Array("370301","�Ͳ�"), 
new Array("370401","��ׯ"), 
new Array("370501","��Ӫ"), 
new Array("370601","��̨"), 
new Array("370701","Ϋ��"), 
new Array("370801","����"), 
new Array("370901","̩��"), 
new Array("371001","����"), 
new Array("371100","����"), 
new Array("372301","����"), 
new Array("372401","����"), 
new Array("372501","�ĳ�"), 
new Array("372801","����"), 
new Array("372901","����"), 
new Array("410101","֣��"), 
new Array("410201","����"), 
new Array("410301","����"), 
new Array("410401","ƽ��ɽ"), 
new Array("410501","����"), 
new Array("410601","�ױ�"), 
new Array("410701","����"), 
new Array("410801","����"), 
new Array("410901","���"), 
new Array("411001","���"), 
new Array("411101","���"), 
new Array("411201","����Ͽ"), 
new Array("412301","����"), 
new Array("412701","�ܿ�"), 
new Array("412801","פ���"), 
new Array("412901","����"), 
new Array("413001","����"), 
new Array("420101","�人"), 
new Array("420201","��ʯ"), 
new Array("420301","ʮ��"), 
new Array("420400","ɳ��"), 
new Array("420501","�˲�"), 
new Array("420601","�差"), 
new Array("420701","����"), 
new Array("420801","����"), 
new Array("422103","����"), 
new Array("422201","Т��"), 
new Array("422301","����"), 
new Array("422421","����"), 
new Array("422801","��ʩ"), 
new Array("430101","��ɳ"), 
new Array("430401","����"), 
new Array("430501","����"), 
new Array("432801","����"), 
new Array("432901","����"), 
new Array("430801","��ӹ"), 
new Array("433001","����"), 
new Array("433101","����"), 
new Array("430201","����"), 
new Array("430301","��̶"), 
new Array("430601","����"), 
new Array("430701","����"), 
new Array("432301","����"), 
new Array("432501","¦��"), 
new Array("440101","����"), 
new Array("440301","����"), 
new Array("441501","��β"), 
new Array("441301","����"), 
new Array("441601","��Դ"), 
new Array("440601","��ɽ"), 
new Array("441801","��Զ"), 
new Array("441901","��ݸ"), 
new Array("440401","�麣"), 
new Array("440701","����"), 
new Array("441201","����"), 
new Array("442001","��ɽ"), 
new Array("440801","տ��"), 
new Array("440901","ï��"), 
new Array("440201","�ع�"), 
new Array("440501","��ͷ"), 
new Array("441401","÷��"), 
new Array("441701","����"), 
new Array("450101","����"), 
new Array("450401","����"), 
new Array("452501","����"), 
new Array("450301","����"), 
new Array("452601","��ɫ"), 
new Array("452701","�ӳ�"), 
new Array("452802","����"), 
new Array("450201","����"), 
new Array("450501","����"), 
new Array("460100","����"), 
new Array("460200","����"), 
new Array("500101","����"),
new Array("500102","����"),
new Array("500103","����"),
new Array("500104","��ɿ�"),
new Array("500105","����"),
new Array("500106","ɳƺ��"),
new Array("500107","������"),
new Array("500108","�ϰ�"),
new Array("500109","����"),
new Array("500110","��ʢ"),
new Array("500111","˫��"),
new Array("500112","�山"),
new Array("500113","����"),
new Array("500114","ǭ��"),
new Array("500115","����"),
new Array("500116","����"),
new Array("500117","�ϴ�"),
new Array("500118","����"),
new Array("500119","�ϴ�"),
new Array("500122","�뽭"),
new Array("500223","����"),
new Array("500224","ͭ��"),
new Array("500225","����"),
new Array("500226","�ٲ�"),
new Array("500227","�ɽ"),
new Array("500228","��ƽ"),
new Array("500229","�ǿ�"),
new Array("500230","�ᶼ"),
new Array("500231","�潭"),
new Array("500232","��¡"),
new Array("500233","����"),
new Array("500234","����"),
new Array("500235","����"),
new Array("500236","���"),
new Array("500237","��ɽ"),
new Array("500238","��Ϫ"),
new Array("500240","ʯ��"),
new Array("500241","��ɽ"),
new Array("500242","����"),
new Array("500243","��ˮ"),
new Array("510101","�ɶ�"), 
new Array("513321","����"), 
new Array("513101","�Ű�"), 
new Array("513229","�����"), 
new Array("510301","�Թ�"),  
new Array("512901","�ϳ�"), 
new Array("510501","����"), 
new Array("510601","����"), 
new Array("510701","����"), 
new Array("510901","����"), 
new Array("511001","�ڽ�"), 
new Array("511101","��ɽ"), 
new Array("512501","�˱�"), 
new Array("510801","��Ԫ"), 
new Array("513021","����"), 
new Array("513401","����"), 
new Array("510401","��֦��"), 
new Array("520101","����"), 
new Array("520200","����ˮ"), 
new Array("522201","ͭ��"), 
new Array("522501","��˳"), 
new Array("522601","����"), 
new Array("522701","����"), 
new Array("522301","����"), 
new Array("522421","�Ͻ�"), 
new Array("522101","����"), 
new Array("530101","����"), 
new Array("530201","����"), 
new Array("532201","����"), 
new Array("532301","����"), 
new Array("532401","��Ϫ"), 
new Array("532501","����"), 
new Array("532621","��ɽ"), 
new Array("532721","˼é"), 
new Array("532101","��ͨ"), 
new Array("532821","����"), 
new Array("532901","����"), 
new Array("533001","��ɽ"), 
new Array("533121","º��"), 
new Array("533221","����"), 
new Array("533321","��ˮ"), 
new Array("533421","�е�"), 
new Array("533521","�ٲ�"), 
new Array("540101","����"), 
new Array("542121","����"), 
new Array("542221","�˶�"), 
new Array("542301","�տ���"), 
new Array("542421","����"), 
new Array("542523","����"), 
new Array("542621","��֥"), 
new Array("610101","����"), 
new Array("610201","ͭ��"), 
new Array("610301","����"), 
new Array("610401","����"), 
new Array("612101","μ��"), 
new Array("612301","����"), 
new Array("612401","����"), 
new Array("612501","����"), 
new Array("612601","�Ӱ�"), 
new Array("612701","����"), 
new Array("620101","����"), 
new Array("620401","����"), 
new Array("620301","���"), 
new Array("620501","��ˮ"), 
new Array("622201","��Ҵ"), 
new Array("622301","����"), 
new Array("622421","����"), 
new Array("622624","����"), 
new Array("622701","ƽ��"), 
new Array("622801","����"), 
new Array("622901","����"), 
new Array("623027","�ĺ�"), 
new Array("620201","������"), 
new Array("622102","��Ȫ"), 
new Array("630100","����"), 
new Array("632121","ƽ��"), 
new Array("632221","��Դ"), 
new Array("632321","ͬ��"), 
new Array("632521","����"), 
new Array("632621","����"), 
new Array("632721","����"), 
new Array("632802","�����"), 
new Array("640101","����"), 
new Array("640201","ʯ��ɽ"), 
new Array("642101","����"), 
new Array("642221","��ԭ"), 
new Array("650101","��³ľ��"), 
new Array("650201","��������"), 
new Array("652101","��³��"), 
new Array("652201","����"), 
new Array("652301","����"), 
new Array("652701","����"), 
new Array("652801","�����"), 
new Array("652901","������"), 
new Array("653001","��ͼʲ"), 
new Array("653101","��ʲ"), 
new Array("654101","����"), 
new Array("710001","̨��"), 
new Array("710002","��¡"), 
new Array("710020","̨��"), 
new Array("710019","����"), 
new Array("710008","̨��"), 
new Array("211001","����"), 
new Array("653201","����"), 
new Array("542200","����"), 
new Array("542600","��һ��"), 
new Array("820000","����"), 
new Array("810000","���") 
); 

function FillProvinces(selProvince)
{ 
	selProvince.options[0]=new Option("--����--",""); 
	for(i=0;i<Provinces.length;i++) 
	{ 
		selProvince.options[i+1]=new Option(Provinces[i][1],Provinces[i][0]); 
	} 
	selProvince.options[0].selected=true; 
	selProvince.length=i+1; 
} 
function FillProvinces1(selProvince,ProvinceCode) 
{ 
	if(ProvinceCode==""){
		selProvince.options[0]=new Option("--����--","");  
	}
	
	for(i=0;i<Provinces.length;i++)   
	{    
		if(ProvinceCode==Provinces[i][0]){   
	
			selProvince.options[0]=new Option(Provinces[i][1],ProvinceCode); 
		}
		selProvince.options[i+1]=new Option(Provinces[i][1],Provinces[i][0]); 
	}   
	selProvince.options[0].selected=true; 
	selProvince.length=i+1; 
} 

function FillCitys(selCity,ProvinceCode) 
{ 
	//if the province is a direct-managed city, like Beijing, shanghai, tianjin, chongqin,hongkong, macro 
	//need not "��ѡ��ѡ��" 
	/*
	if(ProvinceCode=="110000"||ProvinceCode=="120000"||ProvinceCode=="310000" 
	||ProvinceCode=="810000"||ProvinceCode=="820000"||ProvinceCode=="500000") 
		count=0; 
	else {
		selCity.options[0]=new Option("--����--",""); 
		count=1;
	}
	
	*/
	 
	selCity.options[0]=new Option("--����--",""); 
	count=1;
	
	for(i=0;i<Citys.length;i++){ 
		if(Citys[i][0].toString().substring(0,2)==ProvinceCode.substring(0,2)) 
		{ 
			selCity.options[count]=new Option(Citys[i][1],Citys[i][0]); 
			count=count+1; 
		} 
	} 
	selCity.options[0].selected=true;    
	selCity.length=count; 
} 

function FillCitys1(selCity,ProvinceCode,CityCode) 
{ 
	//if the province is a direct-managed city, like Beijing, shanghai, tianjin, chongqin,hongkong, macro 
	//need not "��ѡ��ѡ��" 
	if(ProvinceCode=="110000"||ProvinceCode=="120000"||ProvinceCode=="310000" 
	||ProvinceCode=="810000"||ProvinceCode=="820000"||ProvinceCode=="500000") 
		count=0; 
	else{
		if(CityCode=="000000"){
			selCity.options[0]=new Option("��ѡ��",CityCode);               
		}
		count=1;
	}        
	for(i=0;i<Citys.length;i++) 
		{if(CityCode==Citys[i][0]){    
		 	selCity.options[0]=new Option(Citys[i][1],CityCode);   
		} 
		if(Citys[i][0].toString().substring(0,2)==ProvinceCode.substring(0,2)) 
		{ 
			selCity.options[count]=new Option(Citys[i][1],Citys[i][0]); 
			count=count+1; 
		} 
	} 
	selCity.options[0].selected=true;   
	selCity.length=count; 
} 



/* �޸�Province_onchange()��InitCitySelect������������
��������
��2009-1-6

������ԭ����룬�乲���Բ�ǿ��
function Province_onchange() 
{ 
FillCitys(g_selCity,g_selProvince.value); 
} 

function InitCitySelect(selProvince,selCity) 
{ 
//alert("begin"); 
g_selProvince=selProvince; 
g_selCity=selCity; 
selProvince.onchange=Function("Province_onchange();");    
FillProvinces(selProvince); 
Province_onchange(); 
} 

*/

//�޸ĺ��
function Province_onchange(selProvinceId,selCityId) 
{ 
	FillCitys(document.getElementById(selCityId),document.getElementById(selProvinceId).value); 
} 

//�޸ĺ��
function InitProvinceSelect(selProvince,selCity) 
{ 
	selProvince.onchange=Function("Province_onchange('" +selProvince.id + "','" + selCity.id + "');");  
	FillProvinces(selProvince); 
	Province_onchange(selProvince.id,selCity.id); 
} 


//�޸ĺ�
function InitCitySelect(selProvince,selCity,cityCode)    
{
	//alert(selProvince.id + "---" + selCity.id);
    if(cityCode == "null" || cityCode == ""){
   	 	InitProvinceSelect(selProvince,selCity);
    }else{
		InitProvinceSelect(selProvince,selCity);     
		for(i=0;i<selProvince.length;i++) 
		{ 
			if(selProvince.options[i].value.substring(0,2) == cityCode.substring(0,2)){ 
				selProvince.options[i].selected=true; 
			} 
		} 
		Province_onchange(selProvince.id,selCity.id); 
		for(i=0;i<selCity.length;i++) 
		{ 
			if(selCity.options[i].value == cityCode){ 
				selCity.options[i].selected=true; 
			} 
		} 
	}
} 

//�����ڵ�ġ�����ҳ���ж����ʱ��
function InitCitySelect_P(selProvinceId,selCityId,parentId){
	$("#" + parentId + " #" + selProvinceId)[0].onchange = Function("Province_onchange_P('" + selProvinceId + "','" + selCityId + "','" + parentId + "');");  
	FillProvinces($("#" + parentId + " #" + selProvinceId)[0]); 
	Province_onchange_P(selProvinceId,selCityId,parentId); 
} 

function Province_onchange_P(selProvinceId,selCityId,parentId){ 
	FillCitys($("#" + parentId + " #" + selCityId)[0],$("#" + parentId + " #" + selProvinceId)[0].value); 
} 

//-->   

    
    

