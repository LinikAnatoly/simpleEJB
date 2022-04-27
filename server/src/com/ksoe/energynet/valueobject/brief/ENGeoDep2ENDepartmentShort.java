
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENGeoDep2ENDepartment;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENGeoDep2ENDepartmentShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String commentgen;
	public String userAdd;
	public Date dateAdd ;
	public String userGen;
	public Date dateEdit ;
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
	public int geoDepartmentRefCode = Integer.MIN_VALUE;
	public String geoDepartmentRefName;
	public String geoDepartmentRefCommentgen;
	public String geoDepartmentRefUserAdd;
	public Date geoDepartmentRefDateAdd;
	public String geoDepartmentRefUserGen;
	public Date geoDepartmentRefDateEdit;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getCommentgen() {
		return commentgen;
	}

	public void setCommentgen(String commentgen) {
		this.commentgen = commentgen;
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

	public int getGeoDepartmentRefCode(){
		return geoDepartmentRefCode;
	}

	public void setGeoDepartmentRefCode(int geoDepartmentRefCode) {
		this.geoDepartmentRefCode = geoDepartmentRefCode;
	}

	public String getGeoDepartmentRefName(){
		return geoDepartmentRefName;
	}

	public void setGeoDepartmentRefName(String geoDepartmentRefName) {
		this.geoDepartmentRefName = geoDepartmentRefName;
	}

	public String getGeoDepartmentRefCommentgen(){
		return geoDepartmentRefCommentgen;
	}

	public void setGeoDepartmentRefCommentgen(String geoDepartmentRefCommentgen) {
		this.geoDepartmentRefCommentgen = geoDepartmentRefCommentgen;
	}

	public String getGeoDepartmentRefUserAdd(){
		return geoDepartmentRefUserAdd;
	}

	public void setGeoDepartmentRefUserAdd(String geoDepartmentRefUserAdd) {
		this.geoDepartmentRefUserAdd = geoDepartmentRefUserAdd;
	}

	public Date getGeoDepartmentRefDateAdd(){
		return geoDepartmentRefDateAdd;
	}

	public void setGeoDepartmentRefDateAdd(Date geoDepartmentRefDateAdd) {
		this.geoDepartmentRefDateAdd = geoDepartmentRefDateAdd;
	}

	public String getGeoDepartmentRefUserGen(){
		return geoDepartmentRefUserGen;
	}

	public void setGeoDepartmentRefUserGen(String geoDepartmentRefUserGen) {
		this.geoDepartmentRefUserGen = geoDepartmentRefUserGen;
	}

	public Date getGeoDepartmentRefDateEdit(){
		return geoDepartmentRefDateEdit;
	}

	public void setGeoDepartmentRefDateEdit(Date geoDepartmentRefDateEdit) {
		this.geoDepartmentRefDateEdit = geoDepartmentRefDateEdit;
	}



}
