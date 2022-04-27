
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
import com.ksoe.energynet.valueobject.FINDoc2MolData;
import com.ksoe.energynet.valueobject.filter.FINDoc2MolDataFilter;
import com.ksoe.energynet.valueobject.brief.FINDoc2MolDataShort;
import com.ksoe.energynet.valueobject.lists.FINDoc2MolDataShortList;


/**
 * DAO Object for FINDoc2MolData;
 *
 */

public class FINDoc2MolDataDAOGen extends GenericDataMiner {

	public FINDoc2MolDataDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public FINDoc2MolDataDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(FINDoc2MolData inObject) throws PersistenceException {
		FINDoc2MolData obj = new FINDoc2MolData();
		obj.code = inObject.code;
		loadObject(obj);

		if (inObject.finDocCode != obj.finDocCode){
					return false;
				}

		if (inObject.finDocCode2 != obj.finDocCode2){
					return false;
				}

		if(inObject.axJournalId == null && obj.axJournalId == null){}
		else
			if(inObject.axJournalId == null || obj.axJournalId == null) return false;
			else
				if ( ! inObject.axJournalId.equals(obj.axJournalId)){
					return false;
				}
		if (inObject.molData.code != obj.molData.code){
			return false;
		}
		if (inObject.finDocTypeRef.code != obj.finDocTypeRef.code){
			return false;
		}
		return true;
	}

