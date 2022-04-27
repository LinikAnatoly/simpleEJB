
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
import com.ksoe.energynet.valueobject.ENNormativeVolumeAVZ;
import com.ksoe.energynet.valueobject.filter.ENNormativeVolumeAVZFilter;
import com.ksoe.energynet.valueobject.brief.ENNormativeVolumeAVZShort;
import com.ksoe.energynet.valueobject.lists.ENNormativeVolumeAVZShortList;


/**
 * DAO Object for ENNormativeVolumeAVZ;
 *
 */

public class ENNormativeVolumeAVZDAOGen extends GenericDataMiner {

	public ENNormativeVolumeAVZDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENNormativeVolumeAVZDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENNormativeVolumeAVZ inObject) throws PersistenceException {
		ENNormativeVolumeAVZ obj = new ENNormativeVolumeAVZ();
		obj.code = inObject.code;
		loadObject(obj);

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

		if (inObject.rest_purpose_type_id != obj.rest_purpose_type_id){
					return false;
				}

		if(inObject.rest_purpose_type_name == null && obj.rest_purpose_type_name == null){}
		else
			if(inObject.rest_purpose_type_name == null || obj.rest_purpose_type_name == null) return false;
			else
				if ( ! inObject.rest_purpose_type_name.equals(obj.rest_purpose_type_name)){
					return false;
				}
		if (inObject.budgetRef.code != obj.budgetRef.code){
			return false;
		}
		if (inObject.departmentRef.code != obj.departmentRef.code){
			return false;
		}
		return true;
	}

	public int add(ENNormativeVolumeAVZ anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENNormativeVolumeAVZ anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENNORMATIVEVOLUMEAVZ (CODE,USERGEN,DATEEDIT,REST_PURPOSE_TYPE_ID,REST_PURPOSE_TYPE_NAME,BUDGETREFCODE,DEPARTMENTREFCODE) VALUES (?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(3, null);
			} else {
				statement.setTimestamp(3, new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.rest_purpose_type_id != Integer.MIN_VALUE ) {
				statement.setInt(4, anObject.rest_purpose_type_id);
			} else {
				statement.setNull(4, java.sql.Types.INTEGER);
			}
			statement.setString(5, anObject.rest_purpose_type_name);
			if (anObject.budgetRef.code != Integer.MIN_VALUE){
				statement.setInt(6,anObject.budgetRef.code);
			} else {
				statement.setNull(6,java.sql.Types.INTEGER);
			}
			if (anObject.departmentRef.code != Integer.MIN_VALUE){
				statement.setInt(7,anObject.departmentRef.code);
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
			throw new PersistenceException("Error in method {%ENNormativeVolumeAVZDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENNormativeVolumeAVZ anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENNormativeVolumeAVZ anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;


			String selectStr;

			Vector<String> fields = null;
			if(anAttributes != null) {
				String fieldNameStr;
				fields = new Vector<String>();
				for(int attrIndex = 0;attrIndex < anAttributes.length;attrIndex++) {
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
					if(fieldNameStr.compareTo("REST_PURPOSE_TYPE_ID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("REST_PURPOSE_TYPE_NAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BUDGETREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DEPARTMENTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENNORMATIVEVOLUMEAVZ SET  USERGEN = ? , DATEEDIT = ? , REST_PURPOSE_TYPE_ID = ? , REST_PURPOSE_TYPE_NAME = ? , BUDGETREFCODE = ? , DEPARTMENTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENNORMATIVEVOLUMEAVZ SET ";
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
					statement.setString(1, anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(2, null);
					} else {
						statement.setTimestamp(2, new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.rest_purpose_type_id != Integer.MIN_VALUE) {
						statement.setInt(3, anObject.rest_purpose_type_id);
					} else {
						statement.setNull(3, java.sql.Types.INTEGER);
					}
					statement.setString(4, anObject.rest_purpose_type_name);
					if (anObject.budgetRef.code != Integer.MIN_VALUE) {
						statement.setInt(5, anObject.budgetRef.code);
					} else {
						statement.setNull(5, java.sql.Types.INTEGER);
					}
					if (anObject.departmentRef.code != Integer.MIN_VALUE) {
						statement.setInt(6, anObject.departmentRef.code);
					} else {
						statement.setNull(6, java.sql.Types.INTEGER);
					}
					statement.setInt(7, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
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
						if("REST_PURPOSE_TYPE_ID".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.rest_purpose_type_id);
							continue;
						}
						if("REST_PURPOSE_TYPE_NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.rest_purpose_type_name);
							continue;
						}
						if("BUDGETREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.budgetRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.budgetRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("DEPARTMENTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.departmentRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.departmentRef.code);
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

	} // end of save(ENNormativeVolumeAVZ anObject,String[] anAttributes)


	public ENNormativeVolumeAVZShort getShortObject(int anObjectCode) throws PersistenceException {
		ENNormativeVolumeAVZ filterObject = new ENNormativeVolumeAVZ();
		Vector<ENNormativeVolumeAVZShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENNormativeVolumeAVZShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENNormativeVolumeAVZ filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.rest_purpose_type_id, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.rest_purpose_type_name, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.budgetRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.departmentRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENNormativeVolumeAVZFilter filter) {
		String out = buildCondition((ENNormativeVolumeAVZ)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENNormativeVolumeAVZ filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENNormativeVolumeAVZ.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENNormativeVolumeAVZ.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENNormativeVolumeAVZ.dateEdit_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.rest_purpose_type_id, ENNormativeVolumeAVZ.rest_purpose_type_id_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.rest_purpose_type_name, ENNormativeVolumeAVZ.rest_purpose_type_name_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.budgetRef.code, ENNormativeVolumeAVZ.budgetRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.departmentRef.code, ENNormativeVolumeAVZ.departmentRef_QFielld, out);
		}
		return out;
	}

	public ENNormativeVolumeAVZShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENNormativeVolumeAVZShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENNormativeVolumeAVZShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENNormativeVolumeAVZShortList getFilteredList(ENNormativeVolumeAVZ filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENNormativeVolumeAVZShortList getScrollableFilteredList(ENNormativeVolumeAVZ aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENNormativeVolumeAVZShortList getScrollableFilteredList(ENNormativeVolumeAVZ aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENNormativeVolumeAVZShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENNormativeVolumeAVZShortList getScrollableFilteredList(ENNormativeVolumeAVZFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENNormativeVolumeAVZShortList getScrollableFilteredList(ENNormativeVolumeAVZFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENNormativeVolumeAVZShortList getScrollableFilteredList(ENNormativeVolumeAVZ aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENNormativeVolumeAVZShortList result = new ENNormativeVolumeAVZShortList();
		ENNormativeVolumeAVZShort anObject;
		result.list = new Vector<ENNormativeVolumeAVZShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENNORMATIVEVOLUMEAVZ.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENNORMATIVEVOLUMEAVZ.CODE"+
			",ENNORMATIVEVOLUMEAVZ.USERGEN"+
			",ENNORMATIVEVOLUMEAVZ.DATEEDIT"+
			",ENNORMATIVEVOLUMEAVZ.REST_PURPOSE_TYPE_ID"+
			",ENNORMATIVEVOLUMEAVZ.REST_PURPOSE_TYPE_NAME"+
			", ENDEPARTMENT.CODE " +
			", ENDEPARTMENT.SHORTNAME " +
			", ENDEPARTMENT.DATESTART " +
			", ENDEPARTMENT.DATEFINAL " +
			", ENDEPARTMENT.RENCODE " +
			", ENDEPARTMENT.SHPZBALANS " +
			", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
			", ENDEPARTMENT.KAU_1884 " +
			", ENDEPARTMENT.NAME_1884 " +
			", ENDEPARTMENT.HRMORGANIZATIONID " +
			", ENDEPARTMENT.CODE " +
			", ENDEPARTMENT.SHORTNAME " +
			", ENDEPARTMENT.DATESTART " +
			", ENDEPARTMENT.DATEFINAL " +
			", ENDEPARTMENT.RENCODE " +
			", ENDEPARTMENT.SHPZBALANS " +
			", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
			", ENDEPARTMENT.KAU_1884 " +
			", ENDEPARTMENT.NAME_1884 " +
			", ENDEPARTMENT.HRMORGANIZATIONID " +
		" FROM ENNORMATIVEVOLUMEAVZ " +
			" LEFT JOIN ENDEPARTMENT on ENDEPARTMENT.CODE = ENNORMATIVEVOLUMEAVZ.BUDGETREFCODE "+
			" LEFT JOIN ENDEPARTMENT on ENDEPARTMENT.CODE = ENNORMATIVEVOLUMEAVZ.DEPARTMENTREFCODE "+
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
				anObject = new ENNormativeVolumeAVZShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.userGen = set.getString(2);
				anObject.dateEdit = set.getTimestamp(3);
				anObject.rest_purpose_type_id = set.getInt(4);
				if ( set.wasNull() ) {
					anObject.rest_purpose_type_id = Integer.MIN_VALUE;
				}
				anObject.rest_purpose_type_name = set.getString(5);

				anObject.budgetRefCode = set.getInt(6);
				if(set.wasNull()) {
					anObject.budgetRefCode = Integer.MIN_VALUE;
				}
				anObject.budgetRefShortName = set.getString(7);
				anObject.budgetRefDateStart = set.getDate(8);
				anObject.budgetRefDateFinal = set.getDate(9);
				anObject.budgetRefRenCode = set.getInt(10);
				if(set.wasNull()) {
					anObject.budgetRefRenCode = Integer.MIN_VALUE;
				}
				anObject.budgetRefShpzBalans = set.getString(11);
				anObject.budgetRefKau_table_id_1884 = set.getInt(12);
				if(set.wasNull()) {
					anObject.budgetRefKau_table_id_1884 = Integer.MIN_VALUE;
				}
				anObject.budgetRefKau_1884 = set.getString(13);
				anObject.budgetRefName_1884 = set.getString(14);
				anObject.budgetRefHrmorganizationid = set.getString(15);
				anObject.departmentRefCode = set.getInt(16);
				if(set.wasNull()) {
					anObject.departmentRefCode = Integer.MIN_VALUE;
				}
				anObject.departmentRefShortName = set.getString(17);
				anObject.departmentRefDateStart = set.getDate(18);
				anObject.departmentRefDateFinal = set.getDate(19);
				anObject.departmentRefRenCode = set.getInt(20);
				if(set.wasNull()) {
					anObject.departmentRefRenCode = Integer.MIN_VALUE;
				}
				anObject.departmentRefShpzBalans = set.getString(21);
				anObject.departmentRefKau_table_id_1884 = set.getInt(22);
				if(set.wasNull()) {
					anObject.departmentRefKau_table_id_1884 = Integer.MIN_VALUE;
				}
				anObject.departmentRefKau_1884 = set.getString(23);
				anObject.departmentRefName_1884 = set.getString(24);
				anObject.departmentRefHrmorganizationid = set.getString(25);

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
	
	public int[] getFilteredCodeArray(ENNormativeVolumeAVZFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENNormativeVolumeAVZFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENNormativeVolumeAVZ aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENNORMATIVEVOLUMEAVZ.CODE FROM ENNORMATIVEVOLUMEAVZ";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENNORMATIVEVOLUMEAVZ.CODE";
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


	public ENNormativeVolumeAVZ getObject(int uid) throws PersistenceException {
		ENNormativeVolumeAVZ result = new ENNormativeVolumeAVZ();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENNormativeVolumeAVZ anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENNORMATIVEVOLUMEAVZ.CODE, ENNORMATIVEVOLUMEAVZ.USERGEN, ENNORMATIVEVOLUMEAVZ.DATEEDIT, ENNORMATIVEVOLUMEAVZ.REST_PURPOSE_TYPE_ID, ENNORMATIVEVOLUMEAVZ.REST_PURPOSE_TYPE_NAME, ENNORMATIVEVOLUMEAVZ.BUDGETREFCODE, ENNORMATIVEVOLUMEAVZ.DEPARTMENTREFCODE "
			+" FROM ENNORMATIVEVOLUMEAVZ WHERE ENNORMATIVEVOLUMEAVZ.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.userGen = set.getString(2);
				anObject.dateEdit = set.getTimestamp(3);
				anObject.rest_purpose_type_id = set.getInt(4);
				if (set.wasNull()) {
					anObject.rest_purpose_type_id = Integer.MIN_VALUE;
				}
				anObject.rest_purpose_type_name = set.getString(5);
				anObject.budgetRef.code = set.getInt(6);
				if (set.wasNull()) {
					anObject.budgetRef.code = Integer.MIN_VALUE;
				}
				anObject.departmentRef.code = set.getInt(7);
				if (set.wasNull()) {
					anObject.departmentRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENNormativeVolumeAVZRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENNormativeVolumeAVZRef ref = new com.ksoe.energynet.valueobject.references.ENNormativeVolumeAVZRef();
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

		selectStr = "DELETE FROM  ENNORMATIVEVOLUMEAVZ WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENNormativeVolumeAVZ object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENNormativeVolumeAVZ.getObject%} access denied");
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
	
	public long count(ENNormativeVolumeAVZFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENNormativeVolumeAVZFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENNormativeVolumeAVZFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENNORMATIVEVOLUMEAVZ", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENNORMATIVEVOLUMEAVZ WHERE code = ?", propertyName);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENNormativeVolumeAVZFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENNORMATIVEVOLUMEAVZ");
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
			"SELECT  ENNORMATIVEVOLUMEAVZ.CODE FROM  ENNORMATIVEVOLUMEAVZ WHERE  ENNORMATIVEVOLUMEAVZ.CODE = ?";
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
		_checkConditionToken(condition,"code","ENNORMATIVEVOLUMEAVZ.CODE");
		_checkConditionToken(condition,"usergen","ENNORMATIVEVOLUMEAVZ.USERGEN");
		_checkConditionToken(condition,"dateedit","ENNORMATIVEVOLUMEAVZ.DATEEDIT");
		_checkConditionToken(condition,"rest_purpose_type_id","ENNORMATIVEVOLUMEAVZ.REST_PURPOSE_TYPE_ID");
		_checkConditionToken(condition,"rest_purpose_type_name","ENNORMATIVEVOLUMEAVZ.REST_PURPOSE_TYPE_NAME");
		// relationship conditions
		_checkConditionToken(condition,"budgetref","BUDGETREFCODE");
		_checkConditionToken(condition,"budgetref.code","BUDGETREFCODE");
		_checkConditionToken(condition,"departmentref","DEPARTMENTREFCODE");
		_checkConditionToken(condition,"departmentref.code","DEPARTMENTREFCODE");
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
	
	private void _collectAutoIncrementFields(ENNormativeVolumeAVZ anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENNORMATIVEVOLUMEAVZ", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENNORMATIVEVOLUMEAVZ", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENNORMATIVEVOLUMEAVZ", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENNORMATIVEVOLUMEAVZ");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENNormativeVolumeAVZDAO
