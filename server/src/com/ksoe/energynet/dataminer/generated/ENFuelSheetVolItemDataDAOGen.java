
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
import com.ksoe.energynet.valueobject.ENFuelSheetVolItemData;
import com.ksoe.energynet.valueobject.filter.ENFuelSheetVolItemDataFilter;
import com.ksoe.energynet.valueobject.brief.ENFuelSheetVolItemDataShort;
import com.ksoe.energynet.valueobject.lists.ENFuelSheetVolItemDataShortList;


/**
 * DAO Object for ENFuelSheetVolItemData;
 *
 */

public class ENFuelSheetVolItemDataDAOGen extends GenericDataMiner {

	public ENFuelSheetVolItemDataDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENFuelSheetVolItemDataDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENFuelSheetVolItemData inObject) throws PersistenceException {
		ENFuelSheetVolItemData obj = new ENFuelSheetVolItemData();
		obj.code = inObject.code;
		loadObject(obj);

		if (inObject.plan_code != obj.plan_code){
					return false;
				}

		if(inObject.datestart == null && obj.datestart == null){} else 
			if(inObject.datestart == null || obj.datestart == null) return false;
			else
				if (inObject.datestart.compareTo(obj.datestart) != 0){
					return false;
				}

		if(inObject.countfact == null && obj.countfact == null){}
		else
			if(inObject.countfact == null || obj.countfact == null) return false;
			else
				if ( ! inObject.countfact.equals(obj.countfact)){
					return false;
				}

		if (inObject.kindcode != obj.kindcode){
					return false;
				}

		if (inObject.staterefcode != obj.staterefcode){
					return false;
				}

		if (inObject.typerefcode != obj.typerefcode){
					return false;
				}

		if (inObject.budgetrefcode != obj.budgetrefcode){
					return false;
				}

		if (inObject.materialrefcode != obj.materialrefcode){
					return false;
				}

		if (inObject.transport_department != obj.transport_department){
					return false;
				}

		if (inObject.departmentrefcode != obj.departmentrefcode){
					return false;
				}

		if (inObject.eikindcode != obj.eikindcode){
					return false;
				}
		if (inObject.sheetVolumesRef.code != obj.sheetVolumesRef.code){
			return false;
		}
		return true;
	}

	public int add(ENFuelSheetVolItemData anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENFuelSheetVolItemData anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENFUELSHEETVOLITEMDATA (CODE,PLAN_CODE,DATESTART,COUNTFACT,KINDCODE,STATEREFCODE,TYPEREFCODE,BUDGETREFCODE,MATERIALREFCODE,TRANSPORT_DEPARTMENT,DEPARTMENTREFCODE,EIKINDCODE,SHEETVOLUMESREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			if (anObject.plan_code != Integer.MIN_VALUE ) {
				statement.setInt(2, anObject.plan_code);
			} else {
				statement.setNull(2, java.sql.Types.INTEGER);
			}
			if (anObject.datestart == null) {
				statement.setDate(3, null);
			} else {
				statement.setDate(3, new java.sql.Date(anObject.datestart.getTime()));
			}
			if (anObject.countfact != null) {
				anObject.countfact = anObject.countfact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(4, anObject.countfact);
			if (anObject.kindcode != Integer.MIN_VALUE ) {
				statement.setInt(5, anObject.kindcode);
			} else {
				statement.setNull(5, java.sql.Types.INTEGER);
			}
			if (anObject.staterefcode != Integer.MIN_VALUE ) {
				statement.setInt(6, anObject.staterefcode);
			} else {
				statement.setNull(6, java.sql.Types.INTEGER);
			}
			if (anObject.typerefcode != Integer.MIN_VALUE ) {
				statement.setInt(7, anObject.typerefcode);
			} else {
				statement.setNull(7, java.sql.Types.INTEGER);
			}
			if (anObject.budgetrefcode != Integer.MIN_VALUE ) {
				statement.setInt(8, anObject.budgetrefcode);
			} else {
				statement.setNull(8, java.sql.Types.INTEGER);
			}
			if (anObject.materialrefcode != Integer.MIN_VALUE ) {
				statement.setInt(9, anObject.materialrefcode);
			} else {
				statement.setNull(9, java.sql.Types.INTEGER);
			}
			if (anObject.transport_department != Integer.MIN_VALUE ) {
				statement.setInt(10, anObject.transport_department);
			} else {
				statement.setNull(10, java.sql.Types.INTEGER);
			}
			if (anObject.departmentrefcode != Integer.MIN_VALUE ) {
				statement.setInt(11, anObject.departmentrefcode);
			} else {
				statement.setNull(11, java.sql.Types.INTEGER);
			}
			if (anObject.eikindcode != Integer.MIN_VALUE ) {
				statement.setInt(12, anObject.eikindcode);
			} else {
				statement.setNull(12, java.sql.Types.INTEGER);
			}
			if (anObject.sheetVolumesRef.code != Integer.MIN_VALUE){
				statement.setInt(13,anObject.sheetVolumesRef.code);
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
			throw new PersistenceException("Error in method {%ENFuelSheetVolItemDataDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENFuelSheetVolItemData anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENFuelSheetVolItemData anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("PLAN_CODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATESTART") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COUNTFACT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KINDCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("STATEREFCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TYPEREFCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BUDGETREFCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MATERIALREFCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TRANSPORT_DEPARTMENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DEPARTMENTREFCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("EIKINDCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SHEETVOLUMESREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENFUELSHEETVOLITEMDATA SET  PLAN_CODE = ? , DATESTART = ? , COUNTFACT = ? , KINDCODE = ? , STATEREFCODE = ? , TYPEREFCODE = ? , BUDGETREFCODE = ? , MATERIALREFCODE = ? , TRANSPORT_DEPARTMENT = ? , DEPARTMENTREFCODE = ? , EIKINDCODE = ? , SHEETVOLUMESREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENFUELSHEETVOLITEMDATA SET ";
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
					if (anObject.plan_code != Integer.MIN_VALUE) {
						statement.setInt(1, anObject.plan_code);
					} else {
						statement.setNull(1, java.sql.Types.INTEGER);
					}
					if (anObject.datestart == null) {
						statement.setDate(2, null);
					} else {
						statement.setDate(2, new java.sql.Date(anObject.datestart.getTime()));
					}
					if (anObject.countfact != null) {
						anObject.countfact = anObject.countfact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(3, anObject.countfact);
					if (anObject.kindcode != Integer.MIN_VALUE) {
						statement.setInt(4, anObject.kindcode);
					} else {
						statement.setNull(4, java.sql.Types.INTEGER);
					}
					if (anObject.staterefcode != Integer.MIN_VALUE) {
						statement.setInt(5, anObject.staterefcode);
					} else {
						statement.setNull(5, java.sql.Types.INTEGER);
					}
					if (anObject.typerefcode != Integer.MIN_VALUE) {
						statement.setInt(6, anObject.typerefcode);
					} else {
						statement.setNull(6, java.sql.Types.INTEGER);
					}
					if (anObject.budgetrefcode != Integer.MIN_VALUE) {
						statement.setInt(7, anObject.budgetrefcode);
					} else {
						statement.setNull(7, java.sql.Types.INTEGER);
					}
					if (anObject.materialrefcode != Integer.MIN_VALUE) {
						statement.setInt(8, anObject.materialrefcode);
					} else {
						statement.setNull(8, java.sql.Types.INTEGER);
					}
					if (anObject.transport_department != Integer.MIN_VALUE) {
						statement.setInt(9, anObject.transport_department);
					} else {
						statement.setNull(9, java.sql.Types.INTEGER);
					}
					if (anObject.departmentrefcode != Integer.MIN_VALUE) {
						statement.setInt(10, anObject.departmentrefcode);
					} else {
						statement.setNull(10, java.sql.Types.INTEGER);
					}
					if (anObject.eikindcode != Integer.MIN_VALUE) {
						statement.setInt(11, anObject.eikindcode);
					} else {
						statement.setNull(11, java.sql.Types.INTEGER);
					}
					if (anObject.sheetVolumesRef.code != Integer.MIN_VALUE) {
						statement.setInt(12, anObject.sheetVolumesRef.code);
					} else {
						statement.setNull(12, java.sql.Types.INTEGER);
					}
					statement.setInt(13, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("PLAN_CODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.plan_code);
							continue;
						}
						if("DATESTART".compareTo((String)fields.get(i)) == 0) {
							if (anObject.datestart == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.datestart.getTime()));
							}
							continue;
						}
						if("COUNTFACT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.countfact != null) {
								anObject.countfact = anObject.countfact.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.countfact);
							continue;
						}
						if("KINDCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.kindcode);
							continue;
						}
						if("STATEREFCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.staterefcode);
							continue;
						}
						if("TYPEREFCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.typerefcode);
							continue;
						}
						if("BUDGETREFCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.budgetrefcode);
							continue;
						}
						if("MATERIALREFCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.materialrefcode);
							continue;
						}
						if("TRANSPORT_DEPARTMENT".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.transport_department);
							continue;
						}
						if("DEPARTMENTREFCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.departmentrefcode);
							continue;
						}
						if("EIKINDCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.eikindcode);
							continue;
						}
						if("SHEETVOLUMESREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sheetVolumesRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.sheetVolumesRef.code);
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

	} // end of save(ENFuelSheetVolItemData anObject,String[] anAttributes)


	public ENFuelSheetVolItemDataShort getShortObject(int anObjectCode) throws PersistenceException {
		ENFuelSheetVolItemData filterObject = new ENFuelSheetVolItemData();
		Vector<ENFuelSheetVolItemDataShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENFuelSheetVolItemDataShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENFuelSheetVolItemData filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.plan_code, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.datestart, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.countfact, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.kindcode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.staterefcode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.typerefcode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.budgetrefcode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.materialrefcode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.transport_department, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.departmentrefcode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.eikindcode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.sheetVolumesRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENFuelSheetVolItemDataFilter filter) {
		String out = buildCondition((ENFuelSheetVolItemData)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENFuelSheetVolItemData filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENFuelSheetVolItemData.code_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.plan_code, ENFuelSheetVolItemData.plan_code_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.datestart, ENFuelSheetVolItemData.datestart_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.countfact, ENFuelSheetVolItemData.countfact_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.kindcode, ENFuelSheetVolItemData.kindcode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.staterefcode, ENFuelSheetVolItemData.staterefcode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.typerefcode, ENFuelSheetVolItemData.typerefcode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.budgetrefcode, ENFuelSheetVolItemData.budgetrefcode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.materialrefcode, ENFuelSheetVolItemData.materialrefcode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.transport_department, ENFuelSheetVolItemData.transport_department_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.departmentrefcode, ENFuelSheetVolItemData.departmentrefcode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.eikindcode, ENFuelSheetVolItemData.eikindcode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.sheetVolumesRef.code, ENFuelSheetVolItemData.sheetVolumesRef_QFielld, out);
		}
		return out;
	}

	public ENFuelSheetVolItemDataShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENFuelSheetVolItemDataShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENFuelSheetVolItemDataShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENFuelSheetVolItemDataShortList getFilteredList(ENFuelSheetVolItemData filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENFuelSheetVolItemDataShortList getScrollableFilteredList(ENFuelSheetVolItemData aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENFuelSheetVolItemDataShortList getScrollableFilteredList(ENFuelSheetVolItemData aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENFuelSheetVolItemDataShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENFuelSheetVolItemDataShortList getScrollableFilteredList(ENFuelSheetVolItemDataFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENFuelSheetVolItemDataShortList getScrollableFilteredList(ENFuelSheetVolItemDataFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENFuelSheetVolItemDataShortList getScrollableFilteredList(ENFuelSheetVolItemData aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENFuelSheetVolItemDataShortList result = new ENFuelSheetVolItemDataShortList();
		ENFuelSheetVolItemDataShort anObject;
		result.list = new Vector<ENFuelSheetVolItemDataShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENFUELSHEETVOLITEMDATA.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENFUELSHEETVOLITEMDATA.CODE"+
			",ENFUELSHEETVOLITEMDATA.PLAN_CODE"+
			",ENFUELSHEETVOLITEMDATA.DATESTART"+
			",ENFUELSHEETVOLITEMDATA.COUNTFACT"+
			",ENFUELSHEETVOLITEMDATA.KINDCODE"+
			",ENFUELSHEETVOLITEMDATA.STATEREFCODE"+
			",ENFUELSHEETVOLITEMDATA.TYPEREFCODE"+
			",ENFUELSHEETVOLITEMDATA.BUDGETREFCODE"+
			",ENFUELSHEETVOLITEMDATA.MATERIALREFCODE"+
			",ENFUELSHEETVOLITEMDATA.TRANSPORT_DEPARTMENT"+
			",ENFUELSHEETVOLITEMDATA.DEPARTMENTREFCODE"+
			",ENFUELSHEETVOLITEMDATA.EIKINDCODE"+
			", ENFUELSHEETVOLUMES.CODE " +
			", ENFUELSHEETVOLUMES.NAME " +
			", ENFUELSHEETVOLUMES.DATEGEN " +
			", ENFUELSHEETVOLUMES.STARTDATE " +
			", ENFUELSHEETVOLUMES.ENDDATE " +
			", ENFUELSHEETVOLUMES.FUELTYPE " +
			", ENFUELSHEETVOLUMES.USERADD " +
			", ENFUELSHEETVOLUMES.DATEADD " +
			", ENFUELSHEETVOLUMES.USERGEN " +
			", ENFUELSHEETVOLUMES.DATEEDIT " +
		" FROM ENFUELSHEETVOLITEMDATA " +
			" LEFT JOIN ENFUELSHEETVOLUMES on ENFUELSHEETVOLUMES.CODE = ENFUELSHEETVOLITEMDATA.SHEETVOLUMESREFCODE "+
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
				anObject = new ENFuelSheetVolItemDataShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.plan_code = set.getInt(2);
				if ( set.wasNull() ) {
					anObject.plan_code = Integer.MIN_VALUE;
				}
				anObject.datestart = set.getDate(3);
				anObject.countfact = set.getBigDecimal(4);
				if(anObject.countfact != null) {
					anObject.countfact = anObject.countfact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.kindcode = set.getInt(5);
				if ( set.wasNull() ) {
					anObject.kindcode = Integer.MIN_VALUE;
				}
				anObject.staterefcode = set.getInt(6);
				if ( set.wasNull() ) {
					anObject.staterefcode = Integer.MIN_VALUE;
				}
				anObject.typerefcode = set.getInt(7);
				if ( set.wasNull() ) {
					anObject.typerefcode = Integer.MIN_VALUE;
				}
				anObject.budgetrefcode = set.getInt(8);
				if ( set.wasNull() ) {
					anObject.budgetrefcode = Integer.MIN_VALUE;
				}
				anObject.materialrefcode = set.getInt(9);
				if ( set.wasNull() ) {
					anObject.materialrefcode = Integer.MIN_VALUE;
				}
				anObject.transport_department = set.getInt(10);
				if ( set.wasNull() ) {
					anObject.transport_department = Integer.MIN_VALUE;
				}
				anObject.departmentrefcode = set.getInt(11);
				if ( set.wasNull() ) {
					anObject.departmentrefcode = Integer.MIN_VALUE;
				}
				anObject.eikindcode = set.getInt(12);
				if ( set.wasNull() ) {
					anObject.eikindcode = Integer.MIN_VALUE;
				}

				anObject.sheetVolumesRefCode = set.getInt(13);
				if(set.wasNull()) {
					anObject.sheetVolumesRefCode = Integer.MIN_VALUE;
				}
				anObject.sheetVolumesRefName = set.getString(14);
				anObject.sheetVolumesRefDateGen = set.getDate(15);
				anObject.sheetVolumesRefStartDate = set.getDate(16);
				anObject.sheetVolumesRefEndDate = set.getDate(17);
				anObject.sheetVolumesRefFuelType = set.getInt(18);
				if(set.wasNull()) {
					anObject.sheetVolumesRefFuelType = Integer.MIN_VALUE;
				}
				anObject.sheetVolumesRefUserAdd = set.getString(19);
				anObject.sheetVolumesRefDateAdd = set.getTimestamp(20);
				anObject.sheetVolumesRefUserGen = set.getString(21);
				anObject.sheetVolumesRefDateEdit = set.getTimestamp(22);

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
	
	public int[] getFilteredCodeArray(ENFuelSheetVolItemDataFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENFuelSheetVolItemDataFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENFuelSheetVolItemData aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENFUELSHEETVOLITEMDATA.CODE FROM ENFUELSHEETVOLITEMDATA";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENFUELSHEETVOLITEMDATA.CODE";
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


	public ENFuelSheetVolItemData getObject(int uid) throws PersistenceException {
		ENFuelSheetVolItemData result = new ENFuelSheetVolItemData();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENFuelSheetVolItemData anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENFUELSHEETVOLITEMDATA.CODE, ENFUELSHEETVOLITEMDATA.PLAN_CODE, ENFUELSHEETVOLITEMDATA.DATESTART, ENFUELSHEETVOLITEMDATA.COUNTFACT, ENFUELSHEETVOLITEMDATA.KINDCODE, ENFUELSHEETVOLITEMDATA.STATEREFCODE, ENFUELSHEETVOLITEMDATA.TYPEREFCODE, ENFUELSHEETVOLITEMDATA.BUDGETREFCODE, ENFUELSHEETVOLITEMDATA.MATERIALREFCODE, ENFUELSHEETVOLITEMDATA.TRANSPORT_DEPARTMENT, ENFUELSHEETVOLITEMDATA.DEPARTMENTREFCODE, ENFUELSHEETVOLITEMDATA.EIKINDCODE, ENFUELSHEETVOLITEMDATA.SHEETVOLUMESREFCODE "
			+" FROM ENFUELSHEETVOLITEMDATA WHERE ENFUELSHEETVOLITEMDATA.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.plan_code = set.getInt(2);
				if (set.wasNull()) {
					anObject.plan_code = Integer.MIN_VALUE;
				}
				anObject.datestart = set.getDate(3);
				anObject.countfact = set.getBigDecimal(4);
				if(anObject.countfact != null) {
					anObject.countfact = anObject.countfact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.kindcode = set.getInt(5);
				if (set.wasNull()) {
					anObject.kindcode = Integer.MIN_VALUE;
				}
				anObject.staterefcode = set.getInt(6);
				if (set.wasNull()) {
					anObject.staterefcode = Integer.MIN_VALUE;
				}
				anObject.typerefcode = set.getInt(7);
				if (set.wasNull()) {
					anObject.typerefcode = Integer.MIN_VALUE;
				}
				anObject.budgetrefcode = set.getInt(8);
				if (set.wasNull()) {
					anObject.budgetrefcode = Integer.MIN_VALUE;
				}
				anObject.materialrefcode = set.getInt(9);
				if (set.wasNull()) {
					anObject.materialrefcode = Integer.MIN_VALUE;
				}
				anObject.transport_department = set.getInt(10);
				if (set.wasNull()) {
					anObject.transport_department = Integer.MIN_VALUE;
				}
				anObject.departmentrefcode = set.getInt(11);
				if (set.wasNull()) {
					anObject.departmentrefcode = Integer.MIN_VALUE;
				}
				anObject.eikindcode = set.getInt(12);
				if (set.wasNull()) {
					anObject.eikindcode = Integer.MIN_VALUE;
				}
				anObject.sheetVolumesRef.code = set.getInt(13);
				if (set.wasNull()) {
					anObject.sheetVolumesRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENFuelSheetVolItemDataRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENFuelSheetVolItemDataRef ref = new com.ksoe.energynet.valueobject.references.ENFuelSheetVolItemDataRef();
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

		selectStr = "DELETE FROM  ENFUELSHEETVOLITEMDATA WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENFuelSheetVolItemData object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENFuelSheetVolItemData.getObject%} access denied");
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
	
	public long count(ENFuelSheetVolItemDataFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENFuelSheetVolItemDataFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENFuelSheetVolItemDataFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENFUELSHEETVOLITEMDATA", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENFUELSHEETVOLITEMDATA WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, ENFuelSheetVolItemDataFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENFuelSheetVolItemDataFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENFUELSHEETVOLITEMDATA");
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
			"SELECT  ENFUELSHEETVOLITEMDATA.CODE FROM  ENFUELSHEETVOLITEMDATA WHERE  ENFUELSHEETVOLITEMDATA.CODE = ?";
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
		_checkConditionToken(condition,"code","ENFUELSHEETVOLITEMDATA.CODE");
		_checkConditionToken(condition,"plan_code","ENFUELSHEETVOLITEMDATA.PLAN_CODE");
		_checkConditionToken(condition,"datestart","ENFUELSHEETVOLITEMDATA.DATESTART");
		_checkConditionToken(condition,"countfact","ENFUELSHEETVOLITEMDATA.COUNTFACT");
		_checkConditionToken(condition,"kindcode","ENFUELSHEETVOLITEMDATA.KINDCODE");
		_checkConditionToken(condition,"staterefcode","ENFUELSHEETVOLITEMDATA.STATEREFCODE");
		_checkConditionToken(condition,"typerefcode","ENFUELSHEETVOLITEMDATA.TYPEREFCODE");
		_checkConditionToken(condition,"budgetrefcode","ENFUELSHEETVOLITEMDATA.BUDGETREFCODE");
		_checkConditionToken(condition,"materialrefcode","ENFUELSHEETVOLITEMDATA.MATERIALREFCODE");
		_checkConditionToken(condition,"transport_department","ENFUELSHEETVOLITEMDATA.TRANSPORT_DEPARTMENT");
		_checkConditionToken(condition,"departmentrefcode","ENFUELSHEETVOLITEMDATA.DEPARTMENTREFCODE");
		_checkConditionToken(condition,"eikindcode","ENFUELSHEETVOLITEMDATA.EIKINDCODE");
		// relationship conditions
		_checkConditionToken(condition,"sheetvolumesref","SHEETVOLUMESREFCODE");
		_checkConditionToken(condition,"sheetvolumesref.code","SHEETVOLUMESREFCODE");
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
	
	private void _collectAutoIncrementFields(ENFuelSheetVolItemData anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENFUELSHEETVOLITEMDATA", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENFUELSHEETVOLITEMDATA", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENFUELSHEETVOLITEMDATA", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENFUELSHEETVOLITEMDATA");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENFuelSheetVolItemDataDAO
