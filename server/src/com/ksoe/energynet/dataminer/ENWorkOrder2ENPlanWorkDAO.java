
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENWorkOrder2ENPlanWorkDAOGen;
import com.ksoe.energynet.valueobject.ENWorkOrder2ENPlanWork;
import com.ksoe.energynet.valueobject.brief.ENWorkOrder2ENPlanWorkShort;
import com.ksoe.energynet.valueobject.filter.ENWorkOrder2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.lists.ENWorkOrder2ENPlanWorkShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENWorkOrder2ENPlanWork;
  *
  */

public class ENWorkOrder2ENPlanWorkDAO extends ENWorkOrder2ENPlanWorkDAOGen {


  public ENWorkOrder2ENPlanWorkDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENWorkOrder2ENPlanWorkDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  @Override
public ENWorkOrder2ENPlanWorkShortList getScrollableFilteredList(ENWorkOrder2ENPlanWork aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {
   ENWorkOrder2ENPlanWorkShortList result = new ENWorkOrder2ENPlanWorkShortList();
   ENWorkOrder2ENPlanWorkShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);

   if(orderBy.length() == 0)
    orderBy = "ENWORKORDER2ENPLANWORK.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "SELECT "+
    "ENWORKORDER2ENPLANWORK.CODE"+

     ", ENWORKORDER.CODE " +
     ", ENWORKORDER.WORKORDERNUMBER " +
     ", ENWORKORDER.DATEGEN " +
     ", ENWORKORDER.FINMOLNAME " +
     ", ENWORKORDER.FINMECHANICNAME " +
     ", ENWORKORDER.USERGEN " +
     ", ENWORKORDER.DATEEDIT " +
     ", ENPLANWORK.CODE " +
     ", ENPLANWORK.DATEGEN " +
     ", ENPLANWORK.DATESTART " +
     ", ENPLANWORK.DATEFINAL " +
     ", ENPLANWORK.YEARGEN " +
     ", ENPLANWORK.MONTHGEN " +
     ", ENPLANWORK.USERGEN " +
     ", ENPLANWORK.DATEEDIT " +
     ", ENPLANWORK.WORKORDERNUMBER " +
     ", ENPLANWORK.DATEWORKORDER " +
     ", ENPLANWORK.PRICONNECTIONNUMBER " +
    " FROM ENWORKORDER2ENPLANWORK " +
    ", ENWORKORDER " +
    ", ENPLANWORK " +
    //" WHERE "
    "";
    whereStr = " ENWORKORDER.CODE = ENWORKORDER2ENPLANWORK.WORKORDERCODE" ; //+
     whereStr = whereStr +" AND ENPLANWORK.CODE = ENWORKORDER2ENPLANWORK.PLANCODE" ; //+
        //selectStr = selectStr + " ${s} ENWORKORDER2ENPLANWORK.CODE IN ( SELECT ENWORKORDER2ENPLANWORK.CODE FROM ENWORKORDER2ENPLANWORK ";

//" ";
     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENWORKORDER2ENPLANWORK.CODE = ?";
       }

       if(aFilterObject.modify_time != Long.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENWORKORDER2ENPLANWORK.MODIFY_TIME = ?";
       }
       if(aFilterObject.workOrder.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENWORKORDER2ENPLANWORK.WORKORDERCODE = ? ";
       }
       if(aFilterObject.plan.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENWORKORDER2ENPLANWORK.PLANCODE = ? ";
       }

     }


     if(condition.length() != 0)
     {
        if(whereStr.length() != 0)
           whereStr = whereStr + " AND ";

        whereStr = whereStr + " (" + condition + ")";
     }
