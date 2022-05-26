
/*
 *  ҳ���ʼ��ʱ������Ӧ�����б��
 * Copyright: Copyright (c) 2007 Company: ������������Ƽ����޹�˾ * 
 * @author ������
 * @date 2009-1-6
 */
 
 
		/*�����б��죨Ĭ�����һ����--����--��ѡ�
		  @param��jqueryObj����jquery����
		  @param��values�������б��ֵ����ʾ�ı���ɵĶ�ά�������
		*/
		function structureSelect(jqueryObj, values,defaultValue){		
			jqueryObj.append("<option value=''>--����--</option>");
			$.each(values,function(){
				jqueryObj.append("<option value='" + $(this)[0] + (($(this)[0] == defaultValue || $(this)[1] == defaultValue) ? "' selected>" : "'>")+ $(this)[1] + "</option>");
			});
		}
		/*�����б��캯��
		  @param��jqueryObj����jquery����
		  @param��values�������б��ֵ����ʾ�ı���ɵĶ�ά�������
		*/
		function structureSelectNew(jqueryObj, values,defaultValue){		
			$.each(values,function(){
				jqueryObj.append("<option value='" + $(this)[0] + (($(this)[0] == defaultValue || $(this)[1] == defaultValue) ? "' selected>" : "'>")+ $(this)[1] + "</option>");
			});
		}
   
		//��ż���䣬����Ĭ��ֵ
		function spoage(jqueryObj, defaultValue,startValue){
			if(startValue == undefined || startValue == null || startValue == ""){
				startValue = 18;
			}
			jqueryObj[0].options.length = 1;
			
			//jqueryObj.append("<option value=''>--����--</option>");
			defaultValue = (defaultValue == undefined) ? "0" : defaultValue;
			for (var i = startValue; i <= 99; i++){		
				jqueryObj.append("<option value='" + i + ((i != defaultValue)?"'>":"' selected>") + i + "</option>");
			}		
		}		
				
		//��ż���
		function spoheight(jqueryObj,defaultValue,startValue){
			if(startValue == undefined || startValue == null || startValue == ""){
				startValue = 150;
			}
			jqueryObj[0].options.length = 0;
			jqueryObj.append("<option value=''>����</option>");
			for (var i = startValue; i <= 185; i++){		
				jqueryObj.append("<option value='" + i + ((i != defaultValue)?"'>":"' selected>") + i + "</option>");
			}
		}
		
		//ѧ�� 
		function education(jqueryObj,defaultValue){
			var values = new Array(
									new Array("1","��ר����"),
			 				    	new Array("2","��ר"),
									new Array("3","����"),
									new Array("4","˶ʿ"),
									new Array("5","��ʿ"),
									new Array("6","��ʿ��")
								  );
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//רҵ����
		function professionaltype(jqueryObj,defaultValue){
			var values = new Array(
									new Array("�������","�������"),
			 				    	new Array("������Ϣ��","������Ϣ��"),
									new Array("������","������"),
									new Array("������","������"),
									new Array("����ѧ��","����ѧ��"),
									new Array("����ѧ��","����ѧ��"),
									new Array("������","������"),
			 				    	new Array("�г�Ӫ����","�г�Ӫ����"),
									new Array("��ѧ��","��ѧ��"),
									new Array("������","������"),
									new Array("���ѧ��","���ѧ��"),
									new Array("��ʷ��","��ʷ��"),
									new Array("��ѧ��","��ѧ��"),
			 				    	new Array("������","������"),
									new Array("ͼ�����","ͼ�����"),
									new Array("�鱨������","�鱨������"),
									new Array("������","������"),
									new Array("��ѧ��","��ѧ��"),
									new Array("ͳ��ѧ��","ͳ��ѧ��"),
			 				    	new Array("������","������"),
									new Array("��ѧ��","��ѧ��"),
									new Array("������","������"),
									new Array("ʳƷ��","ʳƷ��"),
									new Array("ҽѧ��","ҽѧ��"),
									new Array("������","������"),
									new Array("������","������"),
									new Array("������","������"),
									new Array("�����","�����"),
									new Array("������","������"),
									new Array("��е��","��е��"),
									new Array("������","������")
								  );
			structureSelect(jqueryObj,values,defaultValue);
		}
		

		//����
		function monthly(jqueryObj,defaultValue){
			var values = new Array(
									new Array("2000","2000Ԫ����"),
			 				    	new Array("2000-3000","2000-3000Ԫ"),
									new Array("3000-5000","3000-5000Ԫ"),
									new Array("5000-7000","5000-7000Ԫ"),
									new Array("7000-10000","7000-10000Ԫ"),
									new Array("10000-20000","10000-20000Ԫ"),
									new Array("20000","20000Ԫ����")
								  );
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//ס��״��
		function housituation(jqueryObj,defaultValue){
			var values = new Array(
									new Array("��δ����","��δ����"),
			 				    	new Array("�ѹ�ס��","�ѹ�ס��"),
									new Array("���˺���","���˺���"),
									new Array("�����ⷿ","�����ⷿ"),
									new Array("�븸ĸͬס","�븸ĸͬס"),
									new Array("ס�����","ס�����"),
									new Array("��λ����","��λ����")
								  );
			structureSelect(jqueryObj,values,defaultValue);
		}
		//����״��
		function buycar(jqueryObj,defaultValue){
			var values = new Array(
									new Array("�ѹ�","�ѹ���"),
			 				    	new Array("δ��","δ����"),
									new Array("����","����")
								   );
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//����
		function weightsize(jqueryObj,defaultValue){
			var values = new Array(
									new Array("����","����"),
			 				    	new Array("��","��"),
									new Array("����","����"),
									new Array("�ȳ�","�ȳ�"),
									new Array("����","����"),
									new Array("����","����"),
									new Array("��׳","��׳"),
									new Array("����","����"),
									new Array("��","��"),
									new Array("����","����")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//����
		function national(jqueryObj,defaultValue){
			var values = new Array(
									new Array("����","����"),
									new Array("����","����"),
									new Array("����","����"),
									new Array("������","������"),
									new Array("�ɹ���","�ɹ���"),
									new Array("����","����"),
									new Array("����","����")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//Ѫ��
		function bloodtype(jqueryObj,defaultValue){
			var values = new Array(
									new Array("A","A"),
									new Array("B","B"),
									new Array("AB","AB"),
									new Array("O","O")								
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//��Ф
		function lunarnewyear(jqueryObj,defaultValue){
			var values = new Array(
									new Array("��","��"),
									new Array("ţ","ţ"),
									new Array("��","��"),
									new Array("��","��"),									
									new Array("��","��"),									
									new Array("��","��"),									
									new Array("��","��"),									
									new Array("��","��"),									
									new Array("��","��"),									
									new Array("��","��"),									
									new Array("��","��"),									
									new Array("��","��")									
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//����
		function constellation(jqueryObj,defaultValue){
			var values = new Array(
									new Array("ˮƿ��","ˮƿ��"),
									new Array("˫����","˫����"),
									new Array("������","������"),
									new Array("��ţ��","��ţ��"),									
									new Array("˫����","˫����"),									
									new Array("��з��","��з��"),									
									new Array("ʨ����","ʨ����"),									
									new Array("��Ů��","��Ů��"),									
									new Array("�����","�����"),									
									new Array("��Ы��","��Ы��"),									
									new Array("������","������"),									
									new Array("ħ����","ħ����")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		//���
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
		//����
		function weight(jqueryObj,defaultValue){
			var values = new Array(
			                        new Array("����","����"),
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
		//�������
		function largestconsumer(jqueryObj,defaultValue){
			var values = new Array(
									new Array("��ʳ","��ʳ"),
									new Array("��װ","��װ"),
									new Array("����","����"),
									new Array("����","����"),									
									new Array("����","����"),									
									new Array("�Ļ�","�Ļ�"),									
									new Array("����","����"),									
									new Array("����","����")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//����ϰ��
		function exercisehabits(jqueryObj,defaultValue){
			var values = new Array(
									new Array("ÿ������һ��","ÿ������һ��"),
									new Array("ÿ�¼���","ÿ�¼���"),
									new Array("ûʱ�����","ûʱ�����"),
									new Array("����ʱ�����","����ʱ�����"),									
									new Array("��ϲ������","��ϲ������")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//��Ϣϰ��
		function resthabits(jqueryObj,defaultValue){
			var values = new Array(
									new Array("����","����"),
									new Array("��˯����ܹ���","��˯����ܹ���"),
									new Array("����ҹè��","����ҹè��"),
									new Array("����������","����������"),									
									new Array("ż����ɢһ��","ż����ɢһ��"),
									new Array("û�й���","û�й���")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//Ը���븸ĸͬס
		function liveparents(jqueryObj,defaultValue){
			var values = new Array(
									new Array("Ը��","Ը��"),
									new Array("��Ը��","��Ը��"),
									new Array("���������","���������")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//����
		function pets(jqueryObj,defaultValue){
			var values = new Array(
									new Array("�г���","�г���"),
									new Array("�޳���","�޳���"),
									new Array("��������","��������"),
									new Array("��ϲ����","��ϲ����"),									
									new Array("����","����")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//ϲ����������
		function createromantic(jqueryObj,defaultValue){
			var values = new Array(
									new Array("����","����"),
									new Array("ż��","ż��"),
									new Array("���������","���������"),
									new Array("�Ӳ�","�Ӳ�"),									
									new Array("��ϲ��","��ϲ��")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//ְҵ
		function vocational(jqueryObj,defaultValue){
			var values = new Array(
									new Array("��Уѧ��","��Уѧ��"),
									new Array("�����/������","�����/������"),
									new Array("����/�뵼��/�Ǳ�����","����/�뵼��/�Ǳ�����"),
									new Array("ͨ�ż���","ͨ�ż���"),
									new Array("����","����"),
									new Array("�г���չ","�г���չ"),
									new Array("����/����","����/����"),
									new Array("�ɹ�/ó��","�ɹ�/ó��"),
									new Array("�ͻ�����/����֧��","�ͻ�����/����֧��"),
									new Array("������Դ/��������","������Դ/��������"),
									new Array("���ز�/װ��/��ҵ","���ز�/װ��/��ҵ"),
									new Array("�ִ�/����","�ִ�/����"),
									new Array("��ͨ�Ͷ���/��������","��ͨ�Ͷ���/��������"),
									new Array("��ͨ������ҵ","��ͨ������ҵ"),
									new Array("���շ���ҵ","���շ���ҵ"),
									new Array("����/��ѵ","����/��ѵ"),
									new Array("��ѯ/����","��ѯ/����"),
									new Array("ѧ��/�о�","ѧ��/�о�"),
									new Array("����","����"),
									new Array("���/����","���/����"),
									new Array("��ѧ/��ý/Ӱ������","��ѧ/��ý/Ӱ������"),
									new Array("����/����","����/����"),
									new Array("����","����"),
									new Array("��Դ/���ʿ�̽","��Դ/���ʿ�̽"),
									new Array("ҽ��/����","ҽ��/����"),
									new Array("����/����","����/����"),
									new Array("����/��ҩ/ҽ��","����/��ҩ/ҽ��"),
									new Array("����������","����������"),
									new Array("����","����"),
									new Array("����Ա/���Ҹɲ�","����Ա/���Ҹɲ�"),
									new Array("˽Ӫҵ��","˽Ӫҵ��"),
									new Array("ũ/��/��/��ҵ","ũ/��/��/��ҵ"),
									new Array("�侯/����/����/����","�侯/����/����/����"),
									new Array("����ְҵ��","����ְҵ��"),
									new Array("������ҵ","������ҵ")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//�������
		function smoking(jqueryObj,defaultValue){
			var values = new Array(
									new Array("���������Һܷ���","���������Һܷ���"),
									new Array("��������Ҳ������","��������Ҳ������"),
									new Array("�罻����ż����","�罻����ż����"),
									new Array("ÿ��������","ÿ��������"),
									new Array("ÿ�춼��","ÿ�춼��"),
									new Array("�����","�����")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}

		//�վ����
		function drinking(jqueryObj,defaultValue){
			var values = new Array(
									new Array("����","����"),
									new Array("�Ӳ��Ⱦ�","�Ӳ��Ⱦ�"),
									new Array("�罻��Ҫʱ��","�罻��Ҫʱ��"),
									new Array("������ʱ��","������ʱ��"),
									new Array("ÿ�춼�벻����","ÿ�춼�벻����")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}

		//�Ƿ�Ҫ����
		function wantchildren(jqueryObj,defaultValue){
			var values = new Array(
									new Array("����","����"),
									new Array("Ը��","Ը��"),
									new Array("��Ը��","��Ը��"),
									new Array("���������","���������")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//��˾���
		function companytype(jqueryObj,defaultValue){
			var values = new Array(
									new Array("��������","��������"),
									new Array("��ҵ��λ","��ҵ��λ"),
									new Array("������ҵ","������ҵ"),
									new Array("����500ǿ","����500ǿ"),
									new Array("���й�˾","���й�˾"),
									new Array("������ҵ","������ҵ"),
									new Array("˽Ӫҵ��","˽Ӫҵ��"),
									new Array("���й�˾","���й�˾")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//��������
		function rankinghome(jqueryObj,defaultValue){
			var values = new Array(
									new Array("������Ů","������Ů"),
									new Array("�ϴ�","�ϴ�"),
									new Array("�϶�","�϶�"),
									new Array("����","����"),
									new Array("����","����"),
									new Array("����","����"),
									new Array("���弰��С","���弰��С")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//�ڽ�����
		function religiousbeliefs(jqueryObj,defaultValue){
			var values = new Array(
									new Array("���ڽ�����","���ڽ�����"),
									new Array("��˷������","��˷������"),
									new Array("��˷������","��˷������"),
									new Array("С�˷��","С�˷��"),
									new Array("����","����"),
									new Array("���","���"),
									new Array("��������������","��������������"),
									new Array("�����̶�������","�����̶�������"),
									new Array("�������½���","�������½���"),
									new Array("��̫��","��̫��"),
									new Array("��˹����ʲҶ��","��˹����ʲҶ��"),
									new Array("��˹����ѷ����","��˹����ѷ����"),
									new Array("ӡ�Ƚ�","ӡ�Ƚ�"),
									new Array("�����","�����"),
									new Array("������","������"),
									new Array("�����ڽ�����","�����ڽ�����")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		//��������
		function desrevenue(jqueryObj,defaultValue){
			var values = new Array(
									new Array("������Խ","������Խ"),
									new Array("������","������"),
									new Array("��ҵ�Ȳ�����","��ҵ�Ȳ�����"),
									new Array("Ͷ�ʸ߻ر�","Ͷ�ʸ߻ر�")								
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//��������
		function languageskills(jqueryObj,defaultValue){
			var values = new Array(
									new Array("���ģ���ͨ����","���ģ���ͨ����"),
									new Array("�ط�����","�ط�����"),
									new Array("����","����"),
									new Array("Ӣ��","Ӣ��"),
									new Array("����","����"),
									new Array("����","����"),
									new Array("����","����"),
									new Array("����","����"),
									new Array("�������","�������"),
									new Array("����","����"),
									new Array("������","������"),
									new Array("������","������"),
									new Array("��������","��������"),
									new Array("��������","��������"),
									new Array("��������","��������"),
									new Array("̩����","̩����"),
									new Array("ӡ����","ӡ����"),
									new Array("��������","��������"),
									new Array("����","����")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//����
		function personality(jqueryObj,defaultValue){
			var values = new Array(
									new Array("��������","��������"),
									new Array("��������","��������"),
									new Array("��Ȥ��Ĭ","��Ȥ��Ĭ"),
									new Array("�ֹۿ���","�ֹۿ���"),
									new Array("���ÿɰ�","���ÿɰ�"),
									new Array("�Һ���ʵ","�Һ���ʵ"),
									new Array("���Ӻ���","���Ӻ���"),
									new Array("��������","��������"),
									new Array("����Ƹ�","����Ƹ�"),
									new Array("ʱ���³�","ʱ���³�"),
									new Array("��������","��������")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//����
		function hair(jqueryObj,defaultValue){
			var values = new Array(
									new Array("˳ֱ����","˳ֱ����"),
									new Array("��������","��������"),
									new Array("�еȳ���","�еȳ���"),
									new Array("�̷�","�̷�"),
									new Array("�ܶ�","�ܶ�"),
									new Array("����","����")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		//��ò
		function appearanceva(jqueryObj,defaultValue){
			var values = new Array(
									new Array("����","����"),
									new Array("�������","�������"),
									new Array("ü��Ŀ��","ü��Ŀ��"),
									new Array("��������","��������"),
									new Array("��С����","��С����"),
									new Array("�ഺ����","�ഺ����"),
									new Array("��������","��������"),
									new Array("Ӻ�ݻ���","Ӻ�ݻ���"),
									new Array("�������","�������")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
		function getOurState(jqueryObj,defaultValue){
			var values = new Array(
									new Array("0","��ѡ��"),
									new Array("1","Լ����"),
									new Array("2","������"),
									new Array("3","�����")
									);
			structureSelectNew(jqueryObj,values,defaultValue);
		}
		
		function marstatus(jqueryObj,defaultValue){
			var values = new Array(
									new Array("δ��","δ��"),
									new Array("���","���"),
									new Array("ɥż","ɥż")
									
									);
			structureSelectNew(jqueryObj,values,defaultValue);
		}
		
		function whetherchildren(jqueryObj,defaultValue){
			var values = new Array(
									new Array("","����"),
									new Array("��","��"),
									new Array("��","��")
									
									);
			structureSelectNew(jqueryObj,values,defaultValue);
		}
		
		function admissionyear(jqueryObj,defaultValue){
			var startYear=1970;//��ʼ���
            var endYear=new Date().getUTCFullYear();//��ֹ��ݣ���ǰ��ݣ�
			jqueryObj[0].options.length = 0;
			jqueryObj.append("<option value=''>--����--</option>");
			for (var i=startYear;i<=endYear;i++){		
				jqueryObj.append("<option value='" + i + ((i != defaultValue)?"'>":"' selected>") + i + "</option>");
			}
		}
		//������λ
		function partcharm(jqueryObj,defaultValue){
			var values = new Array(
									new Array("Ц��","Ц��"),
									new Array("üë","üë"),
									new Array("�۾�","�۾�"),
									new Array("ͷ��","ͷ��"),
									new Array("����","����"),
									new Array("�촽","�촽"),
									new Array("����","����"),
									new Array("����","����"),
									new Array("����","����"),
									new Array("��","��"),
									new Array("�첲","�첲"),
									new Array("�ز�","�ز�"),
									new Array("�β�","�β�"),
									new Array("��","��"),
									new Array("����","����"),
									new Array("û��̫�ر��","û��̫�ر��")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		//��ɫ
		function haircolor(jqueryObj,defaultValue){
			var values = new Array(
									new Array("��ɫ","��ɫ"),
									new Array("��ɫ","��ɫ"),
									new Array("��ɫ","��ɫ"),
									new Array("��ɫ","��ɫ"),
									new Array("��ɫ","��ɫ"),
									new Array("��ɫ","��ɫ"),
									new Array("��ɫ","��ɫ"),
									new Array("��Ⱦ","��Ⱦ"),
									new Array("��ͷ","��ͷ"),
									new Array("����","����")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		//����
		function face(jqueryObj,defaultValue){
			var values = new Array(
									new Array("Բ����","Բ����"),
									new Array("������","������"),
									new Array("������","������"),
									new Array("��������","��������"),
									new Array("Ѽ������","Ѽ������"),
									new Array("��������","��������"),
									new Array("��������","��������"),
									new Array("��������","��������"),
									new Array("����","����")
									);
			structureSelect(jqueryObj,values,defaultValue);
		}
		
					