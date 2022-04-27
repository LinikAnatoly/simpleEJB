
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
import com.ksoe.energynet.valueobject.references.ENInspectionSheetStatusRef;
import com.ksoe.energynet.valueobject.references.ENPlanWorkRef;
import com.ksoe.techcard.valueobject.references.TKDefects2InspectionRef;

public class ENInspectionSheet implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String name;
	public int inspectionKind = Integer.MIN_VALUE;
	public Date dateGen;
	public String executor;
	public String accepted;
	public String objectInvNumber;
	public String objectName;
	public int equipmentKind = Integer.MIN_VALUE;
	public int takeIntoCalculation = Integer.MIN_VALUE;
	public String userGen;
	public Date dateEdit;
	public long modify_time = Long.MIN_VALUE;

	public ENInspectionSheetStatusRef statusRef = new ENInspectionSheetStatusRef();
	public ENElementRef elementRef = new ENElementRef();
	public TKDefects2InspectionRef defects2InspectRef = new TKDefects2InspectionRef();
	public ENPlanWorkRef planRef = new ENPlanWorkRef();

	public static final String tableName = "ENINSPECTIONSHEET";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENINSPECTIONSHEET.CODE";
	public static final String name_Attr = "name";
	public static final String name_Field = "NAME";
	public static final String name_QFielld = "ENINSPECTIONSHEET.NAME";
	public static final String inspectionKind_Attr = "inspectionKind";
	public static final String inspectionKind_Field = "INSPECTIONKIND";
	public static final String inspectionKind_QFielld = "ENINSPECTIONSHEET.INSPECTIONKIND";
	public static final String dateGen_Attr = "dateGen";
	public static final String dateGen_Field = "DATEGEN";
	public static final String dateGen_QFielld = "ENINSPECTIONSHEET.DATEGEN";
	public static final String executor_Attr = "executor";
	public static final String executor_Field = "EXECUTOR";
	public static final String executor_QFielld = "ENINSPECTIONSHEET.EXECUTOR";
	public static final String accepted_Attr = "accepted";
	public static final String accepted_Field = "ACCEPTED";
	public static final String accepted_QFielld = "ENINSPECTIONSHEET.ACCEPTED";
	public static final String objectInvNumber_Attr = "objectInvNumber";
	public static final String objectInvNumber_Field = "OBJECTINVNUMBER";
	public static final String objectInvNumber_QFielld = "ENINSPECTIONSHEET.OBJECTINVNUMBER";
	public static final String objectName_Attr = "objectName";
	public static final String objectName_Field = "OBJECTNAME";
	public static final String objectName_QFielld = "ENINSPECTIONSHEET.OBJECTNAME";
	public static final String equipmentKind_Attr = "equipmentKind";
	public static final String equipmentKind_Field = "EQUIPMENTKIND";
	public static final String equipmentKind_QFielld = "ENINSPECTIONSHEET.EQUIPMENTKIND";
	public static final String takeIntoCalculation_Attr = "takeIntoCalculation";
	public static final String takeIntoCalculation_Field = "TAKEINTOCALCULATION";
	public static final String takeIntoCalculation_QFielld = "ENINSPECTIONSHEET.TAKEINTOCALCULATION";
	public static final String userGen_Attr = "userGen";
	public static final String userGen_Field = "USERGEN";
	public static final String userGen_QFielld = "ENINSPECTIONSHEET.USERGEN";
	public static final String dateEdit_Attr = "dateEdit";
	public static final String dateEdit_Field = "DATEEDIT";
	public static final String dateEdit_QFielld = "ENINSPECTIONSHEET.DATEEDIT";
	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "ENINSPECTIONSHEET.MODIFY_TIME";

	public static final String statusRef_Attr = "statusRef";
	public static final String statusRef_Field = "STATUSREFCODE";
	public static final String statusRef_QFielld = "ENINSPECTIONSHEET.STATUSREFCODE";
	public static final String elementRef_Attr = "elementRef";
	public static final String elementRef_Field = "ELEMENTREFCODE";
	public static final String elementRef_QFielld = "ENINSPECTIONSHEET.ELEMENTREFCODE";
	public static final String defects2InspectRef_Attr = "defects2InspectRef";
	public static final String defects2InspectRef_Field = "DEFECTS2INSPECTREFCODE";
	public static final String defects2InspectRef_QFielld = "ENINSPECTIONSHEET.DEFECTS2INSPECTREFCODE";
	public static final String planRef_Attr = "planRef";
	public static final String planRef_Field = "PLANREFCODE";
	public static final String planRef_QFielld = "ENINSPECTIONSHEET.PLANREFCODE";

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

	public int getInspectionKind() {
		return inspectionKind;
	}

	public void setInspectionKind(int inspectionKind) {
		this.inspectionKind = inspectionKind;
	}

	public Date getDateGen() {
		return dateGen;
	}

	public void setDateGen(Date dateGen) {
		this.dateGen = dateGen;
	}

	public String getExecutor() {
		return executor;
	}

	public void setExecutor(String executor) {
		this.executor = executor;
	}

	public String getAccepted() {
		return accepted;
	}

	public void setAccepted(String accepted) {
		this.accepted = accepted;
	}

	public String getObjectInvNumber() {
		return objectInvNumber;
	}

	public void setObjectInvNumber(String objectInvNumber) {
		this.objectInvNumber = objectInvNumber;
	}

	public String getObjectName() {
		return objectName;
	}

	public void setObjectName(String objectName) {
		this.objectName = objectName;
	}

	public int getEquipmentKind() {
		return equipmentKind;
	}

	public void setEquipmentKind(int equipmentKind) {
		this.equipmentKind = equipmentKind;
	}

	public int getTakeIntoCalculation() {
		return takeIntoCalculation;
	}

	public void setTakeIntoCalculation(int takeIntoCalculation) {
		this.takeIntoCalculation = takeIntoCalculation;
	}

	public String getUserGen() {
		return userGen;
	}

	public void setUserGen(String userGen) {
		this.userGen = userGen;
	}

	public Date getDateEdit() {
		return dateEdit;
	}

	public void setDateEdit(Date dateEdit) {
		this.dateEdit = dateEdit;
	}

	public long getModify_time() {
		return modify_time;
	}

	public void setModify_time(long modify_time) {
		this.modify_time = modify_time;
	}

	public ENInspectionSheetStatusRef getStatusRef() {
		return statusRef;
	}

	public void setStatusRef(ENInspectionSheetStatusRef statusRef) {
		this.statusRef = statusRef;
	}

	public ENElementRef getElementRef() {
		return elementRef;
	}

	public void setElementRef(ENElementRef elementRef) {
		this.elementRef = elementRef;
	}

	public TKDefects2InspectionRef getDefects2InspectRef() {
		return defects2InspectRef;
	}

	public void setDefects2InspectRef(TKDefects2InspectionRef defects2InspectRef) {
		this.defects2InspectRef = defects2InspectRef;
	}

	public ENPlanWorkRef getPlanRef() {
		return planRef;
	}

	public void setPlanRef(ENPlanWorkRef planRef) {
		this.planRef = planRef;
	}

} // end of ENInspectionSheetValueObject
