
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for SCUsageInput;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.ENDepartment;
    import  com.ksoe.energynet.valueobject.references.SCUsageInputStatusRef;

public class SCUsageInput implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  numberDoc; 
    public int  numberInt = Integer.MIN_VALUE;
    public Date dateGen;
    public Date dateStart;
    public Date dateFinal;
    public String  molCode; 
    public String  molName; 
    public String  commentGen; 
    public Date dateEdit;
    public int  iszku = Integer.MIN_VALUE;
    public int  isprinted = Integer.MIN_VALUE;
    public String  molCodeCounter; 
    public String  molNameCounter; 
    public int  autoCreated = Integer.MIN_VALUE;
    public int  isDocsReceived = Integer.MIN_VALUE;
    public String  userGen; 
    public String  domain_info; 
    public long  modify_time = Long.MIN_VALUE;

    public ENDepartment department = new ENDepartment();
    public SCUsageInputStatusRef statusRef = new SCUsageInputStatusRef();

    public static final String tableName = "SCUSAGEINPUT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "SCUSAGEINPUT.CODE";
    public static final String numberDoc_Attr = "numberDoc";
    public static final String numberDoc_Field = "NUMBERDOC";
    public static final String numberDoc_QFielld = "SCUSAGEINPUT.NUMBERDOC";
    public static final String numberInt_Attr = "numberInt";
    public static final String numberInt_Field = "NUMBERINT";
    public static final String numberInt_QFielld = "SCUSAGEINPUT.NUMBERINT";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "SCUSAGEINPUT.DATEGEN";
    public static final String dateStart_Attr = "dateStart";
    public static final String dateStart_Field = "DATESTART";
    public static final String dateStart_QFielld = "SCUSAGEINPUT.DATESTART";
    public static final String dateFinal_Attr = "dateFinal";
    public static final String dateFinal_Field = "DATEFINAL";
    public static final String dateFinal_QFielld = "SCUSAGEINPUT.DATEFINAL";
    public static final String molCode_Attr = "molCode";
    public static final String molCode_Field = "MOLCODE";
    public static final String molCode_QFielld = "SCUSAGEINPUT.MOLCODE";
    public static final String molName_Attr = "molName";
    public static final String molName_Field = "MOLNAME";
    public static final String molName_QFielld = "SCUSAGEINPUT.MOLNAME";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "SCUSAGEINPUT.COMMENTGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "SCUSAGEINPUT.DATEEDIT";
    public static final String iszku_Attr = "iszku";
    public static final String iszku_Field = "ISZKU";
    public static final String iszku_QFielld = "SCUSAGEINPUT.ISZKU";
    public static final String isprinted_Attr = "isprinted";
    public static final String isprinted_Field = "ISPRINTED";
    public static final String isprinted_QFielld = "SCUSAGEINPUT.ISPRINTED";
    public static final String molCodeCounter_Attr = "molCodeCounter";
    public static final String molCodeCounter_Field = "MOLCODECOUNTER";
    public static final String molCodeCounter_QFielld = "SCUSAGEINPUT.MOLCODECOUNTER";
    public static final String molNameCounter_Attr = "molNameCounter";
    public static final String molNameCounter_Field = "MOLNAMECOUNTER";
    public static final String molNameCounter_QFielld = "SCUSAGEINPUT.MOLNAMECOUNTER";
    public static final String autoCreated_Attr = "autoCreated";
    public static final String autoCreated_Field = "AUTOCREATED";
    public static final String autoCreated_QFielld = "SCUSAGEINPUT.AUTOCREATED";
    public static final String isDocsReceived_Attr = "isDocsReceived";
    public static final String isDocsReceived_Field = "ISDOCSRECEIVED";
    public static final String isDocsReceived_QFielld = "SCUSAGEINPUT.ISDOCSRECEIVED";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "SCUSAGEINPUT.USERGEN";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "SCUSAGEINPUT.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "SCUSAGEINPUT.MODIFY_TIME";

    public static final String department_Attr = "department";
    public static final String department_Field = "DEPARTMENTCODE";
    public static final String  department_QFielld = "SCUSAGEINPUT.DEPARTMENTCODE";
    public static final String statusRef_Attr = "statusRef";
    public static final String statusRef_Field = "STATUSREFCODE";
    public static final String  statusRef_QFielld = "SCUSAGEINPUT.STATUSREFCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public String getNumberDoc(){
       return numberDoc;
    }
    
    public void setNumberDoc(String numberDoc){
       this.numberDoc = numberDoc;
    }


    public int getNumberInt(){
       return numberInt;
    }
    
    public void setNumberInt(int numberInt){
       this.numberInt = numberInt;
    }


    public Date getDateGen(){
       return dateGen;
    }

    public void setDateGen(Date dateGen){
       this.dateGen = dateGen;
    }


    public Date getDateStart(){
       return dateStart;
    }

    public void setDateStart(Date dateStart){
       this.dateStart = dateStart;
    }


    public Date getDateFinal(){
       return dateFinal;
    }

    public void setDateFinal(Date dateFinal){
       this.dateFinal = dateFinal;
    }


    public String getMolCode(){
       return molCode;
    }
    
    public void setMolCode(String molCode){
       this.molCode = molCode;
    }


    public String getMolName(){
       return molName;
    }
    
    public void setMolName(String molName){
       this.molName = molName;
    }


    public String getCommentGen(){
       return commentGen;
    }
    
    public void setCommentGen(String commentGen){
       this.commentGen = commentGen;
    }


    public Date getDateEdit(){
       return dateEdit;
    }

    public void setDateEdit(Date dateEdit){
       this.dateEdit = dateEdit;
    }


    public int getIszku(){
       return iszku;
    }
    
    public void setIszku(int iszku){
       this.iszku = iszku;
    }


    public int getIsprinted(){
       return isprinted;
    }
    
    public void setIsprinted(int isprinted){
       this.isprinted = isprinted;
    }


    public String getMolCodeCounter(){
       return molCodeCounter;
    }
    
    public void setMolCodeCounter(String molCodeCounter){
       this.molCodeCounter = molCodeCounter;
    }


    public String getMolNameCounter(){
       return molNameCounter;
    }
    
    public void setMolNameCounter(String molNameCounter){
       this.molNameCounter = molNameCounter;
    }


    public int getAutoCreated(){
       return autoCreated;
    }
    
    public void setAutoCreated(int autoCreated){
       this.autoCreated = autoCreated;
    }


    public int getIsDocsReceived(){
       return isDocsReceived;
    }
    
    public void setIsDocsReceived(int isDocsReceived){
       this.isDocsReceived = isDocsReceived;
    }


    public String getUserGen(){
       return userGen;
    }
    
    public void setUserGen(String userGen){
       this.userGen = userGen;
    }


    public String getDomain_info(){
       return domain_info;
    }
    
    public void setDomain_info(String domain_info){
       this.domain_info = domain_info;
    }


    public long getModify_time(){
       return modify_time;
    }
    
    public void setModify_time(long modify_time){
       this.modify_time = modify_time;
    }

    public ENDepartment getDepartment(){
       return department;
    }
    
    public void setDepartment(ENDepartment department){
       this.department = department;
    }
    public SCUsageInputStatusRef getStatusRef(){
       return statusRef;
    }
    
    public void setStatusRef(SCUsageInputStatusRef statusRef){
       this.statusRef = statusRef;
    }

} // end of SCUsageInputValueObject

