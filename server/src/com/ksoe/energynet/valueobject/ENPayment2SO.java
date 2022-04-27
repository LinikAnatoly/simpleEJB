
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPayment2SO;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;
    import  com.ksoe.energynet.valueobject.references.ENPayment2SOTypeRef;
    import  com.ksoe.energynet.valueobject.references.ENSOBillRef;
    import  com.ksoe.rqorder.valueobject.references.RQOrderRef;

public class ENPayment2SO implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public Date dateGen ;
    public BigDecimal  sumTotal; 
    public BigDecimal  sumGen; 
    public BigDecimal  sumVat; 
    public String  userGen; 
    public Date dateEdit ;
    public ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();
    public ENPayment2SOTypeRef paymentTypeRef = new ENPayment2SOTypeRef();
    public ENSOBillRef soBillRef = new ENSOBillRef();
    public RQOrderRef orderRef = new RQOrderRef();
    public static final String tableName = "ENPAYMENT2SO";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPAYMENT2SO.CODE";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "ENPAYMENT2SO.DATEGEN";
    public static final String sumTotal_Attr = "sumTotal";
    public static final String sumTotal_Field = "SUMTOTAL";
    public static final String sumTotal_QFielld = "ENPAYMENT2SO.SUMTOTAL";
    public static final String sumGen_Attr = "sumGen";
    public static final String sumGen_Field = "SUMGEN";
    public static final String sumGen_QFielld = "ENPAYMENT2SO.SUMGEN";
    public static final String sumVat_Attr = "sumVat";
    public static final String sumVat_Field = "SUMVAT";
    public static final String sumVat_QFielld = "ENPAYMENT2SO.SUMVAT";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENPAYMENT2SO.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENPAYMENT2SO.DATEEDIT";
    public static final String servicesObjectRef_Attr = "servicesObjectRef";
    public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
    public static final String  servicesObjectRef_QFielld = "ENPAYMENT2SO.SERVICESOBJECTREFCODE";
    public static final String paymentTypeRef_Attr = "paymentTypeRef";
    public static final String paymentTypeRef_Field = "PAYMENTTYPEREFCODE";
    public static final String  paymentTypeRef_QFielld = "ENPAYMENT2SO.PAYMENTTYPEREFCODE";
    public static final String soBillRef_Attr = "soBillRef";
    public static final String soBillRef_Field = "SOBILLREFCODE";
    public static final String  soBillRef_QFielld = "ENPAYMENT2SO.SOBILLREFCODE";
    public static final String orderRef_Attr = "orderRef";
    public static final String orderRef_Field = "ORDERREFCODE";
    public static final String  orderRef_QFielld = "ENPAYMENT2SO.ORDERREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setDateGen(Date aValue){
       dateGen = aValue;
    }

    public Date getDateGen(){
       return dateGen;
    }

    public void setSumTotal(BigDecimal aValue){
       sumTotal = aValue;
    }

    public BigDecimal getSumTotal(){
       return sumTotal;
    }

    public void setSumGen(BigDecimal aValue){
       sumGen = aValue;
    }

    public BigDecimal getSumGen(){
       return sumGen;
    }

    public void setSumVat(BigDecimal aValue){
       sumVat = aValue;
    }

    public BigDecimal getSumVat(){
       return sumVat;
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

    public void setServicesObjectRef(ENServicesObjectRef aValue){
       servicesObjectRef = aValue;
    }

    public ENServicesObjectRef getServicesObjectRef(){
       return servicesObjectRef;
    }
    public void setPaymentTypeRef(ENPayment2SOTypeRef aValue){
       paymentTypeRef = aValue;
    }

    public ENPayment2SOTypeRef getPaymentTypeRef(){
       return paymentTypeRef;
    }
    public void setSoBillRef(ENSOBillRef aValue){
       soBillRef = aValue;
    }

    public ENSOBillRef getSoBillRef(){
       return soBillRef;
    }
    public void setOrderRef(RQOrderRef aValue){
       orderRef = aValue;
    }

    public RQOrderRef getOrderRef(){
       return orderRef;
    }

} // end of ENPayment2SOValueObject

