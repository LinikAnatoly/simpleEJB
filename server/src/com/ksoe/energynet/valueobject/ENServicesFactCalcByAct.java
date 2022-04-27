
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENServicesFactCalcByAct;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;
    import  com.ksoe.energynet.valueobject.references.ENActRef;

public class ENServicesFactCalcByAct implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  materialsCost; 
    public BigDecimal  transportCost; 
    public BigDecimal  deliveryCost; 
    public String  commentGen; 
    public String  userGen; 
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();
    public ENActRef actRef = new ENActRef();
    public static final String tableName = "ENSERVICESFACTCALCBYCT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSERVICESFACTCALCBYCT.CODE";
    public static final String materialsCost_Attr = "materialsCost";
    public static final String materialsCost_Field = "MATERIALSCOST";
    public static final String materialsCost_QFielld = "ENSERVICESFACTCALCBYCT.MATERIALSCOST";
    public static final String transportCost_Attr = "transportCost";
    public static final String transportCost_Field = "TRANSPORTCOST";
    public static final String transportCost_QFielld = "ENSERVICESFACTCALCBYCT.TRANSPORTCOST";
    public static final String deliveryCost_Attr = "deliveryCost";
    public static final String deliveryCost_Field = "DELIVERYCOST";
    public static final String deliveryCost_QFielld = "ENSERVICESFACTCALCBYCT.DELIVERYCOST";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENSERVICESFACTCALCBYCT.COMMENTGEN";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENSERVICESFACTCALCBYCT.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENSERVICESFACTCALCBYCT.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENSERVICESFACTCALCBYCT.MODIFY_TIME";
    public static final String servicesObjectRef_Attr = "servicesObjectRef";
    public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
    public static final String  servicesObjectRef_QFielld = "ENSERVICESFACTCALCBYCT.SERVICESOBJECTREFCODE";
    public static final String actRef_Attr = "actRef";
    public static final String actRef_Field = "ACTREFCODE";
    public static final String  actRef_QFielld = "ENSERVICESFACTCALCBYCT.ACTREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setMaterialsCost(BigDecimal aValue){
       materialsCost = aValue;
    }

    public BigDecimal getMaterialsCost(){
       return materialsCost;
    }

    public void setTransportCost(BigDecimal aValue){
       transportCost = aValue;
    }

    public BigDecimal getTransportCost(){
       return transportCost;
    }

    public void setDeliveryCost(BigDecimal aValue){
       deliveryCost = aValue;
    }

    public BigDecimal getDeliveryCost(){
       return deliveryCost;
    }

    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }

    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }


    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setServicesObjectRef(ENServicesObjectRef aValue){
       servicesObjectRef = aValue;
    }

    public ENServicesObjectRef getServicesObjectRef(){
       return servicesObjectRef;
    }
    public void setActRef(ENActRef aValue){
       actRef = aValue;
    }

    public ENActRef getActRef(){
       return actRef;
    }

} // end of ENServicesFactCalcByActValueObject

