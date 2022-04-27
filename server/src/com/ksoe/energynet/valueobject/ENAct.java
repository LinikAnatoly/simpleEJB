
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENAct;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENActStatusRef;
    import  com.ksoe.energynet.valueobject.ENElement;
    import  com.ksoe.energynet.valueobject.references.ENPlanWorkStateRef;

public class ENAct implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE; 
    public String  numberGen; 
    public Date dateGen ;
    public String  finMolCode; 
    public String  finMolName; 
    public String  finMechanicCode; 
    public String  finMechanicName; 
    public String  commentGen; 
    public String  invNumber; 
    public String  userGen; 
    public Date dateEdit ;
    public String  domain_info; 
    public long  modify_time = Long.MIN_VALUE;
    public Date dateAct ;
    public String  molCodeObject; 
    public Boolean  checkedByAccountant = null;
    public ENActStatusRef statusRef = new ENActStatusRef();
    public ENElement element = new ENElement();
    public ENPlanWorkStateRef actTypeRef = new ENPlanWorkStateRef();
    public static final String tableName = "ENACT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACT.CODE";
    public static final String numberGen_Attr = "numberGen";
    public static final String numberGen_Field = "NUMBERGEN";
    public static final String numberGen_QFielld = "ENACT.NUMBERGEN";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "ENACT.DATEGEN";
    public static final String finMolCode_Attr = "finMolCode";
    public static final String finMolCode_Field = "FINMOLCODE";
    public static final String finMolCode_QFielld = "ENACT.FINMOLCODE";
    public static final String finMolName_Attr = "finMolName";
    public static final String finMolName_Field = "FINMOLNAME";
    public static final String finMolName_QFielld = "ENACT.FINMOLNAME";
    public static final String finMechanicCode_Attr = "finMechanicCode";
    public static final String finMechanicCode_Field = "FINMECHANICCODE";
    public static final String finMechanicCode_QFielld = "ENACT.FINMECHANICCODE";
    public static final String finMechanicName_Attr = "finMechanicName";
    public static final String finMechanicName_Field = "FINMECHANICNAME";
    public static final String finMechanicName_QFielld = "ENACT.FINMECHANICNAME";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENACT.COMMENTGEN";
    public static final String invNumber_Attr = "invNumber";
    public static final String invNumber_Field = "INVNUMBER";
    public static final String invNumber_QFielld = "ENACT.INVNUMBER";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENACT.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENACT.DATEEDIT";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "ENACT.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENACT.MODIFY_TIME";
    public static final String dateAct_Attr = "dateAct";
    public static final String dateAct_Field = "DATEACT";
    public static final String dateAct_QFielld = "ENACT.DATEACT";
    public static final String molCodeObject_Attr = "molCodeObject";
    public static final String molCodeObject_Field = "MOLCODEOBJECT";
    public static final String molCodeObject_QFielld = "ENACT.MOLCODEOBJECT";
    public static final String checkedByAccountant_Attr = "checkedByAccountant";
    public static final String checkedByAccountant_Field = "CHECKEDBYACCOUNTANT";
    public static final String checkedByAccountant_QFielld = "ENACT.CHECKEDBYACCOUNTANT";
    public static final String statusRef_Attr = "statusRef";
    public static final String statusRef_Field = "STATUSREFCODE";
    public static final String  statusRef_QFielld = "ENACT.STATUSREFCODE";
    public static final String element_Attr = "element";
    public static final String element_Field = "ELEMENTCODE";
    public static final String  element_QFielld = "ENACT.ELEMENTCODE";
    public static final String actTypeRef_Attr = "actTypeRef";
    public static final String actTypeRef_Field = "ACTTYPEREFCODE";
    public static final String  actTypeRef_QFielld = "ENACT.ACTTYPEREFCODE";



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


    public void setFinMolCode(String aValue){
       finMolCode = aValue;
    }

    public String getFinMolCode(){
       return finMolCode;
    }


    public void setFinMolName(String aValue){
       finMolName = aValue;
    }

    public String getFinMolName(){
       return finMolName;
    }


    public void setFinMechanicCode(String aValue){
       finMechanicCode = aValue;
    }

    public String getFinMechanicCode(){
       return finMechanicCode;
    }


    public void setFinMechanicName(String aValue){
       finMechanicName = aValue;
    }

    public String getFinMechanicName(){
       return finMechanicName;
    }


    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }


    public void setInvNumber(String aValue){
       invNumber = aValue;
    }

    public String getInvNumber(){
       return invNumber;
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


    public void setDateAct(Date aValue){
       dateAct = aValue;
    }

    public Date getDateAct(){
       return dateAct;
    }


    public void setMolCodeObject(String aValue){
       molCodeObject = aValue;
    }

    public String getMolCodeObject(){
       return molCodeObject;
    }


    public void setCheckedByAccountant(Boolean aValue){
       checkedByAccountant = aValue;
    }

    public Boolean getCheckedByAccountant(){
       return checkedByAccountant;
    }

    public void setStatusRef(ENActStatusRef aValue){
       statusRef = aValue;
    }

    public ENActStatusRef getStatusRef(){
       return statusRef;
    }
    public void setElement(ENElement aValue){
       element = aValue;
    }

    public ENElement getElement(){
       return element;
    }
    public void setActTypeRef(ENPlanWorkStateRef aValue){
       actTypeRef = aValue;
    }

    public ENPlanWorkStateRef getActTypeRef(){
       return actTypeRef;
    }

} // end of ENActValueObject

