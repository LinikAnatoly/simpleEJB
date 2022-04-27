
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENActInvest2DFDoc;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENActRef;
    import  com.ksoe.energynet.valueobject.references.ENActInvestType2DFDocRef;

public class ENActInvest2DFDoc implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public int  dfDocCode = Integer.MIN_VALUE;
    public int  dfDocTypeCode = Integer.MIN_VALUE;
    public String  dfDocNumber; 
    public Date dfDocDate;
    public String  dfDocDescription; 
    public String  commentgen; 
    public int  necessary = Integer.MIN_VALUE;
    public String  userAdd; 
    public Date dateAdd;
    public String  userGen; 
    public Date dateEdit;
    public long  modify_time = Long.MIN_VALUE;

    public ENActRef actRef = new ENActRef();
    public ENActInvestType2DFDocRef typeRef = new ENActInvestType2DFDocRef();

    public static final String tableName = "ENACTINVEST2DFDOC";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACTINVEST2DFDOC.CODE";
    public static final String dfDocCode_Attr = "dfDocCode";
    public static final String dfDocCode_Field = "DFDOCCODE";
    public static final String dfDocCode_QFielld = "ENACTINVEST2DFDOC.DFDOCCODE";
    public static final String dfDocTypeCode_Attr = "dfDocTypeCode";
    public static final String dfDocTypeCode_Field = "DFDOCTYPECODE";
    public static final String dfDocTypeCode_QFielld = "ENACTINVEST2DFDOC.DFDOCTYPECODE";
    public static final String dfDocNumber_Attr = "dfDocNumber";
    public static final String dfDocNumber_Field = "DFDOCNUMBER";
    public static final String dfDocNumber_QFielld = "ENACTINVEST2DFDOC.DFDOCNUMBER";
    public static final String dfDocDate_Attr = "dfDocDate";
    public static final String dfDocDate_Field = "DFDOCDATE";
    public static final String dfDocDate_QFielld = "ENACTINVEST2DFDOC.DFDOCDATE";
    public static final String dfDocDescription_Attr = "dfDocDescription";
    public static final String dfDocDescription_Field = "DFDOCDESCRIPTION";
    public static final String dfDocDescription_QFielld = "ENACTINVEST2DFDOC.DFDOCDESCRIPTION";
    public static final String commentgen_Attr = "commentgen";
    public static final String commentgen_Field = "COMMENTGEN";
    public static final String commentgen_QFielld = "ENACTINVEST2DFDOC.COMMENTGEN";
    public static final String necessary_Attr = "necessary";
    public static final String necessary_Field = "NECESSARY";
    public static final String necessary_QFielld = "ENACTINVEST2DFDOC.NECESSARY";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "ENACTINVEST2DFDOC.USERADD";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "ENACTINVEST2DFDOC.DATEADD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENACTINVEST2DFDOC.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENACTINVEST2DFDOC.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENACTINVEST2DFDOC.MODIFY_TIME";

    public static final String actRef_Attr = "actRef";
    public static final String actRef_Field = "ACTREFCODE";
    public static final String  actRef_QFielld = "ENACTINVEST2DFDOC.ACTREFCODE";
    public static final String typeRef_Attr = "typeRef";
    public static final String typeRef_Field = "TYPEREFCODE";
    public static final String  typeRef_QFielld = "ENACTINVEST2DFDOC.TYPEREFCODE";



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


    public int getNecessary(){
       return necessary;
    }
    
    public void setNecessary(int necessary){
       this.necessary = necessary;
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

    public ENActRef getActRef(){
       return actRef;
    }
    
    public void setActRef(ENActRef actRef){
       this.actRef = actRef;
    }
    public ENActInvestType2DFDocRef getTypeRef(){
       return typeRef;
    }
    
    public void setTypeRef(ENActInvestType2DFDocRef typeRef){
       this.typeRef = typeRef;
    }

} // end of ENActInvest2DFDocValueObject

