
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;



@XmlRootElement(name = "FINExecutor")
@XmlAccessorType(XmlAccessType.FIELD)
public class FINExecutor implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String name;
	public int finCode = Integer.MIN_VALUE;
	public String finTypeName;
	public int finTypeCode = Integer.MIN_VALUE;
	public String finKindName;
	public int finKindCode = Integer.MIN_VALUE;
	public String finCehName;
	public int finCehCode = Integer.MIN_VALUE;
	public String axOrgId;
	public String axParentOrgId;
	public String axParentOrgName;
	public int axOrgTypeId = Integer.MIN_VALUE;
	public String axOrgTypeName;
	public long modify_time = Long.MIN_VALUE;
	public static final String tableName = "FINEXECUTOR";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "FINEXECUTOR.CODE";
	public static final String name_Attr = "name";
	public static final String name_Field = "NAME";
	public static final String name_QFielld = "FINEXECUTOR.NAME";
	public static final String finCode_Attr = "finCode";
	public static final String finCode_Field = "FINCODE";
	public static final String finCode_QFielld = "FINEXECUTOR.FINCODE";
	public static final String finTypeName_Attr = "finTypeName";
	public static final String finTypeName_Field = "FINTYPENAME";
	public static final String finTypeName_QFielld = "FINEXECUTOR.FINTYPENAME";
	public static final String finTypeCode_Attr = "finTypeCode";
	public static final String finTypeCode_Field = "FINTYPECODE";
	public static final String finTypeCode_QFielld = "FINEXECUTOR.FINTYPECODE";
	public static final String finKindName_Attr = "finKindName";
	public static final String finKindName_Field = "FINKINDNAME";
	public static final String finKindName_QFielld = "FINEXECUTOR.FINKINDNAME";
	public static final String finKindCode_Attr = "finKindCode";
	public static final String finKindCode_Field = "FINKINDCODE";
	public static final String finKindCode_QFielld = "FINEXECUTOR.FINKINDCODE";
	public static final String finCehName_Attr = "finCehName";
	public static final String finCehName_Field = "FINCEHNAME";
	public static final String finCehName_QFielld = "FINEXECUTOR.FINCEHNAME";
	public static final String finCehCode_Attr = "finCehCode";
	public static final String finCehCode_Field = "FINCEHCODE";
	public static final String finCehCode_QFielld = "FINEXECUTOR.FINCEHCODE";
	public static final String axOrgId_Attr = "axOrgId";
	public static final String axOrgId_Field = "AXORGID";
	public static final String axOrgId_QFielld = "FINEXECUTOR.AXORGID";
	public static final String axParentOrgId_Attr = "axParentOrgId";
	public static final String axParentOrgId_Field = "AXPARENTORGID";
	public static final String axParentOrgId_QFielld = "FINEXECUTOR.AXPARENTORGID";
	public static final String axParentOrgName_Attr = "axParentOrgName";
	public static final String axParentOrgName_Field = "AXPARENTORGNAME";
	public static final String axParentOrgName_QFielld = "FINEXECUTOR.AXPARENTORGNAME";
	public static final String axOrgTypeId_Attr = "axOrgTypeId";
	public static final String axOrgTypeId_Field = "AXORGTYPEID";
	public static final String axOrgTypeId_QFielld = "FINEXECUTOR.AXORGTYPEID";
	public static final String axOrgTypeName_Attr = "axOrgTypeName";
	public static final String axOrgTypeName_Field = "AXORGTYPENAME";
	public static final String axOrgTypeName_QFielld = "FINEXECUTOR.AXORGTYPENAME";
	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "FINEXECUTOR.MODIFY_TIME";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setName(String aValue) {
		name = aValue;
	}

	public String getName() {
		return name;
	}

	public void setFinCode(int aValue) {
		finCode = aValue;
	}

	public int getFinCode() {
		return finCode;
	}

	public void setFinTypeName(String aValue) {
		finTypeName = aValue;
	}

	public String getFinTypeName() {
		return finTypeName;
	}

	public void setFinTypeCode(int aValue) {
		finTypeCode = aValue;
	}

	public int getFinTypeCode() {
		return finTypeCode;
	}

	public void setFinKindName(String aValue) {
		finKindName = aValue;
	}

	public String getFinKindName() {
		return finKindName;
	}

	public void setFinKindCode(int aValue) {
		finKindCode = aValue;
	}

	public int getFinKindCode() {
		return finKindCode;
	}

	public void setFinCehName(String aValue) {
		finCehName = aValue;
	}

	public String getFinCehName() {
		return finCehName;
	}

	public void setFinCehCode(int aValue) {
		finCehCode = aValue;
	}

	public int getFinCehCode() {
		return finCehCode;
	}

	public void setAxOrgId(String aValue) {
		axOrgId = aValue;
	}

	public String getAxOrgId() {
		return axOrgId;
	}

	public void setAxParentOrgId(String aValue) {
		axParentOrgId = aValue;
	}

	public String getAxParentOrgId() {
		return axParentOrgId;
	}

	public void setAxParentOrgName(String aValue) {
		axParentOrgName = aValue;
	}

	public String getAxParentOrgName() {
		return axParentOrgName;
	}

	public void setAxOrgTypeId(int aValue) {
		axOrgTypeId = aValue;
	}

	public int getAxOrgTypeId() {
		return axOrgTypeId;
	}

	public void setAxOrgTypeName(String aValue) {
		axOrgTypeName = aValue;
	}

	public String getAxOrgTypeName() {
		return axOrgTypeName;
	}

	public void setModify_time(long aValue) {
		modify_time = aValue;
	}

	public long getModify_time() {
		return modify_time;
	}

} // end of FINExecutorValueObject
