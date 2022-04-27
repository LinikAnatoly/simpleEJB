
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
import com.ksoe.energynet.valueobject.ENBuilding2ServicesObject;
import com.ksoe.energynet.valueobject.filter.ENBuilding2ServicesObjectFilter;
import com.ksoe.energynet.valueobject.brief.ENBuilding2ServicesObjectShort;
import com.ksoe.energynet.valueobject.lists.ENBuilding2ServicesObjectShortList;


/**
 * DAO Object for ENBuilding2ServicesObject;
 *
 */

public class ENBuilding2ServicesObjectDAOGen extends GenericDataMiner {

	public ENBuilding2ServicesObjectDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENBuilding2ServicesObjectDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENBuilding2ServicesObject inObject) throws PersistenceException {
		ENBuilding2ServicesObject obj = new ENBuilding2ServicesObject();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.contractNumber == null && obj.contractNumber == null){}
		else
			if(inObject.contractNumber == null || obj.contractNumber == null) return false;
			else
				if ( ! inObject.contractNumber.equals(obj.contractNumber)){
					return false;
				}

		if(inObject.contractDate == null && obj.contractDate == null){} else 
			if(inObject.contractDate == null || obj.contractDate == null) return false;
			else
				if (inObject.contractDate.compareTo(obj.contractDate) != 0){
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
		if (inObject.servicesObjectRef.code != obj.servicesObjectRef.code){
			return false;
		}
		if (inObject.ENBuildingRef.code != obj.ENBuildingRef.code){
			return false;
		}
		return true;
	}

	public int add(ENBuilding2ServicesObject anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENBuilding2ServicesObject anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENBUILDING2SERVICSBJCT (CODE,CONTRACTNUMBER,CONTRACTDATE,PARTNERNAME,PARTNERCODE,SERVICESOBJECTREFCODE,ENBUILDINGREFCODE) VALUES (?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.contractNumber);
			if (anObject.contractDate == null) {
				statement.setDate(3, null);
			} else {
				statement.setDate(3, new java.sql.Date(anObject.contractDate.getTime()));
			}
			statement.setString(4, anObject.partnerName);
			statement.setString(5, anObject.partnerCode);
			if (anObject.servicesObjectRef.code != Integer.MIN_VALUE){
				statement.setInt(6,anObject.servicesObjectRef.code);
			} else {
				statement.setNull(6,java.sql.Types.INTEGER);
			}
			if (anObject.ENBuildingRef.code != Integer.MIN_VALUE){
				statement.setInt(7,anObject.ENBuildingRef.code);
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
			throw new PersistenceException("Error in method {%ENBuilding2ServicesObjectDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENBuilding2ServicesObject anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENBuilding2ServicesObject anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("CONTRACTNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRACTDATE") == 0) {
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
					if(fieldNameStr.compareTo("SERVICESOBJECTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ENBUILDINGREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENBUILDING2SERVICSBJCT SET  CONTRACTNUMBER = ? , CONTRACTDATE = ? , PARTNERNAME = ? , PARTNERCODE = ? , SERVICESOBJECTREFCODE = ? , ENBUILDINGREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENBUILDING2SERVICESOBJECT SET ";
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
					statement.setString(1, anObject.contractNumber);
					if (anObject.contractDate == null) {
						statement.setDate(2, null);
					} else {
						statement.setDate(2, new java.sql.Date(anObject.contractDate.getTime()));
					}
					statement.setString(3, anObject.partnerName);
					statement.setString(4, anObject.partnerCode);
					if (anObject.servicesObjectRef.code != Integer.MIN_VALUE) {
						statement.setInt(5, anObject.servicesObjectRef.code);
					} else {
						statement.setNull(5, java.sql.Types.INTEGER);
					}
					if (anObject.ENBuildingRef.code != Integer.MIN_VALUE) {
						statement.setInt(6, anObject.ENBuildingRef.code);
					} else {
						statement.setNull(6, java.sql.Types.INTEGER);
					}
					statement.setInt(7, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("CONTRACTNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.contractNumber);
							continue;
						}
						if("CONTRACTDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.contractDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.contractDate.getTime()));
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
						if("SERVICESOBJECTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.servicesObjectRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.servicesObjectRef.code);
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

	} // end of save(ENBuilding2ServicesObject anObject,String[] anAttributes)


	public ENBuilding2ServicesObjectShort getShortObject(int anObjectCode) throws PersistenceException {
		ENBuilding2ServicesObject filterObject = new ENBuilding2ServicesObject();
		Vector<ENBuilding2ServicesObjectShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENBuilding2ServicesObjectShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENBuilding2ServicesObject filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.contractNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.contractDate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.partnerName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.partnerCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.servicesObjectRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.ENBuildingRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENBuilding2ServicesObjectFilter filter) {
		String out = buildCondition((ENBuilding2ServicesObject)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENBuilding2ServicesObject filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENBuilding2ServicesObject.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.contractNumber, ENBuilding2ServicesObject.contractNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.contractDate, ENBuilding2ServicesObject.contractDate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.partnerName, ENBuilding2ServicesObject.partnerName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.partnerCode, ENBuilding2ServicesObject.partnerCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.servicesObjectRef.code, ENBuilding2ServicesObject.servicesObjectRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.ENBuildingRef.code, ENBuilding2ServicesObject.ENBuildingRef_QFielld, out);
		}
		return out;
	}

	public ENBuilding2ServicesObjectShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENBuilding2ServicesObjectShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENBuilding2ServicesObjectShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENBuilding2ServicesObjectShortList getFilteredList(ENBuilding2ServicesObject filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENBuilding2ServicesObjectShortList getScrollableFilteredList(ENBuilding2ServicesObject aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENBuilding2ServicesObjectShortList getScrollableFilteredList(ENBuilding2ServicesObject aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENBuilding2ServicesObjectShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENBuilding2ServicesObjectShortList getScrollableFilteredList(ENBuilding2ServicesObjectFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENBuilding2ServicesObjectShortList getScrollableFilteredList(ENBuilding2ServicesObjectFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENBuilding2ServicesObjectShortList getScrollableFilteredList(ENBuilding2ServicesObject aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENBuilding2ServicesObjectShortList result = new ENBuilding2ServicesObjectShortList();
		ENBuilding2ServicesObjectShort anObject;
		result.list = new Vector<ENBuilding2ServicesObjectShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENBUILDING2SERVICSBJCT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENBUILDING2SERVICSBJCT.CODE"+
			",ENBUILDING2SERVICSBJCT.CONTRACTNUMBER"+
			",ENBUILDING2SERVICSBJCT.CONTRACTDATE"+
			",ENBUILDING2SERVICSBJCT.PARTNERNAME"+
			",ENBUILDING2SERVICSBJCT.PARTNERCODE"+
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
			", ENSERVICESOBJECT.CUSTOMERMAILINGADDRESS " +
			", ENSERVICESOBJECT.POWERGENERATION " +
			", ENSERVICESOBJECT.POSTCODE " +
			", ENSERVICESOBJECT.CUSTOMEREMAIL " +
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
		" FROM ENBUILDING2SERVICSBJCT " +
			" LEFT JOIN ENSERVICESOBJECT on ENSERVICESOBJECT.CODE = ENBUILDING2SERVICSBJCT.SERVICESOBJECTREFCODE "+
			" LEFT JOIN ENBUILDING on ENBUILDING.CODE = ENBUILDING2SERVICSBJCT.ENBUILDINGREFCODE "+
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
				anObject = new ENBuilding2ServicesObjectShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.contractNumber = set.getString(2);
				anObject.contractDate = set.getDate(3);
				anObject.partnerName = set.getString(4);
				anObject.partnerCode = set.getString(5);

				anObject.servicesObjectRefCode = set.getInt(6);
				if(set.wasNull()) {
					anObject.servicesObjectRefCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefContractNumber = set.getString(7);
				anObject.servicesObjectRefContractDate = set.getDate(8);
				anObject.servicesObjectRefName = set.getString(9);
				anObject.servicesObjectRefPartnerCode = set.getString(10);
				anObject.servicesObjectRefFinDocCode = set.getString(11);
				anObject.servicesObjectRefFinDocID = set.getInt(12);
				if(set.wasNull()) {
					anObject.servicesObjectRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefCommentGen = set.getString(13);
				anObject.servicesObjectRefContractNumberServices = set.getString(14);
				anObject.servicesObjectRefContractDateServices = set.getDate(15);
				anObject.servicesObjectRefContragentName = set.getString(16);
				anObject.servicesObjectRefContragentAddress = set.getString(17);
				anObject.servicesObjectRefContragentAddressWork = set.getString(18);
				anObject.servicesObjectRefContragentOkpo = set.getString(19);
				anObject.servicesObjectRefContragentBankAccount = set.getString(20);
				anObject.servicesObjectRefContragentBankName = set.getString(21);
				anObject.servicesObjectRefContragentBankMfo = set.getString(22);
				anObject.servicesObjectRefContragentBossName = set.getString(23);
				anObject.servicesObjectRefContragentPassport = set.getString(24);
				anObject.servicesObjectRefContractServicesSumma = set.getBigDecimal(25);
				if(anObject.servicesObjectRefContractServicesSumma != null) {
					anObject.servicesObjectRefContractServicesSumma = anObject.servicesObjectRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesSummaVAT = set.getBigDecimal(26);
				if(anObject.servicesObjectRefContractServicesSummaVAT != null) {
					anObject.servicesObjectRefContractServicesSummaVAT = anObject.servicesObjectRefContractServicesSummaVAT.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesPower = set.getBigDecimal(27);
				if(anObject.servicesObjectRefContractServicesPower != null) {
					anObject.servicesObjectRefContractServicesPower = anObject.servicesObjectRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefCommentServicesGen = set.getString(28);
				anObject.servicesObjectRefContractServicesDistance = set.getBigDecimal(29);
				if(anObject.servicesObjectRefContractServicesDistance != null) {
					anObject.servicesObjectRefContractServicesDistance = anObject.servicesObjectRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesDay = set.getBigDecimal(30);
				if(anObject.servicesObjectRefContractServicesDay != null) {
					anObject.servicesObjectRefContractServicesDay = anObject.servicesObjectRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefUserGen = set.getString(31);
				anObject.servicesObjectRefDateEdit = set.getDate(32);
				anObject.servicesObjectRefWarrantDate = set.getDate(33);
				anObject.servicesObjectRefWarrantNumber = set.getString(34);
				anObject.servicesObjectRefWarrantFIO = set.getString(35);
				anObject.servicesObjectRefRegionalType = set.getInt(36);
				if(set.wasNull()) {
					anObject.servicesObjectRefRegionalType = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefBasisType = set.getBigDecimal(37);
				if(anObject.servicesObjectRefBasisType != null) {
					anObject.servicesObjectRefBasisType = anObject.servicesObjectRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContragentPosition = set.getString(38);
				anObject.servicesObjectRefExecuteWorkDate = set.getDate(39);
				anObject.servicesObjectRefTimeStart = set.getTimestamp(40);
				anObject.servicesObjectRefTimeFinal = set.getTimestamp(41);
				anObject.servicesObjectRefContragentPhoneNumber = set.getString(42);
				anObject.servicesObjectRefExecutorPhoneNumber = set.getString(43);
				anObject.servicesObjectRefContragentObjectWork = set.getString(44);
				anObject.servicesObjectRefIsNoPay = set.getInt(45);
				if(set.wasNull()) {
					anObject.servicesObjectRefIsNoPay = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefIsCustomerMaterials = set.getInt(46);
				if(set.wasNull()) {
					anObject.servicesObjectRefIsCustomerMaterials = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPayDate = set.getDate(47);
				anObject.servicesObjectRefFinPayFormCode = set.getInt(48);
				if(set.wasNull()) {
					anObject.servicesObjectRefFinPayFormCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefFinPayFormName = set.getString(49);
				anObject.servicesObjectRefPartnerId = set.getInt(50);
				if(set.wasNull()) {
					anObject.servicesObjectRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPayDetail = set.getString(51);
				anObject.servicesObjectRefActTransferNumber = set.getString(52);
				anObject.servicesObjectRefActTransferDate = set.getDate(53);
				anObject.servicesObjectRefResposible = set.getString(54);
				anObject.servicesObjectRefResposiblePosition = set.getString(55);
				anObject.servicesObjectRefResposibleTabNumber = set.getString(56);
				anObject.servicesObjectRefPrevContractStatus = set.getInt(57);
				if(set.wasNull()) {
					anObject.servicesObjectRefPrevContractStatus = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefReconnectionTU = set.getInt(58);
				if(set.wasNull()) {
					anObject.servicesObjectRefReconnectionTU = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPersonalAccountCode = set.getInt(59);
				if(set.wasNull()) {
					anObject.servicesObjectRefPersonalAccountCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPersonalAccountNumber = set.getString(60);
				anObject.servicesObjectRefTabNumber = set.getString(61);
				anObject.servicesObjectRefCitiesList = set.getString(62);
				anObject.servicesObjectRefLineLength = set.getBigDecimal(63);
				if(anObject.servicesObjectRefLineLength != null) {
					anObject.servicesObjectRefLineLength = anObject.servicesObjectRefLineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefProjectCode = set.getString(64);
				anObject.servicesObjectRefCnPackCode = set.getInt(65);
				if(set.wasNull()) {
					anObject.servicesObjectRefCnPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefDfPackCode = set.getInt(66);
				if(set.wasNull()) {
					anObject.servicesObjectRefDfPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefCountersZoneType = set.getInt(67);
				if(set.wasNull()) {
					anObject.servicesObjectRefCountersZoneType = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefAxPartnerCode = set.getString(68);
				anObject.servicesObjectRefAxPartnerName = set.getString(69);
				anObject.servicesObjectRefAxContractNumber = set.getString(70);
				anObject.servicesObjectRefAxContractDate = set.getDate(71);
				anObject.servicesObjectRefAxContractCode = set.getString(72);
				anObject.servicesObjectRefAxContractId = set.getString(73);
				anObject.servicesObjectRefAxContractCommentGen = set.getString(74);
				anObject.servicesObjectRefProjAgreeSumma = set.getBigDecimal(75);
				if(anObject.servicesObjectRefProjAgreeSumma != null) {
					anObject.servicesObjectRefProjAgreeSumma = anObject.servicesObjectRefProjAgreeSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefTopographySumma = set.getBigDecimal(76);
				if(anObject.servicesObjectRefTopographySumma != null) {
					anObject.servicesObjectRefTopographySumma = anObject.servicesObjectRefTopographySumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefCreatedFromSite = set.getInt(77);
				if(set.wasNull()) {
					anObject.servicesObjectRefCreatedFromSite = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefTerm = set.getInt(78);
				if(set.wasNull()) {
					anObject.servicesObjectRefTerm = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefRegulation = set.getInt(79);
				if(set.wasNull()) {
					anObject.servicesObjectRefRegulation = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefBoundaryDateWork = set.getDate(80);
				anObject.servicesObjectRefCountDayDelay = set.getInt(81);
				if(set.wasNull()) {
					anObject.servicesObjectRefCountDayDelay = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefFactDateWork = set.getDate(82);
				anObject.servicesObjectRefCodeEIC = set.getString(83);
				anObject.servicesObjectRefPersonalAccountUid = set.getString(84);
				anObject.servicesObjectRefCustomerMailingAddress = set.getString(85);
				anObject.servicesObjectRefPowerGeneration = set.getBigDecimal(86);
				if(anObject.servicesObjectRefPowerGeneration != null) {
					anObject.servicesObjectRefPowerGeneration = anObject.servicesObjectRefPowerGeneration.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefPostCode = set.getString(87);
				anObject.servicesObjectRefCustomerEmail = set.getString(88);
				anObject.ENBuildingRefCode = set.getInt(89);
				if(set.wasNull()) {
					anObject.ENBuildingRefCode = Integer.MIN_VALUE;
				}
				anObject.ENBuildingRefNumbergen = set.getString(90);
				anObject.ENBuildingRefDateGen = set.getDate(91);
				anObject.ENBuildingRefDateEdit = set.getDate(92);
				anObject.ENBuildingRefSummaGen = set.getBigDecimal(93);
				if(anObject.ENBuildingRefSummaGen != null) {
					anObject.ENBuildingRefSummaGen = anObject.ENBuildingRefSummaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ENBuildingRefSummaNDS = set.getBigDecimal(94);
				if(anObject.ENBuildingRefSummaNDS != null) {
					anObject.ENBuildingRefSummaNDS = anObject.ENBuildingRefSummaNDS.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ENBuildingRefCharacteristic = set.getString(95);
				anObject.ENBuildingRefExecutedPosition = set.getString(96);
				anObject.ENBuildingRefExecutedName = set.getString(97);
				anObject.ENBuildingRefAcceptedPosition = set.getString(98);
				anObject.ENBuildingRefAcceptedName = set.getString(99);
				anObject.ENBuildingRefContractPrice = set.getBigDecimal(100);
				if(anObject.ENBuildingRefContractPrice != null) {
					anObject.ENBuildingRefContractPrice = anObject.ENBuildingRefContractPrice.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ENBuildingRefCodeMol = set.getString(101);
				anObject.ENBuildingRefCodePodr = set.getString(102);
				anObject.ENBuildingRefInvNumberOZ = set.getString(103);
				anObject.ENBuildingRefNameOZ = set.getString(104);
				anObject.ENBuildingRefFinContractNumber = set.getString(105);
				anObject.ENBuildingRefFinContractDate = set.getDate(106);
				anObject.ENBuildingRefPartnerName = set.getString(107);
				anObject.ENBuildingRefPartnerCode = set.getString(108);
				anObject.ENBuildingRefIsInvestProgram = set.getInt(109);
				if(set.wasNull()) {
					anObject.ENBuildingRefIsInvestProgram = Integer.MIN_VALUE;
				}
				anObject.ENBuildingRefYearInvestProgram = set.getString(110);
				anObject.ENBuildingRefItemInvestProgram = set.getString(111);
				anObject.ENBuildingRefBuildingAddress = set.getString(112);
				anObject.ENBuildingRefDecreeNumber = set.getString(113);
				anObject.ENBuildingRefDecreeDate = set.getDate(114);
				anObject.ENBuildingRefExploitationTerm = set.getInt(115);
				if(set.wasNull()) {
					anObject.ENBuildingRefExploitationTerm = Integer.MIN_VALUE;
				}
				anObject.ENBuildingRefDateLoadExpl = set.getDate(116);
				anObject.ENBuildingRefDateBuild = set.getDate(117);
				anObject.ENBuildingRefUserGen = set.getString(118);

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
	
	public int[] getFilteredCodeArray(ENBuilding2ServicesObjectFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENBuilding2ServicesObjectFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENBuilding2ServicesObject aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENBUILDING2SERVICSBJCT.CODE FROM ENBUILDING2SERVICSBJCT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENBUILDING2SERVICSBJCT.CODE";
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


	public ENBuilding2ServicesObject getObject(int uid) throws PersistenceException {
		ENBuilding2ServicesObject result = new ENBuilding2ServicesObject();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENBuilding2ServicesObject anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENBUILDING2SERVICSBJCT.CODE, ENBUILDING2SERVICSBJCT.CONTRACTNUMBER, ENBUILDING2SERVICSBJCT.CONTRACTDATE, ENBUILDING2SERVICSBJCT.PARTNERNAME, ENBUILDING2SERVICSBJCT.PARTNERCODE, ENBUILDING2SERVICSBJCT.SERVICESOBJECTREFCODE, ENBUILDING2SERVICSBJCT.ENBUILDINGREFCODE "
			+" FROM ENBUILDING2SERVICSBJCT WHERE ENBUILDING2SERVICSBJCT.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.contractNumber = set.getString(2);
				anObject.contractDate = set.getDate(3);
				anObject.partnerName = set.getString(4);
				anObject.partnerCode = set.getString(5);
				anObject.servicesObjectRef.code = set.getInt(6);
				if (set.wasNull()) {
					anObject.servicesObjectRef.code = Integer.MIN_VALUE;
				}
				anObject.ENBuildingRef.code = set.getInt(7);
				if (set.wasNull()) {
					anObject.ENBuildingRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENBuilding2ServicesObjectRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENBuilding2ServicesObjectRef ref = new com.ksoe.energynet.valueobject.references.ENBuilding2ServicesObjectRef();
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

		selectStr = "DELETE FROM  ENBUILDING2SERVICSBJCT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENBuilding2ServicesObject object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENBuilding2ServicesObject.getObject%} access denied");
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
	
	public long count(ENBuilding2ServicesObjectFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENBuilding2ServicesObjectFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENBuilding2ServicesObjectFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENBUILDING2SERVICSBJCT", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENBUILDING2SERVICSBJCT WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, ENBuilding2ServicesObjectFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENBuilding2ServicesObjectFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENBUILDING2SERVICSBJCT");
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
			"SELECT  ENBUILDING2SERVICSBJCT.CODE FROM  ENBUILDING2SERVICSBJCT WHERE  ENBUILDING2SERVICSBJCT.CODE = ?";
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
		_checkConditionToken(condition,"code","ENBUILDING2SERVICSBJCT.CODE");
		_checkConditionToken(condition,"contractnumber","ENBUILDING2SERVICSBJCT.CONTRACTNUMBER");
		_checkConditionToken(condition,"contractdate","ENBUILDING2SERVICSBJCT.CONTRACTDATE");
		_checkConditionToken(condition,"partnername","ENBUILDING2SERVICSBJCT.PARTNERNAME");
		_checkConditionToken(condition,"partnercode","ENBUILDING2SERVICSBJCT.PARTNERCODE");
		// relationship conditions
		_checkConditionToken(condition,"servicesobjectref","SERVICESOBJECTREFCODE");
		_checkConditionToken(condition,"servicesobjectref.code","SERVICESOBJECTREFCODE");
		_checkConditionToken(condition,"enbuildingref","ENBUILDINGREFCODE");
		_checkConditionToken(condition,"enbuildingref.code","ENBUILDINGREFCODE");
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
	
	private void _collectAutoIncrementFields(ENBuilding2ServicesObject anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENBUILDING2SERVICSBJCT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENBUILDING2SERVICSBJCT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENBUILDING2SERVICSBJCT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENBUILDING2SERVICSBJCT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENBuilding2ServicesObjectDAO
