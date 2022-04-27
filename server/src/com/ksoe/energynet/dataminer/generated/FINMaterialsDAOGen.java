
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer.generated;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


import java.util.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Connection;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.valueobject.FINMaterials;
import com.ksoe.energynet.valueobject.filter.FINMaterialsFilter;
import com.ksoe.energynet.valueobject.brief.FINMaterialsShort;
import com.ksoe.energynet.valueobject.lists.FINMaterialsShortList;


/**
 * DAO Object for FINMaterials;
 *
 */

public class FINMaterialsDAOGen extends GenericDataMiner {

	public FINMaterialsDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public FINMaterialsDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(FINMaterials inObject) throws PersistenceException {
		FINMaterials obj = new FINMaterials();
		obj.code = inObject.code;
		loadObject(obj);

		if (inObject.mat_id != obj.mat_id){
					return false;
				}

		if(inObject.nn == null && obj.nn == null){}
		else
			if(inObject.nn == null || obj.nn == null) return false;
			else
				if ( ! inObject.nn.equals(obj.nn)){
					return false;
				}

		if(inObject.mat_name == null && obj.mat_name == null){}
		else
			if(inObject.mat_name == null || obj.mat_name == null) return false;
			else
				if ( ! inObject.mat_name.equals(obj.mat_name)){
					return false;
				}

		if (inObject.mu_id != obj.mu_id){
					return false;
				}

		if(inObject.mu_name == null && obj.mu_name == null){}
		else
			if(inObject.mu_name == null || obj.mu_name == null) return false;
			else
				if ( ! inObject.mu_name.equals(obj.mu_name)){
					return false;
				}

		if(inObject.div_code == null && obj.div_code == null){}
		else
			if(inObject.div_code == null || obj.div_code == null) return false;
			else
				if ( ! inObject.div_code.equals(obj.div_code)){
					return false;
				}

		if(inObject.div_name == null && obj.div_name == null){}
		else
			if(inObject.div_name == null || obj.div_name == null) return false;
			else
				if ( ! inObject.div_name.equals(obj.div_name)){
					return false;
				}

		if (inObject.party_id != obj.party_id){
					return false;
				}

		if(inObject.doc_num == null && obj.doc_num == null){}
		else
			if(inObject.doc_num == null || obj.doc_num == null) return false;
			else
				if ( ! inObject.doc_num.equals(obj.doc_num)){
					return false;
				}

		if(inObject.partner == null && obj.partner == null){}
		else
			if(inObject.partner == null || obj.partner == null) return false;
			else
				if ( ! inObject.partner.equals(obj.partner)){
					return false;
				}

		if(inObject.partner_name == null && obj.partner_name == null){}
		else
			if(inObject.partner_name == null || obj.partner_name == null) return false;
			else
				if ( ! inObject.partner_name.equals(obj.partner_name)){
					return false;
				}

		if(inObject.doc_date == null && obj.doc_date == null){} else 
			if(inObject.doc_date == null || obj.doc_date == null) return false;
			else
				if (inObject.doc_date.compareTo(obj.doc_date) != 0){
					return false;
				}

		if(inObject.party_discription == null && obj.party_discription == null){}
		else
			if(inObject.party_discription == null || obj.party_discription == null) return false;
			else
				if ( ! inObject.party_discription.equals(obj.party_discription)){
					return false;
				}

		if (inObject.rest_purpose_id != obj.rest_purpose_id){
					return false;
				}

		if(inObject.rest_purpose_name == null && obj.rest_purpose_name == null){}
		else
			if(inObject.rest_purpose_name == null || obj.rest_purpose_name == null) return false;
			else
				if ( ! inObject.rest_purpose_name.equals(obj.rest_purpose_name)){
					return false;
				}

		if (inObject.rest_purpose_type_id != obj.rest_purpose_type_id){
					return false;
				}

		if (inObject.budget_core_id != obj.budget_core_id){
					return false;
				}

		if (inObject.frc_code != obj.frc_code){
					return false;
				}

		if(inObject.frc_name == null && obj.frc_name == null){}
		else
			if(inObject.frc_name == null || obj.frc_name == null) return false;
			else
				if ( ! inObject.frc_name.equals(obj.frc_name)){
					return false;
				}

		if(inObject.calc_price == null && obj.calc_price == null){}
		else
			if(inObject.calc_price == null || obj.calc_price == null) return false;
			else
				if ( ! inObject.calc_price.equals(obj.calc_price)){
					return false;
				}

		if(inObject.quantity == null && obj.quantity == null){}
		else
			if(inObject.quantity == null || obj.quantity == null) return false;
			else
				if ( ! inObject.quantity.equals(obj.quantity)){
					return false;
				}

		if(inObject.price == null && obj.price == null){}
		else
			if(inObject.price == null || obj.price == null) return false;
			else
				if ( ! inObject.price.equals(obj.price)){
					return false;
				}

		if(inObject.cost == null && obj.cost == null){}
		else
			if(inObject.cost == null || obj.cost == null) return false;
			else
				if ( ! inObject.cost.equals(obj.cost)){
					return false;
				}

		if(inObject.bal_sch == null && obj.bal_sch == null){}
		else
			if(inObject.bal_sch == null || obj.bal_sch == null) return false;
			else
				if ( ! inObject.bal_sch.equals(obj.bal_sch)){
					return false;
				}

		if(inObject.fullQuantity == null && obj.fullQuantity == null){}
		else
			if(inObject.fullQuantity == null || obj.fullQuantity == null) return false;
			else
				if ( ! inObject.fullQuantity.equals(obj.fullQuantity)){
					return false;
				}

		if(inObject.fullCost == null && obj.fullCost == null){}
		else
			if(inObject.fullCost == null || obj.fullCost == null) return false;
			else
				if ( ! inObject.fullCost.equals(obj.fullCost)){
					return false;
				}

		if (inObject.finDocItemCode != obj.finDocItemCode){
					return false;
				}

		if(inObject.wear_date == null && obj.wear_date == null){} else 
			if(inObject.wear_date == null || obj.wear_date == null) return false;
			else
				if (inObject.wear_date.compareTo(obj.wear_date) != 0){
					return false;
				}

		if(inObject.userGen == null && obj.userGen == null){}
		else
			if(inObject.userGen == null || obj.userGen == null) return false;
			else
				if ( ! inObject.userGen.equals(obj.userGen)){
					return false;
				}

		if(inObject.dateEdit == null && obj.dateEdit == null){} else 
			if(inObject.dateEdit == null || obj.dateEdit == null) return false;
			else
				if (inObject.dateEdit.compareTo(obj.dateEdit) != 0){
					return false;
				}

		if (inObject.oldCode != obj.oldCode){
					return false;
				}

		if(inObject.extra_cargo == null && obj.extra_cargo == null){}
		else
			if(inObject.extra_cargo == null || obj.extra_cargo == null) return false;
			else
				if ( ! inObject.extra_cargo.equals(obj.extra_cargo)){
					return false;
				}

		if(inObject.cost_ext == null && obj.cost_ext == null){}
		else
			if(inObject.cost_ext == null || obj.cost_ext == null) return false;
			else
				if ( ! inObject.cost_ext.equals(obj.cost_ext)){
					return false;
				}

		if(inObject.extra_cargo_nds == null && obj.extra_cargo_nds == null){}
		else
			if(inObject.extra_cargo_nds == null || obj.extra_cargo_nds == null) return false;
			else
				if ( ! inObject.extra_cargo_nds.equals(obj.extra_cargo_nds)){
					return false;
				}

		if(inObject.cost_ext_nds == null && obj.cost_ext_nds == null){}
		else
			if(inObject.cost_ext_nds == null || obj.cost_ext_nds == null) return false;
			else
				if ( ! inObject.cost_ext_nds.equals(obj.cost_ext_nds)){
					return false;
				}

		if(inObject.ax_party_id == null && obj.ax_party_id == null){}
		else
			if(inObject.ax_party_id == null || obj.ax_party_id == null) return false;
			else
				if ( ! inObject.ax_party_id.equals(obj.ax_party_id)){
					return false;
				}

		if(inObject.ax_rest_purpose_id == null && obj.ax_rest_purpose_id == null){}
		else
			if(inObject.ax_rest_purpose_id == null || obj.ax_rest_purpose_id == null) return false;
			else
				if ( ! inObject.ax_rest_purpose_id.equals(obj.ax_rest_purpose_id)){
					return false;
				}

		if(inObject.ax_rest_purpose_typeid == null && obj.ax_rest_purpose_typeid == null){}
		else
			if(inObject.ax_rest_purpose_typeid == null || obj.ax_rest_purpose_typeid == null) return false;
			else
				if ( ! inObject.ax_rest_purpose_typeid.equals(obj.ax_rest_purpose_typeid)){
					return false;
				}

		if(inObject.ax_frc_code == null && obj.ax_frc_code == null){}
		else
			if(inObject.ax_frc_code == null || obj.ax_frc_code == null) return false;
			else
				if ( ! inObject.ax_frc_code.equals(obj.ax_frc_code)){
					return false;
				}

		if(inObject.ax_inv_posted_qty_unit == null && obj.ax_inv_posted_qty_unit == null){}
		else
			if(inObject.ax_inv_posted_qty_unit == null || obj.ax_inv_posted_qty_unit == null) return false;
			else
				if ( ! inObject.ax_inv_posted_qty_unit.equals(obj.ax_inv_posted_qty_unit)){
					return false;
				}

		if(inObject.ax_inv_deducted_unit == null && obj.ax_inv_deducted_unit == null){}
		else
			if(inObject.ax_inv_deducted_unit == null || obj.ax_inv_deducted_unit == null) return false;
			else
				if ( ! inObject.ax_inv_deducted_unit.equals(obj.ax_inv_deducted_unit)){
					return false;
				}

		if(inObject.ax_inv_received_unit == null && obj.ax_inv_received_unit == null){}
		else
			if(inObject.ax_inv_received_unit == null || obj.ax_inv_received_unit == null) return false;
			else
				if ( ! inObject.ax_inv_received_unit.equals(obj.ax_inv_received_unit)){
					return false;
				}

		if(inObject.ax_inv_reserv_phys_unit == null && obj.ax_inv_reserv_phys_unit == null){}
		else
			if(inObject.ax_inv_reserv_phys_unit == null || obj.ax_inv_reserv_phys_unit == null) return false;
			else
				if ( ! inObject.ax_inv_reserv_phys_unit.equals(obj.ax_inv_reserv_phys_unit)){
					return false;
				}

		if(inObject.ax_inv_avail_phys_unit == null && obj.ax_inv_avail_phys_unit == null){}
		else
			if(inObject.ax_inv_avail_phys_unit == null || obj.ax_inv_avail_phys_unit == null) return false;
			else
				if ( ! inObject.ax_inv_avail_phys_unit.equals(obj.ax_inv_avail_phys_unit)){
					return false;
				}

		if(inObject.ax_inv_physical_value == null && obj.ax_inv_physical_value == null){}
		else
			if(inObject.ax_inv_physical_value == null || obj.ax_inv_physical_value == null) return false;
			else
				if ( ! inObject.ax_inv_physical_value.equals(obj.ax_inv_physical_value)){
					return false;
				}

		if(inObject.ax_inv_posted_value == null && obj.ax_inv_posted_value == null){}
		else
			if(inObject.ax_inv_posted_value == null || obj.ax_inv_posted_value == null) return false;
			else
				if ( ! inObject.ax_inv_posted_value.equals(obj.ax_inv_posted_value)){
					return false;
				}

		if(inObject.axInventTransferLinesCode == null && obj.axInventTransferLinesCode == null){}
		else
			if(inObject.axInventTransferLinesCode == null || obj.axInventTransferLinesCode == null) return false;
			else
				if ( ! inObject.axInventTransferLinesCode.equals(obj.axInventTransferLinesCode)){
					return false;
				}

		if(inObject.axInventDimFinId == null && obj.axInventDimFinId == null){}
		else
			if(inObject.axInventDimFinId == null || obj.axInventDimFinId == null) return false;
			else
				if ( ! inObject.axInventDimFinId.equals(obj.axInventDimFinId)){
					return false;
				}

		if(inObject.axFactor == null && obj.axFactor == null){}
		else
			if(inObject.axFactor == null || obj.axFactor == null) return false;
			else
				if ( ! inObject.axFactor.equals(obj.axFactor)){
					return false;
				}
		if (inObject.estimateItemRef.code != obj.estimateItemRef.code){
			return false;
		}
		if (inObject.statusRef.code != obj.statusRef.code){
			return false;
		}
		if (inObject.molDataRef.code != obj.molDataRef.code){
			return false;
		}
		if (inObject.parentRef.code != obj.parentRef.code){
			return false;
		}
		return true;
	}

