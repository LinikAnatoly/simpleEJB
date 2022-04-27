
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2022 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENInspectionSheetItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENInspectionSheetItemShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String defectCode;
	public String defectName;
	public String commentGen;
	public int isDetecting = Integer.MIN_VALUE;
	public BigDecimal countGen;
	public BigDecimal countDefects;
	public BigDecimal defectLength;
	public BigDecimal coefficientKi;
	public BigDecimal pointsPi;
	public BigDecimal weightXi;
	public String userGen;
	public int sheetRefCode = Integer.MIN_VALUE;
	public String sheetRefName;
	public int sheetRefInspectionKind = Integer.MIN_VALUE;
	public Date sheetRefDateGen;
	public String sheetRefExecutor;
	public String sheetRefAccepted;
	public String sheetRefObjectInvNumber;
	public String sheetRefObjectName;
	public int sheetRefEquipmentKind = Integer.MIN_VALUE;
	public int sheetRefTakeIntoCalculation = Integer.MIN_VALUE;
	public String sheetRefUserGen;
	public Date sheetRefDateEdit;
	public int classificationTypeRefCode = Integer.MIN_VALUE;
	public String classificationTypeRefName;
	public String classificationTypeRefKod;
	public int elementRefCode = Integer.MIN_VALUE;


	/** ******************************  */
	public int classificationTypeParentRefCode = Integer.MIN_VALUE;
	public int techCardCode = Integer.MIN_VALUE;
	/** ******************************  */



	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getDefectCode() {
		return defectCode;
	}

	public void setDefectCode(String defectCode) {
		this.defectCode = defectCode;
	}

	public String getDefectName() {
		return defectName;
	}

	public void setDefectName(String defectName) {
		this.defectName = defectName;
	}

	public String getCommentGen() {
		return commentGen;
	}

	public void setCommentGen(String commentGen) {
		this.commentGen = commentGen;
	}

	public int getIsDetecting() {
		return isDetecting;
	}

	public void setIsDetecting(int isDetecting) {
		this.isDetecting = isDetecting;
	}

	public BigDecimal getCountGen() {
		return countGen;
	}

	public void setCountGen(BigDecimal countGen) {
		this.countGen = countGen;
	}

	public BigDecimal getCountDefects() {
		return countDefects;
	}

	public void setCountDefects(BigDecimal countDefects) {
		this.countDefects = countDefects;
	}

	public BigDecimal getDefectLength() {
		return defectLength;
	}

	public void setDefectLength(BigDecimal defectLength) {
		this.defectLength = defectLength;
	}

	public BigDecimal getCoefficientKi() {
		return coefficientKi;
	}

	public void setCoefficientKi(BigDecimal coefficientKi) {
		this.coefficientKi = coefficientKi;
	}

	public BigDecimal getPointsPi() {
		return pointsPi;
	}

	public void setPointsPi(BigDecimal pointsPi) {
		this.pointsPi = pointsPi;
	}

	public BigDecimal getWeightXi() {
		return weightXi;
	}

	public void setWeightXi(BigDecimal weightXi) {
		this.weightXi = weightXi;
	}

	public String getUserGen() {
		return userGen;
	}

	public void setUserGen(String userGen) {
		this.userGen = userGen;
	}




	public int getSheetRefCode(){
		return sheetRefCode;
	}

	public void setSheetRefCode(int sheetRefCode) {
		this.sheetRefCode = sheetRefCode;
	}

	public String getSheetRefName(){
		return sheetRefName;
	}

	public void setSheetRefName(String sheetRefName) {
		this.sheetRefName = sheetRefName;
	}

	public int getSheetRefInspectionKind(){
		return sheetRefInspectionKind;
	}

	public void setSheetRefInspectionKind(int sheetRefInspectionKind) {
		this.sheetRefInspectionKind = sheetRefInspectionKind;
	}

	public Date getSheetRefDateGen(){
		return sheetRefDateGen;
	}

	public void setSheetRefDateGen(Date sheetRefDateGen) {
		this.sheetRefDateGen = sheetRefDateGen;
	}

	public String getSheetRefExecutor(){
		return sheetRefExecutor;
	}

	public void setSheetRefExecutor(String sheetRefExecutor) {
		this.sheetRefExecutor = sheetRefExecutor;
	}

	public String getSheetRefAccepted(){
		return sheetRefAccepted;
	}

	public void setSheetRefAccepted(String sheetRefAccepted) {
		this.sheetRefAccepted = sheetRefAccepted;
	}

	public String getSheetRefObjectInvNumber(){
		return sheetRefObjectInvNumber;
	}

	public void setSheetRefObjectInvNumber(String sheetRefObjectInvNumber) {
		this.sheetRefObjectInvNumber = sheetRefObjectInvNumber;
	}

	public String getSheetRefObjectName(){
		return sheetRefObjectName;
	}

	public void setSheetRefObjectName(String sheetRefObjectName) {
		this.sheetRefObjectName = sheetRefObjectName;
	}

	public int getSheetRefEquipmentKind(){
		return sheetRefEquipmentKind;
	}

	public void setSheetRefEquipmentKind(int sheetRefEquipmentKind) {
		this.sheetRefEquipmentKind = sheetRefEquipmentKind;
	}

	public int getSheetRefTakeIntoCalculation(){
		return sheetRefTakeIntoCalculation;
	}

	public void setSheetRefTakeIntoCalculation(int sheetRefTakeIntoCalculation) {
		this.sheetRefTakeIntoCalculation = sheetRefTakeIntoCalculation;
	}

	public String getSheetRefUserGen(){
		return sheetRefUserGen;
	}

	public void setSheetRefUserGen(String sheetRefUserGen) {
		this.sheetRefUserGen = sheetRefUserGen;
	}

	public Date getSheetRefDateEdit(){
		return sheetRefDateEdit;
	}

	public void setSheetRefDateEdit(Date sheetRefDateEdit) {
		this.sheetRefDateEdit = sheetRefDateEdit;
	}

	public int getClassificationTypeRefCode(){
		return classificationTypeRefCode;
	}

	public void setClassificationTypeRefCode(int classificationTypeRefCode) {
		this.classificationTypeRefCode = classificationTypeRefCode;
	}

	public String getClassificationTypeRefName(){
		return classificationTypeRefName;
	}

	public void setClassificationTypeRefName(String classificationTypeRefName) {
		this.classificationTypeRefName = classificationTypeRefName;
	}

	public String getClassificationTypeRefKod(){
		return classificationTypeRefKod;
	}

	public void setClassificationTypeRefKod(String classificationTypeRefKod) {
		this.classificationTypeRefKod = classificationTypeRefKod;
	}

	public int getElementRefCode(){
		return elementRefCode;
	}

	public void setElementRefCode(int elementRefCode) {
		this.elementRefCode = elementRefCode;
	}

	public int getClassificationTypeParentRefCode() {
		return classificationTypeParentRefCode;
	}

	public void setClassificationTypeParentRefCode(int classificationTypeParentRefCode) {
		this.classificationTypeParentRefCode = classificationTypeParentRefCode;
	}

	public int getTechCardCode() {
		return techCardCode;
	}

	public void setTechCardCode(int techCardCode) {
		this.techCardCode = techCardCode;
	}

}
