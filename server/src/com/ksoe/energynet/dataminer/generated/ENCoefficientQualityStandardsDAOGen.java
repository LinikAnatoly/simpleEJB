
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
import com.ksoe.energynet.valueobject.ENCoefficientQualityStandards;
import com.ksoe.energynet.valueobject.filter.ENCoefficientQualityStandardsFilter;
import com.ksoe.energynet.valueobject.brief.ENCoefficientQualityStandardsShort;
import com.ksoe.energynet.valueobject.lists.ENCoefficientQualityStandardsShortList;


/**
 * DAO Object for ENCoefficientQualityStandards;
 *
 */

public class ENCoefficientQualityStandardsDAOGen extends GenericDataMiner {

	public ENCoefficientQualityStandardsDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENCoefficientQualityStandardsDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENCoefficientQualityStandards inObject) throws PersistenceException {
		ENCoefficientQualityStandards obj = new ENCoefficientQualityStandards();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.summa == null && obj.summa == null){}
		else
			if(inObject.summa == null || obj.summa == null) return false;
			else
				if ( ! inObject.summa.equals(obj.summa)){
					return false;
				}

		if(inObject.coefficient == null && obj.coefficient == null){}
		else
			if(inObject.coefficient == null || obj.coefficient == null) return false;
			else
				if ( ! inObject.coefficient.equals(obj.coefficient)){
					return false;
				}

		if(inObject.dateGen == null && obj.dateGen == null){} else 
			if(inObject.dateGen == null || obj.dateGen == null) return false;
			else
				if (inObject.dateGen.compareTo(obj.dateGen) != 0){
					return false;
				}

		if (inObject.finPodrCode != obj.finPodrCode){
					return false;
				}

		if(inObject.axOrgId == null && obj.axOrgId == null){}
		else
			if(inObject.axOrgId == null || obj.axOrgId == null) return false;
			else
				if ( ! inObject.axOrgId.equals(obj.axOrgId)){
					return false;
				}
		return true;
	}

	public int add(ENCoefficientQualityStandards anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENCoefficientQualityStandards anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENCOEFFICINTQLTSTNDRDS (CODE,SUMMA,COEFFICIENT,DATEGEN,FINPODRCODE,AXORGID) VALUES (?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			if (anObject.summa != null) {
				anObject.summa = anObject.summa.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(2, anObject.summa);
			if (anObject.coefficient != null) {
				anObject.coefficient = anObject.coefficient.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(3, anObject.coefficient);
			if (anObject.dateGen == null) {
				statement.setTimestamp(4, null);
			} else {
				statement.setTimestamp(4, new java.sql.Timestamp(anObject.dateGen.getTime()));
			}
			if (anObject.finPodrCode != Integer.MIN_VALUE ) {
				statement.setInt(5, anObject.finPodrCode);
			} else {
				statement.setNull(5, java.sql.Types.INTEGER);
			}
			statement.setString(6, anObject.axOrgId);

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENCoefficientQualityStandardsDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENCoefficientQualityStandards anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENCoefficientQualityStandards anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("SUMMA") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COEFFICIENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FINPODRCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AXORGID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENCOEFFICINTQLTSTNDRDS SET  SUMMA = ? , COEFFICIENT = ? , DATEGEN = ? , FINPODRCODE = ? , AXORGID = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENCOEFFICIENTQUALITYSTANDARDS SET ";
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
					if (anObject.summa != null) {
						anObject.summa = anObject.summa.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(1, anObject.summa);
					if (anObject.coefficient != null) {
						anObject.coefficient = anObject.coefficient.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(2, anObject.coefficient);
					if (anObject.dateGen == null) {
						statement.setTimestamp(3, null);
					} else {
						statement.setTimestamp(3, new java.sql.Timestamp(anObject.dateGen.getTime()));
					}
					if (anObject.finPodrCode != Integer.MIN_VALUE) {
						statement.setInt(4, anObject.finPodrCode);
					} else {
						statement.setNull(4, java.sql.Types.INTEGER);
					}
					statement.setString(5, anObject.axOrgId);
					statement.setInt(6, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("SUMMA".compareTo((String)fields.get(i)) == 0) {
							if (anObject.summa != null) {
								anObject.summa = anObject.summa.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.summa);
							continue;
						}
						if("COEFFICIENT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.coefficient != null) {
								anObject.coefficient = anObject.coefficient.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.coefficient);
							continue;
						}
						if("DATEGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateGen == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1, new java.sql.Timestamp(anObject.dateGen.getTime()));
							}
							continue;
						}
						if("FINPODRCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.finPodrCode);
							continue;
						}
						if("AXORGID".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.axOrgId);
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

	} // end of save(ENCoefficientQualityStandards anObject,String[] anAttributes)


	public ENCoefficientQualityStandardsShort getShortObject(int anObjectCode) throws PersistenceException {
		ENCoefficientQualityStandards filterObject = new ENCoefficientQualityStandards();
		Vector<ENCoefficientQualityStandardsShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENCoefficientQualityStandardsShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENCoefficientQualityStandards filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.summa, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.coefficient, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateGen, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.finPodrCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.axOrgId, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENCoefficientQualityStandardsFilter filter) {
		String out = buildCondition((ENCoefficientQualityStandards)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENCoefficientQualityStandards filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENCoefficientQualityStandards.code_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.summa, ENCoefficientQualityStandards.summa_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.coefficient, ENCoefficientQualityStandards.coefficient_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateGen, ENCoefficientQualityStandards.dateGen_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.finPodrCode, ENCoefficientQualityStandards.finPodrCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.axOrgId, ENCoefficientQualityStandards.axOrgId_QFielld, out);
		}
		return out;
	}

	public ENCoefficientQualityStandardsShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENCoefficientQualityStandardsShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENCoefficientQualityStandardsShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENCoefficientQualityStandardsShortList getFilteredList(ENCoefficientQualityStandards filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENCoefficientQualityStandardsShortList getScrollableFilteredList(ENCoefficientQualityStandards aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENCoefficientQualityStandardsShortList getScrollableFilteredList(ENCoefficientQualityStandards aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENCoefficientQualityStandardsShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENCoefficientQualityStandardsShortList getScrollableFilteredList(ENCoefficientQualityStandardsFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENCoefficientQualityStandardsShortList getScrollableFilteredList(ENCoefficientQualityStandardsFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENCoefficientQualityStandardsShortList getScrollableFilteredList(ENCoefficientQualityStandards aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENCoefficientQualityStandardsShortList result = new ENCoefficientQualityStandardsShortList();
		ENCoefficientQualityStandardsShort anObject;
		result.list = new Vector<ENCoefficientQualityStandardsShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENCOEFFICINTQLTSTNDRDS.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENCOEFFICINTQLTSTNDRDS.CODE"+
			",ENCOEFFICINTQLTSTNDRDS.SUMMA"+
			",ENCOEFFICINTQLTSTNDRDS.COEFFICIENT"+
			",ENCOEFFICINTQLTSTNDRDS.DATEGEN"+
			",ENCOEFFICINTQLTSTNDRDS.FINPODRCODE"+
			",ENCOEFFICINTQLTSTNDRDS.AXORGID"+
		" FROM ENCOEFFICINTQLTSTNDRDS " +
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
				anObject = new ENCoefficientQualityStandardsShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.summa = set.getBigDecimal(2);
				if(anObject.summa != null) {
					anObject.summa = anObject.summa.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.coefficient = set.getBigDecimal(3);
				if(anObject.coefficient != null) {
					anObject.coefficient = anObject.coefficient.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.dateGen = set.getTimestamp(4);
				anObject.finPodrCode = set.getInt(5);
				if ( set.wasNull() ) {
					anObject.finPodrCode = Integer.MIN_VALUE;
				}
				anObject.axOrgId = set.getString(6);


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
	
	public int[] getFilteredCodeArray(ENCoefficientQualityStandardsFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENCoefficientQualityStandardsFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENCoefficientQualityStandards aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENCOEFFICINTQLTSTNDRDS.CODE FROM ENCOEFFICINTQLTSTNDRDS";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENCOEFFICINTQLTSTNDRDS.CODE";
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


	public ENCoefficientQualityStandards getObject(int uid) throws PersistenceException {
		ENCoefficientQualityStandards result = new ENCoefficientQualityStandards();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENCoefficientQualityStandards anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENCOEFFICINTQLTSTNDRDS.CODE, ENCOEFFICINTQLTSTNDRDS.SUMMA, ENCOEFFICINTQLTSTNDRDS.COEFFICIENT, ENCOEFFICINTQLTSTNDRDS.DATEGEN, ENCOEFFICINTQLTSTNDRDS.FINPODRCODE, ENCOEFFICINTQLTSTNDRDS.AXORGID "
			+" FROM ENCOEFFICINTQLTSTNDRDS WHERE ENCOEFFICINTQLTSTNDRDS.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.summa = set.getBigDecimal(2);
				if(anObject.summa != null) {
					anObject.summa = anObject.summa.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.coefficient = set.getBigDecimal(3);
				if(anObject.coefficient != null) {
					anObject.coefficient = anObject.coefficient.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.dateGen = set.getTimestamp(4);
				anObject.finPodrCode = set.getInt(5);
				if (set.wasNull()) {
					anObject.finPodrCode = Integer.MIN_VALUE;
				}
				anObject.axOrgId = set.getString(6);
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


	public com.ksoe.energynet.valueobject.references.ENCoefficientQualityStandardsRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENCoefficientQualityStandardsRef ref = new com.ksoe.energynet.valueobject.references.ENCoefficientQualityStandardsRef();
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

		selectStr = "DELETE FROM  ENCOEFFICINTQLTSTNDRDS WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENCoefficientQualityStandards object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENCoefficientQualityStandards.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENCoefficientQualityStandards.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENCoefficientQualityStandards.remove%} access denied");
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
	
	public long count(ENCoefficientQualityStandardsFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENCoefficientQualityStandardsFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENCoefficientQualityStandardsFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENCOEFFICINTQLTSTNDRDS", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENCoefficientQualityStandardsFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENCOEFFICINTQLTSTNDRDS");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENCoefficientQualityStandards.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENCoefficientQualityStandards.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENCOEFFICINTQLTSTNDRDS.CODE FROM  ENCOEFFICINTQLTSTNDRDS WHERE  ENCOEFFICINTQLTSTNDRDS.CODE = ?";
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
		_checkConditionToken(condition,"code","ENCOEFFICINTQLTSTNDRDS.CODE");
		_checkConditionToken(condition,"summa","ENCOEFFICINTQLTSTNDRDS.SUMMA");
		_checkConditionToken(condition,"coefficient","ENCOEFFICINTQLTSTNDRDS.COEFFICIENT");
		_checkConditionToken(condition,"dategen","ENCOEFFICINTQLTSTNDRDS.DATEGEN");
		_checkConditionToken(condition,"finpodrcode","ENCOEFFICINTQLTSTNDRDS.FINPODRCODE");
		_checkConditionToken(condition,"axorgid","ENCOEFFICINTQLTSTNDRDS.AXORGID");
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
	
	private void _collectAutoIncrementFields(ENCoefficientQualityStandards anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENCOEFFICINTQLTSTNDRDS", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENCOEFFICINTQLTSTNDRDS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENCOEFFICINTQLTSTNDRDS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENCOEFFICINTQLTSTNDRDS");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENCoefficientQualityStandardsDAO
