
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENAct2ENPlanWorkDAOGen;
import com.ksoe.energynet.valueobject.ENAct2ENPlanWork;
import com.ksoe.energynet.valueobject.brief.ENAct2ENPlanWorkShort;
import com.ksoe.energynet.valueobject.filter.ENAct2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.lists.ENAct2ENPlanWorkShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENAct2ENPlanWork;
  *
  */

public class ENAct2ENPlanWorkDAO extends ENAct2ENPlanWorkDAOGen {


  public ENAct2ENPlanWorkDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENAct2ENPlanWorkDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public List<Integer> getListOfPlanCodesByActCode(int actCode) throws PersistenceException {
	  if(actCode == Integer.MIN_VALUE) throw new java.lang.NullPointerException();
	  ENAct2ENPlanWorkFilter filter = new ENAct2ENPlanWorkFilter();
	  filter.actRef.code = actCode;
	  return this.getListOfPropertyValues(String.format("%s::integer", ENAct2ENPlanWork.plan_QFielld), filter, 0, -1, null);
  }
  @Override
public ENAct2ENPlanWorkShortList getScrollableFilteredList(ENAct2ENPlanWork aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {
   ENAct2ENPlanWorkShortList result = new ENAct2ENPlanWorkShortList();
   ENAct2ENPlanWorkShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);

   if(orderBy.length() == 0)
    orderBy = "ENACT2ENPLANWORK.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "SELECT "+
    "ENACT2ENPLANWORK.CODE"+

     ", ENACT.CODE " +
     ", ENACT.NUMBERGEN " +
     ", ENACT.DATEGEN " +
     ", ENACT.FINMOLNAME " +
     ", ENACT.USERGEN " +
     ", ENACT.DATEEDIT " +
     ", ENPLANWORK.CODE " +
     ", ENPLANWORK.DATEGEN " +
     ", ENPLANWORK.DATESTART " +
     ", ENPLANWORK.DATEFINAL " +
     ", ENPLANWORK.YEARGEN " +
     ", ENPLANWORK.MONTHGEN " +
     ", ENPLANWORK.USERGEN " +
     ", ENPLANWORK.DATEEDIT " +
     ",ENPLANWORK.KINDCODE " +
     " ,ENPLANWORKKIND.NAME " +
     " , ENPLANWORK.TYPEREFCODE "+
     ", ENPLANWORKTYPE.NAME " +
    " FROM ENACT2ENPLANWORK " +
    ", ENACT " +
    ", ENPLANWORK " +
    ", ENPLANWORKKIND, ENPLANWORKTYPE "+
    //" WHERE "
    "";
    whereStr = " ENACT.CODE = ENACT2ENPLANWORK.ACTREFCODE" ; //+
     whereStr = whereStr +" AND ENPLANWORK.CODE = ENACT2ENPLANWORK.PLANCODE" ; //+
     whereStr = whereStr +" AND ENPLANWORK.TYPEREFCODE = ENPLANWORKTYPE.CODE ";
     whereStr = whereStr +" AND ENPLANWORK.KINDCODE = ENPLANWORKKIND.CODE ";

        //selectStr = selectStr + " ${s} ENACT2ENPLANWORK.CODE IN ( SELECT ENACT2ENPLANWORK.CODE FROM ENACT2ENPLANWORK ";

//" ";
     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2ENPLANWORK.CODE = ?";
       }
        
       if(aFilterObject.modify_time != Long.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2ENPLANWORK.MODIFY_TIME = ?";
       }
       if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENACT2ENPLANWORK.ACTREFCODE = ? ";
       }
       if(aFilterObject.plan.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENACT2ENPLANWORK.PLANCODE = ? ";
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
      if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.actRef.code);
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

       anObject = new ENAct2ENPlanWorkShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;


       anObject.actRefCode = set.getInt(2);

       anObject.actRefNumberGen = set.getString(3);

       anObject.actRefDateGen = set.getDate(4);

       anObject.actRefFinMolName = set.getString(5);

       anObject.actRefUserGen = set.getString(6);

       anObject.actRefDateEdit = set.getDate(7);

       anObject.planCode = set.getInt(8);

       anObject.planDateGen = set.getDate(9);

       anObject.planDateStart = set.getDate(10);

       anObject.planDateFinal = set.getDate(11);

       anObject.planYearGen = set.getInt(12);

       anObject.planMonthGen = set.getInt(13);

       anObject.planUserGen = set.getString(14);

       anObject.planDateEdit = set.getDate(15);

       anObject.kindCode = set.getInt(16);
       anObject.kindName = set.getString(17);

       anObject.typeCode = set.getInt(18);
       anObject.typeName = set.getString(19);


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


	@Override
	public ENAct2ENPlanWork getObject(int uid) throws PersistenceException {
		ENAct2ENPlanWork result = new ENAct2ENPlanWork();
		result.code = uid;
		loadObject(result);
		if (result.code == Integer.MIN_VALUE)
			return null;
		return result;
	}


	@Override
	public void loadObject(ENAct2ENPlanWork anObject)
			throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		if (getUserProfile() == null)
			throw new PersistenceException(
					"Internal Error (User Profile Is Undefined)");

	    selectStr =
	    "SELECT  ENACT2ENPLANWORK.CODE,  ENACT2ENPLANWORK.MODIFY_TIME, ENACT2ENPLANWORK.ACTREFCODE, ENACT2ENPLANWORK.PLANCODE "
	    +" FROM ENACT2ENPLANWORK WHERE ENACT2ENPLANWORK.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1, anObject.code);
			set = statement.executeQuery();
			if (!set.next())
				anObject.code = Integer.MIN_VALUE;
			else {
				anObject.code = set.getInt(1);
				anObject.modify_time = set.getLong(2);
				if (set.wasNull())
					anObject.modify_time = Long.MIN_VALUE;
				anObject.actRef.code = set.getInt(3);
				if (set.wasNull())
					anObject.actRef.code = Integer.MIN_VALUE;
				anObject.plan.code = set.getInt(4);
				if (set.wasNull())
					anObject.plan.code = Integer.MIN_VALUE;

			}
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (set != null)
					set.close();
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


} // end of ENAct2ENPlanWorkDAO

