
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
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
import com.ksoe.energynet.valueobject.FINDoc2Act2WorkOrder;
import com.ksoe.energynet.valueobject.filter.FINDoc2Act2WorkOrderFilter;
import com.ksoe.energynet.valueobject.brief.FINDoc2Act2WorkOrderShort;
import com.ksoe.energynet.valueobject.lists.FINDoc2Act2WorkOrderShortList;


/**
 * DAO Object for FINDoc2Act2WorkOrder;
 *
 */

public class FINDoc2Act2WorkOrderDAOGen extends GenericDataMiner {

	public FINDoc2Act2WorkOrderDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public FINDoc2Act2WorkOrderDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(FINDoc2Act2WorkOrder inObject) throws PersistenceException {
		FINDoc2Act2WorkOrder obj = new FINDoc2Act2WorkOrder();
		obj.code = inObject.code;
		loadObject(obj);

		if (inObject.finDocCode300 != obj.finDocCode300){
					return false;
				}

		if(inObject.axJournalId == null && obj.axJournalId == null){}
		else
			if(inObject.axJournalId == null || obj.axJournalId == null) return false;
			else
				if ( ! inObject.axJournalId.equals(obj.axJournalId)){
					return false;
				}
		if (inObject.actRef.code != obj.actRef.code){
			return false;
		}
		if (inObject.workOrderRef.code != obj.workOrderRef.code){
			return false;
		}
		return true;
	}

