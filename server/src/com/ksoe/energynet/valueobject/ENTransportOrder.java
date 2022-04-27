
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTransportOrder;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.ENTransportOrderStatus;
    import  com.ksoe.energynet.valueobject.references.ENPlanWorkRef;
    import  com.ksoe.techcard.valueobject.references.TKTransportRef;
    import  com.ksoe.techcard.valueobject.TKTransportReal;
    import  com.ksoe.energynet.valueobject.references.ENTransportDepartmentRef;
    import  com.ksoe.energynet.valueobject.references.ENTransportOrderRef;

public class ENTransportOrder implements Serializable {
	
	public static final int isAssignment_true = 1;
	public static final int isAssignment_false = 0;
        public static final int isApproved_true = 1;
        public static final int isApproved_false = 0;
        public static final int isRejected_true = 1;
        public static final int isRejected_false = 0;

    public int  code = Integer.MIN_VALUE; 
    public String  numbergen; 
    public Date timeStart ;
    public Date timeFinal ;
    public Date dateStart ;
    public Date dateFinal ;
    public int  isAssignment = Integer.MIN_VALUE; 
    public int  isApproved = Integer.MIN_VALUE; 
    public int  isRejected = Integer.MIN_VALUE; 
    public String  commentGen; 
    public Date dateEdit ;
    public String  userGen; 
    public long  modify_time = Long.MIN_VALUE;
    public ENTransportOrderStatus transportOrderStatus = new ENTransportOrderStatus();
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public TKTransportRef transport = new TKTransportRef();
    public TKTransportReal transportReal = new TKTransportReal();
    public ENTransportDepartmentRef transportDepartment = new ENTransportDepartmentRef();
    public ENTransportOrderRef parentRef = new ENTransportOrderRef();
    public static final String tableName = "ENTRANSPORTORDER";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTRANSPORTORDER.CODE";
    public static final String numbergen_Attr = "numbergen";
    public static final String numbergen_Field = "NUMBERGEN";
    public static final String numbergen_QFielld = "ENTRANSPORTORDER.NUMBERGEN";
    public static final String timeStart_Attr = "timeStart";
    public static final String timeStart_Field = "TIMESTART";
    public static final String timeStart_QFielld = "ENTRANSPORTORDER.TIMESTART";
    public static final String timeFinal_Attr = "timeFinal";
    public static final String timeFinal_Field = "TIMEFINAL";
    public static final String timeFinal_QFielld = "ENTRANSPORTORDER.TIMEFINAL";
    public static final String dateStart_Attr = "dateStart";
    public static final String dateStart_Field = "DATESTART";
    public static final String dateStart_QFielld = "ENTRANSPORTORDER.DATESTART";
    public static final String dateFinal_Attr = "dateFinal";
    public static final String dateFinal_Field = "DATEFINAL";
    public static final String dateFinal_QFielld = "ENTRANSPORTORDER.DATEFINAL";
    public static final String isAssignment_Attr = "isAssignment";
    public static final String isAssignment_Field = "ISASSIGNMENT";
    public static final String isAssignment_QFielld = "ENTRANSPORTORDER.ISASSIGNMENT";
    public static final String isApproved_Attr = "isApproved";
    public static final String isApproved_Field = "ISAPPROVED";
    public static final String isApproved_QFielld = "ENTRANSPORTORDER.ISAPPROVED";
    public static final String isRejected_Attr = "isRejected";
    public static final String isRejected_Field = "ISREJECTED";
    public static final String isRejected_QFielld = "ENTRANSPORTORDER.ISREJECTED";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENTRANSPORTORDER.COMMENTGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENTRANSPORTORDER.DATEEDIT";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENTRANSPORTORDER.USERGEN";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENTRANSPORTORDER.MODIFY_TIME";
    public static final String transportOrderStatus_Attr = "transportOrderStatus";
    public static final String transportOrderStatus_Field = "TRANSPORTORDERSTATUSCD";
    public static final String  transportOrderStatus_QFielld = "ENTRANSPORTORDER.TRANSPORTORDERSTATUSCD";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENTRANSPORTORDER.PLANREFCODE";
    public static final String transport_Attr = "transport";
    public static final String transport_Field = "TRANSPORTCODE";
    public static final String  transport_QFielld = "ENTRANSPORTORDER.TRANSPORTCODE";
    public static final String transportReal_Attr = "transportReal";
    public static final String transportReal_Field = "TRANSPORTREALCODE";
    public static final String  transportReal_QFielld = "ENTRANSPORTORDER.TRANSPORTREALCODE";
    public static final String transportDepartment_Attr = "transportDepartment";
    public static final String transportDepartment_Field = "TRANSPORTDEPARTMENTCOD";
    public static final String  transportDepartment_QFielld = "ENTRANSPORTORDER.TRANSPORTDEPARTMENTCOD";
    public static final String parentRef_Attr = "parentRef";
    public static final String parentRef_Field = "PARENTREFCODE";
    public static final String  parentRef_QFielld = "ENTRANSPORTORDER.PARENTREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setNumbergen(String aValue){
       numbergen = aValue;
    }

    public String getNumbergen(){
       return numbergen;
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


    public void setDateStart(Date aValue){
       dateStart = aValue;
    }

    public Date getDateStart(){
       return dateStart;
    }


    public void setDateFinal(Date aValue){
       dateFinal = aValue;
    }

    public Date getDateFinal(){
       return dateFinal;
    }

    public void setIsAssignment(int aValue){
       isAssignment = aValue;
    }

    public int getIsAssignment(){
       return isAssignment;
    }

    public void setIsApproved(int aValue){
       isApproved = aValue;
    }

    public int getIsApproved(){
       return isApproved;
    }

    public void setIsRejected(int aValue){
       isRejected = aValue;
    }

    public int getIsRejected(){
       return isRejected;
    }

    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }


    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }

    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }


    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setTransportOrderStatus(ENTransportOrderStatus aValue){
       transportOrderStatus = aValue;
    }

    public ENTransportOrderStatus getTransportOrderStatus(){
       return transportOrderStatus;
    }
    public void setPlanRef(ENPlanWorkRef aValue){
       planRef = aValue;
    }

    public ENPlanWorkRef getPlanRef(){
       return planRef;
    }
    public void setTransport(TKTransportRef aValue){
       transport = aValue;
    }

    public TKTransportRef getTransport(){
       return transport;
    }
    public void setTransportReal(TKTransportReal aValue){
       transportReal = aValue;
    }

    public TKTransportReal getTransportReal(){
       return transportReal;
    }
    public void setTransportDepartment(ENTransportDepartmentRef aValue){
       transportDepartment = aValue;
    }

    public ENTransportDepartmentRef getTransportDepartment(){
       return transportDepartment;
    }
    public void setParentRef(ENTransportOrderRef aValue){
       parentRef = aValue;
    }

    public ENTransportOrderRef getParentRef(){
       return parentRef;
    }

} // end of ENTransportOrderValueObject

