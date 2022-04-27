//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject;

/**
 * Value Object for ENEstimateHistory;
 */

import java.io.Serializable;
import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.references.ENEstimateHistoryTypeRef;
import com.ksoe.energynet.valueobject.references.ENEstimateItemRef;
import com.ksoe.rqorder.valueobject.references.RQBillItemRef;
import com.ksoe.rqorder.valueobject.references.RQFKOrderItemRef;
import com.ksoe.rqorder.valueobject.references.RQOrderItemRef;

public class ENEstimateHistory implements Serializable {

    public int code = Integer.MIN_VALUE;
    public BigDecimal countFact;
    public ENEstimateHistoryTypeRef historyTypeRef = new ENEstimateHistoryTypeRef();
    public ENEstimateItemRef estimateItemRef = new ENEstimateItemRef();
    public RQOrderItemRef rqOrderItemRef = new RQOrderItemRef();
    public RQBillItemRef rqBillItemRef = new RQBillItemRef();
    public RQFKOrderItemRef fkOrderItemRef = new RQFKOrderItemRef();
    public static final String tableName = "ENESTIMATEHISTORY";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENESTIMATEHISTORY.CODE";
    public static final String countFact_Attr = "countFact";
    public static final String countFact_Field = "COUNTFACT";
    public static final String countFact_QFielld = "ENESTIMATEHISTORY.COUNTFACT";
    public static final String historyTypeRef_Attr = "historyTypeRef";
    public static final String historyTypeRef_Field = "HISTORYTYPEREFCODE";
    public static final String historyTypeRef_QFielld = "ENESTIMATEHISTORY.HISTORYTYPEREFCODE";
    public static final String estimateItemRef_Attr = "estimateItemRef";
    public static final String estimateItemRef_Field = "ESTIMATEITEMREFCODE";
    public static final String estimateItemRef_QFielld = "ENESTIMATEHISTORY.ESTIMATEITEMREFCODE";
    public static final String rqOrderItemRef_Attr = "rqOrderItemRef";
    public static final String rqOrderItemRef_Field = "RQORDERITEMREFCODE";
    public static final String rqOrderItemRef_QFielld = "ENESTIMATEHISTORY.RQORDERITEMREFCODE";
    public static final String rqBillItemRef_Attr = "rqBillItemRef";
    public static final String rqBillItemRef_Field = "RQBILLITEMREFCODE";
    public static final String rqBillItemRef_QFielld = "ENESTIMATEHISTORY.RQBILLITEMREFCODE";
    public static final String fkOrderItemRef_Attr = "fkOrderItemRef";
    public static final String fkOrderItemRef_Field = "FKORDERITEMREFCODE";
    public static final String fkOrderItemRef_QFielld = "ENESTIMATEHISTORY.FKORDERITEMREFCODE";

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

    public void setHistoryTypeRef(ENEstimateHistoryTypeRef aValue) {
        historyTypeRef = aValue;
    }

    public ENEstimateHistoryTypeRef getHistoryTypeRef() {
        return historyTypeRef;
    }

    public void setEstimateItemRef(ENEstimateItemRef aValue) {
        estimateItemRef = aValue;
    }

    public ENEstimateItemRef getEstimateItemRef() {
        return estimateItemRef;
    }

    public void setRqOrderItemRef(RQOrderItemRef aValue) {
        rqOrderItemRef = aValue;
    }

    public RQOrderItemRef getRqOrderItemRef() {
        return rqOrderItemRef;
    }

    public void setRqBillItemRef(RQBillItemRef aValue) {
        rqBillItemRef = aValue;
    }

    public RQBillItemRef getRqBillItemRef() {
        return rqBillItemRef;
    }

    public void setFkOrderItemRef(RQFKOrderItemRef aValue) {
        fkOrderItemRef = aValue;
    }

    public RQFKOrderItemRef getFkOrderItemRef() {
        return fkOrderItemRef;
    }

} // end of ENEstimateHistoryValueObject

