
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for SCCounterKind;  	
  */

import java.io.Serializable;


public class SCCounterKind implements Serializable {

	public static final int  FOR_MOVED = 1;
	public static final int  FOR_FACT = 2;
	public static final int  FOR_WRITEOFF = 3;
	public static final int  FOR_PRIHOD = 4;   /* ��� ������� */
	public static final int  FOR_WORKORDERBYT = 5; /* ��� �������� ������� ����������� */
	/** ���� ���� ���������*/
	public static final int  FOR_ZONECHANGING = 6;
	/** ��� ���� ���������-�������� ��������� �� ����������*/
	public static final int FOR_ACT_COUNTER_EXPERTISE = 8;
	/** ��� ���������� �������������� ��������� ��� �������� � �������� ���*/	
	public static final int FOR_SERVICES_RERESERVING = 9;
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "SCCOUNTERKIND";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "SCCOUNTERKIND.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "SCCOUNTERKIND.NAME";


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


} // end of SCCounterKindValueObject

