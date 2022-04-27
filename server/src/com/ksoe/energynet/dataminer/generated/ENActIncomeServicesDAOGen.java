
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
import com.ksoe.energynet.valueobject.ENActIncomeServices;
import com.ksoe.energynet.valueobject.filter.ENActIncomeServicesFilter;
import com.ksoe.energynet.valueobject.brief.ENActIncomeServicesShort;
import com.ksoe.energynet.valueobject.lists.ENActIncomeServicesShortList;


/**
 * DAO Object for ENActIncomeServices;
 *
 */

public class ENActIncomeServicesDAOGen extends GenericDataMiner {

	public ENActIncomeServicesDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENActIncomeServicesDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENActIncomeServices inObject) throws PersistenceException {
		ENActIncomeServices obj = new ENActIncomeServices();
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

		if(inObject.actDateStart == null && obj.actDateStart == null){} else 
			if(inObject.actDateStart == null || obj.actDateStart == null) return false;
			else
				if (inObject.actDateStart.compareTo(obj.actDateStart) != 0){
					return false;
				}

		if(inObject.actDateEnd == null && obj.actDateEnd == null){} else 
			if(inObject.actDateEnd == null || obj.actDateEnd == null) return false;
			else
				if (inObject.actDateEnd.compareTo(obj.actDateEnd) != 0){
					return false;
				}

		if(inObject.summaGen == null && obj.summaGen == null){}
		else
			if(inObject.summaGen == null || obj.summaGen == null) return false;
			else
				if ( ! inObject.summaGen.equals(obj.summaGen)){
					return false;
				}

		if(inObject.summaVat == null && obj.summaVat == null){}
		else
			if(inObject.summaVat == null || obj.summaVat == null) return false;
			else
				if ( ! inObject.summaVat.equals(obj.summaVat)){
					return false;
				}

		if(inObject.isManualSum == null && obj.isManualSum == null){} else 
			if(inObject.isManualSum == null || obj.isManualSum == null) return false;
			else
				if (inObject.isManualSum.compareTo(obj.isManualSum) != 0){
					return false;
				}

		if(inObject.commentGen == null && obj.commentGen == null){}
		else
			if(inObject.commentGen == null || obj.commentGen == null) return false;
			else
				if ( ! inObject.commentGen.equals(obj.commentGen)){
					return false;
				}

		if(inObject.dateAdd == null && obj.dateAdd == null){} else 
			if(inObject.dateAdd == null || obj.dateAdd == null) return false;
			else
				if (inObject.dateAdd.compareTo(obj.dateAdd) != 0){
					return false;
				}

		if(inObject.dateEdit == null && obj.dateEdit == null){} else 
			if(inObject.dateEdit == null || obj.dateEdit == null) return false;
			else
				if (inObject.dateEdit.compareTo(obj.dateEdit) != 0){
					return false;
				}

		if(inObject.userGen == null && obj.userGen == null){}
		else
			if(inObject.userGen == null || obj.userGen == null) return false;
			else
				if ( ! inObject.userGen.equals(obj.userGen)){
					return false;
				}
		if (inObject.servicesObjectRef.code != obj.servicesObjectRef.code){
			return false;
		}
		if (inObject.statusRef.code != obj.statusRef.code){
			return false;
		}
		if (inObject.warrantAcceptorRef.code != obj.warrantAcceptorRef.code){
			return false;
		}
		if (inObject.warrantExecutorRef.code != obj.warrantExecutorRef.code){
			return false;
		}
		return true;
	}

	public int add(ENActIncomeServices anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENActIncomeServices anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENACTINCOMESERVICES (CODE,NUMBERGEN,DATEGEN,ACTDATESTART,ACTDATEEND,SUMMAGEN,SUMMAVAT,ISMANUALSUM,COMMENTGEN,DATEADD,DATEEDIT,USERGEN,SERVICESOBJECTREFCODE,STATUSREFCODE,WARRANTACCEPTORREFCODE,WARRANTEXECUTORREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

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
			if (anObject.actDateStart == null) {
				statement.setDate(4, null);
			} else {
				statement.setDate(4, new java.sql.Date(anObject.actDateStart.getTime()));
			}
			if (anObject.actDateEnd == null) {
				statement.setDate(5, null);
			} else {
				statement.setDate(5, new java.sql.Date(anObject.actDateEnd.getTime()));
			}
			if (anObject.summaGen != null) {
				anObject.summaGen = anObject.summaGen.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(6, anObject.summaGen);
			if (anObject.summaVat != null) {
				anObject.summaVat = anObject.summaVat.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(7, anObject.summaVat);
			if (anObject.isManualSum != null) {
				statement.setBoolean(8, anObject.isManualSum);
			} else {
				statement.setNull(8, java.sql.Types.BOOLEAN);
			}
			statement.setString(9, anObject.commentGen);
			if (anObject.dateAdd == null) {
				statement.setTimestamp(10, null);
			} else {
				statement.setTimestamp(10, new java.sql.Timestamp(anObject.dateAdd.getTime()));
			}
			if (anObject.dateEdit == null) {
				statement.setTimestamp(11, null);
			} else {
				statement.setTimestamp(11, new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			statement.setString(12, anObject.userGen);
			if (anObject.servicesObjectRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).exists(anObject.servicesObjectRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENActIncomeServices.servicesObjectRef.code%} = {%"+anObject.servicesObjectRef.code+"%}");
				}
				statement.setInt(13,anObject.servicesObjectRef.code);
			} else {
				statement.setNull(13,java.sql.Types.INTEGER);
			}
			if (anObject.statusRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENActIncomeStatusDAOGen(connection,getUserProfile()).exists(anObject.statusRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENActIncomeServices.statusRef.code%} = {%"+anObject.statusRef.code+"%}");
				}
				statement.setInt(14,anObject.statusRef.code);
			} else {
				statement.setNull(14,java.sql.Types.INTEGER);
			}
			if (anObject.warrantAcceptorRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENWarrantDAOGen(connection,getUserProfile()).exists(anObject.warrantAcceptorRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENActIncomeServices.warrantAcceptorRef.code%} = {%"+anObject.warrantAcceptorRef.code+"%}");
				}
				statement.setInt(15,anObject.warrantAcceptorRef.code);
			} else {
				statement.setNull(15,java.sql.Types.INTEGER);
			}
			if (anObject.warrantExecutorRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENWarrantDAOGen(connection,getUserProfile()).exists(anObject.warrantExecutorRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENActIncomeServices.warrantExecutorRef.code%} = {%"+anObject.warrantExecutorRef.code+"%}");
				}
				statement.setInt(16,anObject.warrantExecutorRef.code);
			} else {
				statement.setNull(16,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENActIncomeServicesDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENActIncomeServices anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENActIncomeServices anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("ACTDATESTART") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACTDATEEND") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SUMMAGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SUMMAVAT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ISMANUALSUM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COMMENTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEADD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEEDIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USERGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SERVICESOBJECTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("STATUSREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("WARRANTACCEPTORREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("WARRANTEXECUTORREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENACTINCOMESERVICES SET  NUMBERGEN = ? , DATEGEN = ? , ACTDATESTART = ? , ACTDATEEND = ? , SUMMAGEN = ? , SUMMAVAT = ? , ISMANUALSUM = ? , COMMENTGEN = ? , DATEADD = ? , DATEEDIT = ? , USERGEN = ? , SERVICESOBJECTREFCODE = ? , STATUSREFCODE = ? , WARRANTACCEPTORREFCODE = ? , WARRANTEXECUTORREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENACTINCOMESERVICES SET ";
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
					if (anObject.actDateStart == null) {
						statement.setDate(3, null);
					} else {
						statement.setDate(3, new java.sql.Date(anObject.actDateStart.getTime()));
					}
					if (anObject.actDateEnd == null) {
						statement.setDate(4, null);
					} else {
						statement.setDate(4, new java.sql.Date(anObject.actDateEnd.getTime()));
					}
					if (anObject.summaGen != null) {
						anObject.summaGen = anObject.summaGen.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(5, anObject.summaGen);
					if (anObject.summaVat != null) {
						anObject.summaVat = anObject.summaVat.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(6, anObject.summaVat);
					if (anObject.isManualSum == null) {
						statement.setNull(7, java.sql.Types.BOOLEAN);
					} else {
						statement.setBoolean(7, anObject.isManualSum);
					}
					statement.setString(8, anObject.commentGen);
					if (anObject.dateAdd == null) {
						statement.setTimestamp(9, null);
					} else {
						statement.setTimestamp(9, new java.sql.Timestamp(anObject.dateAdd.getTime()));
					}
					if (anObject.dateEdit == null) {
						statement.setTimestamp(10, null);
					} else {
						statement.setTimestamp(10, new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					statement.setString(11, anObject.userGen);
					if (anObject.servicesObjectRef.code != Integer.MIN_VALUE) {
						statement.setInt(12, anObject.servicesObjectRef.code);
					} else {
						statement.setNull(12, java.sql.Types.INTEGER);
					}
					if (anObject.statusRef.code != Integer.MIN_VALUE) {
						statement.setInt(13, anObject.statusRef.code);
					} else {
						statement.setNull(13, java.sql.Types.INTEGER);
					}
					if (anObject.warrantAcceptorRef.code != Integer.MIN_VALUE) {
						statement.setInt(14, anObject.warrantAcceptorRef.code);
					} else {
						statement.setNull(14, java.sql.Types.INTEGER);
					}
					if (anObject.warrantExecutorRef.code != Integer.MIN_VALUE) {
						statement.setInt(15, anObject.warrantExecutorRef.code);
					} else {
						statement.setNull(15, java.sql.Types.INTEGER);
					}
					statement.setInt(16, anObject.code);
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
						if("ACTDATESTART".compareTo((String)fields.get(i)) == 0) {
							if (anObject.actDateStart == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.actDateStart.getTime()));
							}
							continue;
						}
						if("ACTDATEEND".compareTo((String)fields.get(i)) == 0) {
							if (anObject.actDateEnd == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.actDateEnd.getTime()));
							}
							continue;
						}
						if("SUMMAGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.summaGen != null) {
								anObject.summaGen = anObject.summaGen.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.summaGen);
							continue;
						}
						if("SUMMAVAT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.summaVat != null) {
								anObject.summaVat = anObject.summaVat.setScale(6, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.summaVat);
							continue;
						}
						if("ISMANUALSUM".compareTo((String)fields.get(i)) == 0) {
								statement.setBoolean(i+1, anObject.isManualSum);
							continue;
						}
						if("COMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.commentGen);
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
						if("DATEEDIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateEdit == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1, new java.sql.Timestamp(anObject.dateEdit.getTime()));
							}
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.userGen);
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
						if("STATUSREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.statusRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.statusRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("WARRANTACCEPTORREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.warrantAcceptorRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.warrantAcceptorRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("WARRANTEXECUTORREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.warrantExecutorRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.warrantExecutorRef.code);
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

	} // end of save(ENActIncomeServices anObject,String[] anAttributes)


	public ENActIncomeServicesShort getShortObject(int anObjectCode) throws PersistenceException {
		ENActIncomeServices filterObject = new ENActIncomeServices();
		Vector<ENActIncomeServicesShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENActIncomeServicesShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENActIncomeServices filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.numberGen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateGen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.actDateStart, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.actDateEnd, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.summaGen, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.summaVat, index, statement);
			index = BaseDAOUtils.setBooleanParameter(filter.isManualSum, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateAdd, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.servicesObjectRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.statusRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.warrantAcceptorRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.warrantExecutorRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENActIncomeServicesFilter filter) {
		String out = buildCondition((ENActIncomeServices)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENActIncomeServices filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENActIncomeServices.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.numberGen, ENActIncomeServices.numberGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateGen, ENActIncomeServices.dateGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.actDateStart, ENActIncomeServices.actDateStart_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.actDateEnd, ENActIncomeServices.actDateEnd_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.summaGen, ENActIncomeServices.summaGen_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.summaVat, ENActIncomeServices.summaVat_QFielld, out);
			out = BaseDAOUtils.addBooleanToCondition(filter.isManualSum, ENActIncomeServices.isManualSum_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentGen, ENActIncomeServices.commentGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateAdd, ENActIncomeServices.dateAdd_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENActIncomeServices.dateEdit_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENActIncomeServices.userGen_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.servicesObjectRef.code, ENActIncomeServices.servicesObjectRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.statusRef.code, ENActIncomeServices.statusRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.warrantAcceptorRef.code, ENActIncomeServices.warrantAcceptorRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.warrantExecutorRef.code, ENActIncomeServices.warrantExecutorRef_QFielld, out);
		}
		return out;
	}

	public ENActIncomeServicesShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENActIncomeServicesShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENActIncomeServicesShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENActIncomeServicesShortList getFilteredList(ENActIncomeServices filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENActIncomeServicesShortList getScrollableFilteredList(ENActIncomeServices aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENActIncomeServicesShortList getScrollableFilteredList(ENActIncomeServices aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENActIncomeServicesShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENActIncomeServicesShortList getScrollableFilteredList(ENActIncomeServicesFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENActIncomeServicesShortList getScrollableFilteredList(ENActIncomeServicesFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENActIncomeServicesShortList getScrollableFilteredList(ENActIncomeServices aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENActIncomeServicesShortList result = new ENActIncomeServicesShortList();
		ENActIncomeServicesShort anObject;
		result.list = new Vector<ENActIncomeServicesShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENACTINCOMESERVICES.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENACTINCOMESERVICES.CODE"+
			",ENACTINCOMESERVICES.NUMBERGEN"+
			",ENACTINCOMESERVICES.DATEGEN"+
			",ENACTINCOMESERVICES.ACTDATESTART"+
			",ENACTINCOMESERVICES.ACTDATEEND"+
			",ENACTINCOMESERVICES.SUMMAGEN"+
			",ENACTINCOMESERVICES.SUMMAVAT"+
			",ENACTINCOMESERVICES.DATEADD"+
			",ENACTINCOMESERVICES.DATEEDIT"+
			",ENACTINCOMESERVICES.USERGEN"+
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
			", ENACTINCOMESTATUS.CODE " +
			", ENACTINCOMESTATUS.NAME " +
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
		" FROM ENACTINCOMESERVICES " +
			" LEFT JOIN ENSERVICESOBJECT on ENSERVICESOBJECT.CODE = ENACTINCOMESERVICES.SERVICESOBJECTREFCODE "+
			" LEFT JOIN ENACTINCOMESTATUS on ENACTINCOMESTATUS.CODE = ENACTINCOMESERVICES.STATUSREFCODE "+
			" LEFT JOIN ENWARRANT on ENWARRANT.CODE = ENACTINCOMESERVICES.WARRANTACCEPTORREFCODE "+
			" LEFT JOIN ENWARRANT on ENWARRANT.CODE = ENACTINCOMESERVICES.WARRANTEXECUTORREFCODE "+
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
				anObject = new ENActIncomeServicesShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.numberGen = set.getString(2);
				anObject.dateGen = set.getDate(3);
				anObject.actDateStart = set.getDate(4);
				anObject.actDateEnd = set.getDate(5);
				anObject.summaGen = set.getBigDecimal(6);
				if(anObject.summaGen != null) {
					anObject.summaGen = anObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.summaVat = set.getBigDecimal(7);
				if(anObject.summaVat != null) {
					anObject.summaVat = anObject.summaVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.dateAdd = set.getTimestamp(8);
				anObject.dateEdit = set.getTimestamp(9);
				anObject.userGen = set.getString(10);

				anObject.servicesObjectRefCode = set.getInt(11);
				if(set.wasNull()) {
					anObject.servicesObjectRefCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefContractNumber = set.getString(12);
				anObject.servicesObjectRefContractDate = set.getDate(13);
				anObject.servicesObjectRefName = set.getString(14);
				anObject.servicesObjectRefPartnerCode = set.getString(15);
				anObject.servicesObjectRefFinDocCode = set.getString(16);
				anObject.servicesObjectRefFinDocID = set.getInt(17);
				if(set.wasNull()) {
					anObject.servicesObjectRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefCommentGen = set.getString(18);
				anObject.servicesObjectRefContractNumberServices = set.getString(19);
				anObject.servicesObjectRefContractDateServices = set.getDate(20);
				anObject.servicesObjectRefContragentName = set.getString(21);
				anObject.servicesObjectRefContragentAddress = set.getString(22);
				anObject.servicesObjectRefContragentAddressWork = set.getString(23);
				anObject.servicesObjectRefContragentOkpo = set.getString(24);
				anObject.servicesObjectRefContragentBankAccount = set.getString(25);
				anObject.servicesObjectRefContragentBankName = set.getString(26);
				anObject.servicesObjectRefContragentBankMfo = set.getString(27);
				anObject.servicesObjectRefContragentBossName = set.getString(28);
				anObject.servicesObjectRefContragentPassport = set.getString(29);
				anObject.servicesObjectRefContractServicesSumma = set.getBigDecimal(30);
				if(anObject.servicesObjectRefContractServicesSumma != null) {
					anObject.servicesObjectRefContractServicesSumma = anObject.servicesObjectRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesSummaVAT = set.getBigDecimal(31);
				if(anObject.servicesObjectRefContractServicesSummaVAT != null) {
					anObject.servicesObjectRefContractServicesSummaVAT = anObject.servicesObjectRefContractServicesSummaVAT.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesPower = set.getBigDecimal(32);
				if(anObject.servicesObjectRefContractServicesPower != null) {
					anObject.servicesObjectRefContractServicesPower = anObject.servicesObjectRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefCommentServicesGen = set.getString(33);
				anObject.servicesObjectRefContractServicesDistance = set.getBigDecimal(34);
				if(anObject.servicesObjectRefContractServicesDistance != null) {
					anObject.servicesObjectRefContractServicesDistance = anObject.servicesObjectRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesDay = set.getBigDecimal(35);
				if(anObject.servicesObjectRefContractServicesDay != null) {
					anObject.servicesObjectRefContractServicesDay = anObject.servicesObjectRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefUserGen = set.getString(36);
				anObject.servicesObjectRefDateEdit = set.getDate(37);
				anObject.servicesObjectRefWarrantDate = set.getDate(38);
				anObject.servicesObjectRefWarrantNumber = set.getString(39);
				anObject.servicesObjectRefWarrantFIO = set.getString(40);
				anObject.servicesObjectRefRegionalType = set.getInt(41);
				if(set.wasNull()) {
					anObject.servicesObjectRefRegionalType = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefBasisType = set.getBigDecimal(42);
				if(anObject.servicesObjectRefBasisType != null) {
					anObject.servicesObjectRefBasisType = anObject.servicesObjectRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContragentPosition = set.getString(43);
				anObject.servicesObjectRefExecuteWorkDate = set.getDate(44);
				anObject.servicesObjectRefTimeStart = set.getTimestamp(45);
				anObject.servicesObjectRefTimeFinal = set.getTimestamp(46);
				anObject.servicesObjectRefContragentPhoneNumber = set.getString(47);
				anObject.servicesObjectRefExecutorPhoneNumber = set.getString(48);
				anObject.servicesObjectRefContragentObjectWork = set.getString(49);
				anObject.servicesObjectRefIsNoPay = set.getInt(50);
				if(set.wasNull()) {
					anObject.servicesObjectRefIsNoPay = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefIsCustomerMaterials = set.getInt(51);
				if(set.wasNull()) {
					anObject.servicesObjectRefIsCustomerMaterials = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPayDate = set.getDate(52);
				anObject.servicesObjectRefFinPayFormCode = set.getInt(53);
				if(set.wasNull()) {
					anObject.servicesObjectRefFinPayFormCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefFinPayFormName = set.getString(54);
				anObject.servicesObjectRefPartnerId = set.getInt(55);
				if(set.wasNull()) {
					anObject.servicesObjectRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPayDetail = set.getString(56);
				anObject.servicesObjectRefActTransferNumber = set.getString(57);
				anObject.servicesObjectRefActTransferDate = set.getDate(58);
				anObject.servicesObjectRefResposible = set.getString(59);
				anObject.servicesObjectRefResposiblePosition = set.getString(60);
				anObject.servicesObjectRefResposibleTabNumber = set.getString(61);
				anObject.servicesObjectRefPrevContractStatus = set.getInt(62);
				if(set.wasNull()) {
					anObject.servicesObjectRefPrevContractStatus = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefReconnectionTU = set.getInt(63);
				if(set.wasNull()) {
					anObject.servicesObjectRefReconnectionTU = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPersonalAccountCode = set.getInt(64);
				if(set.wasNull()) {
					anObject.servicesObjectRefPersonalAccountCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPersonalAccountNumber = set.getString(65);
				anObject.servicesObjectRefTabNumber = set.getString(66);
				anObject.servicesObjectRefCitiesList = set.getString(67);
				anObject.servicesObjectRefLineLength = set.getBigDecimal(68);
				if(anObject.servicesObjectRefLineLength != null) {
					anObject.servicesObjectRefLineLength = anObject.servicesObjectRefLineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefProjectCode = set.getString(69);
				anObject.servicesObjectRefCnPackCode = set.getInt(70);
				if(set.wasNull()) {
					anObject.servicesObjectRefCnPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefDfPackCode = set.getInt(71);
				if(set.wasNull()) {
					anObject.servicesObjectRefDfPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefCountersZoneType = set.getInt(72);
				if(set.wasNull()) {
					anObject.servicesObjectRefCountersZoneType = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefAxPartnerCode = set.getString(73);
				anObject.servicesObjectRefAxPartnerName = set.getString(74);
				anObject.servicesObjectRefAxContractNumber = set.getString(75);
				anObject.servicesObjectRefAxContractDate = set.getDate(76);
				anObject.servicesObjectRefAxContractCode = set.getString(77);
				anObject.servicesObjectRefAxContractId = set.getString(78);
				anObject.servicesObjectRefAxContractCommentGen = set.getString(79);
				anObject.servicesObjectRefProjAgreeSumma = set.getBigDecimal(80);
				if(anObject.servicesObjectRefProjAgreeSumma != null) {
					anObject.servicesObjectRefProjAgreeSumma = anObject.servicesObjectRefProjAgreeSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefTopographySumma = set.getBigDecimal(81);
				if(anObject.servicesObjectRefTopographySumma != null) {
					anObject.servicesObjectRefTopographySumma = anObject.servicesObjectRefTopographySumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefCreatedFromSite = set.getInt(82);
				if(set.wasNull()) {
					anObject.servicesObjectRefCreatedFromSite = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefTerm = set.getInt(83);
				if(set.wasNull()) {
					anObject.servicesObjectRefTerm = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefRegulation = set.getInt(84);
				if(set.wasNull()) {
					anObject.servicesObjectRefRegulation = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefBoundaryDateWork = set.getDate(85);
				anObject.servicesObjectRefCountDayDelay = set.getInt(86);
				if(set.wasNull()) {
					anObject.servicesObjectRefCountDayDelay = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefFactDateWork = set.getDate(87);
				/*anObject.servicesObjectRefCodeEIC = set.getString(88);
				anObject.servicesObjectRefPersonalAccountUid = set.getString(89);
				anObject.statusRefCode = set.getInt(90);
				if(set.wasNull()) {
					anObject.statusRefCode = Integer.MIN_VALUE;
				}
				anObject.statusRefName = set.getString(91);
				anObject.warrantAcceptorRefCode = set.getInt(92);
				if(set.wasNull()) {
					anObject.warrantAcceptorRefCode = Integer.MIN_VALUE;
				}
				anObject.warrantAcceptorRefNumbergen = set.getString(93);
				anObject.warrantAcceptorRefName = set.getString(94);
				anObject.warrantAcceptorRefWarrantFIO = set.getString(95);
				anObject.warrantAcceptorRefWarrantShortFIO = set.getString(96);
				anObject.warrantAcceptorRefWarrantPosition = set.getString(97);
				anObject.warrantAcceptorRefGenitiveFIO = set.getString(98);
				anObject.warrantAcceptorRefGenitivePosition = set.getString(99);
				anObject.warrantAcceptorRefPassport = set.getString(100);
				anObject.warrantAcceptorRefAddress = set.getString(101);
				anObject.warrantAcceptorRefPower = set.getInt(102);
				if(set.wasNull()) {
					anObject.warrantAcceptorRefPower = Integer.MIN_VALUE;
				}
				anObject.warrantAcceptorRefMaxSum = set.getBigDecimal(103);
				if(anObject.warrantAcceptorRefMaxSum != null) {
					anObject.warrantAcceptorRefMaxSum = anObject.warrantAcceptorRefMaxSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.warrantExecutorRefCode = set.getInt(104);
				if(set.wasNull()) {
					anObject.warrantExecutorRefCode = Integer.MIN_VALUE;
				}
				anObject.warrantExecutorRefNumbergen = set.getString(105);
				anObject.warrantExecutorRefName = set.getString(106);
				anObject.warrantExecutorRefWarrantFIO = set.getString(107);
				anObject.warrantExecutorRefWarrantShortFIO = set.getString(108);
				anObject.warrantExecutorRefWarrantPosition = set.getString(109);
				anObject.warrantExecutorRefGenitiveFIO = set.getString(110);
				anObject.warrantExecutorRefGenitivePosition = set.getString(111);
				anObject.warrantExecutorRefPassport = set.getString(112);
				anObject.warrantExecutorRefAddress = set.getString(113);
				anObject.warrantExecutorRefPower = set.getInt(114);
				if(set.wasNull()) {
					anObject.warrantExecutorRefPower = Integer.MIN_VALUE;
				}
				anObject.warrantExecutorRefMaxSum = set.getBigDecimal(115);
				if(anObject.warrantExecutorRefMaxSum != null) {
					anObject.warrantExecutorRefMaxSum = anObject.warrantExecutorRefMaxSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}*/

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
	
	public int[] getFilteredCodeArray(ENActIncomeServicesFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENActIncomeServicesFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENActIncomeServices aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENACTINCOMESERVICES.CODE FROM ENACTINCOMESERVICES";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENACTINCOMESERVICES.CODE";
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


	public ENActIncomeServices getObject(int uid) throws PersistenceException {
		ENActIncomeServices result = new ENActIncomeServices();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENActIncomeServices anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENACTINCOMESERVICES.CODE, ENACTINCOMESERVICES.NUMBERGEN, ENACTINCOMESERVICES.DATEGEN, ENACTINCOMESERVICES.ACTDATESTART, ENACTINCOMESERVICES.ACTDATEEND, ENACTINCOMESERVICES.SUMMAGEN, ENACTINCOMESERVICES.SUMMAVAT, ENACTINCOMESERVICES.ISMANUALSUM, ENACTINCOMESERVICES.COMMENTGEN, ENACTINCOMESERVICES.DATEADD, ENACTINCOMESERVICES.DATEEDIT, ENACTINCOMESERVICES.USERGEN, ENACTINCOMESERVICES.SERVICESOBJECTREFCODE, ENACTINCOMESERVICES.STATUSREFCODE, ENACTINCOMESERVICES.WARRANTACCEPTORREFCODE, ENACTINCOMESERVICES.WARRANTEXECUTORREFCODE "
			+" FROM ENACTINCOMESERVICES WHERE ENACTINCOMESERVICES.CODE = ?";


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
				anObject.actDateStart = set.getDate(4);
				anObject.actDateEnd = set.getDate(5);
				anObject.summaGen = set.getBigDecimal(6);
				if(anObject.summaGen != null) {
					anObject.summaGen = anObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.summaVat = set.getBigDecimal(7);
				if(anObject.summaVat != null) {
					anObject.summaVat = anObject.summaVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.isManualSum = set.getBoolean(8);
				if (set.wasNull()) {
					anObject.isManualSum = null;
				}
				anObject.commentGen = set.getString(9);
				anObject.dateAdd = set.getTimestamp(10);
				anObject.dateEdit = set.getTimestamp(11);
				anObject.userGen = set.getString(12);
				anObject.servicesObjectRef.code = set.getInt(13);
				if (set.wasNull()) {
					anObject.servicesObjectRef.code = Integer.MIN_VALUE;
				}
				anObject.statusRef.code = set.getInt(14);
				if (set.wasNull()) {
					anObject.statusRef.code = Integer.MIN_VALUE;
				}
				anObject.warrantAcceptorRef.code = set.getInt(15);
				if (set.wasNull()) {
					anObject.warrantAcceptorRef.code = Integer.MIN_VALUE;
				}
				anObject.warrantExecutorRef.code = set.getInt(16);
				if (set.wasNull()) {
					anObject.warrantExecutorRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENActIncomeServicesRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENActIncomeServicesRef ref = new com.ksoe.energynet.valueobject.references.ENActIncomeServicesRef();
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

		selectStr = "DELETE FROM  ENACTINCOMESERVICES WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENActIncomeServices object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENActIncomeServices.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENActIncomeServices.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENActIncomeServices.remove%} access denied");
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
	
	public long count(ENActIncomeServicesFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENActIncomeServicesFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENActIncomeServicesFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENACTINCOMESERVICES", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENACTINCOMESERVICES WHERE code = ?", propertyName);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENActIncomeServicesFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENACTINCOMESERVICES");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENActIncomeServices.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENActIncomeServices.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENACTINCOMESERVICES.CODE FROM  ENACTINCOMESERVICES WHERE  ENACTINCOMESERVICES.CODE = ?";
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
		_checkConditionToken(condition,"code","ENACTINCOMESERVICES.CODE");
		_checkConditionToken(condition,"numbergen","ENACTINCOMESERVICES.NUMBERGEN");
		_checkConditionToken(condition,"dategen","ENACTINCOMESERVICES.DATEGEN");
		_checkConditionToken(condition,"actdatestart","ENACTINCOMESERVICES.ACTDATESTART");
		_checkConditionToken(condition,"actdateend","ENACTINCOMESERVICES.ACTDATEEND");
		_checkConditionToken(condition,"summagen","ENACTINCOMESERVICES.SUMMAGEN");
		_checkConditionToken(condition,"summavat","ENACTINCOMESERVICES.SUMMAVAT");
		_checkConditionToken(condition,"ismanualsum","ENACTINCOMESERVICES.ISMANUALSUM");
		_checkConditionToken(condition,"commentgen","ENACTINCOMESERVICES.COMMENTGEN");
		_checkConditionToken(condition,"dateadd","ENACTINCOMESERVICES.DATEADD");
		_checkConditionToken(condition,"dateedit","ENACTINCOMESERVICES.DATEEDIT");
		_checkConditionToken(condition,"usergen","ENACTINCOMESERVICES.USERGEN");
		// relationship conditions
		_checkConditionToken(condition,"servicesobjectref","SERVICESOBJECTREFCODE");
		_checkConditionToken(condition,"servicesobjectref.code","SERVICESOBJECTREFCODE");
		_checkConditionToken(condition,"statusref","STATUSREFCODE");
		_checkConditionToken(condition,"statusref.code","STATUSREFCODE");
		_checkConditionToken(condition,"warrantacceptorref","WARRANTACCEPTORREFCODE");
		_checkConditionToken(condition,"warrantacceptorref.code","WARRANTACCEPTORREFCODE");
		_checkConditionToken(condition,"warrantexecutorref","WARRANTEXECUTORREFCODE");
		_checkConditionToken(condition,"warrantexecutorref.code","WARRANTEXECUTORREFCODE");
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
	
	private void _collectAutoIncrementFields(ENActIncomeServices anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENACTINCOMESERVICES", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENACTINCOMESERVICES", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENACTINCOMESERVICES", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENACTINCOMESERVICES");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENActIncomeServicesDAO
