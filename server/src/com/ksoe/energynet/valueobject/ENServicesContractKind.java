//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENServicesContractKind;
 */

import java.io.Serializable;

public class ENServicesContractKind implements Serializable {

	/** ����������� - ��� ��������������� � ����� */
	public static final int UNDEFINED = 0;

	/** ��� �������� �� ������ �� ������� - ������ */
	public static final int SERVICES = 1;

	/** ��� �������� �� ������ �� ������� - ������� */
	public static final int SALE = 2;

	/** ��� �������� �� ������ - ������������ (����� � ����������) */
	public static final int RELAXATION = 3;

	/** ��� �������� �� ������ - �������� ������ */
	public static final int OKSN_RENT = 4;

	/** ��� �������� �� ������ - �������� �� ���������� ������ */
	public static final int OKSN_WORK = 5;

	/** ��� �������� �� ������ - �������� �� ������ �������(����������) � �������������� */
	public static final int OKSN_TU = 6;

	/** ��� �������� �� ������ - �������� �� ������������ ������� */
	public static final int OKSN_AGREE = 7;

	/** ��� �������� �� ������ - �������� �� ������ �������*/
	public static final int OKSN_ACCESS = 8;

	/** ��� �������� �� ������ - �������� �� �������� ��� �� ��*/
	public static final int OKSN_TU_MODIFY = 9;

	/** ��� �������� �� ������ - �������� �� ������������ ��� ���������*/
	public static final int PROJECT = 10;

	/** ��� �������� �� ������ - �������� �� ����� ����������� ����� ��'���� ������*/
	public static final int SHIFT_LINES_COMPANY_OBJ = 11;

	/** ��� �������� �� ������ - �������� �� ����� ����������� ����� ��'���� ���������*/
	public static final int SHIFT_LINES_CUSTOMER_OBJ = 12;

	/** ��� �������� �� ������ - ������ ��������*/
	public static final int GUARD = 13;

	/** ��� �������� �� ������ - �������� � ��������������� �/� */
	public static final int SUPPLIER_CONTRACT = 14;

	/** ����������� ������� */
	public static final int INFORMATIONAL_SERVICES = 15;

	/** ���� ��������� ������� */
	public static final int OTHER_NOT_LICENSED = 16;
	
	/** ����� �� (��,��) */
	public static final int REMOVAL_LINE_RM_KB = 17;
	
	/** ������� ����� (�����) */
	public static final int SERVICES_LUZOD_ASKOE = 18;

	public int code = Integer.MIN_VALUE;
	public String name;
	public static final String tableName = "ENSERVICESCONTRACTKIND";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENSERVICESCONTRACTKIND.CODE";
	public static final String name_Attr = "name";
	public static final String name_Field = "NAME";
	public static final String name_QFielld = "ENSERVICESCONTRACTKIND.NAME";

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

} // end of ENServicesContractKindValueObject

