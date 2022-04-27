
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
import com.ksoe.energynet.valueobject.ENCalcTotalCost;
import com.ksoe.energynet.valueobject.filter.ENCalcTotalCostFilter;
import com.ksoe.energynet.valueobject.brief.ENCalcTotalCostShort;
import com.ksoe.energynet.valueobject.lists.ENCalcTotalCostShortList;


/**
 * DAO Object for ENCalcTotalCost;
 *
 */

public class ENCalcTotalCostDAOGen extends GenericDataMiner {

	public ENCalcTotalCostDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENCalcTotalCostDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENCalcTotalCost inObject) throws PersistenceException {
		ENCalcTotalCost obj = new ENCalcTotalCost();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.calculationCost == null && obj.calculationCost == null){}
		else
			if(inObject.calculationCost == null || obj.calculationCost == null) return false;
			else
				if ( ! inObject.calculationCost.equals(obj.calculationCost)){
					return false;
				}

		if(inObject.materialExpenses == null && obj.materialExpenses == null){}
		else
			if(inObject.materialExpenses == null || obj.materialExpenses == null) return false;
			else
				if ( ! inObject.materialExpenses.equals(obj.materialExpenses)){
					return false;
				}

		if(inObject.transportExpenses == null && obj.transportExpenses == null){}
		else
			if(inObject.transportExpenses == null || obj.transportExpenses == null) return false;
			else
				if ( ! inObject.transportExpenses.equals(obj.transportExpenses)){
					return false;
				}

		if(inObject.deliveryCost == null && obj.deliveryCost == null){}
		else
			if(inObject.deliveryCost == null || obj.deliveryCost == null) return false;
			else
				if ( ! inObject.deliveryCost.equals(obj.deliveryCost)){
					return false;
				}

		if(inObject.costWithoutVAT == null && obj.costWithoutVAT == null){}
		else
			if(inObject.costWithoutVAT == null || obj.costWithoutVAT == null) return false;
			else
				if ( ! inObject.costWithoutVAT.equals(obj.costWithoutVAT)){
					return false;
				}

		if(inObject.costVAT == null && obj.costVAT == null){}
		else
			if(inObject.costVAT == null || obj.costVAT == null) return false;
			else
				if ( ! inObject.costVAT.equals(obj.costVAT)){
					return false;
				}

		if(inObject.totalCost == null && obj.totalCost == null){}
		else
			if(inObject.totalCost == null || obj.totalCost == null) return false;
			else
				if ( ! inObject.totalCost.equals(obj.totalCost)){
					return false;
				}

		if(inObject.limitedSum == null && obj.limitedSum == null){}
		else
			if(inObject.limitedSum == null || obj.limitedSum == null) return false;
			else
				if ( ! inObject.limitedSum.equals(obj.limitedSum)){
					return false;
				}
		if (inObject.planRef.code != obj.planRef.code){
			return false;
		}
		if (inObject.plan2CTypeRef.code != obj.plan2CTypeRef.code){
			return false;
		}
		return true;
	}

	public int add(ENCalcTotalCost anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENCalcTotalCost anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENCALCTOTALCOST (CODE,CALCULATIONCOST,MATERIALEXPENSES,TRANSPORTEXPENSES,DELIVERYCOST,COSTWITHOUTVAT,COSTVAT,TOTALCOST,LIMITEDSUM,MODIFY_TIME,PLANREFCODE,PLAN2CTYPEREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.calculationCost != null) {
				anObject.calculationCost = anObject.calculationCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(2,anObject.calculationCost);
			if (anObject.materialExpenses != null) {
				anObject.materialExpenses = anObject.materialExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(3,anObject.materialExpenses);
			if (anObject.transportExpenses != null) {
				anObject.transportExpenses = anObject.transportExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(4,anObject.transportExpenses);
			if (anObject.deliveryCost != null) {
				anObject.deliveryCost = anObject.deliveryCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(5,anObject.deliveryCost);
			if (anObject.costWithoutVAT != null) {
				anObject.costWithoutVAT = anObject.costWithoutVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(6,anObject.costWithoutVAT);
			if (anObject.costVAT != null) {
				anObject.costVAT = anObject.costVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(7,anObject.costVAT);
			if (anObject.totalCost != null) {
				anObject.totalCost = anObject.totalCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(8,anObject.totalCost);
			if (anObject.limitedSum != null) {
				anObject.limitedSum = anObject.limitedSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(9,anObject.limitedSum);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(10,null);
			} else {
				statement.setBigDecimal(10,new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.planRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENCalcTotalCost.planRef.code%} = {%"+anObject.planRef.code+"%}");
				}
				statement.setInt(11,anObject.planRef.code);
			} else {
				statement.setNull(11,java.sql.Types.INTEGER);
			}
			if (anObject.plan2CTypeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWork2ClassificationTypeDAOGen(connection,getUserProfile()).exists(anObject.plan2CTypeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENCalcTotalCost.plan2CTypeRef.code%} = {%"+anObject.plan2CTypeRef.code+"%}");
				}
				statement.setInt(12,anObject.plan2CTypeRef.code);
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
			throw new PersistenceException("Error in method {%ENCalcTotalCostDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENCalcTotalCost anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENCalcTotalCost anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENCalcTotalCost oldObject = new ENCalcTotalCost();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENCalcTotalCost.modify_time_Field+" FROM  ENCALCTOTALCOST WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("CALCULATIONCOST") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MATERIALEXPENSES") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TRANSPORTEXPENSES") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DELIVERYCOST") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COSTWITHOUTVAT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COSTVAT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TOTALCOST") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("LIMITEDSUM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PLANREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PLAN2CTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENCALCTOTALCOST SET  CALCULATIONCOST = ? , MATERIALEXPENSES = ? , TRANSPORTEXPENSES = ? , DELIVERYCOST = ? , COSTWITHOUTVAT = ? , COSTVAT = ? , TOTALCOST = ? , LIMITEDSUM = ? , MODIFY_TIME = ? , PLANREFCODE = ? , PLAN2CTYPEREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENCALCTOTALCOST SET ";
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
					if (anObject.calculationCost != null) {
						anObject.calculationCost = anObject.calculationCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(1,anObject.calculationCost);
					if (anObject.materialExpenses != null) {
						anObject.materialExpenses = anObject.materialExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(2,anObject.materialExpenses);
					if (anObject.transportExpenses != null) {
						anObject.transportExpenses = anObject.transportExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(3,anObject.transportExpenses);
					if (anObject.deliveryCost != null) {
						anObject.deliveryCost = anObject.deliveryCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(4,anObject.deliveryCost);
					if (anObject.costWithoutVAT != null) {
						anObject.costWithoutVAT = anObject.costWithoutVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(5,anObject.costWithoutVAT);
					if (anObject.costVAT != null) {
						anObject.costVAT = anObject.costVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(6,anObject.costVAT);
					if (anObject.totalCost != null) {
						anObject.totalCost = anObject.totalCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(7,anObject.totalCost);
					if (anObject.limitedSum != null) {
						anObject.limitedSum = anObject.limitedSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(8,anObject.limitedSum);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(9,null);
					} else {
						statement.setBigDecimal(9,new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.planRef.code != Integer.MIN_VALUE) {
						statement.setInt(10,anObject.planRef.code);
					} else {
						statement.setNull(10,java.sql.Types.INTEGER);
					}
					if (anObject.plan2CTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(11,anObject.plan2CTypeRef.code);
					} else {
						statement.setNull(11,java.sql.Types.INTEGER);
					}
					statement.setInt(12,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("CALCULATIONCOST".compareTo((String)fields.get(i)) == 0) {
							if (anObject.calculationCost != null) {
								anObject.calculationCost = anObject.calculationCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.calculationCost);
							continue;
						}
						if("MATERIALEXPENSES".compareTo((String)fields.get(i)) == 0) {
							if (anObject.materialExpenses != null) {
								anObject.materialExpenses = anObject.materialExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.materialExpenses);
							continue;
						}
						if("TRANSPORTEXPENSES".compareTo((String)fields.get(i)) == 0) {
							if (anObject.transportExpenses != null) {
								anObject.transportExpenses = anObject.transportExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.transportExpenses);
							continue;
						}
						if("DELIVERYCOST".compareTo((String)fields.get(i)) == 0) {
							if (anObject.deliveryCost != null) {
								anObject.deliveryCost = anObject.deliveryCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.deliveryCost);
							continue;
						}
						if("COSTWITHOUTVAT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.costWithoutVAT != null) {
								anObject.costWithoutVAT = anObject.costWithoutVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.costWithoutVAT);
							continue;
						}
						if("COSTVAT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.costVAT != null) {
								anObject.costVAT = anObject.costVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.costVAT);
							continue;
						}
						if("TOTALCOST".compareTo((String)fields.get(i)) == 0) {
							if (anObject.totalCost != null) {
								anObject.totalCost = anObject.totalCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.totalCost);
							continue;
						}
						if("LIMITEDSUM".compareTo((String)fields.get(i)) == 0) {
							if (anObject.limitedSum != null) {
								anObject.limitedSum = anObject.limitedSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.limitedSum);
							continue;
						}
						if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0) {
							if (anObject.modify_time == Long.MIN_VALUE) {
								statement.setBigDecimal(i+1,null);
							} else {
								statement.setBigDecimal(i+1,new java.math.BigDecimal(anObject.modify_time));
							}
							continue;
						}
						if("PLANREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.planRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.planRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("PLAN2CTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.plan2CTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.plan2CTypeRef.code);
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

	} // end of save(ENCalcTotalCost anObject,String[] anAttributes)


	public ENCalcTotalCostShort getShortObject(int anObjectCode) throws PersistenceException {
		ENCalcTotalCost filterObject = new ENCalcTotalCost();
		Vector<ENCalcTotalCostShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENCalcTotalCostShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENCalcTotalCost filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.calculationCost, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.materialExpenses, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.transportExpenses, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.deliveryCost, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.costWithoutVAT, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.costVAT, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.totalCost, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.limitedSum, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.planRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.plan2CTypeRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENCalcTotalCostFilter filter) {
		String out = buildCondition((ENCalcTotalCost)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENCalcTotalCost filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENCalcTotalCost.code_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.calculationCost, ENCalcTotalCost.calculationCost_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.materialExpenses, ENCalcTotalCost.materialExpenses_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.transportExpenses, ENCalcTotalCost.transportExpenses_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.deliveryCost, ENCalcTotalCost.deliveryCost_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.costWithoutVAT, ENCalcTotalCost.costWithoutVAT_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.costVAT, ENCalcTotalCost.costVAT_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.totalCost, ENCalcTotalCost.totalCost_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.limitedSum, ENCalcTotalCost.limitedSum_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENCalcTotalCost.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.planRef.code, ENCalcTotalCost.planRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.plan2CTypeRef.code, ENCalcTotalCost.plan2CTypeRef_QFielld, out);
		}
		return out;
	}

	public ENCalcTotalCostShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENCalcTotalCostShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENCalcTotalCostShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENCalcTotalCostShortList getFilteredList(ENCalcTotalCost filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENCalcTotalCostShortList getScrollableFilteredList(ENCalcTotalCost aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENCalcTotalCostShortList getScrollableFilteredList(ENCalcTotalCost aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENCalcTotalCostShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENCalcTotalCostShortList getScrollableFilteredList(ENCalcTotalCostFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENCalcTotalCostShortList getScrollableFilteredList(ENCalcTotalCostFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENCalcTotalCostShortList getScrollableFilteredList(ENCalcTotalCost aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENCalcTotalCostShortList result = new ENCalcTotalCostShortList();
		ENCalcTotalCostShort anObject;
		result.list = new Vector<ENCalcTotalCostShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENCALCTOTALCOST.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENCALCTOTALCOST.CODE"+
			",ENCALCTOTALCOST.CALCULATIONCOST"+
			",ENCALCTOTALCOST.MATERIALEXPENSES"+
			",ENCALCTOTALCOST.TRANSPORTEXPENSES"+
			",ENCALCTOTALCOST.DELIVERYCOST"+
			",ENCALCTOTALCOST.COSTWITHOUTVAT"+
			",ENCALCTOTALCOST.COSTVAT"+
			",ENCALCTOTALCOST.TOTALCOST"+
			",ENCALCTOTALCOST.LIMITEDSUM"+
			", ENPLANWORK.CODE " +
			", ENPLANWORK.DATEGEN " +
			", ENPLANWORK.DATESTART " +
			", ENPLANWORK.DATEFINAL " +
			", ENPLANWORK.YEARGEN " +
			", ENPLANWORK.MONTHGEN " +
			", ENPLANWORK.YEARORIGINAL " +
			", ENPLANWORK.MONTHORIGINAL " +
			", ENPLANWORK.USERGEN " +
			", ENPLANWORK.DATEEDIT " +
			", ENPLANWORK.WORKORDERNUMBER " +
			", ENPLANWORK.DATEWORKORDER " +
			", ENPLANWORK.PRICONNECTIONNUMBER " +
			", ENPLANWORK.DATEENDPRICONNECTION " +
			", ENPLANWORK.INVESTWORKSDESCRIPTION " +
			", ENPLANWORK.SERVICESFSIDEFINID " +
			", ENPLANWORK.SERVICESFSIDECNNUM " +
			", ENPLANWORK.TOTALTIMEHOURS " +
			", ENPLANWORK.TOTALTIMEDAYS " +
			", ENPLANWORK.INVESTITEMNUMBER " +
			", ENPLANWORK2CLASSFCTNTP.CODE " +
			", ENPLANWORK2CLASSFCTNTP.COUNTGEN " +
			", ENPLANWORK2CLASSFCTNTP.USERGEN " +
			", ENPLANWORK2CLASSFCTNTP.DATEEDIT " +
			", ENPLANWORK2CLASSFCTNTP.MACHINEHOURS " +
			", ENPLANWORK2CLASSFCTNTP.RELOCATIONKM " +
			", ENPLANWORK2CLASSFCTNTP.TRANSPORTATIONLOAD " +
			", ENPLANWORK2CLASSFCTNTP.ISPRINTONKMORMH " +
			", ENPLANWORK2CLASSFCTNTP.COSTWORKSCONTRACTOR " +
			", ENPLANWORK2CLASSFCTNTP.DATEGEN " +
			", ENPLANWORK2CLASSFCTNTP.TIMESTART " +
			", ENPLANWORK2CLASSFCTNTP.TIMEFINAL " +
			", ENPLANWORK2CLASSFCTNTP.CODEVIRTUALBRIGADE " +
			", ENPLANWORK2CLASSFCTNTP.ISJOBSBYTIME " +
			", ENPLANWORK2CLASSFCTNTP.ISVISITCLIENT " +
			", ENPLANWORK2CLASSFCTNTP.PRODUCTIONEXPENSSPRCNT " +
		" FROM ENCALCTOTALCOST " +
			", ENPLANWORK " +
			", ENPLANWORK2CLASSFCTNTP " +
		"";
		whereStr = " ENPLANWORK.CODE = ENCALCTOTALCOST.PLANREFCODE" ; //+
		whereStr += " AND ENPLANWORK2CLASSFCTNTP.CODE = ENCALCTOTALCOST.PLAN2CTYPEREFCODE" ; //+

	
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
				anObject = new ENCalcTotalCostShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.calculationCost = set.getBigDecimal(2);
				if(anObject.calculationCost != null) {
					anObject.calculationCost = anObject.calculationCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.materialExpenses = set.getBigDecimal(3);
				if(anObject.materialExpenses != null) {
					anObject.materialExpenses = anObject.materialExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.transportExpenses = set.getBigDecimal(4);
				if(anObject.transportExpenses != null) {
					anObject.transportExpenses = anObject.transportExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.deliveryCost = set.getBigDecimal(5);
				if(anObject.deliveryCost != null) {
					anObject.deliveryCost = anObject.deliveryCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costWithoutVAT = set.getBigDecimal(6);
				if(anObject.costWithoutVAT != null) {
					anObject.costWithoutVAT = anObject.costWithoutVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costVAT = set.getBigDecimal(7);
				if(anObject.costVAT != null) {
					anObject.costVAT = anObject.costVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.totalCost = set.getBigDecimal(8);
				if(anObject.totalCost != null) {
					anObject.totalCost = anObject.totalCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.limitedSum = set.getBigDecimal(9);
				if(anObject.limitedSum != null) {
					anObject.limitedSum = anObject.limitedSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.planRefCode = set.getInt(10);
				if(set.wasNull()) {
					anObject.planRefCode = Integer.MIN_VALUE;
				}
				anObject.planRefDateGen = set.getTimestamp(11);
				anObject.planRefDateStart = set.getDate(12);
				anObject.planRefDateFinal = set.getDate(13);
				anObject.planRefYearGen = set.getInt(14);
				if(set.wasNull()) {
					anObject.planRefYearGen = Integer.MIN_VALUE;
				}
				anObject.planRefMonthGen = set.getInt(15);
				if(set.wasNull()) {
					anObject.planRefMonthGen = Integer.MIN_VALUE;
				}
				anObject.planRefYearOriginal = set.getInt(16);
				if(set.wasNull()) {
					anObject.planRefYearOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefMonthOriginal = set.getInt(17);
				if(set.wasNull()) {
					anObject.planRefMonthOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefUserGen = set.getString(18);
				anObject.planRefDateEdit = set.getDate(19);
				anObject.planRefWorkOrderNumber = set.getString(20);
				anObject.planRefDateWorkOrder = set.getDate(21);
				anObject.planRefPriConnectionNumber = set.getString(22);
				anObject.planRefDateEndPriConnection = set.getDate(23);
				anObject.planRefInvestWorksDescription = set.getString(24);
				anObject.planRefServicesFSideFinId = set.getInt(25);
				if(set.wasNull()) {
					anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;
				}
				anObject.planRefServicesFSideCnNum = set.getString(26);
				anObject.planRefTotalTimeHours = set.getBigDecimal(27);
				if(anObject.planRefTotalTimeHours != null) {
					anObject.planRefTotalTimeHours = anObject.planRefTotalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefTotalTimeDays = set.getBigDecimal(28);
				if(anObject.planRefTotalTimeDays != null) {
					anObject.planRefTotalTimeDays = anObject.planRefTotalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefInvestItemNumber = set.getString(29);
				anObject.plan2CTypeRefCode = set.getInt(30);
				if(set.wasNull()) {
					anObject.plan2CTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.plan2CTypeRefCountGen = set.getBigDecimal(31);
				if(anObject.plan2CTypeRefCountGen != null) {
					anObject.plan2CTypeRefCountGen = anObject.plan2CTypeRefCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.plan2CTypeRefUserGen = set.getString(32);
				anObject.plan2CTypeRefDateEdit = set.getDate(33);
				anObject.plan2CTypeRefMachineHours = set.getBigDecimal(34);
				if(anObject.plan2CTypeRefMachineHours != null) {
					anObject.plan2CTypeRefMachineHours = anObject.plan2CTypeRefMachineHours.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.plan2CTypeRefRelocationKm = set.getBigDecimal(35);
				if(anObject.plan2CTypeRefRelocationKm != null) {
					anObject.plan2CTypeRefRelocationKm = anObject.plan2CTypeRefRelocationKm.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.plan2CTypeRefTransportationLoad = set.getBigDecimal(36);
				if(anObject.plan2CTypeRefTransportationLoad != null) {
					anObject.plan2CTypeRefTransportationLoad = anObject.plan2CTypeRefTransportationLoad.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.plan2CTypeRefIsPrintOnKmOrMH = set.getInt(37);
				if(set.wasNull()) {
					anObject.plan2CTypeRefIsPrintOnKmOrMH = Integer.MIN_VALUE;
				}
				anObject.plan2CTypeRefCostWorksContractor = set.getBigDecimal(38);
				if(anObject.plan2CTypeRefCostWorksContractor != null) {
					anObject.plan2CTypeRefCostWorksContractor = anObject.plan2CTypeRefCostWorksContractor.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.plan2CTypeRefDateGen = set.getDate(39);
				anObject.plan2CTypeRefTimeStart = set.getTimestamp(40);
				anObject.plan2CTypeRefTimeFinal = set.getTimestamp(41);
				anObject.plan2CTypeRefCodeVirtualBrigade = set.getInt(42);
				if(set.wasNull()) {
					anObject.plan2CTypeRefCodeVirtualBrigade = Integer.MIN_VALUE;
				}
				anObject.plan2CTypeRefIsJobsByTime = set.getInt(43);
				if(set.wasNull()) {
					anObject.plan2CTypeRefIsJobsByTime = Integer.MIN_VALUE;
				}
				anObject.plan2CTypeRefIsVisitClient = set.getInt(44);
				if(set.wasNull()) {
					anObject.plan2CTypeRefIsVisitClient = Integer.MIN_VALUE;
				}
				anObject.plan2CTypeRefProductionExpensesPercent = set.getBigDecimal(45);
				if(anObject.plan2CTypeRefProductionExpensesPercent != null) {
					anObject.plan2CTypeRefProductionExpensesPercent = anObject.plan2CTypeRefProductionExpensesPercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
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
	
	public int[] getFilteredCodeArray(ENCalcTotalCostFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENCalcTotalCostFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENCalcTotalCost aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENCALCTOTALCOST.CODE FROM ENCALCTOTALCOST";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENCALCTOTALCOST.CODE";
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

	public ENCalcTotalCost getObject(int uid) throws PersistenceException {
		ENCalcTotalCost result = new ENCalcTotalCost();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENCalcTotalCost anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENCALCTOTALCOST.CODE, ENCALCTOTALCOST.CALCULATIONCOST, ENCALCTOTALCOST.MATERIALEXPENSES, ENCALCTOTALCOST.TRANSPORTEXPENSES, ENCALCTOTALCOST.DELIVERYCOST, ENCALCTOTALCOST.COSTWITHOUTVAT, ENCALCTOTALCOST.COSTVAT, ENCALCTOTALCOST.TOTALCOST, ENCALCTOTALCOST.LIMITEDSUM, ENCALCTOTALCOST.MODIFY_TIME, ENCALCTOTALCOST.PLANREFCODE, ENCALCTOTALCOST.PLAN2CTYPEREFCODE "
			+" FROM ENCALCTOTALCOST WHERE ENCALCTOTALCOST.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.calculationCost = set.getBigDecimal(2);
				if(anObject.calculationCost != null) {
					anObject.calculationCost = anObject.calculationCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.materialExpenses = set.getBigDecimal(3);
				if(anObject.materialExpenses != null) {
					anObject.materialExpenses = anObject.materialExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.transportExpenses = set.getBigDecimal(4);
				if(anObject.transportExpenses != null) {
					anObject.transportExpenses = anObject.transportExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.deliveryCost = set.getBigDecimal(5);
				if(anObject.deliveryCost != null) {
					anObject.deliveryCost = anObject.deliveryCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costWithoutVAT = set.getBigDecimal(6);
				if(anObject.costWithoutVAT != null) {
					anObject.costWithoutVAT = anObject.costWithoutVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costVAT = set.getBigDecimal(7);
				if(anObject.costVAT != null) {
					anObject.costVAT = anObject.costVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.totalCost = set.getBigDecimal(8);
				if(anObject.totalCost != null) {
					anObject.totalCost = anObject.totalCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.limitedSum = set.getBigDecimal(9);
				if(anObject.limitedSum != null) {
					anObject.limitedSum = anObject.limitedSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.modify_time = set.getLong(10);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.planRef.code = set.getInt(11);
				if (set.wasNull()) {
					anObject.planRef.code = Integer.MIN_VALUE;
				}
				anObject.plan2CTypeRef.code = set.getInt(12);
				if (set.wasNull()) {
					anObject.plan2CTypeRef.code = Integer.MIN_VALUE;
				}
				if(anObject.planRef.code != Integer.MIN_VALUE) {
					anObject.setPlanRef(
						new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).getRef(anObject.planRef.code));
				}
				if(anObject.plan2CTypeRef.code != Integer.MIN_VALUE) {
					anObject.setPlan2CTypeRef(
						new com.ksoe.energynet.dataminer.generated.ENPlanWork2ClassificationTypeDAOGen(connection,getUserProfile()).getRef(anObject.plan2CTypeRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENCalcTotalCostRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENCalcTotalCostRef ref = new com.ksoe.energynet.valueobject.references.ENCalcTotalCostRef();
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

		selectStr = "DELETE FROM  ENCALCTOTALCOST WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENCalcTotalCost object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENCalcTotalCost.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENCalcTotalCost.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENCalcTotalCost.remove%} access denied");
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
	
	public long count(ENCalcTotalCostFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENCalcTotalCostFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENCalcTotalCostFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENCALCTOTALCOST", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENCalcTotalCostFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENCALCTOTALCOST");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENCalcTotalCost.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENCalcTotalCost.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENCALCTOTALCOST.CODE FROM  ENCALCTOTALCOST WHERE  ENCALCTOTALCOST.CODE = ?";
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
		_checkConditionToken(condition,"code","ENCALCTOTALCOST.CODE");
		_checkConditionToken(condition,"calculationcost","ENCALCTOTALCOST.CALCULATIONCOST");
		_checkConditionToken(condition,"materialexpenses","ENCALCTOTALCOST.MATERIALEXPENSES");
		_checkConditionToken(condition,"transportexpenses","ENCALCTOTALCOST.TRANSPORTEXPENSES");
		_checkConditionToken(condition,"deliverycost","ENCALCTOTALCOST.DELIVERYCOST");
		_checkConditionToken(condition,"costwithoutvat","ENCALCTOTALCOST.COSTWITHOUTVAT");
		_checkConditionToken(condition,"costvat","ENCALCTOTALCOST.COSTVAT");
		_checkConditionToken(condition,"totalcost","ENCALCTOTALCOST.TOTALCOST");
		_checkConditionToken(condition,"limitedsum","ENCALCTOTALCOST.LIMITEDSUM");
		_checkConditionToken(condition,"modify_time","ENCALCTOTALCOST.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"planref","PLANREFCODE");
		_checkConditionToken(condition,"planref.code","PLANREFCODE");
		_checkConditionToken(condition,"plan2ctyperef","PLAN2CTYPEREFCODE");
		_checkConditionToken(condition,"plan2ctyperef.code","PLAN2CTYPEREFCODE");
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
	
	private void _collectAutoIncrementFields(ENCalcTotalCost anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENCALCTOTALCOST", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENCALCTOTALCOST", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENCALCTOTALCOST", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENCALCTOTALCOST");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENCalcTotalCostDAO
