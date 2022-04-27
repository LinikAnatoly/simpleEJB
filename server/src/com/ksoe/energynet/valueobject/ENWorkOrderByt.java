
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENWorkOrderByt;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENDepartmentRef;
    import  com.ksoe.energynet.valueobject.references.ENSiteRef;
    import  com.ksoe.energynet.valueobject.FINWorker;
    import  com.ksoe.energynet.valueobject.references.ENWorkOrderBytTypeRef;
    import  com.ksoe.energynet.valueobject.references.ENWorkOrderBytStatusRef;

public class ENWorkOrderByt implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  numberGen; 
    public Date dateGen ;
    public String  commentGen; 
    public Date dateAdd ;
    public Date dateEdit ;
    public String  userAdd; 
    public String  userEdit; 
    public long  modify_time = Long.MIN_VALUE;
    public ENDepartmentRef departmentRef = new ENDepartmentRef();
    public ENSiteRef siteRef = new ENSiteRef();
    public FINWorker finWorker = new FINWorker();
    public ENWorkOrderBytTypeRef typeRef = new ENWorkOrderBytTypeRef();
    public ENWorkOrderBytStatusRef statusRef = new ENWorkOrderBytStatusRef();
    public static final String tableName = "ENWORKORDERBYT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENWORKORDERBYT.CODE";
    public static final String numberGen_Attr = "numberGen";
    public static final String numberGen_Field = "NUMBERGEN";
    public static final String numberGen_QFielld = "ENWORKORDERBYT.NUMBERGEN";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "ENWORKORDERBYT.DATEGEN";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENWORKORDERBYT.COMMENTGEN";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "ENWORKORDERBYT.DATEADD";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENWORKORDERBYT.DATEEDIT";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "ENWORKORDERBYT.USERADD";
    public static final String userEdit_Attr = "userEdit";
    public static final String userEdit_Field = "USEREDIT";
    public static final String userEdit_QFielld = "ENWORKORDERBYT.USEREDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENWORKORDERBYT.MODIFY_TIME";
    public static final String departmentRef_Attr = "departmentRef";
    public static final String departmentRef_Field = "DEPARTMENTREFCODE";
    public static final String  departmentRef_QFielld = "ENWORKORDERBYT.DEPARTMENTREFCODE";
    public static final String siteRef_Attr = "siteRef";
    public static final String siteRef_Field = "SITEREFCODE";
    public static final String  siteRef_QFielld = "ENWORKORDERBYT.SITEREFCODE";
    public static final String finWorker_Attr = "finWorker";
    public static final String finWorker_Field = "FINWORKERCODE";
    public static final String  finWorker_QFielld = "ENWORKORDERBYT.FINWORKERCODE";
    public static final String typeRef_Attr = "typeRef";
    public static final String typeRef_Field = "TYPEREFCODE";
    public static final String  typeRef_QFielld = "ENWORKORDERBYT.TYPEREFCODE";
    public static final String statusRef_Attr = "statusRef";
    public static final String statusRef_Field = "STATUSREFCODE";
    public static final String  statusRef_QFielld = "ENWORKORDERBYT.STATUSREFCODE";



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


    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }


    public void setDateAdd(Date aValue){
       dateAdd = aValue;
    }

    public Date getDateAdd(){
       return dateAdd;
    }


    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }


    public void setUserAdd(String aValue){
       userAdd = aValue;
    }

    public String getUserAdd(){
       return userAdd;
    }


    public void setUserEdit(String aValue){
       userEdit = aValue;
    }

    public String getUserEdit(){
       return userEdit;
    }


    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setDepartmentRef(ENDepartmentRef aValue){
       departmentRef = aValue;
    }

    public ENDepartmentRef getDepartmentRef(){
       return departmentRef;
    }
    public void setSiteRef(ENSiteRef aValue){
       siteRef = aValue;
    }

    public ENSiteRef getSiteRef(){
       return siteRef;
    }
    public void setFinWorker(FINWorker aValue){
       finWorker = aValue;
    }

    public FINWorker getFinWorker(){
       return finWorker;
    }
    public void setTypeRef(ENWorkOrderBytTypeRef aValue){
       typeRef = aValue;
    }

    public ENWorkOrderBytTypeRef getTypeRef(){
       return typeRef;
    }
    public void setStatusRef(ENWorkOrderBytStatusRef aValue){
       statusRef = aValue;
    }

    public ENWorkOrderBytStatusRef getStatusRef(){
       return statusRef;
    }

} // end of ENWorkOrderBytValueObject

