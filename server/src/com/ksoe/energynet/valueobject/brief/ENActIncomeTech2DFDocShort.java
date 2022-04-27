
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENActIncomeTech2DFDoc;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENActIncomeTech2DFDocShort implements Serializable {

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
	public int actIncomeRefCode = Integer.MIN_VALUE;
	public String actIncomeRefNumbergen;
	public Date actIncomeRefDategen;
	public Date actIncomeRefActDateStart;
	public Date actIncomeRefActDateEnd;
	public BigDecimal actIncomeRefSummaGen;
	public BigDecimal actIncomeRefSummaVat;


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

	public BigDecimal getActIncomeRefSummaGen(){
		return actIncomeRefSummaGen;
	}

	public void setActIncomeRefSummaGen(BigDecimal actIncomeRefSummaGen) {
		this.actIncomeRefSummaGen = actIncomeRefSummaGen;
	}

	public BigDecimal getActIncomeRefSummaVat(){
		return actIncomeRefSummaVat;
	}

	public void setActIncomeRefSummaVat(BigDecimal actIncomeRefSummaVat) {
		this.actIncomeRefSummaVat = actIncomeRefSummaVat;
	}



}
