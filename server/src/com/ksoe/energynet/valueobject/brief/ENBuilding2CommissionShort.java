
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENBuilding2Commission;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENBuilding2CommissionShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String tabNumber;
	public String FIO;
	public String shortFIO;
	public String positionName;
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
	public int ENBuildingCommissionTypeRefCode = Integer.MIN_VALUE;
	public String ENBuildingCommissionTypeRefName;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getTabNumber() {
		return tabNumber;
	}

	public void setTabNumber(String tabNumber) {
		this.tabNumber = tabNumber;
	}

	public String getFIO() {
		return FIO;
	}

	public void setFIO(String FIO) {
		this.FIO = FIO;
	}

	public String getShortFIO() {
		return shortFIO;
	}

	public void setShortFIO(String shortFIO) {
		this.shortFIO = shortFIO;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
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

	public int getENBuildingCommissionTypeRefCode(){
		return ENBuildingCommissionTypeRefCode;
	}

	public void setENBuildingCommissionTypeRefCode(int ENBuildingCommissionTypeRefCode) {
		this.ENBuildingCommissionTypeRefCode = ENBuildingCommissionTypeRefCode;
	}

	public String getENBuildingCommissionTypeRefName(){
		return ENBuildingCommissionTypeRefName;
	}

	public void setENBuildingCommissionTypeRefName(String ENBuildingCommissionTypeRefName) {
		this.ENBuildingCommissionTypeRefName = ENBuildingCommissionTypeRefName;
	}



}
