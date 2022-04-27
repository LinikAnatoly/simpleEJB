
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
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
import com.ksoe.energynet.valueobject.ENTCOValues;
import com.ksoe.energynet.valueobject.filter.ENTCOValuesFilter;
import com.ksoe.energynet.valueobject.brief.ENTCOValuesShort;
import com.ksoe.energynet.valueobject.lists.ENTCOValuesShortList;


/**
 * DAO Object for ENTCOValues;
 *
 */

public class ENTCOValuesDAOGen extends GenericDataMiner {

	public ENTCOValuesDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENTCOValuesDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENTCOValues inObject) throws PersistenceException {
		ENTCOValues obj = new ENTCOValues();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.description == null && obj.description == null){}
		else
			if(inObject.description == null || obj.description == null) return false;
			else
				if ( ! inObject.description.equals(obj.description)){
					return false;
				}
		if (inObject.techconditionsobjects.code != obj.techconditionsobjects.code){
			return false;
		}
		if (inObject.tcoValuesType.code != obj.tcoValuesType.code){
			return false;
		}
		return true;
	}

	public int add(ENTCOValues anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENTCOValues anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENTCOVALUES (CODE,DESCRIPTION,TECHCONDITIONSOBJCTSCD,TCOVALUESTYPECODE) VALUES (?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.description);
			if (anObject.techconditionsobjects.code != Integer.MIN_VALUE){
				statement.setInt(3,anObject.techconditionsobjects.code);
			} else {
				statement.setNull(3,java.sql.Types.INTEGER);
			}
			if (anObject.tcoValuesType.code != Integer.MIN_VALUE){
				statement.setInt(4,anObject.tcoValuesType.code);
			} else {
				statement.setNull(4,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENTCOValuesDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENTCOValues anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENTCOValues anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("DESCRIPTION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TECHCONDITIONSOBJECTS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TCOVALUESTYPE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENTCOVALUES SET  DESCRIPTION = ? , TECHCONDITIONSOBJCTSCD = ? , TCOVALUESTYPECODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENTCOVALUES SET ";
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
					statement.setString(1, anObject.description);
					if (anObject.techconditionsobjects.code != Integer.MIN_VALUE) {
						statement.setInt(2, anObject.techconditionsobjects.code);
					} else {
						statement.setNull(2, java.sql.Types.INTEGER);
					}
					if (anObject.tcoValuesType.code != Integer.MIN_VALUE) {
						statement.setInt(3, anObject.tcoValuesType.code);
					} else {
						statement.setNull(3, java.sql.Types.INTEGER);
					}
					statement.setInt(4, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("DESCRIPTION".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.description);
							continue;
						}
						if("TECHCONDITIONSOBJECTS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.techconditionsobjects.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.techconditionsobjects.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("TCOVALUESTYPE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.tcoValuesType.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.tcoValuesType.code);
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

	} // end of save(ENTCOValues anObject,String[] anAttributes)


	public ENTCOValuesShort getShortObject(int anObjectCode) throws PersistenceException {
		ENTCOValues filterObject = new ENTCOValues();
		Vector<ENTCOValuesShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENTCOValuesShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENTCOValues filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.description, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.techconditionsobjects.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.tcoValuesType.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENTCOValuesFilter filter) {
		String out = buildCondition((ENTCOValues)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENTCOValues filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENTCOValues.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.description, ENTCOValues.description_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.techconditionsobjects.code, ENTCOValues.techconditionsobjects_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.tcoValuesType.code, ENTCOValues.tcoValuesType_QFielld, out);
		}
		return out;
	}

	public ENTCOValuesShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENTCOValuesShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENTCOValuesShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENTCOValuesShortList getFilteredList(ENTCOValues filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENTCOValuesShortList getScrollableFilteredList(ENTCOValues aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENTCOValuesShortList getScrollableFilteredList(ENTCOValues aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENTCOValuesShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENTCOValuesShortList getScrollableFilteredList(ENTCOValuesFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENTCOValuesShortList getScrollableFilteredList(ENTCOValuesFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENTCOValuesShortList getScrollableFilteredList(ENTCOValues aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENTCOValuesShortList result = new ENTCOValuesShortList();
		ENTCOValuesShort anObject;
		result.list = new Vector<ENTCOValuesShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENTCOVALUES.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENTCOVALUES.CODE"+
			",ENTCOVALUES.DESCRIPTION"+
			", ENTECHCONDITIONSOBJCTS.CODE " +
			", ENTECHCONDITIONSOBJCTS.NUMBERGEN " +
			", ENTECHCONDITIONSOBJCTS.DATEGEN " +
			", ENTECHCONDITIONSOBJCTS.CUSTOMER " +
			", ENTECHCONDITIONSOBJCTS.BUILDING " +
			", ENTECHCONDITIONSOBJCTS.ADDRESS " +
			", ENTECHCONDITIONSOBJCTS.TYCURRENTPOWER " +
			", ENTECHCONDITIONSOBJCTS.TYSERVICESPOWER " +
			", ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPLACES " +
			", ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPLACSNM " +
			", ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPOINT " +
			", ENTECHCONDITIONSOBJCTS.CONNECTIONPOWERPOINTNM " +
			", ENTECHCONDITIONSOBJCTS.CONNECTIONSOURCE " +
			", ENTECHCONDITIONSOBJCTS.CONNECTIONSOURCENUM " +
			", ENTECHCONDITIONSOBJCTS.CAT1CURRENTPOWER " +
			", ENTECHCONDITIONSOBJCTS.CAT2CURRENTPOWER " +
			", ENTECHCONDITIONSOBJCTS.CAT3CURRENTPOWER " +
			", ENTECHCONDITIONSOBJCTS.CAT1SERVICESPOWER " +
			", ENTECHCONDITIONSOBJCTS.CAT2SERVICESPOWER " +
			", ENTECHCONDITIONSOBJCTS.CAT3SERVICESPOWER " +
			", ENTECHCONDITIONSOBJCTS.TYSERVICESPOWERWTRHTNG " +
			", ENTECHCONDITIONSOBJCTS.TYSERVICESPOWERHEATING " +
			", ENTECHCONDITIONSOBJCTS.TYSERVICESPOWERCOOKER " +
			", ENTECHCONDITIONSOBJCTS.POWERGENERATION " +
			", ENTECHCONDITIONSOBJCTS.YEARGEN " +
			", ENTECHCONDITIONSOBJCTS.PERFORMER " +
			", ENTECHCONDITIONSOBJCTS.PERFORMERPHONE " +
			", ENTECHCONDITIONSOBJCTS.USERGEN " +
			", ENTECHCONDITIONSOBJCTS.DATEEDIT " +
			", ENTCOVALUESTYPE.CODE " +
			", ENTCOVALUESTYPE.NAME " +
		" FROM ENTCOVALUES " +
			" LEFT JOIN ENTECHCONDITIONSOBJCTS on ENTECHCONDITIONSOBJCTS.CODE = ENTCOVALUES.TECHCONDITIONSOBJCTSCD "+
			" LEFT JOIN ENTCOVALUESTYPE on ENTCOVALUESTYPE.CODE = ENTCOVALUES.TCOVALUESTYPECODE "+
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
				anObject = new ENTCOValuesShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.description = set.getString(2);

				anObject.techconditionsobjectsCode = set.getInt(3);
				if(set.wasNull()) {
					anObject.techconditionsobjectsCode = Integer.MIN_VALUE;
				}
				anObject.techconditionsobjectsNumberGen = set.getString(4);
				anObject.techconditionsobjectsDateGen = set.getDate(5);
				anObject.techconditionsobjectsCustomer = set.getString(6);
				anObject.techconditionsobjectsBuilding = set.getString(7);
				anObject.techconditionsobjectsAddress = set.getString(8);
				anObject.techconditionsobjectsTyCurrentPower = set.getBigDecimal(9);
				if(anObject.techconditionsobjectsTyCurrentPower != null) {
					anObject.techconditionsobjectsTyCurrentPower = anObject.techconditionsobjectsTyCurrentPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.techconditionsobjectsTyServicesPower = set.getBigDecimal(10);
				if(anObject.techconditionsobjectsTyServicesPower != null) {
					anObject.techconditionsobjectsTyServicesPower = anObject.techconditionsobjectsTyServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.techconditionsobjectsConnectionPowerPlaces = set.getString(11);
				anObject.techconditionsobjectsConnectionPowerPlacesNum = set.getString(12);
				anObject.techconditionsobjectsConnectionPowerPoint = set.getString(13);
				anObject.techconditionsobjectsConnectionPowerPointNum = set.getString(14);
				anObject.techconditionsobjectsConnectionSource = set.getString(15);
				anObject.techconditionsobjectsConnectionSourceNum = set.getString(16);
				anObject.techconditionsobjectsCat1CurrentPower = set.getBigDecimal(17);
				if(anObject.techconditionsobjectsCat1CurrentPower != null) {
					anObject.techconditionsobjectsCat1CurrentPower = anObject.techconditionsobjectsCat1CurrentPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.techconditionsobjectsCat2CurrentPower = set.getBigDecimal(18);
				if(anObject.techconditionsobjectsCat2CurrentPower != null) {
					anObject.techconditionsobjectsCat2CurrentPower = anObject.techconditionsobjectsCat2CurrentPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.techconditionsobjectsCat3CurrentPower = set.getBigDecimal(19);
				if(anObject.techconditionsobjectsCat3CurrentPower != null) {
					anObject.techconditionsobjectsCat3CurrentPower = anObject.techconditionsobjectsCat3CurrentPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.techconditionsobjectsCat1ServicesPower = set.getBigDecimal(20);
				if(anObject.techconditionsobjectsCat1ServicesPower != null) {
					anObject.techconditionsobjectsCat1ServicesPower = anObject.techconditionsobjectsCat1ServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.techconditionsobjectsCat2ServicesPower = set.getBigDecimal(21);
				if(anObject.techconditionsobjectsCat2ServicesPower != null) {
					anObject.techconditionsobjectsCat2ServicesPower = anObject.techconditionsobjectsCat2ServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.techconditionsobjectsCat3ServicesPower = set.getBigDecimal(22);
				if(anObject.techconditionsobjectsCat3ServicesPower != null) {
					anObject.techconditionsobjectsCat3ServicesPower = anObject.techconditionsobjectsCat3ServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.techconditionsobjectsTyServicesPowerWaterHeating = set.getBigDecimal(23);
				if(anObject.techconditionsobjectsTyServicesPowerWaterHeating != null) {
					anObject.techconditionsobjectsTyServicesPowerWaterHeating = anObject.techconditionsobjectsTyServicesPowerWaterHeating.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.techconditionsobjectsTyServicesPowerHeating = set.getBigDecimal(24);
				if(anObject.techconditionsobjectsTyServicesPowerHeating != null) {
					anObject.techconditionsobjectsTyServicesPowerHeating = anObject.techconditionsobjectsTyServicesPowerHeating.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.techconditionsobjectsTyServicesPowerCooker = set.getBigDecimal(25);
				if(anObject.techconditionsobjectsTyServicesPowerCooker != null) {
					anObject.techconditionsobjectsTyServicesPowerCooker = anObject.techconditionsobjectsTyServicesPowerCooker.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.techconditionsobjectsPowerGeneration = set.getBigDecimal(26);
				if(anObject.techconditionsobjectsPowerGeneration != null) {
					anObject.techconditionsobjectsPowerGeneration = anObject.techconditionsobjectsPowerGeneration.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.techconditionsobjectsYearGen = set.getInt(27);
				if(set.wasNull()) {
					anObject.techconditionsobjectsYearGen = Integer.MIN_VALUE;
				}
				anObject.techconditionsobjectsPerformer = set.getString(28);
				anObject.techconditionsobjectsPerformerPhone = set.getString(29);
				anObject.techconditionsobjectsUserGen = set.getString(30);
				anObject.techconditionsobjectsDateEdit = set.getDate(31);
				anObject.tcoValuesTypeCode = set.getInt(32);
				if(set.wasNull()) {
					anObject.tcoValuesTypeCode = Integer.MIN_VALUE;
				}
				anObject.tcoValuesTypeName = set.getString(33);

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
	
	public int[] getFilteredCodeArray(ENTCOValuesFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENTCOValuesFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENTCOValues aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENTCOVALUES.CODE FROM ENTCOVALUES";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENTCOVALUES.CODE";
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


	public ENTCOValues getObject(int uid) throws PersistenceException {
		ENTCOValues result = new ENTCOValues();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENTCOValues anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENTCOVALUES.CODE, ENTCOVALUES.DESCRIPTION, ENTCOVALUES.TECHCONDITIONSOBJCTSCD, ENTCOVALUES.TCOVALUESTYPECODE "
			+" FROM ENTCOVALUES WHERE ENTCOVALUES.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.description = set.getString(2);
				anObject.techconditionsobjects.code = set.getInt(3);
				if (set.wasNull()) {
					anObject.techconditionsobjects.code = Integer.MIN_VALUE;
				}
				anObject.tcoValuesType.code = set.getInt(4);
				if (set.wasNull()) {
					anObject.tcoValuesType.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENTCOValuesRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENTCOValuesRef ref = new com.ksoe.energynet.valueobject.references.ENTCOValuesRef();
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

		selectStr = "DELETE FROM  ENTCOVALUES WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENTCOValues object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENTCOValues.getObject%} access denied");
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
	
	public long count(ENTCOValuesFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENTCOValuesFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENTCOValuesFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENTCOVALUES", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENTCOVALUES WHERE code = ?", propertyName);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENTCOValuesFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENTCOVALUES");
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
			"SELECT  ENTCOVALUES.CODE FROM  ENTCOVALUES WHERE  ENTCOVALUES.CODE = ?";
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
		_checkConditionToken(condition,"code","ENTCOVALUES.CODE");
		_checkConditionToken(condition,"description","ENTCOVALUES.DESCRIPTION");
		// relationship conditions
		_checkConditionToken(condition,"techconditionsobjects","TECHCONDITIONSOBJCTSCD");
		_checkConditionToken(condition,"techconditionsobjects.code","TECHCONDITIONSOBJCTSCD");
		_checkConditionToken(condition,"tcovaluestype","TCOVALUESTYPECODE");
		_checkConditionToken(condition,"tcovaluestype.code","TCOVALUESTYPECODE");
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
	
	private void _collectAutoIncrementFields(ENTCOValues anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENTCOVALUES", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENTCOVALUES", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENTCOVALUES", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENTCOVALUES");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENTCOValuesDAO
