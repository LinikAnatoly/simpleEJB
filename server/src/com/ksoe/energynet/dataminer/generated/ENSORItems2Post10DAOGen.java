
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
import com.ksoe.energynet.valueobject.ENSORItems2Post10;
import com.ksoe.energynet.valueobject.filter.ENSORItems2Post10Filter;
import com.ksoe.energynet.valueobject.brief.ENSORItems2Post10Short;
import com.ksoe.energynet.valueobject.lists.ENSORItems2Post10ShortList;


/**
 * DAO Object for ENSORItems2Post10;
 *
 */

public class ENSORItems2Post10DAOGen extends GenericDataMiner {

	public ENSORItems2Post10DAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENSORItems2Post10DAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENSORItems2Post10 inObject) throws PersistenceException {
		ENSORItems2Post10 obj = new ENSORItems2Post10();
		obj.code = inObject.code;
		loadObject(obj);
		if (inObject.post10Ref.code != obj.post10Ref.code){
			return false;
		}
		if (inObject.sorItemRef.code != obj.sorItemRef.code){
			return false;
		}
		return true;
	}

	public int add(ENSORItems2Post10 anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENSORItems2Post10 anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENSORITEMS2POST10 (CODE,POST10REFCODE,SORITEMREFCODE) VALUES (?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.post10Ref.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.netobjects.dataminer.generated.ENPost10OKSNDAOGen(connection,getUserProfile()).exists(anObject.post10Ref.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.netobjects.valueobject.ENSORItems2Post10.post10Ref.code%} = {%"+anObject.post10Ref.code+"%}");
				}
				statement.setInt(2,anObject.post10Ref.code);
			} else {
				statement.setNull(2,java.sql.Types.INTEGER);
			}
			if (anObject.sorItemRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENSORentItemsDAOGen(connection,getUserProfile()).exists(anObject.sorItemRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENSORItems2Post10.sorItemRef.code%} = {%"+anObject.sorItemRef.code+"%}");
				}
				statement.setInt(3,anObject.sorItemRef.code);
			} else {
				statement.setNull(3,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENSORItems2Post10DAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENSORItems2Post10 anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENSORItems2Post10 anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("POST10REF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SORITEMREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENSORITEMS2POST10 SET POST10REFCODE = ? , SORITEMREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENSORITEMS2POST10 SET ";
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
					if (anObject.post10Ref.code != Integer.MIN_VALUE) {
						statement.setInt(1,anObject.post10Ref.code);
					} else {
						statement.setNull(1,java.sql.Types.INTEGER);
					}
					if (anObject.sorItemRef.code != Integer.MIN_VALUE) {
						statement.setInt(2,anObject.sorItemRef.code);
					} else {
						statement.setNull(2,java.sql.Types.INTEGER);
					}
					statement.setInt(3,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("POST10REF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.post10Ref.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.post10Ref.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("SORITEMREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sorItemRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.sorItemRef.code);
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

	} // end of save(ENSORItems2Post10 anObject,String[] anAttributes)


	public ENSORItems2Post10Short getShortObject(int anObjectCode) throws PersistenceException {
		ENSORItems2Post10 filterObject = new ENSORItems2Post10();
		Vector<ENSORItems2Post10Short> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENSORItems2Post10Short)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENSORItems2Post10 filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.post10Ref.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.sorItemRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENSORItems2Post10Filter filter) {
		String out = buildCondition((ENSORItems2Post10)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENSORItems2Post10 filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENSORItems2Post10.code_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.post10Ref.code, ENSORItems2Post10.post10Ref_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.sorItemRef.code, ENSORItems2Post10.sorItemRef_QFielld, out);
		}
		return out;
	}

	public ENSORItems2Post10ShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENSORItems2Post10ShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENSORItems2Post10ShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENSORItems2Post10ShortList getFilteredList(ENSORItems2Post10 filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENSORItems2Post10ShortList getScrollableFilteredList(ENSORItems2Post10 aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENSORItems2Post10ShortList getScrollableFilteredList(ENSORItems2Post10 aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENSORItems2Post10ShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENSORItems2Post10ShortList getScrollableFilteredList(ENSORItems2Post10Filter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENSORItems2Post10ShortList getScrollableFilteredList(ENSORItems2Post10Filter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENSORItems2Post10ShortList getScrollableFilteredList(ENSORItems2Post10 aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENSORItems2Post10ShortList result = new ENSORItems2Post10ShortList();
		ENSORItems2Post10Short anObject;
		result.list = new Vector<ENSORItems2Post10Short>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSORITEMS2POST10.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSORITEMS2POST10.CODE"+
			", ENPOST10OKSN.CODE " +
			", ENSORENTITEMS.CODE " +
			", ENSORENTITEMS.LOCALITYNAME " +
			", ENSORENTITEMS.ADDRESS " +
			", ENSORENTITEMS.PYLONNUMBERS " +
			", ENSORENTITEMS.JOINTLINELENGHT " +
			", ENSORENTITEMS.LINEPURPOSE " +
			", ENSORENTITEMS.JOINTLINECABLEMARK " +
			", ENSORENTITEMS.BRANCHLINENAME " +
			", ENSORENTITEMS.USERGEN " +
			", ENSORENTITEMS.DATEEDIT " +
		" FROM ENSORITEMS2POST10 " +
			", ENPOST10OKSN " +
			", ENSORENTITEMS " +
		"";
		whereStr = " ENPOST10OKSN.CODE = ENSORITEMS2POST10.POST10REFCODE" ; //+
		whereStr += " AND ENSORENTITEMS.CODE = ENSORITEMS2POST10.SORITEMREFCODE" ; //+

	
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
				anObject = new ENSORItems2Post10Short();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}

				anObject.post10RefCode = set.getInt(2);
				if(set.wasNull()) {
					anObject.post10RefCode = Integer.MIN_VALUE;
				}
				anObject.sorItemRefCode = set.getInt(3);
				if(set.wasNull()) {
					anObject.sorItemRefCode = Integer.MIN_VALUE;
				}
				anObject.sorItemRefLocalityName = set.getString(4);
				anObject.sorItemRefAddress = set.getString(5);
				anObject.sorItemRefPylonNumbers = set.getString(6);
				anObject.sorItemRefJointLineLenght = set.getBigDecimal(7);
				if(anObject.sorItemRefJointLineLenght != null) {
					anObject.sorItemRefJointLineLenght = anObject.sorItemRefJointLineLenght.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sorItemRefLinePurpose = set.getString(8);
				anObject.sorItemRefJointLineCableMark = set.getString(9);
				anObject.sorItemRefBranchLineName = set.getString(10);
				anObject.sorItemRefUserGen = set.getString(11);
				anObject.sorItemRefDateEdit = set.getTimestamp(12);

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
	
	public int[] getFilteredCodeArray(ENSORItems2Post10Filter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}


	public int[] getFilteredCodeArray(ENSORItems2Post10 aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENSORITEMS2POST10.CODE FROM ENSORITEMS2POST10";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSORITEMS2POST10.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		
		if (whereStr.length() > 0) {
			whereStr += " AND " + buildCondition(aFilterObject);}
		else {
			whereStr = buildCondition(aFilterObject);
		} 

		if(condition.length() != 0) {
			if(whereStr.length() != 0) {
				whereStr = whereStr + " AND ";
			}
			whereStr = whereStr + " (" + condition + ")";
		}

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

	public ENSORItems2Post10 getObject(int uid) throws PersistenceException {
		ENSORItems2Post10 result = new ENSORItems2Post10();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENSORItems2Post10 anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENSORITEMS2POST10.CODE, ENSORITEMS2POST10.POST10REFCODE, ENSORITEMS2POST10.SORITEMREFCODE "
			+" FROM ENSORITEMS2POST10 WHERE ENSORITEMS2POST10.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			}
			anObject.post10Ref.code = set.getInt(2);
			if (set.wasNull()) {
				anObject.post10Ref.code = Integer.MIN_VALUE;
			}
			anObject.sorItemRef.code = set.getInt(3);
			if (set.wasNull()) {
				anObject.sorItemRef.code = Integer.MIN_VALUE;
			}
			if(anObject.post10Ref.code != Integer.MIN_VALUE) {
				anObject.setPost10Ref(
					new com.ksoe.netobjects.dataminer.generated.ENPost10OKSNDAOGen(connection,getUserProfile()).getRef(anObject.post10Ref.code));
			}
			if(anObject.sorItemRef.code != Integer.MIN_VALUE) {
				anObject.setSorItemRef(
					new com.ksoe.energynet.dataminer.generated.ENSORentItemsDAOGen(connection,getUserProfile()).getRef(anObject.sorItemRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENSORItems2Post10Ref getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENSORItems2Post10Ref ref = new com.ksoe.energynet.valueobject.references.ENSORItems2Post10Ref();
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

		selectStr = "DELETE FROM  ENSORITEMS2POST10 WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENSORItems2Post10 object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENSORItems2Post10.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENSORItems2Post10.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENSORItems2Post10.remove%} access denied");
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
	
	public long count(ENSORItems2Post10Filter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENSORItems2Post10Filter filter, Vector<Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENSORItems2Post10Filter filter, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENSORITEMS2POST10", aggFunction, column);
		String whereStr = "";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		whereStr += buildCondition(filter);

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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENSORItems2Post10Filter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENSORITEMS2POST10");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENSORItems2Post10.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENSORItems2Post10.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENSORITEMS2POST10.CODE FROM  ENSORITEMS2POST10 WHERE  ENSORITEMS2POST10.CODE = ?";
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
		_checkConditionToken(condition,"code","ENSORITEMS2POST10.CODE");
		// relationship conditions
		_checkConditionToken(condition,"post10ref","POST10REFCODE");
		_checkConditionToken(condition,"post10ref.code","POST10REFCODE");
		_checkConditionToken(condition,"soritemref","SORITEMREFCODE");
		_checkConditionToken(condition,"soritemref.code","SORITEMREFCODE");
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
	
	private void _collectAutoIncrementFields(ENSORItems2Post10 anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENSORITEMS2POST10", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENSORITEMS2POST10", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENSORITEMS2POST10", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENSORITEMS2POST10");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENSORItems2Post10DAO
