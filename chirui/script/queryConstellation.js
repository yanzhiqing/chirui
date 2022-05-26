/** 根据生日计算 生肖和星座*/
/** 五个参数分别为：年份 月份  日期  生肖文本框的id 星座文本框的id*/
function getpet (birthyear,month,day,lunarnewyear,constellation)
{
	var toyear = 1997;
	var birthpet="Ox";
	var star = "";
	var x = (toyear - birthyear) % 12;

	if ((x == 1) || (x == -11))
	{
		birthpet="鼠"; 
	}
	else 
	{
		if (x == 0)
		{
			birthpet="牛";
		} 
		else
		{
			if ((x == 11) || (x == -1)) 
			{
				birthpet="虎";
			}
			else 
			{
				if ((x == 10) || (x == -2)) 
				{
					birthpet="兔";
				}
				else 
				{
					if ((x == 9) || (x == -3)) 
					{
						birthpet="龙"; 
					}
					else
					{
						if ((x == 8) || (x == -4)) 
						{ 
							birthpet="蛇";
						}
						else
						{
							if ((x == 7) || (x == -5)) 
							{ 
								birthpet="马";
							}
							else
							{
								if ((x == 6) || (x == -6))
								{
									birthpet="羊";
								}
								else
								{
									if ((x == 5) || (x == -7))
									{ 
										birthpet="猴";
									}
									else
									{
										if ((x == 4) || (x == -8))
										{
											birthpet="鸡";
										}
										else
										{
											if ((x == 3) || (x == -9)) 
											{
												birthpet="狗";
											}
											else 
											{
												if ((x == 2) || (x == -10))
												{
													birthpet="猪";
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
	  	star = "水瓶座";
	  }
	
	  if (month == 2 && day >= 19 || month == 3 && day <= 20) 
	  {
	   	star = "双鱼座";
	  }
	
	  if (month == 3 && day >= 21 || month == 4 && day <= 19)
	  {
	   	star = "白羊座";
	  }
	
	  if (month == 4 && day >= 20 || month == 5 && day <= 20)
	  {
	   	star = "金牛座";
	  }
	
	  if (month == 5 && day >= 21 || month == 6 && day <= 21)
	  {
	   	star = "双子座";
	  }
	  
	  if (month == 6 && day >= 22 || month == 7 && day <= 22)
	  {
	   	star = "巨蟹座";
	  }
	
	  if (month == 7 && day >= 23 || month == 8 && day <= 22) 
	  {
	   	star = "狮子座";
	  }
	
	  if (month == 8 && day >= 23 || month == 9 && day <= 22) 
	  {
	   	star = "处女座";
	  }
	
	  if (month == 9 && day >= 23 || month == 10 && day <= 22) 
	  {
	   	star = "天秤座";
	  }
	
	  if (month == 10 && day >= 23 || month == 11 && day <= 21) 
	  {
	   	star = "天蝎座";
	  }
	
	  if (month == 11 && day >= 22 || month == 12 && day <= 21) 
	  {
	   	star = "射手座";
	  }
	
	  if (month == 12 && day >= 22 || month == 1 && day <= 19)
	  {
	   	star = "摩羯座";
	  }	
	  /** 返回的为 生肖*/
 		lunarnewyear.value = birthpet;
 	 /** 返回的为 星座*/
 	 	constellation.value = star;
}