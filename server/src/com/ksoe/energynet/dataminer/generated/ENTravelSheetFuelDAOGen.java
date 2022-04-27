
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2022 SIT
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
import com.ksoe.energynet.valueobject.ENTravelSheetFuel;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetFuelFilter;
import com.ksoe.energynet.valueobject.brief.ENTravelSheetFuelShort;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetFuelShortList;


/**
 * DAO Object for ENTravelSheetFuel;
 *
 */

public class ENTravelSheetFuelDAOGen extends GenericDataMiner {

	public ENTravelSheetFuelDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENTravelSheetFuelDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENTravelSheetFuel inObject) throws PersistenceException {
		ENTravelSheetFuel obj = new ENTravelSheetFuel();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.countGen == null && obj.countGen == null){}
		else
			if(inObject.countGen == null || obj.countGen == null) return false;
			else
				if ( ! inObject.countGen.equals(obj.countGen)){
					return false;
				}

		if(inObject.series == null && obj.series == null){}
		else
			if(inObject.series == null || obj.series == null) return false;
			else
				if ( ! inObject.series.equals(obj.series)){
					return false;
				}

		if(inObject.numbers == null && obj.numbers == null){}
		else
			if(inObject.numbers == null || obj.numbers == null) return false;
			else
				if ( ! inObject.numbers.equals(obj.numbers)){
					return false;
				}

		if(inObject.dateGen == null && obj.dateGen == null){} else 
			if(inObject.dateGen == null || obj.dateGen == null) return false;
			else
				if (inObject.dateGen.compareTo(obj.dateGen) != 0){
					return false;
				}

		if (inObject.isVRTU != obj.isVRTU){
					return false;
				}

		if(inObject.isThirdParty == null && obj.isThirdParty == null){} else 
			if(inObject.isThirdParty == null || obj.isThirdParty == null) return false;
			else
				if (inObject.isThirdParty.compareTo(obj.isThirdParty) != 0){
					return false;
				}
		if (inObject.travelSheetRef.code != obj.travelSheetRef.code){
			return false;
		}
		if (inObject.realTransport.code != obj.realTransport.code){
			return false;
		}
		if (inObject.fuelType.code != obj.fuelType.code){
			return false;
		}
		if (inObject.travelSheetFuelTypeRef.code != obj.travelSheetFuelTypeRef.code){
			return false;
		}
		return true;
	}

	public int add(ENTravelSheetFuel anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENTravelSheetFuel anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENTRAVELSHEETFUEL (CODE,COUNTGEN,SERIES,NUMBERS,DATEGEN,ISVRTU,ISTHIRDPARTY,MODIFY_TIME,TRAVELSHEETREFCODE,REALTRANSPORTCODE,FUELTYPECODE,TRAVELSHEETFUELTYPRFCD) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			if (anObject.countGen != null) {
				anObject.countGen = anObject.countGen.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(2, anObject.countGen);
			statement.setString(3, anObject.series);
			statement.setString(4, anObject.numbers);
			if (anObject.dateGen == null) {
				statement.setDate(5, null);
			} else {
				statement.setDate(5, new java.sql.Date(anObject.dateGen.getTime()));
			}
			if (anObject.isVRTU != Integer.MIN_VALUE ) {
				statement.setInt(6, anObject.isVRTU);
			} else {
				statement.setNull(6, java.sql.Types.INTEGER);
			}
			if (anObject.isThirdParty != null) {
				statement.setBoolean(7, anObject.isThirdParty);
			} else {
				statement.setNull(7, java.sql.Types.BOOLEAN);
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(8, null);
			} else {
				statement.setBigDecimal(8, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.travelSheetRef.code != Integer.MIN_VALUE){
				statement.setInt(9,anObject.travelSheetRef.code);
			} else {
				statement.setNull(9,java.sql.Types.INTEGER);
			}
			if (anObject.realTransport.code != Integer.MIN_VALUE){
				statement.setInt(10,anObject.realTransport.code);
			} else {
				statement.setNull(10,java.sql.Types.INTEGER);
			}
			if (anObject.fuelType.code != Integer.MIN_VALUE){
				statement.setInt(11,anObject.fuelType.code);
			} else {
				statement.setNull(11,java.sql.Types.INTEGER);
			}
			if (anObject.travelSheetFuelTypeRef.code != Integer.MIN_VALUE){
				statement.setInt(12,anObject.travelSheetFuelTypeRef.code);
			} else {
				statement.setNull(12,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENTravelSheetFuelDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENTravelSheetFuel anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENTravelSheetFuel anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENTravelSheetFuel oldObject = new ENTravelSheetFuel();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENTravelSheetFuel.modify_time_Field+" FROM  ENTRAVELSHEETFUEL WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("COUNTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SERIES") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NUMBERS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ISVRTU") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ISTHIRDPARTY") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TRAVELSHEETREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("REALTRANSPORT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FUELTYPE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TRAVELSHEETFUELTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENTRAVELSHEETFUEL SET  COUNTGEN = ? , SERIES = ? , NUMBERS = ? , DATEGEN = ? , ISVRTU = ? , ISTHIRDPARTY = ? , MODIFY_TIME = ? , TRAVELSHEETREFCODE = ? , REALTRANSPORTCODE = ? , FUELTYPECODE = ? , TRAVELSHEETFUELTYPRFCD = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENTRAVELSHEETFUEL SET ";
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
					if (anObject.countGen != null) {
						anObject.countGen = anObject.countGen.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(1, anObject.countGen);
					statement.setString(2, anObject.series);
					statement.setString(3, anObject.numbers);
					if (anObject.dateGen == null) {
						statement.setDate(4, null);
					} else {
						statement.setDate(4, new java.sql.Date(anObject.dateGen.getTime()));
					}
					if (anObject.isVRTU != Integer.MIN_VALUE) {
						statement.setInt(5, anObject.isVRTU);
					} else {
						statement.setNull(5, java.sql.Types.INTEGER);
					}
					if (anObject.isThirdParty == null) {
						statement.setNull(6, java.sql.Types.BOOLEAN);
					} else {
						statement.setBoolean(6, anObject.isThirdParty);
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(7, null);
					} else {
						statement.setBigDecimal(7, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.travelSheetRef.code != Integer.MIN_VALUE) {
						statement.setInt(8, anObject.travelSheetRef.code);
					} else {
						statement.setNull(8, java.sql.Types.INTEGER);
					}
					if (anObject.realTransport.code != Integer.MIN_VALUE) {
						statement.setInt(9, anObject.realTransport.code);
					} else {
						statement.setNull(9, java.sql.Types.INTEGER);
					}
					if (anObject.fuelType.code != Integer.MIN_VALUE) {
						statement.setInt(10, anObject.fuelType.code);
					} else {
						statement.setNull(10, java.sql.Types.INTEGER);
					}
					if (anObject.travelSheetFuelTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(11, anObject.travelSheetFuelTypeRef.code);
					} else {
						statement.setNull(11, java.sql.Types.INTEGER);
					}
					statement.setInt(12, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("COUNTGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.countGen != null) {
								anObject.countGen = anObject.countGen.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.countGen);
							continue;
						}
						if("SERIES".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.series);
							continue;
						}
						if("NUMBERS".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.numbers);
							continue;
						}
						if("DATEGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateGen == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateGen.getTime()));
							}
							continue;
						}
						if("ISVRTU".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.isVRTU);
							continue;
						}
						if("ISTHIRDPARTY".compareTo((String)fields.get(i)) == 0) {
								statement.setBoolean(i+1, anObject.isThirdParty);
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
						if("TRAVELSHEETREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.travelSheetRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.travelSheetRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("REALTRANSPORT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.realTransport.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.realTransport.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("FUELTYPE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.fuelType.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.fuelType.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("TRAVELSHEETFUELTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.travelSheetFuelTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.travelSheetFuelTypeRef.code);
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

	} // end of save(ENTravelSheetFuel anObject,String[] anAttributes)


	public ENTravelSheetFuelShort getShortObject(int anObjectCode) throws PersistenceException {
		ENTravelSheetFuel filterObject = new ENTravelSheetFuel();
		Vector<ENTravelSheetFuelShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENTravelSheetFuelShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENTravelSheetFuel filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.countGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.series, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.numbers, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateGen, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.isVRTU, index, statement);
			index = BaseDAOUtils.setBooleanParameter(filter.isThirdParty, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.travelSheetRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.realTransport.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.fuelType.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.travelSheetFuelTypeRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENTravelSheetFuelFilter filter) {
		String out = buildCondition((ENTravelSheetFuel)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENTravelSheetFuel filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENTravelSheetFuel.code_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.countGen, ENTravelSheetFuel.countGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.series, ENTravelSheetFuel.series_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.numbers, ENTravelSheetFuel.numbers_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateGen, ENTravelSheetFuel.dateGen_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.isVRTU, ENTravelSheetFuel.isVRTU_QFielld, out);
			out = BaseDAOUtils.addBooleanToCondition(filter.isThirdParty, ENTravelSheetFuel.isThirdParty_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENTravelSheetFuel.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.travelSheetRef.code, ENTravelSheetFuel.travelSheetRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.realTransport.code, ENTravelSheetFuel.realTransport_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.fuelType.code, ENTravelSheetFuel.fuelType_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.travelSheetFuelTypeRef.code, ENTravelSheetFuel.travelSheetFuelTypeRef_QFielld, out);
		}
		return out;
	}

	public ENTravelSheetFuelShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENTravelSheetFuelShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENTravelSheetFuelShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENTravelSheetFuelShortList getFilteredList(ENTravelSheetFuel filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENTravelSheetFuelShortList getScrollableFilteredList(ENTravelSheetFuel aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENTravelSheetFuelShortList getScrollableFilteredList(ENTravelSheetFuel aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENTravelSheetFuelShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENTravelSheetFuelShortList getScrollableFilteredList(ENTravelSheetFuelFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENTravelSheetFuelShortList getScrollableFilteredList(ENTravelSheetFuelFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENTravelSheetFuelShortList getScrollableFilteredList(ENTravelSheetFuel aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENTravelSheetFuelShortList result = new ENTravelSheetFuelShortList();
		ENTravelSheetFuelShort anObject;
		result.list = new Vector<ENTravelSheetFuelShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENTRAVELSHEETFUEL.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENTRAVELSHEETFUEL.CODE"+
			",ENTRAVELSHEETFUEL.COUNTGEN"+
			",ENTRAVELSHEETFUEL.SERIES"+
			",ENTRAVELSHEETFUEL.NUMBERS"+
			",ENTRAVELSHEETFUEL.DATEGEN"+
			",ENTRAVELSHEETFUEL.ISVRTU"+
			",ENTRAVELSHEETFUEL.ISTHIRDPARTY"+
			", ENTRAVELSHEET.CODE " +
			", ENTRAVELSHEET.NUMBERGEN " +
			", ENTRAVELSHEET.DATESTART " +
			", ENTRAVELSHEET.DATEFINAL " +
			", ENTRAVELSHEET.SPEEDOMETERSTART " +
			", ENTRAVELSHEET.SPEEDOMETERFINAL " +
			", ENTRAVELSHEET.FUELCOUNTERSTART " +
			", ENTRAVELSHEET.FUELCOUNTERFINAL " +
			", ENTRAVELSHEET.TIMESTART " +
			", ENTRAVELSHEET.TIMEFINAL " +
			", ENTRAVELSHEET.DATEEDIT " +
			", ENTRAVELSHEET.USERGEN " +
			", TKTRANSPORTREAL.CODE " +
			", TKTRANSPORTREAL.NAME " +
			", TKTRANSPORTREAL.INVNUMBER " +
			", TKTRANSPORTREAL.GOSNUMBER " +
			", TKFUELTYPE.CODE " +
			", TKFUELTYPE.NAME " +
			", ENTRAVELSHEETFUELTYPE.CODE " +
			", ENTRAVELSHEETFUELTYPE.NAME " +
		" FROM ENTRAVELSHEETFUEL " +
			" LEFT JOIN ENTRAVELSHEET on ENTRAVELSHEET.CODE = ENTRAVELSHEETFUEL.TRAVELSHEETREFCODE "+
			" LEFT JOIN TKTRANSPORTREAL on TKTRANSPORTREAL.CODE = ENTRAVELSHEETFUEL.REALTRANSPORTCODE "+
			" LEFT JOIN TKFUELTYPE on TKFUELTYPE.CODE = ENTRAVELSHEETFUEL.FUELTYPECODE "+
			" LEFT JOIN ENTRAVELSHEETFUELTYPE on ENTRAVELSHEETFUELTYPE.CODE = ENTRAVELSHEETFUEL.TRAVELSHEETFUELTYPRFCD "+
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
				anObject = new ENTravelSheetFuelShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.countGen = set.getBigDecimal(2);
				if(anObject.countGen != null) {
					anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.series = set.getString(3);
				anObject.numbers = set.getString(4);
				anObject.dateGen = set.getDate(5);
				anObject.isVRTU = set.getInt(6);
				if ( set.wasNull() ) {
					anObject.isVRTU = Integer.MIN_VALUE;
				}
				anObject.isThirdParty = set.getBoolean(7);
				if ( set.wasNull() ) {
					anObject.isThirdParty = null;
				}

				anObject.travelSheetRefCode = set.getInt(8);
				if(set.wasNull()) {
					anObject.travelSheetRefCode = Integer.MIN_VALUE;
				}
				anObject.travelSheetRefNumberGen = set.getString(9);
				anObject.travelSheetRefDateStart = set.getDate(10);
				anObject.travelSheetRefDateFinal = set.getDate(11);
				anObject.travelSheetRefSpeedometerStart = set.getBigDecimal(12);
				if(anObject.travelSheetRefSpeedometerStart != null) {
					anObject.travelSheetRefSpeedometerStart = anObject.travelSheetRefSpeedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.travelSheetRefSpeedometerFinal = set.getBigDecimal(13);
				if(anObject.travelSheetRefSpeedometerFinal != null) {
					anObject.travelSheetRefSpeedometerFinal = anObject.travelSheetRefSpeedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.travelSheetRefFuelCounterStart = set.getBigDecimal(14);
				if(anObject.travelSheetRefFuelCounterStart != null) {
					anObject.travelSheetRefFuelCounterStart = anObject.travelSheetRefFuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.travelSheetRefFuelCounterFinal = set.getBigDecimal(15);
				if(anObject.travelSheetRefFuelCounterFinal != null) {
					anObject.travelSheetRefFuelCounterFinal = anObject.travelSheetRefFuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.travelSheetRefTimeStart = set.getTimestamp(16);
				anObject.travelSheetRefTimeFinal = set.getTimestamp(17);
				anObject.travelSheetRefDateEdit = set.getTimestamp(18);
				anObject.travelSheetRefUserGen = set.getString(19);
				anObject.realTransportCode = set.getInt(20);
				if(set.wasNull()) {
					anObject.realTransportCode = Integer.MIN_VALUE;
				}
				anObject.realTransportName = set.getString(21);
				anObject.realTransportInvNumber = set.getString(22);
				anObject.realTransportGosNumber = set.getString(23);
				anObject.fuelTypeCode = set.getInt(24);
				if(set.wasNull()) {
					anObject.fuelTypeCode = Integer.MIN_VALUE;
				}
				anObject.fuelTypeName = set.getString(25);
				anObject.travelSheetFuelTypeRefCode = set.getInt(26);
				if(set.wasNull()) {
					anObject.travelSheetFuelTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.travelSheetFuelTypeRefName = set.getString(27);

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
	
	public int[] getFilteredCodeArray(ENTravelSheetFuelFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENTravelSheetFuelFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENTravelSheetFuel aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENTRAVELSHEETFUEL.CODE FROM ENTRAVELSHEETFUEL";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENTRAVELSHEETFUEL.CODE";
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


	public ENTravelSheetFuel getObject(int uid) throws PersistenceException {
		ENTravelSheetFuel result = new ENTravelSheetFuel();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENTravelSheetFuel anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENTRAVELSHEETFUEL.CODE, ENTRAVELSHEETFUEL.COUNTGEN, ENTRAVELSHEETFUEL.SERIES, ENTRAVELSHEETFUEL.NUMBERS, ENTRAVELSHEETFUEL.DATEGEN, ENTRAVELSHEETFUEL.ISVRTU, ENTRAVELSHEETFUEL.ISTHIRDPARTY, ENTRAVELSHEETFUEL.MODIFY_TIME, ENTRAVELSHEETFUEL.TRAVELSHEETREFCODE, ENTRAVELSHEETFUEL.REALTRANSPORTCODE, ENTRAVELSHEETFUEL.FUELTYPECODE, ENTRAVELSHEETFUEL.TRAVELSHEETFUELTYPRFCD "
			+" FROM ENTRAVELSHEETFUEL WHERE ENTRAVELSHEETFUEL.CODE = ?";


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
					anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.series = set.getString(3);
				anObject.numbers = set.getString(4);
				anObject.dateGen = set.getDate(5);
				anObject.isVRTU = set.getInt(6);
				if (set.wasNull()) {
					anObject.isVRTU = Integer.MIN_VALUE;
				}
				anObject.isThirdParty = set.getBoolean(7);
				if (set.wasNull()) {
					anObject.isThirdParty = null;
				}
				anObject.modify_time = set.getLong(8);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.travelSheetRef.code = set.getInt(9);
				if (set.wasNull()) {
					anObject.travelSheetRef.code = Integer.MIN_VALUE;
				}
				anObject.realTransport.code = set.getInt(10);
				if (set.wasNull()) {
					anObject.realTransport.code = Integer.MIN_VALUE;
				}
				anObject.fuelType.code = set.getInt(11);
				if (set.wasNull()) {
					anObject.fuelType.code = Integer.MIN_VALUE;
				}
				anObject.travelSheetFuelTypeRef.code = set.getInt(12);
				if (set.wasNull()) {
					anObject.travelSheetFuelTypeRef.code = Integer.MIN_VALUE;
				}
				if(anObject.realTransport.code != Integer.MIN_VALUE) {
					anObject.setRealTransport(
						new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).getObject(anObject.realTransport.code));
				}
				if(anObject.fuelType.code != Integer.MIN_VALUE) {
					anObject.setFuelType(
						new com.ksoe.techcard.dataminer.generated.TKFuelTypeDAOGen(connection,getUserProfile()).getObject(anObject.fuelType.code));
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


	public com.ksoe.energynet.valueobject.references.ENTravelSheetFuelRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENTravelSheetFuelRef ref = new com.ksoe.energynet.valueobject.references.ENTravelSheetFuelRef();
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

		selectStr = "DELETE FROM  ENTRAVELSHEETFUEL WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENTravelSheetFuel object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENTravelSheetFuel.getObject%} access denied");
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
	
	public long count(ENTravelSheetFuelFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENTravelSheetFuelFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENTravelSheetFuelFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENTRAVELSHEETFUEL", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENTRAVELSHEETFUEL WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, ENTravelSheetFuelFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENTravelSheetFuelFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENTRAVELSHEETFUEL");
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
			"SELECT  ENTRAVELSHEETFUEL.CODE FROM  ENTRAVELSHEETFUEL WHERE  ENTRAVELSHEETFUEL.CODE = ?";
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
		_checkConditionToken(condition,"code","ENTRAVELSHEETFUEL.CODE");
		_checkConditionToken(condition,"countgen","ENTRAVELSHEETFUEL.COUNTGEN");
		_checkConditionToken(condition,"series","ENTRAVELSHEETFUEL.SERIES");
		_checkConditionToken(condition,"numbers","ENTRAVELSHEETFUEL.NUMBERS");
		_checkConditionToken(condition,"dategen","ENTRAVELSHEETFUEL.DATEGEN");
		_checkConditionToken(condition,"isvrtu","ENTRAVELSHEETFUEL.ISVRTU");
		_checkConditionToken(condition,"isthirdparty","ENTRAVELSHEETFUEL.ISTHIRDPARTY");
		_checkConditionToken(condition,"modify_time","ENTRAVELSHEETFUEL.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"travelsheetref","TRAVELSHEETREFCODE");
		_checkConditionToken(condition,"travelsheetref.code","TRAVELSHEETREFCODE");
		_checkConditionToken(condition,"realtransport","REALTRANSPORTCODE");
		_checkConditionToken(condition,"realtransport.code","REALTRANSPORTCODE");
		_checkConditionToken(condition,"fueltype","FUELTYPECODE");
		_checkConditionToken(condition,"fueltype.code","FUELTYPECODE");
		_checkConditionToken(condition,"travelsheetfueltyperef","TRAVELSHEETFUELTYPRFCD");
		_checkConditionToken(condition,"travelsheetfueltyperef.code","TRAVELSHEETFUELTYPRFCD");
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
	
	private void _collectAutoIncrementFields(ENTravelSheetFuel anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENTRAVELSHEETFUEL", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENTRAVELSHEETFUEL", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENTRAVELSHEETFUEL", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENTRAVELSHEETFUEL");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENTravelSheetFuelDAO
