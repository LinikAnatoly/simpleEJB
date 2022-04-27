
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
* Value Object for ENElementENElement;
*/

import java.io.Serializable;
import java.math.BigDecimal;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

import com.ksoe.energynet.valueobject.references.ENElementRef;
import com.ksoe.energynet.valueobject.references.ENElementTypeRef;
import com.ksoe.energynet.valueobject.references.ENGeographicDepartmentRef;
import com.ksoe.energypro.valueobject.references.EPRenRef;

@XmlRootElement(name = "ENElement")
@XmlAccessorType(XmlAccessType.FIELD)
public class ENElement implements Serializable {

	public int code = Integer.MIN_VALUE;
	public BigDecimal orderField;
	public String domain_info;
	public long modify_time = Long.MIN_VALUE;

	public ENElementTypeRef typeRef = new ENElementTypeRef();
	public ENElementRef elementInRef = new ENElementRef();
	public ENElementRef elementOutRef = new ENElementRef();
	public EPRenRef renRef = new EPRenRef();
	public FINExecutor finExecutor = new FINExecutor();
	public ENGeographicDepartmentRef geoDepartmentRef = new ENGeographicDepartmentRef();

	public String invNumber;
	public String name;

	public String buhName;

	public static final int CARGO_OBJECT = 1017002423;
	public static final int BUFFET_REALIZATION_OBJECT = 500007750;
	public static final int INVENTARIZATION_ORDER_OBJECT = 1017386539;
	public static final int INVENTARIZATION_WRITEOFF_OBJECT = 500009000;

	/** Закупівля лічильників для послуг */
	public static final int NO_OBJECT_COUNTERS_SERVICES = 1017396201;

	/** Перевод материалов во вторсырье */
	public static final int NO_OBJECT_RECYCLABLE_MATERIALS = 1017547431;

	public static final String tableName = "ENELEMENT";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENELEMENT.CODE";
	public static final String orderField_Attr = "orderField";
	public static final String orderField_Field = "ORDERFIELD";
	public static final String orderField_QFielld = "ENELEMENT.ORDERFIELD";
	public static final String domain_info_Attr = "domain_info";
	public static final String domain_info_Field = "DOMAIN_INFO";
	public static final String domain_info_QFielld = "ENELEMENT.DOMAIN_INFO";
	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "ENELEMENT.MODIFY_TIME";
	public static final String typeRef_Attr = "typeRef";
	public static final String typeRef_Field = "TYPEREFCODE";
	public static final String typeRef_QFielld = "ENELEMENT.TYPEREFCODE";
	public static final String elementInRef_Attr = "elementInRef";
	public static final String elementInRef_Field = "ELEMENTINREFCODE";
	public static final String elementInRef_QFielld = "ENELEMENT.ELEMENTINREFCODE";
	public static final String elementOutRef_Attr = "elementOutRef";
	public static final String elementOutRef_Field = "ELEMENTOUTREFCODE";
	public static final String elementOutRef_QFielld = "ENELEMENT.ELEMENTOUTREFCODE";
	public static final String renRef_Attr = "renRef";
	public static final String renRef_Field = "RENREFCODE";
	public static final String renRef_QFielld = "ENELEMENT.RENREFCODE";
	public static final String finExecutor_Attr = "finExecutor";
	public static final String finExecutor_Field = "FINEXECUTORCODE";
	public static final String finExecutor_QFielld = "ENELEMENT.FINEXECUTORCODE";
	public static final String geoDepartmentRef_Attr = "geoDepartmentRef";
	public static final String geoDepartmentRef_Field = "GEODEPARTMENTREFCODE";
	public static final String  geoDepartmentRef_QFielld = "ENELEMENT.GEODEPARTMENTREFCODE";

	public final String getInvNumber() {
		return invNumber;
	}

	public final void setInvNumber(String invNumber) {
		this.invNumber = invNumber;
	}

	public final String getName() {
		return name;
	}

	public final void setName(String name) {
		this.name = name;
	}

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setOrderField(BigDecimal aValue) {
		orderField = aValue;
	}

	public BigDecimal getOrderField() {
		return orderField;
	}

	public void setDomain_info(String aValue) {
		domain_info = aValue;
	}

	public String getDomain_info() {
		return domain_info;
	}

	public void setModify_time(long aValue) {
		modify_time = aValue;
	}

	public long getModify_time() {
		return modify_time;
	}

	;

	public void setTypeRef(ENElementTypeRef aValue) {
		typeRef = aValue;
	}

	public ENElementTypeRef getTypeRef() {
		return typeRef;
	}

	public void setElementInRef(ENElementRef aValue) {
		elementInRef = aValue;
	}

	public ENElementRef getElementInRef() {
		return elementInRef;
	}

	public void setElementOutRef(ENElementRef aValue) {
		elementOutRef = aValue;
	}

	public ENElementRef getElementOutRef() {
		return elementOutRef;
	}

	public void setRenRef(EPRenRef aValue) {
		renRef = aValue;
	}

	public EPRenRef getRenRef() {
		return renRef;
	}

	public String getBuhName() {
		return buhName;
	}

	public void setBuhName(String buhName) {
		this.buhName = buhName;
	}

	public void setFinExecutor(FINExecutor aValue) {
		finExecutor = aValue;
	}

	public FINExecutor getFinExecutor() {
		return finExecutor;
	}

	public ENGeographicDepartmentRef getGeoDepartmentRef(){
		return geoDepartmentRef;
	}

	public void setGeoDepartmentRef(ENGeographicDepartmentRef geoDepartmentRef){
		this.geoDepartmentRef = geoDepartmentRef;
	}

} // end of ENElementValueObject
