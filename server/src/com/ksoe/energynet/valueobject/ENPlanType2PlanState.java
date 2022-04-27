
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPlanType2PlanStateENPlanType2PlanState;  	
  */

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.ENPlanWorkStateRef;
import com.ksoe.energynet.valueobject.references.ENPlanWorkTypeRef;

public class ENPlanType2PlanState implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public ENPlanWorkTypeRef typeRef = new ENPlanWorkTypeRef();
    public ENPlanWorkStateRef stateRef = new ENPlanWorkStateRef();
    public static final String tableName = "ENPLANTYPE2PLANSTATE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPLANTYPE2PLANSTATE.CODE";
    public static final String typeRef_Attr = "typeRef";
    public static final String typeRef_Field = "TYPEREFCODE";
    public static final String  typeRef_QFielld = "ENPLANTYPE2PLANSTATE.TYPEREFCODE";
    public static final String stateRef_Attr = "stateRef";
    public static final String stateRef_Field = "STATEREFCODE";
    public static final String  stateRef_QFielld = "ENPLANTYPE2PLANSTATE.STATEREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

;
    public void setTypeRef(ENPlanWorkTypeRef aValue){
       typeRef = aValue;
    }

    public ENPlanWorkTypeRef getTypeRef(){
       return typeRef;
    }
    public void setStateRef(ENPlanWorkStateRef aValue){
       stateRef = aValue;
    }

    public ENPlanWorkStateRef getStateRef(){
       return stateRef;
    }

} // end of ENPlanType2PlanStateValueObject

