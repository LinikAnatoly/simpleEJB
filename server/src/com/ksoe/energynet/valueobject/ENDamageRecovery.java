
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENDamageRecovery;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENDepartmentRef;
    import  com.ksoe.energynet.valueobject.references.ENDamageRecoveryStatusRef;
    import  com.ksoe.energynet.valueobject.references.ENWarrantRef;

public class ENDamageRecovery implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  numberGen; 
    public Date dateGen ;
    public String  FKcontractCode; 
    public String  FKpartnerCode; 
    public String  FKdocCode; 
    public int  FKdocID = Integer.MIN_VALUE; 
    public String  commentGen; 
    public String  contragentName; 
    public String  contragentAddress; 
    public String  contragentPassport; 
    public BigDecimal  damageAmmount; 
    public int  partId = Integer.MIN_VALUE; 
    public Date datePosting ;
    public String  userGen; 
    public Date dateEdit ;
    public String  domain_info; 
    public long  modify_time = Long.MIN_VALUE;
    public ENDepartmentRef department = new ENDepartmentRef();
    public ENDamageRecoveryStatusRef statusRef = new ENDamageRecoveryStatusRef();
    public ENWarrantRef warrantRef = new ENWarrantRef();
    public static final String tableName = "ENDAMAGERECOVERY";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENDAMAGERECOVERY.CODE";
    public static final String numberGen_Attr = "numberGen";
    public static final String numberGen_Field = "NUMBERGEN";
    public static final String numberGen_QFielld = "ENDAMAGERECOVERY.NUMBERGEN";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "ENDAMAGERECOVERY.DATEGEN";
    public static final String FKcontractCode_Attr = "FKcontractCode";
    public static final String FKcontractCode_Field = "FKCONTRACTCODE";
    public static final String FKcontractCode_QFielld = "ENDAMAGERECOVERY.FKCONTRACTCODE";
    public static final String FKpartnerCode_Attr = "FKpartnerCode";
    public static final String FKpartnerCode_Field = "FKPARTNERCODE";
    public static final String FKpartnerCode_QFielld = "ENDAMAGERECOVERY.FKPARTNERCODE";
    public static final String FKdocCode_Attr = "FKdocCode";
    public static final String FKdocCode_Field = "FKDOCCODE";
    public static final String FKdocCode_QFielld = "ENDAMAGERECOVERY.FKDOCCODE";
    public static final String FKdocID_Attr = "FKdocID";
    public static final String FKdocID_Field = "FKDOCID";
    public static final String FKdocID_QFielld = "ENDAMAGERECOVERY.FKDOCID";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENDAMAGERECOVERY.COMMENTGEN";
    public static final String contragentName_Attr = "contragentName";
    public static final String contragentName_Field = "CONTRAGENTNAME";
    public static final String contragentName_QFielld = "ENDAMAGERECOVERY.CONTRAGENTNAME";
    public static final String contragentAddress_Attr = "contragentAddress";
    public static final String contragentAddress_Field = "CONTRAGENTADDRESS";
    public static final String contragentAddress_QFielld = "ENDAMAGERECOVERY.CONTRAGENTADDRESS";
    public static final String contragentPassport_Attr = "contragentPassport";
    public static final String contragentPassport_Field = "CONTRAGENTPASSPORT";
    public static final String contragentPassport_QFielld = "ENDAMAGERECOVERY.CONTRAGENTPASSPORT";
    public static final String damageAmmount_Attr = "damageAmmount";
    public static final String damageAmmount_Field = "DAMAGEAMMOUNT";
    public static final String damageAmmount_QFielld = "ENDAMAGERECOVERY.DAMAGEAMMOUNT";
    public static final String partId_Attr = "partId";
    public static final String partId_Field = "PARTID";
    public static final String partId_QFielld = "ENDAMAGERECOVERY.PARTID";
    public static final String datePosting_Attr = "datePosting";
    public static final String datePosting_Field = "DATEPOSTING";
    public static final String datePosting_QFielld = "ENDAMAGERECOVERY.DATEPOSTING";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENDAMAGERECOVERY.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENDAMAGERECOVERY.DATEEDIT";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "ENDAMAGERECOVERY.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENDAMAGERECOVERY.MODIFY_TIME";
    public static final String department_Attr = "department";
    public static final String department_Field = "DEPARTMENTCODE";
    public static final String  department_QFielld = "ENDAMAGERECOVERY.DEPARTMENTCODE";
    public static final String statusRef_Attr = "statusRef";
    public static final String statusRef_Field = "STATUSREFCODE";
    public static final String  statusRef_QFielld = "ENDAMAGERECOVERY.STATUSREFCODE";
    public static final String warrantRef_Attr = "warrantRef";
    public static final String warrantRef_Field = "WARRANTREFCODE";
    public static final String  warrantRef_QFielld = "ENDAMAGERECOVERY.WARRANTREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setNumberGen(String aValue){
       numberGen = aValue;
    }

    public String getNumberGen(){
       return numberGen;
    }


    public void setDateGen(Date aValue){
       dateGen = aValue;
    }

    public Date getDateGen(){
       return dateGen;
    }

    public void setFKcontractCode(String aValue){
       FKcontractCode = aValue;
    }

    public String getFKcontractCode(){
       return FKcontractCode;
    }

    public void setFKpartnerCode(String aValue){
       FKpartnerCode = aValue;
    }

    public String getFKpartnerCode(){
       return FKpartnerCode;
    }

    public void setFKdocCode(String aValue){
       FKdocCode = aValue;
    }

    public String getFKdocCode(){
       return FKdocCode;
    }

    public void setFKdocID(int aValue){
       FKdocID = aValue;
    }

    public int getFKdocID(){
       return FKdocID;
    }

    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }

    public void setContragentName(String aValue){
       contragentName = aValue;
    }

    public String getContragentName(){
       return contragentName;
    }

    public void setContragentAddress(String aValue){
       contragentAddress = aValue;
    }

    public String getContragentAddress(){
       return contragentAddress;
    }

    public void setContragentPassport(String aValue){
       contragentPassport = aValue;
    }

    public String getContragentPassport(){
       return contragentPassport;
    }

    public void setDamageAmmount(BigDecimal aValue){
       damageAmmount = aValue;
    }

    public BigDecimal getDamageAmmount(){
       return damageAmmount;
    }

    public void setPartId(int aValue){
       partId = aValue;
    }

    public int getPartId(){
       return partId;
    }


    public void setDatePosting(Date aValue){
       datePosting = aValue;
    }

    public Date getDatePosting(){
       return datePosting;
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

    public void setDomain_info(String aValue){
       domain_info = aValue;
    }

    public String getDomain_info(){
       return domain_info;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setDepartment(ENDepartmentRef aValue){
       department = aValue;
    }

    public ENDepartmentRef getDepartment(){
       return department;
    }
    public void setStatusRef(ENDamageRecoveryStatusRef aValue){
       statusRef = aValue;
    }

    public ENDamageRecoveryStatusRef getStatusRef(){
       return statusRef;
    }
    public void setWarrantRef(ENWarrantRef aValue){
       warrantRef = aValue;
    }

    public ENWarrantRef getWarrantRef(){
       return warrantRef;
    }

} // end of ENDamageRecoveryValueObject

