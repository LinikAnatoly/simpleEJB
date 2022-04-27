//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

/**
 * Short Object for ENCottage2TKClassificationType;
 */

import java.io.Serializable;
import java.util.Date;

public class ENCottage2TKClassificationTypeShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String userGen;
	public Date dateEdit;
	public int classificationTypeRefCode = Integer.MIN_VALUE;
	public String classificationTypeRefName;
	public String classificationTypeRefKod;
	public int cottageRefCode = Integer.MIN_VALUE;
	public String cottageRefNumberGen;
	public int cottageRefNumberBeds = Integer.MIN_VALUE;
	public String cottageRefDescription;
	public String cottageRefCommentgen;
	public String cottageRefUserGen;
	public Date cottageRefDateEdit;

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
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

	public void setClassificationTypeRefCode(int aValue) {
		classificationTypeRefCode = aValue;
	}

	public int getClassificationTypeRefCode() {
		return classificationTypeRefCode;
	}

	public void setClassificationTypeRefName(String aValue) {
		classificationTypeRefName = aValue;
	}

	public String getClassificationTypeRefName() {
		return classificationTypeRefName;
	}

	public void setClassificationTypeRefKod(String aValue) {
		classificationTypeRefKod = aValue;
	}

	public String getClassificationTypeRefKod() {
		return classificationTypeRefKod;
	}

	public void setCottageRefCode(int aValue) {
		cottageRefCode = aValue;
	}

	public int getCottageRefCode() {
		return cottageRefCode;
	}

	public void setCottageRefNumberGen(String aValue) {
		cottageRefNumberGen = aValue;
	}

	public String getCottageRefNumberGen() {
		return cottageRefNumberGen;
	}

	public void setCottageRefNumberBeds(int aValue) {
		cottageRefNumberBeds = aValue;
	}

	public int getCottageRefNumberBeds() {
		return cottageRefNumberBeds;
	}

	public void setCottageRefDescription(String aValue) {
		cottageRefDescription = aValue;
	}

	public String getCottageRefDescription() {
		return cottageRefDescription;
	}

	public void setCottageRefCommentgen(String aValue) {
		cottageRefCommentgen = aValue;
	}

	public String getCottageRefCommentgen() {
		return cottageRefCommentgen;
	}

	public void setCottageRefUserGen(String aValue) {
		cottageRefUserGen = aValue;
	}

	public String getCottageRefUserGen() {
		return cottageRefUserGen;
	}

	public void setCottageRefDateEdit(Date aValue) {
		cottageRefDateEdit = aValue;
	}

	public Date getCottageRefDateEdit() {
		return cottageRefDateEdit;
	}

}