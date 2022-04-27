//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENCalc2ConnectTariff;
 */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENConnectionTariffEntryRef;
import com.ksoe.energynet.valueobject.references.ENTechConditionsServicesRef;

public class ENCalc2ConnectTariff implements Serializable {

    public int code = Integer.MIN_VALUE;
    public BigDecimal power1Tariff;
    public BigDecimal tariff1value;
    public BigDecimal summa1Tariff;
    public BigDecimal power2Tariff;
    public BigDecimal tariff2value;
    public BigDecimal summa2Tariff;
    public BigDecimal summaTotal;
    public String userGen;
    public Date dateEdit;
    public long modify_time = Long.MIN_VALUE;
    public ENTechConditionsServicesRef techCondServRef = new ENTechConditionsServicesRef();
    public ENConnectionTariffEntryRef tariffEntry1Ref = new ENConnectionTariffEntryRef();
    public ENConnectionTariffEntryRef tariffEntry2Ref = new ENConnectionTariffEntryRef();
    public static final String tableName = "ENCALC2CONNECTTARIFF";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENCALC2CONNECTTARIFF.CODE";
    public static final String power1Tariff_Attr = "power1Tariff";
    public static final String power1Tariff_Field = "POWER1TARIFF";
    public static final String power1Tariff_QFielld = "ENCALC2CONNECTTARIFF.POWER1TARIFF";
    public static final String tariff1value_Attr = "tariff1value";
    public static final String tariff1value_Field = "TARIFF1VALUE";
    public static final String tariff1value_QFielld = "ENCALC2CONNECTTARIFF.TARIFF1VALUE";
    public static final String summa1Tariff_Attr = "summa1Tariff";
    public static final String summa1Tariff_Field = "SUMMA1TARIFF";
    public static final String summa1Tariff_QFielld = "ENCALC2CONNECTTARIFF.SUMMA1TARIFF";
    public static final String power2Tariff_Attr = "power2Tariff";
    public static final String power2Tariff_Field = "POWER2TARIFF";
    public static final String power2Tariff_QFielld = "ENCALC2CONNECTTARIFF.POWER2TARIFF";
    public static final String tariff2value_Attr = "tariff2value";
    public static final String tariff2value_Field = "TARIFF2VALUE";
    public static final String tariff2value_QFielld = "ENCALC2CONNECTTARIFF.TARIFF2VALUE";
    public static final String summa2Tariff_Attr = "summa2Tariff";
    public static final String summa2Tariff_Field = "SUMMA2TARIFF";
    public static final String summa2Tariff_QFielld = "ENCALC2CONNECTTARIFF.SUMMA2TARIFF";
    public static final String summaTotal_Attr = "summaTotal";
    public static final String summaTotal_Field = "SUMMATOTAL";
    public static final String summaTotal_QFielld = "ENCALC2CONNECTTARIFF.SUMMATOTAL";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENCALC2CONNECTTARIFF.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENCALC2CONNECTTARIFF.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENCALC2CONNECTTARIFF.MODIFY_TIME";
    public static final String techCondServRef_Attr = "techCondServRef";
    public static final String techCondServRef_Field = "TECHCONDSERVREFCODE";
    public static final String techCondServRef_QFielld = "ENCALC2CONNECTTARIFF.TECHCONDSERVREFCODE";
    public static final String tariffEntry1Ref_Attr = "tariffEntry1Ref";
    public static final String tariffEntry1Ref_Field = "TARIFFENTRY1REFCODE";
    public static final String tariffEntry1Ref_QFielld = "ENCALC2CONNECTTARIFF.TARIFFENTRY1REFCODE";
    public static final String tariffEntry2Ref_Attr = "tariffEntry2Ref";
    public static final String tariffEntry2Ref_Field = "TARIFFENTRY2REFCODE";
    public static final String tariffEntry2Ref_QFielld = "ENCALC2CONNECTTARIFF.TARIFFENTRY2REFCODE";

    public void setCode(int aValue) {
        code = aValue;
    }

    public int getCode() {
        return code;
    }

    public void setPower1Tariff(BigDecimal aValue) {
        power1Tariff = aValue;
    }

    public BigDecimal getPower1Tariff() {
        return power1Tariff;
    }

    public void setTariff1value(BigDecimal aValue) {
        tariff1value = aValue;
    }

    public BigDecimal getTariff1value() {
        return tariff1value;
    }

    public void setSumma1Tariff(BigDecimal aValue) {
        summa1Tariff = aValue;
    }

    public BigDecimal getSumma1Tariff() {
        return summa1Tariff;
    }

    public void setPower2Tariff(BigDecimal aValue) {
        power2Tariff = aValue;
    }

    public BigDecimal getPower2Tariff() {
        return power2Tariff;
    }

    public void setTariff2value(BigDecimal aValue) {
        tariff2value = aValue;
    }

    public BigDecimal getTariff2value() {
        return tariff2value;
    }

    public void setSumma2Tariff(BigDecimal aValue) {
        summa2Tariff = aValue;
    }

    public BigDecimal getSumma2Tariff() {
        return summa2Tariff;
    }

    public void setSummaTotal(BigDecimal aValue) {
        summaTotal = aValue;
    }

    public BigDecimal getSummaTotal() {
        return summaTotal;
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

    public void setTechCondServRef(ENTechConditionsServicesRef aValue) {
        techCondServRef = aValue;
    }

    public ENTechConditionsServicesRef getTechCondServRef() {
        return techCondServRef;
    }

    public void setTariffEntry1Ref(ENConnectionTariffEntryRef aValue) {
        tariffEntry1Ref = aValue;
    }

    public ENConnectionTariffEntryRef getTariffEntry1Ref() {
        return tariffEntry1Ref;
    }

    public void setTariffEntry2Ref(ENConnectionTariffEntryRef aValue) {
        tariffEntry2Ref = aValue;
    }

    public ENConnectionTariffEntryRef getTariffEntry2Ref() {
        return tariffEntry2Ref;
    }

} // end of ENCalc2ConnectTariffValueObject

