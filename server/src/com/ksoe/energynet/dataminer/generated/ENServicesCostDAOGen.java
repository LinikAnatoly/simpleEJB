
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
import com.ksoe.energynet.valueobject.ENServicesCost;
import com.ksoe.energynet.valueobject.filter.ENServicesCostFilter;
import com.ksoe.energynet.valueobject.brief.ENServicesCostShort;
import com.ksoe.energynet.valueobject.lists.ENServicesCostShortList;


/**
 * DAO Object for ENServicesCost;
 *
 */

public class ENServicesCostDAOGen extends GenericDataMiner {

	public ENServicesCostDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENServicesCostDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENServicesCost inObject) throws PersistenceException {
		ENServicesCost obj = new ENServicesCost();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.dateGen == null && obj.dateGen == null){} else 
			if(inObject.dateGen == null || obj.dateGen == null) return false;
			else
				if (inObject.dateGen.compareTo(obj.dateGen) != 0){
					return false;
				}

		if(inObject.countGen == null && obj.countGen == null){}
		else
			if(inObject.countGen == null || obj.countGen == null) return false;
			else
				if ( ! inObject.countGen.equals(obj.countGen)){
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

		if(inObject.salaryExpenses == null && obj.salaryExpenses == null){}
		else
			if(inObject.salaryExpenses == null || obj.salaryExpenses == null) return false;
			else
				if ( ! inObject.salaryExpenses.equals(obj.salaryExpenses)){
					return false;
				}

		if(inObject.socialCharges == null && obj.socialCharges == null){}
		else
			if(inObject.socialCharges == null || obj.socialCharges == null) return false;
			else
				if ( ! inObject.socialCharges.equals(obj.socialCharges)){
					return false;
				}

		if(inObject.directExpenses == null && obj.directExpenses == null){}
		else
			if(inObject.directExpenses == null || obj.directExpenses == null) return false;
			else
				if ( ! inObject.directExpenses.equals(obj.directExpenses)){
					return false;
				}

		if(inObject.productionExpenses == null && obj.productionExpenses == null){}
		else
			if(inObject.productionExpenses == null || obj.productionExpenses == null) return false;
			else
				if ( ! inObject.productionExpenses.equals(obj.productionExpenses)){
					return false;
				}

		if(inObject.totalExpenses == null && obj.totalExpenses == null){}
		else
			if(inObject.totalExpenses == null || obj.totalExpenses == null) return false;
			else
				if ( ! inObject.totalExpenses.equals(obj.totalExpenses)){
					return false;
				}

		if(inObject.normIncome == null && obj.normIncome == null){}
		else
			if(inObject.normIncome == null || obj.normIncome == null) return false;
			else
				if ( ! inObject.normIncome.equals(obj.normIncome)){
					return false;
				}

		if(inObject.calculationCost == null && obj.calculationCost == null){}
		else
			if(inObject.calculationCost == null || obj.calculationCost == null) return false;
			else
				if ( ! inObject.calculationCost.equals(obj.calculationCost)){
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

		if(inObject.costWithVAT == null && obj.costWithVAT == null){}
		else
			if(inObject.costWithVAT == null || obj.costWithVAT == null) return false;
			else
				if ( ! inObject.costWithVAT.equals(obj.costWithVAT)){
					return false;
				}
		if (inObject.tkCalcCostRef.code != obj.tkCalcCostRef.code){
			return false;
		}
		if (inObject.servicesObjectRef.code != obj.servicesObjectRef.code){
			return false;
		}
		if (inObject.planRef.code != obj.planRef.code){
			return false;
		}
		return true;
	}

	public int add(ENServicesCost anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENServicesCost anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENSERVICESCOST (CODE,DATEGEN,COUNTGEN,MATERIALEXPENSES,TRANSPORTEXPENSES,DELIVERYCOST,SALARYEXPENSES,SOCIALCHARGES,DIRECTEXPENSES,PRODUCTIONEXPENSES,TOTALEXPENSES,NORMINCOME,CALCULATIONCOST,COSTWITHOUTVAT,COSTVAT,COSTWITHVAT,TKCALCCOSTREFCODE,SERVICESOBJECTREFCODE,PLANREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			if (anObject.dateGen == null) {
				statement.setDate(2, null);
			} else {
				statement.setDate(2, new java.sql.Date(anObject.dateGen.getTime()));
			}
			if (anObject.countGen != null) {
				anObject.countGen = anObject.countGen.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(3, anObject.countGen);
			if (anObject.materialExpenses != null) {
				anObject.materialExpenses = anObject.materialExpenses.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(4, anObject.materialExpenses);
			if (anObject.transportExpenses != null) {
				anObject.transportExpenses = anObject.transportExpenses.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(5, anObject.transportExpenses);
			if (anObject.deliveryCost != null) {
				anObject.deliveryCost = anObject.deliveryCost.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(6, anObject.deliveryCost);
			if (anObject.salaryExpenses != null) {
				anObject.salaryExpenses = anObject.salaryExpenses.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(7, anObject.salaryExpenses);
			if (anObject.socialCharges != null) {
				anObject.socialCharges = anObject.socialCharges.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(8, anObject.socialCharges);
			if (anObject.directExpenses != null) {
				anObject.directExpenses = anObject.directExpenses.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(9, anObject.directExpenses);
			if (anObject.productionExpenses != null) {
				anObject.productionExpenses = anObject.productionExpenses.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(10, anObject.productionExpenses);
			if (anObject.totalExpenses != null) {
				anObject.totalExpenses = anObject.totalExpenses.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(11, anObject.totalExpenses);
			if (anObject.normIncome != null) {
				anObject.normIncome = anObject.normIncome.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(12, anObject.normIncome);
			if (anObject.calculationCost != null) {
				anObject.calculationCost = anObject.calculationCost.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(13, anObject.calculationCost);
			if (anObject.costWithoutVAT != null) {
				anObject.costWithoutVAT = anObject.costWithoutVAT.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(14, anObject.costWithoutVAT);
			if (anObject.costVAT != null) {
				anObject.costVAT = anObject.costVAT.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(15, anObject.costVAT);
			if (anObject.costWithVAT != null) {
				anObject.costWithVAT = anObject.costWithVAT.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(16, anObject.costWithVAT);
			if (anObject.tkCalcCostRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.techcard.dataminer.generated.TKCalcCostDAOGen(connection,getUserProfile()).exists(anObject.tkCalcCostRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENServicesCost.tkCalcCostRef.code%} = {%"+anObject.tkCalcCostRef.code+"%}");
				}
				statement.setInt(17,anObject.tkCalcCostRef.code);
			} else {
				statement.setNull(17,java.sql.Types.INTEGER);
			}
			if (anObject.servicesObjectRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).exists(anObject.servicesObjectRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENServicesCost.servicesObjectRef.code%} = {%"+anObject.servicesObjectRef.code+"%}");
				}
				statement.setInt(18,anObject.servicesObjectRef.code);
			} else {
				statement.setNull(18,java.sql.Types.INTEGER);
			}
			if (anObject.planRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENServicesCost.planRef.code%} = {%"+anObject.planRef.code+"%}");
				}
				statement.setInt(19,anObject.planRef.code);
			} else {
				statement.setNull(19,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENServicesCostDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENServicesCost anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENServicesCost anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("DATEGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COUNTGEN") == 0) {
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
					if(fieldNameStr.compareTo("SALARYEXPENSES") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SOCIALCHARGES") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DIRECTEXPENSES") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PRODUCTIONEXPENSES") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TOTALEXPENSES") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NORMINCOME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CALCULATIONCOST") == 0) {
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
					if(fieldNameStr.compareTo("COSTWITHVAT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TKCALCCOSTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SERVICESOBJECTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PLANREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENSERVICESCOST SET  DATEGEN = ? , COUNTGEN = ? , MATERIALEXPENSES = ? , TRANSPORTEXPENSES = ? , DELIVERYCOST = ? , SALARYEXPENSES = ? , SOCIALCHARGES = ? , DIRECTEXPENSES = ? , PRODUCTIONEXPENSES = ? , TOTALEXPENSES = ? , NORMINCOME = ? , CALCULATIONCOST = ? , COSTWITHOUTVAT = ? , COSTVAT = ? , COSTWITHVAT = ? , TKCALCCOSTREFCODE = ? , SERVICESOBJECTREFCODE = ? , PLANREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENSERVICESCOST SET ";
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
					if (anObject.dateGen == null) {
						statement.setDate(1, null);
					} else {
						statement.setDate(1, new java.sql.Date(anObject.dateGen.getTime()));
					}
					if (anObject.countGen != null) {
						anObject.countGen = anObject.countGen.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(2, anObject.countGen);
					if (anObject.materialExpenses != null) {
						anObject.materialExpenses = anObject.materialExpenses.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(3, anObject.materialExpenses);
					if (anObject.transportExpenses != null) {
						anObject.transportExpenses = anObject.transportExpenses.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(4, anObject.transportExpenses);
					if (anObject.deliveryCost != null) {
						anObject.deliveryCost = anObject.deliveryCost.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(5, anObject.deliveryCost);
					if (anObject.salaryExpenses != null) {
						anObject.salaryExpenses = anObject.salaryExpenses.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(6, anObject.salaryExpenses);
					if (anObject.socialCharges != null) {
						anObject.socialCharges = anObject.socialCharges.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(7, anObject.socialCharges);
					if (anObject.directExpenses != null) {
						anObject.directExpenses = anObject.directExpenses.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(8, anObject.directExpenses);
					if (anObject.productionExpenses != null) {
						anObject.productionExpenses = anObject.productionExpenses.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(9, anObject.productionExpenses);
					if (anObject.totalExpenses != null) {
						anObject.totalExpenses = anObject.totalExpenses.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(10, anObject.totalExpenses);
					if (anObject.normIncome != null) {
						anObject.normIncome = anObject.normIncome.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(11, anObject.normIncome);
					if (anObject.calculationCost != null) {
						anObject.calculationCost = anObject.calculationCost.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(12, anObject.calculationCost);
					if (anObject.costWithoutVAT != null) {
						anObject.costWithoutVAT = anObject.costWithoutVAT.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(13, anObject.costWithoutVAT);
					if (anObject.costVAT != null) {
						anObject.costVAT = anObject.costVAT.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(14, anObject.costVAT);
					if (anObject.costWithVAT != null) {
						anObject.costWithVAT = anObject.costWithVAT.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(15, anObject.costWithVAT);
					if (anObject.tkCalcCostRef.code != Integer.MIN_VALUE) {
						statement.setInt(16, anObject.tkCalcCostRef.code);
					} else {
						statement.setNull(16, java.sql.Types.INTEGER);
					}
					if (anObject.servicesObjectRef.code != Integer.MIN_VALUE) {
						statement.setInt(17, anObject.servicesObjectRef.code);
					} else {
						statement.setNull(17, java.sql.Types.INTEGER);
					}
					if (anObject.planRef.code != Integer.MIN_VALUE) {
						statement.setInt(18, anObject.planRef.code);
					} else {
						statement.setNull(18, java.sql.Types.INTEGER);
					}
					statement.setInt(19, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("DATEGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateGen == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateGen.getTime()));
							}
							continue;
						}
						if("COUNTGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.countGen != null) {
								anObject.countGen = anObject.countGen.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.countGen);
							continue;
						}
						if("MATERIALEXPENSES".compareTo((String)fields.get(i)) == 0) {
							if (anObject.materialExpenses != null) {
								anObject.materialExpenses = anObject.materialExpenses.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.materialExpenses);
							continue;
						}
						if("TRANSPORTEXPENSES".compareTo((String)fields.get(i)) == 0) {
							if (anObject.transportExpenses != null) {
								anObject.transportExpenses = anObject.transportExpenses.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.transportExpenses);
							continue;
						}
						if("DELIVERYCOST".compareTo((String)fields.get(i)) == 0) {
							if (anObject.deliveryCost != null) {
								anObject.deliveryCost = anObject.deliveryCost.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.deliveryCost);
							continue;
						}
						if("SALARYEXPENSES".compareTo((String)fields.get(i)) == 0) {
							if (anObject.salaryExpenses != null) {
								anObject.salaryExpenses = anObject.salaryExpenses.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.salaryExpenses);
							continue;
						}
						if("SOCIALCHARGES".compareTo((String)fields.get(i)) == 0) {
							if (anObject.socialCharges != null) {
								anObject.socialCharges = anObject.socialCharges.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.socialCharges);
							continue;
						}
						if("DIRECTEXPENSES".compareTo((String)fields.get(i)) == 0) {
							if (anObject.directExpenses != null) {
								anObject.directExpenses = anObject.directExpenses.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.directExpenses);
							continue;
						}
						if("PRODUCTIONEXPENSES".compareTo((String)fields.get(i)) == 0) {
							if (anObject.productionExpenses != null) {
								anObject.productionExpenses = anObject.productionExpenses.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.productionExpenses);
							continue;
						}
						if("TOTALEXPENSES".compareTo((String)fields.get(i)) == 0) {
							if (anObject.totalExpenses != null) {
								anObject.totalExpenses = anObject.totalExpenses.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.totalExpenses);
							continue;
						}
						if("NORMINCOME".compareTo((String)fields.get(i)) == 0) {
							if (anObject.normIncome != null) {
								anObject.normIncome = anObject.normIncome.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.normIncome);
							continue;
						}
						if("CALCULATIONCOST".compareTo((String)fields.get(i)) == 0) {
							if (anObject.calculationCost != null) {
								anObject.calculationCost = anObject.calculationCost.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.calculationCost);
							continue;
						}
						if("COSTWITHOUTVAT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.costWithoutVAT != null) {
								anObject.costWithoutVAT = anObject.costWithoutVAT.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.costWithoutVAT);
							continue;
						}
						if("COSTVAT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.costVAT != null) {
								anObject.costVAT = anObject.costVAT.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.costVAT);
							continue;
						}
						if("COSTWITHVAT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.costWithVAT != null) {
								anObject.costWithVAT = anObject.costWithVAT.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.costWithVAT);
							continue;
						}
						if("TKCALCCOSTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.tkCalcCostRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.tkCalcCostRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("SERVICESOBJECTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.servicesObjectRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.servicesObjectRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("PLANREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.planRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.planRef.code);
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

	} // end of save(ENServicesCost anObject,String[] anAttributes)


	public ENServicesCostShort getShortObject(int anObjectCode) throws PersistenceException {
		ENServicesCost filterObject = new ENServicesCost();
		Vector<ENServicesCostShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENServicesCostShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENServicesCost filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateGen, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.countGen, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.materialExpenses, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.transportExpenses, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.deliveryCost, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.salaryExpenses, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.socialCharges, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.directExpenses, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.productionExpenses, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.totalExpenses, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.normIncome, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.calculationCost, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.costWithoutVAT, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.costVAT, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.costWithVAT, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.tkCalcCostRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.servicesObjectRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.planRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENServicesCostFilter filter) {
		String out = buildCondition((ENServicesCost)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENServicesCost filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENServicesCost.code_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateGen, ENServicesCost.dateGen_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.countGen, ENServicesCost.countGen_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.materialExpenses, ENServicesCost.materialExpenses_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.transportExpenses, ENServicesCost.transportExpenses_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.deliveryCost, ENServicesCost.deliveryCost_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.salaryExpenses, ENServicesCost.salaryExpenses_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.socialCharges, ENServicesCost.socialCharges_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.directExpenses, ENServicesCost.directExpenses_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.productionExpenses, ENServicesCost.productionExpenses_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.totalExpenses, ENServicesCost.totalExpenses_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.normIncome, ENServicesCost.normIncome_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.calculationCost, ENServicesCost.calculationCost_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.costWithoutVAT, ENServicesCost.costWithoutVAT_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.costVAT, ENServicesCost.costVAT_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.costWithVAT, ENServicesCost.costWithVAT_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.tkCalcCostRef.code, ENServicesCost.tkCalcCostRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.servicesObjectRef.code, ENServicesCost.servicesObjectRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.planRef.code, ENServicesCost.planRef_QFielld, out);
		}
		return out;
	}

	public ENServicesCostShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENServicesCostShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENServicesCostShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENServicesCostShortList getFilteredList(ENServicesCost filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENServicesCostShortList getScrollableFilteredList(ENServicesCost aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENServicesCostShortList getScrollableFilteredList(ENServicesCost aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENServicesCostShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENServicesCostShortList getScrollableFilteredList(ENServicesCostFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENServicesCostShortList getScrollableFilteredList(ENServicesCostFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENServicesCostShortList getScrollableFilteredList(ENServicesCost aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENServicesCostShortList result = new ENServicesCostShortList();
		ENServicesCostShort anObject;
		result.list = new Vector<ENServicesCostShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSERVICESCOST.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSERVICESCOST.CODE"+
			",ENSERVICESCOST.DATEGEN"+
			",ENSERVICESCOST.COUNTGEN"+
			",ENSERVICESCOST.CALCULATIONCOST"+
			",ENSERVICESCOST.COSTWITHOUTVAT"+
			",ENSERVICESCOST.COSTVAT"+
			",ENSERVICESCOST.COSTWITHVAT"+
			", TKCALCCOST.CODE " +
			", ENSERVICESOBJECT.CODE " +
			", ENSERVICESOBJECT.CONTRACTNUMBER " +
			", ENSERVICESOBJECT.CONTRACTDATE " +
			", ENSERVICESOBJECT.NAME " +
			", ENSERVICESOBJECT.PARTNERCODE " +
			", ENSERVICESOBJECT.FINDOCCODE " +
			", ENSERVICESOBJECT.FINDOCID " +
			", ENSERVICESOBJECT.COMMENTGEN " +
			", ENSERVICESOBJECT.CONTRACTNUMBERSERVICES " +
			", ENSERVICESOBJECT.CONTRACTDATESERVICES " +
			", ENSERVICESOBJECT.CONTRAGENTNAME " +
			", ENSERVICESOBJECT.CONTRAGENTADDRESS " +
			", ENSERVICESOBJECT.CONTRAGENTADDRESSWORK " +
			", ENSERVICESOBJECT.CONTRAGENTOKPO " +
			", ENSERVICESOBJECT.CONTRAGENTBANKACCOUNT " +
			", ENSERVICESOBJECT.CONTRAGENTBANKNAME " +
			", ENSERVICESOBJECT.CONTRAGENTBANKMFO " +
			", ENSERVICESOBJECT.CONTRAGENTBOSSNAME " +
			", ENSERVICESOBJECT.CONTRAGENTPASSPORT " +
			", ENSERVICESOBJECT.CONTRACTSERVICESSUMMA " +
			", ENSERVICESOBJECT.CONTRACTSERVICESSUMMVT " +
			", ENSERVICESOBJECT.CONTRACTSERVICESPOWER " +
			", ENSERVICESOBJECT.COMMENTSERVICESGEN " +
			", ENSERVICESOBJECT.CONTRACTSERVICESDISTNC " +
			", ENSERVICESOBJECT.CONTRACTSERVICESDAY " +
			", ENSERVICESOBJECT.USERGEN " +
			", ENSERVICESOBJECT.DATEEDIT " +
			", ENSERVICESOBJECT.WARRANTDATE " +
			", ENSERVICESOBJECT.WARRANTNUMBER " +
			", ENSERVICESOBJECT.WARRANTFIO " +
			", ENSERVICESOBJECT.REGIONALTYPE " +
			", ENSERVICESOBJECT.BASISTYPE " +
			", ENSERVICESOBJECT.CONTRAGENTPOSITION " +
			", ENSERVICESOBJECT.EXECUTEWORKDATE " +
			", ENSERVICESOBJECT.TIMESTART " +
			", ENSERVICESOBJECT.TIMEFINAL " +
			", ENSERVICESOBJECT.CONTRAGENTPHONENUMBER " +
			", ENSERVICESOBJECT.EXECUTORPHONENUMBER " +
			", ENSERVICESOBJECT.CONTRAGENTOBJECTWORK " +
			", ENSERVICESOBJECT.ISNOPAY " +
			", ENSERVICESOBJECT.ISCUSTOMERMATERIALS " +
			", ENSERVICESOBJECT.PAYDATE " +
			", ENSERVICESOBJECT.FINPAYFORMCODE " +
			", ENSERVICESOBJECT.FINPAYFORMNAME " +
			", ENSERVICESOBJECT.PARTNERID " +
			", ENSERVICESOBJECT.PAYDETAIL " +
			", ENSERVICESOBJECT.ACTTRANSFERNUMBER " +
			", ENSERVICESOBJECT.ACTTRANSFERDATE " +
			", ENSERVICESOBJECT.RESPOSIBLE " +
			", ENSERVICESOBJECT.RESPOSIBLEPOSITION " +
			", ENSERVICESOBJECT.RESPOSIBLETABNUMBER " +
			", ENSERVICESOBJECT.PREVCONTRACTSTATUS " +
			", ENSERVICESOBJECT.RECONNECTIONTU " +
			", ENSERVICESOBJECT.PERSONALACCOUNTCODE " +
			", ENSERVICESOBJECT.PERSONALACCOUNTNUMBER " +
			", ENSERVICESOBJECT.TABNUMBER " +
			", ENSERVICESOBJECT.CITIESLIST " +
			", ENSERVICESOBJECT.LINELENGTH " +
			", ENSERVICESOBJECT.PROJECTCODE " +
			", ENSERVICESOBJECT.CNPACKCODE " +
			", ENSERVICESOBJECT.DFPACKCODE " +
			", ENSERVICESOBJECT.COUNTERSZONETYPE " +
			", ENSERVICESOBJECT.AXPARTNERCODE " +
			", ENSERVICESOBJECT.AXPARTNERNAME " +
			", ENSERVICESOBJECT.AXCONTRACTNUMBER " +
			", ENSERVICESOBJECT.AXCONTRACTDATE " +
			", ENSERVICESOBJECT.AXCONTRACTCODE " +
			", ENSERVICESOBJECT.AXCONTRACTID " +
			", ENSERVICESOBJECT.AXCONTRACTCOMMENTGEN " +
			", ENSERVICESOBJECT.PROJAGREESUMMA " +
			", ENSERVICESOBJECT.TOPOGRAPHYSUMMA " +
			", ENSERVICESOBJECT.CREATEDFROMSITE " +
			", ENSERVICESOBJECT.TERM " +
			", ENSERVICESOBJECT.REGULATION " +
			", ENSERVICESOBJECT.BOUNDARYDATEWORK " +
			", ENSERVICESOBJECT.COUNTDAYDELAY " +
			", ENSERVICESOBJECT.FACTDATEWORK " +
			", ENSERVICESOBJECT.CODEEIC " +
			", ENSERVICESOBJECT.PERSONALACCOUNTUID " +
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
		" FROM ENSERVICESCOST " +
			" LEFT JOIN TKCALCCOST on TKCALCCOST.CODE = ENSERVICESCOST.TKCALCCOSTREFCODE "+
			" LEFT JOIN ENSERVICESOBJECT on ENSERVICESOBJECT.CODE = ENSERVICESCOST.SERVICESOBJECTREFCODE "+
			" LEFT JOIN ENPLANWORK on ENPLANWORK.CODE = ENSERVICESCOST.PLANREFCODE "+
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
				anObject = new ENServicesCostShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.dateGen = set.getDate(2);
				anObject.countGen = set.getBigDecimal(3);
				if(anObject.countGen != null) {
					anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.calculationCost = set.getBigDecimal(4);
				if(anObject.calculationCost != null) {
					anObject.calculationCost = anObject.calculationCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costWithoutVAT = set.getBigDecimal(5);
				if(anObject.costWithoutVAT != null) {
					anObject.costWithoutVAT = anObject.costWithoutVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costVAT = set.getBigDecimal(6);
				if(anObject.costVAT != null) {
					anObject.costVAT = anObject.costVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costWithVAT = set.getBigDecimal(7);
				if(anObject.costWithVAT != null) {
					anObject.costWithVAT = anObject.costWithVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.tkCalcCostRefCode = set.getInt(8);
				if(set.wasNull()) {
					anObject.tkCalcCostRefCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefCode = set.getInt(9);
				if(set.wasNull()) {
					anObject.servicesObjectRefCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefContractNumber = set.getString(10);
				anObject.servicesObjectRefContractDate = set.getDate(11);
				anObject.servicesObjectRefName = set.getString(12);
				anObject.servicesObjectRefPartnerCode = set.getString(13);
				anObject.servicesObjectRefFinDocCode = set.getString(14);
				anObject.servicesObjectRefFinDocID = set.getInt(15);
				if(set.wasNull()) {
					anObject.servicesObjectRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefCommentGen = set.getString(16);
				anObject.servicesObjectRefContractNumberServices = set.getString(17);
				anObject.servicesObjectRefContractDateServices = set.getDate(18);
				anObject.servicesObjectRefContragentName = set.getString(19);
				anObject.servicesObjectRefContragentAddress = set.getString(20);
				anObject.servicesObjectRefContragentAddressWork = set.getString(21);
				anObject.servicesObjectRefContragentOkpo = set.getString(22);
				anObject.servicesObjectRefContragentBankAccount = set.getString(23);
				anObject.servicesObjectRefContragentBankName = set.getString(24);
				anObject.servicesObjectRefContragentBankMfo = set.getString(25);
				anObject.servicesObjectRefContragentBossName = set.getString(26);
				anObject.servicesObjectRefContragentPassport = set.getString(27);
				anObject.servicesObjectRefContractServicesSumma = set.getBigDecimal(28);
				if(anObject.servicesObjectRefContractServicesSumma != null) {
					anObject.servicesObjectRefContractServicesSumma = anObject.servicesObjectRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesSummaVAT = set.getBigDecimal(29);
				if(anObject.servicesObjectRefContractServicesSummaVAT != null) {
					anObject.servicesObjectRefContractServicesSummaVAT = anObject.servicesObjectRefContractServicesSummaVAT.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesPower = set.getBigDecimal(30);
				if(anObject.servicesObjectRefContractServicesPower != null) {
					anObject.servicesObjectRefContractServicesPower = anObject.servicesObjectRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefCommentServicesGen = set.getString(31);
				anObject.servicesObjectRefContractServicesDistance = set.getBigDecimal(32);
				if(anObject.servicesObjectRefContractServicesDistance != null) {
					anObject.servicesObjectRefContractServicesDistance = anObject.servicesObjectRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesDay = set.getBigDecimal(33);
				if(anObject.servicesObjectRefContractServicesDay != null) {
					anObject.servicesObjectRefContractServicesDay = anObject.servicesObjectRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefUserGen = set.getString(34);
				anObject.servicesObjectRefDateEdit = set.getDate(35);
				anObject.servicesObjectRefWarrantDate = set.getDate(36);
				anObject.servicesObjectRefWarrantNumber = set.getString(37);
				anObject.servicesObjectRefWarrantFIO = set.getString(38);
				anObject.servicesObjectRefRegionalType = set.getInt(39);
				if(set.wasNull()) {
					anObject.servicesObjectRefRegionalType = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefBasisType = set.getBigDecimal(40);
				if(anObject.servicesObjectRefBasisType != null) {
					anObject.servicesObjectRefBasisType = anObject.servicesObjectRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContragentPosition = set.getString(41);
				anObject.servicesObjectRefExecuteWorkDate = set.getDate(42);
				anObject.servicesObjectRefTimeStart = set.getTimestamp(43);
				anObject.servicesObjectRefTimeFinal = set.getTimestamp(44);
				anObject.servicesObjectRefContragentPhoneNumber = set.getString(45);
				anObject.servicesObjectRefExecutorPhoneNumber = set.getString(46);
				anObject.servicesObjectRefContragentObjectWork = set.getString(47);
				anObject.servicesObjectRefIsNoPay = set.getInt(48);
				if(set.wasNull()) {
					anObject.servicesObjectRefIsNoPay = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefIsCustomerMaterials = set.getInt(49);
				if(set.wasNull()) {
					anObject.servicesObjectRefIsCustomerMaterials = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPayDate = set.getDate(50);
				anObject.servicesObjectRefFinPayFormCode = set.getInt(51);
				if(set.wasNull()) {
					anObject.servicesObjectRefFinPayFormCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefFinPayFormName = set.getString(52);
				anObject.servicesObjectRefPartnerId = set.getInt(53);
				if(set.wasNull()) {
					anObject.servicesObjectRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPayDetail = set.getString(54);
				anObject.servicesObjectRefActTransferNumber = set.getString(55);
				anObject.servicesObjectRefActTransferDate = set.getDate(56);
				anObject.servicesObjectRefResposible = set.getString(57);
				anObject.servicesObjectRefResposiblePosition = set.getString(58);
				anObject.servicesObjectRefResposibleTabNumber = set.getString(59);
				anObject.servicesObjectRefPrevContractStatus = set.getInt(60);
				if(set.wasNull()) {
					anObject.servicesObjectRefPrevContractStatus = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefReconnectionTU = set.getInt(61);
				if(set.wasNull()) {
					anObject.servicesObjectRefReconnectionTU = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPersonalAccountCode = set.getInt(62);
				if(set.wasNull()) {
					anObject.servicesObjectRefPersonalAccountCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPersonalAccountNumber = set.getString(63);
				anObject.servicesObjectRefTabNumber = set.getString(64);
				anObject.servicesObjectRefCitiesList = set.getString(65);
				anObject.servicesObjectRefLineLength = set.getBigDecimal(66);
				if(anObject.servicesObjectRefLineLength != null) {
					anObject.servicesObjectRefLineLength = anObject.servicesObjectRefLineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefProjectCode = set.getString(67);
				anObject.servicesObjectRefCnPackCode = set.getInt(68);
				if(set.wasNull()) {
					anObject.servicesObjectRefCnPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefDfPackCode = set.getInt(69);
				if(set.wasNull()) {
					anObject.servicesObjectRefDfPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefCountersZoneType = set.getInt(70);
				if(set.wasNull()) {
					anObject.servicesObjectRefCountersZoneType = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefAxPartnerCode = set.getString(71);
				anObject.servicesObjectRefAxPartnerName = set.getString(72);
				anObject.servicesObjectRefAxContractNumber = set.getString(73);
				anObject.servicesObjectRefAxContractDate = set.getDate(74);
				anObject.servicesObjectRefAxContractCode = set.getString(75);
				anObject.servicesObjectRefAxContractId = set.getString(76);
				anObject.servicesObjectRefAxContractCommentGen = set.getString(77);
				anObject.servicesObjectRefProjAgreeSumma = set.getBigDecimal(78);
				if(anObject.servicesObjectRefProjAgreeSumma != null) {
					anObject.servicesObjectRefProjAgreeSumma = anObject.servicesObjectRefProjAgreeSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefTopographySumma = set.getBigDecimal(79);
				if(anObject.servicesObjectRefTopographySumma != null) {
					anObject.servicesObjectRefTopographySumma = anObject.servicesObjectRefTopographySumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefCreatedFromSite = set.getInt(80);
				if(set.wasNull()) {
					anObject.servicesObjectRefCreatedFromSite = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefTerm = set.getInt(81);
				if(set.wasNull()) {
					anObject.servicesObjectRefTerm = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefRegulation = set.getInt(82);
				if(set.wasNull()) {
					anObject.servicesObjectRefRegulation = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefBoundaryDateWork = set.getDate(83);
				anObject.servicesObjectRefCountDayDelay = set.getInt(84);
				if(set.wasNull()) {
					anObject.servicesObjectRefCountDayDelay = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefFactDateWork = set.getDate(85);
				anObject.servicesObjectRefCodeEIC = set.getString(86);
				anObject.servicesObjectRefPersonalAccountUid = set.getString(87);
				anObject.planRefCode = set.getInt(88);
				if(set.wasNull()) {
					anObject.planRefCode = Integer.MIN_VALUE;
				}
				anObject.planRefDateGen = set.getTimestamp(89);
				anObject.planRefDateStart = set.getDate(90);
				anObject.planRefDateFinal = set.getDate(91);
				anObject.planRefYearGen = set.getInt(92);
				if(set.wasNull()) {
					anObject.planRefYearGen = Integer.MIN_VALUE;
				}
				anObject.planRefMonthGen = set.getInt(93);
				if(set.wasNull()) {
					anObject.planRefMonthGen = Integer.MIN_VALUE;
				}
				anObject.planRefYearOriginal = set.getInt(94);
				if(set.wasNull()) {
					anObject.planRefYearOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefMonthOriginal = set.getInt(95);
				if(set.wasNull()) {
					anObject.planRefMonthOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefUserGen = set.getString(96);
				anObject.planRefDateEdit = set.getDate(97);
				anObject.planRefWorkOrderNumber = set.getString(98);
				anObject.planRefDateWorkOrder = set.getDate(99);
				anObject.planRefPriConnectionNumber = set.getString(100);
				anObject.planRefDateEndPriConnection = set.getDate(101);
				anObject.planRefInvestWorksDescription = set.getString(102);
				anObject.planRefServicesFSideFinId = set.getInt(103);
				if(set.wasNull()) {
					anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;
				}
				anObject.planRefServicesFSideCnNum = set.getString(104);
				anObject.planRefTotalTimeHours = set.getBigDecimal(105);
				if(anObject.planRefTotalTimeHours != null) {
					anObject.planRefTotalTimeHours = anObject.planRefTotalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefTotalTimeDays = set.getBigDecimal(106);
				if(anObject.planRefTotalTimeDays != null) {
					anObject.planRefTotalTimeDays = anObject.planRefTotalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefInvestItemNumber = set.getString(107);

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
	
	public int[] getFilteredCodeArray(ENServicesCostFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENServicesCostFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENServicesCost aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENSERVICESCOST.CODE FROM ENSERVICESCOST";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSERVICESCOST.CODE";
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


	public ENServicesCost getObject(int uid) throws PersistenceException {
		ENServicesCost result = new ENServicesCost();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENServicesCost anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENSERVICESCOST.CODE, ENSERVICESCOST.DATEGEN, ENSERVICESCOST.COUNTGEN, ENSERVICESCOST.MATERIALEXPENSES, ENSERVICESCOST.TRANSPORTEXPENSES, ENSERVICESCOST.DELIVERYCOST, ENSERVICESCOST.SALARYEXPENSES, ENSERVICESCOST.SOCIALCHARGES, ENSERVICESCOST.DIRECTEXPENSES, ENSERVICESCOST.PRODUCTIONEXPENSES, ENSERVICESCOST.TOTALEXPENSES, ENSERVICESCOST.NORMINCOME, ENSERVICESCOST.CALCULATIONCOST, ENSERVICESCOST.COSTWITHOUTVAT, ENSERVICESCOST.COSTVAT, ENSERVICESCOST.COSTWITHVAT, ENSERVICESCOST.TKCALCCOSTREFCODE, ENSERVICESCOST.SERVICESOBJECTREFCODE, ENSERVICESCOST.PLANREFCODE "
			+" FROM ENSERVICESCOST WHERE ENSERVICESCOST.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.dateGen = set.getDate(2);
				anObject.countGen = set.getBigDecimal(3);
				if(anObject.countGen != null) {
					anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.materialExpenses = set.getBigDecimal(4);
				if(anObject.materialExpenses != null) {
					anObject.materialExpenses = anObject.materialExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.transportExpenses = set.getBigDecimal(5);
				if(anObject.transportExpenses != null) {
					anObject.transportExpenses = anObject.transportExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.deliveryCost = set.getBigDecimal(6);
				if(anObject.deliveryCost != null) {
					anObject.deliveryCost = anObject.deliveryCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryExpenses = set.getBigDecimal(7);
				if(anObject.salaryExpenses != null) {
					anObject.salaryExpenses = anObject.salaryExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.socialCharges = set.getBigDecimal(8);
				if(anObject.socialCharges != null) {
					anObject.socialCharges = anObject.socialCharges.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.directExpenses = set.getBigDecimal(9);
				if(anObject.directExpenses != null) {
					anObject.directExpenses = anObject.directExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.productionExpenses = set.getBigDecimal(10);
				if(anObject.productionExpenses != null) {
					anObject.productionExpenses = anObject.productionExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.totalExpenses = set.getBigDecimal(11);
				if(anObject.totalExpenses != null) {
					anObject.totalExpenses = anObject.totalExpenses.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.normIncome = set.getBigDecimal(12);
				if(anObject.normIncome != null) {
					anObject.normIncome = anObject.normIncome.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.calculationCost = set.getBigDecimal(13);
				if(anObject.calculationCost != null) {
					anObject.calculationCost = anObject.calculationCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costWithoutVAT = set.getBigDecimal(14);
				if(anObject.costWithoutVAT != null) {
					anObject.costWithoutVAT = anObject.costWithoutVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costVAT = set.getBigDecimal(15);
				if(anObject.costVAT != null) {
					anObject.costVAT = anObject.costVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costWithVAT = set.getBigDecimal(16);
				if(anObject.costWithVAT != null) {
					anObject.costWithVAT = anObject.costWithVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.tkCalcCostRef.code = set.getInt(17);
				if (set.wasNull()) {
					anObject.tkCalcCostRef.code = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRef.code = set.getInt(18);
				if (set.wasNull()) {
					anObject.servicesObjectRef.code = Integer.MIN_VALUE;
				}
				anObject.planRef.code = set.getInt(19);
				if (set.wasNull()) {
					anObject.planRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENServicesCostRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENServicesCostRef ref = new com.ksoe.energynet.valueobject.references.ENServicesCostRef();
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

		selectStr = "DELETE FROM  ENSERVICESCOST WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENServicesCost object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENServicesCost.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesCost.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENServicesCost.remove%} access denied");
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
	
	public long count(ENServicesCostFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENServicesCostFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENServicesCostFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENSERVICESCOST", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENServicesCostFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENSERVICESCOST");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesCost.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENServicesCost.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENSERVICESCOST.CODE FROM  ENSERVICESCOST WHERE  ENSERVICESCOST.CODE = ?";
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
		_checkConditionToken(condition,"code","ENSERVICESCOST.CODE");
		_checkConditionToken(condition,"dategen","ENSERVICESCOST.DATEGEN");
		_checkConditionToken(condition,"countgen","ENSERVICESCOST.COUNTGEN");
		_checkConditionToken(condition,"materialexpenses","ENSERVICESCOST.MATERIALEXPENSES");
		_checkConditionToken(condition,"transportexpenses","ENSERVICESCOST.TRANSPORTEXPENSES");
		_checkConditionToken(condition,"deliverycost","ENSERVICESCOST.DELIVERYCOST");
		_checkConditionToken(condition,"salaryexpenses","ENSERVICESCOST.SALARYEXPENSES");
		_checkConditionToken(condition,"socialcharges","ENSERVICESCOST.SOCIALCHARGES");
		_checkConditionToken(condition,"directexpenses","ENSERVICESCOST.DIRECTEXPENSES");
		_checkConditionToken(condition,"productionexpenses","ENSERVICESCOST.PRODUCTIONEXPENSES");
		_checkConditionToken(condition,"totalexpenses","ENSERVICESCOST.TOTALEXPENSES");
		_checkConditionToken(condition,"normincome","ENSERVICESCOST.NORMINCOME");
		_checkConditionToken(condition,"calculationcost","ENSERVICESCOST.CALCULATIONCOST");
		_checkConditionToken(condition,"costwithoutvat","ENSERVICESCOST.COSTWITHOUTVAT");
		_checkConditionToken(condition,"costvat","ENSERVICESCOST.COSTVAT");
		_checkConditionToken(condition,"costwithvat","ENSERVICESCOST.COSTWITHVAT");
		// relationship conditions
		_checkConditionToken(condition,"tkcalccostref","TKCALCCOSTREFCODE");
		_checkConditionToken(condition,"tkcalccostref.code","TKCALCCOSTREFCODE");
		_checkConditionToken(condition,"servicesobjectref","SERVICESOBJECTREFCODE");
		_checkConditionToken(condition,"servicesobjectref.code","SERVICESOBJECTREFCODE");
		_checkConditionToken(condition,"planref","PLANREFCODE");
		_checkConditionToken(condition,"planref.code","PLANREFCODE");
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
	
	private void _collectAutoIncrementFields(ENServicesCost anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENSERVICESCOST", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENSERVICESCOST", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENSERVICESCOST", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENSERVICESCOST");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENServicesCostDAO
