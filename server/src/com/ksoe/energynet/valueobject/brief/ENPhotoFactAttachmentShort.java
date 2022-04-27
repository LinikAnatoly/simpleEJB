
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

import java.io.Serializable;
import java.util.Date;

public class ENPhotoFactAttachmentShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public int docAttachmentRefCode = Integer.MIN_VALUE;
	public String docAttachmentRefCommentGen;
	public String docAttachmentRefFileLink;
	public String docAttachmentRefUserAdd;
	public Date docAttachmentRefDateAdd;
	public String docAttachmentRefUserGen;
	public Date docAttachmentRefDateEdit;
	public int photoFactRefCode = Integer.MIN_VALUE;
	public String photoFactRefDescription;
	public Date photoFactRefDateFact;
	public String photoFactRefActNumber;
	public String photoFactRefPersonalAccount;
	public String photoFactRefPersonalAccountUid;
	public String photoFactRefCustomerFIO;
	public Date photoFactRefDateAdd;
	public Date photoFactRefDateEdit;
	public String photoFactRefUserGen;

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setDocAttachmentRefCode(int aValue) {
		docAttachmentRefCode = aValue;
	}

	public int getDocAttachmentRefCode() {
		return docAttachmentRefCode;
	}

	public void setDocAttachmentRefCommentGen(String aValue) {
		docAttachmentRefCommentGen = aValue;
	}

	public String getDocAttachmentRefCommentGen() {
		return docAttachmentRefCommentGen;
	}

	public void setDocAttachmentRefFileLink(String aValue) {
		docAttachmentRefFileLink = aValue;
	}

	public String getDocAttachmentRefFileLink() {
		return docAttachmentRefFileLink;
	}

	public void setDocAttachmentRefUserAdd(String aValue) {
		docAttachmentRefUserAdd = aValue;
	}

	public String getDocAttachmentRefUserAdd() {
		return docAttachmentRefUserAdd;
	}

	public void setDocAttachmentRefDateAdd(Date aValue) {
		docAttachmentRefDateAdd = aValue;
	}

	public Date getDocAttachmentRefDateAdd() {
		return docAttachmentRefDateAdd;
	}

	public void setDocAttachmentRefUserGen(String aValue) {
		docAttachmentRefUserGen = aValue;
	}

	public String getDocAttachmentRefUserGen() {
		return docAttachmentRefUserGen;
	}

	public void setDocAttachmentRefDateEdit(Date aValue) {
		docAttachmentRefDateEdit = aValue;
	}

	public Date getDocAttachmentRefDateEdit() {
		return docAttachmentRefDateEdit;
	}

	public void setPhotoFactRefCode(int aValue) {
		photoFactRefCode = aValue;
	}

	public int getPhotoFactRefCode() {
		return photoFactRefCode;
	}

	public void setPhotoFactRefDescription(String aValue) {
		photoFactRefDescription = aValue;
	}

	public String getPhotoFactRefDescription() {
		return photoFactRefDescription;
	}

	public void setPhotoFactRefDateFact(Date aValue) {
		photoFactRefDateFact = aValue;
	}

	public Date getPhotoFactRefDateFact() {
		return photoFactRefDateFact;
	}

	public void setPhotoFactRefActNumber(String aValue) {
		photoFactRefActNumber = aValue;
	}

	public String getPhotoFactRefActNumber() {
		return photoFactRefActNumber;
	}

	public void setPhotoFactRefPersonalAccount(String aValue) {
		photoFactRefPersonalAccount = aValue;
	}

	public String getPhotoFactRefPersonalAccount() {
		return photoFactRefPersonalAccount;
	}

	public void setPhotoFactRefPersonalAccountUid(String aValue) {
		photoFactRefPersonalAccountUid = aValue;
	}

	public String getPhotoFactRefPersonalAccountUid() {
		return photoFactRefPersonalAccountUid;
	}

	public void setPhotoFactRefCustomerFIO(String aValue) {
		photoFactRefCustomerFIO = aValue;
	}

	public String getPhotoFactRefCustomerFIO() {
		return photoFactRefCustomerFIO;
	}

	public void setPhotoFactRefDateAdd(Date aValue) {
		photoFactRefDateAdd = aValue;
	}

	public Date getPhotoFactRefDateAdd() {
		return photoFactRefDateAdd;
	}

	public void setPhotoFactRefDateEdit(Date aValue) {
		photoFactRefDateEdit = aValue;
	}

	public Date getPhotoFactRefDateEdit() {
		return photoFactRefDateEdit;
	}

	public void setPhotoFactRefUserGen(String aValue) {
		photoFactRefUserGen = aValue;
	}

	public String getPhotoFactRefUserGen() {
		return photoFactRefUserGen;
	}

}