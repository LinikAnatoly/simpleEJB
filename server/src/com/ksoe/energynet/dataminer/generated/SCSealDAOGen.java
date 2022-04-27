
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
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
import com.ksoe.energynet.valueobject.SCSeal;
import com.ksoe.energynet.valueobject.filter.SCSealFilter;
import com.ksoe.energynet.valueobject.brief.SCSealShort;
import com.ksoe.energynet.valueobject.lists.SCSealShortList;


/**
 * DAO Object for SCSeal;
 *
 */

public class SCSealDAOGen extends GenericDataMiner {

	public SCSealDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public SCSealDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(SCSeal inObject) throws PersistenceException {
		SCSeal obj = new SCSeal();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.invNumber == null && obj.invNumber == null){}
		else
			if(inObject.invNumber == null || obj.invNumber == null) return false;
			else
				if ( ! inObject.invNumber.equals(obj.invNumber)){
					return false;
				}

		if(inObject.name == null && obj.name == null){}
		else
			if(inObject.name == null || obj.name == null) return false;
			else
				if ( ! inObject.name.equals(obj.name)){
					return false;
				}

		if(inObject.buildNumber == null && obj.buildNumber == null){}
		else
			if(inObject.buildNumber == null || obj.buildNumber == null) return false;
			else
				if ( ! inObject.buildNumber.equals(obj.buildNumber)){
					return false;
				}

		if(inObject.account == null && obj.account == null){}
		else
			if(inObject.account == null || obj.account == null) return false;
			else
				if ( ! inObject.account.equals(obj.account)){
					return false;
				}

		if(inObject.departmetFKCode == null && obj.departmetFKCode == null){}
		else
			if(inObject.departmetFKCode == null || obj.departmetFKCode == null) return false;
			else
				if ( ! inObject.departmetFKCode.equals(obj.departmetFKCode)){
					return false;
				}

		if(inObject.molCode == null && obj.molCode == null){}
		else
			if(inObject.molCode == null || obj.molCode == null) return false;
			else
				if ( ! inObject.molCode.equals(obj.molCode)){
					return false;
				}

		if(inObject.molName == null && obj.molName == null){}
		else
			if(inObject.molName == null || obj.molName == null) return false;
			else
				if ( ! inObject.molName.equals(obj.molName)){
					return false;
				}

		if(inObject.dateIn == null && obj.dateIn == null){} else 
			if(inObject.dateIn == null || obj.dateIn == null) return false;
			else
				if (inObject.dateIn.compareTo(obj.dateIn) != 0){
					return false;
				}

		if(inObject.dateBuild == null && obj.dateBuild == null){} else 
			if(inObject.dateBuild == null || obj.dateBuild == null) return false;
			else
				if (inObject.dateBuild.compareTo(obj.dateBuild) != 0){
					return false;
				}

		if(inObject.cost == null && obj.cost == null){}
		else
			if(inObject.cost == null || obj.cost == null) return false;
			else
				if ( ! inObject.cost.equals(obj.cost)){
					return false;
				}

		if (inObject.scCode != obj.scCode){
					return false;
				}

		if(inObject.installOrderNumber == null && obj.installOrderNumber == null){}
		else
			if(inObject.installOrderNumber == null || obj.installOrderNumber == null) return false;
			else
				if ( ! inObject.installOrderNumber.equals(obj.installOrderNumber)){
					return false;
				}

		if(inObject.costOld == null && obj.costOld == null){}
		else
			if(inObject.costOld == null || obj.costOld == null) return false;
			else
				if ( ! inObject.costOld.equals(obj.costOld)){
					return false;
				}

		if(inObject.commentGen == null && obj.commentGen == null){}
		else
			if(inObject.commentGen == null || obj.commentGen == null) return false;
			else
				if ( ! inObject.commentGen.equals(obj.commentGen)){
					return false;
				}

