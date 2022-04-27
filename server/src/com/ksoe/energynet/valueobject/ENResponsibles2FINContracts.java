
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENResponsibles2FINContracts;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENResponsiblesRef;
    import  com.ksoe.energynet.valueobject.FINContracts;

public class ENResponsibles2FINContracts implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public ENResponsiblesRef responsiblesRef = new ENResponsiblesRef();
    public FINContracts finContracts = new FINContracts();
    public static final String tableName = "ENRESPONSBLS2FNCNTRCTS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENRESPONSBLS2FNCNTRCTS.CODE";
    public static final String responsiblesRef_Attr = "responsiblesRef";
    public static final String responsiblesRef_Field = "RESPONSIBLESREFCODE";
    public static final String  responsiblesRef_QFielld = "ENRESPONSBLS2FNCNTRCTS.RESPONSIBLESREFCODE";
    public static final String finContracts_Attr = "finContracts";
    public static final String finContracts_Field = "FINCONTRACTSCODE";
    public static final String  finContracts_QFielld = "ENRESPONSBLS2FNCNTRCTS.FINCONTRACTSCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setResponsiblesRef(ENResponsiblesRef aValue){
       responsiblesRef = aValue;
    }

    public ENResponsiblesRef getResponsiblesRef(){
       return responsiblesRef;
    }
    public void setFinContracts(FINContracts aValue){
       finContracts = aValue;
    }

    public FINContracts getFinContracts(){
       return finContracts;
    }

} // end of ENResponsibles2FINContractsValueObject

