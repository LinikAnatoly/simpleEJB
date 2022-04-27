
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
import com.ksoe.energynet.valueobject.ENSheets4SOItems;
import com.ksoe.energynet.valueobject.filter.ENSheets4SOItemsFilter;
import com.ksoe.energynet.valueobject.brief.ENSheets4SOItemsShort;
import com.ksoe.energynet.valueobject.lists.ENSheets4SOItemsShortList;


/**
 * DAO Object for ENSheets4SOItems;
 *
 */

public class ENSheets4SOItemsDAOGen extends GenericDataMiner {

	public ENSheets4SOItemsDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENSheets4SOItemsDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENSheets4SOItems inObject) throws PersistenceException {
		ENSheets4SOItems obj = new ENSheets4SOItems();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.contentValue == null && obj.contentValue == null){}
		else
			if(inObject.contentValue == null || obj.contentValue == null) return false;
			else
				if ( ! inObject.contentValue.equals(obj.contentValue)){
					return false;
				}

		if(inObject.additionalContent == null && obj.additionalContent == null){}
		else
			if(inObject.additionalContent == null || obj.additionalContent == null) return false;
			else
				if ( ! inObject.additionalContent.equals(obj.additionalContent)){
					return false;
				}
		if (inObject.sheet4soRef.code != obj.sheet4soRef.code){
			return false;
		}
		if (inObject.sheetItemTemplateRef.code != obj.sheetItemTemplateRef.code){
			return false;
		}
		return true;
	}

	public int add(ENSheets4SOItems anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENSheets4SOItems anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENSHEETS4SOITEMS (CODE,CONTENTVALUE,ADDITIONALCONTENT,SHEET4SOREFCODE,SHEETITEMTEMPLATEREFCD) VALUES (?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.contentValue);
			statement.setString(3, anObject.additionalContent);
			if (anObject.sheet4soRef.code != Integer.MIN_VALUE){
				statement.setInt(4,anObject.sheet4soRef.code);
			} else {
				statement.setNull(4,java.sql.Types.INTEGER);
			}
			if (anObject.sheetItemTemplateRef.code != Integer.MIN_VALUE){
				statement.setInt(5,anObject.sheetItemTemplateRef.code);
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
			throw new PersistenceException("Error in method {%ENSheets4SOItemsDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENSheets4SOItems anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENSheets4SOItems anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("CONTENTVALUE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ADDITIONALCONTENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SHEET4SOREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SHEETITEMTEMPLATEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENSHEETS4SOITEMS SET  CONTENTVALUE = ? , ADDITIONALCONTENT = ? , SHEET4SOREFCODE = ? , SHEETITEMTEMPLATEREFCD = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENSHEETS4SOITEMS SET ";
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
					statement.setString(1, anObject.contentValue);
					statement.setString(2, anObject.additionalContent);
					if (anObject.sheet4soRef.code != Integer.MIN_VALUE) {
						statement.setInt(3, anObject.sheet4soRef.code);
					} else {
						statement.setNull(3, java.sql.Types.INTEGER);
					}
					if (anObject.sheetItemTemplateRef.code != Integer.MIN_VALUE) {
						statement.setInt(4, anObject.sheetItemTemplateRef.code);
					} else {
						statement.setNull(4, java.sql.Types.INTEGER);
					}
					statement.setInt(5, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("CONTENTVALUE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.contentValue);
							continue;
						}
						if("ADDITIONALCONTENT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.additionalContent);
							continue;
						}
						if("SHEET4SOREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sheet4soRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.sheet4soRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("SHEETITEMTEMPLATEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sheetItemTemplateRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.sheetItemTemplateRef.code);
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

	} // end of save(ENSheets4SOItems anObject,String[] anAttributes)


	public ENSheets4SOItemsShort getShortObject(int anObjectCode) throws PersistenceException {
		ENSheets4SOItems filterObject = new ENSheets4SOItems();
		Vector<ENSheets4SOItemsShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENSheets4SOItemsShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENSheets4SOItems filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.contentValue, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.additionalContent, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.sheet4soRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.sheetItemTemplateRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENSheets4SOItemsFilter filter) {
		String out = buildCondition((ENSheets4SOItems)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENSheets4SOItems filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENSheets4SOItems.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.contentValue, ENSheets4SOItems.contentValue_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.additionalContent, ENSheets4SOItems.additionalContent_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.sheet4soRef.code, ENSheets4SOItems.sheet4soRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.sheetItemTemplateRef.code, ENSheets4SOItems.sheetItemTemplateRef_QFielld, out);
		}
		return out;
	}

	public ENSheets4SOItemsShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENSheets4SOItemsShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENSheets4SOItemsShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENSheets4SOItemsShortList getFilteredList(ENSheets4SOItems filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENSheets4SOItemsShortList getScrollableFilteredList(ENSheets4SOItems aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENSheets4SOItemsShortList getScrollableFilteredList(ENSheets4SOItems aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENSheets4SOItemsShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENSheets4SOItemsShortList getScrollableFilteredList(ENSheets4SOItemsFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENSheets4SOItemsShortList getScrollableFilteredList(ENSheets4SOItemsFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENSheets4SOItemsShortList getScrollableFilteredList(ENSheets4SOItems aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENSheets4SOItemsShortList result = new ENSheets4SOItemsShortList();
		ENSheets4SOItemsShort anObject;
		result.list = new Vector<ENSheets4SOItemsShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSHEETS4SOITEMS.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSHEETS4SOITEMS.CODE"+
			",ENSHEETS4SOITEMS.CONTENTVALUE"+
			",ENSHEETS4SOITEMS.ADDITIONALCONTENT"+
			", ENSHEETS4SO.CODE " +
			", ENSHEETS4SO.NUMBERGEN " +
			", ENSHEETS4SO.NAME " +
			", ENSHEETS4SO.DATEGEN " +
			", ENSHEETS4SO.DAYSCNT " +
			", ENSHEETS4SO.NEXTSHEETDATE " +
			", ENSHEETS4SO.ISLAST " +
			", ENSHEETS4SO.RECIPIENT " +
			", ENSHEETS4SO.RECIPIENTADDRESS " +
			", ENSHEETS4SO.SIGNERPOSITION " +
			", ENSHEETS4SO.SIGNERFIO " +
			", ENSHEETS4SO.EXECUTORFIO " +
			", ENSHEETS4SO.EXECUTORPHONE " +
			", ENSHEETS4SO.EXECUTOREMAIL " +
			", ENSHEETS4SO.ADDITIONALTEXT " +
			", ENSHEETS4SO.ISWITHSIGNATURE " +
			", ENSHEETS4SO.COMMENTGEN " +
			", ENSHEETS4SO.DFDOCCODE " +
			", ENSHEETS4SO.DFDOCTYPECODE " +
			", ENSHEETS4SO.DFDOCNUMBER " +
			", ENSHEETS4SO.DFDOCDATE " +
			", ENSHEETS4SO.USERGEN " +
			", ENSHEETS4SO.DATEEDIT " +
			", ENSHEETS4SO.WFPACKCODE " +
			", ENSHEETS4SOITEMSTEMPLT.CODE " +
			", ENSHEETS4SOITEMSTEMPLT.NAME " +
			", ENSHEETS4SOITEMSTEMPLT.TEMPLATEVALUE " +
		" FROM ENSHEETS4SOITEMS " +
			" LEFT JOIN ENSHEETS4SO on ENSHEETS4SO.CODE = ENSHEETS4SOITEMS.SHEET4SOREFCODE "+
			" LEFT JOIN ENSHEETS4SOITEMSTEMPLT on ENSHEETS4SOITEMSTEMPLT.CODE = ENSHEETS4SOITEMS.SHEETITEMTEMPLATEREFCD "+
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
				anObject = new ENSheets4SOItemsShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.contentValue = set.getString(2);
				anObject.additionalContent = set.getString(3);

				anObject.sheet4soRefCode = set.getInt(4);
				if(set.wasNull()) {
					anObject.sheet4soRefCode = Integer.MIN_VALUE;
				}
				anObject.sheet4soRefNumbergen = set.getString(5);
				anObject.sheet4soRefName = set.getString(6);
				anObject.sheet4soRefDateGen = set.getDate(7);
				anObject.sheet4soRefDayscnt = set.getInt(8);
				if(set.wasNull()) {
					anObject.sheet4soRefDayscnt = Integer.MIN_VALUE;
				}
				anObject.sheet4soRefNextSheetDate = set.getDate(9);
				anObject.sheet4soRefIsLast = set.getInt(10);
				if(set.wasNull()) {
					anObject.sheet4soRefIsLast = Integer.MIN_VALUE;
				}
				anObject.sheet4soRefRecipient = set.getString(11);
				anObject.sheet4soRefRecipientAddress = set.getString(12);
				anObject.sheet4soRefSignerPosition = set.getString(13);
				anObject.sheet4soRefSignerFio = set.getString(14);
				anObject.sheet4soRefExecutorFio = set.getString(15);
				anObject.sheet4soRefExecutorPhone = set.getString(16);
				anObject.sheet4soRefExecutorEmail = set.getString(17);
				anObject.sheet4soRefAdditionalText = set.getString(18);
				anObject.sheet4soRefIsWithSignature = set.getInt(19);
				if(set.wasNull()) {
					anObject.sheet4soRefIsWithSignature = Integer.MIN_VALUE;
				}
				anObject.sheet4soRefCommentgen = set.getString(20);
				anObject.sheet4soRefDfDocCode = set.getInt(21);
				if(set.wasNull()) {
					anObject.sheet4soRefDfDocCode = Integer.MIN_VALUE;
				}
				anObject.sheet4soRefDfDocTypeCode = set.getInt(22);
				if(set.wasNull()) {
					anObject.sheet4soRefDfDocTypeCode = Integer.MIN_VALUE;
				}
				anObject.sheet4soRefDfDocNumber = set.getString(23);
				anObject.sheet4soRefDfDocDate = set.getDate(24);
				anObject.sheet4soRefUserGen = set.getString(25);
				anObject.sheet4soRefDateEdit = set.getDate(26);
				anObject.sheet4soRefWfPackCode = set.getInt(27);
				if(set.wasNull()) {
					anObject.sheet4soRefWfPackCode = Integer.MIN_VALUE;
				}
				anObject.sheetItemTemplateRefCode = set.getInt(28);
				if(set.wasNull()) {
					anObject.sheetItemTemplateRefCode = Integer.MIN_VALUE;
				}
				anObject.sheetItemTemplateRefName = set.getString(29);
				anObject.sheetItemTemplateRefTemplateValue = set.getString(30);

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
	
	public int[] getFilteredCodeArray(ENSheets4SOItemsFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENSheets4SOItemsFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENSheets4SOItems aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENSHEETS4SOITEMS.CODE FROM ENSHEETS4SOITEMS";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSHEETS4SOITEMS.CODE";
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


	public ENSheets4SOItems getObject(int uid) throws PersistenceException {
		ENSheets4SOItems result = new ENSheets4SOItems();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENSheets4SOItems anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENSHEETS4SOITEMS.CODE, ENSHEETS4SOITEMS.CONTENTVALUE, ENSHEETS4SOITEMS.ADDITIONALCONTENT, ENSHEETS4SOITEMS.SHEET4SOREFCODE, ENSHEETS4SOITEMS.SHEETITEMTEMPLATEREFCD "
			+" FROM ENSHEETS4SOITEMS WHERE ENSHEETS4SOITEMS.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.contentValue = set.getString(2);
				anObject.additionalContent = set.getString(3);
				anObject.sheet4soRef.code = set.getInt(4);
				if (set.wasNull()) {
					anObject.sheet4soRef.code = Integer.MIN_VALUE;
				}
				anObject.sheetItemTemplateRef.code = set.getInt(5);
				if (set.wasNull()) {
					anObject.sheetItemTemplateRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENSheets4SOItemsRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENSheets4SOItemsRef ref = new com.ksoe.energynet.valueobject.references.ENSheets4SOItemsRef();
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

		selectStr = "DELETE FROM  ENSHEETS4SOITEMS WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENSheets4SOItems object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENSheets4SOItems.getObject%} access denied");
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
	
	public long count(ENSheets4SOItemsFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENSheets4SOItemsFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENSheets4SOItemsFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENSHEETS4SOITEMS", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENSHEETS4SOITEMS WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, ENSheets4SOItemsFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENSheets4SOItemsFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENSHEETS4SOITEMS");
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
			"SELECT  ENSHEETS4SOITEMS.CODE FROM  ENSHEETS4SOITEMS WHERE  ENSHEETS4SOITEMS.CODE = ?";
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
		_checkConditionToken(condition,"code","ENSHEETS4SOITEMS.CODE");
		_checkConditionToken(condition,"contentvalue","ENSHEETS4SOITEMS.CONTENTVALUE");
		_checkConditionToken(condition,"additionalcontent","ENSHEETS4SOITEMS.ADDITIONALCONTENT");
		// relationship conditions
		_checkConditionToken(condition,"sheet4soref","SHEET4SOREFCODE");
		_checkConditionToken(condition,"sheet4soref.code","SHEET4SOREFCODE");
		_checkConditionToken(condition,"sheetitemtemplateref","SHEETITEMTEMPLATEREFCD");
		_checkConditionToken(condition,"sheetitemtemplateref.code","SHEETITEMTEMPLATEREFCD");
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
	
	private void _collectAutoIncrementFields(ENSheets4SOItems anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENSHEETS4SOITEMS", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENSHEETS4SOITEMS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENSHEETS4SOITEMS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENSHEETS4SOITEMS");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENSheets4SOItemsDAO
