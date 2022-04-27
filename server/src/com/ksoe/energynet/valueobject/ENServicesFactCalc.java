
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENServicesFactCalc;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;

public class ENServicesFactCalc implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  calcCost; 
    public BigDecimal  materialsCost; 
    public BigDecimal  transportCost; 
    public BigDecimal  deliveryCost; 
    public BigDecimal  sumGen; 
    public BigDecimal  vatSum; 
    public BigDecimal  totalSum; 
    public BigDecimal  sumCalc; 
    public BigDecimal  vatSumCalc; 
    public BigDecimal  totalSumCalc; 
    public BigDecimal  percentPrepay; 
    public BigDecimal  sumPrepay; 
    public BigDecimal  vatSumPrepay; 
    public BigDecimal  totalSumPrepay; 
    public BigDecimal  sumRest; 
    public BigDecimal  vatSumRest; 
    public BigDecimal  totalSumRest; 
    public String  commentGen; 
    public String  userGen; 
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();
    public static final String tableName = "ENSERVICESFACTCALC";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSERVICESFACTCALC.CODE";
    public static final String calcCost_Attr = "calcCost";
    public static final String calcCost_Field = "CALCCOST";
    public static final String calcCost_QFielld = "ENSERVICESFACTCALC.CALCCOST";
    public static final String materialsCost_Attr = "materialsCost";
    public static final String materialsCost_Field = "MATERIALSCOST";
    public static final String materialsCost_QFielld = "ENSERVICESFACTCALC.MATERIALSCOST";
    public static final String transportCost_Attr = "transportCost";
    public static final String transportCost_Field = "TRANSPORTCOST";
    public static final String transportCost_QFielld = "ENSERVICESFACTCALC.TRANSPORTCOST";
    public static final String deliveryCost_Attr = "deliveryCost";
    public static final String deliveryCost_Field = "DELIVERYCOST";
    public static final String deliveryCost_QFielld = "ENSERVICESFACTCALC.DELIVERYCOST";
    public static final String sumGen_Attr = "sumGen";
    public static final String sumGen_Field = "SUMGEN";
    public static final String sumGen_QFielld = "ENSERVICESFACTCALC.SUMGEN";
    public static final String vatSum_Attr = "vatSum";
    public static final String vatSum_Field = "VATSUM";
    public static final String vatSum_QFielld = "ENSERVICESFACTCALC.VATSUM";
    public static final String totalSum_Attr = "totalSum";
    public static final String totalSum_Field = "TOTALSUM";
    public static final String totalSum_QFielld = "ENSERVICESFACTCALC.TOTALSUM";
    public static final String sumCalc_Attr = "sumCalc";
    public static final String sumCalc_Field = "SUMCALC";
    public static final String sumCalc_QFielld = "ENSERVICESFACTCALC.SUMCALC";
    public static final String vatSumCalc_Attr = "vatSumCalc";
    public static final String vatSumCalc_Field = "VATSUMCALC";
    public static final String vatSumCalc_QFielld = "ENSERVICESFACTCALC.VATSUMCALC";
    public static final String totalSumCalc_Attr = "totalSumCalc";
    public static final String totalSumCalc_Field = "TOTALSUMCALC";
    public static final String totalSumCalc_QFielld = "ENSERVICESFACTCALC.TOTALSUMCALC";
    public static final String percentPrepay_Attr = "percentPrepay";
    public static final String percentPrepay_Field = "PERCENTPREPAY";
    public static final String percentPrepay_QFielld = "ENSERVICESFACTCALC.PERCENTPREPAY";
    public static final String sumPrepay_Attr = "sumPrepay";
    public static final String sumPrepay_Field = "SUMPREPAY";
    public static final String sumPrepay_QFielld = "ENSERVICESFACTCALC.SUMPREPAY";
    public static final String vatSumPrepay_Attr = "vatSumPrepay";
    public static final String vatSumPrepay_Field = "VATSUMPREPAY";
    public static final String vatSumPrepay_QFielld = "ENSERVICESFACTCALC.VATSUMPREPAY";
    public static final String totalSumPrepay_Attr = "totalSumPrepay";
    public static final String totalSumPrepay_Field = "TOTALSUMPREPAY";
    public static final String totalSumPrepay_QFielld = "ENSERVICESFACTCALC.TOTALSUMPREPAY";
    public static final String sumRest_Attr = "sumRest";
    public static final String sumRest_Field = "SUMREST";
    public static final String sumRest_QFielld = "ENSERVICESFACTCALC.SUMREST";
    public static final String vatSumRest_Attr = "vatSumRest";
    public static final String vatSumRest_Field = "VATSUMREST";
    public static final String vatSumRest_QFielld = "ENSERVICESFACTCALC.VATSUMREST";
    public static final String totalSumRest_Attr = "totalSumRest";
    public static final String totalSumRest_Field = "TOTALSUMREST";
    public static final String totalSumRest_QFielld = "ENSERVICESFACTCALC.TOTALSUMREST";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENSERVICESFACTCALC.COMMENTGEN";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENSERVICESFACTCALC.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENSERVICESFACTCALC.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENSERVICESFACTCALC.MODIFY_TIME";
    public static final String servicesObjectRef_Attr = "servicesObjectRef";
    public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
    public static final String  servicesObjectRef_QFielld = "ENSERVICESFACTCALC.SERVICESOBJECTREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setCalcCost(BigDecimal aValue){
       calcCost = aValue;
    }

    public BigDecimal getCalcCost(){
       return calcCost;
    }

    public void setMaterialsCost(BigDecimal aValue){
       materialsCost = aValue;
    }

    public BigDecimal getMaterialsCost(){
       return materialsCost;
    }

    public void setTransportCost(BigDecimal aValue){
       transportCost = aValue;
    }

    public BigDecimal getTransportCost(){
       return transportCost;
    }

    public void setDeliveryCost(BigDecimal aValue){
       deliveryCost = aValue;
    }

    public BigDecimal getDeliveryCost(){
       return deliveryCost;
    }

    public void setSumGen(BigDecimal aValue){
       sumGen = aValue;
    }

    public BigDecimal getSumGen(){
       return sumGen;
    }

    public void setVatSum(BigDecimal aValue){
       vatSum = aValue;
    }

    public BigDecimal getVatSum(){
       return vatSum;
    }

    public void setTotalSum(BigDecimal aValue){
       totalSum = aValue;
    }

    public BigDecimal getTotalSum(){
       return totalSum;
    }

    public void setSumCalc(BigDecimal aValue){
       sumCalc = aValue;
    }

    public BigDecimal getSumCalc(){
       return sumCalc;
    }

    public void setVatSumCalc(BigDecimal aValue){
       vatSumCalc = aValue;
    }

    public BigDecimal getVatSumCalc(){
       return vatSumCalc;
    }

    public void setTotalSumCalc(BigDecimal aValue){
       totalSumCalc = aValue;
    }

    public BigDecimal getTotalSumCalc(){
       return totalSumCalc;
    }

    public void setPercentPrepay(BigDecimal aValue){
       percentPrepay = aValue;
    }

    public BigDecimal getPercentPrepay(){
       return percentPrepay;
    }

    public void setSumPrepay(BigDecimal aValue){
       sumPrepay = aValue;
    }

    public BigDecimal getSumPrepay(){
       return sumPrepay;
    }

    public void setVatSumPrepay(BigDecimal aValue){
       vatSumPrepay = aValue;
    }

    public BigDecimal getVatSumPrepay(){
       return vatSumPrepay;
    }

    public void setTotalSumPrepay(BigDecimal aValue){
       totalSumPrepay = aValue;
    }

    public BigDecimal getTotalSumPrepay(){
       return totalSumPrepay;
    }

    public void setSumRest(BigDecimal aValue){
       sumRest = aValue;
    }

    public BigDecimal getSumRest(){
       return sumRest;
    }

    public void setVatSumRest(BigDecimal aValue){
       vatSumRest = aValue;
    }

    public BigDecimal getVatSumRest(){
       return vatSumRest;
    }

    public void setTotalSumRest(BigDecimal aValue){
       totalSumRest = aValue;
    }

    public BigDecimal getTotalSumRest(){
       return totalSumRest;
    }

    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
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

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setServicesObjectRef(ENServicesObjectRef aValue){
       servicesObjectRef = aValue;
    }

    public ENServicesObjectRef getServicesObjectRef(){
       return servicesObjectRef;
    }

} // end of ENServicesFactCalcValueObject

