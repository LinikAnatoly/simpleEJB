
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENMol2GeoDepartment;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENMol2GeoDepartmentShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public int molCode = Integer.MIN_VALUE;
	public String molFinCode;
	public String molName;
	public String molPhoneNumber;
	public String molTabNumber;
	public String molStorage;
	public int geoDepartmentCode = Integer.MIN_VALUE;
	public String geoDepartmentName;
	public String geoDepartmentCommentgen;
	public String geoDepartmentUserAdd;
	public Date geoDepartmentDateAdd;
	public String geoDepartmentUserGen;
	public Date geoDepartmentDateEdit;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}



	public int getMolCode(){
		return molCode;
	}

	public void setMolCode(int molCode) {
		this.molCode = molCode;
	}

	public String getMolFinCode(){
		return molFinCode;
	}

	public void setMolFinCode(String molFinCode) {
		this.molFinCode = molFinCode;
	}

	public String getMolName(){
		return molName;
	}

	public void setMolName(String molName) {
		this.molName = molName;
	}

	public String getMolPhoneNumber(){
		return molPhoneNumber;
	}

	public void setMolPhoneNumber(String molPhoneNumber) {
		this.molPhoneNumber = molPhoneNumber;
	}

	public String getMolTabNumber(){
		return molTabNumber;
	}

	public void setMolTabNumber(String molTabNumber) {
		this.molTabNumber = molTabNumber;
	}

	public String getMolStorage(){
		return molStorage;
	}

	public void setMolStorage(String molStorage) {
		this.molStorage = molStorage;
	}

	public int getGeoDepartmentCode(){
		return geoDepartmentCode;
	}

	public void setGeoDepartmentCode(int geoDepartmentCode) {
		this.geoDepartmentCode = geoDepartmentCode;
	}

	public String getGeoDepartmentName(){
		return geoDepartmentName;
	}

	public void setGeoDepartmentName(String geoDepartmentName) {
		this.geoDepartmentName = geoDepartmentName;
	}

	public String getGeoDepartmentCommentgen(){
		return geoDepartmentCommentgen;
	}

	public void setGeoDepartmentCommentgen(String geoDepartmentCommentgen) {
		this.geoDepartmentCommentgen = geoDepartmentCommentgen;
	}

	public String getGeoDepartmentUserAdd(){
		return geoDepartmentUserAdd;
	}

	public void setGeoDepartmentUserAdd(String geoDepartmentUserAdd) {
		this.geoDepartmentUserAdd = geoDepartmentUserAdd;
	}

	public Date getGeoDepartmentDateAdd(){
		return geoDepartmentDateAdd;
	}

	public void setGeoDepartmentDateAdd(Date geoDepartmentDateAdd) {
		this.geoDepartmentDateAdd = geoDepartmentDateAdd;
	}

	public String getGeoDepartmentUserGen(){
		return geoDepartmentUserGen;
	}

	public void setGeoDepartmentUserGen(String geoDepartmentUserGen) {
		this.geoDepartmentUserGen = geoDepartmentUserGen;
	}

	public Date getGeoDepartmentDateEdit(){
		return geoDepartmentDateEdit;
	}

	public void setGeoDepartmentDateEdit(Date geoDepartmentDateEdit) {
		this.geoDepartmentDateEdit = geoDepartmentDateEdit;
	}



}
