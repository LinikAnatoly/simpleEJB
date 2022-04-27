
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for SCSeal2ENWorkOrderByt;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class SCSeal2ENWorkOrderBytShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String userAdd;
    public Date dateAdd ;
    public String userGen;
    public Date dateEdit ;
    public int sealRefCode = Integer.MIN_VALUE;
    public String sealRefInvNumber;
    public String sealRefName;
    public String sealRefBuildNumber;
    public String sealRefAccount;
    public String sealRefDepartmetFKCode;
    public String sealRefMolCode;
    public String sealRefMolName;
    public Date sealRefDateIn;
    public Date sealRefDateBuild;
    public BigDecimal sealRefCost;
    public int sealRefScCode = Integer.MIN_VALUE;
    public String sealRefInstallOrderNumber;
    public BigDecimal sealRefCostOld;
    public String sealRefUserAdd;
    public Date sealRefDateAdd;
    public String sealRefUserGen;
    public Date sealRefDateEdit;
    public int workOrderBytRefCode = Integer.MIN_VALUE;
    public String workOrderBytRefNumberGen;
    public Date workOrderBytRefDateGen;
    public String workOrderBytRefCommentGen;
    public Date workOrderBytRefDateAdd;
    public Date workOrderBytRefDateEdit;
    public String workOrderBytRefUserAdd;
    public String workOrderBytRefUserEdit;
    public int workOrderBytItemRefCode = Integer.MIN_VALUE;
    public String workOrderBytItemRefContractNumberServices;
    public String workOrderBytItemRefAccountNumber;
    public String workOrderBytItemRefName;
    public String workOrderBytItemRefCustomerName;
    public String workOrderBytItemRefAddress;
    public String workOrderBytItemRefInvNumber;
    public String workOrderBytItemRefSerialNumber;
    public String workOrderBytItemRefSeal;
    public String workOrderBytItemRefPhone;
    public int workOrderBytItemRefStatuscode = Integer.MIN_VALUE;
    public int workOrderBytItemRefRpCode = Integer.MIN_VALUE;
    public Date workOrderBytItemRefDateCounterInst;
    public Date workOrderBytItemRefDateCounterCheck;
    public String workOrderBytItemRefCounterType;
    public BigDecimal workOrderBytItemRefClassAccuracy;
    public BigDecimal workOrderBytItemRefCheckperiod;
    public int workOrderBytItemRefRpStatusCode = Integer.MIN_VALUE;
    public BigDecimal workOrderBytItemRefPhasity;
    public Date workOrderBytItemRefDatecheck;
    public BigDecimal workOrderBytItemRefCheckperiod1;
    public String workOrderBytItemRefPlacecounter;
    public int workOrderBytItemRefRpIsWorking = Integer.MIN_VALUE;
    public String workOrderBytItemRefRecordPointName;
    public String workOrderBytItemRefRouteBytName;
    public String workOrderBytItemRefRouteBytNumbergen;
    public String workOrderBytItemRefCommentGen;
    public Date workOrderBytItemRefDateAdd;
    public Date workOrderBytItemRefDateEdit;
    public String workOrderBytItemRefUserAdd;
    public String workOrderBytItemRefUserEdit;
    public int workOrderBytItemRefFactCode = Integer.MIN_VALUE;
    public int kindRefCode = Integer.MIN_VALUE;
    public String kindRefName;

    /////
    public int estimateItemCode = Integer.MIN_VALUE;
    public BigDecimal estimateItemCountFact;
    public String estimateItemMaterialName;
    public BigDecimal sealsCountFact;
    public String estimateItemCodes;
    
    public int sealRefTypeCode = Integer.MIN_VALUE;
    public String sealRefTypeName;

    // Имя потребителя + наименование точки учета (для юр. лиц)
    public String workOrderBytItemRefCustomerNameFull;
    /////
    
	public int getEstimateItemCode() {
		return estimateItemCode;
	}

	public void setEstimateItemCode(int estimateItemCode) {
		this.estimateItemCode = estimateItemCode;
	}

	public BigDecimal getEstimateItemCountFact() {
		return estimateItemCountFact;
	}

	public void setEstimateItemCountFact(BigDecimal estimateItemCountFact) {
		this.estimateItemCountFact = estimateItemCountFact;
	}

	public String getEstimateItemMaterialName() {
		return estimateItemMaterialName;
	}

	public void setEstimateItemMaterialName(String estimateItemMaterialName) {
		this.estimateItemMaterialName = estimateItemMaterialName;
	}

	public BigDecimal getSealsCountFact() {
		return sealsCountFact;
	}

	public void setSealsCountFact(BigDecimal sealsCountFact) {
		this.sealsCountFact = sealsCountFact;
	}

	public String getEstimateItemCodes() {
		return estimateItemCodes;
	}

	public void setEstimateItemCodes(String estimateItemCodes) {
		this.estimateItemCodes = estimateItemCodes;
	}

	public int getSealRefTypeCode() {
		return sealRefTypeCode;
	}

	public void setSealRefTypeCode(int sealRefTypeCode) {
		this.sealRefTypeCode = sealRefTypeCode;
	}

	public String getSealRefTypeName() {
		return sealRefTypeName;
	}

	public void setSealRefTypeName(String sealRefTypeName) {
		this.sealRefTypeName = sealRefTypeName;
	}
	
    ///// 
    public String getWorkOrderBytItemRefCustomerNameFull() {
		return workOrderBytItemRefCustomerNameFull;
	}

	public void setWorkOrderBytItemRefCustomerNameFull(
			String workOrderBytItemRefCustomerNameFull) {
		this.workOrderBytItemRefCustomerNameFull = workOrderBytItemRefCustomerNameFull;
	}
	/////
	
    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
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


    public void setSealRefCode(int aValue){
       sealRefCode = aValue;
    }
    public int getSealRefCode(){
       return sealRefCode;
    }

    public void setSealRefInvNumber(String aValue){
       sealRefInvNumber = aValue;
    }
    public String getSealRefInvNumber(){
       return sealRefInvNumber;
    }

    public void setSealRefName(String aValue){
       sealRefName = aValue;
    }
    public String getSealRefName(){
       return sealRefName;
    }

    public void setSealRefBuildNumber(String aValue){
       sealRefBuildNumber = aValue;
    }
    public String getSealRefBuildNumber(){
       return sealRefBuildNumber;
    }

    public void setSealRefAccount(String aValue){
       sealRefAccount = aValue;
    }
    public String getSealRefAccount(){
       return sealRefAccount;
    }

    public void setSealRefDepartmetFKCode(String aValue){
       sealRefDepartmetFKCode = aValue;
    }
    public String getSealRefDepartmetFKCode(){
       return sealRefDepartmetFKCode;
    }

    public void setSealRefMolCode(String aValue){
       sealRefMolCode = aValue;
    }
    public String getSealRefMolCode(){
       return sealRefMolCode;
    }

    public void setSealRefMolName(String aValue){
       sealRefMolName = aValue;
    }
    public String getSealRefMolName(){
       return sealRefMolName;
    }

    public void setSealRefDateIn(Date aValue){
       sealRefDateIn = aValue;
    }
    public Date getSealRefDateIn(){
       return sealRefDateIn;
    }

    public void setSealRefDateBuild(Date aValue){
       sealRefDateBuild = aValue;
    }
    public Date getSealRefDateBuild(){
       return sealRefDateBuild;
    }

    public void setSealRefCost(BigDecimal aValue){
       sealRefCost = aValue;
    }
    public BigDecimal getSealRefCost(){
       return sealRefCost;
    }

    public void setSealRefScCode(int aValue){
       sealRefScCode = aValue;
    }
    public int getSealRefScCode(){
       return sealRefScCode;
    }

    public void setSealRefInstallOrderNumber(String aValue){
       sealRefInstallOrderNumber = aValue;
    }
    public String getSealRefInstallOrderNumber(){
       return sealRefInstallOrderNumber;
    }

    public void setSealRefCostOld(BigDecimal aValue){
       sealRefCostOld = aValue;
    }
    public BigDecimal getSealRefCostOld(){
       return sealRefCostOld;
    }

    public void setSealRefUserAdd(String aValue){
       sealRefUserAdd = aValue;
    }
    public String getSealRefUserAdd(){
       return sealRefUserAdd;
    }

    public void setSealRefDateAdd(Date aValue){
       sealRefDateAdd = aValue;
    }
    public Date getSealRefDateAdd(){
       return sealRefDateAdd;
    }

    public void setSealRefUserGen(String aValue){
       sealRefUserGen = aValue;
    }
    public String getSealRefUserGen(){
       return sealRefUserGen;
    }

    public void setSealRefDateEdit(Date aValue){
       sealRefDateEdit = aValue;
    }
    public Date getSealRefDateEdit(){
       return sealRefDateEdit;
    }

    public void setWorkOrderBytRefCode(int aValue){
       workOrderBytRefCode = aValue;
    }
    public int getWorkOrderBytRefCode(){
       return workOrderBytRefCode;
    }

    public void setWorkOrderBytRefNumberGen(String aValue){
       workOrderBytRefNumberGen = aValue;
    }
    public String getWorkOrderBytRefNumberGen(){
       return workOrderBytRefNumberGen;
    }

    public void setWorkOrderBytRefDateGen(Date aValue){
       workOrderBytRefDateGen = aValue;
    }
    public Date getWorkOrderBytRefDateGen(){
       return workOrderBytRefDateGen;
    }

    public void setWorkOrderBytRefCommentGen(String aValue){
       workOrderBytRefCommentGen = aValue;
    }
    public String getWorkOrderBytRefCommentGen(){
       return workOrderBytRefCommentGen;
    }

    public void setWorkOrderBytRefDateAdd(Date aValue){
       workOrderBytRefDateAdd = aValue;
    }
    public Date getWorkOrderBytRefDateAdd(){
       return workOrderBytRefDateAdd;
    }

    public void setWorkOrderBytRefDateEdit(Date aValue){
       workOrderBytRefDateEdit = aValue;
    }
    public Date getWorkOrderBytRefDateEdit(){
       return workOrderBytRefDateEdit;
    }

    public void setWorkOrderBytRefUserAdd(String aValue){
       workOrderBytRefUserAdd = aValue;
    }
    public String getWorkOrderBytRefUserAdd(){
       return workOrderBytRefUserAdd;
    }

    public void setWorkOrderBytRefUserEdit(String aValue){
       workOrderBytRefUserEdit = aValue;
    }
    public String getWorkOrderBytRefUserEdit(){
       return workOrderBytRefUserEdit;
    }

    public void setWorkOrderBytItemRefCode(int aValue){
       workOrderBytItemRefCode = aValue;
    }
    public int getWorkOrderBytItemRefCode(){
       return workOrderBytItemRefCode;
    }

    public void setWorkOrderBytItemRefContractNumberServices(String aValue){
       workOrderBytItemRefContractNumberServices = aValue;
    }
    public String getWorkOrderBytItemRefContractNumberServices(){
       return workOrderBytItemRefContractNumberServices;
    }

    public void setWorkOrderBytItemRefAccountNumber(String aValue){
       workOrderBytItemRefAccountNumber = aValue;
    }
    public String getWorkOrderBytItemRefAccountNumber(){
       return workOrderBytItemRefAccountNumber;
    }

    public void setWorkOrderBytItemRefName(String aValue){
       workOrderBytItemRefName = aValue;
    }
    public String getWorkOrderBytItemRefName(){
       return workOrderBytItemRefName;
    }

    public void setWorkOrderBytItemRefCustomerName(String aValue){
       workOrderBytItemRefCustomerName = aValue;
    }
    public String getWorkOrderBytItemRefCustomerName(){
       return workOrderBytItemRefCustomerName;
    }

    public void setWorkOrderBytItemRefAddress(String aValue){
       workOrderBytItemRefAddress = aValue;
    }
    public String getWorkOrderBytItemRefAddress(){
       return workOrderBytItemRefAddress;
    }

    public void setWorkOrderBytItemRefInvNumber(String aValue){
       workOrderBytItemRefInvNumber = aValue;
    }
    public String getWorkOrderBytItemRefInvNumber(){
       return workOrderBytItemRefInvNumber;
    }

    public void setWorkOrderBytItemRefSerialNumber(String aValue){
       workOrderBytItemRefSerialNumber = aValue;
    }
    public String getWorkOrderBytItemRefSerialNumber(){
       return workOrderBytItemRefSerialNumber;
    }

    public void setWorkOrderBytItemRefSeal(String aValue){
       workOrderBytItemRefSeal = aValue;
    }
    public String getWorkOrderBytItemRefSeal(){
       return workOrderBytItemRefSeal;
    }

    public void setWorkOrderBytItemRefPhone(String aValue){
       workOrderBytItemRefPhone = aValue;
    }
    public String getWorkOrderBytItemRefPhone(){
       return workOrderBytItemRefPhone;
    }

    public void setWorkOrderBytItemRefStatuscode(int aValue){
       workOrderBytItemRefStatuscode = aValue;
    }
    public int getWorkOrderBytItemRefStatuscode(){
       return workOrderBytItemRefStatuscode;
    }

    public void setWorkOrderBytItemRefRpCode(int aValue){
       workOrderBytItemRefRpCode = aValue;
    }
    public int getWorkOrderBytItemRefRpCode(){
       return workOrderBytItemRefRpCode;
    }

    public void setWorkOrderBytItemRefDateCounterInst(Date aValue){
       workOrderBytItemRefDateCounterInst = aValue;
    }
    public Date getWorkOrderBytItemRefDateCounterInst(){
       return workOrderBytItemRefDateCounterInst;
    }

    public void setWorkOrderBytItemRefDateCounterCheck(Date aValue){
       workOrderBytItemRefDateCounterCheck = aValue;
    }
    public Date getWorkOrderBytItemRefDateCounterCheck(){
       return workOrderBytItemRefDateCounterCheck;
    }

    public void setWorkOrderBytItemRefCounterType(String aValue){
       workOrderBytItemRefCounterType = aValue;
    }
    public String getWorkOrderBytItemRefCounterType(){
       return workOrderBytItemRefCounterType;
    }

    public void setWorkOrderBytItemRefClassAccuracy(BigDecimal aValue){
       workOrderBytItemRefClassAccuracy = aValue;
    }
    public BigDecimal getWorkOrderBytItemRefClassAccuracy(){
       return workOrderBytItemRefClassAccuracy;
    }

    public void setWorkOrderBytItemRefCheckperiod(BigDecimal aValue){
       workOrderBytItemRefCheckperiod = aValue;
    }
    public BigDecimal getWorkOrderBytItemRefCheckperiod(){
       return workOrderBytItemRefCheckperiod;
    }

    public void setWorkOrderBytItemRefRpStatusCode(int aValue){
       workOrderBytItemRefRpStatusCode = aValue;
    }
    public int getWorkOrderBytItemRefRpStatusCode(){
       return workOrderBytItemRefRpStatusCode;
    }

    public void setWorkOrderBytItemRefPhasity(BigDecimal aValue){
       workOrderBytItemRefPhasity = aValue;
    }
    public BigDecimal getWorkOrderBytItemRefPhasity(){
       return workOrderBytItemRefPhasity;
    }

    public void setWorkOrderBytItemRefDatecheck(Date aValue){
       workOrderBytItemRefDatecheck = aValue;
    }
    public Date getWorkOrderBytItemRefDatecheck(){
       return workOrderBytItemRefDatecheck;
    }

    public void setWorkOrderBytItemRefCheckperiod1(BigDecimal aValue){
       workOrderBytItemRefCheckperiod1 = aValue;
    }
    public BigDecimal getWorkOrderBytItemRefCheckperiod1(){
       return workOrderBytItemRefCheckperiod1;
    }

    public void setWorkOrderBytItemRefPlacecounter(String aValue){
       workOrderBytItemRefPlacecounter = aValue;
    }
    public String getWorkOrderBytItemRefPlacecounter(){
       return workOrderBytItemRefPlacecounter;
    }

    public void setWorkOrderBytItemRefRpIsWorking(int aValue){
       workOrderBytItemRefRpIsWorking = aValue;
    }
    public int getWorkOrderBytItemRefRpIsWorking(){
       return workOrderBytItemRefRpIsWorking;
    }

    public void setWorkOrderBytItemRefRecordPointName(String aValue){
       workOrderBytItemRefRecordPointName = aValue;
    }
    public String getWorkOrderBytItemRefRecordPointName(){
       return workOrderBytItemRefRecordPointName;
    }

    public void setWorkOrderBytItemRefRouteBytName(String aValue){
       workOrderBytItemRefRouteBytName = aValue;
    }
    public String getWorkOrderBytItemRefRouteBytName(){
       return workOrderBytItemRefRouteBytName;
    }

    public void setWorkOrderBytItemRefRouteBytNumbergen(String aValue){
       workOrderBytItemRefRouteBytNumbergen = aValue;
    }
    public String getWorkOrderBytItemRefRouteBytNumbergen(){
       return workOrderBytItemRefRouteBytNumbergen;
    }

    public void setWorkOrderBytItemRefCommentGen(String aValue){
       workOrderBytItemRefCommentGen = aValue;
    }
    public String getWorkOrderBytItemRefCommentGen(){
       return workOrderBytItemRefCommentGen;
    }

    public void setWorkOrderBytItemRefDateAdd(Date aValue){
       workOrderBytItemRefDateAdd = aValue;
    }
    public Date getWorkOrderBytItemRefDateAdd(){
       return workOrderBytItemRefDateAdd;
    }

    public void setWorkOrderBytItemRefDateEdit(Date aValue){
       workOrderBytItemRefDateEdit = aValue;
    }
    public Date getWorkOrderBytItemRefDateEdit(){
       return workOrderBytItemRefDateEdit;
    }

    public void setWorkOrderBytItemRefUserAdd(String aValue){
       workOrderBytItemRefUserAdd = aValue;
    }
    public String getWorkOrderBytItemRefUserAdd(){
       return workOrderBytItemRefUserAdd;
    }

    public void setWorkOrderBytItemRefUserEdit(String aValue){
       workOrderBytItemRefUserEdit = aValue;
    }
    public String getWorkOrderBytItemRefUserEdit(){
       return workOrderBytItemRefUserEdit;
    }

    public void setWorkOrderBytItemRefFactCode(int aValue){
       workOrderBytItemRefFactCode = aValue;
    }
    public int getWorkOrderBytItemRefFactCode(){
       return workOrderBytItemRefFactCode;
    }

    public void setKindRefCode(int aValue){
       kindRefCode = aValue;
    }
    public int getKindRefCode(){
       return kindRefCode;
    }

    public void setKindRefName(String aValue){
       kindRefName = aValue;
    }
    public String getKindRefName(){
       return kindRefName;
    }



}