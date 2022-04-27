
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTechCond2PlanWork;  	
  */

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.ENPlanWorkRef;
import com.ksoe.energynet.valueobject.references.ENTechConditionsServicesRef;

public class ENTechCond2PlanWork implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public ENTechConditionsServicesRef techConServicesRef = new ENTechConditionsServicesRef();
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public static final String tableName = "ENTECHCOND2PLANWORK";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTECHCOND2PLANWORK.CODE";
    public static final String techConServicesRef_Attr = "techConServicesRef";
    public static final String techConServicesRef_Field = "TECHCONSERVICESREFCODE";
    public static final String  techConServicesRef_QFielld = "ENTECHCOND2PLANWORK.TECHCONSERVICESREFCODE";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENTECHCOND2PLANWORK.PLANREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setTechConServicesRef(ENTechConditionsServicesRef aValue){
       techConServicesRef = aValue;
    }

    public ENTechConditionsServicesRef getTechConServicesRef(){
       return techConServicesRef;
    }
    public void setPlanRef(ENPlanWorkRef aValue){
       planRef = aValue;
    }

    public ENPlanWorkRef getPlanRef(){
       return planRef;
    }

} // end of ENTechCond2PlanWorkValueObject

