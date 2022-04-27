
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

import java.io.Serializable;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENElementRef;
import com.ksoe.energynet.valueobject.references.ENSizMaterials2TKMaterialsRef;
import com.ksoe.techcard.valueobject.references.TKMaterialsRef;

public class ENSizMaterials2TKMaterials implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String userEdit;
	public Date dateEdit;

	public ENElementRef elementRef = new ENElementRef();
	public TKMaterialsRef sizMaterialsRef = new TKMaterialsRef();
	public TKMaterialsRef tkMaterialsRef = new TKMaterialsRef();
	public ENSizMaterials2TKMaterialsRef parentRef = new ENSizMaterials2TKMaterialsRef();

	public static final String tableName = "ENSIZMATERIALS2TKMTRLS";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENSIZMATERIALS2TKMTRLS.CODE";
	public static final String userEdit_Attr = "userEdit";
	public static final String userEdit_Field = "USEREDIT";
	public static final String userEdit_QFielld = "ENSIZMATERIALS2TKMTRLS.USEREDIT";
	public static final String dateEdit_Attr = "dateEdit";
	public static final String dateEdit_Field = "DATEEDIT";
	public static final String dateEdit_QFielld = "ENSIZMATERIALS2TKMTRLS.DATEEDIT";

	public static final String elementRef_Attr = "elementRef";
	public static final String elementRef_Field = "ELEMENTREFCODE";
	public static final String elementRef_QFielld = "ENSIZMATERIALS2TKMTRLS.ELEMENTREFCODE";
	public static final String sizMaterialsRef_Attr = "sizMaterialsRef";
	public static final String sizMaterialsRef_Field = "SIZMATERIALSREFCODE";
	public static final String sizMaterialsRef_QFielld = "ENSIZMATERIALS2TKMTRLS.SIZMATERIALSREFCODE";
	public static final String tkMaterialsRef_Attr = "tkMaterialsRef";
	public static final String tkMaterialsRef_Field = "TKMATERIALSREFCODE";
	public static final String tkMaterialsRef_QFielld = "ENSIZMATERIALS2TKMTRLS.TKMATERIALSREFCODE";
	public static final String parentRef_Attr = "parentRef";
	public static final String parentRef_Field = "PARENTREFCODE";
	public static final String parentRef_QFielld = "ENSIZMATERIALS2TKMTRLS.PARENTREFCODE";

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

	public ENElementRef getElementRef() {
		return elementRef;
	}

	public void setElementRef(ENElementRef elementRef) {
		this.elementRef = elementRef;
	}

	public TKMaterialsRef getSizMaterialsRef() {
		return sizMaterialsRef;
	}

	public void setSizMaterialsRef(TKMaterialsRef sizMaterialsRef) {
		this.sizMaterialsRef = sizMaterialsRef;
	}

	public TKMaterialsRef getTkMaterialsRef() {
		return tkMaterialsRef;
	}

	public void setTkMaterialsRef(TKMaterialsRef tkMaterialsRef) {
		this.tkMaterialsRef = tkMaterialsRef;
	}

	public ENSizMaterials2TKMaterialsRef getParentRef() {
		return parentRef;
	}

	public void setParentRef(ENSizMaterials2TKMaterialsRef parentRef) {
		this.parentRef = parentRef;
	}

} // end of ENSizMaterials2TKMaterialsValueObject
