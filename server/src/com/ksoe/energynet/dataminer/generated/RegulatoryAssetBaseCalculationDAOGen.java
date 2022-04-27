
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
import com.ksoe.energynet.valueobject.RegulatoryAssetBaseCalculation;
import com.ksoe.energynet.valueobject.filter.RegulatoryAssetBaseCalculationFilter;
import com.ksoe.energynet.valueobject.brief.RegulatoryAssetBaseCalculationShort;
import com.ksoe.energynet.valueobject.lists.RegulatoryAssetBaseCalculationShortList;


/**
 * DAO Object for RegulatoryAssetBaseCalculation;
 *
 */

public class RegulatoryAssetBaseCalculationDAOGen extends GenericDataMiner {

	public RegulatoryAssetBaseCalculationDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public RegulatoryAssetBaseCalculationDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(RegulatoryAssetBaseCalculation inObject) throws PersistenceException {
		RegulatoryAssetBaseCalculation obj = new RegulatoryAssetBaseCalculation();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.period == null && obj.period == null){} else 
			if(inObject.period == null || obj.period == null) return false;
			else
				if (inObject.period.compareTo(obj.period) != 0){
					return false;
				}

		if(inObject.originalValue == null && obj.originalValue == null){}
		else
			if(inObject.originalValue == null || obj.originalValue == null) return false;
			else
				if ( ! inObject.originalValue.equals(obj.originalValue)){
					return false;
				}

		if(inObject.depreciation == null && obj.depreciation == null){}
		else
			if(inObject.depreciation == null || obj.depreciation == null) return false;
			else
				if ( ! inObject.depreciation.equals(obj.depreciation)){
					return false;
				}

		if(inObject.residualValue == null && obj.residualValue == null){}
		else
			if(inObject.residualValue == null || obj.residualValue == null) return false;
			else
				if ( ! inObject.residualValue.equals(obj.residualValue)){
					return false;
				}

		if (inObject.usefulLife != obj.usefulLife){
					return false;
				}

