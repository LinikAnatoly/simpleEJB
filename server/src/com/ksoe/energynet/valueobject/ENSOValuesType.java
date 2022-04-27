
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import com.ksoe.energynet.valueobject.references.ENSOValuesTypeCategoryRef;

public class ENSOValuesType implements Serializable {

	/** Фактична дата підключення*/
	public static final int CONNECTION_DATE = 3;


	public static final int LIMIT_DATE_CONTRACT_WORKS = 4;

	/** Дата та номер реєстрації заяви */
	public static final int CONTRACT_REGISTRATION_DATE = 12;

	/** Початок надання послуги (перша сплата) */
	public static final int SERVICE_START = 17;

	/** Зупинення строку приєднання (виставлення другого платежу) */
	public static final int SERVICE_STOP = 18;

	public static final int SERVICE_SECOND_START = 25;

	/** Дата виконання останньої роботи по договору про приєднання */
	public static final int DATE_FINISH_WORKS = 19;

	/** Типи по сроках для стандартного приєднання */
	public static final List<Integer> TERMS_FOR_STANDARD_CONNECTION = Arrays.asList(SERVICE_START, SERVICE_STOP,
			SERVICE_SECOND_START, LIMIT_DATE_CONTRACT_WORKS, DATE_FINISH_WORKS);

	/** Номер стадії відведення земельної ділянки */
	public static final int LAND_SHEET_STAGE_NUMBER = 26;


	/** 37 - Опис робіт (для Повідомлення) */
	public static final int JOB_DESCRIPTION_FOR_NOTIFICATION = 37;
	
	/** Дата отримання замовником рахунку та ТУ */
	public static final int TU_RECEIVING_DATE = 38;

	/** Логін для входу в кабінет із приєднання */
	public static final int PERSONAL_CABINET_LOGIN = 40;
	/** Пароль для входу в кабінет із приєднання */
	public static final int PERSONAL_CABINET_PASSWORD = 41;

	/** Кошти не сплачені, ТУ втратили чинність*/
	public static final int FUNDS_HAVE_NOT_BEEN_PAID = 51;

	/** Поштовий індекс */
	public static final int INDEX = 59;

	public int code = Integer.MIN_VALUE;
	public String name;
	public int sortField = Integer.MIN_VALUE;
	public String userGen;
	public Date dateEdit;
	public long modify_time = Long.MIN_VALUE;

	public ENSOValuesTypeCategoryRef categoryRef = new ENSOValuesTypeCategoryRef();

	public static final String tableName = "ENSOVALUESTYPE";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENSOVALUESTYPE.CODE";
	public static final String name_Attr = "name";
	public static final String name_Field = "NAME";
	public static final String name_QFielld = "ENSOVALUESTYPE.NAME";
	public static final String sortField_Attr = "sortField";
	public static final String sortField_Field = "SORTFIELD";
	public static final String sortField_QFielld = "ENSOVALUESTYPE.SORTFIELD";
	public static final String userGen_Attr = "userGen";
	public static final String userGen_Field = "USERGEN";
	public static final String userGen_QFielld = "ENSOVALUESTYPE.USERGEN";
	public static final String dateEdit_Attr = "dateEdit";
	public static final String dateEdit_Field = "DATEEDIT";
	public static final String dateEdit_QFielld = "ENSOVALUESTYPE.DATEEDIT";
	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "ENSOVALUESTYPE.MODIFY_TIME";

	public static final String categoryRef_Attr = "categoryRef";
	public static final String categoryRef_Field = "CATEGORYREFCODE";
	public static final String categoryRef_QFielld = "ENSOVALUESTYPE.CATEGORYREFCODE";

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

	public void setSortField(int aValue) {
		sortField = aValue;
	}

	public int getSortField() {
		return sortField;
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

	public void setModify_time(long aValue) {
		modify_time = aValue;
	}

	public long getModify_time() {
		return modify_time;
	}

	public ENSOValuesTypeCategoryRef getCategoryRef() {
		return categoryRef;
	}

	public void setCategoryRef(ENSOValuesTypeCategoryRef categoryRef) {
		this.categoryRef = categoryRef;
	}

} // end of ENSOValuesTypeValueObject
