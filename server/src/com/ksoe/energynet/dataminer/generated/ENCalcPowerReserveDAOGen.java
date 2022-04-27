
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
import com.ksoe.energynet.valueobject.ENCalcPowerReserve;
import com.ksoe.energynet.valueobject.filter.ENCalcPowerReserveFilter;
import com.ksoe.energynet.valueobject.brief.ENCalcPowerReserveShort;
import com.ksoe.energynet.valueobject.lists.ENCalcPowerReserveShortList;


/**
 * DAO Object for ENCalcPowerReserve;
 *
 */

public class ENCalcPowerReserveDAOGen extends GenericDataMiner {

	public ENCalcPowerReserveDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENCalcPowerReserveDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENCalcPowerReserve inObject) throws PersistenceException {
		ENCalcPowerReserve obj = new ENCalcPowerReserve();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.userAdd == null && obj.userAdd == null){}
		else
			if(inObject.userAdd == null || obj.userAdd == null) return false;
			else
				if ( ! inObject.userAdd.equals(obj.userAdd)){
					return false;
				}

		if(inObject.dateAdd == null && obj.dateAdd == null){} else 
			if(inObject.dateAdd == null || obj.dateAdd == null) return false;
			else
				if (inObject.dateAdd.compareTo(obj.dateAdd) != 0){
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
		if (inObject.servicesobjectRef.code != obj.servicesobjectRef.code){
			return false;
		}
		if (inObject.gauge150Ref.code != obj.gauge150Ref.code){
			return false;
		}
		if (inObject.gaugeRef.code != obj.gaugeRef.code){
			return false;
		}
		return true;
	}

	public int add(ENCalcPowerReserve anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENCalcPowerReserve anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENCALCPOWERRESERVE (CODE,MODIFY_TIME,USERADD,DATEADD,USERGEN,DATEEDIT,SERVICESOBJECTREFCODE,GAUGE150REFCODE,GAUGEREFCODE) VALUES (?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(2, null);
			} else {
				statement.setBigDecimal(2, new java.math.BigDecimal(anObject.modify_time));
			}
			statement.setString(3, anObject.userAdd);
			if (anObject.dateAdd == null) {
				statement.setTimestamp(4, null);
			} else {
				statement.setTimestamp(4, new java.sql.Timestamp(anObject.dateAdd.getTime()));
			}
			statement.setString(5, anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(6, null);
			} else {
				statement.setTimestamp(6, new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.servicesobjectRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).exists(anObject.servicesobjectRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENCalcPowerReserve.servicesobjectRef.code%} = {%"+anObject.servicesobjectRef.code+"%}");
				}
				statement.setInt(7,anObject.servicesobjectRef.code);
			} else {
				statement.setNull(7,java.sql.Types.INTEGER);
			}
			if (anObject.gauge150Ref.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.netobjects.dataminer.generated.ENGauge150DAOGen(connection,getUserProfile()).exists(anObject.gauge150Ref.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.netobjects.valueobject.ENCalcPowerReserve.gauge150Ref.code%} = {%"+anObject.gauge150Ref.code+"%}");
				}
				statement.setInt(8,anObject.gauge150Ref.code);
			} else {
				statement.setNull(8,java.sql.Types.INTEGER);
			}
			if (anObject.gaugeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.netobjects.dataminer.generated.ENFiderGuageDAOGen(connection,getUserProfile()).exists(anObject.gaugeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.netobjects.valueobject.ENCalcPowerReserve.gaugeRef.code%} = {%"+anObject.gaugeRef.code+"%}");
				}
				statement.setInt(9,anObject.gaugeRef.code);
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
			throw new PersistenceException("Error in method {%ENCalcPowerReserveDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENCalcPowerReserve anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENCalcPowerReserve anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENCalcPowerReserve oldObject = new ENCalcPowerReserve();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENCalcPowerReserve.modify_time_Field+" FROM  ENCALCPOWERRESERVE WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USERADD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEADD") == 0) {
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
					if(fieldNameStr.compareTo("SERVICESOBJECTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("GAUGE150REF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("GAUGEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENCALCPOWERRESERVE SET  MODIFY_TIME = ? , USERADD = ? , DATEADD = ? , USERGEN = ? , DATEEDIT = ? , SERVICESOBJECTREFCODE = ? , GAUGE150REFCODE = ? , GAUGEREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENCALCPOWERRESERVE SET ";
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
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(1, null);
					} else {
						statement.setBigDecimal(1, new java.math.BigDecimal(anObject.modify_time));
					}
					statement.setString(2, anObject.userAdd);
					if (anObject.dateAdd == null) {
						statement.setTimestamp(3, null);
					} else {
						statement.setTimestamp(3, new java.sql.Timestamp(anObject.dateAdd.getTime()));
					}
					statement.setString(4, anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(5, null);
					} else {
						statement.setTimestamp(5, new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.servicesobjectRef.code != Integer.MIN_VALUE) {
						statement.setInt(6, anObject.servicesobjectRef.code);
					} else {
						statement.setNull(6, java.sql.Types.INTEGER);
					}
					if (anObject.gauge150Ref.code != Integer.MIN_VALUE) {
						statement.setInt(7, anObject.gauge150Ref.code);
					} else {
						statement.setNull(7, java.sql.Types.INTEGER);
					}
					if (anObject.gaugeRef.code != Integer.MIN_VALUE) {
						statement.setInt(8, anObject.gaugeRef.code);
					} else {
						statement.setNull(8, java.sql.Types.INTEGER);
					}
					statement.setInt(9, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0) {
							if (anObject.modify_time == Long.MIN_VALUE) {
								statement.setBigDecimal(i+1, null);
							} else {
								statement.setBigDecimal(i+1, new java.math.BigDecimal(anObject.modify_time));
							}
							continue;
						}
						if("USERADD".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.userAdd);
							continue;
						}
						if("DATEADD".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateAdd == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1, new java.sql.Timestamp(anObject.dateAdd.getTime()));
							}
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
						if("SERVICESOBJECTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.servicesobjectRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.servicesobjectRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("GAUGE150REF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.gauge150Ref.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.gauge150Ref.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("GAUGEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.gaugeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.gaugeRef.code);
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

	} // end of save(ENCalcPowerReserve anObject,String[] anAttributes)


	public ENCalcPowerReserveShort getShortObject(int anObjectCode) throws PersistenceException {
		ENCalcPowerReserve filterObject = new ENCalcPowerReserve();
		Vector<ENCalcPowerReserveShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENCalcPowerReserveShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENCalcPowerReserve filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userAdd, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateAdd, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.servicesobjectRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.gauge150Ref.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.gaugeRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENCalcPowerReserveFilter filter) {
		String out = buildCondition((ENCalcPowerReserve)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENCalcPowerReserve filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENCalcPowerReserve.code_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENCalcPowerReserve.modify_time_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userAdd, ENCalcPowerReserve.userAdd_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateAdd, ENCalcPowerReserve.dateAdd_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENCalcPowerReserve.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENCalcPowerReserve.dateEdit_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.servicesobjectRef.code, ENCalcPowerReserve.servicesobjectRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.gauge150Ref.code, ENCalcPowerReserve.gauge150Ref_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.gaugeRef.code, ENCalcPowerReserve.gaugeRef_QFielld, out);
		}
		return out;
	}

	public ENCalcPowerReserveShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENCalcPowerReserveShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENCalcPowerReserveShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENCalcPowerReserveShortList getFilteredList(ENCalcPowerReserve filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENCalcPowerReserveShortList getScrollableFilteredList(ENCalcPowerReserve aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENCalcPowerReserveShortList getScrollableFilteredList(ENCalcPowerReserve aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENCalcPowerReserveShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENCalcPowerReserveShortList getScrollableFilteredList(ENCalcPowerReserveFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENCalcPowerReserveShortList getScrollableFilteredList(ENCalcPowerReserveFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENCalcPowerReserveShortList getScrollableFilteredList(ENCalcPowerReserve aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENCalcPowerReserveShortList result = new ENCalcPowerReserveShortList();
		ENCalcPowerReserveShort anObject;
		result.list = new Vector<ENCalcPowerReserveShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENCALCPOWERRESERVE.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENCALCPOWERRESERVE.CODE"+
			",ENCALCPOWERRESERVE.USERGEN"+
			",ENCALCPOWERRESERVE.DATEEDIT"+
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
			", ENGAUGE150.CODE " +
			", ENFIDERGUAGE.CODE " +
		" FROM ENCALCPOWERRESERVE " +
			" LEFT JOIN ENSERVICESOBJECT on ENSERVICESOBJECT.CODE = ENCALCPOWERRESERVE.SERVICESOBJECTREFCODE "+
			" LEFT JOIN ENGAUGE150 on ENGAUGE150.CODE = ENCALCPOWERRESERVE.GAUGE150REFCODE "+
			" LEFT JOIN ENFIDERGUAGE on ENFIDERGUAGE.CODE = ENCALCPOWERRESERVE.GAUGEREFCODE "+
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
				anObject = new ENCalcPowerReserveShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.userGen = set.getString(2);
				anObject.dateEdit = set.getTimestamp(3);

				anObject.servicesobjectRefCode = set.getInt(4);
				if(set.wasNull()) {
					anObject.servicesobjectRefCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefContractNumber = set.getString(5);
				anObject.servicesobjectRefContractDate = set.getDate(6);
				anObject.servicesobjectRefName = set.getString(7);
				anObject.servicesobjectRefPartnerCode = set.getString(8);
				anObject.servicesobjectRefFinDocCode = set.getString(9);
				anObject.servicesobjectRefFinDocID = set.getInt(10);
				if(set.wasNull()) {
					anObject.servicesobjectRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefCommentGen = set.getString(11);
				anObject.servicesobjectRefContractNumberServices = set.getString(12);
				anObject.servicesobjectRefContractDateServices = set.getDate(13);
				anObject.servicesobjectRefContragentName = set.getString(14);
				anObject.servicesobjectRefContragentAddress = set.getString(15);
				anObject.servicesobjectRefContragentAddressWork = set.getString(16);
				anObject.servicesobjectRefContragentOkpo = set.getString(17);
				anObject.servicesobjectRefContragentBankAccount = set.getString(18);
				anObject.servicesobjectRefContragentBankName = set.getString(19);
				anObject.servicesobjectRefContragentBankMfo = set.getString(20);
				anObject.servicesobjectRefContragentBossName = set.getString(21);
				anObject.servicesobjectRefContragentPassport = set.getString(22);
				anObject.servicesobjectRefContractServicesSumma = set.getBigDecimal(23);
				if(anObject.servicesobjectRefContractServicesSumma != null) {
					anObject.servicesobjectRefContractServicesSumma = anObject.servicesobjectRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectRefContractServicesSummaVAT = set.getBigDecimal(24);
				if(anObject.servicesobjectRefContractServicesSummaVAT != null) {
					anObject.servicesobjectRefContractServicesSummaVAT = anObject.servicesobjectRefContractServicesSummaVAT.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectRefContractServicesPower = set.getBigDecimal(25);
				if(anObject.servicesobjectRefContractServicesPower != null) {
					anObject.servicesobjectRefContractServicesPower = anObject.servicesobjectRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectRefCommentServicesGen = set.getString(26);
				anObject.servicesobjectRefContractServicesDistance = set.getBigDecimal(27);
				if(anObject.servicesobjectRefContractServicesDistance != null) {
					anObject.servicesobjectRefContractServicesDistance = anObject.servicesobjectRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectRefContractServicesDay = set.getBigDecimal(28);
				if(anObject.servicesobjectRefContractServicesDay != null) {
					anObject.servicesobjectRefContractServicesDay = anObject.servicesobjectRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectRefUserGen = set.getString(29);
				anObject.servicesobjectRefDateEdit = set.getDate(30);
				anObject.servicesobjectRefWarrantDate = set.getDate(31);
				anObject.servicesobjectRefWarrantNumber = set.getString(32);
				anObject.servicesobjectRefWarrantFIO = set.getString(33);
				anObject.servicesobjectRefRegionalType = set.getInt(34);
				if(set.wasNull()) {
					anObject.servicesobjectRefRegionalType = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefBasisType = set.getBigDecimal(35);
				if(anObject.servicesobjectRefBasisType != null) {
					anObject.servicesobjectRefBasisType = anObject.servicesobjectRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectRefContragentPosition = set.getString(36);
				anObject.servicesobjectRefExecuteWorkDate = set.getDate(37);
				anObject.servicesobjectRefTimeStart = set.getTimestamp(38);
				anObject.servicesobjectRefTimeFinal = set.getTimestamp(39);
				anObject.servicesobjectRefContragentPhoneNumber = set.getString(40);
				anObject.servicesobjectRefExecutorPhoneNumber = set.getString(41);
				anObject.servicesobjectRefContragentObjectWork = set.getString(42);
				anObject.servicesobjectRefIsNoPay = set.getInt(43);
				if(set.wasNull()) {
					anObject.servicesobjectRefIsNoPay = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefIsCustomerMaterials = set.getInt(44);
				if(set.wasNull()) {
					anObject.servicesobjectRefIsCustomerMaterials = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefPayDate = set.getDate(45);
				anObject.servicesobjectRefFinPayFormCode = set.getInt(46);
				if(set.wasNull()) {
					anObject.servicesobjectRefFinPayFormCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefFinPayFormName = set.getString(47);
				anObject.servicesobjectRefPartnerId = set.getInt(48);
				if(set.wasNull()) {
					anObject.servicesobjectRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefPayDetail = set.getString(49);
				anObject.servicesobjectRefActTransferNumber = set.getString(50);
				anObject.servicesobjectRefActTransferDate = set.getDate(51);
				anObject.servicesobjectRefResposible = set.getString(52);
				anObject.servicesobjectRefResposiblePosition = set.getString(53);
				anObject.servicesobjectRefResposibleTabNumber = set.getString(54);
				anObject.servicesobjectRefPrevContractStatus = set.getInt(55);
				if(set.wasNull()) {
					anObject.servicesobjectRefPrevContractStatus = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefReconnectionTU = set.getInt(56);
				if(set.wasNull()) {
					anObject.servicesobjectRefReconnectionTU = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefPersonalAccountCode = set.getInt(57);
				if(set.wasNull()) {
					anObject.servicesobjectRefPersonalAccountCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefPersonalAccountNumber = set.getString(58);
				anObject.servicesobjectRefTabNumber = set.getString(59);
				anObject.servicesobjectRefCitiesList = set.getString(60);
				anObject.servicesobjectRefLineLength = set.getBigDecimal(61);
				if(anObject.servicesobjectRefLineLength != null) {
					anObject.servicesobjectRefLineLength = anObject.servicesobjectRefLineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectRefProjectCode = set.getString(62);
				anObject.servicesobjectRefCnPackCode = set.getInt(63);
				if(set.wasNull()) {
					anObject.servicesobjectRefCnPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefDfPackCode = set.getInt(64);
				if(set.wasNull()) {
					anObject.servicesobjectRefDfPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefCountersZoneType = set.getInt(65);
				if(set.wasNull()) {
					anObject.servicesobjectRefCountersZoneType = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefAxPartnerCode = set.getString(66);
				anObject.servicesobjectRefAxPartnerName = set.getString(67);
				anObject.servicesobjectRefAxContractNumber = set.getString(68);
				anObject.servicesobjectRefAxContractDate = set.getDate(69);
				anObject.servicesobjectRefAxContractCode = set.getString(70);
				anObject.servicesobjectRefAxContractId = set.getString(71);
				anObject.servicesobjectRefAxContractCommentGen = set.getString(72);
				anObject.servicesobjectRefProjAgreeSumma = set.getBigDecimal(73);
				if(anObject.servicesobjectRefProjAgreeSumma != null) {
					anObject.servicesobjectRefProjAgreeSumma = anObject.servicesobjectRefProjAgreeSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectRefTopographySumma = set.getBigDecimal(74);
				if(anObject.servicesobjectRefTopographySumma != null) {
					anObject.servicesobjectRefTopographySumma = anObject.servicesobjectRefTopographySumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectRefCreatedFromSite = set.getInt(75);
				if(set.wasNull()) {
					anObject.servicesobjectRefCreatedFromSite = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefTerm = set.getInt(76);
				if(set.wasNull()) {
					anObject.servicesobjectRefTerm = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefRegulation = set.getInt(77);
				if(set.wasNull()) {
					anObject.servicesobjectRefRegulation = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefBoundaryDateWork = set.getDate(78);
				anObject.servicesobjectRefCountDayDelay = set.getInt(79);
				if(set.wasNull()) {
					anObject.servicesobjectRefCountDayDelay = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRefFactDateWork = set.getDate(80);
				anObject.servicesobjectRefCodeEIC = set.getString(81);
				anObject.servicesobjectRefPersonalAccountUid = set.getString(82);
				anObject.gauge150RefCode = set.getInt(83);
				if(set.wasNull()) {
					anObject.gauge150RefCode = Integer.MIN_VALUE;
				}
				anObject.gaugeRefCode = set.getInt(84);
				if(set.wasNull()) {
					anObject.gaugeRefCode = Integer.MIN_VALUE;
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
	
	public int[] getFilteredCodeArray(ENCalcPowerReserveFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENCalcPowerReserveFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENCalcPowerReserve aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENCALCPOWERRESERVE.CODE FROM ENCALCPOWERRESERVE";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENCALCPOWERRESERVE.CODE";
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


	public ENCalcPowerReserve getObject(int uid) throws PersistenceException {
		ENCalcPowerReserve result = new ENCalcPowerReserve();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENCalcPowerReserve anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENCALCPOWERRESERVE.CODE, ENCALCPOWERRESERVE.MODIFY_TIME, ENCALCPOWERRESERVE.USERADD, ENCALCPOWERRESERVE.DATEADD, ENCALCPOWERRESERVE.USERGEN, ENCALCPOWERRESERVE.DATEEDIT, ENCALCPOWERRESERVE.SERVICESOBJECTREFCODE, ENCALCPOWERRESERVE.GAUGE150REFCODE, ENCALCPOWERRESERVE.GAUGEREFCODE "
			+" FROM ENCALCPOWERRESERVE WHERE ENCALCPOWERRESERVE.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.modify_time = set.getLong(2);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.userAdd = set.getString(3);
				anObject.dateAdd = set.getTimestamp(4);
				anObject.userGen = set.getString(5);
				anObject.dateEdit = set.getTimestamp(6);
				anObject.servicesobjectRef.code = set.getInt(7);
				if (set.wasNull()) {
					anObject.servicesobjectRef.code = Integer.MIN_VALUE;
				}
				anObject.gauge150Ref.code = set.getInt(8);
				if (set.wasNull()) {
					anObject.gauge150Ref.code = Integer.MIN_VALUE;
				}
				anObject.gaugeRef.code = set.getInt(9);
				if (set.wasNull()) {
					anObject.gaugeRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENCalcPowerReserveRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENCalcPowerReserveRef ref = new com.ksoe.energynet.valueobject.references.ENCalcPowerReserveRef();
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

		selectStr = "DELETE FROM  ENCALCPOWERRESERVE WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENCalcPowerReserve object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENCalcPowerReserve.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENCalcPowerReserve.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENCalcPowerReserve.remove%} access denied");
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
	
	public long count(ENCalcPowerReserveFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENCalcPowerReserveFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENCalcPowerReserveFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENCALCPOWERRESERVE", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENCalcPowerReserveFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENCALCPOWERRESERVE");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENCalcPowerReserve.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENCalcPowerReserve.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENCALCPOWERRESERVE.CODE FROM  ENCALCPOWERRESERVE WHERE  ENCALCPOWERRESERVE.CODE = ?";
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
		_checkConditionToken(condition,"code","ENCALCPOWERRESERVE.CODE");
		_checkConditionToken(condition,"modify_time","ENCALCPOWERRESERVE.MODIFY_TIME");
		_checkConditionToken(condition,"useradd","ENCALCPOWERRESERVE.USERADD");
		_checkConditionToken(condition,"dateadd","ENCALCPOWERRESERVE.DATEADD");
		_checkConditionToken(condition,"usergen","ENCALCPOWERRESERVE.USERGEN");
		_checkConditionToken(condition,"dateedit","ENCALCPOWERRESERVE.DATEEDIT");
		// relationship conditions
		_checkConditionToken(condition,"servicesobjectref","SERVICESOBJECTREFCODE");
		_checkConditionToken(condition,"servicesobjectref.code","SERVICESOBJECTREFCODE");
		_checkConditionToken(condition,"gauge150ref","GAUGE150REFCODE");
		_checkConditionToken(condition,"gauge150ref.code","GAUGE150REFCODE");
		_checkConditionToken(condition,"gaugeref","GAUGEREFCODE");
		_checkConditionToken(condition,"gaugeref.code","GAUGEREFCODE");
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
	
	private void _collectAutoIncrementFields(ENCalcPowerReserve anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENCALCPOWERRESERVE", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENCALCPOWERRESERVE", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENCALCPOWERRESERVE", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENCALCPOWERRESERVE");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENCalcPowerReserveDAO
