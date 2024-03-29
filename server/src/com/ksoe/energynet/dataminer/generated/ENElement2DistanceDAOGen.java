
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2021 SIT
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
import com.ksoe.energynet.valueobject.ENElement2Distance;
import com.ksoe.energynet.valueobject.filter.ENElement2DistanceFilter;
import com.ksoe.energynet.valueobject.brief.ENElement2DistanceShort;
import com.ksoe.energynet.valueobject.lists.ENElement2DistanceShortList;


/**
 * DAO Object for ENElement2Distance;
 *
 */

public class ENElement2DistanceDAOGen extends GenericDataMiner {

	public ENElement2DistanceDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENElement2DistanceDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENElement2Distance inObject) throws PersistenceException {
		ENElement2Distance obj = new ENElement2Distance();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.distance == null && obj.distance == null){}
		else
			if(inObject.distance == null || obj.distance == null) return false;
			else
				if ( ! inObject.distance.equals(obj.distance)){
					return false;
				}
		if (inObject.elementRef.code != obj.elementRef.code){
			return false;
		}
		if (inObject.transportDepartment.code != obj.transportDepartment.code){
			return false;
		}
		return true;
	}

	public int add(ENElement2Distance anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENElement2Distance anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENELEMENT2DISTANCE (CODE,DISTANCE,ELEMENTREFCODE,TRANSPORTDEPARTMENTCOD) VALUES (?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			if (anObject.distance != null) {
				anObject.distance = anObject.distance.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(2, anObject.distance);
			if (anObject.elementRef.code != Integer.MIN_VALUE){
				statement.setInt(3,anObject.elementRef.code);
			} else {
				statement.setNull(3,java.sql.Types.INTEGER);
			}
			if (anObject.transportDepartment.code != Integer.MIN_VALUE){
				statement.setInt(4,anObject.transportDepartment.code);
			} else {
				statement.setNull(4,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENElement2DistanceDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENElement2Distance anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENElement2Distance anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("DISTANCE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ELEMENTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TRANSPORTDEPARTMENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENELEMENT2DISTANCE SET  DISTANCE = ? , ELEMENTREFCODE = ? , TRANSPORTDEPARTMENTCOD = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENELEMENT2DISTANCE SET ";
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
					if (anObject.distance != null) {
						anObject.distance = anObject.distance.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(1, anObject.distance);
					if (anObject.elementRef.code != Integer.MIN_VALUE) {
						statement.setInt(2, anObject.elementRef.code);
					} else {
						statement.setNull(2, java.sql.Types.INTEGER);
					}
					if (anObject.transportDepartment.code != Integer.MIN_VALUE) {
						statement.setInt(3, anObject.transportDepartment.code);
					} else {
						statement.setNull(3, java.sql.Types.INTEGER);
					}
					statement.setInt(4, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("DISTANCE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.distance != null) {
								anObject.distance = anObject.distance.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.distance);
							continue;
						}
						if("ELEMENTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.elementRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.elementRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("TRANSPORTDEPARTMENT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.transportDepartment.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.transportDepartment.code);
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

	} // end of save(ENElement2Distance anObject,String[] anAttributes)


	public ENElement2DistanceShort getShortObject(int anObjectCode) throws PersistenceException {
		ENElement2Distance filterObject = new ENElement2Distance();
		Vector<ENElement2DistanceShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENElement2DistanceShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENElement2Distance filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.distance, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.elementRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.transportDepartment.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENElement2DistanceFilter filter) {
		String out = buildCondition((ENElement2Distance)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENElement2Distance filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENElement2Distance.code_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.distance, ENElement2Distance.distance_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.elementRef.code, ENElement2Distance.elementRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.transportDepartment.code, ENElement2Distance.transportDepartment_QFielld, out);
		}
		return out;
	}

	public ENElement2DistanceShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENElement2DistanceShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENElement2DistanceShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENElement2DistanceShortList getFilteredList(ENElement2Distance filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENElement2DistanceShortList getScrollableFilteredList(ENElement2Distance aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENElement2DistanceShortList getScrollableFilteredList(ENElement2Distance aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENElement2DistanceShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENElement2DistanceShortList getScrollableFilteredList(ENElement2DistanceFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENElement2DistanceShortList getScrollableFilteredList(ENElement2DistanceFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENElement2DistanceShortList getScrollableFilteredList(ENElement2Distance aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENElement2DistanceShortList result = new ENElement2DistanceShortList();
		ENElement2DistanceShort anObject;
		result.list = new Vector<ENElement2DistanceShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENELEMENT2DISTANCE.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENELEMENT2DISTANCE.CODE"+
			",ENELEMENT2DISTANCE.DISTANCE"+
			", ENELEMENT.CODE " +
			", ENTRANSPORTDEPARTMENT.CODE " +
			", ENTRANSPORTDEPARTMENT.NAME " +
		" FROM ENELEMENT2DISTANCE " +
			" LEFT JOIN ENELEMENT on ENELEMENT.CODE = ENELEMENT2DISTANCE.ELEMENTREFCODE "+
			" LEFT JOIN ENTRANSPORTDEPARTMENT on ENTRANSPORTDEPARTMENT.CODE = ENELEMENT2DISTANCE.TRANSPORTDEPARTMENTCOD "+
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
				anObject = new ENElement2DistanceShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.distance = set.getBigDecimal(2);
				if(anObject.distance != null) {
					anObject.distance = anObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.elementRefCode = set.getInt(3);
				if(set.wasNull()) {
					anObject.elementRefCode = Integer.MIN_VALUE;
				}
				anObject.transportDepartmentCode = set.getInt(4);
				if(set.wasNull()) {
					anObject.transportDepartmentCode = Integer.MIN_VALUE;
				}
				anObject.transportDepartmentName = set.getString(5);

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
	
	public int[] getFilteredCodeArray(ENElement2DistanceFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENElement2DistanceFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENElement2Distance aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENELEMENT2DISTANCE.CODE FROM ENELEMENT2DISTANCE";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENELEMENT2DISTANCE.CODE";
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


	public ENElement2Distance getObject(int uid) throws PersistenceException {
		ENElement2Distance result = new ENElement2Distance();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENElement2Distance anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENELEMENT2DISTANCE.CODE, ENELEMENT2DISTANCE.DISTANCE, ENELEMENT2DISTANCE.ELEMENTREFCODE, ENELEMENT2DISTANCE.TRANSPORTDEPARTMENTCOD "
			+" FROM ENELEMENT2DISTANCE WHERE ENELEMENT2DISTANCE.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.distance = set.getBigDecimal(2);
				if(anObject.distance != null) {
					anObject.distance = anObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.elementRef.code = set.getInt(3);
				if (set.wasNull()) {
					anObject.elementRef.code = Integer.MIN_VALUE;
				}
				anObject.transportDepartment.code = set.getInt(4);
				if (set.wasNull()) {
					anObject.transportDepartment.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENElement2DistanceRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENElement2DistanceRef ref = new com.ksoe.energynet.valueobject.references.ENElement2DistanceRef();
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

		selectStr = "DELETE FROM  ENELEMENT2DISTANCE WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENElement2Distance object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENElement2Distance.getObject%} access denied");
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
	
	public long count(ENElement2DistanceFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENElement2DistanceFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENElement2DistanceFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENELEMENT2DISTANCE", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENELEMENT2DISTANCE WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, ENElement2DistanceFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENElement2DistanceFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENELEMENT2DISTANCE");
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
			"SELECT  ENELEMENT2DISTANCE.CODE FROM  ENELEMENT2DISTANCE WHERE  ENELEMENT2DISTANCE.CODE = ?";
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
		_checkConditionToken(condition,"code","ENELEMENT2DISTANCE.CODE");
		_checkConditionToken(condition,"distance","ENELEMENT2DISTANCE.DISTANCE");
		// relationship conditions
		_checkConditionToken(condition,"elementref","ELEMENTREFCODE");
		_checkConditionToken(condition,"elementref.code","ELEMENTREFCODE");
		_checkConditionToken(condition,"transportdepartment","TRANSPORTDEPARTMENTCOD");
		_checkConditionToken(condition,"transportdepartment.code","TRANSPORTDEPARTMENTCOD");
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
	
	private void _collectAutoIncrementFields(ENElement2Distance anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENELEMENT2DISTANCE", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENELEMENT2DISTANCE", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENELEMENT2DISTANCE", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENELEMENT2DISTANCE");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENElement2DistanceDAO
