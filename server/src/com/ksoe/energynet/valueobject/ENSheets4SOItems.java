
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSheets4SOItems;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENSheets4SORef;
    import  com.ksoe.energynet.valueobject.references.ENSheets4SOItemsTemplateRef;

public class ENSheets4SOItems implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  contentValue; 
    public String  additionalContent; 

    public ENSheets4SORef sheet4soRef = new ENSheets4SORef();
    public ENSheets4SOItemsTemplateRef sheetItemTemplateRef = new ENSheets4SOItemsTemplateRef();

    public static final String tableName = "ENSHEETS4SOITEMS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSHEETS4SOITEMS.CODE";
    public static final String contentValue_Attr = "contentValue";
    public static final String contentValue_Field = "CONTENTVALUE";
    public static final String contentValue_QFielld = "ENSHEETS4SOITEMS.CONTENTVALUE";
    public static final String additionalContent_Attr = "additionalContent";
    public static final String additionalContent_Field = "ADDITIONALCONTENT";
    public static final String additionalContent_QFielld = "ENSHEETS4SOITEMS.ADDITIONALCONTENT";

    public static final String sheet4soRef_Attr = "sheet4soRef";
    public static final String sheet4soRef_Field = "SHEET4SOREFCODE";
    public static final String  sheet4soRef_QFielld = "ENSHEETS4SOITEMS.SHEET4SOREFCODE";
    public static final String sheetItemTemplateRef_Attr = "sheetItemTemplateRef";
    public static final String sheetItemTemplateRef_Field = "SHEETITEMTEMPLATEREFCD";
    public static final String  sheetItemTemplateRef_QFielld = "ENSHEETS4SOITEMS.SHEETITEMTEMPLATEREFCD";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public String getContentValue(){
       return contentValue;
    }
    
    public void setContentValue(String contentValue){
       this.contentValue = contentValue;
    }


    public String getAdditionalContent(){
       return additionalContent;
    }
    
    public void setAdditionalContent(String additionalContent){
       this.additionalContent = additionalContent;
    }

    public ENSheets4SORef getSheet4soRef(){
       return sheet4soRef;
    }
    
    public void setSheet4soRef(ENSheets4SORef sheet4soRef){
       this.sheet4soRef = sheet4soRef;
    }
    public ENSheets4SOItemsTemplateRef getSheetItemTemplateRef(){
       return sheetItemTemplateRef;
    }
    
    public void setSheetItemTemplateRef(ENSheets4SOItemsTemplateRef sheetItemTemplateRef){
       this.sheetItemTemplateRef = sheetItemTemplateRef;
    }

} // end of ENSheets4SOItemsValueObject

