
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENAct2DFDoc;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENAct2DFDocShort implements Serializable {

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



}
