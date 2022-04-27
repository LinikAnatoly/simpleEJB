//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENServicesObject2TechCondtnsServices;
 */

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.ENServicesObjectRef;
import com.ksoe.energynet.valueobject.references.ENTechConditionsServicesRef;

public class ENServicesObject2TechCondtnsServices implements Serializable {

    public int code = Integer.MIN_VALUE;
    public ENTechConditionsServicesRef techCondServRef = new ENTechConditionsServicesRef();
    public ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();
    public static final String tableName = "ENSERVICESOBJECT2TECHCONDTNSSERVICES";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSERVICESOBJECT2TECHCONDTNSSERVICES.CODE";
    public static final String techCondServRef_Attr = "techCondServRef";
    public static final String techCondServRef_Field = "TECHCONDSERVREFCODE";
    public static final String techCondServRef_QFielld = "ENSERVICESOBJECT2TECHCONDTNSSERVICES.TECHCONDSERVREFCODE";
    public static final String servicesObjectRef_Attr = "servicesObjectRef";
    public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
    public static final String servicesObjectRef_QFielld = "ENSERVICESOBJECT2TECHCONDTNSSERVICES.SERVICESOBJECTREFCODE";

    public void setCode(int aValue) {
        code = aValue;
    }

    public int getCode() {
        return code;
    }

    public void setTechCondServRef(ENTechConditionsServicesRef aValue) {
        techCondServRef = aValue;
    }

    public ENTechConditionsServicesRef getTechCondServRef() {
        return techCondServRef;
    }

    public void setServicesObjectRef(ENServicesObjectRef aValue) {
        servicesObjectRef = aValue;
    }

    public ENServicesObjectRef getServicesObjectRef() {
        return servicesObjectRef;
    }

} // end of ENServicesObject2TechCondtnsServicesValueObject

