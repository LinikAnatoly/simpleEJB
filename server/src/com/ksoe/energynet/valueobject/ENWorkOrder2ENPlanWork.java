
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENWorkOrder2ENPlanWorkENWorkOrder2ENPlanWork;  	
  */

import java.io.Serializable;

public class ENWorkOrder2ENPlanWork implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public long  modify_time = Long.MIN_VALUE;
    public ENWorkOrder workOrder = new ENWorkOrder();
    public ENPlanWork plan = new ENPlanWork();
    public static final String tableName = "ENWORKORDER2ENPLANWORK";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENWORKORDER2ENPLANWORK.CODE";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENWORKORDER2ENPLANWORK.MODIFY_TIME";
    public static final String workOrder_Attr = "workOrder";
    public static final String workOrder_Field = "WORKORDERCODE";
    public static final String  workOrder_QFielld = "ENWORKORDER2ENPLANWORK.WORKORDERCODE";
    public static final String plan_Attr = "plan";
    public static final String plan_Field = "PLANCODE";
    public static final String  plan_QFielld = "ENWORKORDER2ENPLANWORK.PLANCODE";


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
    public void setWorkOrder(ENWorkOrder aValue){
       workOrder = aValue;
    }

    public ENWorkOrder getWorkOrder(){
       return workOrder;
    }
    public void setPlan(ENPlanWork aValue){
       plan = aValue;
    }

    public ENPlanWork getPlan(){
       return plan;
    }

} // end of ENWorkOrder2ENPlanWorkValueObject

