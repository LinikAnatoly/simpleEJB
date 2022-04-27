
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for SCUsageInput2DFDoc;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.SCUsageInputRef;

public class SCUsageInput2DFDoc implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public int  dfDocCode = Integer.MIN_VALUE;
    public int  dfDocTypeCode = Integer.MIN_VALUE;
    public int  dfDocSubtypeCode = Integer.MIN_VALUE;
    public String  dfDocNumber; 
    public Date dfDocDate;
    public String  dfDocDescription; 
    public String  commentgen; 
    public String  userAdd; 
    public Date dateAdd;
    public String  userGen; 
    public Date dateEdit;
    public long  modify_time = Long.MIN_VALUE;

    public SCUsageInputRef scUsageInputRef = new SCUsageInputRef();

    public static final String tableName = "SCUSAGEINPUT2DFDOC";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "SCUSAGEINPUT2DFDOC.CODE";
    public static final String dfDocCode_Attr = "dfDocCode";
    public static final String dfDocCode_Field = "DFDOCCODE";
    public static final String dfDocCode_QFielld = "SCUSAGEINPUT2DFDOC.DFDOCCODE";
    public static final String dfDocTypeCode_Attr = "dfDocTypeCode";
    public static final String dfDocTypeCode_Field = "DFDOCTYPECODE";
    public static final String dfDocTypeCode_QFielld = "SCUSAGEINPUT2DFDOC.DFDOCTYPECODE";
    public static final String dfDocSubtypeCode_Attr = "dfDocSubtypeCode";
    public static final String dfDocSubtypeCode_Field = "DFDOCSUBTYPECODE";
    public static final String dfDocSubtypeCode_QFielld = "SCUSAGEINPUT2DFDOC.DFDOCSUBTYPECODE";
    public static final String dfDocNumber_Attr = "dfDocNumber";
    public static final String dfDocNumber_Field = "DFDOCNUMBER";
    public static final String dfDocNumber_QFielld = "SCUSAGEINPUT2DFDOC.DFDOCNUMBER";
    public static final String dfDocDate_Attr = "dfDocDate";
    public static final String dfDocDate_Field = "DFDOCDATE";
    public static final String dfDocDate_QFielld = "SCUSAGEINPUT2DFDOC.DFDOCDATE";
    public static final String dfDocDescription_Attr = "dfDocDescription";
    public static final String dfDocDescription_Field = "DFDOCDESCRIPTION";
    public static final String dfDocDescription_QFielld = "SCUSAGEINPUT2DFDOC.DFDOCDESCRIPTION";
    public static final String commentgen_Attr = "commentgen";
    public static final String commentgen_Field = "COMMENTGEN";
    public static final String commentgen_QFielld = "SCUSAGEINPUT2DFDOC.COMMENTGEN";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "SCUSAGEINPUT2DFDOC.USERADD";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "SCUSAGEINPUT2DFDOC.DATEADD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "SCUSAGEINPUT2DFDOC.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "SCUSAGEINPUT2DFDOC.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "SCUSAGEINPUT2DFDOC.MODIFY_TIME";

    public static final String scUsageInputRef_Attr = "scUsageInputRef";
    public static final String scUsageInputRef_Field = "SCUSAGEINPUTREFCODE";
    public static final String  scUsageInputRef_QFielld = "SCUSAGEINPUT2DFDOC.SCUSAGEINPUTREFCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public int getDfDocCode(){
       return dfDocCode;
    }
    
    public void setDfDocCode(int dfDocCode){
       this.dfDocCode = dfDocCode;
    }


    public int getDfDocTypeCode(){
       return dfDocTypeCode;
    }
    
    public void setDfDocTypeCode(int dfDocTypeCode){
       this.dfDocTypeCode = dfDocTypeCode;
    }


    public int getDfDocSubtypeCode(){
       return dfDocSubtypeCode;
    }
    
    public void setDfDocSubtypeCode(int dfDocSubtypeCode){
       this.dfDocSubtypeCode = dfDocSubtypeCode;
    }


    public String getDfDocNumber(){
       return dfDocNumber;
    }
    
    public void setDfDocNumber(String dfDocNumber){
       this.dfDocNumber = dfDocNumber;
    }


    public Date getDfDocDate(){
       return dfDocDate;
    }

    public void setDfDocDate(Date dfDocDate){
       this.dfDocDate = dfDocDate;
    }


    public String getDfDocDescription(){
       return dfDocDescription;
    }
    
    public void setDfDocDescription(String dfDocDescription){
       this.dfDocDescription = dfDocDescription;
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

    public SCUsageInputRef getScUsageInputRef(){
       return scUsageInputRef;
    }
    
    public void setScUsageInputRef(SCUsageInputRef scUsageInputRef){
       this.scUsageInputRef = scUsageInputRef;
    }

} // end of SCUsageInput2DFDocValueObject

