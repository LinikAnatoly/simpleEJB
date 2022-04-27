
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENGeoDep2ENDepartment;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENDepartmentRef;
    import  com.ksoe.energynet.valueobject.references.ENGeographicDepartmentRef;

public class ENGeoDep2ENDepartment implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  commentgen; 
    public String  userAdd; 
    public Date dateAdd;
    public String  userGen; 
    public Date dateEdit;
    public long  modify_time = Long.MIN_VALUE;

    public ENDepartmentRef departmentRef = new ENDepartmentRef();
    public ENGeographicDepartmentRef geoDepartmentRef = new ENGeographicDepartmentRef();

    public static final String tableName = "ENGEODEP2ENDEPARTMENT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENGEODEP2ENDEPARTMENT.CODE";
    public static final String commentgen_Attr = "commentgen";
    public static final String commentgen_Field = "COMMENTGEN";
    public static final String commentgen_QFielld = "ENGEODEP2ENDEPARTMENT.COMMENTGEN";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "ENGEODEP2ENDEPARTMENT.USERADD";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "ENGEODEP2ENDEPARTMENT.DATEADD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENGEODEP2ENDEPARTMENT.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENGEODEP2ENDEPARTMENT.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENGEODEP2ENDEPARTMENT.MODIFY_TIME";

    public static final String departmentRef_Attr = "departmentRef";
    public static final String departmentRef_Field = "DEPARTMENTREFCODE";
    public static final String  departmentRef_QFielld = "ENGEODEP2ENDEPARTMENT.DEPARTMENTREFCODE";
    public static final String geoDepartmentRef_Attr = "geoDepartmentRef";
    public static final String geoDepartmentRef_Field = "GEODEPARTMENTREFCODE";
    public static final String  geoDepartmentRef_QFielld = "ENGEODEP2ENDEPARTMENT.GEODEPARTMENTREFCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public String getCommentgen(){
       return commentgen;
    }
    
    public void setCommentgen(String commentgen){
       this.commentgen = commentgen;
    }


    public String getUserAdd(){
       return userAdd;
    }
    
    public void setUserAdd(String userAdd){
       this.userAdd = userAdd;
    }


    public Date getDateAdd(){
       return dateAdd;
    }

    public void setDateAdd(Date dateAdd){
       this.dateAdd = dateAdd;
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

    public ENDepartmentRef getDepartmentRef(){
       return departmentRef;
    }
    
    public void setDepartmentRef(ENDepartmentRef departmentRef){
       this.departmentRef = departmentRef;
    }
    public ENGeographicDepartmentRef getGeoDepartmentRef(){
       return geoDepartmentRef;
    }
    
    public void setGeoDepartmentRef(ENGeographicDepartmentRef geoDepartmentRef){
       this.geoDepartmentRef = geoDepartmentRef;
    }

} // end of ENGeoDep2ENDepartmentValueObject

