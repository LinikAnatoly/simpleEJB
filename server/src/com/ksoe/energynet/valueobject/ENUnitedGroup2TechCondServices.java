//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENUnitedGroup2TechCondServices;
 */

import java.io.Serializable;
import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.references.ENTechConditionsServicesRef;
import com.ksoe.energynet.valueobject.references.ENUnitedGroupConnectionsRef;

public class ENUnitedGroup2TechCondServices implements Serializable {

    public int code = Integer.MIN_VALUE;
    public BigDecimal costLines04Building;
    public BigDecimal costLines04Building1;
    public BigDecimal costLines04Building2;
    public BigDecimal costLines04Building3;
    public BigDecimal costLines10Building;
    public BigDecimal costLines10Building1;
    public BigDecimal costLines10Building2;
    public BigDecimal costLines10Building3;
    public BigDecimal costLines10Building4;
    public ENTechConditionsServicesRef techCondServRef = new ENTechConditionsServicesRef();
    public ENUnitedGroupConnectionsRef unitedGroupL04D1Ref = new ENUnitedGroupConnectionsRef();
    public ENUnitedGroupConnectionsRef unitedGroupL04D2Ref = new ENUnitedGroupConnectionsRef();
    public ENUnitedGroupConnectionsRef unitedGroupL04D3Ref = new ENUnitedGroupConnectionsRef();
    public ENUnitedGroupConnectionsRef unitedGroupTP04Ref = new ENUnitedGroupConnectionsRef();
    public ENUnitedGroupConnectionsRef unitedGroupL10D1Ref = new ENUnitedGroupConnectionsRef();
    public ENUnitedGroupConnectionsRef unitedGroupL10D2Ref = new ENUnitedGroupConnectionsRef();
    public ENUnitedGroupConnectionsRef unitedGroupL10D3Ref = new ENUnitedGroupConnectionsRef();
    public ENUnitedGroupConnectionsRef unitedGroupL10D4Ref = new ENUnitedGroupConnectionsRef();
    public ENUnitedGroupConnectionsRef unitedGroupPS35Ref = new ENUnitedGroupConnectionsRef();
    public static final String tableName = "ENUNITDGRP2TCHCNDSRVCS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENUNITDGRP2TCHCNDSRVCS.CODE";
    public static final String costLines04Building_Attr = "costLines04Building";
    public static final String costLines04Building_Field = "COSTLINES04BUILDING";
    public static final String costLines04Building_QFielld = "ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING";
    public static final String costLines04Building1_Attr = "costLines04Building1";
    public static final String costLines04Building1_Field = "COSTLINES04BUILDING1";
    public static final String costLines04Building1_QFielld = "ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING1";
    public static final String costLines04Building2_Attr = "costLines04Building2";
    public static final String costLines04Building2_Field = "COSTLINES04BUILDING2";
    public static final String costLines04Building2_QFielld = "ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING2";
    public static final String costLines04Building3_Attr = "costLines04Building3";
    public static final String costLines04Building3_Field = "COSTLINES04BUILDING3";
    public static final String costLines04Building3_QFielld = "ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING3";
    public static final String costLines10Building_Attr = "costLines10Building";
    public static final String costLines10Building_Field = "COSTLINES10BUILDING";
    public static final String costLines10Building_QFielld = "ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING";
    public static final String costLines10Building1_Attr = "costLines10Building1";
    public static final String costLines10Building1_Field = "COSTLINES10BUILDING1";
    public static final String costLines10Building1_QFielld = "ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING1";
    public static final String costLines10Building2_Attr = "costLines10Building2";
    public static final String costLines10Building2_Field = "COSTLINES10BUILDING2";
    public static final String costLines10Building2_QFielld = "ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING2";
    public static final String costLines10Building3_Attr = "costLines10Building3";
    public static final String costLines10Building3_Field = "COSTLINES10BUILDING3";
    public static final String costLines10Building3_QFielld = "ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING3";
    public static final String costLines10Building4_Attr = "costLines10Building4";
    public static final String costLines10Building4_Field = "COSTLINES10BUILDING4";
    public static final String costLines10Building4_QFielld = "ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING4";
    public static final String techCondServRef_Attr = "techCondServRef";
    public static final String techCondServRef_Field = "TECHCONDSERVREFCODE";
    public static final String techCondServRef_QFielld = "ENUNITDGRP2TCHCNDSRVCS.TECHCONDSERVREFCODE";
    public static final String unitedGroupL04D1Ref_Attr = "unitedGroupL04D1Ref";
    public static final String unitedGroupL04D1Ref_Field = "UNITEDGROUPL04D1REFCOD";
    public static final String unitedGroupL04D1Ref_QFielld = "ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL04D1REFCOD";
    public static final String unitedGroupL04D2Ref_Attr = "unitedGroupL04D2Ref";
    public static final String unitedGroupL04D2Ref_Field = "UNITEDGROUPL04D2REFCOD";
    public static final String unitedGroupL04D2Ref_QFielld = "ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL04D2REFCOD";
    public static final String unitedGroupL04D3Ref_Attr = "unitedGroupL04D3Ref";
    public static final String unitedGroupL04D3Ref_Field = "UNITEDGROUPL04D3REFCOD";
    public static final String unitedGroupL04D3Ref_QFielld = "ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL04D3REFCOD";
    public static final String unitedGroupTP04Ref_Attr = "unitedGroupTP04Ref";
    public static final String unitedGroupTP04Ref_Field = "UNITEDGROUPTP04REFCODE";
    public static final String unitedGroupTP04Ref_QFielld = "ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPTP04REFCODE";
    public static final String unitedGroupL10D1Ref_Attr = "unitedGroupL10D1Ref";
    public static final String unitedGroupL10D1Ref_Field = "UNITEDGROUPL10D1REFCOD";
    public static final String unitedGroupL10D1Ref_QFielld = "ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL10D1REFCOD";
    public static final String unitedGroupL10D2Ref_Attr = "unitedGroupL10D2Ref";
    public static final String unitedGroupL10D2Ref_Field = "UNITEDGROUPL10D2REFCOD";
    public static final String unitedGroupL10D2Ref_QFielld = "ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL10D2REFCOD";
    public static final String unitedGroupL10D3Ref_Attr = "unitedGroupL10D3Ref";
    public static final String unitedGroupL10D3Ref_Field = "UNITEDGROUPL10D3REFCOD";
    public static final String unitedGroupL10D3Ref_QFielld = "ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL10D3REFCOD";
    public static final String unitedGroupL10D4Ref_Attr = "unitedGroupL10D4Ref";
    public static final String unitedGroupL10D4Ref_Field = "UNITEDGROUPL10D4REFCOD";
    public static final String unitedGroupL10D4Ref_QFielld = "ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL10D4REFCOD";
    public static final String unitedGroupPS35Ref_Attr = "unitedGroupPS35Ref";
    public static final String unitedGroupPS35Ref_Field = "UNITEDGROUPPS35REFCODE";
    public static final String unitedGroupPS35Ref_QFielld = "ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPPS35REFCODE";

