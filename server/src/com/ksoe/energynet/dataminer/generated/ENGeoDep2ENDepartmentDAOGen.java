
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
import com.ksoe.energynet.valueobject.ENGeoDep2ENDepartment;
import com.ksoe.energynet.valueobject.filter.ENGeoDep2ENDepartmentFilter;
import com.ksoe.energynet.valueobject.brief.ENGeoDep2ENDepartmentShort;
import com.ksoe.energynet.valueobject.lists.ENGeoDep2ENDepartmentShortList;


/**
 * DAO Object for ENGeoDep2ENDepartment;
 *
 */

public class ENGeoDep2ENDepartmentDAOGen extends GenericDataMiner {

	public ENGeoDep2ENDepartmentDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENGeoDep2ENDepartmentDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENGeoDep2ENDepartment inObject) throws PersistenceException {
		ENGeoDep2ENDepartment obj = new ENGeoDep2ENDepartment();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.commentgen == null && obj.commentgen == null){}
		else
			if(inObject.commentgen == null || obj.commentgen == null) return false;
			else
				if ( ! inObject.commentgen.equals(obj.commentgen)){
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
		if (inObject.departmentRef.code != obj.departmentRef.code){
			return false;
		}
		if (inObject.geoDepartmentRef.code != obj.geoDepartmentRef.code){
			return false;
		}
		return true;
	}

	public int add(ENGeoDep2ENDepartment anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENGeoDep2ENDepartment anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENGEODEP2ENDEPARTMENT (CODE,COMMENTGEN,USERADD,DATEADD,USERGEN,DATEEDIT,MODIFY_TIME,DEPARTMENTREFCODE,GEODEPARTMENTREFCODE) VALUES (?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.commentgen);
			statement.setString(3, anObject.userAdd);
			if (anObject.dateAdd == null) {
				statement.setTimestamp(4, null);
			} else {
				statement.setTimestamp(4, new java.sql.Timestamp(anObject.dateAdd.getTime()));
			}
			statement.setString(5, anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(6, null);
			} else {
				statement.setTimestamp(6, new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(7, null);
			} else {
				statement.setBigDecimal(7, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.departmentRef.code != Integer.MIN_VALUE){
				statement.setInt(8,anObject.departmentRef.code);
			} else {
				statement.setNull(8,java.sql.Types.INTEGER);
			}
			if (anObject.geoDepartmentRef.code != Integer.MIN_VALUE){
				statement.setInt(9,anObject.geoDepartmentRef.code);
			} else {
				statement.setNull(9,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENGeoDep2ENDepartmentDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENGeoDep2ENDepartment anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENGeoDep2ENDepartment anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENGeoDep2ENDepartment oldObject = new ENGeoDep2ENDepartment();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENGeoDep2ENDepartment.modify_time_Field+" FROM  ENGEODEP2ENDEPARTMENT WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("COMMENTGEN") == 0) {
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
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DEPARTMENTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("GEODEPARTMENTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENGEODEP2ENDEPARTMENT SET  COMMENTGEN = ? , USERADD = ? , DATEADD = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , DEPARTMENTREFCODE = ? , GEODEPARTMENTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENGEODEP2ENDEPARTMENT SET ";
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
					statement.setString(1, anObject.commentgen);
					statement.setString(2, anObject.userAdd);
					if (anObject.dateAdd == null) {
						statement.setTimestamp(3, null);
					} else {
						statement.setTimestamp(3, new java.sql.Timestamp(anObject.dateAdd.getTime()));
					}
					statement.setString(4, anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(5, null);
					} else {
						statement.setTimestamp(5, new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(6, null);
					} else {
						statement.setBigDecimal(6, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.departmentRef.code != Integer.MIN_VALUE) {
						statement.setInt(7, anObject.departmentRef.code);
					} else {
						statement.setNull(7, java.sql.Types.INTEGER);
					}
					if (anObject.geoDepartmentRef.code != Integer.MIN_VALUE) {
						statement.setInt(8, anObject.geoDepartmentRef.code);
					} else {
						statement.setNull(8, java.sql.Types.INTEGER);
					}
					statement.setInt(9, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("COMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.commentgen);
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
						if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0) {
							if (anObject.modify_time == Long.MIN_VALUE) {
								statement.setBigDecimal(i+1, null);
							} else {
								statement.setBigDecimal(i+1, new java.math.BigDecimal(anObject.modify_time));
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
						if("GEODEPARTMENTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.geoDepartmentRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.geoDepartmentRef.code);
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

	} // end of save(ENGeoDep2ENDepartment anObject,String[] anAttributes)


	public ENGeoDep2ENDepartmentShort getShortObject(int anObjectCode) throws PersistenceException {
		ENGeoDep2ENDepartment filterObject = new ENGeoDep2ENDepartment();
		Vector<ENGeoDep2ENDepartmentShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENGeoDep2ENDepartmentShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENGeoDep2ENDepartment filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentgen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userAdd, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateAdd, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.departmentRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.geoDepartmentRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENGeoDep2ENDepartmentFilter filter) {
		String out = buildCondition((ENGeoDep2ENDepartment)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENGeoDep2ENDepartment filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENGeoDep2ENDepartment.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentgen, ENGeoDep2ENDepartment.commentgen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userAdd, ENGeoDep2ENDepartment.userAdd_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateAdd, ENGeoDep2ENDepartment.dateAdd_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENGeoDep2ENDepartment.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENGeoDep2ENDepartment.dateEdit_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENGeoDep2ENDepartment.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.departmentRef.code, ENGeoDep2ENDepartment.departmentRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.geoDepartmentRef.code, ENGeoDep2ENDepartment.geoDepartmentRef_QFielld, out);
		}
		return out;
	}

	public ENGeoDep2ENDepartmentShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENGeoDep2ENDepartmentShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENGeoDep2ENDepartmentShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENGeoDep2ENDepartmentShortList getFilteredList(ENGeoDep2ENDepartment filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENGeoDep2ENDepartmentShortList getScrollableFilteredList(ENGeoDep2ENDepartment aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENGeoDep2ENDepartmentShortList getScrollableFilteredList(ENGeoDep2ENDepartment aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENGeoDep2ENDepartmentShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENGeoDep2ENDepartmentShortList getScrollableFilteredList(ENGeoDep2ENDepartmentFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENGeoDep2ENDepartmentShortList getScrollableFilteredList(ENGeoDep2ENDepartmentFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENGeoDep2ENDepartmentShortList getScrollableFilteredList(ENGeoDep2ENDepartment aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENGeoDep2ENDepartmentShortList result = new ENGeoDep2ENDepartmentShortList();
		ENGeoDep2ENDepartmentShort anObject;
		result.list = new Vector<ENGeoDep2ENDepartmentShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENGEODEP2ENDEPARTMENT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENGEODEP2ENDEPARTMENT.CODE"+
			",ENGEODEP2ENDEPARTMENT.COMMENTGEN"+
			",ENGEODEP2ENDEPARTMENT.USERADD"+
			",ENGEODEP2ENDEPARTMENT.DATEADD"+
			",ENGEODEP2ENDEPARTMENT.USERGEN"+
			",ENGEODEP2ENDEPARTMENT.DATEEDIT"+
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
			", ENGEOGRAPHICDEPARTMENT.CODE " +
			", ENGEOGRAPHICDEPARTMENT.NAME " +
			", ENGEOGRAPHICDEPARTMENT.COMMENTGEN " +
			", ENGEOGRAPHICDEPARTMENT.USERADD " +
			", ENGEOGRAPHICDEPARTMENT.DATEADD " +
			", ENGEOGRAPHICDEPARTMENT.USERGEN " +
			", ENGEOGRAPHICDEPARTMENT.DATEEDIT " +
		" FROM ENGEODEP2ENDEPARTMENT " +
			" LEFT JOIN ENDEPARTMENT on ENDEPARTMENT.CODE = ENGEODEP2ENDEPARTMENT.DEPARTMENTREFCODE "+
			" LEFT JOIN ENGEOGRAPHICDEPARTMENT on ENGEOGRAPHICDEPARTMENT.CODE = ENGEODEP2ENDEPARTMENT.GEODEPARTMENTREFCODE "+
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
				anObject = new ENGeoDep2ENDepartmentShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.commentgen = set.getString(2);
				anObject.userAdd = set.getString(3);
				anObject.dateAdd = set.getTimestamp(4);
				anObject.userGen = set.getString(5);
				anObject.dateEdit = set.getTimestamp(6);

				anObject.departmentRefCode = set.getInt(7);
				if(set.wasNull()) {
					anObject.departmentRefCode = Integer.MIN_VALUE;
				}
				anObject.departmentRefShortName = set.getString(8);
				anObject.departmentRefDateStart = set.getDate(9);
				anObject.departmentRefDateFinal = set.getDate(10);
				anObject.departmentRefRenCode = set.getInt(11);
				if(set.wasNull()) {
					anObject.departmentRefRenCode = Integer.MIN_VALUE;
				}
				anObject.departmentRefShpzBalans = set.getString(12);
				anObject.departmentRefKau_table_id_1884 = set.getInt(13);
				if(set.wasNull()) {
					anObject.departmentRefKau_table_id_1884 = Integer.MIN_VALUE;
				}
				anObject.departmentRefKau_1884 = set.getString(14);
				anObject.departmentRefName_1884 = set.getString(15);
				anObject.departmentRefHrmorganizationid = set.getString(16);
				anObject.geoDepartmentRefCode = set.getInt(17);
				if(set.wasNull()) {
					anObject.geoDepartmentRefCode = Integer.MIN_VALUE;
				}
				anObject.geoDepartmentRefName = set.getString(18);
				anObject.geoDepartmentRefCommentgen = set.getString(19);
				anObject.geoDepartmentRefUserAdd = set.getString(20);
				anObject.geoDepartmentRefDateAdd = set.getTimestamp(21);
				anObject.geoDepartmentRefUserGen = set.getString(22);
				anObject.geoDepartmentRefDateEdit = set.getTimestamp(23);

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
	
	public int[] getFilteredCodeArray(ENGeoDep2ENDepartmentFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENGeoDep2ENDepartmentFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENGeoDep2ENDepartment aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENGEODEP2ENDEPARTMENT.CODE FROM ENGEODEP2ENDEPARTMENT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENGEODEP2ENDEPARTMENT.CODE";
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


	public ENGeoDep2ENDepartment getObject(int uid) throws PersistenceException {
		ENGeoDep2ENDepartment result = new ENGeoDep2ENDepartment();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENGeoDep2ENDepartment anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENGEODEP2ENDEPARTMENT.CODE, ENGEODEP2ENDEPARTMENT.COMMENTGEN, ENGEODEP2ENDEPARTMENT.USERADD, ENGEODEP2ENDEPARTMENT.DATEADD, ENGEODEP2ENDEPARTMENT.USERGEN, ENGEODEP2ENDEPARTMENT.DATEEDIT, ENGEODEP2ENDEPARTMENT.MODIFY_TIME, ENGEODEP2ENDEPARTMENT.DEPARTMENTREFCODE, ENGEODEP2ENDEPARTMENT.GEODEPARTMENTREFCODE "
			+" FROM ENGEODEP2ENDEPARTMENT WHERE ENGEODEP2ENDEPARTMENT.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.commentgen = set.getString(2);
				anObject.userAdd = set.getString(3);
				anObject.dateAdd = set.getTimestamp(4);
				anObject.userGen = set.getString(5);
				anObject.dateEdit = set.getTimestamp(6);
				anObject.modify_time = set.getLong(7);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.departmentRef.code = set.getInt(8);
				if (set.wasNull()) {
					anObject.departmentRef.code = Integer.MIN_VALUE;
				}
				anObject.geoDepartmentRef.code = set.getInt(9);
				if (set.wasNull()) {
					anObject.geoDepartmentRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENGeoDep2ENDepartmentRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENGeoDep2ENDepartmentRef ref = new com.ksoe.energynet.valueobject.references.ENGeoDep2ENDepartmentRef();
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

		selectStr = "DELETE FROM  ENGEODEP2ENDEPARTMENT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENGeoDep2ENDepartment object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENGeoDep2ENDepartment.getObject%} access denied");
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
	
	public long count(ENGeoDep2ENDepartmentFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENGeoDep2ENDepartmentFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENGeoDep2ENDepartmentFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENGEODEP2ENDEPARTMENT", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENGEODEP2ENDEPARTMENT WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, ENGeoDep2ENDepartmentFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENGeoDep2ENDepartmentFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENGEODEP2ENDEPARTMENT");
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
			"SELECT  ENGEODEP2ENDEPARTMENT.CODE FROM  ENGEODEP2ENDEPARTMENT WHERE  ENGEODEP2ENDEPARTMENT.CODE = ?";
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
		_checkConditionToken(condition,"code","ENGEODEP2ENDEPARTMENT.CODE");
		_checkConditionToken(condition,"commentgen","ENGEODEP2ENDEPARTMENT.COMMENTGEN");
		_checkConditionToken(condition,"useradd","ENGEODEP2ENDEPARTMENT.USERADD");
		_checkConditionToken(condition,"dateadd","ENGEODEP2ENDEPARTMENT.DATEADD");
		_checkConditionToken(condition,"usergen","ENGEODEP2ENDEPARTMENT.USERGEN");
		_checkConditionToken(condition,"dateedit","ENGEODEP2ENDEPARTMENT.DATEEDIT");
		_checkConditionToken(condition,"modify_time","ENGEODEP2ENDEPARTMENT.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"departmentref","DEPARTMENTREFCODE");
		_checkConditionToken(condition,"departmentref.code","DEPARTMENTREFCODE");
		_checkConditionToken(condition,"geodepartmentref","GEODEPARTMENTREFCODE");
		_checkConditionToken(condition,"geodepartmentref.code","GEODEPARTMENTREFCODE");
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
	
	private void _collectAutoIncrementFields(ENGeoDep2ENDepartment anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENGEODEP2ENDEPARTMENT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENGEODEP2ENDEPARTMENT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENGEODEP2ENDEPARTMENT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENGEODEP2ENDEPARTMENT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENGeoDep2ENDepartmentDAO
