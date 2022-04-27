
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
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.brief.ENEstimateItemShort;
import com.ksoe.energynet.valueobject.lists.ENEstimateItemShortList;


/**
 * DAO Object for ENEstimateItem;
 *
 */

public class ENEstimateItemDAOGen extends GenericDataMiner {

	public ENEstimateItemDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENEstimateItemDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENEstimateItem inObject) throws PersistenceException {
		ENEstimateItem obj = new ENEstimateItem();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.countGen == null && obj.countGen == null){}
		else
			if(inObject.countGen == null || obj.countGen == null) return false;
			else
				if ( ! inObject.countGen.equals(obj.countGen)){
					return false;
				}

		if(inObject.countFact == null && obj.countFact == null){}
		else
			if(inObject.countFact == null || obj.countFact == null) return false;
			else
				if ( ! inObject.countFact.equals(obj.countFact)){
					return false;
				}

		if(inObject.price == null && obj.price == null){}
		else
			if(inObject.price == null || obj.price == null) return false;
			else
				if ( ! inObject.price.equals(obj.price)){
					return false;
				}

		if(inObject.priceVRTU == null && obj.priceVRTU == null){}
		else
			if(inObject.priceVRTU == null || obj.priceVRTU == null) return false;
			else
				if ( ! inObject.priceVRTU.equals(obj.priceVRTU)){
					return false;
				}

		if(inObject.cost == null && obj.cost == null){}
		else
			if(inObject.cost == null || obj.cost == null) return false;
			else
				if ( ! inObject.cost.equals(obj.cost)){
					return false;
				}

		if (inObject.isUseVAT != obj.isUseVAT){
					return false;
				}

		if (inObject.deliveryTime != obj.deliveryTime){
					return false;
				}

		if (inObject.useWorkTime != obj.useWorkTime){
					return false;
				}

		if(inObject.commentGen == null && obj.commentGen == null){}
		else
			if(inObject.commentGen == null || obj.commentGen == null) return false;
			else
				if ( ! inObject.commentGen.equals(obj.commentGen)){
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
		if (inObject.planRef.code != obj.planRef.code){
			return false;
		}
		if (inObject.planItemRef.code != obj.planItemRef.code){
			return false;
		}
		if (inObject.materialRef.code != obj.materialRef.code){
			return false;
		}
		if (inObject.typeRef.code != obj.typeRef.code){
			return false;
		}
		if (inObject.kindRef.code != obj.kindRef.code){
			return false;
		}
		if (inObject.statusRef.code != obj.statusRef.code){
			return false;
		}
		if (inObject.oldStatusRef.code != obj.oldStatusRef.code){
			return false;
		}
		if (inObject.accountingTypeRef.code != obj.accountingTypeRef.code){
			return false;
		}
		if (inObject.purchaseItemRef.code != obj.purchaseItemRef.code){
			return false;
		}
		return true;
	}

	public int add(ENEstimateItem anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENEstimateItem anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENESTIMATEITEM (CODE,COUNTGEN,COUNTFACT,PRICE,PRICEVRTU,COST,ISUSEVAT,DELIVERYTIME,USEWORKTIME,COMMENTGEN,USERGEN,DATEEDIT,MODIFY_TIME,PLANREFCODE,PLANITEMREFCODE,MATERIALREFCODE,TYPEREFCODE,KINDREFCODE,STATUSREFCODE,OLDSTATUSREFCODE,ACCOUNTINGTYPEREFCODE,PURCHASEITEMREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.countGen != null) {
				anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(2,anObject.countGen);
			if (anObject.countFact != null) {
				anObject.countFact = anObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(3,anObject.countFact);
			if (anObject.price != null) {
				anObject.price = anObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(4,anObject.price);
			if (anObject.priceVRTU != null) {
				anObject.priceVRTU = anObject.priceVRTU.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(5,anObject.priceVRTU);
			if (anObject.cost != null) {
				anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(6,anObject.cost);
			if (anObject.isUseVAT != Integer.MIN_VALUE ) {
				statement.setInt(7,anObject.isUseVAT);
			} else {
				statement.setNull(7,java.sql.Types.INTEGER);
			}
			if (anObject.deliveryTime != Integer.MIN_VALUE ) {
				statement.setInt(8,anObject.deliveryTime);
			} else {
				statement.setNull(8,java.sql.Types.INTEGER);
			}
			if (anObject.useWorkTime != Integer.MIN_VALUE ) {
				statement.setInt(9,anObject.useWorkTime);
			} else {
				statement.setNull(9,java.sql.Types.INTEGER);
			}
			statement.setString(10,anObject.commentGen);
			statement.setString(11,anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setDate(12,null);
			} else {
				statement.setDate(12,new java.sql.Date(anObject.dateEdit.getTime()));
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(13,null);
			} else {
				statement.setBigDecimal(13,new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.planRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENEstimateItem.planRef.code%} = {%"+anObject.planRef.code+"%}");
				}
				statement.setInt(14,anObject.planRef.code);
			} else {
				statement.setNull(14,java.sql.Types.INTEGER);
			}
			if (anObject.planItemRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkItemDAOGen(connection,getUserProfile()).exists(anObject.planItemRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENEstimateItem.planItemRef.code%} = {%"+anObject.planItemRef.code+"%}");
				}
				statement.setInt(15,anObject.planItemRef.code);
			} else {
				statement.setNull(15,java.sql.Types.INTEGER);
			}
			if (anObject.materialRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.techcard.dataminer.generated.TKMaterialsDAOGen(connection,getUserProfile()).exists(anObject.materialRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENEstimateItem.materialRef.code%} = {%"+anObject.materialRef.code+"%}");
				}
				statement.setInt(16,anObject.materialRef.code);
			} else {
				statement.setNull(16,java.sql.Types.INTEGER);
			}
			if (anObject.typeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENEstimateItemTypeDAOGen(connection,getUserProfile()).exists(anObject.typeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENEstimateItem.typeRef.code%} = {%"+anObject.typeRef.code+"%}");
				}
				statement.setInt(17,anObject.typeRef.code);
			} else {
				statement.setNull(17,java.sql.Types.INTEGER);
			}
			if (anObject.kindRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENEstimateItemKindDAOGen(connection,getUserProfile()).exists(anObject.kindRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENEstimateItem.kindRef.code%} = {%"+anObject.kindRef.code+"%}");
				}
				statement.setInt(18,anObject.kindRef.code);
			} else {
				statement.setNull(18,java.sql.Types.INTEGER);
			}
			if (anObject.statusRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENEstimateItemStatusDAOGen(connection,getUserProfile()).exists(anObject.statusRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENEstimateItem.statusRef.code%} = {%"+anObject.statusRef.code+"%}");
				}
				statement.setInt(19,anObject.statusRef.code);
			} else {
				statement.setNull(19,java.sql.Types.INTEGER);
			}
			if (anObject.oldStatusRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENEstimateItemStatusDAOGen(connection,getUserProfile()).exists(anObject.oldStatusRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENEstimateItem.oldStatusRef.code%} = {%"+anObject.oldStatusRef.code+"%}");
				}
				statement.setInt(20,anObject.oldStatusRef.code);
			} else {
				statement.setNull(20,java.sql.Types.INTEGER);
			}
			if (anObject.accountingTypeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.techcard.dataminer.generated.TKAccountingTypeDAOGen(connection,getUserProfile()).exists(anObject.accountingTypeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENEstimateItem.accountingTypeRef.code%} = {%"+anObject.accountingTypeRef.code+"%}");
				}
				statement.setInt(21,anObject.accountingTypeRef.code);
			} else {
				statement.setNull(21,java.sql.Types.INTEGER);
			}
			if (anObject.purchaseItemRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.rqorder.dataminer.generated.RQPurchaseItemDAOGen(connection,getUserProfile()).exists(anObject.purchaseItemRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.rqorder.valueobject.ENEstimateItem.purchaseItemRef.code%} = {%"+anObject.purchaseItemRef.code+"%}");
				}
				statement.setInt(22,anObject.purchaseItemRef.code);
			} else {
				statement.setNull(22,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENEstimateItemDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENEstimateItem anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENEstimateItem anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENEstimateItem oldObject = new ENEstimateItem();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENEstimateItem.modify_time_Field+" FROM  ENESTIMATEITEM WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("COUNTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COUNTFACT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PRICE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PRICEVRTU") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COST") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ISUSEVAT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DELIVERYTIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USEWORKTIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COMMENTGEN") == 0) {
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
					if(fieldNameStr.compareTo("PLANREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PLANITEMREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MATERIALREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KINDREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("STATUSREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("OLDSTATUSREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCOUNTINGTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PURCHASEITEMREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENESTIMATEITEM SET  COUNTGEN = ? , COUNTFACT = ? , PRICE = ? , PRICEVRTU = ? , COST = ? , ISUSEVAT = ? , DELIVERYTIME = ? , USEWORKTIME = ? , COMMENTGEN = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , PLANREFCODE = ? , PLANITEMREFCODE = ? , MATERIALREFCODE = ? , TYPEREFCODE = ? , KINDREFCODE = ? , STATUSREFCODE = ? , OLDSTATUSREFCODE = ? , ACCOUNTINGTYPEREFCODE = ? , PURCHASEITEMREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENESTIMATEITEM SET ";
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
					if (anObject.countGen != null) {
						anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(1,anObject.countGen);
					if (anObject.countFact != null) {
						anObject.countFact = anObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(2,anObject.countFact);
					if (anObject.price != null) {
						anObject.price = anObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(3,anObject.price);
					if (anObject.priceVRTU != null) {
						anObject.priceVRTU = anObject.priceVRTU.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(4,anObject.priceVRTU);
					if (anObject.cost != null) {
						anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(5,anObject.cost);
					if (anObject.isUseVAT != Integer.MIN_VALUE) {
						statement.setInt(6,anObject.isUseVAT);
					} else {
						statement.setNull(6,java.sql.Types.INTEGER);
					}
					if (anObject.deliveryTime != Integer.MIN_VALUE) {
						statement.setInt(7,anObject.deliveryTime);
					} else {
						statement.setNull(7,java.sql.Types.INTEGER);
					}
					if (anObject.useWorkTime != Integer.MIN_VALUE) {
						statement.setInt(8,anObject.useWorkTime);
					} else {
						statement.setNull(8,java.sql.Types.INTEGER);
					}
					statement.setString(9,anObject.commentGen);
					statement.setString(10,anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setDate(11,null);
					} else {
						statement.setDate(11,new java.sql.Date(anObject.dateEdit.getTime()));
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(12,null);
					} else {
						statement.setBigDecimal(12,new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.planRef.code != Integer.MIN_VALUE) {
						statement.setInt(13,anObject.planRef.code);
					} else {
						statement.setNull(13,java.sql.Types.INTEGER);
					}
					if (anObject.planItemRef.code != Integer.MIN_VALUE) {
						statement.setInt(14,anObject.planItemRef.code);
					} else {
						statement.setNull(14,java.sql.Types.INTEGER);
					}
					if (anObject.materialRef.code != Integer.MIN_VALUE) {
						statement.setInt(15,anObject.materialRef.code);
					} else {
						statement.setNull(15,java.sql.Types.INTEGER);
					}
					if (anObject.typeRef.code != Integer.MIN_VALUE) {
						statement.setInt(16,anObject.typeRef.code);
					} else {
						statement.setNull(16,java.sql.Types.INTEGER);
					}
					if (anObject.kindRef.code != Integer.MIN_VALUE) {
						statement.setInt(17,anObject.kindRef.code);
					} else {
						statement.setNull(17,java.sql.Types.INTEGER);
					}
					if (anObject.statusRef.code != Integer.MIN_VALUE) {
						statement.setInt(18,anObject.statusRef.code);
					} else {
						statement.setNull(18,java.sql.Types.INTEGER);
					}
					if (anObject.oldStatusRef.code != Integer.MIN_VALUE) {
						statement.setInt(19,anObject.oldStatusRef.code);
					} else {
						statement.setNull(19,java.sql.Types.INTEGER);
					}
					if (anObject.accountingTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(20,anObject.accountingTypeRef.code);
					} else {
						statement.setNull(20,java.sql.Types.INTEGER);
					}
					if (anObject.purchaseItemRef.code != Integer.MIN_VALUE) {
						statement.setInt(21,anObject.purchaseItemRef.code);
					} else {
						statement.setNull(21,java.sql.Types.INTEGER);
					}
					statement.setInt(22,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("COUNTGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.countGen != null) {
								anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.countGen);
							continue;
						}
						if("COUNTFACT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.countFact != null) {
								anObject.countFact = anObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.countFact);
							continue;
						}
						if("PRICE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.price != null) {
								anObject.price = anObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.price);
							continue;
						}
						if("PRICEVRTU".compareTo((String)fields.get(i)) == 0) {
							if (anObject.priceVRTU != null) {
								anObject.priceVRTU = anObject.priceVRTU.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.priceVRTU);
							continue;
						}
						if("COST".compareTo((String)fields.get(i)) == 0) {
							if (anObject.cost != null) {
								anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.cost);
							continue;
						}
						if("ISUSEVAT".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.isUseVAT);
							continue;
						}
						if("DELIVERYTIME".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.deliveryTime);
							continue;
						}
						if("USEWORKTIME".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.useWorkTime);
							continue;
						}
						if("COMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.commentGen);
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.userGen);
							continue;
						}
						if("DATEEDIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateEdit == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.dateEdit.getTime()));
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
						if("PLANREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.planRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.planRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("PLANITEMREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.planItemRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.planItemRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("MATERIALREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.materialRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.materialRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
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
						if("KINDREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.kindRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.kindRef.code);
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
						if("OLDSTATUSREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.oldStatusRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.oldStatusRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("ACCOUNTINGTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.accountingTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.accountingTypeRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("PURCHASEITEMREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.purchaseItemRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.purchaseItemRef.code);
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

	} // end of save(ENEstimateItem anObject,String[] anAttributes)


	public ENEstimateItemShort getShortObject(int anObjectCode) throws PersistenceException {
		ENEstimateItem filterObject = new ENEstimateItem();
		Vector<ENEstimateItemShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENEstimateItemShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENEstimateItem filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.countGen, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.countFact, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.price, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.priceVRTU, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.cost, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.isUseVAT, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.deliveryTime, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.useWorkTime, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.planRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.planItemRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.materialRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.typeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.kindRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.statusRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.oldStatusRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.accountingTypeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.purchaseItemRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENEstimateItemFilter filter) {
		String out = buildCondition((ENEstimateItem)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENEstimateItem filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENEstimateItem.code_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.countGen, ENEstimateItem.countGen_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.countFact, ENEstimateItem.countFact_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.price, ENEstimateItem.price_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.priceVRTU, ENEstimateItem.priceVRTU_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.cost, ENEstimateItem.cost_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.isUseVAT, ENEstimateItem.isUseVAT_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.deliveryTime, ENEstimateItem.deliveryTime_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.useWorkTime, ENEstimateItem.useWorkTime_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentGen, ENEstimateItem.commentGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENEstimateItem.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENEstimateItem.dateEdit_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENEstimateItem.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.planRef.code, ENEstimateItem.planRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.planItemRef.code, ENEstimateItem.planItemRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.materialRef.code, ENEstimateItem.materialRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.typeRef.code, ENEstimateItem.typeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.kindRef.code, ENEstimateItem.kindRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.statusRef.code, ENEstimateItem.statusRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.oldStatusRef.code, ENEstimateItem.oldStatusRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.accountingTypeRef.code, ENEstimateItem.accountingTypeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.purchaseItemRef.code, ENEstimateItem.purchaseItemRef_QFielld, out);
		}
		return out;
	}

	public ENEstimateItemShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENEstimateItemShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENEstimateItemShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENEstimateItemShortList getFilteredList(ENEstimateItem filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENEstimateItemShortList getScrollableFilteredList(ENEstimateItem aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENEstimateItemShortList getScrollableFilteredList(ENEstimateItem aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENEstimateItemShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENEstimateItemShortList getScrollableFilteredList(ENEstimateItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENEstimateItemShortList getScrollableFilteredList(ENEstimateItemFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENEstimateItemShortList getScrollableFilteredList(ENEstimateItem aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENEstimateItemShortList result = new ENEstimateItemShortList();
		ENEstimateItemShort anObject;
		result.list = new Vector<ENEstimateItemShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENESTIMATEITEM.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENESTIMATEITEM.CODE"+
			",ENESTIMATEITEM.COUNTGEN"+
			",ENESTIMATEITEM.COUNTFACT"+
			",ENESTIMATEITEM.PRICE"+
			",ENESTIMATEITEM.PRICEVRTU"+
			",ENESTIMATEITEM.COST"+
			",ENESTIMATEITEM.ISUSEVAT"+
			",ENESTIMATEITEM.DELIVERYTIME"+
			",ENESTIMATEITEM.USEWORKTIME"+
			",ENESTIMATEITEM.USERGEN"+
			",ENESTIMATEITEM.DATEEDIT"+
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
			", ENPLANWORKITEM.CODE " +
			", ENPLANWORKITEM.COUNTGEN " +
			", ENPLANWORKITEM.TIMEGEN " +
			", ENPLANWORKITEM.COSTGEN " +
			", ENPLANWORKITEM.USERGEN " +
			", ENPLANWORKITEM.DATEEDIT " +
			", TKMATERIALS.CODE " +
			", TKMATERIALS.NAME " +
			", TKMATERIALS.COST " +
			", TKMATERIALS.DELIVERYDATE " +
			", TKMATERIALS.NUMKATALOG " +
			", TKMATERIALS.IDENTID " +
			", ENESTIMATEITEMTYPE.CODE " +
			", ENESTIMATEITEMTYPE.NAME " +
			", ENESTIMATEITEMKIND.CODE " +
			", ENESTIMATEITEMKIND.NAME " +
			", ENESTIMATEITEMSTATUS.CODE " +
			", ENESTIMATEITEMSTATUS.NAME " +
			", ENESTIMATEITEMSTATUS.CODE " +
			", ENESTIMATEITEMSTATUS.NAME " +
			", TKACCOUNTINGTYPE.CODE " +
			", TKACCOUNTINGTYPE.NAME " +
			", RQPURCHASEITEM.CODE  as RQPURCHASEITEMCODE   " +
			", RQPURCHASEITEM.MATERIALNAMEGEN " +
			", RQPURCHASEITEM.MEASUREMENTNAMEGEN " +
			", RQPURCHASEITEM.IDENTID2010 " +
			", RQPURCHASEITEM.IDENTID2015 " +
			", RQPURCHASEITEM.COUNTGEN " +
			", RQPURCHASEITEM.COUNTPURCHASE " +
			", RQPURCHASEITEM.PRICEGENWITHOUTNDS " +
			", RQPURCHASEITEM.PRICEGENWITHNDS " +
			", RQPURCHASEITEM.SUMGENWITHOUTNDS " +
			", RQPURCHASEITEM.SUMGENWITHNDS " +
			", RQPURCHASEITEM.PRICEPURCHASEWITHOTNDS " +
			", RQPURCHASEITEM.PRICEPURCHASEWITHNDS " +
			", RQPURCHASEITEM.SUMPURCHASEWITHOUTNDS " +
			", RQPURCHASEITEM.SUMPURCHASEWITHNDS " +
			", RQPURCHASEITEM.COMMENTGEN " +
			", RQPURCHASEITEM.OBJECTSCODES " +
			", RQPURCHASEITEM.OBJECTSNAME " +
			", RQPURCHASEITEM.USERGEN " +
			", RQPURCHASEITEM.COUNTFREE " +
		" FROM ENESTIMATEITEM " +
			", ENPLANWORK " +
			", ENPLANWORKITEM " +
			", TKMATERIALS " +
			", ENESTIMATEITEMTYPE " +
			", ENESTIMATEITEMKIND " +
			", ENESTIMATEITEMSTATUS " +
			", ENESTIMATEITEMSTATUS " +
			", TKACCOUNTINGTYPE " +
			", RQPURCHASEITEM " +
		"";
		whereStr = " ENPLANWORK.CODE = ENESTIMATEITEM.PLANREFCODE" ; //+
		whereStr += " AND ENPLANWORKITEM.CODE = ENESTIMATEITEM.PLANITEMREFCODE" ; //+
		whereStr += " AND TKMATERIALS.CODE = ENESTIMATEITEM.MATERIALREFCODE" ; //+
		whereStr += " AND ENESTIMATEITEMTYPE.CODE = ENESTIMATEITEM.TYPEREFCODE" ; //+
		whereStr += " AND ENESTIMATEITEMKIND.CODE = ENESTIMATEITEM.KINDREFCODE" ; //+
		whereStr += " AND ENESTIMATEITEMSTATUS.CODE = ENESTIMATEITEM.STATUSREFCODE" ; //+
		whereStr += " AND ENESTIMATEITEMSTATUS.CODE = ENESTIMATEITEM.OLDSTATUSREFCODE" ; //+
		whereStr += " AND TKACCOUNTINGTYPE.CODE = ENESTIMATEITEM.ACCOUNTINGTYPEREFCODE" ; //+
		whereStr += " AND RQPURCHASEITEM.CODE = ENESTIMATEITEM.PURCHASEITEMREFCODE" ; //+

	
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
				anObject = new ENEstimateItemShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.countGen = set.getBigDecimal(2);
				if(anObject.countGen != null) {
					anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.countFact = set.getBigDecimal(3);
				if(anObject.countFact != null) {
					anObject.countFact = anObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.price = set.getBigDecimal(4);
				if(anObject.price != null) {
					anObject.price = anObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.priceVRTU = set.getBigDecimal(5);
				if(anObject.priceVRTU != null) {
					anObject.priceVRTU = anObject.priceVRTU.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cost = set.getBigDecimal(6);
				if(anObject.cost != null) {
					anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.isUseVAT = set.getInt(7);
				if ( set.wasNull() ) {
					anObject.isUseVAT = Integer.MIN_VALUE;
				}
				anObject.deliveryTime = set.getInt(8);
				if ( set.wasNull() ) {
					anObject.deliveryTime = Integer.MIN_VALUE;
				}
				anObject.useWorkTime = set.getInt(9);
				if ( set.wasNull() ) {
					anObject.useWorkTime = Integer.MIN_VALUE;
				}
				anObject.userGen = set.getString(10);
				anObject.dateEdit = set.getDate(11);

				anObject.planRefCode = set.getInt(12);
				if(set.wasNull()) {
					anObject.planRefCode = Integer.MIN_VALUE;
				}
				anObject.planRefDateGen = set.getTimestamp(13);
				anObject.planRefDateStart = set.getDate(14);
				anObject.planRefDateFinal = set.getDate(15);
				anObject.planRefYearGen = set.getInt(16);
				if(set.wasNull()) {
					anObject.planRefYearGen = Integer.MIN_VALUE;
				}
				anObject.planRefMonthGen = set.getInt(17);
				if(set.wasNull()) {
					anObject.planRefMonthGen = Integer.MIN_VALUE;
				}
				anObject.planRefYearOriginal = set.getInt(18);
				if(set.wasNull()) {
					anObject.planRefYearOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefMonthOriginal = set.getInt(19);
				if(set.wasNull()) {
					anObject.planRefMonthOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefUserGen = set.getString(20);
				anObject.planRefDateEdit = set.getDate(21);
				anObject.planRefWorkOrderNumber = set.getString(22);
				anObject.planRefDateWorkOrder = set.getDate(23);
				anObject.planRefPriConnectionNumber = set.getString(24);
				anObject.planRefDateEndPriConnection = set.getDate(25);
				anObject.planRefInvestWorksDescription = set.getString(26);
				anObject.planRefServicesFSideFinId = set.getInt(27);
				if(set.wasNull()) {
					anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;
				}
				anObject.planRefServicesFSideCnNum = set.getString(28);
				anObject.planRefTotalTimeHours = set.getBigDecimal(29);
				if(anObject.planRefTotalTimeHours != null) {
					anObject.planRefTotalTimeHours = anObject.planRefTotalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefTotalTimeDays = set.getBigDecimal(30);
				if(anObject.planRefTotalTimeDays != null) {
					anObject.planRefTotalTimeDays = anObject.planRefTotalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefInvestItemNumber = set.getString(31);
				anObject.planItemRefCode = set.getInt(32);
				if(set.wasNull()) {
					anObject.planItemRefCode = Integer.MIN_VALUE;
				}
				anObject.planItemRefCountGen = set.getBigDecimal(33);
				if(anObject.planItemRefCountGen != null) {
					anObject.planItemRefCountGen = anObject.planItemRefCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planItemRefTimeGen = set.getBigDecimal(34);
				if(anObject.planItemRefTimeGen != null) {
					anObject.planItemRefTimeGen = anObject.planItemRefTimeGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planItemRefCostGen = set.getBigDecimal(35);
				if(anObject.planItemRefCostGen != null) {
					anObject.planItemRefCostGen = anObject.planItemRefCostGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planItemRefUserGen = set.getString(36);
				anObject.planItemRefDateEdit = set.getDate(37);
				anObject.materialRefCode = set.getInt(38);
				if(set.wasNull()) {
					anObject.materialRefCode = Integer.MIN_VALUE;
				}
				anObject.materialRefName = set.getString(39);
				anObject.materialRefCost = set.getBigDecimal(40);
				if(anObject.materialRefCost != null) {
					anObject.materialRefCost = anObject.materialRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.materialRefDeliveryDate = set.getInt(41);
				if(set.wasNull()) {
					anObject.materialRefDeliveryDate = Integer.MIN_VALUE;
				}
				anObject.materialRefNumkatalog = set.getString(42);
				anObject.materialRefIdentid = set.getString(43);
				anObject.typeRefCode = set.getInt(44);
				if(set.wasNull()) {
					anObject.typeRefCode = Integer.MIN_VALUE;
				}
				anObject.typeRefName = set.getString(45);
				anObject.kindRefCode = set.getInt(46);
				if(set.wasNull()) {
					anObject.kindRefCode = Integer.MIN_VALUE;
				}
				anObject.kindRefName = set.getString(47);
				anObject.statusRefCode = set.getInt(48);
				if(set.wasNull()) {
					anObject.statusRefCode = Integer.MIN_VALUE;
				}
				anObject.statusRefName = set.getString(49);
				anObject.oldStatusRefCode = set.getInt(50);
				if(set.wasNull()) {
					anObject.oldStatusRefCode = Integer.MIN_VALUE;
				}
				anObject.oldStatusRefName = set.getString(51);
				anObject.accountingTypeRefCode = set.getInt(52);
				if(set.wasNull()) {
					anObject.accountingTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.accountingTypeRefName = set.getString(53);
				anObject.purchaseItemRefCode = set.getInt(54);
				if(set.wasNull()) {
					anObject.purchaseItemRefCode = Integer.MIN_VALUE;
				}
				anObject.purchaseItemRefMaterialNameGen = set.getString(55);
				anObject.purchaseItemRefMeasurementNameGen = set.getString(56);
				anObject.purchaseItemRefIdentid2010 = set.getString(57);
				anObject.purchaseItemRefIdentid2015 = set.getString(58);
				anObject.purchaseItemRefCountGen = set.getBigDecimal(59);
				if(anObject.purchaseItemRefCountGen != null) {
					anObject.purchaseItemRefCountGen = anObject.purchaseItemRefCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.purchaseItemRefCountPurchase = set.getBigDecimal(60);
				if(anObject.purchaseItemRefCountPurchase != null) {
					anObject.purchaseItemRefCountPurchase = anObject.purchaseItemRefCountPurchase.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.purchaseItemRefPriceGenWithoutNds = set.getBigDecimal(61);
				if(anObject.purchaseItemRefPriceGenWithoutNds != null) {
					anObject.purchaseItemRefPriceGenWithoutNds = anObject.purchaseItemRefPriceGenWithoutNds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.purchaseItemRefPriceGenWithNds = set.getBigDecimal(62);
				if(anObject.purchaseItemRefPriceGenWithNds != null) {
					anObject.purchaseItemRefPriceGenWithNds = anObject.purchaseItemRefPriceGenWithNds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.purchaseItemRefSumGenWithoutNds = set.getBigDecimal(63);
				if(anObject.purchaseItemRefSumGenWithoutNds != null) {
					anObject.purchaseItemRefSumGenWithoutNds = anObject.purchaseItemRefSumGenWithoutNds.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.purchaseItemRefSumGenWithNds = set.getBigDecimal(64);
				if(anObject.purchaseItemRefSumGenWithNds != null) {
					anObject.purchaseItemRefSumGenWithNds = anObject.purchaseItemRefSumGenWithNds.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.purchaseItemRefPricePurchaseWithoutNds = set.getBigDecimal(65);
				if(anObject.purchaseItemRefPricePurchaseWithoutNds != null) {
					anObject.purchaseItemRefPricePurchaseWithoutNds = anObject.purchaseItemRefPricePurchaseWithoutNds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.purchaseItemRefPricePurchaseWithNds = set.getBigDecimal(66);
				if(anObject.purchaseItemRefPricePurchaseWithNds != null) {
					anObject.purchaseItemRefPricePurchaseWithNds = anObject.purchaseItemRefPricePurchaseWithNds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.purchaseItemRefSumPurchaseWithoutNds = set.getBigDecimal(67);
				if(anObject.purchaseItemRefSumPurchaseWithoutNds != null) {
					anObject.purchaseItemRefSumPurchaseWithoutNds = anObject.purchaseItemRefSumPurchaseWithoutNds.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.purchaseItemRefSumPurchaseWithNds = set.getBigDecimal(68);
				if(anObject.purchaseItemRefSumPurchaseWithNds != null) {
					anObject.purchaseItemRefSumPurchaseWithNds = anObject.purchaseItemRefSumPurchaseWithNds.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.purchaseItemRefCommentGen = set.getString(69);
				anObject.purchaseItemRefObjectsCodes = set.getString(70);
				anObject.purchaseItemRefObjectsName = set.getString(71);
				anObject.purchaseItemRefUserGen = set.getString(72);
				anObject.purchaseItemRefCountFree = set.getBigDecimal(73);
				if(anObject.purchaseItemRefCountFree != null) {
					anObject.purchaseItemRefCountFree = anObject.purchaseItemRefCountFree.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
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
	
	public int[] getFilteredCodeArray(ENEstimateItemFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENEstimateItemFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENEstimateItem aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENESTIMATEITEM.CODE FROM ENESTIMATEITEM";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENESTIMATEITEM.CODE";
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

	public ENEstimateItem getObject(int uid) throws PersistenceException {
		ENEstimateItem result = new ENEstimateItem();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENEstimateItem anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENESTIMATEITEM.CODE, ENESTIMATEITEM.COUNTGEN, ENESTIMATEITEM.COUNTFACT, ENESTIMATEITEM.PRICE, ENESTIMATEITEM.PRICEVRTU, ENESTIMATEITEM.COST, ENESTIMATEITEM.ISUSEVAT, ENESTIMATEITEM.DELIVERYTIME, ENESTIMATEITEM.USEWORKTIME, ENESTIMATEITEM.COMMENTGEN, ENESTIMATEITEM.USERGEN, ENESTIMATEITEM.DATEEDIT, ENESTIMATEITEM.MODIFY_TIME, ENESTIMATEITEM.PLANREFCODE, ENESTIMATEITEM.PLANITEMREFCODE, ENESTIMATEITEM.MATERIALREFCODE, ENESTIMATEITEM.TYPEREFCODE, ENESTIMATEITEM.KINDREFCODE, ENESTIMATEITEM.STATUSREFCODE, ENESTIMATEITEM.OLDSTATUSREFCODE, ENESTIMATEITEM.ACCOUNTINGTYPEREFCODE, ENESTIMATEITEM.PURCHASEITEMREFCODE "
			+" FROM ENESTIMATEITEM WHERE ENESTIMATEITEM.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.countGen = set.getBigDecimal(2);
				if(anObject.countGen != null) {
					anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.countFact = set.getBigDecimal(3);
				if(anObject.countFact != null) {
					anObject.countFact = anObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.price = set.getBigDecimal(4);
				if(anObject.price != null) {
					anObject.price = anObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.priceVRTU = set.getBigDecimal(5);
				if(anObject.priceVRTU != null) {
					anObject.priceVRTU = anObject.priceVRTU.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cost = set.getBigDecimal(6);
				if(anObject.cost != null) {
					anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.isUseVAT = set.getInt(7);
				if (set.wasNull()) {
					anObject.isUseVAT = Integer.MIN_VALUE;
				}
				anObject.deliveryTime = set.getInt(8);
				if (set.wasNull()) {
					anObject.deliveryTime = Integer.MIN_VALUE;
				}
				anObject.useWorkTime = set.getInt(9);
				if (set.wasNull()) {
					anObject.useWorkTime = Integer.MIN_VALUE;
				}
				anObject.commentGen = set.getString(10);
				anObject.userGen = set.getString(11);
				anObject.dateEdit = set.getDate(12);
				anObject.modify_time = set.getLong(13);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.planRef.code = set.getInt(14);
				if (set.wasNull()) {
					anObject.planRef.code = Integer.MIN_VALUE;
				}
				anObject.planItemRef.code = set.getInt(15);
				if (set.wasNull()) {
					anObject.planItemRef.code = Integer.MIN_VALUE;
				}
				anObject.materialRef.code = set.getInt(16);
				if (set.wasNull()) {
					anObject.materialRef.code = Integer.MIN_VALUE;
				}
				anObject.typeRef.code = set.getInt(17);
				if (set.wasNull()) {
					anObject.typeRef.code = Integer.MIN_VALUE;
				}
				anObject.kindRef.code = set.getInt(18);
				if (set.wasNull()) {
					anObject.kindRef.code = Integer.MIN_VALUE;
				}
				anObject.statusRef.code = set.getInt(19);
				if (set.wasNull()) {
					anObject.statusRef.code = Integer.MIN_VALUE;
				}
				anObject.oldStatusRef.code = set.getInt(20);
				if (set.wasNull()) {
					anObject.oldStatusRef.code = Integer.MIN_VALUE;
				}
				anObject.accountingTypeRef.code = set.getInt(21);
				if (set.wasNull()) {
					anObject.accountingTypeRef.code = Integer.MIN_VALUE;
				}
				anObject.purchaseItemRef.code = set.getInt(22);
				if (set.wasNull()) {
					anObject.purchaseItemRef.code = Integer.MIN_VALUE;
				}
				if(anObject.planRef.code != Integer.MIN_VALUE) {
					anObject.setPlanRef(
						new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).getRef(anObject.planRef.code));
				}
				if(anObject.planItemRef.code != Integer.MIN_VALUE) {
					anObject.setPlanItemRef(
						new com.ksoe.energynet.dataminer.generated.ENPlanWorkItemDAOGen(connection,getUserProfile()).getRef(anObject.planItemRef.code));
				}
				if(anObject.materialRef.code != Integer.MIN_VALUE) {
					anObject.setMaterialRef(
						new com.ksoe.techcard.dataminer.generated.TKMaterialsDAOGen(connection,getUserProfile()).getRef(anObject.materialRef.code));
				}
				if(anObject.typeRef.code != Integer.MIN_VALUE) {
					anObject.setTypeRef(
						new com.ksoe.energynet.dataminer.generated.ENEstimateItemTypeDAOGen(connection,getUserProfile()).getRef(anObject.typeRef.code));
				}
				if(anObject.kindRef.code != Integer.MIN_VALUE) {
					anObject.setKindRef(
						new com.ksoe.energynet.dataminer.generated.ENEstimateItemKindDAOGen(connection,getUserProfile()).getRef(anObject.kindRef.code));
				}
				if(anObject.statusRef.code != Integer.MIN_VALUE) {
					anObject.setStatusRef(
						new com.ksoe.energynet.dataminer.generated.ENEstimateItemStatusDAOGen(connection,getUserProfile()).getRef(anObject.statusRef.code));
				}
				if(anObject.oldStatusRef.code != Integer.MIN_VALUE) {
					anObject.setOldStatusRef(
						new com.ksoe.energynet.dataminer.generated.ENEstimateItemStatusDAOGen(connection,getUserProfile()).getRef(anObject.oldStatusRef.code));
				}
				if(anObject.accountingTypeRef.code != Integer.MIN_VALUE) {
					anObject.setAccountingTypeRef(
						new com.ksoe.techcard.dataminer.generated.TKAccountingTypeDAOGen(connection,getUserProfile()).getRef(anObject.accountingTypeRef.code));
				}
				if(anObject.purchaseItemRef.code != Integer.MIN_VALUE) {
					anObject.setPurchaseItemRef(
						new com.ksoe.rqorder.dataminer.generated.RQPurchaseItemDAOGen(connection,getUserProfile()).getRef(anObject.purchaseItemRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENEstimateItemRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENEstimateItemRef ref = new com.ksoe.energynet.valueobject.references.ENEstimateItemRef();
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

		selectStr = "DELETE FROM  ENESTIMATEITEM WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENEstimateItem object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENEstimateItem.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENEstimateItem.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENEstimateItem.remove%} access denied");
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
	
	public long count(ENEstimateItemFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENEstimateItemFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENEstimateItemFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENESTIMATEITEM", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENEstimateItemFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENESTIMATEITEM");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENEstimateItem.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENEstimateItem.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENESTIMATEITEM.CODE FROM  ENESTIMATEITEM WHERE  ENESTIMATEITEM.CODE = ?";
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
		_checkConditionToken(condition,"code","ENESTIMATEITEM.CODE");
		_checkConditionToken(condition,"countgen","ENESTIMATEITEM.COUNTGEN");
		_checkConditionToken(condition,"countfact","ENESTIMATEITEM.COUNTFACT");
		_checkConditionToken(condition,"price","ENESTIMATEITEM.PRICE");
		_checkConditionToken(condition,"pricevrtu","ENESTIMATEITEM.PRICEVRTU");
		_checkConditionToken(condition,"cost","ENESTIMATEITEM.COST");
		_checkConditionToken(condition,"isusevat","ENESTIMATEITEM.ISUSEVAT");
		_checkConditionToken(condition,"deliverytime","ENESTIMATEITEM.DELIVERYTIME");
		_checkConditionToken(condition,"useworktime","ENESTIMATEITEM.USEWORKTIME");
		_checkConditionToken(condition,"commentgen","ENESTIMATEITEM.COMMENTGEN");
		_checkConditionToken(condition,"usergen","ENESTIMATEITEM.USERGEN");
		_checkConditionToken(condition,"dateedit","ENESTIMATEITEM.DATEEDIT");
		_checkConditionToken(condition,"modify_time","ENESTIMATEITEM.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"planref","PLANREFCODE");
		_checkConditionToken(condition,"planref.code","PLANREFCODE");
		_checkConditionToken(condition,"planitemref","PLANITEMREFCODE");
		_checkConditionToken(condition,"planitemref.code","PLANITEMREFCODE");
		_checkConditionToken(condition,"materialref","MATERIALREFCODE");
		_checkConditionToken(condition,"materialref.code","MATERIALREFCODE");
		_checkConditionToken(condition,"typeref","TYPEREFCODE");
		_checkConditionToken(condition,"typeref.code","TYPEREFCODE");
		_checkConditionToken(condition,"kindref","KINDREFCODE");
		_checkConditionToken(condition,"kindref.code","KINDREFCODE");
		_checkConditionToken(condition,"statusref","STATUSREFCODE");
		_checkConditionToken(condition,"statusref.code","STATUSREFCODE");
		_checkConditionToken(condition,"oldstatusref","OLDSTATUSREFCODE");
		_checkConditionToken(condition,"oldstatusref.code","OLDSTATUSREFCODE");
		_checkConditionToken(condition,"accountingtyperef","ACCOUNTINGTYPEREFCODE");
		_checkConditionToken(condition,"accountingtyperef.code","ACCOUNTINGTYPEREFCODE");
		_checkConditionToken(condition,"purchaseitemref","PURCHASEITEMREFCODE");
		_checkConditionToken(condition,"purchaseitemref.code","PURCHASEITEMREFCODE");
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
	
	private void _collectAutoIncrementFields(ENEstimateItem anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENESTIMATEITEM", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENESTIMATEITEM", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENESTIMATEITEM", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENESTIMATEITEM");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENEstimateItemDAO
