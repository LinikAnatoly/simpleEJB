
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for FINMolDataFINMolData;  	
  */

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.FINMolTypeRef;

public class FINMolData implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  finMolCode; 
    public String  finMolName; 
    public long  modify_time = Long.MIN_VALUE;
    public FINMolTypeRef molTypeRef = new FINMolTypeRef();
    public ENAct act = new ENAct();
    public ENWorkOrder workOrder = new ENWorkOrder();
    public static final String tableName = "FINMOLDATA";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "FINMOLDATA.CODE";
    public static final String finMolCode_Attr = "finMolCode";
    public static final String finMolCode_Field = "FINMOLCODE";
    public static final String finMolCode_QFielld = "FINMOLDATA.FINMOLCODE";
    public static final String finMolName_Attr = "finMolName";
    public static final String finMolName_Field = "FINMOLNAME";
    public static final String finMolName_QFielld = "FINMOLDATA.FINMOLNAME";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "FINMOLDATA.MODIFY_TIME";
    public static final String molTypeRef_Attr = "molTypeRef";
    public static final String molTypeRef_Field = "MOLTYPEREFCODE";
    public static final String  molTypeRef_QFielld = "FINMOLDATA.MOLTYPEREFCODE";
    public static final String act_Attr = "act";
    public static final String act_Field = "ACTCODE";
    public static final String  act_QFielld = "FINMOLDATA.ACTCODE";
    public static final String workOrder_Attr = "workOrder";
    public static final String workOrder_Field = "WORKORDERCODE";
    public static final String  workOrder_QFielld = "FINMOLDATA.WORKORDERCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setFinMolCode(String aValue){
       finMolCode = aValue;
    }

    public String getFinMolCode(){
       return finMolCode;
    }

    public void setFinMolName(String aValue){
       finMolName = aValue;
    }

    public String getFinMolName(){
       return finMolName;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

;
    public void setMolTypeRef(FINMolTypeRef aValue){
       molTypeRef = aValue;
    }

    public FINMolTypeRef getMolTypeRef(){
       return molTypeRef;
    }
    public void setAct(ENAct aValue){
       act = aValue;
    }

    public ENAct getAct(){
       return act;
    }
    public void setWorkOrder(ENWorkOrder aValue){
       workOrder = aValue;
    }

    public ENWorkOrder getWorkOrder(){
       return workOrder;
    }

} // end of FINMolDataValueObject

