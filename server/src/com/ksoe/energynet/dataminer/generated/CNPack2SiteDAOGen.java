
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
import com.ksoe.energynet.valueobject.CNPack2Site;
import com.ksoe.energynet.valueobject.filter.CNPack2SiteFilter;
import com.ksoe.energynet.valueobject.brief.CNPack2SiteShort;
import com.ksoe.energynet.valueobject.lists.CNPack2SiteShortList;


/**
 * DAO Object for CNPack2Site;
 *
 */

public class CNPack2SiteDAOGen extends GenericDataMiner {

	public CNPack2SiteDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public CNPack2SiteDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(CNPack2Site inObject) throws PersistenceException {
		CNPack2Site obj = new CNPack2Site();
		obj.code = inObject.code;
		loadObject(obj);

		if (inObject.is_reg != obj.is_reg){
					return false;
				}

		if(inObject.customeremail == null && obj.customeremail == null){}
		else
			if(inObject.customeremail == null || obj.customeremail == null) return false;
			else
				if ( ! inObject.customeremail.equals(obj.customeremail)){
					return false;
				}

		if(inObject.phone == null && obj.phone == null){}
		else
			if(inObject.phone == null || obj.phone == null) return false;
			else
				if ( ! inObject.phone.equals(obj.phone)){
					return false;
				}

		if (inObject.customertype != obj.customertype){
					return false;
				}
		if (inObject.subsystemRef.code != obj.subsystemRef.code){
			return false;
		}
		if (inObject.cnPackRef.code != obj.cnPackRef.code){
			return false;
		}
		return true;
	}

	public int add(CNPack2Site anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(CNPack2Site anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO CNPACK2SITE (CODE,IS_REG,CUSTOMEREMAIL,PHONE,CUSTOMERTYPE,SUBSYSTEMREFCODE,CNPACKREFCODE) VALUES (?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.is_reg != Integer.MIN_VALUE ) {
				statement.setInt(2,anObject.is_reg);
			} else {
				statement.setNull(2,java.sql.Types.INTEGER);
			}
			statement.setString(3,anObject.customeremail);
			statement.setString(4,anObject.phone);
			if (anObject.customertype != Integer.MIN_VALUE ) {
				statement.setInt(5,anObject.customertype);
			} else {
				statement.setNull(5,java.sql.Types.INTEGER);
			}
			if (anObject.subsystemRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.CNSubsystemTypeDAOGen(connection,getUserProfile()).exists(anObject.subsystemRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.CNPack2Site.subsystemRef.code%} = {%"+anObject.subsystemRef.code+"%}");
				}
				statement.setInt(6,anObject.subsystemRef.code);
			} else {
				statement.setNull(6,java.sql.Types.INTEGER);
			}
			if (anObject.cnPackRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.CNPackDAOGen(connection,getUserProfile()).exists(anObject.cnPackRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.CNPack2Site.cnPackRef.code%} = {%"+anObject.cnPackRef.code+"%}");
				}
				statement.setInt(7,anObject.cnPackRef.code);
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
			throw new PersistenceException("Error in method {%CNPack2SiteDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(CNPack2Site anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(CNPack2Site anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("IS_REG") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CUSTOMEREMAIL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PHONE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CUSTOMERTYPE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SUBSYSTEMREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CNPACKREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE CNPACK2SITE SET  IS_REG = ? , CUSTOMEREMAIL = ? , PHONE = ? , CUSTOMERTYPE = ? , SUBSYSTEMREFCODE = ? , CNPACKREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE CNPACK2SITE SET ";
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
					if (anObject.is_reg != Integer.MIN_VALUE) {
						statement.setInt(1,anObject.is_reg);
					} else {
						statement.setNull(1,java.sql.Types.INTEGER);
					}
					statement.setString(2,anObject.customeremail);
					statement.setString(3,anObject.phone);
					if (anObject.customertype != Integer.MIN_VALUE) {
						statement.setInt(4,anObject.customertype);
					} else {
						statement.setNull(4,java.sql.Types.INTEGER);
					}
					if (anObject.subsystemRef.code != Integer.MIN_VALUE) {
						statement.setInt(5,anObject.subsystemRef.code);
					} else {
						statement.setNull(5,java.sql.Types.INTEGER);
					}
					if (anObject.cnPackRef.code != Integer.MIN_VALUE) {
						statement.setInt(6,anObject.cnPackRef.code);
					} else {
						statement.setNull(6,java.sql.Types.INTEGER);
					}
					statement.setInt(7,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("IS_REG".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.is_reg);
							continue;
						}
						if("CUSTOMEREMAIL".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.customeremail);
							continue;
						}
						if("PHONE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.phone);
							continue;
						}
						if("CUSTOMERTYPE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.customertype);
							continue;
						}
						if("SUBSYSTEMREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.subsystemRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.subsystemRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("CNPACKREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.cnPackRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.cnPackRef.code);
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

	} // end of save(CNPack2Site anObject,String[] anAttributes)


