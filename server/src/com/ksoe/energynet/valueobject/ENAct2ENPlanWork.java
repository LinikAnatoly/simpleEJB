
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENAct2ENPlanWorkENAct2ENPlanWork;  	
  */

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.ENActRef;

public class ENAct2ENPlanWork implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public long  modify_time = Long.MIN_VALUE;
    public ENActRef actRef = new ENActRef();
    public ENPlanWork plan = new ENPlanWork();
    public static final String tableName = "ENACT2ENPLANWORK";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACT2ENPLANWORK.CODE";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENACT2ENPLANWORK.MODIFY_TIME";
    public static final String actRef_Attr = "actRef";
    public static final String actRef_Field = "ACTREFCODE";
    public static final String  actRef_QFielld = "ENACT2ENPLANWORK.ACTREFCODE";
    public static final String plan_Attr = "plan";
    public static final String plan_Field = "PLANCODE";
    public static final String  plan_QFielld = "ENACT2ENPLANWORK.PLANCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

;
    public void setActRef(ENActRef aValue){
       actRef = aValue;
    }

    public ENActRef getActRef(){
       return actRef;
    }
    public void setPlan(ENPlanWork aValue){
       plan = aValue;
    }

    public ENPlanWork getPlan(){
       return plan;
    }

} // end of ENAct2ENPlanWorkValueObject

