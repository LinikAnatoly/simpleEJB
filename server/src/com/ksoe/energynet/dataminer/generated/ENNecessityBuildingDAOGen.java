
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
import com.ksoe.energynet.valueobject.ENNecessityBuilding;
import com.ksoe.energynet.valueobject.brief.ENNecessityBuildingShort;
import com.ksoe.energynet.valueobject.filter.ENNecessityBuildingFilter;
import com.ksoe.energynet.valueobject.lists.ENNecessityBuildingShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENNecessityBuilding;
 *
 */

public class ENNecessityBuildingDAOGen extends GenericDataMiner {

	public ENNecessityBuildingDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENNecessityBuildingDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENNecessityBuilding inObject) throws PersistenceException {
		ENNecessityBuilding obj = new ENNecessityBuilding();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.countGen == null && obj.countGen == null){}
		else
			if(inObject.countGen == null || obj.countGen == null) return false;
			else
				if ( ! inObject.countGen.equals(obj.countGen)){
					return false;
				}

		if(inObject.summaGen == null && obj.summaGen == null){}
		else
			if(inObject.summaGen == null || obj.summaGen == null) return false;
			else
				if ( ! inObject.summaGen.equals(obj.summaGen)){
					return false;
				}

		if(inObject.description == null && obj.description == null){}
		else
			if(inObject.description == null || obj.description == null) return false;
			else
				if ( ! inObject.description.equals(obj.description)){
					return false;
				}

		if(inObject.dateEdit == null && obj.dateEdit == null){} else
			if(inObject.dateEdit == null || obj.dateEdit == null) return false;
			else
				if (inObject.dateEdit.compareTo(obj.dateEdit) != 0){
					return false;
				}

		if(inObject.userGen == null && obj.userGen == null){}
		else
			if(inObject.userGen == null || obj.userGen == null) return false;
			else
				if ( ! inObject.userGen.equals(obj.userGen)){
					return false;
				}
		if (inObject.elementTypeRef.code != obj.elementTypeRef.code){
			return false;
		}
		if (inObject.voltageNominal.code != obj.voltageNominal.code){
			return false;
		}
		if (inObject.servicesObjectRef.code != obj.servicesObjectRef.code){
			return false;
		}
		return true;
	}

	public int add(ENNecessityBuilding anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENNecessityBuilding anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENNECESSITYBUILDING (CODE,COUNTGEN,SUMMAGEN,DESCRIPTION,DATEEDIT,USERGEN,ELEMENTTYPEREFCODE,VOLTAGENOMINALCODE,SERVICESOBJECTREFCODE) VALUES (?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.countGen != null) {
				anObject.countGen = anObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(2,anObject.countGen);
			if (anObject.summaGen != null) {
				anObject.summaGen = anObject.summaGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(3,anObject.summaGen);
			statement.setString(4,anObject.description);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(5,null);
			} else {
				statement.setTimestamp(5,new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			statement.setString(6,anObject.userGen);
			if (anObject.elementTypeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENElementTypeDAOGen(connection,getUserProfile()).exists(anObject.elementTypeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENNecessityBuilding.elementTypeRef.code%} = {%"+anObject.elementTypeRef.code+"%}");
				}
				statement.setInt(7,anObject.elementTypeRef.code);
			} else {
				statement.setNull(7,java.sql.Types.INTEGER);
			}
			if (anObject.voltageNominal.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energypro.dataminer.generated.EPVoltageNominalDAOGen(connection,getUserProfile()).exists(anObject.voltageNominal.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energypro.valueobject.ENNecessityBuilding.voltageNominal.code%} = {%"+anObject.voltageNominal.code+"%}");
				}
				statement.setInt(8,anObject.voltageNominal.code);
			} else {
				statement.setNull(8,java.sql.Types.INTEGER);
			}
			if (anObject.servicesObjectRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).exists(anObject.servicesObjectRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENNecessityBuilding.servicesObjectRef.code%} = {%"+anObject.servicesObjectRef.code+"%}");
				}
				statement.setInt(9,anObject.servicesObjectRef.code);
			} else {
				statement.setNull(9,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENNecessityBuildingDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENNecessityBuilding anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENNecessityBuilding anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("COUNTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SUMMAGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DESCRIPTION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEEDIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USERGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ELEMENTTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("VOLTAGENOMINAL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SERVICESOBJECTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENNECESSITYBUILDING SET  COUNTGEN = ? , SUMMAGEN = ? , DESCRIPTION = ? , DATEEDIT = ? , USERGEN = ? , ELEMENTTYPEREFCODE = ? , VOLTAGENOMINALCODE = ? , SERVICESOBJECTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENNECESSITYBUILDING SET ";
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
					if (anObject.countGen != null) {
						anObject.countGen = anObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(1,anObject.countGen);
					if (anObject.summaGen != null) {
						anObject.summaGen = anObject.summaGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(2,anObject.summaGen);
					statement.setString(3,anObject.description);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(4,null);
					} else {
						statement.setTimestamp(4,new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					statement.setString(5,anObject.userGen);
					if (anObject.elementTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(6,anObject.elementTypeRef.code);
					} else {
						statement.setNull(6,java.sql.Types.INTEGER);
					}
					if (anObject.voltageNominal.code != Integer.MIN_VALUE) {
						statement.setInt(7,anObject.voltageNominal.code);
					} else {
						statement.setNull(7,java.sql.Types.INTEGER);
					}
					if (anObject.servicesObjectRef.code != Integer.MIN_VALUE) {
						statement.setInt(8,anObject.servicesObjectRef.code);
					} else {
						statement.setNull(8,java.sql.Types.INTEGER);
					}
					statement.setInt(9,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("COUNTGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.countGen != null) {
								anObject.countGen = anObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.countGen);
							continue;
						}
						if("SUMMAGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.summaGen != null) {
								anObject.summaGen = anObject.summaGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.summaGen);
							continue;
						}
						if("DESCRIPTION".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.description);
							continue;
						}
						if("DATEEDIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateEdit == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateEdit.getTime()));
							}
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.userGen);
							continue;
						}
						if("ELEMENTTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.elementTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.elementTypeRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("VOLTAGENOMINAL".compareTo((String)fields.get(i)) == 0) {
							if (anObject.voltageNominal.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.voltageNominal.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("SERVICESOBJECTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.servicesObjectRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.servicesObjectRef.code);
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

	} // end of save(ENNecessityBuilding anObject,String[] anAttributes)


	public ENNecessityBuildingShort getShortObject(int anObjectCode) throws PersistenceException {
		ENNecessityBuilding filterObject = new ENNecessityBuilding();
		Vector<ENNecessityBuildingShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENNecessityBuildingShort)list.get(0);
		}
		return null;
	}

	public int setParameters(ENNecessityBuilding filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.countGen, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.summaGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.description, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.elementTypeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.voltageNominal.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.servicesObjectRef.code, index, statement);
			index--;
		}
		return index;
	}

	public String buildCondition(ENNecessityBuildingFilter filter) {
		String out = buildCondition((ENNecessityBuilding)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENNecessityBuilding filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENNecessityBuilding.code_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.countGen, ENNecessityBuilding.countGen_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.summaGen, ENNecessityBuilding.summaGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.description, ENNecessityBuilding.description_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENNecessityBuilding.dateEdit_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENNecessityBuilding.userGen_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.elementTypeRef.code, ENNecessityBuilding.elementTypeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.voltageNominal.code, ENNecessityBuilding.voltageNominal_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.servicesObjectRef.code, ENNecessityBuilding.servicesObjectRef_QFielld, out);
		}
		return out;
	}

	public ENNecessityBuildingShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENNecessityBuildingShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENNecessityBuildingShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENNecessityBuildingShortList getFilteredList(ENNecessityBuilding filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENNecessityBuildingShortList getScrollableFilteredList(ENNecessityBuilding aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENNecessityBuildingShortList getScrollableFilteredList(ENNecessityBuilding aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENNecessityBuildingShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENNecessityBuildingShortList getScrollableFilteredList(ENNecessityBuildingFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}

	public ENNecessityBuildingShortList getScrollableFilteredList(ENNecessityBuildingFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}

	public ENNecessityBuildingShortList getScrollableFilteredList(ENNecessityBuilding aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENNecessityBuildingShortList result = new ENNecessityBuildingShortList();
		ENNecessityBuildingShort anObject;
		result.list = new Vector<ENNecessityBuildingShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENNECESSITYBUILDING.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENNECESSITYBUILDING.CODE"+
			",ENNECESSITYBUILDING.COUNTGEN"+
			",ENNECESSITYBUILDING.SUMMAGEN"+
			",ENNECESSITYBUILDING.DESCRIPTION"+
			",ENNECESSITYBUILDING.DATEEDIT"+
			",ENNECESSITYBUILDING.USERGEN"+
			", ENELEMENTTYPE.CODE " +
			", ENELEMENTTYPE.NAME " +
			", EPVOLTAGENOMINAL.CODE " +
			", EPVOLTAGENOMINAL.VALUE " +
			", ENSERVICESOBJECT.CODE " +

		" FROM ENNECESSITYBUILDING " +
			", ENELEMENTTYPE " +
			", EPVOLTAGENOMINAL " +
			", ENSERVICESOBJECT " +
		"";
		whereStr = " ENELEMENTTYPE.CODE = ENNECESSITYBUILDING.ELEMENTTYPEREFCODE" ; //+
		whereStr += " AND EPVOLTAGENOMINAL.CODE = ENNECESSITYBUILDING.VOLTAGENOMINALCODE" ; //+
		whereStr += " AND ENSERVICESOBJECT.CODE = ENNECESSITYBUILDING.SERVICESOBJECTREFCODE" ; //+


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
				anObject = new ENNecessityBuildingShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.countGen = set.getBigDecimal(2);
				if(anObject.countGen != null) {
					anObject.countGen = anObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.summaGen = set.getBigDecimal(3);
				if(anObject.summaGen != null) {
					anObject.summaGen = anObject.summaGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.description = set.getString(4);
				anObject.dateEdit = set.getTimestamp(5);
				anObject.userGen = set.getString(6);

				anObject.elementTypeRefCode = set.getInt(7);
				if(set.wasNull()) {
					anObject.elementTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.elementTypeRefName = set.getString(8);
				anObject.voltageNominalCode = set.getInt(9);
				if(set.wasNull()) {
					anObject.voltageNominalCode = Integer.MIN_VALUE;
				}
				anObject.voltageNominalValue = set.getString(10);
				anObject.servicesObjectRefCode = set.getInt(11);
				if(set.wasNull()) {
					anObject.servicesObjectRefCode = Integer.MIN_VALUE;
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

	public int[] getFilteredCodeArray(ENNecessityBuildingFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENNecessityBuildingFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENNecessityBuilding aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENNECESSITYBUILDING.CODE FROM ENNECESSITYBUILDING";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENNECESSITYBUILDING.CODE";
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


	public ENNecessityBuilding getObject(int uid) throws PersistenceException {
		ENNecessityBuilding result = new ENNecessityBuilding();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENNecessityBuilding anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENNECESSITYBUILDING.CODE, ENNECESSITYBUILDING.COUNTGEN, ENNECESSITYBUILDING.SUMMAGEN, ENNECESSITYBUILDING.DESCRIPTION, ENNECESSITYBUILDING.DATEEDIT, ENNECESSITYBUILDING.USERGEN, ENNECESSITYBUILDING.ELEMENTTYPEREFCODE, ENNECESSITYBUILDING.VOLTAGENOMINALCODE, ENNECESSITYBUILDING.SERVICESOBJECTREFCODE "
			+" FROM ENNECESSITYBUILDING WHERE ENNECESSITYBUILDING.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);

				anObject.countGen = set.getBigDecimal(2);
				if(anObject.countGen != null) {
					anObject.countGen = anObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.summaGen = set.getBigDecimal(3);
				if(anObject.summaGen != null) {
					anObject.summaGen = anObject.summaGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.description = set.getString(4);
				anObject.dateEdit = set.getTimestamp(5);
				anObject.userGen = set.getString(6);
				anObject.elementTypeRef.code = set.getInt(7);
				if (set.wasNull()) {
					anObject.elementTypeRef.code = Integer.MIN_VALUE;
				}
				anObject.voltageNominal.code = set.getInt(8);
				if (set.wasNull()) {
					anObject.voltageNominal.code = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRef.code = set.getInt(9);
				if (set.wasNull()) {
					anObject.servicesObjectRef.code = Integer.MIN_VALUE;
				}
				if(anObject.elementTypeRef.code != Integer.MIN_VALUE) {
					anObject.setElementTypeRef(
						new com.ksoe.energynet.dataminer.generated.ENElementTypeDAOGen(connection,getUserProfile()).getRef(anObject.elementTypeRef.code));
				}
				if(anObject.voltageNominal.code != Integer.MIN_VALUE) {
					anObject.setVoltageNominal(
						new com.ksoe.energypro.dataminer.generated.EPVoltageNominalDAOGen(connection,getUserProfile()).getObject(anObject.voltageNominal.code));
				}
				if(anObject.servicesObjectRef.code != Integer.MIN_VALUE) {
					anObject.setServicesObjectRef(
						new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).getRef(anObject.servicesObjectRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENNecessityBuildingRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENNecessityBuildingRef ref = new com.ksoe.energynet.valueobject.references.ENNecessityBuildingRef();
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

		selectStr = "DELETE FROM  ENNECESSITYBUILDING WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENNecessityBuilding object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENNecessityBuilding.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENNecessityBuilding.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENNecessityBuilding.remove%} access denied");
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

	public long count(ENNecessityBuildingFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENNecessityBuildingFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}

	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENNecessityBuildingFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENNECESSITYBUILDING", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENNecessityBuildingFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENNECESSITYBUILDING");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENNecessityBuilding.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENNecessityBuilding.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENNECESSITYBUILDING.CODE FROM  ENNECESSITYBUILDING WHERE  ENNECESSITYBUILDING.CODE = ?";
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
		_checkConditionToken(condition,"code","ENNECESSITYBUILDING.CODE");
		_checkConditionToken(condition,"countgen","ENNECESSITYBUILDING.COUNTGEN");
		_checkConditionToken(condition,"summagen","ENNECESSITYBUILDING.SUMMAGEN");
		_checkConditionToken(condition,"description","ENNECESSITYBUILDING.DESCRIPTION");
		_checkConditionToken(condition,"dateedit","ENNECESSITYBUILDING.DATEEDIT");
		_checkConditionToken(condition,"usergen","ENNECESSITYBUILDING.USERGEN");
		// relationship conditions
		_checkConditionToken(condition,"elementtyperef","ELEMENTTYPEREFCODE");
		_checkConditionToken(condition,"elementtyperef.code","ELEMENTTYPEREFCODE");
		_checkConditionToken(condition,"voltagenominal","VOLTAGENOMINALCODE");
		_checkConditionToken(condition,"voltagenominal.code","VOLTAGENOMINALCODE");
		_checkConditionToken(condition,"servicesobjectref","SERVICESOBJECTREFCODE");
		_checkConditionToken(condition,"servicesobjectref.code","SERVICESOBJECTREFCODE");
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

	private void _collectAutoIncrementFields(ENNecessityBuilding anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENNECESSITYBUILDING", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENNECESSITYBUILDING", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENNECESSITYBUILDING", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENNECESSITYBUILDING");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENNecessityBuildingDAO
