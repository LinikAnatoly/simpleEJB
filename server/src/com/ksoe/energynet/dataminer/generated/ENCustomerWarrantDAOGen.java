
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer.generated;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Hashtable;
import java.util.List;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.valueobject.ENCustomerWarrant;
import com.ksoe.energynet.valueobject.brief.ENCustomerWarrantShort;
import com.ksoe.energynet.valueobject.filter.ENCustomerWarrantFilter;
import com.ksoe.energynet.valueobject.lists.ENCustomerWarrantShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;


/**
 * DAO Object for ENCustomerWarrant;
 *
 */

public class ENCustomerWarrantDAOGen extends GenericDataMiner {

	public ENCustomerWarrantDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENCustomerWarrantDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENCustomerWarrant inObject) throws PersistenceException {
		ENCustomerWarrant obj = new ENCustomerWarrant();
		obj.code = inObject.code;
		loadObject(obj);

		if (inObject.typeCode != obj.typeCode){
					return false;
				}

		if (inObject.servicesConsumerCode != obj.servicesConsumerCode){
					return false;
				}

		if(inObject.userGen == null && obj.userGen == null){}
		else
			if(inObject.userGen == null || obj.userGen == null) return false;
			else
				if ( ! inObject.userGen.equals(obj.userGen)){
					return false;
				}
		if (inObject.warrantRef.code != obj.warrantRef.code){
			return false;
		}
		if (inObject.servicesObjectRef.code != obj.servicesObjectRef.code){
			return false;
		}
		return true;
	}

	public int add(ENCustomerWarrant anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENCustomerWarrant anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENCUSTOMERWARRANT (CODE,TYPECODE,SERVICESCONSUMERCODE,USERGEN,MODIFY_TIME,WARRANTREFCODE,SERVICESOBJECTREFCODE) VALUES (?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			if (anObject.typeCode != Integer.MIN_VALUE ) {
				statement.setInt(2, anObject.typeCode);
			} else {
				statement.setNull(2, java.sql.Types.INTEGER);
			}
			if (anObject.servicesConsumerCode != Integer.MIN_VALUE ) {
				statement.setInt(3, anObject.servicesConsumerCode);
			} else {
				statement.setNull(3, java.sql.Types.INTEGER);
			}
			statement.setString(4, anObject.userGen);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(5, null);
			} else {
				statement.setBigDecimal(5, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.warrantRef.code != Integer.MIN_VALUE){
				statement.setInt(6,anObject.warrantRef.code);
			} else {
				statement.setNull(6,java.sql.Types.INTEGER);
			}
			if (anObject.servicesObjectRef.code != Integer.MIN_VALUE){
				statement.setInt(7,anObject.servicesObjectRef.code);
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
			throw new PersistenceException("Error in method {%ENCustomerWarrantDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENCustomerWarrant anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENCustomerWarrant anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENCustomerWarrant oldObject = new ENCustomerWarrant();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENCustomerWarrant.modify_time_Field+" FROM  ENCUSTOMERWARRANT WHERE CODE = ?";
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
				fields = new Vector<>();
				for(int attrIndex = 0;attrIndex < anAttributes.length;attrIndex++) {
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TYPECODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SERVICESCONSUMERCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USERGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("WARRANTREF") == 0) {
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
				selectStr = "UPDATE ENCUSTOMERWARRANT SET  TYPECODE = ? , SERVICESCONSUMERCODE = ? , USERGEN = ? , MODIFY_TIME = ? , WARRANTREFCODE = ? , SERVICESOBJECTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENCUSTOMERWARRANT SET ";
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
					if (anObject.typeCode != Integer.MIN_VALUE) {
						statement.setInt(1, anObject.typeCode);
					} else {
						statement.setNull(1, java.sql.Types.INTEGER);
					}
					if (anObject.servicesConsumerCode != Integer.MIN_VALUE) {
						statement.setInt(2, anObject.servicesConsumerCode);
					} else {
						statement.setNull(2, java.sql.Types.INTEGER);
					}
					statement.setString(3, anObject.userGen);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(4, null);
					} else {
						statement.setBigDecimal(4, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.warrantRef.code != Integer.MIN_VALUE) {
						statement.setInt(5, anObject.warrantRef.code);
					} else {
						statement.setNull(5, java.sql.Types.INTEGER);
					}
					if (anObject.servicesObjectRef.code != Integer.MIN_VALUE) {
						statement.setInt(6, anObject.servicesObjectRef.code);
					} else {
						statement.setNull(6, java.sql.Types.INTEGER);
					}
					statement.setInt(7, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("TYPECODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.typeCode);
							continue;
						}
						if("SERVICESCONSUMERCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.servicesConsumerCode);
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.userGen);
							continue;
						}
						if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0) {
							if (anObject.modify_time == Long.MIN_VALUE) {
								statement.setBigDecimal(i+1, null);
							} else {
								statement.setBigDecimal(i+1, new java.math.BigDecimal(anObject.modify_time));
							}
							continue;
						}
						if("WARRANTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.warrantRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.warrantRef.code);
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

	} // end of save(ENCustomerWarrant anObject,String[] anAttributes)


	public ENCustomerWarrantShort getShortObject(int anObjectCode) throws PersistenceException {
		ENCustomerWarrant filterObject = new ENCustomerWarrant();
		Vector<ENCustomerWarrantShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENCustomerWarrantShort)list.get(0);
		}
		return null;
	}

	public int setParameters(ENCustomerWarrant filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.typeCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.servicesConsumerCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.warrantRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.servicesObjectRef.code, index, statement);
			index--;
		}
		return index;
	}

	public String buildCondition(ENCustomerWarrantFilter filter) {
		String out = buildCondition((ENCustomerWarrant)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENCustomerWarrant filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENCustomerWarrant.code_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.typeCode, ENCustomerWarrant.typeCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.servicesConsumerCode, ENCustomerWarrant.servicesConsumerCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENCustomerWarrant.userGen_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENCustomerWarrant.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.warrantRef.code, ENCustomerWarrant.warrantRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.servicesObjectRef.code, ENCustomerWarrant.servicesObjectRef_QFielld, out);
		}
		return out;
	}

	public ENCustomerWarrantShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENCustomerWarrantShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENCustomerWarrantShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENCustomerWarrantShortList getFilteredList(ENCustomerWarrant filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENCustomerWarrantShortList getScrollableFilteredList(ENCustomerWarrant aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENCustomerWarrantShortList getScrollableFilteredList(ENCustomerWarrant aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENCustomerWarrantShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENCustomerWarrantShortList getScrollableFilteredList(ENCustomerWarrantFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}

	public ENCustomerWarrantShortList getScrollableFilteredList(ENCustomerWarrantFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}

	public ENCustomerWarrantShortList getScrollableFilteredList(ENCustomerWarrant aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENCustomerWarrantShortList result = new ENCustomerWarrantShortList();
		ENCustomerWarrantShort anObject;
		result.list = new Vector<>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENCUSTOMERWARRANT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENCUSTOMERWARRANT.CODE"+
			",ENCUSTOMERWARRANT.TYPECODE"+
			",ENCUSTOMERWARRANT.SERVICESCONSUMERCODE"+
			",ENCUSTOMERWARRANT.USERGEN"+
			", ENWARRANT.CODE " +
			", ENWARRANT.NUMBERGEN " +
			", ENWARRANT.NAME " +
			", ENWARRANT.WARRANTFIO " +
			", ENWARRANT.WARRANTSHORTFIO " +
			", ENWARRANT.WARRANTPOSITION " +
			", ENWARRANT.GENITIVEFIO " +
			", ENWARRANT.GENITIVEPOSITION " +
			", ENWARRANT.PASSPORT " +
			", ENWARRANT.ADDRESS " +
			", ENWARRANT.POWER " +
			", ENWARRANT.MAXSUM " +
			", ENWARRANT.DEPARTMENTNAME " +
			", ENWARRANT.DEPARTMENTNAMEGENITIVE " +
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
		" FROM ENCUSTOMERWARRANT " +
			" LEFT JOIN ENWARRANT on ENWARRANT.CODE = ENCUSTOMERWARRANT.WARRANTREFCODE "+
			" LEFT JOIN ENSERVICESOBJECT on ENSERVICESOBJECT.CODE = ENCUSTOMERWARRANT.SERVICESOBJECTREFCODE "+
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
				anObject = new ENCustomerWarrantShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.typeCode = set.getInt(2);
				if ( set.wasNull() ) {
					anObject.typeCode = Integer.MIN_VALUE;
				}
				anObject.servicesConsumerCode = set.getInt(3);
				if ( set.wasNull() ) {
					anObject.servicesConsumerCode = Integer.MIN_VALUE;
				}
				anObject.userGen = set.getString(4);

				anObject.warrantRefCode = set.getInt(5);
				if(set.wasNull()) {
					anObject.warrantRefCode = Integer.MIN_VALUE;
				}
				anObject.warrantRefNumbergen = set.getString(6);
				anObject.warrantRefName = set.getString(7);
				anObject.warrantRefWarrantFIO = set.getString(8);
				anObject.warrantRefWarrantShortFIO = set.getString(9);
				anObject.warrantRefWarrantPosition = set.getString(10);
				anObject.warrantRefGenitiveFIO = set.getString(11);
				anObject.warrantRefGenitivePosition = set.getString(12);
				anObject.warrantRefPassport = set.getString(13);
				anObject.warrantRefAddress = set.getString(14);
				anObject.warrantRefPower = set.getInt(15);
				if(set.wasNull()) {
					anObject.warrantRefPower = Integer.MIN_VALUE;
				}
				anObject.warrantRefMaxSum = set.getBigDecimal(16);
				if(anObject.warrantRefMaxSum != null) {
					anObject.warrantRefMaxSum = anObject.warrantRefMaxSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.warrantRefDepartmentName = set.getString(17);
				anObject.warrantRefDepartmentNameGenitive = set.getString(18);
				anObject.servicesObjectRefCode = set.getInt(19);
				if(set.wasNull()) {
					anObject.servicesObjectRefCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefContractNumber = set.getString(20);
				anObject.servicesObjectRefContractDate = set.getDate(21);
				anObject.servicesObjectRefName = set.getString(22);
				anObject.servicesObjectRefPartnerCode = set.getString(23);
				anObject.servicesObjectRefFinDocCode = set.getString(24);
				anObject.servicesObjectRefFinDocID = set.getInt(25);
				if(set.wasNull()) {
					anObject.servicesObjectRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefCommentGen = set.getString(26);
				anObject.servicesObjectRefContractNumberServices = set.getString(27);
				anObject.servicesObjectRefContractDateServices = set.getDate(28);
				anObject.servicesObjectRefContragentName = set.getString(29);
				anObject.servicesObjectRefContragentAddress = set.getString(30);
				anObject.servicesObjectRefContragentAddressWork = set.getString(31);
				anObject.servicesObjectRefContragentOkpo = set.getString(32);
				anObject.servicesObjectRefContragentBankAccount = set.getString(33);
				anObject.servicesObjectRefContragentBankName = set.getString(34);
				anObject.servicesObjectRefContragentBankMfo = set.getString(35);
				anObject.servicesObjectRefContragentBossName = set.getString(36);
				anObject.servicesObjectRefContragentPassport = set.getString(37);
				anObject.servicesObjectRefContractServicesSumma = set.getBigDecimal(38);
				if(anObject.servicesObjectRefContractServicesSumma != null) {
					anObject.servicesObjectRefContractServicesSumma = anObject.servicesObjectRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesSummaVAT = set.getBigDecimal(39);
				if(anObject.servicesObjectRefContractServicesSummaVAT != null) {
					anObject.servicesObjectRefContractServicesSummaVAT = anObject.servicesObjectRefContractServicesSummaVAT.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesPower = set.getBigDecimal(40);
				if(anObject.servicesObjectRefContractServicesPower != null) {
					anObject.servicesObjectRefContractServicesPower = anObject.servicesObjectRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefCommentServicesGen = set.getString(41);
				anObject.servicesObjectRefContractServicesDistance = set.getBigDecimal(42);
				if(anObject.servicesObjectRefContractServicesDistance != null) {
					anObject.servicesObjectRefContractServicesDistance = anObject.servicesObjectRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesDay = set.getBigDecimal(43);
				if(anObject.servicesObjectRefContractServicesDay != null) {
					anObject.servicesObjectRefContractServicesDay = anObject.servicesObjectRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefUserGen = set.getString(44);
				anObject.servicesObjectRefDateEdit = set.getDate(45);
				anObject.servicesObjectRefWarrantDate = set.getDate(46);
				anObject.servicesObjectRefWarrantNumber = set.getString(47);
				anObject.servicesObjectRefWarrantFIO = set.getString(48);
				anObject.servicesObjectRefRegionalType = set.getInt(49);
				if(set.wasNull()) {
					anObject.servicesObjectRefRegionalType = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefBasisType = set.getBigDecimal(50);
				if(anObject.servicesObjectRefBasisType != null) {
					anObject.servicesObjectRefBasisType = anObject.servicesObjectRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContragentPosition = set.getString(51);
				anObject.servicesObjectRefExecuteWorkDate = set.getDate(52);
				anObject.servicesObjectRefTimeStart = set.getTimestamp(53);
				anObject.servicesObjectRefTimeFinal = set.getTimestamp(54);
				anObject.servicesObjectRefContragentPhoneNumber = set.getString(55);
				anObject.servicesObjectRefExecutorPhoneNumber = set.getString(56);
				anObject.servicesObjectRefContragentObjectWork = set.getString(57);
				anObject.servicesObjectRefIsNoPay = set.getInt(58);
				if(set.wasNull()) {
					anObject.servicesObjectRefIsNoPay = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefIsCustomerMaterials = set.getInt(59);
				if(set.wasNull()) {
					anObject.servicesObjectRefIsCustomerMaterials = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPayDate = set.getDate(60);
				anObject.servicesObjectRefFinPayFormCode = set.getInt(61);
				if(set.wasNull()) {
					anObject.servicesObjectRefFinPayFormCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefFinPayFormName = set.getString(62);
				anObject.servicesObjectRefPartnerId = set.getInt(63);
				if(set.wasNull()) {
					anObject.servicesObjectRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPayDetail = set.getString(64);
				anObject.servicesObjectRefActTransferNumber = set.getString(65);
				anObject.servicesObjectRefActTransferDate = set.getDate(66);
				anObject.servicesObjectRefResposible = set.getString(67);
				anObject.servicesObjectRefResposiblePosition = set.getString(68);
				anObject.servicesObjectRefResposibleTabNumber = set.getString(69);
				anObject.servicesObjectRefPrevContractStatus = set.getInt(70);
				if(set.wasNull()) {
					anObject.servicesObjectRefPrevContractStatus = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefReconnectionTU = set.getInt(71);
				if(set.wasNull()) {
					anObject.servicesObjectRefReconnectionTU = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPersonalAccountCode = set.getInt(72);
				if(set.wasNull()) {
					anObject.servicesObjectRefPersonalAccountCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPersonalAccountNumber = set.getString(73);
				anObject.servicesObjectRefTabNumber = set.getString(74);
				anObject.servicesObjectRefCitiesList = set.getString(75);
				anObject.servicesObjectRefLineLength = set.getBigDecimal(76);
				if(anObject.servicesObjectRefLineLength != null) {
					anObject.servicesObjectRefLineLength = anObject.servicesObjectRefLineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefProjectCode = set.getString(77);
				anObject.servicesObjectRefCnPackCode = set.getInt(78);
				if(set.wasNull()) {
					anObject.servicesObjectRefCnPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefDfPackCode = set.getInt(79);
				if(set.wasNull()) {
					anObject.servicesObjectRefDfPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefCountersZoneType = set.getInt(80);
				if(set.wasNull()) {
					anObject.servicesObjectRefCountersZoneType = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefAxPartnerCode = set.getString(81);
				anObject.servicesObjectRefAxPartnerName = set.getString(82);
				anObject.servicesObjectRefAxContractNumber = set.getString(83);
				anObject.servicesObjectRefAxContractDate = set.getDate(84);
				anObject.servicesObjectRefAxContractCode = set.getString(85);
				anObject.servicesObjectRefAxContractId = set.getString(86);
				anObject.servicesObjectRefAxContractCommentGen = set.getString(87);
				anObject.servicesObjectRefProjAgreeSumma = set.getBigDecimal(88);
				if(anObject.servicesObjectRefProjAgreeSumma != null) {
					anObject.servicesObjectRefProjAgreeSumma = anObject.servicesObjectRefProjAgreeSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefTopographySumma = set.getBigDecimal(89);
				if(anObject.servicesObjectRefTopographySumma != null) {
					anObject.servicesObjectRefTopographySumma = anObject.servicesObjectRefTopographySumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefCreatedFromSite = set.getInt(90);
				if(set.wasNull()) {
					anObject.servicesObjectRefCreatedFromSite = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefTerm = set.getInt(91);
				if(set.wasNull()) {
					anObject.servicesObjectRefTerm = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefRegulation = set.getInt(92);
				if(set.wasNull()) {
					anObject.servicesObjectRefRegulation = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefBoundaryDateWork = set.getDate(93);
				anObject.servicesObjectRefCountDayDelay = set.getInt(94);
				if(set.wasNull()) {
					anObject.servicesObjectRefCountDayDelay = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefFactDateWork = set.getDate(95);
				anObject.servicesObjectRefCodeEIC = set.getString(96);
				anObject.servicesObjectRefPersonalAccountUid = set.getString(97);
				anObject.servicesObjectRefCustomerMailingAddress = set.getString(98);
				anObject.servicesObjectRefPowerGeneration = set.getBigDecimal(99);
				if(anObject.servicesObjectRefPowerGeneration != null) {
					anObject.servicesObjectRefPowerGeneration = anObject.servicesObjectRefPowerGeneration.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefPostCode = set.getString(100);
				anObject.servicesObjectRefCustomerEmail = set.getString(101);

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

	public int[] getFilteredCodeArray(ENCustomerWarrantFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENCustomerWarrantFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENCustomerWarrant aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENCUSTOMERWARRANT.CODE FROM ENCUSTOMERWARRANT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENCUSTOMERWARRANT.CODE";
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


	public ENCustomerWarrant getObject(int uid) throws PersistenceException {
		ENCustomerWarrant result = new ENCustomerWarrant();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENCustomerWarrant anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENCUSTOMERWARRANT.CODE, ENCUSTOMERWARRANT.TYPECODE, ENCUSTOMERWARRANT.SERVICESCONSUMERCODE, ENCUSTOMERWARRANT.USERGEN, ENCUSTOMERWARRANT.MODIFY_TIME, ENCUSTOMERWARRANT.WARRANTREFCODE, ENCUSTOMERWARRANT.SERVICESOBJECTREFCODE "
			+" FROM ENCUSTOMERWARRANT WHERE ENCUSTOMERWARRANT.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);

				anObject.typeCode = set.getInt(2);
				if (set.wasNull()) {
					anObject.typeCode = Integer.MIN_VALUE;
				}
				anObject.servicesConsumerCode = set.getInt(3);
				if (set.wasNull()) {
					anObject.servicesConsumerCode = Integer.MIN_VALUE;
				}
				anObject.userGen = set.getString(4);
				anObject.modify_time = set.getLong(5);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.warrantRef.code = set.getInt(6);
				if (set.wasNull()) {
					anObject.warrantRef.code = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRef.code = set.getInt(7);
				if (set.wasNull()) {
					anObject.servicesObjectRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENCustomerWarrantRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENCustomerWarrantRef ref = new com.ksoe.energynet.valueobject.references.ENCustomerWarrantRef();
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

		selectStr = "DELETE FROM  ENCUSTOMERWARRANT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENCustomerWarrant object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENCustomerWarrant.getObject%} access denied");
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

	public long count(ENCustomerWarrantFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENCustomerWarrantFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}

	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENCustomerWarrantFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENCUSTOMERWARRANT", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENCUSTOMERWARRANT WHERE code = ?", propertyName);
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

	public <E> List<E> getListOfPropertyValues(String propertyName, ENCustomerWarrantFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENCustomerWarrantFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENCUSTOMERWARRANT");
		String whereStr = "";
		PreparedStatement statement = null;
		ResultSet set = null;

		ArrayList<E> out = new ArrayList<>();

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
			"SELECT  ENCUSTOMERWARRANT.CODE FROM  ENCUSTOMERWARRANT WHERE  ENCUSTOMERWARRANT.CODE = ?";
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
		_checkConditionToken(condition,"code","ENCUSTOMERWARRANT.CODE");
		_checkConditionToken(condition,"typecode","ENCUSTOMERWARRANT.TYPECODE");
		_checkConditionToken(condition,"servicesconsumercode","ENCUSTOMERWARRANT.SERVICESCONSUMERCODE");
		_checkConditionToken(condition,"usergen","ENCUSTOMERWARRANT.USERGEN");
		_checkConditionToken(condition,"modify_time","ENCUSTOMERWARRANT.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"warrantref","WARRANTREFCODE");
		_checkConditionToken(condition,"warrantref.code","WARRANTREFCODE");
		_checkConditionToken(condition,"servicesobjectref","SERVICESOBJECTREFCODE");
		_checkConditionToken(condition,"servicesobjectref.code","SERVICESOBJECTREFCODE");
		return condition.toString();
	}

	@Override
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
	protected static Hashtable<SequenceKey, SequenceValue> _sequenceTable = new Hashtable<>();

	private void _collectAutoIncrementFields(ENCustomerWarrant anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENCUSTOMERWARRANT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENCUSTOMERWARRANT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENCUSTOMERWARRANT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENCUSTOMERWARRANT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENCustomerWarrantDAO
