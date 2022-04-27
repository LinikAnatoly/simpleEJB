
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENExecutor;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENExecutorShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String executorFio;
	public String executorPhone;
	public String executorEmail;
	public String commentGen;
	public int sheetTypeRefCode = Integer.MIN_VALUE;
	public String sheetTypeRefName;
	public String sheetTypeRefNameForDfDoc;
	public String sheetTypeRefDfDocNumMask;
	public int sheetTypeRefDfDepartmentCode = Integer.MIN_VALUE;
	public String sheetTypeRefExecutorFio;
	public String sheetTypeRefExecutorPhone;
	public String sheetTypeRefExecutorEmail;
	public String sheetTypeRefReportPath;
	public String sheetTypeRefReportFileName;
	public String sheetTypeRefReportType;
	public String sheetTypeRefCommentGen;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
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

	public String getCommentGen() {
		return commentGen;
	}

	public void setCommentGen(String commentGen) {
		this.commentGen = commentGen;
	}


	public int getSheetTypeRefCode(){
		return sheetTypeRefCode;
	}

	public void setSheetTypeRefCode(int sheetTypeRefCode) {
		this.sheetTypeRefCode = sheetTypeRefCode;
	}

	public String getSheetTypeRefName(){
		return sheetTypeRefName;
	}

	public void setSheetTypeRefName(String sheetTypeRefName) {
		this.sheetTypeRefName = sheetTypeRefName;
	}

	public String getSheetTypeRefNameForDfDoc(){
		return sheetTypeRefNameForDfDoc;
	}

	public void setSheetTypeRefNameForDfDoc(String sheetTypeRefNameForDfDoc) {
		this.sheetTypeRefNameForDfDoc = sheetTypeRefNameForDfDoc;
	}

	public String getSheetTypeRefDfDocNumMask(){
		return sheetTypeRefDfDocNumMask;
	}

	public void setSheetTypeRefDfDocNumMask(String sheetTypeRefDfDocNumMask) {
		this.sheetTypeRefDfDocNumMask = sheetTypeRefDfDocNumMask;
	}

	public int getSheetTypeRefDfDepartmentCode(){
		return sheetTypeRefDfDepartmentCode;
	}

	public void setSheetTypeRefDfDepartmentCode(int sheetTypeRefDfDepartmentCode) {
		this.sheetTypeRefDfDepartmentCode = sheetTypeRefDfDepartmentCode;
	}

	public String getSheetTypeRefExecutorFio(){
		return sheetTypeRefExecutorFio;
	}

	public void setSheetTypeRefExecutorFio(String sheetTypeRefExecutorFio) {
		this.sheetTypeRefExecutorFio = sheetTypeRefExecutorFio;
	}

	public String getSheetTypeRefExecutorPhone(){
		return sheetTypeRefExecutorPhone;
	}

	public void setSheetTypeRefExecutorPhone(String sheetTypeRefExecutorPhone) {
		this.sheetTypeRefExecutorPhone = sheetTypeRefExecutorPhone;
	}

	public String getSheetTypeRefExecutorEmail(){
		return sheetTypeRefExecutorEmail;
	}

	public void setSheetTypeRefExecutorEmail(String sheetTypeRefExecutorEmail) {
		this.sheetTypeRefExecutorEmail = sheetTypeRefExecutorEmail;
	}

	public String getSheetTypeRefReportPath(){
		return sheetTypeRefReportPath;
	}

	public void setSheetTypeRefReportPath(String sheetTypeRefReportPath) {
		this.sheetTypeRefReportPath = sheetTypeRefReportPath;
	}

	public String getSheetTypeRefReportFileName(){
		return sheetTypeRefReportFileName;
	}

	public void setSheetTypeRefReportFileName(String sheetTypeRefReportFileName) {
		this.sheetTypeRefReportFileName = sheetTypeRefReportFileName;
	}

	public String getSheetTypeRefReportType(){
		return sheetTypeRefReportType;
	}

	public void setSheetTypeRefReportType(String sheetTypeRefReportType) {
		this.sheetTypeRefReportType = sheetTypeRefReportType;
	}

	public String getSheetTypeRefCommentGen(){
		return sheetTypeRefCommentGen;
	}

	public void setSheetTypeRefCommentGen(String sheetTypeRefCommentGen) {
		this.sheetTypeRefCommentGen = sheetTypeRefCommentGen;
	}



}
