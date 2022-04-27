
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
import com.ksoe.energynet.valueobject.ENActPostingKind;
import com.ksoe.energynet.valueobject.filter.ENActPostingKindFilter;
import com.ksoe.energynet.valueobject.brief.ENActPostingKindShort;
import com.ksoe.energynet.valueobject.lists.ENActPostingKindShortList;


/**
 * DAO Object for ENActPostingKind;
 *
 */

public class ENActPostingKindDAOGen extends GenericDataMiner {

	public ENActPostingKindDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENActPostingKindDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENActPostingKind inObject) throws PersistenceException {
		ENActPostingKind obj = new ENActPostingKind();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.numberGen == null && obj.numberGen == null){}
		else
			if(inObject.numberGen == null || obj.numberGen == null) return false;
			else
				if ( ! inObject.numberGen.equals(obj.numberGen)){
					return false;
				}

		if(inObject.name == null && obj.name == null){}
		else
			if(inObject.name == null || obj.name == null) return false;
			else
				if ( ! inObject.name.equals(obj.name)){
					return false;
				}

		if(inObject.dateTemplate == null && obj.dateTemplate == null){} else 
			if(inObject.dateTemplate == null || obj.dateTemplate == null) return false;
			else
				if (inObject.dateTemplate.compareTo(obj.dateTemplate) != 0){
					return false;
				}

		if(inObject.account_expense == null && obj.account_expense == null){}
		else
			if(inObject.account_expense == null || obj.account_expense == null) return false;
			else
				if ( ! inObject.account_expense.equals(obj.account_expense)){
					return false;
				}

		if(inObject.kau_expense == null && obj.kau_expense == null){}
		else
			if(inObject.kau_expense == null || obj.kau_expense == null) return false;
			else
				if ( ! inObject.kau_expense.equals(obj.kau_expense)){
					return false;
				}

		if(inObject.account_closing == null && obj.account_closing == null){}
		else
			if(inObject.account_closing == null || obj.account_closing == null) return false;
			else
				if ( ! inObject.account_closing.equals(obj.account_closing)){
					return false;
				}

		if(inObject.kau_closing == null && obj.kau_closing == null){}
		else
			if(inObject.kau_closing == null || obj.kau_closing == null) return false;
			else
				if ( ! inObject.kau_closing.equals(obj.kau_closing)){
					return false;
				}

		if(inObject.typeOperMatetialsAct == null && obj.typeOperMatetialsAct == null){}
		else
			if(inObject.typeOperMatetialsAct == null || obj.typeOperMatetialsAct == null) return false;
			else
				if ( ! inObject.typeOperMatetialsAct.equals(obj.typeOperMatetialsAct)){
					return false;
				}

		if(inObject.typeOperMatetialsOrder == null && obj.typeOperMatetialsOrder == null){}
		else
			if(inObject.typeOperMatetialsOrder == null || obj.typeOperMatetialsOrder == null) return false;
			else
				if ( ! inObject.typeOperMatetialsOrder.equals(obj.typeOperMatetialsOrder)){
					return false;
				}

		if(inObject.typeOperCountersAct == null && obj.typeOperCountersAct == null){}
		else
			if(inObject.typeOperCountersAct == null || obj.typeOperCountersAct == null) return false;
			else
				if ( ! inObject.typeOperCountersAct.equals(obj.typeOperCountersAct)){
					return false;
				}
		return true;
	}

	public int add(ENActPostingKind anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENActPostingKind anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENACTPOSTINGKIND (CODE,NUMBERGEN,NAME,DATETEMPLATE,ACCOUNT_EXPENSE,KAU_EXPENSE,ACCOUNT_CLOSING,KAU_CLOSING,TYPEOPERMATETIALSACT,TYPEOPERMATETIALSORDER,TYPEOPERCOUNTERSACT) VALUES (?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.numberGen);
			statement.setString(3, anObject.name);
			if (anObject.dateTemplate == null) {
				statement.setTimestamp(4, null);
			} else {
				statement.setTimestamp(4, new java.sql.Timestamp(anObject.dateTemplate.getTime()));
			}
			statement.setString(5, anObject.account_expense);
			statement.setString(6, anObject.kau_expense);
			statement.setString(7, anObject.account_closing);
			statement.setString(8, anObject.kau_closing);
			statement.setString(9, anObject.typeOperMatetialsAct);
			statement.setString(10, anObject.typeOperMatetialsOrder);
			statement.setString(11, anObject.typeOperCountersAct);

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENActPostingKindDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENActPostingKind anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENActPostingKind anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("NUMBERGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATETEMPLATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCOUNT_EXPENSE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KAU_EXPENSE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCOUNT_CLOSING") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KAU_CLOSING") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TYPEOPERMATETIALSACT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TYPEOPERMATETIALSORDER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TYPEOPERCOUNTERSACT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENACTPOSTINGKIND SET  NUMBERGEN = ? , NAME = ? , DATETEMPLATE = ? , ACCOUNT_EXPENSE = ? , KAU_EXPENSE = ? , ACCOUNT_CLOSING = ? , KAU_CLOSING = ? , TYPEOPERMATETIALSACT = ? , TYPEOPERMATETIALSORDER = ? , TYPEOPERCOUNTERSACT = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENACTPOSTINGKIND SET ";
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
					statement.setString(1, anObject.numberGen);
					statement.setString(2, anObject.name);
					if (anObject.dateTemplate == null) {
						statement.setTimestamp(3, null);
					} else {
						statement.setTimestamp(3, new java.sql.Timestamp(anObject.dateTemplate.getTime()));
					}
					statement.setString(4, anObject.account_expense);
					statement.setString(5, anObject.kau_expense);
					statement.setString(6, anObject.account_closing);
					statement.setString(7, anObject.kau_closing);
					statement.setString(8, anObject.typeOperMatetialsAct);
					statement.setString(9, anObject.typeOperMatetialsOrder);
					statement.setString(10, anObject.typeOperCountersAct);
					statement.setInt(11, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("NUMBERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.numberGen);
							continue;
						}
						if("NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.name);
							continue;
						}
						if("DATETEMPLATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateTemplate == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1, new java.sql.Timestamp(anObject.dateTemplate.getTime()));
							}
							continue;
						}
						if("ACCOUNT_EXPENSE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.account_expense);
							continue;
						}
						if("KAU_EXPENSE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.kau_expense);
							continue;
						}
						if("ACCOUNT_CLOSING".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.account_closing);
							continue;
						}
						if("KAU_CLOSING".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.kau_closing);
							continue;
						}
						if("TYPEOPERMATETIALSACT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.typeOperMatetialsAct);
							continue;
						}
						if("TYPEOPERMATETIALSORDER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.typeOperMatetialsOrder);
							continue;
						}
						if("TYPEOPERCOUNTERSACT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.typeOperCountersAct);
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

	} // end of save(ENActPostingKind anObject,String[] anAttributes)


	public ENActPostingKindShort getShortObject(int anObjectCode) throws PersistenceException {
		ENActPostingKind filterObject = new ENActPostingKind();
		Vector<ENActPostingKindShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENActPostingKindShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENActPostingKind filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.numberGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateTemplate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.account_expense, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.kau_expense, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.account_closing, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.kau_closing, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.typeOperMatetialsAct, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.typeOperMatetialsOrder, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.typeOperCountersAct, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENActPostingKindFilter filter) {
		String out = buildCondition((ENActPostingKind)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENActPostingKind filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENActPostingKind.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.numberGen, ENActPostingKind.numberGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name, ENActPostingKind.name_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateTemplate, ENActPostingKind.dateTemplate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.account_expense, ENActPostingKind.account_expense_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.kau_expense, ENActPostingKind.kau_expense_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.account_closing, ENActPostingKind.account_closing_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.kau_closing, ENActPostingKind.kau_closing_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.typeOperMatetialsAct, ENActPostingKind.typeOperMatetialsAct_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.typeOperMatetialsOrder, ENActPostingKind.typeOperMatetialsOrder_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.typeOperCountersAct, ENActPostingKind.typeOperCountersAct_QFielld, out);
		}
		return out;
	}

	public ENActPostingKindShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENActPostingKindShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENActPostingKindShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENActPostingKindShortList getFilteredList(ENActPostingKind filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENActPostingKindShortList getScrollableFilteredList(ENActPostingKind aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENActPostingKindShortList getScrollableFilteredList(ENActPostingKind aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENActPostingKindShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENActPostingKindShortList getScrollableFilteredList(ENActPostingKindFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENActPostingKindShortList getScrollableFilteredList(ENActPostingKindFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENActPostingKindShortList getScrollableFilteredList(ENActPostingKind aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENActPostingKindShortList result = new ENActPostingKindShortList();
		ENActPostingKindShort anObject;
		result.list = new Vector<ENActPostingKindShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENACTPOSTINGKIND.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENACTPOSTINGKIND.CODE"+
			",ENACTPOSTINGKIND.NUMBERGEN"+
			",ENACTPOSTINGKIND.NAME"+
			",ENACTPOSTINGKIND.DATETEMPLATE"+
			",ENACTPOSTINGKIND.ACCOUNT_EXPENSE"+
			",ENACTPOSTINGKIND.KAU_EXPENSE"+
			",ENACTPOSTINGKIND.ACCOUNT_CLOSING"+
			",ENACTPOSTINGKIND.KAU_CLOSING"+
			",ENACTPOSTINGKIND.TYPEOPERMATETIALSACT"+
			",ENACTPOSTINGKIND.TYPEOPERMATETIALSORDER"+
			",ENACTPOSTINGKIND.TYPEOPERCOUNTERSACT"+
		" FROM ENACTPOSTINGKIND " +
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
				anObject = new ENActPostingKindShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.numberGen = set.getString(2);
				anObject.name = set.getString(3);
				anObject.dateTemplate = set.getTimestamp(4);
				anObject.account_expense = set.getString(5);
				anObject.kau_expense = set.getString(6);
				anObject.account_closing = set.getString(7);
				anObject.kau_closing = set.getString(8);
				anObject.typeOperMatetialsAct = set.getString(9);
				anObject.typeOperMatetialsOrder = set.getString(10);
				anObject.typeOperCountersAct = set.getString(11);


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
	
	public int[] getFilteredCodeArray(ENActPostingKindFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENActPostingKindFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENActPostingKind aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENACTPOSTINGKIND.CODE FROM ENACTPOSTINGKIND";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENACTPOSTINGKIND.CODE";
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


	public ENActPostingKind getObject(int uid) throws PersistenceException {
		ENActPostingKind result = new ENActPostingKind();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENActPostingKind anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENACTPOSTINGKIND.CODE, ENACTPOSTINGKIND.NUMBERGEN, ENACTPOSTINGKIND.NAME, ENACTPOSTINGKIND.DATETEMPLATE, ENACTPOSTINGKIND.ACCOUNT_EXPENSE, ENACTPOSTINGKIND.KAU_EXPENSE, ENACTPOSTINGKIND.ACCOUNT_CLOSING, ENACTPOSTINGKIND.KAU_CLOSING, ENACTPOSTINGKIND.TYPEOPERMATETIALSACT, ENACTPOSTINGKIND.TYPEOPERMATETIALSORDER, ENACTPOSTINGKIND.TYPEOPERCOUNTERSACT "
			+" FROM ENACTPOSTINGKIND WHERE ENACTPOSTINGKIND.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.numberGen = set.getString(2);
				anObject.name = set.getString(3);
				anObject.dateTemplate = set.getTimestamp(4);
				anObject.account_expense = set.getString(5);
				anObject.kau_expense = set.getString(6);
				anObject.account_closing = set.getString(7);
				anObject.kau_closing = set.getString(8);
				anObject.typeOperMatetialsAct = set.getString(9);
				anObject.typeOperMatetialsOrder = set.getString(10);
				anObject.typeOperCountersAct = set.getString(11);
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


	public com.ksoe.energynet.valueobject.references.ENActPostingKindRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENActPostingKindRef ref = new com.ksoe.energynet.valueobject.references.ENActPostingKindRef();
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

		selectStr = "DELETE FROM  ENACTPOSTINGKIND WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENActPostingKind object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENActPostingKind.getObject%} access denied");
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
	
	public long count(ENActPostingKindFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENActPostingKindFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENActPostingKindFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENACTPOSTINGKIND", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENACTPOSTINGKIND WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, ENActPostingKindFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENActPostingKindFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENACTPOSTINGKIND");
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
			"SELECT  ENACTPOSTINGKIND.CODE FROM  ENACTPOSTINGKIND WHERE  ENACTPOSTINGKIND.CODE = ?";
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
		_checkConditionToken(condition,"code","ENACTPOSTINGKIND.CODE");
		_checkConditionToken(condition,"numbergen","ENACTPOSTINGKIND.NUMBERGEN");
		_checkConditionToken(condition,"name","ENACTPOSTINGKIND.NAME");
		_checkConditionToken(condition,"datetemplate","ENACTPOSTINGKIND.DATETEMPLATE");
		_checkConditionToken(condition,"account_expense","ENACTPOSTINGKIND.ACCOUNT_EXPENSE");
		_checkConditionToken(condition,"kau_expense","ENACTPOSTINGKIND.KAU_EXPENSE");
		_checkConditionToken(condition,"account_closing","ENACTPOSTINGKIND.ACCOUNT_CLOSING");
		_checkConditionToken(condition,"kau_closing","ENACTPOSTINGKIND.KAU_CLOSING");
		_checkConditionToken(condition,"typeopermatetialsact","ENACTPOSTINGKIND.TYPEOPERMATETIALSACT");
		_checkConditionToken(condition,"typeopermatetialsorder","ENACTPOSTINGKIND.TYPEOPERMATETIALSORDER");
		_checkConditionToken(condition,"typeopercountersact","ENACTPOSTINGKIND.TYPEOPERCOUNTERSACT");
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
	
	private void _collectAutoIncrementFields(ENActPostingKind anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENACTPOSTINGKIND", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENACTPOSTINGKIND", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENACTPOSTINGKIND", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENACTPOSTINGKIND");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENActPostingKindDAO
