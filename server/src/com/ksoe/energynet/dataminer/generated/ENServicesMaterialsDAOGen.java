
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
import com.ksoe.energynet.valueobject.ENServicesMaterials;
import com.ksoe.energynet.valueobject.filter.ENServicesMaterialsFilter;
import com.ksoe.energynet.valueobject.brief.ENServicesMaterialsShort;
import com.ksoe.energynet.valueobject.lists.ENServicesMaterialsShortList;


/**
 * DAO Object for ENServicesMaterials;
 *
 */

public class ENServicesMaterialsDAOGen extends GenericDataMiner {

	public ENServicesMaterialsDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENServicesMaterialsDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENServicesMaterials inObject) throws PersistenceException {
		ENServicesMaterials obj = new ENServicesMaterials();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.materialName == null && obj.materialName == null){}
		else
			if(inObject.materialName == null || obj.materialName == null) return false;
			else
				if ( ! inObject.materialName.equals(obj.materialName)){
					return false;
				}

		if(inObject.measureUnitName == null && obj.measureUnitName == null){}
		else
			if(inObject.measureUnitName == null || obj.measureUnitName == null) return false;
			else
				if ( ! inObject.measureUnitName.equals(obj.measureUnitName)){
					return false;
				}

		if(inObject.priceGen == null && obj.priceGen == null){}
		else
			if(inObject.priceGen == null || obj.priceGen == null) return false;
			else
				if ( ! inObject.priceGen.equals(obj.priceGen)){
					return false;
				}

		if(inObject.countGen == null && obj.countGen == null){}
		else
			if(inObject.countGen == null || obj.countGen == null) return false;
			else
				if ( ! inObject.countGen.equals(obj.countGen)){
					return false;
				}

		if(inObject.sumGen == null && obj.sumGen == null){}
		else
			if(inObject.sumGen == null || obj.sumGen == null) return false;
			else
				if ( ! inObject.sumGen.equals(obj.sumGen)){
					return false;
				}
		if (inObject.servicesCostRef.code != obj.servicesCostRef.code){
			return false;
		}
		if (inObject.calcMaterialsRef.code != obj.calcMaterialsRef.code){
			return false;
		}
		if (inObject.materialRef.code != obj.materialRef.code){
			return false;
		}
		if (inObject.kartaRef.code != obj.kartaRef.code){
			return false;
		}
		return true;
	}

	public int add(ENServicesMaterials anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENServicesMaterials anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENSERVICESMATERIALS (CODE,MATERIALNAME,MEASUREUNITNAME,PRICEGEN,COUNTGEN,SUMGEN,SERVICESCOSTREFCODE,CALCMATERIALSREFCODE,MATERIALREFCODE,KARTAREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.materialName);
			statement.setString(3, anObject.measureUnitName);
			if (anObject.priceGen != null) {
				anObject.priceGen = anObject.priceGen.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(4, anObject.priceGen);
			if (anObject.countGen != null) {
				anObject.countGen = anObject.countGen.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(5, anObject.countGen);
			if (anObject.sumGen != null) {
				anObject.sumGen = anObject.sumGen.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(6, anObject.sumGen);
			if (anObject.servicesCostRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENServicesCostDAOGen(connection,getUserProfile()).exists(anObject.servicesCostRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENServicesMaterials.servicesCostRef.code%} = {%"+anObject.servicesCostRef.code+"%}");
				}
				statement.setInt(7,anObject.servicesCostRef.code);
			} else {
				statement.setNull(7,java.sql.Types.INTEGER);
			}
			if (anObject.calcMaterialsRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.techcard.dataminer.generated.TKCalcMaterialsDAOGen(connection,getUserProfile()).exists(anObject.calcMaterialsRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENServicesMaterials.calcMaterialsRef.code%} = {%"+anObject.calcMaterialsRef.code+"%}");
				}
				statement.setInt(8,anObject.calcMaterialsRef.code);
			} else {
				statement.setNull(8,java.sql.Types.INTEGER);
			}
			if (anObject.materialRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.techcard.dataminer.generated.TKMaterialsDAOGen(connection,getUserProfile()).exists(anObject.materialRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENServicesMaterials.materialRef.code%} = {%"+anObject.materialRef.code+"%}");
				}
				statement.setInt(9,anObject.materialRef.code);
			} else {
				statement.setNull(9,java.sql.Types.INTEGER);
			}
			if (anObject.kartaRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.techcard.dataminer.generated.TKTechCardDAOGen(connection,getUserProfile()).exists(anObject.kartaRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENServicesMaterials.kartaRef.code%} = {%"+anObject.kartaRef.code+"%}");
				}
				statement.setInt(10,anObject.kartaRef.code);
			} else {
				statement.setNull(10,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENServicesMaterialsDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENServicesMaterials anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENServicesMaterials anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("MATERIALNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MEASUREUNITNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PRICEGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COUNTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SUMGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SERVICESCOSTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CALCMATERIALSREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MATERIALREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KARTAREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENSERVICESMATERIALS SET  MATERIALNAME = ? , MEASUREUNITNAME = ? , PRICEGEN = ? , COUNTGEN = ? , SUMGEN = ? , SERVICESCOSTREFCODE = ? , CALCMATERIALSREFCODE = ? , MATERIALREFCODE = ? , KARTAREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENSERVICESMATERIALS SET ";
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
					statement.setString(1, anObject.materialName);
					statement.setString(2, anObject.measureUnitName);
					if (anObject.priceGen != null) {
						anObject.priceGen = anObject.priceGen.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(3, anObject.priceGen);
					if (anObject.countGen != null) {
						anObject.countGen = anObject.countGen.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(4, anObject.countGen);
					if (anObject.sumGen != null) {
						anObject.sumGen = anObject.sumGen.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(5, anObject.sumGen);
					if (anObject.servicesCostRef.code != Integer.MIN_VALUE) {
						statement.setInt(6, anObject.servicesCostRef.code);
					} else {
						statement.setNull(6, java.sql.Types.INTEGER);
					}
					if (anObject.calcMaterialsRef.code != Integer.MIN_VALUE) {
						statement.setInt(7, anObject.calcMaterialsRef.code);
					} else {
						statement.setNull(7, java.sql.Types.INTEGER);
					}
					if (anObject.materialRef.code != Integer.MIN_VALUE) {
						statement.setInt(8, anObject.materialRef.code);
					} else {
						statement.setNull(8, java.sql.Types.INTEGER);
					}
					if (anObject.kartaRef.code != Integer.MIN_VALUE) {
						statement.setInt(9, anObject.kartaRef.code);
					} else {
						statement.setNull(9, java.sql.Types.INTEGER);
					}
					statement.setInt(10, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("MATERIALNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.materialName);
							continue;
						}
						if("MEASUREUNITNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.measureUnitName);
							continue;
						}
						if("PRICEGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.priceGen != null) {
								anObject.priceGen = anObject.priceGen.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.priceGen);
							continue;
						}
						if("COUNTGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.countGen != null) {
								anObject.countGen = anObject.countGen.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.countGen);
							continue;
						}
						if("SUMGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sumGen != null) {
								anObject.sumGen = anObject.sumGen.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.sumGen);
							continue;
						}
						if("SERVICESCOSTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.servicesCostRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.servicesCostRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("CALCMATERIALSREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.calcMaterialsRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.calcMaterialsRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("MATERIALREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.materialRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.materialRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("KARTAREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.kartaRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.kartaRef.code);
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

	} // end of save(ENServicesMaterials anObject,String[] anAttributes)


	public ENServicesMaterialsShort getShortObject(int anObjectCode) throws PersistenceException {
		ENServicesMaterials filterObject = new ENServicesMaterials();
		Vector<ENServicesMaterialsShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENServicesMaterialsShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENServicesMaterials filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.materialName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.measureUnitName, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.priceGen, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.countGen, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.sumGen, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.servicesCostRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.calcMaterialsRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.materialRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.kartaRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENServicesMaterialsFilter filter) {
		String out = buildCondition((ENServicesMaterials)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENServicesMaterials filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENServicesMaterials.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.materialName, ENServicesMaterials.materialName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.measureUnitName, ENServicesMaterials.measureUnitName_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.priceGen, ENServicesMaterials.priceGen_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.countGen, ENServicesMaterials.countGen_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.sumGen, ENServicesMaterials.sumGen_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.servicesCostRef.code, ENServicesMaterials.servicesCostRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.calcMaterialsRef.code, ENServicesMaterials.calcMaterialsRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.materialRef.code, ENServicesMaterials.materialRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.kartaRef.code, ENServicesMaterials.kartaRef_QFielld, out);
		}
		return out;
	}

	public ENServicesMaterialsShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENServicesMaterialsShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENServicesMaterialsShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENServicesMaterialsShortList getFilteredList(ENServicesMaterials filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENServicesMaterialsShortList getScrollableFilteredList(ENServicesMaterials aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENServicesMaterialsShortList getScrollableFilteredList(ENServicesMaterials aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENServicesMaterialsShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENServicesMaterialsShortList getScrollableFilteredList(ENServicesMaterialsFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENServicesMaterialsShortList getScrollableFilteredList(ENServicesMaterialsFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENServicesMaterialsShortList getScrollableFilteredList(ENServicesMaterials aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENServicesMaterialsShortList result = new ENServicesMaterialsShortList();
		ENServicesMaterialsShort anObject;
		result.list = new Vector<ENServicesMaterialsShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSERVICESMATERIALS.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSERVICESMATERIALS.CODE"+
			",ENSERVICESMATERIALS.MATERIALNAME"+
			",ENSERVICESMATERIALS.MEASUREUNITNAME"+
			",ENSERVICESMATERIALS.PRICEGEN"+
			",ENSERVICESMATERIALS.COUNTGEN"+
			",ENSERVICESMATERIALS.SUMGEN"+
			", ENSERVICESCOST.CODE " +
			", ENSERVICESCOST.DATEGEN " +
			", ENSERVICESCOST.COUNTGEN " +
			", ENSERVICESCOST.CALCULATIONCOST " +
			", ENSERVICESCOST.COSTWITHOUTVAT " +
			", ENSERVICESCOST.COSTVAT " +
			", ENSERVICESCOST.COSTWITHVAT " +
			", TKCALCMATERIALS.CODE " +
			", TKMATERIALS.CODE " +
			", TKMATERIALS.NAME " +
			", TKMATERIALS.COST " +
			", TKMATERIALS.DELIVERYDATE " +
			", TKMATERIALS.NUMKATALOG " +
			", TKMATERIALS.IDENTID " +
			", TKTECHCARD.CODE " +
			", TKTECHCARD.TECHKARTNUMBER " +
			", TKTECHCARD.NAME " +
			", TKTECHCARD.SAFETY " +
			", TKTECHCARD.DATECREATION " +
			", TKTECHCARD.DATEFROM " +
			", TKTECHCARD.DATETO " +
			", TKTECHCARD.WORKCONDITIONS " +
		" FROM ENSERVICESMATERIALS " +
			" LEFT JOIN ENSERVICESCOST on ENSERVICESCOST.CODE = ENSERVICESMATERIALS.SERVICESCOSTREFCODE "+
			" LEFT JOIN TKCALCMATERIALS on TKCALCMATERIALS.CODE = ENSERVICESMATERIALS.CALCMATERIALSREFCODE "+
			" LEFT JOIN TKMATERIALS on TKMATERIALS.CODE = ENSERVICESMATERIALS.MATERIALREFCODE "+
			" LEFT JOIN TKTECHCARD on TKTECHCARD.CODE = ENSERVICESMATERIALS.KARTAREFCODE "+
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
				anObject = new ENServicesMaterialsShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.materialName = set.getString(2);
				anObject.measureUnitName = set.getString(3);
				anObject.priceGen = set.getBigDecimal(4);
				if(anObject.priceGen != null) {
					anObject.priceGen = anObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.countGen = set.getBigDecimal(5);
				if(anObject.countGen != null) {
					anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sumGen = set.getBigDecimal(6);
				if(anObject.sumGen != null) {
					anObject.sumGen = anObject.sumGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.servicesCostRefCode = set.getInt(7);
				if(set.wasNull()) {
					anObject.servicesCostRefCode = Integer.MIN_VALUE;
				}
				anObject.servicesCostRefDateGen = set.getDate(8);
				anObject.servicesCostRefCountGen = set.getBigDecimal(9);
				if(anObject.servicesCostRefCountGen != null) {
					anObject.servicesCostRefCountGen = anObject.servicesCostRefCountGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesCostRefCalculationCost = set.getBigDecimal(10);
				if(anObject.servicesCostRefCalculationCost != null) {
					anObject.servicesCostRefCalculationCost = anObject.servicesCostRefCalculationCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesCostRefCostWithoutVAT = set.getBigDecimal(11);
				if(anObject.servicesCostRefCostWithoutVAT != null) {
					anObject.servicesCostRefCostWithoutVAT = anObject.servicesCostRefCostWithoutVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesCostRefCostVAT = set.getBigDecimal(12);
				if(anObject.servicesCostRefCostVAT != null) {
					anObject.servicesCostRefCostVAT = anObject.servicesCostRefCostVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesCostRefCostWithVAT = set.getBigDecimal(13);
				if(anObject.servicesCostRefCostWithVAT != null) {
					anObject.servicesCostRefCostWithVAT = anObject.servicesCostRefCostWithVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.calcMaterialsRefCode = set.getInt(14);
				if(set.wasNull()) {
					anObject.calcMaterialsRefCode = Integer.MIN_VALUE;
				}
				anObject.materialRefCode = set.getInt(15);
				if(set.wasNull()) {
					anObject.materialRefCode = Integer.MIN_VALUE;
				}
				anObject.materialRefName = set.getString(16);
				anObject.materialRefCost = set.getBigDecimal(17);
				if(anObject.materialRefCost != null) {
					anObject.materialRefCost = anObject.materialRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.materialRefDeliveryDate = set.getInt(18);
				if(set.wasNull()) {
					anObject.materialRefDeliveryDate = Integer.MIN_VALUE;
				}
				anObject.materialRefNumkatalog = set.getString(19);
				anObject.materialRefIdentid = set.getString(20);
				anObject.kartaRefCode = set.getInt(21);
				if(set.wasNull()) {
					anObject.kartaRefCode = Integer.MIN_VALUE;
				}
				anObject.kartaRefTechKartNumber = set.getString(22);
				anObject.kartaRefName = set.getString(23);
				anObject.kartaRefSafety = set.getString(24);
				anObject.kartaRefDateCreation = set.getDate(25);
				anObject.kartaRefDateFrom = set.getDate(26);
				anObject.kartaRefDateTo = set.getDate(27);
				anObject.kartaRefWorkconditions = set.getString(28);

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
	
	public int[] getFilteredCodeArray(ENServicesMaterialsFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENServicesMaterialsFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENServicesMaterials aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENSERVICESMATERIALS.CODE FROM ENSERVICESMATERIALS";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSERVICESMATERIALS.CODE";
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


	public ENServicesMaterials getObject(int uid) throws PersistenceException {
		ENServicesMaterials result = new ENServicesMaterials();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENServicesMaterials anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENSERVICESMATERIALS.CODE, ENSERVICESMATERIALS.MATERIALNAME, ENSERVICESMATERIALS.MEASUREUNITNAME, ENSERVICESMATERIALS.PRICEGEN, ENSERVICESMATERIALS.COUNTGEN, ENSERVICESMATERIALS.SUMGEN, ENSERVICESMATERIALS.SERVICESCOSTREFCODE, ENSERVICESMATERIALS.CALCMATERIALSREFCODE, ENSERVICESMATERIALS.MATERIALREFCODE, ENSERVICESMATERIALS.KARTAREFCODE "
			+" FROM ENSERVICESMATERIALS WHERE ENSERVICESMATERIALS.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.materialName = set.getString(2);
				anObject.measureUnitName = set.getString(3);
				anObject.priceGen = set.getBigDecimal(4);
				if(anObject.priceGen != null) {
					anObject.priceGen = anObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.countGen = set.getBigDecimal(5);
				if(anObject.countGen != null) {
					anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sumGen = set.getBigDecimal(6);
				if(anObject.sumGen != null) {
					anObject.sumGen = anObject.sumGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesCostRef.code = set.getInt(7);
				if (set.wasNull()) {
					anObject.servicesCostRef.code = Integer.MIN_VALUE;
				}
				anObject.calcMaterialsRef.code = set.getInt(8);
				if (set.wasNull()) {
					anObject.calcMaterialsRef.code = Integer.MIN_VALUE;
				}
				anObject.materialRef.code = set.getInt(9);
				if (set.wasNull()) {
					anObject.materialRef.code = Integer.MIN_VALUE;
				}
				anObject.kartaRef.code = set.getInt(10);
				if (set.wasNull()) {
					anObject.kartaRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENServicesMaterialsRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENServicesMaterialsRef ref = new com.ksoe.energynet.valueobject.references.ENServicesMaterialsRef();
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

		selectStr = "DELETE FROM  ENSERVICESMATERIALS WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENServicesMaterials object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENServicesMaterials.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesMaterials.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENServicesMaterials.remove%} access denied");
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
	
	public long count(ENServicesMaterialsFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENServicesMaterialsFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENServicesMaterialsFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENSERVICESMATERIALS", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENServicesMaterialsFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENSERVICESMATERIALS");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesMaterials.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENServicesMaterials.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENSERVICESMATERIALS.CODE FROM  ENSERVICESMATERIALS WHERE  ENSERVICESMATERIALS.CODE = ?";
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
		_checkConditionToken(condition,"code","ENSERVICESMATERIALS.CODE");
		_checkConditionToken(condition,"materialname","ENSERVICESMATERIALS.MATERIALNAME");
		_checkConditionToken(condition,"measureunitname","ENSERVICESMATERIALS.MEASUREUNITNAME");
		_checkConditionToken(condition,"pricegen","ENSERVICESMATERIALS.PRICEGEN");
		_checkConditionToken(condition,"countgen","ENSERVICESMATERIALS.COUNTGEN");
		_checkConditionToken(condition,"sumgen","ENSERVICESMATERIALS.SUMGEN");
		// relationship conditions
		_checkConditionToken(condition,"servicescostref","SERVICESCOSTREFCODE");
		_checkConditionToken(condition,"servicescostref.code","SERVICESCOSTREFCODE");
		_checkConditionToken(condition,"calcmaterialsref","CALCMATERIALSREFCODE");
		_checkConditionToken(condition,"calcmaterialsref.code","CALCMATERIALSREFCODE");
		_checkConditionToken(condition,"materialref","MATERIALREFCODE");
		_checkConditionToken(condition,"materialref.code","MATERIALREFCODE");
		_checkConditionToken(condition,"kartaref","KARTAREFCODE");
		_checkConditionToken(condition,"kartaref.code","KARTAREFCODE");
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
	
	private void _collectAutoIncrementFields(ENServicesMaterials anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENSERVICESMATERIALS", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENSERVICESMATERIALS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENSERVICESMATERIALS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENSERVICESMATERIALS");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENServicesMaterialsDAO
