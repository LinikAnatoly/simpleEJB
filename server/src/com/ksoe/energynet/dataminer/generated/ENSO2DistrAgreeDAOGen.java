
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
import com.ksoe.energynet.valueobject.ENSO2DistrAgree;
import com.ksoe.energynet.valueobject.filter.ENSO2DistrAgreeFilter;
import com.ksoe.energynet.valueobject.brief.ENSO2DistrAgreeShort;
import com.ksoe.energynet.valueobject.lists.ENSO2DistrAgreeShortList;


/**
 * DAO Object for ENSO2DistrAgree;
 *
 */

public class ENSO2DistrAgreeDAOGen extends GenericDataMiner {

	public ENSO2DistrAgreeDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENSO2DistrAgreeDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENSO2DistrAgree inObject) throws PersistenceException {
		ENSO2DistrAgree obj = new ENSO2DistrAgree();
		obj.code = inObject.code;
		loadObject(obj);

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
		if (inObject.servicesobject.code != obj.servicesobject.code){
			return false;
		}
		if (inObject.distrAgree.code != obj.distrAgree.code){
			return false;
		}
		return true;
	}

	public int add(ENSO2DistrAgree anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENSO2DistrAgree anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENSO2DISTRAGREE (CODE,USERGEN,DATEEDIT,MODIFY_TIME,SERVICESOBJECTCODE,DISTRAGREECODE) VALUES (?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(3, null);
			} else {
				statement.setTimestamp(3, new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(4, null);
			} else {
				statement.setBigDecimal(4, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.servicesobject.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).exists(anObject.servicesobject.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENSO2DistrAgree.servicesobject.code%} = {%"+anObject.servicesobject.code+"%}");
				}
				statement.setInt(5,anObject.servicesobject.code);
			} else {
				statement.setNull(5,java.sql.Types.INTEGER);
			}
			if (anObject.distrAgree.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENDistributionAgreeDAOGen(connection,getUserProfile()).exists(anObject.distrAgree.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENSO2DistrAgree.distrAgree.code%} = {%"+anObject.distrAgree.code+"%}");
				}
				statement.setInt(6,anObject.distrAgree.code);
			} else {
				statement.setNull(6,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENSO2DistrAgreeDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENSO2DistrAgree anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENSO2DistrAgree anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENSO2DistrAgree oldObject = new ENSO2DistrAgree();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENSO2DistrAgree.modify_time_Field+" FROM  ENSO2DISTRAGREE WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("SERVICESOBJECT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DISTRAGREE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENSO2DISTRAGREE SET  USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , SERVICESOBJECTCODE = ? , DISTRAGREECODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENSO2DISTRAGREE SET ";
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
					statement.setString(1, anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(2, null);
					} else {
						statement.setTimestamp(2, new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(3, null);
					} else {
						statement.setBigDecimal(3, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.servicesobject.code != Integer.MIN_VALUE) {
						statement.setInt(4, anObject.servicesobject.code);
					} else {
						statement.setNull(4, java.sql.Types.INTEGER);
					}
					if (anObject.distrAgree.code != Integer.MIN_VALUE) {
						statement.setInt(5, anObject.distrAgree.code);
					} else {
						statement.setNull(5, java.sql.Types.INTEGER);
					}
					statement.setInt(6, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
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
						if("SERVICESOBJECT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.servicesobject.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.servicesobject.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("DISTRAGREE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.distrAgree.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.distrAgree.code);
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

	} // end of save(ENSO2DistrAgree anObject,String[] anAttributes)


	public ENSO2DistrAgreeShort getShortObject(int anObjectCode) throws PersistenceException {
		ENSO2DistrAgree filterObject = new ENSO2DistrAgree();
		Vector<ENSO2DistrAgreeShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENSO2DistrAgreeShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENSO2DistrAgree filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.servicesobject.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.distrAgree.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENSO2DistrAgreeFilter filter) {
		String out = buildCondition((ENSO2DistrAgree)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENSO2DistrAgree filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENSO2DistrAgree.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENSO2DistrAgree.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENSO2DistrAgree.dateEdit_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENSO2DistrAgree.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.servicesobject.code, ENSO2DistrAgree.servicesobject_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.distrAgree.code, ENSO2DistrAgree.distrAgree_QFielld, out);
		}
		return out;
	}

	public ENSO2DistrAgreeShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENSO2DistrAgreeShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENSO2DistrAgreeShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENSO2DistrAgreeShortList getFilteredList(ENSO2DistrAgree filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENSO2DistrAgreeShortList getScrollableFilteredList(ENSO2DistrAgree aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENSO2DistrAgreeShortList getScrollableFilteredList(ENSO2DistrAgree aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENSO2DistrAgreeShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENSO2DistrAgreeShortList getScrollableFilteredList(ENSO2DistrAgreeFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENSO2DistrAgreeShortList getScrollableFilteredList(ENSO2DistrAgreeFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENSO2DistrAgreeShortList getScrollableFilteredList(ENSO2DistrAgree aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENSO2DistrAgreeShortList result = new ENSO2DistrAgreeShortList();
		ENSO2DistrAgreeShort anObject;
		result.list = new Vector<ENSO2DistrAgreeShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSO2DISTRAGREE.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSO2DISTRAGREE.CODE"+
			",ENSO2DISTRAGREE.USERGEN"+
			",ENSO2DISTRAGREE.DATEEDIT"+
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
			", ENDISTRIBUTIONAGREE.CODE " +
			", ENDISTRIBUTIONAGREE.EIC " +
			", ENDISTRIBUTIONAGREE.OBJECTNAME " +
			", ENDISTRIBUTIONAGREE.OBJECTADDRESS " +
			", ENDISTRIBUTIONAGREE.POWER " +
			", ENDISTRIBUTIONAGREE.D3COUNTERNAME " +
			", ENDISTRIBUTIONAGREE.D3COUNTERTYPE " +
			", ENDISTRIBUTIONAGREE.D3AMPERAGERATIO " +
			", ENDISTRIBUTIONAGREE.D3VOLTAGERATIO " +
			", ENDISTRIBUTIONAGREE.D3TOTALRATIO " +
			", ENDISTRIBUTIONAGREE.D3PLACE " +
			", ENDISTRIBUTIONAGREE.D3VOLTAGECLASS " +
			", ENDISTRIBUTIONAGREE.D3WORKMODE " +
			", ENDISTRIBUTIONAGREE.D3TARIFFTYPE " +
			", ENDISTRIBUTIONAGREE.D3ACCOUNTINGTYPE " +
			", ENDISTRIBUTIONAGREE.D5FEEDERLIST " +
			", ENDISTRIBUTIONAGREE.D6RELIABILITYPUE " +
			", ENDISTRIBUTIONAGREE.D6RELIABILITYGUARANTED " +
			", ENDISTRIBUTIONAGREE.D6BALANCESUPPLIER " +
			", ENDISTRIBUTIONAGREE.D6BALANCECLIENT " +
			", ENDISTRIBUTIONAGREE.D6RESPONSIBILITYSUPPLR " +
			", ENDISTRIBUTIONAGREE.D6RESPONSIBILITYCLIENT " +
			", ENDISTRIBUTIONAGREE.D7LINESOURCE " +
			", ENDISTRIBUTIONAGREE.D7ATTACHMENT " +
			", ENDISTRIBUTIONAGREE.D8CONDITIONS " +
			", ENDISTRIBUTIONAGREE.D8TRANSFORMERTYPE " +
			", ENDISTRIBUTIONAGREE.D8VOLTAGEBH " +
			", ENDISTRIBUTIONAGREE.D8VOLTAGEHH " +
			", ENDISTRIBUTIONAGREE.D8LOSSESXX " +
			", ENDISTRIBUTIONAGREE.D8LOSSESKZ " +
			", ENDISTRIBUTIONAGREE.D8AMPERAGE " +
			", ENDISTRIBUTIONAGREE.D8VOLTAGEKZ " +
			", ENDISTRIBUTIONAGREE.D8LINELENGTH " +
			", ENDISTRIBUTIONAGREE.D8LINER " +
			", ENDISTRIBUTIONAGREE.D8LINEX " +
			", ENDISTRIBUTIONAGREE.D8HOURS " +
			", ENDISTRIBUTIONAGREE.USERGEN " +
		" FROM ENSO2DISTRAGREE " +
			" LEFT JOIN ENSERVICESOBJECT on ENSERVICESOBJECT.CODE = ENSO2DISTRAGREE.SERVICESOBJECTCODE "+
			" LEFT JOIN ENDISTRIBUTIONAGREE on ENDISTRIBUTIONAGREE.CODE = ENSO2DISTRAGREE.DISTRAGREECODE "+
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
				anObject = new ENSO2DistrAgreeShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.userGen = set.getString(2);
				anObject.dateEdit = set.getTimestamp(3);

				anObject.servicesobjectCode = set.getInt(4);
				if(set.wasNull()) {
					anObject.servicesobjectCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectContractNumber = set.getString(5);
				anObject.servicesobjectContractDate = set.getDate(6);
				anObject.servicesobjectName = set.getString(7);
				anObject.servicesobjectPartnerCode = set.getString(8);
				anObject.servicesobjectFinDocCode = set.getString(9);
				anObject.servicesobjectFinDocID = set.getInt(10);
				if(set.wasNull()) {
					anObject.servicesobjectFinDocID = Integer.MIN_VALUE;
				}
				anObject.servicesobjectCommentGen = set.getString(11);
				anObject.servicesobjectContractNumberServices = set.getString(12);
				anObject.servicesobjectContractDateServices = set.getDate(13);
				anObject.servicesobjectContragentName = set.getString(14);
				anObject.servicesobjectContragentAddress = set.getString(15);
				anObject.servicesobjectContragentAddressWork = set.getString(16);
				anObject.servicesobjectContragentOkpo = set.getString(17);
				anObject.servicesobjectContragentBankAccount = set.getString(18);
				anObject.servicesobjectContragentBankName = set.getString(19);
				anObject.servicesobjectContragentBankMfo = set.getString(20);
				anObject.servicesobjectContragentBossName = set.getString(21);
				anObject.servicesobjectContragentPassport = set.getString(22);
				anObject.servicesobjectContractServicesSumma = set.getBigDecimal(23);
				if(anObject.servicesobjectContractServicesSumma != null) {
					anObject.servicesobjectContractServicesSumma = anObject.servicesobjectContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectContractServicesSummaVAT = set.getBigDecimal(24);
				if(anObject.servicesobjectContractServicesSummaVAT != null) {
					anObject.servicesobjectContractServicesSummaVAT = anObject.servicesobjectContractServicesSummaVAT.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectContractServicesPower = set.getBigDecimal(25);
				if(anObject.servicesobjectContractServicesPower != null) {
					anObject.servicesobjectContractServicesPower = anObject.servicesobjectContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectCommentServicesGen = set.getString(26);
				anObject.servicesobjectContractServicesDistance = set.getBigDecimal(27);
				if(anObject.servicesobjectContractServicesDistance != null) {
					anObject.servicesobjectContractServicesDistance = anObject.servicesobjectContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectContractServicesDay = set.getBigDecimal(28);
				if(anObject.servicesobjectContractServicesDay != null) {
					anObject.servicesobjectContractServicesDay = anObject.servicesobjectContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectUserGen = set.getString(29);
				anObject.servicesobjectDateEdit = set.getDate(30);
				anObject.servicesobjectWarrantDate = set.getDate(31);
				anObject.servicesobjectWarrantNumber = set.getString(32);
				anObject.servicesobjectWarrantFIO = set.getString(33);
				anObject.servicesobjectRegionalType = set.getInt(34);
				if(set.wasNull()) {
					anObject.servicesobjectRegionalType = Integer.MIN_VALUE;
				}
				anObject.servicesobjectBasisType = set.getBigDecimal(35);
				if(anObject.servicesobjectBasisType != null) {
					anObject.servicesobjectBasisType = anObject.servicesobjectBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectContragentPosition = set.getString(36);
				anObject.servicesobjectExecuteWorkDate = set.getDate(37);
				anObject.servicesobjectTimeStart = set.getTimestamp(38);
				anObject.servicesobjectTimeFinal = set.getTimestamp(39);
				anObject.servicesobjectContragentPhoneNumber = set.getString(40);
				anObject.servicesobjectExecutorPhoneNumber = set.getString(41);
				anObject.servicesobjectContragentObjectWork = set.getString(42);
				anObject.servicesobjectIsNoPay = set.getInt(43);
				if(set.wasNull()) {
					anObject.servicesobjectIsNoPay = Integer.MIN_VALUE;
				}
				anObject.servicesobjectIsCustomerMaterials = set.getInt(44);
				if(set.wasNull()) {
					anObject.servicesobjectIsCustomerMaterials = Integer.MIN_VALUE;
				}
				anObject.servicesobjectPayDate = set.getDate(45);
				anObject.servicesobjectFinPayFormCode = set.getInt(46);
				if(set.wasNull()) {
					anObject.servicesobjectFinPayFormCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectFinPayFormName = set.getString(47);
				anObject.servicesobjectPartnerId = set.getInt(48);
				if(set.wasNull()) {
					anObject.servicesobjectPartnerId = Integer.MIN_VALUE;
				}
				anObject.servicesobjectPayDetail = set.getString(49);
				anObject.servicesobjectActTransferNumber = set.getString(50);
				anObject.servicesobjectActTransferDate = set.getDate(51);
				anObject.servicesobjectResposible = set.getString(52);
				anObject.servicesobjectResposiblePosition = set.getString(53);
				anObject.servicesobjectResposibleTabNumber = set.getString(54);
				anObject.servicesobjectPrevContractStatus = set.getInt(55);
				if(set.wasNull()) {
					anObject.servicesobjectPrevContractStatus = Integer.MIN_VALUE;
				}
				anObject.servicesobjectReconnectionTU = set.getInt(56);
				if(set.wasNull()) {
					anObject.servicesobjectReconnectionTU = Integer.MIN_VALUE;
				}
				anObject.servicesobjectPersonalAccountCode = set.getInt(57);
				if(set.wasNull()) {
					anObject.servicesobjectPersonalAccountCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectPersonalAccountNumber = set.getString(58);
				anObject.servicesobjectTabNumber = set.getString(59);
				anObject.servicesobjectCitiesList = set.getString(60);
				anObject.servicesobjectLineLength = set.getBigDecimal(61);
				if(anObject.servicesobjectLineLength != null) {
					anObject.servicesobjectLineLength = anObject.servicesobjectLineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectProjectCode = set.getString(62);
				anObject.servicesobjectCnPackCode = set.getInt(63);
				if(set.wasNull()) {
					anObject.servicesobjectCnPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectDfPackCode = set.getInt(64);
				if(set.wasNull()) {
					anObject.servicesobjectDfPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectCountersZoneType = set.getInt(65);
				if(set.wasNull()) {
					anObject.servicesobjectCountersZoneType = Integer.MIN_VALUE;
				}
				anObject.servicesobjectAxPartnerCode = set.getString(66);
				anObject.servicesobjectAxPartnerName = set.getString(67);
				anObject.servicesobjectAxContractNumber = set.getString(68);
				anObject.servicesobjectAxContractDate = set.getDate(69);
				anObject.servicesobjectAxContractCode = set.getString(70);
				anObject.servicesobjectAxContractId = set.getString(71);
				anObject.servicesobjectAxContractCommentGen = set.getString(72);
				anObject.servicesobjectProjAgreeSumma = set.getBigDecimal(73);
				if(anObject.servicesobjectProjAgreeSumma != null) {
					anObject.servicesobjectProjAgreeSumma = anObject.servicesobjectProjAgreeSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectTopographySumma = set.getBigDecimal(74);
				if(anObject.servicesobjectTopographySumma != null) {
					anObject.servicesobjectTopographySumma = anObject.servicesobjectTopographySumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectCreatedFromSite = set.getInt(75);
				if(set.wasNull()) {
					anObject.servicesobjectCreatedFromSite = Integer.MIN_VALUE;
				}
				anObject.servicesobjectTerm = set.getInt(76);
				if(set.wasNull()) {
					anObject.servicesobjectTerm = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRegulation = set.getInt(77);
				if(set.wasNull()) {
					anObject.servicesobjectRegulation = Integer.MIN_VALUE;
				}
				anObject.servicesobjectBoundaryDateWork = set.getDate(78);
				anObject.servicesobjectCountDayDelay = set.getInt(79);
				if(set.wasNull()) {
					anObject.servicesobjectCountDayDelay = Integer.MIN_VALUE;
				}
				anObject.servicesobjectFactDateWork = set.getDate(80);
				anObject.servicesobjectCodeEIC = set.getString(81);
				anObject.distrAgreeCode = set.getInt(82);
				if(set.wasNull()) {
					anObject.distrAgreeCode = Integer.MIN_VALUE;
				}
				anObject.distrAgreeEic = set.getString(83);
				anObject.distrAgreeObjectname = set.getString(84);
				anObject.distrAgreeObjectaddress = set.getString(85);
				anObject.distrAgreePower = set.getBigDecimal(86);
				if(anObject.distrAgreePower != null) {
					anObject.distrAgreePower = anObject.distrAgreePower.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.distrAgreeD3countername = set.getString(87);
				anObject.distrAgreeD3countertype = set.getString(88);
				anObject.distrAgreeD3amperageratio = set.getBigDecimal(89);
				if(anObject.distrAgreeD3amperageratio != null) {
					anObject.distrAgreeD3amperageratio = anObject.distrAgreeD3amperageratio.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.distrAgreeD3voltageratio = set.getBigDecimal(90);
				if(anObject.distrAgreeD3voltageratio != null) {
					anObject.distrAgreeD3voltageratio = anObject.distrAgreeD3voltageratio.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.distrAgreeD3totalratio = set.getBigDecimal(91);
				if(anObject.distrAgreeD3totalratio != null) {
					anObject.distrAgreeD3totalratio = anObject.distrAgreeD3totalratio.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.distrAgreeD3place = set.getString(92);
				anObject.distrAgreeD3voltageclass = set.getString(93);
				anObject.distrAgreeD3workmode = set.getString(94);
				anObject.distrAgreeD3tarifftype = set.getString(95);
				anObject.distrAgreeD3accountingtype = set.getString(96);
				anObject.distrAgreeD5feederlist = set.getString(97);
				anObject.distrAgreeD6reliabilitypue = set.getString(98);
				anObject.distrAgreeD6reliabilityguaranteed = set.getString(99);
				anObject.distrAgreeD6balancesupplier = set.getString(100);
				anObject.distrAgreeD6balanceclient = set.getString(101);
				anObject.distrAgreeD6responsibilitysupplier = set.getString(102);
				anObject.distrAgreeD6responsibilityclient = set.getString(103);
				anObject.distrAgreeD7linesource = set.getString(104);
				anObject.distrAgreeD7attachment = set.getString(105);
				anObject.distrAgreeD8conditions = set.getString(106);
				anObject.distrAgreeD8transformertype = set.getString(107);
				anObject.distrAgreeD8voltagebh = set.getBigDecimal(108);
				if(anObject.distrAgreeD8voltagebh != null) {
					anObject.distrAgreeD8voltagebh = anObject.distrAgreeD8voltagebh.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.distrAgreeD8voltagehh = set.getBigDecimal(109);
				if(anObject.distrAgreeD8voltagehh != null) {
					anObject.distrAgreeD8voltagehh = anObject.distrAgreeD8voltagehh.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.distrAgreeD8lossesxx = set.getBigDecimal(110);
				if(anObject.distrAgreeD8lossesxx != null) {
					anObject.distrAgreeD8lossesxx = anObject.distrAgreeD8lossesxx.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.distrAgreeD8losseskz = set.getBigDecimal(111);
				if(anObject.distrAgreeD8losseskz != null) {
					anObject.distrAgreeD8losseskz = anObject.distrAgreeD8losseskz.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.distrAgreeD8amperage = set.getBigDecimal(112);
				if(anObject.distrAgreeD8amperage != null) {
					anObject.distrAgreeD8amperage = anObject.distrAgreeD8amperage.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.distrAgreeD8voltagekz = set.getBigDecimal(113);
				if(anObject.distrAgreeD8voltagekz != null) {
					anObject.distrAgreeD8voltagekz = anObject.distrAgreeD8voltagekz.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.distrAgreeD8linelength = set.getBigDecimal(114);
				if(anObject.distrAgreeD8linelength != null) {
					anObject.distrAgreeD8linelength = anObject.distrAgreeD8linelength.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.distrAgreeD8liner = set.getBigDecimal(115);
				if(anObject.distrAgreeD8liner != null) {
					anObject.distrAgreeD8liner = anObject.distrAgreeD8liner.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.distrAgreeD8linex = set.getBigDecimal(116);
				if(anObject.distrAgreeD8linex != null) {
					anObject.distrAgreeD8linex = anObject.distrAgreeD8linex.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.distrAgreeD8hours = set.getInt(117);
				if(set.wasNull()) {
					anObject.distrAgreeD8hours = Integer.MIN_VALUE;
				}
				anObject.distrAgreeUserGen = set.getString(118);

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
	
	public int[] getFilteredCodeArray(ENSO2DistrAgreeFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENSO2DistrAgreeFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENSO2DistrAgree aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENSO2DISTRAGREE.CODE FROM ENSO2DISTRAGREE";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSO2DISTRAGREE.CODE";
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


	public ENSO2DistrAgree getObject(int uid) throws PersistenceException {
		ENSO2DistrAgree result = new ENSO2DistrAgree();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENSO2DistrAgree anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENSO2DISTRAGREE.CODE, ENSO2DISTRAGREE.USERGEN, ENSO2DISTRAGREE.DATEEDIT, ENSO2DISTRAGREE.MODIFY_TIME, ENSO2DISTRAGREE.SERVICESOBJECTCODE, ENSO2DISTRAGREE.DISTRAGREECODE "
			+" FROM ENSO2DISTRAGREE WHERE ENSO2DISTRAGREE.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.userGen = set.getString(2);
				anObject.dateEdit = set.getTimestamp(3);
				anObject.modify_time = set.getLong(4);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.servicesobject.code = set.getInt(5);
				if (set.wasNull()) {
					anObject.servicesobject.code = Integer.MIN_VALUE;
				}
				anObject.distrAgree.code = set.getInt(6);
				if (set.wasNull()) {
					anObject.distrAgree.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENSO2DistrAgreeRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENSO2DistrAgreeRef ref = new com.ksoe.energynet.valueobject.references.ENSO2DistrAgreeRef();
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

		selectStr = "DELETE FROM  ENSO2DISTRAGREE WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENSO2DistrAgree object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENSO2DistrAgree.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENSO2DistrAgree.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENSO2DistrAgree.remove%} access denied");
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
	
	public long count(ENSO2DistrAgreeFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENSO2DistrAgreeFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENSO2DistrAgreeFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENSO2DISTRAGREE", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENSO2DistrAgreeFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENSO2DISTRAGREE");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENSO2DistrAgree.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENSO2DistrAgree.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENSO2DISTRAGREE.CODE FROM  ENSO2DISTRAGREE WHERE  ENSO2DISTRAGREE.CODE = ?";
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
		_checkConditionToken(condition,"code","ENSO2DISTRAGREE.CODE");
		_checkConditionToken(condition,"usergen","ENSO2DISTRAGREE.USERGEN");
		_checkConditionToken(condition,"dateedit","ENSO2DISTRAGREE.DATEEDIT");
		_checkConditionToken(condition,"modify_time","ENSO2DISTRAGREE.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"servicesobject","SERVICESOBJECTCODE");
		_checkConditionToken(condition,"servicesobject.code","SERVICESOBJECTCODE");
		_checkConditionToken(condition,"distragree","DISTRAGREECODE");
		_checkConditionToken(condition,"distragree.code","DISTRAGREECODE");
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
	
	private void _collectAutoIncrementFields(ENSO2DistrAgree anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENSO2DISTRAGREE", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENSO2DISTRAGREE", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENSO2DISTRAGREE", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENSO2DISTRAGREE");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENSO2DistrAgreeDAO