//+ " WHERE" +  сделано выше ????
    if(whereStr.length() != 0)
        selectStr = selectStr + " WHERE" + whereStr;

   // selectStr = selectStr + ") ";

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


       if(aFilterObject.modify_time != Long.MIN_VALUE){
           number++;
           if(aFilterObject.modify_time == Long.MIN_VALUE)
               statement.setBigDecimal(number,null);
           else
               statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
       }
      if(aFilterObject.workOrder.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.workOrder.code);
      }
      if(aFilterObject.plan.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.plan.code);
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

       anObject = new ENWorkOrder2ENPlanWorkShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;


       anObject.workOrderCode = set.getInt(2);

       anObject.workOrderWorkOrderNumber = set.getString(3);

       anObject.workOrderDateGen = set.getDate(4);

       anObject.workOrderFinMolName = set.getString(5);

       anObject.workOrderFinMechanicName = set.getString(6);

       anObject.workOrderUserGen = set.getString(7);

       anObject.workOrderDateEdit = set.getDate(8);

       anObject.planCode = set.getInt(9);

       anObject.planDateGen = set.getDate(10);

       anObject.planDateStart = set.getDate(11);

       anObject.planDateFinal = set.getDate(12);

       anObject.planYearGen = set.getInt(13);

       anObject.planMonthGen = set.getInt(14);

       anObject.planUserGen = set.getString(15);

       anObject.planDateEdit = set.getDate(16);

       anObject.planWorkOrderNumber = set.getString(17);

       anObject.planDateWorkOrder = set.getDate(18);

       anObject.planPriConnectionNumber = set.getString(19);

        result.list.add(anObject);
      }

     result.setTotalCount(i);
     return result;
    }
   catch(SQLException e)
    {
     System.out.println(e.getMessage()+"\nstatement - "+selectStr);
     EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
     return null;
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
  }



	public int[] getPlanCodeArray(
			ENWorkOrder2ENPlanWorkFilter aFilterObject, int fromPosition,
			int quantity) throws PersistenceException {
		return getPlanCodeArray(
				aFilterObject,
				(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL),
				(aFilterObject == null) ? (null) : (aFilterObject.orderBySQL),
				fromPosition, quantity, null);
	}

	public int[] getPlanCodeArray(ENWorkOrder2ENPlanWork aFilterObject,
			String anCondition, String anOrderBy, int fromPosition,
			int quantity, Vector aBindObjects) throws PersistenceException {
		Vector result = new Vector();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = " select enworkorder2enplanwork.plancode "
				+ " from enworkorder2enplanwork, enworkorder ";

		String whereStr = " enworkorder2enplanwork.workordercode = enworkorder.code ";

		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if (orderBy.length() == 0)
			orderBy = "ENWORKORDER2ENPLANWORK.CODE";

		if (quantity < 0)
			quantity = Integer.MAX_VALUE / 2;

		if (getUserProfile() == null)
			throw new PersistenceException(
					"Internal Error (User Profile Is Undefined)");

		if (aFilterObject != null) {
			if (aFilterObject.code != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "  ENWORKORDER2ENPLANWORK.CODE = ?";
			}

			if (aFilterObject.modify_time != Long.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr
						+ "  ENWORKORDER2ENPLANWORK.MODIFY_TIME = ?";
			}
			if (aFilterObject.workOrder.code != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr
						+ " ENWORKORDER2ENPLANWORK.WORKORDERCODE = ? ";
			}
			if (aFilterObject.plan.code != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + " ENWORKORDER2ENPLANWORK.PLANCODE = ? ";
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
        if (quantity>-1) selectStr = selectStr + " LIMIT " + quantity;

		try {
			statement = connection.prepareStatement(selectStr);
			int number = 0;
			if (aFilterObject != null) {
				if (aFilterObject.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.code);
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
				if (aFilterObject.workOrder.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.workOrder.code);
				}
				if (aFilterObject.plan.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.plan.code);
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

				result.add(new Integer(set.getInt(1)));
			}

			int[] array;

			array = new int[result.size()];
			for (int j = 0; j < result.size(); j++)
				array[j] = ((Integer) result.get(j)).intValue();

			return array;
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			throw new SystemException(e.getMessage(), e);
			// return null;
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

	} // end of getFilteredCodeArray


} // end of ENWorkOrder2ENPlanWorkDAO

