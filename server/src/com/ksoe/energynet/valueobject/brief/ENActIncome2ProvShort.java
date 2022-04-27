
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENActIncome2Prov;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENActIncome2ProvShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public int partId = Integer.MIN_VALUE;
	public Date datePosting ;
	public String voucher;
	public Date dateEdit ;
	public String userGen;
	public int actIncomeRefCode = Integer.MIN_VALUE;
	public String actIncomeRefNumbergen;
	public Date actIncomeRefDategen;
	public Date actIncomeRefActDateStart;
	public Date actIncomeRefActDateEnd;
	public String actIncomeRefContractNumber;
	public Date actIncomeRefContractDate;
	public String actIncomeRefPartnername;
	public String actIncomeRefPartnerCode;
	public String actIncomeRefFinDocCode;
	public int actIncomeRefFinDocID = Integer.MIN_VALUE;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getPartId() {
		return partId;
	}

	public void setPartId(int partId) {
		this.partId = partId;
	}

	public Date getDatePosting() {
		return datePosting;
	}

	public void setDatePosting(Date datePosting) {
		this.datePosting = datePosting;
	}

	public String getVoucher() {
		return voucher;
	}

	public void setVoucher(String voucher) {
		this.voucher = voucher;
	}

	public Date getDateEdit() {
		return dateEdit;
	}

	public void setDateEdit(Date dateEdit) {
		this.dateEdit = dateEdit;
	}

	public String getUserGen() {
		return userGen;
	}

	public void setUserGen(String userGen) {
		this.userGen = userGen;
	}


	public int getActIncomeRefCode(){
		return actIncomeRefCode;
	}

	public void setActIncomeRefCode(int actIncomeRefCode) {
		this.actIncomeRefCode = actIncomeRefCode;
	}

	public String getActIncomeRefNumbergen(){
		return actIncomeRefNumbergen;
	}

	public void setActIncomeRefNumbergen(String actIncomeRefNumbergen) {
		this.actIncomeRefNumbergen = actIncomeRefNumbergen;
	}

	public Date getActIncomeRefDategen(){
		return actIncomeRefDategen;
	}

	public void setActIncomeRefDategen(Date actIncomeRefDategen) {
		this.actIncomeRefDategen = actIncomeRefDategen;
	}

	public Date getActIncomeRefActDateStart(){
		return actIncomeRefActDateStart;
	}

	public void setActIncomeRefActDateStart(Date actIncomeRefActDateStart) {
		this.actIncomeRefActDateStart = actIncomeRefActDateStart;
	}

	public Date getActIncomeRefActDateEnd(){
		return actIncomeRefActDateEnd;
	}

	public void setActIncomeRefActDateEnd(Date actIncomeRefActDateEnd) {
		this.actIncomeRefActDateEnd = actIncomeRefActDateEnd;
	}

	public String getActIncomeRefContractNumber(){
		return actIncomeRefContractNumber;
	}

	public void setActIncomeRefContractNumber(String actIncomeRefContractNumber) {
		this.actIncomeRefContractNumber = actIncomeRefContractNumber;
	}

	public Date getActIncomeRefContractDate(){
		return actIncomeRefContractDate;
	}

	public void setActIncomeRefContractDate(Date actIncomeRefContractDate) {
		this.actIncomeRefContractDate = actIncomeRefContractDate;
	}

	public String getActIncomeRefPartnername(){
		return actIncomeRefPartnername;
	}

	public void setActIncomeRefPartnername(String actIncomeRefPartnername) {
		this.actIncomeRefPartnername = actIncomeRefPartnername;
	}

	public String getActIncomeRefPartnerCode(){
		return actIncomeRefPartnerCode;
	}

	public void setActIncomeRefPartnerCode(String actIncomeRefPartnerCode) {
		this.actIncomeRefPartnerCode = actIncomeRefPartnerCode;
	}

	public String getActIncomeRefFinDocCode(){
		return actIncomeRefFinDocCode;
	}

	public void setActIncomeRefFinDocCode(String actIncomeRefFinDocCode) {
		this.actIncomeRefFinDocCode = actIncomeRefFinDocCode;
	}

	public int getActIncomeRefFinDocID(){
		return actIncomeRefFinDocID;
	}

	public void setActIncomeRefFinDocID(int actIncomeRefFinDocID) {
		this.actIncomeRefFinDocID = actIncomeRefFinDocID;
	}



}
