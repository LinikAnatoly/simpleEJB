//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENPlan2Humen;
 */

import java.io.Serializable;
import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.references.ENHumenItemKindRef;
import com.ksoe.energynet.valueobject.references.ENPlanWorkRef;

public class ENPlan2Humen implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String tabNumber;
	public String fio;
	public int positionCode = Integer.MIN_VALUE;
	public BigDecimal priceGen;
	public BigDecimal timeWorkGen;
	public BigDecimal timeWorkFact;
	public BigDecimal timeDelivery;
	public String positionId;
	public long modify_time = Long.MIN_VALUE;
	public ENPlanWorkRef planRef = new ENPlanWorkRef();
	public ENHumenItemKindRef humenKindRef = new ENHumenItemKindRef();


	public static final String tableName = "ENPLAN2HUMEN";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENPLAN2HUMEN.CODE";
	public static final String tabNumber_Attr = "tabNumber";
	public static final String tabNumber_Field = "TABNUMBER";
	public static final String tabNumber_QFielld = "ENPLAN2HUMEN.TABNUMBER";
	public static final String fio_Attr = "fio";
	public static final String fio_Field = "FIO";
	public static final String fio_QFielld = "ENPLAN2HUMEN.FIO";
	public static final String positionCode_Attr = "positionCode";
	public static final String positionCode_Field = "POSITIONCODE";
	public static final String positionCode_QFielld = "ENPLAN2HUMEN.POSITIONCODE";
	public static final String priceGen_Attr = "priceGen";
	public static final String priceGen_Field = "PRICEGEN";
	public static final String priceGen_QFielld = "ENPLAN2HUMEN.PRICEGEN";
	public static final String timeWorkGen_Attr = "timeWorkGen";
	public static final String timeWorkGen_Field = "TIMEWORKGEN";
	public static final String timeWorkGen_QFielld = "ENPLAN2HUMEN.TIMEWORKGEN";
	public static final String timeWorkFact_Attr = "timeWorkFact";
	public static final String timeWorkFact_Field = "TIMEWORKFACT";
	public static final String timeWorkFact_QFielld = "ENPLAN2HUMEN.TIMEWORKFACT";
	public static final String timeDelivery_Attr = "timeDelivery";
	public static final String timeDelivery_Field = "TIMEDELIVERY";
	public static final String timeDelivery_QFielld = "ENPLAN2HUMEN.TIMEDELIVERY";
	public static final String positionId_Attr = "positionId";
	public static final String positionId_Field = "POSITIONID";
	public static final String positionId_QFielld = "ENPLAN2HUMEN.POSITIONID";
	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "ENPLAN2HUMEN.MODIFY_TIME";
	public static final String planRef_Attr = "planRef";
	public static final String planRef_Field = "PLANREFCODE";
	public static final String planRef_QFielld = "ENPLAN2HUMEN.PLANREFCODE";
	public static final String humenKindRef_Attr = "humenKindRef";
	public static final String humenKindRef_Field = "HUMENKINDREFCODE";
	public static final String humenKindRef_QFielld = "ENPLAN2HUMEN.HUMENKINDREFCODE";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setTabNumber(String aValue) {
		tabNumber = aValue;
	}

	public String getTabNumber() {
		return tabNumber;
	}

	public void setFio(String aValue) {
		fio = aValue;
	}

	public String getFio() {
		return fio;
	}

	public void setPositionCode(int aValue) {
		positionCode = aValue;
	}

	public int getPositionCode() {
		return positionCode;
	}

	public void setPriceGen(BigDecimal aValue) {
		priceGen = aValue;
	}

	public BigDecimal getPriceGen() {
		return priceGen;
	}

	public void setTimeWorkGen(BigDecimal aValue) {
		timeWorkGen = aValue;
	}

	public BigDecimal getTimeWorkGen() {
		return timeWorkGen;
	}

	public void setTimeWorkFact(BigDecimal aValue) {
		timeWorkFact = aValue;
	}

	public BigDecimal getTimeWorkFact() {
		return timeWorkFact;
	}

	public void setTimeDelivery(BigDecimal aValue) {
		timeDelivery = aValue;
	}

	public BigDecimal getTimeDelivery() {
		return timeDelivery;
	}

	public void setPositionId(String aValue) {
		positionId = aValue;
	}

	public String getPositionId() {
		return positionId;
	}

	public void setModify_time(long aValue) {
		modify_time = aValue;
	}

	public long getModify_time() {
		return modify_time;
	}

	public void setPlanRef(ENPlanWorkRef aValue) {
		planRef = aValue;
	}

	public ENPlanWorkRef getPlanRef() {
		return planRef;
	}

	public void setHumenKindRef(ENHumenItemKindRef aValue) {
		humenKindRef = aValue;
	}

	public ENHumenItemKindRef getHumenKindRef() {
		return humenKindRef;
	}

} // end of ENPlan2HumenValueObject

