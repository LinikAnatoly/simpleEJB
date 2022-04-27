
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
import com.ksoe.energynet.valueobject.ENDocAttachment2TKTechCard;
import com.ksoe.energynet.valueobject.filter.ENDocAttachment2TKTechCardFilter;
import com.ksoe.energynet.valueobject.brief.ENDocAttachment2TKTechCardShort;
import com.ksoe.energynet.valueobject.lists.ENDocAttachment2TKTechCardShortList;


/**
 * DAO Object for ENDocAttachment2TKTechCard;
 *
 */

public class ENDocAttachment2TKTechCardDAOGen extends GenericDataMiner {

	public ENDocAttachment2TKTechCardDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENDocAttachment2TKTechCardDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENDocAttachment2TKTechCard inObject) throws PersistenceException {
		ENDocAttachment2TKTechCard obj = new ENDocAttachment2TKTechCard();
		obj.code = inObject.code;
		loadObject(obj);
		if (inObject.docAttachmentRef.code != obj.docAttachmentRef.code){
			return false;
		}
		if (inObject.techCardRef.code != obj.techCardRef.code){
			return false;
		}
		return true;
	}

	public int add(ENDocAttachment2TKTechCard anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENDocAttachment2TKTechCard anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENDOCATTCHMNT2TKTCHCRD (CODE,DOCATTACHMENTREFCODE,TECHCARDREFCODE) VALUES (?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			if (anObject.docAttachmentRef.code != Integer.MIN_VALUE){
				statement.setInt(2,anObject.docAttachmentRef.code);
			} else {
				statement.setNull(2,java.sql.Types.INTEGER);
			}
			if (anObject.techCardRef.code != Integer.MIN_VALUE){
				statement.setInt(3,anObject.techCardRef.code);
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
			throw new PersistenceException("Error in method {%ENDocAttachment2TKTechCardDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENDocAttachment2TKTechCard anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENDocAttachment2TKTechCard anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("DOCATTACHMENTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TECHCARDREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENDOCATTCHMNT2TKTCHCRD SET DOCATTACHMENTREFCODE = ? , TECHCARDREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENDOCATTACHMENT2TKTECHCARD SET ";
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
					if (anObject.docAttachmentRef.code != Integer.MIN_VALUE) {
						statement.setInt(1, anObject.docAttachmentRef.code);
					} else {
						statement.setNull(1, java.sql.Types.INTEGER);
					}
					if (anObject.techCardRef.code != Integer.MIN_VALUE) {
						statement.setInt(2, anObject.techCardRef.code);
					} else {
						statement.setNull(2, java.sql.Types.INTEGER);
					}
					statement.setInt(3, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("DOCATTACHMENTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.docAttachmentRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.docAttachmentRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("TECHCARDREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.techCardRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.techCardRef.code);
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

	} // end of save(ENDocAttachment2TKTechCard anObject,String[] anAttributes)


	public ENDocAttachment2TKTechCardShort getShortObject(int anObjectCode) throws PersistenceException {
		ENDocAttachment2TKTechCard filterObject = new ENDocAttachment2TKTechCard();
		Vector<ENDocAttachment2TKTechCardShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENDocAttachment2TKTechCardShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENDocAttachment2TKTechCard filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.docAttachmentRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.techCardRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENDocAttachment2TKTechCardFilter filter) {
		String out = buildCondition((ENDocAttachment2TKTechCard)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENDocAttachment2TKTechCard filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENDocAttachment2TKTechCard.code_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.docAttachmentRef.code, ENDocAttachment2TKTechCard.docAttachmentRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.techCardRef.code, ENDocAttachment2TKTechCard.techCardRef_QFielld, out);
		}
		return out;
	}

	public ENDocAttachment2TKTechCardShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENDocAttachment2TKTechCardShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENDocAttachment2TKTechCardShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENDocAttachment2TKTechCardShortList getFilteredList(ENDocAttachment2TKTechCard filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENDocAttachment2TKTechCardShortList getScrollableFilteredList(ENDocAttachment2TKTechCard aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENDocAttachment2TKTechCardShortList getScrollableFilteredList(ENDocAttachment2TKTechCard aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENDocAttachment2TKTechCardShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENDocAttachment2TKTechCardShortList getScrollableFilteredList(ENDocAttachment2TKTechCardFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENDocAttachment2TKTechCardShortList getScrollableFilteredList(ENDocAttachment2TKTechCardFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENDocAttachment2TKTechCardShortList getScrollableFilteredList(ENDocAttachment2TKTechCard aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENDocAttachment2TKTechCardShortList result = new ENDocAttachment2TKTechCardShortList();
		ENDocAttachment2TKTechCardShort anObject;
		result.list = new Vector<ENDocAttachment2TKTechCardShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENDOCATTCHMNT2TKTCHCRD.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENDOCATTCHMNT2TKTCHCRD.CODE"+
			", ENDOCATTACHMENT.CODE " +
			", ENDOCATTACHMENT.COMMENTGEN " +
			", ENDOCATTACHMENT.FILELINK " +
			", ENDOCATTACHMENT.FILESIZE " +
			", ENDOCATTACHMENT.USERADD " +
			", ENDOCATTACHMENT.DATEADD " +
			", ENDOCATTACHMENT.USERGEN " +
			", ENDOCATTACHMENT.DATEEDIT " +
			", TKTECHCARD.CODE " +
			", TKTECHCARD.TECHKARTNUMBER " +
			", TKTECHCARD.NAME " +
			", TKTECHCARD.SAFETY " +
			", TKTECHCARD.DATECREATION " +
			", TKTECHCARD.DATEFROM " +
			", TKTECHCARD.DATETO " +
			", TKTECHCARD.WORKCONDITIONS " +
		" FROM ENDOCATTCHMNT2TKTCHCRD " +
			" LEFT JOIN ENDOCATTACHMENT on ENDOCATTACHMENT.CODE = ENDOCATTCHMNT2TKTCHCRD.DOCATTACHMENTREFCODE "+
			" LEFT JOIN TKTECHCARD on TKTECHCARD.CODE = ENDOCATTCHMNT2TKTCHCRD.TECHCARDREFCODE "+
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
				anObject = new ENDocAttachment2TKTechCardShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}

				anObject.docAttachmentRefCode = set.getInt(2);
				if(set.wasNull()) {
					anObject.docAttachmentRefCode = Integer.MIN_VALUE;
				}
				anObject.docAttachmentRefCommentGen = set.getString(3);
				anObject.docAttachmentRefFileLink = set.getString(4);
				anObject.docAttachmentRefFilesize = set.getLong(5);
				if(set.wasNull()) {
					anObject.docAttachmentRefFilesize = Long.MIN_VALUE;
				}
				anObject.docAttachmentRefUserAdd = set.getString(6);
				anObject.docAttachmentRefDateAdd = set.getTimestamp(7);
				anObject.docAttachmentRefUserGen = set.getString(8);
				anObject.docAttachmentRefDateEdit = set.getTimestamp(9);
				anObject.techCardRefCode = set.getInt(10);
				if(set.wasNull()) {
					anObject.techCardRefCode = Integer.MIN_VALUE;
				}
				anObject.techCardRefTechKartNumber = set.getString(11);
				anObject.techCardRefName = set.getString(12);
				anObject.techCardRefSafety = set.getString(13);
				anObject.techCardRefDateCreation = set.getDate(14);
				anObject.techCardRefDateFrom = set.getDate(15);
				anObject.techCardRefDateTo = set.getDate(16);
				anObject.techCardRefWorkconditions = set.getString(17);

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
	
	public int[] getFilteredCodeArray(ENDocAttachment2TKTechCardFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENDocAttachment2TKTechCardFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENDocAttachment2TKTechCard aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENDOCATTCHMNT2TKTCHCRD.CODE FROM ENDOCATTCHMNT2TKTCHCRD";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENDOCATTCHMNT2TKTCHCRD.CODE";
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


	public ENDocAttachment2TKTechCard getObject(int uid) throws PersistenceException {
		ENDocAttachment2TKTechCard result = new ENDocAttachment2TKTechCard();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENDocAttachment2TKTechCard anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENDOCATTCHMNT2TKTCHCRD.CODE, ENDOCATTCHMNT2TKTCHCRD.DOCATTACHMENTREFCODE, ENDOCATTCHMNT2TKTCHCRD.TECHCARDREFCODE "
			+" FROM ENDOCATTCHMNT2TKTCHCRD WHERE ENDOCATTCHMNT2TKTCHCRD.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.docAttachmentRef.code = set.getInt(2);
				if (set.wasNull()) {
					anObject.docAttachmentRef.code = Integer.MIN_VALUE;
				}
				anObject.techCardRef.code = set.getInt(3);
				if (set.wasNull()) {
					anObject.techCardRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENDocAttachment2TKTechCardRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENDocAttachment2TKTechCardRef ref = new com.ksoe.energynet.valueobject.references.ENDocAttachment2TKTechCardRef();
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

		selectStr = "DELETE FROM  ENDOCATTCHMNT2TKTCHCRD WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENDocAttachment2TKTechCard object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENDocAttachment2TKTechCard.getObject%} access denied");
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
	
	public long count(ENDocAttachment2TKTechCardFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENDocAttachment2TKTechCardFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENDocAttachment2TKTechCardFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENDOCATTCHMNT2TKTCHCRD", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENDOCATTCHMNT2TKTCHCRD WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, ENDocAttachment2TKTechCardFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENDocAttachment2TKTechCardFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENDOCATTCHMNT2TKTCHCRD");
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
			"SELECT  ENDOCATTCHMNT2TKTCHCRD.CODE FROM  ENDOCATTCHMNT2TKTCHCRD WHERE  ENDOCATTCHMNT2TKTCHCRD.CODE = ?";
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
		_checkConditionToken(condition,"code","ENDOCATTCHMNT2TKTCHCRD.CODE");
		// relationship conditions
		_checkConditionToken(condition,"docattachmentref","DOCATTACHMENTREFCODE");
		_checkConditionToken(condition,"docattachmentref.code","DOCATTACHMENTREFCODE");
		_checkConditionToken(condition,"techcardref","TECHCARDREFCODE");
		_checkConditionToken(condition,"techcardref.code","TECHCARDREFCODE");
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
	
	private void _collectAutoIncrementFields(ENDocAttachment2TKTechCard anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENDOCATTCHMNT2TKTCHCRD", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENDOCATTCHMNT2TKTCHCRD", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENDOCATTCHMNT2TKTCHCRD", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENDOCATTCHMNT2TKTCHCRD");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENDocAttachment2TKTechCardDAO
