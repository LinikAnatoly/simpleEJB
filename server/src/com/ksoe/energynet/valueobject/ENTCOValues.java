
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTCOValues;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENTechConditionsObjectsRef;
    import  com.ksoe.energynet.valueobject.references.ENTCOValuesTypeRef;

public class ENTCOValues implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  description; 
    public ENTechConditionsObjectsRef techconditionsobjects = new ENTechConditionsObjectsRef();
    public ENTCOValuesTypeRef tcoValuesType = new ENTCOValuesTypeRef();
    public static final String tableName = "ENTCOVALUES";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTCOVALUES.CODE";
    public static final String description_Attr = "description";
    public static final String description_Field = "DESCRIPTION";
    public static final String description_QFielld = "ENTCOVALUES.DESCRIPTION";
    public static final String techconditionsobjects_Attr = "techconditionsobjects";
    public static final String techconditionsobjects_Field = "TECHCONDITIONSOBJCTSCD";
    public static final String  techconditionsobjects_QFielld = "ENTCOVALUES.TECHCONDITIONSOBJCTSCD";
    public static final String tcoValuesType_Attr = "tcoValuesType";
    public static final String tcoValuesType_Field = "TCOVALUESTYPECODE";
    public static final String  tcoValuesType_QFielld = "ENTCOVALUES.TCOVALUESTYPECODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setDescription(String aValue){
       description = aValue;
    }

    public String getDescription(){
       return description;
    }

    public void setTechconditionsobjects(ENTechConditionsObjectsRef aValue){
       techconditionsobjects = aValue;
    }

    public ENTechConditionsObjectsRef getTechconditionsobjects(){
       return techconditionsobjects;
    }
    public void setTcoValuesType(ENTCOValuesTypeRef aValue){
       tcoValuesType = aValue;
    }

    public ENTCOValuesTypeRef getTcoValuesType(){
       return tcoValuesType;
    }

} // end of ENTCOValuesValueObject

