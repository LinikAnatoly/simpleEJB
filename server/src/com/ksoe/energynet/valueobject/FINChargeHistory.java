
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for FINChargeHistory;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.FINChargeTypeRef;

public class FINChargeHistory implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  chargePercent; 
    public Date dategen ;
    public FINChargeTypeRef chargeRef = new FINChargeTypeRef();
    public static final String tableName = "FINCHARGEHISTORY";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "FINCHARGEHISTORY.CODE";
    public static final String chargePercent_Attr = "chargePercent";
    public static final String chargePercent_Field = "CHARGEPERCENT";
    public static final String chargePercent_QFielld = "FINCHARGEHISTORY.CHARGEPERCENT";
    public static final String dategen_Attr = "dategen";
    public static final String dategen_Field = "DATEGEN";
    public static final String dategen_QFielld = "FINCHARGEHISTORY.DATEGEN";
    public static final String chargeRef_Attr = "chargeRef";
    public static final String chargeRef_Field = "CHARGEREFCODE";
    public static final String  chargeRef_QFielld = "FINCHARGEHISTORY.CHARGEREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setChargePercent(BigDecimal aValue){
       chargePercent = aValue;
    }

    public BigDecimal getChargePercent(){
       return chargePercent;
    }


    public void setDategen(Date aValue){
       dategen = aValue;
    }

    public Date getDategen(){
       return dategen;
    }

    public void setChargeRef(FINChargeTypeRef aValue){
       chargeRef = aValue;
    }

    public FINChargeTypeRef getChargeRef(){
       return chargeRef;
    }

} // end of FINChargeHistoryValueObject

