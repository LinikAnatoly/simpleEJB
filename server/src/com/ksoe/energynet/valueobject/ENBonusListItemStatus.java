
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENBonusListItemStatus;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;



public class ENBonusListItemStatus implements Serializable {
	
	public static final int VALID = 1;
	public static final int INVALID = 2;

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENBONUSLISTITEMSTATUS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENBONUSLISTITEMSTATUS.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENBONUSLISTITEMSTATUS.NAME";



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


} // end of ENBonusListItemStatusValueObject

