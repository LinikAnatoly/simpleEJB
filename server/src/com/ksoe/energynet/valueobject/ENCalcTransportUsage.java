
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENCalcTransportUsage;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.references.ENPlanWork2ClassificationTypeRef;
import com.ksoe.energynet.valueobject.references.ENPlanWorkRef;
import com.ksoe.techcard.valueobject.references.TKTransportRef;

public class ENCalcTransportUsage implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  numberGen = Integer.MIN_VALUE; 
    public String  classificationTypeNumber; 
    public String  transportName; 
    public BigDecimal  normMachineHours; 
    public BigDecimal  normDistance; 
    public BigDecimal  priceMachineHours; 
    public BigDecimal  priceDistance; 
    public BigDecimal  costMachineHours; 
    public BigDecimal  costDistance; 
    public BigDecimal  costTotal; 
    public String  commentPriceDistance; 
    public long  modify_time = Long.MIN_VALUE;
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public TKTransportRef tkTransportRef = new TKTransportRef();
    public ENPlanWork2ClassificationTypeRef plan2CTypeRef = new ENPlanWork2ClassificationTypeRef();
    public static final String tableName = "ENCALCTRANSPORTUSAGE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENCALCTRANSPORTUSAGE.CODE";
    public static final String numberGen_Attr = "numberGen";
    public static final String numberGen_Field = "NUMBERGEN";
    public static final String numberGen_QFielld = "ENCALCTRANSPORTUSAGE.NUMBERGEN";
    public static final String classificationTypeNumber_Attr = "classificationTypeNumber";
    public static final String classificationTypeNumber_Field = "CLASSIFICATIONTYPENUMBER";
    public static final String classificationTypeNumber_QFielld = "ENCALCTRANSPORTUSAGE.CLASSIFICATIONTYPENMBR";
    public static final String transportName_Attr = "transportName";
    public static final String transportName_Field = "TRANSPORTNAME";
    public static final String transportName_QFielld = "ENCALCTRANSPORTUSAGE.TRANSPORTNAME";
    public static final String normMachineHours_Attr = "normMachineHours";
    public static final String normMachineHours_Field = "NORMMACHINEHOURS";
    public static final String normMachineHours_QFielld = "ENCALCTRANSPORTUSAGE.NORMMACHINEHOURS";
    public static final String normDistance_Attr = "normDistance";
    public static final String normDistance_Field = "NORMDISTANCE";
    public static final String normDistance_QFielld = "ENCALCTRANSPORTUSAGE.NORMDISTANCE";
    public static final String priceMachineHours_Attr = "priceMachineHours";
    public static final String priceMachineHours_Field = "PRICEMACHINEHOURS";
    public static final String priceMachineHours_QFielld = "ENCALCTRANSPORTUSAGE.PRICEMACHINEHOURS";
    public static final String priceDistance_Attr = "priceDistance";
    public static final String priceDistance_Field = "PRICEDISTANCE";
    public static final String priceDistance_QFielld = "ENCALCTRANSPORTUSAGE.PRICEDISTANCE";
    public static final String costMachineHours_Attr = "costMachineHours";
    public static final String costMachineHours_Field = "COSTMACHINEHOURS";
    public static final String costMachineHours_QFielld = "ENCALCTRANSPORTUSAGE.COSTMACHINEHOURS";
    public static final String costDistance_Attr = "costDistance";
    public static final String costDistance_Field = "COSTDISTANCE";
    public static final String costDistance_QFielld = "ENCALCTRANSPORTUSAGE.COSTDISTANCE";
    public static final String costTotal_Attr = "costTotal";
    public static final String costTotal_Field = "COSTTOTAL";
    public static final String costTotal_QFielld = "ENCALCTRANSPORTUSAGE.COSTTOTAL";
    public static final String commentPriceDistance_Attr = "commentPriceDistance";
    public static final String commentPriceDistance_Field = "COMMENTPRICEDISTANCE";
    public static final String commentPriceDistance_QFielld = "ENCALCTRANSPORTUSAGE.COMMENTPRICEDISTANCE";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENCALCTRANSPORTUSAGE.MODIFY_TIME";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENCALCTRANSPORTUSAGE.PLANREFCODE";
    public static final String tkTransportRef_Attr = "tkTransportRef";
    public static final String tkTransportRef_Field = "TKTRANSPORTREFCODE";
    public static final String  tkTransportRef_QFielld = "ENCALCTRANSPORTUSAGE.TKTRANSPORTREFCODE";
    public static final String plan2CTypeRef_Attr = "plan2CTypeRef";
    public static final String plan2CTypeRef_Field = "PLAN2CTYPEREFCODE";
    public static final String  plan2CTypeRef_QFielld = "ENCALCTRANSPORTUSAGE.PLAN2CTYPEREFCODE";


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

    public void setTransportName(String aValue){
       transportName = aValue;
    }

    public String getTransportName(){
       return transportName;
    }

    public void setNormMachineHours(BigDecimal aValue){
       normMachineHours = aValue;
    }

    public BigDecimal getNormMachineHours(){
       return normMachineHours;
    }

    public void setNormDistance(BigDecimal aValue){
       normDistance = aValue;
    }

    public BigDecimal getNormDistance(){
       return normDistance;
    }

    public void setPriceMachineHours(BigDecimal aValue){
       priceMachineHours = aValue;
    }

    public BigDecimal getPriceMachineHours(){
       return priceMachineHours;
    }

    public void setPriceDistance(BigDecimal aValue){
       priceDistance = aValue;
    }

    public BigDecimal getPriceDistance(){
       return priceDistance;
    }

    public void setCostMachineHours(BigDecimal aValue){
       costMachineHours = aValue;
    }

    public BigDecimal getCostMachineHours(){
       return costMachineHours;
    }

    public void setCostDistance(BigDecimal aValue){
       costDistance = aValue;
    }

    public BigDecimal getCostDistance(){
       return costDistance;
    }

    public void setCostTotal(BigDecimal aValue){
       costTotal = aValue;
    }

    public BigDecimal getCostTotal(){
       return costTotal;
    }

    public void setCommentPriceDistance(String aValue){
       commentPriceDistance = aValue;
    }

    public String getCommentPriceDistance(){
       return commentPriceDistance;
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
    public void setTkTransportRef(TKTransportRef aValue){
       tkTransportRef = aValue;
    }

    public TKTransportRef getTkTransportRef(){
       return tkTransportRef;
    }
    public void setPlan2CTypeRef(ENPlanWork2ClassificationTypeRef aValue){
       plan2CTypeRef = aValue;
    }

    public ENPlanWork2ClassificationTypeRef getPlan2CTypeRef(){
       return plan2CTypeRef;
    }

} // end of ENCalcTransportUsageValueObject

