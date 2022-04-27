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
 * P_NUMAKT Varchar2, -- ����� ���� ������������
P_DATEAKT Date, -- ���� ���� ������������
P_SUMAKT Number, -- ����� �� ����
P_SUMAKTMATERIALS Number, -- ����� ����������	 �� ����
P_SUMAKTZARPLATA Number, -- ����� �������� �� ����
P_SUMAKTPENSFOND Number, -- ����� ��� �� ����
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
