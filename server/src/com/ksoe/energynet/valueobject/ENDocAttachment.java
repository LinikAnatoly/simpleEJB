
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

import java.io.Serializable;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENDocAttachmentRef;
import com.ksoe.energynet.valueobject.references.ENDocAttachmentServerRef;
import com.ksoe.energynet.valueobject.references.ENDocAttachmentStatusRef;
import com.ksoe.energynet.valueobject.references.ENDocAttachmentTypeRef;

public class ENDocAttachment implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String commentGen;
	public String fileLink;
	public long filesize = Long.MIN_VALUE;
	public int signingStatus = Integer.MIN_VALUE;
	public String userAdd;
	public Date dateAdd;
	public String userGen;
	public Date dateEdit;
	public long modify_time = Long.MIN_VALUE;

	public ENDocAttachmentStatusRef status = new ENDocAttachmentStatusRef();
	public ENDocAttachmentRef parentRef = new ENDocAttachmentRef();
	public ENDocAttachmentServerRef serverRef = new ENDocAttachmentServerRef();
	public ENDocAttachmentTypeRef typeRef = new ENDocAttachmentTypeRef();

	public static final String tableName = "ENDOCATTACHMENT";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENDOCATTACHMENT.CODE";
	public static final String commentGen_Attr = "commentGen";
	public static final String commentGen_Field = "COMMENTGEN";
	public static final String commentGen_QFielld = "ENDOCATTACHMENT.COMMENTGEN";
	public static final String fileLink_Attr = "fileLink";
	public static final String fileLink_Field = "FILELINK";
	public static final String fileLink_QFielld = "ENDOCATTACHMENT.FILELINK";
	public static final String filesize_Attr = "filesize";
	public static final String filesize_Field = "FILESIZE";
	public static final String filesize_QFielld = "ENDOCATTACHMENT.FILESIZE";
	public static final String signingStatus_Attr = "signingStatus";
	public static final String signingStatus_Field = "SIGNINGSTATUS";
	public static final String signingStatus_QFielld = "ENDOCATTACHMENT.SIGNINGSTATUS";
	public static final String userAdd_Attr = "userAdd";
	public static final String userAdd_Field = "USERADD";
	public static final String userAdd_QFielld = "ENDOCATTACHMENT.USERADD";
	public static final String dateAdd_Attr = "dateAdd";
	public static final String dateAdd_Field = "DATEADD";
	public static final String dateAdd_QFielld = "ENDOCATTACHMENT.DATEADD";
	public static final String userGen_Attr = "userGen";
	public static final String userGen_Field = "USERGEN";
	public static final String userGen_QFielld = "ENDOCATTACHMENT.USERGEN";
	public static final String dateEdit_Attr = "dateEdit";
	public static final String dateEdit_Field = "DATEEDIT";
	public static final String dateEdit_QFielld = "ENDOCATTACHMENT.DATEEDIT";
	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "ENDOCATTACHMENT.MODIFY_TIME";

	public static final String status_Attr = "status";
	public static final String status_Field = "STATUSCODE";
	public static final String status_QFielld = "ENDOCATTACHMENT.STATUSCODE";
	public static final String parentRef_Attr = "parentRef";
	public static final String parentRef_Field = "PARENTREFCODE";
	public static final String parentRef_QFielld = "ENDOCATTACHMENT.PARENTREFCODE";
	public static final String serverRef_Attr = "serverRef";
	public static final String serverRef_Field = "SERVERREFCODE";
	public static final String serverRef_QFielld = "ENDOCATTACHMENT.SERVERREFCODE";
	public static final String typeRef_Attr = "typeRef";
	public static final String typeRef_Field = "TYPEREFCODE";
	public static final String typeRef_QFielld = "ENDOCATTACHMENT.TYPEREFCODE";

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

	public long getModify_time() {
		return modify_time;
	}

	public void setModify_time(long modify_time) {
		this.modify_time = modify_time;
	}

	public ENDocAttachmentStatusRef getStatus() {
		return status;
	}

	public void setStatus(ENDocAttachmentStatusRef status) {
		this.status = status;
	}

	public ENDocAttachmentRef getParentRef() {
		return parentRef;
	}

	public void setParentRef(ENDocAttachmentRef parentRef) {
		this.parentRef = parentRef;
	}

	public ENDocAttachmentServerRef getServerRef() {
		return serverRef;
	}

	public void setServerRef(ENDocAttachmentServerRef serverRef) {
		this.serverRef = serverRef;
	}

	public ENDocAttachmentTypeRef getTypeRef() {
		return typeRef;
	}

	public void setTypeRef(ENDocAttachmentTypeRef typeRef) {
		this.typeRef = typeRef;
	}

} // end of ENDocAttachmentValueObject