		if(inObject.userAdd == null && obj.userAdd == null){}
		else
			if(inObject.userAdd == null || obj.userAdd == null) return false;
			else
				if ( ! inObject.userAdd.equals(obj.userAdd)){
					return false;
				}

		if(inObject.dateAdd == null && obj.dateAdd == null){} else 
			if(inObject.dateAdd == null || obj.dateAdd == null) return false;
			else
				if (inObject.dateAdd.compareTo(obj.dateAdd) != 0){
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
		if (inObject.typeRef.code != obj.typeRef.code){
			return false;
		}
		if (inObject.statusRef.code != obj.statusRef.code){
			return false;
		}
		if (inObject.estimateItemRef.code != obj.estimateItemRef.code){
			return false;
		}
		if (inObject.lockTypeRef.code != obj.lockTypeRef.code){
			return false;
		}
		if (inObject.zoneRef.code != obj.zoneRef.code){
			return false;
		}
		return true;
	}

	public int add(SCSeal anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(SCSeal anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO SCSEAL (CODE,INVNUMBER,NAME,BUILDNUMBER,ACCOUNT,DEPARTMETFKCODE,MOLCODE,MOLNAME,DATEIN,DATEBUILD,COST,SCCODE,INSTALLORDERNUMBER,COSTOLD,COMMENTGEN,MODIFY_TIME,USERADD,DATEADD,USERGEN,DATEEDIT,TYPEREFCODE,STATUSREFCODE,ESTIMATEITEMREFCODE,LOCKTYPEREFCODE,ZONEREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			statement.setString(2,anObject.invNumber);
			statement.setString(3,anObject.name);
			statement.setString(4,anObject.buildNumber);
			statement.setString(5,anObject.account);
			statement.setString(6,anObject.departmetFKCode);
			statement.setString(7,anObject.molCode);
			statement.setString(8,anObject.molName);
			if (anObject.dateIn == null) {
				statement.setDate(9,null);
			} else {
				statement.setDate(9,new java.sql.Date(anObject.dateIn.getTime()));
			}
			if (anObject.dateBuild == null) {
				statement.setDate(10,null);
			} else {
				statement.setDate(10,new java.sql.Date(anObject.dateBuild.getTime()));
			}
			if (anObject.cost != null) {
				anObject.cost = anObject.cost.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(11,anObject.cost);
			if (anObject.scCode != Integer.MIN_VALUE ) {
				statement.setInt(12,anObject.scCode);
			} else {
				statement.setNull(12,java.sql.Types.INTEGER);
			}
			statement.setString(13,anObject.installOrderNumber);
			if (anObject.costOld != null) {
				anObject.costOld = anObject.costOld.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(14,anObject.costOld);
			statement.setString(15,anObject.commentGen);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(16,null);
			} else {
				statement.setBigDecimal(16,new java.math.BigDecimal(anObject.modify_time));
			}
			statement.setString(17,anObject.userAdd);
			if (anObject.dateAdd == null) {
				statement.setTimestamp(18,null);
			} else {
				statement.setTimestamp(18,new java.sql.Timestamp(anObject.dateAdd.getTime()));
			}
			statement.setString(19,anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(20,null);
			} else {
				statement.setTimestamp(20,new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.typeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.SCSealTypeDAOGen(connection,getUserProfile()).exists(anObject.typeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.SCSeal.typeRef.code%} = {%"+anObject.typeRef.code+"%}");
				}
				statement.setInt(21,anObject.typeRef.code);
			} else {
				statement.setNull(21,java.sql.Types.INTEGER);
			}
			if (anObject.statusRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.SCSealStatusDAOGen(connection,getUserProfile()).exists(anObject.statusRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.SCSeal.statusRef.code%} = {%"+anObject.statusRef.code+"%}");
				}
				statement.setInt(22,anObject.statusRef.code);
			} else {
				statement.setNull(22,java.sql.Types.INTEGER);
			}
			if (anObject.estimateItemRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENEstimateItemDAOGen(connection,getUserProfile()).exists(anObject.estimateItemRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.SCSeal.estimateItemRef.code%} = {%"+anObject.estimateItemRef.code+"%}");
				}
				statement.setInt(23,anObject.estimateItemRef.code);
			} else {
				statement.setNull(23,java.sql.Types.INTEGER);
			}
			if (anObject.lockTypeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.SCSealLockTypeDAOGen(connection,getUserProfile()).exists(anObject.lockTypeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.SCSeal.lockTypeRef.code%} = {%"+anObject.lockTypeRef.code+"%}");
				}
				statement.setInt(24,anObject.lockTypeRef.code);
			} else {
				statement.setNull(24,java.sql.Types.INTEGER);
			}
			if (anObject.zoneRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.rqorder.dataminer.generated.RQStorageZoneDAOGen(connection,getUserProfile()).exists(anObject.zoneRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.rqorder.valueobject.SCSeal.zoneRef.code%} = {%"+anObject.zoneRef.code+"%}");
				}
				statement.setInt(25,anObject.zoneRef.code);
			} else {
				statement.setNull(25,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%SCSealDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(SCSeal anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(SCSeal anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			SCSeal oldObject = new SCSeal();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+SCSeal.modify_time_Field+" FROM  SCSEAL WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("INVNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BUILDNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCOUNT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DEPARTMETFKCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MOLCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MOLNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEIN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEBUILD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COST") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SCCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("INSTALLORDERNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COSTOLD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COMMENTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USERADD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEADD") == 0) {
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
					if(fieldNameStr.compareTo("TYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("STATUSREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ESTIMATEITEMREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("LOCKTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ZONEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE SCSEAL SET  INVNUMBER = ? , NAME = ? , BUILDNUMBER = ? , ACCOUNT = ? , DEPARTMETFKCODE = ? , MOLCODE = ? , MOLNAME = ? , DATEIN = ? , DATEBUILD = ? , COST = ? , SCCODE = ? , INSTALLORDERNUMBER = ? , COSTOLD = ? , COMMENTGEN = ? , MODIFY_TIME = ? , USERADD = ? , DATEADD = ? , USERGEN = ? , DATEEDIT = ? , TYPEREFCODE = ? , STATUSREFCODE = ? , ESTIMATEITEMREFCODE = ? , LOCKTYPEREFCODE = ? , ZONEREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE SCSEAL SET ";
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
					statement.setString(1,anObject.invNumber);
					statement.setString(2,anObject.name);
					statement.setString(3,anObject.buildNumber);
					statement.setString(4,anObject.account);
					statement.setString(5,anObject.departmetFKCode);
					statement.setString(6,anObject.molCode);
					statement.setString(7,anObject.molName);
					if (anObject.dateIn == null) {
						statement.setDate(8,null);
					} else {
						statement.setDate(8,new java.sql.Date(anObject.dateIn.getTime()));
					}
					if (anObject.dateBuild == null) {
						statement.setDate(9,null);
					} else {
						statement.setDate(9,new java.sql.Date(anObject.dateBuild.getTime()));
					}
					if (anObject.cost != null) {
						anObject.cost = anObject.cost.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(10,anObject.cost);
					if (anObject.scCode != Integer.MIN_VALUE) {
						statement.setInt(11,anObject.scCode);
					} else {
						statement.setNull(11,java.sql.Types.INTEGER);
					}
					statement.setString(12,anObject.installOrderNumber);
					if (anObject.costOld != null) {
						anObject.costOld = anObject.costOld.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(13,anObject.costOld);
					statement.setString(14,anObject.commentGen);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(15,null);
					} else {
						statement.setBigDecimal(15,new java.math.BigDecimal(anObject.modify_time));
					}
					statement.setString(16,anObject.userAdd);
					if (anObject.dateAdd == null) {
						statement.setTimestamp(17,null);
					} else {
						statement.setTimestamp(17,new java.sql.Timestamp(anObject.dateAdd.getTime()));
					}
					statement.setString(18,anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(19,null);
					} else {
						statement.setTimestamp(19,new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.typeRef.code != Integer.MIN_VALUE) {
						statement.setInt(20,anObject.typeRef.code);
					} else {
						statement.setNull(20,java.sql.Types.INTEGER);
					}
					if (anObject.statusRef.code != Integer.MIN_VALUE) {
						statement.setInt(21,anObject.statusRef.code);
					} else {
						statement.setNull(21,java.sql.Types.INTEGER);
					}
					if (anObject.estimateItemRef.code != Integer.MIN_VALUE) {
						statement.setInt(22,anObject.estimateItemRef.code);
					} else {
						statement.setNull(22,java.sql.Types.INTEGER);
					}
					if (anObject.lockTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(23,anObject.lockTypeRef.code);
					} else {
						statement.setNull(23,java.sql.Types.INTEGER);
					}
					if (anObject.zoneRef.code != Integer.MIN_VALUE) {
						statement.setInt(24,anObject.zoneRef.code);
					} else {
						statement.setNull(24,java.sql.Types.INTEGER);
					}
					statement.setInt(25,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("INVNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.invNumber);
							continue;
						}
						if("NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.name);
							continue;
						}
						if("BUILDNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.buildNumber);
							continue;
						}
						if("ACCOUNT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.account);
							continue;
						}
						if("DEPARTMETFKCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.departmetFKCode);
							continue;
						}
						if("MOLCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.molCode);
							continue;
						}
						if("MOLNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.molName);
							continue;
						}
						if("DATEIN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateIn == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.dateIn.getTime()));
							}
							continue;
						}
						if("DATEBUILD".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateBuild == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.dateBuild.getTime()));
							}
							continue;
						}
						if("COST".compareTo((String)fields.get(i)) == 0) {
							if (anObject.cost != null) {
								anObject.cost = anObject.cost.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.cost);
							continue;
						}
						if("SCCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.scCode);
							continue;
						}
						if("INSTALLORDERNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.installOrderNumber);
							continue;
						}
						if("COSTOLD".compareTo((String)fields.get(i)) == 0) {
							if (anObject.costOld != null) {
								anObject.costOld = anObject.costOld.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.costOld);
							continue;
						}
						if("COMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.commentGen);
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
						if("USERADD".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.userAdd);
							continue;
						}
						if("DATEADD".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateAdd == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateAdd.getTime()));
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
						if("TYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.typeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.typeRef.code);
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
						if("ESTIMATEITEMREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.estimateItemRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.estimateItemRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("LOCKTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.lockTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.lockTypeRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("ZONEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.zoneRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.zoneRef.code);
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

	} // end of save(SCSeal anObject,String[] anAttributes)


	public SCSealShort getShortObject(int anObjectCode) throws PersistenceException {
		SCSeal filterObject = new SCSeal();
		Vector<SCSealShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (SCSealShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(SCSeal filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.invNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.buildNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.account, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.departmetFKCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.molCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.molName, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateIn, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateBuild, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.cost, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.scCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.installOrderNumber, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.costOld, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userAdd, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateAdd, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.typeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.statusRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.estimateItemRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.lockTypeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.zoneRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(SCSealFilter filter) {
		String out = buildCondition((SCSeal)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(SCSeal filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, SCSeal.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.invNumber, SCSeal.invNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name, SCSeal.name_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.buildNumber, SCSeal.buildNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.account, SCSeal.account_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.departmetFKCode, SCSeal.departmetFKCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.molCode, SCSeal.molCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.molName, SCSeal.molName_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateIn, SCSeal.dateIn_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateBuild, SCSeal.dateBuild_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.cost, SCSeal.cost_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.scCode, SCSeal.scCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.installOrderNumber, SCSeal.installOrderNumber_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.costOld, SCSeal.costOld_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentGen, SCSeal.commentGen_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, SCSeal.modify_time_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userAdd, SCSeal.userAdd_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateAdd, SCSeal.dateAdd_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, SCSeal.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, SCSeal.dateEdit_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.typeRef.code, SCSeal.typeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.statusRef.code, SCSeal.statusRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.estimateItemRef.code, SCSeal.estimateItemRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.lockTypeRef.code, SCSeal.lockTypeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.zoneRef.code, SCSeal.zoneRef_QFielld, out);
		}
		return out;
	}

	public SCSealShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public SCSealShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public SCSealShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public SCSealShortList getFilteredList(SCSeal filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public SCSealShortList getScrollableFilteredList(SCSeal aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public SCSealShortList getScrollableFilteredList(SCSeal aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public SCSealShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public SCSealShortList getScrollableFilteredList(SCSealFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public SCSealShortList getScrollableFilteredList(SCSealFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public SCSealShortList getScrollableFilteredList(SCSeal aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		SCSealShortList result = new SCSealShortList();
		SCSealShort anObject;
		result.list = new Vector<SCSealShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "SCSEAL.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"SCSEAL.CODE"+
			",SCSEAL.INVNUMBER"+
			",SCSEAL.NAME"+
			",SCSEAL.BUILDNUMBER"+
			",SCSEAL.ACCOUNT"+
			",SCSEAL.DEPARTMETFKCODE"+
			",SCSEAL.MOLCODE"+
			",SCSEAL.MOLNAME"+
			",SCSEAL.DATEIN"+
			",SCSEAL.DATEBUILD"+
			",SCSEAL.COST"+
			",SCSEAL.SCCODE"+
			",SCSEAL.INSTALLORDERNUMBER"+
			",SCSEAL.COSTOLD"+
			",SCSEAL.USERADD"+
			",SCSEAL.DATEADD"+
			",SCSEAL.USERGEN"+
			",SCSEAL.DATEEDIT"+
			", SCSEALTYPE.CODE " +
			", SCSEALTYPE.NAME " +
			", SCSEALSTATUS.CODE " +
			", SCSEALSTATUS.NAME " +
			", ENESTIMATEITEM.CODE " +
			", ENESTIMATEITEM.COUNTGEN " +
			", ENESTIMATEITEM.COUNTFACT " +
			", ENESTIMATEITEM.PRICE " +
			", ENESTIMATEITEM.PRICEVRTU " +
			", ENESTIMATEITEM.COST " +
			", ENESTIMATEITEM.ISUSEVAT " +
			", ENESTIMATEITEM.DELIVERYTIME " +
			", ENESTIMATEITEM.USEWORKTIME " +
			", ENESTIMATEITEM.USERGEN " +
			", ENESTIMATEITEM.DATEEDIT " +
			", SCSEALLOCKTYPE.CODE " +
			", SCSEALLOCKTYPE.NAME " +
			", RQSTORAGEZONE.CODE " +
			", RQSTORAGEZONE.NAME " +
		" FROM SCSEAL " +
			", SCSEALTYPE " +
			", SCSEALSTATUS " +
			", ENESTIMATEITEM " +
			", SCSEALLOCKTYPE " +
			", RQSTORAGEZONE " +
		"";
		whereStr = " SCSEALTYPE.CODE = SCSEAL.TYPEREFCODE" ; //+
		whereStr += " AND SCSEALSTATUS.CODE = SCSEAL.STATUSREFCODE" ; //+
		whereStr += " AND ENESTIMATEITEM.CODE = SCSEAL.ESTIMATEITEMREFCODE" ; //+
		whereStr += " AND SCSEALLOCKTYPE.CODE = SCSEAL.LOCKTYPEREFCODE" ; //+
		whereStr += " AND RQSTORAGEZONE.CODE = SCSEAL.ZONEREFCODE" ; //+

	
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
				anObject = new SCSealShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.invNumber = set.getString(2);
				anObject.name = set.getString(3);
				anObject.buildNumber = set.getString(4);
				anObject.account = set.getString(5);
				anObject.departmetFKCode = set.getString(6);
				anObject.molCode = set.getString(7);
				anObject.molName = set.getString(8);
				anObject.dateIn = set.getDate(9);
				anObject.dateBuild = set.getDate(10);
				anObject.cost = set.getBigDecimal(11);
				if(anObject.cost != null) {
					anObject.cost = anObject.cost.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.scCode = set.getInt(12);
				if ( set.wasNull() ) {
					anObject.scCode = Integer.MIN_VALUE;
				}
				anObject.installOrderNumber = set.getString(13);
				anObject.costOld = set.getBigDecimal(14);
				if(anObject.costOld != null) {
					anObject.costOld = anObject.costOld.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.userAdd = set.getString(15);
				anObject.dateAdd = set.getTimestamp(16);
				anObject.userGen = set.getString(17);
				anObject.dateEdit = set.getTimestamp(18);

				anObject.typeRefCode = set.getInt(19);
				if(set.wasNull()) {
					anObject.typeRefCode = Integer.MIN_VALUE;
				}
				anObject.typeRefName = set.getString(20);
				anObject.statusRefCode = set.getInt(21);
				if(set.wasNull()) {
					anObject.statusRefCode = Integer.MIN_VALUE;
				}
				anObject.statusRefName = set.getString(22);
				anObject.estimateItemRefCode = set.getInt(23);
				if(set.wasNull()) {
					anObject.estimateItemRefCode = Integer.MIN_VALUE;
				}
				anObject.estimateItemRefCountGen = set.getBigDecimal(24);
				if(anObject.estimateItemRefCountGen != null) {
					anObject.estimateItemRefCountGen = anObject.estimateItemRefCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.estimateItemRefCountFact = set.getBigDecimal(25);
				if(anObject.estimateItemRefCountFact != null) {
					anObject.estimateItemRefCountFact = anObject.estimateItemRefCountFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.estimateItemRefPrice = set.getBigDecimal(26);
				if(anObject.estimateItemRefPrice != null) {
					anObject.estimateItemRefPrice = anObject.estimateItemRefPrice.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				/*anObject.estimateItemRefPriceVRTU = set.getBigDecimal(27);
				if(anObject.estimateItemRefPriceVRTU != null) {
					anObject.estimateItemRefPriceVRTU = anObject.estimateItemRefPriceVRTU.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}*/
				anObject.estimateItemRefCost = set.getBigDecimal(28);
				if(anObject.estimateItemRefCost != null) {
					anObject.estimateItemRefCost = anObject.estimateItemRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.estimateItemRefIsUseVAT = set.getInt(29);
				if(set.wasNull()) {
					anObject.estimateItemRefIsUseVAT = Integer.MIN_VALUE;
				}
				anObject.estimateItemRefDeliveryTime = set.getInt(30);
				if(set.wasNull()) {
					anObject.estimateItemRefDeliveryTime = Integer.MIN_VALUE;
				}
				anObject.estimateItemRefUseWorkTime = set.getInt(31);
				if(set.wasNull()) {
					anObject.estimateItemRefUseWorkTime = Integer.MIN_VALUE;
				}
				anObject.estimateItemRefUserGen = set.getString(32);
				anObject.estimateItemRefDateEdit = set.getDate(33);
				anObject.lockTypeRefCode = set.getInt(34);
				if(set.wasNull()) {
					anObject.lockTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.lockTypeRefName = set.getString(35);
				anObject.zoneRefCode = set.getInt(36);
				if(set.wasNull()) {
					anObject.zoneRefCode = Integer.MIN_VALUE;
				}
				anObject.zoneRefName = set.getString(37);

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
	
	public int[] getFilteredCodeArray(SCSealFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(SCSealFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(SCSeal aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT SCSEAL.CODE FROM SCSEAL";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "SCSEAL.CODE";
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
				if(i < fromPosition) {
					continue;
				} else if(i >= fromPosition + quantity) {
					i++;
					break;
				}
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

	public SCSeal getObject(int uid) throws PersistenceException {
		SCSeal result = new SCSeal();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(SCSeal anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  SCSEAL.CODE, SCSEAL.INVNUMBER, SCSEAL.NAME, SCSEAL.BUILDNUMBER, SCSEAL.ACCOUNT, SCSEAL.DEPARTMETFKCODE, SCSEAL.MOLCODE, SCSEAL.MOLNAME, SCSEAL.DATEIN, SCSEAL.DATEBUILD, SCSEAL.COST, SCSEAL.SCCODE, SCSEAL.INSTALLORDERNUMBER, SCSEAL.COSTOLD, SCSEAL.COMMENTGEN, SCSEAL.MODIFY_TIME, SCSEAL.USERADD, SCSEAL.DATEADD, SCSEAL.USERGEN, SCSEAL.DATEEDIT, SCSEAL.TYPEREFCODE, SCSEAL.STATUSREFCODE, SCSEAL.ESTIMATEITEMREFCODE, SCSEAL.LOCKTYPEREFCODE, SCSEAL.ZONEREFCODE "
			+" FROM SCSEAL WHERE SCSEAL.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.invNumber = set.getString(2);
				anObject.name = set.getString(3);
				anObject.buildNumber = set.getString(4);
				anObject.account = set.getString(5);
				anObject.departmetFKCode = set.getString(6);
				anObject.molCode = set.getString(7);
				anObject.molName = set.getString(8);
				anObject.dateIn = set.getDate(9);
				anObject.dateBuild = set.getDate(10);
				anObject.cost = set.getBigDecimal(11);
				if(anObject.cost != null) {
					anObject.cost = anObject.cost.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.scCode = set.getInt(12);
				if (set.wasNull()) {
					anObject.scCode = Integer.MIN_VALUE;
				}
				anObject.installOrderNumber = set.getString(13);
				anObject.costOld = set.getBigDecimal(14);
				if(anObject.costOld != null) {
					anObject.costOld = anObject.costOld.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.commentGen = set.getString(15);
				anObject.modify_time = set.getLong(16);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.userAdd = set.getString(17);
				anObject.dateAdd = set.getTimestamp(18);
				anObject.userGen = set.getString(19);
				anObject.dateEdit = set.getTimestamp(20);
				anObject.typeRef.code = set.getInt(21);
				if (set.wasNull()) {
					anObject.typeRef.code = Integer.MIN_VALUE;
				}
				anObject.statusRef.code = set.getInt(22);
				if (set.wasNull()) {
					anObject.statusRef.code = Integer.MIN_VALUE;
				}
				anObject.estimateItemRef.code = set.getInt(23);
				if (set.wasNull()) {
					anObject.estimateItemRef.code = Integer.MIN_VALUE;
				}
				anObject.lockTypeRef.code = set.getInt(24);
				if (set.wasNull()) {
					anObject.lockTypeRef.code = Integer.MIN_VALUE;
				}
				anObject.zoneRef.code = set.getInt(25);
				if (set.wasNull()) {
					anObject.zoneRef.code = Integer.MIN_VALUE;
				}
				if(anObject.typeRef.code != Integer.MIN_VALUE) {
					anObject.setTypeRef(
						new com.ksoe.energynet.dataminer.generated.SCSealTypeDAOGen(connection,getUserProfile()).getRef(anObject.typeRef.code));
				}
				if(anObject.statusRef.code != Integer.MIN_VALUE) {
					anObject.setStatusRef(
						new com.ksoe.energynet.dataminer.generated.SCSealStatusDAOGen(connection,getUserProfile()).getRef(anObject.statusRef.code));
				}
				if(anObject.estimateItemRef.code != Integer.MIN_VALUE) {
					anObject.setEstimateItemRef(
						new com.ksoe.energynet.dataminer.generated.ENEstimateItemDAOGen(connection,getUserProfile()).getRef(anObject.estimateItemRef.code));
				}
				if(anObject.lockTypeRef.code != Integer.MIN_VALUE) {
					anObject.setLockTypeRef(
						new com.ksoe.energynet.dataminer.generated.SCSealLockTypeDAOGen(connection,getUserProfile()).getRef(anObject.lockTypeRef.code));
				}
				if(anObject.zoneRef.code != Integer.MIN_VALUE) {
					anObject.setZoneRef(
						new com.ksoe.rqorder.dataminer.generated.RQStorageZoneDAOGen(connection,getUserProfile()).getRef(anObject.zoneRef.code));
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


	public com.ksoe.energynet.valueobject.references.SCSealRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.SCSealRef ref = new com.ksoe.energynet.valueobject.references.SCSealRef();
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

		selectStr = "DELETE FROM  SCSEAL WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		SCSeal object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%SCSeal.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(SCSeal.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%SCSeal.remove%} access denied");
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
	
	public long count(SCSealFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(SCSealFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, SCSealFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM SCSEAL", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, SCSealFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "SCSEAL");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(SCSeal.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%SCSeal.getObject%} access denied");
		}

		selectStr =
			"SELECT  SCSEAL.CODE FROM  SCSEAL WHERE  SCSEAL.CODE = ?";
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
		_checkConditionToken(condition,"code","SCSEAL.CODE");
		_checkConditionToken(condition,"invnumber","SCSEAL.INVNUMBER");
		_checkConditionToken(condition,"name","SCSEAL.NAME");
		_checkConditionToken(condition,"buildnumber","SCSEAL.BUILDNUMBER");
		_checkConditionToken(condition,"account","SCSEAL.ACCOUNT");
		_checkConditionToken(condition,"departmetfkcode","SCSEAL.DEPARTMETFKCODE");
		_checkConditionToken(condition,"molcode","SCSEAL.MOLCODE");
		_checkConditionToken(condition,"molname","SCSEAL.MOLNAME");
		_checkConditionToken(condition,"datein","SCSEAL.DATEIN");
		_checkConditionToken(condition,"datebuild","SCSEAL.DATEBUILD");
		_checkConditionToken(condition,"cost","SCSEAL.COST");
		_checkConditionToken(condition,"sccode","SCSEAL.SCCODE");
		_checkConditionToken(condition,"installordernumber","SCSEAL.INSTALLORDERNUMBER");
		_checkConditionToken(condition,"costold","SCSEAL.COSTOLD");
		_checkConditionToken(condition,"commentgen","SCSEAL.COMMENTGEN");
		_checkConditionToken(condition,"modify_time","SCSEAL.MODIFY_TIME");
		_checkConditionToken(condition,"useradd","SCSEAL.USERADD");
		_checkConditionToken(condition,"dateadd","SCSEAL.DATEADD");
		_checkConditionToken(condition,"usergen","SCSEAL.USERGEN");
		_checkConditionToken(condition,"dateedit","SCSEAL.DATEEDIT");
		// relationship conditions
		_checkConditionToken(condition,"typeref","TYPEREFCODE");
		_checkConditionToken(condition,"typeref.code","TYPEREFCODE");
		_checkConditionToken(condition,"statusref","STATUSREFCODE");
		_checkConditionToken(condition,"statusref.code","STATUSREFCODE");
		_checkConditionToken(condition,"estimateitemref","ESTIMATEITEMREFCODE");
		_checkConditionToken(condition,"estimateitemref.code","ESTIMATEITEMREFCODE");
		_checkConditionToken(condition,"locktyperef","LOCKTYPEREFCODE");
		_checkConditionToken(condition,"locktyperef.code","LOCKTYPEREFCODE");
		_checkConditionToken(condition,"zoneref","ZONEREFCODE");
		_checkConditionToken(condition,"zoneref.code","ZONEREFCODE");
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
	
	private void _collectAutoIncrementFields(SCSeal anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("SCSEAL", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("SCSEAL", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("SCSEAL", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: SCSEAL");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of SCSealDAO
