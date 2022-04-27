
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
import com.ksoe.energynet.valueobject.ENServicesTransport;
import com.ksoe.energynet.valueobject.filter.ENServicesTransportFilter;
import com.ksoe.energynet.valueobject.brief.ENServicesTransportShort;
import com.ksoe.energynet.valueobject.lists.ENServicesTransportShortList;


/**
 * DAO Object for ENServicesTransport;
 *
 */

public class ENServicesTransportDAOGen extends GenericDataMiner {

	public ENServicesTransportDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENServicesTransportDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENServicesTransport inObject) throws PersistenceException {
		ENServicesTransport obj = new ENServicesTransport();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.machineHoursCount == null && obj.machineHoursCount == null){}
		else
			if(inObject.machineHoursCount == null || obj.machineHoursCount == null) return false;
			else
				if ( ! inObject.machineHoursCount.equals(obj.machineHoursCount)){
					return false;
				}

		if(inObject.distance == null && obj.distance == null){}
		else
			if(inObject.distance == null || obj.distance == null) return false;
			else
				if ( ! inObject.distance.equals(obj.distance)){
					return false;
				}

		if(inObject.costMachineHours == null && obj.costMachineHours == null){}
		else
			if(inObject.costMachineHours == null || obj.costMachineHours == null) return false;
			else
				if ( ! inObject.costMachineHours.equals(obj.costMachineHours)){
					return false;
				}

		if(inObject.costDistance == null && obj.costDistance == null){}
		else
			if(inObject.costDistance == null || obj.costDistance == null) return false;
			else
				if ( ! inObject.costDistance.equals(obj.costDistance)){
					return false;
				}

		if(inObject.costTotal == null && obj.costTotal == null){}
		else
			if(inObject.costTotal == null || obj.costTotal == null) return false;
			else
				if ( ! inObject.costTotal.equals(obj.costTotal)){
					return false;
				}
		if (inObject.servicesCostRef.code != obj.servicesCostRef.code){
			return false;
		}
		if (inObject.calcTransportRef.code != obj.calcTransportRef.code){
			return false;
		}
		return true;
	}

	public int add(ENServicesTransport anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENServicesTransport anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENSERVICESTRANSPORT (CODE,MACHINEHOURSCOUNT,DISTANCE,COSTMACHINEHOURS,COSTDISTANCE,COSTTOTAL,SERVICESCOSTREFCODE,CALCTRANSPORTREFCODE) VALUES (?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.machineHoursCount != null) {
				anObject.machineHoursCount = anObject.machineHoursCount.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(2,anObject.machineHoursCount);
			if (anObject.distance != null) {
				anObject.distance = anObject.distance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(3,anObject.distance);
			if (anObject.costMachineHours != null) {
				anObject.costMachineHours = anObject.costMachineHours.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(4,anObject.costMachineHours);
			if (anObject.costDistance != null) {
				anObject.costDistance = anObject.costDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(5,anObject.costDistance);
			if (anObject.costTotal != null) {
				anObject.costTotal = anObject.costTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(6,anObject.costTotal);
			if (anObject.servicesCostRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENServicesCostDAOGen(connection,getUserProfile()).exists(anObject.servicesCostRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENServicesTransport.servicesCostRef.code%} = {%"+anObject.servicesCostRef.code+"%}");
				}
				statement.setInt(7,anObject.servicesCostRef.code);
			} else {
				statement.setNull(7,java.sql.Types.INTEGER);
			}
			if (anObject.calcTransportRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.techcard.dataminer.generated.TKCalcTransportDAOGen(connection,getUserProfile()).exists(anObject.calcTransportRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENServicesTransport.calcTransportRef.code%} = {%"+anObject.calcTransportRef.code+"%}");
				}
				statement.setInt(8,anObject.calcTransportRef.code);
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
			throw new PersistenceException("Error in method {%ENServicesTransportDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENServicesTransport anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENServicesTransport anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("MACHINEHOURSCOUNT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DISTANCE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COSTMACHINEHOURS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COSTDISTANCE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COSTTOTAL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SERVICESCOSTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CALCTRANSPORTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENSERVICESTRANSPORT SET  MACHINEHOURSCOUNT = ? , DISTANCE = ? , COSTMACHINEHOURS = ? , COSTDISTANCE = ? , COSTTOTAL = ? , SERVICESCOSTREFCODE = ? , CALCTRANSPORTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENSERVICESTRANSPORT SET ";
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
					if (anObject.machineHoursCount != null) {
						anObject.machineHoursCount = anObject.machineHoursCount.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(1,anObject.machineHoursCount);
					if (anObject.distance != null) {
						anObject.distance = anObject.distance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(2,anObject.distance);
					if (anObject.costMachineHours != null) {
						anObject.costMachineHours = anObject.costMachineHours.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(3,anObject.costMachineHours);
					if (anObject.costDistance != null) {
						anObject.costDistance = anObject.costDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(4,anObject.costDistance);
					if (anObject.costTotal != null) {
						anObject.costTotal = anObject.costTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(5,anObject.costTotal);
					if (anObject.servicesCostRef.code != Integer.MIN_VALUE) {
						statement.setInt(6,anObject.servicesCostRef.code);
					} else {
						statement.setNull(6,java.sql.Types.INTEGER);
					}
					if (anObject.calcTransportRef.code != Integer.MIN_VALUE) {
						statement.setInt(7,anObject.calcTransportRef.code);
					} else {
						statement.setNull(7,java.sql.Types.INTEGER);
					}
					statement.setInt(8,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("MACHINEHOURSCOUNT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.machineHoursCount != null) {
								anObject.machineHoursCount = anObject.machineHoursCount.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.machineHoursCount);
							continue;
						}
						if("DISTANCE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.distance != null) {
								anObject.distance = anObject.distance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.distance);
							continue;
						}
						if("COSTMACHINEHOURS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.costMachineHours != null) {
								anObject.costMachineHours = anObject.costMachineHours.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.costMachineHours);
							continue;
						}
						if("COSTDISTANCE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.costDistance != null) {
								anObject.costDistance = anObject.costDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.costDistance);
							continue;
						}
						if("COSTTOTAL".compareTo((String)fields.get(i)) == 0) {
							if (anObject.costTotal != null) {
								anObject.costTotal = anObject.costTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.costTotal);
							continue;
						}
						if("SERVICESCOSTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.servicesCostRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.servicesCostRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("CALCTRANSPORTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.calcTransportRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.calcTransportRef.code);
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

	} // end of save(ENServicesTransport anObject,String[] anAttributes)


	public ENServicesTransportShort getShortObject(int anObjectCode) throws PersistenceException {
		ENServicesTransport filterObject = new ENServicesTransport();
		Vector<ENServicesTransportShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENServicesTransportShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENServicesTransport filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.machineHoursCount, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.distance, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.costMachineHours, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.costDistance, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.costTotal, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.servicesCostRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.calcTransportRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENServicesTransportFilter filter) {
		String out = buildCondition((ENServicesTransport)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENServicesTransport filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENServicesTransport.code_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.machineHoursCount, ENServicesTransport.machineHoursCount_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.distance, ENServicesTransport.distance_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.costMachineHours, ENServicesTransport.costMachineHours_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.costDistance, ENServicesTransport.costDistance_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.costTotal, ENServicesTransport.costTotal_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.servicesCostRef.code, ENServicesTransport.servicesCostRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.calcTransportRef.code, ENServicesTransport.calcTransportRef_QFielld, out);
		}
		return out;
	}

	public ENServicesTransportShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENServicesTransportShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENServicesTransportShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENServicesTransportShortList getFilteredList(ENServicesTransport filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENServicesTransportShortList getScrollableFilteredList(ENServicesTransport aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENServicesTransportShortList getScrollableFilteredList(ENServicesTransport aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENServicesTransportShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENServicesTransportShortList getScrollableFilteredList(ENServicesTransportFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENServicesTransportShortList getScrollableFilteredList(ENServicesTransportFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENServicesTransportShortList getScrollableFilteredList(ENServicesTransport aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENServicesTransportShortList result = new ENServicesTransportShortList();
		ENServicesTransportShort anObject;
		result.list = new Vector<ENServicesTransportShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSERVICESTRANSPORT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSERVICESTRANSPORT.CODE"+
			",ENSERVICESTRANSPORT.MACHINEHOURSCOUNT"+
			",ENSERVICESTRANSPORT.DISTANCE"+
			",ENSERVICESTRANSPORT.COSTMACHINEHOURS"+
			",ENSERVICESTRANSPORT.COSTDISTANCE"+
			",ENSERVICESTRANSPORT.COSTTOTAL"+
			", ENSERVICESCOST.CODE " +
			", ENSERVICESCOST.DATEGEN " +
			", ENSERVICESCOST.CALCULATIONCOST " +
			", ENSERVICESCOST.COSTWITHOUTVAT " +
			", ENSERVICESCOST.COSTVAT " +
			", ENSERVICESCOST.COSTWITHVAT " +
			", TKCALCTRANSPORT.CODE " +
		" FROM ENSERVICESTRANSPORT " +
			", ENSERVICESCOST " +
			", TKCALCTRANSPORT " +
		"";
		whereStr = " ENSERVICESCOST.CODE = ENSERVICESTRANSPORT.SERVICESCOSTREFCODE" ; //+
		whereStr += " AND TKCALCTRANSPORT.CODE = ENSERVICESTRANSPORT.CALCTRANSPORTREFCODE" ; //+

	
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
				anObject = new ENServicesTransportShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.machineHoursCount = set.getBigDecimal(2);
				if(anObject.machineHoursCount != null) {
					anObject.machineHoursCount = anObject.machineHoursCount.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.distance = set.getBigDecimal(3);
				if(anObject.distance != null) {
					anObject.distance = anObject.distance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costMachineHours = set.getBigDecimal(4);
				if(anObject.costMachineHours != null) {
					anObject.costMachineHours = anObject.costMachineHours.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costDistance = set.getBigDecimal(5);
				if(anObject.costDistance != null) {
					anObject.costDistance = anObject.costDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costTotal = set.getBigDecimal(6);
				if(anObject.costTotal != null) {
					anObject.costTotal = anObject.costTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.servicesCostRefCode = set.getInt(7);
				if(set.wasNull()) {
					anObject.servicesCostRefCode = Integer.MIN_VALUE;
				}
				anObject.servicesCostRefDateGen = set.getDate(8);
				anObject.servicesCostRefCalculationCost = set.getBigDecimal(9);
				if(anObject.servicesCostRefCalculationCost != null) {
					anObject.servicesCostRefCalculationCost = anObject.servicesCostRefCalculationCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesCostRefCostWithoutVAT = set.getBigDecimal(10);
				if(anObject.servicesCostRefCostWithoutVAT != null) {
					anObject.servicesCostRefCostWithoutVAT = anObject.servicesCostRefCostWithoutVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesCostRefCostVAT = set.getBigDecimal(11);
				if(anObject.servicesCostRefCostVAT != null) {
					anObject.servicesCostRefCostVAT = anObject.servicesCostRefCostVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesCostRefCostWithVAT = set.getBigDecimal(12);
				if(anObject.servicesCostRefCostWithVAT != null) {
					anObject.servicesCostRefCostWithVAT = anObject.servicesCostRefCostWithVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.calcTransportRefCode = set.getInt(13);
				if(set.wasNull()) {
					anObject.calcTransportRefCode = Integer.MIN_VALUE;
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
	
	public int[] getFilteredCodeArray(ENServicesTransportFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENServicesTransportFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENServicesTransport aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENSERVICESTRANSPORT.CODE FROM ENSERVICESTRANSPORT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSERVICESTRANSPORT.CODE";
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

	public ENServicesTransport getObject(int uid) throws PersistenceException {
		ENServicesTransport result = new ENServicesTransport();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENServicesTransport anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENSERVICESTRANSPORT.CODE, ENSERVICESTRANSPORT.MACHINEHOURSCOUNT, ENSERVICESTRANSPORT.DISTANCE, ENSERVICESTRANSPORT.COSTMACHINEHOURS, ENSERVICESTRANSPORT.COSTDISTANCE, ENSERVICESTRANSPORT.COSTTOTAL, ENSERVICESTRANSPORT.SERVICESCOSTREFCODE, ENSERVICESTRANSPORT.CALCTRANSPORTREFCODE "
			+" FROM ENSERVICESTRANSPORT WHERE ENSERVICESTRANSPORT.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.machineHoursCount = set.getBigDecimal(2);
				if(anObject.machineHoursCount != null) {
					anObject.machineHoursCount = anObject.machineHoursCount.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.distance = set.getBigDecimal(3);
				if(anObject.distance != null) {
					anObject.distance = anObject.distance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costMachineHours = set.getBigDecimal(4);
				if(anObject.costMachineHours != null) {
					anObject.costMachineHours = anObject.costMachineHours.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costDistance = set.getBigDecimal(5);
				if(anObject.costDistance != null) {
					anObject.costDistance = anObject.costDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costTotal = set.getBigDecimal(6);
				if(anObject.costTotal != null) {
					anObject.costTotal = anObject.costTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesCostRef.code = set.getInt(7);
				if (set.wasNull()) {
					anObject.servicesCostRef.code = Integer.MIN_VALUE;
				}
				anObject.calcTransportRef.code = set.getInt(8);
				if (set.wasNull()) {
					anObject.calcTransportRef.code = Integer.MIN_VALUE;
				}
				if(anObject.servicesCostRef.code != Integer.MIN_VALUE) {
					anObject.setServicesCostRef(
						new com.ksoe.energynet.dataminer.generated.ENServicesCostDAOGen(connection,getUserProfile()).getRef(anObject.servicesCostRef.code));
				}
				if(anObject.calcTransportRef.code != Integer.MIN_VALUE) {
					anObject.setCalcTransportRef(
						new com.ksoe.techcard.dataminer.generated.TKCalcTransportDAOGen(connection,getUserProfile()).getRef(anObject.calcTransportRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENServicesTransportRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENServicesTransportRef ref = new com.ksoe.energynet.valueobject.references.ENServicesTransportRef();
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

		selectStr = "DELETE FROM  ENSERVICESTRANSPORT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENServicesTransport object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENServicesTransport.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesTransport.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENServicesTransport.remove%} access denied");
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
	
	public long count(ENServicesTransportFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENServicesTransportFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENServicesTransportFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENSERVICESTRANSPORT", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENServicesTransportFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENSERVICESTRANSPORT");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesTransport.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENServicesTransport.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENSERVICESTRANSPORT.CODE FROM  ENSERVICESTRANSPORT WHERE  ENSERVICESTRANSPORT.CODE = ?";
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
		_checkConditionToken(condition,"code","ENSERVICESTRANSPORT.CODE");
		_checkConditionToken(condition,"machinehourscount","ENSERVICESTRANSPORT.MACHINEHOURSCOUNT");
		_checkConditionToken(condition,"distance","ENSERVICESTRANSPORT.DISTANCE");
		_checkConditionToken(condition,"costmachinehours","ENSERVICESTRANSPORT.COSTMACHINEHOURS");
		_checkConditionToken(condition,"costdistance","ENSERVICESTRANSPORT.COSTDISTANCE");
		_checkConditionToken(condition,"costtotal","ENSERVICESTRANSPORT.COSTTOTAL");
		// relationship conditions
		_checkConditionToken(condition,"servicescostref","SERVICESCOSTREFCODE");
		_checkConditionToken(condition,"servicescostref.code","SERVICESCOSTREFCODE");
		_checkConditionToken(condition,"calctransportref","CALCTRANSPORTREFCODE");
		_checkConditionToken(condition,"calctransportref.code","CALCTRANSPORTREFCODE");
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
	
	private void _collectAutoIncrementFields(ENServicesTransport anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENSERVICESTRANSPORT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENSERVICESTRANSPORT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENSERVICESTRANSPORT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENSERVICESTRANSPORT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENServicesTransportDAO
