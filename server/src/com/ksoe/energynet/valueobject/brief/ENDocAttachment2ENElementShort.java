
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENDocAttachment2ENElement;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENDocAttachment2ENElementShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public int docAttachmentRefCode = Integer.MIN_VALUE;
	public String docAttachmentRefCommentGen;
	public String docAttachmentRefFileLink;
	public long docAttachmentRefFilesize = Long.MIN_VALUE;
	public int docAttachmentRefSigningStatus = Integer.MIN_VALUE;
	public String docAttachmentRefUserAdd;
	public Date docAttachmentRefDateAdd;
	public String docAttachmentRefUserGen;
	public Date docAttachmentRefDateEdit;
	public int elementRefCode = Integer.MIN_VALUE;


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

	public int getDocAttachmentRefSigningStatus(){
		return docAttachmentRefSigningStatus;
	}

	public void setDocAttachmentRefSigningStatus(int docAttachmentRefSigningStatus) {
		this.docAttachmentRefSigningStatus = docAttachmentRefSigningStatus;
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

	public int getElementRefCode(){
		return elementRefCode;
	}

	public void setElementRefCode(int elementRefCode) {
		this.elementRefCode = elementRefCode;
	}



}
