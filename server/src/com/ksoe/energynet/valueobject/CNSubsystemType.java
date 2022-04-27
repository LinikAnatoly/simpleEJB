
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for CNSubsystemTypeCNSubsystemType;
  */

import java.io.Serializable;


public class CNSubsystemType implements Serializable {

	public static final int SS_CONNECTION = 1; //�������������
	public static final int SS_SUPPLY = 2; //�������� �/�
	public static final int SS_TECHTERMS = 3; //������������ ����������� ��
	public static final int SS_PHYSICALPERSON = 4; //�������� (���)
	public static final int SS_CONSULTATIVECENTER = 5; //���������������� �����
	public static final int SS_PLANTASK = 6; //������������ �������� ������������
	public static final int SS_PLANSALEELECTRICPOWER = 7; //������������ ����� �����������
	public static final int SS_CONTROLQUALITY = 8; //�������� ��������
	public static final int SS_JOINTSUPPLY = 9; //���������� ��������
	public static final int SS_REQUESTSLEGALSECTOR = 10; //��������� ������ ����������� ���
	public static final int SS_LABOURPROTECTIONFIRESAFETY = 11; //������ ����� � �������� ������������
	public static final int SS_MAKEALTERATION = 12; //�������� ��������� � ��
	public static final int SS_NEWCONNECTION = 13; //������������� � 01.08.2010
	public static final int SS_REALIZATIONPURCHASES = 14; //������������� ������� �������
	public static final int SS_SPECFACILITESMOTORUSE = 15; //������������� ����������� ������� � ��������������
	public static final int SS_ADMITTANCEORGANIZER = 16; //����������� �������
	public static final int SS_CHANGEBUSINESSPROCESS = 17; //��������� ������-���������
	public static final int SS_CONNECTION_20110314 = 18; //������������� � 14.03.2011 �.
	public static final int SS_ELECTRICINSTALLATION = 19; //������������ �������� ����������������� ���������������� ����������
	public static final int SS_ELECTRICINSTALLACCESSPOWER = 20; //������������� � 01.03.2013 �.
	public static final int SS_PREPARATIONOUTPUTDATA = 21; //���������� �������� ������ ��� ��� - �������-�������������� ����������� ������� */
	public static final int SS_ELECTRICITYMETERING = 22; //��������� ����� � �����
	public static final int SS_BUYSOLARENERGY = 23; //������� ��������� ��������������
	public static final int SS_FIBEROPTICCOMJOINTSUSPENS = 24; //���������� ������ ���������-���������� ����� �����
	public static final int SS_REIMBURSEMENT = 25; //����� ������������
	public static final int SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER = 26; //������������� � 19.04.2018 �.
	public static final int SS_ENERGY_MARKET = 27; //�������� ��� "���������������" � �������������� "�����������"
	public static final int SS_ELECTRICITY_METER_EXAMINATION = 31; //���������� ��������� ��������������
	public static final int SS_DISTRIBUTION = 32; // �������� �� ������������� �/�
	public static final int SS_ACTS = 666; // ���� ��������� ���� (��� � ����)



	public int code = Integer.MIN_VALUE;
	public String name;
	public static final String tableName = "CNSUBSYSTEMTYPE";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "CNSUBSYSTEMTYPE.CODE";
	public static final String name_Attr = "name";
	public static final String name_Field = "NAME";
	public static final String name_QFielld = "CNSUBSYSTEMTYPE.NAME";



	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setName(String aValue) {
		name = aValue;
	}

	public String getName() {
		return name;
	}

} // end of CNSubsystemTypeValueObject
