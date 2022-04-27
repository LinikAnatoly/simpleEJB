
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

import com.ksoe.energynet.dataminer.generated.ENDestinationPoint2PointDAOGen;
import com.ksoe.energynet.valueobject.ENDestinationPoint2Point;
import com.ksoe.energynet.valueobject.brief.ENDestinationPoint2PointShort;
import com.ksoe.energynet.valueobject.lists.ENDestinationPoint2PointShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENDestinationPoint2Point;
  *
  */

public class ENDestinationPoint2PointDAO extends ENDestinationPoint2PointDAOGen {

  public ENDestinationPoint2PointDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENDestinationPoint2PointDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}



  public ENDestinationPoint2PointShortList getScrollableFilteredList(ENDestinationPoint2Point aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENDestinationPoint2PointShortList result = new ENDestinationPoint2PointShortList();
    ENDestinationPoint2PointShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENDESTINATIONPOINT2PNT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = " select " +
    		" endestinationpoint2pnt.code, " +
    		" endestinationpoint2pnt.distance, " +
    		" elin.code, " +
    		" elout.code " +

    		" from endestinationpoint2pnt, " +
    		" enelement as elin, " +
    		" enelement as elout " +

    		"";

      whereStr = " elin.code = endestinationpoint2pnt.elementinrefcode ";
      whereStr = whereStr + " and elout.code = endestinationpoint2pnt.elementoutrefcode ";

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDESTINATIONPOINT2PNT.CODE = ?";
        }
        if(aFilterObject.distance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDESTINATIONPOINT2PNT.DISTANCE = ?";
        }
        if(aFilterObject.elementInRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENDESTINATIONPOINT2PNT.ELEMENTINREFCODE = ? ";
        }
        if(aFilterObject.elementOutRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENDESTINATIONPOINT2PNT.ELEMENTOUTREFCODE = ? ";
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
       if(aFilterObject.elementInRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.elementInRef.code);
       }
       if(aFilterObject.elementOutRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.elementOutRef.code);
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

        anObject = new ENDestinationPoint2PointShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.distance = set.getBigDecimal(2);
        if(anObject.distance != null)
            anObject.distance = anObject.distance.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.elementInRefCode = set.getInt(3);
		if(set.wasNull())
		   anObject.elementInRefCode = Integer.MIN_VALUE;
        anObject.elementOutRefCode = set.getInt(4);
		if(set.wasNull())
		   anObject.elementOutRefCode = Integer.MIN_VALUE;

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



} // end of ENDestinationPoint2PointDAO

