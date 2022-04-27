
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
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
import com.ksoe.energynet.valueobject.ENServices2CalcAdditionalItems;
import com.ksoe.energynet.valueobject.filter.ENServices2CalcAdditionalItemsFilter;
import com.ksoe.energynet.valueobject.brief.ENServices2CalcAdditionalItemsShort;
import com.ksoe.energynet.valueobject.lists.ENServices2CalcAdditionalItemsShortList;


/**
 * DAO Object for ENServices2CalcAdditionalItems;
 *
 */

public class ENServices2CalcAdditionalItemsDAOGen extends GenericDataMiner {

	public ENServices2CalcAdditionalItemsDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENServices2CalcAdditionalItemsDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENServices2CalcAdditionalItems inObject) throws PersistenceException {
		ENServices2CalcAdditionalItems obj = new ENServices2CalcAdditionalItems();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.summa == null && obj.summa == null){}
		else
			if(inObject.summa == null || obj.summa == null) return false;
			else
				if ( ! inObject.summa.equals(obj.summa)){
					return false;
				}

		if(inObject.countgen == null && obj.countgen == null){}
		else
			if(inObject.countgen == null || obj.countgen == null) return false;
			else
				if ( ! inObject.countgen.equals(obj.countgen)){
					return false;
				}

		if(inObject.comment == null && obj.comment == null){}
		else
			if(inObject.comment == null || obj.comment == null) return false;
			else
				if ( ! inObject.comment.equals(obj.comment)){
					return false;
				}
		if (inObject.servicesObjectRef.code != obj.servicesObjectRef.code){
			return false;
		}
		if (inObject.calcAdditionalItemTypeRef.code != obj.calcAdditionalItemTypeRef.code){
			return false;
		}
		return true;
	}

	public int add(ENServices2CalcAdditionalItems anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENServices2CalcAdditionalItems anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENSERVICES2CLCDDTNLTMS (CODE,SUMMA,COUNTGEN,COMMENT,SERVICESOBJECTREFCODE,CALCADDITIONALTMTPRFCD) VALUES (?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.summa != null) {
				anObject.summa = anObject.summa.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(2,anObject.summa);
			if (anObject.countgen != null) {
				anObject.countgen = anObject.countgen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(3,anObject.countgen);
			statement.setString(4,anObject.comment);
			if (anObject.servicesObjectRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).exists(anObject.servicesObjectRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENServices2CalcAdditionalItems.servicesObjectRef.code%} = {%"+anObject.servicesObjectRef.code+"%}");
				}
				statement.setInt(5,anObject.servicesObjectRef.code);
			} else {
				statement.setNull(5,java.sql.Types.INTEGER);
			}
			if (anObject.calcAdditionalItemTypeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENCalcAdditionalItemTypeDAOGen(connection,getUserProfile()).exists(anObject.calcAdditionalItemTypeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENServices2CalcAdditionalItems.calcAdditionalItemTypeRef.code%} = {%"+anObject.calcAdditionalItemTypeRef.code+"%}");
				}
				statement.setInt(6,anObject.calcAdditionalItemTypeRef.code);
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
			throw new PersistenceException("Error in method {%ENServices2CalcAdditionalItemsDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENServices2CalcAdditionalItems anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENServices2CalcAdditionalItems anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("SUMMA") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COUNTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COMMENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SERVICESOBJECTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CALCADDITIONALITEMTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENSERVICES2CLCDDTNLTMS SET  SUMMA = ? , COUNTGEN = ? , COMMENT = ? , SERVICESOBJECTREFCODE = ? , CALCADDITIONALTMTPRFCD = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENSERVICES2CALCADDITIONALITEMS SET ";
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
					if (anObject.summa != null) {
						anObject.summa = anObject.summa.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(1,anObject.summa);
					if (anObject.countgen != null) {
						anObject.countgen = anObject.countgen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(2,anObject.countgen);
					statement.setString(3,anObject.comment);
					if (anObject.servicesObjectRef.code != Integer.MIN_VALUE) {
						statement.setInt(4,anObject.servicesObjectRef.code);
					} else {
						statement.setNull(4,java.sql.Types.INTEGER);
					}
					if (anObject.calcAdditionalItemTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(5,anObject.calcAdditionalItemTypeRef.code);
					} else {
						statement.setNull(5,java.sql.Types.INTEGER);
					}
					statement.setInt(6,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("SUMMA".compareTo((String)fields.get(i)) == 0) {
							if (anObject.summa != null) {
								anObject.summa = anObject.summa.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.summa);
							continue;
						}
						if("COUNTGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.countgen != null) {
								anObject.countgen = anObject.countgen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.countgen);
							continue;
						}
						if("COMMENT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.comment);
							continue;
						}
						if("SERVICESOBJECTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.servicesObjectRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.servicesObjectRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("CALCADDITIONALITEMTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.calcAdditionalItemTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.calcAdditionalItemTypeRef.code);
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

	} // end of save(ENServices2CalcAdditionalItems anObject,String[] anAttributes)


	public ENServices2CalcAdditionalItemsShort getShortObject(int anObjectCode) throws PersistenceException {
		ENServices2CalcAdditionalItems filterObject = new ENServices2CalcAdditionalItems();
		Vector<ENServices2CalcAdditionalItemsShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENServices2CalcAdditionalItemsShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENServices2CalcAdditionalItems filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.summa, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.countgen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.comment, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.servicesObjectRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.calcAdditionalItemTypeRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENServices2CalcAdditionalItemsFilter filter) {
		String out = buildCondition((ENServices2CalcAdditionalItems)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENServices2CalcAdditionalItems filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENServices2CalcAdditionalItems.code_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.summa, ENServices2CalcAdditionalItems.summa_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.countgen, ENServices2CalcAdditionalItems.countgen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.comment, ENServices2CalcAdditionalItems.comment_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.servicesObjectRef.code, ENServices2CalcAdditionalItems.servicesObjectRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.calcAdditionalItemTypeRef.code, ENServices2CalcAdditionalItems.calcAdditionalItemTypeRef_QFielld, out);
		}
		return out;
	}

	public ENServices2CalcAdditionalItemsShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENServices2CalcAdditionalItemsShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENServices2CalcAdditionalItemsShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENServices2CalcAdditionalItemsShortList getFilteredList(ENServices2CalcAdditionalItems filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENServices2CalcAdditionalItemsShortList getScrollableFilteredList(ENServices2CalcAdditionalItems aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENServices2CalcAdditionalItemsShortList getScrollableFilteredList(ENServices2CalcAdditionalItems aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENServices2CalcAdditionalItemsShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENServices2CalcAdditionalItemsShortList getScrollableFilteredList(ENServices2CalcAdditionalItemsFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENServices2CalcAdditionalItemsShortList getScrollableFilteredList(ENServices2CalcAdditionalItemsFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENServices2CalcAdditionalItemsShortList getScrollableFilteredList(ENServices2CalcAdditionalItems aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENServices2CalcAdditionalItemsShortList result = new ENServices2CalcAdditionalItemsShortList();
		ENServices2CalcAdditionalItemsShort anObject;
		result.list = new Vector<ENServices2CalcAdditionalItemsShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSERVICES2CLCDDTNLTMS.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSERVICES2CLCDDTNLTMS.CODE"+
			",ENSERVICES2CLCDDTNLTMS.SUMMA"+
			",ENSERVICES2CLCDDTNLTMS.COUNTGEN"+
			",ENSERVICES2CLCDDTNLTMS.COMMENT"+
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
			", ENCALCADDITIONALITEMTP.CODE " +
			", ENCALCADDITIONALITEMTP.NAME " +
		" FROM ENSERVICES2CLCDDTNLTMS " +
			", ENSERVICESOBJECT " +
			", ENCALCADDITIONALITEMTP " +
		"";
		whereStr = " ENSERVICESOBJECT.CODE = ENSERVICES2CLCDDTNLTMS.SERVICESOBJECTREFCODE" ; //+
		whereStr += " AND ENCALCADDITIONALITEMTP.CODE = ENSERVICES2CLCDDTNLTMS.CALCADDITIONALTMTPRFCD" ; //+

	
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
				anObject = new ENServices2CalcAdditionalItemsShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.summa = set.getBigDecimal(2);
				if(anObject.summa != null) {
					anObject.summa = anObject.summa.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.countgen = set.getBigDecimal(3);
				if(anObject.countgen != null) {
					anObject.countgen = anObject.countgen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.comment = set.getString(4);

				anObject.servicesObjectRefCode = set.getInt(5);
				if(set.wasNull()) {
					anObject.servicesObjectRefCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefContractNumber = set.getString(6);
				anObject.servicesObjectRefContractDate = set.getDate(7);
				anObject.servicesObjectRefName = set.getString(8);
				anObject.servicesObjectRefPartnerCode = set.getString(9);
				anObject.servicesObjectRefFinDocCode = set.getString(10);
				anObject.servicesObjectRefFinDocID = set.getInt(11);
				if(set.wasNull()) {
					anObject.servicesObjectRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefCommentGen = set.getString(12);
				anObject.servicesObjectRefContractNumberServices = set.getString(13);
				anObject.servicesObjectRefContractDateServices = set.getDate(14);
				anObject.servicesObjectRefContragentName = set.getString(15);
				anObject.servicesObjectRefContragentAddress = set.getString(16);
				anObject.servicesObjectRefContragentAddressWork = set.getString(17);
				anObject.servicesObjectRefContragentOkpo = set.getString(18);
				anObject.servicesObjectRefContragentBankAccount = set.getString(19);
				anObject.servicesObjectRefContragentBankName = set.getString(20);
				anObject.servicesObjectRefContragentBankMfo = set.getString(21);
				anObject.servicesObjectRefContragentBossName = set.getString(22);
				anObject.servicesObjectRefContragentPassport = set.getString(23);
				anObject.servicesObjectRefContractServicesSumma = set.getBigDecimal(24);
				if(anObject.servicesObjectRefContractServicesSumma != null) {
					anObject.servicesObjectRefContractServicesSumma = anObject.servicesObjectRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesSummaVAT = set.getBigDecimal(25);
				if(anObject.servicesObjectRefContractServicesSummaVAT != null) {
					anObject.servicesObjectRefContractServicesSummaVAT = anObject.servicesObjectRefContractServicesSummaVAT.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesPower = set.getBigDecimal(26);
				if(anObject.servicesObjectRefContractServicesPower != null) {
					anObject.servicesObjectRefContractServicesPower = anObject.servicesObjectRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefCommentServicesGen = set.getString(27);
				anObject.servicesObjectRefContractServicesDistance = set.getBigDecimal(28);
				if(anObject.servicesObjectRefContractServicesDistance != null) {
					anObject.servicesObjectRefContractServicesDistance = anObject.servicesObjectRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesDay = set.getBigDecimal(29);
				if(anObject.servicesObjectRefContractServicesDay != null) {
					anObject.servicesObjectRefContractServicesDay = anObject.servicesObjectRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefUserGen = set.getString(30);
				anObject.servicesObjectRefDateEdit = set.getDate(31);
				anObject.servicesObjectRefWarrantDate = set.getDate(32);
				anObject.servicesObjectRefWarrantNumber = set.getString(33);
				anObject.servicesObjectRefWarrantFIO = set.getString(34);
				anObject.servicesObjectRefRegionalType = set.getInt(35);
				if(set.wasNull()) {
					anObject.servicesObjectRefRegionalType = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefBasisType = set.getBigDecimal(36);
				if(anObject.servicesObjectRefBasisType != null) {
					anObject.servicesObjectRefBasisType = anObject.servicesObjectRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContragentPosition = set.getString(37);
				anObject.servicesObjectRefExecuteWorkDate = set.getDate(38);
				anObject.servicesObjectRefTimeStart = set.getTimestamp(39);
				anObject.servicesObjectRefTimeFinal = set.getTimestamp(40);
				anObject.servicesObjectRefContragentPhoneNumber = set.getString(41);
				anObject.servicesObjectRefExecutorPhoneNumber = set.getString(42);
				anObject.servicesObjectRefContragentObjectWork = set.getString(43);
				anObject.servicesObjectRefIsNoPay = set.getInt(44);
				if(set.wasNull()) {
					anObject.servicesObjectRefIsNoPay = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefIsCustomerMaterials = set.getInt(45);
				if(set.wasNull()) {
					anObject.servicesObjectRefIsCustomerMaterials = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPayDate = set.getDate(46);
				anObject.servicesObjectRefFinPayFormCode = set.getInt(47);
				if(set.wasNull()) {
					anObject.servicesObjectRefFinPayFormCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefFinPayFormName = set.getString(48);
				anObject.servicesObjectRefPartnerId = set.getInt(49);
				if(set.wasNull()) {
					anObject.servicesObjectRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPayDetail = set.getString(50);
				anObject.servicesObjectRefActTransferNumber = set.getString(51);
				anObject.servicesObjectRefActTransferDate = set.getDate(52);
				anObject.servicesObjectRefResposible = set.getString(53);
				anObject.servicesObjectRefResposiblePosition = set.getString(54);
				anObject.servicesObjectRefResposibleTabNumber = set.getString(55);
				anObject.servicesObjectRefPrevContractStatus = set.getInt(56);
				if(set.wasNull()) {
					anObject.servicesObjectRefPrevContractStatus = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefReconnectionTU = set.getInt(57);
				if(set.wasNull()) {
					anObject.servicesObjectRefReconnectionTU = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPersonalAccountCode = set.getInt(58);
				if(set.wasNull()) {
					anObject.servicesObjectRefPersonalAccountCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPersonalAccountNumber = set.getString(59);
				anObject.servicesObjectRefTabNumber = set.getString(60);
				anObject.servicesObjectRefCitiesList = set.getString(61);
				anObject.servicesObjectRefLineLength = set.getBigDecimal(62);
				if(anObject.servicesObjectRefLineLength != null) {
					anObject.servicesObjectRefLineLength = anObject.servicesObjectRefLineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefProjectCode = set.getString(63);
				anObject.servicesObjectRefCnPackCode = set.getInt(64);
				if(set.wasNull()) {
					anObject.servicesObjectRefCnPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefDfPackCode = set.getInt(65);
				if(set.wasNull()) {
					anObject.servicesObjectRefDfPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefCountersZoneType = set.getInt(66);
				if(set.wasNull()) {
					anObject.servicesObjectRefCountersZoneType = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefAxPartnerCode = set.getString(67);
				anObject.servicesObjectRefAxPartnerName = set.getString(68);
				anObject.servicesObjectRefAxContractNumber = set.getString(69);
				anObject.servicesObjectRefAxContractDate = set.getDate(70);
				anObject.servicesObjectRefAxContractCode = set.getString(71);
				anObject.servicesObjectRefAxContractId = set.getString(72);
				anObject.servicesObjectRefAxContractCommentGen = set.getString(73);
				anObject.servicesObjectRefProjAgreeSumma = set.getBigDecimal(74);
				if(anObject.servicesObjectRefProjAgreeSumma != null) {
					anObject.servicesObjectRefProjAgreeSumma = anObject.servicesObjectRefProjAgreeSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefTopographySumma = set.getBigDecimal(75);
				if(anObject.servicesObjectRefTopographySumma != null) {
					anObject.servicesObjectRefTopographySumma = anObject.servicesObjectRefTopographySumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefCreatedFromSite = set.getInt(76);
				if(set.wasNull()) {
					anObject.servicesObjectRefCreatedFromSite = Integer.MIN_VALUE;
				}
				anObject.calcAdditionalItemTypeRefCode = set.getInt(77);
				if(set.wasNull()) {
					anObject.calcAdditionalItemTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.calcAdditionalItemTypeRefName = set.getString(78);

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
	
	public int[] getFilteredCodeArray(ENServices2CalcAdditionalItemsFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENServices2CalcAdditionalItemsFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENServices2CalcAdditionalItems aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENSERVICES2CLCDDTNLTMS.CODE FROM ENSERVICES2CLCDDTNLTMS";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSERVICES2CLCDDTNLTMS.CODE";
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

	public ENServices2CalcAdditionalItems getObject(int uid) throws PersistenceException {
		ENServices2CalcAdditionalItems result = new ENServices2CalcAdditionalItems();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENServices2CalcAdditionalItems anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENSERVICES2CLCDDTNLTMS.CODE, ENSERVICES2CLCDDTNLTMS.SUMMA, ENSERVICES2CLCDDTNLTMS.COUNTGEN, ENSERVICES2CLCDDTNLTMS.COMMENT, ENSERVICES2CLCDDTNLTMS.SERVICESOBJECTREFCODE, ENSERVICES2CLCDDTNLTMS.CALCADDITIONALTMTPRFCD "
			+" FROM ENSERVICES2CLCDDTNLTMS WHERE ENSERVICES2CLCDDTNLTMS.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.summa = set.getBigDecimal(2);
				if(anObject.summa != null) {
					anObject.summa = anObject.summa.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.countgen = set.getBigDecimal(3);
				if(anObject.countgen != null) {
					anObject.countgen = anObject.countgen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.comment = set.getString(4);
				anObject.servicesObjectRef.code = set.getInt(5);
				if (set.wasNull()) {
					anObject.servicesObjectRef.code = Integer.MIN_VALUE;
				}
				anObject.calcAdditionalItemTypeRef.code = set.getInt(6);
				if (set.wasNull()) {
					anObject.calcAdditionalItemTypeRef.code = Integer.MIN_VALUE;
				}
				if(anObject.servicesObjectRef.code != Integer.MIN_VALUE) {
					anObject.setServicesObjectRef(
						new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).getRef(anObject.servicesObjectRef.code));
				}
				if(anObject.calcAdditionalItemTypeRef.code != Integer.MIN_VALUE) {
					anObject.setCalcAdditionalItemTypeRef(
						new com.ksoe.energynet.dataminer.generated.ENCalcAdditionalItemTypeDAOGen(connection,getUserProfile()).getRef(anObject.calcAdditionalItemTypeRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENServices2CalcAdditionalItemsRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENServices2CalcAdditionalItemsRef ref = new com.ksoe.energynet.valueobject.references.ENServices2CalcAdditionalItemsRef();
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

		selectStr = "DELETE FROM  ENSERVICES2CLCDDTNLTMS WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENServices2CalcAdditionalItems object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENServices2CalcAdditionalItems.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENServices2CalcAdditionalItems.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENServices2CalcAdditionalItems.remove%} access denied");
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
	
	public long count(ENServices2CalcAdditionalItemsFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENServices2CalcAdditionalItemsFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENServices2CalcAdditionalItemsFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENSERVICES2CLCDDTNLTMS", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENServices2CalcAdditionalItemsFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENSERVICES2CLCDDTNLTMS");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENServices2CalcAdditionalItems.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENServices2CalcAdditionalItems.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENSERVICES2CLCDDTNLTMS.CODE FROM  ENSERVICES2CLCDDTNLTMS WHERE  ENSERVICES2CLCDDTNLTMS.CODE = ?";
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
		_checkConditionToken(condition,"code","ENSERVICES2CLCDDTNLTMS.CODE");
		_checkConditionToken(condition,"summa","ENSERVICES2CLCDDTNLTMS.SUMMA");
		_checkConditionToken(condition,"countgen","ENSERVICES2CLCDDTNLTMS.COUNTGEN");
		_checkConditionToken(condition,"comment","ENSERVICES2CLCDDTNLTMS.COMMENT");
		// relationship conditions
		_checkConditionToken(condition,"servicesobjectref","SERVICESOBJECTREFCODE");
		_checkConditionToken(condition,"servicesobjectref.code","SERVICESOBJECTREFCODE");
		_checkConditionToken(condition,"calcadditionalitemtyperef","CALCADDITIONALTMTPRFCD");
		_checkConditionToken(condition,"calcadditionalitemtyperef.code","CALCADDITIONALTMTPRFCD");
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
	
	private void _collectAutoIncrementFields(ENServices2CalcAdditionalItems anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENSERVICES2CLCDDTNLTMS", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENSERVICES2CLCDDTNLTMS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENSERVICES2CLCDDTNLTMS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENSERVICES2CLCDDTNLTMS");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENServices2CalcAdditionalItemsDAO
