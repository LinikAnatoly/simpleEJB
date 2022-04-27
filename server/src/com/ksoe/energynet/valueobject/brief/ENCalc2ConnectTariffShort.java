//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

/**
 * Short Object for ENCalc2ConnectTariff;
 */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class ENCalc2ConnectTariffShort implements Serializable {

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
    public int techCondServRefCode = Integer.MIN_VALUE;
    public String techCondServRefContractNumber;
    public Date techCondServRefContractDate;
    public String techCondServRefFinContractNumber;
    public Date techCondServRefFinContractDate;
    public String techCondServRefPartnerName;
    public String techCondServRefPartnerCode;
    public String techCondServRefFinDocCode;
    public int techCondServRefFinDocID = Integer.MIN_VALUE;
    public String techCondServRefFinCommentGen;
    public BigDecimal techCondServRefTySummaGen;
    public BigDecimal techCondServRefTySummaVat;
    public BigDecimal techCondServRefTyServicesSumma;
    public BigDecimal techCondServRefTyServicesPower;
    public String techCondServRefCommentServicesGen;
    public String techCondServRefUserGen;
    public Date techCondServRefDateEdit;
    public int techCondServRefCnPackCode = Integer.MIN_VALUE;
    public String techCondServRefExecutionTerm;
    public int techCondServRefBuildersArea = Integer.MIN_VALUE;
    public int techCondServRefBaseStation = Integer.MIN_VALUE;
    public int techCondServRefSmallArchFrm = Integer.MIN_VALUE;
    public Date techCondServRefContractDateFinal;
    public int techCondServRefIsSea = Integer.MIN_VALUE;
    public int techCondServRefIsDisconnectionNeeded = Integer.MIN_VALUE;
    public int techCondServRefIsUse2Tariffs = Integer.MIN_VALUE;
    public int tariffEntry1RefCode = Integer.MIN_VALUE;
    public BigDecimal tariffEntry1RefValue;
    public Date tariffEntry1RefStartDate;
    public String tariffEntry1RefUserGen;
    public int tariffEntry2RefCode = Integer.MIN_VALUE;
    public BigDecimal tariffEntry2RefValue;
    public Date tariffEntry2RefStartDate;
    public String tariffEntry2RefUserGen;

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

    public void setTechCondServRefCode(int aValue) {
        techCondServRefCode = aValue;
    }

    public int getTechCondServRefCode() {
        return techCondServRefCode;
    }

    public void setTechCondServRefContractNumber(String aValue) {
        techCondServRefContractNumber = aValue;
    }

    public String getTechCondServRefContractNumber() {
        return techCondServRefContractNumber;
    }

    public void setTechCondServRefContractDate(Date aValue) {
        techCondServRefContractDate = aValue;
    }

    public Date getTechCondServRefContractDate() {
        return techCondServRefContractDate;
    }

    public void setTechCondServRefFinContractNumber(String aValue) {
        techCondServRefFinContractNumber = aValue;
    }

    public String getTechCondServRefFinContractNumber() {
        return techCondServRefFinContractNumber;
    }

    public void setTechCondServRefFinContractDate(Date aValue) {
        techCondServRefFinContractDate = aValue;
    }

    public Date getTechCondServRefFinContractDate() {
        return techCondServRefFinContractDate;
    }

    public void setTechCondServRefPartnerName(String aValue) {
        techCondServRefPartnerName = aValue;
    }

    public String getTechCondServRefPartnerName() {
        return techCondServRefPartnerName;
    }

    public void setTechCondServRefPartnerCode(String aValue) {
        techCondServRefPartnerCode = aValue;
    }

    public String getTechCondServRefPartnerCode() {
        return techCondServRefPartnerCode;
    }

    public void setTechCondServRefFinDocCode(String aValue) {
        techCondServRefFinDocCode = aValue;
    }

    public String getTechCondServRefFinDocCode() {
        return techCondServRefFinDocCode;
    }

    public void setTechCondServRefFinDocID(int aValue) {
        techCondServRefFinDocID = aValue;
    }

    public int getTechCondServRefFinDocID() {
        return techCondServRefFinDocID;
    }

    public void setTechCondServRefFinCommentGen(String aValue) {
        techCondServRefFinCommentGen = aValue;
    }

    public String getTechCondServRefFinCommentGen() {
        return techCondServRefFinCommentGen;
    }

    public void setTechCondServRefTySummaGen(BigDecimal aValue) {
        techCondServRefTySummaGen = aValue;
    }

    public BigDecimal getTechCondServRefTySummaGen() {
        return techCondServRefTySummaGen;
    }

    public void setTechCondServRefTySummaVat(BigDecimal aValue) {
        techCondServRefTySummaVat = aValue;
    }

    public BigDecimal getTechCondServRefTySummaVat() {
        return techCondServRefTySummaVat;
    }

    public void setTechCondServRefTyServicesSumma(BigDecimal aValue) {
        techCondServRefTyServicesSumma = aValue;
    }

    public BigDecimal getTechCondServRefTyServicesSumma() {
        return techCondServRefTyServicesSumma;
    }

    public void setTechCondServRefTyServicesPower(BigDecimal aValue) {
        techCondServRefTyServicesPower = aValue;
    }

    public BigDecimal getTechCondServRefTyServicesPower() {
        return techCondServRefTyServicesPower;
    }

    public void setTechCondServRefCommentServicesGen(String aValue) {
        techCondServRefCommentServicesGen = aValue;
    }

    public String getTechCondServRefCommentServicesGen() {
        return techCondServRefCommentServicesGen;
    }

    public void setTechCondServRefUserGen(String aValue) {
        techCondServRefUserGen = aValue;
    }

    public String getTechCondServRefUserGen() {
        return techCondServRefUserGen;
    }

    public void setTechCondServRefDateEdit(Date aValue) {
        techCondServRefDateEdit = aValue;
    }

    public Date getTechCondServRefDateEdit() {
        return techCondServRefDateEdit;
    }

    public void setTechCondServRefCnPackCode(int aValue) {
        techCondServRefCnPackCode = aValue;
    }

    public int getTechCondServRefCnPackCode() {
        return techCondServRefCnPackCode;
    }

    public void setTechCondServRefExecutionTerm(String aValue) {
        techCondServRefExecutionTerm = aValue;
    }

    public String getTechCondServRefExecutionTerm() {
        return techCondServRefExecutionTerm;
    }

    public void setTechCondServRefBuildersArea(int aValue) {
        techCondServRefBuildersArea = aValue;
    }

    public int getTechCondServRefBuildersArea() {
        return techCondServRefBuildersArea;
    }

    public void setTechCondServRefBaseStation(int aValue) {
        techCondServRefBaseStation = aValue;
    }

    public int getTechCondServRefBaseStation() {
        return techCondServRefBaseStation;
    }

    public void setTechCondServRefSmallArchFrm(int aValue) {
        techCondServRefSmallArchFrm = aValue;
    }

    public int getTechCondServRefSmallArchFrm() {
        return techCondServRefSmallArchFrm;
    }

    public void setTechCondServRefContractDateFinal(Date aValue) {
        techCondServRefContractDateFinal = aValue;
    }

    public Date getTechCondServRefContractDateFinal() {
        return techCondServRefContractDateFinal;
    }

    public void setTechCondServRefIsSea(int aValue) {
        techCondServRefIsSea = aValue;
    }

    public int getTechCondServRefIsSea() {
        return techCondServRefIsSea;
    }

    public void setTechCondServRefIsDisconnectionNeeded(int aValue) {
        techCondServRefIsDisconnectionNeeded = aValue;
    }

    public int getTechCondServRefIsDisconnectionNeeded() {
        return techCondServRefIsDisconnectionNeeded;
    }

    public void setTechCondServRefIsUse2Tariffs(int aValue) {
        techCondServRefIsUse2Tariffs = aValue;
    }

    public int getTechCondServRefIsUse2Tariffs() {
        return techCondServRefIsUse2Tariffs;
    }

    public void setTariffEntry1RefCode(int aValue) {
        tariffEntry1RefCode = aValue;
    }

    public int getTariffEntry1RefCode() {
        return tariffEntry1RefCode;
    }

    public void setTariffEntry1RefValue(BigDecimal aValue) {
        tariffEntry1RefValue = aValue;
    }

    public BigDecimal getTariffEntry1RefValue() {
        return tariffEntry1RefValue;
    }

    public void setTariffEntry1RefStartDate(Date aValue) {
        tariffEntry1RefStartDate = aValue;
    }

    public Date getTariffEntry1RefStartDate() {
        return tariffEntry1RefStartDate;
    }

    public void setTariffEntry1RefUserGen(String aValue) {
        tariffEntry1RefUserGen = aValue;
    }

    public String getTariffEntry1RefUserGen() {
        return tariffEntry1RefUserGen;
    }

    public void setTariffEntry2RefCode(int aValue) {
        tariffEntry2RefCode = aValue;
    }

    public int getTariffEntry2RefCode() {
        return tariffEntry2RefCode;
    }

    public void setTariffEntry2RefValue(BigDecimal aValue) {
        tariffEntry2RefValue = aValue;
    }

    public BigDecimal getTariffEntry2RefValue() {
        return tariffEntry2RefValue;
    }

    public void setTariffEntry2RefStartDate(Date aValue) {
        tariffEntry2RefStartDate = aValue;
    }

    public Date getTariffEntry2RefStartDate() {
        return tariffEntry2RefStartDate;
    }

    public void setTariffEntry2RefUserGen(String aValue) {
        tariffEntry2RefUserGen = aValue;
    }

    public String getTariffEntry2RefUserGen() {
        return tariffEntry2RefUserGen;
    }

}