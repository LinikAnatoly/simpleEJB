
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
import com.ksoe.energynet.valueobject.ENBudgets2Nomenclatures;
import com.ksoe.energynet.valueobject.filter.ENBudgets2NomenclaturesFilter;
import com.ksoe.energynet.valueobject.brief.ENBudgets2NomenclaturesShort;
import com.ksoe.energynet.valueobject.lists.ENBudgets2NomenclaturesShortList;


/**
 * DAO Object for ENBudgets2Nomenclatures;
 *
 */

public class ENBudgets2NomenclaturesDAOGen extends GenericDataMiner {

	public ENBudgets2NomenclaturesDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENBudgets2NomenclaturesDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENBudgets2Nomenclatures inObject) throws PersistenceException {
		ENBudgets2Nomenclatures obj = new ENBudgets2Nomenclatures();
		obj.code = inObject.code;
		loadObject(obj);

		if (inObject.mat_id != obj.mat_id){
					return false;
				}

		if(inObject.nn == null && obj.nn == null){}
		else
			if(inObject.nn == null || obj.nn == null) return false;
			else
				if ( ! inObject.nn.equals(obj.nn)){
					return false;
				}

		if(inObject.mat_name == null && obj.mat_name == null){}
		else
			if(inObject.mat_name == null || obj.mat_name == null) return false;
			else
				if ( ! inObject.mat_name.equals(obj.mat_name)){
					return false;
				}
		if (inObject.budgetRef.code != obj.budgetRef.code){
			return false;
		}
		return true;
	}

	public int add(ENBudgets2Nomenclatures anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENBudgets2Nomenclatures anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENBUDGETS2NOMENCLATURS (CODE,MAT_ID,NN,MAT_NAME,BUDGETREFCODE) VALUES (?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.mat_id != Integer.MIN_VALUE ) {
				statement.setInt(2,anObject.mat_id);
			} else {
				statement.setNull(2,java.sql.Types.INTEGER);
			}
			statement.setString(3,anObject.nn);
			statement.setString(4,anObject.mat_name);
			if (anObject.budgetRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).exists(anObject.budgetRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENBudgets2Nomenclatures.budgetRef.code%} = {%"+anObject.budgetRef.code+"%}");
				}
				statement.setInt(5,anObject.budgetRef.code);
			} else {
				statement.setNull(5,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENBudgets2NomenclaturesDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENBudgets2Nomenclatures anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENBudgets2Nomenclatures anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("MAT_ID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MAT_NAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BUDGETREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENBUDGETS2NOMENCLATURS SET  MAT_ID = ? , NN = ? , MAT_NAME = ? , BUDGETREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENBUDGETS2NOMENCLATURES SET ";
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
					if (anObject.mat_id != Integer.MIN_VALUE) {
						statement.setInt(1,anObject.mat_id);
					} else {
						statement.setNull(1,java.sql.Types.INTEGER);
					}
					statement.setString(2,anObject.nn);
					statement.setString(3,anObject.mat_name);
					if (anObject.budgetRef.code != Integer.MIN_VALUE) {
						statement.setInt(4,anObject.budgetRef.code);
					} else {
						statement.setNull(4,java.sql.Types.INTEGER);
					}
					statement.setInt(5,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("MAT_ID".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.mat_id);
							continue;
						}
						if("NN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.nn);
							continue;
						}
						if("MAT_NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.mat_name);
							continue;
						}
						if("BUDGETREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.budgetRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.budgetRef.code);
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

	} // end of save(ENBudgets2Nomenclatures anObject,String[] anAttributes)


	public ENBudgets2NomenclaturesShort getShortObject(int anObjectCode) throws PersistenceException {
		ENBudgets2Nomenclatures filterObject = new ENBudgets2Nomenclatures();
		Vector<ENBudgets2NomenclaturesShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENBudgets2NomenclaturesShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENBudgets2Nomenclatures filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.mat_id, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.nn, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.mat_name, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.budgetRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENBudgets2NomenclaturesFilter filter) {
		String out = buildCondition((ENBudgets2Nomenclatures)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENBudgets2Nomenclatures filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENBudgets2Nomenclatures.code_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.mat_id, ENBudgets2Nomenclatures.mat_id_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.nn, ENBudgets2Nomenclatures.nn_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.mat_name, ENBudgets2Nomenclatures.mat_name_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.budgetRef.code, ENBudgets2Nomenclatures.budgetRef_QFielld, out);
		}
		return out;
	}

	public ENBudgets2NomenclaturesShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENBudgets2NomenclaturesShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENBudgets2NomenclaturesShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENBudgets2NomenclaturesShortList getFilteredList(ENBudgets2Nomenclatures filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENBudgets2NomenclaturesShortList getScrollableFilteredList(ENBudgets2Nomenclatures aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENBudgets2NomenclaturesShortList getScrollableFilteredList(ENBudgets2Nomenclatures aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENBudgets2NomenclaturesShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENBudgets2NomenclaturesShortList getScrollableFilteredList(ENBudgets2NomenclaturesFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENBudgets2NomenclaturesShortList getScrollableFilteredList(ENBudgets2NomenclaturesFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENBudgets2NomenclaturesShortList getScrollableFilteredList(ENBudgets2Nomenclatures aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENBudgets2NomenclaturesShortList result = new ENBudgets2NomenclaturesShortList();
		ENBudgets2NomenclaturesShort anObject;
		result.list = new Vector<ENBudgets2NomenclaturesShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENBUDGETS2NOMENCLATURS.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENBUDGETS2NOMENCLATURS.CODE"+
			",ENBUDGETS2NOMENCLATURS.NN"+
			",ENBUDGETS2NOMENCLATURS.MAT_NAME"+
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
		" FROM ENBUDGETS2NOMENCLATURS " +
			", ENDEPARTMENT " +
		"";
		whereStr = " ENDEPARTMENT.CODE = ENBUDGETS2NOMENCLATURS.BUDGETREFCODE" ; //+

	
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
				anObject = new ENBudgets2NomenclaturesShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.nn = set.getString(2);
				anObject.mat_name = set.getString(3);

				anObject.budgetRefCode = set.getInt(4);
				if(set.wasNull()) {
					anObject.budgetRefCode = Integer.MIN_VALUE;
				}
				anObject.budgetRefShortName = set.getString(5);
				anObject.budgetRefDateStart = set.getDate(6);
				anObject.budgetRefDateFinal = set.getDate(7);
				anObject.budgetRefRenCode = set.getInt(8);
				if(set.wasNull()) {
					anObject.budgetRefRenCode = Integer.MIN_VALUE;
				}
				anObject.budgetRefShpzBalans = set.getString(9);
				anObject.budgetRefKau_table_id_1884 = set.getInt(10);
				if(set.wasNull()) {
					anObject.budgetRefKau_table_id_1884 = Integer.MIN_VALUE;
				}
				anObject.budgetRefKau_1884 = set.getString(11);
				anObject.budgetRefName_1884 = set.getString(12);
				anObject.budgetRefHrmorganizationid = set.getString(13);

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
	
	public int[] getFilteredCodeArray(ENBudgets2NomenclaturesFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}


	public int[] getFilteredCodeArray(ENBudgets2Nomenclatures aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENBUDGETS2NOMENCLATURS.CODE FROM ENBUDGETS2NOMENCLATURS";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENBUDGETS2NOMENCLATURS.CODE";
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

	public ENBudgets2Nomenclatures getObject(int uid) throws PersistenceException {
		ENBudgets2Nomenclatures result = new ENBudgets2Nomenclatures();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENBudgets2Nomenclatures anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENBUDGETS2NOMENCLATURS.CODE, ENBUDGETS2NOMENCLATURS.MAT_ID, ENBUDGETS2NOMENCLATURS.NN, ENBUDGETS2NOMENCLATURS.MAT_NAME, ENBUDGETS2NOMENCLATURS.BUDGETREFCODE "
			+" FROM ENBUDGETS2NOMENCLATURS WHERE ENBUDGETS2NOMENCLATURS.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.mat_id = set.getInt(2);
				if (set.wasNull()) {
					anObject.mat_id = Integer.MIN_VALUE;
				}
				anObject.nn = set.getString(3);
				anObject.mat_name = set.getString(4);
				anObject.budgetRef.code = set.getInt(5);
				if (set.wasNull()) {
					anObject.budgetRef.code = Integer.MIN_VALUE;
				}
				if(anObject.budgetRef.code != Integer.MIN_VALUE) {
					anObject.setBudgetRef(
						new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getRef(anObject.budgetRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENBudgets2NomenclaturesRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENBudgets2NomenclaturesRef ref = new com.ksoe.energynet.valueobject.references.ENBudgets2NomenclaturesRef();
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

		selectStr = "DELETE FROM  ENBUDGETS2NOMENCLATURS WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENBudgets2Nomenclatures object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENBudgets2Nomenclatures.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENBudgets2Nomenclatures.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENBudgets2Nomenclatures.remove%} access denied");
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
	
	public long count(ENBudgets2NomenclaturesFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENBudgets2NomenclaturesFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENBudgets2NomenclaturesFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENBUDGETS2NOMENCLATURS", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENBudgets2NomenclaturesFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENBUDGETS2NOMENCLATURS");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENBudgets2Nomenclatures.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENBudgets2Nomenclatures.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENBUDGETS2NOMENCLATURS.CODE FROM  ENBUDGETS2NOMENCLATURS WHERE  ENBUDGETS2NOMENCLATURS.CODE = ?";
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
		_checkConditionToken(condition,"code","ENBUDGETS2NOMENCLATURS.CODE");
		_checkConditionToken(condition,"mat_id","ENBUDGETS2NOMENCLATURS.MAT_ID");
		_checkConditionToken(condition,"nn","ENBUDGETS2NOMENCLATURS.NN");
		_checkConditionToken(condition,"mat_name","ENBUDGETS2NOMENCLATURS.MAT_NAME");
		// relationship conditions
		_checkConditionToken(condition,"budgetref","BUDGETREFCODE");
		_checkConditionToken(condition,"budgetref.code","BUDGETREFCODE");
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
	
	private void _collectAutoIncrementFields(ENBudgets2Nomenclatures anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENBUDGETS2NOMENCLATURS", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENBUDGETS2NOMENCLATURS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENBUDGETS2NOMENCLATURS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENBUDGETS2NOMENCLATURS");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENBudgets2NomenclaturesDAO
