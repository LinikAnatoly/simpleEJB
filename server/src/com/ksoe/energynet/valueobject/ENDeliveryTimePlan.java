
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENDeliveryTimePlanENDeliveryTimePlan;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.references.ENPlanWorkRef;

public class ENDeliveryTimePlan implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  deliveryTimePlan; 
    public BigDecimal  deliveryTimeFact; 
    public BigDecimal  deliveryDistance; 
    public String  commentGen; 
    public long  modify_time = Long.MIN_VALUE;
    public ENPlanWorkRef planWorkRef = new ENPlanWorkRef();
    public static final String tableName = "ENDELIVERYTIMEPLAN";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENDELIVERYTIMEPLAN.CODE";
    public static final String deliveryTimePlan_Attr = "deliveryTimePlan";
    public static final String deliveryTimePlan_Field = "DELIVERYTIMEPLAN";
    public static final String deliveryTimePlan_QFielld = "ENDELIVERYTIMEPLAN.DELIVERYTIMEPLAN";
    public static final String deliveryTimeFact_Attr = "deliveryTimeFact";
    public static final String deliveryTimeFact_Field = "DELIVERYTIMEFACT";
    public static final String deliveryTimeFact_QFielld = "ENDELIVERYTIMEPLAN.DELIVERYTIMEFACT";
    public static final String deliveryDistance_Attr = "deliveryDistance";
    public static final String deliveryDistance_Field = "DELIVERYDISTANCE";
    public static final String deliveryDistance_QFielld = "ENDELIVERYTIMEPLAN.DELIVERYDISTANCE";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENDELIVERYTIMEPLAN.COMMENTGEN";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENDELIVERYTIMEPLAN.MODIFY_TIME";
    public static final String planWorkRef_Attr = "planWorkRef";
    public static final String planWorkRef_Field = "PLANWORKREFCODE";
    public static final String  planWorkRef_QFielld = "ENDELIVERYTIMEPLAN.PLANWORKREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setDeliveryTimePlan(BigDecimal aValue){
       deliveryTimePlan = aValue;
    }

    public BigDecimal getDeliveryTimePlan(){
       return deliveryTimePlan;
    }

    public void setDeliveryTimeFact(BigDecimal aValue){
       deliveryTimeFact = aValue;
    }

    public BigDecimal getDeliveryTimeFact(){
       return deliveryTimeFact;
    }

    public void setDeliveryDistance(BigDecimal aValue){
       deliveryDistance = aValue;
    }

    public BigDecimal getDeliveryDistance(){
       return deliveryDistance;
    }

    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

;
    public void setPlanWorkRef(ENPlanWorkRef aValue){
       planWorkRef = aValue;
    }

    public ENPlanWorkRef getPlanWorkRef(){
       return planWorkRef;
    }

} // end of ENDeliveryTimePlanValueObject

