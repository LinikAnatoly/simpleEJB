
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
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
import com.ksoe.energynet.valueobject.ENDocAttachment;
import com.ksoe.energynet.valueobject.brief.ENDocAttachmentShort;
import com.ksoe.energynet.valueobject.filter.ENDocAttachmentFilter;
import com.ksoe.energynet.valueobject.lists.ENDocAttachmentShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;


/**
 * DAO Object for ENDocAttachment;
 *
 */

public class ENDocAttachmentDAOGen extends GenericDataMiner {

	public ENDocAttachmentDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENDocAttachmentDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENDocAttachment inObject) throws PersistenceException {
		ENDocAttachment obj = new ENDocAttachment();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.commentGen == null && obj.commentGen == null){}
		else
			if(inObject.commentGen == null || obj.commentGen == null) return false;
			else
				if ( ! inObject.commentGen.equals(obj.commentGen)){
					return false;
				}

		if(inObject.fileLink == null && obj.fileLink == null){}
		else
			if(inObject.fileLink == null || obj.fileLink == null) return false;
			else
				if ( ! inObject.fileLink.equals(obj.fileLink)){
					return false;
				}

		if (inObject.filesize != obj.filesize){
					return false;
				}

		if (inObject.signingStatus != obj.signingStatus){
					return false;
				}

		if(inObject.userAdd == null && obj.userAdd == null){}
		else
			if(inObject.userAdd == null || obj.userAdd == null) return false;
			else
				if ( ! inObject.userAdd.equals(obj.userAdd)){
					return false;
				}

		if(inObject.dateAdd == null && obj.dateAdd == null){} else
			if(inObject.dateAdd == null || obj.dateAdd == null) return false;
			else
				if (inObject.dateAdd.compareTo(obj.dateAdd) != 0){
					return false;
				}

		if(inObject.userGen == null && obj.userGen == null){}
		else
			if(inObject.userGen == null || obj.userGen == null) return false;
			else
				if ( ! inObject.userGen.equals(obj.userGen)){
					return false;
				}

		if(inObject.dateEdit == null && obj.dateEdit == null){} else
			if(inObject.dateEdit == null || obj.dateEdit == null) return false;
			else
				if (inObject.dateEdit.compareTo(obj.dateEdit) != 0){
					return false;
				}
		if (inObject.status.code != obj.status.code){
			return false;
		}
		if (inObject.parentRef.code != obj.parentRef.code){
			return false;
		}
		if (inObject.serverRef.code != obj.serverRef.code){
			return false;
		}
		if (inObject.typeRef.code != obj.typeRef.code){
			return false;
		}
		return true;
	}

	public int add(ENDocAttachment anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENDocAttachment anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENDOCATTACHMENT (CODE,COMMENTGEN,FILELINK,FILESIZE,SIGNINGSTATUS,USERADD,DATEADD,USERGEN,DATEEDIT,MODIFY_TIME,STATUSCODE,PARENTREFCODE,SERVERREFCODE,TYPEREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.commentGen);
			statement.setString(3, anObject.fileLink);
			if (anObject.filesize == Long.MIN_VALUE) {
				statement.setBigDecimal(4, null);
			} else {
				statement.setBigDecimal(4, new java.math.BigDecimal(anObject.filesize));
			}
			if (anObject.signingStatus != Integer.MIN_VALUE ) {
				statement.setInt(5, anObject.signingStatus);
			} else {
				statement.setNull(5, java.sql.Types.INTEGER);
			}
			statement.setString(6, anObject.userAdd);
			if (anObject.dateAdd == null) {
				statement.setTimestamp(7, null);
			} else {
				statement.setTimestamp(7, new java.sql.Timestamp(anObject.dateAdd.getTime()));
			}
			statement.setString(8, anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(9, null);
			} else {
				statement.setTimestamp(9, new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(10, null);
			} else {
				statement.setBigDecimal(10, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.status.code != Integer.MIN_VALUE){
				statement.setInt(11,anObject.status.code);
			} else {
				statement.setNull(11,java.sql.Types.INTEGER);
			}
			if (anObject.parentRef.code != Integer.MIN_VALUE){
				statement.setInt(12,anObject.parentRef.code);
			} else {
				statement.setNull(12,java.sql.Types.INTEGER);
			}
			if (anObject.serverRef.code != Integer.MIN_VALUE){
				statement.setInt(13,anObject.serverRef.code);
			} else {
				statement.setNull(13,java.sql.Types.INTEGER);
			}
			if (anObject.typeRef.code != Integer.MIN_VALUE){
				statement.setInt(14,anObject.typeRef.code);
			} else {
				statement.setNull(14,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENDocAttachmentDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENDocAttachment anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENDocAttachment anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENDocAttachment oldObject = new ENDocAttachment();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENDocAttachment.modify_time_Field+" FROM  ENDOCATTACHMENT WHERE CODE = ?";
			ResultSet set = null;
			try {
				statement = connection.prepareStatement(oldObjectSelectStr);
				statement.setInt(1,oldObject.code);
				set = statement.executeQuery();
				if(!set.next()) {
					throw new PersistenceException("Can't get old object.");
				}
				oldObject.modify_time = set.getLong(1);
				if(set.wasNull()) {
					oldObject.modify_time = Long.MIN_VALUE;
				}
			} catch(SQLException e) {
				System.out.println(e.getMessage()+"\nstatement - "+oldObjectSelectStr);
				throw new SystemException(e.getMessage(), e);
			} finally {
				try {if (set != null) set.close();} catch (SQLException e) {}
				try {if (statement != null) statement.close();} catch (SQLException e) {}
				statement = null;
			}
			if(oldObject.modify_time != anObject.modify_time) {
				throw new PersistenceException("Can't update object (optimistic locking).");
			}
			anObject.modify_time = System.currentTimeMillis();

			String selectStr;

			Vector<String> fields = null;
			if(anAttributes != null) {
				String fieldNameStr;
				fields = new Vector<>();
				for(int attrIndex = 0;attrIndex < anAttributes.length;attrIndex++) {
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COMMENTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FILELINK") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FILESIZE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SIGNINGSTATUS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USERADD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEADD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USERGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEEDIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("STATUS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PARENTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SERVERREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENDOCATTACHMENT SET  COMMENTGEN = ? , FILELINK = ? , FILESIZE = ? , SIGNINGSTATUS = ? , USERADD = ? , DATEADD = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , STATUSCODE = ? , PARENTREFCODE = ? , SERVERREFCODE = ? , TYPEREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENDOCATTACHMENT SET ";
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
					statement.setString(1, anObject.commentGen);
					statement.setString(2, anObject.fileLink);
					if (anObject.filesize == Long.MIN_VALUE) {
						statement.setBigDecimal(3, null);
					} else {
						statement.setBigDecimal(3, new java.math.BigDecimal(anObject.filesize));
					}
					if (anObject.signingStatus != Integer.MIN_VALUE) {
						statement.setInt(4, anObject.signingStatus);
					} else {
						statement.setNull(4, java.sql.Types.INTEGER);
					}
					statement.setString(5, anObject.userAdd);
					if (anObject.dateAdd == null) {
						statement.setTimestamp(6, null);
					} else {
						statement.setTimestamp(6, new java.sql.Timestamp(anObject.dateAdd.getTime()));
					}
					statement.setString(7, anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(8, null);
					} else {
						statement.setTimestamp(8, new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(9, null);
					} else {
						statement.setBigDecimal(9, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.status.code != Integer.MIN_VALUE) {
						statement.setInt(10, anObject.status.code);
					} else {
						statement.setNull(10, java.sql.Types.INTEGER);
					}
					if (anObject.parentRef.code != Integer.MIN_VALUE) {
						statement.setInt(11, anObject.parentRef.code);
					} else {
						statement.setNull(11, java.sql.Types.INTEGER);
					}
					if (anObject.serverRef.code != Integer.MIN_VALUE) {
						statement.setInt(12, anObject.serverRef.code);
					} else {
						statement.setNull(12, java.sql.Types.INTEGER);
					}
					if (anObject.typeRef.code != Integer.MIN_VALUE) {
						statement.setInt(13, anObject.typeRef.code);
					} else {
						statement.setNull(13, java.sql.Types.INTEGER);
					}
					statement.setInt(14, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("COMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.commentGen);
							continue;
						}
						if("FILELINK".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.fileLink);
							continue;
						}
						if("FILESIZE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.filesize == Long.MIN_VALUE) {
								statement.setBigDecimal(i+1, null);
							} else {
								statement.setBigDecimal(i+1, new java.math.BigDecimal(anObject.filesize));
							}
							continue;
						}
						if("SIGNINGSTATUS".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.signingStatus);
							continue;
						}
						if("USERADD".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.userAdd);
							continue;
						}
						if("DATEADD".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateAdd == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1, new java.sql.Timestamp(anObject.dateAdd.getTime()));
							}
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.userGen);
							continue;
						}
						if("DATEEDIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateEdit == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1, new java.sql.Timestamp(anObject.dateEdit.getTime()));
							}
							continue;
						}
						if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0) {
							if (anObject.modify_time == Long.MIN_VALUE) {
								statement.setBigDecimal(i+1, null);
							} else {
								statement.setBigDecimal(i+1, new java.math.BigDecimal(anObject.modify_time));
							}
							continue;
						}
						if("STATUS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.status.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.status.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("PARENTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.parentRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.parentRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("SERVERREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.serverRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.serverRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("TYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.typeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.typeRef.code);
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

	} // end of save(ENDocAttachment anObject,String[] anAttributes)


	public ENDocAttachmentShort getShortObject(int anObjectCode) throws PersistenceException {
		ENDocAttachment filterObject = new ENDocAttachment();
		Vector<ENDocAttachmentShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENDocAttachmentShort)list.get(0);
		}
		return null;
	}

	public int setParameters(ENDocAttachment filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.fileLink, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.filesize, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.signingStatus, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userAdd, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateAdd, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.status.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.parentRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.serverRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.typeRef.code, index, statement);
			index--;
		}
		return index;
	}

	public String buildCondition(ENDocAttachmentFilter filter) {
		String out = buildCondition((ENDocAttachment)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENDocAttachment filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENDocAttachment.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentGen, ENDocAttachment.commentGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.fileLink, ENDocAttachment.fileLink_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.filesize, ENDocAttachment.filesize_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.signingStatus, ENDocAttachment.signingStatus_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userAdd, ENDocAttachment.userAdd_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateAdd, ENDocAttachment.dateAdd_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENDocAttachment.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENDocAttachment.dateEdit_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENDocAttachment.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.status.code, ENDocAttachment.status_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.parentRef.code, ENDocAttachment.parentRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.serverRef.code, ENDocAttachment.serverRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.typeRef.code, ENDocAttachment.typeRef_QFielld, out);
		}
		return out;
	}

	public ENDocAttachmentShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENDocAttachmentShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENDocAttachmentShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENDocAttachmentShortList getFilteredList(ENDocAttachment filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENDocAttachmentShortList getScrollableFilteredList(ENDocAttachment aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENDocAttachmentShortList getScrollableFilteredList(ENDocAttachment aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENDocAttachmentShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENDocAttachmentShortList getScrollableFilteredList(ENDocAttachmentFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}

	public ENDocAttachmentShortList getScrollableFilteredList(ENDocAttachmentFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}

	public ENDocAttachmentShortList getScrollableFilteredList(ENDocAttachment aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENDocAttachmentShortList result = new ENDocAttachmentShortList();
		ENDocAttachmentShort anObject;
		result.list = new Vector<>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENDOCATTACHMENT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENDOCATTACHMENT.CODE"+
			",ENDOCATTACHMENT.COMMENTGEN"+
			",ENDOCATTACHMENT.FILELINK"+
			",ENDOCATTACHMENT.FILESIZE"+
			",ENDOCATTACHMENT.SIGNINGSTATUS"+
			",ENDOCATTACHMENT.USERADD"+
			",ENDOCATTACHMENT.DATEADD"+
			",ENDOCATTACHMENT.USERGEN"+
			",ENDOCATTACHMENT.DATEEDIT"+
			", ENDOCATTACHMENTSTATUS.CODE " +
			", ENDOCATTACHMENTSTATUS.NAME " +
			", ENDOCATTACHMENT.CODE " +
			", ENDOCATTACHMENT.COMMENTGEN " +
			", ENDOCATTACHMENT.FILELINK " +
			", ENDOCATTACHMENT.FILESIZE " +
			", ENDOCATTACHMENT.SIGNINGSTATUS " +
			", ENDOCATTACHMENT.USERADD " +
			", ENDOCATTACHMENT.DATEADD " +
			", ENDOCATTACHMENT.USERGEN " +
			", ENDOCATTACHMENT.DATEEDIT " +
			", ENDOCATTACHMENTSERVER.CODE " +
			", ENDOCATTACHMENTSERVER.NAME " +
			", ENDOCATTACHMENTSERVER.SERVERIP " +
			", ENDOCATTACHMENTSERVER.USERNAME " +
			", ENDOCATTACHMENTSERVER.USERPASS " +
			", ENDOCATTACHMENTTYPE.CODE " +
			", ENDOCATTACHMENTTYPE.NAME " +
		" FROM ENDOCATTACHMENT " +
			" LEFT JOIN ENDOCATTACHMENTSTATUS on ENDOCATTACHMENTSTATUS.CODE = ENDOCATTACHMENT.STATUSCODE "+
			" LEFT JOIN ENDOCATTACHMENT on ENDOCATTACHMENT.CODE = ENDOCATTACHMENT.PARENTREFCODE "+
			" LEFT JOIN ENDOCATTACHMENTSERVER on ENDOCATTACHMENTSERVER.CODE = ENDOCATTACHMENT.SERVERREFCODE "+
			" LEFT JOIN ENDOCATTACHMENTTYPE on ENDOCATTACHMENTTYPE.CODE = ENDOCATTACHMENT.TYPEREFCODE "+
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
				anObject = new ENDocAttachmentShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.commentGen = set.getString(2);
				anObject.fileLink = set.getString(3);
				anObject.filesize = set.getLong(4);
				if(set.wasNull()) {
					anObject.filesize = Long.MIN_VALUE;
				}
				anObject.signingStatus = set.getInt(5);
				if ( set.wasNull() ) {
					anObject.signingStatus = Integer.MIN_VALUE;
				}
				anObject.userAdd = set.getString(6);
				anObject.dateAdd = set.getTimestamp(7);
				anObject.userGen = set.getString(8);
				anObject.dateEdit = set.getTimestamp(9);

				anObject.statusCode = set.getInt(10);
				if(set.wasNull()) {
					anObject.statusCode = Integer.MIN_VALUE;
				}
				anObject.statusName = set.getString(11);
				anObject.parentRefCode = set.getInt(12);
				if(set.wasNull()) {
					anObject.parentRefCode = Integer.MIN_VALUE;
				}
				anObject.parentRefCommentGen = set.getString(13);
				anObject.parentRefFileLink = set.getString(14);
				anObject.parentRefFilesize = set.getLong(15);
				if(set.wasNull()) {
					anObject.parentRefFilesize = Long.MIN_VALUE;
				}
				anObject.parentRefSigningStatus = set.getInt(16);
				if(set.wasNull()) {
					anObject.parentRefSigningStatus = Integer.MIN_VALUE;
				}
				anObject.parentRefUserAdd = set.getString(17);
				anObject.parentRefDateAdd = set.getTimestamp(18);
				anObject.parentRefUserGen = set.getString(19);
				anObject.parentRefDateEdit = set.getTimestamp(20);
				anObject.serverRefCode = set.getInt(21);
				if(set.wasNull()) {
					anObject.serverRefCode = Integer.MIN_VALUE;
				}
				anObject.serverRefName = set.getString(22);
				anObject.serverRefServerIp = set.getString(23);
				anObject.serverRefUserName = set.getString(24);
				anObject.serverRefUserPass = set.getString(25);
				anObject.typeRefCode = set.getInt(26);
				if(set.wasNull()) {
					anObject.typeRefCode = Integer.MIN_VALUE;
				}
				anObject.typeRefName = set.getString(27);

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

	public int[] getFilteredCodeArray(ENDocAttachmentFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENDocAttachmentFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENDocAttachment aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENDOCATTACHMENT.CODE FROM ENDOCATTACHMENT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENDOCATTACHMENT.CODE";
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


	public ENDocAttachment getObject(int uid) throws PersistenceException {
		ENDocAttachment result = new ENDocAttachment();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENDocAttachment anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENDOCATTACHMENT.CODE, ENDOCATTACHMENT.COMMENTGEN, ENDOCATTACHMENT.FILELINK, ENDOCATTACHMENT.FILESIZE, ENDOCATTACHMENT.SIGNINGSTATUS, ENDOCATTACHMENT.USERADD, ENDOCATTACHMENT.DATEADD, ENDOCATTACHMENT.USERGEN, ENDOCATTACHMENT.DATEEDIT, ENDOCATTACHMENT.MODIFY_TIME, ENDOCATTACHMENT.STATUSCODE, ENDOCATTACHMENT.PARENTREFCODE, ENDOCATTACHMENT.SERVERREFCODE, ENDOCATTACHMENT.TYPEREFCODE "
			+" FROM ENDOCATTACHMENT WHERE ENDOCATTACHMENT.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);

				anObject.commentGen = set.getString(2);
				anObject.fileLink = set.getString(3);
				anObject.filesize = set.getLong(4);
				if(set.wasNull()) {
					anObject.filesize = Long.MIN_VALUE;
				}
				anObject.signingStatus = set.getInt(5);
				if (set.wasNull()) {
					anObject.signingStatus = Integer.MIN_VALUE;
				}
				anObject.userAdd = set.getString(6);
				anObject.dateAdd = set.getTimestamp(7);
				anObject.userGen = set.getString(8);
				anObject.dateEdit = set.getTimestamp(9);
				anObject.modify_time = set.getLong(10);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.status.code = set.getInt(11);
				if (set.wasNull()) {
					anObject.status.code = Integer.MIN_VALUE;
				}
				anObject.parentRef.code = set.getInt(12);
				if (set.wasNull()) {
					anObject.parentRef.code = Integer.MIN_VALUE;
				}
				anObject.serverRef.code = set.getInt(13);
				if (set.wasNull()) {
					anObject.serverRef.code = Integer.MIN_VALUE;
				}
				anObject.typeRef.code = set.getInt(14);
				if (set.wasNull()) {
					anObject.typeRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENDocAttachmentRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENDocAttachmentRef ref = new com.ksoe.energynet.valueobject.references.ENDocAttachmentRef();
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

		selectStr = "DELETE FROM  ENDOCATTACHMENT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENDocAttachment object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENDocAttachment.getObject%} access denied");
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

	public long count(ENDocAttachmentFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENDocAttachmentFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}

	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENDocAttachmentFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENDOCATTACHMENT", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENDOCATTACHMENT WHERE code = ?", propertyName);
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

	public <E> List<E> getListOfPropertyValues(String propertyName, ENDocAttachmentFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENDocAttachmentFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENDOCATTACHMENT");
		String whereStr = "";
		PreparedStatement statement = null;
		ResultSet set = null;

		ArrayList<E> out = new ArrayList<>();

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
			"SELECT  ENDOCATTACHMENT.CODE FROM  ENDOCATTACHMENT WHERE  ENDOCATTACHMENT.CODE = ?";
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
		_checkConditionToken(condition,"code","ENDOCATTACHMENT.CODE");
		_checkConditionToken(condition,"commentgen","ENDOCATTACHMENT.COMMENTGEN");
		_checkConditionToken(condition,"filelink","ENDOCATTACHMENT.FILELINK");
		_checkConditionToken(condition,"filesize","ENDOCATTACHMENT.FILESIZE");
		_checkConditionToken(condition,"signingstatus","ENDOCATTACHMENT.SIGNINGSTATUS");
		_checkConditionToken(condition,"useradd","ENDOCATTACHMENT.USERADD");
		_checkConditionToken(condition,"dateadd","ENDOCATTACHMENT.DATEADD");
		_checkConditionToken(condition,"usergen","ENDOCATTACHMENT.USERGEN");
		_checkConditionToken(condition,"dateedit","ENDOCATTACHMENT.DATEEDIT");
		_checkConditionToken(condition,"modify_time","ENDOCATTACHMENT.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"status","STATUSCODE");
		_checkConditionToken(condition,"status.code","STATUSCODE");
		_checkConditionToken(condition,"parentref","PARENTREFCODE");
		_checkConditionToken(condition,"parentref.code","PARENTREFCODE");
		_checkConditionToken(condition,"serverref","SERVERREFCODE");
		_checkConditionToken(condition,"serverref.code","SERVERREFCODE");
		_checkConditionToken(condition,"typeref","TYPEREFCODE");
		_checkConditionToken(condition,"typeref.code","TYPEREFCODE");
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
	protected static Hashtable<SequenceKey, SequenceValue> _sequenceTable = new Hashtable<>();

	private void _collectAutoIncrementFields(ENDocAttachment anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENDOCATTACHMENT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENDOCATTACHMENT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENDOCATTACHMENT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENDOCATTACHMENT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENDocAttachmentDAO
