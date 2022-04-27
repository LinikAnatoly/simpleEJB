
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
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
import com.ksoe.energynet.valueobject.ENBuilding2ENact;
import com.ksoe.energynet.valueobject.filter.ENBuilding2ENactFilter;
import com.ksoe.energynet.valueobject.brief.ENBuilding2ENactShort;
import com.ksoe.energynet.valueobject.lists.ENBuilding2ENactShortList;


/**
 * DAO Object for ENBuilding2ENact;
 *
 */

public class ENBuilding2ENactDAOGen extends GenericDataMiner {

	public ENBuilding2ENactDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENBuilding2ENactDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENBuilding2ENact inObject) throws PersistenceException {
		ENBuilding2ENact obj = new ENBuilding2ENact();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.sumGen == null && obj.sumGen == null){}
		else
			if(inObject.sumGen == null || obj.sumGen == null) return false;
			else
				if ( ! inObject.sumGen.equals(obj.sumGen)){
					return false;
				}

		if(inObject.sumNds == null && obj.sumNds == null){}
		else
			if(inObject.sumNds == null || obj.sumNds == null) return false;
			else
				if ( ! inObject.sumNds.equals(obj.sumNds)){
					return false;
				}

		if (inObject.isCalculationDate != obj.isCalculationDate){
					return false;
				}

		if(inObject.finContractNumber == null && obj.finContractNumber == null){}
		else
			if(inObject.finContractNumber == null || obj.finContractNumber == null) return false;
			else
				if ( ! inObject.finContractNumber.equals(obj.finContractNumber)){
					return false;
				}

		if(inObject.finContractDate == null && obj.finContractDate == null){} else 
			if(inObject.finContractDate == null || obj.finContractDate == null) return false;
			else
				if (inObject.finContractDate.compareTo(obj.finContractDate) != 0){
					return false;
				}

		if(inObject.partnerName == null && obj.partnerName == null){}
		else
			if(inObject.partnerName == null || obj.partnerName == null) return false;
			else
				if ( ! inObject.partnerName.equals(obj.partnerName)){
					return false;
				}

		if(inObject.partnerCode == null && obj.partnerCode == null){}
		else
			if(inObject.partnerCode == null || obj.partnerCode == null) return false;
			else
				if ( ! inObject.partnerCode.equals(obj.partnerCode)){
					return false;
				}

		if(inObject.isActFromEnergyNET == null && obj.isActFromEnergyNET == null){} else 
			if(inObject.isActFromEnergyNET == null || obj.isActFromEnergyNET == null) return false;
			else
				if (inObject.isActFromEnergyNET.compareTo(obj.isActFromEnergyNET) != 0){
					return false;
				}

		if(inObject.actNumber == null && obj.actNumber == null){}
		else
			if(inObject.actNumber == null || obj.actNumber == null) return false;
			else
				if ( ! inObject.actNumber.equals(obj.actNumber)){
					return false;
				}

		if(inObject.actDate == null && obj.actDate == null){} else 
			if(inObject.actDate == null || obj.actDate == null) return false;
			else
				if (inObject.actDate.compareTo(obj.actDate) != 0){
					return false;
				}
		if (inObject.actRef.code != obj.actRef.code){
			return false;
		}
		if (inObject.ENBuildingRef.code != obj.ENBuildingRef.code){
			return false;
		}
		if (inObject.ENBuilding2ActTypeWorkRef.code != obj.ENBuilding2ActTypeWorkRef.code){
			return false;
		}
		return true;
	}

	public int add(ENBuilding2ENact anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENBuilding2ENact anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENBUILDING2ENACT (CODE,SUMGEN,SUMNDS,ISCALCULATIONDATE,FINCONTRACTNUMBER,FINCONTRACTDATE,PARTNERNAME,PARTNERCODE,ISACTFROMENERGYNET,ACTNUMBER,ACTDATE,ACTREFCODE,ENBUILDINGREFCODE,ENBUILDING2CTTPWRKRFCD) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			if (anObject.sumGen != null) {
				anObject.sumGen = anObject.sumGen.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(2, anObject.sumGen);
			if (anObject.sumNds != null) {
				anObject.sumNds = anObject.sumNds.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(3, anObject.sumNds);
			if (anObject.isCalculationDate != Integer.MIN_VALUE ) {
				statement.setInt(4, anObject.isCalculationDate);
			} else {
				statement.setNull(4, java.sql.Types.INTEGER);
			}
			statement.setString(5, anObject.finContractNumber);
			if (anObject.finContractDate == null) {
				statement.setDate(6, null);
			} else {
				statement.setDate(6, new java.sql.Date(anObject.finContractDate.getTime()));
			}
			statement.setString(7, anObject.partnerName);
			statement.setString(8, anObject.partnerCode);
			if (anObject.isActFromEnergyNET != null) {
				statement.setBoolean(9, anObject.isActFromEnergyNET);
			} else {
				statement.setNull(9, java.sql.Types.BOOLEAN);
			}
			statement.setString(10, anObject.actNumber);
			if (anObject.actDate == null) {
				statement.setTimestamp(11, null);
			} else {
				statement.setTimestamp(11, new java.sql.Timestamp(anObject.actDate.getTime()));
			}
			if (anObject.actRef.code != Integer.MIN_VALUE){
				statement.setInt(12,anObject.actRef.code);
			} else {
				statement.setNull(12,java.sql.Types.INTEGER);
			}
			if (anObject.ENBuildingRef.code != Integer.MIN_VALUE){
				statement.setInt(13,anObject.ENBuildingRef.code);
			} else {
				statement.setNull(13,java.sql.Types.INTEGER);
			}
			if (anObject.ENBuilding2ActTypeWorkRef.code != Integer.MIN_VALUE){
				statement.setInt(14,anObject.ENBuilding2ActTypeWorkRef.code);
			} else {
				statement.setNull(14,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENBuilding2ENactDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENBuilding2ENact anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENBuilding2ENact anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("SUMGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SUMNDS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ISCALCULATIONDATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FINCONTRACTNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FINCONTRACTDATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PARTNERNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PARTNERCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ISACTFROMENERGYNET") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACTNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACTDATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ENBUILDINGREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ENBUILDING2ACTTYPEWORKREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENBUILDING2ENACT SET  SUMGEN = ? , SUMNDS = ? , ISCALCULATIONDATE = ? , FINCONTRACTNUMBER = ? , FINCONTRACTDATE = ? , PARTNERNAME = ? , PARTNERCODE = ? , ISACTFROMENERGYNET = ? , ACTNUMBER = ? , ACTDATE = ? , ACTREFCODE = ? , ENBUILDINGREFCODE = ? , ENBUILDING2CTTPWRKRFCD = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENBUILDING2ENACT SET ";
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
					if (anObject.sumGen != null) {
						anObject.sumGen = anObject.sumGen.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(1, anObject.sumGen);
					if (anObject.sumNds != null) {
						anObject.sumNds = anObject.sumNds.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(2, anObject.sumNds);
					if (anObject.isCalculationDate != Integer.MIN_VALUE) {
						statement.setInt(3, anObject.isCalculationDate);
					} else {
						statement.setNull(3, java.sql.Types.INTEGER);
					}
					statement.setString(4, anObject.finContractNumber);
					if (anObject.finContractDate == null) {
						statement.setDate(5, null);
					} else {
						statement.setDate(5, new java.sql.Date(anObject.finContractDate.getTime()));
					}
					statement.setString(6, anObject.partnerName);
					statement.setString(7, anObject.partnerCode);
					if (anObject.isActFromEnergyNET == null) {
						statement.setNull(8, java.sql.Types.BOOLEAN);
					} else {
						statement.setBoolean(8, anObject.isActFromEnergyNET);
					}
					statement.setString(9, anObject.actNumber);
					if (anObject.actDate == null) {
						statement.setTimestamp(10, null);
					} else {
						statement.setTimestamp(10, new java.sql.Timestamp(anObject.actDate.getTime()));
					}
					if (anObject.actRef.code != Integer.MIN_VALUE) {
						statement.setInt(11, anObject.actRef.code);
					} else {
						statement.setNull(11, java.sql.Types.INTEGER);
					}
					if (anObject.ENBuildingRef.code != Integer.MIN_VALUE) {
						statement.setInt(12, anObject.ENBuildingRef.code);
					} else {
						statement.setNull(12, java.sql.Types.INTEGER);
					}
					if (anObject.ENBuilding2ActTypeWorkRef.code != Integer.MIN_VALUE) {
						statement.setInt(13, anObject.ENBuilding2ActTypeWorkRef.code);
					} else {
						statement.setNull(13, java.sql.Types.INTEGER);
					}
					statement.setInt(14, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("SUMGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sumGen != null) {
								anObject.sumGen = anObject.sumGen.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.sumGen);
							continue;
						}
						if("SUMNDS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sumNds != null) {
								anObject.sumNds = anObject.sumNds.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.sumNds);
							continue;
						}
						if("ISCALCULATIONDATE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.isCalculationDate);
							continue;
						}
						if("FINCONTRACTNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.finContractNumber);
							continue;
						}
						if("FINCONTRACTDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.finContractDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.finContractDate.getTime()));
							}
							continue;
						}
						if("PARTNERNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.partnerName);
							continue;
						}
						if("PARTNERCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.partnerCode);
							continue;
						}
						if("ISACTFROMENERGYNET".compareTo((String)fields.get(i)) == 0) {
								statement.setBoolean(i+1, anObject.isActFromEnergyNET);
							continue;
						}
						if("ACTNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.actNumber);
							continue;
						}
						if("ACTDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.actDate == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1, new java.sql.Timestamp(anObject.actDate.getTime()));
							}
							continue;
						}
						if("ACTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.actRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.actRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("ENBUILDINGREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.ENBuildingRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.ENBuildingRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("ENBUILDING2ACTTYPEWORKREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.ENBuilding2ActTypeWorkRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.ENBuilding2ActTypeWorkRef.code);
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

	} // end of save(ENBuilding2ENact anObject,String[] anAttributes)


	public ENBuilding2ENactShort getShortObject(int anObjectCode) throws PersistenceException {
		ENBuilding2ENact filterObject = new ENBuilding2ENact();
		Vector<ENBuilding2ENactShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENBuilding2ENactShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENBuilding2ENact filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.sumGen, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.sumNds, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.isCalculationDate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.finContractNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.finContractDate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.partnerName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.partnerCode, index, statement);
			index = BaseDAOUtils.setBooleanParameter(filter.isActFromEnergyNET, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.actNumber, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.actDate, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.actRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.ENBuildingRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.ENBuilding2ActTypeWorkRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENBuilding2ENactFilter filter) {
		String out = buildCondition((ENBuilding2ENact)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENBuilding2ENact filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENBuilding2ENact.code_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.sumGen, ENBuilding2ENact.sumGen_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.sumNds, ENBuilding2ENact.sumNds_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.isCalculationDate, ENBuilding2ENact.isCalculationDate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.finContractNumber, ENBuilding2ENact.finContractNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.finContractDate, ENBuilding2ENact.finContractDate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.partnerName, ENBuilding2ENact.partnerName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.partnerCode, ENBuilding2ENact.partnerCode_QFielld, out);
			out = BaseDAOUtils.addBooleanToCondition(filter.isActFromEnergyNET, ENBuilding2ENact.isActFromEnergyNET_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.actNumber, ENBuilding2ENact.actNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.actDate, ENBuilding2ENact.actDate_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.actRef.code, ENBuilding2ENact.actRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.ENBuildingRef.code, ENBuilding2ENact.ENBuildingRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.ENBuilding2ActTypeWorkRef.code, ENBuilding2ENact.ENBuilding2ActTypeWorkRef_QFielld, out);
		}
		return out;
	}

	public ENBuilding2ENactShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENBuilding2ENactShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENBuilding2ENactShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENBuilding2ENactShortList getFilteredList(ENBuilding2ENact filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENBuilding2ENactShortList getScrollableFilteredList(ENBuilding2ENact aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENBuilding2ENactShortList getScrollableFilteredList(ENBuilding2ENact aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENBuilding2ENactShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENBuilding2ENactShortList getScrollableFilteredList(ENBuilding2ENactFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENBuilding2ENactShortList getScrollableFilteredList(ENBuilding2ENactFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENBuilding2ENactShortList getScrollableFilteredList(ENBuilding2ENact aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENBuilding2ENactShortList result = new ENBuilding2ENactShortList();
		ENBuilding2ENactShort anObject;
		result.list = new Vector<ENBuilding2ENactShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENBUILDING2ENACT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENBUILDING2ENACT.CODE"+
			",ENBUILDING2ENACT.SUMGEN"+
			",ENBUILDING2ENACT.SUMNDS"+
			",ENBUILDING2ENACT.ISCALCULATIONDATE"+
			",ENBUILDING2ENACT.FINCONTRACTNUMBER"+
			",ENBUILDING2ENACT.FINCONTRACTDATE"+
			",ENBUILDING2ENACT.PARTNERNAME"+
			",ENBUILDING2ENACT.PARTNERCODE"+
			",ENBUILDING2ENACT.ISACTFROMENERGYNET"+
			",ENBUILDING2ENACT.ACTNUMBER"+
			",ENBUILDING2ENACT.ACTDATE"+
			", ENACT.CODE " +
			", ENACT.NUMBERGEN " +
			", ENACT.DATEGEN " +
			", ENACT.FINMOLCODE " +
			", ENACT.FINMOLNAME " +
			", ENACT.FINMECHANICNAME " +
			", ENACT.INVNUMBER " +
			", ENACT.USERGEN " +
			", ENACT.DATEEDIT " +
			", ENACT.DATEACT " +
			", ENACT.MOLCODEOBJECT " +
			", ENACT.CHECKEDBYACCOUNTANT " +
			", ENBUILDING.CODE " +
			", ENBUILDING.NUMBERGEN " +
			", ENBUILDING.DATEGEN " +
			", ENBUILDING.DATEEDIT " +
			", ENBUILDING.SUMMAGEN " +
			", ENBUILDING.SUMMANDS " +
			", ENBUILDING.CHARACTERISTIC " +
			", ENBUILDING.EXECUTEDPOSITION " +
			", ENBUILDING.EXECUTEDNAME " +
			", ENBUILDING.ACCEPTEDPOSITION " +
			", ENBUILDING.ACCEPTEDNAME " +
			", ENBUILDING.CONTRACTPRICE " +
			", ENBUILDING.CODEMOL " +
			", ENBUILDING.CODEPODR " +
			", ENBUILDING.INVNUMBEROZ " +
			", ENBUILDING.NAMEOZ " +
			", ENBUILDING.FINCONTRACTNUMBER " +
			", ENBUILDING.FINCONTRACTDATE " +
			", ENBUILDING.PARTNERNAME " +
			", ENBUILDING.PARTNERCODE " +
			", ENBUILDING.ISINVESTPROGRAM " +
			", ENBUILDING.YEARINVESTPROGRAM " +
			", ENBUILDING.ITEMINVESTPROGRAM " +
			", ENBUILDING.BUILDINGADDRESS " +
			", ENBUILDING.DECREENUMBER " +
			", ENBUILDING.DECREEDATE " +
			", ENBUILDING.EXPLOITATIONTERM " +
			", ENBUILDING.DATELOADEXPL " +
			", ENBUILDING.DATEBUILD " +
			", ENBUILDING.USERGEN " +
			", ENBUILDING2ACTTYPEWORK.CODE " +
			", ENBUILDING2ACTTYPEWORK.NAME " +
		" FROM ENBUILDING2ENACT " +
			" LEFT JOIN ENACT on ENACT.CODE = ENBUILDING2ENACT.ACTREFCODE "+
			" LEFT JOIN ENBUILDING on ENBUILDING.CODE = ENBUILDING2ENACT.ENBUILDINGREFCODE "+
			" LEFT JOIN ENBUILDING2ACTTYPEWORK on ENBUILDING2ACTTYPEWORK.CODE = ENBUILDING2ENACT.ENBUILDING2CTTPWRKRFCD "+
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
				anObject = new ENBuilding2ENactShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.sumGen = set.getBigDecimal(2);
				if(anObject.sumGen != null) {
					anObject.sumGen = anObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sumNds = set.getBigDecimal(3);
				if(anObject.sumNds != null) {
					anObject.sumNds = anObject.sumNds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.isCalculationDate = set.getInt(4);
				if ( set.wasNull() ) {
					anObject.isCalculationDate = Integer.MIN_VALUE;
				}
				anObject.finContractNumber = set.getString(5);
				anObject.finContractDate = set.getDate(6);
				anObject.partnerName = set.getString(7);
				anObject.partnerCode = set.getString(8);
				anObject.isActFromEnergyNET = set.getBoolean(9);
				if ( set.wasNull() ) {
					anObject.isActFromEnergyNET = null;
				}
				anObject.actNumber = set.getString(10);
				anObject.actDate = set.getTimestamp(11);

				anObject.actRefCode = set.getInt(12);
				if(set.wasNull()) {
					anObject.actRefCode = Integer.MIN_VALUE;
				}
				anObject.actRefNumberGen = set.getString(13);
				anObject.actRefDateGen = set.getDate(14);
				anObject.actRefFinMolCode = set.getString(15);
				anObject.actRefFinMolName = set.getString(16);
				anObject.actRefFinMechanicName = set.getString(17);
				anObject.actRefInvNumber = set.getString(18);
				anObject.actRefUserGen = set.getString(19);
				anObject.actRefDateEdit = set.getDate(20);
				anObject.actRefDateAct = set.getDate(21);
				anObject.actRefMolCodeObject = set.getString(22);
				anObject.actRefCheckedByAccountant = set.getBoolean(23);
				if(set.wasNull()) {
					anObject.actRefCheckedByAccountant = null;
				}
				anObject.ENBuildingRefCode = set.getInt(24);
				if(set.wasNull()) {
					anObject.ENBuildingRefCode = Integer.MIN_VALUE;
				}
				anObject.ENBuildingRefNumbergen = set.getString(25);
				anObject.ENBuildingRefDateGen = set.getDate(26);
				anObject.ENBuildingRefDateEdit = set.getDate(27);
				anObject.ENBuildingRefSummaGen = set.getBigDecimal(28);
				if(anObject.ENBuildingRefSummaGen != null) {
					anObject.ENBuildingRefSummaGen = anObject.ENBuildingRefSummaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ENBuildingRefSummaNDS = set.getBigDecimal(29);
				if(anObject.ENBuildingRefSummaNDS != null) {
					anObject.ENBuildingRefSummaNDS = anObject.ENBuildingRefSummaNDS.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ENBuildingRefCharacteristic = set.getString(30);
				anObject.ENBuildingRefExecutedPosition = set.getString(31);
				anObject.ENBuildingRefExecutedName = set.getString(32);
				anObject.ENBuildingRefAcceptedPosition = set.getString(33);
				anObject.ENBuildingRefAcceptedName = set.getString(34);
				anObject.ENBuildingRefContractPrice = set.getBigDecimal(35);
				if(anObject.ENBuildingRefContractPrice != null) {
					anObject.ENBuildingRefContractPrice = anObject.ENBuildingRefContractPrice.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ENBuildingRefCodeMol = set.getString(36);
				anObject.ENBuildingRefCodePodr = set.getString(37);
				anObject.ENBuildingRefInvNumberOZ = set.getString(38);
				anObject.ENBuildingRefNameOZ = set.getString(39);
				anObject.ENBuildingRefFinContractNumber = set.getString(40);
				anObject.ENBuildingRefFinContractDate = set.getDate(41);
				anObject.ENBuildingRefPartnerName = set.getString(42);
				anObject.ENBuildingRefPartnerCode = set.getString(43);
				anObject.ENBuildingRefIsInvestProgram = set.getInt(44);
				if(set.wasNull()) {
					anObject.ENBuildingRefIsInvestProgram = Integer.MIN_VALUE;
				}
				anObject.ENBuildingRefYearInvestProgram = set.getString(45);
				anObject.ENBuildingRefItemInvestProgram = set.getString(46);
				anObject.ENBuildingRefBuildingAddress = set.getString(47);
				anObject.ENBuildingRefDecreeNumber = set.getString(48);
				anObject.ENBuildingRefDecreeDate = set.getDate(49);
				anObject.ENBuildingRefExploitationTerm = set.getInt(50);
				if(set.wasNull()) {
					anObject.ENBuildingRefExploitationTerm = Integer.MIN_VALUE;
				}
				anObject.ENBuildingRefDateLoadExpl = set.getDate(51);
				anObject.ENBuildingRefDateBuild = set.getDate(52);
				anObject.ENBuildingRefUserGen = set.getString(53);
				anObject.ENBuilding2ActTypeWorkRefCode = set.getInt(54);
				if(set.wasNull()) {
					anObject.ENBuilding2ActTypeWorkRefCode = Integer.MIN_VALUE;
				}
				anObject.ENBuilding2ActTypeWorkRefName = set.getString(55);

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
	
	public int[] getFilteredCodeArray(ENBuilding2ENactFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENBuilding2ENactFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENBuilding2ENact aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENBUILDING2ENACT.CODE FROM ENBUILDING2ENACT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENBUILDING2ENACT.CODE";
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


	public ENBuilding2ENact getObject(int uid) throws PersistenceException {
		ENBuilding2ENact result = new ENBuilding2ENact();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENBuilding2ENact anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENBUILDING2ENACT.CODE, ENBUILDING2ENACT.SUMGEN, ENBUILDING2ENACT.SUMNDS, ENBUILDING2ENACT.ISCALCULATIONDATE, ENBUILDING2ENACT.FINCONTRACTNUMBER, ENBUILDING2ENACT.FINCONTRACTDATE, ENBUILDING2ENACT.PARTNERNAME, ENBUILDING2ENACT.PARTNERCODE, ENBUILDING2ENACT.ISACTFROMENERGYNET, ENBUILDING2ENACT.ACTNUMBER, ENBUILDING2ENACT.ACTDATE, ENBUILDING2ENACT.ACTREFCODE, ENBUILDING2ENACT.ENBUILDINGREFCODE, ENBUILDING2ENACT.ENBUILDING2CTTPWRKRFCD "
			+" FROM ENBUILDING2ENACT WHERE ENBUILDING2ENACT.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.sumGen = set.getBigDecimal(2);
				if(anObject.sumGen != null) {
					anObject.sumGen = anObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sumNds = set.getBigDecimal(3);
				if(anObject.sumNds != null) {
					anObject.sumNds = anObject.sumNds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.isCalculationDate = set.getInt(4);
				if (set.wasNull()) {
					anObject.isCalculationDate = Integer.MIN_VALUE;
				}
				anObject.finContractNumber = set.getString(5);
				anObject.finContractDate = set.getDate(6);
				anObject.partnerName = set.getString(7);
				anObject.partnerCode = set.getString(8);
				anObject.isActFromEnergyNET = set.getBoolean(9);
				if (set.wasNull()) {
					anObject.isActFromEnergyNET = null;
				}
				anObject.actNumber = set.getString(10);
				anObject.actDate = set.getTimestamp(11);
				anObject.actRef.code = set.getInt(12);
				if (set.wasNull()) {
					anObject.actRef.code = Integer.MIN_VALUE;
				}
				anObject.ENBuildingRef.code = set.getInt(13);
				if (set.wasNull()) {
					anObject.ENBuildingRef.code = Integer.MIN_VALUE;
				}
				anObject.ENBuilding2ActTypeWorkRef.code = set.getInt(14);
				if (set.wasNull()) {
					anObject.ENBuilding2ActTypeWorkRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENBuilding2ENactRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENBuilding2ENactRef ref = new com.ksoe.energynet.valueobject.references.ENBuilding2ENactRef();
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

		selectStr = "DELETE FROM  ENBUILDING2ENACT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENBuilding2ENact object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENBuilding2ENact.getObject%} access denied");
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
	
	public long count(ENBuilding2ENactFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENBuilding2ENactFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENBuilding2ENactFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENBUILDING2ENACT", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENBUILDING2ENACT WHERE code = ?", propertyName);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENBuilding2ENactFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENBUILDING2ENACT");
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
			"SELECT  ENBUILDING2ENACT.CODE FROM  ENBUILDING2ENACT WHERE  ENBUILDING2ENACT.CODE = ?";
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
		_checkConditionToken(condition,"code","ENBUILDING2ENACT.CODE");
		_checkConditionToken(condition,"sumgen","ENBUILDING2ENACT.SUMGEN");
		_checkConditionToken(condition,"sumnds","ENBUILDING2ENACT.SUMNDS");
		_checkConditionToken(condition,"iscalculationdate","ENBUILDING2ENACT.ISCALCULATIONDATE");
		_checkConditionToken(condition,"fincontractnumber","ENBUILDING2ENACT.FINCONTRACTNUMBER");
		_checkConditionToken(condition,"fincontractdate","ENBUILDING2ENACT.FINCONTRACTDATE");
		_checkConditionToken(condition,"partnername","ENBUILDING2ENACT.PARTNERNAME");
		_checkConditionToken(condition,"partnercode","ENBUILDING2ENACT.PARTNERCODE");
		_checkConditionToken(condition,"isactfromenergynet","ENBUILDING2ENACT.ISACTFROMENERGYNET");
		_checkConditionToken(condition,"actnumber","ENBUILDING2ENACT.ACTNUMBER");
		_checkConditionToken(condition,"actdate","ENBUILDING2ENACT.ACTDATE");
		// relationship conditions
		_checkConditionToken(condition,"actref","ACTREFCODE");
		_checkConditionToken(condition,"actref.code","ACTREFCODE");
		_checkConditionToken(condition,"enbuildingref","ENBUILDINGREFCODE");
		_checkConditionToken(condition,"enbuildingref.code","ENBUILDINGREFCODE");
		_checkConditionToken(condition,"enbuilding2acttypeworkref","ENBUILDING2CTTPWRKRFCD");
		_checkConditionToken(condition,"enbuilding2acttypeworkref.code","ENBUILDING2CTTPWRKRFCD");
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
	
	private void _collectAutoIncrementFields(ENBuilding2ENact anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENBUILDING2ENACT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENBUILDING2ENACT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENBUILDING2ENACT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENBUILDING2ENACT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENBuilding2ENactDAO
