
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
import com.ksoe.energynet.valueobject.ENServicesObject2RQFKOrder;
import com.ksoe.energynet.valueobject.filter.ENServicesObject2RQFKOrderFilter;
import com.ksoe.energynet.valueobject.brief.ENServicesObject2RQFKOrderShort;
import com.ksoe.energynet.valueobject.lists.ENServicesObject2RQFKOrderShortList;


/**
 * DAO Object for ENServicesObject2RQFKOrder;
 *
 */

public class ENServicesObject2RQFKOrderDAOGen extends GenericDataMiner {

	public ENServicesObject2RQFKOrderDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENServicesObject2RQFKOrderDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENServicesObject2RQFKOrder inObject) throws PersistenceException {
		ENServicesObject2RQFKOrder obj = new ENServicesObject2RQFKOrder();
		obj.code = inObject.code;
		loadObject(obj);
		if (inObject.servicesObjectRef.code != obj.servicesObjectRef.code){
			return false;
		}
		if (inObject.fkOrderRef.code != obj.fkOrderRef.code){
			return false;
		}
		return true;
	}

	public int add(ENServicesObject2RQFKOrder anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENServicesObject2RQFKOrder anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENSERVICESBJCT2RQFKRDR (CODE,SERVICESOBJECTREFCODE,FKORDERREFCODE) VALUES (?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.servicesObjectRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).exists(anObject.servicesObjectRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENServicesObject2RQFKOrder.servicesObjectRef.code%} = {%"+anObject.servicesObjectRef.code+"%}");
				}
				statement.setInt(2,anObject.servicesObjectRef.code);
			} else {
				statement.setNull(2,java.sql.Types.INTEGER);
			}
			if (anObject.fkOrderRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.rqorder.dataminer.generated.RQFKOrderDAOGen(connection,getUserProfile()).exists(anObject.fkOrderRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.rqorder.valueobject.ENServicesObject2RQFKOrder.fkOrderRef.code%} = {%"+anObject.fkOrderRef.code+"%}");
				}
				statement.setInt(3,anObject.fkOrderRef.code);
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
			throw new PersistenceException("Error in method {%ENServicesObject2RQFKOrderDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENServicesObject2RQFKOrder anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENServicesObject2RQFKOrder anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("SERVICESOBJECTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FKORDERREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENSERVICESBJCT2RQFKRDR SET SERVICESOBJECTREFCODE = ? , FKORDERREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENSERVICESOBJECT2RQFKORDER SET ";
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
					if (anObject.servicesObjectRef.code != Integer.MIN_VALUE) {
						statement.setInt(1,anObject.servicesObjectRef.code);
					} else {
						statement.setNull(1,java.sql.Types.INTEGER);
					}
					if (anObject.fkOrderRef.code != Integer.MIN_VALUE) {
						statement.setInt(2,anObject.fkOrderRef.code);
					} else {
						statement.setNull(2,java.sql.Types.INTEGER);
					}
					statement.setInt(3,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("SERVICESOBJECTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.servicesObjectRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.servicesObjectRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("FKORDERREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.fkOrderRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.fkOrderRef.code);
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

	} // end of save(ENServicesObject2RQFKOrder anObject,String[] anAttributes)


	public ENServicesObject2RQFKOrderShort getShortObject(int anObjectCode) throws PersistenceException {
		ENServicesObject2RQFKOrder filterObject = new ENServicesObject2RQFKOrder();
		Vector<ENServicesObject2RQFKOrderShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENServicesObject2RQFKOrderShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENServicesObject2RQFKOrder filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.servicesObjectRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.fkOrderRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENServicesObject2RQFKOrderFilter filter) {
		String out = buildCondition((ENServicesObject2RQFKOrder)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENServicesObject2RQFKOrder filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENServicesObject2RQFKOrder.code_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.servicesObjectRef.code, ENServicesObject2RQFKOrder.servicesObjectRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.fkOrderRef.code, ENServicesObject2RQFKOrder.fkOrderRef_QFielld, out);
		}
		return out;
	}

	public ENServicesObject2RQFKOrderShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENServicesObject2RQFKOrderShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENServicesObject2RQFKOrderShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENServicesObject2RQFKOrderShortList getFilteredList(ENServicesObject2RQFKOrder filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENServicesObject2RQFKOrderShortList getScrollableFilteredList(ENServicesObject2RQFKOrder aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENServicesObject2RQFKOrderShortList getScrollableFilteredList(ENServicesObject2RQFKOrder aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENServicesObject2RQFKOrderShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENServicesObject2RQFKOrderShortList getScrollableFilteredList(ENServicesObject2RQFKOrderFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENServicesObject2RQFKOrderShortList getScrollableFilteredList(ENServicesObject2RQFKOrderFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENServicesObject2RQFKOrderShortList getScrollableFilteredList(ENServicesObject2RQFKOrder aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENServicesObject2RQFKOrderShortList result = new ENServicesObject2RQFKOrderShortList();
		ENServicesObject2RQFKOrderShort anObject;
		result.list = new Vector<ENServicesObject2RQFKOrderShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSERVICESBJCT2RQFKRDR.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSERVICESBJCT2RQFKRDR.CODE"+
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
			", RQFKORDER.CODE " +
			", RQFKORDER.NUMBERDOC " +
			", RQFKORDER.DATEGEN " +
			", RQFKORDER.DATESHIPMENT " +
			", RQFKORDER.DATEPOSTING " +
			", RQFKORDER.MOLOUTCODE " +
			", RQFKORDER.MOLOUTNAME " +
			", RQFKORDER.MOLINCODE " +
			", RQFKORDER.MOLINNAME " +
			", RQFKORDER.EXPEDITORCODE " +
			", RQFKORDER.EXPEDITORNAME " +
			", RQFKORDER.WARRANTNUMBER " +
			", RQFKORDER.WARRANTDATE " +
			", RQFKORDER.WARRANTFIO " +
			", RQFKORDER.SUMWITHOUTNDS " +
			", RQFKORDER.SUMNDS " +
			", RQFKORDER.NDSPERCENT " +
			", RQFKORDER.DATEADD " +
			", RQFKORDER.USERADD " +
			", RQFKORDER.DATEEDIT " +
			", RQFKORDER.USERGEN " +
		" FROM ENSERVICESBJCT2RQFKRDR " +
			", ENSERVICESOBJECT " +
			", RQFKORDER " +
		"";
		whereStr = " ENSERVICESOBJECT.CODE = ENSERVICESBJCT2RQFKRDR.SERVICESOBJECTREFCODE" ; //+
		whereStr += " AND RQFKORDER.CODE = ENSERVICESBJCT2RQFKRDR.FKORDERREFCODE" ; //+

	
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
				anObject = new ENServicesObject2RQFKOrderShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}

				anObject.servicesObjectRefCode = set.getInt(2);
				if(set.wasNull()) {
					anObject.servicesObjectRefCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefContractNumber = set.getString(3);
				anObject.servicesObjectRefContractDate = set.getDate(4);
				anObject.servicesObjectRefName = set.getString(5);
				anObject.servicesObjectRefPartnerCode = set.getString(6);
				anObject.servicesObjectRefFinDocCode = set.getString(7);
				anObject.servicesObjectRefFinDocID = set.getInt(8);
				if(set.wasNull()) {
					anObject.servicesObjectRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefCommentGen = set.getString(9);
				anObject.servicesObjectRefContractNumberServices = set.getString(10);
				anObject.servicesObjectRefContractDateServices = set.getDate(11);
				anObject.servicesObjectRefContragentName = set.getString(12);
				anObject.servicesObjectRefContragentAddress = set.getString(13);
				anObject.servicesObjectRefContragentAddressWork = set.getString(14);
				anObject.servicesObjectRefContragentOkpo = set.getString(15);
				anObject.servicesObjectRefContragentBankAccount = set.getString(16);
				anObject.servicesObjectRefContragentBankName = set.getString(17);
				anObject.servicesObjectRefContragentBankMfo = set.getString(18);
				anObject.servicesObjectRefContragentBossName = set.getString(19);
				anObject.servicesObjectRefContragentPassport = set.getString(20);
				anObject.servicesObjectRefContractServicesSumma = set.getBigDecimal(21);
				if(anObject.servicesObjectRefContractServicesSumma != null) {
					anObject.servicesObjectRefContractServicesSumma = anObject.servicesObjectRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesSummaVAT = set.getBigDecimal(22);
				if(anObject.servicesObjectRefContractServicesSummaVAT != null) {
					anObject.servicesObjectRefContractServicesSummaVAT = anObject.servicesObjectRefContractServicesSummaVAT.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesPower = set.getBigDecimal(23);
				if(anObject.servicesObjectRefContractServicesPower != null) {
					anObject.servicesObjectRefContractServicesPower = anObject.servicesObjectRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefCommentServicesGen = set.getString(24);
				anObject.servicesObjectRefContractServicesDistance = set.getBigDecimal(25);
				if(anObject.servicesObjectRefContractServicesDistance != null) {
					anObject.servicesObjectRefContractServicesDistance = anObject.servicesObjectRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesDay = set.getBigDecimal(26);
				if(anObject.servicesObjectRefContractServicesDay != null) {
					anObject.servicesObjectRefContractServicesDay = anObject.servicesObjectRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefUserGen = set.getString(27);
				anObject.servicesObjectRefDateEdit = set.getDate(28);
				anObject.servicesObjectRefWarrantDate = set.getDate(29);
				anObject.servicesObjectRefWarrantNumber = set.getString(30);
				anObject.servicesObjectRefWarrantFIO = set.getString(31);
				anObject.servicesObjectRefRegionalType = set.getInt(32);
				if(set.wasNull()) {
					anObject.servicesObjectRefRegionalType = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefBasisType = set.getBigDecimal(33);
				if(anObject.servicesObjectRefBasisType != null) {
					anObject.servicesObjectRefBasisType = anObject.servicesObjectRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContragentPosition = set.getString(34);
				anObject.servicesObjectRefExecuteWorkDate = set.getDate(35);
				anObject.servicesObjectRefTimeStart = set.getTimestamp(36);
				anObject.servicesObjectRefTimeFinal = set.getTimestamp(37);
				anObject.servicesObjectRefContragentPhoneNumber = set.getString(38);
				anObject.servicesObjectRefExecutorPhoneNumber = set.getString(39);
				anObject.servicesObjectRefContragentObjectWork = set.getString(40);
				anObject.servicesObjectRefIsNoPay = set.getInt(41);
				if(set.wasNull()) {
					anObject.servicesObjectRefIsNoPay = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefIsCustomerMaterials = set.getInt(42);
				if(set.wasNull()) {
					anObject.servicesObjectRefIsCustomerMaterials = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPayDate = set.getDate(43);
				anObject.servicesObjectRefFinPayFormCode = set.getInt(44);
				if(set.wasNull()) {
					anObject.servicesObjectRefFinPayFormCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefFinPayFormName = set.getString(45);
				anObject.servicesObjectRefPartnerId = set.getInt(46);
				if(set.wasNull()) {
					anObject.servicesObjectRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPayDetail = set.getString(47);
				anObject.servicesObjectRefActTransferNumber = set.getString(48);
				anObject.servicesObjectRefActTransferDate = set.getDate(49);
				anObject.servicesObjectRefResposible = set.getString(50);
				anObject.servicesObjectRefResposiblePosition = set.getString(51);
				anObject.servicesObjectRefResposibleTabNumber = set.getString(52);
				anObject.servicesObjectRefPrevContractStatus = set.getInt(53);
				if(set.wasNull()) {
					anObject.servicesObjectRefPrevContractStatus = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefReconnectionTU = set.getInt(54);
				if(set.wasNull()) {
					anObject.servicesObjectRefReconnectionTU = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPersonalAccountCode = set.getInt(55);
				if(set.wasNull()) {
					anObject.servicesObjectRefPersonalAccountCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPersonalAccountNumber = set.getString(56);
				anObject.servicesObjectRefTabNumber = set.getString(57);
				anObject.servicesObjectRefCitiesList = set.getString(58);
				anObject.servicesObjectRefLineLength = set.getBigDecimal(59);
				if(anObject.servicesObjectRefLineLength != null) {
					anObject.servicesObjectRefLineLength = anObject.servicesObjectRefLineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefProjectCode = set.getString(60);
				anObject.servicesObjectRefCnPackCode = set.getInt(61);
				if(set.wasNull()) {
					anObject.servicesObjectRefCnPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefDfPackCode = set.getInt(62);
				if(set.wasNull()) {
					anObject.servicesObjectRefDfPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefCountersZoneType = set.getInt(63);
				if(set.wasNull()) {
					anObject.servicesObjectRefCountersZoneType = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefAxPartnerCode = set.getString(64);
				anObject.servicesObjectRefAxPartnerName = set.getString(65);
				anObject.servicesObjectRefAxContractNumber = set.getString(66);
				anObject.servicesObjectRefAxContractDate = set.getDate(67);
				anObject.servicesObjectRefAxContractCode = set.getString(68);
				anObject.servicesObjectRefAxContractId = set.getString(69);
				anObject.servicesObjectRefAxContractCommentGen = set.getString(70);
				anObject.servicesObjectRefProjAgreeSumma = set.getBigDecimal(71);
				if(anObject.servicesObjectRefProjAgreeSumma != null) {
					anObject.servicesObjectRefProjAgreeSumma = anObject.servicesObjectRefProjAgreeSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefTopographySumma = set.getBigDecimal(72);
				if(anObject.servicesObjectRefTopographySumma != null) {
					anObject.servicesObjectRefTopographySumma = anObject.servicesObjectRefTopographySumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefCreatedFromSite = set.getInt(73);
				if(set.wasNull()) {
					anObject.servicesObjectRefCreatedFromSite = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefTerm = set.getInt(74);
				if(set.wasNull()) {
					anObject.servicesObjectRefTerm = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefRegulation = set.getInt(75);
				if(set.wasNull()) {
					anObject.servicesObjectRefRegulation = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefBoundaryDateWork = set.getDate(76);
				anObject.servicesObjectRefCountDayDelay = set.getInt(77);
				if(set.wasNull()) {
					anObject.servicesObjectRefCountDayDelay = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefFactDateWork = set.getDate(78);
				anObject.fkOrderRefCode = set.getInt(79);
				if(set.wasNull()) {
					anObject.fkOrderRefCode = Integer.MIN_VALUE;
				}
				anObject.fkOrderRefNumberDoc = set.getString(80);
				anObject.fkOrderRefDateGen = set.getDate(81);
				anObject.fkOrderRefDateShipment = set.getDate(82);
				anObject.fkOrderRefDatePosting = set.getDate(83);
				anObject.fkOrderRefMolOutCode = set.getString(84);
				anObject.fkOrderRefMolOutName = set.getString(85);
				anObject.fkOrderRefMolInCode = set.getString(86);
				anObject.fkOrderRefMolInName = set.getString(87);
				anObject.fkOrderRefExpeditorCode = set.getString(88);
				anObject.fkOrderRefExpeditorName = set.getString(89);
				anObject.fkOrderRefWarrantNumber = set.getString(90);
				anObject.fkOrderRefWarrantDate = set.getDate(91);
				anObject.fkOrderRefWarrantFIO = set.getString(92);
				anObject.fkOrderRefSumWithoutNds = set.getBigDecimal(93);
				if(anObject.fkOrderRefSumWithoutNds != null) {
					anObject.fkOrderRefSumWithoutNds = anObject.fkOrderRefSumWithoutNds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.fkOrderRefSumNds = set.getBigDecimal(94);
				if(anObject.fkOrderRefSumNds != null) {
					anObject.fkOrderRefSumNds = anObject.fkOrderRefSumNds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.fkOrderRefNdsPercent = set.getInt(95);
				if(set.wasNull()) {
					anObject.fkOrderRefNdsPercent = Integer.MIN_VALUE;
				}
				anObject.fkOrderRefDateAdd = set.getTimestamp(96);
				anObject.fkOrderRefUserAdd = set.getString(97);
				anObject.fkOrderRefDateEdit = set.getTimestamp(98);
				anObject.fkOrderRefUserGen = set.getString(99);

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
	
	public int[] getFilteredCodeArray(ENServicesObject2RQFKOrderFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENServicesObject2RQFKOrderFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENServicesObject2RQFKOrder aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENSERVICESBJCT2RQFKRDR.CODE FROM ENSERVICESBJCT2RQFKRDR";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSERVICESBJCT2RQFKRDR.CODE";
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

	public ENServicesObject2RQFKOrder getObject(int uid) throws PersistenceException {
		ENServicesObject2RQFKOrder result = new ENServicesObject2RQFKOrder();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENServicesObject2RQFKOrder anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENSERVICESBJCT2RQFKRDR.CODE, ENSERVICESBJCT2RQFKRDR.SERVICESOBJECTREFCODE, ENSERVICESBJCT2RQFKRDR.FKORDERREFCODE "
			+" FROM ENSERVICESBJCT2RQFKRDR WHERE ENSERVICESBJCT2RQFKRDR.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.servicesObjectRef.code = set.getInt(2);
				if (set.wasNull()) {
					anObject.servicesObjectRef.code = Integer.MIN_VALUE;
				}
				anObject.fkOrderRef.code = set.getInt(3);
				if (set.wasNull()) {
					anObject.fkOrderRef.code = Integer.MIN_VALUE;
				}
				if(anObject.servicesObjectRef.code != Integer.MIN_VALUE) {
					anObject.setServicesObjectRef(
						new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).getRef(anObject.servicesObjectRef.code));
				}
				if(anObject.fkOrderRef.code != Integer.MIN_VALUE) {
					anObject.setFkOrderRef(
						new com.ksoe.rqorder.dataminer.generated.RQFKOrderDAOGen(connection,getUserProfile()).getRef(anObject.fkOrderRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENServicesObject2RQFKOrderRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENServicesObject2RQFKOrderRef ref = new com.ksoe.energynet.valueobject.references.ENServicesObject2RQFKOrderRef();
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

		selectStr = "DELETE FROM  ENSERVICESBJCT2RQFKRDR WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENServicesObject2RQFKOrder object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENServicesObject2RQFKOrder.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesObject2RQFKOrder.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENServicesObject2RQFKOrder.remove%} access denied");
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
	
	public long count(ENServicesObject2RQFKOrderFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENServicesObject2RQFKOrderFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENServicesObject2RQFKOrderFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENSERVICESBJCT2RQFKRDR", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENServicesObject2RQFKOrderFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENSERVICESBJCT2RQFKRDR");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesObject2RQFKOrder.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENServicesObject2RQFKOrder.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENSERVICESBJCT2RQFKRDR.CODE FROM  ENSERVICESBJCT2RQFKRDR WHERE  ENSERVICESBJCT2RQFKRDR.CODE = ?";
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
		_checkConditionToken(condition,"code","ENSERVICESBJCT2RQFKRDR.CODE");
		// relationship conditions
		_checkConditionToken(condition,"servicesobjectref","SERVICESOBJECTREFCODE");
		_checkConditionToken(condition,"servicesobjectref.code","SERVICESOBJECTREFCODE");
		_checkConditionToken(condition,"fkorderref","FKORDERREFCODE");
		_checkConditionToken(condition,"fkorderref.code","FKORDERREFCODE");
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
	
	private void _collectAutoIncrementFields(ENServicesObject2RQFKOrder anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENSERVICESBJCT2RQFKRDR", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENSERVICESBJCT2RQFKRDR", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENSERVICESBJCT2RQFKRDR", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENSERVICESBJCT2RQFKRDR");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENServicesObject2RQFKOrderDAO
