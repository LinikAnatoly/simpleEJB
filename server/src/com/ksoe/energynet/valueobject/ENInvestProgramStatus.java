
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENInvestProgramStatus;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENInvestProgramStatus implements Serializable {
	
	/** ������ �� - "��������" */
	public static final int DRAFT = 1;
	/** ������ �� - "������������" */
	public static final int APPROVED = 2;
	/** ������ �� - "�����������" */
	public static final int IN_PROGRESS = 3;
	/** ������ �� - "�������������� ���������" */
	public static final int FINANCING_COMPLETED = 4;	
	/** ������ �� - "���������" */
	public static final int COMPLETED = 5;
	/** ������ �� - "��������" */
	public static final int OLD = 6;
	
	public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENINVESTPROGRAMSTATUS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENINVESTPROGRAMSTATUS.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENINVESTPROGRAMSTATUS.NAME";


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


} // end of ENInvestProgramStatusValueObject

