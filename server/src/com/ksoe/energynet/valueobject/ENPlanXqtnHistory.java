
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPlanXqtnHistory;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENPlanWorkRef;

public class ENPlanXqtnHistory implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public Date dateGen;
    public int  executionPercent = Integer.MIN_VALUE;
    public String  userGen; 
    public Date dateEdit;
    public long  modify_time = Long.MIN_VALUE;

    public ENPlanWorkRef planRef = new ENPlanWorkRef();

    public static final String tableName = "ENPLANXQTNHISTORY";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPLANXQTNHISTORY.CODE";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "ENPLANXQTNHISTORY.DATEGEN";
    public static final String executionPercent_Attr = "executionPercent";
    public static final String executionPercent_Field = "EXECUTIONPERCENT";
    public static final String executionPercent_QFielld = "ENPLANXQTNHISTORY.EXECUTIONPERCENT";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENPLANXQTNHISTORY.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENPLANXQTNHISTORY.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENPLANXQTNHISTORY.MODIFY_TIME";

    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENPLANXQTNHISTORY.PLANREFCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public Date getDateGen(){
       return dateGen;
    }

    public void setDateGen(Date dateGen){
       this.dateGen = dateGen;
    }


    public int getExecutionPercent(){
       return executionPercent;
    }
    
    public void setExecutionPercent(int executionPercent){
       this.executionPercent = executionPercent;
    }


    public String getUserGen(){
       return userGen;
    }
    
    public void setUserGen(String userGen){
       this.userGen = userGen;
    }


    public Date getDateEdit(){
       return dateEdit;
    }

    public void setDateEdit(Date dateEdit){
       this.dateEdit = dateEdit;
    }


    public long getModify_time(){
       return modify_time;
    }
    
    public void setModify_time(long modify_time){
       this.modify_time = modify_time;
    }

    public ENPlanWorkRef getPlanRef(){
       return planRef;
    }
    
    public void setPlanRef(ENPlanWorkRef planRef){
       this.planRef = planRef;
    }

} // end of ENPlanXqtnHistoryValueObject

