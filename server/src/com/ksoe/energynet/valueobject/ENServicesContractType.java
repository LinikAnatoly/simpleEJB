//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENServicesContractTypeENServicesContractType;
 */

import java.io.Serializable;

public class ENServicesContractType implements Serializable {

    public static final int TY = 1; // ��
    public static final int OTHERS = 2; // ����
    public static final int SALE = 3; // ������
    public static final int SALE_PAYMENT_SCHEDULE = 4; // ������, ������ ����� �������

    /** ��������� */
    public static final int CONNECTION = 5;

    /** ��� �������� �� ������ - ������������ (����� � ����������) */
	public static final int RELAXATION = 6;

    /** ��� �������� �� ������ - ���������� ������ */
	public static final int OKSN = 7;

    /** ��� �������� �� ������ - ������������� ��� ������������� */
	public static final int PROJECT = 8;
	
    /** ��� �������� �� ������ - ����� ����� */
	public static final int SHIFT_LINES = 9;
	
	/** ��� �������� �� ������ - ������ */
	public static final int OHRINA = 10;
	
    public int code = Integer.MIN_VALUE;
    public String name;
    public static final String tableName = "ENSERVICESCONTRACTTYPE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSERVICESCONTRACTTYPE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENSERVICESCONTRACTTYPE.NAME";

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

} // end of ENServicesContractTypeValueObject
