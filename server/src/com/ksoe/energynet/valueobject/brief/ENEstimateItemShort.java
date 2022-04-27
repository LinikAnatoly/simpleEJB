
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENEstimateItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENEstimateItemShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public BigDecimal countGen;
	public BigDecimal countFact;
	public BigDecimal price;
	public BigDecimal priceVRTU;
	public BigDecimal cost;
	public int isUseVAT = Integer.MIN_VALUE;
	public int deliveryTime = Integer.MIN_VALUE;
	public String userGen;
	public Date dateEdit ;
	public int planRefCode = Integer.MIN_VALUE;
	public Date planRefDateGen;
	public Date planRefDateStart;
	public Date planRefDateFinal;
	public int planRefYearGen = Integer.MIN_VALUE;
	public int planRefMonthGen = Integer.MIN_VALUE;
	public int planRefYearOriginal = Integer.MIN_VALUE;
	public int planRefMonthOriginal = Integer.MIN_VALUE;
	public String planType;
	public String planState;

	public String invNumber;
	public String elementName;
	public int ecode;

	public String planRefUserGen;
	public Date planRefDateEdit;
	public String planRefWorkOrderNumber;
	public Date planRefDateWorkOrder;
	public String planRefPriConnectionNumber;
	public Date planRefDateEndPriConnection;
	public String planRefInvestWorksDescription;
	public int planRefServicesFSideFinId = Integer.MIN_VALUE;
	public String planRefServicesFSideCnNum;
	public BigDecimal planRefTotalTimeHours;
	public BigDecimal planRefTotalTimeDays;
	public String planRefInvestItemNumber;
	public int planItemRefCode = Integer.MIN_VALUE;
	public BigDecimal planItemRefCountGen;
	public BigDecimal planItemRefTimeGen;
	public BigDecimal planItemRefCostGen;
	public String planItemRefUserGen;
	public Date planItemRefDateEdit;
	public int materialRefCode = Integer.MIN_VALUE;
	public String materialRefName;
	public BigDecimal materialRefCost;
	public int materialRefDeliveryDate = Integer.MIN_VALUE;
	public String materialRefNumkatalog;
	public String materialRefIdentid;
	public int typeRefCode = Integer.MIN_VALUE;
	public String typeRefName;
	public String measureType;

	public int kartaRefCode = Integer.MIN_VALUE;
	public String kartaRefName;
	public String kartaNum;

	public int kindRefCode = Integer.MIN_VALUE;
	public String kindRefName;
	public int statusRefCode = Integer.MIN_VALUE;
	public String statusRefName;
	public int oldStatusRefCode = Integer.MIN_VALUE;
	public String oldStatusRefName;
	public int countFINMaterials = Integer.MIN_VALUE;
	public int planRefDepartmentCode = Integer.MIN_VALUE;
	public String planRefDepartmentName;
	public int planRefStatusCode = Integer.MIN_VALUE;

	public int useWorkTime = Integer.MIN_VALUE;
	public String useWorkTimeName;

	public int accountingTypeRefCode = Integer.MIN_VALUE;
	public String accountingTypeRefName;
	public int ddsCodeAvz = Integer.MIN_VALUE;
	public int budgetRefCode = Integer.MIN_VALUE;
	public BigDecimal quantityFINMaterials;
	public int purchaseItemRefCode = Integer.MIN_VALUE;

	public String purchaseItemRefMaterialNameGen;
	public String purchaseItemRefMeasurementNameGen;
	public String purchaseItemRefIdentid2010;
	public String purchaseItemRefIdentid2015;
	public BigDecimal purchaseItemRefCountGen;
	public BigDecimal purchaseItemRefCountPurchase;
	public BigDecimal purchaseItemRefPriceGenWithoutNds;
	public BigDecimal purchaseItemRefPriceGenWithNds;
	public BigDecimal purchaseItemRefSumGenWithoutNds;
	public BigDecimal purchaseItemRefSumGenWithNds;
	public BigDecimal purchaseItemRefPricePurchaseWithoutNds;
	public BigDecimal purchaseItemRefPricePurchaseWithNds;
	public BigDecimal purchaseItemRefSumPurchaseWithoutNds;
	public BigDecimal purchaseItemRefSumPurchaseWithNds;
	public String purchaseItemRefCommentGen;
	public String purchaseItemRefObjectsCodes;
	public String purchaseItemRefObjectsName;
	public String purchaseItemRefUserGen;
	public BigDecimal purchaseItemRefCountFree;

	// ///
	public String orderNumber;
	public Date orderPeriod;

	public String orgName;
	public String contractNumber;
	public Date contractDate;
	public String finDocCode;
	public int finDocID = Integer.MIN_VALUE;
	
	public int enContractCode = Integer.MIN_VALUE;
	
	public int purchaseItem2EstimateitemCode = Integer.MIN_VALUE;
	
	public String purchaseInfoByOrderItem;
	
	public String getPurchaseInfoByOrderItem() {
		return purchaseInfoByOrderItem;
	}

	public void setPurchaseInfoByOrderItem(String purchaseInfoByOrderItem) {
		this.purchaseInfoByOrderItem = purchaseInfoByOrderItem;
	}

	public String getIdentid2010() {
		return identid2010;
	}

	public void setIdentid2010(String identid2010) {
		this.identid2010 = identid2010;
	}

	public String getIdentid2015() {
		return identid2015;
	}

	public void setIdentid2015(String identid2015) {
		this.identid2015 = identid2015;
	}

	public String identid2010;
	public String identid2015;

	// ///

	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setCountGen(BigDecimal aValue){
		countGen = aValue;
	}

	public BigDecimal getCountGen(){
		return countGen;
	}

	public void setCountFact(BigDecimal aValue){
		countFact = aValue;
	}

	public BigDecimal getCountFact(){
		return countFact;
	}

	public void setPrice(BigDecimal aValue){
		price = aValue;
	}

	public BigDecimal getPrice(){
		return price;
	}

	public void setPriceVRTU(BigDecimal aValue){
		priceVRTU = aValue;
	}

	public BigDecimal getPriceVRTU(){
		return priceVRTU;
	}

	public void setCost(BigDecimal aValue){
		cost = aValue;
	}

	public BigDecimal getCost(){
		return cost;
	}

	public void setIsUseVAT(int aValue){
		isUseVAT = aValue;
	}

	public int getIsUseVAT(){
		return isUseVAT;
	}

	public void setDeliveryTime(int aValue){
		deliveryTime = aValue;
	}

	public int getDeliveryTime(){
		return deliveryTime;
	}

	public void setUseWorkTime(int aValue){
		useWorkTime = aValue;
	}

	public int getUseWorkTime(){
		return useWorkTime;
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



	public void setPlanRefCode(int aValue){
		planRefCode = aValue;
	}
	public int getPlanRefCode(){
		return planRefCode;
	}

	public void setPlanRefDateGen(Date aValue){
		planRefDateGen = aValue;
	}
	public Date getPlanRefDateGen(){
		return planRefDateGen;
	}

	public void setPlanRefDateStart(Date aValue){
		planRefDateStart = aValue;
	}
	public Date getPlanRefDateStart(){
		return planRefDateStart;
	}

	public void setPlanRefDateFinal(Date aValue){
		planRefDateFinal = aValue;
	}
	public Date getPlanRefDateFinal(){
		return planRefDateFinal;
	}

	public void setPlanRefYearGen(int aValue){
		planRefYearGen = aValue;
	}
	public int getPlanRefYearGen(){
		return planRefYearGen;
	}

	public void setPlanRefMonthGen(int aValue){
		planRefMonthGen = aValue;
	}
	public int getPlanRefMonthGen(){
		return planRefMonthGen;
	}

	public void setPlanRefYearOriginal(int aValue){
		planRefYearOriginal = aValue;
	}
	public int getPlanRefYearOriginal(){
		return planRefYearOriginal;
	}

	public void setPlanRefMonthOriginal(int aValue){
		planRefMonthOriginal = aValue;
	}
	public int getPlanRefMonthOriginal(){
		return planRefMonthOriginal;
	}

	public void setPlanRefUserGen(String aValue){
		planRefUserGen = aValue;
	}
	public String getPlanRefUserGen(){
		return planRefUserGen;
	}

	public void setPlanRefDateEdit(Date aValue){
		planRefDateEdit = aValue;
	}
	public Date getPlanRefDateEdit(){
		return planRefDateEdit;
	}

	public void setPlanRefWorkOrderNumber(String aValue){
		planRefWorkOrderNumber = aValue;
	}
	public String getPlanRefWorkOrderNumber(){
		return planRefWorkOrderNumber;
	}

	public void setPlanRefDateWorkOrder(Date aValue){
		planRefDateWorkOrder = aValue;
	}
	public Date getPlanRefDateWorkOrder(){
		return planRefDateWorkOrder;
	}

	public void setPlanRefPriConnectionNumber(String aValue){
		planRefPriConnectionNumber = aValue;
	}
	public String getPlanRefPriConnectionNumber(){
		return planRefPriConnectionNumber;
	}

	public void setPlanRefDateEndPriConnection(Date aValue){
		planRefDateEndPriConnection = aValue;
	}
	public Date getPlanRefDateEndPriConnection(){
		return planRefDateEndPriConnection;
	}

	public void setPlanRefInvestWorksDescription(String aValue){
		planRefInvestWorksDescription = aValue;
	}
	public String getPlanRefInvestWorksDescription(){
		return planRefInvestWorksDescription;
	}

	public void setPlanRefServicesFSideFinId(int aValue){
		planRefServicesFSideFinId = aValue;
	}
	public int getPlanRefServicesFSideFinId(){
		return planRefServicesFSideFinId;
	}

	public void setPlanRefServicesFSideCnNum(String aValue){
		planRefServicesFSideCnNum = aValue;
	}
	public String getPlanRefServicesFSideCnNum(){
		return planRefServicesFSideCnNum;
	}

	public void setPlanRefTotalTimeHours(BigDecimal aValue){
		planRefTotalTimeHours = aValue;
	}
	public BigDecimal getPlanRefTotalTimeHours(){
		return planRefTotalTimeHours;
	}

	public void setPlanRefTotalTimeDays(BigDecimal aValue){
		planRefTotalTimeDays = aValue;
	}
	public BigDecimal getPlanRefTotalTimeDays(){
		return planRefTotalTimeDays;
	}

	public void setPlanRefInvestItemNumber(String aValue){
		planRefInvestItemNumber = aValue;
	}
	public String getPlanRefInvestItemNumber(){
		return planRefInvestItemNumber;
	}

	public void setPlanItemRefCode(int aValue){
		planItemRefCode = aValue;
	}
	public int getPlanItemRefCode(){
		return planItemRefCode;
	}

	public void setPlanItemRefCountGen(BigDecimal aValue){
		planItemRefCountGen = aValue;
	}
	public BigDecimal getPlanItemRefCountGen(){
		return planItemRefCountGen;
	}

	public void setPlanItemRefTimeGen(BigDecimal aValue){
		planItemRefTimeGen = aValue;
	}
	public BigDecimal getPlanItemRefTimeGen(){
		return planItemRefTimeGen;
	}

	public void setPlanItemRefCostGen(BigDecimal aValue){
		planItemRefCostGen = aValue;
	}
	public BigDecimal getPlanItemRefCostGen(){
		return planItemRefCostGen;
	}

	public void setPlanItemRefUserGen(String aValue){
		planItemRefUserGen = aValue;
	}
	public String getPlanItemRefUserGen(){
		return planItemRefUserGen;
	}

	public void setPlanItemRefDateEdit(Date aValue){
		planItemRefDateEdit = aValue;
	}
	public Date getPlanItemRefDateEdit(){
		return planItemRefDateEdit;
	}

	public void setMaterialRefCode(int aValue){
		materialRefCode = aValue;
	}
	public int getMaterialRefCode(){
		return materialRefCode;
	}

	public void setMaterialRefName(String aValue){
		materialRefName = aValue;
	}
	public String getMaterialRefName(){
		return materialRefName;
	}

	public void setMaterialRefCost(BigDecimal aValue){
		materialRefCost = aValue;
	}
	public BigDecimal getMaterialRefCost(){
		return materialRefCost;
	}

	public void setMaterialRefDeliveryDate(int aValue){
		materialRefDeliveryDate = aValue;
	}
	public int getMaterialRefDeliveryDate(){
		return materialRefDeliveryDate;
	}

	public void setMaterialRefNumkatalog(String aValue){
		materialRefNumkatalog = aValue;
	}
	public String getMaterialRefNumkatalog(){
		return materialRefNumkatalog;
	}

	public void setMaterialRefIdentid(String aValue){
		materialRefIdentid = aValue;
	}
	public String getMaterialRefIdentid(){
		return materialRefIdentid;
	}

	public void setTypeRefCode(int aValue){
		typeRefCode = aValue;
	}
	public int getTypeRefCode(){
		return typeRefCode;
	}

	public void setTypeRefName(String aValue){
		typeRefName = aValue;
	}
	public String getTypeRefName(){
		return typeRefName;
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

	public void setStatusRefCode(int aValue){
		statusRefCode = aValue;
	}
	public int getStatusRefCode(){
		return statusRefCode;
	}

	public void setStatusRefName(String aValue){
		statusRefName = aValue;
	}
	public String getStatusRefName(){
		return statusRefName;
	}

	public void setOldStatusRefCode(int aValue){
		oldStatusRefCode = aValue;
	}
	public int getOldStatusRefCode(){
		return oldStatusRefCode;
	}

	public void setOldStatusRefName(String aValue){
		oldStatusRefName = aValue;
	}
	public String getOldStatusRefName(){
		return oldStatusRefName;
	}

	public void setAccountingTypeRefCode(int aValue){
		accountingTypeRefCode = aValue;
	}
	public int getAccountingTypeRefCode(){
		return accountingTypeRefCode;
	}

	public void setAccountingTypeRefName(String aValue){
		accountingTypeRefName = aValue;
	}
	public String getAccountingTypeRefName(){
		return accountingTypeRefName;
	}

	public void setPurchaseItemRefCode(int aValue){
		purchaseItemRefCode = aValue;
	}
	public int getPurchaseItemRefCode(){
		return purchaseItemRefCode;
	}

	public void setPurchaseItemRefMaterialNameGen(String aValue){
		purchaseItemRefMaterialNameGen = aValue;
	}
	public String getPurchaseItemRefMaterialNameGen(){
		return purchaseItemRefMaterialNameGen;
	}

	public void setPurchaseItemRefMeasurementNameGen(String aValue){
		purchaseItemRefMeasurementNameGen = aValue;
	}
	public String getPurchaseItemRefMeasurementNameGen(){
		return purchaseItemRefMeasurementNameGen;
	}

	public void setPurchaseItemRefIdentid2010(String aValue){
		purchaseItemRefIdentid2010 = aValue;
	}
	public String getPurchaseItemRefIdentid2010(){
		return purchaseItemRefIdentid2010;
	}

	public void setPurchaseItemRefIdentid2015(String aValue){
		purchaseItemRefIdentid2015 = aValue;
	}
	public String getPurchaseItemRefIdentid2015(){
		return purchaseItemRefIdentid2015;
	}

	public void setPurchaseItemRefCountGen(BigDecimal aValue){
		purchaseItemRefCountGen = aValue;
	}
	public BigDecimal getPurchaseItemRefCountGen(){
		return purchaseItemRefCountGen;
	}

	public void setPurchaseItemRefCountPurchase(BigDecimal aValue){
		purchaseItemRefCountPurchase = aValue;
	}
	public BigDecimal getPurchaseItemRefCountPurchase(){
		return purchaseItemRefCountPurchase;
	}

	public void setPurchaseItemRefPriceGenWithoutNds(BigDecimal aValue){
		purchaseItemRefPriceGenWithoutNds = aValue;
	}
	public BigDecimal getPurchaseItemRefPriceGenWithoutNds(){
		return purchaseItemRefPriceGenWithoutNds;
	}

	public void setPurchaseItemRefPriceGenWithNds(BigDecimal aValue){
		purchaseItemRefPriceGenWithNds = aValue;
	}
	public BigDecimal getPurchaseItemRefPriceGenWithNds(){
		return purchaseItemRefPriceGenWithNds;
	}

	public void setPurchaseItemRefSumGenWithoutNds(BigDecimal aValue){
		purchaseItemRefSumGenWithoutNds = aValue;
	}
	public BigDecimal getPurchaseItemRefSumGenWithoutNds(){
		return purchaseItemRefSumGenWithoutNds;
	}

	public void setPurchaseItemRefSumGenWithNds(BigDecimal aValue){
		purchaseItemRefSumGenWithNds = aValue;
	}
	public BigDecimal getPurchaseItemRefSumGenWithNds(){
		return purchaseItemRefSumGenWithNds;
	}

	public void setPurchaseItemRefPricePurchaseWithoutNds(BigDecimal aValue){
		purchaseItemRefPricePurchaseWithoutNds = aValue;
	}
	public BigDecimal getPurchaseItemRefPricePurchaseWithoutNds(){
		return purchaseItemRefPricePurchaseWithoutNds;
	}

	public void setPurchaseItemRefPricePurchaseWithNds(BigDecimal aValue){
		purchaseItemRefPricePurchaseWithNds = aValue;
	}
	public BigDecimal getPurchaseItemRefPricePurchaseWithNds(){
		return purchaseItemRefPricePurchaseWithNds;
	}

	public void setPurchaseItemRefSumPurchaseWithoutNds(BigDecimal aValue){
		purchaseItemRefSumPurchaseWithoutNds = aValue;
	}
	public BigDecimal getPurchaseItemRefSumPurchaseWithoutNds(){
		return purchaseItemRefSumPurchaseWithoutNds;
	}

	public void setPurchaseItemRefSumPurchaseWithNds(BigDecimal aValue){
		purchaseItemRefSumPurchaseWithNds = aValue;
	}
	public BigDecimal getPurchaseItemRefSumPurchaseWithNds(){
		return purchaseItemRefSumPurchaseWithNds;
	}

	public void setPurchaseItemRefCommentGen(String aValue){
		purchaseItemRefCommentGen = aValue;
	}
	public String getPurchaseItemRefCommentGen(){
		return purchaseItemRefCommentGen;
	}

	public void setPurchaseItemRefObjectsCodes(String aValue){
		purchaseItemRefObjectsCodes = aValue;
	}
	public String getPurchaseItemRefObjectsCodes(){
		return purchaseItemRefObjectsCodes;
	}

	public void setPurchaseItemRefObjectsName(String aValue){
		purchaseItemRefObjectsName = aValue;
	}
	public String getPurchaseItemRefObjectsName(){
		return purchaseItemRefObjectsName;
	}

	public void setPurchaseItemRefUserGen(String aValue){
		purchaseItemRefUserGen = aValue;
	}
	public String getPurchaseItemRefUserGen(){
		return purchaseItemRefUserGen;
	}

	public void setPurchaseItemRefCountFree(BigDecimal aValue){
		purchaseItemRefCountFree = aValue;
	}
	public BigDecimal getPurchaseItemRefCountFree(){
		return purchaseItemRefCountFree;
	}

	public String getPlanType() {
		return planType;
	}

	public void setPlanType(String planType) {
		this.planType = planType;
	}

	public String getPlanState() {
		return planState;
	}

	public void setPlanState(String planState) {
		this.planState = planState;
	}

	public String getInvNumber() {
		return invNumber;
	}

	public void setInvNumber(String invNumber) {
		this.invNumber = invNumber;
	}

	public String getElementName() {
		return elementName;
	}

	public void setElementName(String elementName) {
		this.elementName = elementName;
	}

	public int getEcode() {
		return ecode;
	}

	public void setEcode(int ecode) {
		this.ecode = ecode;
	}

	public String getMeasureType() {
		return measureType;
	}

	public void setMeasureType(String measureType) {
		this.measureType = measureType;
	}

	public int getKartaRefCode() {
		return kartaRefCode;
	}

	public void setKartaRefCode(int kartaRefCode) {
		this.kartaRefCode = kartaRefCode;
	}

	public String getKartaRefName() {
		return kartaRefName;
	}

	public void setKartaRefName(String kartaRefName) {
		this.kartaRefName = kartaRefName;
	}

	public String getKartaNum() {
		return kartaNum;
	}

	public void setKartaNum(String kartaNum) {
		this.kartaNum = kartaNum;
	}

	public int getCountFINMaterials() {
		return countFINMaterials;
	}

	public void setCountFINMaterials(int countFINMaterials) {
		this.countFINMaterials = countFINMaterials;
	}

	public int getPlanRefDepartmentCode() {
		return planRefDepartmentCode;
	}

	public void setPlanRefDepartmentCode(int planRefDepartmentCode) {
		this.planRefDepartmentCode = planRefDepartmentCode;
	}

	public String getPlanRefDepartmentName() {
		return planRefDepartmentName;
	}

	public void setPlanRefDepartmentName(String planRefDepartmentName) {
		this.planRefDepartmentName = planRefDepartmentName;
	}

	public int getPlanRefStatusCode() {
		return planRefStatusCode;
	}

	public void setPlanRefStatusCode(int planRefStatusCode) {
		this.planRefStatusCode = planRefStatusCode;
	}

	public String getUseWorkTimeName() {
		return useWorkTimeName;
	}

	public void setUseWorkTimeName(String useWorkTimeName) {
		this.useWorkTimeName = useWorkTimeName;
	}

	public int getDdsCodeAvz() {
		return ddsCodeAvz;
	}

	public void setDdsCodeAvz(int ddsCodeAvz) {
		this.ddsCodeAvz = ddsCodeAvz;
	}

	public int getBudgetRefCode() {
		return budgetRefCode;
	}

	public void setBudgetRefCode(int budgetRefCode) {
		this.budgetRefCode = budgetRefCode;
	}

	public BigDecimal getQuantityFINMaterials() {
		return quantityFINMaterials;
	}

	public void setQuantityFINMaterials(BigDecimal quantityFINMaterials) {
		this.quantityFINMaterials = quantityFINMaterials;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public Date getOrderPeriod() {
		return orderPeriod;
	}

	public void setOrderPeriod(Date orderPeriod) {
		this.orderPeriod = orderPeriod;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getContractNumber() {
		return contractNumber;
	}

	public void setContractNumber(String contractNumber) {
		this.contractNumber = contractNumber;
	}

	public Date getContractDate() {
		return contractDate;
	}

	public void setContractDate(Date contractDate) {
		this.contractDate = contractDate;
	}

	public String getFinDocCode() {
		return finDocCode;
	}

	public void setFinDocCode(String finDocCode) {
		this.finDocCode = finDocCode;
	}

	public int getFinDocID() {
		return finDocID;
	}

	public void setFinDocID(int finDocID) {
		this.finDocID = finDocID;
	}

	public int getEnContractCode() {
		return enContractCode;
	}

	public void setEnContractCode(int enContractCode) {
		this.enContractCode = enContractCode;
	}

	public int getPurchaseItem2EstimateitemCode() {
		return purchaseItem2EstimateitemCode;
	}

	public void setPurchaseItem2EstimateitemCode(int purchaseItem2EstimateitemCode) {
		this.purchaseItem2EstimateitemCode = purchaseItem2EstimateitemCode;
	}

}