
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENMol;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENMolShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String finCode;
	public String name;
	public String phoneNumber;
	public String tabNumber;
	public String storage;
	public int statusRefCode = Integer.MIN_VALUE;
	public String statusRefName;
	public int typeRefCode = Integer.MIN_VALUE;
	public String typeRefName;
	public int departmentRefCode = Integer.MIN_VALUE;
	public String departmentRefShortName;
	public Date departmentRefDateStart;
	public Date departmentRefDateFinal;
	public int departmentRefRenCode = Integer.MIN_VALUE;
	public String departmentRefShpzBalans;
	public int departmentRefKau_table_id_1884 = Integer.MIN_VALUE;
	public String departmentRefKau_1884;
	public String departmentRefName_1884;
	public String departmentRefHrmorganizationid;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getFinCode() {
		return finCode;
	}

	public void setFinCode(String finCode) {
		this.finCode = finCode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getTabNumber() {
		return tabNumber;
	}

	public void setTabNumber(String tabNumber) {
		this.tabNumber = tabNumber;
	}

	public String getStorage() {
		return storage;
	}

	public void setStorage(String storage) {
		this.storage = storage;
	}



	public int getStatusRefCode(){
		return statusRefCode;
	}

	public void setStatusRefCode(int statusRefCode) {
		this.statusRefCode = statusRefCode;
	}

	public String getStatusRefName(){
		return statusRefName;
	}

	public void setStatusRefName(String statusRefName) {
		this.statusRefName = statusRefName;
	}

	public int getTypeRefCode(){
		return typeRefCode;
	}

	public void setTypeRefCode(int typeRefCode) {
		this.typeRefCode = typeRefCode;
	}

	public String getTypeRefName(){
		return typeRefName;
	}

	public void setTypeRefName(String typeRefName) {
		this.typeRefName = typeRefName;
	}

	public int getDepartmentRefCode(){
		return departmentRefCode;
	}

	public void setDepartmentRefCode(int departmentRefCode) {
		this.departmentRefCode = departmentRefCode;
	}

	public String getDepartmentRefShortName(){
		return departmentRefShortName;
	}

	public void setDepartmentRefShortName(String departmentRefShortName) {
		this.departmentRefShortName = departmentRefShortName;
	}

	public Date getDepartmentRefDateStart(){
		return departmentRefDateStart;
	}

	public void setDepartmentRefDateStart(Date departmentRefDateStart) {
		this.departmentRefDateStart = departmentRefDateStart;
	}

	public Date getDepartmentRefDateFinal(){
		return departmentRefDateFinal;
	}

	public void setDepartmentRefDateFinal(Date departmentRefDateFinal) {
		this.departmentRefDateFinal = departmentRefDateFinal;
	}

	public int getDepartmentRefRenCode(){
		return departmentRefRenCode;
	}

	public void setDepartmentRefRenCode(int departmentRefRenCode) {
		this.departmentRefRenCode = departmentRefRenCode;
	}

	public String getDepartmentRefShpzBalans(){
		return departmentRefShpzBalans;
	}

	public void setDepartmentRefShpzBalans(String departmentRefShpzBalans) {
		this.departmentRefShpzBalans = departmentRefShpzBalans;
	}

	public int getDepartmentRefKau_table_id_1884(){
		return departmentRefKau_table_id_1884;
	}

	public void setDepartmentRefKau_table_id_1884(int departmentRefKau_table_id_1884) {
		this.departmentRefKau_table_id_1884 = departmentRefKau_table_id_1884;
	}

	public String getDepartmentRefKau_1884(){
		return departmentRefKau_1884;
	}

	public void setDepartmentRefKau_1884(String departmentRefKau_1884) {
		this.departmentRefKau_1884 = departmentRefKau_1884;
	}

	public String getDepartmentRefName_1884(){
		return departmentRefName_1884;
	}

	public void setDepartmentRefName_1884(String departmentRefName_1884) {
		this.departmentRefName_1884 = departmentRefName_1884;
	}

	public String getDepartmentRefHrmorganizationid(){
		return departmentRefHrmorganizationid;
	}

	public void setDepartmentRefHrmorganizationid(String departmentRefHrmorganizationid) {
		this.departmentRefHrmorganizationid = departmentRefHrmorganizationid;
	}



}
