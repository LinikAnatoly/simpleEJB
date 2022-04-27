
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENGeneralContracts;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENGeneralContracts implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  finDocID = Integer.MIN_VALUE; 
    public String  finDocCode; 
    public String  contractNumber; 
    public Date contractDate ;
    public String  commentGen; 
    public int  partnerId = Integer.MIN_VALUE; 
    public String  partnerCode; 
    public String  partnerName; 
    public Date contractRegDate ;
    public Date contractStartDate ;
    public Date contractEndDate ;
    public String  axContractId; 
    public String  axContractCode; 
    public String  axContractNumber; 
    public String  axContractAccount; 
    public Date axContractDate ;
    public String  axContractCommentGen; 
    public String  axContractGroupCode; 
    public String  axPartnerCode; 
    public String  axPartnerName; 
    public String  userGen; 
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public static final String tableName = "ENGENERALCONTRACTS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENGENERALCONTRACTS.CODE";
    public static final String finDocID_Attr = "finDocID";
    public static final String finDocID_Field = "FINDOCID";
    public static final String finDocID_QFielld = "ENGENERALCONTRACTS.FINDOCID";
    public static final String finDocCode_Attr = "finDocCode";
    public static final String finDocCode_Field = "FINDOCCODE";
    public static final String finDocCode_QFielld = "ENGENERALCONTRACTS.FINDOCCODE";
    public static final String contractNumber_Attr = "contractNumber";
    public static final String contractNumber_Field = "CONTRACTNUMBER";
    public static final String contractNumber_QFielld = "ENGENERALCONTRACTS.CONTRACTNUMBER";
    public static final String contractDate_Attr = "contractDate";
    public static final String contractDate_Field = "CONTRACTDATE";
    public static final String contractDate_QFielld = "ENGENERALCONTRACTS.CONTRACTDATE";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENGENERALCONTRACTS.COMMENTGEN";
    public static final String partnerId_Attr = "partnerId";
    public static final String partnerId_Field = "PARTNERID";
    public static final String partnerId_QFielld = "ENGENERALCONTRACTS.PARTNERID";
    public static final String partnerCode_Attr = "partnerCode";
    public static final String partnerCode_Field = "PARTNERCODE";
    public static final String partnerCode_QFielld = "ENGENERALCONTRACTS.PARTNERCODE";
    public static final String partnerName_Attr = "partnerName";
    public static final String partnerName_Field = "PARTNERNAME";
    public static final String partnerName_QFielld = "ENGENERALCONTRACTS.PARTNERNAME";
    public static final String contractRegDate_Attr = "contractRegDate";
    public static final String contractRegDate_Field = "CONTRACTREGDATE";
    public static final String contractRegDate_QFielld = "ENGENERALCONTRACTS.CONTRACTREGDATE";
    public static final String contractStartDate_Attr = "contractStartDate";
    public static final String contractStartDate_Field = "CONTRACTSTARTDATE";
    public static final String contractStartDate_QFielld = "ENGENERALCONTRACTS.CONTRACTSTARTDATE";
    public static final String contractEndDate_Attr = "contractEndDate";
    public static final String contractEndDate_Field = "CONTRACTENDDATE";
    public static final String contractEndDate_QFielld = "ENGENERALCONTRACTS.CONTRACTENDDATE";
    public static final String axContractId_Attr = "axContractId";
    public static final String axContractId_Field = "AXCONTRACTID";
    public static final String axContractId_QFielld = "ENGENERALCONTRACTS.AXCONTRACTID";
    public static final String axContractCode_Attr = "axContractCode";
    public static final String axContractCode_Field = "AXCONTRACTCODE";
    public static final String axContractCode_QFielld = "ENGENERALCONTRACTS.AXCONTRACTCODE";
    public static final String axContractNumber_Attr = "axContractNumber";
    public static final String axContractNumber_Field = "AXCONTRACTNUMBER";
    public static final String axContractNumber_QFielld = "ENGENERALCONTRACTS.AXCONTRACTNUMBER";
    public static final String axContractAccount_Attr = "axContractAccount";
    public static final String axContractAccount_Field = "AXCONTRACTACCOUNT";
    public static final String axContractAccount_QFielld = "ENGENERALCONTRACTS.AXCONTRACTACCOUNT";
    public static final String axContractDate_Attr = "axContractDate";
    public static final String axContractDate_Field = "AXCONTRACTDATE";
    public static final String axContractDate_QFielld = "ENGENERALCONTRACTS.AXCONTRACTDATE";
    public static final String axContractCommentGen_Attr = "axContractCommentGen";
    public static final String axContractCommentGen_Field = "AXCONTRACTCOMMENTGEN";
    public static final String axContractCommentGen_QFielld = "ENGENERALCONTRACTS.AXCONTRACTCOMMENTGEN";
    public static final String axContractGroupCode_Attr = "axContractGroupCode";
    public static final String axContractGroupCode_Field = "AXCONTRACTGROUPCODE";
    public static final String axContractGroupCode_QFielld = "ENGENERALCONTRACTS.AXCONTRACTGROUPCODE";
    public static final String axPartnerCode_Attr = "axPartnerCode";
    public static final String axPartnerCode_Field = "AXPARTNERCODE";
    public static final String axPartnerCode_QFielld = "ENGENERALCONTRACTS.AXPARTNERCODE";
    public static final String axPartnerName_Attr = "axPartnerName";
    public static final String axPartnerName_Field = "AXPARTNERNAME";
    public static final String axPartnerName_QFielld = "ENGENERALCONTRACTS.AXPARTNERNAME";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENGENERALCONTRACTS.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENGENERALCONTRACTS.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENGENERALCONTRACTS.MODIFY_TIME";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setFinDocID(int aValue){
       finDocID = aValue;
    }

    public int getFinDocID(){
       return finDocID;
    }


    public void setFinDocCode(String aValue){
       finDocCode = aValue;
    }

    public String getFinDocCode(){
       return finDocCode;
    }


    public void setContractNumber(String aValue){
       contractNumber = aValue;
    }

    public String getContractNumber(){
       return contractNumber;
    }


    public void setContractDate(Date aValue){
       contractDate = aValue;
    }

    public Date getContractDate(){
       return contractDate;
    }


    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }


    public void setPartnerId(int aValue){
       partnerId = aValue;
    }

    public int getPartnerId(){
       return partnerId;
    }


    public void setPartnerCode(String aValue){
       partnerCode = aValue;
    }

    public String getPartnerCode(){
       return partnerCode;
    }


    public void setPartnerName(String aValue){
       partnerName = aValue;
    }

    public String getPartnerName(){
       return partnerName;
    }


    public void setContractRegDate(Date aValue){
       contractRegDate = aValue;
    }

    public Date getContractRegDate(){
       return contractRegDate;
    }


    public void setContractStartDate(Date aValue){
       contractStartDate = aValue;
    }

    public Date getContractStartDate(){
       return contractStartDate;
    }


    public void setContractEndDate(Date aValue){
       contractEndDate = aValue;
    }

    public Date getContractEndDate(){
       return contractEndDate;
    }


    public void setAxContractId(String aValue){
       axContractId = aValue;
    }

    public String getAxContractId(){
       return axContractId;
    }


    public void setAxContractCode(String aValue){
       axContractCode = aValue;
    }

    public String getAxContractCode(){
       return axContractCode;
    }


    public void setAxContractNumber(String aValue){
       axContractNumber = aValue;
    }

    public String getAxContractNumber(){
       return axContractNumber;
    }


    public void setAxContractAccount(String aValue){
       axContractAccount = aValue;
    }

    public String getAxContractAccount(){
       return axContractAccount;
    }


    public void setAxContractDate(Date aValue){
       axContractDate = aValue;
    }

    public Date getAxContractDate(){
       return axContractDate;
    }


    public void setAxContractCommentGen(String aValue){
       axContractCommentGen = aValue;
    }

    public String getAxContractCommentGen(){
       return axContractCommentGen;
    }


    public void setAxContractGroupCode(String aValue){
       axContractGroupCode = aValue;
    }

    public String getAxContractGroupCode(){
       return axContractGroupCode;
    }


    public void setAxPartnerCode(String aValue){
       axPartnerCode = aValue;
    }

    public String getAxPartnerCode(){
       return axPartnerCode;
    }


    public void setAxPartnerName(String aValue){
       axPartnerName = aValue;
    }

    public String getAxPartnerName(){
       return axPartnerName;
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


} // end of ENGeneralContractsValueObject

