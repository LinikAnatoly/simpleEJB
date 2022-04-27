
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENReconstrModernOZ2DFDoc;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENReconstrModernOZ2DFDocShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public int dfDocCode = Integer.MIN_VALUE;
	public int dfDocTypeCode = Integer.MIN_VALUE;
	public int dfDocSubtypeCode = Integer.MIN_VALUE;
	public String dfDocNumber;
	public Date dfDocDate ;
	public String dfDocDescription;
	public String commentgen;
	public String userAdd;
	public Date dateAdd ;
	public String userGen;
	public Date dateEdit ;
	public int enReconstrModernOzRefCode = Integer.MIN_VALUE;
	public String enReconstrModernOzRefNumbergen;
	public Date enReconstrModernOzRefDateGen;
	public Date enReconstrModernOzRefDateEdit;
	public BigDecimal enReconstrModernOzRefSummaGen;
	public BigDecimal enReconstrModernOzRefSummaNDS;
	public String enReconstrModernOzRefCharacteristic;
	public String enReconstrModernOzRefExecutedPosition;
	public String enReconstrModernOzRefExecutedName;
	public String enReconstrModernOzRefAcceptedPosition;
	public String enReconstrModernOzRefAcceptedName;
	public BigDecimal enReconstrModernOzRefContractPrice;
	public String enReconstrModernOzRefCodeMol;
	public String enReconstrModernOzRefCodePodr;
	public String enReconstrModernOzRefInvNumberOZ;
	public String enReconstrModernOzRefNameOZ;
	public String enReconstrModernOzRefFinContractNumber;
	public Date enReconstrModernOzRefFinContractDate;
	public String enReconstrModernOzRefPartnerName;
	public String enReconstrModernOzRefPartnerCode;
	public String enReconstrModernOzRefCharacteristicOS;
	public int enReconstrModernOzRefIsInvestProgram = Integer.MIN_VALUE;
	public String enReconstrModernOzRefYearInvestProgram;
	public String enReconstrModernOzRefItemInvestProgram;
	public int enReconstrModernOzRefTypeRM = Integer.MIN_VALUE;
	public String enReconstrModernOzRefUserGen;
	public int enReconstrModernOzRefTermUseful = Integer.MIN_VALUE;
	public int enReconstrModernOzRefUse_limit_before = Integer.MIN_VALUE;
	public int enReconstrModernOzRefUse_limit_n_before = Integer.MIN_VALUE;
	public Date enReconstrModernOzRefDateExploitationIn;
	public Date enReconstrModernOzRefDateExploitationOut;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getDfDocCode() {
		return dfDocCode;
	}

	public void setDfDocCode(int dfDocCode) {
		this.dfDocCode = dfDocCode;
	}

	public int getDfDocTypeCode() {
		return dfDocTypeCode;
	}

	public void setDfDocTypeCode(int dfDocTypeCode) {
		this.dfDocTypeCode = dfDocTypeCode;
	}

	public int getDfDocSubtypeCode() {
		return dfDocSubtypeCode;
	}

	public void setDfDocSubtypeCode(int dfDocSubtypeCode) {
		this.dfDocSubtypeCode = dfDocSubtypeCode;
	}

	public String getDfDocNumber() {
		return dfDocNumber;
	}

	public void setDfDocNumber(String dfDocNumber) {
		this.dfDocNumber = dfDocNumber;
	}

	public Date getDfDocDate() {
		return dfDocDate;
	}

	public void setDfDocDate(Date dfDocDate) {
		this.dfDocDate = dfDocDate;
	}

	public String getDfDocDescription() {
		return dfDocDescription;
	}

	public void setDfDocDescription(String dfDocDescription) {
		this.dfDocDescription = dfDocDescription;
	}

	public String getCommentgen() {
		return commentgen;
	}

	public void setCommentgen(String commentgen) {
		this.commentgen = commentgen;
	}

	public String getUserAdd() {
		return userAdd;
	}

	public void setUserAdd(String userAdd) {
		this.userAdd = userAdd;
	}

	public Date getDateAdd() {
		return dateAdd;
	}

	public void setDateAdd(Date dateAdd) {
		this.dateAdd = dateAdd;
	}

	public String getUserGen() {
		return userGen;
	}

	public void setUserGen(String userGen) {
		this.userGen = userGen;
	}

	public Date getDateEdit() {
		return dateEdit;
	}

	public void setDateEdit(Date dateEdit) {
		this.dateEdit = dateEdit;
	}



	public int getEnReconstrModernOzRefCode(){
		return enReconstrModernOzRefCode;
	}

	public void setEnReconstrModernOzRefCode(int enReconstrModernOzRefCode) {
		this.enReconstrModernOzRefCode = enReconstrModernOzRefCode;
	}

	public String getEnReconstrModernOzRefNumbergen(){
		return enReconstrModernOzRefNumbergen;
	}

	public void setEnReconstrModernOzRefNumbergen(String enReconstrModernOzRefNumbergen) {
		this.enReconstrModernOzRefNumbergen = enReconstrModernOzRefNumbergen;
	}

	public Date getEnReconstrModernOzRefDateGen(){
		return enReconstrModernOzRefDateGen;
	}

	public void setEnReconstrModernOzRefDateGen(Date enReconstrModernOzRefDateGen) {
		this.enReconstrModernOzRefDateGen = enReconstrModernOzRefDateGen;
	}

	public Date getEnReconstrModernOzRefDateEdit(){
		return enReconstrModernOzRefDateEdit;
	}

	public void setEnReconstrModernOzRefDateEdit(Date enReconstrModernOzRefDateEdit) {
		this.enReconstrModernOzRefDateEdit = enReconstrModernOzRefDateEdit;
	}

	public BigDecimal getEnReconstrModernOzRefSummaGen(){
		return enReconstrModernOzRefSummaGen;
	}

	public void setEnReconstrModernOzRefSummaGen(BigDecimal enReconstrModernOzRefSummaGen) {
		this.enReconstrModernOzRefSummaGen = enReconstrModernOzRefSummaGen;
	}

	public BigDecimal getEnReconstrModernOzRefSummaNDS(){
		return enReconstrModernOzRefSummaNDS;
	}

	public void setEnReconstrModernOzRefSummaNDS(BigDecimal enReconstrModernOzRefSummaNDS) {
		this.enReconstrModernOzRefSummaNDS = enReconstrModernOzRefSummaNDS;
	}

	public String getEnReconstrModernOzRefCharacteristic(){
		return enReconstrModernOzRefCharacteristic;
	}

	public void setEnReconstrModernOzRefCharacteristic(String enReconstrModernOzRefCharacteristic) {
		this.enReconstrModernOzRefCharacteristic = enReconstrModernOzRefCharacteristic;
	}

	public String getEnReconstrModernOzRefExecutedPosition(){
		return enReconstrModernOzRefExecutedPosition;
	}

	public void setEnReconstrModernOzRefExecutedPosition(String enReconstrModernOzRefExecutedPosition) {
		this.enReconstrModernOzRefExecutedPosition = enReconstrModernOzRefExecutedPosition;
	}

	public String getEnReconstrModernOzRefExecutedName(){
		return enReconstrModernOzRefExecutedName;
	}

	public void setEnReconstrModernOzRefExecutedName(String enReconstrModernOzRefExecutedName) {
		this.enReconstrModernOzRefExecutedName = enReconstrModernOzRefExecutedName;
	}

	public String getEnReconstrModernOzRefAcceptedPosition(){
		return enReconstrModernOzRefAcceptedPosition;
	}

	public void setEnReconstrModernOzRefAcceptedPosition(String enReconstrModernOzRefAcceptedPosition) {
		this.enReconstrModernOzRefAcceptedPosition = enReconstrModernOzRefAcceptedPosition;
	}

	public String getEnReconstrModernOzRefAcceptedName(){
		return enReconstrModernOzRefAcceptedName;
	}

	public void setEnReconstrModernOzRefAcceptedName(String enReconstrModernOzRefAcceptedName) {
		this.enReconstrModernOzRefAcceptedName = enReconstrModernOzRefAcceptedName;
	}

	public BigDecimal getEnReconstrModernOzRefContractPrice(){
		return enReconstrModernOzRefContractPrice;
	}

	public void setEnReconstrModernOzRefContractPrice(BigDecimal enReconstrModernOzRefContractPrice) {
		this.enReconstrModernOzRefContractPrice = enReconstrModernOzRefContractPrice;
	}

	public String getEnReconstrModernOzRefCodeMol(){
		return enReconstrModernOzRefCodeMol;
	}

	public void setEnReconstrModernOzRefCodeMol(String enReconstrModernOzRefCodeMol) {
		this.enReconstrModernOzRefCodeMol = enReconstrModernOzRefCodeMol;
	}

	public String getEnReconstrModernOzRefCodePodr(){
		return enReconstrModernOzRefCodePodr;
	}

	public void setEnReconstrModernOzRefCodePodr(String enReconstrModernOzRefCodePodr) {
		this.enReconstrModernOzRefCodePodr = enReconstrModernOzRefCodePodr;
	}

	public String getEnReconstrModernOzRefInvNumberOZ(){
		return enReconstrModernOzRefInvNumberOZ;
	}

	public void setEnReconstrModernOzRefInvNumberOZ(String enReconstrModernOzRefInvNumberOZ) {
		this.enReconstrModernOzRefInvNumberOZ = enReconstrModernOzRefInvNumberOZ;
	}

	public String getEnReconstrModernOzRefNameOZ(){
		return enReconstrModernOzRefNameOZ;
	}

	public void setEnReconstrModernOzRefNameOZ(String enReconstrModernOzRefNameOZ) {
		this.enReconstrModernOzRefNameOZ = enReconstrModernOzRefNameOZ;
	}

	public String getEnReconstrModernOzRefFinContractNumber(){
		return enReconstrModernOzRefFinContractNumber;
	}

	public void setEnReconstrModernOzRefFinContractNumber(String enReconstrModernOzRefFinContractNumber) {
		this.enReconstrModernOzRefFinContractNumber = enReconstrModernOzRefFinContractNumber;
	}

	public Date getEnReconstrModernOzRefFinContractDate(){
		return enReconstrModernOzRefFinContractDate;
	}

	public void setEnReconstrModernOzRefFinContractDate(Date enReconstrModernOzRefFinContractDate) {
		this.enReconstrModernOzRefFinContractDate = enReconstrModernOzRefFinContractDate;
	}

	public String getEnReconstrModernOzRefPartnerName(){
		return enReconstrModernOzRefPartnerName;
	}

	public void setEnReconstrModernOzRefPartnerName(String enReconstrModernOzRefPartnerName) {
		this.enReconstrModernOzRefPartnerName = enReconstrModernOzRefPartnerName;
	}

	public String getEnReconstrModernOzRefPartnerCode(){
		return enReconstrModernOzRefPartnerCode;
	}

	public void setEnReconstrModernOzRefPartnerCode(String enReconstrModernOzRefPartnerCode) {
		this.enReconstrModernOzRefPartnerCode = enReconstrModernOzRefPartnerCode;
	}

	public String getEnReconstrModernOzRefCharacteristicOS(){
		return enReconstrModernOzRefCharacteristicOS;
	}

	public void setEnReconstrModernOzRefCharacteristicOS(String enReconstrModernOzRefCharacteristicOS) {
		this.enReconstrModernOzRefCharacteristicOS = enReconstrModernOzRefCharacteristicOS;
	}

	public int getEnReconstrModernOzRefIsInvestProgram(){
		return enReconstrModernOzRefIsInvestProgram;
	}

	public void setEnReconstrModernOzRefIsInvestProgram(int enReconstrModernOzRefIsInvestProgram) {
		this.enReconstrModernOzRefIsInvestProgram = enReconstrModernOzRefIsInvestProgram;
	}

	public String getEnReconstrModernOzRefYearInvestProgram(){
		return enReconstrModernOzRefYearInvestProgram;
	}

	public void setEnReconstrModernOzRefYearInvestProgram(String enReconstrModernOzRefYearInvestProgram) {
		this.enReconstrModernOzRefYearInvestProgram = enReconstrModernOzRefYearInvestProgram;
	}

	public String getEnReconstrModernOzRefItemInvestProgram(){
		return enReconstrModernOzRefItemInvestProgram;
	}

	public void setEnReconstrModernOzRefItemInvestProgram(String enReconstrModernOzRefItemInvestProgram) {
		this.enReconstrModernOzRefItemInvestProgram = enReconstrModernOzRefItemInvestProgram;
	}

	public int getEnReconstrModernOzRefTypeRM(){
		return enReconstrModernOzRefTypeRM;
	}

	public void setEnReconstrModernOzRefTypeRM(int enReconstrModernOzRefTypeRM) {
		this.enReconstrModernOzRefTypeRM = enReconstrModernOzRefTypeRM;
	}

	public String getEnReconstrModernOzRefUserGen(){
		return enReconstrModernOzRefUserGen;
	}

	public void setEnReconstrModernOzRefUserGen(String enReconstrModernOzRefUserGen) {
		this.enReconstrModernOzRefUserGen = enReconstrModernOzRefUserGen;
	}

	public int getEnReconstrModernOzRefTermUseful(){
		return enReconstrModernOzRefTermUseful;
	}

	public void setEnReconstrModernOzRefTermUseful(int enReconstrModernOzRefTermUseful) {
		this.enReconstrModernOzRefTermUseful = enReconstrModernOzRefTermUseful;
	}

	public int getEnReconstrModernOzRefUse_limit_before(){
		return enReconstrModernOzRefUse_limit_before;
	}

	public void setEnReconstrModernOzRefUse_limit_before(int enReconstrModernOzRefUse_limit_before) {
		this.enReconstrModernOzRefUse_limit_before = enReconstrModernOzRefUse_limit_before;
	}

	public int getEnReconstrModernOzRefUse_limit_n_before(){
		return enReconstrModernOzRefUse_limit_n_before;
	}

	public void setEnReconstrModernOzRefUse_limit_n_before(int enReconstrModernOzRefUse_limit_n_before) {
		this.enReconstrModernOzRefUse_limit_n_before = enReconstrModernOzRefUse_limit_n_before;
	}

	public Date getEnReconstrModernOzRefDateExploitationIn(){
		return enReconstrModernOzRefDateExploitationIn;
	}

	public void setEnReconstrModernOzRefDateExploitationIn(Date enReconstrModernOzRefDateExploitationIn) {
		this.enReconstrModernOzRefDateExploitationIn = enReconstrModernOzRefDateExploitationIn;
	}

	public Date getEnReconstrModernOzRefDateExploitationOut(){
		return enReconstrModernOzRefDateExploitationOut;
	}

	public void setEnReconstrModernOzRefDateExploitationOut(Date enReconstrModernOzRefDateExploitationOut) {
		this.enReconstrModernOzRefDateExploitationOut = enReconstrModernOzRefDateExploitationOut;
	}



}
