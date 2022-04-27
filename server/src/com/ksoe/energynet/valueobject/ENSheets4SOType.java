
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  import java.io.Serializable;

import  com.ksoe.energynet.valueobject.references.ENSignerRef;

public class ENSheets4SOType implements Serializable {

    public static final int LAND_SHEET = 1;
    public static final int DISTRIBUTION_STATEMENT_ACCESSION = 15;
    public static final int DISTRIBUTION_POINT_PASSPORT = 18;
    public static final int DISTRIBUTION_SENDING_PAPER_COPY_AGREEMENT = 19;
    public static final int DISTRIBUTION_CONTRACT_CHANGE_OWNER_FOR_HOUSEHOLD_SECTOR = 20;
    public static final int PETITION = 21;

    /** Супровідний лист до Повідомлення про надання послуги з приєднання */
    public static final int NOTIFICATION_ACT = 27;

    public int  code = Integer.MIN_VALUE;
    public String  name; 
    public String  nameForDfDoc; 
    public String  dfDocNumMask; 
    public int  dfDepartmentCode = Integer.MIN_VALUE;
    public String  executorFio; 
    public String  executorPhone; 
    public String  executorEmail; 
    public String  reportPath; 
    public String  reportFileName; 
    public String  reportType; 
    public String  commentGen; 

    public ENSignerRef signerRef = new ENSignerRef();

    public static final String tableName = "ENSHEETS4SOTYPE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSHEETS4SOTYPE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENSHEETS4SOTYPE.NAME";
    public static final String nameForDfDoc_Attr = "nameForDfDoc";
    public static final String nameForDfDoc_Field = "NAMEFORDFDOC";
    public static final String nameForDfDoc_QFielld = "ENSHEETS4SOTYPE.NAMEFORDFDOC";
    public static final String dfDocNumMask_Attr = "dfDocNumMask";
    public static final String dfDocNumMask_Field = "DFDOCNUMMASK";
    public static final String dfDocNumMask_QFielld = "ENSHEETS4SOTYPE.DFDOCNUMMASK";
    public static final String dfDepartmentCode_Attr = "dfDepartmentCode";
    public static final String dfDepartmentCode_Field = "DFDEPARTMENTCODE";
    public static final String dfDepartmentCode_QFielld = "ENSHEETS4SOTYPE.DFDEPARTMENTCODE";
    public static final String executorFio_Attr = "executorFio";
    public static final String executorFio_Field = "EXECUTORFIO";
    public static final String executorFio_QFielld = "ENSHEETS4SOTYPE.EXECUTORFIO";
    public static final String executorPhone_Attr = "executorPhone";
    public static final String executorPhone_Field = "EXECUTORPHONE";
    public static final String executorPhone_QFielld = "ENSHEETS4SOTYPE.EXECUTORPHONE";
    public static final String executorEmail_Attr = "executorEmail";
    public static final String executorEmail_Field = "EXECUTOREMAIL";
    public static final String executorEmail_QFielld = "ENSHEETS4SOTYPE.EXECUTOREMAIL";
    public static final String reportPath_Attr = "reportPath";
    public static final String reportPath_Field = "REPORTPATH";
    public static final String reportPath_QFielld = "ENSHEETS4SOTYPE.REPORTPATH";
    public static final String reportFileName_Attr = "reportFileName";
    public static final String reportFileName_Field = "REPORTFILENAME";
    public static final String reportFileName_QFielld = "ENSHEETS4SOTYPE.REPORTFILENAME";
    public static final String reportType_Attr = "reportType";
    public static final String reportType_Field = "REPORTTYPE";
    public static final String reportType_QFielld = "ENSHEETS4SOTYPE.REPORTTYPE";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENSHEETS4SOTYPE.COMMENTGEN";

    public static final String signerRef_Attr = "signerRef";
    public static final String signerRef_Field = "SIGNERREFCODE";
    public static final String  signerRef_QFielld = "ENSHEETS4SOTYPE.SIGNERREFCODE";



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


    public String getNameForDfDoc(){
       return nameForDfDoc;
    }
    
    public void setNameForDfDoc(String nameForDfDoc){
       this.nameForDfDoc = nameForDfDoc;
    }


    public String getDfDocNumMask(){
       return dfDocNumMask;
    }
    
    public void setDfDocNumMask(String dfDocNumMask){
       this.dfDocNumMask = dfDocNumMask;
    }


    public int getDfDepartmentCode(){
       return dfDepartmentCode;
    }
    
    public void setDfDepartmentCode(int dfDepartmentCode){
       this.dfDepartmentCode = dfDepartmentCode;
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


    public String getReportPath(){
       return reportPath;
    }
    
    public void setReportPath(String reportPath){
       this.reportPath = reportPath;
    }


    public String getReportFileName(){
       return reportFileName;
    }
    
    public void setReportFileName(String reportFileName){
       this.reportFileName = reportFileName;
    }


    public String getReportType(){
       return reportType;
    }
    
    public void setReportType(String reportType){
       this.reportType = reportType;
    }


    public String getCommentGen(){
       return commentGen;
    }
    
    public void setCommentGen(String commentGen){
       this.commentGen = commentGen;
    }

    public ENSignerRef getSignerRef(){
       return signerRef;
    }
    
    public void setSignerRef(ENSignerRef signerRef){
       this.signerRef = signerRef;
    }

} // end of ENSheets4SOTypeValueObject

