
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENReconstrModernOZ2ENact;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENActRef;
    import  com.ksoe.energynet.valueobject.references.ENReconstrModernOZRef;

public class ENReconstrModernOZ2ENact implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  sumGen; 
    public BigDecimal  sumNds; 
    public int  isCalculationDate = Integer.MIN_VALUE; 
    public ENActRef actRef = new ENActRef();
    public ENReconstrModernOZRef ENReconstrModernOZRef = new ENReconstrModernOZRef();
    public static final String tableName = "ENRECONSTRMODERNOZ2NCT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENRECONSTRMODERNOZ2NCT.CODE";
    public static final String sumGen_Attr = "sumGen";
    public static final String sumGen_Field = "SUMGEN";
    public static final String sumGen_QFielld = "ENRECONSTRMODERNOZ2NCT.SUMGEN";
    public static final String sumNds_Attr = "sumNds";
    public static final String sumNds_Field = "SUMNDS";
    public static final String sumNds_QFielld = "ENRECONSTRMODERNOZ2NCT.SUMNDS";
    public static final String isCalculationDate_Attr = "isCalculationDate";
    public static final String isCalculationDate_Field = "ISCALCULATIONDATE";
    public static final String isCalculationDate_QFielld = "ENRECONSTRMODERNOZ2NCT.ISCALCULATIONDATE";
    public static final String actRef_Attr = "actRef";
    public static final String actRef_Field = "ACTREFCODE";
    public static final String  actRef_QFielld = "ENRECONSTRMODERNOZ2NCT.ACTREFCODE";
    public static final String ENReconstrModernOZRef_Attr = "ENReconstrModernOZRef";
    public static final String ENReconstrModernOZRef_Field = "ENRECONSTRMODERNOZRFCD";
    public static final String  ENReconstrModernOZRef_QFielld = "ENRECONSTRMODERNOZ2NCT.ENRECONSTRMODERNOZRFCD";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setSumGen(BigDecimal aValue){
       sumGen = aValue;
    }

    public BigDecimal getSumGen(){
       return sumGen;
    }

    public void setSumNds(BigDecimal aValue){
       sumNds = aValue;
    }

    public BigDecimal getSumNds(){
       return sumNds;
    }

    public void setIsCalculationDate(int aValue){
       isCalculationDate = aValue;
    }

    public int getIsCalculationDate(){
       return isCalculationDate;
    }

    public void setActRef(ENActRef aValue){
       actRef = aValue;
    }

    public ENActRef getActRef(){
       return actRef;
    }
    public void setENReconstrModernOZRef(ENReconstrModernOZRef aValue){
       ENReconstrModernOZRef = aValue;
    }

    public ENReconstrModernOZRef getENReconstrModernOZRef(){
       return ENReconstrModernOZRef;
    }

} // end of ENReconstrModernOZ2ENactValueObject

