
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPlanCorrectReasonENPlanCorrectReason;  	
  */

import java.io.Serializable;


public class ENPlanCorrectReason implements Serializable {

	public static final int CHANGE_WORKS = 1;
	public static final int CHANGE_MATERIALS = 2;
	public static final int MOVE_TO_CURRENT = 3;
	public static final int MOVE_TO_NPW = 4;
	public static final int MOVE_TO_FACT = 5;
	public static final int NO_YEAR = 6;
	public static final int MOVE_TO_preCONFIRM = 7;
	public static final int MOVE_TO_CONFIRM = 8;
	public static final int UNDO_MOVE_TO_preCONFIRM = 9;
	public static final int UNDO_MOVE_TO_CONFIRM = 10;
	public static final int PURCHASES_BINDING = 11;
	public static final int CREATE_INCOMPLETE = 12;
	// ѕереход из "кошториса" в мес€чный план
	public static final int MOVE_FROM_CALCULATION_TO_CURRENT = 13;
	
	
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENPLANCORRECTREASON";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPLANCORRECTREASON.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENPLANCORRECTREASON.NAME";


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

} // end of ENPlanCorrectReasonValueObject

