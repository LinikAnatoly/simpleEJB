
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENServicesFromSideObject;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.ENDepartment;
    import  com.ksoe.energynet.valueobject.ENElement;
    import  com.ksoe.energynet.valueobject.references.ENGeneralContractsRef;
    import  com.ksoe.energynet.valueobject.references.ENServFromSideStatusRef;

public class ENServicesFromSideObject implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  numberProject; 
    public String  contractNumber; 
    public Date contractDate;
    public String  name; 
    public String  partnerCode; 
    public String  finDocCode; 
    public int  finDocID = Integer.MIN_VALUE;
    public String  commentGen; 
    public String  userGen; 
    public Date dateEdit;
    public String  domain_info; 
    public long  modify_time = Long.MIN_VALUE;

    public ENDepartment department = new ENDepartment();
    public ENElement element = new ENElement();
    public ENGeneralContractsRef generalContractRef = new ENGeneralContractsRef();
    public ENServFromSideStatusRef statusRef = new ENServFromSideStatusRef();

    public static final String tableName = "ENSERVICESFROMSIDEBJCT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSERVICESFROMSIDEBJCT.CODE";
    public static final String numberProject_Attr = "numberProject";
    public static final String numberProject_Field = "NUMBERPROJECT";
    public static final String numberProject_QFielld = "ENSERVICESFROMSIDEBJCT.NUMBERPROJECT";
    public static final String contractNumber_Attr = "contractNumber";
    public static final String contractNumber_Field = "CONTRACTNUMBER";
    public static final String contractNumber_QFielld = "ENSERVICESFROMSIDEBJCT.CONTRACTNUMBER";
    public static final String contractDate_Attr = "contractDate";
    public static final String contractDate_Field = "CONTRACTDATE";
    public static final String contractDate_QFielld = "ENSERVICESFROMSIDEBJCT.CONTRACTDATE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENSERVICESFROMSIDEBJCT.NAME";
    public static final String partnerCode_Attr = "partnerCode";
    public static final String partnerCode_Field = "PARTNERCODE";
    public static final String partnerCode_QFielld = "ENSERVICESFROMSIDEBJCT.PARTNERCODE";
    public static final String finDocCode_Attr = "finDocCode";
    public static final String finDocCode_Field = "FINDOCCODE";
    public static final String finDocCode_QFielld = "ENSERVICESFROMSIDEBJCT.FINDOCCODE";
    public static final String finDocID_Attr = "finDocID";
    public static final String finDocID_Field = "FINDOCID";
    public static final String finDocID_QFielld = "ENSERVICESFROMSIDEBJCT.FINDOCID";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENSERVICESFROMSIDEBJCT.COMMENTGEN";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENSERVICESFROMSIDEBJCT.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENSERVICESFROMSIDEBJCT.DATEEDIT";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "ENSERVICESFROMSIDEBJCT.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENSERVICESFROMSIDEBJCT.MODIFY_TIME";

    public static final String department_Attr = "department";
    public static final String department_Field = "DEPARTMENTCODE";
    public static final String  department_QFielld = "ENSERVICESFROMSIDEBJCT.DEPARTMENTCODE";
    public static final String element_Attr = "element";
    public static final String element_Field = "ELEMENTCODE";
    public static final String  element_QFielld = "ENSERVICESFROMSIDEBJCT.ELEMENTCODE";
    public static final String generalContractRef_Attr = "generalContractRef";
    public static final String generalContractRef_Field = "GENERALCONTRACTREFCODE";
    public static final String  generalContractRef_QFielld = "ENSERVICESFROMSIDEBJCT.GENERALCONTRACTREFCODE";
    public static final String statusRef_Attr = "statusRef";
    public static final String statusRef_Field = "STATUSREFCODE";
    public static final String  statusRef_QFielld = "ENSERVICESFROMSIDEBJCT.STATUSREFCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public String getNumberProject(){
       return numberProject;
    }
    
    public void setNumberProject(String numberProject){
       this.numberProject = numberProject;
    }


    public String getContractNumber(){
       return contractNumber;
    }
    
    public void setContractNumber(String contractNumber){
       this.contractNumber = contractNumber;
    }


    public Date getContractDate(){
       return contractDate;
    }

    public void setContractDate(Date contractDate){
       this.contractDate = contractDate;
    }


    public String getName(){
       return name;
    }
    
    public void setName(String name){
       this.name = name;
    }


    public String getPartnerCode(){
       return partnerCode;
    }
    
    public void setPartnerCode(String partnerCode){
       this.partnerCode = partnerCode;
    }


    public String getFinDocCode(){
       return finDocCode;
    }
    
    public void setFinDocCode(String finDocCode){
       this.finDocCode = finDocCode;
    }


    public int getFinDocID(){
       return finDocID;
    }
    
    public void setFinDocID(int finDocID){
       this.finDocID = finDocID;
    }


    public String getCommentGen(){
       return commentGen;
    }
    
    public void setCommentGen(String commentGen){
       this.commentGen = commentGen;
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
    public ENElement getElement(){
       return element;
    }
    
    public void setElement(ENElement element){
       this.element = element;
    }
    public ENGeneralContractsRef getGeneralContractRef(){
       return generalContractRef;
    }
    
    public void setGeneralContractRef(ENGeneralContractsRef generalContractRef){
       this.generalContractRef = generalContractRef;
    }
    public ENServFromSideStatusRef getStatusRef(){
       return statusRef;
    }
    
    public void setStatusRef(ENServFromSideStatusRef statusRef){
       this.statusRef = statusRef;
    }

} // end of ENServicesFromSideObjectValueObject

