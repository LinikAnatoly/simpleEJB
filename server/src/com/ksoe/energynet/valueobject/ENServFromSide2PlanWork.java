
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENServFromSide2PlanWork;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENServicesFromSideObjectRef;
    import  com.ksoe.energynet.valueobject.references.ENPlanWorkRef;

public class ENServFromSide2PlanWork implements Serializable {

    public int  code = Integer.MIN_VALUE;

    public ENServicesFromSideObjectRef servFromSideRef = new ENServicesFromSideObjectRef();
    public ENPlanWorkRef planRef = new ENPlanWorkRef();

    public static final String tableName = "ENSERVFROMSIDE2PLANWRK";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSERVFROMSIDE2PLANWRK.CODE";

    public static final String servFromSideRef_Attr = "servFromSideRef";
    public static final String servFromSideRef_Field = "SERVFROMSIDEREFCODE";
    public static final String  servFromSideRef_QFielld = "ENSERVFROMSIDE2PLANWRK.SERVFROMSIDEREFCODE";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENSERVFROMSIDE2PLANWRK.PLANREFCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }

    public ENServicesFromSideObjectRef getServFromSideRef(){
       return servFromSideRef;
    }
    
    public void setServFromSideRef(ENServicesFromSideObjectRef servFromSideRef){
       this.servFromSideRef = servFromSideRef;
    }
    public ENPlanWorkRef getPlanRef(){
       return planRef;
    }
    
    public void setPlanRef(ENPlanWorkRef planRef){
       this.planRef = planRef;
    }

} // end of ENServFromSide2PlanWorkValueObject

