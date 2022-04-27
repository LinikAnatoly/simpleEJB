
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENActIncome2ENAct;
  */

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.ENActIncomeRef;
import com.ksoe.energynet.valueobject.references.ENActRef;

public class ENActIncome2ENAct implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public ENActIncomeRef actIncomeRef = new ENActIncomeRef();
    public ENActRef actRef = new ENActRef();
    public static final String tableName = "ENACTINCOME2ENACT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACTINCOME2ENACT.CODE";
    public static final String actIncomeRef_Attr = "actIncomeRef";
    public static final String actIncomeRef_Field = "ACTINCOMEREFCODE";
    public static final String  actIncomeRef_QFielld = "ENACTINCOME2ENACT.ACTINCOMEREFCODE";
    public static final String actRef_Attr = "actRef";
    public static final String actRef_Field = "ACTREFCODE";
    public static final String  actRef_QFielld = "ENACTINCOME2ENACT.ACTREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setActIncomeRef(ENActIncomeRef aValue){
       actIncomeRef = aValue;
    }

    public ENActIncomeRef getActIncomeRef(){
       return actIncomeRef;
    }
    public void setActRef(ENActRef aValue){
       actRef = aValue;
    }

    public ENActRef getActRef(){
       return actRef;
    }

} // end of ENActIncome2ENActValueObject

