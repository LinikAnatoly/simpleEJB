
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

import java.io.Serializable;

public class ENDocAttachmentType implements Serializable {

	public static final int DEFAULT = 1;

	public static final int DISTRIBUTION_POINT_PASSPORT_FOR_SITE = 15;
	public static final int ESTIMATE = 16;

	/** доверенность заказчика */
	public static final int CUSTOMER_WARRANT = 17;

	/** Повідомлення про надання послуги з приєднання 
	 * (оно же - Прибутковий акт на договір про виконання ТУ) */
	public static final int ENACTINCOMETECHCONDITIONS = 18;

	/**
	 * Лист. Для сайта
	 */
	public static final int LETTER_FOR_SITE = 20;

	public int code = Integer.MIN_VALUE;
	public String name;

	public static final String tableName = "ENDOCATTACHMENTTYPE";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENDOCATTACHMENTTYPE.CODE";
	public static final String name_Attr = "name";
	public static final String name_Field = "NAME";
	public static final String name_QFielld = "ENDOCATTACHMENTTYPE.NAME";

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

} // end of ENDocAttachmentTypeValueObject
