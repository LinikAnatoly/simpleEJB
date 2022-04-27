
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENSheets4SOType;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENSheets4SOTypeShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String name;
	public String nameForDfDoc;
	public String dfDocNumMask;
	public int dfDepartmentCode = Integer.MIN_VALUE;
	public String executorFio;
	public String executorPhone;
	public String executorEmail;
	public String reportPath;
	public String reportFileName;
	public String reportType;
	public String commentGen;
	public int signerRefCode = Integer.MIN_VALUE;
	public String signerRefSignerPosition;
	public String signerRefSignerFio;
	public String signerRefSignatureImagePath;
	public String signerRefCommentGen;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNameForDfDoc() {
		return nameForDfDoc;
	}

	public void setNameForDfDoc(String nameForDfDoc) {
		this.nameForDfDoc = nameForDfDoc;
	}

	public String getDfDocNumMask() {
		return dfDocNumMask;
	}

	public void setDfDocNumMask(String dfDocNumMask) {
		this.dfDocNumMask = dfDocNumMask;
	}

	public int getDfDepartmentCode() {
		return dfDepartmentCode;
	}

	public void setDfDepartmentCode(int dfDepartmentCode) {
		this.dfDepartmentCode = dfDepartmentCode;
	}

	public String getExecutorFio() {
		return executorFio;
	}

	public void setExecutorFio(String executorFio) {
		this.executorFio = executorFio;
	}

	public String getExecutorPhone() {
		return executorPhone;
	}

	public void setExecutorPhone(String executorPhone) {
		this.executorPhone = executorPhone;
	}

	public String getExecutorEmail() {
		return executorEmail;
	}

	public void setExecutorEmail(String executorEmail) {
		this.executorEmail = executorEmail;
	}

	public String getReportPath() {
		return reportPath;
	}

	public void setReportPath(String reportPath) {
		this.reportPath = reportPath;
	}

	public String getReportFileName() {
		return reportFileName;
	}

	public void setReportFileName(String reportFileName) {
		this.reportFileName = reportFileName;
	}

	public String getReportType() {
		return reportType;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
	}

	public String getCommentGen() {
		return commentGen;
	}

	public void setCommentGen(String commentGen) {
		this.commentGen = commentGen;
	}


	public int getSignerRefCode(){
		return signerRefCode;
	}

	public void setSignerRefCode(int signerRefCode) {
		this.signerRefCode = signerRefCode;
	}

	public String getSignerRefSignerPosition(){
		return signerRefSignerPosition;
	}

	public void setSignerRefSignerPosition(String signerRefSignerPosition) {
		this.signerRefSignerPosition = signerRefSignerPosition;
	}

	public String getSignerRefSignerFio(){
		return signerRefSignerFio;
	}

	public void setSignerRefSignerFio(String signerRefSignerFio) {
		this.signerRefSignerFio = signerRefSignerFio;
	}

	public String getSignerRefSignatureImagePath(){
		return signerRefSignatureImagePath;
	}

	public void setSignerRefSignatureImagePath(String signerRefSignatureImagePath) {
		this.signerRefSignatureImagePath = signerRefSignatureImagePath;
	}

	public String getSignerRefCommentGen(){
		return signerRefCommentGen;
	}

	public void setSignerRefCommentGen(String signerRefCommentGen) {
		this.signerRefCommentGen = signerRefCommentGen;
	}



}
