
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPlanWorkItem2PlanWorkItem;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.references.ENPlanWorkItem2PlanWorkItemTypeRef;
import com.ksoe.energynet.valueobject.references.ENPlanWorkItemRef;

public class ENPlanWorkItem2PlanWorkItem implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  countGen; 
    public long  modify_time = Long.MIN_VALUE;
    public ENPlanWorkItem2PlanWorkItemTypeRef typeRef = new ENPlanWorkItem2PlanWorkItemTypeRef();
    public ENPlanWorkItemRef planItemInRef = new ENPlanWorkItemRef();
    public ENPlanWorkItemRef planItemOutRef = new ENPlanWorkItemRef();
    public static final String tableName = "ENPLANWORKITM2PLNWRKTM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPLANWORKITM2PLNWRKTM.CODE";
    public static final String countGen_Attr = "countGen";
    public static final String countGen_Field = "COUNTGEN";
    public static final String countGen_QFielld = "ENPLANWORKITM2PLNWRKTM.COUNTGEN";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENPLANWORKITM2PLNWRKTM.MODIFY_TIME";
    public static final String typeRef_Attr = "typeRef";
    public static final String typeRef_Field = "TYPEREFCODE";
    public static final String  typeRef_QFielld = "ENPLANWORKITM2PLNWRKTM.TYPEREFCODE";
    public static final String planItemInRef_Attr = "planItemInRef";
    public static final String planItemInRef_Field = "PLANITEMINREFCODE";
    public static final String  planItemInRef_QFielld = "ENPLANWORKITM2PLNWRKTM.PLANITEMINREFCODE";
    public static final String planItemOutRef_Attr = "planItemOutRef";
    public static final String planItemOutRef_Field = "PLANITEMOUTREFCODE";
    public static final String  planItemOutRef_QFielld = "ENPLANWORKITM2PLNWRKTM.PLANITEMOUTREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setCountGen(BigDecimal aValue){
       countGen = aValue;
    }

    public BigDecimal getCountGen(){
       return countGen;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

;
    public void setTypeRef(ENPlanWorkItem2PlanWorkItemTypeRef aValue){
       typeRef = aValue;
    }

    public ENPlanWorkItem2PlanWorkItemTypeRef getTypeRef(){
       return typeRef;
    }
    public void setPlanItemInRef(ENPlanWorkItemRef aValue){
       planItemInRef = aValue;
    }

    public ENPlanWorkItemRef getPlanItemInRef(){
       return planItemInRef;
    }
    public void setPlanItemOutRef(ENPlanWorkItemRef aValue){
       planItemOutRef = aValue;
    }

    public ENPlanWorkItemRef getPlanItemOutRef(){
       return planItemOutRef;
    }

} // end of ENPlanWorkItem2PlanWorkItemValueObject

