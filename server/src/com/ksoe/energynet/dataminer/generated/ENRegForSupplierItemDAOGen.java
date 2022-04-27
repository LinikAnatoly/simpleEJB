
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
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
import com.ksoe.energynet.valueobject.ENRegForSupplierItem;
import com.ksoe.energynet.valueobject.filter.ENRegForSupplierItemFilter;
import com.ksoe.energynet.valueobject.brief.ENRegForSupplierItemShort;
import com.ksoe.energynet.valueobject.lists.ENRegForSupplierItemShortList;


/**
 * DAO Object for ENRegForSupplierItem;
 *
 */

public class ENRegForSupplierItemDAOGen extends GenericDataMiner {

	public ENRegForSupplierItemDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENRegForSupplierItemDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENRegForSupplierItem inObject) throws PersistenceException {
		ENRegForSupplierItem obj = new ENRegForSupplierItem();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.recordpointEic == null && obj.recordpointEic == null){}
		else
			if(inObject.recordpointEic == null || obj.recordpointEic == null) return false;
			else
				if ( ! inObject.recordpointEic.equals(obj.recordpointEic)){
					return false;
				}

		if(inObject.customerUid == null && obj.customerUid == null){}
		else
			if(inObject.customerUid == null || obj.customerUid == null) return false;
			else
				if ( ! inObject.customerUid.equals(obj.customerUid)){
					return false;
				}

		if(inObject.datePlanned == null && obj.datePlanned == null){} else 
			if(inObject.datePlanned == null || obj.datePlanned == null) return false;
			else
				if (inObject.datePlanned.compareTo(obj.datePlanned) != 0){
					return false;
				}

		if(inObject.dateComplete == null && obj.dateComplete == null){} else 
			if(inObject.dateComplete == null || obj.dateComplete == null) return false;
			else
				if (inObject.dateComplete.compareTo(obj.dateComplete) != 0){
					return false;
				}

		if(inObject.description == null && obj.description == null){}
		else
			if(inObject.description == null || obj.description == null) return false;
			else
				if ( ! inObject.description.equals(obj.description)){
					return false;
				}

		if(inObject.calcNumber == null && obj.calcNumber == null){}
		else
			if(inObject.calcNumber == null || obj.calcNumber == null) return false;
			else
				if ( ! inObject.calcNumber.equals(obj.calcNumber)){
					return false;
				}

		if(inObject.calcName == null && obj.calcName == null){}
		else
			if(inObject.calcName == null || obj.calcName == null) return false;
			else
				if ( ! inObject.calcName.equals(obj.calcName)){
					return false;
				}

		if(inObject.costWithoutVAT == null && obj.costWithoutVAT == null){}
		else
			if(inObject.costWithoutVAT == null || obj.costWithoutVAT == null) return false;
			else
				if ( ! inObject.costWithoutVAT.equals(obj.costWithoutVAT)){
					return false;
				}

		if(inObject.costVAT == null && obj.costVAT == null){}
		else
			if(inObject.costVAT == null || obj.costVAT == null) return false;
			else
				if ( ! inObject.costVAT.equals(obj.costVAT)){
					return false;
				}

		if(inObject.costWithVAT == null && obj.costWithVAT == null){}
		else
			if(inObject.costWithVAT == null || obj.costWithVAT == null) return false;
			else
				if ( ! inObject.costWithVAT.equals(obj.costWithVAT)){
					return false;
				}

		if (inObject.dhDisconnectionCode != obj.dhDisconnectionCode){
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
		if (inObject.registryRef.code != obj.registryRef.code){
			return false;
		}
		if (inObject.registryTypeRef.code != obj.registryTypeRef.code){
			return false;
		}
		if (inObject.initiatorRef.code != obj.initiatorRef.code){
			return false;
		}
		if (inObject.planRef.code != obj.planRef.code){
			return false;
		}
		if (inObject.factRef.code != obj.factRef.code){
			return false;
		}
		if (inObject.classificationTypeRef.code != obj.classificationTypeRef.code){
			return false;
		}
		return true;
	}

	public int add(ENRegForSupplierItem anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENRegForSupplierItem anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENREGFORSUPPLIERITEM (CODE,RECORDPOINTEIC,CUSTOMERUID,DATEPLANNED,DATECOMPLETE,DESCRIPTION,CALCNUMBER,CALCNAME,COSTWITHOUTVAT,COSTVAT,COSTWITHVAT,DHDISCONNECTIONCODE,COMMENTGEN,MODIFY_TIME,USERADD,DATEADD,USERGEN,DATEEDIT,REGISTRYREFCODE,REGISTRYTYPEREFCODE,INITIATORREFCODE,PLANREFCODE,FACTREFCODE,CLASSIFICATIONTYPERFCD) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.recordpointEic);
			statement.setString(3, anObject.customerUid);
			if (anObject.datePlanned == null) {
				statement.setDate(4, null);
			} else {
				statement.setDate(4, new java.sql.Date(anObject.datePlanned.getTime()));
			}
			if (anObject.dateComplete == null) {
				statement.setDate(5, null);
			} else {
				statement.setDate(5, new java.sql.Date(anObject.dateComplete.getTime()));
			}
			statement.setString(6, anObject.description);
			statement.setString(7, anObject.calcNumber);
			statement.setString(8, anObject.calcName);
			if (anObject.costWithoutVAT != null) {
				anObject.costWithoutVAT = anObject.costWithoutVAT.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(9, anObject.costWithoutVAT);
			if (anObject.costVAT != null) {
				anObject.costVAT = anObject.costVAT.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(10, anObject.costVAT);
			if (anObject.costWithVAT != null) {
				anObject.costWithVAT = anObject.costWithVAT.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(11, anObject.costWithVAT);
			if (anObject.dhDisconnectionCode != Integer.MIN_VALUE ) {
				statement.setInt(12, anObject.dhDisconnectionCode);
			} else {
				statement.setNull(12, java.sql.Types.INTEGER);
			}
			statement.setString(13, anObject.commentGen);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(14, null);
			} else {
				statement.setBigDecimal(14, new java.math.BigDecimal(anObject.modify_time));
			}
			statement.setString(15, anObject.userAdd);
			if (anObject.dateAdd == null) {
				statement.setTimestamp(16, null);
			} else {
				statement.setTimestamp(16, new java.sql.Timestamp(anObject.dateAdd.getTime()));
			}
			statement.setString(17, anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(18, null);
			} else {
				statement.setTimestamp(18, new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.registryRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENRegForSupplierDAOGen(connection,getUserProfile()).exists(anObject.registryRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENRegForSupplierItem.registryRef.code%} = {%"+anObject.registryRef.code+"%}");
				}
				statement.setInt(19,anObject.registryRef.code);
			} else {
				statement.setNull(19,java.sql.Types.INTEGER);
			}
			if (anObject.registryTypeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENRegForSupplierTypeDAOGen(connection,getUserProfile()).exists(anObject.registryTypeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENRegForSupplierItem.registryTypeRef.code%} = {%"+anObject.registryTypeRef.code+"%}");
				}
				statement.setInt(20,anObject.registryTypeRef.code);
			} else {
				statement.setNull(20,java.sql.Types.INTEGER);
			}
			if (anObject.initiatorRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENDisconnectInitiatorDAOGen(connection,getUserProfile()).exists(anObject.initiatorRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENRegForSupplierItem.initiatorRef.code%} = {%"+anObject.initiatorRef.code+"%}");
				}
				statement.setInt(21,anObject.initiatorRef.code);
			} else {
				statement.setNull(21,java.sql.Types.INTEGER);
			}
			if (anObject.planRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENRegForSupplierItem.planRef.code%} = {%"+anObject.planRef.code+"%}");
				}
				statement.setInt(22,anObject.planRef.code);
			} else {
				statement.setNull(22,java.sql.Types.INTEGER);
			}
			if (anObject.factRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.factRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENRegForSupplierItem.factRef.code%} = {%"+anObject.factRef.code+"%}");
				}
				statement.setInt(23,anObject.factRef.code);
			} else {
				statement.setNull(23,java.sql.Types.INTEGER);
			}
			if (anObject.classificationTypeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.techcard.dataminer.generated.TKClassificationTypeDAOGen(connection,getUserProfile()).exists(anObject.classificationTypeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENRegForSupplierItem.classificationTypeRef.code%} = {%"+anObject.classificationTypeRef.code+"%}");
				}
				statement.setInt(24,anObject.classificationTypeRef.code);
			} else {
				statement.setNull(24,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENRegForSupplierItemDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENRegForSupplierItem anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENRegForSupplierItem anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENRegForSupplierItem oldObject = new ENRegForSupplierItem();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENRegForSupplierItem.modify_time_Field+" FROM  ENREGFORSUPPLIERITEM WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("RECORDPOINTEIC") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CUSTOMERUID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEPLANNED") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATECOMPLETE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DESCRIPTION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CALCNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CALCNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COSTWITHOUTVAT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COSTVAT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COSTWITHVAT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DHDISCONNECTIONCODE") == 0) {
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
					if(fieldNameStr.compareTo("REGISTRYREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("REGISTRYTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("INITIATORREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PLANREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FACTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CLASSIFICATIONTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENREGFORSUPPLIERITEM SET  RECORDPOINTEIC = ? , CUSTOMERUID = ? , DATEPLANNED = ? , DATECOMPLETE = ? , DESCRIPTION = ? , CALCNUMBER = ? , CALCNAME = ? , COSTWITHOUTVAT = ? , COSTVAT = ? , COSTWITHVAT = ? , DHDISCONNECTIONCODE = ? , COMMENTGEN = ? , MODIFY_TIME = ? , USERADD = ? , DATEADD = ? , USERGEN = ? , DATEEDIT = ? , REGISTRYREFCODE = ? , REGISTRYTYPEREFCODE = ? , INITIATORREFCODE = ? , PLANREFCODE = ? , FACTREFCODE = ? , CLASSIFICATIONTYPERFCD = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENREGFORSUPPLIERITEM SET ";
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
					statement.setString(1, anObject.recordpointEic);
					statement.setString(2, anObject.customerUid);
					if (anObject.datePlanned == null) {
						statement.setDate(3, null);
					} else {
						statement.setDate(3, new java.sql.Date(anObject.datePlanned.getTime()));
					}
					if (anObject.dateComplete == null) {
						statement.setDate(4, null);
					} else {
						statement.setDate(4, new java.sql.Date(anObject.dateComplete.getTime()));
					}
					statement.setString(5, anObject.description);
					statement.setString(6, anObject.calcNumber);
					statement.setString(7, anObject.calcName);
					if (anObject.costWithoutVAT != null) {
						anObject.costWithoutVAT = anObject.costWithoutVAT.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(8, anObject.costWithoutVAT);
					if (anObject.costVAT != null) {
						anObject.costVAT = anObject.costVAT.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(9, anObject.costVAT);
					if (anObject.costWithVAT != null) {
						anObject.costWithVAT = anObject.costWithVAT.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(10, anObject.costWithVAT);
					if (anObject.dhDisconnectionCode != Integer.MIN_VALUE) {
						statement.setInt(11, anObject.dhDisconnectionCode);
					} else {
						statement.setNull(11, java.sql.Types.INTEGER);
					}
					statement.setString(12, anObject.commentGen);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(13, null);
					} else {
						statement.setBigDecimal(13, new java.math.BigDecimal(anObject.modify_time));
					}
					statement.setString(14, anObject.userAdd);
					if (anObject.dateAdd == null) {
						statement.setTimestamp(15, null);
					} else {
						statement.setTimestamp(15, new java.sql.Timestamp(anObject.dateAdd.getTime()));
					}
					statement.setString(16, anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(17, null);
					} else {
						statement.setTimestamp(17, new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.registryRef.code != Integer.MIN_VALUE) {
						statement.setInt(18, anObject.registryRef.code);
					} else {
						statement.setNull(18, java.sql.Types.INTEGER);
					}
					if (anObject.registryTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(19, anObject.registryTypeRef.code);
					} else {
						statement.setNull(19, java.sql.Types.INTEGER);
					}
					if (anObject.initiatorRef.code != Integer.MIN_VALUE) {
						statement.setInt(20, anObject.initiatorRef.code);
					} else {
						statement.setNull(20, java.sql.Types.INTEGER);
					}
					if (anObject.planRef.code != Integer.MIN_VALUE) {
						statement.setInt(21, anObject.planRef.code);
					} else {
						statement.setNull(21, java.sql.Types.INTEGER);
					}
					if (anObject.factRef.code != Integer.MIN_VALUE) {
						statement.setInt(22, anObject.factRef.code);
					} else {
						statement.setNull(22, java.sql.Types.INTEGER);
					}
					if (anObject.classificationTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(23, anObject.classificationTypeRef.code);
					} else {
						statement.setNull(23, java.sql.Types.INTEGER);
					}
					statement.setInt(24, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("RECORDPOINTEIC".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.recordpointEic);
							continue;
						}
						if("CUSTOMERUID".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.customerUid);
							continue;
						}
						if("DATEPLANNED".compareTo((String)fields.get(i)) == 0) {
							if (anObject.datePlanned == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.datePlanned.getTime()));
							}
							continue;
						}
						if("DATECOMPLETE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateComplete == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateComplete.getTime()));
							}
							continue;
						}
						if("DESCRIPTION".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.description);
							continue;
						}
						if("CALCNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.calcNumber);
							continue;
						}
						if("CALCNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.calcName);
							continue;
						}
						if("COSTWITHOUTVAT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.costWithoutVAT != null) {
								anObject.costWithoutVAT = anObject.costWithoutVAT.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.costWithoutVAT);
							continue;
						}
						if("COSTVAT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.costVAT != null) {
								anObject.costVAT = anObject.costVAT.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.costVAT);
							continue;
						}
						if("COSTWITHVAT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.costWithVAT != null) {
								anObject.costWithVAT = anObject.costWithVAT.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.costWithVAT);
							continue;
						}
						if("DHDISCONNECTIONCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.dhDisconnectionCode);
							continue;
						}
						if("COMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.commentGen);
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
						if("USERADD".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.userAdd);
							continue;
						}
						if("DATEADD".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateAdd == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1, new java.sql.Timestamp(anObject.dateAdd.getTime()));
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
						if("REGISTRYREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.registryRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.registryRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("REGISTRYTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.registryTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.registryTypeRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("INITIATORREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.initiatorRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.initiatorRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("PLANREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.planRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.planRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("FACTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.factRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.factRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("CLASSIFICATIONTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.classificationTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.classificationTypeRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
					}
					statement.setInt(fields.size(), anObject.code);
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

	} // end of save(ENRegForSupplierItem anObject,String[] anAttributes)


	public ENRegForSupplierItemShort getShortObject(int anObjectCode) throws PersistenceException {
		ENRegForSupplierItem filterObject = new ENRegForSupplierItem();
		Vector<ENRegForSupplierItemShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENRegForSupplierItemShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENRegForSupplierItem filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.recordpointEic, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.customerUid, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.datePlanned, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateComplete, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.description, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.calcNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.calcName, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.costWithoutVAT, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.costVAT, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.costWithVAT, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.dhDisconnectionCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userAdd, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateAdd, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.registryRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.registryTypeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.initiatorRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.planRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.factRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.classificationTypeRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENRegForSupplierItemFilter filter) {
		String out = buildCondition((ENRegForSupplierItem)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENRegForSupplierItem filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENRegForSupplierItem.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.recordpointEic, ENRegForSupplierItem.recordpointEic_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.customerUid, ENRegForSupplierItem.customerUid_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.datePlanned, ENRegForSupplierItem.datePlanned_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateComplete, ENRegForSupplierItem.dateComplete_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.description, ENRegForSupplierItem.description_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.calcNumber, ENRegForSupplierItem.calcNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.calcName, ENRegForSupplierItem.calcName_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.costWithoutVAT, ENRegForSupplierItem.costWithoutVAT_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.costVAT, ENRegForSupplierItem.costVAT_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.costWithVAT, ENRegForSupplierItem.costWithVAT_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.dhDisconnectionCode, ENRegForSupplierItem.dhDisconnectionCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentGen, ENRegForSupplierItem.commentGen_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENRegForSupplierItem.modify_time_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userAdd, ENRegForSupplierItem.userAdd_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateAdd, ENRegForSupplierItem.dateAdd_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENRegForSupplierItem.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENRegForSupplierItem.dateEdit_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.registryRef.code, ENRegForSupplierItem.registryRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.registryTypeRef.code, ENRegForSupplierItem.registryTypeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.initiatorRef.code, ENRegForSupplierItem.initiatorRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.planRef.code, ENRegForSupplierItem.planRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.factRef.code, ENRegForSupplierItem.factRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.classificationTypeRef.code, ENRegForSupplierItem.classificationTypeRef_QFielld, out);
		}
		return out;
	}

	public ENRegForSupplierItemShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENRegForSupplierItemShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENRegForSupplierItemShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENRegForSupplierItemShortList getFilteredList(ENRegForSupplierItem filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENRegForSupplierItemShortList getScrollableFilteredList(ENRegForSupplierItem aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENRegForSupplierItemShortList getScrollableFilteredList(ENRegForSupplierItem aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENRegForSupplierItemShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENRegForSupplierItemShortList getScrollableFilteredList(ENRegForSupplierItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENRegForSupplierItemShortList getScrollableFilteredList(ENRegForSupplierItemFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENRegForSupplierItemShortList getScrollableFilteredList(ENRegForSupplierItem aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENRegForSupplierItemShortList result = new ENRegForSupplierItemShortList();
		ENRegForSupplierItemShort anObject;
		result.list = new Vector<ENRegForSupplierItemShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENREGFORSUPPLIERITEM.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENREGFORSUPPLIERITEM.CODE"+
			",ENREGFORSUPPLIERITEM.RECORDPOINTEIC"+
			",ENREGFORSUPPLIERITEM.CUSTOMERUID"+
			",ENREGFORSUPPLIERITEM.DATEPLANNED"+
			",ENREGFORSUPPLIERITEM.DATECOMPLETE"+
			",ENREGFORSUPPLIERITEM.DESCRIPTION"+
			",ENREGFORSUPPLIERITEM.CALCNUMBER"+
			",ENREGFORSUPPLIERITEM.CALCNAME"+
			",ENREGFORSUPPLIERITEM.COSTWITHOUTVAT"+
			",ENREGFORSUPPLIERITEM.COSTVAT"+
			",ENREGFORSUPPLIERITEM.COSTWITHVAT"+
			",ENREGFORSUPPLIERITEM.DHDISCONNECTIONCODE"+
			",ENREGFORSUPPLIERITEM.COMMENTGEN"+
			",ENREGFORSUPPLIERITEM.USERGEN"+
			",ENREGFORSUPPLIERITEM.DATEEDIT"+
			", ENREGFORSUPPLIER.CODE " +
			", ENREGFORSUPPLIER.NUMBERGEN " +
			", ENREGFORSUPPLIER.DATEFROM " +
			", ENREGFORSUPPLIER.DATETO " +
			", ENREGFORSUPPLIER.SUPPLIERCODE " +
			", ENREGFORSUPPLIER.COMMENTGEN " +
			", ENREGFORSUPPLIER.USERGEN " +
			", ENREGFORSUPPLIER.DATEEDIT " +
			", ENREGFORSUPPLIERTYPE.CODE " +
			", ENREGFORSUPPLIERTYPE.NAME " +
			", ENREGFORSUPPLIERTYPE.DESCRIPTION " +
			", ENDISCONNECTINITIATOR.CODE " +
			", ENDISCONNECTINITIATOR.NAME " +
			", ENPLANWORK.CODE " +
			", ENPLANWORK.DATEGEN " +
			", ENPLANWORK.DATESTART " +
			", ENPLANWORK.DATEFINAL " +
			", ENPLANWORK.YEARGEN " +
			", ENPLANWORK.MONTHGEN " +
			", ENPLANWORK.YEARORIGINAL " +
			", ENPLANWORK.MONTHORIGINAL " +
			", ENPLANWORK.USERGEN " +
			", ENPLANWORK.DATEEDIT " +
			", ENPLANWORK.WORKORDERNUMBER " +
			", ENPLANWORK.DATEWORKORDER " +
			", ENPLANWORK.PRICONNECTIONNUMBER " +
			", ENPLANWORK.DATEENDPRICONNECTION " +
			", ENPLANWORK.INVESTWORKSDESCRIPTION " +
			", ENPLANWORK.SERVICESFSIDEFINID " +
			", ENPLANWORK.SERVICESFSIDECNNUM " +
			", ENPLANWORK.TOTALTIMEHOURS " +
			", ENPLANWORK.TOTALTIMEDAYS " +
			", ENPLANWORK.INVESTITEMNUMBER " +
			", ENPLANWORK.CODE " +
			", ENPLANWORK.DATEGEN " +
			", ENPLANWORK.DATESTART " +
			", ENPLANWORK.DATEFINAL " +
			", ENPLANWORK.YEARGEN " +
			", ENPLANWORK.MONTHGEN " +
			", ENPLANWORK.YEARORIGINAL " +
			", ENPLANWORK.MONTHORIGINAL " +
			", ENPLANWORK.USERGEN " +
			", ENPLANWORK.DATEEDIT " +
			", ENPLANWORK.WORKORDERNUMBER " +
			", ENPLANWORK.DATEWORKORDER " +
			", ENPLANWORK.PRICONNECTIONNUMBER " +
			", ENPLANWORK.DATEENDPRICONNECTION " +
			", ENPLANWORK.INVESTWORKSDESCRIPTION " +
			", ENPLANWORK.SERVICESFSIDEFINID " +
			", ENPLANWORK.SERVICESFSIDECNNUM " +
			", ENPLANWORK.TOTALTIMEHOURS " +
			", ENPLANWORK.TOTALTIMEDAYS " +
			", ENPLANWORK.INVESTITEMNUMBER " +
			", TKCLASSIFICATIONTYPE.CODE " +
			", TKCLASSIFICATIONTYPE.NAME " +
			", TKCLASSIFICATIONTYPE.KOD " +
		" FROM ENREGFORSUPPLIERITEM " +
			" LEFT JOIN ENREGFORSUPPLIER on ENREGFORSUPPLIER.CODE = ENREGFORSUPPLIERITEM.REGISTRYREFCODE "+
			" LEFT JOIN ENREGFORSUPPLIERTYPE on ENREGFORSUPPLIERTYPE.CODE = ENREGFORSUPPLIERITEM.REGISTRYTYPEREFCODE "+
			" LEFT JOIN ENDISCONNECTINITIATOR on ENDISCONNECTINITIATOR.CODE = ENREGFORSUPPLIERITEM.INITIATORREFCODE "+
			" LEFT JOIN ENPLANWORK on ENPLANWORK.CODE = ENREGFORSUPPLIERITEM.PLANREFCODE "+
			" LEFT JOIN ENPLANWORK on ENPLANWORK.CODE = ENREGFORSUPPLIERITEM.FACTREFCODE "+
			" LEFT JOIN TKCLASSIFICATIONTYPE on TKCLASSIFICATIONTYPE.CODE = ENREGFORSUPPLIERITEM.CLASSIFICATIONTYPERFCD "+
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
				anObject = new ENRegForSupplierItemShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.recordpointEic = set.getString(2);
				anObject.customerUid = set.getString(3);
				anObject.datePlanned = set.getDate(4);
				anObject.dateComplete = set.getDate(5);
				anObject.description = set.getString(6);
				anObject.calcNumber = set.getString(7);
				anObject.calcName = set.getString(8);
				anObject.costWithoutVAT = set.getBigDecimal(9);
				if(anObject.costWithoutVAT != null) {
					anObject.costWithoutVAT = anObject.costWithoutVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costVAT = set.getBigDecimal(10);
				if(anObject.costVAT != null) {
					anObject.costVAT = anObject.costVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costWithVAT = set.getBigDecimal(11);
				if(anObject.costWithVAT != null) {
					anObject.costWithVAT = anObject.costWithVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.dhDisconnectionCode = set.getInt(12);
				if ( set.wasNull() ) {
					anObject.dhDisconnectionCode = Integer.MIN_VALUE;
				}
				anObject.commentGen = set.getString(13);
				anObject.userGen = set.getString(14);
				anObject.dateEdit = set.getTimestamp(15);

				anObject.registryRefCode = set.getInt(16);
				if(set.wasNull()) {
					anObject.registryRefCode = Integer.MIN_VALUE;
				}
				anObject.registryRefNumberGen = set.getString(17);
				anObject.registryRefDateFrom = set.getDate(18);
				anObject.registryRefDateTo = set.getDate(19);
				anObject.registryRefSupplierCode = set.getInt(20);
				if(set.wasNull()) {
					anObject.registryRefSupplierCode = Integer.MIN_VALUE;
				}
				anObject.registryRefCommentGen = set.getString(21);
				anObject.registryRefUserGen = set.getString(22);
				anObject.registryRefDateEdit = set.getTimestamp(23);
				anObject.registryTypeRefCode = set.getInt(24);
				if(set.wasNull()) {
					anObject.registryTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.registryTypeRefName = set.getString(25);
				anObject.registryTypeRefDescription = set.getString(26);
				anObject.initiatorRefCode = set.getInt(27);
				if(set.wasNull()) {
					anObject.initiatorRefCode = Integer.MIN_VALUE;
				}
				anObject.initiatorRefName = set.getString(28);
				anObject.planRefCode = set.getInt(29);
				if(set.wasNull()) {
					anObject.planRefCode = Integer.MIN_VALUE;
				}
				anObject.planRefDateGen = set.getTimestamp(30);
				anObject.planRefDateStart = set.getDate(31);
				anObject.planRefDateFinal = set.getDate(32);
				anObject.planRefYearGen = set.getInt(33);
				if(set.wasNull()) {
					anObject.planRefYearGen = Integer.MIN_VALUE;
				}
				anObject.planRefMonthGen = set.getInt(34);
				if(set.wasNull()) {
					anObject.planRefMonthGen = Integer.MIN_VALUE;
				}
				anObject.planRefYearOriginal = set.getInt(35);
				if(set.wasNull()) {
					anObject.planRefYearOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefMonthOriginal = set.getInt(36);
				if(set.wasNull()) {
					anObject.planRefMonthOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefUserGen = set.getString(37);
				anObject.planRefDateEdit = set.getDate(38);
				anObject.planRefWorkOrderNumber = set.getString(39);
				anObject.planRefDateWorkOrder = set.getDate(40);
				anObject.planRefPriConnectionNumber = set.getString(41);
				anObject.planRefDateEndPriConnection = set.getDate(42);
				anObject.planRefInvestWorksDescription = set.getString(43);
				anObject.planRefServicesFSideFinId = set.getInt(44);
				if(set.wasNull()) {
					anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;
				}
				anObject.planRefServicesFSideCnNum = set.getString(45);
				anObject.planRefTotalTimeHours = set.getBigDecimal(46);
				if(anObject.planRefTotalTimeHours != null) {
					anObject.planRefTotalTimeHours = anObject.planRefTotalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefTotalTimeDays = set.getBigDecimal(47);
				if(anObject.planRefTotalTimeDays != null) {
					anObject.planRefTotalTimeDays = anObject.planRefTotalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefInvestItemNumber = set.getString(48);
				anObject.factRefCode = set.getInt(49);
				if(set.wasNull()) {
					anObject.factRefCode = Integer.MIN_VALUE;
				}
				anObject.factRefDateGen = set.getTimestamp(50);
				anObject.factRefDateStart = set.getDate(51);
				anObject.factRefDateFinal = set.getDate(52);
				anObject.factRefYearGen = set.getInt(53);
				if(set.wasNull()) {
					anObject.factRefYearGen = Integer.MIN_VALUE;
				}
				anObject.factRefMonthGen = set.getInt(54);
				if(set.wasNull()) {
					anObject.factRefMonthGen = Integer.MIN_VALUE;
				}
				anObject.factRefYearOriginal = set.getInt(55);
				if(set.wasNull()) {
					anObject.factRefYearOriginal = Integer.MIN_VALUE;
				}
				anObject.factRefMonthOriginal = set.getInt(56);
				if(set.wasNull()) {
					anObject.factRefMonthOriginal = Integer.MIN_VALUE;
				}
				anObject.factRefUserGen = set.getString(57);
				anObject.factRefDateEdit = set.getDate(58);
				anObject.factRefWorkOrderNumber = set.getString(59);
				anObject.factRefDateWorkOrder = set.getDate(60);
				anObject.factRefPriConnectionNumber = set.getString(61);
				anObject.factRefDateEndPriConnection = set.getDate(62);
				anObject.factRefInvestWorksDescription = set.getString(63);
				anObject.factRefServicesFSideFinId = set.getInt(64);
				if(set.wasNull()) {
					anObject.factRefServicesFSideFinId = Integer.MIN_VALUE;
				}
				anObject.factRefServicesFSideCnNum = set.getString(65);
				anObject.factRefTotalTimeHours = set.getBigDecimal(66);
				if(anObject.factRefTotalTimeHours != null) {
					anObject.factRefTotalTimeHours = anObject.factRefTotalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.factRefTotalTimeDays = set.getBigDecimal(67);
				if(anObject.factRefTotalTimeDays != null) {
					anObject.factRefTotalTimeDays = anObject.factRefTotalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.factRefInvestItemNumber = set.getString(68);
				anObject.classificationTypeRefCode = set.getInt(69);
				if(set.wasNull()) {
					anObject.classificationTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.classificationTypeRefName = set.getString(70);
				anObject.classificationTypeRefKod = set.getString(71);

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
	
	public int[] getFilteredCodeArray(ENRegForSupplierItemFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENRegForSupplierItemFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENRegForSupplierItem aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENREGFORSUPPLIERITEM.CODE FROM ENREGFORSUPPLIERITEM";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENREGFORSUPPLIERITEM.CODE";
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


	public ENRegForSupplierItem getObject(int uid) throws PersistenceException {
		ENRegForSupplierItem result = new ENRegForSupplierItem();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENRegForSupplierItem anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENREGFORSUPPLIERITEM.CODE, ENREGFORSUPPLIERITEM.RECORDPOINTEIC, ENREGFORSUPPLIERITEM.CUSTOMERUID, ENREGFORSUPPLIERITEM.DATEPLANNED, ENREGFORSUPPLIERITEM.DATECOMPLETE, ENREGFORSUPPLIERITEM.DESCRIPTION, ENREGFORSUPPLIERITEM.CALCNUMBER, ENREGFORSUPPLIERITEM.CALCNAME, ENREGFORSUPPLIERITEM.COSTWITHOUTVAT, ENREGFORSUPPLIERITEM.COSTVAT, ENREGFORSUPPLIERITEM.COSTWITHVAT, ENREGFORSUPPLIERITEM.DHDISCONNECTIONCODE, ENREGFORSUPPLIERITEM.COMMENTGEN, ENREGFORSUPPLIERITEM.MODIFY_TIME, ENREGFORSUPPLIERITEM.USERADD, ENREGFORSUPPLIERITEM.DATEADD, ENREGFORSUPPLIERITEM.USERGEN, ENREGFORSUPPLIERITEM.DATEEDIT, ENREGFORSUPPLIERITEM.REGISTRYREFCODE, ENREGFORSUPPLIERITEM.REGISTRYTYPEREFCODE, ENREGFORSUPPLIERITEM.INITIATORREFCODE, ENREGFORSUPPLIERITEM.PLANREFCODE, ENREGFORSUPPLIERITEM.FACTREFCODE, ENREGFORSUPPLIERITEM.CLASSIFICATIONTYPERFCD "
			+" FROM ENREGFORSUPPLIERITEM WHERE ENREGFORSUPPLIERITEM.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.recordpointEic = set.getString(2);
				anObject.customerUid = set.getString(3);
				anObject.datePlanned = set.getDate(4);
				anObject.dateComplete = set.getDate(5);
				anObject.description = set.getString(6);
				anObject.calcNumber = set.getString(7);
				anObject.calcName = set.getString(8);
				anObject.costWithoutVAT = set.getBigDecimal(9);
				if(anObject.costWithoutVAT != null) {
					anObject.costWithoutVAT = anObject.costWithoutVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costVAT = set.getBigDecimal(10);
				if(anObject.costVAT != null) {
					anObject.costVAT = anObject.costVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costWithVAT = set.getBigDecimal(11);
				if(anObject.costWithVAT != null) {
					anObject.costWithVAT = anObject.costWithVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.dhDisconnectionCode = set.getInt(12);
				if (set.wasNull()) {
					anObject.dhDisconnectionCode = Integer.MIN_VALUE;
				}
				anObject.commentGen = set.getString(13);
				anObject.modify_time = set.getLong(14);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.userAdd = set.getString(15);
				anObject.dateAdd = set.getTimestamp(16);
				anObject.userGen = set.getString(17);
				anObject.dateEdit = set.getTimestamp(18);
				anObject.registryRef.code = set.getInt(19);
				if (set.wasNull()) {
					anObject.registryRef.code = Integer.MIN_VALUE;
				}
				anObject.registryTypeRef.code = set.getInt(20);
				if (set.wasNull()) {
					anObject.registryTypeRef.code = Integer.MIN_VALUE;
				}
				anObject.initiatorRef.code = set.getInt(21);
				if (set.wasNull()) {
					anObject.initiatorRef.code = Integer.MIN_VALUE;
				}
				anObject.planRef.code = set.getInt(22);
				if (set.wasNull()) {
					anObject.planRef.code = Integer.MIN_VALUE;
				}
				anObject.factRef.code = set.getInt(23);
				if (set.wasNull()) {
					anObject.factRef.code = Integer.MIN_VALUE;
				}
				anObject.classificationTypeRef.code = set.getInt(24);
				if (set.wasNull()) {
					anObject.classificationTypeRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENRegForSupplierItemRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENRegForSupplierItemRef ref = new com.ksoe.energynet.valueobject.references.ENRegForSupplierItemRef();
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

		selectStr = "DELETE FROM  ENREGFORSUPPLIERITEM WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENRegForSupplierItem object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENRegForSupplierItem.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENRegForSupplierItem.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENRegForSupplierItem.remove%} access denied");
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
	
	public long count(ENRegForSupplierItemFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENRegForSupplierItemFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENRegForSupplierItemFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENREGFORSUPPLIERITEM", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENREGFORSUPPLIERITEM WHERE code = ?", propertyName);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENRegForSupplierItemFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENREGFORSUPPLIERITEM");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENRegForSupplierItem.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENRegForSupplierItem.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENREGFORSUPPLIERITEM.CODE FROM  ENREGFORSUPPLIERITEM WHERE  ENREGFORSUPPLIERITEM.CODE = ?";
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
		_checkConditionToken(condition,"code","ENREGFORSUPPLIERITEM.CODE");
		_checkConditionToken(condition,"recordpointeic","ENREGFORSUPPLIERITEM.RECORDPOINTEIC");
		_checkConditionToken(condition,"customeruid","ENREGFORSUPPLIERITEM.CUSTOMERUID");
		_checkConditionToken(condition,"dateplanned","ENREGFORSUPPLIERITEM.DATEPLANNED");
		_checkConditionToken(condition,"datecomplete","ENREGFORSUPPLIERITEM.DATECOMPLETE");
		_checkConditionToken(condition,"description","ENREGFORSUPPLIERITEM.DESCRIPTION");
		_checkConditionToken(condition,"calcnumber","ENREGFORSUPPLIERITEM.CALCNUMBER");
		_checkConditionToken(condition,"calcname","ENREGFORSUPPLIERITEM.CALCNAME");
		_checkConditionToken(condition,"costwithoutvat","ENREGFORSUPPLIERITEM.COSTWITHOUTVAT");
		_checkConditionToken(condition,"costvat","ENREGFORSUPPLIERITEM.COSTVAT");
		_checkConditionToken(condition,"costwithvat","ENREGFORSUPPLIERITEM.COSTWITHVAT");
		_checkConditionToken(condition,"dhdisconnectioncode","ENREGFORSUPPLIERITEM.DHDISCONNECTIONCODE");
		_checkConditionToken(condition,"commentgen","ENREGFORSUPPLIERITEM.COMMENTGEN");
		_checkConditionToken(condition,"modify_time","ENREGFORSUPPLIERITEM.MODIFY_TIME");
		_checkConditionToken(condition,"useradd","ENREGFORSUPPLIERITEM.USERADD");
		_checkConditionToken(condition,"dateadd","ENREGFORSUPPLIERITEM.DATEADD");
		_checkConditionToken(condition,"usergen","ENREGFORSUPPLIERITEM.USERGEN");
		_checkConditionToken(condition,"dateedit","ENREGFORSUPPLIERITEM.DATEEDIT");
		// relationship conditions
		_checkConditionToken(condition,"registryref","REGISTRYREFCODE");
		_checkConditionToken(condition,"registryref.code","REGISTRYREFCODE");
		_checkConditionToken(condition,"registrytyperef","REGISTRYTYPEREFCODE");
		_checkConditionToken(condition,"registrytyperef.code","REGISTRYTYPEREFCODE");
		_checkConditionToken(condition,"initiatorref","INITIATORREFCODE");
		_checkConditionToken(condition,"initiatorref.code","INITIATORREFCODE");
		_checkConditionToken(condition,"planref","PLANREFCODE");
		_checkConditionToken(condition,"planref.code","PLANREFCODE");
		_checkConditionToken(condition,"factref","FACTREFCODE");
		_checkConditionToken(condition,"factref.code","FACTREFCODE");
		_checkConditionToken(condition,"classificationtyperef","CLASSIFICATIONTYPERFCD");
		_checkConditionToken(condition,"classificationtyperef.code","CLASSIFICATIONTYPERFCD");
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
	
	private void _collectAutoIncrementFields(ENRegForSupplierItem anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENREGFORSUPPLIERITEM", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENREGFORSUPPLIERITEM", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENREGFORSUPPLIERITEM", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENREGFORSUPPLIERITEM");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENRegForSupplierItemDAO
