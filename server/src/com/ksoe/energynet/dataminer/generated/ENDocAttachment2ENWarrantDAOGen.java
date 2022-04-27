
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
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
import com.ksoe.energynet.valueobject.ENDocAttachment2ENWarrant;
import com.ksoe.energynet.valueobject.filter.ENDocAttachment2ENWarrantFilter;
import com.ksoe.energynet.valueobject.brief.ENDocAttachment2ENWarrantShort;
import com.ksoe.energynet.valueobject.lists.ENDocAttachment2ENWarrantShortList;


/**
 * DAO Object for ENDocAttachment2ENWarrant;
 *
 */

public class ENDocAttachment2ENWarrantDAOGen extends GenericDataMiner {

	public ENDocAttachment2ENWarrantDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENDocAttachment2ENWarrantDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENDocAttachment2ENWarrant inObject) throws PersistenceException {
		ENDocAttachment2ENWarrant obj = new ENDocAttachment2ENWarrant();
		obj.code = inObject.code;
		loadObject(obj);
		if (inObject.docAttachmentRef.code != obj.docAttachmentRef.code){
			return false;
		}
		if (inObject.warrantRef.code != obj.warrantRef.code){
			return false;
		}
		return true;
	}

	public int add(ENDocAttachment2ENWarrant anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENDocAttachment2ENWarrant anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENDOCATTACHMENT2NWRRNT (CODE,DOCATTACHMENTREFCODE,WARRANTREFCODE) VALUES (?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.docAttachmentRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENDocAttachmentDAOGen(connection,getUserProfile()).exists(anObject.docAttachmentRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENDocAttachment2ENWarrant.docAttachmentRef.code%} = {%"+anObject.docAttachmentRef.code+"%}");
				}
				statement.setInt(2,anObject.docAttachmentRef.code);
			} else {
				statement.setNull(2,java.sql.Types.INTEGER);
			}
			if (anObject.warrantRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENWarrantDAOGen(connection,getUserProfile()).exists(anObject.warrantRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENDocAttachment2ENWarrant.warrantRef.code%} = {%"+anObject.warrantRef.code+"%}");
				}
				statement.setInt(3,anObject.warrantRef.code);
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
			throw new PersistenceException("Error in method {%ENDocAttachment2ENWarrantDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENDocAttachment2ENWarrant anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENDocAttachment2ENWarrant anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("WARRANTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENDOCATTACHMENT2NWRRNT SET DOCATTACHMENTREFCODE = ? , WARRANTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENDOCATTACHMENT2ENWARRANT SET ";
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
						statement.setInt(1,anObject.docAttachmentRef.code);
					} else {
						statement.setNull(1,java.sql.Types.INTEGER);
					}
					if (anObject.warrantRef.code != Integer.MIN_VALUE) {
						statement.setInt(2,anObject.warrantRef.code);
					} else {
						statement.setNull(2,java.sql.Types.INTEGER);
					}
					statement.setInt(3,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("DOCATTACHMENTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.docAttachmentRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.docAttachmentRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("WARRANTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.warrantRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.warrantRef.code);
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

	} // end of save(ENDocAttachment2ENWarrant anObject,String[] anAttributes)


	public ENDocAttachment2ENWarrantShort getShortObject(int anObjectCode) throws PersistenceException {
		ENDocAttachment2ENWarrant filterObject = new ENDocAttachment2ENWarrant();
		Vector<ENDocAttachment2ENWarrantShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENDocAttachment2ENWarrantShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENDocAttachment2ENWarrant filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.docAttachmentRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.warrantRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENDocAttachment2ENWarrantFilter filter) {
		String out = buildCondition((ENDocAttachment2ENWarrant)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENDocAttachment2ENWarrant filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENDocAttachment2ENWarrant.code_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.docAttachmentRef.code, ENDocAttachment2ENWarrant.docAttachmentRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.warrantRef.code, ENDocAttachment2ENWarrant.warrantRef_QFielld, out);
		}
		return out;
	}

	public ENDocAttachment2ENWarrantShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENDocAttachment2ENWarrantShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENDocAttachment2ENWarrantShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENDocAttachment2ENWarrantShortList getFilteredList(ENDocAttachment2ENWarrant filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENDocAttachment2ENWarrantShortList getScrollableFilteredList(ENDocAttachment2ENWarrant aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENDocAttachment2ENWarrantShortList getScrollableFilteredList(ENDocAttachment2ENWarrant aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENDocAttachment2ENWarrantShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENDocAttachment2ENWarrantShortList getScrollableFilteredList(ENDocAttachment2ENWarrantFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENDocAttachment2ENWarrantShortList getScrollableFilteredList(ENDocAttachment2ENWarrantFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENDocAttachment2ENWarrantShortList getScrollableFilteredList(ENDocAttachment2ENWarrant aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENDocAttachment2ENWarrantShortList result = new ENDocAttachment2ENWarrantShortList();
		ENDocAttachment2ENWarrantShort anObject;
		result.list = new Vector<ENDocAttachment2ENWarrantShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENDOCATTACHMENT2NWRRNT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENDOCATTACHMENT2NWRRNT.CODE"+
			", ENDOCATTACHMENT.CODE " +
			", ENDOCATTACHMENT.COMMENTGEN " +
			", ENDOCATTACHMENT.FILELINK " +
			", ENDOCATTACHMENT.USERADD " +
			", ENDOCATTACHMENT.DATEADD " +
			", ENDOCATTACHMENT.USERGEN " +
			", ENDOCATTACHMENT.DATEEDIT " +
			", ENWARRANT.CODE " +
			", ENWARRANT.NUMBERGEN " +
			", ENWARRANT.NAME " +
			", ENWARRANT.WARRANTFIO " +
			", ENWARRANT.WARRANTSHORTFIO " +
			", ENWARRANT.WARRANTPOSITION " +
			", ENWARRANT.GENITIVEFIO " +
			", ENWARRANT.GENITIVEPOSITION " +
			", ENWARRANT.PASSPORT " +
			", ENWARRANT.ADDRESS " +
			", ENWARRANT.POWER " +
			", ENWARRANT.MAXSUM " +
		" FROM ENDOCATTACHMENT2NWRRNT " +
			", ENDOCATTACHMENT " +
			", ENWARRANT " +
		"";
		whereStr = " ENDOCATTACHMENT.CODE = ENDOCATTACHMENT2NWRRNT.DOCATTACHMENTREFCODE" ; //+
		whereStr += " AND ENWARRANT.CODE = ENDOCATTACHMENT2NWRRNT.WARRANTREFCODE" ; //+

	
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
				anObject = new ENDocAttachment2ENWarrantShort();
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
				anObject.warrantRefCode = set.getInt(9);
				if(set.wasNull()) {
					anObject.warrantRefCode = Integer.MIN_VALUE;
				}
				anObject.warrantRefNumbergen = set.getString(10);
				anObject.warrantRefName = set.getString(11);
				anObject.warrantRefWarrantFIO = set.getString(12);
				anObject.warrantRefWarrantShortFIO = set.getString(13);
				anObject.warrantRefWarrantPosition = set.getString(14);
				anObject.warrantRefGenitiveFIO = set.getString(15);
				anObject.warrantRefGenitivePosition = set.getString(16);
				anObject.warrantRefPassport = set.getString(17);
				anObject.warrantRefAddress = set.getString(18);
				anObject.warrantRefPower = set.getInt(19);
				if(set.wasNull()) {
					anObject.warrantRefPower = Integer.MIN_VALUE;
				}
				anObject.warrantRefMaxSum = set.getBigDecimal(20);
				if(anObject.warrantRefMaxSum != null) {
					anObject.warrantRefMaxSum = anObject.warrantRefMaxSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
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
	
	public int[] getFilteredCodeArray(ENDocAttachment2ENWarrantFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENDocAttachment2ENWarrantFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENDocAttachment2ENWarrant aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENDOCATTACHMENT2NWRRNT.CODE FROM ENDOCATTACHMENT2NWRRNT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENDOCATTACHMENT2NWRRNT.CODE";
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

	public ENDocAttachment2ENWarrant getObject(int uid) throws PersistenceException {
		ENDocAttachment2ENWarrant result = new ENDocAttachment2ENWarrant();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENDocAttachment2ENWarrant anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENDOCATTACHMENT2NWRRNT.CODE, ENDOCATTACHMENT2NWRRNT.DOCATTACHMENTREFCODE, ENDOCATTACHMENT2NWRRNT.WARRANTREFCODE "
			+" FROM ENDOCATTACHMENT2NWRRNT WHERE ENDOCATTACHMENT2NWRRNT.CODE = ?";

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
				anObject.warrantRef.code = set.getInt(3);
				if (set.wasNull()) {
					anObject.warrantRef.code = Integer.MIN_VALUE;
				}
				if(anObject.docAttachmentRef.code != Integer.MIN_VALUE) {
					anObject.setDocAttachmentRef(
						new com.ksoe.energynet.dataminer.generated.ENDocAttachmentDAOGen(connection,getUserProfile()).getRef(anObject.docAttachmentRef.code));
				}
				if(anObject.warrantRef.code != Integer.MIN_VALUE) {
					anObject.setWarrantRef(
						new com.ksoe.energynet.dataminer.generated.ENWarrantDAOGen(connection,getUserProfile()).getRef(anObject.warrantRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENDocAttachment2ENWarrantRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENDocAttachment2ENWarrantRef ref = new com.ksoe.energynet.valueobject.references.ENDocAttachment2ENWarrantRef();
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

		selectStr = "DELETE FROM  ENDOCATTACHMENT2NWRRNT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENDocAttachment2ENWarrant object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENDocAttachment2ENWarrant.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENDocAttachment2ENWarrant.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENDocAttachment2ENWarrant.remove%} access denied");
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
	
	public long count(ENDocAttachment2ENWarrantFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENDocAttachment2ENWarrantFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENDocAttachment2ENWarrantFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENDOCATTACHMENT2NWRRNT", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENDocAttachment2ENWarrantFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENDOCATTACHMENT2NWRRNT");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENDocAttachment2ENWarrant.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENDocAttachment2ENWarrant.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENDOCATTACHMENT2NWRRNT.CODE FROM  ENDOCATTACHMENT2NWRRNT WHERE  ENDOCATTACHMENT2NWRRNT.CODE = ?";
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
		_checkConditionToken(condition,"code","ENDOCATTACHMENT2NWRRNT.CODE");
		// relationship conditions
		_checkConditionToken(condition,"docattachmentref","DOCATTACHMENTREFCODE");
		_checkConditionToken(condition,"docattachmentref.code","DOCATTACHMENTREFCODE");
		_checkConditionToken(condition,"warrantref","WARRANTREFCODE");
		_checkConditionToken(condition,"warrantref.code","WARRANTREFCODE");
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
	
	private void _collectAutoIncrementFields(ENDocAttachment2ENWarrant anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENDOCATTACHMENT2NWRRNT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENDOCATTACHMENT2NWRRNT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENDOCATTACHMENT2NWRRNT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENDOCATTACHMENT2NWRRNT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENDocAttachment2ENWarrantDAO
