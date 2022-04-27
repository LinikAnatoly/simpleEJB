//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENServicesContractKind;
 */

import java.io.Serializable;

public class ENServicesContractKind implements Serializable {

	/** неопределен - для предварительных с сайта */
	public static final int UNDEFINED = 0;

	/** Вид договора на услуги со стороны - Услуги */
	public static final int SERVICES = 1;

	/** Вид договора на услуги со стороны - Продажа */
	public static final int SALE = 2;

	/** Вид договора на услуги - оздоровление (отдых в пансионате) */
	public static final int RELAXATION = 3;

	/** Вид договора на услуги - договора аренды */
	public static final int OKSN_RENT = 4;

	/** Вид договора на услуги - договора на возмещение ущерба */
	public static final int OKSN_WORK = 5;

	/** Вид договора на услуги - договора на видачу условий(требований) к проектированию */
	public static final int OKSN_TU = 6;

	/** Вид договора на услуги - договора на согласование проекта */
	public static final int OKSN_AGREE = 7;

	/** Вид договора на услуги - договора на видачу допуска*/
	public static final int OKSN_ACCESS = 8;

	/** Вид договора на услуги - договора на внесення змін до ТУ*/
	public static final int OKSN_TU_MODIFY = 9;

	/** Вид договора на услуги - договора на проектування для приєднання*/
	public static final int PROJECT = 10;

	/** Вид договора на услуги - договора на винос електричних мереж об'єктів компанії*/
	public static final int SHIFT_LINES_COMPANY_OBJ = 11;

	/** Вид договора на услуги - договора на винос електричних мереж об'єктів замовника*/
	public static final int SHIFT_LINES_CUSTOMER_OBJ = 12;

	/** Вид договора на услуги - аренда охринцев*/
	public static final int GUARD = 13;

	/** Вид договора на услуги - Договори з постачальниками е/е */
	public static final int SUPPLIER_CONTRACT = 14;

	/** Інформаційні послуги */
	public static final int INFORMATIONAL_SERVICES = 15;

	/** Інші неліцензійні послуги */
	public static final int OTHER_NOT_LICENSED = 16;
	
	/** Винос лінії (РМ,КБ) */
	public static final int REMOVAL_LINE_RM_KB = 17;
	
	/** Послуги ЛУЗОД (АСКОЕ) */
	public static final int SERVICES_LUZOD_ASKOE = 18;

	public int code = Integer.MIN_VALUE;
	public String name;
	public static final String tableName = "ENSERVICESCONTRACTKIND";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENSERVICESCONTRACTKIND.CODE";
	public static final String name_Attr = "name";
	public static final String name_Field = "NAME";
	public static final String name_QFielld = "ENSERVICESCONTRACTKIND.NAME";

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

} // end of ENServicesContractKindValueObject

