//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENDistanceENDistance;
 */

import java.io.Serializable;
import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.references.ENDistanceTypeRef;
import com.ksoe.energynet.valueobject.references.ENTransportItemRef;

public class ENDistance implements Serializable {

	public int code = Integer.MIN_VALUE;
	public BigDecimal distance;
	public String commentGen;

	public long modify_time = Long.MIN_VALUE;
	public ENDistanceTypeRef typeRef = new ENDistanceTypeRef();
	public ENRoadType roadType = new ENRoadType();
	public ENTransportItemRef transportItemRef = new ENTransportItemRef();

	public static final String tableName = "ENDISTANCE";
	public static final String code_Attr = "code";
	public static final String code_Field = "CODE";
	public static final String code_QFielld = "ENDISTANCE.CODE";
	public static final String distance_Attr = "distance";
	public static final String distance_Field = "DISTANCE";
	public static final String distance_QFielld = "ENDISTANCE.DISTANCE";
	public static final String commentGen_Attr = "commentGen";
	public static final String commentGen_Field = "COMMENTGEN";
	public static final String commentGen_QFielld = "ENDISTANCE.COMMENTGEN";

	public static final String modify_time_Attr = "modify_time";
	public static final String modify_time_Field = "MODIFY_TIME";
	public static final String modify_time_QFielld = "ENDISTANCE.MODIFY_TIME";
	public static final String typeRef_Attr = "typeRef";
	public static final String typeRef_Field = "TYPEREFCODE";
	public static final String typeRef_QFielld = "ENDISTANCE.TYPEREFCODE";
	public static final String roadType_Attr = "roadType";
	public static final String roadType_Field = "ROADTYPECODE";
	public static final String roadType_QFielld = "ENDISTANCE.ROADTYPECODE";
	public static final String transportItemRef_Attr = "transportItemRef";
	public static final String transportItemRef_Field = "TRANSPORTITEMREFCODE";
	public static final String transportItemRef_QFielld = "ENDISTANCE.TRANSPORTITEMREFCODE";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setDistance(BigDecimal aValue) {
		distance = aValue;
	}

	public BigDecimal getDistance() {
		return distance;
	}

	public void setCommentGen(String aValue) {
		commentGen = aValue;
	}

	public String getCommentGen() {
		return commentGen;
	}

	public void setModify_time(long aValue) {
		modify_time = aValue;
	}

	public long getModify_time() {
		return modify_time;
	}

	public void setTypeRef(ENDistanceTypeRef aValue) {
		typeRef = aValue;
	}

	public ENDistanceTypeRef getTypeRef() {
		return typeRef;
	}

	public void setRoadType(ENRoadType aValue) {
		roadType = aValue;
	}

	public ENRoadType getRoadType() {
		return roadType;
	}

	public void setTransportItemRef(ENTransportItemRef aValue) {
		transportItemRef = aValue;
	}

	public ENTransportItemRef getTransportItemRef() {
		return transportItemRef;
	}

} // end of ENDistanceValueObject

