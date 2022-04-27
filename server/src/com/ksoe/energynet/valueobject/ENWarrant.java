
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

import java.io.Serializable;

/**
  * Value Object for ENWarrant;
  */

import java.math.BigDecimal;
import java.util.Date;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import com.ksoe.energynet.valueobject.references.ENDepartmentRef;
import com.ksoe.energynet.valueobject.references.ENWarrantStatusRef;
import com.ksoe.energynet.valueobject.references.ENWarrantTypeRef;


@XmlRootElement(name = "ENWarrant")
@XmlAccessorType(XmlAccessType.FIELD)
public class ENWarrant implements Serializable {

	@XmlElement(defaultValue = "-2147483648")
	public int code = Integer.MIN_VALUE;

	public String numbergen;
	public String name;
	public Date dateStart;
	public Date dateFinal;
	public String warrantFIO;
	public String warrantShortFIO;
	public String warrantPosition;
	public String genitiveFIO;
	public String genitivePosition;
	public String personSurname;
	public String personSurnameGenitive;
	public String personName;
	public String personNameGenitive;
	public String personPatronimic;
	public String personPatronimicGenitive;
	public String passport;
	public String address;
	public Date dateGen;

	@XmlElement(defaultValue = "-2147483648")
	public int power = Integer.MIN_VALUE;

	public BigDecimal maxSum;
	public String domain_info;
	public long modify_time = Long.MIN_VALUE;
	public String departmentName;
	public String departmentNameGenitive;

	public ENDepartmentRef departmentRef = new ENDepartmentRef();
	public ENWarrantStatusRef warrantStatusRef = new ENWarrantStatusRef();
	public ENWarrantTypeRef warrantTypeRef = new ENWarrantTypeRef();


	public static final String tableName = "ENWARRANT";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENWARRANT.CODE";
	public static final String numbergen_Attr = "numbergen";
	public static final String numbergen_Field = "NUMBERGEN";
	public static final String numbergen_QFielld = "ENWARRANT.NUMBERGEN";
	public static final String name_Attr = "name";
	public static final String name_Field = "NAME";
	public static final String name_QFielld = "ENWARRANT.NAME";
	public static final String dateStart_Attr = "dateStart";
	public static final String dateStart_Field = "DATESTART";
	public static final String dateStart_QFielld = "ENWARRANT.DATESTART";
	public static final String dateFinal_Attr = "dateFinal";
	public static final String dateFinal_Field = "DATEFINAL";
	public static final String dateFinal_QFielld = "ENWARRANT.DATEFINAL";
	public static final String warrantFIO_Attr = "warrantFIO";
	public static final String warrantFIO_Field = "WARRANTFIO";
	public static final String warrantFIO_QFielld = "ENWARRANT.WARRANTFIO";
	public static final String warrantShortFIO_Attr = "warrantShortFIO";
	public static final String warrantShortFIO_Field = "WARRANTSHORTFIO";
	public static final String warrantShortFIO_QFielld = "ENWARRANT.WARRANTSHORTFIO";
	public static final String warrantPosition_Attr = "warrantPosition";
	public static final String warrantPosition_Field = "WARRANTPOSITION";
	public static final String warrantPosition_QFielld = "ENWARRANT.WARRANTPOSITION";
	public static final String genitiveFIO_Attr = "genitiveFIO";
	public static final String genitiveFIO_Field = "GENITIVEFIO";
	public static final String genitiveFIO_QFielld = "ENWARRANT.GENITIVEFIO";
	public static final String genitivePosition_Attr = "genitivePosition";
	public static final String genitivePosition_Field = "GENITIVEPOSITION";
	public static final String genitivePosition_QFielld = "ENWARRANT.GENITIVEPOSITION";
	public static final String personSurname_Attr = "personSurname";
	public static final String personSurname_Field = "PERSONSURNAME";
	public static final String personSurname_QFielld = "ENWARRANT.PERSONSURNAME";
	public static final String personSurnameGenitive_Attr = "personSurnameGenitive";
	public static final String personSurnameGenitive_Field = "PERSONSURNAMEGENITIVE";
	public static final String personSurnameGenitive_QFielld = "ENWARRANT.PERSONSURNAMEGENITIVE";
	public static final String personName_Attr = "personName";
	public static final String personName_Field = "PERSONNAME";
	public static final String personName_QFielld = "ENWARRANT.PERSONNAME";
	public static final String personNameGenitive_Attr = "personNameGenitive";
	public static final String personNameGenitive_Field = "PERSONNAMEGENITIVE";
	public static final String personNameGenitive_QFielld = "ENWARRANT.PERSONNAMEGENITIVE";
	public static final String personPatronimic_Attr = "personPatronimic";
	public static final String personPatronimic_Field = "PERSONPATRONIMIC";
	public static final String personPatronimic_QFielld = "ENWARRANT.PERSONPATRONIMIC";
	public static final String personPatronimicGenitive_Attr = "personPatronimicGenitive";
	public static final String personPatronimicGenitive_Field = "PERSONPATRONIMICGENITIVE";
	public static final String personPatronimicGenitive_QFielld = "ENWARRANT.PERSONPATRONIMICGENITV";
	public static final String passport_Attr = "passport";
	public static final String passport_Field = "PASSPORT";
	public static final String passport_QFielld = "ENWARRANT.PASSPORT";
	public static final String address_Attr = "address";
	public static final String address_Field = "ADDRESS";
	public static final String address_QFielld = "ENWARRANT.ADDRESS";
	public static final String dateGen_Attr = "dateGen";
	public static final String dateGen_Field = "DATEGEN";
	public static final String dateGen_QFielld = "ENWARRANT.DATEGEN";
	public static final String power_Attr = "power";
	public static final String power_Field = "POWER";
	public static final String power_QFielld = "ENWARRANT.POWER";
	public static final String maxSum_Attr = "maxSum";
	public static final String maxSum_Field = "MAXSUM";
	public static final String maxSum_QFielld = "ENWARRANT.MAXSUM";
	public static final String domain_info_Attr = "domain_info";
	public static final String domain_info_Field = "DOMAIN_INFO";
	public static final String domain_info_QFielld = "ENWARRANT.DOMAIN_INFO";
	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "ENWARRANT.MODIFY_TIME";
	public static final String departmentName_Attr = "departmentName";
	public static final String departmentName_Field = "DEPARTMENTNAME";
	public static final String departmentName_QFielld = "ENWARRANT.DEPARTMENTNAME";
	public static final String departmentNameGenitive_Attr = "departmentNameGenitive";
	public static final String departmentNameGenitive_Field = "DEPARTMENTNAMEGENITIVE";
	public static final String departmentNameGenitive_QFielld = "ENWARRANT.DEPARTMENTNAMEGENITIVE";
	public static final String departmentRef_Attr = "departmentRef";
	public static final String departmentRef_Field = "DEPARTMENTREFCODE";
	public static final String departmentRef_QFielld = "ENWARRANT.DEPARTMENTREFCODE";
	public static final String warrantStatusRef_Attr = "warrantStatusRef";
	public static final String warrantStatusRef_Field = "WARRANTSTATUSREFCODE";
	public static final String warrantStatusRef_QFielld = "ENWARRANT.WARRANTSTATUSREFCODE";
	public static final String warrantTypeRef_Attr = "warrantTypeRef";
	public static final String warrantTypeRef_Field = "WARRANTTYPEREFCODE";
	public static final String warrantTypeRef_QFielld = "ENWARRANT.WARRANTTYPEREFCODE";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setNumbergen(String aValue) {
		numbergen = aValue;
	}