	public int add(FINMaterials anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(FINMaterials anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO FINMATERIALS (CODE,MAT_ID,NN,MAT_NAME,MU_ID,MU_NAME,DIV_CODE,DIV_NAME,PARTY_ID,DOC_NUM,PARTNER,PARTNER_NAME,DOC_DATE,PARTY_DISCRIPTION,REST_PURPOSE_ID,REST_PURPOSE_NAME,REST_PURPOSE_TYPE_ID,BUDGET_CORE_ID,FRC_CODE,FRC_NAME,CALC_PRICE,QUANTITY,PRICE,COST,BAL_SCH,FULLQUANTITY,FULLCOST,FINDOCITEMCODE,WEAR_DATE,MODIFY_TIME,USERGEN,DATEEDIT,OLDCODE,EXTRA_CARGO,COST_EXT,EXTRA_CARGO_NDS,COST_EXT_NDS,AX_PARTY_ID,AX_REST_PURPOSE_ID,AX_REST_PURPOSE_TYPEID,AX_FRC_CODE,AX_INV_POSTED_QTY_UNIT,AX_INV_DEDUCTED_UNIT,AX_INV_RECEIVED_UNIT,AX_INV_RESERV_PHYS_UNT,AX_INV_AVAIL_PHYS_UNIT,AX_INV_PHYSICAL_VALUE,AX_INV_POSTED_VALUE,AXINVENTTRANSFERLINSCD,AXINVENTDIMFINID,AXFACTOR,ESTIMATEITEMREFCODE,STATUSREFCODE,MOLDATAREFCODE,PARENTREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.mat_id != Integer.MIN_VALUE ) {
				statement.setInt(2,anObject.mat_id);
			} else {
				statement.setNull(2,java.sql.Types.INTEGER);
			}
			statement.setString(3,anObject.nn);
			statement.setString(4,anObject.mat_name);
			if (anObject.mu_id != Integer.MIN_VALUE ) {
				statement.setInt(5,anObject.mu_id);
			} else {
				statement.setNull(5,java.sql.Types.INTEGER);
			}
			statement.setString(6,anObject.mu_name);
			statement.setString(7,anObject.div_code);
			statement.setString(8,anObject.div_name);
			if (anObject.party_id != Integer.MIN_VALUE ) {
				statement.setInt(9,anObject.party_id);
			} else {
				statement.setNull(9,java.sql.Types.INTEGER);
			}
			statement.setString(10,anObject.doc_num);
			statement.setString(11,anObject.partner);
			statement.setString(12,anObject.partner_name);
			if (anObject.doc_date == null) {
				statement.setDate(13,null);
			} else {
				statement.setDate(13,new java.sql.Date(anObject.doc_date.getTime()));
			}
			statement.setString(14,anObject.party_discription);
			if (anObject.rest_purpose_id != Integer.MIN_VALUE ) {
				statement.setInt(15,anObject.rest_purpose_id);
			} else {
				statement.setNull(15,java.sql.Types.INTEGER);
			}
			statement.setString(16,anObject.rest_purpose_name);
			if (anObject.rest_purpose_type_id != Integer.MIN_VALUE ) {
				statement.setInt(17,anObject.rest_purpose_type_id);
			} else {
				statement.setNull(17,java.sql.Types.INTEGER);
			}
			if (anObject.budget_core_id != Integer.MIN_VALUE ) {
				statement.setInt(18,anObject.budget_core_id);
			} else {
				statement.setNull(18,java.sql.Types.INTEGER);
			}
			if (anObject.frc_code != Integer.MIN_VALUE ) {
				statement.setInt(19,anObject.frc_code);
			} else {
				statement.setNull(19,java.sql.Types.INTEGER);
			}
			statement.setString(20,anObject.frc_name);
			if (anObject.calc_price != null) {
				anObject.calc_price = anObject.calc_price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(21,anObject.calc_price);
			if (anObject.quantity != null) {
				anObject.quantity = anObject.quantity.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(22,anObject.quantity);
			if (anObject.price != null) {
				anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(23,anObject.price);
			if (anObject.cost != null) {
				anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(24,anObject.cost);
			statement.setString(25,anObject.bal_sch);
			if (anObject.fullQuantity != null) {
				anObject.fullQuantity = anObject.fullQuantity.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(26,anObject.fullQuantity);
			if (anObject.fullCost != null) {
				anObject.fullCost = anObject.fullCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(27,anObject.fullCost);
			if (anObject.finDocItemCode != Integer.MIN_VALUE ) {
				statement.setInt(28,anObject.finDocItemCode);
			} else {
				statement.setNull(28,java.sql.Types.INTEGER);
			}
			if (anObject.wear_date == null) {
				statement.setDate(29,null);
			} else {
				statement.setDate(29,new java.sql.Date(anObject.wear_date.getTime()));
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(30,null);
			} else {
				statement.setBigDecimal(30,new java.math.BigDecimal(anObject.modify_time));
			}
			statement.setString(31,anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(32,null);
			} else {
				statement.setTimestamp(32,new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.oldCode != Integer.MIN_VALUE ) {
				statement.setInt(33,anObject.oldCode);
			} else {
				statement.setNull(33,java.sql.Types.INTEGER);
			}
			if (anObject.extra_cargo != null) {
				anObject.extra_cargo = anObject.extra_cargo.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(34,anObject.extra_cargo);
			if (anObject.cost_ext != null) {
				anObject.cost_ext = anObject.cost_ext.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(35,anObject.cost_ext);
			if (anObject.extra_cargo_nds != null) {
				anObject.extra_cargo_nds = anObject.extra_cargo_nds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(36,anObject.extra_cargo_nds);
			if (anObject.cost_ext_nds != null) {
				anObject.cost_ext_nds = anObject.cost_ext_nds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(37,anObject.cost_ext_nds);
			statement.setString(38,anObject.ax_party_id);
			statement.setString(39,anObject.ax_rest_purpose_id);
			statement.setString(40,anObject.ax_rest_purpose_typeid);
			statement.setString(41,anObject.ax_frc_code);
			if (anObject.ax_inv_posted_qty_unit != null) {
				anObject.ax_inv_posted_qty_unit = anObject.ax_inv_posted_qty_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(42,anObject.ax_inv_posted_qty_unit);
			if (anObject.ax_inv_deducted_unit != null) {
				anObject.ax_inv_deducted_unit = anObject.ax_inv_deducted_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(43,anObject.ax_inv_deducted_unit);
			if (anObject.ax_inv_received_unit != null) {
				anObject.ax_inv_received_unit = anObject.ax_inv_received_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(44,anObject.ax_inv_received_unit);
			if (anObject.ax_inv_reserv_phys_unit != null) {
				anObject.ax_inv_reserv_phys_unit = anObject.ax_inv_reserv_phys_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(45,anObject.ax_inv_reserv_phys_unit);
			if (anObject.ax_inv_avail_phys_unit != null) {
				anObject.ax_inv_avail_phys_unit = anObject.ax_inv_avail_phys_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(46,anObject.ax_inv_avail_phys_unit);
			if (anObject.ax_inv_physical_value != null) {
				anObject.ax_inv_physical_value = anObject.ax_inv_physical_value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(47,anObject.ax_inv_physical_value);
			if (anObject.ax_inv_posted_value != null) {
				anObject.ax_inv_posted_value = anObject.ax_inv_posted_value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(48,anObject.ax_inv_posted_value);
			statement.setString(49,anObject.axInventTransferLinesCode);
			statement.setString(50,anObject.axInventDimFinId);
			if (anObject.axFactor != null) {
				anObject.axFactor = anObject.axFactor.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(51,anObject.axFactor);
			if (anObject.estimateItemRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENEstimateItemDAOGen(connection,getUserProfile()).exists(anObject.estimateItemRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.FINMaterials.estimateItemRef.code%} = {%"+anObject.estimateItemRef.code+"%}");
				}
				statement.setInt(52,anObject.estimateItemRef.code);
			} else {
				statement.setNull(52,java.sql.Types.INTEGER);
			}
			if (anObject.statusRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.FINMaterialsStatusDAOGen(connection,getUserProfile()).exists(anObject.statusRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.FINMaterials.statusRef.code%} = {%"+anObject.statusRef.code+"%}");
				}
				statement.setInt(53,anObject.statusRef.code);
			} else {
				statement.setNull(53,java.sql.Types.INTEGER);
			}
			if (anObject.molDataRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.FINMolDataDAOGen(connection,getUserProfile()).exists(anObject.molDataRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.FINMaterials.molDataRef.code%} = {%"+anObject.molDataRef.code+"%}");
				}
				statement.setInt(54,anObject.molDataRef.code);
			} else {
				statement.setNull(54,java.sql.Types.INTEGER);
			}
			if (anObject.parentRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.FINMaterialsDAOGen(connection,getUserProfile()).exists(anObject.parentRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.FINMaterials.parentRef.code%} = {%"+anObject.parentRef.code+"%}");
				}
				statement.setInt(55,anObject.parentRef.code);
			} else {
				statement.setNull(55,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%FINMaterialsDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(FINMaterials anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(FINMaterials anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			FINMaterials oldObject = new FINMaterials();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+FINMaterials.modify_time_Field+" FROM  FINMATERIALS WHERE CODE = ?";
			ResultSet set = null;
			try {
				statement = connection.prepareStatement(oldObjectSelectStr);
				statement.setInt(1,oldObject.code);
				set = statement.executeQuery();
				if(!set.next()) {
					throw new PersistenceException("Can't get old object.");
				}
				oldObject.modify_time = set.getLong(1);
				if(set.wasNull()) {
					oldObject.modify_time = Long.MIN_VALUE;
				}
			} catch(SQLException e) {
				System.out.println(e.getMessage()+"\nstatement - "+oldObjectSelectStr);
				throw new SystemException(e.getMessage(), e);
			} finally {
				try {if (set != null) set.close();} catch (SQLException e) {}
				try {if (statement != null) statement.close();} catch (SQLException e) {}
				statement = null;
			}
			if(oldObject.modify_time != anObject.modify_time) {
				throw new PersistenceException("Can't update object (optimistic locking).");
			}
			anObject.modify_time = System.currentTimeMillis();

			String selectStr;

			Vector<String> fields = null;
			if(anAttributes != null) {
				String fieldNameStr;
				fields = new Vector<String>();
				for(int attrIndex = 0;attrIndex < anAttributes.length;attrIndex++) {
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MAT_ID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MAT_NAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MU_ID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MU_NAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DIV_CODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DIV_NAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PARTY_ID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DOC_NUM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PARTNER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PARTNER_NAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DOC_DATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PARTY_DISCRIPTION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("REST_PURPOSE_ID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("REST_PURPOSE_NAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("REST_PURPOSE_TYPE_ID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BUDGET_CORE_ID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FRC_CODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FRC_NAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CALC_PRICE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("QUANTITY") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PRICE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COST") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BAL_SCH") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FULLQUANTITY") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FULLCOST") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FINDOCITEMCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("WEAR_DATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USERGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEEDIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("OLDCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("EXTRA_CARGO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COST_EXT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("EXTRA_CARGO_NDS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COST_EXT_NDS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AX_PARTY_ID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AX_REST_PURPOSE_ID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AX_REST_PURPOSE_TYPEID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AX_FRC_CODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AX_INV_POSTED_QTY_UNIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AX_INV_DEDUCTED_UNIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AX_INV_RECEIVED_UNIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AX_INV_RESERV_PHYS_UNIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AX_INV_AVAIL_PHYS_UNIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AX_INV_PHYSICAL_VALUE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AX_INV_POSTED_VALUE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AXINVENTTRANSFERLINESCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AXINVENTDIMFINID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AXFACTOR") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ESTIMATEITEMREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("STATUSREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MOLDATAREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PARENTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE FINMATERIALS SET  MAT_ID = ? , NN = ? , MAT_NAME = ? , MU_ID = ? , MU_NAME = ? , DIV_CODE = ? , DIV_NAME = ? , PARTY_ID = ? , DOC_NUM = ? , PARTNER = ? , PARTNER_NAME = ? , DOC_DATE = ? , PARTY_DISCRIPTION = ? , REST_PURPOSE_ID = ? , REST_PURPOSE_NAME = ? , REST_PURPOSE_TYPE_ID = ? , BUDGET_CORE_ID = ? , FRC_CODE = ? , FRC_NAME = ? , CALC_PRICE = ? , QUANTITY = ? , PRICE = ? , COST = ? , BAL_SCH = ? , FULLQUANTITY = ? , FULLCOST = ? , FINDOCITEMCODE = ? , WEAR_DATE = ? , MODIFY_TIME = ? , USERGEN = ? , DATEEDIT = ? , OLDCODE = ? , EXTRA_CARGO = ? , COST_EXT = ? , EXTRA_CARGO_NDS = ? , COST_EXT_NDS = ? , AX_PARTY_ID = ? , AX_REST_PURPOSE_ID = ? , AX_REST_PURPOSE_TYPEID = ? , AX_FRC_CODE = ? , AX_INV_POSTED_QTY_UNIT = ? , AX_INV_DEDUCTED_UNIT = ? , AX_INV_RECEIVED_UNIT = ? , AX_INV_RESERV_PHYS_UNT = ? , AX_INV_AVAIL_PHYS_UNIT = ? , AX_INV_PHYSICAL_VALUE = ? , AX_INV_POSTED_VALUE = ? , AXINVENTTRANSFERLINSCD = ? , AXINVENTDIMFINID = ? , AXFACTOR = ? , ESTIMATEITEMREFCODE = ? , STATUSREFCODE = ? , MOLDATAREFCODE = ? , PARENTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE FINMATERIALS SET ";
				for(int fldIndex = 0;fldIndex < fields.size();fldIndex++) {
					selectStr+=(String)fields.get(fldIndex);
					if(fldIndex > 0) {
						selectStr+=",";
					}
				}
				selectStr += " WHERE CODE = ?";
			}

			statement = null;
			try {
				statement = connection.prepareStatement(selectStr);
				if(fields == null) {
					if (anObject.mat_id != Integer.MIN_VALUE) {
						statement.setInt(1,anObject.mat_id);
					} else {
						statement.setNull(1,java.sql.Types.INTEGER);
					}
					statement.setString(2,anObject.nn);
					statement.setString(3,anObject.mat_name);
					if (anObject.mu_id != Integer.MIN_VALUE) {
						statement.setInt(4,anObject.mu_id);
					} else {
						statement.setNull(4,java.sql.Types.INTEGER);
					}
					statement.setString(5,anObject.mu_name);
					statement.setString(6,anObject.div_code);
					statement.setString(7,anObject.div_name);
					if (anObject.party_id != Integer.MIN_VALUE) {
						statement.setInt(8,anObject.party_id);
					} else {
						statement.setNull(8,java.sql.Types.INTEGER);
					}
					statement.setString(9,anObject.doc_num);
					statement.setString(10,anObject.partner);
					statement.setString(11,anObject.partner_name);
					if (anObject.doc_date == null) {
						statement.setDate(12,null);
					} else {
						statement.setDate(12,new java.sql.Date(anObject.doc_date.getTime()));
					}
					statement.setString(13,anObject.party_discription);
					if (anObject.rest_purpose_id != Integer.MIN_VALUE) {
						statement.setInt(14,anObject.rest_purpose_id);
					} else {
						statement.setNull(14,java.sql.Types.INTEGER);
					}
					statement.setString(15,anObject.rest_purpose_name);
					if (anObject.rest_purpose_type_id != Integer.MIN_VALUE) {
						statement.setInt(16,anObject.rest_purpose_type_id);
					} else {
						statement.setNull(16,java.sql.Types.INTEGER);
					}
					if (anObject.budget_core_id != Integer.MIN_VALUE) {
						statement.setInt(17,anObject.budget_core_id);
					} else {
						statement.setNull(17,java.sql.Types.INTEGER);
					}
					if (anObject.frc_code != Integer.MIN_VALUE) {
						statement.setInt(18,anObject.frc_code);
					} else {
						statement.setNull(18,java.sql.Types.INTEGER);
					}
					statement.setString(19,anObject.frc_name);
					if (anObject.calc_price != null) {
						anObject.calc_price = anObject.calc_price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(20,anObject.calc_price);
					if (anObject.quantity != null) {
						anObject.quantity = anObject.quantity.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(21,anObject.quantity);
					if (anObject.price != null) {
						anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(22,anObject.price);
					if (anObject.cost != null) {
						anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(23,anObject.cost);
					statement.setString(24,anObject.bal_sch);
					if (anObject.fullQuantity != null) {
						anObject.fullQuantity = anObject.fullQuantity.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(25,anObject.fullQuantity);
					if (anObject.fullCost != null) {
						anObject.fullCost = anObject.fullCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(26,anObject.fullCost);
					if (anObject.finDocItemCode != Integer.MIN_VALUE) {
						statement.setInt(27,anObject.finDocItemCode);
					} else {
						statement.setNull(27,java.sql.Types.INTEGER);
					}
					if (anObject.wear_date == null) {
						statement.setDate(28,null);
					} else {
						statement.setDate(28,new java.sql.Date(anObject.wear_date.getTime()));
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(29,null);
					} else {
						statement.setBigDecimal(29,new java.math.BigDecimal(anObject.modify_time));
					}
					statement.setString(30,anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(31,null);
					} else {
						statement.setTimestamp(31,new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.oldCode != Integer.MIN_VALUE) {
						statement.setInt(32,anObject.oldCode);
					} else {
						statement.setNull(32,java.sql.Types.INTEGER);
					}
					if (anObject.extra_cargo != null) {
						anObject.extra_cargo = anObject.extra_cargo.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(33,anObject.extra_cargo);
					if (anObject.cost_ext != null) {
						anObject.cost_ext = anObject.cost_ext.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(34,anObject.cost_ext);
					if (anObject.extra_cargo_nds != null) {
						anObject.extra_cargo_nds = anObject.extra_cargo_nds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(35,anObject.extra_cargo_nds);
					if (anObject.cost_ext_nds != null) {
						anObject.cost_ext_nds = anObject.cost_ext_nds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(36,anObject.cost_ext_nds);
					statement.setString(37,anObject.ax_party_id);
					statement.setString(38,anObject.ax_rest_purpose_id);
					statement.setString(39,anObject.ax_rest_purpose_typeid);
					statement.setString(40,anObject.ax_frc_code);
					if (anObject.ax_inv_posted_qty_unit != null) {
						anObject.ax_inv_posted_qty_unit = anObject.ax_inv_posted_qty_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(41,anObject.ax_inv_posted_qty_unit);
					if (anObject.ax_inv_deducted_unit != null) {
						anObject.ax_inv_deducted_unit = anObject.ax_inv_deducted_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(42,anObject.ax_inv_deducted_unit);
					if (anObject.ax_inv_received_unit != null) {
						anObject.ax_inv_received_unit = anObject.ax_inv_received_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(43,anObject.ax_inv_received_unit);
					if (anObject.ax_inv_reserv_phys_unit != null) {
						anObject.ax_inv_reserv_phys_unit = anObject.ax_inv_reserv_phys_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(44,anObject.ax_inv_reserv_phys_unit);
					if (anObject.ax_inv_avail_phys_unit != null) {
						anObject.ax_inv_avail_phys_unit = anObject.ax_inv_avail_phys_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(45,anObject.ax_inv_avail_phys_unit);
					if (anObject.ax_inv_physical_value != null) {
						anObject.ax_inv_physical_value = anObject.ax_inv_physical_value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(46,anObject.ax_inv_physical_value);
					if (anObject.ax_inv_posted_value != null) {
						anObject.ax_inv_posted_value = anObject.ax_inv_posted_value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(47,anObject.ax_inv_posted_value);
					statement.setString(48,anObject.axInventTransferLinesCode);
					statement.setString(49,anObject.axInventDimFinId);
					if (anObject.axFactor != null) {
						anObject.axFactor = anObject.axFactor.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(50,anObject.axFactor);
					if (anObject.estimateItemRef.code != Integer.MIN_VALUE) {
						statement.setInt(51,anObject.estimateItemRef.code);
					} else {
						statement.setNull(51,java.sql.Types.INTEGER);
					}
					if (anObject.statusRef.code != Integer.MIN_VALUE) {
						statement.setInt(52,anObject.statusRef.code);
					} else {
						statement.setNull(52,java.sql.Types.INTEGER);
					}
					if (anObject.molDataRef.code != Integer.MIN_VALUE) {
						statement.setInt(53,anObject.molDataRef.code);
					} else {
						statement.setNull(53,java.sql.Types.INTEGER);
					}
					if (anObject.parentRef.code != Integer.MIN_VALUE) {
						statement.setInt(54,anObject.parentRef.code);
					} else {
						statement.setNull(54,java.sql.Types.INTEGER);
					}
					statement.setInt(55,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("MAT_ID".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.mat_id);
							continue;
						}
						if("NN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.nn);
							continue;
						}
						if("MAT_NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.mat_name);
							continue;
						}
						if("MU_ID".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.mu_id);
							continue;
						}
						if("MU_NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.mu_name);
							continue;
						}
						if("DIV_CODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.div_code);
							continue;
						}
						if("DIV_NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.div_name);
							continue;
						}
						if("PARTY_ID".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.party_id);
							continue;
						}
						if("DOC_NUM".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.doc_num);
							continue;
						}
						if("PARTNER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.partner);
							continue;
						}
						if("PARTNER_NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.partner_name);
							continue;
						}
						if("DOC_DATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.doc_date == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.doc_date.getTime()));
							}
							continue;
						}
						if("PARTY_DISCRIPTION".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.party_discription);
							continue;
						}
						if("REST_PURPOSE_ID".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.rest_purpose_id);
							continue;
						}
						if("REST_PURPOSE_NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.rest_purpose_name);
							continue;
						}
						if("REST_PURPOSE_TYPE_ID".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.rest_purpose_type_id);
							continue;
						}
						if("BUDGET_CORE_ID".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.budget_core_id);
							continue;
						}
						if("FRC_CODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.frc_code);
							continue;
						}
						if("FRC_NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.frc_name);
							continue;
						}
						if("CALC_PRICE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.calc_price != null) {
								anObject.calc_price = anObject.calc_price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.calc_price);
							continue;
						}
						if("QUANTITY".compareTo((String)fields.get(i)) == 0) {
							if (anObject.quantity != null) {
								anObject.quantity = anObject.quantity.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.quantity);
							continue;
						}
						if("PRICE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.price != null) {
								anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.price);
							continue;
						}
						if("COST".compareTo((String)fields.get(i)) == 0) {
							if (anObject.cost != null) {
								anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.cost);
							continue;
						}
						if("BAL_SCH".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.bal_sch);
							continue;
						}
						if("FULLQUANTITY".compareTo((String)fields.get(i)) == 0) {
							if (anObject.fullQuantity != null) {
								anObject.fullQuantity = anObject.fullQuantity.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.fullQuantity);
							continue;
						}
						if("FULLCOST".compareTo((String)fields.get(i)) == 0) {
							if (anObject.fullCost != null) {
								anObject.fullCost = anObject.fullCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.fullCost);
							continue;
						}
						if("FINDOCITEMCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.finDocItemCode);
							continue;
						}
						if("WEAR_DATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.wear_date == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.wear_date.getTime()));
							}
							continue;
						}
						if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0) {
							if (anObject.modify_time == Long.MIN_VALUE) {
								statement.setBigDecimal(i+1,null);
							} else {
								statement.setBigDecimal(i+1,new java.math.BigDecimal(anObject.modify_time));
							}
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.userGen);
							continue;
						}
						if("DATEEDIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateEdit == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateEdit.getTime()));
							}
							continue;
						}
						if("OLDCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.oldCode);
							continue;
						}
						if("EXTRA_CARGO".compareTo((String)fields.get(i)) == 0) {
							if (anObject.extra_cargo != null) {
								anObject.extra_cargo = anObject.extra_cargo.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.extra_cargo);
							continue;
						}
						if("COST_EXT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.cost_ext != null) {
								anObject.cost_ext = anObject.cost_ext.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.cost_ext);
							continue;
						}
						if("EXTRA_CARGO_NDS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.extra_cargo_nds != null) {
								anObject.extra_cargo_nds = anObject.extra_cargo_nds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.extra_cargo_nds);
							continue;
						}
						if("COST_EXT_NDS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.cost_ext_nds != null) {
								anObject.cost_ext_nds = anObject.cost_ext_nds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.cost_ext_nds);
							continue;
						}
						if("AX_PARTY_ID".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.ax_party_id);
							continue;
						}
						if("AX_REST_PURPOSE_ID".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.ax_rest_purpose_id);
							continue;
						}
						if("AX_REST_PURPOSE_TYPEID".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.ax_rest_purpose_typeid);
							continue;
						}
						if("AX_FRC_CODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.ax_frc_code);
							continue;
						}
						if("AX_INV_POSTED_QTY_UNIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.ax_inv_posted_qty_unit != null) {
								anObject.ax_inv_posted_qty_unit = anObject.ax_inv_posted_qty_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.ax_inv_posted_qty_unit);
							continue;
						}
						if("AX_INV_DEDUCTED_UNIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.ax_inv_deducted_unit != null) {
								anObject.ax_inv_deducted_unit = anObject.ax_inv_deducted_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.ax_inv_deducted_unit);
							continue;
						}
						if("AX_INV_RECEIVED_UNIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.ax_inv_received_unit != null) {
								anObject.ax_inv_received_unit = anObject.ax_inv_received_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.ax_inv_received_unit);
							continue;
						}
						if("AX_INV_RESERV_PHYS_UNIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.ax_inv_reserv_phys_unit != null) {
								anObject.ax_inv_reserv_phys_unit = anObject.ax_inv_reserv_phys_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.ax_inv_reserv_phys_unit);
							continue;
						}
						if("AX_INV_AVAIL_PHYS_UNIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.ax_inv_avail_phys_unit != null) {
								anObject.ax_inv_avail_phys_unit = anObject.ax_inv_avail_phys_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.ax_inv_avail_phys_unit);
							continue;
						}
						if("AX_INV_PHYSICAL_VALUE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.ax_inv_physical_value != null) {
								anObject.ax_inv_physical_value = anObject.ax_inv_physical_value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.ax_inv_physical_value);
							continue;
						}
						if("AX_INV_POSTED_VALUE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.ax_inv_posted_value != null) {
								anObject.ax_inv_posted_value = anObject.ax_inv_posted_value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.ax_inv_posted_value);
							continue;
						}
						if("AXINVENTTRANSFERLINESCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.axInventTransferLinesCode);
							continue;
						}
						if("AXINVENTDIMFINID".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.axInventDimFinId);
							continue;
						}
						if("AXFACTOR".compareTo((String)fields.get(i)) == 0) {
							if (anObject.axFactor != null) {
								anObject.axFactor = anObject.axFactor.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.axFactor);
							continue;
						}
						if("ESTIMATEITEMREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.estimateItemRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.estimateItemRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("STATUSREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.statusRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.statusRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("MOLDATAREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.molDataRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.molDataRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("PARENTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.parentRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.parentRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
					}
					statement.setInt(fields.size(),anObject.code);
				}
				statement.execute();
			} catch(SQLException e) {
				System.out.println(e.getMessage()+"\nstatement - "+selectStr);
				throw new SystemException(e.getMessage(), e);
			} finally {
				try {if (statement != null) statement.close();} catch (SQLException e) {}
			}
		} finally {
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}

	} // end of save(FINMaterials anObject,String[] anAttributes)


	public FINMaterialsShort getShortObject(int anObjectCode) throws PersistenceException {
		FINMaterials filterObject = new FINMaterials();
		Vector<FINMaterialsShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (FINMaterialsShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(FINMaterials filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.mat_id, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.nn, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.mat_name, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.mu_id, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.mu_name, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.div_code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.div_name, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.party_id, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.doc_num, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.partner, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.partner_name, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.doc_date, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.party_discription, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.rest_purpose_id, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.rest_purpose_name, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.rest_purpose_type_id, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.budget_core_id, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.frc_code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.frc_name, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.calc_price, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.quantity, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.price, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.cost, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.bal_sch, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.fullQuantity, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.fullCost, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.finDocItemCode, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.wear_date, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.oldCode, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.extra_cargo, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.cost_ext, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.extra_cargo_nds, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.cost_ext_nds, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.ax_party_id, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.ax_rest_purpose_id, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.ax_rest_purpose_typeid, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.ax_frc_code, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.ax_inv_posted_qty_unit, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.ax_inv_deducted_unit, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.ax_inv_received_unit, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.ax_inv_reserv_phys_unit, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.ax_inv_avail_phys_unit, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.ax_inv_physical_value, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.ax_inv_posted_value, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.axInventTransferLinesCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.axInventDimFinId, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.axFactor, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.estimateItemRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.statusRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.molDataRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.parentRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(FINMaterialsFilter filter) {
		String out = buildCondition((FINMaterials)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(FINMaterials filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, FINMaterials.code_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.mat_id, FINMaterials.mat_id_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.nn, FINMaterials.nn_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.mat_name, FINMaterials.mat_name_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.mu_id, FINMaterials.mu_id_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.mu_name, FINMaterials.mu_name_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.div_code, FINMaterials.div_code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.div_name, FINMaterials.div_name_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.party_id, FINMaterials.party_id_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.doc_num, FINMaterials.doc_num_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.partner, FINMaterials.partner_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.partner_name, FINMaterials.partner_name_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.doc_date, FINMaterials.doc_date_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.party_discription, FINMaterials.party_discription_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.rest_purpose_id, FINMaterials.rest_purpose_id_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.rest_purpose_name, FINMaterials.rest_purpose_name_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.rest_purpose_type_id, FINMaterials.rest_purpose_type_id_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.budget_core_id, FINMaterials.budget_core_id_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.frc_code, FINMaterials.frc_code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.frc_name, FINMaterials.frc_name_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.calc_price, FINMaterials.calc_price_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.quantity, FINMaterials.quantity_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.price, FINMaterials.price_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.cost, FINMaterials.cost_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.bal_sch, FINMaterials.bal_sch_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.fullQuantity, FINMaterials.fullQuantity_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.fullCost, FINMaterials.fullCost_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.finDocItemCode, FINMaterials.finDocItemCode_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.wear_date, FINMaterials.wear_date_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, FINMaterials.modify_time_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, FINMaterials.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, FINMaterials.dateEdit_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.oldCode, FINMaterials.oldCode_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.extra_cargo, FINMaterials.extra_cargo_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.cost_ext, FINMaterials.cost_ext_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.extra_cargo_nds, FINMaterials.extra_cargo_nds_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.cost_ext_nds, FINMaterials.cost_ext_nds_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.ax_party_id, FINMaterials.ax_party_id_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.ax_rest_purpose_id, FINMaterials.ax_rest_purpose_id_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.ax_rest_purpose_typeid, FINMaterials.ax_rest_purpose_typeid_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.ax_frc_code, FINMaterials.ax_frc_code_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.ax_inv_posted_qty_unit, FINMaterials.ax_inv_posted_qty_unit_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.ax_inv_deducted_unit, FINMaterials.ax_inv_deducted_unit_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.ax_inv_received_unit, FINMaterials.ax_inv_received_unit_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.ax_inv_reserv_phys_unit, FINMaterials.ax_inv_reserv_phys_unit_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.ax_inv_avail_phys_unit, FINMaterials.ax_inv_avail_phys_unit_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.ax_inv_physical_value, FINMaterials.ax_inv_physical_value_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.ax_inv_posted_value, FINMaterials.ax_inv_posted_value_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.axInventTransferLinesCode, FINMaterials.axInventTransferLinesCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.axInventDimFinId, FINMaterials.axInventDimFinId_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.axFactor, FINMaterials.axFactor_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.estimateItemRef.code, FINMaterials.estimateItemRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.statusRef.code, FINMaterials.statusRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.molDataRef.code, FINMaterials.molDataRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.parentRef.code, FINMaterials.parentRef_QFielld, out);
		}
		return out;
	}

	public FINMaterialsShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public FINMaterialsShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public FINMaterialsShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public FINMaterialsShortList getFilteredList(FINMaterials filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public FINMaterialsShortList getScrollableFilteredList(FINMaterials aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public FINMaterialsShortList getScrollableFilteredList(FINMaterials aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public FINMaterialsShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public FINMaterialsShortList getScrollableFilteredList(FINMaterialsFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public FINMaterialsShortList getScrollableFilteredList(FINMaterialsFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public FINMaterialsShortList getScrollableFilteredList(FINMaterials aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		FINMaterialsShortList result = new FINMaterialsShortList();
		FINMaterialsShort anObject;
		result.list = new Vector<FINMaterialsShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "FINMATERIALS.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"FINMATERIALS.CODE"+
			",FINMATERIALS.MAT_ID"+
			",FINMATERIALS.NN"+
			",FINMATERIALS.MAT_NAME"+
			",FINMATERIALS.MU_ID"+
			",FINMATERIALS.MU_NAME"+
			",FINMATERIALS.DIV_CODE"+
			",FINMATERIALS.DIV_NAME"+
			",FINMATERIALS.PARTY_ID"+
			",FINMATERIALS.DOC_NUM"+
			",FINMATERIALS.PARTNER"+
			",FINMATERIALS.PARTNER_NAME"+
			",FINMATERIALS.DOC_DATE"+
			",FINMATERIALS.PARTY_DISCRIPTION"+
			",FINMATERIALS.REST_PURPOSE_ID"+
			",FINMATERIALS.REST_PURPOSE_NAME"+
			",FINMATERIALS.REST_PURPOSE_TYPE_ID"+
			",FINMATERIALS.BUDGET_CORE_ID"+
			",FINMATERIALS.FRC_CODE"+
			",FINMATERIALS.FRC_NAME"+
			",FINMATERIALS.CALC_PRICE"+
			",FINMATERIALS.QUANTITY"+
			",FINMATERIALS.PRICE"+
			",FINMATERIALS.COST"+
			",FINMATERIALS.BAL_SCH"+
			",FINMATERIALS.FULLQUANTITY"+
			",FINMATERIALS.FULLCOST"+
			",FINMATERIALS.WEAR_DATE"+
			",FINMATERIALS.USERGEN"+
			",FINMATERIALS.DATEEDIT"+
			",FINMATERIALS.EXTRA_CARGO"+
			",FINMATERIALS.COST_EXT"+
			",FINMATERIALS.EXTRA_CARGO_NDS"+
			",FINMATERIALS.COST_EXT_NDS"+
			",FINMATERIALS.AX_PARTY_ID"+
			",FINMATERIALS.AX_REST_PURPOSE_ID"+
			",FINMATERIALS.AX_REST_PURPOSE_TYPEID"+
			",FINMATERIALS.AX_FRC_CODE"+
			",FINMATERIALS.AX_INV_POSTED_QTY_UNIT"+
			",FINMATERIALS.AX_INV_DEDUCTED_UNIT"+
			",FINMATERIALS.AX_INV_RECEIVED_UNIT"+
			",FINMATERIALS.AX_INV_RESERV_PHYS_UNT"+
			",FINMATERIALS.AX_INV_AVAIL_PHYS_UNIT"+
			",FINMATERIALS.AX_INV_PHYSICAL_VALUE"+
			",FINMATERIALS.AX_INV_POSTED_VALUE"+
			",FINMATERIALS.AXINVENTTRANSFERLINSCD"+
			",FINMATERIALS.AXINVENTDIMFINID"+
			",FINMATERIALS.AXFACTOR"+
			", ENESTIMATEITEM.CODE " +
			", ENESTIMATEITEM.COUNTGEN " +
			", ENESTIMATEITEM.COUNTFACT " +
			", ENESTIMATEITEM.PRICE " +
			", ENESTIMATEITEM.COST " +
			", ENESTIMATEITEM.ISUSEVAT " +
			", ENESTIMATEITEM.DELIVERYTIME " +
			", ENESTIMATEITEM.USEWORKTIME " +
			", ENESTIMATEITEM.USERGEN " +
			", ENESTIMATEITEM.DATEEDIT " +
			", FINMATERIALSSTATUS.CODE " +
			", FINMATERIALSSTATUS.NAME " +
			", FINMOLDATA.CODE " +
			", FINMOLDATA.FINMOLCODE " +
			", FINMOLDATA.FINMOLNAME " +
			", FINMATERIALS.CODE " +
			", FINMATERIALS.MAT_ID " +
			", FINMATERIALS.NN " +
			", FINMATERIALS.MAT_NAME " +
			", FINMATERIALS.MU_ID " +
			", FINMATERIALS.MU_NAME " +
			", FINMATERIALS.DIV_CODE " +
			", FINMATERIALS.DIV_NAME " +
			", FINMATERIALS.PARTY_ID " +
			", FINMATERIALS.DOC_NUM " +
			", FINMATERIALS.PARTNER " +
			", FINMATERIALS.PARTNER_NAME " +
			", FINMATERIALS.DOC_DATE " +
			", FINMATERIALS.PARTY_DISCRIPTION " +
			", FINMATERIALS.REST_PURPOSE_ID " +
			", FINMATERIALS.REST_PURPOSE_NAME " +
			", FINMATERIALS.REST_PURPOSE_TYPE_ID " +
			", FINMATERIALS.BUDGET_CORE_ID " +
			", FINMATERIALS.FRC_CODE " +
			", FINMATERIALS.FRC_NAME " +
			", FINMATERIALS.CALC_PRICE " +
			", FINMATERIALS.QUANTITY " +
			", FINMATERIALS.PRICE " +
			", FINMATERIALS.COST " +
			", FINMATERIALS.BAL_SCH " +
			", FINMATERIALS.FULLQUANTITY " +
			", FINMATERIALS.FULLCOST " +
			", FINMATERIALS.WEAR_DATE " +
			", FINMATERIALS.USERGEN " +
			", FINMATERIALS.DATEEDIT " +
			", FINMATERIALS.EXTRA_CARGO " +
			", FINMATERIALS.COST_EXT " +
			", FINMATERIALS.EXTRA_CARGO_NDS " +
			", FINMATERIALS.COST_EXT_NDS " +
			", FINMATERIALS.AX_PARTY_ID " +
			", FINMATERIALS.AX_REST_PURPOSE_ID " +
			", FINMATERIALS.AX_REST_PURPOSE_TYPEID " +
			", FINMATERIALS.AX_FRC_CODE " +
			", FINMATERIALS.AX_INV_POSTED_QTY_UNIT " +
			", FINMATERIALS.AX_INV_DEDUCTED_UNIT " +
			", FINMATERIALS.AX_INV_RECEIVED_UNIT " +
			", FINMATERIALS.AX_INV_RESERV_PHYS_UNT " +
			", FINMATERIALS.AX_INV_AVAIL_PHYS_UNIT " +
			", FINMATERIALS.AX_INV_PHYSICAL_VALUE " +
			", FINMATERIALS.AX_INV_POSTED_VALUE " +
			", FINMATERIALS.AXINVENTTRANSFERLINSCD " +
			", FINMATERIALS.AXINVENTDIMFINID " +
			", FINMATERIALS.AXFACTOR " +
		" FROM FINMATERIALS " +
			", ENESTIMATEITEM " +
			", FINMATERIALSSTATUS " +
			", FINMOLDATA " +
			", FINMATERIALS " +
		"";
		whereStr = " ENESTIMATEITEM.CODE = FINMATERIALS.ESTIMATEITEMREFCODE" ; //+
		whereStr += " AND FINMATERIALSSTATUS.CODE = FINMATERIALS.STATUSREFCODE" ; //+
		whereStr += " AND FINMOLDATA.CODE = FINMATERIALS.MOLDATAREFCODE" ; //+
		whereStr += " AND FINMATERIALS.CODE = FINMATERIALS.PARENTREFCODE" ; //+

	
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		whereStr = BaseDAOUtils.addToCondition(condition, whereStr);
		if(whereStr.length() != 0) {
			selectStr += " WHERE " + whereStr;
		}
		selectStr = selectStr + " ORDER BY " + orderBy;

		selectStr = selectStr + " OFFSET " + fromPosition;
		if (quantity > -1) selectStr = selectStr + " LIMIT " + quantity;
		int number = 0;
		try {
			statement = connection.prepareStatement(selectStr);
			number = setParameters(aFilterObject, statement);
			
			if(condition.length() > 0 && aBindObjects != null) {
				_bindObjectsToPreparedStatement(statement, aBindObjects, number);
			}

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				anObject = new FINMaterialsShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.mat_id = set.getInt(2);
				if ( set.wasNull() ) {
					anObject.mat_id = Integer.MIN_VALUE;
				}
				anObject.nn = set.getString(3);
				anObject.mat_name = set.getString(4);
				anObject.mu_id = set.getInt(5);
				if ( set.wasNull() ) {
					anObject.mu_id = Integer.MIN_VALUE;
				}
				anObject.mu_name = set.getString(6);
				anObject.div_code = set.getString(7);
				anObject.div_name = set.getString(8);
				anObject.party_id = set.getInt(9);
				if ( set.wasNull() ) {
					anObject.party_id = Integer.MIN_VALUE;
				}
				anObject.doc_num = set.getString(10);
				anObject.partner = set.getString(11);
				anObject.partner_name = set.getString(12);
				anObject.doc_date = set.getDate(13);
				anObject.party_discription = set.getString(14);
				anObject.rest_purpose_id = set.getInt(15);
				if ( set.wasNull() ) {
					anObject.rest_purpose_id = Integer.MIN_VALUE;
				}
				anObject.rest_purpose_name = set.getString(16);
				anObject.rest_purpose_type_id = set.getInt(17);
				if ( set.wasNull() ) {
					anObject.rest_purpose_type_id = Integer.MIN_VALUE;
				}
				anObject.budget_core_id = set.getInt(18);
				if ( set.wasNull() ) {
					anObject.budget_core_id = Integer.MIN_VALUE;
				}
				anObject.frc_code = set.getInt(19);
				if ( set.wasNull() ) {
					anObject.frc_code = Integer.MIN_VALUE;
				}
				anObject.frc_name = set.getString(20);
				anObject.calc_price = set.getBigDecimal(21);
				if(anObject.calc_price != null) {
					anObject.calc_price = anObject.calc_price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.quantity = set.getBigDecimal(22);
				if(anObject.quantity != null) {
					anObject.quantity = anObject.quantity.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.price = set.getBigDecimal(23);
				if(anObject.price != null) {
					anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cost = set.getBigDecimal(24);
				if(anObject.cost != null) {
					anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.bal_sch = set.getString(25);
				anObject.fullQuantity = set.getBigDecimal(26);
				if(anObject.fullQuantity != null) {
					anObject.fullQuantity = anObject.fullQuantity.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.fullCost = set.getBigDecimal(27);
				if(anObject.fullCost != null) {
					anObject.fullCost = anObject.fullCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.wear_date = set.getDate(28);
				anObject.userGen = set.getString(29);
				anObject.dateEdit = set.getTimestamp(30);
				anObject.extra_cargo = set.getBigDecimal(31);
				if(anObject.extra_cargo != null) {
					anObject.extra_cargo = anObject.extra_cargo.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cost_ext = set.getBigDecimal(32);
				if(anObject.cost_ext != null) {
					anObject.cost_ext = anObject.cost_ext.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.extra_cargo_nds = set.getBigDecimal(33);
				if(anObject.extra_cargo_nds != null) {
					anObject.extra_cargo_nds = anObject.extra_cargo_nds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cost_ext_nds = set.getBigDecimal(34);
				if(anObject.cost_ext_nds != null) {
					anObject.cost_ext_nds = anObject.cost_ext_nds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ax_party_id = set.getString(35);
				anObject.ax_rest_purpose_id = set.getString(36);
				anObject.ax_rest_purpose_typeid = set.getString(37);
				anObject.ax_frc_code = set.getString(38);
				anObject.ax_inv_posted_qty_unit = set.getBigDecimal(39);
				if(anObject.ax_inv_posted_qty_unit != null) {
					anObject.ax_inv_posted_qty_unit = anObject.ax_inv_posted_qty_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ax_inv_deducted_unit = set.getBigDecimal(40);
				if(anObject.ax_inv_deducted_unit != null) {
					anObject.ax_inv_deducted_unit = anObject.ax_inv_deducted_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ax_inv_received_unit = set.getBigDecimal(41);
				if(anObject.ax_inv_received_unit != null) {
					anObject.ax_inv_received_unit = anObject.ax_inv_received_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ax_inv_reserv_phys_unit = set.getBigDecimal(42);
				if(anObject.ax_inv_reserv_phys_unit != null) {
					anObject.ax_inv_reserv_phys_unit = anObject.ax_inv_reserv_phys_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ax_inv_avail_phys_unit = set.getBigDecimal(43);
				if(anObject.ax_inv_avail_phys_unit != null) {
					anObject.ax_inv_avail_phys_unit = anObject.ax_inv_avail_phys_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ax_inv_physical_value = set.getBigDecimal(44);
				if(anObject.ax_inv_physical_value != null) {
					anObject.ax_inv_physical_value = anObject.ax_inv_physical_value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ax_inv_posted_value = set.getBigDecimal(45);
				if(anObject.ax_inv_posted_value != null) {
					anObject.ax_inv_posted_value = anObject.ax_inv_posted_value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.axInventTransferLinesCode = set.getString(46);
				anObject.axInventDimFinId = set.getString(47);
				anObject.axFactor = set.getBigDecimal(48);
				if(anObject.axFactor != null) {
					anObject.axFactor = anObject.axFactor.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.estimateItemRefCode = set.getInt(49);
				if(set.wasNull()) {
					anObject.estimateItemRefCode = Integer.MIN_VALUE;
				}
				anObject.estimateItemRefCountGen = set.getBigDecimal(50);
				if(anObject.estimateItemRefCountGen != null) {
					anObject.estimateItemRefCountGen = anObject.estimateItemRefCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.estimateItemRefCountFact = set.getBigDecimal(51);
				if(anObject.estimateItemRefCountFact != null) {
					anObject.estimateItemRefCountFact = anObject.estimateItemRefCountFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.estimateItemRefPrice = set.getBigDecimal(52);
				if(anObject.estimateItemRefPrice != null) {
					anObject.estimateItemRefPrice = anObject.estimateItemRefPrice.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.estimateItemRefCost = set.getBigDecimal(53);
				if(anObject.estimateItemRefCost != null) {
					anObject.estimateItemRefCost = anObject.estimateItemRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.estimateItemRefIsUseVAT = set.getInt(54);
				if(set.wasNull()) {
					anObject.estimateItemRefIsUseVAT = Integer.MIN_VALUE;
				}
				anObject.estimateItemRefDeliveryTime = set.getInt(55);
				if(set.wasNull()) {
					anObject.estimateItemRefDeliveryTime = Integer.MIN_VALUE;
				}
				anObject.estimateItemRefUseWorkTime = set.getInt(56);
				if(set.wasNull()) {
					anObject.estimateItemRefUseWorkTime = Integer.MIN_VALUE;
				}
				anObject.estimateItemRefUserGen = set.getString(57);
				anObject.estimateItemRefDateEdit = set.getDate(58);
				anObject.statusRefCode = set.getInt(59);
				if(set.wasNull()) {
					anObject.statusRefCode = Integer.MIN_VALUE;
				}
				anObject.statusRefName = set.getString(60);
				anObject.molDataRefCode = set.getInt(61);
				if(set.wasNull()) {
					anObject.molDataRefCode = Integer.MIN_VALUE;
				}
				anObject.molDataRefFinMolCode = set.getString(62);
				anObject.molDataRefFinMolName = set.getString(63);
				anObject.parentRefCode = set.getInt(64);
				if(set.wasNull()) {
					anObject.parentRefCode = Integer.MIN_VALUE;
				}
				anObject.parentRefMat_id = set.getInt(65);
				if(set.wasNull()) {
					anObject.parentRefMat_id = Integer.MIN_VALUE;
				}
				anObject.parentRefNn = set.getString(66);
				anObject.parentRefMat_name = set.getString(67);
				anObject.parentRefMu_id = set.getInt(68);
				if(set.wasNull()) {
					anObject.parentRefMu_id = Integer.MIN_VALUE;
				}
				anObject.parentRefMu_name = set.getString(69);
				anObject.parentRefDiv_code = set.getString(70);
				anObject.parentRefDiv_name = set.getString(71);
				anObject.parentRefParty_id = set.getInt(72);
				if(set.wasNull()) {
					anObject.parentRefParty_id = Integer.MIN_VALUE;
				}
				anObject.parentRefDoc_num = set.getString(73);
				anObject.parentRefPartner = set.getString(74);
				anObject.parentRefPartner_name = set.getString(75);
				anObject.parentRefDoc_date = set.getDate(76);
				anObject.parentRefParty_discription = set.getString(77);
				anObject.parentRefRest_purpose_id = set.getInt(78);
				if(set.wasNull()) {
					anObject.parentRefRest_purpose_id = Integer.MIN_VALUE;
				}
				anObject.parentRefRest_purpose_name = set.getString(79);
				anObject.parentRefRest_purpose_type_id = set.getInt(80);
				if(set.wasNull()) {
					anObject.parentRefRest_purpose_type_id = Integer.MIN_VALUE;
				}
				anObject.parentRefBudget_core_id = set.getInt(81);
				if(set.wasNull()) {
					anObject.parentRefBudget_core_id = Integer.MIN_VALUE;
				}
				anObject.parentRefFrc_code = set.getInt(82);
				if(set.wasNull()) {
					anObject.parentRefFrc_code = Integer.MIN_VALUE;
				}
				anObject.parentRefFrc_name = set.getString(83);
				anObject.parentRefCalc_price = set.getBigDecimal(84);
				if(anObject.parentRefCalc_price != null) {
					anObject.parentRefCalc_price = anObject.parentRefCalc_price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefQuantity = set.getBigDecimal(85);
				if(anObject.parentRefQuantity != null) {
					anObject.parentRefQuantity = anObject.parentRefQuantity.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefPrice = set.getBigDecimal(86);
				if(anObject.parentRefPrice != null) {
					anObject.parentRefPrice = anObject.parentRefPrice.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefCost = set.getBigDecimal(87);
				if(anObject.parentRefCost != null) {
					anObject.parentRefCost = anObject.parentRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefBal_sch = set.getString(88);
				anObject.parentRefFullQuantity = set.getBigDecimal(89);
				if(anObject.parentRefFullQuantity != null) {
					anObject.parentRefFullQuantity = anObject.parentRefFullQuantity.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefFullCost = set.getBigDecimal(90);
				if(anObject.parentRefFullCost != null) {
					anObject.parentRefFullCost = anObject.parentRefFullCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefWear_date = set.getDate(91);
				anObject.parentRefUserGen = set.getString(92);
				anObject.parentRefDateEdit = set.getTimestamp(93);
				anObject.parentRefExtra_cargo = set.getBigDecimal(94);
				if(anObject.parentRefExtra_cargo != null) {
					anObject.parentRefExtra_cargo = anObject.parentRefExtra_cargo.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefCost_ext = set.getBigDecimal(95);
				if(anObject.parentRefCost_ext != null) {
					anObject.parentRefCost_ext = anObject.parentRefCost_ext.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefExtra_cargo_nds = set.getBigDecimal(96);
				if(anObject.parentRefExtra_cargo_nds != null) {
					anObject.parentRefExtra_cargo_nds = anObject.parentRefExtra_cargo_nds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefCost_ext_nds = set.getBigDecimal(97);
				if(anObject.parentRefCost_ext_nds != null) {
					anObject.parentRefCost_ext_nds = anObject.parentRefCost_ext_nds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefAx_party_id = set.getString(98);
				anObject.parentRefAx_rest_purpose_id = set.getString(99);
				anObject.parentRefAx_rest_purpose_typeid = set.getString(100);
				anObject.parentRefAx_frc_code = set.getString(101);
				anObject.parentRefAx_inv_posted_qty_unit = set.getBigDecimal(102);
				if(anObject.parentRefAx_inv_posted_qty_unit != null) {
					anObject.parentRefAx_inv_posted_qty_unit = anObject.parentRefAx_inv_posted_qty_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefAx_inv_deducted_unit = set.getBigDecimal(103);
				if(anObject.parentRefAx_inv_deducted_unit != null) {
					anObject.parentRefAx_inv_deducted_unit = anObject.parentRefAx_inv_deducted_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefAx_inv_received_unit = set.getBigDecimal(104);
				if(anObject.parentRefAx_inv_received_unit != null) {
					anObject.parentRefAx_inv_received_unit = anObject.parentRefAx_inv_received_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefAx_inv_reserv_phys_unit = set.getBigDecimal(105);
				if(anObject.parentRefAx_inv_reserv_phys_unit != null) {
					anObject.parentRefAx_inv_reserv_phys_unit = anObject.parentRefAx_inv_reserv_phys_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefAx_inv_avail_phys_unit = set.getBigDecimal(106);
				if(anObject.parentRefAx_inv_avail_phys_unit != null) {
					anObject.parentRefAx_inv_avail_phys_unit = anObject.parentRefAx_inv_avail_phys_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefAx_inv_physical_value = set.getBigDecimal(107);
				if(anObject.parentRefAx_inv_physical_value != null) {
					anObject.parentRefAx_inv_physical_value = anObject.parentRefAx_inv_physical_value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefAx_inv_posted_value = set.getBigDecimal(108);
				if(anObject.parentRefAx_inv_posted_value != null) {
					anObject.parentRefAx_inv_posted_value = anObject.parentRefAx_inv_posted_value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefAxInventTransferLinesCode = set.getString(109);
				anObject.parentRefAxInventDimFinId = set.getString(110);
				anObject.parentRefAxFactor = set.getBigDecimal(111);
				if(anObject.parentRefAxFactor != null) {
					anObject.parentRefAxFactor = anObject.parentRefAxFactor.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}

				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (set != null) set.close();}             catch (SQLException e) {}
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}
	
	public int[] getFilteredCodeArray(FINMaterialsFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}


	public int[] getFilteredCodeArray(FINMaterials aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT FINMATERIALS.CODE FROM FINMATERIALS";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "FINMATERIALS.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);
		
		whereStr = BaseDAOUtils.addToCondition(condition, whereStr);

		if(whereStr.length() != 0) {
			selectStr = selectStr + " WHERE " + whereStr;
		}

		selectStr = selectStr + " ORDER BY " + orderBy;
		selectStr = selectStr + " OFFSET " + fromPosition;
		if (quantity > -1) selectStr = selectStr + " LIMIT " + quantity;

		try {
			statement = connection.prepareStatement(selectStr);
			int number = setParameters(aFilterObject, statement);

			if(condition.length() > 0 && aBindObjects != null) {
				_bindObjectsToPreparedStatement(statement,aBindObjects,number);
			}

			set = statement.executeQuery();
			int i;
			for(i = 0;set.next();i++) {
				if(i < fromPosition) {
					continue;
				} else if(i >= fromPosition + quantity) {
					i++;
					break;
				}
				result.add(new Integer(set.getInt(1)));
			}

			int[] array = new int[result.size()];
			for(int j = 0;j < result.size();j++) {
				array[j] = ((Integer)result.get(j)).intValue();
			}
			return array;
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (set != null) set.close();} catch (SQLException e) {}
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	} // end of getFilteredCodeArray

	public FINMaterials getObject(int uid) throws PersistenceException {
		FINMaterials result = new FINMaterials();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(FINMaterials anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  FINMATERIALS.CODE, FINMATERIALS.MAT_ID, FINMATERIALS.NN, FINMATERIALS.MAT_NAME, FINMATERIALS.MU_ID, FINMATERIALS.MU_NAME, FINMATERIALS.DIV_CODE, FINMATERIALS.DIV_NAME, FINMATERIALS.PARTY_ID, FINMATERIALS.DOC_NUM, FINMATERIALS.PARTNER, FINMATERIALS.PARTNER_NAME, FINMATERIALS.DOC_DATE, FINMATERIALS.PARTY_DISCRIPTION, FINMATERIALS.REST_PURPOSE_ID, FINMATERIALS.REST_PURPOSE_NAME, FINMATERIALS.REST_PURPOSE_TYPE_ID, FINMATERIALS.BUDGET_CORE_ID, FINMATERIALS.FRC_CODE, FINMATERIALS.FRC_NAME, FINMATERIALS.CALC_PRICE, FINMATERIALS.QUANTITY, FINMATERIALS.PRICE, FINMATERIALS.COST, FINMATERIALS.BAL_SCH, FINMATERIALS.FULLQUANTITY, FINMATERIALS.FULLCOST, FINMATERIALS.FINDOCITEMCODE, FINMATERIALS.WEAR_DATE, FINMATERIALS.MODIFY_TIME, FINMATERIALS.USERGEN, FINMATERIALS.DATEEDIT, FINMATERIALS.OLDCODE, FINMATERIALS.EXTRA_CARGO, FINMATERIALS.COST_EXT, FINMATERIALS.EXTRA_CARGO_NDS, FINMATERIALS.COST_EXT_NDS, FINMATERIALS.AX_PARTY_ID, FINMATERIALS.AX_REST_PURPOSE_ID, FINMATERIALS.AX_REST_PURPOSE_TYPEID, FINMATERIALS.AX_FRC_CODE, FINMATERIALS.AX_INV_POSTED_QTY_UNIT, FINMATERIALS.AX_INV_DEDUCTED_UNIT, FINMATERIALS.AX_INV_RECEIVED_UNIT, FINMATERIALS.AX_INV_RESERV_PHYS_UNT, FINMATERIALS.AX_INV_AVAIL_PHYS_UNIT, FINMATERIALS.AX_INV_PHYSICAL_VALUE, FINMATERIALS.AX_INV_POSTED_VALUE, FINMATERIALS.AXINVENTTRANSFERLINSCD, FINMATERIALS.AXINVENTDIMFINID, FINMATERIALS.AXFACTOR, FINMATERIALS.ESTIMATEITEMREFCODE, FINMATERIALS.STATUSREFCODE, FINMATERIALS.MOLDATAREFCODE, FINMATERIALS.PARENTREFCODE "
			+" FROM FINMATERIALS WHERE FINMATERIALS.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.mat_id = set.getInt(2);
				if (set.wasNull()) {
					anObject.mat_id = Integer.MIN_VALUE;
				}
				anObject.nn = set.getString(3);
				anObject.mat_name = set.getString(4);
				anObject.mu_id = set.getInt(5);
				if (set.wasNull()) {
					anObject.mu_id = Integer.MIN_VALUE;
				}
				anObject.mu_name = set.getString(6);
				anObject.div_code = set.getString(7);
				anObject.div_name = set.getString(8);
				anObject.party_id = set.getInt(9);
				if (set.wasNull()) {
					anObject.party_id = Integer.MIN_VALUE;
				}
				anObject.doc_num = set.getString(10);
				anObject.partner = set.getString(11);
				anObject.partner_name = set.getString(12);
				anObject.doc_date = set.getDate(13);
				anObject.party_discription = set.getString(14);
				anObject.rest_purpose_id = set.getInt(15);
				if (set.wasNull()) {
					anObject.rest_purpose_id = Integer.MIN_VALUE;
				}
				anObject.rest_purpose_name = set.getString(16);
				anObject.rest_purpose_type_id = set.getInt(17);
				if (set.wasNull()) {
					anObject.rest_purpose_type_id = Integer.MIN_VALUE;
				}
				anObject.budget_core_id = set.getInt(18);
				if (set.wasNull()) {
					anObject.budget_core_id = Integer.MIN_VALUE;
				}
				anObject.frc_code = set.getInt(19);
				if (set.wasNull()) {
					anObject.frc_code = Integer.MIN_VALUE;
				}
				anObject.frc_name = set.getString(20);
				anObject.calc_price = set.getBigDecimal(21);
				if(anObject.calc_price != null) {
					anObject.calc_price = anObject.calc_price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.quantity = set.getBigDecimal(22);
				if(anObject.quantity != null) {
					anObject.quantity = anObject.quantity.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.price = set.getBigDecimal(23);
				if(anObject.price != null) {
					anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cost = set.getBigDecimal(24);
				if(anObject.cost != null) {
					anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.bal_sch = set.getString(25);
				anObject.fullQuantity = set.getBigDecimal(26);
				if(anObject.fullQuantity != null) {
					anObject.fullQuantity = anObject.fullQuantity.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.fullCost = set.getBigDecimal(27);
				if(anObject.fullCost != null) {
					anObject.fullCost = anObject.fullCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.finDocItemCode = set.getInt(28);
				if (set.wasNull()) {
					anObject.finDocItemCode = Integer.MIN_VALUE;
				}
				anObject.wear_date = set.getDate(29);
				anObject.modify_time = set.getLong(30);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.userGen = set.getString(31);
				anObject.dateEdit = set.getTimestamp(32);
				anObject.oldCode = set.getInt(33);
				if (set.wasNull()) {
					anObject.oldCode = Integer.MIN_VALUE;
				}
				anObject.extra_cargo = set.getBigDecimal(34);
				if(anObject.extra_cargo != null) {
					anObject.extra_cargo = anObject.extra_cargo.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cost_ext = set.getBigDecimal(35);
				if(anObject.cost_ext != null) {
					anObject.cost_ext = anObject.cost_ext.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.extra_cargo_nds = set.getBigDecimal(36);
				if(anObject.extra_cargo_nds != null) {
					anObject.extra_cargo_nds = anObject.extra_cargo_nds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cost_ext_nds = set.getBigDecimal(37);
				if(anObject.cost_ext_nds != null) {
					anObject.cost_ext_nds = anObject.cost_ext_nds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ax_party_id = set.getString(38);
				anObject.ax_rest_purpose_id = set.getString(39);
				anObject.ax_rest_purpose_typeid = set.getString(40);
				anObject.ax_frc_code = set.getString(41);
				anObject.ax_inv_posted_qty_unit = set.getBigDecimal(42);
				if(anObject.ax_inv_posted_qty_unit != null) {
					anObject.ax_inv_posted_qty_unit = anObject.ax_inv_posted_qty_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ax_inv_deducted_unit = set.getBigDecimal(43);
				if(anObject.ax_inv_deducted_unit != null) {
					anObject.ax_inv_deducted_unit = anObject.ax_inv_deducted_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ax_inv_received_unit = set.getBigDecimal(44);
				if(anObject.ax_inv_received_unit != null) {
					anObject.ax_inv_received_unit = anObject.ax_inv_received_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ax_inv_reserv_phys_unit = set.getBigDecimal(45);
				if(anObject.ax_inv_reserv_phys_unit != null) {
					anObject.ax_inv_reserv_phys_unit = anObject.ax_inv_reserv_phys_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ax_inv_avail_phys_unit = set.getBigDecimal(46);
				if(anObject.ax_inv_avail_phys_unit != null) {
					anObject.ax_inv_avail_phys_unit = anObject.ax_inv_avail_phys_unit.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ax_inv_physical_value = set.getBigDecimal(47);
				if(anObject.ax_inv_physical_value != null) {
					anObject.ax_inv_physical_value = anObject.ax_inv_physical_value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ax_inv_posted_value = set.getBigDecimal(48);
				if(anObject.ax_inv_posted_value != null) {
					anObject.ax_inv_posted_value = anObject.ax_inv_posted_value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.axInventTransferLinesCode = set.getString(49);
				anObject.axInventDimFinId = set.getString(50);
				anObject.axFactor = set.getBigDecimal(51);
				if(anObject.axFactor != null) {
					anObject.axFactor = anObject.axFactor.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.estimateItemRef.code = set.getInt(52);
				if (set.wasNull()) {
					anObject.estimateItemRef.code = Integer.MIN_VALUE;
				}
				anObject.statusRef.code = set.getInt(53);
				if (set.wasNull()) {
					anObject.statusRef.code = Integer.MIN_VALUE;
				}
				anObject.molDataRef.code = set.getInt(54);
				if (set.wasNull()) {
					anObject.molDataRef.code = Integer.MIN_VALUE;
				}
				anObject.parentRef.code = set.getInt(55);
				if (set.wasNull()) {
					anObject.parentRef.code = Integer.MIN_VALUE;
				}
				if(anObject.estimateItemRef.code != Integer.MIN_VALUE) {
					anObject.setEstimateItemRef(
						new com.ksoe.energynet.dataminer.generated.ENEstimateItemDAOGen(connection,getUserProfile()).getRef(anObject.estimateItemRef.code));
				}
				if(anObject.statusRef.code != Integer.MIN_VALUE) {
					anObject.setStatusRef(
						new com.ksoe.energynet.dataminer.generated.FINMaterialsStatusDAOGen(connection,getUserProfile()).getRef(anObject.statusRef.code));
				}
				if(anObject.molDataRef.code != Integer.MIN_VALUE) {
					anObject.setMolDataRef(
						new com.ksoe.energynet.dataminer.generated.FINMolDataDAOGen(connection,getUserProfile()).getRef(anObject.molDataRef.code));
				}
				if(anObject.parentRef.code != Integer.MIN_VALUE) {
					anObject.setParentRef(
						new com.ksoe.energynet.dataminer.generated.FINMaterialsDAOGen(connection,getUserProfile()).getRef(anObject.parentRef.code));
				}
			}
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if(set != null) set.close(); if (statement != null) statement.close();}
			catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}


	public com.ksoe.energynet.valueobject.references.FINMaterialsRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.FINMaterialsRef ref = new com.ksoe.energynet.valueobject.references.FINMaterialsRef();
		if(exists(anObjectCode)) {
			ref.code = anObjectCode;
		} else {
			ref.code = Integer.MIN_VALUE;
		}
		return ref;
	}

	public void remove(int uid) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();

		selectStr = "DELETE FROM  FINMATERIALS WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		FINMaterials object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%FINMaterials.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(FINMaterials.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%FINMaterials.remove%} access denied");
		}

		PreparedStatement statement = null;
		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,uid);
			statement.execute();
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}
	
	public long count(FINMaterialsFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(FINMaterialsFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, FINMaterialsFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM FINMATERIALS", aggFunction, column);
		String whereStr = "";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		

		whereStr = BaseDAOUtils.addToCondition(buildCondition(filter), whereStr);

		if(whereStr.length() != 0) {
			selectStr = selectStr + " WHERE " + whereStr;
		}
		
		try {
			statement = connection.prepareStatement(selectStr);
			int number = setParameters(filter, statement);

			if(bindObjects != null) {
				_bindObjectsToPreparedStatement(statement,bindObjects,number);
			}

			set = statement.executeQuery();
			if(set.next()) {
				return (E)set.getObject(1);
			} else {
				return null;
			}
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (set != null) set.close();} catch (SQLException e) {}
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}		
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, FINMaterialsFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "FINMATERIALS");
		String whereStr = "";
		PreparedStatement statement = null;
		ResultSet set = null;
		
		ArrayList<E> out = new ArrayList<E>();
		
		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		whereStr += buildCondition(filter);

		if(whereStr.length() != 0) {
			sql += " WHERE " + whereStr;
		}
		
		try {
			statement = connection.prepareStatement(sql);
			int number = setParameters(filter, statement);

			if(bindObjects != null) {
				_bindObjectsToPreparedStatement(statement,bindObjects,number);
			}

			set = statement.executeQuery();
			while(set.next()) {
				out.add((E)set.getObject(1));
			}
			return out;
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+sql);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (set != null) set.close();} catch (SQLException e) {}
			try {if (statement != null) statement.close();} catch (SQLException e) {}
		}		
	}

	public boolean exists(int anObjectCode) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		if(anObjectCode == Integer.MIN_VALUE) {
			return false;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(FINMaterials.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%FINMaterials.getObject%} access denied");
		}

		selectStr =
			"SELECT  FINMATERIALS.CODE FROM  FINMATERIALS WHERE  FINMATERIALS.CODE = ?";
		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObjectCode);
			set = statement.executeQuery();
			if(set.next()) {
				return true;
			}
			return false;
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (set != null) set.close();}             catch (SQLException e) {}
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public static String processCondition(String aCondition) {
		if(aCondition == null || aCondition.length() == 0) {
			return "";
		}

		StringBuffer condition = new StringBuffer(aCondition);
		_checkConditionToken(condition,";"," ");
		_checkConditionToken(condition,"--"," ");
		_checkConditionToken(condition,"\r"," ");
		_checkConditionToken(condition,"\n"," ");
		_checkConditionToken(condition,"||"," OR ");
		_checkConditionToken(condition,"&&"," AND ");
		_checkConditionToken(condition,"==","=");
		_checkConditionToken(condition,"!=","<>");
		_checkConditionToken(condition,"code","FINMATERIALS.CODE");
		_checkConditionToken(condition,"mat_id","FINMATERIALS.MAT_ID");
		_checkConditionToken(condition,"nn","FINMATERIALS.NN");
		_checkConditionToken(condition,"mat_name","FINMATERIALS.MAT_NAME");
		_checkConditionToken(condition,"mu_id","FINMATERIALS.MU_ID");
		_checkConditionToken(condition,"mu_name","FINMATERIALS.MU_NAME");
		_checkConditionToken(condition,"div_code","FINMATERIALS.DIV_CODE");
		_checkConditionToken(condition,"div_name","FINMATERIALS.DIV_NAME");
		_checkConditionToken(condition,"party_id","FINMATERIALS.PARTY_ID");
		_checkConditionToken(condition,"doc_num","FINMATERIALS.DOC_NUM");
		_checkConditionToken(condition,"partner","FINMATERIALS.PARTNER");
		_checkConditionToken(condition,"partner_name","FINMATERIALS.PARTNER_NAME");
		_checkConditionToken(condition,"doc_date","FINMATERIALS.DOC_DATE");
		_checkConditionToken(condition,"party_discription","FINMATERIALS.PARTY_DISCRIPTION");
		_checkConditionToken(condition,"rest_purpose_id","FINMATERIALS.REST_PURPOSE_ID");
		_checkConditionToken(condition,"rest_purpose_name","FINMATERIALS.REST_PURPOSE_NAME");
		_checkConditionToken(condition,"rest_purpose_type_id","FINMATERIALS.REST_PURPOSE_TYPE_ID");
		_checkConditionToken(condition,"budget_core_id","FINMATERIALS.BUDGET_CORE_ID");
		_checkConditionToken(condition,"frc_code","FINMATERIALS.FRC_CODE");
		_checkConditionToken(condition,"frc_name","FINMATERIALS.FRC_NAME");
		_checkConditionToken(condition,"calc_price","FINMATERIALS.CALC_PRICE");
		_checkConditionToken(condition,"quantity","FINMATERIALS.QUANTITY");
		_checkConditionToken(condition,"price","FINMATERIALS.PRICE");
		_checkConditionToken(condition,"cost","FINMATERIALS.COST");
		_checkConditionToken(condition,"bal_sch","FINMATERIALS.BAL_SCH");
		_checkConditionToken(condition,"fullquantity","FINMATERIALS.FULLQUANTITY");
		_checkConditionToken(condition,"fullcost","FINMATERIALS.FULLCOST");
		_checkConditionToken(condition,"findocitemcode","FINMATERIALS.FINDOCITEMCODE");
		_checkConditionToken(condition,"wear_date","FINMATERIALS.WEAR_DATE");
		_checkConditionToken(condition,"modify_time","FINMATERIALS.MODIFY_TIME");
		_checkConditionToken(condition,"usergen","FINMATERIALS.USERGEN");
		_checkConditionToken(condition,"dateedit","FINMATERIALS.DATEEDIT");
		_checkConditionToken(condition,"oldcode","FINMATERIALS.OLDCODE");
		_checkConditionToken(condition,"extra_cargo","FINMATERIALS.EXTRA_CARGO");
		_checkConditionToken(condition,"cost_ext","FINMATERIALS.COST_EXT");
		_checkConditionToken(condition,"extra_cargo_nds","FINMATERIALS.EXTRA_CARGO_NDS");
		_checkConditionToken(condition,"cost_ext_nds","FINMATERIALS.COST_EXT_NDS");
		_checkConditionToken(condition,"ax_party_id","FINMATERIALS.AX_PARTY_ID");
		_checkConditionToken(condition,"ax_rest_purpose_id","FINMATERIALS.AX_REST_PURPOSE_ID");
		_checkConditionToken(condition,"ax_rest_purpose_typeid","FINMATERIALS.AX_REST_PURPOSE_TYPEID");
		_checkConditionToken(condition,"ax_frc_code","FINMATERIALS.AX_FRC_CODE");
		_checkConditionToken(condition,"ax_inv_posted_qty_unit","FINMATERIALS.AX_INV_POSTED_QTY_UNIT");
		_checkConditionToken(condition,"ax_inv_deducted_unit","FINMATERIALS.AX_INV_DEDUCTED_UNIT");
		_checkConditionToken(condition,"ax_inv_received_unit","FINMATERIALS.AX_INV_RECEIVED_UNIT");
		_checkConditionToken(condition,"ax_inv_reserv_phys_unit","FINMATERIALS.AX_INV_RESERV_PHYS_UNT");
		_checkConditionToken(condition,"ax_inv_avail_phys_unit","FINMATERIALS.AX_INV_AVAIL_PHYS_UNIT");
		_checkConditionToken(condition,"ax_inv_physical_value","FINMATERIALS.AX_INV_PHYSICAL_VALUE");
		_checkConditionToken(condition,"ax_inv_posted_value","FINMATERIALS.AX_INV_POSTED_VALUE");
		_checkConditionToken(condition,"axinventtransferlinescode","FINMATERIALS.AXINVENTTRANSFERLINSCD");
		_checkConditionToken(condition,"axinventdimfinid","FINMATERIALS.AXINVENTDIMFINID");
		_checkConditionToken(condition,"axfactor","FINMATERIALS.AXFACTOR");
		// relationship conditions
		_checkConditionToken(condition,"estimateitemref","ESTIMATEITEMREFCODE");
		_checkConditionToken(condition,"estimateitemref.code","ESTIMATEITEMREFCODE");
		_checkConditionToken(condition,"statusref","STATUSREFCODE");
		_checkConditionToken(condition,"statusref.code","STATUSREFCODE");
		_checkConditionToken(condition,"moldataref","MOLDATAREFCODE");
		_checkConditionToken(condition,"moldataref.code","MOLDATAREFCODE");
		_checkConditionToken(condition,"parentref","PARENTREFCODE");
		_checkConditionToken(condition,"parentref.code","PARENTREFCODE");
		return condition.toString();
	}

	public Connection getConnection() {
		try {
			if(super.getConnection() != null && !super.getConnection().isClosed())
			return super.getConnection();

			InitialContext initialContext = new InitialContext();
			DataSource dataSource = (DataSource)initialContext.lookup(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			return dataSource.getConnection();
		}
		catch (NamingException e) {throw new SystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.ENERGYNET_DATASOURCE+"%}",e);}
		catch (SQLException e)    {throw new SystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.ENERGYNET_DATASOURCE+"%}",e);}
	}

	///////////// PRIVATE SECTION ///////////////
	protected static Hashtable<SequenceKey, SequenceValue> _sequenceTable = new Hashtable<SequenceKey, SequenceValue>();
	
	private void _collectAutoIncrementFields(FINMaterials anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("FINMATERIALS", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("FINMATERIALS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("FINMATERIALS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: FINMATERIALS");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of FINMaterialsDAO