	public CNPack2SiteShort getShortObject(int anObjectCode) throws PersistenceException {
		CNPack2Site filterObject = new CNPack2Site();
		Vector<CNPack2SiteShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (CNPack2SiteShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(CNPack2Site filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.is_reg, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.customeremail, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.phone, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.customertype, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.subsystemRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.cnPackRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(CNPack2SiteFilter filter) {
		String out = buildCondition((CNPack2Site)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(CNPack2Site filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, CNPack2Site.code_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.is_reg, CNPack2Site.is_reg_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.customeremail, CNPack2Site.customeremail_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.phone, CNPack2Site.phone_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.customertype, CNPack2Site.customertype_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.subsystemRef.code, CNPack2Site.subsystemRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.cnPackRef.code, CNPack2Site.cnPackRef_QFielld, out);
		}
		return out;
	}

	public CNPack2SiteShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public CNPack2SiteShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public CNPack2SiteShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public CNPack2SiteShortList getFilteredList(CNPack2Site filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public CNPack2SiteShortList getScrollableFilteredList(CNPack2Site aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public CNPack2SiteShortList getScrollableFilteredList(CNPack2Site aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public CNPack2SiteShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public CNPack2SiteShortList getScrollableFilteredList(CNPack2SiteFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public CNPack2SiteShortList getScrollableFilteredList(CNPack2SiteFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public CNPack2SiteShortList getScrollableFilteredList(CNPack2Site aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		CNPack2SiteShortList result = new CNPack2SiteShortList();
		CNPack2SiteShort anObject;
		result.list = new Vector<CNPack2SiteShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "CNPACK2SITE.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"CNPACK2SITE.CODE"+
			",CNPACK2SITE.IS_REG"+
			",CNPACK2SITE.CUSTOMEREMAIL"+
			",CNPACK2SITE.PHONE"+
			",CNPACK2SITE.CUSTOMERTYPE"+
			", CNSUBSYSTEMTYPE.CODE " +
			", CNSUBSYSTEMTYPE.NAME " +
			", CNPACK.CODE " +
			", CNPACK.PACKCODE " +
			", CNPACK.NAME " +
			", CNPACK.ID_REN " +
			", CNPACK.RENNAME " +
			", CNPACK.ID_DISTRICT " +
			", CNPACK.DISTRICTNAME " +
			", CNPACK.ID_CHILD_DISTRICT " +
			", CNPACK.CHILDDISTRICTNAME " +
			", CNPACK.ID_PACK_STATUS " +
			", CNPACK.STATUSNAME " +
			", CNPACK.DESCRIPTION " +
			", CNPACK.POWER " +
			", CNPACK.ADDRESS " +
			", CNPACK.ADDRESS_JUR " +
			", CNPACK.REG_NUM_CN_CONTRACT " +
			", CNPACK.DATE_CN_CONTRACT " +
			", CNPACK.REG_NUM_SPL_PP_CONTRCT " +
			", CNPACK.DATE_SPL_PP_CONTRACT " +
			", CNPACK.REG_NUM_TU_CONTRACT " +
			", CNPACK.DATE_TU_CONTRACT " +
			", CNPACK.REG_NUM_TU_CR_CONTRACT " +
			", CNPACK.DATE_TU_CR_CONTRACT " +
			", CNPACK.PROJECT_NUM " +
			", CNPACK.PROJECT_DATE " +
			", CNPACK.OVER5 " +
			", CNPACK.STATUS " +
			", CNPACK.LETTER_NUM_CUSTOMER " +
			", CNPACK.DATE_LETTER_CUSTOMER " +
			", CNPACK.LETTER_NUM " +
			", CNPACK.DATE_LETTER " +
			", CNPACK.RELIABILITY_CLASS " +
			", CNPACK.ID_WAITING_STATUS " +
			", CNPACK.WAITINGSTATUS " +
			", CNPACK.IS_PAYABLE " +
			", CNPACK.WORKSIZE " +
			", CNPACK.WORK_INC_NET " +
			", CNPACK.BUSINESS_TYPE " +
			", CNPACK.ESTIMATETERM " +
			", CNPACK.ESTIMATEDATE " +
			", CNPACK.BUILDINGTERM " +
			", CNPACK.BUILDINGDATE " +
			", CNPACK.BUYINGTERM " +
			", CNPACK.BUYINGDATE " +
			", CNPACK.ESTIMATE_NUM " +
			", CNPACK.ESTIMATE_CONTRACT_DATE " +
			", CNPACK.IS_RESERV " +
			", CNPACK.PURPOSE " +
			", CNPACK.IS_KSOE " +
			", CNPACK.OVER150 " +
			", CNPACK.IS_NEW " +
			", CNPACK.IS3PHASES " +
			", CNPACK.AGREE_CHANGES " +
			", CNPACK.DATE_END_ORDER_SPL " +
			", CNPACK.COPMANY_PROTOCOL " +
			", CNPACK.ID_FEATURE " +
			", CNPACK.ID_STATE " +
			", CNPACK.ID_BP " +
			", CNPACK.ID_PARENT " +
		" FROM CNPACK2SITE " +
			", CNSUBSYSTEMTYPE " +
			", CNPACK " +
		"";
		whereStr = " CNSUBSYSTEMTYPE.CODE = CNPACK2SITE.SUBSYSTEMREFCODE" ; //+
		whereStr += " AND CNPACK.CODE = CNPACK2SITE.CNPACKREFCODE" ; //+

	
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
				anObject = new CNPack2SiteShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.is_reg = set.getInt(2);
				if ( set.wasNull() ) {
					anObject.is_reg = Integer.MIN_VALUE;
				}
				anObject.customeremail = set.getString(3);
				anObject.phone = set.getString(4);
				anObject.customertype = set.getInt(5);
				if ( set.wasNull() ) {
					anObject.customertype = Integer.MIN_VALUE;
				}

				anObject.subsystemRefCode = set.getInt(6);
				if(set.wasNull()) {
					anObject.subsystemRefCode = Integer.MIN_VALUE;
				}
				anObject.subsystemRefName = set.getString(7);
				anObject.cnPackRefCode = set.getInt(8);
				if(set.wasNull()) {
					anObject.cnPackRefCode = Integer.MIN_VALUE;
				}
				anObject.cnPackRefPackCode = set.getInt(9);
				if(set.wasNull()) {
					anObject.cnPackRefPackCode = Integer.MIN_VALUE;
				}
				anObject.cnPackRefName = set.getString(10);
				anObject.cnPackRefId_ren = set.getInt(11);
				if(set.wasNull()) {
					anObject.cnPackRefId_ren = Integer.MIN_VALUE;
				}
				anObject.cnPackRefRenName = set.getString(12);
				anObject.cnPackRefId_district = set.getInt(13);
				if(set.wasNull()) {
					anObject.cnPackRefId_district = Integer.MIN_VALUE;
				}
				anObject.cnPackRefDistrictName = set.getString(14);
				anObject.cnPackRefId_child_district = set.getInt(15);
				if(set.wasNull()) {
					anObject.cnPackRefId_child_district = Integer.MIN_VALUE;
				}
				anObject.cnPackRefChildDistrictName = set.getString(16);
				anObject.cnPackRefId_pack_status = set.getInt(17);
				if(set.wasNull()) {
					anObject.cnPackRefId_pack_status = Integer.MIN_VALUE;
				}
				anObject.cnPackRefStatusName = set.getString(18);
				anObject.cnPackRefDescription = set.getString(19);
				anObject.cnPackRefPower = set.getBigDecimal(20);
				if(anObject.cnPackRefPower != null) {
					anObject.cnPackRefPower = anObject.cnPackRefPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.cnPackRefAddress = set.getString(21);
				anObject.cnPackRefAddress_jur = set.getString(22);
				anObject.cnPackRefReg_num_cn_contract = set.getString(23);
				anObject.cnPackRefDate_cn_contract = set.getDate(24);
				anObject.cnPackRefReg_num_spl_pp_contract = set.getString(25);
				anObject.cnPackRefDate_spl_pp_contract = set.getDate(26);
				anObject.cnPackRefReg_num_tu_contract = set.getString(27);
				anObject.cnPackRefDate_tu_contract = set.getDate(28);
				anObject.cnPackRefReg_num_tu_cr_contract = set.getString(29);
				anObject.cnPackRefDate_tu_cr_contract = set.getDate(30);
				anObject.cnPackRefProject_num = set.getString(31);
				anObject.cnPackRefProject_date = set.getDate(32);
				anObject.cnPackRefOver5 = set.getInt(33);
				if(set.wasNull()) {
					anObject.cnPackRefOver5 = Integer.MIN_VALUE;
				}
				anObject.cnPackRefStatus = set.getInt(34);
				if(set.wasNull()) {
					anObject.cnPackRefStatus = Integer.MIN_VALUE;
				}
				anObject.cnPackRefLetter_num_customer = set.getString(35);
				anObject.cnPackRefDate_letter_customer = set.getDate(36);
				anObject.cnPackRefLetter_num = set.getString(37);
				anObject.cnPackRefDate_letter = set.getDate(38);
				anObject.cnPackRefReliability_class = set.getString(39);
				anObject.cnPackRefId_waiting_status = set.getInt(40);
				if(set.wasNull()) {
					anObject.cnPackRefId_waiting_status = Integer.MIN_VALUE;
				}
				anObject.cnPackRefWaitingStatus = set.getString(41);
				anObject.cnPackRefIs_payable = set.getInt(42);
				if(set.wasNull()) {
					anObject.cnPackRefIs_payable = Integer.MIN_VALUE;
				}
				anObject.cnPackRefWorksize = set.getString(43);
				anObject.cnPackRefWork_inc_net = set.getString(44);
				anObject.cnPackRefBusiness_type = set.getString(45);
				anObject.cnPackRefEstimateterm = set.getInt(46);
				if(set.wasNull()) {
					anObject.cnPackRefEstimateterm = Integer.MIN_VALUE;
				}
				anObject.cnPackRefEstimatedate = set.getDate(47);
				anObject.cnPackRefBuildingterm = set.getInt(48);
				if(set.wasNull()) {
					anObject.cnPackRefBuildingterm = Integer.MIN_VALUE;
				}
				anObject.cnPackRefBuildingdate = set.getDate(49);
				anObject.cnPackRefBuyingterm = set.getInt(50);
				if(set.wasNull()) {
					anObject.cnPackRefBuyingterm = Integer.MIN_VALUE;
				}
				anObject.cnPackRefBuyingdate = set.getDate(51);
				anObject.cnPackRefEstimate_num = set.getString(52);
				anObject.cnPackRefEstimate_contract_date = set.getDate(53);
				anObject.cnPackRefIs_reserv = set.getInt(54);
				if(set.wasNull()) {
					anObject.cnPackRefIs_reserv = Integer.MIN_VALUE;
				}
				anObject.cnPackRefPurpose = set.getString(55);
				anObject.cnPackRefIs_ksoe = set.getInt(56);
				if(set.wasNull()) {
					anObject.cnPackRefIs_ksoe = Integer.MIN_VALUE;
				}
				anObject.cnPackRefOver150 = set.getInt(57);
				if(set.wasNull()) {
					anObject.cnPackRefOver150 = Integer.MIN_VALUE;
				}
				anObject.cnPackRefIs_new = set.getInt(58);
				if(set.wasNull()) {
					anObject.cnPackRefIs_new = Integer.MIN_VALUE;
				}
				anObject.cnPackRefIs3phases = set.getInt(59);
				if(set.wasNull()) {
					anObject.cnPackRefIs3phases = Integer.MIN_VALUE;
				}
				anObject.cnPackRefAgree_changes = set.getInt(60);
				if(set.wasNull()) {
					anObject.cnPackRefAgree_changes = Integer.MIN_VALUE;
				}
				anObject.cnPackRefDate_end_order_spl = set.getDate(61);
				anObject.cnPackRefCopmany_protocol = set.getInt(62);
				if(set.wasNull()) {
					anObject.cnPackRefCopmany_protocol = Integer.MIN_VALUE;
				}
				anObject.cnPackRefId_feature = set.getInt(63);
				if(set.wasNull()) {
					anObject.cnPackRefId_feature = Integer.MIN_VALUE;
				}
				anObject.cnPackRefId_state = set.getInt(64);
				if(set.wasNull()) {
					anObject.cnPackRefId_state = Integer.MIN_VALUE;
				}
				anObject.cnPackRefId_bp = set.getInt(65);
				if(set.wasNull()) {
					anObject.cnPackRefId_bp = Integer.MIN_VALUE;
				}
				anObject.cnPackRefId_parent = set.getInt(66);
				if(set.wasNull()) {
					anObject.cnPackRefId_parent = Integer.MIN_VALUE;
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
	
	public int[] getFilteredCodeArray(CNPack2SiteFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}


	public int[] getFilteredCodeArray(CNPack2Site aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT CNPACK2SITE.CODE FROM CNPACK2SITE";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "CNPACK2SITE.CODE";
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

	public CNPack2Site getObject(int uid) throws PersistenceException {
		CNPack2Site result = new CNPack2Site();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(CNPack2Site anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  CNPACK2SITE.CODE, CNPACK2SITE.IS_REG, CNPACK2SITE.CUSTOMEREMAIL, CNPACK2SITE.PHONE, CNPACK2SITE.CUSTOMERTYPE, CNPACK2SITE.SUBSYSTEMREFCODE, CNPACK2SITE.CNPACKREFCODE "
			+" FROM CNPACK2SITE WHERE CNPACK2SITE.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.is_reg = set.getInt(2);
				if (set.wasNull()) {
					anObject.is_reg = Integer.MIN_VALUE;
				}
				anObject.customeremail = set.getString(3);
				anObject.phone = set.getString(4);
				anObject.customertype = set.getInt(5);
				if (set.wasNull()) {
					anObject.customertype = Integer.MIN_VALUE;
				}
				anObject.subsystemRef.code = set.getInt(6);
				if (set.wasNull()) {
					anObject.subsystemRef.code = Integer.MIN_VALUE;
				}
				anObject.cnPackRef.code = set.getInt(7);
				if (set.wasNull()) {
					anObject.cnPackRef.code = Integer.MIN_VALUE;
				}
				if(anObject.subsystemRef.code != Integer.MIN_VALUE) {
					anObject.setSubsystemRef(
						new com.ksoe.energynet.dataminer.generated.CNSubsystemTypeDAOGen(connection,getUserProfile()).getRef(anObject.subsystemRef.code));
				}
				if(anObject.cnPackRef.code != Integer.MIN_VALUE) {
					anObject.setCnPackRef(
						new com.ksoe.energynet.dataminer.generated.CNPackDAOGen(connection,getUserProfile()).getRef(anObject.cnPackRef.code));
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


	public com.ksoe.energynet.valueobject.references.CNPack2SiteRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.CNPack2SiteRef ref = new com.ksoe.energynet.valueobject.references.CNPack2SiteRef();
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

		selectStr = "DELETE FROM  CNPACK2SITE WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		CNPack2Site object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%CNPack2Site.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(CNPack2Site.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%CNPack2Site.remove%} access denied");
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
	
	public long count(CNPack2SiteFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(CNPack2SiteFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, CNPack2SiteFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM CNPACK2SITE", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, CNPack2SiteFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "CNPACK2SITE");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(CNPack2Site.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%CNPack2Site.getObject%} access denied");
		}

		selectStr =
			"SELECT  CNPACK2SITE.CODE FROM  CNPACK2SITE WHERE  CNPACK2SITE.CODE = ?";
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
		_checkConditionToken(condition,"code","CNPACK2SITE.CODE");
		_checkConditionToken(condition,"is_reg","CNPACK2SITE.IS_REG");
		_checkConditionToken(condition,"customeremail","CNPACK2SITE.CUSTOMEREMAIL");
		_checkConditionToken(condition,"phone","CNPACK2SITE.PHONE");
		_checkConditionToken(condition,"customertype","CNPACK2SITE.CUSTOMERTYPE");
		// relationship conditions
		_checkConditionToken(condition,"subsystemref","SUBSYSTEMREFCODE");
		_checkConditionToken(condition,"subsystemref.code","SUBSYSTEMREFCODE");
		_checkConditionToken(condition,"cnpackref","CNPACKREFCODE");
		_checkConditionToken(condition,"cnpackref.code","CNPACKREFCODE");
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
	
	private void _collectAutoIncrementFields(CNPack2Site anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("CNPACK2SITE", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("CNPACK2SITE", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("CNPACK2SITE", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: CNPACK2SITE");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of CNPack2SiteDAO