    public void setCode(int aValue) {
        code = aValue;
    }

    public int getCode() {
        return code;
    }

    public void setCostLines04Building(BigDecimal aValue) {
        costLines04Building = aValue;
    }

    public BigDecimal getCostLines04Building() {
        return costLines04Building;
    }

    public void setCostLines04Building1(BigDecimal aValue) {
        costLines04Building1 = aValue;
    }

    public BigDecimal getCostLines04Building1() {
        return costLines04Building1;
    }

    public void setCostLines04Building2(BigDecimal aValue) {
        costLines04Building2 = aValue;
    }

    public BigDecimal getCostLines04Building2() {
        return costLines04Building2;
    }

    public void setCostLines04Building3(BigDecimal aValue) {
        costLines04Building3 = aValue;
    }

    public BigDecimal getCostLines04Building3() {
        return costLines04Building3;
    }

    public void setCostLines10Building(BigDecimal aValue) {
        costLines10Building = aValue;
    }

    public BigDecimal getCostLines10Building() {
        return costLines10Building;
    }

    public void setCostLines10Building1(BigDecimal aValue) {
        costLines10Building1 = aValue;
    }

    public BigDecimal getCostLines10Building1() {
        return costLines10Building1;
    }

    public void setCostLines10Building2(BigDecimal aValue) {
        costLines10Building2 = aValue;
    }

    public BigDecimal getCostLines10Building2() {
        return costLines10Building2;
    }

    public void setCostLines10Building3(BigDecimal aValue) {
        costLines10Building3 = aValue;
    }

    public BigDecimal getCostLines10Building3() {
        return costLines10Building3;
    }

    public void setCostLines10Building4(BigDecimal aValue) {
        costLines10Building4 = aValue;
    }

    public BigDecimal getCostLines10Building4() {
        return costLines10Building4;
    }

    public void setTechCondServRef(ENTechConditionsServicesRef aValue) {
        techCondServRef = aValue;
    }

    public ENTechConditionsServicesRef getTechCondServRef() {
        return techCondServRef;
    }

    public void setUnitedGroupL04D1Ref(ENUnitedGroupConnectionsRef aValue) {
        unitedGroupL04D1Ref = aValue;
    }

    public ENUnitedGroupConnectionsRef getUnitedGroupL04D1Ref() {
        return unitedGroupL04D1Ref;
    }

    public void setUnitedGroupL04D2Ref(ENUnitedGroupConnectionsRef aValue) {
        unitedGroupL04D2Ref = aValue;
    }

    public ENUnitedGroupConnectionsRef getUnitedGroupL04D2Ref() {
        return unitedGroupL04D2Ref;
    }

    public void setUnitedGroupL04D3Ref(ENUnitedGroupConnectionsRef aValue) {
        unitedGroupL04D3Ref = aValue;
    }

    public ENUnitedGroupConnectionsRef getUnitedGroupL04D3Ref() {
        return unitedGroupL04D3Ref;
    }

    public void setUnitedGroupTP04Ref(ENUnitedGroupConnectionsRef aValue) {
        unitedGroupTP04Ref = aValue;
    }

    public ENUnitedGroupConnectionsRef getUnitedGroupTP04Ref() {
        return unitedGroupTP04Ref;
    }

    public void setUnitedGroupL10D1Ref(ENUnitedGroupConnectionsRef aValue) {
        unitedGroupL10D1Ref = aValue;
    }

    public ENUnitedGroupConnectionsRef getUnitedGroupL10D1Ref() {
        return unitedGroupL10D1Ref;
    }

    public void setUnitedGroupL10D2Ref(ENUnitedGroupConnectionsRef aValue) {
        unitedGroupL10D2Ref = aValue;
    }

    public ENUnitedGroupConnectionsRef getUnitedGroupL10D2Ref() {
        return unitedGroupL10D2Ref;
    }

    public void setUnitedGroupL10D3Ref(ENUnitedGroupConnectionsRef aValue) {
        unitedGroupL10D3Ref = aValue;
    }

    public ENUnitedGroupConnectionsRef getUnitedGroupL10D3Ref() {
        return unitedGroupL10D3Ref;
    }

    public void setUnitedGroupL10D4Ref(ENUnitedGroupConnectionsRef aValue) {
        unitedGroupL10D4Ref = aValue;
    }

    public ENUnitedGroupConnectionsRef getUnitedGroupL10D4Ref() {
        return unitedGroupL10D4Ref;
    }

    public void setUnitedGroupPS35Ref(ENUnitedGroupConnectionsRef aValue) {
        unitedGroupPS35Ref = aValue;
    }

    public ENUnitedGroupConnectionsRef getUnitedGroupPS35Ref() {
        return unitedGroupPS35Ref;
    }

} // end of ENUnitedGroup2TechCondServicesValueObject

