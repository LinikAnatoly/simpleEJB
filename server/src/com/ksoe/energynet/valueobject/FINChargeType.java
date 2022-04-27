
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for FINChargeType;  	
  */

import java.io.Serializable;


public class FINChargeType implements Serializable {
	
	public static final int IS_NOT_INVALID = 1; // призн отчислений с обычного работника
	public static final int IS_INVALID = 2; // признак отчислений как с инвалидов
	
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "FINCHARGETYPE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "FINCHARGETYPE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "FINCHARGETYPE.NAME";


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


} // end of FINChargeTypeValueObject

