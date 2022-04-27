
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for FINDoc2Act2WorkOrder;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENActRef;
    import  com.ksoe.energynet.valueobject.references.ENWorkOrderRef;

public class FINDoc2Act2WorkOrder implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  finDocCode300 = Integer.MIN_VALUE; 
    public String  axJournalId; 
    public long  modify_time = Long.MIN_VALUE;
    public ENActRef actRef = new ENActRef();
    public ENWorkOrderRef workOrderRef = new ENWorkOrderRef();
    public static final String tableName = "FINDOC2ACT2WORKORDER";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "FINDOC2ACT2WORKORDER.CODE";
    public static final String finDocCode300_Attr = "finDocCode300";
    public static final String finDocCode300_Field = "FINDOCCODE300";
    public static final String finDocCode300_QFielld = "FINDOC2ACT2WORKORDER.FINDOCCODE300";
    public static final String axJournalId_Attr = "axJournalId";
    public static final String axJournalId_Field = "AXJOURNALID";
    public static final String axJournalId_QFielld = "FINDOC2ACT2WORKORDER.AXJOURNALID";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "FINDOC2ACT2WORKORDER.MODIFY_TIME";
    public static final String actRef_Attr = "actRef";
    public static final String actRef_Field = "ACTREFCODE";
    public static final String  actRef_QFielld = "FINDOC2ACT2WORKORDER.ACTREFCODE";
    public static final String workOrderRef_Attr = "workOrderRef";
    public static final String workOrderRef_Field = "WORKORDERREFCODE";
    public static final String  workOrderRef_QFielld = "FINDOC2ACT2WORKORDER.WORKORDERREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setFinDocCode300(int aValue){
       finDocCode300 = aValue;
    }

    public int getFinDocCode300(){
       return finDocCode300;
    }


    public void setAxJournalId(String aValue){
       axJournalId = aValue;
    }

    public String getAxJournalId(){
       return axJournalId;
    }


    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setActRef(ENActRef aValue){
       actRef = aValue;
    }

    public ENActRef getActRef(){
       return actRef;
    }
    public void setWorkOrderRef(ENWorkOrderRef aValue){
       workOrderRef = aValue;
    }

    public ENWorkOrderRef getWorkOrderRef(){
       return workOrderRef;
    }

} // end of FINDoc2Act2WorkOrderValueObject

