
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENAct2Prov;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENActRef;
    import  com.ksoe.energynet.valueobject.references.ENActPostingKindRef;

public class ENAct2Prov implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  partId = Integer.MIN_VALUE; 
    public String  userGen; 
    public Date datePosting ;
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public String  voucher; 
    public int  isIncomeAct = Integer.MIN_VALUE; 
    public ENActRef actRef = new ENActRef();
    public ENActPostingKindRef actPostingKindRef = new ENActPostingKindRef();
    public static final String tableName = "ENACT2PROV";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACT2PROV.CODE";
    public static final String partId_Attr = "partId";
    public static final String partId_Field = "PARTID";
    public static final String partId_QFielld = "ENACT2PROV.PARTID";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENACT2PROV.USERGEN";
    public static final String datePosting_Attr = "datePosting";
    public static final String datePosting_Field = "DATEPOSTING";
    public static final String datePosting_QFielld = "ENACT2PROV.DATEPOSTING";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENACT2PROV.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENACT2PROV.MODIFY_TIME";
    public static final String voucher_Attr = "voucher";
    public static final String voucher_Field = "VOUCHER";
    public static final String voucher_QFielld = "ENACT2PROV.VOUCHER";
    public static final String isIncomeAct_Attr = "isIncomeAct";
    public static final String isIncomeAct_Field = "ISINCOMEACT";
    public static final String isIncomeAct_QFielld = "ENACT2PROV.ISINCOMEACT";
    public static final String actRef_Attr = "actRef";
    public static final String actRef_Field = "ACTREFCODE";
    public static final String  actRef_QFielld = "ENACT2PROV.ACTREFCODE";
    public static final String actPostingKindRef_Attr = "actPostingKindRef";
    public static final String actPostingKindRef_Field = "ACTPOSTINGKINDREFCODE";
    public static final String  actPostingKindRef_QFielld = "ENACT2PROV.ACTPOSTINGKINDREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setPartId(int aValue){
       partId = aValue;
    }

    public int getPartId(){
       return partId;
    }


    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }


    public void setDatePosting(Date aValue){
       datePosting = aValue;
    }

    public Date getDatePosting(){
       return datePosting;
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


    public void setVoucher(String aValue){
       voucher = aValue;
    }

    public String getVoucher(){
       return voucher;
    }


    public void setIsIncomeAct(int aValue){
       isIncomeAct = aValue;
    }

    public int getIsIncomeAct(){
       return isIncomeAct;
    }

    public void setActRef(ENActRef aValue){
       actRef = aValue;
    }

    public ENActRef getActRef(){
       return actRef;
    }
    public void setActPostingKindRef(ENActPostingKindRef aValue){
       actPostingKindRef = aValue;
    }

    public ENActPostingKindRef getActPostingKindRef(){
       return actPostingKindRef;
    }

} // end of ENAct2ProvValueObject

