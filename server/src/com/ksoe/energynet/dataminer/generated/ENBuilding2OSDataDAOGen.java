
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
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
import com.ksoe.energynet.valueobject.ENBuilding2OSData;
import com.ksoe.energynet.valueobject.filter.ENBuilding2OSDataFilter;
import com.ksoe.energynet.valueobject.brief.ENBuilding2OSDataShort;
import com.ksoe.energynet.valueobject.lists.ENBuilding2OSDataShortList;


/**
 * DAO Object for ENBuilding2OSData;
 *
 */

public class ENBuilding2OSDataDAOGen extends GenericDataMiner {

	public ENBuilding2OSDataDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENBuilding2OSDataDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENBuilding2OSData inObject) throws PersistenceException {
		ENBuilding2OSData obj = new ENBuilding2OSData();
		obj.code = inObject.code;
		loadObject(obj);

		if (inObject.num_un != obj.num_un){
					return false;
				}

		if(inObject.kod_inv == null && obj.kod_inv == null){}
		else
			if(inObject.kod_inv == null || obj.kod_inv == null) return false;
			else
				if ( ! inObject.kod_inv.equals(obj.kod_inv)){
					return false;
				}

		if(inObject.kod_nal_nakl == null && obj.kod_nal_nakl == null){}
		else
			if(inObject.kod_nal_nakl == null || obj.kod_nal_nakl == null) return false;
			else
				if ( ! inObject.kod_nal_nakl.equals(obj.kod_nal_nakl)){
					return false;
				}

		if(inObject.kod_ist == null && obj.kod_ist == null){}
		else
			if(inObject.kod_ist == null || obj.kod_ist == null) return false;
			else
				if ( ! inObject.kod_ist.equals(obj.kod_ist)){
					return false;
				}

		if(inObject.name_ist == null && obj.name_ist == null){}
		else
			if(inObject.name_ist == null || obj.name_ist == null) return false;
			else
				if ( ! inObject.name_ist.equals(obj.name_ist)){
					return false;
				}

		if(inObject.kod_subsch == null && obj.kod_subsch == null){}
		else
			if(inObject.kod_subsch == null || obj.kod_subsch == null) return false;
			else
				if ( ! inObject.kod_subsch.equals(obj.kod_subsch)){
					return false;
				}

		if(inObject.name_subsch == null && obj.name_subsch == null){}
		else
			if(inObject.name_subsch == null || obj.name_subsch == null) return false;
			else
				if ( ! inObject.name_subsch.equals(obj.name_subsch)){
					return false;
				}

		if(inObject.kod_vid == null && obj.kod_vid == null){}
		else
			if(inObject.kod_vid == null || obj.kod_vid == null) return false;
			else
				if ( ! inObject.kod_vid.equals(obj.kod_vid)){
					return false;
				}

		if(inObject.name_vid == null && obj.name_vid == null){}
		else
			if(inObject.name_vid == null || obj.name_vid == null) return false;
			else
				if ( ! inObject.name_vid.equals(obj.name_vid)){
					return false;
				}

		if(inObject.kod_privat == null && obj.kod_privat == null){}
		else
			if(inObject.kod_privat == null || obj.kod_privat == null) return false;
			else
				if ( ! inObject.kod_privat.equals(obj.kod_privat)){
					return false;
				}

		if(inObject.name_privat == null && obj.name_privat == null){}
		else
			if(inObject.name_privat == null || obj.name_privat == null) return false;
			else
				if ( ! inObject.name_privat.equals(obj.name_privat)){
					return false;
				}

		if(inObject.kod_gr == null && obj.kod_gr == null){}
		else
			if(inObject.kod_gr == null || obj.kod_gr == null) return false;
			else
				if ( ! inObject.kod_gr.equals(obj.kod_gr)){
					return false;
				}

		if(inObject.name_gr == null && obj.name_gr == null){}
		else
			if(inObject.name_gr == null || obj.name_gr == null) return false;
			else
				if ( ! inObject.name_gr.equals(obj.name_gr)){
					return false;
				}

		if (inObject.num_klass != obj.num_klass){
					return false;
				}

		if(inObject.name_klass == null && obj.name_klass == null){}
		else
			if(inObject.name_klass == null || obj.name_klass == null) return false;
			else
				if ( ! inObject.name_klass.equals(obj.name_klass)){
					return false;
				}

		if(inObject.f_amort == null && obj.f_amort == null){}
		else
			if(inObject.f_amort == null || obj.f_amort == null) return false;
			else
				if ( ! inObject.f_amort.equals(obj.f_amort)){
					return false;
				}

		if(inObject.dt_vypusk == null && obj.dt_vypusk == null){} else 
			if(inObject.dt_vypusk == null || obj.dt_vypusk == null) return false;
			else
				if (inObject.dt_vypusk.compareTo(obj.dt_vypusk) != 0){
					return false;
				}

		if(inObject.sum_izn_perv == null && obj.sum_izn_perv == null){}
		else
			if(inObject.sum_izn_perv == null || obj.sum_izn_perv == null) return false;
			else
				if ( ! inObject.sum_izn_perv.equals(obj.sum_izn_perv)){
					return false;
				}

		if(inObject.sum_izn_perv_n == null && obj.sum_izn_perv_n == null){}
		else
			if(inObject.sum_izn_perv_n == null || obj.sum_izn_perv_n == null) return false;
			else
				if ( ! inObject.sum_izn_perv_n.equals(obj.sum_izn_perv_n)){
					return false;
				}

		if(inObject.sum_st_perv_n == null && obj.sum_st_perv_n == null){}
		else
			if(inObject.sum_st_perv_n == null || obj.sum_st_perv_n == null) return false;
			else
				if ( ! inObject.sum_st_perv_n.equals(obj.sum_st_perv_n)){
					return false;
				}

		if(inObject.kod_zatr == null && obj.kod_zatr == null){}
		else
			if(inObject.kod_zatr == null || obj.kod_zatr == null) return false;
			else
				if ( ! inObject.kod_zatr.equals(obj.kod_zatr)){
					return false;
				}

		if(inObject.kod_oborud == null && obj.kod_oborud == null){}
		else
			if(inObject.kod_oborud == null || obj.kod_oborud == null) return false;
			else
				if ( ! inObject.kod_oborud.equals(obj.kod_oborud)){
					return false;
				}

		if(inObject.primechan == null && obj.primechan == null){}
		else
			if(inObject.primechan == null || obj.primechan == null) return false;
			else
				if ( ! inObject.primechan.equals(obj.primechan)){
					return false;
				}

		if(inObject.characters == null && obj.characters == null){}
		else
			if(inObject.characters == null || obj.characters == null) return false;
			else
				if ( ! inObject.characters.equals(obj.characters)){
					return false;
				}

		if (inObject.id_amort != obj.id_amort){
					return false;
				}

		if(inObject.kod_amort == null && obj.kod_amort == null){}
		else
			if(inObject.kod_amort == null || obj.kod_amort == null) return false;
			else
				if ( ! inObject.kod_amort.equals(obj.kod_amort)){
					return false;
				}

		if(inObject.name_amort == null && obj.name_amort == null){}
		else
			if(inObject.name_amort == null || obj.name_amort == null) return false;
			else
				if ( ! inObject.name_amort.equals(obj.name_amort)){
					return false;
				}

		if (inObject.kod_am != obj.kod_am){
					return false;
				}

		if(inObject.name_am == null && obj.name_am == null){}
		else
			if(inObject.name_am == null || obj.name_am == null) return false;
			else
				if ( ! inObject.name_am.equals(obj.name_am)){
					return false;
				}

		if (inObject.kod_am_n != obj.kod_am_n){
					return false;
				}

		if(inObject.name_am_n == null && obj.name_am_n == null){}
		else
			if(inObject.name_am_n == null || obj.name_am_n == null) return false;
			else
				if ( ! inObject.name_am_n.equals(obj.name_am_n)){
					return false;
				}

		if (inObject.use_limit != obj.use_limit){
					return false;
				}

		if (inObject.use_limit_n != obj.use_limit_n){
					return false;
				}

		if(inObject.primechan_vyb == null && obj.primechan_vyb == null){}
		else
			if(inObject.primechan_vyb == null || obj.primechan_vyb == null) return false;
			else
				if ( ! inObject.primechan_vyb.equals(obj.primechan_vyb)){
					return false;
				}

		if(inObject.kod_prizn == null && obj.kod_prizn == null){}
		else
			if(inObject.kod_prizn == null || obj.kod_prizn == null) return false;
			else
				if ( ! inObject.kod_prizn.equals(obj.kod_prizn)){
					return false;
				}

		if(inObject.datePosting == null && obj.datePosting == null){} else 
			if(inObject.datePosting == null || obj.datePosting == null) return false;
			else
				if (inObject.datePosting.compareTo(obj.datePosting) != 0){
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
		if (inObject.ENBuildingRef.code != obj.ENBuildingRef.code){
			return false;
		}
		return true;
	}

	public int add(ENBuilding2OSData anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENBuilding2OSData anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENBUILDING2OSDATA (CODE,NUM_UN,KOD_INV,KOD_NAL_NAKL,KOD_IST,NAME_IST,KOD_SUBSCH,NAME_SUBSCH,KOD_VID,NAME_VID,KOD_PRIVAT,NAME_PRIVAT,KOD_GR,NAME_GR,NUM_KLASS,NAME_KLASS,F_AMORT,DT_VYPUSK,SUM_IZN_PERV,SUM_IZN_PERV_N,SUM_ST_PERV_N,KOD_ZATR,KOD_OBORUD,PRIMECHAN,CHARACTERS,ID_AMORT,KOD_AMORT,NAME_AMORT,KOD_AM,NAME_AM,KOD_AM_N,NAME_AM_N,USE_LIMIT,USE_LIMIT_N,PRIMECHAN_VYB,KOD_PRIZN,DATEPOSTING,USERGEN,DATEEDIT,MODIFY_TIME,ENBUILDINGREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			if (anObject.num_un != Integer.MIN_VALUE ) {
				statement.setInt(2, anObject.num_un);
			} else {
				statement.setNull(2, java.sql.Types.INTEGER);
			}
			statement.setString(3, anObject.kod_inv);
			statement.setString(4, anObject.kod_nal_nakl);
			statement.setString(5, anObject.kod_ist);
			statement.setString(6, anObject.name_ist);
			statement.setString(7, anObject.kod_subsch);
			statement.setString(8, anObject.name_subsch);
			statement.setString(9, anObject.kod_vid);
			statement.setString(10, anObject.name_vid);
			statement.setString(11, anObject.kod_privat);
			statement.setString(12, anObject.name_privat);
			statement.setString(13, anObject.kod_gr);
			statement.setString(14, anObject.name_gr);
			if (anObject.num_klass != Integer.MIN_VALUE ) {
				statement.setInt(15, anObject.num_klass);
			} else {
				statement.setNull(15, java.sql.Types.INTEGER);
			}
			statement.setString(16, anObject.name_klass);
			statement.setString(17, anObject.f_amort);
			if (anObject.dt_vypusk == null) {
				statement.setDate(18, null);
			} else {
				statement.setDate(18, new java.sql.Date(anObject.dt_vypusk.getTime()));
			}
			if (anObject.sum_izn_perv != null) {
				anObject.sum_izn_perv = anObject.sum_izn_perv.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(19, anObject.sum_izn_perv);
			if (anObject.sum_izn_perv_n != null) {
				anObject.sum_izn_perv_n = anObject.sum_izn_perv_n.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(20, anObject.sum_izn_perv_n);
			if (anObject.sum_st_perv_n != null) {
				anObject.sum_st_perv_n = anObject.sum_st_perv_n.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(21, anObject.sum_st_perv_n);
			statement.setString(22, anObject.kod_zatr);
			statement.setString(23, anObject.kod_oborud);
			statement.setString(24, anObject.primechan);
			statement.setString(25, anObject.characters);
			if (anObject.id_amort != Integer.MIN_VALUE ) {
				statement.setInt(26, anObject.id_amort);
			} else {
				statement.setNull(26, java.sql.Types.INTEGER);
			}
			statement.setString(27, anObject.kod_amort);
			statement.setString(28, anObject.name_amort);
			if (anObject.kod_am != Integer.MIN_VALUE ) {
				statement.setInt(29, anObject.kod_am);
			} else {
				statement.setNull(29, java.sql.Types.INTEGER);
			}
			statement.setString(30, anObject.name_am);
			if (anObject.kod_am_n != Integer.MIN_VALUE ) {
				statement.setInt(31, anObject.kod_am_n);
			} else {
				statement.setNull(31, java.sql.Types.INTEGER);
			}
			statement.setString(32, anObject.name_am_n);
			if (anObject.use_limit != Integer.MIN_VALUE ) {
				statement.setInt(33, anObject.use_limit);
			} else {
				statement.setNull(33, java.sql.Types.INTEGER);
			}
			if (anObject.use_limit_n != Integer.MIN_VALUE ) {
				statement.setInt(34, anObject.use_limit_n);
			} else {
				statement.setNull(34, java.sql.Types.INTEGER);
			}
			statement.setString(35, anObject.primechan_vyb);
			statement.setString(36, anObject.kod_prizn);
			if (anObject.datePosting == null) {
				statement.setDate(37, null);
			} else {
				statement.setDate(37, new java.sql.Date(anObject.datePosting.getTime()));
			}
			statement.setString(38, anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(39, null);
			} else {
				statement.setTimestamp(39, new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(40, null);
			} else {
				statement.setBigDecimal(40, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.ENBuildingRef.code != Integer.MIN_VALUE){
				statement.setInt(41,anObject.ENBuildingRef.code);
			} else {
				statement.setNull(41,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENBuilding2OSDataDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENBuilding2OSData anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENBuilding2OSData anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENBuilding2OSData oldObject = new ENBuilding2OSData();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENBuilding2OSData.modify_time_Field+" FROM  ENBUILDING2OSDATA WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("NUM_UN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KOD_INV") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KOD_NAL_NAKL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KOD_IST") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NAME_IST") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KOD_SUBSCH") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NAME_SUBSCH") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KOD_VID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NAME_VID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KOD_PRIVAT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NAME_PRIVAT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KOD_GR") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NAME_GR") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NUM_KLASS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NAME_KLASS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("F_AMORT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DT_VYPUSK") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SUM_IZN_PERV") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SUM_IZN_PERV_N") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SUM_ST_PERV_N") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KOD_ZATR") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KOD_OBORUD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PRIMECHAN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CHARACTERS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ID_AMORT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KOD_AMORT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NAME_AMORT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KOD_AM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NAME_AM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KOD_AM_N") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NAME_AM_N") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USE_LIMIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USE_LIMIT_N") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PRIMECHAN_VYB") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KOD_PRIZN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEPOSTING") == 0) {
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
					if(fieldNameStr.compareTo("ENBUILDINGREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENBUILDING2OSDATA SET  NUM_UN = ? , KOD_INV = ? , KOD_NAL_NAKL = ? , KOD_IST = ? , NAME_IST = ? , KOD_SUBSCH = ? , NAME_SUBSCH = ? , KOD_VID = ? , NAME_VID = ? , KOD_PRIVAT = ? , NAME_PRIVAT = ? , KOD_GR = ? , NAME_GR = ? , NUM_KLASS = ? , NAME_KLASS = ? , F_AMORT = ? , DT_VYPUSK = ? , SUM_IZN_PERV = ? , SUM_IZN_PERV_N = ? , SUM_ST_PERV_N = ? , KOD_ZATR = ? , KOD_OBORUD = ? , PRIMECHAN = ? , CHARACTERS = ? , ID_AMORT = ? , KOD_AMORT = ? , NAME_AMORT = ? , KOD_AM = ? , NAME_AM = ? , KOD_AM_N = ? , NAME_AM_N = ? , USE_LIMIT = ? , USE_LIMIT_N = ? , PRIMECHAN_VYB = ? , KOD_PRIZN = ? , DATEPOSTING = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , ENBUILDINGREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENBUILDING2OSDATA SET ";
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
					if (anObject.num_un != Integer.MIN_VALUE) {
						statement.setInt(1, anObject.num_un);
					} else {
						statement.setNull(1, java.sql.Types.INTEGER);
					}
					statement.setString(2, anObject.kod_inv);
					statement.setString(3, anObject.kod_nal_nakl);
					statement.setString(4, anObject.kod_ist);
					statement.setString(5, anObject.name_ist);
					statement.setString(6, anObject.kod_subsch);
					statement.setString(7, anObject.name_subsch);
					statement.setString(8, anObject.kod_vid);
					statement.setString(9, anObject.name_vid);
					statement.setString(10, anObject.kod_privat);
					statement.setString(11, anObject.name_privat);
					statement.setString(12, anObject.kod_gr);
					statement.setString(13, anObject.name_gr);
					if (anObject.num_klass != Integer.MIN_VALUE) {
						statement.setInt(14, anObject.num_klass);
					} else {
						statement.setNull(14, java.sql.Types.INTEGER);
					}
					statement.setString(15, anObject.name_klass);
					statement.setString(16, anObject.f_amort);
					if (anObject.dt_vypusk == null) {
						statement.setDate(17, null);
					} else {
						statement.setDate(17, new java.sql.Date(anObject.dt_vypusk.getTime()));
					}
					if (anObject.sum_izn_perv != null) {
						anObject.sum_izn_perv = anObject.sum_izn_perv.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(18, anObject.sum_izn_perv);
					if (anObject.sum_izn_perv_n != null) {
						anObject.sum_izn_perv_n = anObject.sum_izn_perv_n.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(19, anObject.sum_izn_perv_n);
					if (anObject.sum_st_perv_n != null) {
						anObject.sum_st_perv_n = anObject.sum_st_perv_n.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(20, anObject.sum_st_perv_n);
					statement.setString(21, anObject.kod_zatr);
					statement.setString(22, anObject.kod_oborud);
					statement.setString(23, anObject.primechan);
					statement.setString(24, anObject.characters);
					if (anObject.id_amort != Integer.MIN_VALUE) {
						statement.setInt(25, anObject.id_amort);
					} else {
						statement.setNull(25, java.sql.Types.INTEGER);
					}
					statement.setString(26, anObject.kod_amort);
					statement.setString(27, anObject.name_amort);
					if (anObject.kod_am != Integer.MIN_VALUE) {
						statement.setInt(28, anObject.kod_am);
					} else {
						statement.setNull(28, java.sql.Types.INTEGER);
					}
					statement.setString(29, anObject.name_am);
					if (anObject.kod_am_n != Integer.MIN_VALUE) {
						statement.setInt(30, anObject.kod_am_n);
					} else {
						statement.setNull(30, java.sql.Types.INTEGER);
					}
					statement.setString(31, anObject.name_am_n);
					if (anObject.use_limit != Integer.MIN_VALUE) {
						statement.setInt(32, anObject.use_limit);
					} else {
						statement.setNull(32, java.sql.Types.INTEGER);
					}
					if (anObject.use_limit_n != Integer.MIN_VALUE) {
						statement.setInt(33, anObject.use_limit_n);
					} else {
						statement.setNull(33, java.sql.Types.INTEGER);
					}
					statement.setString(34, anObject.primechan_vyb);
					statement.setString(35, anObject.kod_prizn);
					if (anObject.datePosting == null) {
						statement.setDate(36, null);
					} else {
						statement.setDate(36, new java.sql.Date(anObject.datePosting.getTime()));
					}
					statement.setString(37, anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(38, null);
					} else {
						statement.setTimestamp(38, new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(39, null);
					} else {
						statement.setBigDecimal(39, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.ENBuildingRef.code != Integer.MIN_VALUE) {
						statement.setInt(40, anObject.ENBuildingRef.code);
					} else {
						statement.setNull(40, java.sql.Types.INTEGER);
					}
					statement.setInt(41, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("NUM_UN".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.num_un);
							continue;
						}
						if("KOD_INV".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.kod_inv);
							continue;
						}
						if("KOD_NAL_NAKL".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.kod_nal_nakl);
							continue;
						}
						if("KOD_IST".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.kod_ist);
							continue;
						}
						if("NAME_IST".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.name_ist);
							continue;
						}
						if("KOD_SUBSCH".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.kod_subsch);
							continue;
						}
						if("NAME_SUBSCH".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.name_subsch);
							continue;
						}
						if("KOD_VID".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.kod_vid);
							continue;
						}
						if("NAME_VID".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.name_vid);
							continue;
						}
						if("KOD_PRIVAT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.kod_privat);
							continue;
						}
						if("NAME_PRIVAT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.name_privat);
							continue;
						}
						if("KOD_GR".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.kod_gr);
							continue;
						}
						if("NAME_GR".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.name_gr);
							continue;
						}
						if("NUM_KLASS".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.num_klass);
							continue;
						}
						if("NAME_KLASS".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.name_klass);
							continue;
						}
						if("F_AMORT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.f_amort);
							continue;
						}
						if("DT_VYPUSK".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dt_vypusk == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dt_vypusk.getTime()));
							}
							continue;
						}
						if("SUM_IZN_PERV".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sum_izn_perv != null) {
								anObject.sum_izn_perv = anObject.sum_izn_perv.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.sum_izn_perv);
							continue;
						}
						if("SUM_IZN_PERV_N".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sum_izn_perv_n != null) {
								anObject.sum_izn_perv_n = anObject.sum_izn_perv_n.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.sum_izn_perv_n);
							continue;
						}
						if("SUM_ST_PERV_N".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sum_st_perv_n != null) {
								anObject.sum_st_perv_n = anObject.sum_st_perv_n.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.sum_st_perv_n);
							continue;
						}
						if("KOD_ZATR".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.kod_zatr);
							continue;
						}
						if("KOD_OBORUD".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.kod_oborud);
							continue;
						}
						if("PRIMECHAN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.primechan);
							continue;
						}
						if("CHARACTERS".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.characters);
							continue;
						}
						if("ID_AMORT".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.id_amort);
							continue;
						}
						if("KOD_AMORT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.kod_amort);
							continue;
						}
						if("NAME_AMORT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.name_amort);
							continue;
						}
						if("KOD_AM".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.kod_am);
							continue;
						}
						if("NAME_AM".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.name_am);
							continue;
						}
						if("KOD_AM_N".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.kod_am_n);
							continue;
						}
						if("NAME_AM_N".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.name_am_n);
							continue;
						}
						if("USE_LIMIT".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.use_limit);
							continue;
						}
						if("USE_LIMIT_N".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.use_limit_n);
							continue;
						}
						if("PRIMECHAN_VYB".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.primechan_vyb);
							continue;
						}
						if("KOD_PRIZN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.kod_prizn);
							continue;
						}
						if("DATEPOSTING".compareTo((String)fields.get(i)) == 0) {
							if (anObject.datePosting == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.datePosting.getTime()));
							}
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
						if("ENBUILDINGREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.ENBuildingRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.ENBuildingRef.code);
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

	} // end of save(ENBuilding2OSData anObject,String[] anAttributes)


	public ENBuilding2OSDataShort getShortObject(int anObjectCode) throws PersistenceException {
		ENBuilding2OSData filterObject = new ENBuilding2OSData();
		Vector<ENBuilding2OSDataShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENBuilding2OSDataShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENBuilding2OSData filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.num_un, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.kod_inv, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.kod_nal_nakl, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.kod_ist, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name_ist, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.kod_subsch, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name_subsch, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.kod_vid, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name_vid, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.kod_privat, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name_privat, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.kod_gr, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name_gr, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.num_klass, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name_klass, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.f_amort, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dt_vypusk, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.sum_izn_perv, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.sum_izn_perv_n, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.sum_st_perv_n, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.kod_zatr, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.kod_oborud, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.primechan, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.characters, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.id_amort, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.kod_amort, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name_amort, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.kod_am, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name_am, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.kod_am_n, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name_am_n, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.use_limit, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.use_limit_n, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.primechan_vyb, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.kod_prizn, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.datePosting, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.ENBuildingRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENBuilding2OSDataFilter filter) {
		String out = buildCondition((ENBuilding2OSData)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENBuilding2OSData filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENBuilding2OSData.code_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.num_un, ENBuilding2OSData.num_un_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.kod_inv, ENBuilding2OSData.kod_inv_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.kod_nal_nakl, ENBuilding2OSData.kod_nal_nakl_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.kod_ist, ENBuilding2OSData.kod_ist_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name_ist, ENBuilding2OSData.name_ist_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.kod_subsch, ENBuilding2OSData.kod_subsch_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name_subsch, ENBuilding2OSData.name_subsch_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.kod_vid, ENBuilding2OSData.kod_vid_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name_vid, ENBuilding2OSData.name_vid_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.kod_privat, ENBuilding2OSData.kod_privat_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name_privat, ENBuilding2OSData.name_privat_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.kod_gr, ENBuilding2OSData.kod_gr_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name_gr, ENBuilding2OSData.name_gr_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.num_klass, ENBuilding2OSData.num_klass_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name_klass, ENBuilding2OSData.name_klass_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.f_amort, ENBuilding2OSData.f_amort_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dt_vypusk, ENBuilding2OSData.dt_vypusk_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.sum_izn_perv, ENBuilding2OSData.sum_izn_perv_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.sum_izn_perv_n, ENBuilding2OSData.sum_izn_perv_n_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.sum_st_perv_n, ENBuilding2OSData.sum_st_perv_n_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.kod_zatr, ENBuilding2OSData.kod_zatr_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.kod_oborud, ENBuilding2OSData.kod_oborud_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.primechan, ENBuilding2OSData.primechan_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.characters, ENBuilding2OSData.characters_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.id_amort, ENBuilding2OSData.id_amort_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.kod_amort, ENBuilding2OSData.kod_amort_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name_amort, ENBuilding2OSData.name_amort_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.kod_am, ENBuilding2OSData.kod_am_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name_am, ENBuilding2OSData.name_am_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.kod_am_n, ENBuilding2OSData.kod_am_n_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name_am_n, ENBuilding2OSData.name_am_n_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.use_limit, ENBuilding2OSData.use_limit_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.use_limit_n, ENBuilding2OSData.use_limit_n_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.primechan_vyb, ENBuilding2OSData.primechan_vyb_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.kod_prizn, ENBuilding2OSData.kod_prizn_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.datePosting, ENBuilding2OSData.datePosting_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENBuilding2OSData.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENBuilding2OSData.dateEdit_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENBuilding2OSData.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.ENBuildingRef.code, ENBuilding2OSData.ENBuildingRef_QFielld, out);
		}
		return out;
	}

	public ENBuilding2OSDataShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENBuilding2OSDataShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENBuilding2OSDataShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENBuilding2OSDataShortList getFilteredList(ENBuilding2OSData filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENBuilding2OSDataShortList getScrollableFilteredList(ENBuilding2OSData aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENBuilding2OSDataShortList getScrollableFilteredList(ENBuilding2OSData aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENBuilding2OSDataShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENBuilding2OSDataShortList getScrollableFilteredList(ENBuilding2OSDataFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENBuilding2OSDataShortList getScrollableFilteredList(ENBuilding2OSDataFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENBuilding2OSDataShortList getScrollableFilteredList(ENBuilding2OSData aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENBuilding2OSDataShortList result = new ENBuilding2OSDataShortList();
		ENBuilding2OSDataShort anObject;
		result.list = new Vector<ENBuilding2OSDataShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENBUILDING2OSDATA.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENBUILDING2OSDATA.CODE"+
			",ENBUILDING2OSDATA.NUM_UN"+
			",ENBUILDING2OSDATA.KOD_INV"+
			",ENBUILDING2OSDATA.KOD_NAL_NAKL"+
			",ENBUILDING2OSDATA.KOD_IST"+
			",ENBUILDING2OSDATA.NAME_IST"+
			",ENBUILDING2OSDATA.KOD_SUBSCH"+
			",ENBUILDING2OSDATA.NAME_SUBSCH"+
			",ENBUILDING2OSDATA.KOD_VID"+
			",ENBUILDING2OSDATA.NAME_VID"+
			",ENBUILDING2OSDATA.KOD_PRIVAT"+
			",ENBUILDING2OSDATA.NAME_PRIVAT"+
			",ENBUILDING2OSDATA.KOD_GR"+
			",ENBUILDING2OSDATA.NAME_GR"+
			",ENBUILDING2OSDATA.NUM_KLASS"+
			",ENBUILDING2OSDATA.NAME_KLASS"+
			",ENBUILDING2OSDATA.F_AMORT"+
			",ENBUILDING2OSDATA.DT_VYPUSK"+
			",ENBUILDING2OSDATA.SUM_IZN_PERV"+
			",ENBUILDING2OSDATA.SUM_IZN_PERV_N"+
			",ENBUILDING2OSDATA.SUM_ST_PERV_N"+
			",ENBUILDING2OSDATA.KOD_ZATR"+
			",ENBUILDING2OSDATA.KOD_OBORUD"+
			",ENBUILDING2OSDATA.PRIMECHAN"+
			",ENBUILDING2OSDATA.CHARACTERS"+
			",ENBUILDING2OSDATA.ID_AMORT"+
			",ENBUILDING2OSDATA.KOD_AMORT"+
			",ENBUILDING2OSDATA.NAME_AMORT"+
			",ENBUILDING2OSDATA.KOD_AM"+
			",ENBUILDING2OSDATA.NAME_AM"+
			",ENBUILDING2OSDATA.KOD_AM_N"+
			",ENBUILDING2OSDATA.NAME_AM_N"+
			",ENBUILDING2OSDATA.USE_LIMIT"+
			",ENBUILDING2OSDATA.USE_LIMIT_N"+
			",ENBUILDING2OSDATA.PRIMECHAN_VYB"+
			",ENBUILDING2OSDATA.KOD_PRIZN"+
			",ENBUILDING2OSDATA.DATEPOSTING"+
			",ENBUILDING2OSDATA.USERGEN"+
			",ENBUILDING2OSDATA.DATEEDIT"+
			", ENBUILDING.CODE " +
			", ENBUILDING.NUMBERGEN " +
			", ENBUILDING.DATEGEN " +
			", ENBUILDING.DATEEDIT " +
			", ENBUILDING.SUMMAGEN " +
			", ENBUILDING.SUMMANDS " +
			", ENBUILDING.CHARACTERISTIC " +
			", ENBUILDING.EXECUTEDPOSITION " +
			", ENBUILDING.EXECUTEDNAME " +
			", ENBUILDING.ACCEPTEDPOSITION " +
			", ENBUILDING.ACCEPTEDNAME " +
			", ENBUILDING.CONTRACTPRICE " +
			", ENBUILDING.CODEMOL " +
			", ENBUILDING.CODEPODR " +
			", ENBUILDING.INVNUMBEROZ " +
			", ENBUILDING.NAMEOZ " +
			", ENBUILDING.FINCONTRACTNUMBER " +
			", ENBUILDING.FINCONTRACTDATE " +
			", ENBUILDING.PARTNERNAME " +
			", ENBUILDING.PARTNERCODE " +
			", ENBUILDING.ISINVESTPROGRAM " +
			", ENBUILDING.YEARINVESTPROGRAM " +
			", ENBUILDING.ITEMINVESTPROGRAM " +
			", ENBUILDING.BUILDINGADDRESS " +
			", ENBUILDING.DECREENUMBER " +
			", ENBUILDING.DECREEDATE " +
			", ENBUILDING.EXPLOITATIONTERM " +
			", ENBUILDING.DATELOADEXPL " +
			", ENBUILDING.DATEBUILD " +
			", ENBUILDING.USERGEN " +
		" FROM ENBUILDING2OSDATA " +
			" LEFT JOIN ENBUILDING on ENBUILDING.CODE = ENBUILDING2OSDATA.ENBUILDINGREFCODE "+
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
				anObject = new ENBuilding2OSDataShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.num_un = set.getInt(2);
				if ( set.wasNull() ) {
					anObject.num_un = Integer.MIN_VALUE;
				}
				anObject.kod_inv = set.getString(3);
				anObject.kod_nal_nakl = set.getString(4);
				anObject.kod_ist = set.getString(5);
				anObject.name_ist = set.getString(6);
				anObject.kod_subsch = set.getString(7);
				anObject.name_subsch = set.getString(8);
				anObject.kod_vid = set.getString(9);
				anObject.name_vid = set.getString(10);
				anObject.kod_privat = set.getString(11);
				anObject.name_privat = set.getString(12);
				anObject.kod_gr = set.getString(13);
				anObject.name_gr = set.getString(14);
				anObject.num_klass = set.getInt(15);
				if ( set.wasNull() ) {
					anObject.num_klass = Integer.MIN_VALUE;
				}
				anObject.name_klass = set.getString(16);
				anObject.f_amort = set.getString(17);
				anObject.dt_vypusk = set.getDate(18);
				anObject.sum_izn_perv = set.getBigDecimal(19);
				if(anObject.sum_izn_perv != null) {
					anObject.sum_izn_perv = anObject.sum_izn_perv.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sum_izn_perv_n = set.getBigDecimal(20);
				if(anObject.sum_izn_perv_n != null) {
					anObject.sum_izn_perv_n = anObject.sum_izn_perv_n.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sum_st_perv_n = set.getBigDecimal(21);
				if(anObject.sum_st_perv_n != null) {
					anObject.sum_st_perv_n = anObject.sum_st_perv_n.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.kod_zatr = set.getString(22);
				anObject.kod_oborud = set.getString(23);
				anObject.primechan = set.getString(24);
				anObject.characters = set.getString(25);
				anObject.id_amort = set.getInt(26);
				if ( set.wasNull() ) {
					anObject.id_amort = Integer.MIN_VALUE;
				}
				anObject.kod_amort = set.getString(27);
				anObject.name_amort = set.getString(28);
				anObject.kod_am = set.getInt(29);
				if ( set.wasNull() ) {
					anObject.kod_am = Integer.MIN_VALUE;
				}
				anObject.name_am = set.getString(30);
				anObject.kod_am_n = set.getInt(31);
				if ( set.wasNull() ) {
					anObject.kod_am_n = Integer.MIN_VALUE;
				}
				anObject.name_am_n = set.getString(32);
				anObject.use_limit = set.getInt(33);
				if ( set.wasNull() ) {
					anObject.use_limit = Integer.MIN_VALUE;
				}
				anObject.use_limit_n = set.getInt(34);
				if ( set.wasNull() ) {
					anObject.use_limit_n = Integer.MIN_VALUE;
				}
				anObject.primechan_vyb = set.getString(35);
				anObject.kod_prizn = set.getString(36);
				anObject.datePosting = set.getDate(37);
				anObject.userGen = set.getString(38);
				anObject.dateEdit = set.getTimestamp(39);

				anObject.ENBuildingRefCode = set.getInt(40);
				if(set.wasNull()) {
					anObject.ENBuildingRefCode = Integer.MIN_VALUE;
				}
				anObject.ENBuildingRefNumbergen = set.getString(41);
				anObject.ENBuildingRefDateGen = set.getDate(42);
				anObject.ENBuildingRefDateEdit = set.getDate(43);
				anObject.ENBuildingRefSummaGen = set.getBigDecimal(44);
				if(anObject.ENBuildingRefSummaGen != null) {
					anObject.ENBuildingRefSummaGen = anObject.ENBuildingRefSummaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ENBuildingRefSummaNDS = set.getBigDecimal(45);
				if(anObject.ENBuildingRefSummaNDS != null) {
					anObject.ENBuildingRefSummaNDS = anObject.ENBuildingRefSummaNDS.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ENBuildingRefCharacteristic = set.getString(46);
				anObject.ENBuildingRefExecutedPosition = set.getString(47);
				anObject.ENBuildingRefExecutedName = set.getString(48);
				anObject.ENBuildingRefAcceptedPosition = set.getString(49);
				anObject.ENBuildingRefAcceptedName = set.getString(50);
				anObject.ENBuildingRefContractPrice = set.getBigDecimal(51);
				if(anObject.ENBuildingRefContractPrice != null) {
					anObject.ENBuildingRefContractPrice = anObject.ENBuildingRefContractPrice.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ENBuildingRefCodeMol = set.getString(52);
				anObject.ENBuildingRefCodePodr = set.getString(53);
				anObject.ENBuildingRefInvNumberOZ = set.getString(54);
				anObject.ENBuildingRefNameOZ = set.getString(55);
				anObject.ENBuildingRefFinContractNumber = set.getString(56);
				anObject.ENBuildingRefFinContractDate = set.getDate(57);
				anObject.ENBuildingRefPartnerName = set.getString(58);
				anObject.ENBuildingRefPartnerCode = set.getString(59);
				anObject.ENBuildingRefIsInvestProgram = set.getInt(60);
				if(set.wasNull()) {
					anObject.ENBuildingRefIsInvestProgram = Integer.MIN_VALUE;
				}
				anObject.ENBuildingRefYearInvestProgram = set.getString(61);
				anObject.ENBuildingRefItemInvestProgram = set.getString(62);
				anObject.ENBuildingRefBuildingAddress = set.getString(63);
				anObject.ENBuildingRefDecreeNumber = set.getString(64);
				anObject.ENBuildingRefDecreeDate = set.getDate(65);
				anObject.ENBuildingRefExploitationTerm = set.getInt(66);
				if(set.wasNull()) {
					anObject.ENBuildingRefExploitationTerm = Integer.MIN_VALUE;
				}
				anObject.ENBuildingRefDateLoadExpl = set.getDate(67);
				anObject.ENBuildingRefDateBuild = set.getDate(68);
				anObject.ENBuildingRefUserGen = set.getString(69);

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
	
	public int[] getFilteredCodeArray(ENBuilding2OSDataFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENBuilding2OSDataFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENBuilding2OSData aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENBUILDING2OSDATA.CODE FROM ENBUILDING2OSDATA";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENBUILDING2OSDATA.CODE";
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


	public ENBuilding2OSData getObject(int uid) throws PersistenceException {
		ENBuilding2OSData result = new ENBuilding2OSData();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENBuilding2OSData anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENBUILDING2OSDATA.CODE, ENBUILDING2OSDATA.NUM_UN, ENBUILDING2OSDATA.KOD_INV, ENBUILDING2OSDATA.KOD_NAL_NAKL, ENBUILDING2OSDATA.KOD_IST, ENBUILDING2OSDATA.NAME_IST, ENBUILDING2OSDATA.KOD_SUBSCH, ENBUILDING2OSDATA.NAME_SUBSCH, ENBUILDING2OSDATA.KOD_VID, ENBUILDING2OSDATA.NAME_VID, ENBUILDING2OSDATA.KOD_PRIVAT, ENBUILDING2OSDATA.NAME_PRIVAT, ENBUILDING2OSDATA.KOD_GR, ENBUILDING2OSDATA.NAME_GR, ENBUILDING2OSDATA.NUM_KLASS, ENBUILDING2OSDATA.NAME_KLASS, ENBUILDING2OSDATA.F_AMORT, ENBUILDING2OSDATA.DT_VYPUSK, ENBUILDING2OSDATA.SUM_IZN_PERV, ENBUILDING2OSDATA.SUM_IZN_PERV_N, ENBUILDING2OSDATA.SUM_ST_PERV_N, ENBUILDING2OSDATA.KOD_ZATR, ENBUILDING2OSDATA.KOD_OBORUD, ENBUILDING2OSDATA.PRIMECHAN, ENBUILDING2OSDATA.CHARACTERS, ENBUILDING2OSDATA.ID_AMORT, ENBUILDING2OSDATA.KOD_AMORT, ENBUILDING2OSDATA.NAME_AMORT, ENBUILDING2OSDATA.KOD_AM, ENBUILDING2OSDATA.NAME_AM, ENBUILDING2OSDATA.KOD_AM_N, ENBUILDING2OSDATA.NAME_AM_N, ENBUILDING2OSDATA.USE_LIMIT, ENBUILDING2OSDATA.USE_LIMIT_N, ENBUILDING2OSDATA.PRIMECHAN_VYB, ENBUILDING2OSDATA.KOD_PRIZN, ENBUILDING2OSDATA.DATEPOSTING, ENBUILDING2OSDATA.USERGEN, ENBUILDING2OSDATA.DATEEDIT, ENBUILDING2OSDATA.MODIFY_TIME, ENBUILDING2OSDATA.ENBUILDINGREFCODE "
			+" FROM ENBUILDING2OSDATA WHERE ENBUILDING2OSDATA.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.num_un = set.getInt(2);
				if (set.wasNull()) {
					anObject.num_un = Integer.MIN_VALUE;
				}
				anObject.kod_inv = set.getString(3);
				anObject.kod_nal_nakl = set.getString(4);
				anObject.kod_ist = set.getString(5);
				anObject.name_ist = set.getString(6);
				anObject.kod_subsch = set.getString(7);
				anObject.name_subsch = set.getString(8);
				anObject.kod_vid = set.getString(9);
				anObject.name_vid = set.getString(10);
				anObject.kod_privat = set.getString(11);
				anObject.name_privat = set.getString(12);
				anObject.kod_gr = set.getString(13);
				anObject.name_gr = set.getString(14);
				anObject.num_klass = set.getInt(15);
				if (set.wasNull()) {
					anObject.num_klass = Integer.MIN_VALUE;
				}
				anObject.name_klass = set.getString(16);
				anObject.f_amort = set.getString(17);
				anObject.dt_vypusk = set.getDate(18);
				anObject.sum_izn_perv = set.getBigDecimal(19);
				if(anObject.sum_izn_perv != null) {
					anObject.sum_izn_perv = anObject.sum_izn_perv.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sum_izn_perv_n = set.getBigDecimal(20);
				if(anObject.sum_izn_perv_n != null) {
					anObject.sum_izn_perv_n = anObject.sum_izn_perv_n.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sum_st_perv_n = set.getBigDecimal(21);
				if(anObject.sum_st_perv_n != null) {
					anObject.sum_st_perv_n = anObject.sum_st_perv_n.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.kod_zatr = set.getString(22);
				anObject.kod_oborud = set.getString(23);
				anObject.primechan = set.getString(24);
				anObject.characters = set.getString(25);
				anObject.id_amort = set.getInt(26);
				if (set.wasNull()) {
					anObject.id_amort = Integer.MIN_VALUE;
				}
				anObject.kod_amort = set.getString(27);
				anObject.name_amort = set.getString(28);
				anObject.kod_am = set.getInt(29);
				if (set.wasNull()) {
					anObject.kod_am = Integer.MIN_VALUE;
				}
				anObject.name_am = set.getString(30);
				anObject.kod_am_n = set.getInt(31);
				if (set.wasNull()) {
					anObject.kod_am_n = Integer.MIN_VALUE;
				}
				anObject.name_am_n = set.getString(32);
				anObject.use_limit = set.getInt(33);
				if (set.wasNull()) {
					anObject.use_limit = Integer.MIN_VALUE;
				}
				anObject.use_limit_n = set.getInt(34);
				if (set.wasNull()) {
					anObject.use_limit_n = Integer.MIN_VALUE;
				}
				anObject.primechan_vyb = set.getString(35);
				anObject.kod_prizn = set.getString(36);
				anObject.datePosting = set.getDate(37);
				anObject.userGen = set.getString(38);
				anObject.dateEdit = set.getTimestamp(39);
				anObject.modify_time = set.getLong(40);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.ENBuildingRef.code = set.getInt(41);
				if (set.wasNull()) {
					anObject.ENBuildingRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENBuilding2OSDataRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENBuilding2OSDataRef ref = new com.ksoe.energynet.valueobject.references.ENBuilding2OSDataRef();
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

		selectStr = "DELETE FROM  ENBUILDING2OSDATA WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENBuilding2OSData object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENBuilding2OSData.getObject%} access denied");
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
	
	public long count(ENBuilding2OSDataFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENBuilding2OSDataFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENBuilding2OSDataFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENBUILDING2OSDATA", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENBUILDING2OSDATA WHERE code = ?", propertyName);
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

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENBuilding2OSDataFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENBUILDING2OSDATA");
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
			"SELECT  ENBUILDING2OSDATA.CODE FROM  ENBUILDING2OSDATA WHERE  ENBUILDING2OSDATA.CODE = ?";
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
		_checkConditionToken(condition,"code","ENBUILDING2OSDATA.CODE");
		_checkConditionToken(condition,"num_un","ENBUILDING2OSDATA.NUM_UN");
		_checkConditionToken(condition,"kod_inv","ENBUILDING2OSDATA.KOD_INV");
		_checkConditionToken(condition,"kod_nal_nakl","ENBUILDING2OSDATA.KOD_NAL_NAKL");
		_checkConditionToken(condition,"kod_ist","ENBUILDING2OSDATA.KOD_IST");
		_checkConditionToken(condition,"name_ist","ENBUILDING2OSDATA.NAME_IST");
		_checkConditionToken(condition,"kod_subsch","ENBUILDING2OSDATA.KOD_SUBSCH");
		_checkConditionToken(condition,"name_subsch","ENBUILDING2OSDATA.NAME_SUBSCH");
		_checkConditionToken(condition,"kod_vid","ENBUILDING2OSDATA.KOD_VID");
		_checkConditionToken(condition,"name_vid","ENBUILDING2OSDATA.NAME_VID");
		_checkConditionToken(condition,"kod_privat","ENBUILDING2OSDATA.KOD_PRIVAT");
		_checkConditionToken(condition,"name_privat","ENBUILDING2OSDATA.NAME_PRIVAT");
		_checkConditionToken(condition,"kod_gr","ENBUILDING2OSDATA.KOD_GR");
		_checkConditionToken(condition,"name_gr","ENBUILDING2OSDATA.NAME_GR");
		_checkConditionToken(condition,"num_klass","ENBUILDING2OSDATA.NUM_KLASS");
		_checkConditionToken(condition,"name_klass","ENBUILDING2OSDATA.NAME_KLASS");
		_checkConditionToken(condition,"f_amort","ENBUILDING2OSDATA.F_AMORT");
		_checkConditionToken(condition,"dt_vypusk","ENBUILDING2OSDATA.DT_VYPUSK");
		_checkConditionToken(condition,"sum_izn_perv","ENBUILDING2OSDATA.SUM_IZN_PERV");
		_checkConditionToken(condition,"sum_izn_perv_n","ENBUILDING2OSDATA.SUM_IZN_PERV_N");
		_checkConditionToken(condition,"sum_st_perv_n","ENBUILDING2OSDATA.SUM_ST_PERV_N");
		_checkConditionToken(condition,"kod_zatr","ENBUILDING2OSDATA.KOD_ZATR");
		_checkConditionToken(condition,"kod_oborud","ENBUILDING2OSDATA.KOD_OBORUD");
		_checkConditionToken(condition,"primechan","ENBUILDING2OSDATA.PRIMECHAN");
		_checkConditionToken(condition,"characters","ENBUILDING2OSDATA.CHARACTERS");
		_checkConditionToken(condition,"id_amort","ENBUILDING2OSDATA.ID_AMORT");
		_checkConditionToken(condition,"kod_amort","ENBUILDING2OSDATA.KOD_AMORT");
		_checkConditionToken(condition,"name_amort","ENBUILDING2OSDATA.NAME_AMORT");
		_checkConditionToken(condition,"kod_am","ENBUILDING2OSDATA.KOD_AM");
		_checkConditionToken(condition,"name_am","ENBUILDING2OSDATA.NAME_AM");
		_checkConditionToken(condition,"kod_am_n","ENBUILDING2OSDATA.KOD_AM_N");
		_checkConditionToken(condition,"name_am_n","ENBUILDING2OSDATA.NAME_AM_N");
		_checkConditionToken(condition,"use_limit","ENBUILDING2OSDATA.USE_LIMIT");
		_checkConditionToken(condition,"use_limit_n","ENBUILDING2OSDATA.USE_LIMIT_N");
		_checkConditionToken(condition,"primechan_vyb","ENBUILDING2OSDATA.PRIMECHAN_VYB");
		_checkConditionToken(condition,"kod_prizn","ENBUILDING2OSDATA.KOD_PRIZN");
		_checkConditionToken(condition,"dateposting","ENBUILDING2OSDATA.DATEPOSTING");
		_checkConditionToken(condition,"usergen","ENBUILDING2OSDATA.USERGEN");
		_checkConditionToken(condition,"dateedit","ENBUILDING2OSDATA.DATEEDIT");
		_checkConditionToken(condition,"modify_time","ENBUILDING2OSDATA.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"enbuildingref","ENBUILDINGREFCODE");
		_checkConditionToken(condition,"enbuildingref.code","ENBUILDINGREFCODE");
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
	
	private void _collectAutoIncrementFields(ENBuilding2OSData anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENBUILDING2OSDATA", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENBUILDING2OSDATA", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENBUILDING2OSDATA", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENBUILDING2OSDATA");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENBuilding2OSDataDAO
