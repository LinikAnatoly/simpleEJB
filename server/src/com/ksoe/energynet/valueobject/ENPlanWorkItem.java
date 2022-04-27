
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPlanWorkItem;
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENPlanWorkRef;
import com.ksoe.techcard.valueobject.references.TKTechCardRef;

public class ENPlanWorkItem implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public BigDecimal  countGen;
    public BigDecimal  timeGen;
    public BigDecimal  costGen;
    public int  workerCount = Integer.MIN_VALUE;
    public String  commentGen;
    public String  userGen;
    public Date dateEdit ;

    public long  modify_time = Long.MIN_VALUE;
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public TKTechCardRef kartaRef = new TKTechCardRef();
    public ENPlanWorkRef oldPlanRef = new ENPlanWorkRef();
    public static final String tableName = "ENPLANWORKITEM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPLANWORKITEM.CODE";
    public static final String countGen_Attr = "countGen";
    public static final String countGen_Field = "COUNTGEN";
    public static final String countGen_QFielld = "ENPLANWORKITEM.COUNTGEN";
    public static final String timeGen_Attr = "timeGen";
    public static final String timeGen_Field = "TIMEGEN";
    public static final String timeGen_QFielld = "ENPLANWORKITEM.TIMEGEN";
    public static final String costGen_Attr = "costGen";
    public static final String costGen_Field = "COSTGEN";
    public static final String costGen_QFielld = "ENPLANWORKITEM.COSTGEN";
    public static final String workerCount_Attr = "workerCount";
    public static final String workerCount_Field = "WORKERCOUNT";
    public static final String workerCount_QFielld = "ENPLANWORKITEM.WORKERCOUNT";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENPLANWORKITEM.COMMENTGEN";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENPLANWORKITEM.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENPLANWORKITEM.DATEEDIT";

    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENPLANWORKITEM.MODIFY_TIME";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENPLANWORKITEM.PLANREFCODE";
    public static final String kartaRef_Attr = "kartaRef";
    public static final String kartaRef_Field = "KARTAREFCODE";
    public static final String  kartaRef_QFielld = "ENPLANWORKITEM.KARTAREFCODE";
    public static final String oldPlanRef_Attr = "oldPlanRef";
    public static final String oldPlanRef_Field = "OLDPLANREFCODE";
    public static final String  oldPlanRef_QFielld = "ENPLANWORKITEM.OLDPLANREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setCountGen(BigDecimal aValue){
       countGen = aValue;
    }

    public BigDecimal getCountGen(){
       return countGen;
    }

    public void setTimeGen(BigDecimal aValue){
       timeGen = aValue;
    }

    public BigDecimal getTimeGen(){
       return timeGen;
    }

    public void setCostGen(BigDecimal aValue){
       costGen = aValue;
    }

    public BigDecimal getCostGen(){
       return costGen;
    }

    public void setWorkerCount(int aValue){
       workerCount = aValue;
    }

    public int getWorkerCount(){
       return workerCount;
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

    public void setPlanRef(ENPlanWorkRef aValue){
       planRef = aValue;
    }

    public ENPlanWorkRef getPlanRef(){
       return planRef;
    }
    public void setKartaRef(TKTechCardRef aValue){
       kartaRef = aValue;
    }

    public TKTechCardRef getKartaRef(){
       return kartaRef;
    }
    public void setOldPlanRef(ENPlanWorkRef aValue){
       oldPlanRef = aValue;
    }

    public ENPlanWorkRef getOldPlanRef(){
       return oldPlanRef;
    }

} // end of ENPlanWorkItemValueObject

