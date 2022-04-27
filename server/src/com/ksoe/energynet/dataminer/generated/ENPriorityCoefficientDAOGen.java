
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
import com.ksoe.energynet.valueobject.ENPriorityCoefficient;
import com.ksoe.energynet.valueobject.filter.ENPriorityCoefficientFilter;
import com.ksoe.energynet.valueobject.brief.ENPriorityCoefficientShort;
import com.ksoe.energynet.valueobject.lists.ENPriorityCoefficientShortList;


/**
 * DAO Object for ENPriorityCoefficient;
 *
 */

public class ENPriorityCoefficientDAOGen extends GenericDataMiner {

	public ENPriorityCoefficientDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENPriorityCoefficientDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENPriorityCoefficient inObject) throws PersistenceException {
		ENPriorityCoefficient obj = new ENPriorityCoefficient();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.value6 == null && obj.value6 == null){}
		else
			if(inObject.value6 == null || obj.value6 == null) return false;
			else
				if ( ! inObject.value6.equals(obj.value6)){
					return false;
				}

		if(inObject.value35 == null && obj.value35 == null){}
		else
			if(inObject.value35 == null || obj.value35 == null) return false;
			else
				if ( ! inObject.value35.equals(obj.value35)){
					return false;
				}

		if(inObject.value150 == null && obj.value150 == null){}
		else
			if(inObject.value150 == null || obj.value150 == null) return false;
			else
				if ( ! inObject.value150.equals(obj.value150)){
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
		if (inObject.elementTypeRef.code != obj.elementTypeRef.code){
			return false;
		}
		if (inObject.coeffTypeRef.code != obj.coeffTypeRef.code){
			return false;
		}
		return true;
	}

	public int add(ENPriorityCoefficient anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENPriorityCoefficient anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENPRIORITYCOEFFICIENT (CODE,VALUE6,VALUE35,VALUE150,MODIFY_TIME,USERGEN,DATEEDIT,ELEMENTTYPEREFCODE,COEFFTYPEREFCODE) VALUES (?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			if (anObject.value6 != null) {
				anObject.value6 = anObject.value6.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(2, anObject.value6);
			if (anObject.value35 != null) {
				anObject.value35 = anObject.value35.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(3, anObject.value35);
			if (anObject.value150 != null) {
				anObject.value150 = anObject.value150.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(4, anObject.value150);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(5, null);
			} else {
				statement.setBigDecimal(5, new java.math.BigDecimal(anObject.modify_time));
			}
			statement.setString(6, anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(7, null);
			} else {
				statement.setTimestamp(7, new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.elementTypeRef.code != Integer.MIN_VALUE){
				statement.setInt(8,anObject.elementTypeRef.code);
			} else {
				statement.setNull(8,java.sql.Types.INTEGER);
			}
			if (anObject.coeffTypeRef.code != Integer.MIN_VALUE){
				statement.setInt(9,anObject.coeffTypeRef.code);
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
			throw new PersistenceException("Error in method {%ENPriorityCoefficientDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENPriorityCoefficient anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENPriorityCoefficient anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENPriorityCoefficient oldObject = new ENPriorityCoefficient();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENPriorityCoefficient.modify_time_Field+" FROM  ENPRIORITYCOEFFICIENT WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("VALUE6") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("VALUE35") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("VALUE150") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
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
					if(fieldNameStr.compareTo("ELEMENTTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COEFFTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENPRIORITYCOEFFICIENT SET  VALUE6 = ? , VALUE35 = ? , VALUE150 = ? , MODIFY_TIME = ? , USERGEN = ? , DATEEDIT = ? , ELEMENTTYPEREFCODE = ? , COEFFTYPEREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENPRIORITYCOEFFICIENT SET ";
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
					if (anObject.value6 != null) {
						anObject.value6 = anObject.value6.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(1, anObject.value6);
					if (anObject.value35 != null) {
						anObject.value35 = anObject.value35.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(2, anObject.value35);
					if (anObject.value150 != null) {
						anObject.value150 = anObject.value150.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(3, anObject.value150);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(4, null);
					} else {
						statement.setBigDecimal(4, new java.math.BigDecimal(anObject.modify_time));
					}
					statement.setString(5, anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(6, null);
					} else {
						statement.setTimestamp(6, new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.elementTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(7, anObject.elementTypeRef.code);
					} else {
						statement.setNull(7, java.sql.Types.INTEGER);
					}
					if (anObject.coeffTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(8, anObject.coeffTypeRef.code);
					} else {
						statement.setNull(8, java.sql.Types.INTEGER);
					}
					statement.setInt(9, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("VALUE6".compareTo((String)fields.get(i)) == 0) {
							if (anObject.value6 != null) {
								anObject.value6 = anObject.value6.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.value6);
							continue;
						}
						if("VALUE35".compareTo((String)fields.get(i)) == 0) {
							if (anObject.value35 != null) {
								anObject.value35 = anObject.value35.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.value35);
							continue;
						}
						if("VALUE150".compareTo((String)fields.get(i)) == 0) {
							if (anObject.value150 != null) {
								anObject.value150 = anObject.value150.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.value150);
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
						if("ELEMENTTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.elementTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.elementTypeRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("COEFFTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.coeffTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.coeffTypeRef.code);
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

	} // end of save(ENPriorityCoefficient anObject,String[] anAttributes)


	public ENPriorityCoefficientShort getShortObject(int anObjectCode) throws PersistenceException {
		ENPriorityCoefficient filterObject = new ENPriorityCoefficient();
		Vector<ENPriorityCoefficientShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENPriorityCoefficientShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENPriorityCoefficient filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.value6, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.value35, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.value150, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.elementTypeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.coeffTypeRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENPriorityCoefficientFilter filter) {
		String out = buildCondition((ENPriorityCoefficient)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENPriorityCoefficient filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENPriorityCoefficient.code_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.value6, ENPriorityCoefficient.value6_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.value35, ENPriorityCoefficient.value35_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.value150, ENPriorityCoefficient.value150_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENPriorityCoefficient.modify_time_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENPriorityCoefficient.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENPriorityCoefficient.dateEdit_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.elementTypeRef.code, ENPriorityCoefficient.elementTypeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.coeffTypeRef.code, ENPriorityCoefficient.coeffTypeRef_QFielld, out);
		}
		return out;
	}

	public ENPriorityCoefficientShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENPriorityCoefficientShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENPriorityCoefficientShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENPriorityCoefficientShortList getFilteredList(ENPriorityCoefficient filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENPriorityCoefficientShortList getScrollableFilteredList(ENPriorityCoefficient aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENPriorityCoefficientShortList getScrollableFilteredList(ENPriorityCoefficient aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENPriorityCoefficientShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENPriorityCoefficientShortList getScrollableFilteredList(ENPriorityCoefficientFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENPriorityCoefficientShortList getScrollableFilteredList(ENPriorityCoefficientFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENPriorityCoefficientShortList getScrollableFilteredList(ENPriorityCoefficient aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENPriorityCoefficientShortList result = new ENPriorityCoefficientShortList();
		ENPriorityCoefficientShort anObject;
		result.list = new Vector<ENPriorityCoefficientShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENPRIORITYCOEFFICIENT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENPRIORITYCOEFFICIENT.CODE"+
			",ENPRIORITYCOEFFICIENT.VALUE6"+
			",ENPRIORITYCOEFFICIENT.VALUE35"+
			",ENPRIORITYCOEFFICIENT.VALUE150"+
			",ENPRIORITYCOEFFICIENT.USERGEN"+
			",ENPRIORITYCOEFFICIENT.DATEEDIT"+
			", ENELEMENTTYPE.CODE " +
			", ENELEMENTTYPE.NAME " +
			", ENPRIORITYCOEFFTYPE.CODE " +
			", ENPRIORITYCOEFFTYPE.NAME " +
		" FROM ENPRIORITYCOEFFICIENT " +
			" LEFT JOIN ENELEMENTTYPE on ENELEMENTTYPE.CODE = ENPRIORITYCOEFFICIENT.ELEMENTTYPEREFCODE "+
			" LEFT JOIN ENPRIORITYCOEFFTYPE on ENPRIORITYCOEFFTYPE.CODE = ENPRIORITYCOEFFICIENT.COEFFTYPEREFCODE "+
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
				anObject = new ENPriorityCoefficientShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.value6 = set.getBigDecimal(2);
				if(anObject.value6 != null) {
					anObject.value6 = anObject.value6.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.value35 = set.getBigDecimal(3);
				if(anObject.value35 != null) {
					anObject.value35 = anObject.value35.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.value150 = set.getBigDecimal(4);
				if(anObject.value150 != null) {
					anObject.value150 = anObject.value150.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.userGen = set.getString(5);
				anObject.dateEdit = set.getTimestamp(6);

				anObject.elementTypeRefCode = set.getInt(7);
				if(set.wasNull()) {
					anObject.elementTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.elementTypeRefName = set.getString(8);
				anObject.coeffTypeRefCode = set.getInt(9);
				if(set.wasNull()) {
					anObject.coeffTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.coeffTypeRefName = set.getString(10);

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
	
	public int[] getFilteredCodeArray(ENPriorityCoefficientFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENPriorityCoefficientFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENPriorityCoefficient aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENPRIORITYCOEFFICIENT.CODE FROM ENPRIORITYCOEFFICIENT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENPRIORITYCOEFFICIENT.CODE";
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


	public ENPriorityCoefficient getObject(int uid) throws PersistenceException {
		ENPriorityCoefficient result = new ENPriorityCoefficient();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENPriorityCoefficient anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENPRIORITYCOEFFICIENT.CODE, ENPRIORITYCOEFFICIENT.VALUE6, ENPRIORITYCOEFFICIENT.VALUE35, ENPRIORITYCOEFFICIENT.VALUE150, ENPRIORITYCOEFFICIENT.MODIFY_TIME, ENPRIORITYCOEFFICIENT.USERGEN, ENPRIORITYCOEFFICIENT.DATEEDIT, ENPRIORITYCOEFFICIENT.ELEMENTTYPEREFCODE, ENPRIORITYCOEFFICIENT.COEFFTYPEREFCODE "
			+" FROM ENPRIORITYCOEFFICIENT WHERE ENPRIORITYCOEFFICIENT.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.value6 = set.getBigDecimal(2);
				if(anObject.value6 != null) {
					anObject.value6 = anObject.value6.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.value35 = set.getBigDecimal(3);
				if(anObject.value35 != null) {
					anObject.value35 = anObject.value35.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.value150 = set.getBigDecimal(4);
				if(anObject.value150 != null) {
					anObject.value150 = anObject.value150.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.modify_time = set.getLong(5);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.userGen = set.getString(6);
				anObject.dateEdit = set.getTimestamp(7);
				anObject.elementTypeRef.code = set.getInt(8);
				if (set.wasNull()) {
					anObject.elementTypeRef.code = Integer.MIN_VALUE;
				}
				anObject.coeffTypeRef.code = set.getInt(9);
				if (set.wasNull()) {
					anObject.coeffTypeRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENPriorityCoefficientRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENPriorityCoefficientRef ref = new com.ksoe.energynet.valueobject.references.ENPriorityCoefficientRef();
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

		selectStr = "DELETE FROM  ENPRIORITYCOEFFICIENT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENPriorityCoefficient object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENPriorityCoefficient.getObject%} access denied");
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
	
	public long count(ENPriorityCoefficientFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENPriorityCoefficientFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENPriorityCoefficientFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENPRIORITYCOEFFICIENT", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENPRIORITYCOEFFICIENT WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, ENPriorityCoefficientFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENPriorityCoefficientFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENPRIORITYCOEFFICIENT");
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
			"SELECT  ENPRIORITYCOEFFICIENT.CODE FROM  ENPRIORITYCOEFFICIENT WHERE  ENPRIORITYCOEFFICIENT.CODE = ?";
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
		_checkConditionToken(condition,"code","ENPRIORITYCOEFFICIENT.CODE");
		_checkConditionToken(condition,"value6","ENPRIORITYCOEFFICIENT.VALUE6");
		_checkConditionToken(condition,"value35","ENPRIORITYCOEFFICIENT.VALUE35");
		_checkConditionToken(condition,"value150","ENPRIORITYCOEFFICIENT.VALUE150");
		_checkConditionToken(condition,"modify_time","ENPRIORITYCOEFFICIENT.MODIFY_TIME");
		_checkConditionToken(condition,"usergen","ENPRIORITYCOEFFICIENT.USERGEN");
		_checkConditionToken(condition,"dateedit","ENPRIORITYCOEFFICIENT.DATEEDIT");
		// relationship conditions
		_checkConditionToken(condition,"elementtyperef","ELEMENTTYPEREFCODE");
		_checkConditionToken(condition,"elementtyperef.code","ELEMENTTYPEREFCODE");
		_checkConditionToken(condition,"coefftyperef","COEFFTYPEREFCODE");
		_checkConditionToken(condition,"coefftyperef.code","COEFFTYPEREFCODE");
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
	
	private void _collectAutoIncrementFields(ENPriorityCoefficient anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENPRIORITYCOEFFICIENT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENPRIORITYCOEFFICIENT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENPRIORITYCOEFFICIENT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENPRIORITYCOEFFICIENT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENPriorityCoefficientDAO
