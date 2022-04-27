
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
import com.ksoe.energynet.valueobject.ENServicesHumenSalary;
import com.ksoe.energynet.valueobject.filter.ENServicesHumenSalaryFilter;
import com.ksoe.energynet.valueobject.brief.ENServicesHumenSalaryShort;
import com.ksoe.energynet.valueobject.lists.ENServicesHumenSalaryShortList;


/**
 * DAO Object for ENServicesHumenSalary;
 *
 */

public class ENServicesHumenSalaryDAOGen extends GenericDataMiner {

	public ENServicesHumenSalaryDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENServicesHumenSalaryDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENServicesHumenSalary inObject) throws PersistenceException {
		ENServicesHumenSalary obj = new ENServicesHumenSalary();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.timeGen == null && obj.timeGen == null){}
		else
			if(inObject.timeGen == null || obj.timeGen == null) return false;
			else
				if ( ! inObject.timeGen.equals(obj.timeGen)){
					return false;
				}

		if(inObject.salary == null && obj.salary == null){}
		else
			if(inObject.salary == null || obj.salary == null) return false;
			else
				if ( ! inObject.salary.equals(obj.salary)){
					return false;
				}

		if(inObject.salaryBonus == null && obj.salaryBonus == null){}
		else
			if(inObject.salaryBonus == null || obj.salaryBonus == null) return false;
			else
				if ( ! inObject.salaryBonus.equals(obj.salaryBonus)){
					return false;
				}

		if(inObject.salarySurcharge == null && obj.salarySurcharge == null){}
		else
			if(inObject.salarySurcharge == null || obj.salarySurcharge == null) return false;
			else
				if ( ! inObject.salarySurcharge.equals(obj.salarySurcharge)){
					return false;
				}

		if(inObject.salaryPremium == null && obj.salaryPremium == null){}
		else
			if(inObject.salaryPremium == null || obj.salaryPremium == null) return false;
			else
				if ( ! inObject.salaryPremium.equals(obj.salaryPremium)){
					return false;
				}

		if(inObject.salaryAdditional == null && obj.salaryAdditional == null){}
		else
			if(inObject.salaryAdditional == null || obj.salaryAdditional == null) return false;
			else
				if ( ! inObject.salaryAdditional.equals(obj.salaryAdditional)){
					return false;
				}

		if(inObject.salaryTotalBonus == null && obj.salaryTotalBonus == null){}
		else
			if(inObject.salaryTotalBonus == null || obj.salaryTotalBonus == null) return false;
			else
				if ( ! inObject.salaryTotalBonus.equals(obj.salaryTotalBonus)){
					return false;
				}

		if(inObject.salaryTotal == null && obj.salaryTotal == null){}
		else
			if(inObject.salaryTotal == null || obj.salaryTotal == null) return false;
			else
				if ( ! inObject.salaryTotal.equals(obj.salaryTotal)){
					return false;
				}
		if (inObject.servicesCostRef.code != obj.servicesCostRef.code){
			return false;
		}
		if (inObject.calcHumenSalaryRef.code != obj.calcHumenSalaryRef.code){
			return false;
		}
		return true;
	}

	public int add(ENServicesHumenSalary anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENServicesHumenSalary anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENSERVICESHUMENSALARY (CODE,TIMEGEN,SALARY,SALARYBONUS,SALARYSURCHARGE,SALARYPREMIUM,SALARYADDITIONAL,SALARYTOTALBONUS,SALARYTOTAL,SERVICESCOSTREFCODE,CALCHUMENSALARYREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?)";

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
			if (anObject.salary != null) {
				anObject.salary = anObject.salary.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(3,anObject.salary);
			if (anObject.salaryBonus != null) {
				anObject.salaryBonus = anObject.salaryBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(4,anObject.salaryBonus);
			if (anObject.salarySurcharge != null) {
				anObject.salarySurcharge = anObject.salarySurcharge.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(5,anObject.salarySurcharge);
			if (anObject.salaryPremium != null) {
				anObject.salaryPremium = anObject.salaryPremium.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(6,anObject.salaryPremium);
			if (anObject.salaryAdditional != null) {
				anObject.salaryAdditional = anObject.salaryAdditional.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(7,anObject.salaryAdditional);
			if (anObject.salaryTotalBonus != null) {
				anObject.salaryTotalBonus = anObject.salaryTotalBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(8,anObject.salaryTotalBonus);
			if (anObject.salaryTotal != null) {
				anObject.salaryTotal = anObject.salaryTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(9,anObject.salaryTotal);
			if (anObject.servicesCostRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENServicesCostDAOGen(connection,getUserProfile()).exists(anObject.servicesCostRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENServicesHumenSalary.servicesCostRef.code%} = {%"+anObject.servicesCostRef.code+"%}");
				}
				statement.setInt(10,anObject.servicesCostRef.code);
			} else {
				statement.setNull(10,java.sql.Types.INTEGER);
			}
			if (anObject.calcHumenSalaryRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.techcard.dataminer.generated.TKCalcHumenSalaryDAOGen(connection,getUserProfile()).exists(anObject.calcHumenSalaryRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENServicesHumenSalary.calcHumenSalaryRef.code%} = {%"+anObject.calcHumenSalaryRef.code+"%}");
				}
				statement.setInt(11,anObject.calcHumenSalaryRef.code);
			} else {
				statement.setNull(11,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENServicesHumenSalaryDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENServicesHumenSalary anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENServicesHumenSalary anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("SALARY") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SALARYBONUS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SALARYSURCHARGE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SALARYPREMIUM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SALARYADDITIONAL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SALARYTOTALBONUS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SALARYTOTAL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SERVICESCOSTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CALCHUMENSALARYREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENSERVICESHUMENSALARY SET  TIMEGEN = ? , SALARY = ? , SALARYBONUS = ? , SALARYSURCHARGE = ? , SALARYPREMIUM = ? , SALARYADDITIONAL = ? , SALARYTOTALBONUS = ? , SALARYTOTAL = ? , SERVICESCOSTREFCODE = ? , CALCHUMENSALARYREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENSERVICESHUMENSALARY SET ";
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
					if (anObject.salary != null) {
						anObject.salary = anObject.salary.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(2,anObject.salary);
					if (anObject.salaryBonus != null) {
						anObject.salaryBonus = anObject.salaryBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(3,anObject.salaryBonus);
					if (anObject.salarySurcharge != null) {
						anObject.salarySurcharge = anObject.salarySurcharge.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(4,anObject.salarySurcharge);
					if (anObject.salaryPremium != null) {
						anObject.salaryPremium = anObject.salaryPremium.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(5,anObject.salaryPremium);
					if (anObject.salaryAdditional != null) {
						anObject.salaryAdditional = anObject.salaryAdditional.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(6,anObject.salaryAdditional);
					if (anObject.salaryTotalBonus != null) {
						anObject.salaryTotalBonus = anObject.salaryTotalBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(7,anObject.salaryTotalBonus);
					if (anObject.salaryTotal != null) {
						anObject.salaryTotal = anObject.salaryTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(8,anObject.salaryTotal);
					if (anObject.servicesCostRef.code != Integer.MIN_VALUE) {
						statement.setInt(9,anObject.servicesCostRef.code);
					} else {
						statement.setNull(9,java.sql.Types.INTEGER);
					}
					if (anObject.calcHumenSalaryRef.code != Integer.MIN_VALUE) {
						statement.setInt(10,anObject.calcHumenSalaryRef.code);
					} else {
						statement.setNull(10,java.sql.Types.INTEGER);
					}
					statement.setInt(11,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("TIMEGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.timeGen != null) {
								anObject.timeGen = anObject.timeGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.timeGen);
							continue;
						}
						if("SALARY".compareTo((String)fields.get(i)) == 0) {
							if (anObject.salary != null) {
								anObject.salary = anObject.salary.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.salary);
							continue;
						}
						if("SALARYBONUS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.salaryBonus != null) {
								anObject.salaryBonus = anObject.salaryBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.salaryBonus);
							continue;
						}
						if("SALARYSURCHARGE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.salarySurcharge != null) {
								anObject.salarySurcharge = anObject.salarySurcharge.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.salarySurcharge);
							continue;
						}
						if("SALARYPREMIUM".compareTo((String)fields.get(i)) == 0) {
							if (anObject.salaryPremium != null) {
								anObject.salaryPremium = anObject.salaryPremium.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.salaryPremium);
							continue;
						}
						if("SALARYADDITIONAL".compareTo((String)fields.get(i)) == 0) {
							if (anObject.salaryAdditional != null) {
								anObject.salaryAdditional = anObject.salaryAdditional.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.salaryAdditional);
							continue;
						}
						if("SALARYTOTALBONUS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.salaryTotalBonus != null) {
								anObject.salaryTotalBonus = anObject.salaryTotalBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.salaryTotalBonus);
							continue;
						}
						if("SALARYTOTAL".compareTo((String)fields.get(i)) == 0) {
							if (anObject.salaryTotal != null) {
								anObject.salaryTotal = anObject.salaryTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.salaryTotal);
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
						if("CALCHUMENSALARYREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.calcHumenSalaryRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.calcHumenSalaryRef.code);
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

	} // end of save(ENServicesHumenSalary anObject,String[] anAttributes)


	public ENServicesHumenSalaryShort getShortObject(int anObjectCode) throws PersistenceException {
		ENServicesHumenSalary filterObject = new ENServicesHumenSalary();
		Vector<ENServicesHumenSalaryShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENServicesHumenSalaryShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENServicesHumenSalary filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.timeGen, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.salary, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.salaryBonus, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.salarySurcharge, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.salaryPremium, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.salaryAdditional, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.salaryTotalBonus, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.salaryTotal, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.servicesCostRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.calcHumenSalaryRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENServicesHumenSalaryFilter filter) {
		String out = buildCondition((ENServicesHumenSalary)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENServicesHumenSalary filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENServicesHumenSalary.code_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.timeGen, ENServicesHumenSalary.timeGen_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.salary, ENServicesHumenSalary.salary_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.salaryBonus, ENServicesHumenSalary.salaryBonus_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.salarySurcharge, ENServicesHumenSalary.salarySurcharge_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.salaryPremium, ENServicesHumenSalary.salaryPremium_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.salaryAdditional, ENServicesHumenSalary.salaryAdditional_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.salaryTotalBonus, ENServicesHumenSalary.salaryTotalBonus_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.salaryTotal, ENServicesHumenSalary.salaryTotal_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.servicesCostRef.code, ENServicesHumenSalary.servicesCostRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.calcHumenSalaryRef.code, ENServicesHumenSalary.calcHumenSalaryRef_QFielld, out);
		}
		return out;
	}

	public ENServicesHumenSalaryShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENServicesHumenSalaryShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENServicesHumenSalaryShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENServicesHumenSalaryShortList getFilteredList(ENServicesHumenSalary filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENServicesHumenSalaryShortList getScrollableFilteredList(ENServicesHumenSalary aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENServicesHumenSalaryShortList getScrollableFilteredList(ENServicesHumenSalary aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENServicesHumenSalaryShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENServicesHumenSalaryShortList getScrollableFilteredList(ENServicesHumenSalaryFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENServicesHumenSalaryShortList getScrollableFilteredList(ENServicesHumenSalaryFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENServicesHumenSalaryShortList getScrollableFilteredList(ENServicesHumenSalary aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENServicesHumenSalaryShortList result = new ENServicesHumenSalaryShortList();
		ENServicesHumenSalaryShort anObject;
		result.list = new Vector<ENServicesHumenSalaryShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSERVICESHUMENSALARY.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSERVICESHUMENSALARY.CODE"+
			",ENSERVICESHUMENSALARY.TIMEGEN"+
			",ENSERVICESHUMENSALARY.SALARY"+
			",ENSERVICESHUMENSALARY.SALARYTOTALBONUS"+
			",ENSERVICESHUMENSALARY.SALARYTOTAL"+
			", ENSERVICESCOST.CODE " +
			", ENSERVICESCOST.DATEGEN " +
			", ENSERVICESCOST.CALCULATIONCOST " +
			", ENSERVICESCOST.COSTWITHOUTVAT " +
			", ENSERVICESCOST.COSTVAT " +
			", ENSERVICESCOST.COSTWITHVAT " +
			", TKCALCHUMENSALARY.CODE " +
		" FROM ENSERVICESHUMENSALARY " +
			", ENSERVICESCOST " +
			", TKCALCHUMENSALARY " +
		"";
		whereStr = " ENSERVICESCOST.CODE = ENSERVICESHUMENSALARY.SERVICESCOSTREFCODE" ; //+
		whereStr += " AND TKCALCHUMENSALARY.CODE = ENSERVICESHUMENSALARY.CALCHUMENSALARYREFCODE" ; //+

	
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
				anObject = new ENServicesHumenSalaryShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.timeGen = set.getBigDecimal(2);
				if(anObject.timeGen != null) {
					anObject.timeGen = anObject.timeGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salary = set.getBigDecimal(3);
				if(anObject.salary != null) {
					anObject.salary = anObject.salary.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryTotalBonus = set.getBigDecimal(4);
				if(anObject.salaryTotalBonus != null) {
					anObject.salaryTotalBonus = anObject.salaryTotalBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryTotal = set.getBigDecimal(5);
				if(anObject.salaryTotal != null) {
					anObject.salaryTotal = anObject.salaryTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
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
				anObject.calcHumenSalaryRefCode = set.getInt(12);
				if(set.wasNull()) {
					anObject.calcHumenSalaryRefCode = Integer.MIN_VALUE;
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
	
	public int[] getFilteredCodeArray(ENServicesHumenSalaryFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENServicesHumenSalaryFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENServicesHumenSalary aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENSERVICESHUMENSALARY.CODE FROM ENSERVICESHUMENSALARY";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSERVICESHUMENSALARY.CODE";
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

	public ENServicesHumenSalary getObject(int uid) throws PersistenceException {
		ENServicesHumenSalary result = new ENServicesHumenSalary();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENServicesHumenSalary anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENSERVICESHUMENSALARY.CODE, ENSERVICESHUMENSALARY.TIMEGEN, ENSERVICESHUMENSALARY.SALARY, ENSERVICESHUMENSALARY.SALARYBONUS, ENSERVICESHUMENSALARY.SALARYSURCHARGE, ENSERVICESHUMENSALARY.SALARYPREMIUM, ENSERVICESHUMENSALARY.SALARYADDITIONAL, ENSERVICESHUMENSALARY.SALARYTOTALBONUS, ENSERVICESHUMENSALARY.SALARYTOTAL, ENSERVICESHUMENSALARY.SERVICESCOSTREFCODE, ENSERVICESHUMENSALARY.CALCHUMENSALARYREFCODE "
			+" FROM ENSERVICESHUMENSALARY WHERE ENSERVICESHUMENSALARY.CODE = ?";

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
				anObject.salary = set.getBigDecimal(3);
				if(anObject.salary != null) {
					anObject.salary = anObject.salary.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryBonus = set.getBigDecimal(4);
				if(anObject.salaryBonus != null) {
					anObject.salaryBonus = anObject.salaryBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salarySurcharge = set.getBigDecimal(5);
				if(anObject.salarySurcharge != null) {
					anObject.salarySurcharge = anObject.salarySurcharge.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryPremium = set.getBigDecimal(6);
				if(anObject.salaryPremium != null) {
					anObject.salaryPremium = anObject.salaryPremium.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryAdditional = set.getBigDecimal(7);
				if(anObject.salaryAdditional != null) {
					anObject.salaryAdditional = anObject.salaryAdditional.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryTotalBonus = set.getBigDecimal(8);
				if(anObject.salaryTotalBonus != null) {
					anObject.salaryTotalBonus = anObject.salaryTotalBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryTotal = set.getBigDecimal(9);
				if(anObject.salaryTotal != null) {
					anObject.salaryTotal = anObject.salaryTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesCostRef.code = set.getInt(10);
				if (set.wasNull()) {
					anObject.servicesCostRef.code = Integer.MIN_VALUE;
				}
				anObject.calcHumenSalaryRef.code = set.getInt(11);
				if (set.wasNull()) {
					anObject.calcHumenSalaryRef.code = Integer.MIN_VALUE;
				}
				if(anObject.servicesCostRef.code != Integer.MIN_VALUE) {
					anObject.setServicesCostRef(
						new com.ksoe.energynet.dataminer.generated.ENServicesCostDAOGen(connection,getUserProfile()).getRef(anObject.servicesCostRef.code));
				}
				if(anObject.calcHumenSalaryRef.code != Integer.MIN_VALUE) {
					anObject.setCalcHumenSalaryRef(
						new com.ksoe.techcard.dataminer.generated.TKCalcHumenSalaryDAOGen(connection,getUserProfile()).getRef(anObject.calcHumenSalaryRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENServicesHumenSalaryRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENServicesHumenSalaryRef ref = new com.ksoe.energynet.valueobject.references.ENServicesHumenSalaryRef();
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

		selectStr = "DELETE FROM  ENSERVICESHUMENSALARY WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENServicesHumenSalary object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENServicesHumenSalary.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesHumenSalary.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENServicesHumenSalary.remove%} access denied");
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
	
	public long count(ENServicesHumenSalaryFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENServicesHumenSalaryFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENServicesHumenSalaryFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENSERVICESHUMENSALARY", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENServicesHumenSalaryFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENSERVICESHUMENSALARY");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesHumenSalary.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENServicesHumenSalary.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENSERVICESHUMENSALARY.CODE FROM  ENSERVICESHUMENSALARY WHERE  ENSERVICESHUMENSALARY.CODE = ?";
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
		_checkConditionToken(condition,"code","ENSERVICESHUMENSALARY.CODE");
		_checkConditionToken(condition,"timegen","ENSERVICESHUMENSALARY.TIMEGEN");
		_checkConditionToken(condition,"salary","ENSERVICESHUMENSALARY.SALARY");
		_checkConditionToken(condition,"salarybonus","ENSERVICESHUMENSALARY.SALARYBONUS");
		_checkConditionToken(condition,"salarysurcharge","ENSERVICESHUMENSALARY.SALARYSURCHARGE");
		_checkConditionToken(condition,"salarypremium","ENSERVICESHUMENSALARY.SALARYPREMIUM");
		_checkConditionToken(condition,"salaryadditional","ENSERVICESHUMENSALARY.SALARYADDITIONAL");
		_checkConditionToken(condition,"salarytotalbonus","ENSERVICESHUMENSALARY.SALARYTOTALBONUS");
		_checkConditionToken(condition,"salarytotal","ENSERVICESHUMENSALARY.SALARYTOTAL");
		// relationship conditions
		_checkConditionToken(condition,"servicescostref","SERVICESCOSTREFCODE");
		_checkConditionToken(condition,"servicescostref.code","SERVICESCOSTREFCODE");
		_checkConditionToken(condition,"calchumensalaryref","CALCHUMENSALARYREFCODE");
		_checkConditionToken(condition,"calchumensalaryref.code","CALCHUMENSALARYREFCODE");
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
	
	private void _collectAutoIncrementFields(ENServicesHumenSalary anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENSERVICESHUMENSALARY", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENSERVICESHUMENSALARY", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENSERVICESHUMENSALARY", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENSERVICESHUMENSALARY");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENServicesHumenSalaryDAO
