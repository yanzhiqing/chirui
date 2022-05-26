
/*
 *  页面初始化时加载相应下拉列表框
 * Copyright: Copyright (c) 2007 Company: 西安秦码软件科技有限公司 * 
 * @author 蒋华涛
 * @date 2009-1-6
 */
 
 
		/*下拉列表构造（默认添加一个“--不限--”选项）
		  @param　jqueryObj，是jquery对象
		  @param　values，下拉列表的值、显示文本组成的二维数组对象
		*/
		function structureSelect(jqueryObj, values,defaultValue){		
			jqueryObj.append("<option value=''>--不限--</option>");
			$.each(values,function(){
				jqueryObj.append("<option value='" + $(this)[0] + (($(this)[0] == defaultValue || $(this)[1] == defaultValue) ? "' selected>" : "'>")+ $(this)[1] + "</option>");
			});
		}
		/*下拉列表构造函数
		  @param　jqueryObj，是jquery对象
		  @param　values，下拉列表的值、显示文本组成的二维数组对象
		*/
		function structureSelectNew(jqueryObj, values,defaultValue){		
			$.each(values,function(){
				jqueryObj.append("<option value='" + $(this)[0] + (($(this)[0] == defaultValue || $(this)[1] == defaultValue) ? "' selected>" : "'>")+ $(this)[1] + "</option>");
			});
		}
   
		//择偶年龄，设置默认值
		function spoage(jqueryObj, defaultValue,startValue){
			if(startValue == undefined || startValue == null || startValue == ""){
				startValue = 18;
			}
			jqueryObj[0].options.length = 1;
			
			//jqueryObj.append("<option value=''>--不限--</option>");
			defaultValue = (defaultValue == undefined) ? "0" : defaultValue;
			for (var i = startValue; i <= 99; i++){		
				jqueryObj.append("<option value='" + i + ((i != defaultValue)?"'>":"' selected>") + i + "</option>");
			}		
		}		
				
		//择偶身高
		function spoheight(jqueryObj,defaultValue,startValue){
			if(startValue == undefined || startValue == null || startValue == ""){
				startValue = 150;
			}
			jqueryObj[0].options.length = 0;
			jqueryObj.append("<option value=''>不限</option>");
			for (var i = startValue; i <= 185; i++){		
				jqueryObj.append("<option value='" + i + ((i != defaultValue)?"'>":"' selected>") + i + "</option>");
			}
		}
		
		//学历 
		function education(jqueryObj,defaultValue){
			var values = new Array(
									new Array("1","大专以下"),
			 				    	new Array("2","大专"),
									new Array("3","本科"),
									new Array("4","硕士"),
									new Array("5","博士"),
									new Array("6","博士后")
								  );
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//专业类型
		function professionaltype(jqueryObj,defaultValue){
			var values = new Array(
									new Array("计算机类","计算机类"),
			 				    	new Array("电子信息类","电子信息类"),
									new Array("中文类","中文类"),
									new Array("外文类","外文类"),
									new Array("经济学类","经济学类"),
									new Array("金融学类","金融学类"),
									new Array("管理类","管理类"),
			 				    	new Array("市场营销类","市场营销类"),
									new Array("法学类","法学类"),
									new Array("教育类","教育类"),
									new Array("社会学类","社会学类"),
									new Array("历史类","历史类"),
									new Array("哲学类","哲学类"),
			 				    	new Array("艺术类","艺术类"),
									new Array("图书馆类","图书馆类"),
									new Array("情报档案类","情报档案类"),
									new Array("政治类","政治类"),
									new Array("数学类","数学类"),
									new Array("统计学类","统计学类"),
			 				    	new Array("物理类","物理类"),
									new Array("化学类","化学类"),
									new Array("生物类","生物类"),
									new Array("食品类","食品类"),
									new Array("医学类","医学类"),
									new Array("环境类","环境类"),
									new Array("地理类","地理类"),
									new Array("建筑类","建筑类"),
									new Array("测绘类","测绘类"),
									new Array("电器类","电器类"),
									new Array("机械类","机械类"),
									new Array("其他类","其他类")
								  );
			structureSelect(jqueryObj,values,defaultValue);
		}
		

		//收入
		function monthly(jqueryObj,defaultValue){
			var values = new Array(
									new Array("2000","2000元以下"),
			 				    	new Array("2000-3000","2000-3000元"),
									new Array("3000-5000","3000-5000元"),
									new Array("5000-7000","5000-7000元"),
									new Array("7000-10000","7000-10000元"),
									new Array("10000-20000","10000-20000元"),
									new Array("20000","20000元以上")
								  );
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//住房状况
		function housituation(jqueryObj,defaultValue){
			var values = new Array(
									new Array("暂未购房","暂未购房"),
			 				    	new Array("已购住房","已购住房"),
									new Array("与人合租","与人合租"),
									new Array("独自租房","独自租房"),
									new Array("与父母同住","与父母同住"),
									new Array("住亲朋家","住亲朋家"),
									new Array("单位宿舍","单位宿舍")
								  );
			structureSelect(jqueryObj,values,defaultValue);
		}
		//购车状况
		function buycar(jqueryObj,defaultValue){
			var values = new Array(
									new Array("已购","已购车"),
			 				    	new Array("未购","未购车"),
									new Array("保密","保密")
								   );
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//体型
		function weightsize(jqueryObj,defaultValue){
			var values = new Array(
									new Array("保密","保密"),
			 				    	new Array("瘦","瘦"),
									new Array("较瘦","较瘦"),
									new Array("匀称","匀称"),
									new Array("苗条","苗条"),
									new Array("丰满","丰满"),
									new Array("健壮","健壮"),
									new Array("魁梧","魁梧"),
									new Array("胖","胖"),
									new Array("较胖","较胖")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//民族
		function national(jqueryObj,defaultValue){
			var values = new Array(
									new Array("汉族","汉族"),
									new Array("回族","回族"),
									new Array("藏族","藏族"),
									new Array("朝鲜族","朝鲜族"),
									new Array("蒙古族","蒙古族"),
									new Array("满族","满族"),
									new Array("其他","其他")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//血型
		function bloodtype(jqueryObj,defaultValue){
			var values = new Array(
									new Array("A","A"),
									new Array("B","B"),
									new Array("AB","AB"),
									new Array("O","O")								
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//生肖
		function lunarnewyear(jqueryObj,defaultValue){
			var values = new Array(
									new Array("鼠","鼠"),
									new Array("牛","牛"),
									new Array("虎","虎"),
									new Array("兔","兔"),									
									new Array("龙","龙"),									
									new Array("蛇","蛇"),									
									new Array("马","马"),									
									new Array("羊","羊"),									
									new Array("猴","猴"),									
									new Array("鸡","鸡"),									
									new Array("狗","狗"),									
									new Array("猪","猪")									
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//星座
		function constellation(jqueryObj,defaultValue){
			var values = new Array(
									new Array("水瓶座","水瓶座"),
									new Array("双鱼座","双鱼座"),
									new Array("白羊座","白羊座"),
									new Array("金牛座","金牛座"),									
									new Array("双子座","双子座"),									
									new Array("巨蟹座","巨蟹座"),									
									new Array("狮子座","狮子座"),									
									new Array("处女座","处女座"),									
									new Array("天秤座","天秤座"),									
									new Array("天蝎座","天蝎座"),									
									new Array("射手座","射手座"),									
									new Array("魔羯座","魔羯座")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		//身高
		function height(jqueryObj,defaultValue){
			var values = new Array(
									new Array("140","140"),
									new Array("141","141"),
									new Array("142","142"),
									new Array("143","143"),
									new Array("144","144"),
									new Array("145","145"),
									new Array("146","146"),
									new Array("147","147"),
									new Array("148","148"),
									new Array("149","149"),
									new Array("150","150"),
									new Array("151","151"),
									new Array("152","152"),
									new Array("153","153"),
									new Array("154","154"),
									new Array("155","155"),
									new Array("156","156"),
									new Array("157","157"),
									new Array("158","158"),
									new Array("159","159"),
									new Array("160","160"),
									new Array("161","161"),
									new Array("162","162"),
									new Array("163","163"),
									new Array("164","164"),
									new Array("165","165"),
									new Array("166","166"),
									new Array("167","167"),
									new Array("168","168"),
									new Array("169","169"),
									new Array("170","170"),
									new Array("171","171"),
									new Array("172","172"),
									new Array("173","173"),
									new Array("174","174"),
									new Array("175","175"),
									new Array("176","176"),
									new Array("177","177"),
									new Array("178","178"),
									new Array("179","179"),
									new Array("180","180"),
									new Array("181","181"),
									new Array("182","182"),
									new Array("183","183"),
									new Array("184","184"),
									new Array("185","185"),
									new Array("186","186"),
									new Array("187","187"),
									new Array("188","188"),
									new Array("189","189"),
									new Array("190","190"),
									new Array("191","191"),
									new Array("192","192"),
									new Array("193","193"),
									new Array("194","194"),
									new Array("195","195"),
									new Array("196","196"),
									new Array("197","197"),
									new Array("198","198"),
									new Array("199","199"),
									new Array("200","200"),
									new Array("201","201"),
									new Array("202","202"),
									new Array("203","203"),
									new Array("204","204"),
									new Array("205","205"),
									new Array("206","206"),
									new Array("207","207"),
									new Array("208","208"),
									new Array("209","209")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		//体重
		function weight(jqueryObj,defaultValue){
			var values = new Array(
			                        new Array("保密","保密"),
									new Array("40","40"),
									new Array("41","41"),
									new Array("42","42"),
									new Array("43","13"),
									new Array("44","14"),
									new Array("45","45"),
									new Array("46","46"),
									new Array("47","47"),
									new Array("48","48"),
									new Array("49","49"),
									new Array("50","50"),
									new Array("51","51"),
									new Array("52","52"),
									new Array("53","53"),
									new Array("54","54"),
									new Array("55","55"),
									new Array("56","56"),
									new Array("57","57"),
									new Array("58","58"),
									new Array("59","59"),
									new Array("60","60"),
									new Array("61","61"),
									new Array("62","62"),
									new Array("63","63"),
									new Array("64","64"),
									new Array("65","65"),
									new Array("66","66"),
									new Array("67","67"),
									new Array("68","68"),
									new Array("69","69"),
									new Array("70","70"),
									new Array("71","71"),
									new Array("72","72"),
									new Array("73","73"),
									new Array("74","74"),
									new Array("75","75"),
									new Array("76","76"),
									new Array("77","77"),
									new Array("78","78"),
									new Array("79","79"),
									new Array("80","80"),
									new Array("81","81"),
									new Array("82","82"),
									new Array("83","83"),
									new Array("84","84"),
									new Array("85","85"),
									new Array("86","86"),
									new Array("87","87"),
									new Array("88","88"),
									new Array("89","89"),
									new Array("90","90"),
									new Array("91","91"),
									new Array("92","92"),
									new Array("93","93"),
									new Array("94","94"),
									new Array("95","95"),
									new Array("96","96"),
									new Array("97","97"),
									new Array("98","98"),
									new Array("99","99"),
									new Array("100","100")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		//最大消费
		function largestconsumer(jqueryObj,defaultValue){
			var values = new Array(
									new Array("美食","美食"),
									new Array("服装","服装"),
									new Array("娱乐","娱乐"),
									new Array("出行","出行"),									
									new Array("交友","交友"),									
									new Array("文化","文化"),									
									new Array("教育","教育"),									
									new Array("其他","其他")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//锻炼习惯
		function exercisehabits(jqueryObj,defaultValue){
			var values = new Array(
									new Array("每周至少一次","每周至少一次"),
									new Array("每月几次","每月几次"),
									new Array("没时间锻炼","没时间锻炼"),
									new Array("集中时间锻炼","集中时间锻炼"),									
									new Array("不喜欢锻炼","不喜欢锻炼")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//作息习惯
		function resthabits(jqueryObj,defaultValue){
			var values = new Array(
									new Array("保密","保密"),
									new Array("早睡早起很规律","早睡早起很规律"),
									new Array("经常夜猫子","经常夜猫子"),
									new Array("总是早起鸟","总是早起鸟"),									
									new Array("偶尔懒散一下","偶尔懒散一下"),
									new Array("没有规律","没有规律")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//愿意与父母同住
		function liveparents(jqueryObj,defaultValue){
			var values = new Array(
									new Array("愿意","愿意"),
									new Array("不愿意","不愿意"),
									new Array("视情况而定","视情况而定")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//宠物
		function pets(jqueryObj,defaultValue){
			var values = new Array(
									new Array("有宠物","有宠物"),
									new Array("无宠物","无宠物"),
									new Array("正打算养","正打算养"),
									new Array("不喜欢养","不喜欢养"),									
									new Array("过敏","过敏")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//喜欢制造浪漫
		function createromantic(jqueryObj,defaultValue){
			var values = new Array(
									new Array("经常","经常"),
									new Array("偶尔","偶尔"),
									new Array("视情况而定","视情况而定"),
									new Array("从不","从不"),									
									new Array("不喜欢","不喜欢")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//职业
		function vocational(jqueryObj,defaultValue){
			var values = new Array(
									new Array("在校学生","在校学生"),
									new Array("计算机/互连网","计算机/互连网"),
									new Array("电子/半导体/仪表仪器","电子/半导体/仪表仪器"),
									new Array("通信技术","通信技术"),
									new Array("销售","销售"),
									new Array("市场拓展","市场拓展"),
									new Array("公关/商务","公关/商务"),
									new Array("采购/贸易","采购/贸易"),
									new Array("客户服务/技术支持","客户服务/技术支持"),
									new Array("人力资源/行政管理","人力资源/行政管理"),
									new Array("房地产/装修/物业","房地产/装修/物业"),
									new Array("仓储/物流","仓储/物流"),
									new Array("普通劳动力/家政服务","普通劳动力/家政服务"),
									new Array("普通服务行业","普通服务行业"),
									new Array("航空服务业","航空服务业"),
									new Array("教育/培训","教育/培训"),
									new Array("咨询/顾问","咨询/顾问"),
									new Array("学术/研究","学术/研究"),
									new Array("法律","法律"),
									new Array("设计/创意","设计/创意"),
									new Array("文学/传媒/影视娱乐","文学/传媒/影视娱乐"),
									new Array("餐饮/旅游","餐饮/旅游"),
									new Array("化工","化工"),
									new Array("能源/地质勘探","能源/地质勘探"),
									new Array("医疗/护理","医疗/护理"),
									new Array("保健/美容","保健/美容"),
									new Array("生物/制药/医疗","生物/制药/医疗"),
									new Array("体育工作者","体育工作者"),
									new Array("翻译","翻译"),
									new Array("公务员/国家干部","公务员/国家干部"),
									new Array("私营业主","私营业主"),
									new Array("农/林/牧/渔业","农/林/牧/渔业"),
									new Array("武警/警察/消防/军人","武警/警察/消防/军人"),
									new Array("自由职业者","自由职业者"),
									new Array("其他行业","其他行业")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//吸烟情况
		function smoking(jqueryObj,defaultValue){
			var values = new Array(
									new Array("不吸，而且很反感","不吸，而且很反感"),
									new Array("不吸，但也不反感","不吸，但也不反感"),
									new Array("社交场合偶尔吸","社交场合偶尔吸"),
									new Array("每周吸几次","每周吸几次"),
									new Array("每天都吸","每天都吸"),
									new Array("有烟瘾","有烟瘾")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}

		//钦酒情况
		function drinking(jqueryObj,defaultValue){
			var values = new Array(
									new Array("保密","保密"),
									new Array("从不喝酒","从不喝酒"),
									new Array("社交需要时喝","社交需要时喝"),
									new Array("有兴致时喝","有兴致时喝"),
									new Array("每天都离不开酒","每天都离不开酒")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}

		//是否要孩子
		function wantchildren(jqueryObj,defaultValue){
			var values = new Array(
									new Array("保密","保密"),
									new Array("愿意","愿意"),
									new Array("不愿意","不愿意"),
									new Array("视情况而定","视情况而定")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//公司类别
		function companytype(jqueryObj,defaultValue){
			var values = new Array(
									new Array("政府机关","政府机关"),
									new Array("事业单位","事业单位"),
									new Array("外企企业","外企企业"),
									new Array("世界500强","世界500强"),
									new Array("上市公司","上市公司"),
									new Array("国有企业","国有企业"),
									new Array("私营业主","私营业主"),
									new Array("自有公司","自有公司")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//家中排行
		function rankinghome(jqueryObj,defaultValue){
			var values = new Array(
									new Array("独生子女","独生子女"),
									new Array("老大","老大"),
									new Array("老二","老二"),
									new Array("老三","老三"),
									new Array("老四","老四"),
									new Array("老幺","老幺"),
									new Array("老五及更小","老五及更小")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//宗教信仰
		function religiousbeliefs(jqueryObj,defaultValue){
			var values = new Array(
									new Array("无宗教信仰","无宗教信仰"),
									new Array("大乘佛教显宗","大乘佛教显宗"),
									new Array("大乘佛教密宗","大乘佛教密宗"),
									new Array("小乘佛教","小乘佛教"),
									new Array("道教","道教"),
									new Array("儒教","儒教"),
									new Array("基督教天主教派","基督教天主教派"),
									new Array("基督教东正教派","基督教东正教派"),
									new Array("基督教新教派","基督教新教派"),
									new Array("犹太教","犹太教"),
									new Array("伊斯兰教什叶派","伊斯兰教什叶派"),
									new Array("伊斯兰教逊尼派","伊斯兰教逊尼派"),
									new Array("印度教","印度教"),
									new Array("神道教","神道教"),
									new Array("萨满教","萨满教"),
									new Array("其他宗教信仰","其他宗教信仰")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		//收入描述
		function desrevenue(jqueryObj,defaultValue){
			var values = new Array(
									new Array("福利优越","福利优越"),
									new Array("奖金丰厚","奖金丰厚"),
									new Array("事业稳步上升","事业稳步上升"),
									new Array("投资高回报","投资高回报")								
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//语言能力
		function languageskills(jqueryObj,defaultValue){
			var values = new Array(
									new Array("中文（普通话）","中文（普通话）"),
									new Array("地方方言","地方方言"),
									new Array("粤语","粤语"),
									new Array("英语","英语"),
									new Array("法语","法语"),
									new Array("日语","日语"),
									new Array("韩语","韩语"),
									new Array("德语","德语"),
									new Array("意大利语","意大利语"),
									new Array("俄语","俄语"),
									new Array("芬兰语","芬兰语"),
									new Array("荷兰语","荷兰语"),
									new Array("葡萄牙语","葡萄牙语"),
									new Array("西班牙语","西班牙语"),
									new Array("阿拉伯语","阿拉伯语"),
									new Array("泰国语","泰国语"),
									new Array("印度语","印度语"),
									new Array("匈牙利语","匈牙利语"),
									new Array("其他","其他")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//个性
		function personality(jqueryObj,defaultValue){
			var values = new Array(
									new Array("浪漫迷人","浪漫迷人"),
									new Array("成熟稳重","成熟稳重"),
									new Array("风趣幽默","风趣幽默"),
									new Array("乐观开朗","乐观开朗"),
									new Array("活泼可爱","活泼可爱"),
									new Array("忠厚老实","忠厚老实"),
									new Array("纯朴害羞","纯朴害羞"),
									new Array("温柔体贴","温柔体贴"),
									new Array("多愁善感","多愁善感"),
									new Array("时尚新潮","时尚新潮"),
									new Array("热辣动感","热辣动感")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//发型
		function hair(jqueryObj,defaultValue){
			var values = new Array(
									new Array("顺直长发","顺直长发"),
									new Array("卷曲长发","卷曲长发"),
									new Array("中等长度","中等长度"),
									new Array("短发","短发"),
									new Array("很短","很短"),
									new Array("其他","其他")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//外貌
		function appearanceva(jqueryObj,defaultValue){
			var values = new Array(
									new Array("保密","保密"),
									new Array("秀外慧中","秀外慧中"),
									new Array("眉清目秀","眉清目秀"),
									new Array("明眸善睐","明眸善睐"),
									new Array("娇小依人","娇小依人"),
									new Array("青春活泼","青春活泼"),
									new Array("成熟魅力","成熟魅力"),
									new Array("雍容华贵","雍容华贵"),
									new Array("淡雅如菊","淡雅如菊")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		function getOurState(jqueryObj,defaultValue){
			var values = new Array(
									new Array("0","请选择"),
									new Array("1","约会了"),
									new Array("2","恋爱了"),
									new Array("3","结婚了")
									);
			structureSelectNew(jqueryObj,values,defaultValue);
		}
		
		function marstatus(jqueryObj,defaultValue){
			var values = new Array(
									new Array("未婚","未婚"),
									new Array("离婚","离婚"),
									new Array("丧偶","丧偶")
									
									);
			structureSelectNew(jqueryObj,values,defaultValue);
		}
		
		function whetherchildren(jqueryObj,defaultValue){
			var values = new Array(
									new Array("","不限"),
									new Array("有","有"),
									new Array("无","无")
									
									);
			structureSelectNew(jqueryObj,values,defaultValue);
		}
		
		function admissionyear(jqueryObj,defaultValue){
			var startYear=1970;//起始年份
            var endYear=new Date().getUTCFullYear();//终止年份（当前年份）
			jqueryObj[0].options.length = 0;
			jqueryObj.append("<option value=''>--不限--</option>");
			for (var i=startYear;i<=endYear;i++){		
				jqueryObj.append("<option value='" + i + ((i != defaultValue)?"'>":"' selected>") + i + "</option>");
			}
		}
		//魅力部位
		function partcharm(jqueryObj,defaultValue){
			var values = new Array(
									new Array("笑容","笑容"),
									new Array("眉毛","眉毛"),
									new Array("眼睛","眼睛"),
									new Array("头发","头发"),
									new Array("鼻梁","鼻梁"),
									new Array("嘴唇","嘴唇"),
									new Array("牙齿","牙齿"),
									new Array("颈部","颈部"),
									new Array("耳朵","耳朵"),
									new Array("手","手"),
									new Array("胳膊","胳膊"),
									new Array("胸部","胸部"),
									new Array("臀部","臀部"),
									new Array("腿","腿"),
									new Array("腰部","腰部"),
									new Array("没有太特别的","没有太特别的")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		//发色
		function haircolor(jqueryObj,defaultValue){
			var values = new Array(
									new Array("黑色","黑色"),
									new Array("金色","金色"),
									new Array("褐色","褐色"),
									new Array("栗色","栗色"),
									new Array("灰色","灰色"),
									new Array("红色","红色"),
									new Array("白色","白色"),
									new Array("挑染","挑染"),
									new Array("光头","光头"),
									new Array("其它","其它")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		//脸型
		function face(jqueryObj,defaultValue){
			var values = new Array(
									new Array("圆脸型","圆脸型"),
									new Array("方脸型","方脸型"),
									new Array("长脸型","长脸型"),
									new Array("瓜子脸型","瓜子脸型"),
									new Array("鸭蛋脸型","鸭蛋脸型"),
									new Array("国字脸型","国字脸型"),
									new Array("三角脸型","三角脸型"),
									new Array("菱形脸型","菱形脸型"),
									new Array("保密","保密")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
					