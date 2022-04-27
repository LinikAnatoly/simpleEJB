
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENAdditionalAgreement;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;

public class ENAdditionalAgreement implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE;
    public String  numberGen; 
    public Date dateGen ;
    public BigDecimal  sumWithoutVAT; 
    public BigDecimal  sumVAT; 
    public Boolean  calcSumsByCalculations = null;
    public Boolean  isSigned = null;
    public ENServicesObjectRef servicesobjectRef = new ENServicesObjectRef();
    public static final String tableName = "ENADDITIONALAGREEMENT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENADDITIONALAGREEMENT.CODE";
    public static final String numberGen_Attr = "numberGen";
    public static final String numberGen_Field = "NUMBERGEN";
    public static final String numberGen_QFielld = "ENADDITIONALAGREEMENT.NUMBERGEN";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "ENADDITIONALAGREEMENT.DATEGEN";
    public static final String sumWithoutVAT_Attr = "sumWithoutVAT";
    public static final String sumWithoutVAT_Field = "SUMWITHOUTVAT";
    public static final String sumWithoutVAT_QFielld = "ENADDITIONALAGREEMENT.SUMWITHOUTVAT";
    public static final String sumVAT_Attr = "sumVAT";
    public static final String sumVAT_Field = "SUMVAT";
    public static final String sumVAT_QFielld = "ENADDITIONALAGREEMENT.SUMVAT";
    public static final String calcSumsByCalculations_Attr = "calcSumsByCalculations";
    public static final String calcSumsByCalculations_Field = "CALCSUMSBYCALCULATIONS";
    public static final String calcSumsByCalculations_QFielld = "ENADDITIONALAGREEMENT.CALCSUMSBYCALCULATIONS";
    public static final String isSigned_Attr = "isSigned";
    public static final String isSigned_Field = "ISSIGNED";
    public static final String isSigned_QFielld = "ENADDITIONALAGREEMENT.ISSIGNED";
    public static final String servicesobjectRef_Attr = "servicesobjectRef";
    public static final String servicesobjectRef_Field = "SERVICESOBJECTREFCODE";
    public static final String  servicesobjectRef_QFielld = "ENADDITIONALAGREEMENT.SERVICESOBJECTREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setNumberGen(String aValue){
       numberGen = aValue;
    }

    public String getNumberGen(){
       return numberGen;
    }


    public void setDateGen(Date aValue){
       dateGen = aValue;
    }

    public Date getDateGen(){
       return dateGen;
    }


    public void setSumWithoutVAT(BigDecimal aValue){
       sumWithoutVAT = aValue;
    }

    public BigDecimal getSumWithoutVAT(){
       return sumWithoutVAT;
    }


    public void setSumVAT(BigDecimal aValue){
       sumVAT = aValue;
    }

    public BigDecimal getSumVAT(){
       return sumVAT;
    }


    public void setCalcSumsByCalculations(Boolean aValue){
       calcSumsByCalculations = aValue;
    }

    public Boolean getCalcSumsByCalculations(){
       return calcSumsByCalculations;
    }


    public void setIsSigned(Boolean aValue){
       isSigned = aValue;
    }

    public Boolean getIsSigned(){
       return isSigned;
    }

    public void setServicesobjectRef(ENServicesObjectRef aValue){
       servicesobjectRef = aValue;
    }

    public ENServicesObjectRef getServicesobjectRef(){
       return servicesobjectRef;
    }

} // end of ENAdditionalAgreementValueObject

