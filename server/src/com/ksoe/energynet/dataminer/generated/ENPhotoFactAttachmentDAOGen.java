
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer.generated;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Hashtable;
import java.util.List;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.valueobject.ENPhotoFactAttachment;
import com.ksoe.energynet.valueobject.brief.ENPhotoFactAttachmentShort;
import com.ksoe.energynet.valueobject.filter.ENPhotoFactAttachmentFilter;
import com.ksoe.energynet.valueobject.lists.ENPhotoFactAttachmentShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENPhotoFactAttachment;
 *
 */

public class ENPhotoFactAttachmentDAOGen extends GenericDataMiner {

	public ENPhotoFactAttachmentDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENPhotoFactAttachmentDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENPhotoFactAttachment inObject) throws PersistenceException {
		ENPhotoFactAttachment obj = new ENPhotoFactAttachment();
		obj.code = inObject.code;
		loadObject(obj);
		if (inObject.docAttachmentRef.code != obj.docAttachmentRef.code){
			return false;
		}
		if (inObject.photoFactRef.code != obj.photoFactRef.code){
			return false;
		}
		return true;
	}

	public int add(ENPhotoFactAttachment anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENPhotoFactAttachment anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENPHOTOFACTATTACHMENT (CODE,DOCATTACHMENTREFCODE,PHOTOFACTREFCODE) VALUES (?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			if (anObject.docAttachmentRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENDocAttachmentDAOGen(connection,getUserProfile()).exists(anObject.docAttachmentRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPhotoFactAttachment.docAttachmentRef.code%} = {%"+anObject.docAttachmentRef.code+"%}");
				}
				statement.setInt(2,anObject.docAttachmentRef.code);
			} else {
				statement.setNull(2,java.sql.Types.INTEGER);
			}
			if (anObject.photoFactRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENPhotoFactDAOGen(connection,getUserProfile()).exists(anObject.photoFactRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPhotoFactAttachment.photoFactRef.code%} = {%"+anObject.photoFactRef.code+"%}");
				}
				statement.setInt(3,anObject.photoFactRef.code);
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
			throw new PersistenceException("Error in method {%ENPhotoFactAttachmentDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENPhotoFactAttachment anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENPhotoFactAttachment anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("PHOTOFACTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENPHOTOFACTATTACHMENT SET DOCATTACHMENTREFCODE = ? , PHOTOFACTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENPHOTOFACTATTACHMENT SET ";
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
					if (anObject.docAttachmentRef.code != Integer.MIN_VALUE) {
						statement.setInt(1, anObject.docAttachmentRef.code);
					} else {
						statement.setNull(1, java.sql.Types.INTEGER);
					}
					if (anObject.photoFactRef.code != Integer.MIN_VALUE) {
						statement.setInt(2, anObject.photoFactRef.code);
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
						if("PHOTOFACTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.photoFactRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.photoFactRef.code);
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

	} // end of save(ENPhotoFactAttachment anObject,String[] anAttributes)


	public ENPhotoFactAttachmentShort getShortObject(int anObjectCode) throws PersistenceException {
		ENPhotoFactAttachment filterObject = new ENPhotoFactAttachment();
		Vector<ENPhotoFactAttachmentShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENPhotoFactAttachmentShort)list.get(0);
		}
		return null;
	}

	public int setParameters(ENPhotoFactAttachment filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.docAttachmentRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.photoFactRef.code, index, statement);
			index--;
		}
		return index;
	}

	public String buildCondition(ENPhotoFactAttachmentFilter filter) {
		String out = buildCondition((ENPhotoFactAttachment)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENPhotoFactAttachment filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENPhotoFactAttachment.code_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.docAttachmentRef.code, ENPhotoFactAttachment.docAttachmentRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.photoFactRef.code, ENPhotoFactAttachment.photoFactRef_QFielld, out);
		}
		return out;
	}

	public ENPhotoFactAttachmentShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENPhotoFactAttachmentShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENPhotoFactAttachmentShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENPhotoFactAttachmentShortList getFilteredList(ENPhotoFactAttachment filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENPhotoFactAttachmentShortList getScrollableFilteredList(ENPhotoFactAttachment aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENPhotoFactAttachmentShortList getScrollableFilteredList(ENPhotoFactAttachment aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENPhotoFactAttachmentShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENPhotoFactAttachmentShortList getScrollableFilteredList(ENPhotoFactAttachmentFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}

	public ENPhotoFactAttachmentShortList getScrollableFilteredList(ENPhotoFactAttachmentFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}

	public ENPhotoFactAttachmentShortList getScrollableFilteredList(ENPhotoFactAttachment aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENPhotoFactAttachmentShortList result = new ENPhotoFactAttachmentShortList();
		ENPhotoFactAttachmentShort anObject;
		result.list = new Vector<ENPhotoFactAttachmentShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENPHOTOFACTATTACHMENT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENPHOTOFACTATTACHMENT.CODE"+
			", ENDOCATTACHMENT.CODE " +
			", ENDOCATTACHMENT.COMMENTGEN " +
			", ENDOCATTACHMENT.FILELINK " +
			", ENDOCATTACHMENT.USERADD " +
			", ENDOCATTACHMENT.DATEADD " +
			", ENDOCATTACHMENT.USERGEN " +
			", ENDOCATTACHMENT.DATEEDIT " +
			", ENPHOTOFACT.CODE " +
			", ENPHOTOFACT.DESCRIPTION " +
			", ENPHOTOFACT.DATEFACT " +
			", ENPHOTOFACT.ACTNUMBER " +
			", ENPHOTOFACT.PERSONALACCOUNT " +
			", ENPHOTOFACT.PERSONALACCOUNTUID " +
			", ENPHOTOFACT.CUSTOMERFIO " +
			", ENPHOTOFACT.DATEADD " +
			", ENPHOTOFACT.DATEEDIT " +
			", ENPHOTOFACT.USERGEN " +
		" FROM ENPHOTOFACTATTACHMENT " +
			", ENDOCATTACHMENT " +
			", ENPHOTOFACT " +
		"";
		whereStr = " ENDOCATTACHMENT.CODE = ENPHOTOFACTATTACHMENT.DOCATTACHMENTREFCODE" ; //+
		whereStr += " AND ENPHOTOFACT.CODE = ENPHOTOFACTATTACHMENT.PHOTOFACTREFCODE" ; //+


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
				anObject = new ENPhotoFactAttachmentShort();
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
				anObject.docAttachmentRefUserAdd = set.getString(5);
				anObject.docAttachmentRefDateAdd = set.getTimestamp(6);
				anObject.docAttachmentRefUserGen = set.getString(7);
				anObject.docAttachmentRefDateEdit = set.getTimestamp(8);
				anObject.photoFactRefCode = set.getInt(9);
				if(set.wasNull()) {
					anObject.photoFactRefCode = Integer.MIN_VALUE;
				}
				anObject.photoFactRefDescription = set.getString(10);
				anObject.photoFactRefDateFact = set.getTimestamp(11);
				anObject.photoFactRefActNumber = set.getString(12);
				anObject.photoFactRefPersonalAccount = set.getString(13);
				anObject.photoFactRefPersonalAccountUid = set.getString(14);
				anObject.photoFactRefCustomerFIO = set.getString(15);
				anObject.photoFactRefDateAdd = set.getTimestamp(16);
				anObject.photoFactRefDateEdit = set.getTimestamp(17);
				anObject.photoFactRefUserGen = set.getString(18);

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

	public int[] getFilteredCodeArray(ENPhotoFactAttachmentFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENPhotoFactAttachmentFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENPhotoFactAttachment aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENPHOTOFACTATTACHMENT.CODE FROM ENPHOTOFACTATTACHMENT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENPHOTOFACTATTACHMENT.CODE";
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


	public ENPhotoFactAttachment getObject(int uid) throws PersistenceException {
		ENPhotoFactAttachment result = new ENPhotoFactAttachment();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENPhotoFactAttachment anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENPHOTOFACTATTACHMENT.CODE, ENPHOTOFACTATTACHMENT.DOCATTACHMENTREFCODE, ENPHOTOFACTATTACHMENT.PHOTOFACTREFCODE "
			+" FROM ENPHOTOFACTATTACHMENT WHERE ENPHOTOFACTATTACHMENT.CODE = ?";


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
				anObject.photoFactRef.code = set.getInt(3);
				if (set.wasNull()) {
					anObject.photoFactRef.code = Integer.MIN_VALUE;
				}
				if(anObject.docAttachmentRef.code != Integer.MIN_VALUE) {
					anObject.setDocAttachmentRef(
						new com.ksoe.energynet.dataminer.generated.ENDocAttachmentDAOGen(connection,getUserProfile()).getRef(anObject.docAttachmentRef.code));
				}
				if(anObject.photoFactRef.code != Integer.MIN_VALUE) {
					anObject.setPhotoFactRef(
						new com.ksoe.energynet.dataminer.generated.ENPhotoFactDAOGen(connection,getUserProfile()).getRef(anObject.photoFactRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENPhotoFactAttachmentRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENPhotoFactAttachmentRef ref = new com.ksoe.energynet.valueobject.references.ENPhotoFactAttachmentRef();
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

		selectStr = "DELETE FROM  ENPHOTOFACTATTACHMENT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENPhotoFactAttachment object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENPhotoFactAttachment.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENPhotoFactAttachment.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENPhotoFactAttachment.remove%} access denied");
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

	public long count(ENPhotoFactAttachmentFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENPhotoFactAttachmentFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}

	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENPhotoFactAttachmentFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENPHOTOFACTATTACHMENT", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENPhotoFactAttachmentFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENPHOTOFACTATTACHMENT");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPhotoFactAttachment.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENPhotoFactAttachment.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENPHOTOFACTATTACHMENT.CODE FROM  ENPHOTOFACTATTACHMENT WHERE  ENPHOTOFACTATTACHMENT.CODE = ?";
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
		_checkConditionToken(condition,"code","ENPHOTOFACTATTACHMENT.CODE");
		// relationship conditions
		_checkConditionToken(condition,"docattachmentref","DOCATTACHMENTREFCODE");
		_checkConditionToken(condition,"docattachmentref.code","DOCATTACHMENTREFCODE");
		_checkConditionToken(condition,"photofactref","PHOTOFACTREFCODE");
		_checkConditionToken(condition,"photofactref.code","PHOTOFACTREFCODE");
		return condition.toString();
	}

	@Override
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

	private void _collectAutoIncrementFields(ENPhotoFactAttachment anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENPHOTOFACTATTACHMENT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENPHOTOFACTATTACHMENT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENPHOTOFACTATTACHMENT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENPHOTOFACTATTACHMENT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENPhotoFactAttachmentDAO
