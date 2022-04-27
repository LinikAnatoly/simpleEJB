
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENFuelSheetVolItemData;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENFuelSheetVolItemDataShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int plan_code = Integer.MIN_VALUE;
    public Date datestart ;
    public BigDecimal countfact;
    public int kindcode = Integer.MIN_VALUE;
    public int staterefcode = Integer.MIN_VALUE;
    public int typerefcode = Integer.MIN_VALUE;
    public int budgetrefcode = Integer.MIN_VALUE;
    public int materialrefcode = Integer.MIN_VALUE;
    public int transport_department = Integer.MIN_VALUE;
    public int departmentrefcode = Integer.MIN_VALUE;
	public int eikindcode = Integer.MIN_VALUE;
    public int sheetVolumesRefCode = Integer.MIN_VALUE;
    public String sheetVolumesRefName;
    public Date sheetVolumesRefDateGen;
    public Date sheetVolumesRefStartDate;
    public Date sheetVolumesRefEndDate;
    public int sheetVolumesRefFuelType = Integer.MIN_VALUE;
    public String sheetVolumesRefUserAdd;
    public Date sheetVolumesRefDateAdd;
    public String sheetVolumesRefUserGen;
    public Date sheetVolumesRefDateEdit;

    /////
    public String objectName;
    public String invNumber;
    public String kindName;
    public String stateRefShortName;
    public String typeRefName;
    public String budgetRefShortName;
    public String materialName;
    public String departmentRefShortName;
    public String statusName;
    public String renRefName;
    /////
    
    public String getRenRefName() {
		return renRefName;
	}

	public void setRenRefName(String renRefName) {
		this.renRefName = renRefName;
	}

	public String getObjectName() {
		return objectName;
	}

	public void setObjectName(String objectName) {
		this.objectName = objectName;
	}

	public String getInvNumber() {
		return invNumber;
	}

	public void setInvNumber(String invNumber) {
		this.invNumber = invNumber;
	}

	public String getKindName() {
		return kindName;
	}

	public void setKindName(String kindName) {
		this.kindName = kindName;
	}

	public String getStateRefShortName() {
		return stateRefShortName;
	}

	public void setStateRefShortName(String stateRefShortName) {
		this.stateRefShortName = stateRefShortName;
	}

	public String getTypeRefName() {
		return typeRefName;
	}

	public void setTypeRefName(String typeRefName) {
		this.typeRefName = typeRefName;
	}

	public String getBudgetRefShortName() {
		return budgetRefShortName;
	}

	public void setBudgetRefShortName(String budgetRefShortName) {
		this.budgetRefShortName = budgetRefShortName;
	}

	public String getMaterialName() {
		return materialName;
	}

	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}

	public String getDepartmentRefShortName() {
		return departmentRefShortName;
	}

	public void setDepartmentRefShortName(String departmentRefShortName) {
		this.departmentRefShortName = departmentRefShortName;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setPlan_code(int aValue){
       plan_code = aValue;
    }

    public int getPlan_code(){
       return plan_code;
    }

    public void setDatestart(Date aValue){
       datestart = aValue;
    }

    public Date getDatestart(){
       return datestart;
    }
    public void setCountfact(BigDecimal aValue){
       countfact = aValue;
    }

    public BigDecimal getCountfact(){
       return countfact;
    }
    public void setKindcode(int aValue){
       kindcode = aValue;
    }

    public int getKindcode(){
       return kindcode;
    }
    public void setStaterefcode(int aValue){
       staterefcode = aValue;
    }

    public int getStaterefcode(){
       return staterefcode;
    }
    public void setTyperefcode(int aValue){
       typerefcode = aValue;
    }

    public int getTyperefcode(){
       return typerefcode;
    }
    public void setBudgetrefcode(int aValue){
       budgetrefcode = aValue;
    }

    public int getBudgetrefcode(){
       return budgetrefcode;
    }
    public void setMaterialrefcode(int aValue){
       materialrefcode = aValue;
    }

    public int getMaterialrefcode(){
       return materialrefcode;
    }
    public void setTransport_department(int aValue){
       transport_department = aValue;
    }

    public int getTransport_department(){
       return transport_department;
    }
    public void setDepartmentrefcode(int aValue){
       departmentrefcode = aValue;
    }

    public int getDepartmentrefcode(){
       return departmentrefcode;
    }


    public void setSheetVolumesRefCode(int aValue){
       sheetVolumesRefCode = aValue;
    }
    public int getSheetVolumesRefCode(){
       return sheetVolumesRefCode;
    }

    public void setSheetVolumesRefName(String aValue){
       sheetVolumesRefName = aValue;
    }
    public String getSheetVolumesRefName(){
       return sheetVolumesRefName;
    }


    public void setSheetVolumesRefDateGen(Date aValue){
       sheetVolumesRefDateGen = aValue;
    }
    public Date getSheetVolumesRefDateGen(){
       return sheetVolumesRefDateGen;
    }


    public void setSheetVolumesRefStartDate(Date aValue){
       sheetVolumesRefStartDate = aValue;
    }
    public Date getSheetVolumesRefStartDate(){
       return sheetVolumesRefStartDate;
    }


    public void setSheetVolumesRefEndDate(Date aValue){
       sheetVolumesRefEndDate = aValue;
    }
    public Date getSheetVolumesRefEndDate(){
       return sheetVolumesRefEndDate;
    }

    public void setSheetVolumesRefFuelType(int aValue){
       sheetVolumesRefFuelType = aValue;
    }
    public int getSheetVolumesRefFuelType(){
       return sheetVolumesRefFuelType;
    }

    public void setSheetVolumesRefUserAdd(String aValue){
       sheetVolumesRefUserAdd = aValue;
    }
    public String getSheetVolumesRefUserAdd(){
       return sheetVolumesRefUserAdd;
    }


    public void setSheetVolumesRefDateAdd(Date aValue){
       sheetVolumesRefDateAdd = aValue;
    }
    public Date getSheetVolumesRefDateAdd(){
       return sheetVolumesRefDateAdd;
    }

    public void setSheetVolumesRefUserGen(String aValue){
       sheetVolumesRefUserGen = aValue;
    }
    public String getSheetVolumesRefUserGen(){
       return sheetVolumesRefUserGen;
    }


    public void setSheetVolumesRefDateEdit(Date aValue){
       sheetVolumesRefDateEdit = aValue;
    }
    public Date getSheetVolumesRefDateEdit(){
       return sheetVolumesRefDateEdit;
    }


	public int getEikindcode() {
		return eikindcode;
	}

	public void setEikindcode(int eikindcode) {
		this.eikindcode = eikindcode;
	}


}