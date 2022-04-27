
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENEstimateItemStatusENEstimateItemStatus;
  */

import java.io.Serializable;


public class ENEstimateItemStatus implements Serializable {

	public static final int PLANNED = 1;
	public static final int ORDERED = 2;
	//public static final int DELIVERED = 3;
	//public static final int IN_SKLAD = 3;
	//public static final int USING = 4;

	//public static final int IN_SKLAD_OE_ = 3;
	//public static final int IN_SKLAD_REM_ = 4;
	//public static final int IN_MOL_ = 5;

	public static final int PRESENT = 3;
	//public static final int USED = 6;
	public static final int MOVED = 4;
	public static final int UNUSED = 5; // "��������� ���������"
	public static final int IN_EXPLOITATION = 6;
	public static final int WRITE_OFF = 7;
	public static final int BY_TRUCKING = 8;

	public static final int KSOE = 9;  // ������� ���
	
	public static final int OWN_PRODUCTION = 10;  // ������ �����������

	
/*
 * code	name
1	������������
2	����������
3	� ��������
1000	Temp
4000	�� ����� ���
5000	� ����
6000	�����������
 */
    public int  code = Integer.MIN_VALUE;
    public String  name;
    public static final String tableName = "ENESTIMATEITEMSTATUS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENESTIMATEITEMSTATUS.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENESTIMATEITEMSTATUS.NAME";


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

} // end of ENEstimateItemStatusValueObject

