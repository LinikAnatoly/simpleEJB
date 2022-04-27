
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTravelSheetItemKindENTravelSheetItemKind;  	
  */

import java.io.Serializable;


public class ENTravelSheetItemKind implements Serializable {

	public static final int PLAN = 1;
	public static final int FACT = 2;
	
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENTRAVELSHEETITEMKIND";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTRAVELSHEETITEMKIND.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENTRAVELSHEETITEMKIND.NAME";


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

} // end of ENTravelSheetItemKindValueObject

