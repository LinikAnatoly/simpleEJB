
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENEstimateItem2Plan;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENEstimateItemRef;
    import  com.ksoe.energynet.valueobject.references.ENPlanWorkRef;
    import  com.ksoe.energynet.valueobject.references.ENEstimateItem2PlanTypeRef;

public class ENEstimateItem2Plan implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public long  modify_time = Long.MIN_VALUE;
    public String  userGen; 
    public Date dateEdit ;
    public ENEstimateItemRef estimateItemRef = new ENEstimateItemRef();
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public ENEstimateItem2PlanTypeRef typeRef = new ENEstimateItem2PlanTypeRef();
    public static final String tableName = "ENESTIMATEITEM2PLAN";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENESTIMATEITEM2PLAN.CODE";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENESTIMATEITEM2PLAN.MODIFY_TIME";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENESTIMATEITEM2PLAN.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENESTIMATEITEM2PLAN.DATEEDIT";
    public static final String estimateItemRef_Attr = "estimateItemRef";
    public static final String estimateItemRef_Field = "ESTIMATEITEMREFCODE";
    public static final String  estimateItemRef_QFielld = "ENESTIMATEITEM2PLAN.ESTIMATEITEMREFCODE";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENESTIMATEITEM2PLAN.PLANREFCODE";
    public static final String typeRef_Attr = "typeRef";
    public static final String typeRef_Field = "TYPEREFCODE";
    public static final String  typeRef_QFielld = "ENESTIMATEITEM2PLAN.TYPEREFCODE";


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

    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }


    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }

    public void setEstimateItemRef(ENEstimateItemRef aValue){
       estimateItemRef = aValue;
    }

    public ENEstimateItemRef getEstimateItemRef(){
       return estimateItemRef;
    }
    public void setPlanRef(ENPlanWorkRef aValue){
       planRef = aValue;
    }

    public ENPlanWorkRef getPlanRef(){
       return planRef;
    }
    public void setTypeRef(ENEstimateItem2PlanTypeRef aValue){
       typeRef = aValue;
    }

    public ENEstimateItem2PlanTypeRef getTypeRef(){
       return typeRef;
    }

} // end of ENEstimateItem2PlanValueObject

