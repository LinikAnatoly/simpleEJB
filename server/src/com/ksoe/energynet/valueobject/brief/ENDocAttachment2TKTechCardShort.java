
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENDocAttachment2TKTechCard;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENDocAttachment2TKTechCardShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public int docAttachmentRefCode = Integer.MIN_VALUE;
	public String docAttachmentRefCommentGen;
	public String docAttachmentRefFileLink;
	public long docAttachmentRefFilesize = Long.MIN_VALUE;
	public String docAttachmentRefUserAdd;
	public Date docAttachmentRefDateAdd;
	public String docAttachmentRefUserGen;
	public Date docAttachmentRefDateEdit;
	public int techCardRefCode = Integer.MIN_VALUE;
	public String techCardRefTechKartNumber;
	public String techCardRefName;
	public String techCardRefSafety;
	public Date techCardRefDateCreation;
	public Date techCardRefDateFrom;
	public Date techCardRefDateTo;
	public String techCardRefWorkconditions;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}


	public int getDocAttachmentRefCode(){
		return docAttachmentRefCode;
	}

	public void setDocAttachmentRefCode(int docAttachmentRefCode) {
		this.docAttachmentRefCode = docAttachmentRefCode;
	}

	public String getDocAttachmentRefCommentGen(){
		return docAttachmentRefCommentGen;
	}

	public void setDocAttachmentRefCommentGen(String docAttachmentRefCommentGen) {
		this.docAttachmentRefCommentGen = docAttachmentRefCommentGen;
	}

	public String getDocAttachmentRefFileLink(){
		return docAttachmentRefFileLink;
	}

	public void setDocAttachmentRefFileLink(String docAttachmentRefFileLink) {
		this.docAttachmentRefFileLink = docAttachmentRefFileLink;
	}

	public long getDocAttachmentRefFilesize(){
		return docAttachmentRefFilesize;
	}

	public void setDocAttachmentRefFilesize(long docAttachmentRefFilesize) {
		this.docAttachmentRefFilesize = docAttachmentRefFilesize;
	}

	public String getDocAttachmentRefUserAdd(){
		return docAttachmentRefUserAdd;
	}

	public void setDocAttachmentRefUserAdd(String docAttachmentRefUserAdd) {
		this.docAttachmentRefUserAdd = docAttachmentRefUserAdd;
	}

	public Date getDocAttachmentRefDateAdd(){
		return docAttachmentRefDateAdd;
	}

	public void setDocAttachmentRefDateAdd(Date docAttachmentRefDateAdd) {
		this.docAttachmentRefDateAdd = docAttachmentRefDateAdd;
	}

	public String getDocAttachmentRefUserGen(){
		return docAttachmentRefUserGen;
	}

	public void setDocAttachmentRefUserGen(String docAttachmentRefUserGen) {
		this.docAttachmentRefUserGen = docAttachmentRefUserGen;
	}

	public Date getDocAttachmentRefDateEdit(){
		return docAttachmentRefDateEdit;
	}

	public void setDocAttachmentRefDateEdit(Date docAttachmentRefDateEdit) {
		this.docAttachmentRefDateEdit = docAttachmentRefDateEdit;
	}

	public int getTechCardRefCode(){
		return techCardRefCode;
	}

	public void setTechCardRefCode(int techCardRefCode) {
		this.techCardRefCode = techCardRefCode;
	}

	public String getTechCardRefTechKartNumber(){
		return techCardRefTechKartNumber;
	}

	public void setTechCardRefTechKartNumber(String techCardRefTechKartNumber) {
		this.techCardRefTechKartNumber = techCardRefTechKartNumber;
	}

	public String getTechCardRefName(){
		return techCardRefName;
	}

	public void setTechCardRefName(String techCardRefName) {
		this.techCardRefName = techCardRefName;
	}

	public String getTechCardRefSafety(){
		return techCardRefSafety;
	}

	public void setTechCardRefSafety(String techCardRefSafety) {
		this.techCardRefSafety = techCardRefSafety;
	}

	public Date getTechCardRefDateCreation(){
		return techCardRefDateCreation;
	}

	public void setTechCardRefDateCreation(Date techCardRefDateCreation) {
		this.techCardRefDateCreation = techCardRefDateCreation;
	}

	public Date getTechCardRefDateFrom(){
		return techCardRefDateFrom;
	}

	public void setTechCardRefDateFrom(Date techCardRefDateFrom) {
		this.techCardRefDateFrom = techCardRefDateFrom;
	}

	public Date getTechCardRefDateTo(){
		return techCardRefDateTo;
	}

	public void setTechCardRefDateTo(Date techCardRefDateTo) {
		this.techCardRefDateTo = techCardRefDateTo;
	}

	public String getTechCardRefWorkconditions(){
		return techCardRefWorkconditions;
	}

	public void setTechCardRefWorkconditions(String techCardRefWorkconditions) {
		this.techCardRefWorkconditions = techCardRefWorkconditions;
	}



}
