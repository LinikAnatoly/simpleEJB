
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
import com.ksoe.energynet.valueobject.ENServicesDelivery;
import com.ksoe.energynet.valueobject.filter.ENServicesDeliveryFilter;
import com.ksoe.energynet.valueobject.brief.ENServicesDeliveryShort;
import com.ksoe.energynet.valueobject.lists.ENServicesDeliveryShortList;


/**
 * DAO Object for ENServicesDelivery;
 *
 */

public class ENServicesDeliveryDAOGen extends GenericDataMiner {

	public ENServicesDeliveryDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENServicesDeliveryDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENServicesDelivery inObject) throws PersistenceException {
		ENServicesDelivery obj = new ENServicesDelivery();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.timeGen == null && obj.timeGen == null){}
		else
			if(inObject.timeGen == null || obj.timeGen == null) return false;
			else
				if ( ! inObject.timeGen.equals(obj.timeGen)){
					return false;
				}

		if(inObject.costGen == null && obj.costGen == null){}
		else
			if(inObject.costGen == null || obj.costGen == null) return false;
			else
				if ( ! inObject.costGen.equals(obj.costGen)){
					return false;
				}

		if(inObject.chargeCostGen == null && obj.chargeCostGen == null){}
		else
			if(inObject.chargeCostGen == null || obj.chargeCostGen == null) return false;
			else
				if ( ! inObject.chargeCostGen.equals(obj.chargeCostGen)){
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
		if (inObject.calcDeliveryRef.code != obj.calcDeliveryRef.code){
			return false;
		}
		return true;
	}

	public int add(ENServicesDelivery anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENServicesDelivery anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENSERVICESDELIVERY (CODE,TIMEGEN,COSTGEN,CHARGECOSTGEN,COSTTOTAL,SERVICESCOSTREFCODE,CALCDELIVERYREFCODE) VALUES (?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.timeGen != null) {
				anObject.timeGen = anObject.timeGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(2,anObject.timeGen);
			if (anObject.costGen != null) {
				anObject.costGen = anObject.costGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(3,anObject.costGen);
			if (anObject.chargeCostGen != null) {
				anObject.chargeCostGen = anObject.chargeCostGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(4,anObject.chargeCostGen);
			if (anObject.costTotal != null) {
				anObject.costTotal = anObject.costTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(5,anObject.costTotal);
			if (anObject.servicesCostRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENServicesCostDAOGen(connection,getUserProfile()).exists(anObject.servicesCostRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENServicesDelivery.servicesCostRef.code%} = {%"+anObject.servicesCostRef.code+"%}");
				}
				statement.setInt(6,anObject.servicesCostRef.code);
			} else {
				statement.setNull(6,java.sql.Types.INTEGER);
			}
			if (anObject.calcDeliveryRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.techcard.dataminer.generated.TKCalcDeliveryDAOGen(connection,getUserProfile()).exists(anObject.calcDeliveryRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENServicesDelivery.calcDeliveryRef.code%} = {%"+anObject.calcDeliveryRef.code+"%}");
				}
				statement.setInt(7,anObject.calcDeliveryRef.code);
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
			throw new PersistenceException("Error in method {%ENServicesDeliveryDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENServicesDelivery anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENServicesDelivery anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("TIMEGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COSTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CHARGECOSTGEN") == 0) {
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
					if(fieldNameStr.compareTo("CALCDELIVERYREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENSERVICESDELIVERY SET  TIMEGEN = ? , COSTGEN = ? , CHARGECOSTGEN = ? , COSTTOTAL = ? , SERVICESCOSTREFCODE = ? , CALCDELIVERYREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENSERVICESDELIVERY SET ";
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
					if (anObject.timeGen != null) {
						anObject.timeGen = anObject.timeGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(1,anObject.timeGen);
					if (anObject.costGen != null) {
						anObject.costGen = anObject.costGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(2,anObject.costGen);
					if (anObject.chargeCostGen != null) {
						anObject.chargeCostGen = anObject.chargeCostGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(3,anObject.chargeCostGen);
					if (anObject.costTotal != null) {
						anObject.costTotal = anObject.costTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(4,anObject.costTotal);
					if (anObject.servicesCostRef.code != Integer.MIN_VALUE) {
						statement.setInt(5,anObject.servicesCostRef.code);
					} else {
						statement.setNull(5,java.sql.Types.INTEGER);
					}
					if (anObject.calcDeliveryRef.code != Integer.MIN_VALUE) {
						statement.setInt(6,anObject.calcDeliveryRef.code);
					} else {
						statement.setNull(6,java.sql.Types.INTEGER);
					}
					statement.setInt(7,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("TIMEGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.timeGen != null) {
								anObject.timeGen = anObject.timeGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.timeGen);
							continue;
						}
						if("COSTGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.costGen != null) {
								anObject.costGen = anObject.costGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.costGen);
							continue;
						}
						if("CHARGECOSTGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.chargeCostGen != null) {
								anObject.chargeCostGen = anObject.chargeCostGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.chargeCostGen);
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
						if("CALCDELIVERYREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.calcDeliveryRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.calcDeliveryRef.code);
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

	} // end of save(ENServicesDelivery anObject,String[] anAttributes)


	public ENServicesDeliveryShort getShortObject(int anObjectCode) throws PersistenceException {
		ENServicesDelivery filterObject = new ENServicesDelivery();
		Vector<ENServicesDeliveryShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENServicesDeliveryShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENServicesDelivery filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.timeGen, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.costGen, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.chargeCostGen, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.costTotal, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.servicesCostRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.calcDeliveryRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENServicesDeliveryFilter filter) {
		String out = buildCondition((ENServicesDelivery)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENServicesDelivery filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENServicesDelivery.code_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.timeGen, ENServicesDelivery.timeGen_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.costGen, ENServicesDelivery.costGen_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.chargeCostGen, ENServicesDelivery.chargeCostGen_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.costTotal, ENServicesDelivery.costTotal_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.servicesCostRef.code, ENServicesDelivery.servicesCostRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.calcDeliveryRef.code, ENServicesDelivery.calcDeliveryRef_QFielld, out);
		}
		return out;
	}

	public ENServicesDeliveryShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENServicesDeliveryShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENServicesDeliveryShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENServicesDeliveryShortList getFilteredList(ENServicesDelivery filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENServicesDeliveryShortList getScrollableFilteredList(ENServicesDelivery aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENServicesDeliveryShortList getScrollableFilteredList(ENServicesDelivery aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENServicesDeliveryShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENServicesDeliveryShortList getScrollableFilteredList(ENServicesDeliveryFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENServicesDeliveryShortList getScrollableFilteredList(ENServicesDeliveryFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENServicesDeliveryShortList getScrollableFilteredList(ENServicesDelivery aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENServicesDeliveryShortList result = new ENServicesDeliveryShortList();
		ENServicesDeliveryShort anObject;
		result.list = new Vector<ENServicesDeliveryShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSERVICESDELIVERY.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSERVICESDELIVERY.CODE"+
			",ENSERVICESDELIVERY.TIMEGEN"+
			",ENSERVICESDELIVERY.COSTGEN"+
			",ENSERVICESDELIVERY.CHARGECOSTGEN"+
			",ENSERVICESDELIVERY.COSTTOTAL"+
			", ENSERVICESCOST.CODE " +
			", ENSERVICESCOST.DATEGEN " +
			", ENSERVICESCOST.CALCULATIONCOST " +
			", ENSERVICESCOST.COSTWITHOUTVAT " +
			", ENSERVICESCOST.COSTVAT " +
			", ENSERVICESCOST.COSTWITHVAT " +
			", TKCALCDELIVERY.CODE " +
		" FROM ENSERVICESDELIVERY " +
			", ENSERVICESCOST " +
			", TKCALCDELIVERY " +
		"";
		whereStr = " ENSERVICESCOST.CODE = ENSERVICESDELIVERY.SERVICESCOSTREFCODE" ; //+
		whereStr += " AND TKCALCDELIVERY.CODE = ENSERVICESDELIVERY.CALCDELIVERYREFCODE" ; //+

	
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
				anObject = new ENServicesDeliveryShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.timeGen = set.getBigDecimal(2);
				if(anObject.timeGen != null) {
					anObject.timeGen = anObject.timeGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costGen = set.getBigDecimal(3);
				if(anObject.costGen != null) {
					anObject.costGen = anObject.costGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.chargeCostGen = set.getBigDecimal(4);
				if(anObject.chargeCostGen != null) {
					anObject.chargeCostGen = anObject.chargeCostGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costTotal = set.getBigDecimal(5);
				if(anObject.costTotal != null) {
					anObject.costTotal = anObject.costTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.servicesCostRefCode = set.getInt(6);
				if(set.wasNull()) {
					anObject.servicesCostRefCode = Integer.MIN_VALUE;
				}
				anObject.servicesCostRefDateGen = set.getDate(7);
				anObject.servicesCostRefCalculationCost = set.getBigDecimal(8);
				if(anObject.servicesCostRefCalculationCost != null) {
					anObject.servicesCostRefCalculationCost = anObject.servicesCostRefCalculationCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesCostRefCostWithoutVAT = set.getBigDecimal(9);
				if(anObject.servicesCostRefCostWithoutVAT != null) {
					anObject.servicesCostRefCostWithoutVAT = anObject.servicesCostRefCostWithoutVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesCostRefCostVAT = set.getBigDecimal(10);
				if(anObject.servicesCostRefCostVAT != null) {
					anObject.servicesCostRefCostVAT = anObject.servicesCostRefCostVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesCostRefCostWithVAT = set.getBigDecimal(11);
				if(anObject.servicesCostRefCostWithVAT != null) {
					anObject.servicesCostRefCostWithVAT = anObject.servicesCostRefCostWithVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.calcDeliveryRefCode = set.getInt(12);
				if(set.wasNull()) {
					anObject.calcDeliveryRefCode = Integer.MIN_VALUE;
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
	
	public int[] getFilteredCodeArray(ENServicesDeliveryFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENServicesDeliveryFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENServicesDelivery aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENSERVICESDELIVERY.CODE FROM ENSERVICESDELIVERY";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSERVICESDELIVERY.CODE";
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

	public ENServicesDelivery getObject(int uid) throws PersistenceException {
		ENServicesDelivery result = new ENServicesDelivery();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENServicesDelivery anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENSERVICESDELIVERY.CODE, ENSERVICESDELIVERY.TIMEGEN, ENSERVICESDELIVERY.COSTGEN, ENSERVICESDELIVERY.CHARGECOSTGEN, ENSERVICESDELIVERY.COSTTOTAL, ENSERVICESDELIVERY.SERVICESCOSTREFCODE, ENSERVICESDELIVERY.CALCDELIVERYREFCODE "
			+" FROM ENSERVICESDELIVERY WHERE ENSERVICESDELIVERY.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.timeGen = set.getBigDecimal(2);
				if(anObject.timeGen != null) {
					anObject.timeGen = anObject.timeGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costGen = set.getBigDecimal(3);
				if(anObject.costGen != null) {
					anObject.costGen = anObject.costGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.chargeCostGen = set.getBigDecimal(4);
				if(anObject.chargeCostGen != null) {
					anObject.chargeCostGen = anObject.chargeCostGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costTotal = set.getBigDecimal(5);
				if(anObject.costTotal != null) {
					anObject.costTotal = anObject.costTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesCostRef.code = set.getInt(6);
				if (set.wasNull()) {
					anObject.servicesCostRef.code = Integer.MIN_VALUE;
				}
				anObject.calcDeliveryRef.code = set.getInt(7);
				if (set.wasNull()) {
					anObject.calcDeliveryRef.code = Integer.MIN_VALUE;
				}
				if(anObject.servicesCostRef.code != Integer.MIN_VALUE) {
					anObject.setServicesCostRef(
						new com.ksoe.energynet.dataminer.generated.ENServicesCostDAOGen(connection,getUserProfile()).getRef(anObject.servicesCostRef.code));
				}
				if(anObject.calcDeliveryRef.code != Integer.MIN_VALUE) {
					anObject.setCalcDeliveryRef(
						new com.ksoe.techcard.dataminer.generated.TKCalcDeliveryDAOGen(connection,getUserProfile()).getRef(anObject.calcDeliveryRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENServicesDeliveryRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENServicesDeliveryRef ref = new com.ksoe.energynet.valueobject.references.ENServicesDeliveryRef();
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

		selectStr = "DELETE FROM  ENSERVICESDELIVERY WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENServicesDelivery object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENServicesDelivery.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesDelivery.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENServicesDelivery.remove%} access denied");
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
	
	public long count(ENServicesDeliveryFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENServicesDeliveryFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENServicesDeliveryFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENSERVICESDELIVERY", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENServicesDeliveryFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENSERVICESDELIVERY");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesDelivery.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENServicesDelivery.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENSERVICESDELIVERY.CODE FROM  ENSERVICESDELIVERY WHERE  ENSERVICESDELIVERY.CODE = ?";
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
		_checkConditionToken(condition,"code","ENSERVICESDELIVERY.CODE");
		_checkConditionToken(condition,"timegen","ENSERVICESDELIVERY.TIMEGEN");
		_checkConditionToken(condition,"costgen","ENSERVICESDELIVERY.COSTGEN");
		_checkConditionToken(condition,"chargecostgen","ENSERVICESDELIVERY.CHARGECOSTGEN");
		_checkConditionToken(condition,"costtotal","ENSERVICESDELIVERY.COSTTOTAL");
		// relationship conditions
		_checkConditionToken(condition,"servicescostref","SERVICESCOSTREFCODE");
		_checkConditionToken(condition,"servicescostref.code","SERVICESCOSTREFCODE");
		_checkConditionToken(condition,"calcdeliveryref","CALCDELIVERYREFCODE");
		_checkConditionToken(condition,"calcdeliveryref.code","CALCDELIVERYREFCODE");
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
	
	private void _collectAutoIncrementFields(ENServicesDelivery anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENSERVICESDELIVERY", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENSERVICESDELIVERY", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENSERVICESDELIVERY", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENSERVICESDELIVERY");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENServicesDeliveryDAO
