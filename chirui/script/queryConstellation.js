/** �������ռ��� ��Ф������*/
/** ��������ֱ�Ϊ����� �·�  ����  ��Ф�ı����id �����ı����id*/
function getpet (birthyear,month,day,lunarnewyear,constellation)
{
	var toyear = 1997;
	var birthpet="Ox";
	var star = "";
	var x = (toyear - birthyear) % 12;

	if ((x == 1) || (x == -11))
	{
		birthpet="��"; 
	}
	else 
	{
		if (x == 0)
		{
			birthpet="ţ";
		} 
		else
		{
			if ((x == 11) || (x == -1)) 
			{
				birthpet="��";
			}
			else 
			{
				if ((x == 10) || (x == -2)) 
				{
					birthpet="��";
				}
				else 
				{
					if ((x == 9) || (x == -3)) 
					{
						birthpet="��"; 
					}
					else
					{
						if ((x == 8) || (x == -4)) 
						{ 
							birthpet="��";
						}
						else
						{
							if ((x == 7) || (x == -5)) 
							{ 
								birthpet="��";
							}
							else
							{
								if ((x == 6) || (x == -6))
								{
									birthpet="��";
								}
								else
								{
									if ((x == 5) || (x == -7))
									{ 
										birthpet="��";
									}
									else
									{
										if ((x == 4) || (x == -8))
										{
											birthpet="��";
										}
										else
										{
											if ((x == 3) || (x == -9)) 
											{
												birthpet="��";
											}
											else 
											{
												if ((x == 2) || (x == -10))
												{
													birthpet="��";
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}	
	  if (month == 1 && day >= 20 || month == 2 && day <= 18) 
	  {
	  	star = "ˮƿ��";
	  }
	
	  if (month == 2 && day >= 19 || month == 3 && day <= 20) 
	  {
	   	star = "˫����";
	  }
	
	  if (month == 3 && day >= 21 || month == 4 && day <= 19)
	  {
	   	star = "������";
	  }
	
	  if (month == 4 && day >= 20 || month == 5 && day <= 20)
	  {
	   	star = "��ţ��";
	  }
	
	  if (month == 5 && day >= 21 || month == 6 && day <= 21)
	  {
	   	star = "˫����";
	  }
	  
	  if (month == 6 && day >= 22 || month == 7 && day <= 22)
	  {
	   	star = "��з��";
	  }
	
	  if (month == 7 && day >= 23 || month == 8 && day <= 22) 
	  {
	   	star = "ʨ����";
	  }
	
	  if (month == 8 && day >= 23 || month == 9 && day <= 22) 
	  {
	   	star = "��Ů��";
	  }
	
	  if (month == 9 && day >= 23 || month == 10 && day <= 22) 
	  {
	   	star = "�����";
	  }
	
	  if (month == 10 && day >= 23 || month == 11 && day <= 21) 
	  {
	   	star = "��Ы��";
	  }
	
	  if (month == 11 && day >= 22 || month == 12 && day <= 21) 
	  {
	   	star = "������";
	  }
	
	  if (month == 12 && day >= 22 || month == 1 && day <= 19)
	  {
	   	star = "Ħ����";
	  }	
	  /** ���ص�Ϊ ��Ф*/
 		lunarnewyear.value = birthpet;
 	 /** ���ص�Ϊ ����*/
 	 	constellation.value = star;
}