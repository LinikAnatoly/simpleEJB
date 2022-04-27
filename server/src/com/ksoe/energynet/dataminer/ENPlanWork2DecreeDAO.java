
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENPlanWork2DecreeDAOGen;
import com.ksoe.energynet.valueobject.ENPlanWork2Decree;
import com.ksoe.energynet.valueobject.brief.ENPlanWork2DecreeShort;
import com.ksoe.energynet.valueobject.lists.ENPlanWork2DecreeShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENPlanWork2Decree;
 *
 */

public class ENPlanWork2DecreeDAO extends ENPlanWork2DecreeDAOGen {

    public ENPlanWork2DecreeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENPlanWork2DecreeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


	@Override
	public ENPlanWork2DecreeShortList getScrollableFilteredList(
			ENPlanWork2Decree aFilterObject, String anCondition,
			String anOrderBy, int fromPosition, int quantity,
			Vector aBindObjects) throws PersistenceException {

		ENPlanWork2DecreeShortList result = new ENPlanWork2DecreeShortList();
		ENPlanWork2DecreeShort anObject;
		result.list = new Vector();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if (orderBy.length() == 0)
			orderBy = "ENPLANWORK2DECREE.CODE";

		if (quantity < 0)
			quantity = Integer.MAX_VALUE / 2;

		if (getUserProfile() == null)
			throw new PersistenceException(
					"Internal Error (User Profile Is Undefined)");

		selectStr = "SELECT " +
	      "ENPLANWORK2DECREE.CODE"+
	      ",ENPLANWORK2DECREE.USERGEN"+
	      ",ENPLANWORK2DECREE.DATEEDIT"+

	       ", ENPLANWORK.CODE " +
	       ", ENPLANWORK.DATEGEN " +
	       ", ENPLANWORK.DATESTART " +
	       ", ENPLANWORK.DATEFINAL " +
	       ", ENPLANWORK.YEARGEN " +
	       ", ENPLANWORK.MONTHGEN " +
	       ", ENPLANWORK.YEARORIGINAL " +
	       ", ENPLANWORK.MONTHORIGINAL " +
	       ", ENPLANWORK.USERGEN " +
	       ", ENPLANWORK.DATEEDIT " +
	       ", ENWORKORDER.WORKORDERNUMBER " +
	       ", ENPLANWORK.DATEWORKORDER " +
	       ", ENPLANWORK.PRICONNECTIONNUMBER " +
	       ", ENPLANWORK.DATEENDPRICONNECTION " +
	       ", ENPLANWORK.INVESTWORKSDESCRIPTION " +
	       ", ENPLANWORK.SERVICESFSIDEFINID " +
	       ", ENPLANWORK.SERVICESFSIDECNNUM " +
	       ", ENPLANWORK.TOTALTIMEHOURS " +
	       ", ENPLANWORK.TOTALTIMEDAYS " +
	       ", ENPLANWORK.INVESTITEMNUMBER " +

 		   ", (select d.invnumber from enelementdata d where d.ecode = enplanwork.elementrefcode) as invnumber " +
           ", (select d.ename from enelementdata d where d.ecode = enplanwork.elementrefcode) as elementname " +


	       " FROM ENPLANWORK2DECREE, ENPLANWORK " +
		   " left join ENWORKORDER2ENPLANWORK on ENWORKORDER2ENPLANWORK.PLANCODE = ENPLANWORK.CODE " +
	       " left join ENWORKORDER on ENWORKORDER2ENPLANWORK.WORKORDERCODE = ENWORKORDER.CODE ";


		whereStr = " ENPLANWORK.CODE = ENPLANWORK2DECREE.PLANREFCODE";

		if (aFilterObject != null) {
			if (aFilterObject.code != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "  ENPLANWORK2DECREE.CODE = ?";
			}
			if (aFilterObject.decreeCode != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "  ENPLANWORK2DECREE.DECREECODE = ?";
			}
			if (aFilterObject.userGen != null) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				if (aFilterObject.userGen.indexOf('*', 0) < 0
						&& aFilterObject.userGen.indexOf('?', 0) < 0)
					whereStr = whereStr
							+ "  UPPER(ENPLANWORK2DECREE.USERGEN) = UPPER(?)";
				else
					whereStr = whereStr
							+ " UPPER(ENPLANWORK2DECREE.USERGEN) LIKE UPPER(?)";
			}
			if (aFilterObject.dateEdit != null) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "  ENPLANWORK2DECREE.DATEEDIT = ?";
			}
			if (aFilterObject.planRef.code != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "ENPLANWORK2DECREE.PLANREFCODE = ? ";
			}
		}


		if (condition.length() != 0) {
			if (whereStr.length() != 0)
				whereStr = whereStr + " AND ";

			whereStr = whereStr + " (" + condition + ")";
		}

		if (whereStr.length() != 0)
			selectStr = selectStr + " WHERE " + whereStr;

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
				if (aFilterObject.decreeCode != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.decreeCode);
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
					statement.setTimestamp(number, new java.sql.Timestamp(
							aFilterObject.dateEdit.getTime()));
				}
				if (aFilterObject.planRef.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.planRef.code);
				}
			}

			if (condition.length() > 0 && aBindObjects != null)
				_bindObjectsToPreparedStatement(statement, aBindObjects, number);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
		         /*
		         if (i < fromPosition)
		           continue;
		         else if (i >= fromPosition + quantity) {
		           i++;
		           break;
		         } */

				anObject = new ENPlanWork2DecreeShort();

				anObject.code = set.getInt(1);
				if (set.wasNull())
					anObject.code = Integer.MIN_VALUE;
				anObject.userGen = set.getString(2);
				anObject.dateEdit = set.getTimestamp(3);

				anObject.planRefCode = set.getInt(4);
				if (set.wasNull())
					anObject.planRefCode = Integer.MIN_VALUE;
				anObject.planRefDateGen = set.getTimestamp(5);
				anObject.planRefDateStart = set.getDate(6);
				anObject.planRefDateFinal = set.getDate(7);
				anObject.planRefYearGen = set.getInt(8);
				if (set.wasNull())
					anObject.planRefYearGen = Integer.MIN_VALUE;
				anObject.planRefMonthGen = set.getInt(9);
				if (set.wasNull())
					anObject.planRefMonthGen = Integer.MIN_VALUE;
				anObject.planRefYearOriginal = set.getInt(10);
				if (set.wasNull())
					anObject.planRefYearOriginal = Integer.MIN_VALUE;
				anObject.planRefMonthOriginal = set.getInt(11);
				if (set.wasNull())
					anObject.planRefMonthOriginal = Integer.MIN_VALUE;
				anObject.planRefUserGen = set.getString(12);
				anObject.planRefDateEdit = set.getDate(13);
				anObject.planRefWorkOrderNumber = set.getString(14);
				anObject.planRefDateWorkOrder = set.getDate(15);
				anObject.planRefPriConnectionNumber = set.getString(16);
				anObject.planRefDateEndPriConnection = set.getDate(17);
				anObject.planRefInvestWorksDescription = set.getString(18);
				anObject.planRefServicesFSideFinId = set.getInt(19);
				if (set.wasNull())
					anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;
				anObject.planRefServicesFSideCnNum = set.getString(20);
				anObject.planRefTotalTimeHours = set.getBigDecimal(21);
				if (anObject.planRefTotalTimeHours != null)
					anObject.planRefTotalTimeHours = anObject.planRefTotalTimeHours
							.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
				anObject.planRefTotalTimeDays = set.getBigDecimal(22);
				if (anObject.planRefTotalTimeDays != null)
					anObject.planRefTotalTimeDays = anObject.planRefTotalTimeDays
							.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
				anObject.planRefInvestItemNumber = set.getString(23);


				anObject.invNumber = set.getString(24);
				anObject.elementName = set.getString(25);


				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			throw new SystemException(e.getMessage(), e);
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


} // end of ENPlanWork2DecreeDAO
