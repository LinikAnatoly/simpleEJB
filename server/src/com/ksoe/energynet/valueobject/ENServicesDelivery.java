
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENServicesDelivery;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENServicesCostRef;
    import  com.ksoe.techcard.valueobject.references.TKCalcDeliveryRef;

public class ENServicesDelivery implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  timeGen; 
    public BigDecimal  costGen; 
    public BigDecimal  chargeCostGen; 
    public BigDecimal  costTotal; 
    public ENServicesCostRef servicesCostRef = new ENServicesCostRef();
    public TKCalcDeliveryRef calcDeliveryRef = new TKCalcDeliveryRef();
    public static final String tableName = "ENSERVICESDELIVERY";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSERVICESDELIVERY.CODE";
    public static final String timeGen_Attr = "timeGen";
    public static final String timeGen_Field = "TIMEGEN";
    public static final String timeGen_QFielld = "ENSERVICESDELIVERY.TIMEGEN";
    public static final String costGen_Attr = "costGen";
    public static final String costGen_Field = "COSTGEN";
    public static final String costGen_QFielld = "ENSERVICESDELIVERY.COSTGEN";
    public static final String chargeCostGen_Attr = "chargeCostGen";
    public static final String chargeCostGen_Field = "CHARGECOSTGEN";
    public static final String chargeCostGen_QFielld = "ENSERVICESDELIVERY.CHARGECOSTGEN";
    public static final String costTotal_Attr = "costTotal";
    public static final String costTotal_Field = "COSTTOTAL";
    public static final String costTotal_QFielld = "ENSERVICESDELIVERY.COSTTOTAL";
    public static final String servicesCostRef_Attr = "servicesCostRef";
    public static final String servicesCostRef_Field = "SERVICESCOSTREFCODE";
    public static final String  servicesCostRef_QFielld = "ENSERVICESDELIVERY.SERVICESCOSTREFCODE";
    public static final String calcDeliveryRef_Attr = "calcDeliveryRef";
    public static final String calcDeliveryRef_Field = "CALCDELIVERYREFCODE";
    public static final String  calcDeliveryRef_QFielld = "ENSERVICESDELIVERY.CALCDELIVERYREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
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

    public void setServicesCostRef(ENServicesCostRef aValue){
       servicesCostRef = aValue;
    }

    public ENServicesCostRef getServicesCostRef(){
       return servicesCostRef;
    }
    public void setCalcDeliveryRef(TKCalcDeliveryRef aValue){
       calcDeliveryRef = aValue;
    }

    public TKCalcDeliveryRef getCalcDeliveryRef(){
       return calcDeliveryRef;
    }

} // end of ENServicesDeliveryValueObject

