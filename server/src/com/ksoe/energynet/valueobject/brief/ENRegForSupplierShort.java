
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENRegForSupplier;  	
  */

import java.io.Serializable;
import java.util.Date;


public class ENRegForSupplierShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String numberGen;
	public Date dateFrom ;
	public Date dateTo ;
	public int supplierCode = Integer.MIN_VALUE;
	public String commentGen;
	public String userGen;
	public Date dateEdit ;
	public int typeRefCode = Integer.MIN_VALUE;
	public String typeRefName;
	public String typeRefDescription;
	public int statusRefCode = Integer.MIN_VALUE;
	public String statusRefName;

	/////
	public String supplierName;
	/////

	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setNumberGen(String aValue){
		numberGen = aValue;
	}

	public String getNumberGen(){
		return numberGen;
	}

	public void setDateFrom(Date aValue){
		dateFrom = aValue;
	}

	public Date getDateFrom(){
		return dateFrom;
	}

	public void setDateTo(Date aValue){
		dateTo = aValue;
	}

	public Date getDateTo(){
		return dateTo;
	}

	public void setSupplierCode(int aValue){
		supplierCode = aValue;
	}

	public int getSupplierCode(){
		return supplierCode;
	}

	public void setCommentGen(String aValue){
		commentGen = aValue;
	}

	public String getCommentGen(){
		return commentGen;
	}




	public void setUserGen(String aValue){
		userGen = aValue;
	}

	public String getUserGen(){
		return userGen;
	}

	public void setDateEdit(Date aValue){
		dateEdit = aValue;
	}

	public Date getDateEdit(){
		return dateEdit;
	}


	public void setTypeRefCode(int aValue){
		typeRefCode = aValue;
	}
	public int getTypeRefCode(){
		return typeRefCode;
	}

	public void setTypeRefName(String aValue){
		typeRefName = aValue;
	}
	public String getTypeRefName(){
		return typeRefName;
	}

	public void setTypeRefDescription(String aValue){
		typeRefDescription = aValue;
	}
	public String getTypeRefDescription(){
		return typeRefDescription;
	}

	public void setStatusRefCode(int aValue){
		statusRefCode = aValue;
	}
	public int getStatusRefCode(){
		return statusRefCode;
	}

	public void setStatusRefName(String aValue){
		statusRefName = aValue;
	}
	public String getStatusRefName(){
		return statusRefName;
	}

	/////
	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	/////

}
