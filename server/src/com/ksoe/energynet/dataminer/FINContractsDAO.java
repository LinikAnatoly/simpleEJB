//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.FINContractsDAOGen;
import com.ksoe.energynet.logic.ContractLogic;
import com.ksoe.energynet.valueobject.FINContracts;
import com.ksoe.energynet.valueobject.brief.FINContractsShort;
import com.ksoe.energynet.valueobject.lists.FINContractsShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.rqorder.dataminer.RQOrgDAO;
import com.ksoe.rqorder.valueobject.RQOrg;

/**
 * DAO Object for FINContracts;
 *
 */

public class FINContractsDAO extends FINContractsDAOGen {

	public FINContractsDAO(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile, aConnection);
	}

	public FINContractsDAO(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection, anUserProfile);
	}

	@Override
	public FINContractsShortList getScrollableFilteredList(
			FINContracts aFilterObject, String anCondition, String anOrderBy,
			int fromPosition, int quantity, Vector aBindObjects)
			throws PersistenceException {
		FINContractsShortList result = new FINContractsShortList();
		FINContractsShort anObject;
		result.list = new Vector();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if (orderBy.length() == 0)
			orderBy = "FINCONTRACTS.CODE";

		if (quantity < 0)
			quantity = Integer.MAX_VALUE / 2;

		if (getUserProfile() == null)
			throw new PersistenceException(
					"Internal Error (User Profile Is Undefined)");

		selectStr = "SELECT "
				+ "FINCONTRACTS.CODE"
				+ ",FINCONTRACTS.CONTRACTNUMBER"
				+ ",FINCONTRACTS.CONTRACTDATE"
				+ ",FINCONTRACTS.FINDOCCODE"
				+ ",FINCONTRACTS.FINDOCID"
				+

				", FINCONTRACTS.ORGCODE "
				+ ", (SELECT RQORG.NAME FROM RQORG WHERE RQORG.CODE = FINCONTRACTS.ORGCODE) AS ORGNAME "
				+ ", FINCONTRACTS.GENERALCONTRACTREFCODE " +

				" FROM FINCONTRACTS " +
				// " WHERE "
				"";
		// selectStr = selectStr +
		// " ${s} FINCONTRACTS.CODE IN ( SELECT FINCONTRACTS.CODE FROM FINCONTRACTS ";

		if (aFilterObject != null) {
			if (aFilterObject.code != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "  FINCONTRACTS.CODE = ?";
			}
			if (aFilterObject.contractNumber != null) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				if (aFilterObject.contractNumber.indexOf('*', 0) < 0
						&& aFilterObject.contractNumber.indexOf('?', 0) < 0)
					whereStr = whereStr
							+ "  UPPER(FINCONTRACTS.CONTRACTNUMBER) = UPPER(?)";
				else
					whereStr = whereStr
							+ " UPPER(FINCONTRACTS.CONTRACTNUMBER) LIKE UPPER(?)";
			}
			if (aFilterObject.contractDate != null) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "  FINCONTRACTS.CONTRACTDATE = ?";
			}
			if (aFilterObject.finDocCode != null) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				if (aFilterObject.finDocCode.indexOf('*', 0) < 0
						&& aFilterObject.finDocCode.indexOf('?', 0) < 0)
					whereStr = whereStr
							+ "  UPPER(FINCONTRACTS.FINDOCCODE) = UPPER(?)";
				else
					whereStr = whereStr
							+ " UPPER(FINCONTRACTS.FINDOCCODE) LIKE UPPER(?)";
			}
			if (aFilterObject.finDocID != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "  FINCONTRACTS.FINDOCID = ?";
			}
			if (aFilterObject.org.code != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "FINCONTRACTS.ORGCODE = ? ";
			}

			if (aFilterObject.generalContractRef.code != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr
						+ " FINCONTRACTS.GENERALCONTRACTREFCODE = ? ";
			}

		}

		if (condition.length() != 0) {
			if (whereStr.length() != 0)
				whereStr = whereStr + " AND ";

			whereStr = whereStr + " (" + condition + ")";
		}
		// + " WHERE" + сделано выше ????
		if (whereStr.length() != 0)
			selectStr = selectStr + " WHERE " + whereStr;

		// selectStr = selectStr + ") ";

		selectStr = selectStr + " ORDER BY " + orderBy;

		selectStr = selectStr + " OFFSET " + fromPosition;
		if (quantity>-1) selectStr = selectStr + " LIMIT " + quantity;

		try {
			statement = connection.prepareStatement(selectStr);
			int number = 0;
			if (aFilterObject != null) {
				if (aFilterObject.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.code);
				}

				if (aFilterObject.contractNumber != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.contractNumber);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}
				if (aFilterObject.contractDate != null) {
					number++;
					statement.setDate(number, new java.sql.Date(
							aFilterObject.contractDate.getTime()));
				}

				if (aFilterObject.finDocCode != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.finDocCode);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}
				if (aFilterObject.finDocID != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.finDocID);
				}
				if (aFilterObject.org.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.org.code);
				}

				if (aFilterObject.generalContractRef.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number,
							aFilterObject.generalContractRef.code);
				}

			}

			if (condition.length() > 0 && aBindObjects != null)
				_bindObjectsToPreparedStatement(statement, aBindObjects, number);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
//				if (i < fromPosition)
//					continue;
//				else if (i >= fromPosition + quantity) {
//					i++;
//					break;
//				}

				anObject = new FINContractsShort();

				anObject.code = set.getInt(1);
				if (set.wasNull())
					anObject.code = Integer.MIN_VALUE;
				anObject.contractNumber = set.getString(2);
				anObject.contractDate = set.getDate(3);
				anObject.finDocCode = set.getString(4);
				anObject.finDocID = set.getInt(5);
				if (set.wasNull())
					anObject.finDocID = Integer.MIN_VALUE;

				anObject.orgCode = set.getInt(6);
				if (set.wasNull())
					anObject.orgCode = Integer.MIN_VALUE;
				anObject.orgName = set.getString(7);

				anObject.generalContractRefCode = set.getInt(8);
				if (set.wasNull()) {
					anObject.generalContractRefCode = Integer.MIN_VALUE;
				}

				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			EnergyproPersistenceExceptionAnalyzer.analyser
					.throwPersistenceException(e);
			return null;
		} finally {
			try {
				if (set != null)
					set.close();
			} catch (SQLException e) {
			}
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	@Override
	public void remove(int uid) throws PersistenceException {
		FINContracts obj = getObject(uid);
		if (obj.org != null) {
			if (obj.org.code > Integer.MIN_VALUE) {
				int orgCode = obj.org.code;
				obj.org.code = Integer.MIN_VALUE;
				super.save(obj);
				new RQOrgDAO(getConnection(), getUserProfile()).remove(orgCode);
			}
		}
		super.remove(uid);
	}



	@Override
	public int add(FINContracts finContracts) throws PersistenceException {

		/** добавление и проверка договора на наличие в АХ и ФК */
        //// DEBUG !!!!!
        if ( 1 == 1 ) {
    	    if (finContracts.finDocCode != null && !finContracts.finDocCode.equals("")) {

    	    	if (finContracts.contractNumber != null && !finContracts.contractNumber.equals("")) {

    	    		RQOrgDAO orgDao = new RQOrgDAO(getConnection(), getUserProfile());
    	    		RQOrg org = orgDao.getObject(finContracts.org.code);

    	    		if (org == null || org.codeorg == null) {
    	    			throw new EnergyproSystemException("\n " +
                                "\n Неможливо визначити постачальника!!!");
    	    		}

    	    		boolean isCustomer = false;
    	    		boolean isException = true;
    	        	ContractLogic contractLogic = new ContractLogic(getConnection(), getUserProfile());
    	        	finContracts.generalContractRef.code = contractLogic
							.addByContractNumber(finContracts.contractNumber, org.codeorg, finContracts.finDocCode, isCustomer, isException);
    	        }
    	    }
        }

		return super.add(finContracts);
	}


	@Override
	public void save(FINContracts finContracts) throws PersistenceException {

        /** добавление и проверка договора на наличие в АХ и ФК */
        //// DEBUG !!!!!
        if ( 1 == 1 ) {
    	    if (finContracts.finDocCode != null && !finContracts.finDocCode.equals("")) {

    	    	if (finContracts.contractNumber != null && !finContracts.contractNumber.equals("")) {

    	    		RQOrgDAO orgDao = new RQOrgDAO(getConnection(), getUserProfile());
    	    		RQOrg org = orgDao.getObject(finContracts.org.code);

    	    		if (org == null || org.codeorg == null) {
    	    			throw new EnergyproSystemException("\n " +
                                "\n Неможливо визначити постачальника!!!");
    	    		}

    	    		boolean isCustomer = false;
    	    		boolean isException = true;
    	        	ContractLogic contractLogic = new ContractLogic(getConnection(), getUserProfile());
    	        	finContracts.generalContractRef.code = contractLogic
							.addByContractNumber(finContracts.contractNumber, org.codeorg, finContracts.finDocCode, isCustomer, isException);
    	        }
    	    }
        }

		super.save(finContracts);
	}
	
	
	public FINContracts getObjectFromFK(int id) throws PersistenceException {

		if (id == Integer.MIN_VALUE) {
			return null;
		}
		
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null; 

		FINContracts result = new FINContracts();
		
		selectStr =
			"  SELECT " +
			"    ID, CODE, " +
			//"    NVL(PARENT_CODE,CODE) MainAgreeCode, " +
			//"    DECODE(PARENT_CODE,NULL, '     ',CODE) SubAgreeCode, " +
			"    IN_NUM, IN_DATE, " +
			"    DIVISION_ID, DIVISION_NAME, " +
			"    AGREE_GROUP_ID, AGREE_GROUP_NAME, " +
			"    REG_NUM, LPAD(RTRIM(REG_NUM),12) ALIGNREGNUM, REG_DATE, " +
			"    START_DATE, END_DATE, " +
			"    curr_end_date, prolong_month, prolong_no, " +
			"    STATUS, STATUS_NAME, " +
			"    SUMMA, curr_summ, csumm_start_date, " +
			"    SUMM_NOTE, " +
			"    NUMS, " +
			"    EDIZM_ID, EDIZM_NAME, " +
			"    DESCRIPTION, CLOSE_DATE, NOTES, " +
			//"    PARENT_ID, PARENT_CODE, PARENT_IN_NUM, PARENT_IN_DATE, " +
			//"    RC_ID,  " +
			"    PAY_AFTER_EVENT, " +
			"    PAY_PERIOD,  " +
			"    PAY_TYPE, PAY_TYPE_NAME, " +
			"    NOTLIMITED, " +
			"    IO_FLAG, DEAL_FLAG, " +
			"    GK_KATEGORY, GK_KATEGORY_NAME, " +
			"    ACT_EXISTS, " +
			"    SERVICE_ID, SERVICE_NAME, " +
			"    id_BuyConds,  " +
			"    name_BuyConds, " +
			"    id_PayForm, " +
			"    name_PayForm, " +
			"    Summ_ChangeMode, " +
			"    id_OtvLico, " +
			"    TabN_OtvLico, " +
			"    FIO_OtvLico, " +
			"    currency_code, " +
			"    tender_date, " +
			"    tender_no, " +
			"    note1, " +
			"    note2, " +
			"    PARENT_ID " +
			"  FROM sprav.v_agree " +
			"  WHERE ID = " + id;
			//"  order by MainAgreeCode, SubAgreeCode ";				
		
		try {
			statement = connection.prepareStatement(selectStr);
			//statement.setInt(1,result.code);
			
			set = statement.executeQuery();
			
			if(!set.next()) {
				result.code = Integer.MIN_VALUE;
			} else {
				result.code = set.getInt(1);
				if (set.wasNull()) {
					result.code = Integer.MIN_VALUE;
				}
				
				result.finDocID = set.getInt(1);
				if (set.wasNull()) {
					result.finDocID = Integer.MIN_VALUE;
				}
				
				result.finDocCode = set.getString(2);
				
				result.contractNumber = set.getString(3);
				result.contractDate = set.getDate(4);
				
				result.division_id = set.getInt(5);
				if (set.wasNull()) {
					result.division_id = Integer.MIN_VALUE;
				}
				result.division_name = set.getString(6);
				
				result.agree_group_id = set.getInt(7);
				if (set.wasNull()) {
					result.agree_group_id = Integer.MIN_VALUE;
				}
				result.agree_group_name = set.getString(8);
				
				result.reg_num = set.getString(9);
				result.reg_date = set.getDate(11);
				
				result.start_date = set.getDate(12);
				result.end_date = set.getDate(13);
				result.curr_end_date = set.getDate(14);
				
				result.prolong_month = set.getInt(15);
				if (set.wasNull()) {
					result.prolong_month = Integer.MIN_VALUE;
				}
				
				result.prolong_no = set.getInt(16);
				if (set.wasNull()) {
					result.prolong_no = Integer.MIN_VALUE;
				}
				
				result.status = set.getString(17);
				result.status_name = set.getString(18);
				
				result.summa = set.getBigDecimal(19);
				if(result.summa != null) {
					result.summa = result.summa.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				
				result.curr_summ = set.getBigDecimal(20);
				if(result.curr_summ != null) {
					result.curr_summ = result.curr_summ.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				
				result.csumm_start_date = set.getDate(21);
				
				result.summ_note = set.getString(22);
				
				result.nums = set.getBigDecimal(23);
				if(result.nums != null) {
					result.nums = result.nums.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				
				result.edizm_id = set.getInt(24);
				if (set.wasNull()) {
					result.edizm_id = Integer.MIN_VALUE;
				}				
				result.edizm_name = set.getString(25);
				
				result.description = set.getString(26);
				result.close_date = set.getDate(27);
				result.notes = set.getString(28);
				
				result.pay_after_event = set.getString(29);
				
				result.pay_period = set.getInt(30);
				if (set.wasNull()) {
					result.pay_period = Integer.MIN_VALUE;
				}
				
				result.pay_type = set.getInt(31);
				if (set.wasNull()) {
					result.pay_type = Integer.MIN_VALUE;
				}
				result.pay_type_name = set.getString(32);

				result.notlimited = set.getString(33);
				
				result.io_flag = set.getString(34);
				result.deal_flag = set.getString(35);
				
				result.gk_kategory = set.getInt(36);
				if (set.wasNull()) {
					result.gk_kategory = Integer.MIN_VALUE;
				}
				result.gk_kategory_name = set.getString(37);

				result.act_exists = set.getString(38);
				
				result.service_id = set.getInt(39);
				if (set.wasNull()) {
					result.service_id = Integer.MIN_VALUE;
				}
				result.service_name = set.getString(40);
				
				result.id_buyconds = set.getInt(41);
				if (set.wasNull()) {
					result.id_buyconds = Integer.MIN_VALUE;
				}
				result.name_buyconds = set.getString(42);
				
				result.id_payform = set.getInt(43);
				if (set.wasNull()) {
					result.id_payform = Integer.MIN_VALUE;
				}
				result.name_payform = set.getString(44);
				
				result.summ_changemode = set.getInt(45);
				if (set.wasNull()) {
					result.summ_changemode = Integer.MIN_VALUE;
				}
				
				result.id_otvlico = set.getInt(46);
				if (set.wasNull()) {
					result.id_otvlico = Integer.MIN_VALUE;
				}
				result.tabn_otvlico = set.getString(47);
				result.fio_otvlico = set.getString(48);
				
				result.currency_code = set.getString(49);
				
				result.tender_date = set.getDate(50);
				result.tender_no = set.getString(51);

				result.note1 = set.getString(52);
				result.note2 = set.getString(53);
				
				result.parent_id = set.getInt(54);
				if (set.wasNull()) {
					result.parent_id = Integer.MIN_VALUE;
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
		
		return result;
	}	


} // end of FINContractsDAO

