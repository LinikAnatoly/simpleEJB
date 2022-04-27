//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

/**
 * Short Object for ENCottage;
 */

import java.io.Serializable;
import java.util.Date;

public class ENCottageShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String numberGen;
	public int numberBeds = Integer.MIN_VALUE;
	public String description;
	public String commentgen;
	public String userGen;
	public Date dateEdit;

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setNumberGen(String aValue) {
		numberGen = aValue;
	}

	public String getNumberGen() {
		return numberGen;
	}

	public void setNumberBeds(int aValue) {
		numberBeds = aValue;
	}

	public int getNumberBeds() {
		return numberBeds;
	}

	public void setDescription(String aValue) {
		description = aValue;
	}

	public String getDescription() {
		return description;
	}

	public void setCommentgen(String aValue) {
		commentgen = aValue;
	}

	public String getCommentgen() {
		return commentgen;
	}

	public void setUserGen(String aValue) {
		userGen = aValue;
	}

	public String getUserGen() {
		return userGen;
	}

	public void setDateEdit(Date aValue) {
		dateEdit = aValue;
	}

	public Date getDateEdit() {
		return dateEdit;
	}

}