
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for SCSeal;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.SCSealTypeRef;
    import  com.ksoe.energynet.valueobject.references.SCSealStatusRef;
    import  com.ksoe.energynet.valueobject.references.ENEstimateItemRef;
    import  com.ksoe.energynet.valueobject.references.SCSealLockTypeRef;
    import  com.ksoe.rqorder.valueobject.references.RQStorageZoneRef;

public class SCSeal implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  invNumber; 
    public String  name; 
    public String  buildNumber; 
    public String  account; 
    public String  departmetFKCode; 
    public String  molCode; 
    public String  molName; 
    public Date dateIn ;
    public Date dateBuild ;
    public BigDecimal  cost; 
    public int  scCode = Integer.MIN_VALUE; 
    public String  installOrderNumber; 
    public BigDecimal  costOld; 
    public String  commentGen; 
    public long  modify_time = Long.MIN_VALUE;
    public String  userAdd; 
    public Date dateAdd ;
    public String  userGen; 
    public Date dateEdit ;
    public SCSealTypeRef typeRef = new SCSealTypeRef();
    public SCSealStatusRef statusRef = new SCSealStatusRef();
    public ENEstimateItemRef estimateItemRef = new ENEstimateItemRef();
    public SCSealLockTypeRef lockTypeRef = new SCSealLockTypeRef();
    public RQStorageZoneRef zoneRef = new RQStorageZoneRef();
    public static final String tableName = "SCSEAL";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "SCSEAL.CODE";
    public static final String invNumber_Attr = "invNumber";
    public static final String invNumber_Field = "INVNUMBER";
    public static final String invNumber_QFielld = "SCSEAL.INVNUMBER";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "SCSEAL.NAME";
    public static final String buildNumber_Attr = "buildNumber";
    public static final String buildNumber_Field = "BUILDNUMBER";
    public static final String buildNumber_QFielld = "SCSEAL.BUILDNUMBER";
    public static final String account_Attr = "account";
    public static final String account_Field = "ACCOUNT";
    public static final String account_QFielld = "SCSEAL.ACCOUNT";
    public static final String departmetFKCode_Attr = "departmetFKCode";
    public static final String departmetFKCode_Field = "DEPARTMETFKCODE";
    public static final String departmetFKCode_QFielld = "SCSEAL.DEPARTMETFKCODE";
    public static final String molCode_Attr = "molCode";
    public static final String molCode_Field = "MOLCODE";
    public static final String molCode_QFielld = "SCSEAL.MOLCODE";
    public static final String molName_Attr = "molName";
    public static final String molName_Field = "MOLNAME";
    public static final String molName_QFielld = "SCSEAL.MOLNAME";
    public static final String dateIn_Attr = "dateIn";
    public static final String dateIn_Field = "DATEIN";
    public static final String dateIn_QFielld = "SCSEAL.DATEIN";
    public static final String dateBuild_Attr = "dateBuild";
    public static final String dateBuild_Field = "DATEBUILD";
    public static final String dateBuild_QFielld = "SCSEAL.DATEBUILD";
    public static final String cost_Attr = "cost";
    public static final String cost_Field = "COST";
    public static final String cost_QFielld = "SCSEAL.COST";
    public static final String scCode_Attr = "scCode";
    public static final String scCode_Field = "SCCODE";
    public static final String scCode_QFielld = "SCSEAL.SCCODE";
    public static final String installOrderNumber_Attr = "installOrderNumber";
    public static final String installOrderNumber_Field = "INSTALLORDERNUMBER";
    public static final String installOrderNumber_QFielld = "SCSEAL.INSTALLORDERNUMBER";
    public static final String costOld_Attr = "costOld";
    public static final String costOld_Field = "COSTOLD";
    public static final String costOld_QFielld = "SCSEAL.COSTOLD";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "SCSEAL.COMMENTGEN";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "SCSEAL.MODIFY_TIME";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "SCSEAL.USERADD";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "SCSEAL.DATEADD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "SCSEAL.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "SCSEAL.DATEEDIT";
    public static final String typeRef_Attr = "typeRef";
    public static final String typeRef_Field = "TYPEREFCODE";
    public static final String  typeRef_QFielld = "SCSEAL.TYPEREFCODE";
    public static final String statusRef_Attr = "statusRef";
    public static final String statusRef_Field = "STATUSREFCODE";
    public static final String  statusRef_QFielld = "SCSEAL.STATUSREFCODE";
    public static final String estimateItemRef_Attr = "estimateItemRef";
    public static final String estimateItemRef_Field = "ESTIMATEITEMREFCODE";
    public static final String  estimateItemRef_QFielld = "SCSEAL.ESTIMATEITEMREFCODE";
    public static final String lockTypeRef_Attr = "lockTypeRef";
    public static final String lockTypeRef_Field = "LOCKTYPEREFCODE";
    public static final String  lockTypeRef_QFielld = "SCSEAL.LOCKTYPEREFCODE";
    public static final String zoneRef_Attr = "zoneRef";
    public static final String zoneRef_Field = "ZONEREFCODE";
    public static final String  zoneRef_QFielld = "SCSEAL.ZONEREFCODE";



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


    public void setMolName(String aValue){
       molName = aValue;
    }

    public String getMolName(){
       return molName;
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


    public void setInstallOrderNumber(String aValue){
       installOrderNumber = aValue;
    }

    public String getInstallOrderNumber(){
       return installOrderNumber;
    }


    public void setCostOld(BigDecimal aValue){
       costOld = aValue;
    }

    public BigDecimal getCostOld(){
       return costOld;
    }


    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
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

    public void setTypeRef(SCSealTypeRef aValue){
       typeRef = aValue;
    }

    public SCSealTypeRef getTypeRef(){
       return typeRef;
    }
    public void setStatusRef(SCSealStatusRef aValue){
       statusRef = aValue;
    }

    public SCSealStatusRef getStatusRef(){
       return statusRef;
    }
    public void setEstimateItemRef(ENEstimateItemRef aValue){
       estimateItemRef = aValue;
    }

    public ENEstimateItemRef getEstimateItemRef(){
       return estimateItemRef;
    }
    public void setLockTypeRef(SCSealLockTypeRef aValue){
       lockTypeRef = aValue;
    }

    public SCSealLockTypeRef getLockTypeRef(){
       return lockTypeRef;
    }
    public void setZoneRef(RQStorageZoneRef aValue){
       zoneRef = aValue;
    }

    public RQStorageZoneRef getZoneRef(){
       return zoneRef;
    }

} // end of SCSealValueObject

