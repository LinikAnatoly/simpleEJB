
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPlanInformCustomer;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENWorkOrderBytRef;
    import  com.ksoe.energynet.valueobject.references.ENPlanWorkRef;

public class ENPlanInformCustomer implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public Date timeStart ;
    public Date timeFinal ;
    public long  modify_time = Long.MIN_VALUE;
    public String  userAdd; 
    public Date dateAdd ;
    public String  userGen; 
    public Date dateEdit ;
    public int  isSent = Integer.MIN_VALUE; 
    public ENWorkOrderBytRef workOrderBytRef = new ENWorkOrderBytRef();
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public static final String tableName = "ENPLANINFORMCUSTOMER";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPLANINFORMCUSTOMER.CODE";
    public static final String timeStart_Attr = "timeStart";
    public static final String timeStart_Field = "TIMESTART";
    public static final String timeStart_QFielld = "ENPLANINFORMCUSTOMER.TIMESTART";
    public static final String timeFinal_Attr = "timeFinal";
    public static final String timeFinal_Field = "TIMEFINAL";
    public static final String timeFinal_QFielld = "ENPLANINFORMCUSTOMER.TIMEFINAL";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENPLANINFORMCUSTOMER.MODIFY_TIME";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "ENPLANINFORMCUSTOMER.USERADD";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "ENPLANINFORMCUSTOMER.DATEADD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENPLANINFORMCUSTOMER.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENPLANINFORMCUSTOMER.DATEEDIT";
    public static final String isSent_Attr = "isSent";
    public static final String isSent_Field = "ISSENT";
    public static final String isSent_QFielld = "ENPLANINFORMCUSTOMER.ISSENT";
    public static final String workOrderBytRef_Attr = "workOrderBytRef";
    public static final String workOrderBytRef_Field = "WORKORDERBYTREFCODE";
    public static final String  workOrderBytRef_QFielld = "ENPLANINFORMCUSTOMER.WORKORDERBYTREFCODE";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENPLANINFORMCUSTOMER.PLANREFCODE";
	public static final int IS_NOT_SENT = 0;
	public static final int IS_SENT = 1;



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setTimeStart(Date aValue){
       timeStart = aValue;
    }

    public Date getTimeStart(){
       return timeStart;
    }


    public void setTimeFinal(Date aValue){
       timeFinal = aValue;
    }

    public Date getTimeFinal(){
       return timeFinal;
    }


    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }


    public void setUserAdd(String aValue){
       userAdd = aValue;
    }

    public String getUserAdd(){
       return userAdd;
    }


    public void setDateAdd(Date aValue){
       dateAdd = aValue;
    }

    public Date getDateAdd(){
       return dateAdd;
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


    public void setIsSent(int aValue){
       isSent = aValue;
    }

    public int getIsSent(){
       return isSent;
    }

    public void setWorkOrderBytRef(ENWorkOrderBytRef aValue){
       workOrderBytRef = aValue;
    }

    public ENWorkOrderBytRef getWorkOrderBytRef(){
       return workOrderBytRef;
    }
    public void setPlanRef(ENPlanWorkRef aValue){
       planRef = aValue;
    }

    public ENPlanWorkRef getPlanRef(){
       return planRef;
    }

} // end of ENPlanInformCustomerValueObject

