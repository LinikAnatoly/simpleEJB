
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENWorkOrder;
  */

import java.io.Serializable;
import java.util.Date;

public class ENWorkOrder implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  workOrderNumber;
    public int  numberInt = Integer.MIN_VALUE;
    public Date dateGen ;
    public String  commentGen;
    public String  defectShortDesc;
    public String  finMolCode;
    public String  finMolName;
    public String  finMechanicCode;
    public String  finMechanicName;
    public String  userGen;
    public Date dateEdit ;

    public long  modify_time = Long.MIN_VALUE;
    public ENDepartment department = new ENDepartment();
    public ENWorkOrderStatus statusWorkOrder = new ENWorkOrderStatus();
    public static final String tableName = "ENWORKORDER";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENWORKORDER.CODE";
    public static final String workOrderNumber_Attr = "workOrderNumber";
    public static final String workOrderNumber_Field = "WORKORDERNUMBER";
    public static final String workOrderNumber_QFielld = "ENWORKORDER.WORKORDERNUMBER";
    public static final String numberInt_Attr = "numberInt";
    public static final String numberInt_Field = "NUMBERINT";
    public static final String numberInt_QFielld = "ENWORKORDER.NUMBERINT";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "ENWORKORDER.DATEGEN";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENWORKORDER.COMMENTGEN";
    public static final String defectShortDesc_Attr = "defectShortDesc";
    public static final String defectShortDesc_Field = "DEFECTSHORTDESC";
    public static final String defectShortDesc_QFielld = "ENWORKORDER.DEFECTSHORTDESC";
    public static final String finMolCode_Attr = "finMolCode";
    public static final String finMolCode_Field = "FINMOLCODE";
    public static final String finMolCode_QFielld = "ENWORKORDER.FINMOLCODE";
    public static final String finMolName_Attr = "finMolName";
    public static final String finMolName_Field = "FINMOLNAME";
    public static final String finMolName_QFielld = "ENWORKORDER.FINMOLNAME";
    public static final String finMechanicCode_Attr = "finMechanicCode";
    public static final String finMechanicCode_Field = "FINMECHANICCODE";
    public static final String finMechanicCode_QFielld = "ENWORKORDER.FINMECHANICCODE";
    public static final String finMechanicName_Attr = "finMechanicName";
    public static final String finMechanicName_Field = "FINMECHANICNAME";
    public static final String finMechanicName_QFielld = "ENWORKORDER.FINMECHANICNAME";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENWORKORDER.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENWORKORDER.DATEEDIT";

    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENWORKORDER.MODIFY_TIME";
    public static final String department_Attr = "department";
    public static final String department_Field = "DEPARTMENTCODE";
    public static final String  department_QFielld = "ENWORKORDER.DEPARTMENTCODE";
    public static final String statusWorkOrder_Attr = "statusWorkOrder";
    public static final String statusWorkOrder_Field = "STATUSWORKORDERCODE";
    public static final String  statusWorkOrder_QFielld = "ENWORKORDER.STATUSWORKORDERCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setWorkOrderNumber(String aValue){
       workOrderNumber = aValue;
    }

    public String getWorkOrderNumber(){
       return workOrderNumber;
    }

    public void setNumberInt(int aValue){
       numberInt = aValue;
    }

    public int getNumberInt(){
       return numberInt;
    }


    public void setDateGen(Date aValue){
       dateGen = aValue;
    }

    public Date getDateGen(){
       return dateGen;
    }

    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }

    public void setDefectShortDesc(String aValue){
       defectShortDesc = aValue;
    }

    public String getDefectShortDesc(){
       return defectShortDesc;
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

    public void setFinMechanicCode(String aValue){
       finMechanicCode = aValue;
    }

    public String getFinMechanicCode(){
       return finMechanicCode;
    }

    public void setFinMechanicName(String aValue){
       finMechanicName = aValue;
    }

    public String getFinMechanicName(){
       return finMechanicName;
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

    public void setDepartment(ENDepartment aValue){
       department = aValue;
    }

    public ENDepartment getDepartment(){
       return department;
    }
    public void setStatusWorkOrder(ENWorkOrderStatus aValue){
       statusWorkOrder = aValue;
    }

    public ENWorkOrderStatus getStatusWorkOrder(){
       return statusWorkOrder;
    }

} // end of ENWorkOrderValueObject

