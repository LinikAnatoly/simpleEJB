
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

import java.io.Serializable;
import java.util.Date;

public class ENDocAttachmentShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String commentGen;
	public String fileLink;
	public long filesize = Long.MIN_VALUE;
	public int signingStatus = Integer.MIN_VALUE;
	public String userAdd;
	public Date dateAdd;
	public String userGen;
	public Date dateEdit;
	public int statusCode = Integer.MIN_VALUE;
	public String statusName;
	public int parentRefCode = Integer.MIN_VALUE;
	public String parentRefCommentGen;
	public String parentRefFileLink;
	public long parentRefFilesize = Long.MIN_VALUE;
	public int parentRefSigningStatus = Integer.MIN_VALUE;
	public String parentRefUserAdd;
	public Date parentRefDateAdd;
	public String parentRefUserGen;
	public Date parentRefDateEdit;
	public int serverRefCode = Integer.MIN_VALUE;
	public String serverRefName;
	public String serverRefServerIp;
	public String serverRefUserName;
	public String serverRefUserPass;
	public int typeRefCode = Integer.MIN_VALUE;
	public String typeRefName;

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getCommentGen() {
		return commentGen;
	}

	public void setCommentGen(String commentGen) {
		this.commentGen = commentGen;
	}

	public String getFileLink() {
		return fileLink;
	}

	public void setFileLink(String fileLink) {
		this.fileLink = fileLink;
	}

	public long getFilesize() {
		return filesize;
	}

	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}

	public int getSigningStatus() {
		return signingStatus;
	}

	public void setSigningStatus(int signingStatus) {
		this.signingStatus = signingStatus;
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

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public int getParentRefCode() {
		return parentRefCode;
	}

	public void setParentRefCode(int parentRefCode) {
		this.parentRefCode = parentRefCode;
	}

	public String getParentRefCommentGen() {
		return parentRefCommentGen;
	}

	public void setParentRefCommentGen(String parentRefCommentGen) {
		this.parentRefCommentGen = parentRefCommentGen;
	}

	public String getParentRefFileLink() {
		return parentRefFileLink;
	}

	public void setParentRefFileLink(String parentRefFileLink) {
		this.parentRefFileLink = parentRefFileLink;
	}

	public long getParentRefFilesize() {
		return parentRefFilesize;
	}

	public void setParentRefFilesize(long parentRefFilesize) {
		this.parentRefFilesize = parentRefFilesize;
	}

	public int getParentRefSigningStatus() {
		return parentRefSigningStatus;
	}

	public void setParentRefSigningStatus(int parentRefSigningStatus) {
		this.parentRefSigningStatus = parentRefSigningStatus;
	}

	public String getParentRefUserAdd() {
		return parentRefUserAdd;
	}

	public void setParentRefUserAdd(String parentRefUserAdd) {
		this.parentRefUserAdd = parentRefUserAdd;
	}

	public Date getParentRefDateAdd() {
		return parentRefDateAdd;
	}

	public void setParentRefDateAdd(Date parentRefDateAdd) {
		this.parentRefDateAdd = parentRefDateAdd;
	}

	public String getParentRefUserGen() {
		return parentRefUserGen;
	}

	public void setParentRefUserGen(String parentRefUserGen) {
		this.parentRefUserGen = parentRefUserGen;
	}

	public Date getParentRefDateEdit() {
		return parentRefDateEdit;
	}

	public void setParentRefDateEdit(Date parentRefDateEdit) {
		this.parentRefDateEdit = parentRefDateEdit;
	}

	public int getServerRefCode() {
		return serverRefCode;
	}

	public void setServerRefCode(int serverRefCode) {
		this.serverRefCode = serverRefCode;
	}

	public String getServerRefName() {
		return serverRefName;
	}

	public void setServerRefName(String serverRefName) {
		this.serverRefName = serverRefName;
	}

	public String getServerRefServerIp() {
		return serverRefServerIp;
	}

	public void setServerRefServerIp(String serverRefServerIp) {
		this.serverRefServerIp = serverRefServerIp;
	}

	public String getServerRefUserName() {
		return serverRefUserName;
	}

	public void setServerRefUserName(String serverRefUserName) {
		this.serverRefUserName = serverRefUserName;
	}

	public String getServerRefUserPass() {
		return serverRefUserPass;
	}

	public void setServerRefUserPass(String serverRefUserPass) {
		this.serverRefUserPass = serverRefUserPass;
	}

	public int getTypeRefCode() {
		return typeRefCode;
	}

	public void setTypeRefCode(int typeRefCode) {
		this.typeRefCode = typeRefCode;
	}

	public String getTypeRefName() {
		return typeRefName;
	}

	public void setTypeRefName(String typeRefName) {
		this.typeRefName = typeRefName;
	}

}
