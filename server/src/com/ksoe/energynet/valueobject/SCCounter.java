
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for SCCounter;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.SCCounterStatusRef;
    import  com.ksoe.energynet.valueobject.references.ENEstimateItemRef;
    import  com.ksoe.energynet.valueobject.references.SCCounterKindRef;
    import  com.ksoe.rqorder.valueobject.references.RQStorageZoneRef;

public class SCCounter implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE;
    public String  invNumber; 
    public String  name; 
    public String  buildNumber; 
    public String  account; 
    public String  departmetFKCode; 
    public String  molCode; 
    public Date dateIn ;
    public Date dateBuild ;
    public Date dateCheck ;
    public BigDecimal  cost; 
    public int  scCode = Integer.MIN_VALUE;
    public String  counterType; 
    public String  installOrderNumber; 
    public String  reading; 
    public Date dateEdit ;
    public int  isliquid = Integer.MIN_VALUE;
    public BigDecimal  costOld; 
    public int  isMoveToZKU = Integer.MIN_VALUE;
    public String  invnumberzku; 
    public String  namezku; 
    public String  accountzku; 
    public BigDecimal  costzku; 
    public int  sccodezku = Integer.MIN_VALUE;
    public int  elementcode = Integer.MIN_VALUE;
    public BigDecimal  phasity; 
    public BigDecimal  costzku_b; 
    public int  iszku = Integer.MIN_VALUE;
    public String  lschet; 
    public String  placeust; 
    public String  priconndoc; 
    public Date priconndate ;
    public BigDecimal  checkperiod; 
    public String  actInvitationNumber; 
    public Date dateInvitation ;
    public Date dateExpertise ;
    public String  podrCodeZKU; 
    public int  fundingType = Integer.MIN_VALUE;
    public long  modify_time = Long.MIN_VALUE;
    public SCCounterStatusRef statusRef = new SCCounterStatusRef();
    public ENEstimateItemRef estimateItemRef = new ENEstimateItemRef();
    public SCCounterKindRef kindRef = new SCCounterKindRef();
    public RQStorageZoneRef zoneRef = new RQStorageZoneRef();
    
    
	public BigDecimal classAccuracy;
	public Date dateNewPeriodCheck;
	public BigDecimal checkperiod1;
	public String invNumberCounterInZKU;
	public int isExistsZKU = Integer.MIN_VALUE;
	public int isZKU = Integer.MIN_VALUE;

    public BigDecimal getClassAccuracy() {
		return classAccuracy;
	}

	public void setClassAccuracy(BigDecimal classAccuracy) {
		this.classAccuracy = classAccuracy;
	}

	public Date getDateNewPeriodCheck() {
		return dateNewPeriodCheck;
	}

	public void setDateNewPeriodCheck(Date dateNewPeriodCheck) {
		this.dateNewPeriodCheck = dateNewPeriodCheck;
	}

	public BigDecimal getCheckperiod1() {
		return checkperiod1;
	}

	public void setCheckperiod1(BigDecimal checkperiod1) {
		this.checkperiod1 = checkperiod1;
	}

	public String getInvNumberCounterInZKU() {
		return invNumberCounterInZKU;
	}

	public void setInvNumberCounterInZKU(String invNumberCounterInZKU) {
		this.invNumberCounterInZKU = invNumberCounterInZKU;
	}

	public int getIsExistsZKU() {
		return isExistsZKU;
	}

	public void setIsExistsZKU(int isExistsZKU) {
		this.isExistsZKU = isExistsZKU;
	}

	public int getIsZKU() {
		return isZKU;
	}

	public void setIsZKU(int isZKU) {
		this.isZKU = isZKU;
	}
    
    public static final String tableName = "SCCOUNTER";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "SCCOUNTER.CODE";
    public static final String invNumber_Attr = "invNumber";
    public static final String invNumber_Field = "INVNUMBER";
    public static final String invNumber_QFielld = "SCCOUNTER.INVNUMBER";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "SCCOUNTER.NAME";
    public static final String buildNumber_Attr = "buildNumber";
    public static final String buildNumber_Field = "BUILDNUMBER";
    public static final String buildNumber_QFielld = "SCCOUNTER.BUILDNUMBER";
    public static final String account_Attr = "account";
    public static final String account_Field = "ACCOUNT";
    public static final String account_QFielld = "SCCOUNTER.ACCOUNT";
    public static final String departmetFKCode_Attr = "departmetFKCode";
    public static final String departmetFKCode_Field = "DEPARTMETFKCODE";
    public static final String departmetFKCode_QFielld = "SCCOUNTER.DEPARTMETFKCODE";
    public static final String molCode_Attr = "molCode";
    public static final String molCode_Field = "MOLCODE";
    public static final String molCode_QFielld = "SCCOUNTER.MOLCODE";
    public static final String dateIn_Attr = "dateIn";
    public static final String dateIn_Field = "DATEIN";
    public static final String dateIn_QFielld = "SCCOUNTER.DATEIN";
    public static final String dateBuild_Attr = "dateBuild";
    public static final String dateBuild_Field = "DATEBUILD";
    public static final String dateBuild_QFielld = "SCCOUNTER.DATEBUILD";
    public static final String dateCheck_Attr = "dateCheck";
    public static final String dateCheck_Field = "DATECHECK";
    public static final String dateCheck_QFielld = "SCCOUNTER.DATECHECK";
    public static final String cost_Attr = "cost";
    public static final String cost_Field = "COST";
    public static final String cost_QFielld = "SCCOUNTER.COST";
    public static final String scCode_Attr = "scCode";
    public static final String scCode_Field = "SCCODE";
    public static final String scCode_QFielld = "SCCOUNTER.SCCODE";
    public static final String counterType_Attr = "counterType";
    public static final String counterType_Field = "COUNTERTYPE";
    public static final String counterType_QFielld = "SCCOUNTER.COUNTERTYPE";
    public static final String installOrderNumber_Attr = "installOrderNumber";
    public static final String installOrderNumber_Field = "INSTALLORDERNUMBER";
    public static final String installOrderNumber_QFielld = "SCCOUNTER.INSTALLORDERNUMBER";
    public static final String reading_Attr = "reading";
    public static final String reading_Field = "READING";
    public static final String reading_QFielld = "SCCOUNTER.READING";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "SCCOUNTER.DATEEDIT";
    public static final String isliquid_Attr = "isliquid";
    public static final String isliquid_Field = "ISLIQUID";
    public static final String isliquid_QFielld = "SCCOUNTER.ISLIQUID";
    public static final String costOld_Attr = "costOld";
    public static final String costOld_Field = "COSTOLD";
    public static final String costOld_QFielld = "SCCOUNTER.COSTOLD";
    public static final String isMoveToZKU_Attr = "isMoveToZKU";
    public static final String isMoveToZKU_Field = "ISMOVETOZKU";
    public static final String isMoveToZKU_QFielld = "SCCOUNTER.ISMOVETOZKU";
    public static final String invnumberzku_Attr = "invnumberzku";
    public static final String invnumberzku_Field = "INVNUMBERZKU";
    public static final String invnumberzku_QFielld = "SCCOUNTER.INVNUMBERZKU";
    public static final String namezku_Attr = "namezku";
    public static final String namezku_Field = "NAMEZKU";
    public static final String namezku_QFielld = "SCCOUNTER.NAMEZKU";
    public static final String accountzku_Attr = "accountzku";
    public static final String accountzku_Field = "ACCOUNTZKU";
    public static final String accountzku_QFielld = "SCCOUNTER.ACCOUNTZKU";
    public static final String costzku_Attr = "costzku";
    public static final String costzku_Field = "COSTZKU";
    public static final String costzku_QFielld = "SCCOUNTER.COSTZKU";
    public static final String sccodezku_Attr = "sccodezku";
    public static final String sccodezku_Field = "SCCODEZKU";
    public static final String sccodezku_QFielld = "SCCOUNTER.SCCODEZKU";
    public static final String elementcode_Attr = "elementcode";
    public static final String elementcode_Field = "ELEMENTCODE";
    public static final String elementcode_QFielld = "SCCOUNTER.ELEMENTCODE";
    public static final String phasity_Attr = "phasity";
    public static final String phasity_Field = "PHASITY";
    public static final String phasity_QFielld = "SCCOUNTER.PHASITY";
    public static final String costzku_b_Attr = "costzku_b";
    public static final String costzku_b_Field = "COSTZKU_B";
    public static final String costzku_b_QFielld = "SCCOUNTER.COSTZKU_B";
    public static final String iszku_Attr = "iszku";
    public static final String iszku_Field = "ISZKU";
    public static final String iszku_QFielld = "SCCOUNTER.ISZKU";
    public static final String lschet_Attr = "lschet";
    public static final String lschet_Field = "LSCHET";
    public static final String lschet_QFielld = "SCCOUNTER.LSCHET";
    public static final String placeust_Attr = "placeust";
    public static final String placeust_Field = "PLACEUST";
    public static final String placeust_QFielld = "SCCOUNTER.PLACEUST";
    public static final String priconndoc_Attr = "priconndoc";
    public static final String priconndoc_Field = "PRICONNDOC";
    public static final String priconndoc_QFielld = "SCCOUNTER.PRICONNDOC";
    public static final String priconndate_Attr = "priconndate";
    public static final String priconndate_Field = "PRICONNDATE";
    public static final String priconndate_QFielld = "SCCOUNTER.PRICONNDATE";
    public static final String checkperiod_Attr = "checkperiod";
    public static final String checkperiod_Field = "CHECKPERIOD";
    public static final String checkperiod_QFielld = "SCCOUNTER.CHECKPERIOD";
    public static final String actInvitationNumber_Attr = "actInvitationNumber";
    public static final String actInvitationNumber_Field = "ACTINVITATIONNUMBER";
    public static final String actInvitationNumber_QFielld = "SCCOUNTER.ACTINVITATIONNUMBER";
    public static final String dateInvitation_Attr = "dateInvitation";
    public static final String dateInvitation_Field = "DATEINVITATION";
    public static final String dateInvitation_QFielld = "SCCOUNTER.DATEINVITATION";
    public static final String dateExpertise_Attr = "dateExpertise";
    public static final String dateExpertise_Field = "DATEEXPERTISE";
    public static final String dateExpertise_QFielld = "SCCOUNTER.DATEEXPERTISE";
    public static final String podrCodeZKU_Attr = "podrCodeZKU";
    public static final String podrCodeZKU_Field = "PODRCODEZKU";
    public static final String podrCodeZKU_QFielld = "SCCOUNTER.PODRCODEZKU";
    public static final String fundingType_Attr = "fundingType";
    public static final String fundingType_Field = "FUNDINGTYPE";
    public static final String fundingType_QFielld = "SCCOUNTER.FUNDINGTYPE";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "SCCOUNTER.MODIFY_TIME";
    public static final String statusRef_Attr = "statusRef";
    public static final String statusRef_Field = "STATUSREFCODE";
    public static final String  statusRef_QFielld = "SCCOUNTER.STATUSREFCODE";
    public static final String estimateItemRef_Attr = "estimateItemRef";
    public static final String estimateItemRef_Field = "ESTIMATEITEMREFCODE";
    public static final String  estimateItemRef_QFielld = "SCCOUNTER.ESTIMATEITEMREFCODE";
    public static final String kindRef_Attr = "kindRef";
    public static final String kindRef_Field = "KINDREFCODE";
    public static final String  kindRef_QFielld = "SCCOUNTER.KINDREFCODE";
    public static final String zoneRef_Attr = "zoneRef";
    public static final String zoneRef_Field = "ZONEREFCODE";
    public static final String  zoneRef_QFielld = "SCCOUNTER.ZONEREFCODE";



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


    public void setDateCheck(Date aValue){
       dateCheck = aValue;
    }

    public Date getDateCheck(){
       return dateCheck;
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


    public void setInstallOrderNumber(String aValue){
       installOrderNumber = aValue;
    }

    public String getInstallOrderNumber(){
       return installOrderNumber;
    }


    public void setReading(String aValue){
       reading = aValue;
    }

    public String getReading(){
       return reading;
    }


    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }


    public void setIsliquid(int aValue){
       isliquid = aValue;
    }

    public int getIsliquid(){
       return isliquid;
    }


    public void setCostOld(BigDecimal aValue){
       costOld = aValue;
    }

    public BigDecimal getCostOld(){
       return costOld;
    }


    public void setIsMoveToZKU(int aValue){
       isMoveToZKU = aValue;
    }

    public int getIsMoveToZKU(){
       return isMoveToZKU;
    }


    public void setInvnumberzku(String aValue){
       invnumberzku = aValue;
    }

    public String getInvnumberzku(){
       return invnumberzku;
    }


    public void setNamezku(String aValue){
       namezku = aValue;
    }

    public String getNamezku(){
       return namezku;
    }


    public void setAccountzku(String aValue){
       accountzku = aValue;
    }

    public String getAccountzku(){
       return accountzku;
    }


    public void setCostzku(BigDecimal aValue){
       costzku = aValue;
    }

    public BigDecimal getCostzku(){
       return costzku;
    }


    public void setSccodezku(int aValue){
       sccodezku = aValue;
    }

    public int getSccodezku(){
       return sccodezku;
    }


    public void setElementcode(int aValue){
       elementcode = aValue;
    }

    public int getElementcode(){
       return elementcode;
    }


    public void setPhasity(BigDecimal aValue){
       phasity = aValue;
    }

    public BigDecimal getPhasity(){
       return phasity;
    }


    public void setCostzku_b(BigDecimal aValue){
       costzku_b = aValue;
    }

    public BigDecimal getCostzku_b(){
       return costzku_b;
    }


    public void setIszku(int aValue){
       iszku = aValue;
    }

    public int getIszku(){
       return iszku;
    }


    public void setLschet(String aValue){
       lschet = aValue;
    }

    public String getLschet(){
       return lschet;
    }


    public void setPlaceust(String aValue){
       placeust = aValue;
    }

    public String getPlaceust(){
       return placeust;
    }


    public void setPriconndoc(String aValue){
       priconndoc = aValue;
    }

    public String getPriconndoc(){
       return priconndoc;
    }


    public void setPriconndate(Date aValue){
       priconndate = aValue;
    }

    public Date getPriconndate(){
       return priconndate;
    }


    public void setCheckperiod(BigDecimal aValue){
       checkperiod = aValue;
    }

    public BigDecimal getCheckperiod(){
       return checkperiod;
    }


    public void setActInvitationNumber(String aValue){
       actInvitationNumber = aValue;
    }

    public String getActInvitationNumber(){
       return actInvitationNumber;
    }


    public void setDateInvitation(Date aValue){
       dateInvitation = aValue;
    }

    public Date getDateInvitation(){
       return dateInvitation;
    }


    public void setDateExpertise(Date aValue){
       dateExpertise = aValue;
    }

    public Date getDateExpertise(){
       return dateExpertise;
    }


    public void setPodrCodeZKU(String aValue){
       podrCodeZKU = aValue;
    }

    public String getPodrCodeZKU(){
       return podrCodeZKU;
    }


    public void setFundingType(int aValue){
       fundingType = aValue;
    }

    public int getFundingType(){
       return fundingType;
    }


    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setStatusRef(SCCounterStatusRef aValue){
       statusRef = aValue;
    }

    public SCCounterStatusRef getStatusRef(){
       return statusRef;
    }
    public void setEstimateItemRef(ENEstimateItemRef aValue){
       estimateItemRef = aValue;
    }

    public ENEstimateItemRef getEstimateItemRef(){
       return estimateItemRef;
    }
    public void setKindRef(SCCounterKindRef aValue){
       kindRef = aValue;
    }

    public SCCounterKindRef getKindRef(){
       return kindRef;
    }
    public void setZoneRef(RQStorageZoneRef aValue){
       zoneRef = aValue;
    }

    public RQStorageZoneRef getZoneRef(){
       return zoneRef;
    }

} // end of SCCounterValueObject

