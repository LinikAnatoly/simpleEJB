
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for SCUsageInputItemKind;  	
  */

import java.io.Serializable;


public class SCUsageInputItemKind implements Serializable {

	public static final int UsageInput = 1;	
	public static final int UsageOut = 2;
	public static final int InputUsing = 3;
	
	public static final int UsageInputZKU = 4;
	public static final int UsageInputInZKU = 5;
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "SCUSAGEINPUTITEMKIND";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "SCUSAGEINPUTITEMKIND.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "SCUSAGEINPUTITEMKIND.NAME";


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


} // end of SCUsageInputItemKindValueObject

