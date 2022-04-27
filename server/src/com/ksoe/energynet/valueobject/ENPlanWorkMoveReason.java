
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPlanWorkMoveReasonENPlanWorkMoveReason;  	
  */

import java.io.Serializable;


public class ENPlanWorkMoveReason implements Serializable {

	public static final int NO_OFF_ENELEMENT = 1;
	public static final int NO_WORKERS = 2;
	public static final int NO_MATERIALS = 3;
	//public static final int NO_YEAR = 4;
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENPLANWORKMOVEREASON";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPLANWORKMOVEREASON.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENPLANWORKMOVEREASON.NAME";


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

} // end of ENPlanWorkMoveReasonValueObject

