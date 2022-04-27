
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
import com.ksoe.energynet.valueobject.ENAdditionalAgreement;
import com.ksoe.energynet.valueobject.filter.ENAdditionalAgreementFilter;
import com.ksoe.energynet.valueobject.brief.ENAdditionalAgreementShort;
import com.ksoe.energynet.valueobject.lists.ENAdditionalAgreementShortList;


/**
 * DAO Object for ENAdditionalAgreement;
 *
 */

public class ENAdditionalAgreementDAOGen extends GenericDataMiner {

	public ENAdditionalAgreementDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENAdditionalAgreementDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENAdditionalAgreement inObject) throws PersistenceException {
		ENAdditionalAgreement obj = new ENAdditionalAgreement();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.numberGen == null && obj.numberGen == null){}
		else
			if(inObject.numberGen == null || obj.numberGen == null) return false;
			else
				if ( ! inObject.numberGen.equals(obj.numberGen)){
					return false;
				}

		if(inObject.dateGen == null && obj.dateGen == null){} else 
			if(inObject.dateGen == null || obj.dateGen == null) return false;
			else
				if (inObject.dateGen.compareTo(obj.dateGen) != 0){
					return false;
				}

		if(inObject.sumWithoutVAT == null && obj.sumWithoutVAT == null){}
		else
			if(inObject.sumWithoutVAT == null || obj.sumWithoutVAT == null) return false;
			else
				if ( ! inObject.sumWithoutVAT.equals(obj.sumWithoutVAT)){
					return false;
				}

		if(inObject.sumVAT == null && obj.sumVAT == null){}
		else
			if(inObject.sumVAT == null || obj.sumVAT == null) return false;
			else
				if ( ! inObject.sumVAT.equals(obj.sumVAT)){
					return false;
				}

		if(inObject.calcSumsByCalculations == null && obj.calcSumsByCalculations == null){} else 
			if(inObject.calcSumsByCalculations == null || obj.calcSumsByCalculations == null) return false;
			else
				if (inObject.calcSumsByCalculations.compareTo(obj.calcSumsByCalculations) != 0){
					return false;
				}

		if(inObject.isSigned == null && obj.isSigned == null){} else 
			if(inObject.isSigned == null || obj.isSigned == null) return false;
			else
				if (inObject.isSigned.compareTo(obj.isSigned) != 0){
					return false;
				}
		if (inObject.servicesobjectRef.code != obj.servicesobjectRef.code){
			return false;
		}
		return true;
	}

	public int add(ENAdditionalAgreement anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENAdditionalAgreement anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENADDITIONALAGREEMENT (CODE,NUMBERGEN,DATEGEN,SUMWITHOUTVAT,SUMVAT,CALCSUMSBYCALCULATIONS,ISSIGNED,SERVICESOBJECTREFCODE) VALUES (?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.numberGen);
			if (anObject.dateGen == null) {
				statement.setDate(3, null);
			} else {
				statement.setDate(3, new java.sql.Date(anObject.dateGen.getTime()));
			}
			if (anObject.sumWithoutVAT != null) {
				anObject.sumWithoutVAT = anObject.sumWithoutVAT.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(4, anObject.sumWithoutVAT);
			if (anObject.sumVAT != null) {
				anObject.sumVAT = anObject.sumVAT.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(5, anObject.sumVAT);
			if (anObject.calcSumsByCalculations != null) {
				statement.setBoolean(6, anObject.calcSumsByCalculations);
			} else {
				statement.setNull(6, java.sql.Types.BOOLEAN);
			}
			if (anObject.isSigned != null) {
				statement.setBoolean(7, anObject.isSigned);
			} else {
				statement.setNull(7, java.sql.Types.BOOLEAN);
			}
			if (anObject.servicesobjectRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).exists(anObject.servicesobjectRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENAdditionalAgreement.servicesobjectRef.code%} = {%"+anObject.servicesobjectRef.code+"%}");
				}
				statement.setInt(8,anObject.servicesobjectRef.code);
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
			throw new PersistenceException("Error in method {%ENAdditionalAgreementDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENAdditionalAgreement anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENAdditionalAgreement anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("NUMBERGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SUMWITHOUTVAT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SUMVAT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CALCSUMSBYCALCULATIONS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ISSIGNED") == 0) {
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
				selectStr = "UPDATE ENADDITIONALAGREEMENT SET  NUMBERGEN = ? , DATEGEN = ? , SUMWITHOUTVAT = ? , SUMVAT = ? , CALCSUMSBYCALCULATIONS = ? , ISSIGNED = ? , SERVICESOBJECTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENADDITIONALAGREEMENT SET ";
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
					statement.setString(1, anObject.numberGen);
					if (anObject.dateGen == null) {
						statement.setDate(2, null);
					} else {
						statement.setDate(2, new java.sql.Date(anObject.dateGen.getTime()));
					}
					if (anObject.sumWithoutVAT != null) {
						anObject.sumWithoutVAT = anObject.sumWithoutVAT.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(3, anObject.sumWithoutVAT);
					if (anObject.sumVAT != null) {
						anObject.sumVAT = anObject.sumVAT.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(4, anObject.sumVAT);
					if (anObject.calcSumsByCalculations == null) {
						statement.setNull(5, java.sql.Types.BOOLEAN);
					} else {
						statement.setBoolean(5, anObject.calcSumsByCalculations);
					}
					if (anObject.isSigned == null) {
						statement.setNull(6, java.sql.Types.BOOLEAN);
					} else {
						statement.setBoolean(6, anObject.isSigned);
					}
					if (anObject.servicesobjectRef.code != Integer.MIN_VALUE) {
						statement.setInt(7, anObject.servicesobjectRef.code);
					} else {
						statement.setNull(7, java.sql.Types.INTEGER);
					}
					statement.setInt(8, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("NUMBERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.numberGen);
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
						if("SUMWITHOUTVAT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sumWithoutVAT != null) {
								anObject.sumWithoutVAT = anObject.sumWithoutVAT.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.sumWithoutVAT);
							continue;
						}
						if("SUMVAT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sumVAT != null) {
								anObject.sumVAT = anObject.sumVAT.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.sumVAT);
							continue;
						}
						if("CALCSUMSBYCALCULATIONS".compareTo((String)fields.get(i)) == 0) {
								statement.setBoolean(i+1, anObject.calcSumsByCalculations);
							continue;
						}
						if("ISSIGNED".compareTo((String)fields.get(i)) == 0) {
								statement.setBoolean(i+1, anObject.isSigned);
							continue;
						}
						if("SERVICESOBJECTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.servicesobjectRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.servicesobjectRef.code);
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

	} // end of save(ENAdditionalAgreement anObject,String[] anAttributes)


	public ENAdditionalAgreementShort getShortObject(int anObjectCode) throws PersistenceException {
		ENAdditionalAgreement filterObject = new ENAdditionalAgreement();
		Vector<ENAdditionalAgreementShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENAdditionalAgreementShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENAdditionalAgreement filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.numberGen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateGen, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.sumWithoutVAT, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.sumVAT, index, statement);
			index = BaseDAOUtils.setBooleanParameter(filter.calcSumsByCalculations, index, statement);
			index = BaseDAOUtils.setBooleanParameter(filter.isSigned, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.servicesobjectRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENAdditionalAgreementFilter filter) {
		String out = buildCondition((ENAdditionalAgreement)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENAdditionalAgreement filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENAdditionalAgreement.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.numberGen, ENAdditionalAgreement.numberGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateGen, ENAdditionalAgreement.dateGen_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.sumWithoutVAT, ENAdditionalAgreement.sumWithoutVAT_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.sumVAT, ENAdditionalAgreement.sumVAT_QFielld, out);
			out = BaseDAOUtils.addBooleanToCondition(filter.calcSumsByCalculations, ENAdditionalAgreement.calcSumsByCalculations_QFielld, out);
			out = BaseDAOUtils.addBooleanToCondition(filter.isSigned, ENAdditionalAgreement.isSigned_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.servicesobjectRef.code, ENAdditionalAgreement.servicesobjectRef_QFielld, out);
		}
		return out;
	}

	public ENAdditionalAgreementShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENAdditionalAgreementShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENAdditionalAgreementShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENAdditionalAgreementShortList getFilteredList(ENAdditionalAgreement filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENAdditionalAgreementShortList getScrollableFilteredList(ENAdditionalAgreement aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENAdditionalAgreementShortList getScrollableFilteredList(ENAdditionalAgreement aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENAdditionalAgreementShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENAdditionalAgreementShortList getScrollableFilteredList(ENAdditionalAgreementFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENAdditionalAgreementShortList getScrollableFilteredList(ENAdditionalAgreementFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENAdditionalAgreementShortList getScrollableFilteredList(ENAdditionalAgreement aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENAdditionalAgreementShortList result = new ENAdditionalAgreementShortList();
		ENAdditionalAgreementShort anObject;
		result.list = new Vector<ENAdditionalAgreementShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENADDITIONALAGREEMENT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENADDITIONALAGREEMENT.CODE"+
			",ENADDITIONALAGREEMENT.NUMBERGEN"+
			",ENADDITIONALAGREEMENT.DATEGEN"+
			",ENADDITIONALAGREEMENT.SUMWITHOUTVAT"+
			",ENADDITIONALAGREEMENT.SUMVAT"+
			",ENADDITIONALAGREEMENT.CALCSUMSBYCALCULATIONS"+
			",ENADDITIONALAGREEMENT.ISSIGNED"+
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
		" FROM ENADDITIONALAGREEMENT " +
			" LEFT JOIN ENSERVICESOBJECT on ENSERVICESOBJECT.CODE = ENADDITIONALAGREEMENT.SERVICESOBJECTREFCODE "+
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
				anObject = new ENAdditionalAgreementShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.numberGen = set.getString(2);
				anObject.dateGen = set.getDate(3);
				anObject.sumWithoutVAT = set.getBigDecimal(4);
				if(anObject.sumWithoutVAT != null) {
					anObject.sumWithoutVAT = anObject.sumWithoutVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sumVAT = set.getBigDecimal(5);
				if(anObject.sumVAT != null) {
					anObject.sumVAT = anObject.sumVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.calcSumsByCalculations = set.getBoolean(6);
				if ( set.wasNull() ) {
					anObject.calcSumsByCalculations = null;
				}
				anObject.isSigned = set.getBoolean(7);
				if ( set.wasNull() ) {
					anObject.isSigned = null;
				}

				anObject.servicesobjectRefCode = set.getInt(8);
				if(set.wasNull()) {
					anObject.servicesobjectRefCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefContractNumber = set.getString(9);
				anObject.servicesobjectRefContractDate = set.getDate(10);
				anObject.servicesobjectRefName = set.getString(11);
				anObject.servicesobjectRefPartnerCode = set.getString(12);
				anObject.servicesobjectRefFinDocCode = set.getString(13);
				anObject.servicesobjectRefFinDocID = set.getInt(14);
				if(set.wasNull()) {
					anObject.servicesobjectRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefCommentGen = set.getString(15);
				anObject.servicesobjectRefContractNumberServices = set.getString(16);
				anObject.servicesobjectRefContractDateServices = set.getDate(17);
				anObject.servicesobjectRefContragentName = set.getString(18);
				anObject.servicesobjectRefContragentAddress = set.getString(19);
				anObject.servicesobjectRefContragentAddressWork = set.getString(20);
				anObject.servicesobjectRefContragentOkpo = set.getString(21);
				anObject.servicesobjectRefContragentBankAccount = set.getString(22);
				anObject.servicesobjectRefContragentBankName = set.getString(23);
				anObject.servicesobjectRefContragentBankMfo = set.getString(24);
				anObject.servicesobjectRefContragentBossName = set.getString(25);
				anObject.servicesobjectRefContragentPassport = set.getString(26);
				anObject.servicesobjectRefContractServicesSumma = set.getBigDecimal(27);
				if(anObject.servicesobjectRefContractServicesSumma != null) {
					anObject.servicesobjectRefContractServicesSumma = anObject.servicesobjectRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectRefContractServicesSummaVAT = set.getBigDecimal(28);
				if(anObject.servicesobjectRefContractServicesSummaVAT != null) {
					anObject.servicesobjectRefContractServicesSummaVAT = anObject.servicesobjectRefContractServicesSummaVAT.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectRefContractServicesPower = set.getBigDecimal(29);
				if(anObject.servicesobjectRefContractServicesPower != null) {
					anObject.servicesobjectRefContractServicesPower = anObject.servicesobjectRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectRefCommentServicesGen = set.getString(30);
				anObject.servicesobjectRefContractServicesDistance = set.getBigDecimal(31);
				if(anObject.servicesobjectRefContractServicesDistance != null) {
					anObject.servicesobjectRefContractServicesDistance = anObject.servicesobjectRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectRefContractServicesDay = set.getBigDecimal(32);
				if(anObject.servicesobjectRefContractServicesDay != null) {
					anObject.servicesobjectRefContractServicesDay = anObject.servicesobjectRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectRefUserGen = set.getString(33);
				anObject.servicesobjectRefDateEdit = set.getDate(34);
				anObject.servicesobjectRefWarrantDate = set.getDate(35);
				anObject.servicesobjectRefWarrantNumber = set.getString(36);
				anObject.servicesobjectRefWarrantFIO = set.getString(37);
				anObject.servicesobjectRefRegionalType = set.getInt(38);
				if(set.wasNull()) {
					anObject.servicesobjectRefRegionalType = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefBasisType = set.getBigDecimal(39);
				if(anObject.servicesobjectRefBasisType != null) {
					anObject.servicesobjectRefBasisType = anObject.servicesobjectRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectRefContragentPosition = set.getString(40);
				anObject.servicesobjectRefExecuteWorkDate = set.getDate(41);
				anObject.servicesobjectRefTimeStart = set.getTimestamp(42);
				anObject.servicesobjectRefTimeFinal = set.getTimestamp(43);
				anObject.servicesobjectRefContragentPhoneNumber = set.getString(44);
				anObject.servicesobjectRefExecutorPhoneNumber = set.getString(45);
				anObject.servicesobjectRefContragentObjectWork = set.getString(46);
				anObject.servicesobjectRefIsNoPay = set.getInt(47);
				if(set.wasNull()) {
					anObject.servicesobjectRefIsNoPay = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefIsCustomerMaterials = set.getInt(48);
				if(set.wasNull()) {
					anObject.servicesobjectRefIsCustomerMaterials = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefPayDate = set.getDate(49);
				anObject.servicesobjectRefFinPayFormCode = set.getInt(50);
				if(set.wasNull()) {
					anObject.servicesobjectRefFinPayFormCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefFinPayFormName = set.getString(51);
				anObject.servicesobjectRefPartnerId = set.getInt(52);
				if(set.wasNull()) {
					anObject.servicesobjectRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefPayDetail = set.getString(53);
				anObject.servicesobjectRefActTransferNumber = set.getString(54);
				anObject.servicesobjectRefActTransferDate = set.getDate(55);
				anObject.servicesobjectRefResposible = set.getString(56);
				anObject.servicesobjectRefResposiblePosition = set.getString(57);
				anObject.servicesobjectRefResposibleTabNumber = set.getString(58);
				anObject.servicesobjectRefPrevContractStatus = set.getInt(59);
				if(set.wasNull()) {
					anObject.servicesobjectRefPrevContractStatus = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefReconnectionTU = set.getInt(60);
				if(set.wasNull()) {
					anObject.servicesobjectRefReconnectionTU = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefPersonalAccountCode = set.getInt(61);
				if(set.wasNull()) {
					anObject.servicesobjectRefPersonalAccountCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefPersonalAccountNumber = set.getString(62);
				anObject.servicesobjectRefTabNumber = set.getString(63);
				anObject.servicesobjectRefCitiesList = set.getString(64);
				anObject.servicesobjectRefLineLength = set.getBigDecimal(65);
				if(anObject.servicesobjectRefLineLength != null) {
					anObject.servicesobjectRefLineLength = anObject.servicesobjectRefLineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectRefProjectCode = set.getString(66);
				anObject.servicesobjectRefCnPackCode = set.getInt(67);
				if(set.wasNull()) {
					anObject.servicesobjectRefCnPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefDfPackCode = set.getInt(68);
				if(set.wasNull()) {
					anObject.servicesobjectRefDfPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefCountersZoneType = set.getInt(69);
				if(set.wasNull()) {
					anObject.servicesobjectRefCountersZoneType = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefAxPartnerCode = set.getString(70);
				anObject.servicesobjectRefAxPartnerName = set.getString(71);
				anObject.servicesobjectRefAxContractNumber = set.getString(72);
				anObject.servicesobjectRefAxContractDate = set.getDate(73);
				anObject.servicesobjectRefAxContractCode = set.getString(74);
				anObject.servicesobjectRefAxContractId = set.getString(75);
				anObject.servicesobjectRefAxContractCommentGen = set.getString(76);
				anObject.servicesobjectRefProjAgreeSumma = set.getBigDecimal(77);
				if(anObject.servicesobjectRefProjAgreeSumma != null) {
					anObject.servicesobjectRefProjAgreeSumma = anObject.servicesobjectRefProjAgreeSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectRefTopographySumma = set.getBigDecimal(78);
				if(anObject.servicesobjectRefTopographySumma != null) {
					anObject.servicesobjectRefTopographySumma = anObject.servicesobjectRefTopographySumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectRefCreatedFromSite = set.getInt(79);
				if(set.wasNull()) {
					anObject.servicesobjectRefCreatedFromSite = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefTerm = set.getInt(80);
				if(set.wasNull()) {
					anObject.servicesobjectRefTerm = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefRegulation = set.getInt(81);
				if(set.wasNull()) {
					anObject.servicesobjectRefRegulation = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefBoundaryDateWork = set.getDate(82);
				anObject.servicesobjectRefCountDayDelay = set.getInt(83);
				if(set.wasNull()) {
					anObject.servicesobjectRefCountDayDelay = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefFactDateWork = set.getDate(84);
				anObject.servicesobjectRefCodeEIC = set.getString(85);
				anObject.servicesobjectRefPersonalAccountUid = set.getString(86);

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
	
	public int[] getFilteredCodeArray(ENAdditionalAgreementFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENAdditionalAgreementFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENAdditionalAgreement aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENADDITIONALAGREEMENT.CODE FROM ENADDITIONALAGREEMENT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENADDITIONALAGREEMENT.CODE";
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


	public ENAdditionalAgreement getObject(int uid) throws PersistenceException {
		ENAdditionalAgreement result = new ENAdditionalAgreement();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENAdditionalAgreement anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENADDITIONALAGREEMENT.CODE, ENADDITIONALAGREEMENT.NUMBERGEN, ENADDITIONALAGREEMENT.DATEGEN, ENADDITIONALAGREEMENT.SUMWITHOUTVAT, ENADDITIONALAGREEMENT.SUMVAT, ENADDITIONALAGREEMENT.CALCSUMSBYCALCULATIONS, ENADDITIONALAGREEMENT.ISSIGNED, ENADDITIONALAGREEMENT.SERVICESOBJECTREFCODE "
			+" FROM ENADDITIONALAGREEMENT WHERE ENADDITIONALAGREEMENT.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.numberGen = set.getString(2);
				anObject.dateGen = set.getDate(3);
				anObject.sumWithoutVAT = set.getBigDecimal(4);
				if(anObject.sumWithoutVAT != null) {
					anObject.sumWithoutVAT = anObject.sumWithoutVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sumVAT = set.getBigDecimal(5);
				if(anObject.sumVAT != null) {
					anObject.sumVAT = anObject.sumVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.calcSumsByCalculations = set.getBoolean(6);
				if (set.wasNull()) {
					anObject.calcSumsByCalculations = null;
				}
				anObject.isSigned = set.getBoolean(7);
				if (set.wasNull()) {
					anObject.isSigned = null;
				}
				anObject.servicesobjectRef.code = set.getInt(8);
				if (set.wasNull()) {
					anObject.servicesobjectRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENAdditionalAgreementRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENAdditionalAgreementRef ref = new com.ksoe.energynet.valueobject.references.ENAdditionalAgreementRef();
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

		selectStr = "DELETE FROM  ENADDITIONALAGREEMENT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENAdditionalAgreement object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENAdditionalAgreement.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENAdditionalAgreement.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENAdditionalAgreement.remove%} access denied");
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
	
	public long count(ENAdditionalAgreementFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENAdditionalAgreementFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENAdditionalAgreementFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENADDITIONALAGREEMENT", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENADDITIONALAGREEMENT WHERE code = ?", propertyName);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENAdditionalAgreementFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENADDITIONALAGREEMENT");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAdditionalAgreement.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENAdditionalAgreement.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENADDITIONALAGREEMENT.CODE FROM  ENADDITIONALAGREEMENT WHERE  ENADDITIONALAGREEMENT.CODE = ?";
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
		_checkConditionToken(condition,"code","ENADDITIONALAGREEMENT.CODE");
		_checkConditionToken(condition,"numbergen","ENADDITIONALAGREEMENT.NUMBERGEN");
		_checkConditionToken(condition,"dategen","ENADDITIONALAGREEMENT.DATEGEN");
		_checkConditionToken(condition,"sumwithoutvat","ENADDITIONALAGREEMENT.SUMWITHOUTVAT");
		_checkConditionToken(condition,"sumvat","ENADDITIONALAGREEMENT.SUMVAT");
		_checkConditionToken(condition,"calcsumsbycalculations","ENADDITIONALAGREEMENT.CALCSUMSBYCALCULATIONS");
		_checkConditionToken(condition,"issigned","ENADDITIONALAGREEMENT.ISSIGNED");
		// relationship conditions
		_checkConditionToken(condition,"servicesobjectref","SERVICESOBJECTREFCODE");
		_checkConditionToken(condition,"servicesobjectref.code","SERVICESOBJECTREFCODE");
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
	
	private void _collectAutoIncrementFields(ENAdditionalAgreement anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENADDITIONALAGREEMENT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENADDITIONALAGREEMENT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENADDITIONALAGREEMENT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENADDITIONALAGREEMENT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENAdditionalAgreementDAO
