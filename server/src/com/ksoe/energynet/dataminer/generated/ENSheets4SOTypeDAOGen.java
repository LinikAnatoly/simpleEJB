
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
import com.ksoe.energynet.valueobject.ENSheets4SOType;
import com.ksoe.energynet.valueobject.filter.ENSheets4SOTypeFilter;
import com.ksoe.energynet.valueobject.brief.ENSheets4SOTypeShort;
import com.ksoe.energynet.valueobject.lists.ENSheets4SOTypeShortList;


/**
 * DAO Object for ENSheets4SOType;
 *
 */

public class ENSheets4SOTypeDAOGen extends GenericDataMiner {

	public ENSheets4SOTypeDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENSheets4SOTypeDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENSheets4SOType inObject) throws PersistenceException {
		ENSheets4SOType obj = new ENSheets4SOType();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.name == null && obj.name == null){}
		else
			if(inObject.name == null || obj.name == null) return false;
			else
				if ( ! inObject.name.equals(obj.name)){
					return false;
				}

		if(inObject.nameForDfDoc == null && obj.nameForDfDoc == null){}
		else
			if(inObject.nameForDfDoc == null || obj.nameForDfDoc == null) return false;
			else
				if ( ! inObject.nameForDfDoc.equals(obj.nameForDfDoc)){
					return false;
				}

		if(inObject.dfDocNumMask == null && obj.dfDocNumMask == null){}
		else
			if(inObject.dfDocNumMask == null || obj.dfDocNumMask == null) return false;
			else
				if ( ! inObject.dfDocNumMask.equals(obj.dfDocNumMask)){
					return false;
				}

		if (inObject.dfDepartmentCode != obj.dfDepartmentCode){
					return false;
				}

		if(inObject.executorFio == null && obj.executorFio == null){}
		else
			if(inObject.executorFio == null || obj.executorFio == null) return false;
			else
				if ( ! inObject.executorFio.equals(obj.executorFio)){
					return false;
				}

		if(inObject.executorPhone == null && obj.executorPhone == null){}
		else
			if(inObject.executorPhone == null || obj.executorPhone == null) return false;
			else
				if ( ! inObject.executorPhone.equals(obj.executorPhone)){
					return false;
				}

		if(inObject.executorEmail == null && obj.executorEmail == null){}
		else
			if(inObject.executorEmail == null || obj.executorEmail == null) return false;
			else
				if ( ! inObject.executorEmail.equals(obj.executorEmail)){
					return false;
				}

		if(inObject.reportPath == null && obj.reportPath == null){}
		else
			if(inObject.reportPath == null || obj.reportPath == null) return false;
			else
				if ( ! inObject.reportPath.equals(obj.reportPath)){
					return false;
				}

		if(inObject.reportFileName == null && obj.reportFileName == null){}
		else
			if(inObject.reportFileName == null || obj.reportFileName == null) return false;
			else
				if ( ! inObject.reportFileName.equals(obj.reportFileName)){
					return false;
				}

		if(inObject.reportType == null && obj.reportType == null){}
		else
			if(inObject.reportType == null || obj.reportType == null) return false;
			else
				if ( ! inObject.reportType.equals(obj.reportType)){
					return false;
				}

		if(inObject.commentGen == null && obj.commentGen == null){}
		else
			if(inObject.commentGen == null || obj.commentGen == null) return false;
			else
				if ( ! inObject.commentGen.equals(obj.commentGen)){
					return false;
				}
		if (inObject.signerRef.code != obj.signerRef.code){
			return false;
		}
		return true;
	}

	public int add(ENSheets4SOType anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENSheets4SOType anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENSHEETS4SOTYPE (CODE,NAME,NAMEFORDFDOC,DFDOCNUMMASK,DFDEPARTMENTCODE,EXECUTORFIO,EXECUTORPHONE,EXECUTOREMAIL,REPORTPATH,REPORTFILENAME,REPORTTYPE,COMMENTGEN,SIGNERREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.name);
			statement.setString(3, anObject.nameForDfDoc);
			statement.setString(4, anObject.dfDocNumMask);
			if (anObject.dfDepartmentCode != Integer.MIN_VALUE ) {
				statement.setInt(5, anObject.dfDepartmentCode);
			} else {
				statement.setNull(5, java.sql.Types.INTEGER);
			}
			statement.setString(6, anObject.executorFio);
			statement.setString(7, anObject.executorPhone);
			statement.setString(8, anObject.executorEmail);
			statement.setString(9, anObject.reportPath);
			statement.setString(10, anObject.reportFileName);
			statement.setString(11, anObject.reportType);
			statement.setString(12, anObject.commentGen);
			if (anObject.signerRef.code != Integer.MIN_VALUE){
				statement.setInt(13,anObject.signerRef.code);
			} else {
				statement.setNull(13,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENSheets4SOTypeDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENSheets4SOType anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENSheets4SOType anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("NAMEFORDFDOC") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DFDOCNUMMASK") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DFDEPARTMENTCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("EXECUTORFIO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("EXECUTORPHONE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("EXECUTOREMAIL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("REPORTPATH") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("REPORTFILENAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("REPORTTYPE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COMMENTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SIGNERREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENSHEETS4SOTYPE SET  NAME = ? , NAMEFORDFDOC = ? , DFDOCNUMMASK = ? , DFDEPARTMENTCODE = ? , EXECUTORFIO = ? , EXECUTORPHONE = ? , EXECUTOREMAIL = ? , REPORTPATH = ? , REPORTFILENAME = ? , REPORTTYPE = ? , COMMENTGEN = ? , SIGNERREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENSHEETS4SOTYPE SET ";
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
					statement.setString(1, anObject.name);
					statement.setString(2, anObject.nameForDfDoc);
					statement.setString(3, anObject.dfDocNumMask);
					if (anObject.dfDepartmentCode != Integer.MIN_VALUE) {
						statement.setInt(4, anObject.dfDepartmentCode);
					} else {
						statement.setNull(4, java.sql.Types.INTEGER);
					}
					statement.setString(5, anObject.executorFio);
					statement.setString(6, anObject.executorPhone);
					statement.setString(7, anObject.executorEmail);
					statement.setString(8, anObject.reportPath);
					statement.setString(9, anObject.reportFileName);
					statement.setString(10, anObject.reportType);
					statement.setString(11, anObject.commentGen);
					if (anObject.signerRef.code != Integer.MIN_VALUE) {
						statement.setInt(12, anObject.signerRef.code);
					} else {
						statement.setNull(12, java.sql.Types.INTEGER);
					}
					statement.setInt(13, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.name);
							continue;
						}
						if("NAMEFORDFDOC".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.nameForDfDoc);
							continue;
						}
						if("DFDOCNUMMASK".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.dfDocNumMask);
							continue;
						}
						if("DFDEPARTMENTCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.dfDepartmentCode);
							continue;
						}
						if("EXECUTORFIO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.executorFio);
							continue;
						}
						if("EXECUTORPHONE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.executorPhone);
							continue;
						}
						if("EXECUTOREMAIL".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.executorEmail);
							continue;
						}
						if("REPORTPATH".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.reportPath);
							continue;
						}
						if("REPORTFILENAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.reportFileName);
							continue;
						}
						if("REPORTTYPE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.reportType);
							continue;
						}
						if("COMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.commentGen);
							continue;
						}
						if("SIGNERREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.signerRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.signerRef.code);
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

	} // end of save(ENSheets4SOType anObject,String[] anAttributes)


	public ENSheets4SOTypeShort getShortObject(int anObjectCode) throws PersistenceException {
		ENSheets4SOType filterObject = new ENSheets4SOType();
		Vector<ENSheets4SOTypeShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENSheets4SOTypeShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENSheets4SOType filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.nameForDfDoc, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.dfDocNumMask, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.dfDepartmentCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.executorFio, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.executorPhone, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.executorEmail, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.reportPath, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.reportFileName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.reportType, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.signerRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENSheets4SOTypeFilter filter) {
		String out = buildCondition((ENSheets4SOType)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENSheets4SOType filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENSheets4SOType.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name, ENSheets4SOType.name_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.nameForDfDoc, ENSheets4SOType.nameForDfDoc_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.dfDocNumMask, ENSheets4SOType.dfDocNumMask_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.dfDepartmentCode, ENSheets4SOType.dfDepartmentCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.executorFio, ENSheets4SOType.executorFio_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.executorPhone, ENSheets4SOType.executorPhone_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.executorEmail, ENSheets4SOType.executorEmail_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.reportPath, ENSheets4SOType.reportPath_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.reportFileName, ENSheets4SOType.reportFileName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.reportType, ENSheets4SOType.reportType_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentGen, ENSheets4SOType.commentGen_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.signerRef.code, ENSheets4SOType.signerRef_QFielld, out);
		}
		return out;
	}

	public ENSheets4SOTypeShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENSheets4SOTypeShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENSheets4SOTypeShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENSheets4SOTypeShortList getFilteredList(ENSheets4SOType filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENSheets4SOTypeShortList getScrollableFilteredList(ENSheets4SOType aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENSheets4SOTypeShortList getScrollableFilteredList(ENSheets4SOType aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENSheets4SOTypeShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENSheets4SOTypeShortList getScrollableFilteredList(ENSheets4SOTypeFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENSheets4SOTypeShortList getScrollableFilteredList(ENSheets4SOTypeFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENSheets4SOTypeShortList getScrollableFilteredList(ENSheets4SOType aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENSheets4SOTypeShortList result = new ENSheets4SOTypeShortList();
		ENSheets4SOTypeShort anObject;
		result.list = new Vector<ENSheets4SOTypeShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSHEETS4SOTYPE.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSHEETS4SOTYPE.CODE"+
			",ENSHEETS4SOTYPE.NAME"+
			",ENSHEETS4SOTYPE.NAMEFORDFDOC"+
			",ENSHEETS4SOTYPE.DFDOCNUMMASK"+
			",ENSHEETS4SOTYPE.DFDEPARTMENTCODE"+
			",ENSHEETS4SOTYPE.EXECUTORFIO"+
			",ENSHEETS4SOTYPE.EXECUTORPHONE"+
			",ENSHEETS4SOTYPE.EXECUTOREMAIL"+
			",ENSHEETS4SOTYPE.REPORTPATH"+
			",ENSHEETS4SOTYPE.REPORTFILENAME"+
			",ENSHEETS4SOTYPE.REPORTTYPE"+
			",ENSHEETS4SOTYPE.COMMENTGEN"+
			", ENSIGNER.CODE " +
			", ENSIGNER.SIGNERPOSITION " +
			", ENSIGNER.SIGNERFIO " +
			", ENSIGNER.SIGNATUREIMAGEPATH " +
			", ENSIGNER.COMMENTGEN " +
		" FROM ENSHEETS4SOTYPE " +
			" LEFT JOIN ENSIGNER on ENSIGNER.CODE = ENSHEETS4SOTYPE.SIGNERREFCODE "+
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
				anObject = new ENSheets4SOTypeShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.name = set.getString(2);
				anObject.nameForDfDoc = set.getString(3);
				anObject.dfDocNumMask = set.getString(4);
				anObject.dfDepartmentCode = set.getInt(5);
				if ( set.wasNull() ) {
					anObject.dfDepartmentCode = Integer.MIN_VALUE;
				}
				anObject.executorFio = set.getString(6);
				anObject.executorPhone = set.getString(7);
				anObject.executorEmail = set.getString(8);
				anObject.reportPath = set.getString(9);
				anObject.reportFileName = set.getString(10);
				anObject.reportType = set.getString(11);
				anObject.commentGen = set.getString(12);

				anObject.signerRefCode = set.getInt(13);
				if(set.wasNull()) {
					anObject.signerRefCode = Integer.MIN_VALUE;
				}
				anObject.signerRefSignerPosition = set.getString(14);
				anObject.signerRefSignerFio = set.getString(15);
				anObject.signerRefSignatureImagePath = set.getString(16);
				anObject.signerRefCommentGen = set.getString(17);

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
	
	public int[] getFilteredCodeArray(ENSheets4SOTypeFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENSheets4SOTypeFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENSheets4SOType aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENSHEETS4SOTYPE.CODE FROM ENSHEETS4SOTYPE";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSHEETS4SOTYPE.CODE";
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


	public ENSheets4SOType getObject(int uid) throws PersistenceException {
		ENSheets4SOType result = new ENSheets4SOType();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENSheets4SOType anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENSHEETS4SOTYPE.CODE, ENSHEETS4SOTYPE.NAME, ENSHEETS4SOTYPE.NAMEFORDFDOC, ENSHEETS4SOTYPE.DFDOCNUMMASK, ENSHEETS4SOTYPE.DFDEPARTMENTCODE, ENSHEETS4SOTYPE.EXECUTORFIO, ENSHEETS4SOTYPE.EXECUTORPHONE, ENSHEETS4SOTYPE.EXECUTOREMAIL, ENSHEETS4SOTYPE.REPORTPATH, ENSHEETS4SOTYPE.REPORTFILENAME, ENSHEETS4SOTYPE.REPORTTYPE, ENSHEETS4SOTYPE.COMMENTGEN, ENSHEETS4SOTYPE.SIGNERREFCODE "
			+" FROM ENSHEETS4SOTYPE WHERE ENSHEETS4SOTYPE.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.name = set.getString(2);
				anObject.nameForDfDoc = set.getString(3);
				anObject.dfDocNumMask = set.getString(4);
				anObject.dfDepartmentCode = set.getInt(5);
				if (set.wasNull()) {
					anObject.dfDepartmentCode = Integer.MIN_VALUE;
				}
				anObject.executorFio = set.getString(6);
				anObject.executorPhone = set.getString(7);
				anObject.executorEmail = set.getString(8);
				anObject.reportPath = set.getString(9);
				anObject.reportFileName = set.getString(10);
				anObject.reportType = set.getString(11);
				anObject.commentGen = set.getString(12);
				anObject.signerRef.code = set.getInt(13);
				if (set.wasNull()) {
					anObject.signerRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENSheets4SOTypeRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENSheets4SOTypeRef ref = new com.ksoe.energynet.valueobject.references.ENSheets4SOTypeRef();
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

		selectStr = "DELETE FROM  ENSHEETS4SOTYPE WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENSheets4SOType object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENSheets4SOType.getObject%} access denied");
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
	
	public long count(ENSheets4SOTypeFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENSheets4SOTypeFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENSheets4SOTypeFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENSHEETS4SOTYPE", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENSHEETS4SOTYPE WHERE code = ?", propertyName);
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

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENSheets4SOTypeFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENSHEETS4SOTYPE");
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
			"SELECT  ENSHEETS4SOTYPE.CODE FROM  ENSHEETS4SOTYPE WHERE  ENSHEETS4SOTYPE.CODE = ?";
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
		_checkConditionToken(condition,"code","ENSHEETS4SOTYPE.CODE");
		_checkConditionToken(condition,"name","ENSHEETS4SOTYPE.NAME");
		_checkConditionToken(condition,"namefordfdoc","ENSHEETS4SOTYPE.NAMEFORDFDOC");
		_checkConditionToken(condition,"dfdocnummask","ENSHEETS4SOTYPE.DFDOCNUMMASK");
		_checkConditionToken(condition,"dfdepartmentcode","ENSHEETS4SOTYPE.DFDEPARTMENTCODE");
		_checkConditionToken(condition,"executorfio","ENSHEETS4SOTYPE.EXECUTORFIO");
		_checkConditionToken(condition,"executorphone","ENSHEETS4SOTYPE.EXECUTORPHONE");
		_checkConditionToken(condition,"executoremail","ENSHEETS4SOTYPE.EXECUTOREMAIL");
		_checkConditionToken(condition,"reportpath","ENSHEETS4SOTYPE.REPORTPATH");
		_checkConditionToken(condition,"reportfilename","ENSHEETS4SOTYPE.REPORTFILENAME");
		_checkConditionToken(condition,"reporttype","ENSHEETS4SOTYPE.REPORTTYPE");
		_checkConditionToken(condition,"commentgen","ENSHEETS4SOTYPE.COMMENTGEN");
		// relationship conditions
		_checkConditionToken(condition,"signerref","SIGNERREFCODE");
		_checkConditionToken(condition,"signerref.code","SIGNERREFCODE");
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
	
	private void _collectAutoIncrementFields(ENSheets4SOType anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENSHEETS4SOTYPE", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENSHEETS4SOTYPE", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENSHEETS4SOTYPE", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENSHEETS4SOTYPE");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENSheets4SOTypeDAO
