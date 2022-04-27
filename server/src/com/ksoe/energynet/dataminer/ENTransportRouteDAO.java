
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

import com.ksoe.energynet.dataminer.generated.ENTransportRouteDAOGen;
import com.ksoe.energynet.valueobject.ENTransportRoute;
import com.ksoe.energynet.valueobject.brief.ENTransportRouteShort;
import com.ksoe.energynet.valueobject.lists.ENTransportRouteShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENTransportRoute;
  *
  */

public class ENTransportRouteDAO extends ENTransportRouteDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENTransportRouteDAO() {super();}
  //public ENTransportRouteDAO(Connection aConnection) {super(aConnection);}
  //public ENTransportRouteDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTransportRouteDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTransportRouteDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}



  public ENTransportRouteShortList getScrollableFilteredList(ENTransportRoute aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENTransportRouteShortList result = new ENTransportRouteShortList();
    ENTransportRouteShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRANSPORTROUTE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr =
    	    " select " +
    	    " entransportroute.code, " +
    	    " entransportroute.distance, " +
    	    " entransportroute.weight, " +
    	    " entransportroute.dateedit, " +
    	    " entransportroute.usergen, " +
    	    " estart.code, " +
    	    " (select ed.ename from enelementdata ed where ed.ecode = estart.code), " +
    	    " eend.code, " +
    	    " (select ed.ename from enelementdata ed where ed.ecode = eend.code), " +
    	    " coalesce(entransportroute.distancenew,0), " +
    	    " enplanwork.code, " +
    	    " speedometerstart, " +
    	    " speedometerfinal, " +
    	    " entransportroute.parentrouterefcode, " +
    	    " entransportroute.fuelcounterstart, " +
    	    " entransportroute.fuelcounterfinal " +

    	    " from enelement as estart, enelement as eend, enplanwork, entransportroute ";


      whereStr = " estart.code = entransportroute.elementinrefcode ";
      whereStr = whereStr + " and eend.code = entransportroute.elementoutrefcode ";
      whereStr = whereStr + " and enplanwork.code = entransportroute.planrefcode ";


      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.CODE = ?";
        }
        if(aFilterObject.distance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.DISTANCE = ?";
        }
        if(aFilterObject.weight != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.WEIGHT = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTRANSPORTROUTE.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTRANSPORTROUTE.COMMENTGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.DATEEDIT = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTRANSPORTROUTE.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTRANSPORTROUTE.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTE.MODIFY_TIME = ?";
        }
        if(aFilterObject.elementInRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPORTROUTE.ELEMENTINREFCODE = ? ";
        }
        if(aFilterObject.elementOutRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPORTROUTE.ELEMENTOUTREFCODE = ? ";
        }
        if(aFilterObject.distanceRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPORTROUTE.DISTANCEREFCODE = ? ";
        }
        if(aFilterObject.distanceTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPORTROUTE.DISTANCETYPEREFCODE = ? ";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPORTROUTE.PLANREFCODE = ? ";
        }

        if(aFilterObject.parentRouteRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPORTROUTE.PARENTROUTEREFCODE = ? ";
        }

      }



      if(condition.length() != 0)
      {
         if(whereStr.length() != 0)
            whereStr = whereStr + " AND ";

         whereStr = whereStr + " (" + condition + ")";
      }
// + " WHERE" +  сделано выше ????
     if(whereStr.length() != 0)
         selectStr = selectStr + " WHERE " + whereStr;

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
        if(aFilterObject.distance != null){
            number++;
            aFilterObject.distance = aFilterObject.distance.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distance);
        }
        if(aFilterObject.weight != null){
            number++;
            aFilterObject.weight = aFilterObject.weight.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.weight);
        }

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
        if(aFilterObject.dateEdit != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
        }

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
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.elementInRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.elementInRef.code);
       }
       if(aFilterObject.elementOutRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.elementOutRef.code);
       }
       if(aFilterObject.distanceRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.distanceRef.code);
       }
       if(aFilterObject.distanceTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.distanceTypeRef.code);
       }
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
       }
       if(aFilterObject.parentRouteRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.parentRouteRef.code);
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


	  /*  " entransportroute.code, " +
	    " entransportroute.distance, " +
	    " entransportroute.weight, " +
	    " entransportroute.dateedit, " +
	    " entransportroute.usergen, " +
	    " estart.code, " +
	    " (select ed.ename from enelementdata ed where ed.ecode = estart.code), " +
	    " eend.code, " +
	    " (select ed.ename from enelementdata ed where ed.ecode = eend.code) " +  */

        anObject = new ENTransportRouteShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.distance = set.getBigDecimal(2);
        if(anObject.distance != null)
            anObject.distance = anObject.distance.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.weight = set.getBigDecimal(3);
        if(anObject.weight != null)
            anObject.weight = anObject.weight.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.dateEdit = set.getTimestamp(4);
        anObject.userGen = set.getString(5);

        anObject.elementInRefCode = set.getInt(6);
		if(set.wasNull())
		   anObject.elementInRefCode = Integer.MIN_VALUE;

		anObject.destinationPointStart = set.getString(7);

		anObject.elementOutRefCode = set.getInt(8);
        if(set.wasNull())
		   anObject.elementOutRefCode = Integer.MIN_VALUE;

        anObject.destinationPointEnd = set.getString(9);

        anObject.distanceNew = set.getBigDecimal(10);
        if(anObject.distanceNew != null)
            anObject.distanceNew = anObject.distanceNew.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);

		anObject.planRefCode = set.getInt(11);
        if(set.wasNull())
		   anObject.planRefCode = Integer.MIN_VALUE;

        anObject.speedometerStart = set.getBigDecimal(12);
        if(anObject.speedometerStart != null)
            anObject.speedometerStart = anObject.speedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.speedometerFinal = set.getBigDecimal(13);
        if(anObject.speedometerFinal != null)
            anObject.speedometerFinal = anObject.speedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.parentRouteRefCode = set.getInt(14);
        if ( set.wasNull() )
            anObject.parentRouteRefCode = Integer.MIN_VALUE;

        anObject.fuelCounterStart = set.getBigDecimal(15);
        if(anObject.fuelCounterStart != null)
            anObject.fuelCounterStart = anObject.fuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.fuelCounterFinal = set.getBigDecimal(16);
        if(anObject.fuelCounterFinal != null)
            anObject.fuelCounterFinal = anObject.fuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

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



} // end of ENTransportRouteDAO

