
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

import java.io.Serializable;

/**
* Short Object for ENSizMaterials2TKMaterials;
*/

import java.math.BigDecimal;
import java.util.Date;

public class ENSizMaterials2TKMaterialsShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String userEdit;
	public Date dateEdit;
	public int elementRefCode = Integer.MIN_VALUE;
	public int sizMaterialsRefCode = Integer.MIN_VALUE;
	public String sizMaterialsRefName;
	public BigDecimal sizMaterialsRefCost;
	public int sizMaterialsRefDeliveryDate = Integer.MIN_VALUE;
	public String sizMaterialsRefNumkatalog;
	public String sizMaterialsRefIdentid;
	public int tkMaterialsRefCode = Integer.MIN_VALUE;
	public String tkMaterialsRefName;
	public BigDecimal tkMaterialsRefCost;
	public int tkMaterialsRefDeliveryDate = Integer.MIN_VALUE;
	public String tkMaterialsRefNumkatalog;
	public String tkMaterialsRefIdentid;
	public int parentRefCode = Integer.MIN_VALUE;
	public String parentRefUserEdit;
	public Date parentRefDateEdit;

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getUserEdit() {
		return userEdit;
	}

	public void setUserEdit(String userEdit) {
		this.userEdit = userEdit;
	}

	public Date getDateEdit() {
		return dateEdit;
	}

	public void setDateEdit(Date dateEdit) {
		this.dateEdit = dateEdit;
	}

	public int getElementRefCode() {
		return elementRefCode;
	}

	public void setElementRefCode(int elementRefCode) {
		this.elementRefCode = elementRefCode;
	}

	public int getSizMaterialsRefCode() {
		return sizMaterialsRefCode;
	}

	public void setSizMaterialsRefCode(int sizMaterialsRefCode) {
		this.sizMaterialsRefCode = sizMaterialsRefCode;
	}

	public String getSizMaterialsRefName() {
		return sizMaterialsRefName;
	}

	public void setSizMaterialsRefName(String sizMaterialsRefName) {
		this.sizMaterialsRefName = sizMaterialsRefName;
	}

	public BigDecimal getSizMaterialsRefCost() {
		return sizMaterialsRefCost;
	}

	public void setSizMaterialsRefCost(BigDecimal sizMaterialsRefCost) {
		this.sizMaterialsRefCost = sizMaterialsRefCost;
	}

	public int getSizMaterialsRefDeliveryDate() {
		return sizMaterialsRefDeliveryDate;
	}

	public void setSizMaterialsRefDeliveryDate(int sizMaterialsRefDeliveryDate) {
		this.sizMaterialsRefDeliveryDate = sizMaterialsRefDeliveryDate;
	}

	public String getSizMaterialsRefNumkatalog() {
		return sizMaterialsRefNumkatalog;
	}

	public void setSizMaterialsRefNumkatalog(String sizMaterialsRefNumkatalog) {
		this.sizMaterialsRefNumkatalog = sizMaterialsRefNumkatalog;
	}

	public String getSizMaterialsRefIdentid() {
		return sizMaterialsRefIdentid;
	}

	public void setSizMaterialsRefIdentid(String sizMaterialsRefIdentid) {
		this.sizMaterialsRefIdentid = sizMaterialsRefIdentid;
	}

	public int getTkMaterialsRefCode() {
		return tkMaterialsRefCode;
	}

	public void setTkMaterialsRefCode(int tkMaterialsRefCode) {
		this.tkMaterialsRefCode = tkMaterialsRefCode;
	}

	public String getTkMaterialsRefName() {
		return tkMaterialsRefName;
	}

	public void setTkMaterialsRefName(String tkMaterialsRefName) {
		this.tkMaterialsRefName = tkMaterialsRefName;
	}

	public BigDecimal getTkMaterialsRefCost() {
		return tkMaterialsRefCost;
	}

	public void setTkMaterialsRefCost(BigDecimal tkMaterialsRefCost) {
		this.tkMaterialsRefCost = tkMaterialsRefCost;
	}

	public int getTkMaterialsRefDeliveryDate() {
		return tkMaterialsRefDeliveryDate;
	}

	public void setTkMaterialsRefDeliveryDate(int tkMaterialsRefDeliveryDate) {
		this.tkMaterialsRefDeliveryDate = tkMaterialsRefDeliveryDate;
	}

	public String getTkMaterialsRefNumkatalog() {
		return tkMaterialsRefNumkatalog;
	}

	public void setTkMaterialsRefNumkatalog(String tkMaterialsRefNumkatalog) {
		this.tkMaterialsRefNumkatalog = tkMaterialsRefNumkatalog;
	}

	public String getTkMaterialsRefIdentid() {
		return tkMaterialsRefIdentid;
	}

	public void setTkMaterialsRefIdentid(String tkMaterialsRefIdentid) {
		this.tkMaterialsRefIdentid = tkMaterialsRefIdentid;
	}

	public int getParentRefCode() {
		return parentRefCode;
	}

	public void setParentRefCode(int parentRefCode) {
		this.parentRefCode = parentRefCode;
	}

	public String getParentRefUserEdit() {
		return parentRefUserEdit;
	}

	public void setParentRefUserEdit(String parentRefUserEdit) {
		this.parentRefUserEdit = parentRefUserEdit;
	}

	public Date getParentRefDateEdit() {
		return parentRefDateEdit;
	}

	public void setParentRefDateEdit(Date parentRefDateEdit) {
		this.parentRefDateEdit = parentRefDateEdit;
	}

}
