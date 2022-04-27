
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENEstimateItem2TypeENEstimateItem2Type;  	
  */

import java.io.Serializable;


public class ENEstimateItem2Type implements Serializable {

	public static final int PLAN_MOVED = 1;
	public static final int OBJECT_MOVED = 2;
	public static final int ESTIMATE_DIVIDED = 3; // ������� ����������
	//public static final int OBJECT_MOVED = 3;
	public static final int INCOMPLETE_ = 4; //
	
	public static final int COUNTER_MOVED = 5; //
	public static final int MOVEDFORWRITING = 6; // ������� ��������� ���������� � ������������  � ���� �� ��������
	public static final int UNMOUNT_WRITE_OFF = 7; // ������ �������������� ��������� � ���������� ������� ����������� (�������� ������� ������)
	
	public static final int MOVEDFORWRITING_MANUAL_REMOVE = 8; // ������� ��������� ���������� � ������������  � ���� �� �������� ( ��� ������ ����������� ���� ��� �������� ����������� (�.� ��� �������� �������� �� �� ) )
    public static final int TRANSFORM_MATERIAL = 9; // ������� ��������� ���������� � ������������  � ���� �� �������� ( ��� ������ ����������� ���� ��� �������� ����������� (�.� ��� �������� �������� �� �� ) )


    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENESTIMATEITEM2TYPE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENESTIMATEITEM2TYPE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENESTIMATEITEM2TYPE.NAME";


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

;

} // end of ENEstimateItem2TypeValueObject

