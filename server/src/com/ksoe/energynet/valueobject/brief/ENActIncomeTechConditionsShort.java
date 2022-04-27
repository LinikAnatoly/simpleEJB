//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

/**
 * Short Object for ENActIncomeTechConditions;
 */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class ENActIncomeTechConditionsShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String numbergen;
    public Date dategen;
    public Date actDateStart;
    public Date actDateEnd;
    public BigDecimal summaGen;
    public BigDecimal summaVat;
    public int techCondServicesRefCode = Integer.MIN_VALUE;
    public String techCondServicesRefContractNumber;
    public Date techCondServicesRefContractDate;
    public String techCondServicesRefFinContractNumber;
    public Date techCondServicesRefFinContractDate;
    public String techCondServicesRefPartnerName;
    public String techCondServicesRefPartnerCode;
    public String techCondServicesRefFinDocCode;
    public int techCondServicesRefFinDocID = Integer.MIN_VALUE;
    public String techCondServicesRefFinCommentGen;
    public BigDecimal techCondServicesRefTySummaGen;
    public BigDecimal techCondServicesRefTySummaVat;
    public BigDecimal techCondServicesRefTyServicesSumma;
    public BigDecimal techCondServicesRefTyServicesPower;
    public String techCondServicesRefCommentServicesGen;
    public String techCondServicesRefUserGen;
    public Date techCondServicesRefDateEdit;
    public int techCondServicesRefCnPackCode = Integer.MIN_VALUE;
    public String techCondServicesRefExecutionTerm;
    public int techCondServicesRefBuildersArea = Integer.MIN_VALUE;
    public int techCondServicesRefBaseStation = Integer.MIN_VALUE;
    public int techCondServicesRefSmallArchFrm = Integer.MIN_VALUE;
    public Date techCondServicesRefContractDateFinal;
    public int techCondServicesRefIsSea = Integer.MIN_VALUE;
    public int statusRefCode = Integer.MIN_VALUE;
    public String statusRefName;
    public int warrantRefCode = Integer.MIN_VALUE;
    public String warrantRefNumbergen;
    public String warrantRefName;
    public String warrantRefWarrantFIO;
    public String warrantRefWarrantShortFIO;
    public String warrantRefWarrantPosition;
    public String warrantRefGenitiveFIO;
    public String warrantRefGenitivePosition;
    public String warrantRefPassport;
    public String warrantRefAddress;
    public int warrantRefPower = Integer.MIN_VALUE;
    public BigDecimal warrantRefMaxSum;

    public void setCode(int aValue) {
        code = aValue;
    }

    public int getCode() {
        return code;
    }

    public void setNumbergen(String aValue) {
        numbergen = aValue;
    }

    public String getNumbergen() {
        return numbergen;
    }

    public void setDategen(Date aValue) {
        dategen = aValue;
    }

    public Date getDategen() {
        return dategen;
    }

    public void setActDateStart(Date aValue) {
        actDateStart = aValue;
    }

    public Date getActDateStart() {
        return actDateStart;
    }

    public void setActDateEnd(Date aValue) {
        actDateEnd = aValue;
    }

    public Date getActDateEnd() {
        return actDateEnd;
    }

    public void setSummaGen(BigDecimal aValue) {
        summaGen = aValue;
    }

    public BigDecimal getSummaGen() {
        return summaGen;
    }

    public void setSummaVat(BigDecimal aValue) {
        summaVat = aValue;
    }

    public BigDecimal getSummaVat() {
        return summaVat;
    }

    public void setTechCondServicesRefCode(int aValue) {
        techCondServicesRefCode = aValue;
    }

    public int getTechCondServicesRefCode() {
        return techCondServicesRefCode;
    }

    public void setTechCondServicesRefContractNumber(String aValue) {
        techCondServicesRefContractNumber = aValue;
    }

    public String getTechCondServicesRefContractNumber() {
        return techCondServicesRefContractNumber;
    }

    public void setTechCondServicesRefContractDate(Date aValue) {
        techCondServicesRefContractDate = aValue;
    }

    public Date getTechCondServicesRefContractDate() {
        return techCondServicesRefContractDate;
    }

    public void setTechCondServicesRefFinContractNumber(String aValue) {
        techCondServicesRefFinContractNumber = aValue;
    }

    public String getTechCondServicesRefFinContractNumber() {
        return techCondServicesRefFinContractNumber;
    }

    public void setTechCondServicesRefFinContractDate(Date aValue) {
        techCondServicesRefFinContractDate = aValue;
    }

    public Date getTechCondServicesRefFinContractDate() {
        return techCondServicesRefFinContractDate;
    }

    public void setTechCondServicesRefPartnerName(String aValue) {
        techCondServicesRefPartnerName = aValue;
    }

    public String getTechCondServicesRefPartnerName() {
        return techCondServicesRefPartnerName;
    }

    public void setTechCondServicesRefPartnerCode(String aValue) {
        techCondServicesRefPartnerCode = aValue;
    }

    public String getTechCondServicesRefPartnerCode() {
        return techCondServicesRefPartnerCode;
    }

    public void setTechCondServicesRefFinDocCode(String aValue) {
        techCondServicesRefFinDocCode = aValue;
    }

    public String getTechCondServicesRefFinDocCode() {
        return techCondServicesRefFinDocCode;
    }

    public void setTechCondServicesRefFinDocID(int aValue) {
        techCondServicesRefFinDocID = aValue;
    }

    public int getTechCondServicesRefFinDocID() {
        return techCondServicesRefFinDocID;
    }

    public void setTechCondServicesRefFinCommentGen(String aValue) {
        techCondServicesRefFinCommentGen = aValue;
    }

    public String getTechCondServicesRefFinCommentGen() {
        return techCondServicesRefFinCommentGen;
    }

    public void setTechCondServicesRefTySummaGen(BigDecimal aValue) {
        techCondServicesRefTySummaGen = aValue;
    }

    public BigDecimal getTechCondServicesRefTySummaGen() {
        return techCondServicesRefTySummaGen;
    }

    public void setTechCondServicesRefTySummaVat(BigDecimal aValue) {
        techCondServicesRefTySummaVat = aValue;
    }

    public BigDecimal getTechCondServicesRefTySummaVat() {
        return techCondServicesRefTySummaVat;
    }

    public void setTechCondServicesRefTyServicesSumma(BigDecimal aValue) {
        techCondServicesRefTyServicesSumma = aValue;
    }

    public BigDecimal getTechCondServicesRefTyServicesSumma() {
        return techCondServicesRefTyServicesSumma;
    }

    public void setTechCondServicesRefTyServicesPower(BigDecimal aValue) {
        techCondServicesRefTyServicesPower = aValue;
    }

    public BigDecimal getTechCondServicesRefTyServicesPower() {
        return techCondServicesRefTyServicesPower;
    }

    public void setTechCondServicesRefCommentServicesGen(String aValue) {
        techCondServicesRefCommentServicesGen = aValue;
    }

    public String getTechCondServicesRefCommentServicesGen() {
        return techCondServicesRefCommentServicesGen;
    }

    public void setTechCondServicesRefUserGen(String aValue) {
        techCondServicesRefUserGen = aValue;
    }

    public String getTechCondServicesRefUserGen() {
        return techCondServicesRefUserGen;
    }

    public void setTechCondServicesRefDateEdit(Date aValue) {
        techCondServicesRefDateEdit = aValue;
    }

    public Date getTechCondServicesRefDateEdit() {
        return techCondServicesRefDateEdit;
    }

    public void setTechCondServicesRefCnPackCode(int aValue) {
        techCondServicesRefCnPackCode = aValue;
    }

    public int getTechCondServicesRefCnPackCode() {
        return techCondServicesRefCnPackCode;
    }

    public void setTechCondServicesRefExecutionTerm(String aValue) {
        techCondServicesRefExecutionTerm = aValue;
    }

    public String getTechCondServicesRefExecutionTerm() {
        return techCondServicesRefExecutionTerm;
    }

    public void setTechCondServicesRefBuildersArea(int aValue) {
        techCondServicesRefBuildersArea = aValue;
    }

    public int getTechCondServicesRefBuildersArea() {
        return techCondServicesRefBuildersArea;
    }

    public void setTechCondServicesRefBaseStation(int aValue) {
        techCondServicesRefBaseStation = aValue;
    }

    public int getTechCondServicesRefBaseStation() {
        return techCondServicesRefBaseStation;
    }

    public void setTechCondServicesRefSmallArchFrm(int aValue) {
        techCondServicesRefSmallArchFrm = aValue;
    }

    public int getTechCondServicesRefSmallArchFrm() {
        return techCondServicesRefSmallArchFrm;
    }

    public void setTechCondServicesRefContractDateFinal(Date aValue) {
        techCondServicesRefContractDateFinal = aValue;
    }

    public Date getTechCondServicesRefContractDateFinal() {
        return techCondServicesRefContractDateFinal;
    }

    public void setTechCondServicesRefIsSea(int aValue) {
        techCondServicesRefIsSea = aValue;
    }

    public int getTechCondServicesRefIsSea() {
        return techCondServicesRefIsSea;
    }

    public void setStatusRefCode(int aValue) {
        statusRefCode = aValue;
    }

    public int getStatusRefCode() {
        return statusRefCode;
    }

    public void setStatusRefName(String aValue) {
        statusRefName = aValue;
    }

    public String getStatusRefName() {
        return statusRefName;
    }

    public void setWarrantRefCode(int aValue) {
        warrantRefCode = aValue;
    }

    public int getWarrantRefCode() {
        return warrantRefCode;
    }

    public void setWarrantRefNumbergen(String aValue) {
        warrantRefNumbergen = aValue;
    }

    public String getWarrantRefNumbergen() {
        return warrantRefNumbergen;
    }

    public void setWarrantRefName(String aValue) {
        warrantRefName = aValue;
    }

    public String getWarrantRefName() {
        return warrantRefName;
    }

    public void setWarrantRefWarrantFIO(String aValue) {
        warrantRefWarrantFIO = aValue;
    }

    public String getWarrantRefWarrantFIO() {
        return warrantRefWarrantFIO;
    }

    public void setWarrantRefWarrantShortFIO(String aValue) {
        warrantRefWarrantShortFIO = aValue;
    }

    public String getWarrantRefWarrantShortFIO() {
        return warrantRefWarrantShortFIO;
    }

    public void setWarrantRefWarrantPosition(String aValue) {
        warrantRefWarrantPosition = aValue;
    }

    public String getWarrantRefWarrantPosition() {
        return warrantRefWarrantPosition;
    }

    public void setWarrantRefGenitiveFIO(String aValue) {
        warrantRefGenitiveFIO = aValue;
    }

    public String getWarrantRefGenitiveFIO() {
        return warrantRefGenitiveFIO;
    }

    public void setWarrantRefGenitivePosition(String aValue) {
        warrantRefGenitivePosition = aValue;
    }

    public String getWarrantRefGenitivePosition() {
        return warrantRefGenitivePosition;
    }

    public void setWarrantRefPassport(String aValue) {
        warrantRefPassport = aValue;
    }

    public String getWarrantRefPassport() {
        return warrantRefPassport;
    }

    public void setWarrantRefAddress(String aValue) {
        warrantRefAddress = aValue;
    }

    public String getWarrantRefAddress() {
        return warrantRefAddress;
    }

    public void setWarrantRefPower(int aValue) {
        warrantRefPower = aValue;
    }

    public int getWarrantRefPower() {
        return warrantRefPower;
    }

    public void setWarrantRefMaxSum(BigDecimal aValue) {
        warrantRefMaxSum = aValue;
    }

    public BigDecimal getWarrantRefMaxSum() {
        return warrantRefMaxSum;
    }

}