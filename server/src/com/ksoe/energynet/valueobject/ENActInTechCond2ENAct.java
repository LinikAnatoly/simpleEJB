
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENActInTechCond2ENAct;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENActIncomeTechConditionsRef;
    import  com.ksoe.energynet.valueobject.references.ENActRef;

public class ENActInTechCond2ENAct implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  summaGen; 
    public ENActIncomeTechConditionsRef actIncomeRef = new ENActIncomeTechConditionsRef();
    public ENActRef actRef = new ENActRef();
    public static final String tableName = "ENACTINTECHCOND2ENACT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACTINTECHCOND2ENACT.CODE";
    public static final String summaGen_Attr = "summaGen";
    public static final String summaGen_Field = "SUMMAGEN";
    public static final String summaGen_QFielld = "ENACTINTECHCOND2ENACT.SUMMAGEN";
    public static final String actIncomeRef_Attr = "actIncomeRef";
    public static final String actIncomeRef_Field = "ACTINCOMEREFCODE";
    public static final String  actIncomeRef_QFielld = "ENACTINTECHCOND2ENACT.ACTINCOMEREFCODE";
    public static final String actRef_Attr = "actRef";
    public static final String actRef_Field = "ACTREFCODE";
    public static final String  actRef_QFielld = "ENACTINTECHCOND2ENACT.ACTREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setSummaGen(BigDecimal aValue){
       summaGen = aValue;
    }

    public BigDecimal getSummaGen(){
       return summaGen;
    }

    public void setActIncomeRef(ENActIncomeTechConditionsRef aValue){
       actIncomeRef = aValue;
    }

    public ENActIncomeTechConditionsRef getActIncomeRef(){
       return actIncomeRef;
    }
    public void setActRef(ENActRef aValue){
       actRef = aValue;
    }

    public ENActRef getActRef(){
       return actRef;
    }

} // end of ENActInTechCond2ENActValueObject

