
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
import com.ksoe.energynet.valueobject.ENPowerReliabilityCategory;
import com.ksoe.energynet.valueobject.filter.ENPowerReliabilityCategoryFilter;
import com.ksoe.energynet.valueobject.brief.ENPowerReliabilityCategoryShort;
import com.ksoe.energynet.valueobject.lists.ENPowerReliabilityCategoryShortList;


/**
 * DAO Object for ENPowerReliabilityCategory;
 *
 */

public class ENPowerReliabilityCategoryDAOGen extends GenericDataMiner {

	public ENPowerReliabilityCategoryDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENPowerReliabilityCategoryDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENPowerReliabilityCategory inObject) throws PersistenceException {
		ENPowerReliabilityCategory obj = new ENPowerReliabilityCategory();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.name == null && obj.name == null){}
		else
			if(inObject.name == null || obj.name == null) return false;
			else
				if ( ! inObject.name.equals(obj.name)){
					return false;
				}

		if(inObject.coef == null && obj.coef == null){}
		else
			if(inObject.coef == null || obj.coef == null) return false;
			else
				if ( ! inObject.coef.equals(obj.coef)){
					return false;
				}
		if (inObject.settleTypeRef.code != obj.settleTypeRef.code){
			return false;
		}
		return true;
	}

	public int add(ENPowerReliabilityCategory anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENPowerReliabilityCategory anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENPOWERRELIABILITYCTGR (CODE,NAME,COEF,SETTLETYPEREFCODE) VALUES (?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.name);
			if (anObject.coef != null) {
				anObject.coef = anObject.coef.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(3, anObject.coef);
			if (anObject.settleTypeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENSettleTypeDAOGen(connection,getUserProfile()).exists(anObject.settleTypeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPowerReliabilityCategory.settleTypeRef.code%} = {%"+anObject.settleTypeRef.code+"%}");
				}
				statement.setInt(4,anObject.settleTypeRef.code);
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
			throw new PersistenceException("Error in method {%ENPowerReliabilityCategoryDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENPowerReliabilityCategory anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENPowerReliabilityCategory anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("NAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COEF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SETTLETYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENPOWERRELIABILITYCTGR SET  NAME = ? , COEF = ? , SETTLETYPEREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENPOWERRELIABILITYCATEGORY SET ";
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
					statement.setString(1, anObject.name);
					if (anObject.coef != null) {
						anObject.coef = anObject.coef.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(2, anObject.coef);
					if (anObject.settleTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(3, anObject.settleTypeRef.code);
					} else {
						statement.setNull(3, java.sql.Types.INTEGER);
					}
					statement.setInt(4, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.name);
							continue;
						}
						if("COEF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.coef != null) {
								anObject.coef = anObject.coef.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.coef);
							continue;
						}
						if("SETTLETYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.settleTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.settleTypeRef.code);
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

	} // end of save(ENPowerReliabilityCategory anObject,String[] anAttributes)


	public ENPowerReliabilityCategoryShort getShortObject(int anObjectCode) throws PersistenceException {
		ENPowerReliabilityCategory filterObject = new ENPowerReliabilityCategory();
		Vector<ENPowerReliabilityCategoryShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENPowerReliabilityCategoryShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENPowerReliabilityCategory filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.coef, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.settleTypeRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENPowerReliabilityCategoryFilter filter) {
		String out = buildCondition((ENPowerReliabilityCategory)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENPowerReliabilityCategory filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENPowerReliabilityCategory.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name, ENPowerReliabilityCategory.name_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.coef, ENPowerReliabilityCategory.coef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.settleTypeRef.code, ENPowerReliabilityCategory.settleTypeRef_QFielld, out);
		}
		return out;
	}

	public ENPowerReliabilityCategoryShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENPowerReliabilityCategoryShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENPowerReliabilityCategoryShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENPowerReliabilityCategoryShortList getFilteredList(ENPowerReliabilityCategory filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENPowerReliabilityCategoryShortList getScrollableFilteredList(ENPowerReliabilityCategory aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENPowerReliabilityCategoryShortList getScrollableFilteredList(ENPowerReliabilityCategory aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENPowerReliabilityCategoryShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENPowerReliabilityCategoryShortList getScrollableFilteredList(ENPowerReliabilityCategoryFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENPowerReliabilityCategoryShortList getScrollableFilteredList(ENPowerReliabilityCategoryFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENPowerReliabilityCategoryShortList getScrollableFilteredList(ENPowerReliabilityCategory aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENPowerReliabilityCategoryShortList result = new ENPowerReliabilityCategoryShortList();
		ENPowerReliabilityCategoryShort anObject;
		result.list = new Vector<ENPowerReliabilityCategoryShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENPOWERRELIABILITYCTGR.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENPOWERRELIABILITYCTGR.CODE"+
			",ENPOWERRELIABILITYCTGR.NAME"+
			",ENPOWERRELIABILITYCTGR.COEF"+
			", ENSETTLETYPE.CODE " +
			", ENSETTLETYPE.NAME " +
			", ENSETTLETYPE.COEF " +
		" FROM ENPOWERRELIABILITYCTGR " +
			" LEFT JOIN ENSETTLETYPE on ENSETTLETYPE.CODE = ENPOWERRELIABILITYCTGR.SETTLETYPEREFCODE "+
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
				anObject = new ENPowerReliabilityCategoryShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.name = set.getString(2);
				anObject.coef = set.getBigDecimal(3);
				if(anObject.coef != null) {
					anObject.coef = anObject.coef.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.settleTypeRefCode = set.getInt(4);
				if(set.wasNull()) {
					anObject.settleTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.settleTypeRefName = set.getString(5);
				anObject.settleTypeRefCoef = set.getBigDecimal(6);
				if(anObject.settleTypeRefCoef != null) {
					anObject.settleTypeRefCoef = anObject.settleTypeRefCoef.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
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
	
	public int[] getFilteredCodeArray(ENPowerReliabilityCategoryFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENPowerReliabilityCategoryFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENPowerReliabilityCategory aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENPOWERRELIABILITYCTGR.CODE FROM ENPOWERRELIABILITYCTGR";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENPOWERRELIABILITYCTGR.CODE";
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
				if(i < fromPosition) {
					continue;
				} else if(i >= fromPosition + quantity) {
					i++;
					break;
				}
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


	public ENPowerReliabilityCategory getObject(int uid) throws PersistenceException {
		ENPowerReliabilityCategory result = new ENPowerReliabilityCategory();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENPowerReliabilityCategory anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENPOWERRELIABILITYCTGR.CODE, ENPOWERRELIABILITYCTGR.NAME, ENPOWERRELIABILITYCTGR.COEF, ENPOWERRELIABILITYCTGR.SETTLETYPEREFCODE "
			+" FROM ENPOWERRELIABILITYCTGR WHERE ENPOWERRELIABILITYCTGR.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.name = set.getString(2);
				anObject.coef = set.getBigDecimal(3);
				if(anObject.coef != null) {
					anObject.coef = anObject.coef.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.settleTypeRef.code = set.getInt(4);
				if (set.wasNull()) {
					anObject.settleTypeRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENPowerReliabilityCategoryRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENPowerReliabilityCategoryRef ref = new com.ksoe.energynet.valueobject.references.ENPowerReliabilityCategoryRef();
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

		selectStr = "DELETE FROM  ENPOWERRELIABILITYCTGR WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENPowerReliabilityCategory object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENPowerReliabilityCategory.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENPowerReliabilityCategory.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENPowerReliabilityCategory.remove%} access denied");
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
	
	public long count(ENPowerReliabilityCategoryFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENPowerReliabilityCategoryFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENPowerReliabilityCategoryFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENPOWERRELIABILITYCTGR", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENPowerReliabilityCategoryFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENPOWERRELIABILITYCTGR");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPowerReliabilityCategory.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENPowerReliabilityCategory.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENPOWERRELIABILITYCTGR.CODE FROM  ENPOWERRELIABILITYCTGR WHERE  ENPOWERRELIABILITYCTGR.CODE = ?";
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
		_checkConditionToken(condition,"code","ENPOWERRELIABILITYCTGR.CODE");
		_checkConditionToken(condition,"name","ENPOWERRELIABILITYCTGR.NAME");
		_checkConditionToken(condition,"coef","ENPOWERRELIABILITYCTGR.COEF");
		// relationship conditions
		_checkConditionToken(condition,"settletyperef","SETTLETYPEREFCODE");
		_checkConditionToken(condition,"settletyperef.code","SETTLETYPEREFCODE");
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
	
	private void _collectAutoIncrementFields(ENPowerReliabilityCategory anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENPOWERRELIABILITYCTGR", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENPOWERRELIABILITYCTGR", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENPOWERRELIABILITYCTGR", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENPOWERRELIABILITYCTGR");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENPowerReliabilityCategoryDAO
