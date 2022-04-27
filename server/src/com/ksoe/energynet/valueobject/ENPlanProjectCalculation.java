
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPlanProjectCalculation;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.techcard.valueobject.TKProjectWorkCalculation;
    import  com.ksoe.energynet.valueobject.references.ENPlanProjectRef;

public class ENPlanProjectCalculation implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public TKProjectWorkCalculation tkProjWorkCalculation = new TKProjectWorkCalculation();
    public ENPlanProjectRef projectWorkRef = new ENPlanProjectRef();
    public static final String tableName = "ENPLANPROJECTCALCULATN";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPLANPROJECTCALCULATN.CODE";
    public static final String tkProjWorkCalculation_Attr = "tkProjWorkCalculation";
    public static final String tkProjWorkCalculation_Field = "TKPROJWORKCALCULATINCD";
    public static final String  tkProjWorkCalculation_QFielld = "ENPLANPROJECTCALCULATN.TKPROJWORKCALCULATINCD";
    public static final String projectWorkRef_Attr = "projectWorkRef";
    public static final String projectWorkRef_Field = "PROJECTWORKREFCODE";
    public static final String  projectWorkRef_QFielld = "ENPLANPROJECTCALCULATN.PROJECTWORKREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setTkProjWorkCalculation(TKProjectWorkCalculation aValue){
       tkProjWorkCalculation = aValue;
    }

    public TKProjectWorkCalculation getTkProjWorkCalculation(){
       return tkProjWorkCalculation;
    }
    public void setProjectWorkRef(ENPlanProjectRef aValue){
       projectWorkRef = aValue;
    }

    public ENPlanProjectRef getProjectWorkRef(){
       return projectWorkRef;
    }

} // end of ENPlanProjectCalculationValueObject