	public int add(FINDoc2MolData anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(FINDoc2MolData anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO FINDOC2MOLDATA (CODE,FINDOCCODE,FINDOCCODE2,AXJOURNALID,MODIFY_TIME,MOLDATACODE,FINDOCTYPEREFCODE) VALUES (?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.finDocCode != Integer.MIN_VALUE ) {
				statement.setInt(2,anObject.finDocCode);
			} else {
				statement.setNull(2,java.sql.Types.INTEGER);
			}
			if (anObject.finDocCode2 != Integer.MIN_VALUE ) {
				statement.setInt(3,anObject.finDocCode2);
			} else {
				statement.setNull(3,java.sql.Types.INTEGER);
			}
			statement.setString(4,anObject.axJournalId);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(5,null);
			} else {
				statement.setBigDecimal(5,new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.molData.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.FINMolDataDAOGen(connection,getUserProfile()).exists(anObject.molData.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.FINDoc2MolData.molData.code%} = {%"+anObject.molData.code+"%}");
				}
				statement.setInt(6,anObject.molData.code);
			} else {
				statement.setNull(6,java.sql.Types.INTEGER);
			}
			if (anObject.finDocTypeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.FINDocTypeDAOGen(connection,getUserProfile()).exists(anObject.finDocTypeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.FINDoc2MolData.finDocTypeRef.code%} = {%"+anObject.finDocTypeRef.code+"%}");
				}
				statement.setInt(7,anObject.finDocTypeRef.code);
			} else {
				statement.setNull(7,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%FINDoc2MolDataDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(FINDoc2MolData anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(FINDoc2MolData anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			FINDoc2MolData oldObject = new FINDoc2MolData();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+FINDoc2MolData.modify_time_Field+" FROM  FINDOC2MOLDATA WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("FINDOCCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FINDOCCODE2") == 0) {
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
					if(fieldNameStr.compareTo("MOLDATA") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FINDOCTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE FINDOC2MOLDATA SET  FINDOCCODE = ? , FINDOCCODE2 = ? , AXJOURNALID = ? , MODIFY_TIME = ? , MOLDATACODE = ? , FINDOCTYPEREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE FINDOC2MOLDATA SET ";
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
					if (anObject.finDocCode != Integer.MIN_VALUE) {
						statement.setInt(1,anObject.finDocCode);
					} else {
						statement.setNull(1,java.sql.Types.INTEGER);
					}
					if (anObject.finDocCode2 != Integer.MIN_VALUE) {
						statement.setInt(2,anObject.finDocCode2);
					} else {
						statement.setNull(2,java.sql.Types.INTEGER);
					}
					statement.setString(3,anObject.axJournalId);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(4,null);
					} else {
						statement.setBigDecimal(4,new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.molData.code != Integer.MIN_VALUE) {
						statement.setInt(5,anObject.molData.code);
					} else {
						statement.setNull(5,java.sql.Types.INTEGER);
					}
					if (anObject.finDocTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(6,anObject.finDocTypeRef.code);
					} else {
						statement.setNull(6,java.sql.Types.INTEGER);
					}
					statement.setInt(7,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("FINDOCCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.finDocCode);
							continue;
						}
						if("FINDOCCODE2".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.finDocCode2);
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
						if("MOLDATA".compareTo((String)fields.get(i)) == 0) {
							if (anObject.molData.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.molData.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("FINDOCTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.finDocTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.finDocTypeRef.code);
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

	} // end of save(FINDoc2MolData anObject,String[] anAttributes)


	public FINDoc2MolDataShort getShortObject(int anObjectCode) throws PersistenceException {
		FINDoc2MolData filterObject = new FINDoc2MolData();
		Vector<FINDoc2MolDataShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (FINDoc2MolDataShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(FINDoc2MolData filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.finDocCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.finDocCode2, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.axJournalId, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.molData.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.finDocTypeRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(FINDoc2MolDataFilter filter) {
		String out = buildCondition((FINDoc2MolData)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(FINDoc2MolData filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, FINDoc2MolData.code_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.finDocCode, FINDoc2MolData.finDocCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.finDocCode2, FINDoc2MolData.finDocCode2_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.axJournalId, FINDoc2MolData.axJournalId_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, FINDoc2MolData.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.molData.code, FINDoc2MolData.molData_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.finDocTypeRef.code, FINDoc2MolData.finDocTypeRef_QFielld, out);
		}
		return out;
	}

	public FINDoc2MolDataShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public FINDoc2MolDataShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public FINDoc2MolDataShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public FINDoc2MolDataShortList getFilteredList(FINDoc2MolData filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public FINDoc2MolDataShortList getScrollableFilteredList(FINDoc2MolData aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public FINDoc2MolDataShortList getScrollableFilteredList(FINDoc2MolData aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public FINDoc2MolDataShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public FINDoc2MolDataShortList getScrollableFilteredList(FINDoc2MolDataFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public FINDoc2MolDataShortList getScrollableFilteredList(FINDoc2MolDataFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public FINDoc2MolDataShortList getScrollableFilteredList(FINDoc2MolData aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		FINDoc2MolDataShortList result = new FINDoc2MolDataShortList();
		FINDoc2MolDataShort anObject;
		result.list = new Vector<FINDoc2MolDataShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "FINDOC2MOLDATA.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"FINDOC2MOLDATA.CODE"+
			",FINDOC2MOLDATA.FINDOCCODE"+
			",FINDOC2MOLDATA.FINDOCCODE2"+
			",FINDOC2MOLDATA.AXJOURNALID"+
			", FINMOLDATA.CODE " +
			", FINMOLDATA.FINMOLCODE " +
			", FINMOLDATA.FINMOLNAME " +
			", FINDOCTYPE.CODE " +
			", FINDOCTYPE.NAME " +
		" FROM FINDOC2MOLDATA " +
			", FINMOLDATA " +
			", FINDOCTYPE " +
		"";
		whereStr = " FINMOLDATA.CODE = FINDOC2MOLDATA.MOLDATACODE" ; //+
		whereStr += " AND FINDOCTYPE.CODE = FINDOC2MOLDATA.FINDOCTYPEREFCODE" ; //+

	
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
				anObject = new FINDoc2MolDataShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.finDocCode = set.getInt(2);
				if ( set.wasNull() ) {
					anObject.finDocCode = Integer.MIN_VALUE;
				}
				anObject.finDocCode2 = set.getInt(3);
				if ( set.wasNull() ) {
					anObject.finDocCode2 = Integer.MIN_VALUE;
				}
				anObject.axJournalId = set.getString(4);

				anObject.molDataCode = set.getInt(5);
				if(set.wasNull()) {
					anObject.molDataCode = Integer.MIN_VALUE;
				}
				anObject.molDataFinMolCode = set.getString(6);
				anObject.molDataFinMolName = set.getString(7);
				anObject.finDocTypeRefCode = set.getInt(8);
				if(set.wasNull()) {
					anObject.finDocTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.finDocTypeRefName = set.getString(9);

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
	
	public int[] getFilteredCodeArray(FINDoc2MolDataFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}


	public int[] getFilteredCodeArray(FINDoc2MolData aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT FINDOC2MOLDATA.CODE FROM FINDOC2MOLDATA";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "FINDOC2MOLDATA.CODE";
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

	public FINDoc2MolData getObject(int uid) throws PersistenceException {
		FINDoc2MolData result = new FINDoc2MolData();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(FINDoc2MolData anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  FINDOC2MOLDATA.CODE, FINDOC2MOLDATA.FINDOCCODE, FINDOC2MOLDATA.FINDOCCODE2, FINDOC2MOLDATA.AXJOURNALID, FINDOC2MOLDATA.MODIFY_TIME, FINDOC2MOLDATA.MOLDATACODE, FINDOC2MOLDATA.FINDOCTYPEREFCODE "
			+" FROM FINDOC2MOLDATA WHERE FINDOC2MOLDATA.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			}
			anObject.finDocCode = set.getInt(2);
			if (set.wasNull()) {
				anObject.finDocCode = Integer.MIN_VALUE;
			}
			anObject.finDocCode2 = set.getInt(3);
			if (set.wasNull()) {
				anObject.finDocCode2 = Integer.MIN_VALUE;
			}
			anObject.axJournalId = set.getString(4);
			anObject.modify_time = set.getLong(5);
			if(set.wasNull()) {
				anObject.modify_time = Long.MIN_VALUE;
			}
			anObject.molData.code = set.getInt(6);
			if (set.wasNull()) {
				anObject.molData.code = Integer.MIN_VALUE;
			}
			anObject.finDocTypeRef.code = set.getInt(7);
			if (set.wasNull()) {
				anObject.finDocTypeRef.code = Integer.MIN_VALUE;
			}
			if(anObject.molData.code != Integer.MIN_VALUE) {
				anObject.setMolData(
					new com.ksoe.energynet.dataminer.generated.FINMolDataDAOGen(connection,getUserProfile()).getObject(anObject.molData.code));
			}
			if(anObject.finDocTypeRef.code != Integer.MIN_VALUE) {
				anObject.setFinDocTypeRef(
					new com.ksoe.energynet.dataminer.generated.FINDocTypeDAOGen(connection,getUserProfile()).getRef(anObject.finDocTypeRef.code));
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


	public com.ksoe.energynet.valueobject.references.FINDoc2MolDataRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.FINDoc2MolDataRef ref = new com.ksoe.energynet.valueobject.references.FINDoc2MolDataRef();
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

		selectStr = "DELETE FROM  FINDOC2MOLDATA WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		FINDoc2MolData object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%FINDoc2MolData.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(FINDoc2MolData.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%FINDoc2MolData.remove%} access denied");
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
	
	public long count(FINDoc2MolDataFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(FINDoc2MolDataFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, FINDoc2MolDataFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM FINDOC2MOLDATA", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, FINDoc2MolDataFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "FINDOC2MOLDATA");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(FINDoc2MolData.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%FINDoc2MolData.getObject%} access denied");
		}

		selectStr =
			"SELECT  FINDOC2MOLDATA.CODE FROM  FINDOC2MOLDATA WHERE  FINDOC2MOLDATA.CODE = ?";
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
		_checkConditionToken(condition,"code","FINDOC2MOLDATA.CODE");
		_checkConditionToken(condition,"findoccode","FINDOC2MOLDATA.FINDOCCODE");
		_checkConditionToken(condition,"findoccode2","FINDOC2MOLDATA.FINDOCCODE2");
		_checkConditionToken(condition,"axjournalid","FINDOC2MOLDATA.AXJOURNALID");
		_checkConditionToken(condition,"modify_time","FINDOC2MOLDATA.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"moldata","MOLDATACODE");
		_checkConditionToken(condition,"moldata.code","MOLDATACODE");
		_checkConditionToken(condition,"findoctyperef","FINDOCTYPEREFCODE");
		_checkConditionToken(condition,"findoctyperef.code","FINDOCTYPEREFCODE");
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
	
	private void _collectAutoIncrementFields(FINDoc2MolData anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("FINDOC2MOLDATA", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("FINDOC2MOLDATA", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("FINDOC2MOLDATA", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: FINDOC2MOLDATA");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of FINDoc2MolDataDAO
