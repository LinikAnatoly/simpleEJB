
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
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
import com.ksoe.energynet.valueobject.ENSOProj2SOConn;
import com.ksoe.energynet.valueobject.filter.ENSOProj2SOConnFilter;
import com.ksoe.energynet.valueobject.brief.ENSOProj2SOConnShort;
import com.ksoe.energynet.valueobject.lists.ENSOProj2SOConnShortList;


/**
 * DAO Object for ENSOProj2SOConn;
 *
 */

public class ENSOProj2SOConnDAOGen extends GenericDataMiner {

	public ENSOProj2SOConnDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENSOProj2SOConnDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENSOProj2SOConn inObject) throws PersistenceException {
		ENSOProj2SOConn obj = new ENSOProj2SOConn();
		obj.code = inObject.code;
		loadObject(obj);
		if (inObject.SOProjRef.code != obj.SOProjRef.code){
			return false;
		}
		if (inObject.SOConnRef.code != obj.SOConnRef.code){
			return false;
		}
		return true;
	}

	public int add(ENSOProj2SOConn anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENSOProj2SOConn anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENSOPROJ2SOCONN (CODE,SOPROJREFCODE,SOCONNREFCODE) VALUES (?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.SOProjRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).exists(anObject.SOProjRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENSOProj2SOConn.SOProjRef.code%} = {%"+anObject.SOProjRef.code+"%}");
				}
				statement.setInt(2,anObject.SOProjRef.code);
			} else {
				statement.setNull(2,java.sql.Types.INTEGER);
			}
			if (anObject.SOConnRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).exists(anObject.SOConnRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENSOProj2SOConn.SOConnRef.code%} = {%"+anObject.SOConnRef.code+"%}");
				}
				statement.setInt(3,anObject.SOConnRef.code);
			} else {
				statement.setNull(3,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENSOProj2SOConnDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENSOProj2SOConn anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENSOProj2SOConn anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("SOPROJREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SOCONNREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENSOPROJ2SOCONN SET SOPROJREFCODE = ? , SOCONNREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENSOPROJ2SOCONN SET ";
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
					if (anObject.SOProjRef.code != Integer.MIN_VALUE) {
						statement.setInt(1,anObject.SOProjRef.code);
					} else {
						statement.setNull(1,java.sql.Types.INTEGER);
					}
					if (anObject.SOConnRef.code != Integer.MIN_VALUE) {
						statement.setInt(2,anObject.SOConnRef.code);
					} else {
						statement.setNull(2,java.sql.Types.INTEGER);
					}
					statement.setInt(3,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("SOPROJREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.SOProjRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.SOProjRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("SOCONNREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.SOConnRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.SOConnRef.code);
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

	} // end of save(ENSOProj2SOConn anObject,String[] anAttributes)


	public ENSOProj2SOConnShort getShortObject(int anObjectCode) throws PersistenceException {
		ENSOProj2SOConn filterObject = new ENSOProj2SOConn();
		Vector<ENSOProj2SOConnShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENSOProj2SOConnShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENSOProj2SOConn filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.SOProjRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.SOConnRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENSOProj2SOConnFilter filter) {
		String out = buildCondition((ENSOProj2SOConn)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENSOProj2SOConn filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENSOProj2SOConn.code_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.SOProjRef.code, ENSOProj2SOConn.SOProjRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.SOConnRef.code, ENSOProj2SOConn.SOConnRef_QFielld, out);
		}
		return out;
	}

	public ENSOProj2SOConnShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENSOProj2SOConnShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENSOProj2SOConnShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENSOProj2SOConnShortList getFilteredList(ENSOProj2SOConn filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENSOProj2SOConnShortList getScrollableFilteredList(ENSOProj2SOConn aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENSOProj2SOConnShortList getScrollableFilteredList(ENSOProj2SOConn aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENSOProj2SOConnShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENSOProj2SOConnShortList getScrollableFilteredList(ENSOProj2SOConnFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENSOProj2SOConnShortList getScrollableFilteredList(ENSOProj2SOConnFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENSOProj2SOConnShortList getScrollableFilteredList(ENSOProj2SOConn aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENSOProj2SOConnShortList result = new ENSOProj2SOConnShortList();
		ENSOProj2SOConnShort anObject;
		result.list = new Vector<ENSOProj2SOConnShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSOPROJ2SOCONN.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSOPROJ2SOCONN.CODE"+
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
		" FROM ENSOPROJ2SOCONN " +
			", ENSERVICESOBJECT " +
			", ENSERVICESOBJECT " +
		"";
		whereStr = " ENSERVICESOBJECT.CODE = ENSOPROJ2SOCONN.SOPROJREFCODE" ; //+
		whereStr += " AND ENSERVICESOBJECT.CODE = ENSOPROJ2SOCONN.SOCONNREFCODE" ; //+

	
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		whereStr = BaseDAOUtils.addToCondition(condition, whereStr);
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
				anObject = new ENSOProj2SOConnShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}

				anObject.SOProjRefCode = set.getInt(2);
				if(set.wasNull()) {
					anObject.SOProjRefCode = Integer.MIN_VALUE;
				}
				anObject.SOProjRefContractNumber = set.getString(3);
				anObject.SOProjRefContractDate = set.getDate(4);
				anObject.SOProjRefName = set.getString(5);
				anObject.SOProjRefPartnerCode = set.getString(6);
				anObject.SOProjRefFinDocCode = set.getString(7);
				anObject.SOProjRefFinDocID = set.getInt(8);
				if(set.wasNull()) {
					anObject.SOProjRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.SOProjRefCommentGen = set.getString(9);
				anObject.SOProjRefContractNumberServices = set.getString(10);
				anObject.SOProjRefContractDateServices = set.getDate(11);
				anObject.SOProjRefContragentName = set.getString(12);
				anObject.SOProjRefContragentAddress = set.getString(13);
				anObject.SOProjRefContragentAddressWork = set.getString(14);
				anObject.SOProjRefContragentOkpo = set.getString(15);
				anObject.SOProjRefContragentBankAccount = set.getString(16);
				anObject.SOProjRefContragentBankName = set.getString(17);
				anObject.SOProjRefContragentBankMfo = set.getString(18);
				anObject.SOProjRefContragentBossName = set.getString(19);
				anObject.SOProjRefContragentPassport = set.getString(20);
				anObject.SOProjRefContractServicesSumma = set.getBigDecimal(21);
				if(anObject.SOProjRefContractServicesSumma != null) {
					anObject.SOProjRefContractServicesSumma = anObject.SOProjRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.SOProjRefContractServicesPower = set.getBigDecimal(22);
				if(anObject.SOProjRefContractServicesPower != null) {
					anObject.SOProjRefContractServicesPower = anObject.SOProjRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.SOProjRefCommentServicesGen = set.getString(23);
				anObject.SOProjRefContractServicesDistance = set.getBigDecimal(24);
				if(anObject.SOProjRefContractServicesDistance != null) {
					anObject.SOProjRefContractServicesDistance = anObject.SOProjRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.SOProjRefContractServicesDay = set.getBigDecimal(25);
				if(anObject.SOProjRefContractServicesDay != null) {
					anObject.SOProjRefContractServicesDay = anObject.SOProjRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.SOProjRefUserGen = set.getString(26);
				anObject.SOProjRefDateEdit = set.getDate(27);
				anObject.SOProjRefWarrantDate = set.getDate(28);
				anObject.SOProjRefWarrantNumber = set.getString(29);
				anObject.SOProjRefWarrantFIO = set.getString(30);
				anObject.SOProjRefRegionalType = set.getInt(31);
				if(set.wasNull()) {
					anObject.SOProjRefRegionalType = Integer.MIN_VALUE;
				}
				anObject.SOProjRefBasisType = set.getBigDecimal(32);
				if(anObject.SOProjRefBasisType != null) {
					anObject.SOProjRefBasisType = anObject.SOProjRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.SOProjRefContragentPosition = set.getString(33);
				anObject.SOProjRefExecuteWorkDate = set.getDate(34);
				anObject.SOProjRefTimeStart = set.getTimestamp(35);
				anObject.SOProjRefTimeFinal = set.getTimestamp(36);
				anObject.SOProjRefContragentPhoneNumber = set.getString(37);
				anObject.SOProjRefExecutorPhoneNumber = set.getString(38);
				anObject.SOProjRefContragentObjectWork = set.getString(39);
				anObject.SOProjRefIsNoPay = set.getInt(40);
				if(set.wasNull()) {
					anObject.SOProjRefIsNoPay = Integer.MIN_VALUE;
				}
				anObject.SOProjRefIsCustomerMaterials = set.getInt(41);
				if(set.wasNull()) {
					anObject.SOProjRefIsCustomerMaterials = Integer.MIN_VALUE;
				}
				anObject.SOProjRefPayDate = set.getDate(42);
				anObject.SOProjRefFinPayFormCode = set.getInt(43);
				if(set.wasNull()) {
					anObject.SOProjRefFinPayFormCode = Integer.MIN_VALUE;
				}
				anObject.SOProjRefFinPayFormName = set.getString(44);
				anObject.SOProjRefPartnerId = set.getInt(45);
				if(set.wasNull()) {
					anObject.SOProjRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.SOProjRefPayDetail = set.getString(46);
				anObject.SOProjRefActTransferNumber = set.getString(47);
				anObject.SOProjRefActTransferDate = set.getDate(48);
				anObject.SOProjRefResposible = set.getString(49);
				anObject.SOProjRefResposiblePosition = set.getString(50);
				anObject.SOProjRefResposibleTabNumber = set.getString(51);
				anObject.SOProjRefPrevContractStatus = set.getInt(52);
				if(set.wasNull()) {
					anObject.SOProjRefPrevContractStatus = Integer.MIN_VALUE;
				}
				anObject.SOProjRefReconnectionTU = set.getInt(53);
				if(set.wasNull()) {
					anObject.SOProjRefReconnectionTU = Integer.MIN_VALUE;
				}
				anObject.SOProjRefPersonalAccountCode = set.getInt(54);
				if(set.wasNull()) {
					anObject.SOProjRefPersonalAccountCode = Integer.MIN_VALUE;
				}
				anObject.SOProjRefPersonalAccountNumber = set.getString(55);
				anObject.SOProjRefTabNumber = set.getString(56);
				anObject.SOProjRefCitiesList = set.getString(57);
				anObject.SOProjRefLineLength = set.getBigDecimal(58);
				if(anObject.SOProjRefLineLength != null) {
					anObject.SOProjRefLineLength = anObject.SOProjRefLineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.SOProjRefProjectCode = set.getString(59);
				anObject.SOProjRefCnPackCode = set.getInt(60);
				if(set.wasNull()) {
					anObject.SOProjRefCnPackCode = Integer.MIN_VALUE;
				}
				anObject.SOProjRefDfPackCode = set.getInt(61);
				if(set.wasNull()) {
					anObject.SOProjRefDfPackCode = Integer.MIN_VALUE;
				}
				anObject.SOProjRefCountersZoneType = set.getInt(62);
				if(set.wasNull()) {
					anObject.SOProjRefCountersZoneType = Integer.MIN_VALUE;
				}
				anObject.SOProjRefAxPartnerCode = set.getString(63);
				anObject.SOProjRefAxPartnerName = set.getString(64);
				anObject.SOProjRefAxContractNumber = set.getString(65);
				anObject.SOProjRefAxContractDate = set.getDate(66);
				anObject.SOProjRefAxContractCode = set.getString(67);
				anObject.SOProjRefAxContractId = set.getString(68);
				anObject.SOProjRefAxContractCommentGen = set.getString(69);
				anObject.SOConnRefCode = set.getInt(70);
				if(set.wasNull()) {
					anObject.SOConnRefCode = Integer.MIN_VALUE;
				}
				anObject.SOConnRefContractNumber = set.getString(71);
				anObject.SOConnRefContractDate = set.getDate(72);
				anObject.SOConnRefName = set.getString(73);
				anObject.SOConnRefPartnerCode = set.getString(74);
				anObject.SOConnRefFinDocCode = set.getString(75);
				anObject.SOConnRefFinDocID = set.getInt(76);
				if(set.wasNull()) {
					anObject.SOConnRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.SOConnRefCommentGen = set.getString(77);
				anObject.SOConnRefContractNumberServices = set.getString(78);
				anObject.SOConnRefContractDateServices = set.getDate(79);
				anObject.SOConnRefContragentName = set.getString(80);
				anObject.SOConnRefContragentAddress = set.getString(81);
				anObject.SOConnRefContragentAddressWork = set.getString(82);
				anObject.SOConnRefContragentOkpo = set.getString(83);
				anObject.SOConnRefContragentBankAccount = set.getString(84);
				anObject.SOConnRefContragentBankName = set.getString(85);
				anObject.SOConnRefContragentBankMfo = set.getString(86);
				anObject.SOConnRefContragentBossName = set.getString(87);
				anObject.SOConnRefContragentPassport = set.getString(88);
				anObject.SOConnRefContractServicesSumma = set.getBigDecimal(89);
				if(anObject.SOConnRefContractServicesSumma != null) {
					anObject.SOConnRefContractServicesSumma = anObject.SOConnRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.SOConnRefContractServicesPower = set.getBigDecimal(90);
				if(anObject.SOConnRefContractServicesPower != null) {
					anObject.SOConnRefContractServicesPower = anObject.SOConnRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.SOConnRefCommentServicesGen = set.getString(91);
				anObject.SOConnRefContractServicesDistance = set.getBigDecimal(92);
				if(anObject.SOConnRefContractServicesDistance != null) {
					anObject.SOConnRefContractServicesDistance = anObject.SOConnRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.SOConnRefContractServicesDay = set.getBigDecimal(93);
				if(anObject.SOConnRefContractServicesDay != null) {
					anObject.SOConnRefContractServicesDay = anObject.SOConnRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.SOConnRefUserGen = set.getString(94);
				anObject.SOConnRefDateEdit = set.getDate(95);
				anObject.SOConnRefWarrantDate = set.getDate(96);
				anObject.SOConnRefWarrantNumber = set.getString(97);
				anObject.SOConnRefWarrantFIO = set.getString(98);
				anObject.SOConnRefRegionalType = set.getInt(99);
				if(set.wasNull()) {
					anObject.SOConnRefRegionalType = Integer.MIN_VALUE;
				}
				anObject.SOConnRefBasisType = set.getBigDecimal(100);
				if(anObject.SOConnRefBasisType != null) {
					anObject.SOConnRefBasisType = anObject.SOConnRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.SOConnRefContragentPosition = set.getString(101);
				anObject.SOConnRefExecuteWorkDate = set.getDate(102);
				anObject.SOConnRefTimeStart = set.getTimestamp(103);
				anObject.SOConnRefTimeFinal = set.getTimestamp(104);
				anObject.SOConnRefContragentPhoneNumber = set.getString(105);
				anObject.SOConnRefExecutorPhoneNumber = set.getString(106);
				anObject.SOConnRefContragentObjectWork = set.getString(107);
				anObject.SOConnRefIsNoPay = set.getInt(108);
				if(set.wasNull()) {
					anObject.SOConnRefIsNoPay = Integer.MIN_VALUE;
				}
				anObject.SOConnRefIsCustomerMaterials = set.getInt(109);
				if(set.wasNull()) {
					anObject.SOConnRefIsCustomerMaterials = Integer.MIN_VALUE;
				}
				anObject.SOConnRefPayDate = set.getDate(110);
				anObject.SOConnRefFinPayFormCode = set.getInt(111);
				if(set.wasNull()) {
					anObject.SOConnRefFinPayFormCode = Integer.MIN_VALUE;
				}
				anObject.SOConnRefFinPayFormName = set.getString(112);
				anObject.SOConnRefPartnerId = set.getInt(113);
				if(set.wasNull()) {
					anObject.SOConnRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.SOConnRefPayDetail = set.getString(114);
				anObject.SOConnRefActTransferNumber = set.getString(115);
				anObject.SOConnRefActTransferDate = set.getDate(116);
				anObject.SOConnRefResposible = set.getString(117);
				anObject.SOConnRefResposiblePosition = set.getString(118);
				anObject.SOConnRefResposibleTabNumber = set.getString(119);
				anObject.SOConnRefPrevContractStatus = set.getInt(120);
				if(set.wasNull()) {
					anObject.SOConnRefPrevContractStatus = Integer.MIN_VALUE;
				}
				anObject.SOConnRefReconnectionTU = set.getInt(121);
				if(set.wasNull()) {
					anObject.SOConnRefReconnectionTU = Integer.MIN_VALUE;
				}
				anObject.SOConnRefPersonalAccountCode = set.getInt(122);
				if(set.wasNull()) {
					anObject.SOConnRefPersonalAccountCode = Integer.MIN_VALUE;
				}
				anObject.SOConnRefPersonalAccountNumber = set.getString(123);
				anObject.SOConnRefTabNumber = set.getString(124);
				anObject.SOConnRefCitiesList = set.getString(125);
				anObject.SOConnRefLineLength = set.getBigDecimal(126);
				if(anObject.SOConnRefLineLength != null) {
					anObject.SOConnRefLineLength = anObject.SOConnRefLineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.SOConnRefProjectCode = set.getString(127);
				anObject.SOConnRefCnPackCode = set.getInt(128);
				if(set.wasNull()) {
					anObject.SOConnRefCnPackCode = Integer.MIN_VALUE;
				}
				anObject.SOConnRefDfPackCode = set.getInt(129);
				if(set.wasNull()) {
					anObject.SOConnRefDfPackCode = Integer.MIN_VALUE;
				}
				anObject.SOConnRefCountersZoneType = set.getInt(130);
				if(set.wasNull()) {
					anObject.SOConnRefCountersZoneType = Integer.MIN_VALUE;
				}
				anObject.SOConnRefAxPartnerCode = set.getString(131);
				anObject.SOConnRefAxPartnerName = set.getString(132);
				anObject.SOConnRefAxContractNumber = set.getString(133);
				anObject.SOConnRefAxContractDate = set.getDate(134);
				anObject.SOConnRefAxContractCode = set.getString(135);
				anObject.SOConnRefAxContractId = set.getString(136);
				anObject.SOConnRefAxContractCommentGen = set.getString(137);

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
	
	public int[] getFilteredCodeArray(ENSOProj2SOConnFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}


	public int[] getFilteredCodeArray(ENSOProj2SOConn aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENSOPROJ2SOCONN.CODE FROM ENSOPROJ2SOCONN";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSOPROJ2SOCONN.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);
		
		whereStr = BaseDAOUtils.addToCondition(condition, whereStr);

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
				result.add(new Integer(set.getInt(1)));
			}

			int[] array = new int[result.size()];
			for(int j = 0;j < result.size();j++) {
				array[j] = ((Integer)result.get(j)).intValue();
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

	public ENSOProj2SOConn getObject(int uid) throws PersistenceException {
		ENSOProj2SOConn result = new ENSOProj2SOConn();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENSOProj2SOConn anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENSOPROJ2SOCONN.CODE, ENSOPROJ2SOCONN.SOPROJREFCODE, ENSOPROJ2SOCONN.SOCONNREFCODE "
			+" FROM ENSOPROJ2SOCONN WHERE ENSOPROJ2SOCONN.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			}
			anObject.SOProjRef.code = set.getInt(2);
			if (set.wasNull()) {
				anObject.SOProjRef.code = Integer.MIN_VALUE;
			}
			anObject.SOConnRef.code = set.getInt(3);
			if (set.wasNull()) {
				anObject.SOConnRef.code = Integer.MIN_VALUE;
			}
			if(anObject.SOProjRef.code != Integer.MIN_VALUE) {
				anObject.setSOProjRef(
					new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).getRef(anObject.SOProjRef.code));
			}
			if(anObject.SOConnRef.code != Integer.MIN_VALUE) {
				anObject.setSOConnRef(
					new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).getRef(anObject.SOConnRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENSOProj2SOConnRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENSOProj2SOConnRef ref = new com.ksoe.energynet.valueobject.references.ENSOProj2SOConnRef();
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

		selectStr = "DELETE FROM  ENSOPROJ2SOCONN WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENSOProj2SOConn object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENSOProj2SOConn.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENSOProj2SOConn.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENSOProj2SOConn.remove%} access denied");
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
	
	public long count(ENSOProj2SOConnFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENSOProj2SOConnFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENSOProj2SOConnFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENSOPROJ2SOCONN", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENSOProj2SOConnFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENSOPROJ2SOCONN");
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
				_bindObjectsToPreparedStatement(statement,bindObjects,number);
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENSOProj2SOConn.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENSOProj2SOConn.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENSOPROJ2SOCONN.CODE FROM  ENSOPROJ2SOCONN WHERE  ENSOPROJ2SOCONN.CODE = ?";
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
		_checkConditionToken(condition,"code","ENSOPROJ2SOCONN.CODE");
		// relationship conditions
		_checkConditionToken(condition,"soprojref","SOPROJREFCODE");
		_checkConditionToken(condition,"soprojref.code","SOPROJREFCODE");
		_checkConditionToken(condition,"soconnref","SOCONNREFCODE");
		_checkConditionToken(condition,"soconnref.code","SOCONNREFCODE");
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
	
	private void _collectAutoIncrementFields(ENSOProj2SOConn anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENSOPROJ2SOCONN", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENSOPROJ2SOCONN", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENSOPROJ2SOCONN", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENSOPROJ2SOCONN");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENSOProj2SOConnDAO
