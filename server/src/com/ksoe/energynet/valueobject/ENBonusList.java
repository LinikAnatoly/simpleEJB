
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENBonusList;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENDepartmentRef;
    import  com.ksoe.energynet.valueobject.references.FINWorkerKindRef;
    import  com.ksoe.energynet.valueobject.references.ENBonusListStatusRef;

public class ENBonusList implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  numberGen; 
    public int  monthGen = Integer.MIN_VALUE; 
    public int  yearGen = Integer.MIN_VALUE; 
    public String  userAdd; 
    public Date dateAdd ;
    public String  userGen; 
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public ENDepartmentRef department = new ENDepartmentRef();
    public FINWorkerKindRef kindRef = new FINWorkerKindRef();
    public ENBonusListStatusRef status = new ENBonusListStatusRef();
    public static final String tableName = "ENBONUSLIST";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENBONUSLIST.CODE";
    public static final String numberGen_Attr = "numberGen";
    public static final String numberGen_Field = "NUMBERGEN";
    public static final String numberGen_QFielld = "ENBONUSLIST.NUMBERGEN";
    public static final String monthGen_Attr = "monthGen";
    public static final String monthGen_Field = "MONTHGEN";
    public static final String monthGen_QFielld = "ENBONUSLIST.MONTHGEN";
    public static final String yearGen_Attr = "yearGen";
    public static final String yearGen_Field = "YEARGEN";
    public static final String yearGen_QFielld = "ENBONUSLIST.YEARGEN";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "ENBONUSLIST.USERADD";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "ENBONUSLIST.DATEADD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENBONUSLIST.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENBONUSLIST.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENBONUSLIST.MODIFY_TIME";
    public static final String department_Attr = "department";
    public static final String department_Field = "DEPARTMENTCODE";
    public static final String  department_QFielld = "ENBONUSLIST.DEPARTMENTCODE";
    public static final String kindRef_Attr = "kindRef";
    public static final String kindRef_Field = "KINDREFCODE";
    public static final String  kindRef_QFielld = "ENBONUSLIST.KINDREFCODE";
    public static final String status_Attr = "status";
    public static final String status_Field = "STATUSCODE";
    public static final String  status_QFielld = "ENBONUSLIST.STATUSCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setNumberGen(String aValue){
       numberGen = aValue;
    }

    public String getNumberGen(){
       return numberGen;
    }


    public void setMonthGen(int aValue){
       monthGen = aValue;
    }

    public int getMonthGen(){
       return monthGen;
    }


    public void setYearGen(int aValue){
       yearGen = aValue;
    }

    public int getYearGen(){
       return yearGen;
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


    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setDepartment(ENDepartmentRef aValue){
       department = aValue;
    }

    public ENDepartmentRef getDepartment(){
       return department;
    }
    public void setKindRef(FINWorkerKindRef aValue){
       kindRef = aValue;
    }

    public FINWorkerKindRef getKindRef(){
       return kindRef;
    }
    public void setStatus(ENBonusListStatusRef aValue){
       status = aValue;
    }

    public ENBonusListStatusRef getStatus(){
       return status;
    }

} // end of ENBonusListValueObject

