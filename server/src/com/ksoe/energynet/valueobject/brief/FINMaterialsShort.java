//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.brief;

/**
 * Short Object for FINMaterials;
 */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class FINMaterialsShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public int mat_id = Integer.MIN_VALUE;
	public String nn;
	public String mat_name;
	public int mu_id = Integer.MIN_VALUE;
	public String mu_name;
	public String div_code;
	public String div_name;
	public int party_id = Integer.MIN_VALUE;
	public String doc_num;
	public String partner;
	public String partner_name;
	public Date doc_date;
	public String party_discription;
	public int rest_purpose_id = Integer.MIN_VALUE;
	public String rest_purpose_name;
	public int rest_purpose_type_id = Integer.MIN_VALUE;
	public int budget_core_id = Integer.MIN_VALUE;
	public int frc_code = Integer.MIN_VALUE;
	public String frc_name;
	public BigDecimal calc_price;
	public BigDecimal quantity;
	public BigDecimal price;
	public BigDecimal cost;
	public String bal_sch;
	public BigDecimal fullQuantity;
	public BigDecimal fullCost;
	public Date wear_date;
	public String userGen;
	public Date dateEdit;
	public BigDecimal extra_cargo;
	public BigDecimal cost_ext;
	public BigDecimal extra_cargo_nds;
	public BigDecimal cost_ext_nds;
	public String ax_party_id;
	public String ax_rest_purpose_id;
	public String ax_rest_purpose_typeid;
	public String ax_frc_code;
	public BigDecimal ax_inv_posted_qty_unit;
	public BigDecimal ax_inv_deducted_unit;
	public BigDecimal ax_inv_received_unit;
	public BigDecimal ax_inv_reserv_phys_unit;
	public BigDecimal ax_inv_avail_phys_unit;
	public BigDecimal ax_inv_physical_value;
	public BigDecimal ax_inv_posted_value;
	public String axInventTransferLinesCode;
	public String axInventDimFinId;
	public BigDecimal axFactor;
	public int estimateItemRefCode = Integer.MIN_VALUE;
	public BigDecimal estimateItemRefCountGen;
	public BigDecimal estimateItemRefCountFact;
	public BigDecimal estimateItemRefPrice;
	public BigDecimal estimateItemRefCost;
	public int estimateItemRefIsUseVAT = Integer.MIN_VALUE;
	public int estimateItemRefDeliveryTime = Integer.MIN_VALUE;
	public int estimateItemRefUseWorkTime = Integer.MIN_VALUE;
	public String estimateItemRefUserGen;
	public Date estimateItemRefDateEdit;
	public int statusRefCode = Integer.MIN_VALUE;
	public String statusRefName;
	public int molDataRefCode = Integer.MIN_VALUE;
	public String molDataRefFinMolCode;
	public String molDataRefFinMolName;
	public int parentRefCode = Integer.MIN_VALUE;
	public int parentRefMat_id = Integer.MIN_VALUE;
	public String parentRefNn;
	public String parentRefMat_name;
	public int parentRefMu_id = Integer.MIN_VALUE;
	public String parentRefMu_name;
	public String parentRefDiv_code;
	public String parentRefDiv_name;
	public int parentRefParty_id = Integer.MIN_VALUE;
	public String parentRefDoc_num;
	public String parentRefPartner;
	public String parentRefPartner_name;
	public Date parentRefDoc_date;
	public String parentRefParty_discription;
	public int parentRefRest_purpose_id = Integer.MIN_VALUE;
	public String parentRefRest_purpose_name;
	public int parentRefRest_purpose_type_id = Integer.MIN_VALUE;
	public int parentRefBudget_core_id = Integer.MIN_VALUE;
	public int parentRefFrc_code = Integer.MIN_VALUE;
	public String parentRefFrc_name;
	public BigDecimal parentRefCalc_price;
	public BigDecimal parentRefQuantity;
	public BigDecimal parentRefPrice;
	public BigDecimal parentRefCost;
	public String parentRefBal_sch;
	public BigDecimal parentRefFullQuantity;
	public BigDecimal parentRefFullCost;
	public Date parentRefWear_date;
	public String parentRefUserGen;
	public Date parentRefDateEdit;
	public BigDecimal parentRefExtra_cargo;
	public BigDecimal parentRefCost_ext;
	public BigDecimal parentRefExtra_cargo_nds;
	public BigDecimal parentRefCost_ext_nds;
	public String parentRefAx_party_id;
	public String parentRefAx_rest_purpose_id;
	public String parentRefAx_rest_purpose_typeid;
	public String parentRefAx_frc_code;
	public BigDecimal parentRefAx_inv_posted_qty_unit;
	public BigDecimal parentRefAx_inv_deducted_unit;
	public BigDecimal parentRefAx_inv_received_unit;
	public BigDecimal parentRefAx_inv_reserv_phys_unit;
	public BigDecimal parentRefAx_inv_avail_phys_unit;
	public BigDecimal parentRefAx_inv_physical_value;
	public BigDecimal parentRefAx_inv_posted_value;
	public String parentRefAxInventTransferLinesCode;
	public String parentRefAxInventDimFinId;
	public BigDecimal parentRefAxFactor;

	/////////////////////////////////

	public int estimateItemRefKindCode;
	public String estimateItemRefKindName;

	/////////////////////////////////



	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

	public void setMat_id(int aValue) {
		mat_id = aValue;
	}

	public int getMat_id() {
		return mat_id;
	}

	public void setNn(String aValue) {
		nn = aValue;
	}

	public String getNn() {
		return nn;
	}

	public void setMat_name(String aValue) {
		mat_name = aValue;
	}

	public String getMat_name() {
		return mat_name;
	}

	public void setMu_id(int aValue) {
		mu_id = aValue;
	}

	public int getMu_id() {
		return mu_id;
	}

	public void setMu_name(String aValue) {
		mu_name = aValue;
	}

	public String getMu_name() {
		return mu_name;
	}

	public void setDiv_code(String aValue) {
		div_code = aValue;
	}

	public String getDiv_code() {
		return div_code;
	}

	public void setDiv_name(String aValue) {
		div_name = aValue;
	}

	public String getDiv_name() {
		return div_name;
	}

	public void setParty_id(int aValue) {
		party_id = aValue;
	}

	public int getParty_id() {
		return party_id;
	}

	public void setDoc_num(String aValue) {
		doc_num = aValue;
	}

	public String getDoc_num() {
		return doc_num;
	}

	public void setPartner(String aValue) {
		partner = aValue;
	}

	public String getPartner() {
		return partner;
	}

	public void setPartner_name(String aValue) {
		partner_name = aValue;
	}

	public String getPartner_name() {
		return partner_name;
	}

	public void setDoc_date(Date aValue) {
		doc_date = aValue;
	}

	public Date getDoc_date() {
		return doc_date;
	}

	public void setParty_discription(String aValue) {
		party_discription = aValue;
	}

	public String getParty_discription() {
		return party_discription;
	}

	public void setRest_purpose_id(int aValue) {
		rest_purpose_id = aValue;
	}

	public int getRest_purpose_id() {
		return rest_purpose_id;
	}

	public void setRest_purpose_name(String aValue) {
		rest_purpose_name = aValue;
	}

	public String getRest_purpose_name() {
		return rest_purpose_name;
	}

	public void setRest_purpose_type_id(int aValue) {
		rest_purpose_type_id = aValue;
	}

	public int getRest_purpose_type_id() {
		return rest_purpose_type_id;
	}

	public void setBudget_core_id(int aValue) {
		budget_core_id = aValue;
	}

	public int getBudget_core_id() {
		return budget_core_id;
	}

	public void setFrc_code(int aValue) {
		frc_code = aValue;
	}

	public int getFrc_code() {
		return frc_code;
	}

	public void setFrc_name(String aValue) {
		frc_name = aValue;
	}

	public String getFrc_name() {
		return frc_name;
	}

	public void setCalc_price(BigDecimal aValue) {
		calc_price = aValue;
	}

	public BigDecimal getCalc_price() {
		return calc_price;
	}

	public void setQuantity(BigDecimal aValue) {
		quantity = aValue;
	}

	public BigDecimal getQuantity() {
		return quantity;
	}

	public void setPrice(BigDecimal aValue) {
		price = aValue;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setCost(BigDecimal aValue) {
		cost = aValue;
	}

	public BigDecimal getCost() {
		return cost;
	}

	public void setBal_sch(String aValue) {
		bal_sch = aValue;
	}

	public String getBal_sch() {
		return bal_sch;
	}

	public void setFullQuantity(BigDecimal aValue) {
		fullQuantity = aValue;
	}

	public BigDecimal getFullQuantity() {
		return fullQuantity;
	}

	public void setFullCost(BigDecimal aValue) {
		fullCost = aValue;
	}

	public BigDecimal getFullCost() {
		return fullCost;
	}

	public void setWear_date(Date aValue) {
		wear_date = aValue;
	}

	public Date getWear_date() {
		return wear_date;
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

	public void setExtra_cargo(BigDecimal aValue) {
		extra_cargo = aValue;
	}

	public BigDecimal getExtra_cargo() {
		return extra_cargo;
	}

	public void setCost_ext(BigDecimal aValue) {
		cost_ext = aValue;
	}

	public BigDecimal getCost_ext() {
		return cost_ext;
	}

	public void setExtra_cargo_nds(BigDecimal aValue) {
		extra_cargo_nds = aValue;
	}

	public BigDecimal getExtra_cargo_nds() {
		return extra_cargo_nds;
	}

	public void setCost_ext_nds(BigDecimal aValue) {
		cost_ext_nds = aValue;
	}

	public BigDecimal getCost_ext_nds() {
		return cost_ext_nds;
	}

	public void setAx_party_id(String aValue) {
		ax_party_id = aValue;
	}

	public String getAx_party_id() {
		return ax_party_id;
	}

	public void setAx_rest_purpose_id(String aValue) {
		ax_rest_purpose_id = aValue;
	}

	public String getAx_rest_purpose_id() {
		return ax_rest_purpose_id;
	}

	public void setAx_rest_purpose_typeid(String aValue) {
		ax_rest_purpose_typeid = aValue;
	}

	public String getAx_rest_purpose_typeid() {
		return ax_rest_purpose_typeid;
	}

	public void setAx_frc_code(String aValue) {
		ax_frc_code = aValue;
	}

	public String getAx_frc_code() {
		return ax_frc_code;
	}

	public void setAx_inv_posted_qty_unit(BigDecimal aValue) {
		ax_inv_posted_qty_unit = aValue;
	}

	public BigDecimal getAx_inv_posted_qty_unit() {
		return ax_inv_posted_qty_unit;
	}

	public void setAx_inv_deducted_unit(BigDecimal aValue) {
		ax_inv_deducted_unit = aValue;
	}

	public BigDecimal getAx_inv_deducted_unit() {
		return ax_inv_deducted_unit;
	}

	public void setAx_inv_received_unit(BigDecimal aValue) {
		ax_inv_received_unit = aValue;
	}

	public BigDecimal getAx_inv_received_unit() {
		return ax_inv_received_unit;
	}

	public void setAx_inv_reserv_phys_unit(BigDecimal aValue) {
		ax_inv_reserv_phys_unit = aValue;
	}

	public BigDecimal getAx_inv_reserv_phys_unit() {
		return ax_inv_reserv_phys_unit;
	}

	public void setAx_inv_avail_phys_unit(BigDecimal aValue) {
		ax_inv_avail_phys_unit = aValue;
	}

	public BigDecimal getAx_inv_avail_phys_unit() {
		return ax_inv_avail_phys_unit;
	}

	public void setAx_inv_physical_value(BigDecimal aValue) {
		ax_inv_physical_value = aValue;
	}

	public BigDecimal getAx_inv_physical_value() {
		return ax_inv_physical_value;
	}

	public void setAx_inv_posted_value(BigDecimal aValue) {
		ax_inv_posted_value = aValue;
	}

	public BigDecimal getAx_inv_posted_value() {
		return ax_inv_posted_value;
	}

	public void setAxInventTransferLinesCode(String aValue) {
		axInventTransferLinesCode = aValue;
	}

	public String getAxInventTransferLinesCode() {
		return axInventTransferLinesCode;
	}

	public void setAxInventDimFinId(String aValue) {
		axInventDimFinId = aValue;
	}

	public String getAxInventDimFinId() {
		return axInventDimFinId;
	}

	public void setAxFactor(BigDecimal aValue){
		axFactor = aValue;
	}

	public BigDecimal getAxFactor(){
		return axFactor;
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

	public void setEstimateItemRefIsUseVAT(int aValue) {
		estimateItemRefIsUseVAT = aValue;
	}

	public int getEstimateItemRefIsUseVAT() {
		return estimateItemRefIsUseVAT;
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

	public void setMolDataRefCode(int aValue) {
		molDataRefCode = aValue;
	}

	public int getMolDataRefCode() {
		return molDataRefCode;
	}

	public void setMolDataRefFinMolCode(String aValue) {
		molDataRefFinMolCode = aValue;
	}

	public String getMolDataRefFinMolCode() {
		return molDataRefFinMolCode;
	}

	public void setMolDataRefFinMolName(String aValue) {
		molDataRefFinMolName = aValue;
	}

	public String getMolDataRefFinMolName() {
		return molDataRefFinMolName;
	}

	public void setParentRefCode(int aValue) {
		parentRefCode = aValue;
	}

	public int getParentRefCode() {
		return parentRefCode;
	}

	public void setParentRefMat_id(int aValue) {
		parentRefMat_id = aValue;
	}

	public int getParentRefMat_id() {
		return parentRefMat_id;
	}

	public void setParentRefNn(String aValue) {
		parentRefNn = aValue;
	}

	public String getParentRefNn() {
		return parentRefNn;
	}

	public void setParentRefMat_name(String aValue) {
		parentRefMat_name = aValue;
	}

	public String getParentRefMat_name() {
		return parentRefMat_name;
	}

	public void setParentRefMu_id(int aValue) {
		parentRefMu_id = aValue;
	}

	public int getParentRefMu_id() {
		return parentRefMu_id;
	}

	public void setParentRefMu_name(String aValue) {
		parentRefMu_name = aValue;
	}

	public String getParentRefMu_name() {
		return parentRefMu_name;
	}

	public void setParentRefDiv_code(String aValue) {
		parentRefDiv_code = aValue;
	}

	public String getParentRefDiv_code() {
		return parentRefDiv_code;
	}

	public void setParentRefDiv_name(String aValue) {
		parentRefDiv_name = aValue;
	}

	public String getParentRefDiv_name() {
		return parentRefDiv_name;
	}

	public void setParentRefParty_id(int aValue) {
		parentRefParty_id = aValue;
	}

	public int getParentRefParty_id() {
		return parentRefParty_id;
	}

	public void setParentRefDoc_num(String aValue) {
		parentRefDoc_num = aValue;
	}

	public String getParentRefDoc_num() {
		return parentRefDoc_num;
	}

	public void setParentRefPartner(String aValue) {
		parentRefPartner = aValue;
	}

	public String getParentRefPartner() {
		return parentRefPartner;
	}

	public void setParentRefPartner_name(String aValue) {
		parentRefPartner_name = aValue;
	}

	public String getParentRefPartner_name() {
		return parentRefPartner_name;
	}

	public void setParentRefDoc_date(Date aValue) {
		parentRefDoc_date = aValue;
	}

	public Date getParentRefDoc_date() {
		return parentRefDoc_date;
	}

	public void setParentRefParty_discription(String aValue) {
		parentRefParty_discription = aValue;
	}

	public String getParentRefParty_discription() {
		return parentRefParty_discription;
	}

	public void setParentRefRest_purpose_id(int aValue) {
		parentRefRest_purpose_id = aValue;
	}

	public int getParentRefRest_purpose_id() {
		return parentRefRest_purpose_id;
	}

	public void setParentRefRest_purpose_name(String aValue) {
		parentRefRest_purpose_name = aValue;
	}

	public String getParentRefRest_purpose_name() {
		return parentRefRest_purpose_name;
	}

	public void setParentRefRest_purpose_type_id(int aValue) {
		parentRefRest_purpose_type_id = aValue;
	}

	public int getParentRefRest_purpose_type_id() {
		return parentRefRest_purpose_type_id;
	}

	public void setParentRefBudget_core_id(int aValue) {
		parentRefBudget_core_id = aValue;
	}

	public int getParentRefBudget_core_id() {
		return parentRefBudget_core_id;
	}

	public void setParentRefFrc_code(int aValue) {
		parentRefFrc_code = aValue;
	}

	public int getParentRefFrc_code() {
		return parentRefFrc_code;
	}

	public void setParentRefFrc_name(String aValue) {
		parentRefFrc_name = aValue;
	}

	public String getParentRefFrc_name() {
		return parentRefFrc_name;
	}

	public void setParentRefCalc_price(BigDecimal aValue) {
		parentRefCalc_price = aValue;
	}

	public BigDecimal getParentRefCalc_price() {
		return parentRefCalc_price;
	}

	public void setParentRefQuantity(BigDecimal aValue) {
		parentRefQuantity = aValue;
	}

	public BigDecimal getParentRefQuantity() {
		return parentRefQuantity;
	}

	public void setParentRefPrice(BigDecimal aValue) {
		parentRefPrice = aValue;
	}

	public BigDecimal getParentRefPrice() {
		return parentRefPrice;
	}

	public void setParentRefCost(BigDecimal aValue) {
		parentRefCost = aValue;
	}

	public BigDecimal getParentRefCost() {
		return parentRefCost;
	}

	public void setParentRefBal_sch(String aValue) {
		parentRefBal_sch = aValue;
	}

	public String getParentRefBal_sch() {
		return parentRefBal_sch;
	}

	public void setParentRefFullQuantity(BigDecimal aValue) {
		parentRefFullQuantity = aValue;
	}

	public BigDecimal getParentRefFullQuantity() {
		return parentRefFullQuantity;
	}

	public void setParentRefFullCost(BigDecimal aValue) {
		parentRefFullCost = aValue;
	}

	public BigDecimal getParentRefFullCost() {
		return parentRefFullCost;
	}

	public void setParentRefWear_date(Date aValue) {
		parentRefWear_date = aValue;
	}

	public Date getParentRefWear_date() {
		return parentRefWear_date;
	}

	public void setParentRefUserGen(String aValue) {
		parentRefUserGen = aValue;
	}

	public String getParentRefUserGen() {
		return parentRefUserGen;
	}

	public void setParentRefDateEdit(Date aValue) {
		parentRefDateEdit = aValue;
	}

	public Date getParentRefDateEdit() {
		return parentRefDateEdit;
	}

	public void setParentRefExtra_cargo(BigDecimal aValue) {
		parentRefExtra_cargo = aValue;
	}

	public BigDecimal getParentRefExtra_cargo() {
		return parentRefExtra_cargo;
	}

	public void setParentRefCost_ext(BigDecimal aValue) {
		parentRefCost_ext = aValue;
	}

	public BigDecimal getParentRefCost_ext() {
		return parentRefCost_ext;
	}

	public void setParentRefExtra_cargo_nds(BigDecimal aValue) {
		parentRefExtra_cargo_nds = aValue;
	}

	public BigDecimal getParentRefExtra_cargo_nds() {
		return parentRefExtra_cargo_nds;
	}

	public void setParentRefCost_ext_nds(BigDecimal aValue) {
		parentRefCost_ext_nds = aValue;
	}

	public BigDecimal getParentRefCost_ext_nds() {
		return parentRefCost_ext_nds;
	}

	public void setParentRefAx_party_id(String aValue) {
		parentRefAx_party_id = aValue;
	}

	public String getParentRefAx_party_id() {
		return parentRefAx_party_id;
	}

	public void setParentRefAx_rest_purpose_id(String aValue) {
		parentRefAx_rest_purpose_id = aValue;
	}

	public String getParentRefAx_rest_purpose_id() {
		return parentRefAx_rest_purpose_id;
	}

	public void setParentRefAx_rest_purpose_typeid(String aValue) {
		parentRefAx_rest_purpose_typeid = aValue;
	}

	public String getParentRefAx_rest_purpose_typeid() {
		return parentRefAx_rest_purpose_typeid;
	}

	public void setParentRefAx_frc_code(String aValue) {
		parentRefAx_frc_code = aValue;
	}

	public String getParentRefAx_frc_code() {
		return parentRefAx_frc_code;
	}

	public void setParentRefAx_inv_posted_qty_unit(BigDecimal aValue) {
		parentRefAx_inv_posted_qty_unit = aValue;
	}

	public BigDecimal getParentRefAx_inv_posted_qty_unit() {
		return parentRefAx_inv_posted_qty_unit;
	}

	public void setParentRefAx_inv_deducted_unit(BigDecimal aValue) {
		parentRefAx_inv_deducted_unit = aValue;
	}

	public BigDecimal getParentRefAx_inv_deducted_unit() {
		return parentRefAx_inv_deducted_unit;
	}

	public void setParentRefAx_inv_received_unit(BigDecimal aValue) {
		parentRefAx_inv_received_unit = aValue;
	}

	public BigDecimal getParentRefAx_inv_received_unit() {
		return parentRefAx_inv_received_unit;
	}

	public void setParentRefAx_inv_reserv_phys_unit(BigDecimal aValue) {
		parentRefAx_inv_reserv_phys_unit = aValue;
	}

	public BigDecimal getParentRefAx_inv_reserv_phys_unit() {
		return parentRefAx_inv_reserv_phys_unit;
	}

	public void setParentRefAx_inv_avail_phys_unit(BigDecimal aValue) {
		parentRefAx_inv_avail_phys_unit = aValue;
	}

	public BigDecimal getParentRefAx_inv_avail_phys_unit() {
		return parentRefAx_inv_avail_phys_unit;
	}

	public void setParentRefAx_inv_physical_value(BigDecimal aValue) {
		parentRefAx_inv_physical_value = aValue;
	}

	public BigDecimal getParentRefAx_inv_physical_value() {
		return parentRefAx_inv_physical_value;
	}

	public void setParentRefAx_inv_posted_value(BigDecimal aValue) {
		parentRefAx_inv_posted_value = aValue;
	}

	public BigDecimal getParentRefAx_inv_posted_value() {
		return parentRefAx_inv_posted_value;
	}

	public void setParentRefAxInventTransferLinesCode(String aValue) {
		parentRefAxInventTransferLinesCode = aValue;
	}

	public String getParentRefAxInventTransferLinesCode() {
		return parentRefAxInventTransferLinesCode;
	}

	public void setParentRefAxInventDimFinId(String aValue) {
		parentRefAxInventDimFinId = aValue;
	}

	public String getParentRefAxInventDimFinId() {
		return parentRefAxInventDimFinId;
	}

	public void setParentRefAxFactor(BigDecimal aValue){
		parentRefAxFactor = aValue;
	}
	public BigDecimal getParentRefAxFactor(){
		return parentRefAxFactor;
	}

	public int getEstimateItemRefKindCode() {
		return estimateItemRefKindCode;
	}

	public void setEstimateItemRefKindCode(int estimateItemRefKindCode) {
		this.estimateItemRefKindCode = estimateItemRefKindCode;
	}

	public String getEstimateItemRefKindName() {
		return estimateItemRefKindName;
	}

	public void setEstimateItemRefKindName(String estimateItemRefKindName) {
		this.estimateItemRefKindName = estimateItemRefKindName;
	}

}