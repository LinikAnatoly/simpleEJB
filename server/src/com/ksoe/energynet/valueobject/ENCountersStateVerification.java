
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENCountersStateVerification;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENPlanWorkRef;
    import  com.ksoe.energynet.valueobject.references.ENActRef;
    import  com.ksoe.rqorder.valueobject.references.RQFKOrderRef;

public class ENCountersStateVerification implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  invNumber; 
    public String  name; 
    public String  buildNumber; 
    public BigDecimal  priceGen; 
    public long  modify_time = Long.MIN_VALUE;
    public String  userAdd; 
    public Date dateAdd ;
    public String  userGen; 
    public Date dateEdit ;
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public ENActRef actRef = new ENActRef();
    public RQFKOrderRef fkOrderRef = new RQFKOrderRef();
    public static final String tableName = "ENCOUNTERSSTATEVERFCTN";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENCOUNTERSSTATEVERFCTN.CODE";
    public static final String invNumber_Attr = "invNumber";
    public static final String invNumber_Field = "INVNUMBER";
    public static final String invNumber_QFielld = "ENCOUNTERSSTATEVERFCTN.INVNUMBER";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENCOUNTERSSTATEVERFCTN.NAME";
    public static final String buildNumber_Attr = "buildNumber";
    public static final String buildNumber_Field = "BUILDNUMBER";
    public static final String buildNumber_QFielld = "ENCOUNTERSSTATEVERFCTN.BUILDNUMBER";
    public static final String priceGen_Attr = "priceGen";
    public static final String priceGen_Field = "PRICEGEN";
    public static final String priceGen_QFielld = "ENCOUNTERSSTATEVERFCTN.PRICEGEN";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENCOUNTERSSTATEVERFCTN.MODIFY_TIME";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "ENCOUNTERSSTATEVERFCTN.USERADD";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "ENCOUNTERSSTATEVERFCTN.DATEADD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENCOUNTERSSTATEVERFCTN.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENCOUNTERSSTATEVERFCTN.DATEEDIT";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENCOUNTERSSTATEVERFCTN.PLANREFCODE";
    public static final String actRef_Attr = "actRef";
    public static final String actRef_Field = "ACTREFCODE";
    public static final String  actRef_QFielld = "ENCOUNTERSSTATEVERFCTN.ACTREFCODE";
    public static final String fkOrderRef_Attr = "fkOrderRef";
    public static final String fkOrderRef_Field = "FKORDERREFCODE";
    public static final String  fkOrderRef_QFielld = "ENCOUNTERSSTATEVERFCTN.FKORDERREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setInvNumber(String aValue){
       invNumber = aValue;
    }

    public String getInvNumber(){
       return invNumber;
    }


    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }


    public void setBuildNumber(String aValue){
       buildNumber = aValue;
    }

    public String getBuildNumber(){
       return buildNumber;
    }


    public void setPriceGen(BigDecimal aValue){
       priceGen = aValue;
    }

    public BigDecimal getPriceGen(){
       return priceGen;
    }


    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }


    public void setUserAdd(String aValue){
       userAdd = aValue;
    }

    public String getUserAdd(){
       return userAdd;
    }


    public void setDateAdd(Date aValue){
       dateAdd = aValue;
    }

    public Date getDateAdd(){
       return dateAdd;
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

    public void setPlanRef(ENPlanWorkRef aValue){
       planRef = aValue;
    }

    public ENPlanWorkRef getPlanRef(){
       return planRef;
    }
    public void setActRef(ENActRef aValue){
       actRef = aValue;
    }

    public ENActRef getActRef(){
       return actRef;
    }
    public void setFkOrderRef(RQFKOrderRef aValue){
       fkOrderRef = aValue;
    }

    public RQFKOrderRef getFkOrderRef(){
       return fkOrderRef;
    }

} // end of ENCountersStateVerificationValueObject

