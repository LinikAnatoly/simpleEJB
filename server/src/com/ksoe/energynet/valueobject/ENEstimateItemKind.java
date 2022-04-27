
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENEstimateItemKindENEstimateItemKind;  	
  */

import java.io.Serializable;


public class ENEstimateItemKind implements Serializable {

	public static final int MATERIALS = 1;
	public static final int GSM = 2;
	public static final int UNMOUNT = 3;
	public static final int REFINEMENT = 4;
	public static final int PRODUCED = 5;
	public static final int SERVICES = 6;
	public static final int CUSTOMER_MATERIALS = 7;
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENESTIMATEITEMKIND";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENESTIMATEITEMKIND.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENESTIMATEITEMKIND.NAME";


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

} // end of ENEstimateItemKindValueObject

