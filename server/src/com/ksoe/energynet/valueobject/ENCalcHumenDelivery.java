
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENCalcHumenDelivery;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.references.ENPlanWork2ClassificationTypeRef;
import com.ksoe.energynet.valueobject.references.ENPlanWorkRef;

public class ENCalcHumenDelivery implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  numberGen = Integer.MIN_VALUE; 
    public String  classificationTypeNumber; 
    public BigDecimal  priceHour; 
    public BigDecimal  timeGen; 
    public BigDecimal  costGen; 
    public BigDecimal  chargeCostGen; 
    public BigDecimal  costTotal; 
    public long  modify_time = Long.MIN_VALUE;
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public ENPlanWork2ClassificationTypeRef plan2CTypeRef = new ENPlanWork2ClassificationTypeRef();
    public static final String tableName = "ENCALCHUMENDELIVERY";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENCALCHUMENDELIVERY.CODE";
    public static final String numberGen_Attr = "numberGen";
    public static final String numberGen_Field = "NUMBERGEN";
    public static final String numberGen_QFielld = "ENCALCHUMENDELIVERY.NUMBERGEN";
    public static final String classificationTypeNumber_Attr = "classificationTypeNumber";
    public static final String classificationTypeNumber_Field = "CLASSIFICATIONTYPENUMBER";
    public static final String classificationTypeNumber_QFielld = "ENCALCHUMENDELIVERY.CLASSIFICATIONTYPENMBR";
    public static final String priceHour_Attr = "priceHour";
    public static final String priceHour_Field = "PRICEHOUR";
    public static final String priceHour_QFielld = "ENCALCHUMENDELIVERY.PRICEHOUR";
    public static final String timeGen_Attr = "timeGen";
    public static final String timeGen_Field = "TIMEGEN";
    public static final String timeGen_QFielld = "ENCALCHUMENDELIVERY.TIMEGEN";
    public static final String costGen_Attr = "costGen";
    public static final String costGen_Field = "COSTGEN";
    public static final String costGen_QFielld = "ENCALCHUMENDELIVERY.COSTGEN";
    public static final String chargeCostGen_Attr = "chargeCostGen";
    public static final String chargeCostGen_Field = "CHARGECOSTGEN";
    public static final String chargeCostGen_QFielld = "ENCALCHUMENDELIVERY.CHARGECOSTGEN";
    public static final String costTotal_Attr = "costTotal";
    public static final String costTotal_Field = "COSTTOTAL";
    public static final String costTotal_QFielld = "ENCALCHUMENDELIVERY.COSTTOTAL";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENCALCHUMENDELIVERY.MODIFY_TIME";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENCALCHUMENDELIVERY.PLANREFCODE";
    public static final String plan2CTypeRef_Attr = "plan2CTypeRef";
    public static final String plan2CTypeRef_Field = "PLAN2CTYPEREFCODE";
    public static final String  plan2CTypeRef_QFielld = "ENCALCHUMENDELIVERY.PLAN2CTYPEREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setNumberGen(int aValue){
       numberGen = aValue;
    }

    public int getNumberGen(){
       return numberGen;
    }

    public void setClassificationTypeNumber(String aValue){
       classificationTypeNumber = aValue;
    }

    public String getClassificationTypeNumber(){
       return classificationTypeNumber;
    }

    public void setPriceHour(BigDecimal aValue){
       priceHour = aValue;
    }

    public BigDecimal getPriceHour(){
       return priceHour;
    }

    public void setTimeGen(BigDecimal aValue){
       timeGen = aValue;
    }

    public BigDecimal getTimeGen(){
       return timeGen;
    }

    public void setCostGen(BigDecimal aValue){
       costGen = aValue;
    }

    public BigDecimal getCostGen(){
       return costGen;
    }

    public void setChargeCostGen(BigDecimal aValue){
       chargeCostGen = aValue;
    }

    public BigDecimal getChargeCostGen(){
       return chargeCostGen;
    }

    public void setCostTotal(BigDecimal aValue){
       costTotal = aValue;
    }

    public BigDecimal getCostTotal(){
       return costTotal;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setPlanRef(ENPlanWorkRef aValue){
       planRef = aValue;
    }

    public ENPlanWorkRef getPlanRef(){
       return planRef;
    }
    public void setPlan2CTypeRef(ENPlanWork2ClassificationTypeRef aValue){
       plan2CTypeRef = aValue;
    }

    public ENPlanWork2ClassificationTypeRef getPlan2CTypeRef(){
       return plan2CTypeRef;
    }

} // end of ENCalcHumenDeliveryValueObject

