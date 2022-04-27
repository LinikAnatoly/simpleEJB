//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

/**
 * Short Object for ENEstimateHistory;
 */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class ENEstimateHistoryShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public BigDecimal countFact;
    public int historyTypeRefCode = Integer.MIN_VALUE;
    public String historyTypeRefName;
    public int estimateItemRefCode = Integer.MIN_VALUE;
    public BigDecimal estimateItemRefCountGen;
    public BigDecimal estimateItemRefCountFact;
    public BigDecimal estimateItemRefPrice;
    public BigDecimal estimateItemRefCost;
    public int estimateItemRefDeliveryTime = Integer.MIN_VALUE;
    public int estimateItemRefUseWorkTime = Integer.MIN_VALUE;
    public String estimateItemRefUserGen;
    public Date estimateItemRefDateEdit;
    public int rqOrderItemRefCode = Integer.MIN_VALUE;
    public BigDecimal rqOrderItemRefCountGen;
    public String rqOrderItemRefMaterialNameTxt;
    public String rqOrderItemRefMeasurementNameTxt;
    public String rqOrderItemRefMaterialNameGen;
    public String rqOrderItemRefMeasurementNameGen;
    public String rqOrderItemRefMaterialNameGenRQ;
    public String rqOrderItemRefMeasurementNameGenRQ;
    public BigDecimal rqOrderItemRefCountFact;
    public BigDecimal rqOrderItemRefPriceWithoutNds;
    public BigDecimal rqOrderItemRefNds;
    public BigDecimal rqOrderItemRefPriceWithNds;
    public BigDecimal rqOrderItemRefSumWithoutNds;
    public BigDecimal rqOrderItemRefSumNds;
    public BigDecimal rqOrderItemRefSumGen;
    public String rqOrderItemRefCommentGen;
    public int rqOrderItemRefDeliveryTime = Integer.MIN_VALUE;
    public String rqOrderItemRefContractNumber;
    public Date rqOrderItemRefContractDate;
    public String rqOrderItemRefFinDocCode;
    public int rqOrderItemRefFinDocID = Integer.MIN_VALUE;
    public Date rqOrderItemRefPlannedDatePays;
    public Date rqOrderItemRefPlannedDateDelivery;
    public String rqOrderItemRefStatusReason;
    public int rqOrderItemRefPaymentValue = Integer.MIN_VALUE;
    public String rqOrderItemRefUserGen;
    public int rqBillItemRefCode = Integer.MIN_VALUE;
    public BigDecimal rqBillItemRefCountGen;
    public String rqBillItemRefMaterialNameTxt;
    public String rqBillItemRefMeasurementNameTxt;
    public BigDecimal rqBillItemRefCountFact;
    public BigDecimal rqBillItemRefPriceWithoutNds;
    public BigDecimal rqBillItemRefNds;
    public BigDecimal rqBillItemRefSumWithoutNds;
    public BigDecimal rqBillItemRefSumNds;
    public BigDecimal rqBillItemRefSumGen;
    public String rqBillItemRefCommentGen;
    public String rqBillItemRefUserGen;
    public int fkOrderItemRefCode = Integer.MIN_VALUE;
    public int fkOrderItemRefFinCode = Integer.MIN_VALUE;
    public int fkOrderItemRefNomenclatureCode = Integer.MIN_VALUE;
    public String fkOrderItemRefNomenclatureNum;
    public String fkOrderItemRefNomenclatureBalSch;
    public String fkOrderItemRefNomenclatureName;
    public int fkOrderItemRefNomenclatureUnitCode = Integer.MIN_VALUE;
    public String fkOrderItemRefNomenclatureUnitName;
    public String fkOrderItemRefContractNumber;
    public Date fkOrderItemRefContractDate;
    public String fkOrderItemRefFinDocCode;
    public int fkOrderItemRefFinDocID = Integer.MIN_VALUE;
    public String fkOrderItemRefMaterialNameTxt;
    public String fkOrderItemRefMeasurementNameTxt;
    public BigDecimal fkOrderItemRefCountGen;
    public BigDecimal fkOrderItemRefPriceWithoutNds;
    public BigDecimal fkOrderItemRefPriceWithNds;
    public BigDecimal fkOrderItemRefPriceNds;
    public BigDecimal fkOrderItemRefSumWithoutNds;
    public BigDecimal fkOrderItemRefSumNds;
    public BigDecimal fkOrderItemRefSumGen;
    public String fkOrderItemRefUserGen;
    public String fkOrderItemRefCommentGen;
    public String fkOrderItemRefNext_mat_name;
    public String fkOrderItemRefMeasurementTwoUnits;
    public BigDecimal fkOrderItemRefCountTwoUnits;
    public BigDecimal fkOrderItemRefPriceTwoUnits;
    public BigDecimal fkOrderItemRefWeight;
    public BigDecimal fkOrderItemRefSellingPriceWithoutNds;
    public BigDecimal fkOrderItemRefSellingCostWithoutNds;
    public Date fkOrderItemRefDateRealiz;
    public int fkOrderItemRefFundingType = Integer.MIN_VALUE;

    public void setCode(int aValue) {
        code = aValue;
    }

    public int getCode() {
        return code;
    }

    public void setCountFact(BigDecimal aValue) {
        countFact = aValue;
    }

    public BigDecimal getCountFact() {
        return countFact;
    }

    public void setHistoryTypeRefCode(int aValue) {
        historyTypeRefCode = aValue;
    }

    public int getHistoryTypeRefCode() {
        return historyTypeRefCode;
    }

    public void setHistoryTypeRefName(String aValue) {
        historyTypeRefName = aValue;
    }

    public String getHistoryTypeRefName() {
        return historyTypeRefName;
    }

    public void setEstimateItemRefCode(int aValue) {
        estimateItemRefCode = aValue;
    }

    public int getEstimateItemRefCode() {
        return estimateItemRefCode;
    }

    public void setEstimateItemRefCountGen(BigDecimal aValue) {
        estimateItemRefCountGen = aValue;
    }

    public BigDecimal getEstimateItemRefCountGen() {
        return estimateItemRefCountGen;
    }

    public void setEstimateItemRefCountFact(BigDecimal aValue) {
        estimateItemRefCountFact = aValue;
    }

    public BigDecimal getEstimateItemRefCountFact() {
        return estimateItemRefCountFact;
    }

    public void setEstimateItemRefPrice(BigDecimal aValue) {
        estimateItemRefPrice = aValue;
    }

    public BigDecimal getEstimateItemRefPrice() {
        return estimateItemRefPrice;
    }

    public void setEstimateItemRefCost(BigDecimal aValue) {
        estimateItemRefCost = aValue;
    }

    public BigDecimal getEstimateItemRefCost() {
        return estimateItemRefCost;
    }

    public void setEstimateItemRefDeliveryTime(int aValue) {
        estimateItemRefDeliveryTime = aValue;
    }

    public int getEstimateItemRefDeliveryTime() {
        return estimateItemRefDeliveryTime;
    }

    public void setEstimateItemRefUseWorkTime(int aValue) {
        estimateItemRefUseWorkTime = aValue;
    }

    public int getEstimateItemRefUseWorkTime() {
        return estimateItemRefUseWorkTime;
    }

    public void setEstimateItemRefUserGen(String aValue) {
        estimateItemRefUserGen = aValue;
    }

    public String getEstimateItemRefUserGen() {
        return estimateItemRefUserGen;
    }

    public void setEstimateItemRefDateEdit(Date aValue) {
        estimateItemRefDateEdit = aValue;
    }

    public Date getEstimateItemRefDateEdit() {
        return estimateItemRefDateEdit;
    }

    public void setRqOrderItemRefCode(int aValue) {
        rqOrderItemRefCode = aValue;
    }

    public int getRqOrderItemRefCode() {
        return rqOrderItemRefCode;
    }

    public void setRqOrderItemRefCountGen(BigDecimal aValue) {
        rqOrderItemRefCountGen = aValue;
    }

    public BigDecimal getRqOrderItemRefCountGen() {
        return rqOrderItemRefCountGen;
    }

    public void setRqOrderItemRefMaterialNameTxt(String aValue) {
        rqOrderItemRefMaterialNameTxt = aValue;
    }

    public String getRqOrderItemRefMaterialNameTxt() {
        return rqOrderItemRefMaterialNameTxt;
    }

    public void setRqOrderItemRefMeasurementNameTxt(String aValue) {
        rqOrderItemRefMeasurementNameTxt = aValue;
    }

    public String getRqOrderItemRefMeasurementNameTxt() {
        return rqOrderItemRefMeasurementNameTxt;
    }

    public void setRqOrderItemRefMaterialNameGen(String aValue) {
        rqOrderItemRefMaterialNameGen = aValue;
    }

    public String getRqOrderItemRefMaterialNameGen() {
        return rqOrderItemRefMaterialNameGen;
    }

    public void setRqOrderItemRefMeasurementNameGen(String aValue) {
        rqOrderItemRefMeasurementNameGen = aValue;
    }

    public String getRqOrderItemRefMeasurementNameGen() {
        return rqOrderItemRefMeasurementNameGen;
    }

    public void setRqOrderItemRefMaterialNameGenRQ(String aValue) {
        rqOrderItemRefMaterialNameGenRQ = aValue;
    }

    public String getRqOrderItemRefMaterialNameGenRQ() {
        return rqOrderItemRefMaterialNameGenRQ;
    }

    public void setRqOrderItemRefMeasurementNameGenRQ(String aValue) {
        rqOrderItemRefMeasurementNameGenRQ = aValue;
    }

    public String getRqOrderItemRefMeasurementNameGenRQ() {
        return rqOrderItemRefMeasurementNameGenRQ;
    }

    public void setRqOrderItemRefCountFact(BigDecimal aValue) {
        rqOrderItemRefCountFact = aValue;
    }

    public BigDecimal getRqOrderItemRefCountFact() {
        return rqOrderItemRefCountFact;
    }

    public void setRqOrderItemRefPriceWithoutNds(BigDecimal aValue) {
        rqOrderItemRefPriceWithoutNds = aValue;
    }

    public BigDecimal getRqOrderItemRefPriceWithoutNds() {
        return rqOrderItemRefPriceWithoutNds;
    }

    public void setRqOrderItemRefNds(BigDecimal aValue) {
        rqOrderItemRefNds = aValue;
    }

    public BigDecimal getRqOrderItemRefNds() {
        return rqOrderItemRefNds;
    }

    public void setRqOrderItemRefPriceWithNds(BigDecimal aValue) {
        rqOrderItemRefPriceWithNds = aValue;
    }

    public BigDecimal getRqOrderItemRefPriceWithNds() {
        return rqOrderItemRefPriceWithNds;
    }

    public void setRqOrderItemRefSumWithoutNds(BigDecimal aValue) {
        rqOrderItemRefSumWithoutNds = aValue;
    }

    public BigDecimal getRqOrderItemRefSumWithoutNds() {
        return rqOrderItemRefSumWithoutNds;
    }

    public void setRqOrderItemRefSumNds(BigDecimal aValue) {
        rqOrderItemRefSumNds = aValue;
    }

    public BigDecimal getRqOrderItemRefSumNds() {
        return rqOrderItemRefSumNds;
    }

    public void setRqOrderItemRefSumGen(BigDecimal aValue) {
        rqOrderItemRefSumGen = aValue;
    }

    public BigDecimal getRqOrderItemRefSumGen() {
        return rqOrderItemRefSumGen;
    }

    public void setRqOrderItemRefCommentGen(String aValue) {
        rqOrderItemRefCommentGen = aValue;
    }

    public String getRqOrderItemRefCommentGen() {
        return rqOrderItemRefCommentGen;
    }

    public void setRqOrderItemRefDeliveryTime(int aValue) {
        rqOrderItemRefDeliveryTime = aValue;
    }

    public int getRqOrderItemRefDeliveryTime() {
        return rqOrderItemRefDeliveryTime;
    }

    public void setRqOrderItemRefContractNumber(String aValue) {
        rqOrderItemRefContractNumber = aValue;
    }

    public String getRqOrderItemRefContractNumber() {
        return rqOrderItemRefContractNumber;
    }

    public void setRqOrderItemRefContractDate(Date aValue) {
        rqOrderItemRefContractDate = aValue;
    }

    public Date getRqOrderItemRefContractDate() {
        return rqOrderItemRefContractDate;
    }

    public void setRqOrderItemRefFinDocCode(String aValue) {
        rqOrderItemRefFinDocCode = aValue;
    }

    public String getRqOrderItemRefFinDocCode() {
        return rqOrderItemRefFinDocCode;
    }

    public void setRqOrderItemRefFinDocID(int aValue) {
        rqOrderItemRefFinDocID = aValue;
    }

    public int getRqOrderItemRefFinDocID() {
        return rqOrderItemRefFinDocID;
    }

    public void setRqOrderItemRefPlannedDatePays(Date aValue) {
        rqOrderItemRefPlannedDatePays = aValue;
    }

    public Date getRqOrderItemRefPlannedDatePays() {
        return rqOrderItemRefPlannedDatePays;
    }

    public void setRqOrderItemRefPlannedDateDelivery(Date aValue) {
        rqOrderItemRefPlannedDateDelivery = aValue;
    }

    public Date getRqOrderItemRefPlannedDateDelivery() {
        return rqOrderItemRefPlannedDateDelivery;
    }

    public void setRqOrderItemRefStatusReason(String aValue) {
        rqOrderItemRefStatusReason = aValue;
    }

    public String getRqOrderItemRefStatusReason() {
        return rqOrderItemRefStatusReason;
    }

    public void setRqOrderItemRefPaymentValue(int aValue) {
        rqOrderItemRefPaymentValue = aValue;
    }

    public int getRqOrderItemRefPaymentValue() {
        return rqOrderItemRefPaymentValue;
    }

    public void setRqOrderItemRefUserGen(String aValue) {
        rqOrderItemRefUserGen = aValue;
    }

    public String getRqOrderItemRefUserGen() {
        return rqOrderItemRefUserGen;
    }

    public void setRqBillItemRefCode(int aValue) {
        rqBillItemRefCode = aValue;
    }

    public int getRqBillItemRefCode() {
        return rqBillItemRefCode;
    }

    public void setRqBillItemRefCountGen(BigDecimal aValue) {
        rqBillItemRefCountGen = aValue;
    }

    public BigDecimal getRqBillItemRefCountGen() {
        return rqBillItemRefCountGen;
    }

    public void setRqBillItemRefMaterialNameTxt(String aValue) {
        rqBillItemRefMaterialNameTxt = aValue;
    }

    public String getRqBillItemRefMaterialNameTxt() {
        return rqBillItemRefMaterialNameTxt;
    }

    public void setRqBillItemRefMeasurementNameTxt(String aValue) {
        rqBillItemRefMeasurementNameTxt = aValue;
    }

    public String getRqBillItemRefMeasurementNameTxt() {
        return rqBillItemRefMeasurementNameTxt;
    }

    public void setRqBillItemRefCountFact(BigDecimal aValue) {
        rqBillItemRefCountFact = aValue;
    }

    public BigDecimal getRqBillItemRefCountFact() {
        return rqBillItemRefCountFact;
    }

    public void setRqBillItemRefPriceWithoutNds(BigDecimal aValue) {
        rqBillItemRefPriceWithoutNds = aValue;
    }

    public BigDecimal getRqBillItemRefPriceWithoutNds() {
        return rqBillItemRefPriceWithoutNds;
    }

    public void setRqBillItemRefNds(BigDecimal aValue) {
        rqBillItemRefNds = aValue;
    }

    public BigDecimal getRqBillItemRefNds() {
        return rqBillItemRefNds;
    }

    public void setRqBillItemRefSumWithoutNds(BigDecimal aValue) {
        rqBillItemRefSumWithoutNds = aValue;
    }

    public BigDecimal getRqBillItemRefSumWithoutNds() {
        return rqBillItemRefSumWithoutNds;
    }

    public void setRqBillItemRefSumNds(BigDecimal aValue) {
        rqBillItemRefSumNds = aValue;
    }

    public BigDecimal getRqBillItemRefSumNds() {
        return rqBillItemRefSumNds;
    }

    public void setRqBillItemRefSumGen(BigDecimal aValue) {
        rqBillItemRefSumGen = aValue;
    }

    public BigDecimal getRqBillItemRefSumGen() {
        return rqBillItemRefSumGen;
    }

    public void setRqBillItemRefCommentGen(String aValue) {
        rqBillItemRefCommentGen = aValue;
    }

    public String getRqBillItemRefCommentGen() {
        return rqBillItemRefCommentGen;
    }

    public void setRqBillItemRefUserGen(String aValue) {
        rqBillItemRefUserGen = aValue;
    }

    public String getRqBillItemRefUserGen() {
        return rqBillItemRefUserGen;
    }

    public void setFkOrderItemRefCode(int aValue) {
        fkOrderItemRefCode = aValue;
    }

    public int getFkOrderItemRefCode() {
        return fkOrderItemRefCode;
    }

    public void setFkOrderItemRefFinCode(int aValue) {
        fkOrderItemRefFinCode = aValue;
    }

    public int getFkOrderItemRefFinCode() {
        return fkOrderItemRefFinCode;
    }

    public void setFkOrderItemRefNomenclatureCode(int aValue) {
        fkOrderItemRefNomenclatureCode = aValue;
    }

    public int getFkOrderItemRefNomenclatureCode() {
        return fkOrderItemRefNomenclatureCode;
    }

    public void setFkOrderItemRefNomenclatureNum(String aValue) {
        fkOrderItemRefNomenclatureNum = aValue;
    }

    public String getFkOrderItemRefNomenclatureNum() {
        return fkOrderItemRefNomenclatureNum;
    }

    public void setFkOrderItemRefNomenclatureBalSch(String aValue) {
        fkOrderItemRefNomenclatureBalSch = aValue;
    }

    public String getFkOrderItemRefNomenclatureBalSch() {
        return fkOrderItemRefNomenclatureBalSch;
    }

    public void setFkOrderItemRefNomenclatureName(String aValue) {
        fkOrderItemRefNomenclatureName = aValue;
    }

    public String getFkOrderItemRefNomenclatureName() {
        return fkOrderItemRefNomenclatureName;
    }

    public void setFkOrderItemRefNomenclatureUnitCode(int aValue) {
        fkOrderItemRefNomenclatureUnitCode = aValue;
    }

    public int getFkOrderItemRefNomenclatureUnitCode() {
        return fkOrderItemRefNomenclatureUnitCode;
    }

    public void setFkOrderItemRefNomenclatureUnitName(String aValue) {
        fkOrderItemRefNomenclatureUnitName = aValue;
    }

    public String getFkOrderItemRefNomenclatureUnitName() {
        return fkOrderItemRefNomenclatureUnitName;
    }

    public void setFkOrderItemRefContractNumber(String aValue) {
        fkOrderItemRefContractNumber = aValue;
    }

    public String getFkOrderItemRefContractNumber() {
        return fkOrderItemRefContractNumber;
    }

    public void setFkOrderItemRefContractDate(Date aValue) {
        fkOrderItemRefContractDate = aValue;
    }

    public Date getFkOrderItemRefContractDate() {
        return fkOrderItemRefContractDate;
    }

    public void setFkOrderItemRefFinDocCode(String aValue) {
        fkOrderItemRefFinDocCode = aValue;
    }

    public String getFkOrderItemRefFinDocCode() {
        return fkOrderItemRefFinDocCode;
    }

    public void setFkOrderItemRefFinDocID(int aValue) {
        fkOrderItemRefFinDocID = aValue;
    }

    public int getFkOrderItemRefFinDocID() {
        return fkOrderItemRefFinDocID;
    }

    public void setFkOrderItemRefMaterialNameTxt(String aValue) {
        fkOrderItemRefMaterialNameTxt = aValue;
    }

    public String getFkOrderItemRefMaterialNameTxt() {
        return fkOrderItemRefMaterialNameTxt;
    }

    public void setFkOrderItemRefMeasurementNameTxt(String aValue) {
        fkOrderItemRefMeasurementNameTxt = aValue;
    }

    public String getFkOrderItemRefMeasurementNameTxt() {
        return fkOrderItemRefMeasurementNameTxt;
    }

    public void setFkOrderItemRefCountGen(BigDecimal aValue) {
        fkOrderItemRefCountGen = aValue;
    }

    public BigDecimal getFkOrderItemRefCountGen() {
        return fkOrderItemRefCountGen;
    }

    public void setFkOrderItemRefPriceWithoutNds(BigDecimal aValue) {
        fkOrderItemRefPriceWithoutNds = aValue;
    }

    public BigDecimal getFkOrderItemRefPriceWithoutNds() {
        return fkOrderItemRefPriceWithoutNds;
    }

    public void setFkOrderItemRefPriceWithNds(BigDecimal aValue) {
        fkOrderItemRefPriceWithNds = aValue;
    }

    public BigDecimal getFkOrderItemRefPriceWithNds() {
        return fkOrderItemRefPriceWithNds;
    }

    public void setFkOrderItemRefPriceNds(BigDecimal aValue) {
        fkOrderItemRefPriceNds = aValue;
    }

    public BigDecimal getFkOrderItemRefPriceNds() {
        return fkOrderItemRefPriceNds;
    }

    public void setFkOrderItemRefSumWithoutNds(BigDecimal aValue) {
        fkOrderItemRefSumWithoutNds = aValue;
    }

    public BigDecimal getFkOrderItemRefSumWithoutNds() {
        return fkOrderItemRefSumWithoutNds;
    }

    public void setFkOrderItemRefSumNds(BigDecimal aValue) {
        fkOrderItemRefSumNds = aValue;
    }

    public BigDecimal getFkOrderItemRefSumNds() {
        return fkOrderItemRefSumNds;
    }

    public void setFkOrderItemRefSumGen(BigDecimal aValue) {
        fkOrderItemRefSumGen = aValue;
    }

    public BigDecimal getFkOrderItemRefSumGen() {
        return fkOrderItemRefSumGen;
    }

    public void setFkOrderItemRefUserGen(String aValue) {
        fkOrderItemRefUserGen = aValue;
    }

    public String getFkOrderItemRefUserGen() {
        return fkOrderItemRefUserGen;
    }

    public void setFkOrderItemRefCommentGen(String aValue) {
        fkOrderItemRefCommentGen = aValue;
    }

    public String getFkOrderItemRefCommentGen() {
        return fkOrderItemRefCommentGen;
    }

    public void setFkOrderItemRefNext_mat_name(String aValue) {
        fkOrderItemRefNext_mat_name = aValue;
    }

    public String getFkOrderItemRefNext_mat_name() {
        return fkOrderItemRefNext_mat_name;
    }

    public void setFkOrderItemRefMeasurementTwoUnits(String aValue) {
        fkOrderItemRefMeasurementTwoUnits = aValue;
    }

    public String getFkOrderItemRefMeasurementTwoUnits() {
        return fkOrderItemRefMeasurementTwoUnits;
    }

    public void setFkOrderItemRefCountTwoUnits(BigDecimal aValue) {
        fkOrderItemRefCountTwoUnits = aValue;
    }

    public BigDecimal getFkOrderItemRefCountTwoUnits() {
        return fkOrderItemRefCountTwoUnits;
    }

    public void setFkOrderItemRefPriceTwoUnits(BigDecimal aValue) {
        fkOrderItemRefPriceTwoUnits = aValue;
    }

    public BigDecimal getFkOrderItemRefPriceTwoUnits() {
        return fkOrderItemRefPriceTwoUnits;
    }

    public void setFkOrderItemRefWeight(BigDecimal aValue) {
        fkOrderItemRefWeight = aValue;
    }

    public BigDecimal getFkOrderItemRefWeight() {
        return fkOrderItemRefWeight;
    }

    public void setFkOrderItemRefSellingPriceWithoutNds(BigDecimal aValue) {
        fkOrderItemRefSellingPriceWithoutNds = aValue;
    }

    public BigDecimal getFkOrderItemRefSellingPriceWithoutNds() {
        return fkOrderItemRefSellingPriceWithoutNds;
    }

    public void setFkOrderItemRefSellingCostWithoutNds(BigDecimal aValue) {
        fkOrderItemRefSellingCostWithoutNds = aValue;
    }

    public BigDecimal getFkOrderItemRefSellingCostWithoutNds() {
        return fkOrderItemRefSellingCostWithoutNds;
    }

    public void setFkOrderItemRefDateRealiz(Date aValue) {
        fkOrderItemRefDateRealiz = aValue;
    }

    public Date getFkOrderItemRefDateRealiz() {
        return fkOrderItemRefDateRealiz;
    }

    public void setFkOrderItemRefFundingType(int aValue) {
        fkOrderItemRefFundingType = aValue;
    }

    public int getFkOrderItemRefFundingType() {
        return fkOrderItemRefFundingType;
    }

}