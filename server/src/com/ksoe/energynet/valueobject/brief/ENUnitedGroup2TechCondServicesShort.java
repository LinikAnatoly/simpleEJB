//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

/**
 * Short Object for ENUnitedGroup2TechCondServices;
 */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class ENUnitedGroup2TechCondServicesShort implements Serializable {

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
    public int unitedGroupL04D1RefCode = Integer.MIN_VALUE;
    public String unitedGroupL04D1RefName;
    public String unitedGroupL04D1RefDescription;
    public int unitedGroupL04D2RefCode = Integer.MIN_VALUE;
    public String unitedGroupL04D2RefName;
    public String unitedGroupL04D2RefDescription;
    public int unitedGroupL04D3RefCode = Integer.MIN_VALUE;
    public String unitedGroupL04D3RefName;
    public String unitedGroupL04D3RefDescription;
    public int unitedGroupTP04RefCode = Integer.MIN_VALUE;
    public String unitedGroupTP04RefName;
    public String unitedGroupTP04RefDescription;
    public int unitedGroupL10D1RefCode = Integer.MIN_VALUE;
    public String unitedGroupL10D1RefName;
    public String unitedGroupL10D1RefDescription;
    public int unitedGroupL10D2RefCode = Integer.MIN_VALUE;
    public String unitedGroupL10D2RefName;
    public String unitedGroupL10D2RefDescription;
    public int unitedGroupL10D3RefCode = Integer.MIN_VALUE;
    public String unitedGroupL10D3RefName;
    public String unitedGroupL10D3RefDescription;
    public int unitedGroupL10D4RefCode = Integer.MIN_VALUE;
    public String unitedGroupL10D4RefName;
    public String unitedGroupL10D4RefDescription;
    public int unitedGroupPS35RefCode = Integer.MIN_VALUE;
    public String unitedGroupPS35RefName;
    public String unitedGroupPS35RefDescription;

    /*****************************/
    public int line04Code = Integer.MIN_VALUE;
    public String line04InvNumber;
    public String line04Name;
    public int tp04Code = Integer.MIN_VALUE;
    public String tp04InvNumber;
    public String tp04Name;
    public int line10Code = Integer.MIN_VALUE;
    public String line10invnumber;
    public String line10Name;
    public int pc35Code = Integer.MIN_VALUE;
    public String pc35InvNumber;
    public String pc35Name;
    public BigDecimal paySum;

    public int techCondServRefCnSubsystemRefCode = Integer.MIN_VALUE;
    public String techCondServRefCnSubsystemRefName;
    /*****************************/

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

    public void setUnitedGroupL04D1RefCode(int aValue) {
        unitedGroupL04D1RefCode = aValue;
    }

    public int getUnitedGroupL04D1RefCode() {
        return unitedGroupL04D1RefCode;
    }

    public void setUnitedGroupL04D1RefName(String aValue) {
        unitedGroupL04D1RefName = aValue;
    }

    public String getUnitedGroupL04D1RefName() {
        return unitedGroupL04D1RefName;
    }

    public void setUnitedGroupL04D1RefDescription(String aValue) {
        unitedGroupL04D1RefDescription = aValue;
    }

    public String getUnitedGroupL04D1RefDescription() {
        return unitedGroupL04D1RefDescription;
    }

    public void setUnitedGroupL04D2RefCode(int aValue) {
        unitedGroupL04D2RefCode = aValue;
    }

    public int getUnitedGroupL04D2RefCode() {
        return unitedGroupL04D2RefCode;
    }

    public void setUnitedGroupL04D2RefName(String aValue) {
        unitedGroupL04D2RefName = aValue;
    }

    public String getUnitedGroupL04D2RefName() {
        return unitedGroupL04D2RefName;
    }

    public void setUnitedGroupL04D2RefDescription(String aValue) {
        unitedGroupL04D2RefDescription = aValue;
    }

    public String getUnitedGroupL04D2RefDescription() {
        return unitedGroupL04D2RefDescription;
    }

    public void setUnitedGroupL04D3RefCode(int aValue) {
        unitedGroupL04D3RefCode = aValue;
    }

    public int getUnitedGroupL04D3RefCode() {
        return unitedGroupL04D3RefCode;
    }

    public void setUnitedGroupL04D3RefName(String aValue) {
        unitedGroupL04D3RefName = aValue;
    }

    public String getUnitedGroupL04D3RefName() {
        return unitedGroupL04D3RefName;
    }

    public void setUnitedGroupL04D3RefDescription(String aValue) {
        unitedGroupL04D3RefDescription = aValue;
    }

    public String getUnitedGroupL04D3RefDescription() {
        return unitedGroupL04D3RefDescription;
    }

    public void setUnitedGroupTP04RefCode(int aValue) {
        unitedGroupTP04RefCode = aValue;
    }

    public int getUnitedGroupTP04RefCode() {
        return unitedGroupTP04RefCode;
    }

    public void setUnitedGroupTP04RefName(String aValue) {
        unitedGroupTP04RefName = aValue;
    }

    public String getUnitedGroupTP04RefName() {
        return unitedGroupTP04RefName;
    }

    public void setUnitedGroupTP04RefDescription(String aValue) {
        unitedGroupTP04RefDescription = aValue;
    }

    public String getUnitedGroupTP04RefDescription() {
        return unitedGroupTP04RefDescription;
    }

    public void setUnitedGroupL10D1RefCode(int aValue) {
        unitedGroupL10D1RefCode = aValue;
    }

    public int getUnitedGroupL10D1RefCode() {
        return unitedGroupL10D1RefCode;
    }

    public void setUnitedGroupL10D1RefName(String aValue) {
        unitedGroupL10D1RefName = aValue;
    }

    public String getUnitedGroupL10D1RefName() {
        return unitedGroupL10D1RefName;
    }

    public void setUnitedGroupL10D1RefDescription(String aValue) {
        unitedGroupL10D1RefDescription = aValue;
    }

    public String getUnitedGroupL10D1RefDescription() {
        return unitedGroupL10D1RefDescription;
    }

    public void setUnitedGroupL10D2RefCode(int aValue) {
        unitedGroupL10D2RefCode = aValue;
    }

    public int getUnitedGroupL10D2RefCode() {
        return unitedGroupL10D2RefCode;
    }

    public void setUnitedGroupL10D2RefName(String aValue) {
        unitedGroupL10D2RefName = aValue;
    }

    public String getUnitedGroupL10D2RefName() {
        return unitedGroupL10D2RefName;
    }

    public void setUnitedGroupL10D2RefDescription(String aValue) {
        unitedGroupL10D2RefDescription = aValue;
    }

    public String getUnitedGroupL10D2RefDescription() {
        return unitedGroupL10D2RefDescription;
    }

    public void setUnitedGroupL10D3RefCode(int aValue) {
        unitedGroupL10D3RefCode = aValue;
    }

    public int getUnitedGroupL10D3RefCode() {
        return unitedGroupL10D3RefCode;
    }

    public void setUnitedGroupL10D3RefName(String aValue) {
        unitedGroupL10D3RefName = aValue;
    }

    public String getUnitedGroupL10D3RefName() {
        return unitedGroupL10D3RefName;
    }

    public void setUnitedGroupL10D3RefDescription(String aValue) {
        unitedGroupL10D3RefDescription = aValue;
    }

    public String getUnitedGroupL10D3RefDescription() {
        return unitedGroupL10D3RefDescription;
    }

    public void setUnitedGroupL10D4RefCode(int aValue) {
        unitedGroupL10D4RefCode = aValue;
    }

    public int getUnitedGroupL10D4RefCode() {
        return unitedGroupL10D4RefCode;
    }

    public void setUnitedGroupL10D4RefName(String aValue) {
        unitedGroupL10D4RefName = aValue;
    }

    public String getUnitedGroupL10D4RefName() {
        return unitedGroupL10D4RefName;
    }

    public void setUnitedGroupL10D4RefDescription(String aValue) {
        unitedGroupL10D4RefDescription = aValue;
    }

    public String getUnitedGroupL10D4RefDescription() {
        return unitedGroupL10D4RefDescription;
    }

    public void setUnitedGroupPS35RefCode(int aValue) {
        unitedGroupPS35RefCode = aValue;
    }

    public int getUnitedGroupPS35RefCode() {
        return unitedGroupPS35RefCode;
    }

    public void setUnitedGroupPS35RefName(String aValue) {
        unitedGroupPS35RefName = aValue;
    }

    public String getUnitedGroupPS35RefName() {
        return unitedGroupPS35RefName;
    }

    public void setUnitedGroupPS35RefDescription(String aValue) {
        unitedGroupPS35RefDescription = aValue;
    }

    public String getUnitedGroupPS35RefDescription() {
        return unitedGroupPS35RefDescription;
    }

    public final String getLine04InvNumber() {
        return line04InvNumber;
    }

    public final void setLine04InvNumber(String line04InvNumber) {
        this.line04InvNumber = line04InvNumber;
    }

    public final String getLine04Name() {
        return line04Name;
    }

    public final void setLine04Name(String line04Name) {
        this.line04Name = line04Name;
    }

    public final String getTp04InvNumber() {
        return tp04InvNumber;
    }

    public final void setTp04InvNumber(String tp04InvNumber) {
        this.tp04InvNumber = tp04InvNumber;
    }

    public final String getTp04Name() {
        return tp04Name;
    }

    public final void setTp04Name(String tp04Name) {
        this.tp04Name = tp04Name;
    }

    public final String getLine10invnumber() {
        return line10invnumber;
    }

    public final void setLine10invnumber(String line10invnumber) {
        this.line10invnumber = line10invnumber;
    }

    public final String getLine10Name() {
        return line10Name;
    }

    public final void setLine10Name(String line10Name) {
        this.line10Name = line10Name;
    }

    public final String getPc35InvNumber() {
        return pc35InvNumber;
    }

    public final void setPc35InvNumber(String pc35InvNumber) {
        this.pc35InvNumber = pc35InvNumber;
    }

    public final String getPc35Name() {
        return pc35Name;
    }

    public final void setPc35Name(String pc35Name) {
        this.pc35Name = pc35Name;
    }

    public final BigDecimal getPaySum() {
        return paySum;
    }

    public final void setPaySum(BigDecimal paySum) {
        this.paySum = paySum;
    }

    public int getTechCondServRefCnSubsystemRefCode() {
        return techCondServRefCnSubsystemRefCode;
    }

    public void setTechCondServRefCnSubsystemRefCode(
            int techCondServRefCnSubsystemRefCode) {
        this.techCondServRefCnSubsystemRefCode = techCondServRefCnSubsystemRefCode;
    }

    public String getTechCondServRefCnSubsystemRefName() {
        return techCondServRefCnSubsystemRefName;
    }

    public void setTechCondServRefCnSubsystemRefName(
            String techCondServRefCnSubsystemRefName) {
        this.techCondServRefCnSubsystemRefName = techCondServRefCnSubsystemRefName;
    }

    public final int getLine04Code() {
        return line04Code;
    }

    public final void setLine04Code(int line04Code) {
        this.line04Code = line04Code;
    }

    public final int getTp04Code() {
        return tp04Code;
    }

    public final void setTp04Code(int tp04Code) {
        this.tp04Code = tp04Code;
    }

    public final int getLine10Code() {
        return line10Code;
    }

    public final void setLine10Code(int line10Code) {
        this.line10Code = line10Code;
    }

    public final int getPc35Code() {
        return pc35Code;
    }

    public final void setPc35Code(int pc35Code) {
        this.pc35Code = pc35Code;
    }


}