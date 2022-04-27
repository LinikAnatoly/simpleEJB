
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTravelSheetTypeENTravelSheetType;  	
  */

import java.io.Serializable;


public class ENTravelSheetType implements Serializable {

	public static final int LEGKOVOY = 1;	
	public static final int GRUZOVOY = 2;
	public static final int KRAN = 3;
	public static final int AVTOBUS_LEGKOVOY = 4;
	public static final int AVTOBUS_GRUZOVOY = 5;
	public static final int TRAKTOR = 6;
	public static final int GRUZOVOY_VISHKA = 7;
	
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENTRAVELSHEETTYPE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTRAVELSHEETTYPE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENTRAVELSHEETTYPE.NAME";


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

} // end of ENTravelSheetTypeValueObject

