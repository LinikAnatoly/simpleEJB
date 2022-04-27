package com.ksoe.energynet.valueobject;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Vector;

public class SCCounterSetupInfo //implements Serializable
{

	public int scCode = Integer.MIN_VALUE;
	public String installInfo;
	public String installPlace;
	public Date installDate;
	
/*
 * P_NUMAKT Varchar2, -- Номер акта модернизации
P_DATEAKT Date, -- Дата акта модернизации
P_SUMAKT Number, -- Сумма по акту
P_SUMAKTMATERIALS Number, -- Сумма материалов	 по акту
P_SUMAKTZARPLATA Number, -- Сумма зарплаты по акту
P_SUMAKTPENSFOND Number, -- Сумма ЕСВ по акту
 */	
	public int actCode;
	public String actNumber;
	public Date actDate;
	public int actTypeCode;
	public BigDecimal actSumGen;
	public BigDecimal actSumTMC;
	public BigDecimal actSumSalary;
	public BigDecimal actSumTax;
	
	public Vector<revisionData> workerData;
	public String lschet;
	public BigDecimal actSumTMC_BU;
	
	public class revisionData{
		public String tabNumber;
		public String balans;
		public BigDecimal salary;
		public BigDecimal tax;
	}
}
