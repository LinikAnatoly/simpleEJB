
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



import java.io.Serializable;
import java.util.Date;


public class ENGeographicDepartment implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  name; 
    public String  commentgen; 
    public String  userAdd; 
    public Date dateAdd;
    public String  userGen; 
    public Date dateEdit;
    public long  modify_time = Long.MIN_VALUE;


    public static final String tableName = "ENGEOGRAPHICDEPARTMENT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENGEOGRAPHICDEPARTMENT.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENGEOGRAPHICDEPARTMENT.NAME";
    public static final String commentgen_Attr = "commentgen";
    public static final String commentgen_Field = "COMMENTGEN";
    public static final String commentgen_QFielld = "ENGEOGRAPHICDEPARTMENT.COMMENTGEN";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "ENGEOGRAPHICDEPARTMENT.USERADD";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "ENGEOGRAPHICDEPARTMENT.DATEADD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENGEOGRAPHICDEPARTMENT.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENGEOGRAPHICDEPARTMENT.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENGEOGRAPHICDEPARTMENT.MODIFY_TIME";




    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public String getName(){
       return name;
    }
    
    public void setName(String name){
       this.name = name;
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


} // end of ENGeographicDepartmentValueObject

