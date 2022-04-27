
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENMetrologyCounter;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.ENElement;
    import  com.ksoe.rqorder.valueobject.references.RQStorageZoneRef;
    import  com.ksoe.techcard.valueobject.references.TKAccountingTypeRef;

public class ENMetrologyCounter implements Serializable {

private static final long serialVersionUID = 1L;

public static final int METROLOGY_LOCK = 1;
public static final int MOVED_LOCK = 2;
public static final int BILLING_LOCK = 3;
public static final int NEW_COUNTERS_LOCK = 4;
public static final int WRITE_OFF_LOCK = 5;
public static final int ZONE_CHANGING_LOCK = 6;
/** для Договорів на сторону при встановленні багатотарифних лічильників **/
public static final int SERVICES_COUNTERS_LOCK = 7;

/** Блокировка при включении в план с типом акта "Акт дефектации счетчиков" */
public static final int ACT_DEFECT_LOCK = 9;

    public int  code = Integer.MIN_VALUE; 
    public String  invNumber; 
    public String  name; 
    public String  buildNumber; 
    public String  account; 
    public String  departmetFKCode; 
    public String  molCode; 
    public Date dateIn ;
    public Date dateBuild ;
    public BigDecimal  cost; 
    public int  scCode = Integer.MIN_VALUE; 
    public String  counterType; 
    public int  phasity = Integer.MIN_VALUE; 
    public int  zones = Integer.MIN_VALUE; 
    public String  domain_info; 
    public long  modify_time = Long.MIN_VALUE;
    public ENElement element = new ENElement();
    public RQStorageZoneRef zoneRef = new RQStorageZoneRef();
    public TKAccountingTypeRef accountingTypeRef = new TKAccountingTypeRef();
    public static final String tableName = "ENMETROLOGYCOUNTER";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENMETROLOGYCOUNTER.CODE";
    public static final String invNumber_Attr = "invNumber";
    public static final String invNumber_Field = "INVNUMBER";
    public static final String invNumber_QFielld = "ENMETROLOGYCOUNTER.INVNUMBER";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENMETROLOGYCOUNTER.NAME";
    public static final String buildNumber_Attr = "buildNumber";
    public static final String buildNumber_Field = "BUILDNUMBER";
    public static final String buildNumber_QFielld = "ENMETROLOGYCOUNTER.BUILDNUMBER";
    public static final String account_Attr = "account";
    public static final String account_Field = "ACCOUNT";
    public static final String account_QFielld = "ENMETROLOGYCOUNTER.ACCOUNT";
    public static final String departmetFKCode_Attr = "departmetFKCode";
    public static final String departmetFKCode_Field = "DEPARTMETFKCODE";
    public static final String departmetFKCode_QFielld = "ENMETROLOGYCOUNTER.DEPARTMETFKCODE";
    public static final String molCode_Attr = "molCode";
    public static final String molCode_Field = "MOLCODE";
    public static final String molCode_QFielld = "ENMETROLOGYCOUNTER.MOLCODE";
    public static final String dateIn_Attr = "dateIn";
    public static final String dateIn_Field = "DATEIN";
    public static final String dateIn_QFielld = "ENMETROLOGYCOUNTER.DATEIN";
    public static final String dateBuild_Attr = "dateBuild";
    public static final String dateBuild_Field = "DATEBUILD";
    public static final String dateBuild_QFielld = "ENMETROLOGYCOUNTER.DATEBUILD";
    public static final String cost_Attr = "cost";
    public static final String cost_Field = "COST";
    public static final String cost_QFielld = "ENMETROLOGYCOUNTER.COST";
    public static final String scCode_Attr = "scCode";
    public static final String scCode_Field = "SCCODE";
    public static final String scCode_QFielld = "ENMETROLOGYCOUNTER.SCCODE";
    public static final String counterType_Attr = "counterType";
    public static final String counterType_Field = "COUNTERTYPE";
    public static final String counterType_QFielld = "ENMETROLOGYCOUNTER.COUNTERTYPE";
    public static final String phasity_Attr = "phasity";
    public static final String phasity_Field = "PHASITY";
    public static final String phasity_QFielld = "ENMETROLOGYCOUNTER.PHASITY";
    public static final String zones_Attr = "zones";
    public static final String zones_Field = "ZONES";
    public static final String zones_QFielld = "ENMETROLOGYCOUNTER.ZONES";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "ENMETROLOGYCOUNTER.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENMETROLOGYCOUNTER.MODIFY_TIME";
    public static final String element_Attr = "element";
    public static final String element_Field = "ELEMENTCODE";
    public static final String  element_QFielld = "ENMETROLOGYCOUNTER.ELEMENTCODE";
    public static final String zoneRef_Attr = "zoneRef";
    public static final String zoneRef_Field = "ZONEREFCODE";
    public static final String  zoneRef_QFielld = "ENMETROLOGYCOUNTER.ZONEREFCODE";
    public static final String accountingTypeRef_Attr = "accountingTypeRef";
    public static final String accountingTypeRef_Field = "ACCOUNTINGTYPEREFCODE";
    public static final String  accountingTypeRef_QFielld = "ENMETROLOGYCOUNTER.ACCOUNTINGTYPEREFCODE";



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


    public void setAccount(String aValue){
       account = aValue;
    }

    public String getAccount(){
       return account;
    }


    public void setDepartmetFKCode(String aValue){
       departmetFKCode = aValue;
    }

    public String getDepartmetFKCode(){
       return departmetFKCode;
    }


    public void setMolCode(String aValue){
       molCode = aValue;
    }

    public String getMolCode(){
       return molCode;
    }


    public void setDateIn(Date aValue){
       dateIn = aValue;
    }

    public Date getDateIn(){
       return dateIn;
    }


    public void setDateBuild(Date aValue){
       dateBuild = aValue;
    }

    public Date getDateBuild(){
       return dateBuild;
    }


    public void setCost(BigDecimal aValue){
       cost = aValue;
    }

    public BigDecimal getCost(){
       return cost;
    }


    public void setScCode(int aValue){
       scCode = aValue;
    }

    public int getScCode(){
       return scCode;
    }


    public void setCounterType(String aValue){
       counterType = aValue;
    }

    public String getCounterType(){
       return counterType;
    }


    public void setPhasity(int aValue){
       phasity = aValue;
    }

    public int getPhasity(){
       return phasity;
    }


    public void setZones(int aValue){
       zones = aValue;
    }

    public int getZones(){
       return zones;
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

    public void setElement(ENElement aValue){
       element = aValue;
    }

    public ENElement getElement(){
       return element;
    }
    public void setZoneRef(RQStorageZoneRef aValue){
       zoneRef = aValue;
    }

    public RQStorageZoneRef getZoneRef(){
       return zoneRef;
    }
    public void setAccountingTypeRef(TKAccountingTypeRef aValue){
       accountingTypeRef = aValue;
    }

    public TKAccountingTypeRef getAccountingTypeRef(){
       return accountingTypeRef;
    }

} // end of ENMetrologyCounterValueObject

