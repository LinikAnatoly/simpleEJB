//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENServicesContractStatusENServicesContractStatus;
 */

import java.io.Serializable;

public class ENServicesContractStatus implements Serializable {

    public static final int GOOD = 1; // ��������
    // public static final int DRAFT = 1; // ��������
    public static final int CANCELED = 2; // ³�������
    public static final int BUDGETAPPROVED = 3; // �������� ������������
    public static final int SIGNED = 4; // ϳ��������
    public static final int PAID = 5; // ���������

    /** ��� ������-�������� ��������� �������� */
    public static final int ACT_SIGNED = 6;

    /** ������ �������� - ������ ��������� */
    public static final int COMPLETED = 7;
    /** ������ �������� � ������������� - ���������� */
    public static final int TERMINATED = 8;
    /** ������ �������� � ������������� - ������� ��������������� ���� */
    public static final int PREPAID = 9;

    /** ����� ��������� �� ����� */
    public static final int DISCLAIMER_CUSTOMER_SERVICES = 10;
    /** ������� ������ ��� �� :) */
    public static final int CLOSED = 11;


    public int code = Integer.MIN_VALUE;
    public String name;
    public static final String tableName = "ENSERVICESCONTRACTSTTS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSERVICESCONTRACTSTTS.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENSERVICESCONTRACTSTTS.NAME";

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

} // end of ENServicesContractStatusValueObject