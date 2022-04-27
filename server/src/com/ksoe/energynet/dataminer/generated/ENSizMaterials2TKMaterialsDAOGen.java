
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
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
import com.ksoe.energynet.valueobject.ENSizMaterials2TKMaterials;
import com.ksoe.energynet.valueobject.brief.ENSizMaterials2TKMaterialsShort;
import com.ksoe.energynet.valueobject.filter.ENSizMaterials2TKMaterialsFilter;
import com.ksoe.energynet.valueobject.lists.ENSizMaterials2TKMaterialsShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;


/**
 * DAO Object for ENSizMaterials2TKMaterials;
 *
 */

public class ENSizMaterials2TKMaterialsDAOGen extends GenericDataMiner {

	public ENSizMaterials2TKMaterialsDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENSizMaterials2TKMaterialsDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENSizMaterials2TKMaterials inObject) throws PersistenceException {
		ENSizMaterials2TKMaterials obj = new ENSizMaterials2TKMaterials();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.userEdit == null && obj.userEdit == null){}
		else
			if(inObject.userEdit == null || obj.userEdit == null) return false;
			else
				if ( ! inObject.userEdit.equals(obj.userEdit)){
					return false;
				}

		if(inObject.dateEdit == null && obj.dateEdit == null){} else
			if(inObject.dateEdit == null || obj.dateEdit == null) return false;
			else
				if (inObject.dateEdit.compareTo(obj.dateEdit) != 0){
					return false;
				}
		if (inObject.elementRef.code != obj.elementRef.code){
			return false;
		}
		if (inObject.sizMaterialsRef.code != obj.sizMaterialsRef.code){
			return false;
		}
		if (inObject.tkMaterialsRef.code != obj.tkMaterialsRef.code){
			return false;
		}
		if (inObject.parentRef.code != obj.parentRef.code){
			return false;
		}
		return true;
	}

	public int add(ENSizMaterials2TKMaterials anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENSizMaterials2TKMaterials anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENSIZMATERIALS2TKMTRLS (CODE,USEREDIT,DATEEDIT,ELEMENTREFCODE,SIZMATERIALSREFCODE,TKMATERIALSREFCODE,PARENTREFCODE) VALUES (?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.userEdit);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(3, null);
			} else {
				statement.setTimestamp(3, new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.elementRef.code != Integer.MIN_VALUE){
				statement.setInt(4,anObject.elementRef.code);
			} else {
				statement.setNull(4,java.sql.Types.INTEGER);
			}
			if (anObject.sizMaterialsRef.code != Integer.MIN_VALUE){
				statement.setInt(5,anObject.sizMaterialsRef.code);
			} else {
				statement.setNull(5,java.sql.Types.INTEGER);
			}
			if (anObject.tkMaterialsRef.code != Integer.MIN_VALUE){
				statement.setInt(6,anObject.tkMaterialsRef.code);
			} else {
				statement.setNull(6,java.sql.Types.INTEGER);
			}
			if (anObject.parentRef.code != Integer.MIN_VALUE){
				statement.setInt(7,anObject.parentRef.code);
			} else {
				statement.setNull(7,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENSizMaterials2TKMaterialsDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENSizMaterials2TKMaterials anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENSizMaterials2TKMaterials anObject,String[] anAttributes) throws PersistenceException {
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
				fields = new Vector<>();
				for(int attrIndex = 0;attrIndex < anAttributes.length;attrIndex++) {
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USEREDIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEEDIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ELEMENTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SIZMATERIALSREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TKMATERIALSREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PARENTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENSIZMATERIALS2TKMTRLS SET  USEREDIT = ? , DATEEDIT = ? , ELEMENTREFCODE = ? , SIZMATERIALSREFCODE = ? , TKMATERIALSREFCODE = ? , PARENTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENSIZMATERIALS2TKMATERIALS SET ";
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
					statement.setString(1, anObject.userEdit);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(2, null);
					} else {
						statement.setTimestamp(2, new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.elementRef.code != Integer.MIN_VALUE) {
						statement.setInt(3, anObject.elementRef.code);
					} else {
						statement.setNull(3, java.sql.Types.INTEGER);
					}
					if (anObject.sizMaterialsRef.code != Integer.MIN_VALUE) {
						statement.setInt(4, anObject.sizMaterialsRef.code);
					} else {
						statement.setNull(4, java.sql.Types.INTEGER);
					}
					if (anObject.tkMaterialsRef.code != Integer.MIN_VALUE) {
						statement.setInt(5, anObject.tkMaterialsRef.code);
					} else {
						statement.setNull(5, java.sql.Types.INTEGER);
					}
					if (anObject.parentRef.code != Integer.MIN_VALUE) {
						statement.setInt(6, anObject.parentRef.code);
					} else {
						statement.setNull(6, java.sql.Types.INTEGER);
					}
					statement.setInt(7, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("USEREDIT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.userEdit);
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
						if("ELEMENTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.elementRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.elementRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("SIZMATERIALSREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sizMaterialsRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.sizMaterialsRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("TKMATERIALSREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.tkMaterialsRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.tkMaterialsRef.code);
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

	} // end of save(ENSizMaterials2TKMaterials anObject,String[] anAttributes)


	public ENSizMaterials2TKMaterialsShort getShortObject(int anObjectCode) throws PersistenceException {
		ENSizMaterials2TKMaterials filterObject = new ENSizMaterials2TKMaterials();
		Vector<ENSizMaterials2TKMaterialsShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENSizMaterials2TKMaterialsShort)list.get(0);
		}
		return null;
	}

	public int setParameters(ENSizMaterials2TKMaterials filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userEdit, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.elementRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.sizMaterialsRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.tkMaterialsRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.parentRef.code, index, statement);
			index--;
		}
		return index;
	}

	public String buildCondition(ENSizMaterials2TKMaterialsFilter filter) {
		String out = buildCondition((ENSizMaterials2TKMaterials)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENSizMaterials2TKMaterials filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENSizMaterials2TKMaterials.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userEdit, ENSizMaterials2TKMaterials.userEdit_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENSizMaterials2TKMaterials.dateEdit_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.elementRef.code, ENSizMaterials2TKMaterials.elementRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.sizMaterialsRef.code, ENSizMaterials2TKMaterials.sizMaterialsRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.tkMaterialsRef.code, ENSizMaterials2TKMaterials.tkMaterialsRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.parentRef.code, ENSizMaterials2TKMaterials.parentRef_QFielld, out);
		}
		return out;
	}

	public ENSizMaterials2TKMaterialsShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENSizMaterials2TKMaterialsShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENSizMaterials2TKMaterialsShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENSizMaterials2TKMaterialsShortList getFilteredList(ENSizMaterials2TKMaterials filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENSizMaterials2TKMaterialsShortList getScrollableFilteredList(ENSizMaterials2TKMaterials aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENSizMaterials2TKMaterialsShortList getScrollableFilteredList(ENSizMaterials2TKMaterials aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENSizMaterials2TKMaterialsShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENSizMaterials2TKMaterialsShortList getScrollableFilteredList(ENSizMaterials2TKMaterialsFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}

	public ENSizMaterials2TKMaterialsShortList getScrollableFilteredList(ENSizMaterials2TKMaterialsFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}

	public ENSizMaterials2TKMaterialsShortList getScrollableFilteredList(ENSizMaterials2TKMaterials aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENSizMaterials2TKMaterialsShortList result = new ENSizMaterials2TKMaterialsShortList();
		ENSizMaterials2TKMaterialsShort anObject;
		result.list = new Vector<ENSizMaterials2TKMaterialsShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSIZMATERIALS2TKMTRLS.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSIZMATERIALS2TKMTRLS.CODE"+
			",ENSIZMATERIALS2TKMTRLS.USEREDIT"+
			",ENSIZMATERIALS2TKMTRLS.DATEEDIT"+
			", ENELEMENT.CODE " +
			", TKMATERIALS.CODE " +
			", TKMATERIALS.NAME " +
			", TKMATERIALS.COST " +
			", TKMATERIALS.DELIVERYDATE " +
			", TKMATERIALS.NUMKATALOG " +
			", TKMATERIALS.IDENTID " +
			", TKMATERIALS.CODE " +
			", TKMATERIALS.NAME " +
			", TKMATERIALS.COST " +
			", TKMATERIALS.DELIVERYDATE " +
			", TKMATERIALS.NUMKATALOG " +
			", TKMATERIALS.IDENTID " +
			", ENSIZMATERIALS2TKMTRLS.CODE " +
			", ENSIZMATERIALS2TKMTRLS.USEREDIT " +
			", ENSIZMATERIALS2TKMTRLS.DATEEDIT " +
		" FROM ENSIZMATERIALS2TKMTRLS " +
			" LEFT JOIN ENELEMENT on ENELEMENT.CODE = ENSIZMATERIALS2TKMTRLS.ELEMENTREFCODE "+
			" LEFT JOIN TKMATERIALS on TKMATERIALS.CODE = ENSIZMATERIALS2TKMTRLS.SIZMATERIALSREFCODE "+
			" LEFT JOIN TKMATERIALS on TKMATERIALS.CODE = ENSIZMATERIALS2TKMTRLS.TKMATERIALSREFCODE "+
			" LEFT JOIN ENSIZMATERIALS2TKMTRLS on ENSIZMATERIALS2TKMTRLS.CODE = ENSIZMATERIALS2TKMTRLS.PARENTREFCODE "+
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
				anObject = new ENSizMaterials2TKMaterialsShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.userEdit = set.getString(2);
				anObject.dateEdit = set.getTimestamp(3);

				anObject.elementRefCode = set.getInt(4);
				if(set.wasNull()) {
					anObject.elementRefCode = Integer.MIN_VALUE;
				}
				anObject.sizMaterialsRefCode = set.getInt(5);
				if(set.wasNull()) {
					anObject.sizMaterialsRefCode = Integer.MIN_VALUE;
				}
				anObject.sizMaterialsRefName = set.getString(6);
				anObject.sizMaterialsRefCost = set.getBigDecimal(7);
				if(anObject.sizMaterialsRefCost != null) {
					anObject.sizMaterialsRefCost = anObject.sizMaterialsRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sizMaterialsRefDeliveryDate = set.getInt(8);
				if(set.wasNull()) {
					anObject.sizMaterialsRefDeliveryDate = Integer.MIN_VALUE;
				}
				anObject.sizMaterialsRefNumkatalog = set.getString(9);
				anObject.sizMaterialsRefIdentid = set.getString(10);
				anObject.tkMaterialsRefCode = set.getInt(11);
				if(set.wasNull()) {
					anObject.tkMaterialsRefCode = Integer.MIN_VALUE;
				}
				anObject.tkMaterialsRefName = set.getString(12);
				anObject.tkMaterialsRefCost = set.getBigDecimal(13);
				if(anObject.tkMaterialsRefCost != null) {
					anObject.tkMaterialsRefCost = anObject.tkMaterialsRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.tkMaterialsRefDeliveryDate = set.getInt(14);
				if(set.wasNull()) {
					anObject.tkMaterialsRefDeliveryDate = Integer.MIN_VALUE;
				}
				anObject.tkMaterialsRefNumkatalog = set.getString(15);
				anObject.tkMaterialsRefIdentid = set.getString(16);
				anObject.parentRefCode = set.getInt(17);
				if(set.wasNull()) {
					anObject.parentRefCode = Integer.MIN_VALUE;
				}
				anObject.parentRefUserEdit = set.getString(18);
				anObject.parentRefDateEdit = set.getTimestamp(19);

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

	public int[] getFilteredCodeArray(ENSizMaterials2TKMaterialsFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENSizMaterials2TKMaterialsFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENSizMaterials2TKMaterials aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENSIZMATERIALS2TKMTRLS.CODE FROM ENSIZMATERIALS2TKMTRLS";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSIZMATERIALS2TKMTRLS.CODE";
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


	public ENSizMaterials2TKMaterials getObject(int uid) throws PersistenceException {
		ENSizMaterials2TKMaterials result = new ENSizMaterials2TKMaterials();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENSizMaterials2TKMaterials anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENSIZMATERIALS2TKMTRLS.CODE, ENSIZMATERIALS2TKMTRLS.USEREDIT, ENSIZMATERIALS2TKMTRLS.DATEEDIT, ENSIZMATERIALS2TKMTRLS.ELEMENTREFCODE, ENSIZMATERIALS2TKMTRLS.SIZMATERIALSREFCODE, ENSIZMATERIALS2TKMTRLS.TKMATERIALSREFCODE, ENSIZMATERIALS2TKMTRLS.PARENTREFCODE "
			+" FROM ENSIZMATERIALS2TKMTRLS WHERE ENSIZMATERIALS2TKMTRLS.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);

				anObject.userEdit = set.getString(2);
				anObject.dateEdit = set.getTimestamp(3);
				anObject.elementRef.code = set.getInt(4);
				if (set.wasNull()) {
					anObject.elementRef.code = Integer.MIN_VALUE;
				}
				anObject.sizMaterialsRef.code = set.getInt(5);
				if (set.wasNull()) {
					anObject.sizMaterialsRef.code = Integer.MIN_VALUE;
				}
				anObject.tkMaterialsRef.code = set.getInt(6);
				if (set.wasNull()) {
					anObject.tkMaterialsRef.code = Integer.MIN_VALUE;
				}
				anObject.parentRef.code = set.getInt(7);
				if (set.wasNull()) {
					anObject.parentRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENSizMaterials2TKMaterialsRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENSizMaterials2TKMaterialsRef ref = new com.ksoe.energynet.valueobject.references.ENSizMaterials2TKMaterialsRef();
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

		selectStr = "DELETE FROM  ENSIZMATERIALS2TKMTRLS WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENSizMaterials2TKMaterials object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENSizMaterials2TKMaterials.getObject%} access denied");
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

	public long count(ENSizMaterials2TKMaterialsFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENSizMaterials2TKMaterialsFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}

	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENSizMaterials2TKMaterialsFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENSIZMATERIALS2TKMTRLS", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENSIZMATERIALS2TKMTRLS WHERE code = ?", propertyName);
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

	public <E> List<E> getListOfPropertyValues(String propertyName, ENSizMaterials2TKMaterialsFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENSizMaterials2TKMaterialsFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENSIZMATERIALS2TKMTRLS");
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
			"SELECT  ENSIZMATERIALS2TKMTRLS.CODE FROM  ENSIZMATERIALS2TKMTRLS WHERE  ENSIZMATERIALS2TKMTRLS.CODE = ?";
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
		_checkConditionToken(condition,"code","ENSIZMATERIALS2TKMTRLS.CODE");
		_checkConditionToken(condition,"useredit","ENSIZMATERIALS2TKMTRLS.USEREDIT");
		_checkConditionToken(condition,"dateedit","ENSIZMATERIALS2TKMTRLS.DATEEDIT");
		// relationship conditions
		_checkConditionToken(condition,"elementref","ELEMENTREFCODE");
		_checkConditionToken(condition,"elementref.code","ELEMENTREFCODE");
		_checkConditionToken(condition,"sizmaterialsref","SIZMATERIALSREFCODE");
		_checkConditionToken(condition,"sizmaterialsref.code","SIZMATERIALSREFCODE");
		_checkConditionToken(condition,"tkmaterialsref","TKMATERIALSREFCODE");
		_checkConditionToken(condition,"tkmaterialsref.code","TKMATERIALSREFCODE");
		_checkConditionToken(condition,"parentref","PARENTREFCODE");
		_checkConditionToken(condition,"parentref.code","PARENTREFCODE");
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

	private void _collectAutoIncrementFields(ENSizMaterials2TKMaterials anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENSIZMATERIALS2TKMTRLS", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENSIZMATERIALS2TKMTRLS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENSIZMATERIALS2TKMTRLS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENSIZMATERIALS2TKMTRLS");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENSizMaterials2TKMaterialsDAO
