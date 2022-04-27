
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for SCUsageInput2DFDoc;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class SCUsageInput2DFDocShort implements Serializable {

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
	public int scUsageInputRefCode = Integer.MIN_VALUE;
	public String scUsageInputRefNumberDoc;
	public Date scUsageInputRefDateGen;
	public Date scUsageInputRefDateStart;
	public Date scUsageInputRefDateFinal;
	public String scUsageInputRefMolCode;
	public String scUsageInputRefMolName;
	public Date scUsageInputRefDateEdit;
	public String scUsageInputRefMolCodeCounter;
	public String scUsageInputRefMolNameCounter;
	public String scUsageInputRefUserGen;


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



	public int getScUsageInputRefCode(){
		return scUsageInputRefCode;
	}

	public void setScUsageInputRefCode(int scUsageInputRefCode) {
		this.scUsageInputRefCode = scUsageInputRefCode;
	}

	public String getScUsageInputRefNumberDoc(){
		return scUsageInputRefNumberDoc;
	}

	public void setScUsageInputRefNumberDoc(String scUsageInputRefNumberDoc) {
		this.scUsageInputRefNumberDoc = scUsageInputRefNumberDoc;
	}

	public Date getScUsageInputRefDateGen(){
		return scUsageInputRefDateGen;
	}

	public void setScUsageInputRefDateGen(Date scUsageInputRefDateGen) {
		this.scUsageInputRefDateGen = scUsageInputRefDateGen;
	}

	public Date getScUsageInputRefDateStart(){
		return scUsageInputRefDateStart;
	}

	public void setScUsageInputRefDateStart(Date scUsageInputRefDateStart) {
		this.scUsageInputRefDateStart = scUsageInputRefDateStart;
	}

	public Date getScUsageInputRefDateFinal(){
		return scUsageInputRefDateFinal;
	}

	public void setScUsageInputRefDateFinal(Date scUsageInputRefDateFinal) {
		this.scUsageInputRefDateFinal = scUsageInputRefDateFinal;
	}

	public String getScUsageInputRefMolCode(){
		return scUsageInputRefMolCode;
	}

	public void setScUsageInputRefMolCode(String scUsageInputRefMolCode) {
		this.scUsageInputRefMolCode = scUsageInputRefMolCode;
	}

	public String getScUsageInputRefMolName(){
		return scUsageInputRefMolName;
	}

	public void setScUsageInputRefMolName(String scUsageInputRefMolName) {
		this.scUsageInputRefMolName = scUsageInputRefMolName;
	}

	public Date getScUsageInputRefDateEdit(){
		return scUsageInputRefDateEdit;
	}

	public void setScUsageInputRefDateEdit(Date scUsageInputRefDateEdit) {
		this.scUsageInputRefDateEdit = scUsageInputRefDateEdit;
	}

	public String getScUsageInputRefMolCodeCounter(){
		return scUsageInputRefMolCodeCounter;
	}

	public void setScUsageInputRefMolCodeCounter(String scUsageInputRefMolCodeCounter) {
		this.scUsageInputRefMolCodeCounter = scUsageInputRefMolCodeCounter;
	}

	public String getScUsageInputRefMolNameCounter(){
		return scUsageInputRefMolNameCounter;
	}

	public void setScUsageInputRefMolNameCounter(String scUsageInputRefMolNameCounter) {
		this.scUsageInputRefMolNameCounter = scUsageInputRefMolNameCounter;
	}

	public String getScUsageInputRefUserGen(){
		return scUsageInputRefUserGen;
	}

	public void setScUsageInputRefUserGen(String scUsageInputRefUserGen) {
		this.scUsageInputRefUserGen = scUsageInputRefUserGen;
	}



}
