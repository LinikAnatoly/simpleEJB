
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
import com.ksoe.energynet.valueobject.ENSettingsValues;
import com.ksoe.energynet.valueobject.filter.ENSettingsValuesFilter;
import com.ksoe.energynet.valueobject.brief.ENSettingsValuesShort;
import com.ksoe.energynet.valueobject.lists.ENSettingsValuesShortList;


/**
 * DAO Object for ENSettingsValues;
 *
 */

public class ENSettingsValuesDAOGen extends GenericDataMiner {

	public ENSettingsValuesDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENSettingsValuesDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENSettingsValues inObject) throws PersistenceException {
		ENSettingsValues obj = new ENSettingsValues();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.dateStart == null && obj.dateStart == null){} else 
			if(inObject.dateStart == null || obj.dateStart == null) return false;
			else
				if (inObject.dateStart.compareTo(obj.dateStart) != 0){
					return false;
				}

		if(inObject.dateFinal == null && obj.dateFinal == null){} else 
			if(inObject.dateFinal == null || obj.dateFinal == null) return false;
			else
				if (inObject.dateFinal.compareTo(obj.dateFinal) != 0){
					return false;
				}

		if(inObject.value == null && obj.value == null){}
		else
			if(inObject.value == null || obj.value == null) return false;
			else
				if ( ! inObject.value.equals(obj.value)){
					return false;
				}

		if(inObject.userAdd == null && obj.userAdd == null){}
		else
			if(inObject.userAdd == null || obj.userAdd == null) return false;
			else
				if ( ! inObject.userAdd.equals(obj.userAdd)){
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
		if (inObject.settingsRef.code != obj.settingsRef.code){
			return false;
		}
		return true;
	}

	public int add(ENSettingsValues anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENSettingsValues anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENSETTINGSVALUES (CODE,DATESTART,DATEFINAL,VALUE,USERADD,COMMENTGEN,USERGEN,DATEEDIT,MODIFY_TIME,SETTINGSREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.dateStart == null) {
				statement.setDate(2,null);
			} else {
				statement.setDate(2,new java.sql.Date(anObject.dateStart.getTime()));
			}
			if (anObject.dateFinal == null) {
				statement.setDate(3,null);
			} else {
				statement.setDate(3,new java.sql.Date(anObject.dateFinal.getTime()));
			}
			statement.setString(4,anObject.value);
			statement.setString(5,anObject.userAdd);
			statement.setString(6,anObject.commentGen);
			statement.setString(7,anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setDate(8,null);
			} else {
				statement.setDate(8,new java.sql.Date(anObject.dateEdit.getTime()));
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(9,null);
			} else {
				statement.setBigDecimal(9,new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.settingsRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENSettingsDAOGen(connection,getUserProfile()).exists(anObject.settingsRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENSettingsValues.settingsRef.code%} = {%"+anObject.settingsRef.code+"%}");
				}
				statement.setInt(10,anObject.settingsRef.code);
			} else {
				statement.setNull(10,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENSettingsValuesDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENSettingsValues anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENSettingsValues anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENSettingsValues oldObject = new ENSettingsValues();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENSettingsValues.modify_time_Field+" FROM  ENSETTINGSVALUES WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("VALUE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USERADD") == 0) {
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
					if(fieldNameStr.compareTo("SETTINGSREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENSETTINGSVALUES SET  DATESTART = ? , DATEFINAL = ? , VALUE = ? , USERADD = ? , COMMENTGEN = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , SETTINGSREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENSETTINGSVALUES SET ";
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
					if (anObject.dateStart == null) {
						statement.setDate(1,null);
					} else {
						statement.setDate(1,new java.sql.Date(anObject.dateStart.getTime()));
					}
					if (anObject.dateFinal == null) {
						statement.setDate(2,null);
					} else {
						statement.setDate(2,new java.sql.Date(anObject.dateFinal.getTime()));
					}
					statement.setString(3,anObject.value);
					statement.setString(4,anObject.userAdd);
					statement.setString(5,anObject.commentGen);
					statement.setString(6,anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setDate(7,null);
					} else {
						statement.setDate(7,new java.sql.Date(anObject.dateEdit.getTime()));
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(8,null);
					} else {
						statement.setBigDecimal(8,new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.settingsRef.code != Integer.MIN_VALUE) {
						statement.setInt(9,anObject.settingsRef.code);
					} else {
						statement.setNull(9,java.sql.Types.INTEGER);
					}
					statement.setInt(10,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("DATESTART".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateStart == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.dateStart.getTime()));
							}
							continue;
						}
						if("DATEFINAL".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateFinal == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.dateFinal.getTime()));
							}
							continue;
						}
						if("VALUE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.value);
							continue;
						}
						if("USERADD".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.userAdd);
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
						if("SETTINGSREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.settingsRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.settingsRef.code);
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

	} // end of save(ENSettingsValues anObject,String[] anAttributes)


	public ENSettingsValuesShort getShortObject(int anObjectCode) throws PersistenceException {
		ENSettingsValues filterObject = new ENSettingsValues();
		Vector<ENSettingsValuesShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENSettingsValuesShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENSettingsValues filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateStart, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateFinal, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.value, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userAdd, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.settingsRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENSettingsValuesFilter filter) {
		String out = buildCondition((ENSettingsValues)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENSettingsValues filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENSettingsValues.code_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateStart, ENSettingsValues.dateStart_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateFinal, ENSettingsValues.dateFinal_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.value, ENSettingsValues.value_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userAdd, ENSettingsValues.userAdd_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentGen, ENSettingsValues.commentGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENSettingsValues.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENSettingsValues.dateEdit_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENSettingsValues.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.settingsRef.code, ENSettingsValues.settingsRef_QFielld, out);
		}
		return out;
	}

	public ENSettingsValuesShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENSettingsValuesShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENSettingsValuesShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENSettingsValuesShortList getFilteredList(ENSettingsValues filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENSettingsValuesShortList getScrollableFilteredList(ENSettingsValues aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENSettingsValuesShortList getScrollableFilteredList(ENSettingsValues aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENSettingsValuesShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENSettingsValuesShortList getScrollableFilteredList(ENSettingsValuesFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENSettingsValuesShortList getScrollableFilteredList(ENSettingsValuesFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENSettingsValuesShortList getScrollableFilteredList(ENSettingsValues aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENSettingsValuesShortList result = new ENSettingsValuesShortList();
		ENSettingsValuesShort anObject;
		result.list = new Vector<ENSettingsValuesShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSETTINGSVALUES.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSETTINGSVALUES.CODE"+
			",ENSETTINGSVALUES.DATESTART"+
			",ENSETTINGSVALUES.DATEFINAL"+
			",ENSETTINGSVALUES.VALUE"+
			",ENSETTINGSVALUES.USERADD"+
			",ENSETTINGSVALUES.COMMENTGEN"+
			",ENSETTINGSVALUES.USERGEN"+
			", ENSETTINGS.CODE " +
			", ENSETTINGS.KEY " +
			", ENSETTINGS.COMMENT " +
		" FROM ENSETTINGSVALUES " +
			", ENSETTINGS " +
		"";
		whereStr = " ENSETTINGS.CODE = ENSETTINGSVALUES.SETTINGSREFCODE" ; //+

	
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
				anObject = new ENSettingsValuesShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.dateStart = set.getDate(2);
				anObject.dateFinal = set.getDate(3);
				anObject.value = set.getString(4);
				anObject.userAdd = set.getString(5);
				anObject.commentGen = set.getString(6);
				anObject.userGen = set.getString(7);

				anObject.settingsRefCode = set.getInt(8);
				if(set.wasNull()) {
					anObject.settingsRefCode = Integer.MIN_VALUE;
				}
				anObject.settingsRefKey = set.getString(9);
				anObject.settingsRefComment = set.getString(10);

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
	
	public int[] getFilteredCodeArray(ENSettingsValuesFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}


	public int[] getFilteredCodeArray(ENSettingsValues aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENSETTINGSVALUES.CODE FROM ENSETTINGSVALUES";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSETTINGSVALUES.CODE";
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

	public ENSettingsValues getObject(int uid) throws PersistenceException {
		ENSettingsValues result = new ENSettingsValues();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENSettingsValues anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENSETTINGSVALUES.CODE, ENSETTINGSVALUES.DATESTART, ENSETTINGSVALUES.DATEFINAL, ENSETTINGSVALUES.VALUE, ENSETTINGSVALUES.USERADD, ENSETTINGSVALUES.COMMENTGEN, ENSETTINGSVALUES.USERGEN, ENSETTINGSVALUES.DATEEDIT, ENSETTINGSVALUES.MODIFY_TIME, ENSETTINGSVALUES.SETTINGSREFCODE "
			+" FROM ENSETTINGSVALUES WHERE ENSETTINGSVALUES.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			}
			anObject.dateStart = set.getDate(2);
			anObject.dateFinal = set.getDate(3);
			anObject.value = set.getString(4);
			anObject.userAdd = set.getString(5);
			anObject.commentGen = set.getString(6);
			anObject.userGen = set.getString(7);
			anObject.dateEdit = set.getDate(8);
			anObject.modify_time = set.getLong(9);
			if(set.wasNull()) {
				anObject.modify_time = Long.MIN_VALUE;
			}
			anObject.settingsRef.code = set.getInt(10);
			if (set.wasNull()) {
				anObject.settingsRef.code = Integer.MIN_VALUE;
			}
			if(anObject.settingsRef.code != Integer.MIN_VALUE) {
				anObject.setSettingsRef(
					new com.ksoe.energynet.dataminer.generated.ENSettingsDAOGen(connection,getUserProfile()).getRef(anObject.settingsRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENSettingsValuesRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENSettingsValuesRef ref = new com.ksoe.energynet.valueobject.references.ENSettingsValuesRef();
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

		selectStr = "DELETE FROM  ENSETTINGSVALUES WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENSettingsValues object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENSettingsValues.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENSettingsValues.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENSettingsValues.remove%} access denied");
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
	
	public long count(ENSettingsValuesFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENSettingsValuesFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENSettingsValuesFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENSETTINGSVALUES", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENSettingsValuesFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENSETTINGSVALUES");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENSettingsValues.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENSettingsValues.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENSETTINGSVALUES.CODE FROM  ENSETTINGSVALUES WHERE  ENSETTINGSVALUES.CODE = ?";
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
		_checkConditionToken(condition,"code","ENSETTINGSVALUES.CODE");
		_checkConditionToken(condition,"datestart","ENSETTINGSVALUES.DATESTART");
		_checkConditionToken(condition,"datefinal","ENSETTINGSVALUES.DATEFINAL");
		_checkConditionToken(condition,"value","ENSETTINGSVALUES.VALUE");
		_checkConditionToken(condition,"useradd","ENSETTINGSVALUES.USERADD");
		_checkConditionToken(condition,"commentgen","ENSETTINGSVALUES.COMMENTGEN");
		_checkConditionToken(condition,"usergen","ENSETTINGSVALUES.USERGEN");
		_checkConditionToken(condition,"dateedit","ENSETTINGSVALUES.DATEEDIT");
		_checkConditionToken(condition,"modify_time","ENSETTINGSVALUES.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"settingsref","SETTINGSREFCODE");
		_checkConditionToken(condition,"settingsref.code","SETTINGSREFCODE");
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
	
	private void _collectAutoIncrementFields(ENSettingsValues anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENSETTINGSVALUES", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENSETTINGSVALUES", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENSETTINGSVALUES", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENSETTINGSVALUES");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENSettingsValuesDAO
