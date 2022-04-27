
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENLandSheetsDelays;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENLandSheetsDelays implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public Date dateFrom;
    public Date dateTo;
    public int  standardDelay = Integer.MIN_VALUE;
    public int  nonstandardDelay = Integer.MIN_VALUE;
    public String  commentgen; 
    public String  userAdd; 
    public Date dateAdd;
    public String  userGen; 
    public Date dateEdit;
    public long  modify_time = Long.MIN_VALUE;


    public static final String tableName = "ENLANDSHEETSDELAYS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENLANDSHEETSDELAYS.CODE";
    public static final String dateFrom_Attr = "dateFrom";
    public static final String dateFrom_Field = "DATEFROM";
    public static final String dateFrom_QFielld = "ENLANDSHEETSDELAYS.DATEFROM";
    public static final String dateTo_Attr = "dateTo";
    public static final String dateTo_Field = "DATETO";
    public static final String dateTo_QFielld = "ENLANDSHEETSDELAYS.DATETO";
    public static final String standardDelay_Attr = "standardDelay";
    public static final String standardDelay_Field = "STANDARDDELAY";
    public static final String standardDelay_QFielld = "ENLANDSHEETSDELAYS.STANDARDDELAY";
    public static final String nonstandardDelay_Attr = "nonstandardDelay";
    public static final String nonstandardDelay_Field = "NONSTANDARDDELAY";
    public static final String nonstandardDelay_QFielld = "ENLANDSHEETSDELAYS.NONSTANDARDDELAY";
    public static final String commentgen_Attr = "commentgen";
    public static final String commentgen_Field = "COMMENTGEN";
    public static final String commentgen_QFielld = "ENLANDSHEETSDELAYS.COMMENTGEN";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "ENLANDSHEETSDELAYS.USERADD";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "ENLANDSHEETSDELAYS.DATEADD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENLANDSHEETSDELAYS.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENLANDSHEETSDELAYS.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENLANDSHEETSDELAYS.MODIFY_TIME";




    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public Date getDateFrom(){
       return dateFrom;
    }

    public void setDateFrom(Date dateFrom){
       this.dateFrom = dateFrom;
    }


    public Date getDateTo(){
       return dateTo;
    }

    public void setDateTo(Date dateTo){
       this.dateTo = dateTo;
    }


    public int getStandardDelay(){
       return standardDelay;
    }
    
    public void setStandardDelay(int standardDelay){
       this.standardDelay = standardDelay;
    }


    public int getNonstandardDelay(){
       return nonstandardDelay;
    }
    
    public void setNonstandardDelay(int nonstandardDelay){
       this.nonstandardDelay = nonstandardDelay;
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


} // end of ENLandSheetsDelaysValueObject

