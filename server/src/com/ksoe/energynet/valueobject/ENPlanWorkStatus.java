
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPlanWorkStatusENPlanWorkStatus;  	
  */

import java.io.Serializable;


public class ENPlanWorkStatus implements Serializable {

	public static final int GOOD = 1;
	public static final int CANCELED_ = 2;
	public static final int LOCKED = 3;
	public static final int INCORRECTION = 4;
	public static final int CORRECTED = 5;
	public static final int OLDER = 6;
	
	public static final int PRECONFIRMED = 7;
	
	public static final int WORKS_FINISHED = 8; // Работы завершены 
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENPLANWORKSTATUS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPLANWORKSTATUS.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENPLANWORKSTATUS.NAME";


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

} // end of ENPlanWorkStatusValueObject