		if(inObject.writtenOffValue == null && obj.writtenOffValue == null){}
		else
			if(inObject.writtenOffValue == null || obj.writtenOffValue == null) return false;
			else
				if ( ! inObject.writtenOffValue.equals(obj.writtenOffValue)){
					return false;
				}
		if (inObject.assetRef.code != obj.assetRef.code){
			return false;
		}
		return true;
	}

	public int add(RegulatoryAssetBaseCalculation anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(RegulatoryAssetBaseCalculation anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO REGULATORYASSTBSCLCLTN (CODE,PERIOD,ORIGINALVALUE,DEPRECIATION,RESIDUALVALUE,USEFULLIFE,WRITTENOFFVALUE,ASSETREFCODE) VALUES (?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			if (anObject.period == null) {
				statement.setDate(2, null);
			} else {
				statement.setDate(2, new java.sql.Date(anObject.period.getTime()));
			}
			if (anObject.originalValue != null) {
				anObject.originalValue = anObject.originalValue.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(3, anObject.originalValue);
			if (anObject.depreciation != null) {
				anObject.depreciation = anObject.depreciation.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(4, anObject.depreciation);
			if (anObject.residualValue != null) {
				anObject.residualValue = anObject.residualValue.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(5, anObject.residualValue);
			if (anObject.usefulLife != Integer.MIN_VALUE ) {
				statement.setInt(6, anObject.usefulLife);
			} else {
				statement.setNull(6, java.sql.Types.INTEGER);
			}
			if (anObject.writtenOffValue != null) {
				anObject.writtenOffValue = anObject.writtenOffValue.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(7, anObject.writtenOffValue);
			if (anObject.assetRef.code != Integer.MIN_VALUE){
				statement.setInt(8,anObject.assetRef.code);
			} else {
				statement.setNull(8,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%RegulatoryAssetBaseCalculationDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(RegulatoryAssetBaseCalculation anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(RegulatoryAssetBaseCalculation anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("PERIOD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ORIGINALVALUE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DEPRECIATION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RESIDUALVALUE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USEFULLIFE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("WRITTENOFFVALUE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ASSETREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE REGULATORYASSTBSCLCLTN SET  PERIOD = ? , ORIGINALVALUE = ? , DEPRECIATION = ? , RESIDUALVALUE = ? , USEFULLIFE = ? , WRITTENOFFVALUE = ? , ASSETREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE REGULATORYASSETBASECALCULATION SET ";
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
					if (anObject.period == null) {
						statement.setDate(1, null);
					} else {
						statement.setDate(1, new java.sql.Date(anObject.period.getTime()));
					}
					if (anObject.originalValue != null) {
						anObject.originalValue = anObject.originalValue.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(2, anObject.originalValue);
					if (anObject.depreciation != null) {
						anObject.depreciation = anObject.depreciation.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(3, anObject.depreciation);
					if (anObject.residualValue != null) {
						anObject.residualValue = anObject.residualValue.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(4, anObject.residualValue);
					if (anObject.usefulLife != Integer.MIN_VALUE) {
						statement.setInt(5, anObject.usefulLife);
					} else {
						statement.setNull(5, java.sql.Types.INTEGER);
					}
					if (anObject.writtenOffValue != null) {
						anObject.writtenOffValue = anObject.writtenOffValue.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(6, anObject.writtenOffValue);
					if (anObject.assetRef.code != Integer.MIN_VALUE) {
						statement.setInt(7, anObject.assetRef.code);
					} else {
						statement.setNull(7, java.sql.Types.INTEGER);
					}
					statement.setInt(8, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("PERIOD".compareTo((String)fields.get(i)) == 0) {
							if (anObject.period == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.period.getTime()));
							}
							continue;
						}
						if("ORIGINALVALUE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.originalValue != null) {
								anObject.originalValue = anObject.originalValue.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.originalValue);
							continue;
						}
						if("DEPRECIATION".compareTo((String)fields.get(i)) == 0) {
							if (anObject.depreciation != null) {
								anObject.depreciation = anObject.depreciation.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.depreciation);
							continue;
						}
						if("RESIDUALVALUE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.residualValue != null) {
								anObject.residualValue = anObject.residualValue.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.residualValue);
							continue;
						}
						if("USEFULLIFE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.usefulLife);
							continue;
						}
						if("WRITTENOFFVALUE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.writtenOffValue != null) {
								anObject.writtenOffValue = anObject.writtenOffValue.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.writtenOffValue);
							continue;
						}
						if("ASSETREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.assetRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.assetRef.code);
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

	} // end of save(RegulatoryAssetBaseCalculation anObject,String[] anAttributes)


	public RegulatoryAssetBaseCalculationShort getShortObject(int anObjectCode) throws PersistenceException {
		RegulatoryAssetBaseCalculation filterObject = new RegulatoryAssetBaseCalculation();
		Vector<RegulatoryAssetBaseCalculationShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (RegulatoryAssetBaseCalculationShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(RegulatoryAssetBaseCalculation filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.period, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.originalValue, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.depreciation, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.residualValue, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.usefulLife, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.writtenOffValue, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.assetRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(RegulatoryAssetBaseCalculationFilter filter) {
		String out = buildCondition((RegulatoryAssetBaseCalculation)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(RegulatoryAssetBaseCalculation filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, RegulatoryAssetBaseCalculation.code_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.period, RegulatoryAssetBaseCalculation.period_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.originalValue, RegulatoryAssetBaseCalculation.originalValue_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.depreciation, RegulatoryAssetBaseCalculation.depreciation_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.residualValue, RegulatoryAssetBaseCalculation.residualValue_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.usefulLife, RegulatoryAssetBaseCalculation.usefulLife_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.writtenOffValue, RegulatoryAssetBaseCalculation.writtenOffValue_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.assetRef.code, RegulatoryAssetBaseCalculation.assetRef_QFielld, out);
		}
		return out;
	}

	public RegulatoryAssetBaseCalculationShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public RegulatoryAssetBaseCalculationShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public RegulatoryAssetBaseCalculationShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public RegulatoryAssetBaseCalculationShortList getFilteredList(RegulatoryAssetBaseCalculation filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public RegulatoryAssetBaseCalculationShortList getScrollableFilteredList(RegulatoryAssetBaseCalculation aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public RegulatoryAssetBaseCalculationShortList getScrollableFilteredList(RegulatoryAssetBaseCalculation aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public RegulatoryAssetBaseCalculationShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public RegulatoryAssetBaseCalculationShortList getScrollableFilteredList(RegulatoryAssetBaseCalculationFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public RegulatoryAssetBaseCalculationShortList getScrollableFilteredList(RegulatoryAssetBaseCalculationFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public RegulatoryAssetBaseCalculationShortList getScrollableFilteredList(RegulatoryAssetBaseCalculation aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		RegulatoryAssetBaseCalculationShortList result = new RegulatoryAssetBaseCalculationShortList();
		RegulatoryAssetBaseCalculationShort anObject;
		result.list = new Vector<RegulatoryAssetBaseCalculationShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "REGULATORYASSTBSCLCLTN.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"REGULATORYASSTBSCLCLTN.CODE"+
			",REGULATORYASSTBSCLCLTN.PERIOD"+
			",REGULATORYASSTBSCLCLTN.ORIGINALVALUE"+
			",REGULATORYASSTBSCLCLTN.DEPRECIATION"+
			",REGULATORYASSTBSCLCLTN.RESIDUALVALUE"+
			",REGULATORYASSTBSCLCLTN.USEFULLIFE"+
			",REGULATORYASSTBSCLCLTN.WRITTENOFFVALUE"+
			", REGULATORYASSETBASE.CODE " +
			", REGULATORYASSETBASE.INVENTORYNUMBER " +
			", REGULATORYASSETBASE.NAME " +
			", REGULATORYASSETBASE.INCOMEDATE " +
			", REGULATORYASSETBASE.ORIGINALVALUE " +
			", REGULATORYASSETBASE.INITIAL " +
			", REGULATORYASSETBASE.WRITEOFFNUMBER " +
			", REGULATORYASSETBASE.WRITEOFFDATE " +
		" FROM REGULATORYASSTBSCLCLTN " +
			" LEFT JOIN REGULATORYASSETBASE on REGULATORYASSETBASE.CODE = REGULATORYASSTBSCLCLTN.ASSETREFCODE "+
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
				anObject = new RegulatoryAssetBaseCalculationShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.period = set.getDate(2);
				anObject.originalValue = set.getBigDecimal(3);
				if(anObject.originalValue != null) {
					anObject.originalValue = anObject.originalValue.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.depreciation = set.getBigDecimal(4);
				if(anObject.depreciation != null) {
					anObject.depreciation = anObject.depreciation.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.residualValue = set.getBigDecimal(5);
				if(anObject.residualValue != null) {
					anObject.residualValue = anObject.residualValue.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.usefulLife = set.getInt(6);
				if ( set.wasNull() ) {
					anObject.usefulLife = Integer.MIN_VALUE;
				}
				anObject.writtenOffValue = set.getBigDecimal(7);
				if(anObject.writtenOffValue != null) {
					anObject.writtenOffValue = anObject.writtenOffValue.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.assetRefCode = set.getInt(8);
				if(set.wasNull()) {
					anObject.assetRefCode = Integer.MIN_VALUE;
				}
				anObject.assetRefInventoryNumber = set.getString(9);
				anObject.assetRefName = set.getString(10);
				anObject.assetRefIncomeDate = set.getDate(11);
				anObject.assetRefOriginalValue = set.getBigDecimal(12);
				if(anObject.assetRefOriginalValue != null) {
					anObject.assetRefOriginalValue = anObject.assetRefOriginalValue.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.assetRefInitial = set.getBoolean(13);
				if(set.wasNull()) {
					anObject.assetRefInitial = null;
				}
				anObject.assetRefWriteOffNumber = set.getString(14);
				anObject.assetRefWriteOffDate = set.getDate(15);

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
	
	public int[] getFilteredCodeArray(RegulatoryAssetBaseCalculationFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(RegulatoryAssetBaseCalculationFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(RegulatoryAssetBaseCalculation aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT REGULATORYASSTBSCLCLTN.CODE FROM REGULATORYASSTBSCLCLTN";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "REGULATORYASSTBSCLCLTN.CODE";
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


	public RegulatoryAssetBaseCalculation getObject(int uid) throws PersistenceException {
		RegulatoryAssetBaseCalculation result = new RegulatoryAssetBaseCalculation();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(RegulatoryAssetBaseCalculation anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  REGULATORYASSTBSCLCLTN.CODE, REGULATORYASSTBSCLCLTN.PERIOD, REGULATORYASSTBSCLCLTN.ORIGINALVALUE, REGULATORYASSTBSCLCLTN.DEPRECIATION, REGULATORYASSTBSCLCLTN.RESIDUALVALUE, REGULATORYASSTBSCLCLTN.USEFULLIFE, REGULATORYASSTBSCLCLTN.WRITTENOFFVALUE, REGULATORYASSTBSCLCLTN.ASSETREFCODE "
			+" FROM REGULATORYASSTBSCLCLTN WHERE REGULATORYASSTBSCLCLTN.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.period = set.getDate(2);
				anObject.originalValue = set.getBigDecimal(3);
				if(anObject.originalValue != null) {
					anObject.originalValue = anObject.originalValue.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.depreciation = set.getBigDecimal(4);
				if(anObject.depreciation != null) {
					anObject.depreciation = anObject.depreciation.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.residualValue = set.getBigDecimal(5);
				if(anObject.residualValue != null) {
					anObject.residualValue = anObject.residualValue.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.usefulLife = set.getInt(6);
				if (set.wasNull()) {
					anObject.usefulLife = Integer.MIN_VALUE;
				}
				anObject.writtenOffValue = set.getBigDecimal(7);
				if(anObject.writtenOffValue != null) {
					anObject.writtenOffValue = anObject.writtenOffValue.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.assetRef.code = set.getInt(8);
				if (set.wasNull()) {
					anObject.assetRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.RegulatoryAssetBaseCalculationRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.RegulatoryAssetBaseCalculationRef ref = new com.ksoe.energynet.valueobject.references.RegulatoryAssetBaseCalculationRef();
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

		selectStr = "DELETE FROM  REGULATORYASSTBSCLCLTN WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		RegulatoryAssetBaseCalculation object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%RegulatoryAssetBaseCalculation.getObject%} access denied");
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
	
	public long count(RegulatoryAssetBaseCalculationFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(RegulatoryAssetBaseCalculationFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, RegulatoryAssetBaseCalculationFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM REGULATORYASSTBSCLCLTN", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM REGULATORYASSTBSCLCLTN WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, RegulatoryAssetBaseCalculationFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, RegulatoryAssetBaseCalculationFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "REGULATORYASSTBSCLCLTN");
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
			"SELECT  REGULATORYASSTBSCLCLTN.CODE FROM  REGULATORYASSTBSCLCLTN WHERE  REGULATORYASSTBSCLCLTN.CODE = ?";
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
		_checkConditionToken(condition,"code","REGULATORYASSTBSCLCLTN.CODE");
		_checkConditionToken(condition,"period","REGULATORYASSTBSCLCLTN.PERIOD");
		_checkConditionToken(condition,"originalvalue","REGULATORYASSTBSCLCLTN.ORIGINALVALUE");
		_checkConditionToken(condition,"depreciation","REGULATORYASSTBSCLCLTN.DEPRECIATION");
		_checkConditionToken(condition,"residualvalue","REGULATORYASSTBSCLCLTN.RESIDUALVALUE");
		_checkConditionToken(condition,"usefullife","REGULATORYASSTBSCLCLTN.USEFULLIFE");
		_checkConditionToken(condition,"writtenoffvalue","REGULATORYASSTBSCLCLTN.WRITTENOFFVALUE");
		// relationship conditions
		_checkConditionToken(condition,"assetref","ASSETREFCODE");
		_checkConditionToken(condition,"assetref.code","ASSETREFCODE");
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
	
	private void _collectAutoIncrementFields(RegulatoryAssetBaseCalculation anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("REGULATORYASSTBSCLCLTN", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("REGULATORYASSTBSCLCLTN", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("REGULATORYASSTBSCLCLTN", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: REGULATORYASSTBSCLCLTN");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of RegulatoryAssetBaseCalculationDAO
