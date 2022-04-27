
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENServicesObject2FKInfo;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;
    import  com.ksoe.energynet.valueobject.references.ENServicesObjectKindFKRef;

public class ENServicesObject2FKInfo implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  isIncomeAct = Integer.MIN_VALUE; 
    public ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();
    public ENServicesObjectKindFKRef servicesObjectKindFKRef = new ENServicesObjectKindFKRef();
    public static final String tableName = "ENSERVICESOBJECT2FKINF";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSERVICESOBJECT2FKINF.CODE";
    public static final String isIncomeAct_Attr = "isIncomeAct";
    public static final String isIncomeAct_Field = "ISINCOMEACT";
    public static final String isIncomeAct_QFielld = "ENSERVICESOBJECT2FKINF.ISINCOMEACT";
    public static final String servicesObjectRef_Attr = "servicesObjectRef";
    public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
    public static final String  servicesObjectRef_QFielld = "ENSERVICESOBJECT2FKINF.SERVICESOBJECTREFCODE";
    public static final String servicesObjectKindFKRef_Attr = "servicesObjectKindFKRef";
    public static final String servicesObjectKindFKRef_Field = "SERVICESOBJCTKNDFKRFCD";
    public static final String  servicesObjectKindFKRef_QFielld = "ENSERVICESOBJECT2FKINF.SERVICESOBJCTKNDFKRFCD";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setIsIncomeAct(int aValue){
       isIncomeAct = aValue;
    }

    public int getIsIncomeAct(){
       return isIncomeAct;
    }

    public void setServicesObjectRef(ENServicesObjectRef aValue){
       servicesObjectRef = aValue;
    }

    public ENServicesObjectRef getServicesObjectRef(){
       return servicesObjectRef;
    }
    public void setServicesObjectKindFKRef(ENServicesObjectKindFKRef aValue){
       servicesObjectKindFKRef = aValue;
    }

    public ENServicesObjectKindFKRef getServicesObjectKindFKRef(){
       return servicesObjectKindFKRef;
    }

} // end of ENServicesObject2FKInfoValueObject

