
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2022 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSheets4SO;  	
  */

import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENSheets4SOTypeRef;
    import  com.ksoe.energynet.valueobject.references.ENDocAttachmentRef;
    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;

public class ENSheets4SO implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  numbergen; 
    public String  name; 
    public Date dateGen;
    public int  dayscnt = Integer.MIN_VALUE;
    public Date nextSheetDate;
    public int  isLast = Integer.MIN_VALUE;
    public String  recipient; 
    public String  recipientAddress; 
    public String  postCode; 
    public String  signerPosition; 
    public String  signerFio; 
    public String  executorFio; 
    public String  executorPhone; 
    public String  executorEmail; 
    public String  additionalText; 
    public int  isWithSignature = Integer.MIN_VALUE;
    public String  commentgen; 
    public int  dfDocCode = Integer.MIN_VALUE;
    public int  dfDocTypeCode = Integer.MIN_VALUE;
    public String  dfDocNumber; 
    public Date dfDocDate;
    public String  userGen; 
    public Date dateEdit;
    public long  modify_time = Long.MIN_VALUE;
    public int  wfPackCode = Integer.MIN_VALUE;

    public ENSheets4SOTypeRef sheet4sotype = new ENSheets4SOTypeRef();
    public ENDocAttachmentRef attachment = new ENDocAttachmentRef();
    public ENServicesObjectRef servicesobject = new ENServicesObjectRef();

    public static final String tableName = "ENSHEETS4SO";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSHEETS4SO.CODE";
    public static final String numbergen_Attr = "numbergen";
    public static final String numbergen_Field = "NUMBERGEN";
    public static final String numbergen_QFielld = "ENSHEETS4SO.NUMBERGEN";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENSHEETS4SO.NAME";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "ENSHEETS4SO.DATEGEN";
    public static final String dayscnt_Attr = "dayscnt";
    public static final String dayscnt_Field = "DAYSCNT";
    public static final String dayscnt_QFielld = "ENSHEETS4SO.DAYSCNT";
    public static final String nextSheetDate_Attr = "nextSheetDate";
    public static final String nextSheetDate_Field = "NEXTSHEETDATE";
    public static final String nextSheetDate_QFielld = "ENSHEETS4SO.NEXTSHEETDATE";
    public static final String isLast_Attr = "isLast";
    public static final String isLast_Field = "ISLAST";
    public static final String isLast_QFielld = "ENSHEETS4SO.ISLAST";
    public static final String recipient_Attr = "recipient";
    public static final String recipient_Field = "RECIPIENT";
    public static final String recipient_QFielld = "ENSHEETS4SO.RECIPIENT";
    public static final String recipientAddress_Attr = "recipientAddress";
    public static final String recipientAddress_Field = "RECIPIENTADDRESS";
    public static final String recipientAddress_QFielld = "ENSHEETS4SO.RECIPIENTADDRESS";
    public static final String postCode_Attr = "postCode";
    public static final String postCode_Field = "POSTCODE";
    public static final String postCode_QFielld = "ENSHEETS4SO.POSTCODE";
    public static final String signerPosition_Attr = "signerPosition";
    public static final String signerPosition_Field = "SIGNERPOSITION";
    public static final String signerPosition_QFielld = "ENSHEETS4SO.SIGNERPOSITION";
    public static final String signerFio_Attr = "signerFio";
    public static final String signerFio_Field = "SIGNERFIO";
    public static final String signerFio_QFielld = "ENSHEETS4SO.SIGNERFIO";
    public static final String executorFio_Attr = "executorFio";
    public static final String executorFio_Field = "EXECUTORFIO";
    public static final String executorFio_QFielld = "ENSHEETS4SO.EXECUTORFIO";
    public static final String executorPhone_Attr = "executorPhone";
    public static final String executorPhone_Field = "EXECUTORPHONE";
    public static final String executorPhone_QFielld = "ENSHEETS4SO.EXECUTORPHONE";
    public static final String executorEmail_Attr = "executorEmail";
    public static final String executorEmail_Field = "EXECUTOREMAIL";
    public static final String executorEmail_QFielld = "ENSHEETS4SO.EXECUTOREMAIL";
    public static final String additionalText_Attr = "additionalText";
    public static final String additionalText_Field = "ADDITIONALTEXT";
    public static final String additionalText_QFielld = "ENSHEETS4SO.ADDITIONALTEXT";
    public static final String isWithSignature_Attr = "isWithSignature";
    public static final String isWithSignature_Field = "ISWITHSIGNATURE";
    public static final String isWithSignature_QFielld = "ENSHEETS4SO.ISWITHSIGNATURE";
    public static final String commentgen_Attr = "commentgen";
    public static final String commentgen_Field = "COMMENTGEN";
    public static final String commentgen_QFielld = "ENSHEETS4SO.COMMENTGEN";
    public static final String dfDocCode_Attr = "dfDocCode";
    public static final String dfDocCode_Field = "DFDOCCODE";
    public static final String dfDocCode_QFielld = "ENSHEETS4SO.DFDOCCODE";
    public static final String dfDocTypeCode_Attr = "dfDocTypeCode";
    public static final String dfDocTypeCode_Field = "DFDOCTYPECODE";
    public static final String dfDocTypeCode_QFielld = "ENSHEETS4SO.DFDOCTYPECODE";
    public static final String dfDocNumber_Attr = "dfDocNumber";
    public static final String dfDocNumber_Field = "DFDOCNUMBER";
    public static final String dfDocNumber_QFielld = "ENSHEETS4SO.DFDOCNUMBER";
    public static final String dfDocDate_Attr = "dfDocDate";
    public static final String dfDocDate_Field = "DFDOCDATE";
    public static final String dfDocDate_QFielld = "ENSHEETS4SO.DFDOCDATE";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENSHEETS4SO.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENSHEETS4SO.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENSHEETS4SO.MODIFY_TIME";
    public static final String wfPackCode_Attr = "wfPackCode";
    public static final String wfPackCode_Field = "WFPACKCODE";
    public static final String wfPackCode_QFielld = "ENSHEETS4SO.WFPACKCODE";

    public static final String sheet4sotype_Attr = "sheet4sotype";
    public static final String sheet4sotype_Field = "SHEET4SOTYPECODE";
    public static final String  sheet4sotype_QFielld = "ENSHEETS4SO.SHEET4SOTYPECODE";
    public static final String attachment_Attr = "attachment";
    public static final String attachment_Field = "ATTACHMENTCODE";
    public static final String  attachment_QFielld = "ENSHEETS4SO.ATTACHMENTCODE";
    public static final String servicesobject_Attr = "servicesobject";
    public static final String servicesobject_Field = "SERVICESOBJECTCODE";
    public static final String  servicesobject_QFielld = "ENSHEETS4SO.SERVICESOBJECTCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public String getNumbergen(){
       return numbergen;
    }
    
    public void setNumbergen(String numbergen){
       this.numbergen = numbergen;
    }


    public String getName(){
       return name;
    }
    
    public void setName(String name){
       this.name = name;
    }


    public Date getDateGen(){
       return dateGen;
    }

    public void setDateGen(Date dateGen){
       this.dateGen = dateGen;
    }


    public int getDayscnt(){
       return dayscnt;
    }
    
    public void setDayscnt(int dayscnt){
       this.dayscnt = dayscnt;
    }


    public Date getNextSheetDate(){
       return nextSheetDate;
    }

    public void setNextSheetDate(Date nextSheetDate){
       this.nextSheetDate = nextSheetDate;
    }


    public int getIsLast(){
       return isLast;
    }
    
    public void setIsLast(int isLast){
       this.isLast = isLast;
    }


    public String getRecipient(){
       return recipient;
    }
    
    public void setRecipient(String recipient){
       this.recipient = recipient;
    }


    public String getRecipientAddress(){
       return recipientAddress;
    }
    
    public void setRecipientAddress(String recipientAddress){
       this.recipientAddress = recipientAddress;
    }


    public String getPostCode(){
       return postCode;
    }
    
    public void setPostCode(String postCode){
       this.postCode = postCode;
    }


    public String getSignerPosition(){
       return signerPosition;
    }
    
    public void setSignerPosition(String signerPosition){
       this.signerPosition = signerPosition;
    }


    public String getSignerFio(){
       return signerFio;
    }
    
    public void setSignerFio(String signerFio){
       this.signerFio = signerFio;
    }


    public String getExecutorFio(){
       return executorFio;
    }
    
    public void setExecutorFio(String executorFio){
       this.executorFio = executorFio;
    }


    public String getExecutorPhone(){
       return executorPhone;
    }
    
    public void setExecutorPhone(String executorPhone){
       this.executorPhone = executorPhone;
    }


    public String getExecutorEmail(){
       return executorEmail;
    }
    
    public void setExecutorEmail(String executorEmail){
       this.executorEmail = executorEmail;
    }


    public String getAdditionalText(){
       return additionalText;
    }
    
    public void setAdditionalText(String additionalText){
       this.additionalText = additionalText;
    }


    public int getIsWithSignature(){
       return isWithSignature;
    }
    
    public void setIsWithSignature(int isWithSignature){
       this.isWithSignature = isWithSignature;
    }


    public String getCommentgen(){
       return commentgen;
    }
    
    public void setCommentgen(String commentgen){
       this.commentgen = commentgen;
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


    public int getWfPackCode(){
       return wfPackCode;
    }
    
    public void setWfPackCode(int wfPackCode){
       this.wfPackCode = wfPackCode;
    }

    public ENSheets4SOTypeRef getSheet4sotype(){
       return sheet4sotype;
    }
    
    public void setSheet4sotype(ENSheets4SOTypeRef sheet4sotype){
       this.sheet4sotype = sheet4sotype;
    }
    public ENDocAttachmentRef getAttachment(){
       return attachment;
    }
    
    public void setAttachment(ENDocAttachmentRef attachment){
       this.attachment = attachment;
    }
    public ENServicesObjectRef getServicesobject(){
       return servicesobject;
    }
    
    public void setServicesobject(ENServicesObjectRef servicesobject){
       this.servicesobject = servicesobject;
    }

} // end of ENSheets4SOValueObject

