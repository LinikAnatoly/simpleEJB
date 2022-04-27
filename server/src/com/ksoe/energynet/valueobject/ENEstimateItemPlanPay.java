
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENEstimateItemPlanPay;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.rqorder.valueobject.references.RQOrderItemTypePayRef;
    import  com.ksoe.energynet.valueobject.references.ENEstimateItemRef;

public class ENEstimateItemPlanPay implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  percentPay; 
    public Date datePay ;
    public long  modify_time = Long.MIN_VALUE;
    public String  userAdd; 
    public Date dateAdd ;
    public String  userGen; 
    public Date dateEdit ;
    public RQOrderItemTypePayRef typePayRef = new RQOrderItemTypePayRef();
    public ENEstimateItemRef estimateItemRef = new ENEstimateItemRef();
    public static final String tableName = "ENESTIMATEITEMPLANPAY";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENESTIMATEITEMPLANPAY.CODE";
    public static final String percentPay_Attr = "percentPay";
    public static final String percentPay_Field = "PERCENTPAY";
    public static final String percentPay_QFielld = "ENESTIMATEITEMPLANPAY.PERCENTPAY";
    public static final String datePay_Attr = "datePay";
    public static final String datePay_Field = "DATEPAY";
    public static final String datePay_QFielld = "ENESTIMATEITEMPLANPAY.DATEPAY";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENESTIMATEITEMPLANPAY.MODIFY_TIME";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "ENESTIMATEITEMPLANPAY.USERADD";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "ENESTIMATEITEMPLANPAY.DATEADD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENESTIMATEITEMPLANPAY.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENESTIMATEITEMPLANPAY.DATEEDIT";
    public static final String typePayRef_Attr = "typePayRef";
    public static final String typePayRef_Field = "TYPEPAYREFCODE";
    public static final String  typePayRef_QFielld = "ENESTIMATEITEMPLANPAY.TYPEPAYREFCODE";
    public static final String estimateItemRef_Attr = "estimateItemRef";
    public static final String estimateItemRef_Field = "ESTIMATEITEMREFCODE";
    public static final String  estimateItemRef_QFielld = "ENESTIMATEITEMPLANPAY.ESTIMATEITEMREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setPercentPay(BigDecimal aValue){
       percentPay = aValue;
    }

    public BigDecimal getPercentPay(){
       return percentPay;
    }


    public void setDatePay(Date aValue){
       datePay = aValue;
    }

    public Date getDatePay(){
       return datePay;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setUserAdd(String aValue){
       userAdd = aValue;
    }

    public String getUserAdd(){
       return userAdd;
    }


    public void setDateAdd(Date aValue){
       dateAdd = aValue;
    }

    public Date getDateAdd(){
       return dateAdd;
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

    public void setTypePayRef(RQOrderItemTypePayRef aValue){
       typePayRef = aValue;
    }

    public RQOrderItemTypePayRef getTypePayRef(){
       return typePayRef;
    }
    public void setEstimateItemRef(ENEstimateItemRef aValue){
       estimateItemRef = aValue;
    }

    public ENEstimateItemRef getEstimateItemRef(){
       return estimateItemRef;
    }

} // end of ENEstimateItemPlanPayValueObject

