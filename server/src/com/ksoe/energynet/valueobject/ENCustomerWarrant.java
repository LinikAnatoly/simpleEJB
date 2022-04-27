
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import com.ksoe.energynet.valueobject.references.ENServicesObjectRef;
import com.ksoe.energynet.valueobject.references.ENWarrantRef;


@XmlRootElement(name = "ENCustomerWarrant")
@XmlAccessorType(XmlAccessType.FIELD)
public class ENCustomerWarrant implements Serializable {

	@XmlElement(defaultValue = "-2147483648")
	public int code = Integer.MIN_VALUE;

	@XmlElement(defaultValue = "-2147483648")
	public int typeCode = Integer.MIN_VALUE;

	@XmlElement(defaultValue = "-2147483648")
	public int servicesConsumerCode = Integer.MIN_VALUE;

	public String userGen;
	public long modify_time = Long.MIN_VALUE;

	public ENWarrantRef warrantRef = new ENWarrantRef();
	public ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();

	public static final String tableName = "ENCUSTOMERWARRANT";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENCUSTOMERWARRANT.CODE";
	public static final String typeCode_Attr = "typeCode";
	public static final String typeCode_Field = "TYPECODE";
	public static final String typeCode_QFielld = "ENCUSTOMERWARRANT.TYPECODE";
	public static final String servicesConsumerCode_Attr = "servicesConsumerCode";
	public static final String servicesConsumerCode_Field = "SERVICESCONSUMERCODE";
	public static final String servicesConsumerCode_QFielld = "ENCUSTOMERWARRANT.SERVICESCONSUMERCODE";
	public static final String userGen_Attr = "userGen";
	public static final String userGen_Field = "USERGEN";
	public static final String userGen_QFielld = "ENCUSTOMERWARRANT.USERGEN";
	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "ENCUSTOMERWARRANT.MODIFY_TIME";

	public static final String warrantRef_Attr = "warrantRef";
	public static final String warrantRef_Field = "WARRANTREFCODE";
	public static final String warrantRef_QFielld = "ENCUSTOMERWARRANT.WARRANTREFCODE";
	public static final String servicesObjectRef_Attr = "servicesObjectRef";
	public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
	public static final String servicesObjectRef_QFielld = "ENCUSTOMERWARRANT.SERVICESOBJECTREFCODE";

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getTypeCode() {
		return typeCode;
	}

	public void setTypeCode(int typeCode) {
		this.typeCode = typeCode;
	}

	public int getServicesConsumerCode() {
		return servicesConsumerCode;
	}

	public void setServicesConsumerCode(int servicesConsumerCode) {
		this.servicesConsumerCode = servicesConsumerCode;
	}

	public String getUserGen() {
		return userGen;
	}

	public void setUserGen(String userGen) {
		this.userGen = userGen;
	}

	public long getModify_time() {
		return modify_time;
	}

	public void setModify_time(long modify_time) {
		this.modify_time = modify_time;
	}

	public ENWarrantRef getWarrantRef() {
		return warrantRef;
	}

	public void setWarrantRef(ENWarrantRef warrantRef) {
		this.warrantRef = warrantRef;
	}

	public ENServicesObjectRef getServicesObjectRef() {
		return servicesObjectRef;
	}

	public void setServicesObjectRef(ENServicesObjectRef servicesObjectRef) {
		this.servicesObjectRef = servicesObjectRef;
	}

} // end of ENCustomerWarrantValueObject
