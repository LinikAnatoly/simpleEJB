
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSOPayBillProv;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;
    import  com.ksoe.energynet.valueobject.references.ENPayment2SORef;
    import  com.ksoe.energynet.valueobject.references.ENSOBillRef;
    import  com.ksoe.energynet.valueobject.references.ENServicesObject2ProvRef;

public class ENSOPayBillProv implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  userGen; 
    public Date dateEdit ;
    public ENServicesObjectRef soRef = new ENServicesObjectRef();
    public ENPayment2SORef payment2soRef = new ENPayment2SORef();
    public ENSOBillRef soBillRef = new ENSOBillRef();
    public ENServicesObject2ProvRef so2ProvRef = new ENServicesObject2ProvRef();
    public static final String tableName = "ENSOPAYBILLPROV";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSOPAYBILLPROV.CODE";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENSOPAYBILLPROV.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENSOPAYBILLPROV.DATEEDIT";
    public static final String soRef_Attr = "soRef";
    public static final String soRef_Field = "SOREFCODE";
    public static final String  soRef_QFielld = "ENSOPAYBILLPROV.SOREFCODE";
    public static final String payment2soRef_Attr = "payment2soRef";
    public static final String payment2soRef_Field = "PAYMENT2SOREFCODE";
    public static final String  payment2soRef_QFielld = "ENSOPAYBILLPROV.PAYMENT2SOREFCODE";
    public static final String soBillRef_Attr = "soBillRef";
    public static final String soBillRef_Field = "SOBILLREFCODE";
    public static final String  soBillRef_QFielld = "ENSOPAYBILLPROV.SOBILLREFCODE";
    public static final String so2ProvRef_Attr = "so2ProvRef";
    public static final String so2ProvRef_Field = "SO2PROVREFCODE";
    public static final String  so2ProvRef_QFielld = "ENSOPAYBILLPROV.SO2PROVREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
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

    public void setSoRef(ENServicesObjectRef aValue){
       soRef = aValue;
    }

    public ENServicesObjectRef getSoRef(){
       return soRef;
    }
    public void setPayment2soRef(ENPayment2SORef aValue){
       payment2soRef = aValue;
    }

    public ENPayment2SORef getPayment2soRef(){
       return payment2soRef;
    }
    public void setSoBillRef(ENSOBillRef aValue){
       soBillRef = aValue;
    }

    public ENSOBillRef getSoBillRef(){
       return soBillRef;
    }
    public void setSo2ProvRef(ENServicesObject2ProvRef aValue){
       so2ProvRef = aValue;
    }

    public ENServicesObject2ProvRef getSo2ProvRef(){
       return so2ProvRef;
    }

} // end of ENSOPayBillProvValueObject

