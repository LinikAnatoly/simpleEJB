
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
import com.ksoe.energynet.valueobject.ENLandSheetsDelays;
import com.ksoe.energynet.valueobject.filter.ENLandSheetsDelaysFilter;
import com.ksoe.energynet.valueobject.brief.ENLandSheetsDelaysShort;
import com.ksoe.energynet.valueobject.lists.ENLandSheetsDelaysShortList;


/**
 * DAO Object for ENLandSheetsDelays;
 *
 */

public class ENLandSheetsDelaysDAOGen extends GenericDataMiner {

	public ENLandSheetsDelaysDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENLandSheetsDelaysDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENLandSheetsDelays inObject) throws PersistenceException {
		ENLandSheetsDelays obj = new ENLandSheetsDelays();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.dateFrom == null && obj.dateFrom == null){} else 
			if(inObject.dateFrom == null || obj.dateFrom == null) return false;
			else
				if (inObject.dateFrom.compareTo(obj.dateFrom) != 0){
					return false;
				}

		if(inObject.dateTo == null && obj.dateTo == null){} else 
			if(inObject.dateTo == null || obj.dateTo == null) return false;
			else
				if (inObject.dateTo.compareTo(obj.dateTo) != 0){
					return false;
				}

		if (inObject.standardDelay != obj.standardDelay){
					return false;
				}

		if (inObject.nonstandardDelay != obj.nonstandardDelay){
					return false;
				}

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
		return true;
	}

	public int add(ENLandSheetsDelays anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENLandSheetsDelays anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENLANDSHEETSDELAYS (CODE,DATEFROM,DATETO,STANDARDDELAY,NONSTANDARDDELAY,COMMENTGEN,USERADD,DATEADD,USERGEN,DATEEDIT,MODIFY_TIME) VALUES (?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			if (anObject.dateFrom == null) {
				statement.setDate(2, null);
			} else {
				statement.setDate(2, new java.sql.Date(anObject.dateFrom.getTime()));
			}
			if (anObject.dateTo == null) {
				statement.setDate(3, null);
			} else {
				statement.setDate(3, new java.sql.Date(anObject.dateTo.getTime()));
			}
			if (anObject.standardDelay != Integer.MIN_VALUE ) {
				statement.setInt(4, anObject.standardDelay);
			} else {
				statement.setNull(4, java.sql.Types.INTEGER);
			}
			if (anObject.nonstandardDelay != Integer.MIN_VALUE ) {
				statement.setInt(5, anObject.nonstandardDelay);
			} else {
				statement.setNull(5, java.sql.Types.INTEGER);
			}
			statement.setString(6, anObject.commentgen);
			statement.setString(7, anObject.userAdd);
			if (anObject.dateAdd == null) {
				statement.setTimestamp(8, null);
			} else {
				statement.setTimestamp(8, new java.sql.Timestamp(anObject.dateAdd.getTime()));
			}
			statement.setString(9, anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(10, null);
			} else {
				statement.setTimestamp(10, new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(11, null);
			} else {
				statement.setBigDecimal(11, new java.math.BigDecimal(anObject.modify_time));
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENLandSheetsDelaysDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENLandSheetsDelays anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENLandSheetsDelays anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENLandSheetsDelays oldObject = new ENLandSheetsDelays();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENLandSheetsDelays.modify_time_Field+" FROM  ENLANDSHEETSDELAYS WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("DATEFROM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATETO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("STANDARDDELAY") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NONSTANDARDDELAY") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
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
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENLANDSHEETSDELAYS SET  DATEFROM = ? , DATETO = ? , STANDARDDELAY = ? , NONSTANDARDDELAY = ? , COMMENTGEN = ? , USERADD = ? , DATEADD = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENLANDSHEETSDELAYS SET ";
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
					if (anObject.dateFrom == null) {
						statement.setDate(1, null);
					} else {
						statement.setDate(1, new java.sql.Date(anObject.dateFrom.getTime()));
					}
					if (anObject.dateTo == null) {
						statement.setDate(2, null);
					} else {
						statement.setDate(2, new java.sql.Date(anObject.dateTo.getTime()));
					}
					if (anObject.standardDelay != Integer.MIN_VALUE) {
						statement.setInt(3, anObject.standardDelay);
					} else {
						statement.setNull(3, java.sql.Types.INTEGER);
					}
					if (anObject.nonstandardDelay != Integer.MIN_VALUE) {
						statement.setInt(4, anObject.nonstandardDelay);
					} else {
						statement.setNull(4, java.sql.Types.INTEGER);
					}
					statement.setString(5, anObject.commentgen);
					statement.setString(6, anObject.userAdd);
					if (anObject.dateAdd == null) {
						statement.setTimestamp(7, null);
					} else {
						statement.setTimestamp(7, new java.sql.Timestamp(anObject.dateAdd.getTime()));
					}
					statement.setString(8, anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(9, null);
					} else {
						statement.setTimestamp(9, new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(10, null);
					} else {
						statement.setBigDecimal(10, new java.math.BigDecimal(anObject.modify_time));
					}
					statement.setInt(11, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("DATEFROM".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateFrom == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateFrom.getTime()));
							}
							continue;
						}
						if("DATETO".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateTo == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateTo.getTime()));
							}
							continue;
						}
						if("STANDARDDELAY".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.standardDelay);
							continue;
						}
						if("NONSTANDARDDELAY".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.nonstandardDelay);
							continue;
						}
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

	} // end of save(ENLandSheetsDelays anObject,String[] anAttributes)


	public ENLandSheetsDelaysShort getShortObject(int anObjectCode) throws PersistenceException {
		ENLandSheetsDelays filterObject = new ENLandSheetsDelays();
		Vector<ENLandSheetsDelaysShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENLandSheetsDelaysShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENLandSheetsDelays filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateFrom, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateTo, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.standardDelay, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.nonstandardDelay, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentgen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userAdd, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateAdd, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENLandSheetsDelaysFilter filter) {
		String out = buildCondition((ENLandSheetsDelays)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENLandSheetsDelays filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENLandSheetsDelays.code_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateFrom, ENLandSheetsDelays.dateFrom_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateTo, ENLandSheetsDelays.dateTo_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.standardDelay, ENLandSheetsDelays.standardDelay_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.nonstandardDelay, ENLandSheetsDelays.nonstandardDelay_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentgen, ENLandSheetsDelays.commentgen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userAdd, ENLandSheetsDelays.userAdd_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateAdd, ENLandSheetsDelays.dateAdd_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENLandSheetsDelays.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENLandSheetsDelays.dateEdit_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENLandSheetsDelays.modify_time_QFielld, out);
		}
		return out;
	}

	public ENLandSheetsDelaysShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENLandSheetsDelaysShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENLandSheetsDelaysShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENLandSheetsDelaysShortList getFilteredList(ENLandSheetsDelays filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENLandSheetsDelaysShortList getScrollableFilteredList(ENLandSheetsDelays aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENLandSheetsDelaysShortList getScrollableFilteredList(ENLandSheetsDelays aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENLandSheetsDelaysShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENLandSheetsDelaysShortList getScrollableFilteredList(ENLandSheetsDelaysFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENLandSheetsDelaysShortList getScrollableFilteredList(ENLandSheetsDelaysFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENLandSheetsDelaysShortList getScrollableFilteredList(ENLandSheetsDelays aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENLandSheetsDelaysShortList result = new ENLandSheetsDelaysShortList();
		ENLandSheetsDelaysShort anObject;
		result.list = new Vector<ENLandSheetsDelaysShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENLANDSHEETSDELAYS.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENLANDSHEETSDELAYS.CODE"+
			",ENLANDSHEETSDELAYS.DATEFROM"+
			",ENLANDSHEETSDELAYS.DATETO"+
			",ENLANDSHEETSDELAYS.STANDARDDELAY"+
			",ENLANDSHEETSDELAYS.NONSTANDARDDELAY"+
			",ENLANDSHEETSDELAYS.COMMENTGEN"+
			",ENLANDSHEETSDELAYS.USERADD"+
			",ENLANDSHEETSDELAYS.DATEADD"+
			",ENLANDSHEETSDELAYS.USERGEN"+
			",ENLANDSHEETSDELAYS.DATEEDIT"+
		" FROM ENLANDSHEETSDELAYS " +
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
				anObject = new ENLandSheetsDelaysShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.dateFrom = set.getDate(2);
				anObject.dateTo = set.getDate(3);
				anObject.standardDelay = set.getInt(4);
				if ( set.wasNull() ) {
					anObject.standardDelay = Integer.MIN_VALUE;
				}
				anObject.nonstandardDelay = set.getInt(5);
				if ( set.wasNull() ) {
					anObject.nonstandardDelay = Integer.MIN_VALUE;
				}
				anObject.commentgen = set.getString(6);
				anObject.userAdd = set.getString(7);
				anObject.dateAdd = set.getTimestamp(8);
				anObject.userGen = set.getString(9);
				anObject.dateEdit = set.getTimestamp(10);


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
	
	public int[] getFilteredCodeArray(ENLandSheetsDelaysFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENLandSheetsDelaysFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENLandSheetsDelays aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENLANDSHEETSDELAYS.CODE FROM ENLANDSHEETSDELAYS";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENLANDSHEETSDELAYS.CODE";
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


	public ENLandSheetsDelays getObject(int uid) throws PersistenceException {
		ENLandSheetsDelays result = new ENLandSheetsDelays();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENLandSheetsDelays anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENLANDSHEETSDELAYS.CODE, ENLANDSHEETSDELAYS.DATEFROM, ENLANDSHEETSDELAYS.DATETO, ENLANDSHEETSDELAYS.STANDARDDELAY, ENLANDSHEETSDELAYS.NONSTANDARDDELAY, ENLANDSHEETSDELAYS.COMMENTGEN, ENLANDSHEETSDELAYS.USERADD, ENLANDSHEETSDELAYS.DATEADD, ENLANDSHEETSDELAYS.USERGEN, ENLANDSHEETSDELAYS.DATEEDIT, ENLANDSHEETSDELAYS.MODIFY_TIME "
			+" FROM ENLANDSHEETSDELAYS WHERE ENLANDSHEETSDELAYS.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.dateFrom = set.getDate(2);
				anObject.dateTo = set.getDate(3);
				anObject.standardDelay = set.getInt(4);
				if (set.wasNull()) {
					anObject.standardDelay = Integer.MIN_VALUE;
				}
				anObject.nonstandardDelay = set.getInt(5);
				if (set.wasNull()) {
					anObject.nonstandardDelay = Integer.MIN_VALUE;
				}
				anObject.commentgen = set.getString(6);
				anObject.userAdd = set.getString(7);
				anObject.dateAdd = set.getTimestamp(8);
				anObject.userGen = set.getString(9);
				anObject.dateEdit = set.getTimestamp(10);
				anObject.modify_time = set.getLong(11);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENLandSheetsDelaysRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENLandSheetsDelaysRef ref = new com.ksoe.energynet.valueobject.references.ENLandSheetsDelaysRef();
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

		selectStr = "DELETE FROM  ENLANDSHEETSDELAYS WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENLandSheetsDelays object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENLandSheetsDelays.getObject%} access denied");
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
	
	public long count(ENLandSheetsDelaysFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENLandSheetsDelaysFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENLandSheetsDelaysFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENLANDSHEETSDELAYS", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENLANDSHEETSDELAYS WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, ENLandSheetsDelaysFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENLandSheetsDelaysFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENLANDSHEETSDELAYS");
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
			"SELECT  ENLANDSHEETSDELAYS.CODE FROM  ENLANDSHEETSDELAYS WHERE  ENLANDSHEETSDELAYS.CODE = ?";
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
		_checkConditionToken(condition,"code","ENLANDSHEETSDELAYS.CODE");
		_checkConditionToken(condition,"datefrom","ENLANDSHEETSDELAYS.DATEFROM");
		_checkConditionToken(condition,"dateto","ENLANDSHEETSDELAYS.DATETO");
		_checkConditionToken(condition,"standarddelay","ENLANDSHEETSDELAYS.STANDARDDELAY");
		_checkConditionToken(condition,"nonstandarddelay","ENLANDSHEETSDELAYS.NONSTANDARDDELAY");
		_checkConditionToken(condition,"commentgen","ENLANDSHEETSDELAYS.COMMENTGEN");
		_checkConditionToken(condition,"useradd","ENLANDSHEETSDELAYS.USERADD");
		_checkConditionToken(condition,"dateadd","ENLANDSHEETSDELAYS.DATEADD");
		_checkConditionToken(condition,"usergen","ENLANDSHEETSDELAYS.USERGEN");
		_checkConditionToken(condition,"dateedit","ENLANDSHEETSDELAYS.DATEEDIT");
		_checkConditionToken(condition,"modify_time","ENLANDSHEETSDELAYS.MODIFY_TIME");
		// relationship conditions
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
	
	private void _collectAutoIncrementFields(ENLandSheetsDelays anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENLANDSHEETSDELAYS", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENLANDSHEETSDELAYS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENLANDSHEETSDELAYS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENLANDSHEETSDELAYS");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENLandSheetsDelaysDAO
