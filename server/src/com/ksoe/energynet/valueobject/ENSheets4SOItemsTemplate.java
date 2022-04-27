
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSheets4SOItemsTemplate;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENSheets4SOItemsTemplate implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  name; 
    public String  templateValue; 


    public static final String tableName = "ENSHEETS4SOITEMSTEMPLT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSHEETS4SOITEMSTEMPLT.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENSHEETS4SOITEMSTEMPLT.NAME";
    public static final String templateValue_Attr = "templateValue";
    public static final String templateValue_Field = "TEMPLATEVALUE";
    public static final String templateValue_QFielld = "ENSHEETS4SOITEMSTEMPLT.TEMPLATEVALUE";




    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public String getName(){
       return name;
    }
    
    public void setName(String name){
       this.name = name;
    }


    public String getTemplateValue(){
       return templateValue;
    }
    
    public void setTemplateValue(String templateValue){
       this.templateValue = templateValue;
    }


} // end of ENSheets4SOItemsTemplateValueObject

