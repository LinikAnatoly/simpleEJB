
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENSheets4SOItems;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENSheets4SOItemsShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String contentValue;
	public String additionalContent;
	public int sheet4soRefCode = Integer.MIN_VALUE;
	public String sheet4soRefNumbergen;
	public String sheet4soRefName;
	public Date sheet4soRefDateGen;
	public int sheet4soRefDayscnt = Integer.MIN_VALUE;
	public Date sheet4soRefNextSheetDate;
	public int sheet4soRefIsLast = Integer.MIN_VALUE;
	public String sheet4soRefRecipient;
	public String sheet4soRefRecipientAddress;
	public String sheet4soRefSignerPosition;
	public String sheet4soRefSignerFio;
	public String sheet4soRefExecutorFio;
	public String sheet4soRefExecutorPhone;
	public String sheet4soRefExecutorEmail;
	public String sheet4soRefAdditionalText;
	public int sheet4soRefIsWithSignature = Integer.MIN_VALUE;
	public String sheet4soRefCommentgen;
	public int sheet4soRefDfDocCode = Integer.MIN_VALUE;
	public int sheet4soRefDfDocTypeCode = Integer.MIN_VALUE;
	public String sheet4soRefDfDocNumber;
	public Date sheet4soRefDfDocDate;
	public String sheet4soRefUserGen;
	public Date sheet4soRefDateEdit;
	public int sheet4soRefWfPackCode = Integer.MIN_VALUE;
	public int sheetItemTemplateRefCode = Integer.MIN_VALUE;
	public String sheetItemTemplateRefName;
	public String sheetItemTemplateRefTemplateValue;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getContentValue() {
		return contentValue;
	}

	public void setContentValue(String contentValue) {
		this.contentValue = contentValue;
	}

	public String getAdditionalContent() {
		return additionalContent;
	}

	public void setAdditionalContent(String additionalContent) {
		this.additionalContent = additionalContent;
	}


	public int getSheet4soRefCode(){
		return sheet4soRefCode;
	}

	public void setSheet4soRefCode(int sheet4soRefCode) {
		this.sheet4soRefCode = sheet4soRefCode;
	}

	public String getSheet4soRefNumbergen(){
		return sheet4soRefNumbergen;
	}

	public void setSheet4soRefNumbergen(String sheet4soRefNumbergen) {
		this.sheet4soRefNumbergen = sheet4soRefNumbergen;
	}

	public String getSheet4soRefName(){
		return sheet4soRefName;
	}

	public void setSheet4soRefName(String sheet4soRefName) {
		this.sheet4soRefName = sheet4soRefName;
	}

	public Date getSheet4soRefDateGen(){
		return sheet4soRefDateGen;
	}

	public void setSheet4soRefDateGen(Date sheet4soRefDateGen) {
		this.sheet4soRefDateGen = sheet4soRefDateGen;
	}

	public int getSheet4soRefDayscnt(){
		return sheet4soRefDayscnt;
	}

	public void setSheet4soRefDayscnt(int sheet4soRefDayscnt) {
		this.sheet4soRefDayscnt = sheet4soRefDayscnt;
	}

	public Date getSheet4soRefNextSheetDate(){
		return sheet4soRefNextSheetDate;
	}

	public void setSheet4soRefNextSheetDate(Date sheet4soRefNextSheetDate) {
		this.sheet4soRefNextSheetDate = sheet4soRefNextSheetDate;
	}

	public int getSheet4soRefIsLast(){
		return sheet4soRefIsLast;
	}

	public void setSheet4soRefIsLast(int sheet4soRefIsLast) {
		this.sheet4soRefIsLast = sheet4soRefIsLast;
	}

	public String getSheet4soRefRecipient(){
		return sheet4soRefRecipient;
	}

	public void setSheet4soRefRecipient(String sheet4soRefRecipient) {
		this.sheet4soRefRecipient = sheet4soRefRecipient;
	}

	public String getSheet4soRefRecipientAddress(){
		return sheet4soRefRecipientAddress;
	}

	public void setSheet4soRefRecipientAddress(String sheet4soRefRecipientAddress) {
		this.sheet4soRefRecipientAddress = sheet4soRefRecipientAddress;
	}

	public String getSheet4soRefSignerPosition(){
		return sheet4soRefSignerPosition;
	}

	public void setSheet4soRefSignerPosition(String sheet4soRefSignerPosition) {
		this.sheet4soRefSignerPosition = sheet4soRefSignerPosition;
	}

	public String getSheet4soRefSignerFio(){
		return sheet4soRefSignerFio;
	}

	public void setSheet4soRefSignerFio(String sheet4soRefSignerFio) {
		this.sheet4soRefSignerFio = sheet4soRefSignerFio;
	}

	public String getSheet4soRefExecutorFio(){
		return sheet4soRefExecutorFio;
	}

	public void setSheet4soRefExecutorFio(String sheet4soRefExecutorFio) {
		this.sheet4soRefExecutorFio = sheet4soRefExecutorFio;
	}

	public String getSheet4soRefExecutorPhone(){
		return sheet4soRefExecutorPhone;
	}

	public void setSheet4soRefExecutorPhone(String sheet4soRefExecutorPhone) {
		this.sheet4soRefExecutorPhone = sheet4soRefExecutorPhone;
	}

	public String getSheet4soRefExecutorEmail(){
		return sheet4soRefExecutorEmail;
	}

	public void setSheet4soRefExecutorEmail(String sheet4soRefExecutorEmail) {
		this.sheet4soRefExecutorEmail = sheet4soRefExecutorEmail;
	}

	public String getSheet4soRefAdditionalText(){
		return sheet4soRefAdditionalText;
	}

	public void setSheet4soRefAdditionalText(String sheet4soRefAdditionalText) {
		this.sheet4soRefAdditionalText = sheet4soRefAdditionalText;
	}

	public int getSheet4soRefIsWithSignature(){
		return sheet4soRefIsWithSignature;
	}

	public void setSheet4soRefIsWithSignature(int sheet4soRefIsWithSignature) {
		this.sheet4soRefIsWithSignature = sheet4soRefIsWithSignature;
	}

	public String getSheet4soRefCommentgen(){
		return sheet4soRefCommentgen;
	}

	public void setSheet4soRefCommentgen(String sheet4soRefCommentgen) {
		this.sheet4soRefCommentgen = sheet4soRefCommentgen;
	}

	public int getSheet4soRefDfDocCode(){
		return sheet4soRefDfDocCode;
	}

	public void setSheet4soRefDfDocCode(int sheet4soRefDfDocCode) {
		this.sheet4soRefDfDocCode = sheet4soRefDfDocCode;
	}

	public int getSheet4soRefDfDocTypeCode(){
		return sheet4soRefDfDocTypeCode;
	}

	public void setSheet4soRefDfDocTypeCode(int sheet4soRefDfDocTypeCode) {
		this.sheet4soRefDfDocTypeCode = sheet4soRefDfDocTypeCode;
	}

	public String getSheet4soRefDfDocNumber(){
		return sheet4soRefDfDocNumber;
	}

	public void setSheet4soRefDfDocNumber(String sheet4soRefDfDocNumber) {
		this.sheet4soRefDfDocNumber = sheet4soRefDfDocNumber;
	}

	public Date getSheet4soRefDfDocDate(){
		return sheet4soRefDfDocDate;
	}

	public void setSheet4soRefDfDocDate(Date sheet4soRefDfDocDate) {
		this.sheet4soRefDfDocDate = sheet4soRefDfDocDate;
	}

	public String getSheet4soRefUserGen(){
		return sheet4soRefUserGen;
	}

	public void setSheet4soRefUserGen(String sheet4soRefUserGen) {
		this.sheet4soRefUserGen = sheet4soRefUserGen;
	}

	public Date getSheet4soRefDateEdit(){
		return sheet4soRefDateEdit;
	}

	public void setSheet4soRefDateEdit(Date sheet4soRefDateEdit) {
		this.sheet4soRefDateEdit = sheet4soRefDateEdit;
	}

	public int getSheet4soRefWfPackCode(){
		return sheet4soRefWfPackCode;
	}

	public void setSheet4soRefWfPackCode(int sheet4soRefWfPackCode) {
		this.sheet4soRefWfPackCode = sheet4soRefWfPackCode;
	}

	public int getSheetItemTemplateRefCode(){
		return sheetItemTemplateRefCode;
	}

	public void setSheetItemTemplateRefCode(int sheetItemTemplateRefCode) {
		this.sheetItemTemplateRefCode = sheetItemTemplateRefCode;
	}

	public String getSheetItemTemplateRefName(){
		return sheetItemTemplateRefName;
	}

	public void setSheetItemTemplateRefName(String sheetItemTemplateRefName) {
		this.sheetItemTemplateRefName = sheetItemTemplateRefName;
	}

	public String getSheetItemTemplateRefTemplateValue(){
		return sheetItemTemplateRefTemplateValue;
	}

	public void setSheetItemTemplateRefTemplateValue(String sheetItemTemplateRefTemplateValue) {
		this.sheetItemTemplateRefTemplateValue = sheetItemTemplateRefTemplateValue;
	}



}
