
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENActIncomeServices2SOBill;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENActIncomeServicesRef;
    import  com.ksoe.energynet.valueobject.references.ENSOBillRef;

public class ENActIncomeServices2SOBill implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE; 
    public ENActIncomeServicesRef actIncomeRef = new ENActIncomeServicesRef();
    public ENSOBillRef soBillRef = new ENSOBillRef();
    public static final String tableName = "ENACTINCOMESERVCS2SBLL";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACTINCOMESERVCS2SBLL.CODE";
    public static final String actIncomeRef_Attr = "actIncomeRef";
    public static final String actIncomeRef_Field = "ACTINCOMEREFCODE";
    public static final String  actIncomeRef_QFielld = "ENACTINCOMESERVCS2SBLL.ACTINCOMEREFCODE";
    public static final String soBillRef_Attr = "soBillRef";
    public static final String soBillRef_Field = "SOBILLREFCODE";
    public static final String  soBillRef_QFielld = "ENACTINCOMESERVCS2SBLL.SOBILLREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setActIncomeRef(ENActIncomeServicesRef aValue){
       actIncomeRef = aValue;
    }

    public ENActIncomeServicesRef getActIncomeRef(){
       return actIncomeRef;
    }
    public void setSoBillRef(ENSOBillRef aValue){
       soBillRef = aValue;
    }

    public ENSOBillRef getSoBillRef(){
       return soBillRef;
    }

} // end of ENActIncomeServices2SOBillValueObject

