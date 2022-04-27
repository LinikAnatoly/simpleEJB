
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENExecutor;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENSheets4SOTypeRef;

public class ENExecutor implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  executorFio; 
    public String  executorPhone; 
    public String  executorEmail; 
    public String  commentGen; 

    public ENSheets4SOTypeRef sheetTypeRef = new ENSheets4SOTypeRef();

    public static final String tableName = "ENEXECUTOR";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENEXECUTOR.CODE";
    public static final String executorFio_Attr = "executorFio";
    public static final String executorFio_Field = "EXECUTORFIO";
    public static final String executorFio_QFielld = "ENEXECUTOR.EXECUTORFIO";
    public static final String executorPhone_Attr = "executorPhone";
    public static final String executorPhone_Field = "EXECUTORPHONE";
    public static final String executorPhone_QFielld = "ENEXECUTOR.EXECUTORPHONE";
    public static final String executorEmail_Attr = "executorEmail";
    public static final String executorEmail_Field = "EXECUTOREMAIL";
    public static final String executorEmail_QFielld = "ENEXECUTOR.EXECUTOREMAIL";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENEXECUTOR.COMMENTGEN";

    public static final String sheetTypeRef_Attr = "sheetTypeRef";
    public static final String sheetTypeRef_Field = "SHEETTYPEREFCODE";
    public static final String  sheetTypeRef_QFielld = "ENEXECUTOR.SHEETTYPEREFCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
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


    public String getCommentGen(){
       return commentGen;
    }
    
    public void setCommentGen(String commentGen){
       this.commentGen = commentGen;
    }

    public ENSheets4SOTypeRef getSheetTypeRef(){
       return sheetTypeRef;
    }
    
    public void setSheetTypeRef(ENSheets4SOTypeRef sheetTypeRef){
       this.sheetTypeRef = sheetTypeRef;
    }

} // end of ENExecutorValueObject

