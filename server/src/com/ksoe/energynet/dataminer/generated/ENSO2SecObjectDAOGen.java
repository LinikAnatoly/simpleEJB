
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
import com.ksoe.energynet.valueobject.ENSO2SecObject;
import com.ksoe.energynet.valueobject.filter.ENSO2SecObjectFilter;
import com.ksoe.energynet.valueobject.brief.ENSO2SecObjectShort;
import com.ksoe.energynet.valueobject.lists.ENSO2SecObjectShortList;


/**
 * DAO Object for ENSO2SecObject;
 *
 */

public class ENSO2SecObjectDAOGen extends GenericDataMiner {

	public ENSO2SecObjectDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENSO2SecObjectDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENSO2SecObject inObject) throws PersistenceException {
		ENSO2SecObject obj = new ENSO2SecObject();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.securityObj == null && obj.securityObj == null){}
		else
			if(inObject.securityObj == null || obj.securityObj == null) return false;
			else
				if ( ! inObject.securityObj.equals(obj.securityObj)){
					return false;
				}

		if(inObject.securityObjAddress == null && obj.securityObjAddress == null){}
		else
			if(inObject.securityObjAddress == null || obj.securityObjAddress == null) return false;
			else
				if ( ! inObject.securityObjAddress.equals(obj.securityObjAddress)){
					return false;
				}

		if(inObject.securityPeriod == null && obj.securityPeriod == null){}
		else
			if(inObject.securityPeriod == null || obj.securityPeriod == null) return false;
			else
				if ( ! inObject.securityPeriod.equals(obj.securityPeriod)){
					return false;
				}

		if (inObject.guardPost != obj.guardPost){
					return false;
				}

		if(inObject.userGen == null && obj.userGen == null){}
		else
			if(inObject.userGen == null || obj.userGen == null) return false;
			else
				if ( ! inObject.userGen.equals(obj.userGen)){
					return false;
				}

		if(inObject.dateEdit == null && obj.dateEdit == null){} else 
			if(inObject.dateEdit == null || obj.dateEdit == null) return false;
			else
				if (inObject.dateEdit.compareTo(obj.dateEdit) != 0){
					return false;
				}
		if (inObject.servicesObjectRef.code != obj.servicesObjectRef.code){
			return false;
		}
		return true;
	}

	public int add(ENSO2SecObject anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENSO2SecObject anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENSO2SECOBJECT (CODE,SECURITYOBJ,SECURITYOBJADDRESS,SECURITYPERIOD,GUARDPOST,USERGEN,DATEEDIT,MODIFY_TIME,SERVICESOBJECTREFCODE) VALUES (?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.securityObj);
			statement.setString(3, anObject.securityObjAddress);
			if (anObject.securityPeriod != null) {
				anObject.securityPeriod = anObject.securityPeriod.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(4, anObject.securityPeriod);
			if (anObject.guardPost != Integer.MIN_VALUE ) {
				statement.setInt(5, anObject.guardPost);
			} else {
				statement.setNull(5, java.sql.Types.INTEGER);
			}
			statement.setString(6, anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(7, null);
			} else {
				statement.setTimestamp(7, new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(8, null);
			} else {
				statement.setBigDecimal(8, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.servicesObjectRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).exists(anObject.servicesObjectRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENSO2SecObject.servicesObjectRef.code%} = {%"+anObject.servicesObjectRef.code+"%}");
				}
				statement.setInt(9,anObject.servicesObjectRef.code);
			} else {
				statement.setNull(9,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENSO2SecObjectDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENSO2SecObject anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENSO2SecObject anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENSO2SecObject oldObject = new ENSO2SecObject();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENSO2SecObject.modify_time_Field+" FROM  ENSO2SECOBJECT WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("SECURITYOBJ") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SECURITYOBJADDRESS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SECURITYPERIOD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("GUARDPOST") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USERGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEEDIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
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
				selectStr = "UPDATE ENSO2SECOBJECT SET  SECURITYOBJ = ? , SECURITYOBJADDRESS = ? , SECURITYPERIOD = ? , GUARDPOST = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , SERVICESOBJECTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENSO2SECOBJECT SET ";
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
					statement.setString(1, anObject.securityObj);
					statement.setString(2, anObject.securityObjAddress);
					if (anObject.securityPeriod != null) {
						anObject.securityPeriod = anObject.securityPeriod.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(3, anObject.securityPeriod);
					if (anObject.guardPost != Integer.MIN_VALUE) {
						statement.setInt(4, anObject.guardPost);
					} else {
						statement.setNull(4, java.sql.Types.INTEGER);
					}
					statement.setString(5, anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(6, null);
					} else {
						statement.setTimestamp(6, new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(7, null);
					} else {
						statement.setBigDecimal(7, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.servicesObjectRef.code != Integer.MIN_VALUE) {
						statement.setInt(8, anObject.servicesObjectRef.code);
					} else {
						statement.setNull(8, java.sql.Types.INTEGER);
					}
					statement.setInt(9, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("SECURITYOBJ".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.securityObj);
							continue;
						}
						if("SECURITYOBJADDRESS".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.securityObjAddress);
							continue;
						}
						if("SECURITYPERIOD".compareTo((String)fields.get(i)) == 0) {
							if (anObject.securityPeriod != null) {
								anObject.securityPeriod = anObject.securityPeriod.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.securityPeriod);
							continue;
						}
						if("GUARDPOST".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.guardPost);
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.userGen);
							continue;
						}
						if("DATEEDIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateEdit == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1, new java.sql.Timestamp(anObject.dateEdit.getTime()));
							}
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
						if("SERVICESOBJECTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.servicesObjectRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.servicesObjectRef.code);
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

	} // end of save(ENSO2SecObject anObject,String[] anAttributes)


	public ENSO2SecObjectShort getShortObject(int anObjectCode) throws PersistenceException {
		ENSO2SecObject filterObject = new ENSO2SecObject();
		Vector<ENSO2SecObjectShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENSO2SecObjectShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENSO2SecObject filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.securityObj, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.securityObjAddress, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.securityPeriod, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.guardPost, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.servicesObjectRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENSO2SecObjectFilter filter) {
		String out = buildCondition((ENSO2SecObject)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENSO2SecObject filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENSO2SecObject.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.securityObj, ENSO2SecObject.securityObj_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.securityObjAddress, ENSO2SecObject.securityObjAddress_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.securityPeriod, ENSO2SecObject.securityPeriod_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.guardPost, ENSO2SecObject.guardPost_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENSO2SecObject.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENSO2SecObject.dateEdit_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENSO2SecObject.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.servicesObjectRef.code, ENSO2SecObject.servicesObjectRef_QFielld, out);
		}
		return out;
	}

	public ENSO2SecObjectShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENSO2SecObjectShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENSO2SecObjectShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENSO2SecObjectShortList getFilteredList(ENSO2SecObject filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENSO2SecObjectShortList getScrollableFilteredList(ENSO2SecObject aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENSO2SecObjectShortList getScrollableFilteredList(ENSO2SecObject aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENSO2SecObjectShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENSO2SecObjectShortList getScrollableFilteredList(ENSO2SecObjectFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENSO2SecObjectShortList getScrollableFilteredList(ENSO2SecObjectFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENSO2SecObjectShortList getScrollableFilteredList(ENSO2SecObject aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENSO2SecObjectShortList result = new ENSO2SecObjectShortList();
		ENSO2SecObjectShort anObject;
		result.list = new Vector<ENSO2SecObjectShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSO2SECOBJECT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSO2SECOBJECT.CODE"+
			",ENSO2SECOBJECT.SECURITYOBJ"+
			",ENSO2SECOBJECT.SECURITYOBJADDRESS"+
			",ENSO2SECOBJECT.SECURITYPERIOD"+
			",ENSO2SECOBJECT.GUARDPOST"+
			",ENSO2SECOBJECT.USERGEN"+
			",ENSO2SECOBJECT.DATEEDIT"+
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
		" FROM ENSO2SECOBJECT " +
			" LEFT JOIN ENSERVICESOBJECT on ENSERVICESOBJECT.CODE = ENSO2SECOBJECT.SERVICESOBJECTREFCODE "+
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
				anObject = new ENSO2SecObjectShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.securityObj = set.getString(2);
				anObject.securityObjAddress = set.getString(3);
				anObject.securityPeriod = set.getBigDecimal(4);
				if(anObject.securityPeriod != null) {
					anObject.securityPeriod = anObject.securityPeriod.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.guardPost = set.getInt(5);
				if ( set.wasNull() ) {
					anObject.guardPost = Integer.MIN_VALUE;
				}
				anObject.userGen = set.getString(6);
				anObject.dateEdit = set.getTimestamp(7);

				anObject.servicesObjectRefCode = set.getInt(8);
				if(set.wasNull()) {
					anObject.servicesObjectRefCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefContractNumber = set.getString(9);
				anObject.servicesObjectRefContractDate = set.getDate(10);
				anObject.servicesObjectRefName = set.getString(11);
				anObject.servicesObjectRefPartnerCode = set.getString(12);
				anObject.servicesObjectRefFinDocCode = set.getString(13);
				anObject.servicesObjectRefFinDocID = set.getInt(14);
				if(set.wasNull()) {
					anObject.servicesObjectRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefCommentGen = set.getString(15);
				anObject.servicesObjectRefContractNumberServices = set.getString(16);
				anObject.servicesObjectRefContractDateServices = set.getDate(17);
				anObject.servicesObjectRefContragentName = set.getString(18);
				anObject.servicesObjectRefContragentAddress = set.getString(19);
				anObject.servicesObjectRefContragentAddressWork = set.getString(20);
				anObject.servicesObjectRefContragentOkpo = set.getString(21);
				anObject.servicesObjectRefContragentBankAccount = set.getString(22);
				anObject.servicesObjectRefContragentBankName = set.getString(23);
				anObject.servicesObjectRefContragentBankMfo = set.getString(24);
				anObject.servicesObjectRefContragentBossName = set.getString(25);
				anObject.servicesObjectRefContragentPassport = set.getString(26);
				anObject.servicesObjectRefContractServicesSumma = set.getBigDecimal(27);
				if(anObject.servicesObjectRefContractServicesSumma != null) {
					anObject.servicesObjectRefContractServicesSumma = anObject.servicesObjectRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesSummaVAT = set.getBigDecimal(28);
				if(anObject.servicesObjectRefContractServicesSummaVAT != null) {
					anObject.servicesObjectRefContractServicesSummaVAT = anObject.servicesObjectRefContractServicesSummaVAT.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesPower = set.getBigDecimal(29);
				if(anObject.servicesObjectRefContractServicesPower != null) {
					anObject.servicesObjectRefContractServicesPower = anObject.servicesObjectRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefCommentServicesGen = set.getString(30);
				anObject.servicesObjectRefContractServicesDistance = set.getBigDecimal(31);
				if(anObject.servicesObjectRefContractServicesDistance != null) {
					anObject.servicesObjectRefContractServicesDistance = anObject.servicesObjectRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesDay = set.getBigDecimal(32);
				if(anObject.servicesObjectRefContractServicesDay != null) {
					anObject.servicesObjectRefContractServicesDay = anObject.servicesObjectRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefUserGen = set.getString(33);
				anObject.servicesObjectRefDateEdit = set.getDate(34);
				anObject.servicesObjectRefWarrantDate = set.getDate(35);
				anObject.servicesObjectRefWarrantNumber = set.getString(36);
				anObject.servicesObjectRefWarrantFIO = set.getString(37);
				anObject.servicesObjectRefRegionalType = set.getInt(38);
				if(set.wasNull()) {
					anObject.servicesObjectRefRegionalType = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefBasisType = set.getBigDecimal(39);
				if(anObject.servicesObjectRefBasisType != null) {
					anObject.servicesObjectRefBasisType = anObject.servicesObjectRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContragentPosition = set.getString(40);
				anObject.servicesObjectRefExecuteWorkDate = set.getDate(41);
				anObject.servicesObjectRefTimeStart = set.getTimestamp(42);
				anObject.servicesObjectRefTimeFinal = set.getTimestamp(43);
				anObject.servicesObjectRefContragentPhoneNumber = set.getString(44);
				anObject.servicesObjectRefExecutorPhoneNumber = set.getString(45);
				anObject.servicesObjectRefContragentObjectWork = set.getString(46);
				anObject.servicesObjectRefIsNoPay = set.getInt(47);
				if(set.wasNull()) {
					anObject.servicesObjectRefIsNoPay = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefIsCustomerMaterials = set.getInt(48);
				if(set.wasNull()) {
					anObject.servicesObjectRefIsCustomerMaterials = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPayDate = set.getDate(49);
				anObject.servicesObjectRefFinPayFormCode = set.getInt(50);
				if(set.wasNull()) {
					anObject.servicesObjectRefFinPayFormCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefFinPayFormName = set.getString(51);
				anObject.servicesObjectRefPartnerId = set.getInt(52);
				if(set.wasNull()) {
					anObject.servicesObjectRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPayDetail = set.getString(53);
				anObject.servicesObjectRefActTransferNumber = set.getString(54);
				anObject.servicesObjectRefActTransferDate = set.getDate(55);
				anObject.servicesObjectRefResposible = set.getString(56);
				anObject.servicesObjectRefResposiblePosition = set.getString(57);
				anObject.servicesObjectRefResposibleTabNumber = set.getString(58);
				anObject.servicesObjectRefPrevContractStatus = set.getInt(59);
				if(set.wasNull()) {
					anObject.servicesObjectRefPrevContractStatus = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefReconnectionTU = set.getInt(60);
				if(set.wasNull()) {
					anObject.servicesObjectRefReconnectionTU = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPersonalAccountCode = set.getInt(61);
				if(set.wasNull()) {
					anObject.servicesObjectRefPersonalAccountCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPersonalAccountNumber = set.getString(62);
				anObject.servicesObjectRefTabNumber = set.getString(63);
				anObject.servicesObjectRefCitiesList = set.getString(64);
				anObject.servicesObjectRefLineLength = set.getBigDecimal(65);
				if(anObject.servicesObjectRefLineLength != null) {
					anObject.servicesObjectRefLineLength = anObject.servicesObjectRefLineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefProjectCode = set.getString(66);
				anObject.servicesObjectRefCnPackCode = set.getInt(67);
				if(set.wasNull()) {
					anObject.servicesObjectRefCnPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefDfPackCode = set.getInt(68);
				if(set.wasNull()) {
					anObject.servicesObjectRefDfPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefCountersZoneType = set.getInt(69);
				if(set.wasNull()) {
					anObject.servicesObjectRefCountersZoneType = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefAxPartnerCode = set.getString(70);
				anObject.servicesObjectRefAxPartnerName = set.getString(71);
				anObject.servicesObjectRefAxContractNumber = set.getString(72);
				anObject.servicesObjectRefAxContractDate = set.getDate(73);
				anObject.servicesObjectRefAxContractCode = set.getString(74);
				anObject.servicesObjectRefAxContractId = set.getString(75);
				anObject.servicesObjectRefAxContractCommentGen = set.getString(76);
				anObject.servicesObjectRefProjAgreeSumma = set.getBigDecimal(77);
				if(anObject.servicesObjectRefProjAgreeSumma != null) {
					anObject.servicesObjectRefProjAgreeSumma = anObject.servicesObjectRefProjAgreeSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefTopographySumma = set.getBigDecimal(78);
				if(anObject.servicesObjectRefTopographySumma != null) {
					anObject.servicesObjectRefTopographySumma = anObject.servicesObjectRefTopographySumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefCreatedFromSite = set.getInt(79);
				if(set.wasNull()) {
					anObject.servicesObjectRefCreatedFromSite = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefTerm = set.getInt(80);
				if(set.wasNull()) {
					anObject.servicesObjectRefTerm = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefRegulation = set.getInt(81);
				if(set.wasNull()) {
					anObject.servicesObjectRefRegulation = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefBoundaryDateWork = set.getDate(82);
				anObject.servicesObjectRefCountDayDelay = set.getInt(83);
				if(set.wasNull()) {
					anObject.servicesObjectRefCountDayDelay = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefFactDateWork = set.getDate(84);
				anObject.servicesObjectRefCodeEIC = set.getString(85);
				anObject.servicesObjectRefPersonalAccountUid = set.getString(86);

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
	
	public int[] getFilteredCodeArray(ENSO2SecObjectFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENSO2SecObjectFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENSO2SecObject aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENSO2SECOBJECT.CODE FROM ENSO2SECOBJECT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSO2SECOBJECT.CODE";
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


	public ENSO2SecObject getObject(int uid) throws PersistenceException {
		ENSO2SecObject result = new ENSO2SecObject();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENSO2SecObject anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENSO2SECOBJECT.CODE, ENSO2SECOBJECT.SECURITYOBJ, ENSO2SECOBJECT.SECURITYOBJADDRESS, ENSO2SECOBJECT.SECURITYPERIOD, ENSO2SECOBJECT.GUARDPOST, ENSO2SECOBJECT.USERGEN, ENSO2SECOBJECT.DATEEDIT, ENSO2SECOBJECT.MODIFY_TIME, ENSO2SECOBJECT.SERVICESOBJECTREFCODE "
			+" FROM ENSO2SECOBJECT WHERE ENSO2SECOBJECT.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.securityObj = set.getString(2);
				anObject.securityObjAddress = set.getString(3);
				anObject.securityPeriod = set.getBigDecimal(4);
				if(anObject.securityPeriod != null) {
					anObject.securityPeriod = anObject.securityPeriod.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.guardPost = set.getInt(5);
				if (set.wasNull()) {
					anObject.guardPost = Integer.MIN_VALUE;
				}
				anObject.userGen = set.getString(6);
				anObject.dateEdit = set.getTimestamp(7);
				anObject.modify_time = set.getLong(8);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.servicesObjectRef.code = set.getInt(9);
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


	public com.ksoe.energynet.valueobject.references.ENSO2SecObjectRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENSO2SecObjectRef ref = new com.ksoe.energynet.valueobject.references.ENSO2SecObjectRef();
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

		selectStr = "DELETE FROM  ENSO2SECOBJECT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENSO2SecObject object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENSO2SecObject.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENSO2SecObject.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENSO2SecObject.remove%} access denied");
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
	
	public long count(ENSO2SecObjectFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENSO2SecObjectFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENSO2SecObjectFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENSO2SECOBJECT", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENSO2SecObjectFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENSO2SECOBJECT");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENSO2SecObject.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENSO2SecObject.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENSO2SECOBJECT.CODE FROM  ENSO2SECOBJECT WHERE  ENSO2SECOBJECT.CODE = ?";
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
		_checkConditionToken(condition,"code","ENSO2SECOBJECT.CODE");
		_checkConditionToken(condition,"securityobj","ENSO2SECOBJECT.SECURITYOBJ");
		_checkConditionToken(condition,"securityobjaddress","ENSO2SECOBJECT.SECURITYOBJADDRESS");
		_checkConditionToken(condition,"securityperiod","ENSO2SECOBJECT.SECURITYPERIOD");
		_checkConditionToken(condition,"guardpost","ENSO2SECOBJECT.GUARDPOST");
		_checkConditionToken(condition,"usergen","ENSO2SECOBJECT.USERGEN");
		_checkConditionToken(condition,"dateedit","ENSO2SECOBJECT.DATEEDIT");
		_checkConditionToken(condition,"modify_time","ENSO2SECOBJECT.MODIFY_TIME");
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
	
	private void _collectAutoIncrementFields(ENSO2SecObject anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENSO2SECOBJECT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENSO2SECOBJECT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENSO2SECOBJECT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENSO2SECOBJECT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENSO2SecObjectDAO
