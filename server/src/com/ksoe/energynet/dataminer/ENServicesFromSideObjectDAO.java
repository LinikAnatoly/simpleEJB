//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.dataminer.generated.ENServicesFromSideObjectDAOGen;
import com.ksoe.energynet.valueobject.ENServFromSideStatus;
import com.ksoe.energynet.valueobject.ENServicesFromSideObject;
import com.ksoe.energynet.valueobject.brief.ENServicesFromSideObjectShort;
import com.ksoe.energynet.valueobject.filter.ENServicesFromSideObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENServicesFromSideObjectShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;

/**
 * DAO Object for ENServicesFromSideObject;
 *
 */

public class ENServicesFromSideObjectDAO extends ENServicesFromSideObjectDAOGen {

    public ENServicesFromSideObjectDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENServicesFromSideObjectDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    /* ENServicesFromSideObject. Удалить */
    @Override
	public void remove(int uid) throws PersistenceException {

        ENServicesFromSideObject obj = getObject(uid);
        super.remove(uid);

        ENElementDAO eDao = new ENElementDAO(super.getConnection(),
                super.getUserProfile());
        eDao.remove(obj.element.code);
    }


    public ENServicesFromSideObjectShort getShortObjectWithBillAndPaySum(int uid) throws PersistenceException
    {
        ENServicesFromSideObjectShort result = new ENServicesFromSideObjectShort();
        result.code = uid;
        loadShortObjectWithBillAndPaySum(result);
        if(result.code == Integer.MIN_VALUE)
            return null;
        return result;
    }

    public void loadShortObjectWithBillAndPaySum(ENServicesFromSideObjectShort anShortObject) throws PersistenceException
    {
        String     selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;

        if(getUserProfile() == null)
            throw new PersistenceException("Internal Error (User Profile Is Undefined)");



        selectStr = " SELECT  ENSERVICESFROMSIDEBJCT.CODE, ENSERVICESFROMSIDEBJCT.CONTRACTNUMBER, ENSERVICESFROMSIDEBJCT.CONTRACTDATE, ENSERVICESFROMSIDEBJCT.NAME, "
                + " ENSERVICESFROMSIDEBJCT.PARTNERCODE, ENSERVICESFROMSIDEBJCT.FINDOCCODE, ENSERVICESFROMSIDEBJCT.FINDOCID, ENSERVICESFROMSIDEBJCT.COMMENTGEN, "
                + " ENSERVICESFROMSIDEBJCT.USERGEN, ENSERVICESFROMSIDEBJCT.DATEEDIT,  "
                + " ENSERVICESFROMSIDEBJCT.DEPARTMENTCODE, ENSERVICESFROMSIDEBJCT.ELEMENTCODE, ENSERVICESFROMSIDEBJCT.GENERALCONTRACTREFCODE, ENSERVICESFROMSIDEBJCT.statusrefcode, "
                + " (select sum(b.sumwithnds) from rqbill b\n" +
                "    where \n" +
                "       b.code in (select bi.billrefcode from rqbillitem2enestimattm bi2e , rqbillitem bi , enestimateitem e  \n" +
                "         where bi2e.estimateitemcode=e.code\n" +
                "         and bi2e.billitemcode=bi.code \n" +
                "         and e.planrefcode in ( select s2p.planrefcode from  enservfromside2planwrk s2p \n" +
                "         where s2p.servfromsiderefcode = ENSERVICESFROMSIDEBJCT.code ))), "
                + " (select sum(pd.summagen) from rqpaydocitem pd where \n" +
                "         pd.code in \n" +
                "                    (select p2b.paydocitemcode from rqpaydocitem2billitem p2b \n" +
                "                      where p2b.billitemcode in (select bi.code from rqbillitem bi \n" +
                "                      where bi.billrefcode in (select bi.billrefcode from rqbillitem2enestimattm bi2e , rqbillitem bi , enestimateitem e  \n" +
                "         where bi2e.estimateitemcode=e.code\n" +
                "         and bi2e.billitemcode=bi.code \n" +
                "         and e.planrefcode in ( select s2p.planrefcode from  enservfromside2planwrk s2p \n" +
                "         where s2p.servfromsiderefcode = ENSERVICESFROMSIDEBJCT.code )))))"

                + " FROM ENSERVICESFROMSIDEBJCT WHERE ENSERVICESFROMSIDEBJCT.CODE = ? ";


        try
        {
            statement = connection.prepareStatement(selectStr);
            statement.setInt(1,anShortObject.code);
            set = statement.executeQuery();
            if(!set.next())
                anShortObject.code = Integer.MIN_VALUE;
            else
            {
                anShortObject.code = set.getInt(1);
                anShortObject.contractNumber = set.getString(2);
                anShortObject.contractDate = set.getDate(3);
                anShortObject.name = set.getString(4);
                anShortObject.partnerCode = set.getString(5);
                anShortObject.finDocCode = set.getString(6);
                anShortObject.finDocID = set.getInt(7);
                if ( set.wasNull() )
                    anShortObject.finDocID = Integer.MIN_VALUE;
                anShortObject.commentGen = set.getString(8);
                anShortObject.userGen = set.getString(9);
                anShortObject.dateEdit = set.getDate(10);

                anShortObject.departmentCode = set.getInt(11);
                if ( set.wasNull() )
                    anShortObject.departmentCode = Integer.MIN_VALUE;

                anShortObject.elementCode = set.getInt(12);
                if ( set.wasNull() )
                    anShortObject.elementCode = Integer.MIN_VALUE;

                anShortObject.generalContractRefCode = set.getInt(13);
                if (set.wasNull()) {
                    anShortObject.generalContractRefCode = Integer.MIN_VALUE;
                }

                anShortObject.statusRefCode = set.getInt(14);
                if (set.wasNull()) {
                    anShortObject.statusRefCode = Integer.MIN_VALUE;
                }

                anShortObject.bill_sum = set.getBigDecimal(15);
                if(anShortObject.bill_sum != null) {
                    anShortObject.bill_sum = anShortObject.bill_sum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                }

                anShortObject.pay_sum = set.getBigDecimal(16);
                if(anShortObject.pay_sum != null) {
                    anShortObject.pay_sum = anShortObject.pay_sum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                }

            }
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - "+selectStr);
            throw new SystemException(e.getMessage(), e);
        }
        finally
        {
            try {if(set != null) set.close(); if (statement != null) statement.close();}
            catch (SQLException e) {}
            if(connection != super.getConnection())
            {
                try{connection.close();} catch(SQLException e){}
            }
        }
    }

    @Override
	public ENServicesFromSideObjectShortList getScrollableFilteredList(
            ENServicesFromSideObject aFilterObject, String anCondition,
            String anOrderBy, int fromPosition, int quantity,
            Vector aBindObjects) throws PersistenceException {

    	ENServicesFromSideObjectShortList result = new ENServicesFromSideObjectShortList();
        ENServicesFromSideObjectShort anObject;
        result.list = new Vector();

        String selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;
        String whereStr = "";
        String condition = processCondition(anCondition);
        String orderBy = processCondition(anOrderBy);

        if (orderBy.length() == 0)
            orderBy = "ENSERVICESFROMSIDEBJCT.CODE";

        if (quantity < 0)
            quantity = Integer.MAX_VALUE / 2;

        if (getUserProfile() == null)
            throw new PersistenceException(
                    "Internal Error (User Profile Is Undefined)");

        selectStr = "SELECT "
        		+ " ENSERVICESFROMSIDEBJCT.CODE "
                + ", ENSERVICESFROMSIDEBJCT.CONTRACTNUMBER "
                + ", ENSERVICESFROMSIDEBJCT.CONTRACTDATE "
                + ", ENSERVICESFROMSIDEBJCT.NAME "
                + ", ENSERVICESFROMSIDEBJCT.PARTNERCODE "
                + ", ENSERVICESFROMSIDEBJCT.FINDOCCODE "
                + ", ENSERVICESFROMSIDEBJCT.FINDOCID "
                + ", ENSERVICESFROMSIDEBJCT.COMMENTGEN "
                + ", ENSERVICESFROMSIDEBJCT.USERGEN "
                + ", ENSERVICESFROMSIDEBJCT.DATEEDIT "

                + ", ENSERVICESFROMSIDEBJCT.DEPARTMENTCODE "
                + ", ENSERVICESFROMSIDEBJCT.ELEMENTCODE "
                + ", ENSERVICESFROMSIDEBJCT.GENERALCONTRACTREFCODE "

				+ ", ENSERVFROMSIDESTATUS.CODE " 
				+ ", ENSERVFROMSIDESTATUS.NAME " 
				+ ", ENSERVICESFROMSIDEBJCT.NUMBERPROJECT" 
                + " FROM ENSERVICESFROMSIDEBJCT " +
                " LEFT JOIN ENSERVFROMSIDESTATUS on ENSERVFROMSIDESTATUS.CODE = ENSERVICESFROMSIDEBJCT.STATUSREFCODE "+

                "";

        if (aFilterObject != null) {
            if (aFilterObject.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENSERVICESFROMSIDEBJCT.CODE = ?";
            }
            if (aFilterObject.contractNumber != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.contractNumber.indexOf('*', 0) < 0
                        && aFilterObject.contractNumber.indexOf('?', 0) < 0)
                    whereStr = whereStr
                            + "  UPPER(ENSERVICESFROMSIDEBJCT.CONTRACTNUMBER) = UPPER(?)";
                else
                    whereStr = whereStr
                            + " UPPER(ENSERVICESFROMSIDEBJCT.CONTRACTNUMBER) LIKE UPPER(?)";
            }
            if (aFilterObject.contractDate != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr
                        + "  ENSERVICESFROMSIDEBJCT.CONTRACTDATE = ?";
            }
            if (aFilterObject.name != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.name.indexOf('*', 0) < 0
                        && aFilterObject.name.indexOf('?', 0) < 0)
                    whereStr = whereStr
                            + "  UPPER(ENSERVICESFROMSIDEBJCT.NAME) = UPPER(?)";
                else
                    whereStr = whereStr
                            + " UPPER(ENSERVICESFROMSIDEBJCT.NAME) LIKE UPPER(?)";
            }
            if (aFilterObject.partnerCode != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.partnerCode.indexOf('*', 0) < 0
                        && aFilterObject.partnerCode.indexOf('?', 0) < 0)
                    whereStr = whereStr
                            + "  UPPER(ENSERVICESFROMSIDEBJCT.PARTNERCODE) = UPPER(?)";
                else
                    whereStr = whereStr
                            + " UPPER(ENSERVICESFROMSIDEBJCT.PARTNERCODE) LIKE UPPER(?)";
            }
            if (aFilterObject.finDocCode != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.finDocCode.indexOf('*', 0) < 0
                        && aFilterObject.finDocCode.indexOf('?', 0) < 0)
                    whereStr = whereStr
                            + "  UPPER(ENSERVICESFROMSIDEBJCT.FINDOCCODE) = UPPER(?)";
                else
                    whereStr = whereStr
                            + " UPPER(ENSERVICESFROMSIDEBJCT.FINDOCCODE) LIKE UPPER(?)";
            }
            if (aFilterObject.finDocID != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENSERVICESFROMSIDEBJCT.FINDOCID = ?";
            }
            if (aFilterObject.commentGen != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.commentGen.indexOf('*', 0) < 0
                        && aFilterObject.commentGen.indexOf('?', 0) < 0)
                    whereStr = whereStr
                            + "  UPPER(ENSERVICESFROMSIDEBJCT.COMMENTGEN) = UPPER(?)";
                else
                    whereStr = whereStr
                            + " UPPER(ENSERVICESFROMSIDEBJCT.COMMENTGEN) LIKE UPPER(?)";
            }
            if (aFilterObject.userGen != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.userGen.indexOf('*', 0) < 0
                        && aFilterObject.userGen.indexOf('?', 0) < 0)
                    whereStr = whereStr
                            + "  UPPER(ENSERVICESFROMSIDEBJCT.USERGEN) = UPPER(?)";
                else
                    whereStr = whereStr
                            + " UPPER(ENSERVICESFROMSIDEBJCT.USERGEN) LIKE UPPER(?)";
            }
            if (aFilterObject.dateEdit != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENSERVICESFROMSIDEBJCT.DATEEDIT = ?";
            }
            if (aFilterObject.domain_info != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.domain_info.indexOf('*', 0) < 0
                        && aFilterObject.domain_info.indexOf('?', 0) < 0)
                    whereStr = whereStr
                            + "  UPPER(ENSERVICESFROMSIDEBJCT.DOMAIN_INFO) = UPPER(?)";
                else
                    whereStr = whereStr
                            + " UPPER(ENSERVICESFROMSIDEBJCT.DOMAIN_INFO) LIKE UPPER(?)";
            }
            if (aFilterObject.modify_time != Long.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr
                        + "  ENSERVICESFROMSIDEBJCT.MODIFY_TIME = ?";
            }
            if (aFilterObject.department.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr
                        + "ENSERVICESFROMSIDEBJCT.DEPARTMENTCODE = ? ";
            }

            if (aFilterObject.element.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENSERVICESFROMSIDEBJCT.ELEMENTCODE = ? ";
            }

            if (aFilterObject.generalContractRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENSERVICESFROMSIDEBJCT.GENERALCONTRACTREFCODE = ? ";
            }
            
            if (aFilterObject.numberProject != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.numberProject.indexOf('*', 0) < 0
                        && aFilterObject.numberProject.indexOf('?', 0) < 0)
                    whereStr = whereStr
                            + "  UPPER(ENSERVICESFROMSIDEBJCT.NUMBERPROJECT) = UPPER(?)";
                else
                    whereStr = whereStr
                            + " UPPER(ENSERVICESFROMSIDEBJCT.NUMBERPROJECT) LIKE UPPER(?)";
            }

            if (aFilterObject.statusRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENSERVICESFROMSIDEBJCT.STATUSREFCODE = ? ";
            }

        }

        SegregationInfo segregationInfo = new SegregationProcessor()
                .getSegregationInfoForDataAccess(ENServicesFromSideObject.class
                        .getName(), DataAccessType.READ_LIST, getUserProfile()
                        .getDomainInfo().getDomain());
        if (segregationInfo.isAccessDenied())
            throw new PersistenceException(
                    "{%ENServicesFromSideObject.getList%} access denied");

        String domainWhereStr = SegregationQueryBuilder.addWhere(
                "ENSERVICESFROMSIDEBJCT", segregationInfo, getUserProfile()
                        .getDomainInfo());

        if (domainWhereStr.length() != 0) {
            // domainWhereStr =
            // "  AND ENSERVICESFROMSIDEBJCT.DOMAIN_INFO IS NOT NULL";
            // else
            if (whereStr.length() == 0)
                whereStr = domainWhereStr;
            else
                whereStr = " " + whereStr + " AND " + domainWhereStr;
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
        if (quantity > -1)
            selectStr = selectStr + " LIMIT " + quantity;

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

                if (aFilterObject.name != null) {
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(aFilterObject.name);
                    for (int i = 0; i < likeStr.length(); i++) {
                        if (likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i, '%');
                        if (likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i, '_');
                    }
                    statement.setString(number, likeStr.toString());
                }

                if (aFilterObject.partnerCode != null) {
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(aFilterObject.partnerCode);
                    for (int i = 0; i < likeStr.length(); i++) {
                        if (likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i, '%');
                        if (likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i, '_');
                    }
                    statement.setString(number, likeStr.toString());
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

                if (aFilterObject.commentGen != null) {
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(aFilterObject.commentGen);
                    for (int i = 0; i < likeStr.length(); i++) {
                        if (likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i, '%');
                        if (likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i, '_');
                    }
                    statement.setString(number, likeStr.toString());
                }

                if (aFilterObject.userGen != null) {
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(aFilterObject.userGen);
                    for (int i = 0; i < likeStr.length(); i++) {
                        if (likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i, '%');
                        if (likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i, '_');
                    }
                    statement.setString(number, likeStr.toString());
                }
                if (aFilterObject.dateEdit != null) {
                    number++;
                    statement.setDate(number, new java.sql.Date(
                            aFilterObject.dateEdit.getTime()));
                }

                if (aFilterObject.domain_info != null) {
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(aFilterObject.domain_info);
                    for (int i = 0; i < likeStr.length(); i++) {
                        if (likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i, '%');
                        if (likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i, '_');
                    }
                    statement.setString(number, likeStr.toString());
                }
                if (aFilterObject.modify_time != Long.MIN_VALUE) {
                    number++;
                    if (aFilterObject.modify_time == Long.MIN_VALUE)
                        statement.setBigDecimal(number, null);
                    else
                        statement.setBigDecimal(number,
                                new java.math.BigDecimal(
                                        aFilterObject.modify_time));
                }
                if (aFilterObject.department.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.department.code);
                }

                if (aFilterObject.element.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.element.code);
                }

                if (aFilterObject.generalContractRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.generalContractRef.code);
                }
                
                
                if (aFilterObject.numberProject != null) {
                    number++;
                    StringBuffer likeStr = new StringBuffer();
                    likeStr.append(aFilterObject.numberProject);
                    for (int i = 0; i < likeStr.length(); i++) {
                        if (likeStr.charAt(i) == '*')
                            likeStr.setCharAt(i, '%');
                        if (likeStr.charAt(i) == '?')
                            likeStr.setCharAt(i, '_');
                    }
                    statement.setString(number, likeStr.toString());
                }

                if (aFilterObject.statusRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.statusRef.code);
                }


            }

            if (condition.length() > 0 && aBindObjects != null)
                _bindObjectsToPreparedStatement(statement, aBindObjects, number);

            set = statement.executeQuery();
            int i;
            for (i = 0; set.next(); i++) {

                anObject = new ENServicesFromSideObjectShort();

                anObject.code = set.getInt(1);
                if (set.wasNull())
                    anObject.code = Integer.MIN_VALUE;
                anObject.contractNumber = set.getString(2);
                anObject.contractDate = set.getDate(3);
                anObject.name = set.getString(4);
                anObject.partnerCode = set.getString(5);
                anObject.finDocCode = set.getString(6);
                anObject.finDocID = set.getInt(7);
                if (set.wasNull())
                    anObject.finDocID = Integer.MIN_VALUE;
                anObject.commentGen = set.getString(8);
                anObject.userGen = set.getString(9);
                anObject.dateEdit = set.getDate(10);

                anObject.departmentCode = set.getInt(11);
                if (set.wasNull())
                    anObject.departmentCode = Integer.MIN_VALUE;
                anObject.elementCode = set.getInt(12);
                if (set.wasNull())
                    anObject.elementCode = Integer.MIN_VALUE;

                anObject.generalContractRefCode = set.getInt(13);
				if(set.wasNull()) {
					anObject.generalContractRefCode = Integer.MIN_VALUE;
				}
				
				anObject.statusRefCode = set.getInt(14);
				if(set.wasNull()) {
					anObject.statusRefCode = Integer.MIN_VALUE;
				}
				anObject.statusRefName = set.getString(15);
				
				anObject.numberProject = set.getString(16);

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


	public int[] getFilteredCodeArrayNOSEGR(
			ENServicesFromSideObjectFilter aFilterObject, int fromPosition,
			int quantity) throws PersistenceException {
		return getFilteredCodeArrayNOSEGR(
				aFilterObject,
				(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL),
				(aFilterObject == null) ? (null) : (aFilterObject.orderBySQL),
				fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArrayNOSEGR(
			ENServicesFromSideObject aFilterObject, String anCondition,
			String anOrderBy, int fromPosition, int quantity,
			Vector aBindObjects) throws PersistenceException {

		Vector result = new Vector();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENSERVICESFROMSIDEBJCT.CODE FROM ENSERVICESFROMSIDEBJCT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if (orderBy.length() == 0)
			orderBy = "ENSERVICESFROMSIDEBJCT.CODE";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     /*
     SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesFromSideObject.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
     if(segregationInfo.isAccessDenied())
       throw new PersistenceException("{%ENServicesFromSideObject.getList%} access denied");

     whereStr = SegregationQueryBuilder.addWhere("ENSERVICESFROMSIDEBJCT",segregationInfo,getUserProfile().getDomainInfo());


     if(whereStr.length() == 0)
      whereStr = " (ENSERVICESFROMSIDEBJCT.DOMAIN_INFO IS NOT NULL) ";
     else
      whereStr = " "+whereStr;
     */

       if(aFilterObject != null)
       {
         if(aFilterObject.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENSERVICESFROMSIDEBJCT.CODE = ?";
         }
          if (aFilterObject.contractNumber != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.contractNumber.indexOf('*',0) < 0 && aFilterObject.contractNumber.indexOf('?',0) < 0)
                  whereStr = whereStr + "  ENSERVICESFROMSIDEBJCT.CONTRACTNUMBER = ?";
              else
                  whereStr = whereStr + "  ENSERVICESFROMSIDEBJCT.CONTRACTNUMBER LIKE ?";
          }
         if(aFilterObject.contractDate != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENSERVICESFROMSIDEBJCT.CONTRACTDATE = ?";
         }
          if (aFilterObject.name != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                  whereStr = whereStr + "  ENSERVICESFROMSIDEBJCT.NAME = ?";
              else
                  whereStr = whereStr + "  ENSERVICESFROMSIDEBJCT.NAME LIKE ?";
          }
          if (aFilterObject.partnerCode != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.partnerCode.indexOf('*',0) < 0 && aFilterObject.partnerCode.indexOf('?',0) < 0)
                  whereStr = whereStr + "  ENSERVICESFROMSIDEBJCT.PARTNERCODE = ?";
              else
                  whereStr = whereStr + "  ENSERVICESFROMSIDEBJCT.PARTNERCODE LIKE ?";
          }
          if (aFilterObject.finDocCode != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.finDocCode.indexOf('*',0) < 0 && aFilterObject.finDocCode.indexOf('?',0) < 0)
                  whereStr = whereStr + "  ENSERVICESFROMSIDEBJCT.FINDOCCODE = ?";
              else
                  whereStr = whereStr + "  ENSERVICESFROMSIDEBJCT.FINDOCCODE LIKE ?";
          }
         if(aFilterObject.finDocID != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENSERVICESFROMSIDEBJCT.FINDOCID = ?";
         }
          if (aFilterObject.commentGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  ENSERVICESFROMSIDEBJCT.COMMENTGEN = ?";
              else
                  whereStr = whereStr + "  ENSERVICESFROMSIDEBJCT.COMMENTGEN LIKE ?";
          }
          if (aFilterObject.userGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  ENSERVICESFROMSIDEBJCT.USERGEN = ?";
              else
                  whereStr = whereStr + "  ENSERVICESFROMSIDEBJCT.USERGEN LIKE ?";
          }
         if(aFilterObject.dateEdit != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENSERVICESFROMSIDEBJCT.DATEEDIT = ?";
         }
          if (aFilterObject.domain_info != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                  whereStr = whereStr + "  ENSERVICESFROMSIDEBJCT.DOMAIN_INFO = ?";
              else
                  whereStr = whereStr + "  ENSERVICESFROMSIDEBJCT.DOMAIN_INFO LIKE ?";
          }
         if(aFilterObject.modify_time != Long.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENSERVICESFROMSIDEBJCT.MODIFY_TIME = ?";
         }
         if(aFilterObject.department.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + " ENSERVICESFROMSIDEBJCT.DEPARTMENTCODE = ? ";
         }

         if(aFilterObject.element.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + " ENSERVICESFROMSIDEBJCT.ELEMENTCODE = ? ";
         }

         if(aFilterObject.generalContractRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + " ENSERVICESFROMSIDEBJCT.GENERALCONTRACTREFCODE = ? ";
         }

       }

       if(condition.length() != 0)
       {
          if(whereStr.length() != 0)
             whereStr = whereStr + " AND ";
          whereStr = whereStr + " (" + condition + ")";
       }

      if(whereStr.length() != 0)
          selectStr = selectStr + " WHERE " + whereStr;

     selectStr = selectStr + " ORDER BY " + orderBy;

     try
      {
       statement = connection.prepareStatement(selectStr);
       int number = 0;
       if(aFilterObject != null){
          if(aFilterObject.code != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.code);
          }
          if (aFilterObject.contractNumber != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND";
              if (aFilterObject.contractNumber.indexOf('*',0) < 0 && aFilterObject.contractNumber.indexOf('?',0) < 0)
                  whereStr = whereStr + " ENSERVICESFROMSIDEBJCT.CONTRACTNUMBER = ?";
              else
                  whereStr = whereStr + " ENSERVICESFROMSIDEBJCT.CONTRACTNUMBER LIKE ?";

            if(aFilterObject.contractNumber != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.contractNumber);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
          }
         if(aFilterObject.contractDate != null){
             number++;
             statement.setDate(number,new java.sql.Date(aFilterObject.contractDate.getTime()));
         }
          if (aFilterObject.name != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND";
              if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                  whereStr = whereStr + " ENSERVICESFROMSIDEBJCT.NAME = ?";
              else
                  whereStr = whereStr + " ENSERVICESFROMSIDEBJCT.NAME LIKE ?";

            if(aFilterObject.name != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.name);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
          }
          if (aFilterObject.partnerCode != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND";
              if (aFilterObject.partnerCode.indexOf('*',0) < 0 && aFilterObject.partnerCode.indexOf('?',0) < 0)
                  whereStr = whereStr + " ENSERVICESFROMSIDEBJCT.PARTNERCODE = ?";
              else
                  whereStr = whereStr + " ENSERVICESFROMSIDEBJCT.PARTNERCODE LIKE ?";

            if(aFilterObject.partnerCode != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.partnerCode);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
          }
          if (aFilterObject.finDocCode != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND";
              if (aFilterObject.finDocCode.indexOf('*',0) < 0 && aFilterObject.finDocCode.indexOf('?',0) < 0)
                  whereStr = whereStr + " ENSERVICESFROMSIDEBJCT.FINDOCCODE = ?";
              else
                  whereStr = whereStr + " ENSERVICESFROMSIDEBJCT.FINDOCCODE LIKE ?";

            if(aFilterObject.finDocCode != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.finDocCode);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
          }
          if(aFilterObject.finDocID != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.finDocID);
          }
          if (aFilterObject.commentGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND";
              if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                  whereStr = whereStr + " ENSERVICESFROMSIDEBJCT.COMMENTGEN = ?";
              else
                  whereStr = whereStr + " ENSERVICESFROMSIDEBJCT.COMMENTGEN LIKE ?";

            if(aFilterObject.commentGen != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.commentGen);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
          }
          if (aFilterObject.userGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND";
              if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                  whereStr = whereStr + " ENSERVICESFROMSIDEBJCT.USERGEN = ?";
              else
                  whereStr = whereStr + " ENSERVICESFROMSIDEBJCT.USERGEN LIKE ?";

            if(aFilterObject.userGen != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.userGen);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
          }
         if(aFilterObject.dateEdit != null){
             number++;
             statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
         }
          if (aFilterObject.domain_info != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND";
              if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                  whereStr = whereStr + " ENSERVICESFROMSIDEBJCT.DOMAIN_INFO = ?";
              else
                  whereStr = whereStr + " ENSERVICESFROMSIDEBJCT.DOMAIN_INFO LIKE ?";

            if(aFilterObject.domain_info != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.domain_info);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
          }
         if(aFilterObject.modify_time != Long.MIN_VALUE){
             number++;
             if(aFilterObject.modify_time == Long.MIN_VALUE)
                 statement.setBigDecimal(number,null);
             else
                 statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
         }

        if(aFilterObject.department.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.department.code);
        }

        if(aFilterObject.element.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.element.code);
        }

        if(aFilterObject.generalContractRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.generalContractRef.code);
        }

       }

       if(condition.length() > 0 && aBindObjects != null)
        _bindObjectsToPreparedStatement(statement,aBindObjects,number);

       set = statement.executeQuery();
       int i;
       for(i = 0;set.next();i++)
        {
         if(i < fromPosition)
          continue;
         else if(i >= fromPosition + quantity)
          {
           i++;
           break;
          }

         result.add(new Integer(set.getInt(1)));
        }

       int[] array;

       array = new int[result.size()];
       for(int j = 0;j < result.size();j++)
        array[j] = ((Integer)result.get(j)).intValue();

       return array;
      }
     catch(SQLException e)
      {
       System.out.println(e.getMessage()+"\nstatement - "+selectStr);
       throw new SystemException(e.getMessage(), e);
       //return null;
      }
     finally
      {
       try {if (set != null) set.close();}             catch (SQLException e) {}
       try {if (statement != null) statement.close();} catch (SQLException e) {}
       if(connection != super.getConnection())
        {
         try{connection.close();} catch(SQLException e){}
        }
      }


     } // end of getFilteredCodeArray


    public ENServicesFromSideObject getObjectNOSEGR(int uid) throws PersistenceException
    {
     ENServicesFromSideObject result = new ENServicesFromSideObject();
     result.code = uid;
     loadObjectNOSEGR(result);
     if(result.code == Integer.MIN_VALUE)
      return null;
     return result;
    }


   public void loadObjectNOSEGR(ENServicesFromSideObject anObject) throws PersistenceException
    {
     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet set = null;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     /*
     SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesFromSideObject.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
     if(segregationInfo.isAccessDenied())
       throw new PersistenceException("{%ENServicesFromSideObject.getObject%} access denied");
      */


     selectStr = " SELECT  ENSERVICESFROMSIDEBJCT.CODE, ENSERVICESFROMSIDEBJCT.CONTRACTNUMBER, ENSERVICESFROMSIDEBJCT.CONTRACTDATE, ENSERVICESFROMSIDEBJCT.NAME, "
     		+ " ENSERVICESFROMSIDEBJCT.PARTNERCODE, ENSERVICESFROMSIDEBJCT.FINDOCCODE, ENSERVICESFROMSIDEBJCT.FINDOCID, ENSERVICESFROMSIDEBJCT.COMMENTGEN, "
     		+ " ENSERVICESFROMSIDEBJCT.USERGEN, ENSERVICESFROMSIDEBJCT.DATEEDIT, ENSERVICESFROMSIDEBJCT.DOMAIN_INFO, ENSERVICESFROMSIDEBJCT.MODIFY_TIME, "
     		+ " ENSERVICESFROMSIDEBJCT.DEPARTMENTCODE, ENSERVICESFROMSIDEBJCT.ELEMENTCODE, ENSERVICESFROMSIDEBJCT.GENERALCONTRACTREFCODE "
			+ " FROM ENSERVICESFROMSIDEBJCT WHERE ENSERVICESFROMSIDEBJCT.CODE = ? ";

     /*
     String segregationWhereStr = SegregationQueryBuilder.addWhere("ENSERVICESFROMSIDEBJCT",segregationInfo,getUserProfile().getDomainInfo());
     if(segregationWhereStr.length() > 0)
      selectStr = selectStr + " AND " + segregationWhereStr;
     */

     try
      {
       statement = connection.prepareStatement(selectStr);
       statement.setInt(1,anObject.code);
       set = statement.executeQuery();
       if(!set.next())
        anObject.code = Integer.MIN_VALUE;
       else
        {
         anObject.code = set.getInt(1);
         anObject.contractNumber = set.getString(2);
         anObject.contractDate = set.getDate(3);
         anObject.name = set.getString(4);
         anObject.partnerCode = set.getString(5);
         anObject.finDocCode = set.getString(6);
         anObject.finDocID = set.getInt(7);
         if ( set.wasNull() )
            anObject.finDocID = Integer.MIN_VALUE;
         anObject.commentGen = set.getString(8);
         anObject.userGen = set.getString(9);
         anObject.dateEdit = set.getDate(10);
         anObject.domain_info = set.getString(11);
         anObject.modify_time = set.getLong(12);
         if(set.wasNull())
          anObject.modify_time = Long.MIN_VALUE;

         anObject.department.code = set.getInt(13);
         if ( set.wasNull() )
             anObject.department.code = Integer.MIN_VALUE;

         anObject.element.code = set.getInt(14);
         if ( set.wasNull() )
             anObject.element.code = Integer.MIN_VALUE;

         anObject.generalContractRef.code = set.getInt(15);
         if (set.wasNull()) {
        	 anObject.generalContractRef.code = Integer.MIN_VALUE;
         }

       }
     }
     catch(SQLException e)
      {
       System.out.println(e.getMessage()+"\nstatement - "+selectStr);
       throw new SystemException(e.getMessage(), e);
      }
     finally
      {
       try {if(set != null) set.close(); if (statement != null) statement.close();}
       catch (SQLException e) {}
       if(connection != super.getConnection())
        {
         try{connection.close();} catch(SQLException e){}
        }
      }
    }
   
   
   public int add(ENServicesFromSideObject anObject) throws PersistenceException {
	    anObject.statusRef.code = ENServFromSideStatus.DRAFT;
                  return add(anObject,true);
              }


              public int _collectAutoIncrementNumberProject()
	          throws PersistenceException {

                  SequenceKey hashKey = new SequenceKey("ENSERVICESFROMSIDEBJCT", "NUMBERPROJECT");
                  Integer nextSeqValue = null;
                  SequenceValue sequenceValue;
                  synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
                      if (sequenceValue == null) {
                          sequenceValue = getNewSequenceValue("ENSERVICESFROMSIDEBJCT", "NUMBERPROJECT");
                          _sequenceTable.put(hashKey, sequenceValue);
                      }
                      if (!sequenceValue.isNextValueAvailable()) {
	              sequenceValue = getNewSequenceValue("ENSERVICESFROMSIDEBJCT", "NUMBERPROJECT");
	              _sequenceTable.put(hashKey, sequenceValue);
	          }
	      }

	      nextSeqValue = sequenceValue.getNextValue();
	      if (nextSeqValue == null) {
	          throw new PersistenceException(
	                  "Can't obtain auto increment value from: RQORDER");
	      } else {

	          return nextSeqValue.intValue();
	      }
	  }

} // end of ENServicesFromSideObjectDAO

