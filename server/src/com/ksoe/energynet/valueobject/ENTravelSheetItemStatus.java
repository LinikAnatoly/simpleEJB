
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTravelSheetItemStatusENTravelSheetItemStatus;  	
  */

import java.io.Serializable;


public class ENTravelSheetItemStatus implements Serializable {

	public static final int GOOD = 1;
	public static final int CLOSED = 2;
	public static final int CALCULATED = 3;
	public static final int DELETED = 4;
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENTRAVELSHEETITEMSTATS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTRAVELSHEETITEMSTATS.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENTRAVELSHEETITEMSTATS.NAME";


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

} // end of ENTravelSheetItemStatusValueObject