	public String getNumbergen() {
		return numbergen;
	}

	public void setName(String aValue) {
		name = aValue;
	}

	public String getName() {
		return name;
	}

	public void setDateStart(Date aValue) {
		dateStart = aValue;
	}

	public Date getDateStart() {
		return dateStart;
	}

	public void setDateFinal(Date aValue) {
		dateFinal = aValue;
	}

	public Date getDateFinal() {
		return dateFinal;
	}

	public void setWarrantFIO(String aValue) {
		warrantFIO = aValue;
	}

	public String getWarrantFIO() {
		return warrantFIO;
	}

	public void setWarrantShortFIO(String aValue) {
		warrantShortFIO = aValue;
	}

	public String getWarrantShortFIO() {
		return warrantShortFIO;
	}

	public void setWarrantPosition(String aValue) {
		warrantPosition = aValue;
	}

	public String getWarrantPosition() {
		return warrantPosition;
	}

	public void setGenitiveFIO(String aValue) {
		genitiveFIO = aValue;
	}

	public String getGenitiveFIO() {
		return genitiveFIO;
	}

	public void setGenitivePosition(String aValue) {
		genitivePosition = aValue;
	}

	public String getGenitivePosition() {
		return genitivePosition;
	}

	public void setPersonSurname(String aValue) {
		personSurname = aValue;
	}

	public String getPersonSurname() {
		return personSurname;
	}

	public void setPersonSurnameGenitive(String aValue) {
		personSurnameGenitive = aValue;
	}

	public String getPersonSurnameGenitive() {
		return personSurnameGenitive;
	}

	public void setPersonName(String aValue) {
		personName = aValue;
	}

	public String getPersonName() {
		return personName;
	}

	public void setPersonNameGenitive(String aValue) {
		personNameGenitive = aValue;
	}

	public String getPersonNameGenitive() {
		return personNameGenitive;
	}

	public void setPersonPatronimic(String aValue) {
		personPatronimic = aValue;
	}

	public String getPersonPatronimic() {
		return personPatronimic;
	}

	public void setPersonPatronimicGenitive(String aValue) {
		personPatronimicGenitive = aValue;
	}

	public String getPersonPatronimicGenitive() {
		return personPatronimicGenitive;
	}

	public void setPassport(String aValue) {
		passport = aValue;
	}

	public String getPassport() {
		return passport;
	}

	public void setAddress(String aValue) {
		address = aValue;
	}

	public String getAddress() {
		return address;
	}

	public void setDateGen(Date aValue) {
		dateGen = aValue;
	}

	public Date getDateGen() {
		return dateGen;
	}

	public void setPower(int aValue) {
		power = aValue;
	}

	public int getPower() {
		return power;
	}

	public void setMaxSum(BigDecimal aValue) {
		maxSum = aValue;
	}

	public BigDecimal getMaxSum() {
		return maxSum;
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

	public void setDepartmentName(String aValue) {
		departmentName = aValue;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentNameGenitive(String aValue) {
		departmentNameGenitive = aValue;
	}

	public String getDepartmentNameGenitive() {
		return departmentNameGenitive;
	}

	public void setDepartmentRef(ENDepartmentRef aValue) {
		departmentRef = aValue;
	}

	public ENDepartmentRef getDepartmentRef() {
		return departmentRef;
	}

	public void setWarrantStatusRef(ENWarrantStatusRef aValue) {
		warrantStatusRef = aValue;
	}

	public ENWarrantStatusRef getWarrantStatusRef() {
		return warrantStatusRef;
	}

	public void setWarrantTypeRef(ENWarrantTypeRef aValue) {
		warrantTypeRef = aValue;
	}

	public ENWarrantTypeRef getWarrantTypeRef() {
		return warrantTypeRef;
	}

} // end of ENWarrantValueObject
