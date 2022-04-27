
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENMOLSTOREKEEPER2PlanWork;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENPlanWorkRef;

public class ENMOLSTOREKEEPER2PlanWork implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  molName; 
    public String  molCode; 
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public static final String tableName = "ENMOLSTOREKEEPR2PLNWRK";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENMOLSTOREKEEPR2PLNWRK.CODE";
    public static final String molName_Attr = "molName";
    public static final String molName_Field = "MOLNAME";
    public static final String molName_QFielld = "ENMOLSTOREKEEPR2PLNWRK.MOLNAME";
    public static final String molCode_Attr = "molCode";
    public static final String molCode_Field = "MOLCODE";
    public static final String molCode_QFielld = "ENMOLSTOREKEEPR2PLNWRK.MOLCODE";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENMOLSTOREKEEPR2PLNWRK.PLANREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setMolName(String aValue){
       molName = aValue;
    }

    public String getMolName(){
       return molName;
    }

    public void setMolCode(String aValue){
       molCode = aValue;
    }

    public String getMolCode(){
       return molCode;
    }

    public void setPlanRef(ENPlanWorkRef aValue){
       planRef = aValue;
    }

    public ENPlanWorkRef getPlanRef(){
       return planRef;
    }

} // end of ENMOLSTOREKEEPER2PlanWorkValueObject

