
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for FinKodIst;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class FinKodIst implements Serializable {
    
    /** ������ �� �������, ��������� � �������� (������������) �������������*/
    public static final int MAIN_SERVICES = 4;
    
    /** 267 ������ ���������� �� �� (������������) */
    public static final int RECONSTRUCTION_MODERNIZATION = 1;
    /** 268 ������ ���������� ��� ������� ��������� �� */
    public static final int CAPITAL_BUILDER = 9;
    /** 66 ������ ���������� 20XX */
    public static final int TECHNICAL_MAINTENANCE = 5;
    /** 266 �������� ����� ��� ������� ��������� � ��� */
    public static final int TECHNICAL_MAINTENANCE_WITH_COUNTERS_ZKU = 2;
    

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public int  value = Integer.MIN_VALUE; 
    public static final String tableName = "FINKODIST";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "FINKODIST.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "FINKODIST.NAME";
    public static final String value_Attr = "value";
    public static final String value_Field = "VALUE";
    public static final String value_QFielld = "FINKODIST.VALUE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }


    public void setValue(int aValue){
       value = aValue;
    }

    public int getValue(){
       return value;
    }


} // end of FinKodIstValueObject

