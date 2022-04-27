
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
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


import java.util.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Connection;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.valueobject.ENFuelSheetVolumesItem;
import com.ksoe.energynet.valueobject.filter.ENFuelSheetVolumesItemFilter;
import com.ksoe.energynet.valueobject.brief.ENFuelSheetVolumesItemShort;
import com.ksoe.energynet.valueobject.lists.ENFuelSheetVolumesItemShortList;


/**
 * DAO Object for ENFuelSheetVolumesItem;
 *
 */

public class ENFuelSheetVolumesItemDAOGen extends GenericDataMiner {

	public ENFuelSheetVolumesItemDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENFuelSheetVolumesItemDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENFuelSheetVolumesItem inObject) throws PersistenceException {
		ENFuelSheetVolumesItem obj = new ENFuelSheetVolumesItem();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.depname == null && obj.depname == null){}
		else
			if(inObject.depname == null || obj.depname == null) return false;
			else
				if ( ! inObject.depname.equals(obj.depname)){
					return false;
				}

		if(inObject.pmm_count_on_start == null && obj.pmm_count_on_start == null){}
		else
			if(inObject.pmm_count_on_start == null || obj.pmm_count_on_start == null) return false;
			else
				if ( ! inObject.pmm_count_on_start.equals(obj.pmm_count_on_start)){
					return false;
				}

		if(inObject.pmm_count_on_start_all == null && obj.pmm_count_on_start_all == null){}
		else
			if(inObject.pmm_count_on_start_all == null || obj.pmm_count_on_start_all == null) return false;
			else
				if ( ! inObject.pmm_count_on_start_all.equals(obj.pmm_count_on_start_all)){
					return false;
				}

		if(inObject.services_plan == null && obj.services_plan == null){}
		else
			if(inObject.services_plan == null || obj.services_plan == null) return false;
			else
				if ( ! inObject.services_plan.equals(obj.services_plan)){
					return false;
				}

		if(inObject.services_fact == null && obj.services_fact == null){}
		else
			if(inObject.services_fact == null || obj.services_fact == null) return false;
			else
				if ( ! inObject.services_fact.equals(obj.services_fact)){
					return false;
				}

		if(inObject.services_limit == null && obj.services_limit == null){}
		else
			if(inObject.services_limit == null || obj.services_limit == null) return false;
			else
				if ( ! inObject.services_limit.equals(obj.services_limit)){
					return false;
				}

		if(inObject.current_repair_plan == null && obj.current_repair_plan == null){}
		else
			if(inObject.current_repair_plan == null || obj.current_repair_plan == null) return false;
			else
				if ( ! inObject.current_repair_plan.equals(obj.current_repair_plan)){
					return false;
				}

		if(inObject.current_repair_fact == null && obj.current_repair_fact == null){}
		else
			if(inObject.current_repair_fact == null || obj.current_repair_fact == null) return false;
			else
				if ( ! inObject.current_repair_fact.equals(obj.current_repair_fact)){
					return false;
				}

		if(inObject.capital_repair_plan == null && obj.capital_repair_plan == null){}
		else
			if(inObject.capital_repair_plan == null || obj.capital_repair_plan == null) return false;
			else
				if ( ! inObject.capital_repair_plan.equals(obj.capital_repair_plan)){
					return false;
				}

		if(inObject.capital_repair_fact == null && obj.capital_repair_fact == null){}
		else
			if(inObject.capital_repair_fact == null || obj.capital_repair_fact == null) return false;
			else
				if ( ! inObject.capital_repair_fact.equals(obj.capital_repair_fact)){
					return false;
				}

		if(inObject.maintenance_plan == null && obj.maintenance_plan == null){}
		else
			if(inObject.maintenance_plan == null || obj.maintenance_plan == null) return false;
			else
				if ( ! inObject.maintenance_plan.equals(obj.maintenance_plan)){
					return false;
				}

		if(inObject.maintenance_fact == null && obj.maintenance_fact == null){}
		else
			if(inObject.maintenance_fact == null || obj.maintenance_fact == null) return false;
			else
				if ( ! inObject.maintenance_fact.equals(obj.maintenance_fact)){
					return false;
				}

		if(inObject.sbyt_plan == null && obj.sbyt_plan == null){}
		else
			if(inObject.sbyt_plan == null || obj.sbyt_plan == null) return false;
			else
				if ( ! inObject.sbyt_plan.equals(obj.sbyt_plan)){
					return false;
				}

		if(inObject.sbyt_fact == null && obj.sbyt_fact == null){}
		else
			if(inObject.sbyt_fact == null || obj.sbyt_fact == null) return false;
			else
				if ( ! inObject.sbyt_fact.equals(obj.sbyt_fact)){
					return false;
				}

		if(inObject.other_plan == null && obj.other_plan == null){}
		else
			if(inObject.other_plan == null || obj.other_plan == null) return false;
			else
				if ( ! inObject.other_plan.equals(obj.other_plan)){
					return false;
				}

		if(inObject.other_fact == null && obj.other_fact == null){}
		else
			if(inObject.other_fact == null || obj.other_fact == null) return false;
			else
				if ( ! inObject.other_fact.equals(obj.other_fact)){
					return false;
				}

		if(inObject.maintenance_sbyt_repairs_and_other_limit == null && obj.maintenance_sbyt_repairs_and_other_limit == null){}
		else
			if(inObject.maintenance_sbyt_repairs_and_other_limit == null || obj.maintenance_sbyt_repairs_and_other_limit == null) return false;
			else
				if ( ! inObject.maintenance_sbyt_repairs_and_other_limit.equals(obj.maintenance_sbyt_repairs_and_other_limit)){
					return false;
				}

		if(inObject.cap_build_ip_plan == null && obj.cap_build_ip_plan == null){}
		else
			if(inObject.cap_build_ip_plan == null || obj.cap_build_ip_plan == null) return false;
			else
				if ( ! inObject.cap_build_ip_plan.equals(obj.cap_build_ip_plan)){
					return false;
				}

		if(inObject.cap_build_ip_fact == null && obj.cap_build_ip_fact == null){}
		else
			if(inObject.cap_build_ip_fact == null || obj.cap_build_ip_fact == null) return false;
			else
				if ( ! inObject.cap_build_ip_fact.equals(obj.cap_build_ip_fact)){
					return false;
				}

		if(inObject.cap_builders_ip_limit == null && obj.cap_builders_ip_limit == null){}
		else
			if(inObject.cap_builders_ip_limit == null || obj.cap_builders_ip_limit == null) return false;
			else
				if ( ! inObject.cap_builders_ip_limit.equals(obj.cap_builders_ip_limit)){
					return false;
				}

		if(inObject.cap_build_other_plan == null && obj.cap_build_other_plan == null){}
		else
			if(inObject.cap_build_other_plan == null || obj.cap_build_other_plan == null) return false;
			else
				if ( ! inObject.cap_build_other_plan.equals(obj.cap_build_other_plan)){
					return false;
				}

		if(inObject.cap_build_other_fact == null && obj.cap_build_other_fact == null){}
		else
			if(inObject.cap_build_other_fact == null || obj.cap_build_other_fact == null) return false;
			else
				if ( ! inObject.cap_build_other_fact.equals(obj.cap_build_other_fact)){
					return false;
				}

		if(inObject.cap_builders_other_limit == null && obj.cap_builders_other_limit == null){}
		else
			if(inObject.cap_builders_other_limit == null || obj.cap_builders_other_limit == null) return false;
			else
				if ( ! inObject.cap_builders_other_limit.equals(obj.cap_builders_other_limit)){
					return false;
				}

		if(inObject.vrtu_plan == null && obj.vrtu_plan == null){}
		else
			if(inObject.vrtu_plan == null || obj.vrtu_plan == null) return false;
			else
				if ( ! inObject.vrtu_plan.equals(obj.vrtu_plan)){
					return false;
				}

		if(inObject.vrtu_fact == null && obj.vrtu_fact == null){}
		else
			if(inObject.vrtu_fact == null || obj.vrtu_fact == null) return false;
			else
				if ( ! inObject.vrtu_fact.equals(obj.vrtu_fact)){
					return false;
				}

		if(inObject.vrtu_limit == null && obj.vrtu_limit == null){}
		else
			if(inObject.vrtu_limit == null || obj.vrtu_limit == null) return false;
			else
				if ( ! inObject.vrtu_limit.equals(obj.vrtu_limit)){
					return false;
				}

		if(inObject.avr_plan == null && obj.avr_plan == null){}
		else
			if(inObject.avr_plan == null || obj.avr_plan == null) return false;
			else
				if ( ! inObject.avr_plan.equals(obj.avr_plan)){
					return false;
				}

		if(inObject.avr_fact == null && obj.avr_fact == null){}
		else
			if(inObject.avr_fact == null || obj.avr_fact == null) return false;
			else
				if ( ! inObject.avr_fact.equals(obj.avr_fact)){
					return false;
				}

		if(inObject.avr_limit == null && obj.avr_limit == null){}
		else
			if(inObject.avr_limit == null || obj.avr_limit == null) return false;
			else
				if ( ! inObject.avr_limit.equals(obj.avr_limit)){
					return false;
				}

		if(inObject.odg_plan == null && obj.odg_plan == null){}
		else
			if(inObject.odg_plan == null || obj.odg_plan == null) return false;
			else
				if ( ! inObject.odg_plan.equals(obj.odg_plan)){
					return false;
				}

		if(inObject.odg_fact == null && obj.odg_fact == null){}
		else
			if(inObject.odg_fact == null || obj.odg_fact == null) return false;
			else
				if ( ! inObject.odg_fact.equals(obj.odg_fact)){
					return false;
				}

		if(inObject.all_limit == null && obj.all_limit == null){}
		else
			if(inObject.all_limit == null || obj.all_limit == null) return false;
			else
				if ( ! inObject.all_limit.equals(obj.all_limit)){
					return false;
				}

		if(inObject.decode == null && obj.decode == null){}
		else
			if(inObject.decode == null || obj.decode == null) return false;
			else
				if ( ! inObject.decode.equals(obj.decode)){
					return false;
				}

		if(inObject.mol_codes == null && obj.mol_codes == null){}
		else
			if(inObject.mol_codes == null || obj.mol_codes == null) return false;
			else
				if ( ! inObject.mol_codes.equals(obj.mol_codes)){
					return false;
				}

		if(inObject.datestart == null && obj.datestart == null){} else 
			if(inObject.datestart == null || obj.datestart == null) return false;
			else
				if (inObject.datestart.compareTo(obj.datestart) != 0){
					return false;
				}

		if(inObject.datefinal == null && obj.datefinal == null){} else 
			if(inObject.datefinal == null || obj.datefinal == null) return false;
			else
				if (inObject.datefinal.compareTo(obj.datefinal) != 0){
					return false;
				}

		if (inObject.ord != obj.ord){
					return false;
				}

		if(inObject.all_plan == null && obj.all_plan == null){}
		else
			if(inObject.all_plan == null || obj.all_plan == null) return false;
			else
				if ( ! inObject.all_plan.equals(obj.all_plan)){
					return false;
				}

		if(inObject.rest_from_fk == null && obj.rest_from_fk == null){}
		else
			if(inObject.rest_from_fk == null || obj.rest_from_fk == null) return false;
			else
				if ( ! inObject.rest_from_fk.equals(obj.rest_from_fk)){
					return false;
				}

		if(inObject.rest_from_fk_avz == null && obj.rest_from_fk_avz == null){}
		else
			if(inObject.rest_from_fk_avz == null || obj.rest_from_fk_avz == null) return false;
			else
				if ( ! inObject.rest_from_fk_avz.equals(obj.rest_from_fk_avz)){
					return false;
				}

		if (inObject.eikindcode != obj.eikindcode){
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
		if (inObject.sheetVolumesRef.code != obj.sheetVolumesRef.code){
			return false;
		}
		return true;
	}

	public int add(ENFuelSheetVolumesItem anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENFuelSheetVolumesItem anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENFUELSHEETVOLUMESITEM (CODE,DEPNAME,PMM_COUNT_ON_START,PMM_COUNT_ON_START_ALL,SERVICES_PLAN,SERVICES_FACT,SERVICES_LIMIT,CURRENT_REPAIR_PLAN,CURRENT_REPAIR_FACT,CAPITAL_REPAIR_PLAN,CAPITAL_REPAIR_FACT,MAINTENANCE_PLAN,MAINTENANCE_FACT,SBYT_PLAN,SBYT_FACT,OTHER_PLAN,OTHER_FACT,MAINTENANCE_SBYT_REPAIRS_AND_OTHER_LIMIT,CAP_BUILD_IP_PLAN,CAP_BUILD_IP_FACT,CAP_BUILDERS_IP_LIMIT,CAP_BUILD_OTHER_PLAN,CAP_BUILD_OTHER_FACT,CAP_BUILDERS_OTHER_LIMIT,VRTU_PLAN,VRTU_FACT,VRTU_LIMIT,AVR_PLAN,AVR_FACT,AVR_LIMIT,ODG_PLAN,ODG_FACT,ALL_LIMIT,DECODE,MOL_CODES,DATESTART,DATEFINAL,ORD,ALL_PLAN,REST_FROM_FK,REST_FROM_FK_AVZ,EIKINDCODE,USERGEN,DATEEDIT,MODIFY_TIME,SHEETVOLUMESREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.depname);
			if (anObject.pmm_count_on_start != null) {
				anObject.pmm_count_on_start = anObject.pmm_count_on_start.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(3, anObject.pmm_count_on_start);
			if (anObject.pmm_count_on_start_all != null) {
				anObject.pmm_count_on_start_all = anObject.pmm_count_on_start_all.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(4, anObject.pmm_count_on_start_all);
			if (anObject.services_plan != null) {
				anObject.services_plan = anObject.services_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(5, anObject.services_plan);
			if (anObject.services_fact != null) {
				anObject.services_fact = anObject.services_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(6, anObject.services_fact);
			if (anObject.services_limit != null) {
				anObject.services_limit = anObject.services_limit.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(7, anObject.services_limit);
			if (anObject.current_repair_plan != null) {
				anObject.current_repair_plan = anObject.current_repair_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(8, anObject.current_repair_plan);
			if (anObject.current_repair_fact != null) {
				anObject.current_repair_fact = anObject.current_repair_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(9, anObject.current_repair_fact);
			if (anObject.capital_repair_plan != null) {
				anObject.capital_repair_plan = anObject.capital_repair_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(10, anObject.capital_repair_plan);
			if (anObject.capital_repair_fact != null) {
				anObject.capital_repair_fact = anObject.capital_repair_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(11, anObject.capital_repair_fact);
			if (anObject.maintenance_plan != null) {
				anObject.maintenance_plan = anObject.maintenance_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(12, anObject.maintenance_plan);
			if (anObject.maintenance_fact != null) {
				anObject.maintenance_fact = anObject.maintenance_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(13, anObject.maintenance_fact);
			if (anObject.sbyt_plan != null) {
				anObject.sbyt_plan = anObject.sbyt_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(14, anObject.sbyt_plan);
			if (anObject.sbyt_fact != null) {
				anObject.sbyt_fact = anObject.sbyt_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(15, anObject.sbyt_fact);
			if (anObject.other_plan != null) {
				anObject.other_plan = anObject.other_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(16, anObject.other_plan);
			if (anObject.other_fact != null) {
				anObject.other_fact = anObject.other_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(17, anObject.other_fact);
			if (anObject.maintenance_sbyt_repairs_and_other_limit != null) {
				anObject.maintenance_sbyt_repairs_and_other_limit = anObject.maintenance_sbyt_repairs_and_other_limit.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(18, anObject.maintenance_sbyt_repairs_and_other_limit);
			if (anObject.cap_build_ip_plan != null) {
				anObject.cap_build_ip_plan = anObject.cap_build_ip_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(19, anObject.cap_build_ip_plan);
			if (anObject.cap_build_ip_fact != null) {
				anObject.cap_build_ip_fact = anObject.cap_build_ip_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(20, anObject.cap_build_ip_fact);
			if (anObject.cap_builders_ip_limit != null) {
				anObject.cap_builders_ip_limit = anObject.cap_builders_ip_limit.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(21, anObject.cap_builders_ip_limit);
			if (anObject.cap_build_other_plan != null) {
				anObject.cap_build_other_plan = anObject.cap_build_other_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(22, anObject.cap_build_other_plan);
			if (anObject.cap_build_other_fact != null) {
				anObject.cap_build_other_fact = anObject.cap_build_other_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(23, anObject.cap_build_other_fact);
			if (anObject.cap_builders_other_limit != null) {
				anObject.cap_builders_other_limit = anObject.cap_builders_other_limit.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(24, anObject.cap_builders_other_limit);
			if (anObject.vrtu_plan != null) {
				anObject.vrtu_plan = anObject.vrtu_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(25, anObject.vrtu_plan);
			if (anObject.vrtu_fact != null) {
				anObject.vrtu_fact = anObject.vrtu_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(26, anObject.vrtu_fact);
			if (anObject.vrtu_limit != null) {
				anObject.vrtu_limit = anObject.vrtu_limit.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(27, anObject.vrtu_limit);
			if (anObject.avr_plan != null) {
				anObject.avr_plan = anObject.avr_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(28, anObject.avr_plan);
			if (anObject.avr_fact != null) {
				anObject.avr_fact = anObject.avr_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(29, anObject.avr_fact);
			if (anObject.avr_limit != null) {
				anObject.avr_limit = anObject.avr_limit.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(30, anObject.avr_limit);
			if (anObject.odg_plan != null) {
				anObject.odg_plan = anObject.odg_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(31, anObject.odg_plan);
			if (anObject.odg_fact != null) {
				anObject.odg_fact = anObject.odg_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(32, anObject.odg_fact);
			if (anObject.all_limit != null) {
				anObject.all_limit = anObject.all_limit.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(33, anObject.all_limit);
			statement.setString(34, anObject.decode);
			statement.setString(35, anObject.mol_codes);
			if (anObject.datestart == null) {
				statement.setDate(36, null);
			} else {
				statement.setDate(36, new java.sql.Date(anObject.datestart.getTime()));
			}
			if (anObject.datefinal == null) {
				statement.setDate(37, null);
			} else {
				statement.setDate(37, new java.sql.Date(anObject.datefinal.getTime()));
			}
			if (anObject.ord != Integer.MIN_VALUE ) {
				statement.setInt(38, anObject.ord);
			} else {
				statement.setNull(38, java.sql.Types.INTEGER);
			}
			if (anObject.all_plan != null) {
				anObject.all_plan = anObject.all_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(39, anObject.all_plan);
			if (anObject.rest_from_fk != null) {
				anObject.rest_from_fk = anObject.rest_from_fk.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(40, anObject.rest_from_fk);
			if (anObject.rest_from_fk_avz != null) {
				anObject.rest_from_fk_avz = anObject.rest_from_fk_avz.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(41, anObject.rest_from_fk_avz);
			if (anObject.eikindcode != Integer.MIN_VALUE ) {
				statement.setInt(42, anObject.eikindcode);
			} else {
				statement.setNull(42, java.sql.Types.INTEGER);
			}
			statement.setString(43, anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(44, null);
			} else {
				statement.setTimestamp(44, new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(45, null);
			} else {
				statement.setBigDecimal(45, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.sheetVolumesRef.code != Integer.MIN_VALUE){
				statement.setInt(46,anObject.sheetVolumesRef.code);
			} else {
				statement.setNull(46,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENFuelSheetVolumesItemDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENFuelSheetVolumesItem anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENFuelSheetVolumesItem anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENFuelSheetVolumesItem oldObject = new ENFuelSheetVolumesItem();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENFuelSheetVolumesItem.modify_time_Field+" FROM  ENFUELSHEETVOLUMESITEM WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("DEPNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PMM_COUNT_ON_START") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PMM_COUNT_ON_START_ALL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SERVICES_PLAN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SERVICES_FACT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SERVICES_LIMIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CURRENT_REPAIR_PLAN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CURRENT_REPAIR_FACT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CAPITAL_REPAIR_PLAN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CAPITAL_REPAIR_FACT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MAINTENANCE_PLAN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MAINTENANCE_FACT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SBYT_PLAN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SBYT_FACT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("OTHER_PLAN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("OTHER_FACT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MAINTENANCE_SBYT_REPAIRS_AND_OTHER_LIMIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CAP_BUILD_IP_PLAN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CAP_BUILD_IP_FACT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CAP_BUILDERS_IP_LIMIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CAP_BUILD_OTHER_PLAN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CAP_BUILD_OTHER_FACT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CAP_BUILDERS_OTHER_LIMIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("VRTU_PLAN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("VRTU_FACT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("VRTU_LIMIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AVR_PLAN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AVR_FACT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AVR_LIMIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ODG_PLAN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ODG_FACT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ALL_LIMIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DECODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MOL_CODES") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATESTART") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEFINAL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ORD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ALL_PLAN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("REST_FROM_FK") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("REST_FROM_FK_AVZ") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("EIKINDCODE") == 0) {
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
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SHEETVOLUMESREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENFUELSHEETVOLUMESITEM SET  DEPNAME = ? , PMM_COUNT_ON_START = ? , PMM_COUNT_ON_START_ALL = ? , SERVICES_PLAN = ? , SERVICES_FACT = ? , SERVICES_LIMIT = ? , CURRENT_REPAIR_PLAN = ? , CURRENT_REPAIR_FACT = ? , CAPITAL_REPAIR_PLAN = ? , CAPITAL_REPAIR_FACT = ? , MAINTENANCE_PLAN = ? , MAINTENANCE_FACT = ? , SBYT_PLAN = ? , SBYT_FACT = ? , OTHER_PLAN = ? , OTHER_FACT = ? , MAINTENANCE_SBYT_REPAIRS_AND_OTHER_LIMIT = ? , CAP_BUILD_IP_PLAN = ? , CAP_BUILD_IP_FACT = ? , CAP_BUILDERS_IP_LIMIT = ? , CAP_BUILD_OTHER_PLAN = ? , CAP_BUILD_OTHER_FACT = ? , CAP_BUILDERS_OTHER_LIMIT = ? , VRTU_PLAN = ? , VRTU_FACT = ? , VRTU_LIMIT = ? , AVR_PLAN = ? , AVR_FACT = ? , AVR_LIMIT = ? , ODG_PLAN = ? , ODG_FACT = ? , ALL_LIMIT = ? , DECODE = ? , MOL_CODES = ? , DATESTART = ? , DATEFINAL = ? , ORD = ? , ALL_PLAN = ? , REST_FROM_FK = ? , REST_FROM_FK_AVZ = ? , EIKINDCODE = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , SHEETVOLUMESREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENFUELSHEETVOLUMESITEM SET ";
				for(int fldIndex = 0;fldIndex < fields.size();fldIndex++) {
					if(fldIndex > 0) {
						selectStr+=", ";
					}
					selectStr+=(String)fields.get(fldIndex);
					selectStr+=" = ?";
				}
				selectStr += " WHERE CODE = ?";
			}

			statement = null;
			try {
				statement = connection.prepareStatement(selectStr);
				if(fields == null) {
					statement.setString(1, anObject.depname);
					if (anObject.pmm_count_on_start != null) {
						anObject.pmm_count_on_start = anObject.pmm_count_on_start.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(2, anObject.pmm_count_on_start);
					if (anObject.pmm_count_on_start_all != null) {
						anObject.pmm_count_on_start_all = anObject.pmm_count_on_start_all.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(3, anObject.pmm_count_on_start_all);
					if (anObject.services_plan != null) {
						anObject.services_plan = anObject.services_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(4, anObject.services_plan);
					if (anObject.services_fact != null) {
						anObject.services_fact = anObject.services_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(5, anObject.services_fact);
					if (anObject.services_limit != null) {
						anObject.services_limit = anObject.services_limit.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(6, anObject.services_limit);
					if (anObject.current_repair_plan != null) {
						anObject.current_repair_plan = anObject.current_repair_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(7, anObject.current_repair_plan);
					if (anObject.current_repair_fact != null) {
						anObject.current_repair_fact = anObject.current_repair_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(8, anObject.current_repair_fact);
					if (anObject.capital_repair_plan != null) {
						anObject.capital_repair_plan = anObject.capital_repair_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(9, anObject.capital_repair_plan);
					if (anObject.capital_repair_fact != null) {
						anObject.capital_repair_fact = anObject.capital_repair_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(10, anObject.capital_repair_fact);
					if (anObject.maintenance_plan != null) {
						anObject.maintenance_plan = anObject.maintenance_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(11, anObject.maintenance_plan);
					if (anObject.maintenance_fact != null) {
						anObject.maintenance_fact = anObject.maintenance_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(12, anObject.maintenance_fact);
					if (anObject.sbyt_plan != null) {
						anObject.sbyt_plan = anObject.sbyt_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(13, anObject.sbyt_plan);
					if (anObject.sbyt_fact != null) {
						anObject.sbyt_fact = anObject.sbyt_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(14, anObject.sbyt_fact);
					if (anObject.other_plan != null) {
						anObject.other_plan = anObject.other_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(15, anObject.other_plan);
					if (anObject.other_fact != null) {
						anObject.other_fact = anObject.other_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(16, anObject.other_fact);
					if (anObject.maintenance_sbyt_repairs_and_other_limit != null) {
						anObject.maintenance_sbyt_repairs_and_other_limit = anObject.maintenance_sbyt_repairs_and_other_limit.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(17, anObject.maintenance_sbyt_repairs_and_other_limit);
					if (anObject.cap_build_ip_plan != null) {
						anObject.cap_build_ip_plan = anObject.cap_build_ip_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(18, anObject.cap_build_ip_plan);
					if (anObject.cap_build_ip_fact != null) {
						anObject.cap_build_ip_fact = anObject.cap_build_ip_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(19, anObject.cap_build_ip_fact);
					if (anObject.cap_builders_ip_limit != null) {
						anObject.cap_builders_ip_limit = anObject.cap_builders_ip_limit.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(20, anObject.cap_builders_ip_limit);
					if (anObject.cap_build_other_plan != null) {
						anObject.cap_build_other_plan = anObject.cap_build_other_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(21, anObject.cap_build_other_plan);
					if (anObject.cap_build_other_fact != null) {
						anObject.cap_build_other_fact = anObject.cap_build_other_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(22, anObject.cap_build_other_fact);
					if (anObject.cap_builders_other_limit != null) {
						anObject.cap_builders_other_limit = anObject.cap_builders_other_limit.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(23, anObject.cap_builders_other_limit);
					if (anObject.vrtu_plan != null) {
						anObject.vrtu_plan = anObject.vrtu_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(24, anObject.vrtu_plan);
					if (anObject.vrtu_fact != null) {
						anObject.vrtu_fact = anObject.vrtu_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(25, anObject.vrtu_fact);
					if (anObject.vrtu_limit != null) {
						anObject.vrtu_limit = anObject.vrtu_limit.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(26, anObject.vrtu_limit);
					if (anObject.avr_plan != null) {
						anObject.avr_plan = anObject.avr_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(27, anObject.avr_plan);
					if (anObject.avr_fact != null) {
						anObject.avr_fact = anObject.avr_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(28, anObject.avr_fact);
					if (anObject.avr_limit != null) {
						anObject.avr_limit = anObject.avr_limit.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(29, anObject.avr_limit);
					if (anObject.odg_plan != null) {
						anObject.odg_plan = anObject.odg_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(30, anObject.odg_plan);
					if (anObject.odg_fact != null) {
						anObject.odg_fact = anObject.odg_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(31, anObject.odg_fact);
					if (anObject.all_limit != null) {
						anObject.all_limit = anObject.all_limit.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(32, anObject.all_limit);
					statement.setString(33, anObject.decode);
					statement.setString(34, anObject.mol_codes);
					if (anObject.datestart == null) {
						statement.setDate(35, null);
					} else {
						statement.setDate(35, new java.sql.Date(anObject.datestart.getTime()));
					}
					if (anObject.datefinal == null) {
						statement.setDate(36, null);
					} else {
						statement.setDate(36, new java.sql.Date(anObject.datefinal.getTime()));
					}
					if (anObject.ord != Integer.MIN_VALUE) {
						statement.setInt(37, anObject.ord);
					} else {
						statement.setNull(37, java.sql.Types.INTEGER);
					}
					if (anObject.all_plan != null) {
						anObject.all_plan = anObject.all_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(38, anObject.all_plan);
					if (anObject.rest_from_fk != null) {
						anObject.rest_from_fk = anObject.rest_from_fk.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(39, anObject.rest_from_fk);
					if (anObject.rest_from_fk_avz != null) {
						anObject.rest_from_fk_avz = anObject.rest_from_fk_avz.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(40, anObject.rest_from_fk_avz);
					if (anObject.eikindcode != Integer.MIN_VALUE) {
						statement.setInt(41, anObject.eikindcode);
					} else {
						statement.setNull(41, java.sql.Types.INTEGER);
					}
					statement.setString(42, anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(43, null);
					} else {
						statement.setTimestamp(43, new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(44, null);
					} else {
						statement.setBigDecimal(44, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.sheetVolumesRef.code != Integer.MIN_VALUE) {
						statement.setInt(45, anObject.sheetVolumesRef.code);
					} else {
						statement.setNull(45, java.sql.Types.INTEGER);
					}
					statement.setInt(46, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("DEPNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.depname);
							continue;
						}
						if("PMM_COUNT_ON_START".compareTo((String)fields.get(i)) == 0) {
							if (anObject.pmm_count_on_start != null) {
								anObject.pmm_count_on_start = anObject.pmm_count_on_start.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.pmm_count_on_start);
							continue;
						}
						if("PMM_COUNT_ON_START_ALL".compareTo((String)fields.get(i)) == 0) {
							if (anObject.pmm_count_on_start_all != null) {
								anObject.pmm_count_on_start_all = anObject.pmm_count_on_start_all.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.pmm_count_on_start_all);
							continue;
						}
						if("SERVICES_PLAN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.services_plan != null) {
								anObject.services_plan = anObject.services_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.services_plan);
							continue;
						}
						if("SERVICES_FACT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.services_fact != null) {
								anObject.services_fact = anObject.services_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.services_fact);
							continue;
						}
						if("SERVICES_LIMIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.services_limit != null) {
								anObject.services_limit = anObject.services_limit.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.services_limit);
							continue;
						}
						if("CURRENT_REPAIR_PLAN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.current_repair_plan != null) {
								anObject.current_repair_plan = anObject.current_repair_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.current_repair_plan);
							continue;
						}
						if("CURRENT_REPAIR_FACT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.current_repair_fact != null) {
								anObject.current_repair_fact = anObject.current_repair_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.current_repair_fact);
							continue;
						}
						if("CAPITAL_REPAIR_PLAN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.capital_repair_plan != null) {
								anObject.capital_repair_plan = anObject.capital_repair_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.capital_repair_plan);
							continue;
						}
						if("CAPITAL_REPAIR_FACT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.capital_repair_fact != null) {
								anObject.capital_repair_fact = anObject.capital_repair_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.capital_repair_fact);
							continue;
						}
						if("MAINTENANCE_PLAN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.maintenance_plan != null) {
								anObject.maintenance_plan = anObject.maintenance_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.maintenance_plan);
							continue;
						}
						if("MAINTENANCE_FACT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.maintenance_fact != null) {
								anObject.maintenance_fact = anObject.maintenance_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.maintenance_fact);
							continue;
						}
						if("SBYT_PLAN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sbyt_plan != null) {
								anObject.sbyt_plan = anObject.sbyt_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.sbyt_plan);
							continue;
						}
						if("SBYT_FACT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sbyt_fact != null) {
								anObject.sbyt_fact = anObject.sbyt_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.sbyt_fact);
							continue;
						}
						if("OTHER_PLAN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.other_plan != null) {
								anObject.other_plan = anObject.other_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.other_plan);
							continue;
						}
						if("OTHER_FACT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.other_fact != null) {
								anObject.other_fact = anObject.other_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.other_fact);
							continue;
						}
						if("MAINTENANCE_SBYT_REPAIRS_AND_OTHER_LIMIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.maintenance_sbyt_repairs_and_other_limit != null) {
								anObject.maintenance_sbyt_repairs_and_other_limit = anObject.maintenance_sbyt_repairs_and_other_limit.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.maintenance_sbyt_repairs_and_other_limit);
							continue;
						}
						if("CAP_BUILD_IP_PLAN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.cap_build_ip_plan != null) {
								anObject.cap_build_ip_plan = anObject.cap_build_ip_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.cap_build_ip_plan);
							continue;
						}
						if("CAP_BUILD_IP_FACT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.cap_build_ip_fact != null) {
								anObject.cap_build_ip_fact = anObject.cap_build_ip_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.cap_build_ip_fact);
							continue;
						}
						if("CAP_BUILDERS_IP_LIMIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.cap_builders_ip_limit != null) {
								anObject.cap_builders_ip_limit = anObject.cap_builders_ip_limit.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.cap_builders_ip_limit);
							continue;
						}
						if("CAP_BUILD_OTHER_PLAN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.cap_build_other_plan != null) {
								anObject.cap_build_other_plan = anObject.cap_build_other_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.cap_build_other_plan);
							continue;
						}
						if("CAP_BUILD_OTHER_FACT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.cap_build_other_fact != null) {
								anObject.cap_build_other_fact = anObject.cap_build_other_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.cap_build_other_fact);
							continue;
						}
						if("CAP_BUILDERS_OTHER_LIMIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.cap_builders_other_limit != null) {
								anObject.cap_builders_other_limit = anObject.cap_builders_other_limit.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.cap_builders_other_limit);
							continue;
						}
						if("VRTU_PLAN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.vrtu_plan != null) {
								anObject.vrtu_plan = anObject.vrtu_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.vrtu_plan);
							continue;
						}
						if("VRTU_FACT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.vrtu_fact != null) {
								anObject.vrtu_fact = anObject.vrtu_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.vrtu_fact);
							continue;
						}
						if("VRTU_LIMIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.vrtu_limit != null) {
								anObject.vrtu_limit = anObject.vrtu_limit.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.vrtu_limit);
							continue;
						}
						if("AVR_PLAN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.avr_plan != null) {
								anObject.avr_plan = anObject.avr_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.avr_plan);
							continue;
						}
						if("AVR_FACT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.avr_fact != null) {
								anObject.avr_fact = anObject.avr_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.avr_fact);
							continue;
						}
						if("AVR_LIMIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.avr_limit != null) {
								anObject.avr_limit = anObject.avr_limit.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.avr_limit);
							continue;
						}
						if("ODG_PLAN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.odg_plan != null) {
								anObject.odg_plan = anObject.odg_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.odg_plan);
							continue;
						}
						if("ODG_FACT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.odg_fact != null) {
								anObject.odg_fact = anObject.odg_fact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.odg_fact);
							continue;
						}
						if("ALL_LIMIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.all_limit != null) {
								anObject.all_limit = anObject.all_limit.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.all_limit);
							continue;
						}
						if("DECODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.decode);
							continue;
						}
						if("MOL_CODES".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.mol_codes);
							continue;
						}
						if("DATESTART".compareTo((String)fields.get(i)) == 0) {
							if (anObject.datestart == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.datestart.getTime()));
							}
							continue;
						}
						if("DATEFINAL".compareTo((String)fields.get(i)) == 0) {
							if (anObject.datefinal == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.datefinal.getTime()));
							}
							continue;
						}
						if("ORD".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.ord);
							continue;
						}
						if("ALL_PLAN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.all_plan != null) {
								anObject.all_plan = anObject.all_plan.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.all_plan);
							continue;
						}
						if("REST_FROM_FK".compareTo((String)fields.get(i)) == 0) {
							if (anObject.rest_from_fk != null) {
								anObject.rest_from_fk = anObject.rest_from_fk.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.rest_from_fk);
							continue;
						}
						if("REST_FROM_FK_AVZ".compareTo((String)fields.get(i)) == 0) {
							if (anObject.rest_from_fk_avz != null) {
								anObject.rest_from_fk_avz = anObject.rest_from_fk_avz.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.rest_from_fk_avz);
							continue;
						}
						if("EIKINDCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.eikindcode);
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.userGen);
							continue;
						}
						if("DATEEDIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateEdit == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1, new java.sql.Timestamp(anObject.dateEdit.getTime()));
							}
							continue;
						}
						if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0) {
							if (anObject.modify_time == Long.MIN_VALUE) {
								statement.setBigDecimal(i+1, null);
							} else {
								statement.setBigDecimal(i+1, new java.math.BigDecimal(anObject.modify_time));
							}
							continue;
						}
						if("SHEETVOLUMESREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sheetVolumesRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.sheetVolumesRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
					}
					statement.setInt(fields.size()+1, anObject.code);
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

	} // end of save(ENFuelSheetVolumesItem anObject,String[] anAttributes)


	public ENFuelSheetVolumesItemShort getShortObject(int anObjectCode) throws PersistenceException {
		ENFuelSheetVolumesItem filterObject = new ENFuelSheetVolumesItem();
		Vector<ENFuelSheetVolumesItemShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENFuelSheetVolumesItemShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENFuelSheetVolumesItem filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.depname, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.pmm_count_on_start, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.pmm_count_on_start_all, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.services_plan, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.services_fact, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.services_limit, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.current_repair_plan, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.current_repair_fact, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.capital_repair_plan, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.capital_repair_fact, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.maintenance_plan, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.maintenance_fact, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.sbyt_plan, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.sbyt_fact, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.other_plan, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.other_fact, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.maintenance_sbyt_repairs_and_other_limit, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.cap_build_ip_plan, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.cap_build_ip_fact, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.cap_builders_ip_limit, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.cap_build_other_plan, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.cap_build_other_fact, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.cap_builders_other_limit, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.vrtu_plan, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.vrtu_fact, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.vrtu_limit, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.avr_plan, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.avr_fact, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.avr_limit, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.odg_plan, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.odg_fact, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.all_limit, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.decode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.mol_codes, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.datestart, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.datefinal, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.ord, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.all_plan, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.rest_from_fk, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.rest_from_fk_avz, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.eikindcode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.sheetVolumesRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENFuelSheetVolumesItemFilter filter) {
		String out = buildCondition((ENFuelSheetVolumesItem)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENFuelSheetVolumesItem filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENFuelSheetVolumesItem.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.depname, ENFuelSheetVolumesItem.depname_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.pmm_count_on_start, ENFuelSheetVolumesItem.pmm_count_on_start_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.pmm_count_on_start_all, ENFuelSheetVolumesItem.pmm_count_on_start_all_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.services_plan, ENFuelSheetVolumesItem.services_plan_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.services_fact, ENFuelSheetVolumesItem.services_fact_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.services_limit, ENFuelSheetVolumesItem.services_limit_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.current_repair_plan, ENFuelSheetVolumesItem.current_repair_plan_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.current_repair_fact, ENFuelSheetVolumesItem.current_repair_fact_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.capital_repair_plan, ENFuelSheetVolumesItem.capital_repair_plan_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.capital_repair_fact, ENFuelSheetVolumesItem.capital_repair_fact_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.maintenance_plan, ENFuelSheetVolumesItem.maintenance_plan_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.maintenance_fact, ENFuelSheetVolumesItem.maintenance_fact_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.sbyt_plan, ENFuelSheetVolumesItem.sbyt_plan_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.sbyt_fact, ENFuelSheetVolumesItem.sbyt_fact_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.other_plan, ENFuelSheetVolumesItem.other_plan_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.other_fact, ENFuelSheetVolumesItem.other_fact_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.maintenance_sbyt_repairs_and_other_limit, ENFuelSheetVolumesItem.maintenance_sbyt_repairs_and_other_limit_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.cap_build_ip_plan, ENFuelSheetVolumesItem.cap_build_ip_plan_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.cap_build_ip_fact, ENFuelSheetVolumesItem.cap_build_ip_fact_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.cap_builders_ip_limit, ENFuelSheetVolumesItem.cap_builders_ip_limit_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.cap_build_other_plan, ENFuelSheetVolumesItem.cap_build_other_plan_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.cap_build_other_fact, ENFuelSheetVolumesItem.cap_build_other_fact_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.cap_builders_other_limit, ENFuelSheetVolumesItem.cap_builders_other_limit_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.vrtu_plan, ENFuelSheetVolumesItem.vrtu_plan_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.vrtu_fact, ENFuelSheetVolumesItem.vrtu_fact_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.vrtu_limit, ENFuelSheetVolumesItem.vrtu_limit_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.avr_plan, ENFuelSheetVolumesItem.avr_plan_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.avr_fact, ENFuelSheetVolumesItem.avr_fact_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.avr_limit, ENFuelSheetVolumesItem.avr_limit_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.odg_plan, ENFuelSheetVolumesItem.odg_plan_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.odg_fact, ENFuelSheetVolumesItem.odg_fact_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.all_limit, ENFuelSheetVolumesItem.all_limit_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.decode, ENFuelSheetVolumesItem.decode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.mol_codes, ENFuelSheetVolumesItem.mol_codes_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.datestart, ENFuelSheetVolumesItem.datestart_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.datefinal, ENFuelSheetVolumesItem.datefinal_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.ord, ENFuelSheetVolumesItem.ord_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.all_plan, ENFuelSheetVolumesItem.all_plan_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.rest_from_fk, ENFuelSheetVolumesItem.rest_from_fk_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.rest_from_fk_avz, ENFuelSheetVolumesItem.rest_from_fk_avz_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.eikindcode, ENFuelSheetVolumesItem.eikindcode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENFuelSheetVolumesItem.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENFuelSheetVolumesItem.dateEdit_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENFuelSheetVolumesItem.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.sheetVolumesRef.code, ENFuelSheetVolumesItem.sheetVolumesRef_QFielld, out);
		}
		return out;
	}

	public ENFuelSheetVolumesItemShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENFuelSheetVolumesItemShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENFuelSheetVolumesItemShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENFuelSheetVolumesItemShortList getFilteredList(ENFuelSheetVolumesItem filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENFuelSheetVolumesItemShortList getScrollableFilteredList(ENFuelSheetVolumesItem aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENFuelSheetVolumesItemShortList getScrollableFilteredList(ENFuelSheetVolumesItem aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENFuelSheetVolumesItemShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENFuelSheetVolumesItemShortList getScrollableFilteredList(ENFuelSheetVolumesItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENFuelSheetVolumesItemShortList getScrollableFilteredList(ENFuelSheetVolumesItemFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENFuelSheetVolumesItemShortList getScrollableFilteredList(ENFuelSheetVolumesItem aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENFuelSheetVolumesItemShortList result = new ENFuelSheetVolumesItemShortList();
		ENFuelSheetVolumesItemShort anObject;
		result.list = new Vector<ENFuelSheetVolumesItemShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENFUELSHEETVOLUMESITEM.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENFUELSHEETVOLUMESITEM.CODE"+
			",ENFUELSHEETVOLUMESITEM.DEPNAME"+
			",ENFUELSHEETVOLUMESITEM.PMM_COUNT_ON_START"+
			",ENFUELSHEETVOLUMESITEM.PMM_COUNT_ON_START_ALL"+
			",ENFUELSHEETVOLUMESITEM.SERVICES_PLAN"+
			",ENFUELSHEETVOLUMESITEM.SERVICES_FACT"+
			",ENFUELSHEETVOLUMESITEM.SERVICES_LIMIT"+
			",ENFUELSHEETVOLUMESITEM.CURRENT_REPAIR_PLAN"+
			",ENFUELSHEETVOLUMESITEM.CURRENT_REPAIR_FACT"+
			",ENFUELSHEETVOLUMESITEM.CAPITAL_REPAIR_PLAN"+
			",ENFUELSHEETVOLUMESITEM.CAPITAL_REPAIR_FACT"+
			",ENFUELSHEETVOLUMESITEM.MAINTENANCE_PLAN"+
			",ENFUELSHEETVOLUMESITEM.MAINTENANCE_FACT"+
			",ENFUELSHEETVOLUMESITEM.SBYT_PLAN"+
			",ENFUELSHEETVOLUMESITEM.SBYT_FACT"+
			",ENFUELSHEETVOLUMESITEM.OTHER_PLAN"+
			",ENFUELSHEETVOLUMESITEM.OTHER_FACT"+
			",ENFUELSHEETVOLUMESITEM.MAINTENANCE_SBYT_REPAIRS_AND_OTHER_LIMIT"+
			",ENFUELSHEETVOLUMESITEM.CAP_BUILD_IP_PLAN"+
			",ENFUELSHEETVOLUMESITEM.CAP_BUILD_IP_FACT"+
			",ENFUELSHEETVOLUMESITEM.CAP_BUILDERS_IP_LIMIT"+
			",ENFUELSHEETVOLUMESITEM.CAP_BUILD_OTHER_PLAN"+
			",ENFUELSHEETVOLUMESITEM.CAP_BUILD_OTHER_FACT"+
			",ENFUELSHEETVOLUMESITEM.CAP_BUILDERS_OTHER_LIMIT"+
			",ENFUELSHEETVOLUMESITEM.VRTU_PLAN"+
			",ENFUELSHEETVOLUMESITEM.VRTU_FACT"+
			",ENFUELSHEETVOLUMESITEM.VRTU_LIMIT"+
			",ENFUELSHEETVOLUMESITEM.AVR_PLAN"+
			",ENFUELSHEETVOLUMESITEM.AVR_FACT"+
			",ENFUELSHEETVOLUMESITEM.AVR_LIMIT"+
			",ENFUELSHEETVOLUMESITEM.ODG_PLAN"+
			",ENFUELSHEETVOLUMESITEM.ODG_FACT"+
			",ENFUELSHEETVOLUMESITEM.ALL_LIMIT"+
			",ENFUELSHEETVOLUMESITEM.DECODE"+
			",ENFUELSHEETVOLUMESITEM.MOL_CODES"+
			",ENFUELSHEETVOLUMESITEM.DATESTART"+
			",ENFUELSHEETVOLUMESITEM.DATEFINAL"+
			",ENFUELSHEETVOLUMESITEM.ALL_PLAN"+
			",ENFUELSHEETVOLUMESITEM.REST_FROM_FK"+
			",ENFUELSHEETVOLUMESITEM.REST_FROM_FK_AVZ"+
			",ENFUELSHEETVOLUMESITEM.EIKINDCODE"+
			",ENFUELSHEETVOLUMESITEM.USERGEN"+
			",ENFUELSHEETVOLUMESITEM.DATEEDIT"+
			", ENFUELSHEETVOLUMES.CODE " +
			", ENFUELSHEETVOLUMES.NAME " +
			", ENFUELSHEETVOLUMES.DATEGEN " +
			", ENFUELSHEETVOLUMES.STARTDATE " +
			", ENFUELSHEETVOLUMES.ENDDATE " +
			", ENFUELSHEETVOLUMES.FUELTYPE " +
			", ENFUELSHEETVOLUMES.USERADD " +
			", ENFUELSHEETVOLUMES.DATEADD " +
			", ENFUELSHEETVOLUMES.USERGEN " +
			", ENFUELSHEETVOLUMES.DATEEDIT " +
		" FROM ENFUELSHEETVOLUMESITEM " +
			" LEFT JOIN ENFUELSHEETVOLUMES on ENFUELSHEETVOLUMES.CODE = ENFUELSHEETVOLUMESITEM.SHEETVOLUMESREFCODE "+
		"";

	
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		whereStr = BaseDAOUtils.addToCondition(condition, whereStr, true);
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
				anObject = new ENFuelSheetVolumesItemShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.depname = set.getString(2);
				anObject.pmm_count_on_start = set.getBigDecimal(3);
				if(anObject.pmm_count_on_start != null) {
					anObject.pmm_count_on_start = anObject.pmm_count_on_start.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.pmm_count_on_start_all = set.getBigDecimal(4);
				if(anObject.pmm_count_on_start_all != null) {
					anObject.pmm_count_on_start_all = anObject.pmm_count_on_start_all.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.services_plan = set.getBigDecimal(5);
				if(anObject.services_plan != null) {
					anObject.services_plan = anObject.services_plan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.services_fact = set.getBigDecimal(6);
				if(anObject.services_fact != null) {
					anObject.services_fact = anObject.services_fact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.services_limit = set.getBigDecimal(7);
				if(anObject.services_limit != null) {
					anObject.services_limit = anObject.services_limit.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.current_repair_plan = set.getBigDecimal(8);
				if(anObject.current_repair_plan != null) {
					anObject.current_repair_plan = anObject.current_repair_plan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.current_repair_fact = set.getBigDecimal(9);
				if(anObject.current_repair_fact != null) {
					anObject.current_repair_fact = anObject.current_repair_fact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.capital_repair_plan = set.getBigDecimal(10);
				if(anObject.capital_repair_plan != null) {
					anObject.capital_repair_plan = anObject.capital_repair_plan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.capital_repair_fact = set.getBigDecimal(11);
				if(anObject.capital_repair_fact != null) {
					anObject.capital_repair_fact = anObject.capital_repair_fact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.maintenance_plan = set.getBigDecimal(12);
				if(anObject.maintenance_plan != null) {
					anObject.maintenance_plan = anObject.maintenance_plan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.maintenance_fact = set.getBigDecimal(13);
				if(anObject.maintenance_fact != null) {
					anObject.maintenance_fact = anObject.maintenance_fact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sbyt_plan = set.getBigDecimal(14);
				if(anObject.sbyt_plan != null) {
					anObject.sbyt_plan = anObject.sbyt_plan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sbyt_fact = set.getBigDecimal(15);
				if(anObject.sbyt_fact != null) {
					anObject.sbyt_fact = anObject.sbyt_fact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.other_plan = set.getBigDecimal(16);
				if(anObject.other_plan != null) {
					anObject.other_plan = anObject.other_plan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.other_fact = set.getBigDecimal(17);
				if(anObject.other_fact != null) {
					anObject.other_fact = anObject.other_fact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.maintenance_sbyt_repairs_and_other_limit = set.getBigDecimal(18);
				if(anObject.maintenance_sbyt_repairs_and_other_limit != null) {
					anObject.maintenance_sbyt_repairs_and_other_limit = anObject.maintenance_sbyt_repairs_and_other_limit.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cap_build_ip_plan = set.getBigDecimal(19);
				if(anObject.cap_build_ip_plan != null) {
					anObject.cap_build_ip_plan = anObject.cap_build_ip_plan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cap_build_ip_fact = set.getBigDecimal(20);
				if(anObject.cap_build_ip_fact != null) {
					anObject.cap_build_ip_fact = anObject.cap_build_ip_fact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cap_builders_ip_limit = set.getBigDecimal(21);
				if(anObject.cap_builders_ip_limit != null) {
					anObject.cap_builders_ip_limit = anObject.cap_builders_ip_limit.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cap_build_other_plan = set.getBigDecimal(22);
				if(anObject.cap_build_other_plan != null) {
					anObject.cap_build_other_plan = anObject.cap_build_other_plan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cap_build_other_fact = set.getBigDecimal(23);
				if(anObject.cap_build_other_fact != null) {
					anObject.cap_build_other_fact = anObject.cap_build_other_fact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cap_builders_other_limit = set.getBigDecimal(24);
				if(anObject.cap_builders_other_limit != null) {
					anObject.cap_builders_other_limit = anObject.cap_builders_other_limit.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.vrtu_plan = set.getBigDecimal(25);
				if(anObject.vrtu_plan != null) {
					anObject.vrtu_plan = anObject.vrtu_plan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.vrtu_fact = set.getBigDecimal(26);
				if(anObject.vrtu_fact != null) {
					anObject.vrtu_fact = anObject.vrtu_fact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.vrtu_limit = set.getBigDecimal(27);
				if(anObject.vrtu_limit != null) {
					anObject.vrtu_limit = anObject.vrtu_limit.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.avr_plan = set.getBigDecimal(28);
				if(anObject.avr_plan != null) {
					anObject.avr_plan = anObject.avr_plan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.avr_fact = set.getBigDecimal(29);
				if(anObject.avr_fact != null) {
					anObject.avr_fact = anObject.avr_fact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.avr_limit = set.getBigDecimal(30);
				if(anObject.avr_limit != null) {
					anObject.avr_limit = anObject.avr_limit.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.odg_plan = set.getBigDecimal(31);
				if(anObject.odg_plan != null) {
					anObject.odg_plan = anObject.odg_plan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.odg_fact = set.getBigDecimal(32);
				if(anObject.odg_fact != null) {
					anObject.odg_fact = anObject.odg_fact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.all_limit = set.getBigDecimal(33);
				if(anObject.all_limit != null) {
					anObject.all_limit = anObject.all_limit.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.decode = set.getString(34);
				anObject.mol_codes = set.getString(35);
				anObject.datestart = set.getDate(36);
				anObject.datefinal = set.getDate(37);
				anObject.all_plan = set.getBigDecimal(38);
				if(anObject.all_plan != null) {
					anObject.all_plan = anObject.all_plan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.rest_from_fk = set.getBigDecimal(39);
				if(anObject.rest_from_fk != null) {
					anObject.rest_from_fk = anObject.rest_from_fk.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.rest_from_fk_avz = set.getBigDecimal(40);
				if(anObject.rest_from_fk_avz != null) {
					anObject.rest_from_fk_avz = anObject.rest_from_fk_avz.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.eikindcode = set.getInt(41);
				if ( set.wasNull() ) {
					anObject.eikindcode = Integer.MIN_VALUE;
				}
				anObject.userGen = set.getString(42);
				anObject.dateEdit = set.getTimestamp(43);

				anObject.sheetVolumesRefCode = set.getInt(44);
				if(set.wasNull()) {
					anObject.sheetVolumesRefCode = Integer.MIN_VALUE;
				}
				anObject.sheetVolumesRefName = set.getString(45);
				anObject.sheetVolumesRefDateGen = set.getDate(46);
				anObject.sheetVolumesRefStartDate = set.getDate(47);
				anObject.sheetVolumesRefEndDate = set.getDate(48);

				anObject.sheetVolumesRefUserGen = set.getString(52);
				anObject.sheetVolumesRefDateEdit = set.getTimestamp(53);

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
	
	public int[] getFilteredCodeArray(ENFuelSheetVolumesItemFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENFuelSheetVolumesItemFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENFuelSheetVolumesItem aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENFUELSHEETVOLUMESITEM.CODE FROM ENFUELSHEETVOLUMESITEM";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENFUELSHEETVOLUMESITEM.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);
		
		whereStr = BaseDAOUtils.addToCondition(condition, whereStr, true);

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
				/*if(i < fromPosition) {
					continue;
				} else if(i >= fromPosition + quantity) {
					i++;
					break;
				}*/
				result.add(set.getInt(1));
			}

			int[] array = new int[result.size()];
			for(int j = 0;j < result.size();j++) {
				array[j] = result.get(j);
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


	public ENFuelSheetVolumesItem getObject(int uid) throws PersistenceException {
		ENFuelSheetVolumesItem result = new ENFuelSheetVolumesItem();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENFuelSheetVolumesItem anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENFUELSHEETVOLUMESITEM.CODE, ENFUELSHEETVOLUMESITEM.DEPNAME, ENFUELSHEETVOLUMESITEM.PMM_COUNT_ON_START, ENFUELSHEETVOLUMESITEM.PMM_COUNT_ON_START_ALL, ENFUELSHEETVOLUMESITEM.SERVICES_PLAN, ENFUELSHEETVOLUMESITEM.SERVICES_FACT, ENFUELSHEETVOLUMESITEM.SERVICES_LIMIT, ENFUELSHEETVOLUMESITEM.CURRENT_REPAIR_PLAN, ENFUELSHEETVOLUMESITEM.CURRENT_REPAIR_FACT, ENFUELSHEETVOLUMESITEM.CAPITAL_REPAIR_PLAN, ENFUELSHEETVOLUMESITEM.CAPITAL_REPAIR_FACT, ENFUELSHEETVOLUMESITEM.MAINTENANCE_PLAN, ENFUELSHEETVOLUMESITEM.MAINTENANCE_FACT, ENFUELSHEETVOLUMESITEM.SBYT_PLAN, ENFUELSHEETVOLUMESITEM.SBYT_FACT, ENFUELSHEETVOLUMESITEM.OTHER_PLAN, ENFUELSHEETVOLUMESITEM.OTHER_FACT, ENFUELSHEETVOLUMESITEM.MAINTENANCE_SBYT_REPAIRS_AND_OTHER_LIMIT, ENFUELSHEETVOLUMESITEM.CAP_BUILD_IP_PLAN, ENFUELSHEETVOLUMESITEM.CAP_BUILD_IP_FACT, ENFUELSHEETVOLUMESITEM.CAP_BUILDERS_IP_LIMIT, ENFUELSHEETVOLUMESITEM.CAP_BUILD_OTHER_PLAN, ENFUELSHEETVOLUMESITEM.CAP_BUILD_OTHER_FACT, ENFUELSHEETVOLUMESITEM.CAP_BUILDERS_OTHER_LIMIT, ENFUELSHEETVOLUMESITEM.VRTU_PLAN, ENFUELSHEETVOLUMESITEM.VRTU_FACT, ENFUELSHEETVOLUMESITEM.VRTU_LIMIT, ENFUELSHEETVOLUMESITEM.AVR_PLAN, ENFUELSHEETVOLUMESITEM.AVR_FACT, ENFUELSHEETVOLUMESITEM.AVR_LIMIT, ENFUELSHEETVOLUMESITEM.ODG_PLAN, ENFUELSHEETVOLUMESITEM.ODG_FACT, ENFUELSHEETVOLUMESITEM.ALL_LIMIT, ENFUELSHEETVOLUMESITEM.DECODE, ENFUELSHEETVOLUMESITEM.MOL_CODES, ENFUELSHEETVOLUMESITEM.DATESTART, ENFUELSHEETVOLUMESITEM.DATEFINAL, ENFUELSHEETVOLUMESITEM.ORD, ENFUELSHEETVOLUMESITEM.ALL_PLAN, ENFUELSHEETVOLUMESITEM.REST_FROM_FK, ENFUELSHEETVOLUMESITEM.REST_FROM_FK_AVZ, ENFUELSHEETVOLUMESITEM.EIKINDCODE, ENFUELSHEETVOLUMESITEM.USERGEN, ENFUELSHEETVOLUMESITEM.DATEEDIT, ENFUELSHEETVOLUMESITEM.MODIFY_TIME, ENFUELSHEETVOLUMESITEM.SHEETVOLUMESREFCODE "
			+" FROM ENFUELSHEETVOLUMESITEM WHERE ENFUELSHEETVOLUMESITEM.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.depname = set.getString(2);
				anObject.pmm_count_on_start = set.getBigDecimal(3);
				if(anObject.pmm_count_on_start != null) {
					anObject.pmm_count_on_start = anObject.pmm_count_on_start.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.pmm_count_on_start_all = set.getBigDecimal(4);
				if(anObject.pmm_count_on_start_all != null) {
					anObject.pmm_count_on_start_all = anObject.pmm_count_on_start_all.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.services_plan = set.getBigDecimal(5);
				if(anObject.services_plan != null) {
					anObject.services_plan = anObject.services_plan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.services_fact = set.getBigDecimal(6);
				if(anObject.services_fact != null) {
					anObject.services_fact = anObject.services_fact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.services_limit = set.getBigDecimal(7);
				if(anObject.services_limit != null) {
					anObject.services_limit = anObject.services_limit.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.current_repair_plan = set.getBigDecimal(8);
				if(anObject.current_repair_plan != null) {
					anObject.current_repair_plan = anObject.current_repair_plan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.current_repair_fact = set.getBigDecimal(9);
				if(anObject.current_repair_fact != null) {
					anObject.current_repair_fact = anObject.current_repair_fact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.capital_repair_plan = set.getBigDecimal(10);
				if(anObject.capital_repair_plan != null) {
					anObject.capital_repair_plan = anObject.capital_repair_plan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.capital_repair_fact = set.getBigDecimal(11);
				if(anObject.capital_repair_fact != null) {
					anObject.capital_repair_fact = anObject.capital_repair_fact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.maintenance_plan = set.getBigDecimal(12);
				if(anObject.maintenance_plan != null) {
					anObject.maintenance_plan = anObject.maintenance_plan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.maintenance_fact = set.getBigDecimal(13);
				if(anObject.maintenance_fact != null) {
					anObject.maintenance_fact = anObject.maintenance_fact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sbyt_plan = set.getBigDecimal(14);
				if(anObject.sbyt_plan != null) {
					anObject.sbyt_plan = anObject.sbyt_plan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sbyt_fact = set.getBigDecimal(15);
				if(anObject.sbyt_fact != null) {
					anObject.sbyt_fact = anObject.sbyt_fact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.other_plan = set.getBigDecimal(16);
				if(anObject.other_plan != null) {
					anObject.other_plan = anObject.other_plan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.other_fact = set.getBigDecimal(17);
				if(anObject.other_fact != null) {
					anObject.other_fact = anObject.other_fact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.maintenance_sbyt_repairs_and_other_limit = set.getBigDecimal(18);
				if(anObject.maintenance_sbyt_repairs_and_other_limit != null) {
					anObject.maintenance_sbyt_repairs_and_other_limit = anObject.maintenance_sbyt_repairs_and_other_limit.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cap_build_ip_plan = set.getBigDecimal(19);
				if(anObject.cap_build_ip_plan != null) {
					anObject.cap_build_ip_plan = anObject.cap_build_ip_plan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cap_build_ip_fact = set.getBigDecimal(20);
				if(anObject.cap_build_ip_fact != null) {
					anObject.cap_build_ip_fact = anObject.cap_build_ip_fact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cap_builders_ip_limit = set.getBigDecimal(21);
				if(anObject.cap_builders_ip_limit != null) {
					anObject.cap_builders_ip_limit = anObject.cap_builders_ip_limit.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cap_build_other_plan = set.getBigDecimal(22);
				if(anObject.cap_build_other_plan != null) {
					anObject.cap_build_other_plan = anObject.cap_build_other_plan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cap_build_other_fact = set.getBigDecimal(23);
				if(anObject.cap_build_other_fact != null) {
					anObject.cap_build_other_fact = anObject.cap_build_other_fact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cap_builders_other_limit = set.getBigDecimal(24);
				if(anObject.cap_builders_other_limit != null) {
					anObject.cap_builders_other_limit = anObject.cap_builders_other_limit.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.vrtu_plan = set.getBigDecimal(25);
				if(anObject.vrtu_plan != null) {
					anObject.vrtu_plan = anObject.vrtu_plan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.vrtu_fact = set.getBigDecimal(26);
				if(anObject.vrtu_fact != null) {
					anObject.vrtu_fact = anObject.vrtu_fact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.vrtu_limit = set.getBigDecimal(27);
				if(anObject.vrtu_limit != null) {
					anObject.vrtu_limit = anObject.vrtu_limit.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.avr_plan = set.getBigDecimal(28);
				if(anObject.avr_plan != null) {
					anObject.avr_plan = anObject.avr_plan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.avr_fact = set.getBigDecimal(29);
				if(anObject.avr_fact != null) {
					anObject.avr_fact = anObject.avr_fact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.avr_limit = set.getBigDecimal(30);
				if(anObject.avr_limit != null) {
					anObject.avr_limit = anObject.avr_limit.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.odg_plan = set.getBigDecimal(31);
				if(anObject.odg_plan != null) {
					anObject.odg_plan = anObject.odg_plan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.odg_fact = set.getBigDecimal(32);
				if(anObject.odg_fact != null) {
					anObject.odg_fact = anObject.odg_fact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.all_limit = set.getBigDecimal(33);
				if(anObject.all_limit != null) {
					anObject.all_limit = anObject.all_limit.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.decode = set.getString(34);
				anObject.mol_codes = set.getString(35);
				anObject.datestart = set.getDate(36);
				anObject.datefinal = set.getDate(37);
				anObject.ord = set.getInt(38);
				if (set.wasNull()) {
					anObject.ord = Integer.MIN_VALUE;
				}
				anObject.all_plan = set.getBigDecimal(39);
				if(anObject.all_plan != null) {
					anObject.all_plan = anObject.all_plan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.rest_from_fk = set.getBigDecimal(40);
				if(anObject.rest_from_fk != null) {
					anObject.rest_from_fk = anObject.rest_from_fk.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.rest_from_fk_avz = set.getBigDecimal(41);
				if(anObject.rest_from_fk_avz != null) {
					anObject.rest_from_fk_avz = anObject.rest_from_fk_avz.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.eikindcode = set.getInt(42);
				if (set.wasNull()) {
					anObject.eikindcode = Integer.MIN_VALUE;
				}
				anObject.userGen = set.getString(43);
				anObject.dateEdit = set.getTimestamp(44);
				anObject.modify_time = set.getLong(45);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.sheetVolumesRef.code = set.getInt(46);
				if (set.wasNull()) {
					anObject.sheetVolumesRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENFuelSheetVolumesItemRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENFuelSheetVolumesItemRef ref = new com.ksoe.energynet.valueobject.references.ENFuelSheetVolumesItemRef();
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

		selectStr = "DELETE FROM  ENFUELSHEETVOLUMESITEM WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENFuelSheetVolumesItem object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENFuelSheetVolumesItem.getObject%} access denied");
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
	
	public long count(ENFuelSheetVolumesItemFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENFuelSheetVolumesItemFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENFuelSheetVolumesItemFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENFUELSHEETVOLUMESITEM", aggFunction, column);
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
	public <E> E getProperty(String propertyName, int code, E defaultValue) {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet set = null;
		String sql = String.format("SELECT %s FROM ENFUELSHEETVOLUMESITEM WHERE code = ?", propertyName);
		try {
			connection = getConnection();
			statement = connection.prepareStatement(sql);
			statement.setInt(1, code);
			set = statement.executeQuery();
			if(set.next()) {
				return (E)set.getObject(1);
			} else {
				return defaultValue;
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - " + sql);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (set != null) set.close();} catch (SQLException e) {}
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			try{if(connection != null && !connection.isClosed())connection.close();} catch(SQLException e){}
		}
	}
	
	public <E> List<E> getListOfPropertyValues(String propertyName, ENFuelSheetVolumesItemFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENFuelSheetVolumesItemFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENFUELSHEETVOLUMESITEM");
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
		
		if(filter.getOrderBySQL() != null && filter.getOrderBySQL().trim().length() > 0) {
			sql += " ORDER BY " + filter.getOrderBySQL();
		}
		
		sql += " OFFSET " + fromPosition;
		
		if(quantity > -1) {
			sql += " LIMIT " + quantity;
		}
		
		try {
			statement = connection.prepareStatement(sql);
			int number = setParameters(filter, statement);

			if(bindObjects != null) {
				_bindObjectsToPreparedStatement(statement,new Vector<Object>(bindObjects),number);
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
		
		selectStr =
			"SELECT  ENFUELSHEETVOLUMESITEM.CODE FROM  ENFUELSHEETVOLUMESITEM WHERE  ENFUELSHEETVOLUMESITEM.CODE = ?";
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
		_checkConditionToken(condition,"code","ENFUELSHEETVOLUMESITEM.CODE");
		_checkConditionToken(condition,"depname","ENFUELSHEETVOLUMESITEM.DEPNAME");
		_checkConditionToken(condition,"pmm_count_on_start","ENFUELSHEETVOLUMESITEM.PMM_COUNT_ON_START");
		_checkConditionToken(condition,"pmm_count_on_start_all","ENFUELSHEETVOLUMESITEM.PMM_COUNT_ON_START_ALL");
		_checkConditionToken(condition,"services_plan","ENFUELSHEETVOLUMESITEM.SERVICES_PLAN");
		_checkConditionToken(condition,"services_fact","ENFUELSHEETVOLUMESITEM.SERVICES_FACT");
		_checkConditionToken(condition,"services_limit","ENFUELSHEETVOLUMESITEM.SERVICES_LIMIT");
		_checkConditionToken(condition,"current_repair_plan","ENFUELSHEETVOLUMESITEM.CURRENT_REPAIR_PLAN");
		_checkConditionToken(condition,"current_repair_fact","ENFUELSHEETVOLUMESITEM.CURRENT_REPAIR_FACT");
		_checkConditionToken(condition,"capital_repair_plan","ENFUELSHEETVOLUMESITEM.CAPITAL_REPAIR_PLAN");
		_checkConditionToken(condition,"capital_repair_fact","ENFUELSHEETVOLUMESITEM.CAPITAL_REPAIR_FACT");
		_checkConditionToken(condition,"maintenance_plan","ENFUELSHEETVOLUMESITEM.MAINTENANCE_PLAN");
		_checkConditionToken(condition,"maintenance_fact","ENFUELSHEETVOLUMESITEM.MAINTENANCE_FACT");
		_checkConditionToken(condition,"sbyt_plan","ENFUELSHEETVOLUMESITEM.SBYT_PLAN");
		_checkConditionToken(condition,"sbyt_fact","ENFUELSHEETVOLUMESITEM.SBYT_FACT");
		_checkConditionToken(condition,"other_plan","ENFUELSHEETVOLUMESITEM.OTHER_PLAN");
		_checkConditionToken(condition,"other_fact","ENFUELSHEETVOLUMESITEM.OTHER_FACT");
		_checkConditionToken(condition,"maintenance_sbyt_repairs_and_other_limit","ENFUELSHEETVOLUMESITEM.MAINTENANCE_SBYT_REPAIRS_AND_OTHER_LIMIT");
		_checkConditionToken(condition,"cap_build_ip_plan","ENFUELSHEETVOLUMESITEM.CAP_BUILD_IP_PLAN");
		_checkConditionToken(condition,"cap_build_ip_fact","ENFUELSHEETVOLUMESITEM.CAP_BUILD_IP_FACT");
		_checkConditionToken(condition,"cap_builders_ip_limit","ENFUELSHEETVOLUMESITEM.CAP_BUILDERS_IP_LIMIT");
		_checkConditionToken(condition,"cap_build_other_plan","ENFUELSHEETVOLUMESITEM.CAP_BUILD_OTHER_PLAN");
		_checkConditionToken(condition,"cap_build_other_fact","ENFUELSHEETVOLUMESITEM.CAP_BUILD_OTHER_FACT");
		_checkConditionToken(condition,"cap_builders_other_limit","ENFUELSHEETVOLUMESITEM.CAP_BUILDERS_OTHER_LIMIT");
		_checkConditionToken(condition,"vrtu_plan","ENFUELSHEETVOLUMESITEM.VRTU_PLAN");
		_checkConditionToken(condition,"vrtu_fact","ENFUELSHEETVOLUMESITEM.VRTU_FACT");
		_checkConditionToken(condition,"vrtu_limit","ENFUELSHEETVOLUMESITEM.VRTU_LIMIT");
		_checkConditionToken(condition,"avr_plan","ENFUELSHEETVOLUMESITEM.AVR_PLAN");
		_checkConditionToken(condition,"avr_fact","ENFUELSHEETVOLUMESITEM.AVR_FACT");
		_checkConditionToken(condition,"avr_limit","ENFUELSHEETVOLUMESITEM.AVR_LIMIT");
		_checkConditionToken(condition,"odg_plan","ENFUELSHEETVOLUMESITEM.ODG_PLAN");
		_checkConditionToken(condition,"odg_fact","ENFUELSHEETVOLUMESITEM.ODG_FACT");
		_checkConditionToken(condition,"all_limit","ENFUELSHEETVOLUMESITEM.ALL_LIMIT");
		_checkConditionToken(condition,"decode","ENFUELSHEETVOLUMESITEM.DECODE");
		_checkConditionToken(condition,"mol_codes","ENFUELSHEETVOLUMESITEM.MOL_CODES");
		_checkConditionToken(condition,"datestart","ENFUELSHEETVOLUMESITEM.DATESTART");
		_checkConditionToken(condition,"datefinal","ENFUELSHEETVOLUMESITEM.DATEFINAL");
		_checkConditionToken(condition,"ord","ENFUELSHEETVOLUMESITEM.ORD");
		_checkConditionToken(condition,"all_plan","ENFUELSHEETVOLUMESITEM.ALL_PLAN");
		_checkConditionToken(condition,"rest_from_fk","ENFUELSHEETVOLUMESITEM.REST_FROM_FK");
		_checkConditionToken(condition,"rest_from_fk_avz","ENFUELSHEETVOLUMESITEM.REST_FROM_FK_AVZ");
		_checkConditionToken(condition,"eikindcode","ENFUELSHEETVOLUMESITEM.EIKINDCODE");
		_checkConditionToken(condition,"usergen","ENFUELSHEETVOLUMESITEM.USERGEN");
		_checkConditionToken(condition,"dateedit","ENFUELSHEETVOLUMESITEM.DATEEDIT");
		_checkConditionToken(condition,"modify_time","ENFUELSHEETVOLUMESITEM.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"sheetvolumesref","SHEETVOLUMESREFCODE");
		_checkConditionToken(condition,"sheetvolumesref.code","SHEETVOLUMESREFCODE");
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
	
	private void _collectAutoIncrementFields(ENFuelSheetVolumesItem anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENFUELSHEETVOLUMESITEM", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENFUELSHEETVOLUMESITEM", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENFUELSHEETVOLUMESITEM", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENFUELSHEETVOLUMESITEM");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENFuelSheetVolumesItemDAO
