
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENBuilding2ENact;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENBuilding2ENactShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public BigDecimal sumGen;
	public BigDecimal sumNds;
	public int isCalculationDate = Integer.MIN_VALUE;
	public String finContractNumber;
	public Date finContractDate ;
	public String partnerName;
	public String partnerCode;
	public Boolean isActFromEnergyNET ;
	public String actNumber;
	public Date actDate ;
	public int actRefCode = Integer.MIN_VALUE;
	public String actRefNumberGen;
	public Date actRefDateGen;
	public String actRefFinMolCode;
	public String actRefFinMolName;
	public String actRefFinMechanicName;
	public String actRefInvNumber;
	public String actRefUserGen;
	public Date actRefDateEdit;
	public Date actRefDateAct;
	public String actRefMolCodeObject;
	public Boolean actRefCheckedByAccountant;
	public int ENBuildingRefCode = Integer.MIN_VALUE;
	public String ENBuildingRefNumbergen;
	public Date ENBuildingRefDateGen;
	public Date ENBuildingRefDateEdit;
	public BigDecimal ENBuildingRefSummaGen;
	public BigDecimal ENBuildingRefSummaNDS;
	public String ENBuildingRefCharacteristic;
	public String ENBuildingRefExecutedPosition;
	public String ENBuildingRefExecutedName;
	public String ENBuildingRefAcceptedPosition;
	public String ENBuildingRefAcceptedName;
	public BigDecimal ENBuildingRefContractPrice;
	public String ENBuildingRefCodeMol;
	public String ENBuildingRefCodePodr;
	public String ENBuildingRefInvNumberOZ;
	public String ENBuildingRefNameOZ;
	public String ENBuildingRefFinContractNumber;
	public Date ENBuildingRefFinContractDate;
	public String ENBuildingRefPartnerName;
	public String ENBuildingRefPartnerCode;
	public int ENBuildingRefIsInvestProgram = Integer.MIN_VALUE;
	public String ENBuildingRefYearInvestProgram;
	public String ENBuildingRefItemInvestProgram;
	public String ENBuildingRefBuildingAddress;
	public String ENBuildingRefDecreeNumber;
	public Date ENBuildingRefDecreeDate;
	public int ENBuildingRefExploitationTerm = Integer.MIN_VALUE;
	public Date ENBuildingRefDateLoadExpl;
	public Date ENBuildingRefDateBuild;
	public String ENBuildingRefUserGen;
	public int ENBuilding2ActTypeWorkRefCode = Integer.MIN_VALUE;
	public String ENBuilding2ActTypeWorkRefName;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public BigDecimal getSumGen() {
		return sumGen;
	}

	public void setSumGen(BigDecimal sumGen) {
		this.sumGen = sumGen;
	}

	public BigDecimal getSumNds() {
		return sumNds;
	}

	public void setSumNds(BigDecimal sumNds) {
		this.sumNds = sumNds;
	}

	public int getIsCalculationDate() {
		return isCalculationDate;
	}

	public void setIsCalculationDate(int isCalculationDate) {
		this.isCalculationDate = isCalculationDate;
	}

	public String getFinContractNumber() {
		return finContractNumber;
	}

	public void setFinContractNumber(String finContractNumber) {
		this.finContractNumber = finContractNumber;
	}

	public Date getFinContractDate() {
		return finContractDate;
	}

	public void setFinContractDate(Date finContractDate) {
		this.finContractDate = finContractDate;
	}

	public String getPartnerName() {
		return partnerName;
	}

	public void setPartnerName(String partnerName) {
		this.partnerName = partnerName;
	}

	public String getPartnerCode() {
		return partnerCode;
	}

	public void setPartnerCode(String partnerCode) {
		this.partnerCode = partnerCode;
	}

	public Boolean getIsActFromEnergyNET() {
		return isActFromEnergyNET;
	}

	public void setIsActFromEnergyNET(Boolean isActFromEnergyNET) {
		this.isActFromEnergyNET = isActFromEnergyNET;
	}

	public String getActNumber() {
		return actNumber;
	}

	public void setActNumber(String actNumber) {
		this.actNumber = actNumber;
	}

	public Date getActDate() {
		return actDate;
	}

	public void setActDate(Date actDate) {
		this.actDate = actDate;
	}


	public int getActRefCode(){
		return actRefCode;
	}

	public void setActRefCode(int actRefCode) {
		this.actRefCode = actRefCode;
	}

	public String getActRefNumberGen(){
		return actRefNumberGen;
	}

	public void setActRefNumberGen(String actRefNumberGen) {
		this.actRefNumberGen = actRefNumberGen;
	}

	public Date getActRefDateGen(){
		return actRefDateGen;
	}

	public void setActRefDateGen(Date actRefDateGen) {
		this.actRefDateGen = actRefDateGen;
	}

	public String getActRefFinMolCode(){
		return actRefFinMolCode;
	}

	public void setActRefFinMolCode(String actRefFinMolCode) {
		this.actRefFinMolCode = actRefFinMolCode;
	}

	public String getActRefFinMolName(){
		return actRefFinMolName;
	}

	public void setActRefFinMolName(String actRefFinMolName) {
		this.actRefFinMolName = actRefFinMolName;
	}

	public String getActRefFinMechanicName(){
		return actRefFinMechanicName;
	}

	public void setActRefFinMechanicName(String actRefFinMechanicName) {
		this.actRefFinMechanicName = actRefFinMechanicName;
	}

	public String getActRefInvNumber(){
		return actRefInvNumber;
	}

	public void setActRefInvNumber(String actRefInvNumber) {
		this.actRefInvNumber = actRefInvNumber;
	}

	public String getActRefUserGen(){
		return actRefUserGen;
	}

	public void setActRefUserGen(String actRefUserGen) {
		this.actRefUserGen = actRefUserGen;
	}

	public Date getActRefDateEdit(){
		return actRefDateEdit;
	}

	public void setActRefDateEdit(Date actRefDateEdit) {
		this.actRefDateEdit = actRefDateEdit;
	}

	public Date getActRefDateAct(){
		return actRefDateAct;
	}

	public void setActRefDateAct(Date actRefDateAct) {
		this.actRefDateAct = actRefDateAct;
	}

	public String getActRefMolCodeObject(){
		return actRefMolCodeObject;
	}

	public void setActRefMolCodeObject(String actRefMolCodeObject) {
		this.actRefMolCodeObject = actRefMolCodeObject;
	}

	public Boolean getActRefCheckedByAccountant(){
		return actRefCheckedByAccountant;
	}

	public void setActRefCheckedByAccountant(Boolean actRefCheckedByAccountant) {
		this.actRefCheckedByAccountant = actRefCheckedByAccountant;
	}

	public int getENBuildingRefCode(){
		return ENBuildingRefCode;
	}

	public void setENBuildingRefCode(int ENBuildingRefCode) {
		this.ENBuildingRefCode = ENBuildingRefCode;
	}

	public String getENBuildingRefNumbergen(){
		return ENBuildingRefNumbergen;
	}

	public void setENBuildingRefNumbergen(String ENBuildingRefNumbergen) {
		this.ENBuildingRefNumbergen = ENBuildingRefNumbergen;
	}

	public Date getENBuildingRefDateGen(){
		return ENBuildingRefDateGen;
	}

	public void setENBuildingRefDateGen(Date ENBuildingRefDateGen) {
		this.ENBuildingRefDateGen = ENBuildingRefDateGen;
	}

	public Date getENBuildingRefDateEdit(){
		return ENBuildingRefDateEdit;
	}

	public void setENBuildingRefDateEdit(Date ENBuildingRefDateEdit) {
		this.ENBuildingRefDateEdit = ENBuildingRefDateEdit;
	}

	public BigDecimal getENBuildingRefSummaGen(){
		return ENBuildingRefSummaGen;
	}

	public void setENBuildingRefSummaGen(BigDecimal ENBuildingRefSummaGen) {
		this.ENBuildingRefSummaGen = ENBuildingRefSummaGen;
	}

	public BigDecimal getENBuildingRefSummaNDS(){
		return ENBuildingRefSummaNDS;
	}

	public void setENBuildingRefSummaNDS(BigDecimal ENBuildingRefSummaNDS) {
		this.ENBuildingRefSummaNDS = ENBuildingRefSummaNDS;
	}

	public String getENBuildingRefCharacteristic(){
		return ENBuildingRefCharacteristic;
	}

	public void setENBuildingRefCharacteristic(String ENBuildingRefCharacteristic) {
		this.ENBuildingRefCharacteristic = ENBuildingRefCharacteristic;
	}

	public String getENBuildingRefExecutedPosition(){
		return ENBuildingRefExecutedPosition;
	}

	public void setENBuildingRefExecutedPosition(String ENBuildingRefExecutedPosition) {
		this.ENBuildingRefExecutedPosition = ENBuildingRefExecutedPosition;
	}

	public String getENBuildingRefExecutedName(){
		return ENBuildingRefExecutedName;
	}

	public void setENBuildingRefExecutedName(String ENBuildingRefExecutedName) {
		this.ENBuildingRefExecutedName = ENBuildingRefExecutedName;
	}

	public String getENBuildingRefAcceptedPosition(){
		return ENBuildingRefAcceptedPosition;
	}

	public void setENBuildingRefAcceptedPosition(String ENBuildingRefAcceptedPosition) {
		this.ENBuildingRefAcceptedPosition = ENBuildingRefAcceptedPosition;
	}

	public String getENBuildingRefAcceptedName(){
		return ENBuildingRefAcceptedName;
	}

	public void setENBuildingRefAcceptedName(String ENBuildingRefAcceptedName) {
		this.ENBuildingRefAcceptedName = ENBuildingRefAcceptedName;
	}

	public BigDecimal getENBuildingRefContractPrice(){
		return ENBuildingRefContractPrice;
	}

	public void setENBuildingRefContractPrice(BigDecimal ENBuildingRefContractPrice) {
		this.ENBuildingRefContractPrice = ENBuildingRefContractPrice;
	}

	public String getENBuildingRefCodeMol(){
		return ENBuildingRefCodeMol;
	}

	public void setENBuildingRefCodeMol(String ENBuildingRefCodeMol) {
		this.ENBuildingRefCodeMol = ENBuildingRefCodeMol;
	}

	public String getENBuildingRefCodePodr(){
		return ENBuildingRefCodePodr;
	}

	public void setENBuildingRefCodePodr(String ENBuildingRefCodePodr) {
		this.ENBuildingRefCodePodr = ENBuildingRefCodePodr;
	}

	public String getENBuildingRefInvNumberOZ(){
		return ENBuildingRefInvNumberOZ;
	}

	public void setENBuildingRefInvNumberOZ(String ENBuildingRefInvNumberOZ) {
		this.ENBuildingRefInvNumberOZ = ENBuildingRefInvNumberOZ;
	}

	public String getENBuildingRefNameOZ(){
		return ENBuildingRefNameOZ;
	}

	public void setENBuildingRefNameOZ(String ENBuildingRefNameOZ) {
		this.ENBuildingRefNameOZ = ENBuildingRefNameOZ;
	}

	public String getENBuildingRefFinContractNumber(){
		return ENBuildingRefFinContractNumber;
	}

	public void setENBuildingRefFinContractNumber(String ENBuildingRefFinContractNumber) {
		this.ENBuildingRefFinContractNumber = ENBuildingRefFinContractNumber;
	}

	public Date getENBuildingRefFinContractDate(){
		return ENBuildingRefFinContractDate;
	}

	public void setENBuildingRefFinContractDate(Date ENBuildingRefFinContractDate) {
		this.ENBuildingRefFinContractDate = ENBuildingRefFinContractDate;
	}

	public String getENBuildingRefPartnerName(){
		return ENBuildingRefPartnerName;
	}

	public void setENBuildingRefPartnerName(String ENBuildingRefPartnerName) {
		this.ENBuildingRefPartnerName = ENBuildingRefPartnerName;
	}

	public String getENBuildingRefPartnerCode(){
		return ENBuildingRefPartnerCode;
	}

	public void setENBuildingRefPartnerCode(String ENBuildingRefPartnerCode) {
		this.ENBuildingRefPartnerCode = ENBuildingRefPartnerCode;
	}

	public int getENBuildingRefIsInvestProgram(){
		return ENBuildingRefIsInvestProgram;
	}

	public void setENBuildingRefIsInvestProgram(int ENBuildingRefIsInvestProgram) {
		this.ENBuildingRefIsInvestProgram = ENBuildingRefIsInvestProgram;
	}

	public String getENBuildingRefYearInvestProgram(){
		return ENBuildingRefYearInvestProgram;
	}

	public void setENBuildingRefYearInvestProgram(String ENBuildingRefYearInvestProgram) {
		this.ENBuildingRefYearInvestProgram = ENBuildingRefYearInvestProgram;
	}

	public String getENBuildingRefItemInvestProgram(){
		return ENBuildingRefItemInvestProgram;
	}

	public void setENBuildingRefItemInvestProgram(String ENBuildingRefItemInvestProgram) {
		this.ENBuildingRefItemInvestProgram = ENBuildingRefItemInvestProgram;
	}

	public String getENBuildingRefBuildingAddress(){
		return ENBuildingRefBuildingAddress;
	}

	public void setENBuildingRefBuildingAddress(String ENBuildingRefBuildingAddress) {
		this.ENBuildingRefBuildingAddress = ENBuildingRefBuildingAddress;
	}

	public String getENBuildingRefDecreeNumber(){
		return ENBuildingRefDecreeNumber;
	}

	public void setENBuildingRefDecreeNumber(String ENBuildingRefDecreeNumber) {
		this.ENBuildingRefDecreeNumber = ENBuildingRefDecreeNumber;
	}

	public Date getENBuildingRefDecreeDate(){
		return ENBuildingRefDecreeDate;
	}

	public void setENBuildingRefDecreeDate(Date ENBuildingRefDecreeDate) {
		this.ENBuildingRefDecreeDate = ENBuildingRefDecreeDate;
	}

	public int getENBuildingRefExploitationTerm(){
		return ENBuildingRefExploitationTerm;
	}

	public void setENBuildingRefExploitationTerm(int ENBuildingRefExploitationTerm) {
		this.ENBuildingRefExploitationTerm = ENBuildingRefExploitationTerm;
	}

	public Date getENBuildingRefDateLoadExpl(){
		return ENBuildingRefDateLoadExpl;
	}

	public void setENBuildingRefDateLoadExpl(Date ENBuildingRefDateLoadExpl) {
		this.ENBuildingRefDateLoadExpl = ENBuildingRefDateLoadExpl;
	}

	public Date getENBuildingRefDateBuild(){
		return ENBuildingRefDateBuild;
	}

	public void setENBuildingRefDateBuild(Date ENBuildingRefDateBuild) {
		this.ENBuildingRefDateBuild = ENBuildingRefDateBuild;
	}

	public String getENBuildingRefUserGen(){
		return ENBuildingRefUserGen;
	}

	public void setENBuildingRefUserGen(String ENBuildingRefUserGen) {
		this.ENBuildingRefUserGen = ENBuildingRefUserGen;
	}

	public int getENBuilding2ActTypeWorkRefCode(){
		return ENBuilding2ActTypeWorkRefCode;
	}

	public void setENBuilding2ActTypeWorkRefCode(int ENBuilding2ActTypeWorkRefCode) {
		this.ENBuilding2ActTypeWorkRefCode = ENBuilding2ActTypeWorkRefCode;
	}

	public String getENBuilding2ActTypeWorkRefName(){
		return ENBuilding2ActTypeWorkRefName;
	}

	public void setENBuilding2ActTypeWorkRefName(String ENBuilding2ActTypeWorkRefName) {
		this.ENBuilding2ActTypeWorkRefName = ENBuilding2ActTypeWorkRefName;
	}



}
