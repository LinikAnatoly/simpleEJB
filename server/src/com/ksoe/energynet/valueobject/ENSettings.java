
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSettings;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENSettings implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE; 
    public String  key; 
    public String  comment;
    
    public String currentValue;
    
    public static final String tableName = "ENSETTINGS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSETTINGS.CODE";
    public static final String key_Attr = "key";
    public static final String key_Field = "KEY";
    public static final String key_QFielld = "ENSETTINGS.KEY";
    public static final String comment_Attr = "comment";
    public static final String comment_Field = "COMMENT";
    public static final String comment_QFielld = "ENSETTINGS.COMMENT";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setKey(String aValue){
       key = aValue;
    }

    public String getKey(){
       return key;
    }


    public void setComment(String aValue){
       comment = aValue;
    }

    public String getComment(){
       return comment;
    }
    
    public void setCurrentValue(String aValue){
        currentValue = aValue;
     }

     public String getCurrentValue(){
        return currentValue;
     }


} // end of ENSettingsValueObject

