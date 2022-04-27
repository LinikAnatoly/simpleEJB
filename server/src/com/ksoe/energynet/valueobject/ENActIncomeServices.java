
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENActIncomeServices;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;
    import  com.ksoe.energynet.valueobject.references.ENActIncomeStatusRef;
    import  com.ksoe.energynet.valueobject.references.ENWarrantRef;
    import  com.ksoe.energynet.valueobject.references.ENWarrantRef;

public class ENActIncomeServices implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE;
    public String  numberGen; 
    public Date dateGen ;
    public Date actDateStart ;
    public Date actDateEnd ;
    public BigDecimal  summaGen; 
    public BigDecimal  summaVat; 
    public Boolean  isManualSum = null;
    public String  commentGen; 
    public Date dateAdd ;
    public Date dateEdit ;
    public String  userGen; 
    public ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();
    public ENActIncomeStatusRef statusRef = new ENActIncomeStatusRef();
    public ENWarrantRef warrantAcceptorRef = new ENWarrantRef();
    public ENWarrantRef warrantExecutorRef = new ENWarrantRef();
    public static final String tableName = "ENACTINCOMESERVICES";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACTINCOMESERVICES.CODE";
    public static final String numberGen_Attr = "numberGen";
    public static final String numberGen_Field = "NUMBERGEN";
    public static final String numberGen_QFielld = "ENACTINCOMESERVICES.NUMBERGEN";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "ENACTINCOMESERVICES.DATEGEN";
    public static final String actDateStart_Attr = "actDateStart";
    public static final String actDateStart_Field = "ACTDATESTART";
    public static final String actDateStart_QFielld = "ENACTINCOMESERVICES.ACTDATESTART";
    public static final String actDateEnd_Attr = "actDateEnd";
    public static final String actDateEnd_Field = "ACTDATEEND";
    public static final String actDateEnd_QFielld = "ENACTINCOMESERVICES.ACTDATEEND";
    public static final String summaGen_Attr = "summaGen";
    public static final String summaGen_Field = "SUMMAGEN";
    public static final String summaGen_QFielld = "ENACTINCOMESERVICES.SUMMAGEN";
    public static final String summaVat_Attr = "summaVat";
    public static final String summaVat_Field = "SUMMAVAT";
    public static final String summaVat_QFielld = "ENACTINCOMESERVICES.SUMMAVAT";
    public static final String isManualSum_Attr = "isManualSum";
    public static final String isManualSum_Field = "ISMANUALSUM";
    public static final String isManualSum_QFielld = "ENACTINCOMESERVICES.ISMANUALSUM";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENACTINCOMESERVICES.COMMENTGEN";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "ENACTINCOMESERVICES.DATEADD";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENACTINCOMESERVICES.DATEEDIT";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENACTINCOMESERVICES.USERGEN";
    public static final String servicesObjectRef_Attr = "servicesObjectRef";
    public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
    public static final String  servicesObjectRef_QFielld = "ENACTINCOMESERVICES.SERVICESOBJECTREFCODE";
    public static final String statusRef_Attr = "statusRef";
    public static final String statusRef_Field = "STATUSREFCODE";
    public static final String  statusRef_QFielld = "ENACTINCOMESERVICES.STATUSREFCODE";
    public static final String warrantAcceptorRef_Attr = "warrantAcceptorRef";
    public static final String warrantAcceptorRef_Field = "WARRANTACCEPTORREFCODE";
    public static final String  warrantAcceptorRef_QFielld = "ENACTINCOMESERVICES.WARRANTACCEPTORREFCODE";
    public static final String warrantExecutorRef_Attr = "warrantExecutorRef";
    public static final String warrantExecutorRef_Field = "WARRANTEXECUTORREFCODE";
    public static final String  warrantExecutorRef_QFielld = "ENACTINCOMESERVICES.WARRANTEXECUTORREFCODE";



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


    public void setActDateStart(Date aValue){
       actDateStart = aValue;
    }

    public Date getActDateStart(){
       return actDateStart;
    }


    public void setActDateEnd(Date aValue){
       actDateEnd = aValue;
    }

    public Date getActDateEnd(){
       return actDateEnd;
    }


    public void setSummaGen(BigDecimal aValue){
       summaGen = aValue;
    }

    public BigDecimal getSummaGen(){
       return summaGen;
    }


    public void setSummaVat(BigDecimal aValue){
       summaVat = aValue;
    }

    public BigDecimal getSummaVat(){
       return summaVat;
    }


    public void setIsManualSum(Boolean aValue){
       isManualSum = aValue;
    }

    public Boolean getIsManualSum(){
       return isManualSum;
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


    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }

    public void setServicesObjectRef(ENServicesObjectRef aValue){
       servicesObjectRef = aValue;
    }

    public ENServicesObjectRef getServicesObjectRef(){
       return servicesObjectRef;
    }
    public void setStatusRef(ENActIncomeStatusRef aValue){
       statusRef = aValue;
    }

    public ENActIncomeStatusRef getStatusRef(){
       return statusRef;
    }
    public void setWarrantAcceptorRef(ENWarrantRef aValue){
       warrantAcceptorRef = aValue;
    }

    public ENWarrantRef getWarrantAcceptorRef(){
       return warrantAcceptorRef;
    }
    public void setWarrantExecutorRef(ENWarrantRef aValue){
       warrantExecutorRef = aValue;
    }

    public ENWarrantRef getWarrantExecutorRef(){
       return warrantExecutorRef;
    }

} // end of ENActIncomeServicesValueObject

