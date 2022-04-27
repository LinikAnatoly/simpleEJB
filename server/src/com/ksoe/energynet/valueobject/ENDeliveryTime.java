
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENDeliveryTimeENDeliveryTime;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.references.ENHumenItemRef;

public class ENDeliveryTime implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  deliveryTimePlan; 
    public BigDecimal  deliveryTimeFact; 
    public String  commentGen; 
    public long  modify_time = Long.MIN_VALUE;
    public ENDeliveryKind deliveryKind = new ENDeliveryKind();
    public ENHumenItemRef humenItemRef = new ENHumenItemRef();
    public static final String tableName = "ENDELIVERYTIME";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENDELIVERYTIME.CODE";
    public static final String deliveryTimePlan_Attr = "deliveryTimePlan";
    public static final String deliveryTimePlan_Field = "DELIVERYTIMEPLAN";
    public static final String deliveryTimePlan_QFielld = "ENDELIVERYTIME.DELIVERYTIMEPLAN";
    public static final String deliveryTimeFact_Attr = "deliveryTimeFact";
    public static final String deliveryTimeFact_Field = "DELIVERYTIMEFACT";
    public static final String deliveryTimeFact_QFielld = "ENDELIVERYTIME.DELIVERYTIMEFACT";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENDELIVERYTIME.COMMENTGEN";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENDELIVERYTIME.MODIFY_TIME";
    public static final String deliveryKind_Attr = "deliveryKind";
    public static final String deliveryKind_Field = "DELIVERYKINDCODE";
    public static final String  deliveryKind_QFielld = "ENDELIVERYTIME.DELIVERYKINDCODE";
    public static final String humenItemRef_Attr = "humenItemRef";
    public static final String humenItemRef_Field = "HUMENITEMREFCODE";
    public static final String  humenItemRef_QFielld = "ENDELIVERYTIME.HUMENITEMREFCODE";


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
    public void setDeliveryKind(ENDeliveryKind aValue){
       deliveryKind = aValue;
    }

    public ENDeliveryKind getDeliveryKind(){
       return deliveryKind;
    }
    public void setHumenItemRef(ENHumenItemRef aValue){
       humenItemRef = aValue;
    }

    public ENHumenItemRef getHumenItemRef(){
       return humenItemRef;
    }

} // end of ENDeliveryTimeValueObject