	public int add(FINDoc2Act2WorkOrder anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(FINDoc2Act2WorkOrder anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO FINDOC2ACT2WORKORDER (CODE,FINDOCCODE300,AXJOURNALID,MODIFY_TIME,ACTREFCODE,WORKORDERREFCODE) VALUES (?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.finDocCode300 != Integer.MIN_VALUE ) {
				statement.setInt(2,anObject.finDocCode300);
			} else {
				statement.setNull(2,java.sql.Types.INTEGER);
			}
			statement.setString(3,anObject.axJournalId);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(4,null);
			} else {
				statement.setBigDecimal(4,new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.actRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENActDAOGen(connection,getUserProfile()).exists(anObject.actRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.FINDoc2Act2WorkOrder.actRef.code%} = {%"+anObject.actRef.code+"%}");
				}
				statement.setInt(5,anObject.actRef.code);
			} else {
				statement.setNull(5,java.sql.Types.INTEGER);
			}
			if (anObject.workOrderRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENWorkOrderDAOGen(connection,getUserProfile()).exists(anObject.workOrderRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.FINDoc2Act2WorkOrder.workOrderRef.code%} = {%"+anObject.workOrderRef.code+"%}");
				}
				statement.setInt(6,anObject.workOrderRef.code);
			} else {
				statement.setNull(6,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%FINDoc2Act2WorkOrderDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(FINDoc2Act2WorkOrder anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(FINDoc2Act2WorkOrder anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			FINDoc2Act2WorkOrder oldObject = new FINDoc2Act2WorkOrder();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+FINDoc2Act2WorkOrder.modify_time_Field+" FROM  FINDOC2ACT2WORKORDER WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("FINDOCCODE300") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AXJOURNALID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("WORKORDERREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE FINDOC2ACT2WORKORDER SET  FINDOCCODE300 = ? , AXJOURNALID = ? , MODIFY_TIME = ? , ACTREFCODE = ? , WORKORDERREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE FINDOC2ACT2WORKORDER SET ";
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
					if (anObject.finDocCode300 != Integer.MIN_VALUE) {
						statement.setInt(1,anObject.finDocCode300);
					} else {
						statement.setNull(1,java.sql.Types.INTEGER);
					}
					statement.setString(2,anObject.axJournalId);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(3,null);
					} else {
						statement.setBigDecimal(3,new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.actRef.code != Integer.MIN_VALUE) {
						statement.setInt(4,anObject.actRef.code);
					} else {
						statement.setNull(4,java.sql.Types.INTEGER);
					}
					if (anObject.workOrderRef.code != Integer.MIN_VALUE) {
						statement.setInt(5,anObject.workOrderRef.code);
					} else {
						statement.setNull(5,java.sql.Types.INTEGER);
					}
					statement.setInt(6,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("FINDOCCODE300".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.finDocCode300);
							continue;
						}
						if("AXJOURNALID".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.axJournalId);
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
						if("ACTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.actRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.actRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("WORKORDERREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.workOrderRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.workOrderRef.code);
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

	} // end of save(FINDoc2Act2WorkOrder anObject,String[] anAttributes)


	public FINDoc2Act2WorkOrderShort getShortObject(int anObjectCode) throws PersistenceException {
		FINDoc2Act2WorkOrder filterObject = new FINDoc2Act2WorkOrder();
		Vector<FINDoc2Act2WorkOrderShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (FINDoc2Act2WorkOrderShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(FINDoc2Act2WorkOrder filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.finDocCode300, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.axJournalId, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.actRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.workOrderRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(FINDoc2Act2WorkOrderFilter filter) {
		String out = buildCondition((FINDoc2Act2WorkOrder)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(FINDoc2Act2WorkOrder filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, FINDoc2Act2WorkOrder.code_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.finDocCode300, FINDoc2Act2WorkOrder.finDocCode300_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.axJournalId, FINDoc2Act2WorkOrder.axJournalId_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, FINDoc2Act2WorkOrder.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.actRef.code, FINDoc2Act2WorkOrder.actRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.workOrderRef.code, FINDoc2Act2WorkOrder.workOrderRef_QFielld, out);
		}
		return out;
	}

	public FINDoc2Act2WorkOrderShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public FINDoc2Act2WorkOrderShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public FINDoc2Act2WorkOrderShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public FINDoc2Act2WorkOrderShortList getFilteredList(FINDoc2Act2WorkOrder filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public FINDoc2Act2WorkOrderShortList getScrollableFilteredList(FINDoc2Act2WorkOrder aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public FINDoc2Act2WorkOrderShortList getScrollableFilteredList(FINDoc2Act2WorkOrder aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public FINDoc2Act2WorkOrderShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public FINDoc2Act2WorkOrderShortList getScrollableFilteredList(FINDoc2Act2WorkOrderFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public FINDoc2Act2WorkOrderShortList getScrollableFilteredList(FINDoc2Act2WorkOrderFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public FINDoc2Act2WorkOrderShortList getScrollableFilteredList(FINDoc2Act2WorkOrder aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		FINDoc2Act2WorkOrderShortList result = new FINDoc2Act2WorkOrderShortList();
		FINDoc2Act2WorkOrderShort anObject;
		result.list = new Vector<FINDoc2Act2WorkOrderShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "FINDOC2ACT2WORKORDER.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"FINDOC2ACT2WORKORDER.CODE"+
			",FINDOC2ACT2WORKORDER.FINDOCCODE300"+
			",FINDOC2ACT2WORKORDER.AXJOURNALID"+
			", ENACT.CODE " +
			", ENACT.NUMBERGEN " +
			", ENACT.DATEGEN " +
			", ENACT.FINDOCCODE " +
			", ENACT.FINDOCMECHANICCODE " +
			", ENACT.FINMOLNAME " +
			", ENACT.FINMECHANICNAME " +
			", ENACT.INVNUMBER " +
			", ENACT.USERGEN " +
			", ENACT.DATEEDIT " +
			", ENACT.DATEACT " +
			", ENWORKORDER.CODE " +
			", ENWORKORDER.WORKORDERNUMBER " +
			", ENWORKORDER.DATEGEN " +
			", ENWORKORDER.FINMOLCODE " +
			", ENWORKORDER.FINMOLNAME " +
			", ENWORKORDER.FINMECHANICCODE " +
			", ENWORKORDER.FINMECHANICNAME " +
			", ENWORKORDER.USERGEN " +
			", ENWORKORDER.DATEEDIT " +
		" FROM FINDOC2ACT2WORKORDER " +
			", ENACT " +
			", ENWORKORDER " +
		"";
		whereStr = " ENACT.CODE = FINDOC2ACT2WORKORDER.ACTREFCODE" ; //+
		whereStr += " AND ENWORKORDER.CODE = FINDOC2ACT2WORKORDER.WORKORDERREFCODE" ; //+

	
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
				anObject = new FINDoc2Act2WorkOrderShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.finDocCode300 = set.getInt(2);
				if ( set.wasNull() ) {
					anObject.finDocCode300 = Integer.MIN_VALUE;
				}
				anObject.axJournalId = set.getString(3);

				anObject.actRefCode = set.getInt(4);
				if(set.wasNull()) {
					anObject.actRefCode = Integer.MIN_VALUE;
				}
				anObject.actRefNumberGen = set.getString(5);
				anObject.actRefDateGen = set.getDate(6);
				anObject.actRefFinDocCode = set.getInt(7);
				if(set.wasNull()) {
					anObject.actRefFinDocCode = Integer.MIN_VALUE;
				}
				anObject.actRefFinDocMechanicCode = set.getInt(8);
				if(set.wasNull()) {
					anObject.actRefFinDocMechanicCode = Integer.MIN_VALUE;
				}
				anObject.actRefFinMolName = set.getString(9);
				anObject.actRefFinMechanicName = set.getString(10);
				anObject.actRefInvNumber = set.getString(11);
				anObject.actRefUserGen = set.getString(12);
				anObject.actRefDateEdit = set.getDate(13);
				anObject.actRefDateAct = set.getDate(14);
				anObject.workOrderRefCode = set.getInt(15);
				if(set.wasNull()) {
					anObject.workOrderRefCode = Integer.MIN_VALUE;
				}
				anObject.workOrderRefWorkOrderNumber = set.getString(16);
				anObject.workOrderRefDateGen = set.getDate(17);
				anObject.workOrderRefFinMolCode = set.getString(18);
				anObject.workOrderRefFinMolName = set.getString(19);
				anObject.workOrderRefFinMechanicCode = set.getString(20);
				anObject.workOrderRefFinMechanicName = set.getString(21);
				anObject.workOrderRefUserGen = set.getString(22);
				anObject.workOrderRefDateEdit = set.getDate(23);

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
	
	public int[] getFilteredCodeArray(FINDoc2Act2WorkOrderFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}


	public int[] getFilteredCodeArray(FINDoc2Act2WorkOrder aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT FINDOC2ACT2WORKORDER.CODE FROM FINDOC2ACT2WORKORDER";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "FINDOC2ACT2WORKORDER.CODE";
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

	public FINDoc2Act2WorkOrder getObject(int uid) throws PersistenceException {
		FINDoc2Act2WorkOrder result = new FINDoc2Act2WorkOrder();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(FINDoc2Act2WorkOrder anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  FINDOC2ACT2WORKORDER.CODE, FINDOC2ACT2WORKORDER.FINDOCCODE300, FINDOC2ACT2WORKORDER.AXJOURNALID, FINDOC2ACT2WORKORDER.MODIFY_TIME, FINDOC2ACT2WORKORDER.ACTREFCODE, FINDOC2ACT2WORKORDER.WORKORDERREFCODE "
			+" FROM FINDOC2ACT2WORKORDER WHERE FINDOC2ACT2WORKORDER.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			}
			anObject.finDocCode300 = set.getInt(2);
			if (set.wasNull()) {
				anObject.finDocCode300 = Integer.MIN_VALUE;
			}
			anObject.axJournalId = set.getString(3);
			anObject.modify_time = set.getLong(4);
			if(set.wasNull()) {
				anObject.modify_time = Long.MIN_VALUE;
			}
			anObject.actRef.code = set.getInt(5);
			if (set.wasNull()) {
				anObject.actRef.code = Integer.MIN_VALUE;
			}
			anObject.workOrderRef.code = set.getInt(6);
			if (set.wasNull()) {
				anObject.workOrderRef.code = Integer.MIN_VALUE;
			}
			if(anObject.actRef.code != Integer.MIN_VALUE) {
				anObject.setActRef(
					new com.ksoe.energynet.dataminer.generated.ENActDAOGen(connection,getUserProfile()).getRef(anObject.actRef.code));
			}
			if(anObject.workOrderRef.code != Integer.MIN_VALUE) {
				anObject.setWorkOrderRef(
					new com.ksoe.energynet.dataminer.generated.ENWorkOrderDAOGen(connection,getUserProfile()).getRef(anObject.workOrderRef.code));
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


	public com.ksoe.energynet.valueobject.references.FINDoc2Act2WorkOrderRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.FINDoc2Act2WorkOrderRef ref = new com.ksoe.energynet.valueobject.references.FINDoc2Act2WorkOrderRef();
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

		selectStr = "DELETE FROM  FINDOC2ACT2WORKORDER WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		FINDoc2Act2WorkOrder object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%FINDoc2Act2WorkOrder.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(FINDoc2Act2WorkOrder.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%FINDoc2Act2WorkOrder.remove%} access denied");
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
	
	public long count(FINDoc2Act2WorkOrderFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(FINDoc2Act2WorkOrderFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, FINDoc2Act2WorkOrderFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM FINDOC2ACT2WORKORDER", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, FINDoc2Act2WorkOrderFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "FINDOC2ACT2WORKORDER");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(FINDoc2Act2WorkOrder.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%FINDoc2Act2WorkOrder.getObject%} access denied");
		}

		selectStr =
			"SELECT  FINDOC2ACT2WORKORDER.CODE FROM  FINDOC2ACT2WORKORDER WHERE  FINDOC2ACT2WORKORDER.CODE = ?";
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
		_checkConditionToken(condition,"code","FINDOC2ACT2WORKORDER.CODE");
		_checkConditionToken(condition,"findoccode300","FINDOC2ACT2WORKORDER.FINDOCCODE300");
		_checkConditionToken(condition,"axjournalid","FINDOC2ACT2WORKORDER.AXJOURNALID");
		_checkConditionToken(condition,"modify_time","FINDOC2ACT2WORKORDER.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"actref","ACTREFCODE");
		_checkConditionToken(condition,"actref.code","ACTREFCODE");
		_checkConditionToken(condition,"workorderref","WORKORDERREFCODE");
		_checkConditionToken(condition,"workorderref.code","WORKORDERREFCODE");
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
	
	public void _collectAutoIncrementFields(FINDoc2Act2WorkOrder anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("FINDOC2ACT2WORKORDER", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("FINDOC2ACT2WORKORDER", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("FINDOC2ACT2WORKORDER", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: FINDOC2ACT2WORKORDER");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of FINDoc2Act2WorkOrderDAO
