
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for SCSeal2ENWorkOrderByt;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.SCSealRef;
    import  com.ksoe.energynet.valueobject.references.ENWorkOrderBytRef;
    import  com.ksoe.energynet.valueobject.references.ENWorkOrderBytItemRef;
    import  com.ksoe.energynet.valueobject.references.SCSeal2WorkOrderBytKindRef;

public class SCSeal2ENWorkOrderByt implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  commentGen; 
    public long  modify_time = Long.MIN_VALUE;
    public String  userAdd; 
    public Date dateAdd ;
    public String  userGen; 
    public Date dateEdit ;
    public SCSealRef sealRef = new SCSealRef();
    public ENWorkOrderBytRef workOrderBytRef = new ENWorkOrderBytRef();
    public ENWorkOrderBytItemRef workOrderBytItemRef = new ENWorkOrderBytItemRef();
    public SCSeal2WorkOrderBytKindRef kindRef = new SCSeal2WorkOrderBytKindRef();
    public static final String tableName = "SCSEAL2ENWORKORDERBYT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "SCSEAL2ENWORKORDERBYT.CODE";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "SCSEAL2ENWORKORDERBYT.COMMENTGEN";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "SCSEAL2ENWORKORDERBYT.MODIFY_TIME";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "SCSEAL2ENWORKORDERBYT.USERADD";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "SCSEAL2ENWORKORDERBYT.DATEADD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "SCSEAL2ENWORKORDERBYT.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "SCSEAL2ENWORKORDERBYT.DATEEDIT";
    public static final String sealRef_Attr = "sealRef";
    public static final String sealRef_Field = "SEALREFCODE";
    public static final String  sealRef_QFielld = "SCSEAL2ENWORKORDERBYT.SEALREFCODE";
    public static final String workOrderBytRef_Attr = "workOrderBytRef";
    public static final String workOrderBytRef_Field = "WORKORDERBYTREFCODE";
    public static final String  workOrderBytRef_QFielld = "SCSEAL2ENWORKORDERBYT.WORKORDERBYTREFCODE";
    public static final String workOrderBytItemRef_Attr = "workOrderBytItemRef";
    public static final String workOrderBytItemRef_Field = "WORKORDERBYTITEMREFCOD";
    public static final String  workOrderBytItemRef_QFielld = "SCSEAL2ENWORKORDERBYT.WORKORDERBYTITEMREFCOD";
    public static final String kindRef_Attr = "kindRef";
    public static final String kindRef_Field = "KINDREFCODE";
    public static final String  kindRef_QFielld = "SCSEAL2ENWORKORDERBYT.KINDREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
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

    public void setSealRef(SCSealRef aValue){
       sealRef = aValue;
    }

    public SCSealRef getSealRef(){
       return sealRef;
    }
    public void setWorkOrderBytRef(ENWorkOrderBytRef aValue){
       workOrderBytRef = aValue;
    }

    public ENWorkOrderBytRef getWorkOrderBytRef(){
       return workOrderBytRef;
    }
    public void setWorkOrderBytItemRef(ENWorkOrderBytItemRef aValue){
       workOrderBytItemRef = aValue;
    }

    public ENWorkOrderBytItemRef getWorkOrderBytItemRef(){
       return workOrderBytItemRef;
    }
    public void setKindRef(SCSeal2WorkOrderBytKindRef aValue){
       kindRef = aValue;
    }

    public SCSeal2WorkOrderBytKindRef getKindRef(){
       return kindRef;
    }

} // end of SCSeal2ENWorkOrderBytValueObject

