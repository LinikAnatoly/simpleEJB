
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
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
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.valueobject.ENGiveCounter;
import com.ksoe.energynet.valueobject.brief.ENGiveCounterShort;
import com.ksoe.energynet.valueobject.filter.ENGiveCounterFilter;
import com.ksoe.energynet.valueobject.lists.ENGiveCounterShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENGiveCounter;
 *
 */

public class ENGiveCounterDAOGen extends GenericDataMiner {

	public ENGiveCounterDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENGiveCounterDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENGiveCounter inObject) throws PersistenceException {
		ENGiveCounter obj = new ENGiveCounter();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.counterType == null && obj.counterType == null){}
		else
			if(inObject.counterType == null || obj.counterType == null) return false;
			else
				if ( ! inObject.counterType.equals(obj.counterType)){
					return false;
				}

		if(inObject.serialNumber == null && obj.serialNumber == null){}
		else
			if(inObject.serialNumber == null || obj.serialNumber == null) return false;
			else
				if ( ! inObject.serialNumber.equals(obj.serialNumber)){
					return false;
				}

		if(inObject.cost == null && obj.cost == null){}
		else
			if(inObject.cost == null || obj.cost == null) return false;
			else
				if ( ! inObject.cost.equals(obj.cost)){
					return false;
				}

		if(inObject.vat == null && obj.vat == null){}
		else
			if(inObject.vat == null || obj.vat == null) return false;
			else
				if ( ! inObject.vat.equals(obj.vat)){
					return false;
				}

		if(inObject.molCode == null && obj.molCode == null){}
		else
			if(inObject.molCode == null || obj.molCode == null) return false;
			else
				if ( ! inObject.molCode.equals(obj.molCode)){
					return false;
				}

		if(inObject.molName == null && obj.molName == null){}
		else
			if(inObject.molName == null || obj.molName == null) return false;
			else
				if ( ! inObject.molName.equals(obj.molName)){
					return false;
				}

		if(inObject.dateBuild == null && obj.dateBuild == null){} else
			if(inObject.dateBuild == null || obj.dateBuild == null) return false;
			else
				if (inObject.dateBuild.compareTo(obj.dateBuild) != 0){
					return false;
				}

		if (inObject.phasity != obj.phasity){
					return false;
				}

		if(inObject.commentGen == null && obj.commentGen == null){}
		else
			if(inObject.commentGen == null || obj.commentGen == null) return false;
			else
				if ( ! inObject.commentGen.equals(obj.commentGen)){
					return false;
				}
		if (inObject.plan2ClTypeRef.code != obj.plan2ClTypeRef.code){
			return false;
		}
		if (inObject.servicesObjectRef.code != obj.servicesObjectRef.code){
			return false;
		}
		return true;
	}

	public int add(ENGiveCounter anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENGiveCounter anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENGIVECOUNTER (CODE,COUNTERTYPE,SERIALNUMBER,COST,VAT,MOLCODE,MOLNAME,DATEBUILD,PHASITY,COMMENTGEN,PLAN2CLTYPEREFCODE,SERVICESOBJECTREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			statement.setString(2,anObject.counterType);
			statement.setString(3,anObject.serialNumber);
			if (anObject.cost != null) {
				anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(4,anObject.cost);
			if (anObject.vat != null) {
				anObject.vat = anObject.vat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(5,anObject.vat);
			statement.setString(6,anObject.molCode);
			statement.setString(7,anObject.molName);
			if (anObject.dateBuild == null) {
				statement.setDate(8,null);
			} else {
				statement.setDate(8,new java.sql.Date(anObject.dateBuild.getTime()));
			}
			if (anObject.phasity != Integer.MIN_VALUE ) {
				statement.setInt(9,anObject.phasity);
			} else {
				statement.setNull(9,java.sql.Types.INTEGER);
			}
			statement.setString(10,anObject.commentGen);
			if (anObject.plan2ClTypeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWork2ClassificationTypeDAOGen(connection,getUserProfile()).exists(anObject.plan2ClTypeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENGiveCounter.plan2ClTypeRef.code%} = {%"+anObject.plan2ClTypeRef.code+"%}");
				}
				statement.setInt(11,anObject.plan2ClTypeRef.code);
			} else {
				statement.setNull(11,java.sql.Types.INTEGER);
			}
			if (anObject.servicesObjectRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).exists(anObject.servicesObjectRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENGiveCounter.servicesObjectRef.code%} = {%"+anObject.servicesObjectRef.code+"%}");
				}
				statement.setInt(12,anObject.servicesObjectRef.code);
			} else {
				statement.setNull(12,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENGiveCounterDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENGiveCounter anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENGiveCounter anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("COUNTERTYPE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SERIALNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COST") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("VAT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MOLCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MOLNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEBUILD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PHASITY") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COMMENTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PLAN2CLTYPEREF") == 0) {
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
				selectStr = "UPDATE ENGIVECOUNTER SET  COUNTERTYPE = ? , SERIALNUMBER = ? , COST = ? , VAT = ? , MOLCODE = ? , MOLNAME = ? , DATEBUILD = ? , PHASITY = ? , COMMENTGEN = ? , PLAN2CLTYPEREFCODE = ? , SERVICESOBJECTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENGIVECOUNTER SET ";
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
					statement.setString(1,anObject.counterType);
					statement.setString(2,anObject.serialNumber);
					if (anObject.cost != null) {
						anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(3,anObject.cost);
					if (anObject.vat != null) {
						anObject.vat = anObject.vat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(4,anObject.vat);
					statement.setString(5,anObject.molCode);
					statement.setString(6,anObject.molName);
					if (anObject.dateBuild == null) {
						statement.setDate(7,null);
					} else {
						statement.setDate(7,new java.sql.Date(anObject.dateBuild.getTime()));
					}
					if (anObject.phasity != Integer.MIN_VALUE) {
						statement.setInt(8,anObject.phasity);
					} else {
						statement.setNull(8,java.sql.Types.INTEGER);
					}
					statement.setString(9,anObject.commentGen);
					if (anObject.plan2ClTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(10,anObject.plan2ClTypeRef.code);
					} else {
						statement.setNull(10,java.sql.Types.INTEGER);
					}
					if (anObject.servicesObjectRef.code != Integer.MIN_VALUE) {
						statement.setInt(11,anObject.servicesObjectRef.code);
					} else {
						statement.setNull(11,java.sql.Types.INTEGER);
					}
					statement.setInt(12,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("COUNTERTYPE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.counterType);
							continue;
						}
						if("SERIALNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.serialNumber);
							continue;
						}
						if("COST".compareTo((String)fields.get(i)) == 0) {
							if (anObject.cost != null) {
								anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.cost);
							continue;
						}
						if("VAT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.vat != null) {
								anObject.vat = anObject.vat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.vat);
							continue;
						}
						if("MOLCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.molCode);
							continue;
						}
						if("MOLNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.molName);
							continue;
						}
						if("DATEBUILD".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateBuild == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.dateBuild.getTime()));
							}
							continue;
						}
						if("PHASITY".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.phasity);
							continue;
						}
						if("COMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.commentGen);
							continue;
						}
						if("PLAN2CLTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.plan2ClTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.plan2ClTypeRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
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

	} // end of save(ENGiveCounter anObject,String[] anAttributes)


	public ENGiveCounterShort getShortObject(int anObjectCode) throws PersistenceException {
		ENGiveCounter filterObject = new ENGiveCounter();
		Vector<ENGiveCounterShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENGiveCounterShort)list.get(0);
		}
		return null;
	}

	public int setParameters(ENGiveCounter filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.counterType, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.serialNumber, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.cost, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.vat, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.molCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.molName, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateBuild, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.phasity, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.plan2ClTypeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.servicesObjectRef.code, index, statement);
			index--;
		}
		return index;
	}

	public String buildCondition(ENGiveCounterFilter filter) {
		String out = buildCondition((ENGiveCounter)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENGiveCounter filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENGiveCounter.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.counterType, ENGiveCounter.counterType_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.serialNumber, ENGiveCounter.serialNumber_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.cost, ENGiveCounter.cost_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.vat, ENGiveCounter.vat_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.molCode, ENGiveCounter.molCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.molName, ENGiveCounter.molName_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateBuild, ENGiveCounter.dateBuild_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.phasity, ENGiveCounter.phasity_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentGen, ENGiveCounter.commentGen_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.plan2ClTypeRef.code, ENGiveCounter.plan2ClTypeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.servicesObjectRef.code, ENGiveCounter.servicesObjectRef_QFielld, out);
		}
		return out;
	}

	public ENGiveCounterShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENGiveCounterShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENGiveCounterShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENGiveCounterShortList getFilteredList(ENGiveCounter filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENGiveCounterShortList getScrollableFilteredList(ENGiveCounter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENGiveCounterShortList getScrollableFilteredList(ENGiveCounter aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENGiveCounterShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENGiveCounterShortList getScrollableFilteredList(ENGiveCounterFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}

	public ENGiveCounterShortList getScrollableFilteredList(ENGiveCounterFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}

	public ENGiveCounterShortList getScrollableFilteredList(ENGiveCounter aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENGiveCounterShortList result = new ENGiveCounterShortList();
		ENGiveCounterShort anObject;
		result.list = new Vector<ENGiveCounterShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENGIVECOUNTER.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENGIVECOUNTER.CODE"+
			",ENGIVECOUNTER.COUNTERTYPE"+
			",ENGIVECOUNTER.SERIALNUMBER"+
			",ENGIVECOUNTER.COST"+
			",ENGIVECOUNTER.VAT"+
			",ENGIVECOUNTER.MOLCODE"+
			",ENGIVECOUNTER.MOLNAME"+
			",ENGIVECOUNTER.DATEBUILD"+
			",ENGIVECOUNTER.PHASITY"+
			",ENGIVECOUNTER.COMMENTGEN"+
			", ENPLANWORK2CLASSFCTNTP.CODE " +
			", ENPLANWORK2CLASSFCTNTP.COUNTGEN " +
			", ENPLANWORK2CLASSFCTNTP.USERGEN " +
			", ENPLANWORK2CLASSFCTNTP.DATEEDIT " +
			", ENPLANWORK2CLASSFCTNTP.MACHINEHOURS " +
			", ENPLANWORK2CLASSFCTNTP.RELOCATIONKM " +
			", ENPLANWORK2CLASSFCTNTP.TRANSPORTATIONLOAD " +
			", ENPLANWORK2CLASSFCTNTP.ISPRINTONKMORMH " +
			", ENPLANWORK2CLASSFCTNTP.COSTWORKSCONTRACTOR " +
			", ENPLANWORK2CLASSFCTNTP.DATEGEN " +
			", ENPLANWORK2CLASSFCTNTP.TIMESTART " +
			", ENPLANWORK2CLASSFCTNTP.TIMEFINAL " +
			", ENPLANWORK2CLASSFCTNTP.CODEVIRTUALBRIGADE " +
			", ENPLANWORK2CLASSFCTNTP.ISJOBSBYTIME " +
			", ENPLANWORK2CLASSFCTNTP.ISVISITCLIENT " +
			", ENPLANWORK2CLASSFCTNTP.PRODUCTIONEXPENSSPRCNT " +
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
		" FROM ENGIVECOUNTER " +
			", ENPLANWORK2CLASSFCTNTP " +
			", ENSERVICESOBJECT " +
		"";
		whereStr = " ENPLANWORK2CLASSFCTNTP.CODE = ENGIVECOUNTER.PLAN2CLTYPEREFCODE" ; //+
		whereStr += " AND ENSERVICESOBJECT.CODE = ENGIVECOUNTER.SERVICESOBJECTREFCODE" ; //+


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
				anObject = new ENGiveCounterShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.counterType = set.getString(2);
				anObject.serialNumber = set.getString(3);
				anObject.cost = set.getBigDecimal(4);
				if(anObject.cost != null) {
					anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.vat = set.getBigDecimal(5);
				if(anObject.vat != null) {
					anObject.vat = anObject.vat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.molCode = set.getString(6);
				anObject.molName = set.getString(7);
				anObject.dateBuild = set.getDate(8);
				anObject.phasity = set.getInt(9);
				if ( set.wasNull() ) {
					anObject.phasity = Integer.MIN_VALUE;
				}
				anObject.commentGen = set.getString(10);

				anObject.plan2ClTypeRefCode = set.getInt(11);
				if(set.wasNull()) {
					anObject.plan2ClTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.plan2ClTypeRefCountGen = set.getBigDecimal(12);
				if(anObject.plan2ClTypeRefCountGen != null) {
					anObject.plan2ClTypeRefCountGen = anObject.plan2ClTypeRefCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.plan2ClTypeRefUserGen = set.getString(13);
				anObject.plan2ClTypeRefDateEdit = set.getDate(14);
				anObject.plan2ClTypeRefMachineHours = set.getBigDecimal(15);
				if(anObject.plan2ClTypeRefMachineHours != null) {
					anObject.plan2ClTypeRefMachineHours = anObject.plan2ClTypeRefMachineHours.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.plan2ClTypeRefRelocationKm = set.getBigDecimal(16);
				if(anObject.plan2ClTypeRefRelocationKm != null) {
					anObject.plan2ClTypeRefRelocationKm = anObject.plan2ClTypeRefRelocationKm.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.plan2ClTypeRefTransportationLoad = set.getBigDecimal(17);
				if(anObject.plan2ClTypeRefTransportationLoad != null) {
					anObject.plan2ClTypeRefTransportationLoad = anObject.plan2ClTypeRefTransportationLoad.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.plan2ClTypeRefIsPrintOnKmOrMH = set.getInt(18);
				if(set.wasNull()) {
					anObject.plan2ClTypeRefIsPrintOnKmOrMH = Integer.MIN_VALUE;
				}
				anObject.plan2ClTypeRefCostWorksContractor = set.getBigDecimal(19);
				if(anObject.plan2ClTypeRefCostWorksContractor != null) {
					anObject.plan2ClTypeRefCostWorksContractor = anObject.plan2ClTypeRefCostWorksContractor.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.plan2ClTypeRefDateGen = set.getDate(20);
				anObject.plan2ClTypeRefTimeStart = set.getTimestamp(21);
				anObject.plan2ClTypeRefTimeFinal = set.getTimestamp(22);
				anObject.plan2ClTypeRefCodeVirtualBrigade = set.getInt(23);
				if(set.wasNull()) {
					anObject.plan2ClTypeRefCodeVirtualBrigade = Integer.MIN_VALUE;
				}
				anObject.plan2ClTypeRefIsJobsByTime = set.getInt(24);
				if(set.wasNull()) {
					anObject.plan2ClTypeRefIsJobsByTime = Integer.MIN_VALUE;
				}
				anObject.plan2ClTypeRefIsVisitClient = set.getInt(25);
				if(set.wasNull()) {
					anObject.plan2ClTypeRefIsVisitClient = Integer.MIN_VALUE;
				}
				anObject.plan2ClTypeRefProductionExpensesPercent = set.getBigDecimal(26);
				if(anObject.plan2ClTypeRefProductionExpensesPercent != null) {
					anObject.plan2ClTypeRefProductionExpensesPercent = anObject.plan2ClTypeRefProductionExpensesPercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefCode = set.getInt(27);
				if(set.wasNull()) {
					anObject.servicesObjectRefCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefContractNumber = set.getString(28);
				anObject.servicesObjectRefContractDate = set.getDate(29);
				anObject.servicesObjectRefName = set.getString(30);
				anObject.servicesObjectRefPartnerCode = set.getString(31);
				anObject.servicesObjectRefFinDocCode = set.getString(32);
				anObject.servicesObjectRefFinDocID = set.getInt(33);
				if(set.wasNull()) {
					anObject.servicesObjectRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefCommentGen = set.getString(34);
				anObject.servicesObjectRefContractNumberServices = set.getString(35);
				anObject.servicesObjectRefContractDateServices = set.getDate(36);
				anObject.servicesObjectRefContragentName = set.getString(37);
				anObject.servicesObjectRefContragentAddress = set.getString(38);
				anObject.servicesObjectRefContragentAddressWork = set.getString(39);
				anObject.servicesObjectRefContragentOkpo = set.getString(40);
				anObject.servicesObjectRefContragentBankAccount = set.getString(41);
				anObject.servicesObjectRefContragentBankName = set.getString(42);
				anObject.servicesObjectRefContragentBankMfo = set.getString(43);
				anObject.servicesObjectRefContragentBossName = set.getString(44);
				anObject.servicesObjectRefContragentPassport = set.getString(45);
				anObject.servicesObjectRefContractServicesSumma = set.getBigDecimal(46);
				if(anObject.servicesObjectRefContractServicesSumma != null) {
					anObject.servicesObjectRefContractServicesSumma = anObject.servicesObjectRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.servicesObjectRefContractServicesPower = set.getBigDecimal(48);
				if(anObject.servicesObjectRefContractServicesPower != null) {
					anObject.servicesObjectRefContractServicesPower = anObject.servicesObjectRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefCommentServicesGen = set.getString(49);
				anObject.servicesObjectRefContractServicesDistance = set.getBigDecimal(50);
				if(anObject.servicesObjectRefContractServicesDistance != null) {
					anObject.servicesObjectRefContractServicesDistance = anObject.servicesObjectRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesDay = set.getBigDecimal(51);
				if(anObject.servicesObjectRefContractServicesDay != null) {
					anObject.servicesObjectRefContractServicesDay = anObject.servicesObjectRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefUserGen = set.getString(52);
				anObject.servicesObjectRefDateEdit = set.getDate(53);
				anObject.servicesObjectRefWarrantDate = set.getDate(54);
				anObject.servicesObjectRefWarrantNumber = set.getString(55);
				anObject.servicesObjectRefWarrantFIO = set.getString(56);
				anObject.servicesObjectRefRegionalType = set.getInt(57);
				if(set.wasNull()) {
					anObject.servicesObjectRefRegionalType = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefBasisType = set.getBigDecimal(58);
				if(anObject.servicesObjectRefBasisType != null) {
					anObject.servicesObjectRefBasisType = anObject.servicesObjectRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContragentPosition = set.getString(59);
				anObject.servicesObjectRefExecuteWorkDate = set.getDate(60);
				anObject.servicesObjectRefTimeStart = set.getTimestamp(61);
				anObject.servicesObjectRefTimeFinal = set.getTimestamp(62);
				anObject.servicesObjectRefContragentPhoneNumber = set.getString(63);
				anObject.servicesObjectRefExecutorPhoneNumber = set.getString(64);
				anObject.servicesObjectRefContragentObjectWork = set.getString(65);
				anObject.servicesObjectRefIsNoPay = set.getInt(66);
				if(set.wasNull()) {
					anObject.servicesObjectRefIsNoPay = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefIsCustomerMaterials = set.getInt(67);
				if(set.wasNull()) {
					anObject.servicesObjectRefIsCustomerMaterials = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPayDate = set.getDate(68);
				anObject.servicesObjectRefFinPayFormCode = set.getInt(69);
				if(set.wasNull()) {
					anObject.servicesObjectRefFinPayFormCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefFinPayFormName = set.getString(70);
				anObject.servicesObjectRefPartnerId = set.getInt(71);
				if(set.wasNull()) {
					anObject.servicesObjectRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPayDetail = set.getString(72);
				anObject.servicesObjectRefActTransferNumber = set.getString(73);
				anObject.servicesObjectRefActTransferDate = set.getDate(74);
				anObject.servicesObjectRefResposible = set.getString(75);
				anObject.servicesObjectRefResposiblePosition = set.getString(76);
				anObject.servicesObjectRefResposibleTabNumber = set.getString(77);
				anObject.servicesObjectRefPrevContractStatus = set.getInt(78);
				if(set.wasNull()) {
					anObject.servicesObjectRefPrevContractStatus = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefReconnectionTU = set.getInt(79);
				if(set.wasNull()) {
					anObject.servicesObjectRefReconnectionTU = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPersonalAccountCode = set.getInt(80);
				if(set.wasNull()) {
					anObject.servicesObjectRefPersonalAccountCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPersonalAccountNumber = set.getString(81);
				anObject.servicesObjectRefTabNumber = set.getString(82);
				anObject.servicesObjectRefCitiesList = set.getString(83);
				anObject.servicesObjectRefLineLength = set.getBigDecimal(84);
				if(anObject.servicesObjectRefLineLength != null) {
					anObject.servicesObjectRefLineLength = anObject.servicesObjectRefLineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefProjectCode = set.getString(85);
				anObject.servicesObjectRefCnPackCode = set.getInt(86);
				if(set.wasNull()) {
					anObject.servicesObjectRefCnPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefDfPackCode = set.getInt(87);
				if(set.wasNull()) {
					anObject.servicesObjectRefDfPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefCountersZoneType = set.getInt(88);
				if(set.wasNull()) {
					anObject.servicesObjectRefCountersZoneType = Integer.MIN_VALUE;
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

	public int[] getFilteredCodeArray(ENGiveCounterFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENGiveCounterFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENGiveCounter aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENGIVECOUNTER.CODE FROM ENGIVECOUNTER";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENGIVECOUNTER.CODE";
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


	public ENGiveCounter getObject(int uid) throws PersistenceException {
		ENGiveCounter result = new ENGiveCounter();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENGiveCounter anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENGIVECOUNTER.CODE, ENGIVECOUNTER.COUNTERTYPE, ENGIVECOUNTER.SERIALNUMBER, ENGIVECOUNTER.COST, ENGIVECOUNTER.VAT, ENGIVECOUNTER.MOLCODE, ENGIVECOUNTER.MOLNAME, ENGIVECOUNTER.DATEBUILD, ENGIVECOUNTER.PHASITY, ENGIVECOUNTER.COMMENTGEN, ENGIVECOUNTER.PLAN2CLTYPEREFCODE, ENGIVECOUNTER.SERVICESOBJECTREFCODE "
			+" FROM ENGIVECOUNTER WHERE ENGIVECOUNTER.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);

				anObject.counterType = set.getString(2);
				anObject.serialNumber = set.getString(3);
				anObject.cost = set.getBigDecimal(4);
				if(anObject.cost != null) {
					anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.vat = set.getBigDecimal(5);
				if(anObject.vat != null) {
					anObject.vat = anObject.vat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.molCode = set.getString(6);
				anObject.molName = set.getString(7);
				anObject.dateBuild = set.getDate(8);
				anObject.phasity = set.getInt(9);
				if (set.wasNull()) {
					anObject.phasity = Integer.MIN_VALUE;
				}
				anObject.commentGen = set.getString(10);
				anObject.plan2ClTypeRef.code = set.getInt(11);
				if (set.wasNull()) {
					anObject.plan2ClTypeRef.code = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRef.code = set.getInt(12);
				if (set.wasNull()) {
					anObject.servicesObjectRef.code = Integer.MIN_VALUE;
				}
				if(anObject.plan2ClTypeRef.code != Integer.MIN_VALUE) {
					anObject.setPlan2ClTypeRef(
						new com.ksoe.energynet.dataminer.generated.ENPlanWork2ClassificationTypeDAOGen(connection,getUserProfile()).getRef(anObject.plan2ClTypeRef.code));
				}
				if(anObject.servicesObjectRef.code != Integer.MIN_VALUE) {
					anObject.setServicesObjectRef(
						new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).getRef(anObject.servicesObjectRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENGiveCounterRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENGiveCounterRef ref = new com.ksoe.energynet.valueobject.references.ENGiveCounterRef();
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

		selectStr = "DELETE FROM  ENGIVECOUNTER WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENGiveCounter object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENGiveCounter.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENGiveCounter.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENGiveCounter.remove%} access denied");
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

	public long count(ENGiveCounterFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENGiveCounterFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}

	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENGiveCounterFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENGIVECOUNTER", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENGiveCounterFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENGIVECOUNTER");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENGiveCounter.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENGiveCounter.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENGIVECOUNTER.CODE FROM  ENGIVECOUNTER WHERE  ENGIVECOUNTER.CODE = ?";
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
		_checkConditionToken(condition,"code","ENGIVECOUNTER.CODE");
		_checkConditionToken(condition,"countertype","ENGIVECOUNTER.COUNTERTYPE");
		_checkConditionToken(condition,"serialnumber","ENGIVECOUNTER.SERIALNUMBER");
		_checkConditionToken(condition,"cost","ENGIVECOUNTER.COST");
		_checkConditionToken(condition,"vat","ENGIVECOUNTER.VAT");
		_checkConditionToken(condition,"molcode","ENGIVECOUNTER.MOLCODE");
		_checkConditionToken(condition,"molname","ENGIVECOUNTER.MOLNAME");
		_checkConditionToken(condition,"datebuild","ENGIVECOUNTER.DATEBUILD");
		_checkConditionToken(condition,"phasity","ENGIVECOUNTER.PHASITY");
		_checkConditionToken(condition,"commentgen","ENGIVECOUNTER.COMMENTGEN");
		// relationship conditions
		_checkConditionToken(condition,"plan2cltyperef","PLAN2CLTYPEREFCODE");
		_checkConditionToken(condition,"plan2cltyperef.code","PLAN2CLTYPEREFCODE");
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
	protected static Hashtable<SequenceKey, SequenceValue> _sequenceTable = new Hashtable<SequenceKey, SequenceValue>();

	private void _collectAutoIncrementFields(ENGiveCounter anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENGIVECOUNTER", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENGIVECOUNTER", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENGIVECOUNTER", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENGIVECOUNTER");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENGiveCounterDAO
