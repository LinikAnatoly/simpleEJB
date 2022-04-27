
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENSOValuesType;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENSOValuesTypeShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String name;
	public int sortField = Integer.MIN_VALUE;
	public String userGen;
	public Date dateEdit ;
	public int categoryRefCode = Integer.MIN_VALUE;
	public String categoryRefName;


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

	public int getSortField() {
		return sortField;
	}

	public void setSortField(int sortField) {
		this.sortField = sortField;
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



	public int getCategoryRefCode(){
		return categoryRefCode;
	}

	public void setCategoryRefCode(int categoryRefCode) {
		this.categoryRefCode = categoryRefCode;
	}

	public String getCategoryRefName(){
		return categoryRefName;
	}

	public void setCategoryRefName(String categoryRefName) {
		this.categoryRefName = categoryRefName;
	}



}
