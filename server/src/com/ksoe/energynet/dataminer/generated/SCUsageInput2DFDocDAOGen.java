
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
import com.ksoe.energynet.valueobject.SCUsageInput2DFDoc;
import com.ksoe.energynet.valueobject.filter.SCUsageInput2DFDocFilter;
import com.ksoe.energynet.valueobject.brief.SCUsageInput2DFDocShort;
import com.ksoe.energynet.valueobject.lists.SCUsageInput2DFDocShortList;


/**
 * DAO Object for SCUsageInput2DFDoc;
 *
 */

public class SCUsageInput2DFDocDAOGen extends GenericDataMiner {

	public SCUsageInput2DFDocDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public SCUsageInput2DFDocDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(SCUsageInput2DFDoc inObject) throws PersistenceException {
		SCUsageInput2DFDoc obj = new SCUsageInput2DFDoc();
		obj.code = inObject.code;
		loadObject(obj);

		if (inObject.dfDocCode != obj.dfDocCode){
					return false;
				}

		if (inObject.dfDocTypeCode != obj.dfDocTypeCode){
					return false;
				}

		if (inObject.dfDocSubtypeCode != obj.dfDocSubtypeCode){
					return false;
				}

		if(inObject.dfDocNumber == null && obj.dfDocNumber == null){}
		else
			if(inObject.dfDocNumber == null || obj.dfDocNumber == null) return false;
			else
				if ( ! inObject.dfDocNumber.equals(obj.dfDocNumber)){
					return false;
				}

		if(inObject.dfDocDate == null && obj.dfDocDate == null){} else 
			if(inObject.dfDocDate == null || obj.dfDocDate == null) return false;
			else
				if (inObject.dfDocDate.compareTo(obj.dfDocDate) != 0){
					return false;
				}

		if(inObject.dfDocDescription == null && obj.dfDocDescription == null){}
		else
			if(inObject.dfDocDescription == null || obj.dfDocDescription == null) return false;
			else
				if ( ! inObject.dfDocDescription.equals(obj.dfDocDescription)){
					return false;
				}

		if(inObject.commentgen == null && obj.commentgen == null){}
		else
			if(inObject.commentgen == null || obj.commentgen == null) return false;
			else
				if ( ! inObject.commentgen.equals(obj.commentgen)){
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
		if (inObject.scUsageInputRef.code != obj.scUsageInputRef.code){
			return false;
		}
		return true;
	}

	public int add(SCUsageInput2DFDoc anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(SCUsageInput2DFDoc anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO SCUSAGEINPUT2DFDOC (CODE,DFDOCCODE,DFDOCTYPECODE,DFDOCSUBTYPECODE,DFDOCNUMBER,DFDOCDATE,DFDOCDESCRIPTION,COMMENTGEN,USERADD,DATEADD,USERGEN,DATEEDIT,MODIFY_TIME,SCUSAGEINPUTREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			if (anObject.dfDocCode != Integer.MIN_VALUE ) {
				statement.setInt(2, anObject.dfDocCode);
			} else {
				statement.setNull(2, java.sql.Types.INTEGER);
			}
			if (anObject.dfDocTypeCode != Integer.MIN_VALUE ) {
				statement.setInt(3, anObject.dfDocTypeCode);
			} else {
				statement.setNull(3, java.sql.Types.INTEGER);
			}
			if (anObject.dfDocSubtypeCode != Integer.MIN_VALUE ) {
				statement.setInt(4, anObject.dfDocSubtypeCode);
			} else {
				statement.setNull(4, java.sql.Types.INTEGER);
			}
			statement.setString(5, anObject.dfDocNumber);
			if (anObject.dfDocDate == null) {
				statement.setDate(6, null);
			} else {
				statement.setDate(6, new java.sql.Date(anObject.dfDocDate.getTime()));
			}
			statement.setString(7, anObject.dfDocDescription);
			statement.setString(8, anObject.commentgen);
			statement.setString(9, anObject.userAdd);
			if (anObject.dateAdd == null) {
				statement.setTimestamp(10, null);
			} else {
				statement.setTimestamp(10, new java.sql.Timestamp(anObject.dateAdd.getTime()));
			}
			statement.setString(11, anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(12, null);
			} else {
				statement.setTimestamp(12, new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(13, null);
			} else {
				statement.setBigDecimal(13, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.scUsageInputRef.code != Integer.MIN_VALUE){
				statement.setInt(14,anObject.scUsageInputRef.code);
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
			throw new PersistenceException("Error in method {%SCUsageInput2DFDocDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(SCUsageInput2DFDoc anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(SCUsageInput2DFDoc anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			SCUsageInput2DFDoc oldObject = new SCUsageInput2DFDoc();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+SCUsageInput2DFDoc.modify_time_Field+" FROM  SCUSAGEINPUT2DFDOC WHERE CODE = ?";
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
				fields = new Vector<String>();
				for(int attrIndex = 0;attrIndex < anAttributes.length;attrIndex++) {
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DFDOCCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DFDOCTYPECODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DFDOCSUBTYPECODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DFDOCNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DFDOCDATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DFDOCDESCRIPTION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COMMENTGEN") == 0) {
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
					if(fieldNameStr.compareTo("SCUSAGEINPUTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE SCUSAGEINPUT2DFDOC SET  DFDOCCODE = ? , DFDOCTYPECODE = ? , DFDOCSUBTYPECODE = ? , DFDOCNUMBER = ? , DFDOCDATE = ? , DFDOCDESCRIPTION = ? , COMMENTGEN = ? , USERADD = ? , DATEADD = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , SCUSAGEINPUTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE SCUSAGEINPUT2DFDOC SET ";
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
					if (anObject.dfDocCode != Integer.MIN_VALUE) {
						statement.setInt(1, anObject.dfDocCode);
					} else {
						statement.setNull(1, java.sql.Types.INTEGER);
					}
					if (anObject.dfDocTypeCode != Integer.MIN_VALUE) {
						statement.setInt(2, anObject.dfDocTypeCode);
					} else {
						statement.setNull(2, java.sql.Types.INTEGER);
					}
					if (anObject.dfDocSubtypeCode != Integer.MIN_VALUE) {
						statement.setInt(3, anObject.dfDocSubtypeCode);
					} else {
						statement.setNull(3, java.sql.Types.INTEGER);
					}
					statement.setString(4, anObject.dfDocNumber);
					if (anObject.dfDocDate == null) {
						statement.setDate(5, null);
					} else {
						statement.setDate(5, new java.sql.Date(anObject.dfDocDate.getTime()));
					}
					statement.setString(6, anObject.dfDocDescription);
					statement.setString(7, anObject.commentgen);
					statement.setString(8, anObject.userAdd);
					if (anObject.dateAdd == null) {
						statement.setTimestamp(9, null);
					} else {
						statement.setTimestamp(9, new java.sql.Timestamp(anObject.dateAdd.getTime()));
					}
					statement.setString(10, anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(11, null);
					} else {
						statement.setTimestamp(11, new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(12, null);
					} else {
						statement.setBigDecimal(12, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.scUsageInputRef.code != Integer.MIN_VALUE) {
						statement.setInt(13, anObject.scUsageInputRef.code);
					} else {
						statement.setNull(13, java.sql.Types.INTEGER);
					}
					statement.setInt(14, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("DFDOCCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.dfDocCode);
							continue;
						}
						if("DFDOCTYPECODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.dfDocTypeCode);
							continue;
						}
						if("DFDOCSUBTYPECODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.dfDocSubtypeCode);
							continue;
						}
						if("DFDOCNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.dfDocNumber);
							continue;
						}
						if("DFDOCDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dfDocDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dfDocDate.getTime()));
							}
							continue;
						}
						if("DFDOCDESCRIPTION".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.dfDocDescription);
							continue;
						}
						if("COMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.commentgen);
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
						if("SCUSAGEINPUTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.scUsageInputRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.scUsageInputRef.code);
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

	} // end of save(SCUsageInput2DFDoc anObject,String[] anAttributes)


	public SCUsageInput2DFDocShort getShortObject(int anObjectCode) throws PersistenceException {
		SCUsageInput2DFDoc filterObject = new SCUsageInput2DFDoc();
		Vector<SCUsageInput2DFDocShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (SCUsageInput2DFDocShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(SCUsageInput2DFDoc filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.dfDocCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.dfDocTypeCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.dfDocSubtypeCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.dfDocNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dfDocDate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.dfDocDescription, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentgen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userAdd, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateAdd, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.scUsageInputRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(SCUsageInput2DFDocFilter filter) {
		String out = buildCondition((SCUsageInput2DFDoc)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(SCUsageInput2DFDoc filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, SCUsageInput2DFDoc.code_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.dfDocCode, SCUsageInput2DFDoc.dfDocCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.dfDocTypeCode, SCUsageInput2DFDoc.dfDocTypeCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.dfDocSubtypeCode, SCUsageInput2DFDoc.dfDocSubtypeCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.dfDocNumber, SCUsageInput2DFDoc.dfDocNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dfDocDate, SCUsageInput2DFDoc.dfDocDate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.dfDocDescription, SCUsageInput2DFDoc.dfDocDescription_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentgen, SCUsageInput2DFDoc.commentgen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userAdd, SCUsageInput2DFDoc.userAdd_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateAdd, SCUsageInput2DFDoc.dateAdd_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, SCUsageInput2DFDoc.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, SCUsageInput2DFDoc.dateEdit_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, SCUsageInput2DFDoc.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.scUsageInputRef.code, SCUsageInput2DFDoc.scUsageInputRef_QFielld, out);
		}
		return out;
	}

	public SCUsageInput2DFDocShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public SCUsageInput2DFDocShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public SCUsageInput2DFDocShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public SCUsageInput2DFDocShortList getFilteredList(SCUsageInput2DFDoc filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public SCUsageInput2DFDocShortList getScrollableFilteredList(SCUsageInput2DFDoc aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public SCUsageInput2DFDocShortList getScrollableFilteredList(SCUsageInput2DFDoc aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public SCUsageInput2DFDocShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public SCUsageInput2DFDocShortList getScrollableFilteredList(SCUsageInput2DFDocFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public SCUsageInput2DFDocShortList getScrollableFilteredList(SCUsageInput2DFDocFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public SCUsageInput2DFDocShortList getScrollableFilteredList(SCUsageInput2DFDoc aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		SCUsageInput2DFDocShortList result = new SCUsageInput2DFDocShortList();
		SCUsageInput2DFDocShort anObject;
		result.list = new Vector<SCUsageInput2DFDocShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "SCUSAGEINPUT2DFDOC.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"SCUSAGEINPUT2DFDOC.CODE"+
			",SCUSAGEINPUT2DFDOC.DFDOCCODE"+
			",SCUSAGEINPUT2DFDOC.DFDOCTYPECODE"+
			",SCUSAGEINPUT2DFDOC.DFDOCSUBTYPECODE"+
			",SCUSAGEINPUT2DFDOC.DFDOCNUMBER"+
			",SCUSAGEINPUT2DFDOC.DFDOCDATE"+
			",SCUSAGEINPUT2DFDOC.DFDOCDESCRIPTION"+
			",SCUSAGEINPUT2DFDOC.COMMENTGEN"+
			",SCUSAGEINPUT2DFDOC.USERADD"+
			",SCUSAGEINPUT2DFDOC.DATEADD"+
			",SCUSAGEINPUT2DFDOC.USERGEN"+
			",SCUSAGEINPUT2DFDOC.DATEEDIT"+
			", SCUSAGEINPUT.CODE " +
			", SCUSAGEINPUT.NUMBERDOC " +
			", SCUSAGEINPUT.DATEGEN " +
			", SCUSAGEINPUT.DATESTART " +
			", SCUSAGEINPUT.DATEFINAL " +
			", SCUSAGEINPUT.MOLCODE " +
			", SCUSAGEINPUT.MOLNAME " +
			", SCUSAGEINPUT.DATEEDIT " +
			", SCUSAGEINPUT.MOLCODECOUNTER " +
			", SCUSAGEINPUT.MOLNAMECOUNTER " +
			", SCUSAGEINPUT.USERGEN " +
		" FROM SCUSAGEINPUT2DFDOC " +
			" LEFT JOIN SCUSAGEINPUT on SCUSAGEINPUT.CODE = SCUSAGEINPUT2DFDOC.SCUSAGEINPUTREFCODE "+
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
				anObject = new SCUsageInput2DFDocShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.dfDocCode = set.getInt(2);
				if ( set.wasNull() ) {
					anObject.dfDocCode = Integer.MIN_VALUE;
				}
				anObject.dfDocTypeCode = set.getInt(3);
				if ( set.wasNull() ) {
					anObject.dfDocTypeCode = Integer.MIN_VALUE;
				}
				anObject.dfDocSubtypeCode = set.getInt(4);
				if ( set.wasNull() ) {
					anObject.dfDocSubtypeCode = Integer.MIN_VALUE;
				}
				anObject.dfDocNumber = set.getString(5);
				anObject.dfDocDate = set.getDate(6);
				anObject.dfDocDescription = set.getString(7);
				anObject.commentgen = set.getString(8);
				anObject.userAdd = set.getString(9);
				anObject.dateAdd = set.getTimestamp(10);
				anObject.userGen = set.getString(11);
				anObject.dateEdit = set.getTimestamp(12);

				anObject.scUsageInputRefCode = set.getInt(13);
				if(set.wasNull()) {
					anObject.scUsageInputRefCode = Integer.MIN_VALUE;
				}
				anObject.scUsageInputRefNumberDoc = set.getString(14);
				anObject.scUsageInputRefDateGen = set.getDate(15);
				anObject.scUsageInputRefDateStart = set.getDate(16);
				anObject.scUsageInputRefDateFinal = set.getDate(17);
				anObject.scUsageInputRefMolCode = set.getString(18);
				anObject.scUsageInputRefMolName = set.getString(19);
				anObject.scUsageInputRefDateEdit = set.getTimestamp(20);
				anObject.scUsageInputRefMolCodeCounter = set.getString(21);
				anObject.scUsageInputRefMolNameCounter = set.getString(22);
				anObject.scUsageInputRefUserGen = set.getString(23);

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
	
	public int[] getFilteredCodeArray(SCUsageInput2DFDocFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(SCUsageInput2DFDocFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(SCUsageInput2DFDoc aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT SCUSAGEINPUT2DFDOC.CODE FROM SCUSAGEINPUT2DFDOC";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "SCUSAGEINPUT2DFDOC.CODE";
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


	public SCUsageInput2DFDoc getObject(int uid) throws PersistenceException {
		SCUsageInput2DFDoc result = new SCUsageInput2DFDoc();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(SCUsageInput2DFDoc anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  SCUSAGEINPUT2DFDOC.CODE, SCUSAGEINPUT2DFDOC.DFDOCCODE, SCUSAGEINPUT2DFDOC.DFDOCTYPECODE, SCUSAGEINPUT2DFDOC.DFDOCSUBTYPECODE, SCUSAGEINPUT2DFDOC.DFDOCNUMBER, SCUSAGEINPUT2DFDOC.DFDOCDATE, SCUSAGEINPUT2DFDOC.DFDOCDESCRIPTION, SCUSAGEINPUT2DFDOC.COMMENTGEN, SCUSAGEINPUT2DFDOC.USERADD, SCUSAGEINPUT2DFDOC.DATEADD, SCUSAGEINPUT2DFDOC.USERGEN, SCUSAGEINPUT2DFDOC.DATEEDIT, SCUSAGEINPUT2DFDOC.MODIFY_TIME, SCUSAGEINPUT2DFDOC.SCUSAGEINPUTREFCODE "
			+" FROM SCUSAGEINPUT2DFDOC WHERE SCUSAGEINPUT2DFDOC.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.dfDocCode = set.getInt(2);
				if (set.wasNull()) {
					anObject.dfDocCode = Integer.MIN_VALUE;
				}
				anObject.dfDocTypeCode = set.getInt(3);
				if (set.wasNull()) {
					anObject.dfDocTypeCode = Integer.MIN_VALUE;
				}
				anObject.dfDocSubtypeCode = set.getInt(4);
				if (set.wasNull()) {
					anObject.dfDocSubtypeCode = Integer.MIN_VALUE;
				}
				anObject.dfDocNumber = set.getString(5);
				anObject.dfDocDate = set.getDate(6);
				anObject.dfDocDescription = set.getString(7);
				anObject.commentgen = set.getString(8);
				anObject.userAdd = set.getString(9);
				anObject.dateAdd = set.getTimestamp(10);
				anObject.userGen = set.getString(11);
				anObject.dateEdit = set.getTimestamp(12);
				anObject.modify_time = set.getLong(13);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.scUsageInputRef.code = set.getInt(14);
				if (set.wasNull()) {
					anObject.scUsageInputRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.SCUsageInput2DFDocRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.SCUsageInput2DFDocRef ref = new com.ksoe.energynet.valueobject.references.SCUsageInput2DFDocRef();
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

		selectStr = "DELETE FROM  SCUSAGEINPUT2DFDOC WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		SCUsageInput2DFDoc object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%SCUsageInput2DFDoc.getObject%} access denied");
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
	
	public long count(SCUsageInput2DFDocFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(SCUsageInput2DFDocFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, SCUsageInput2DFDocFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM SCUSAGEINPUT2DFDOC", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM SCUSAGEINPUT2DFDOC WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, SCUsageInput2DFDocFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, SCUsageInput2DFDocFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "SCUSAGEINPUT2DFDOC");
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
			"SELECT  SCUSAGEINPUT2DFDOC.CODE FROM  SCUSAGEINPUT2DFDOC WHERE  SCUSAGEINPUT2DFDOC.CODE = ?";
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
		_checkConditionToken(condition,"code","SCUSAGEINPUT2DFDOC.CODE");
		_checkConditionToken(condition,"dfdoccode","SCUSAGEINPUT2DFDOC.DFDOCCODE");
		_checkConditionToken(condition,"dfdoctypecode","SCUSAGEINPUT2DFDOC.DFDOCTYPECODE");
		_checkConditionToken(condition,"dfdocsubtypecode","SCUSAGEINPUT2DFDOC.DFDOCSUBTYPECODE");
		_checkConditionToken(condition,"dfdocnumber","SCUSAGEINPUT2DFDOC.DFDOCNUMBER");
		_checkConditionToken(condition,"dfdocdate","SCUSAGEINPUT2DFDOC.DFDOCDATE");
		_checkConditionToken(condition,"dfdocdescription","SCUSAGEINPUT2DFDOC.DFDOCDESCRIPTION");
		_checkConditionToken(condition,"commentgen","SCUSAGEINPUT2DFDOC.COMMENTGEN");
		_checkConditionToken(condition,"useradd","SCUSAGEINPUT2DFDOC.USERADD");
		_checkConditionToken(condition,"dateadd","SCUSAGEINPUT2DFDOC.DATEADD");
		_checkConditionToken(condition,"usergen","SCUSAGEINPUT2DFDOC.USERGEN");
		_checkConditionToken(condition,"dateedit","SCUSAGEINPUT2DFDOC.DATEEDIT");
		_checkConditionToken(condition,"modify_time","SCUSAGEINPUT2DFDOC.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"scusageinputref","SCUSAGEINPUTREFCODE");
		_checkConditionToken(condition,"scusageinputref.code","SCUSAGEINPUTREFCODE");
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
	
	private void _collectAutoIncrementFields(SCUsageInput2DFDoc anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("SCUSAGEINPUT2DFDOC", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("SCUSAGEINPUT2DFDOC", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("SCUSAGEINPUT2DFDOC", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: SCUSAGEINPUT2DFDOC");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of SCUsageInput2DFDocDAO
