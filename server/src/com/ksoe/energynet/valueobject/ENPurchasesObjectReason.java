
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPurchasesObjectReasonENPurchasesObjectReason;
  */

import java.io.Serializable;


public class ENPurchasesObjectReason implements Serializable {

	/** Поповнення фонду АВЗ */
	public static final int PURCHASES_AVZ = 1;

    public int  code = Integer.MIN_VALUE;
    public String  name;
    public static final String tableName = "ENPURCHASESOBJECTREASN";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPURCHASESOBJECTREASN.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENPURCHASESOBJECTREASN.NAME";


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

} // end of ENPurchasesObjectReasonValueObject

