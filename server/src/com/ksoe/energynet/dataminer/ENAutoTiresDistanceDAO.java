
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

import com.ksoe.energynet.dataminer.generated.ENAutoTiresDistanceDAOGen;
import com.ksoe.energynet.valueobject.ENAutoTiresDistance;
import com.ksoe.energynet.valueobject.brief.ENAutoTiresDistanceShort;
import com.ksoe.energynet.valueobject.lists.ENAutoTiresDistanceShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENAutoTiresDistance;
  *
  */

public class ENAutoTiresDistanceDAO extends ENAutoTiresDistanceDAOGen {


  public ENAutoTiresDistanceDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENAutoTiresDistanceDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public ENAutoTiresDistanceShortList getScrollableFilteredList(ENAutoTiresDistance aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENAutoTiresDistanceShortList result = new ENAutoTiresDistanceShortList();
    ENAutoTiresDistanceShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENAUTOTIRESDISTANCE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENAUTOTIRESDISTANCE.CODE"+
     ",ENAUTOTIRESDISTANCE.RECORDDISTANCE"+
     ",ENAUTOTIRESDISTANCE.RECORDTDATE"+

     ", ENAUTOTIRES.CODE " +
     ", ENAUTOTIRES.TYPENAME " +
     ", ENAUTOTIRES.GARAGENUMBER " +
     ", ENAUTOTIRES.SERIALNUMBER " +
     ", ENAUTOTIRES.FACTORY " +
     ", ENAUTOTIRES.POTENCIAL " +
     ", ENAUTOTIRES.DISTANCEALL " +
     ", ENAUTOTIRES.NOMINAL " +
     ", ENAUTOTIRESDISTANCE.TRANSPORTREALREFCODE" +
     ", ENAUTOTIRESDISTANCE.TRAVELSHEETREFCODE" +

     " FROM ENAUTOTIRESDISTANCE " +
     ", ENAUTOTIRES " +
     //" WHERE "
    "";
     whereStr = " ENAUTOTIRES.CODE = ENAUTOTIRESDISTANCE.TIRESREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENAUTOTIRESDISTANCE.CODE IN ( SELECT ENAUTOTIRESDISTANCE.CODE FROM ENAUTOTIRESDISTANCE ";

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESDISTANCE.CODE = ?";
        }
        if(aFilterObject.recordDistance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESDISTANCE.RECORDDISTANCE = ?";
        }
        if(aFilterObject.recordtDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESDISTANCE.RECORDTDATE = ?";
        }
        if(aFilterObject.tiresRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENAUTOTIRESDISTANCE.TIRESREFCODE = ? ";
        }
        if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENAUTOTIRESDISTANCE.TRANSPORTREALREFCODE = ? ";
        }
        if(aFilterObject.travelSheetRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENAUTOTIRESDISTANCE.TRAVELSHEETREFCODE = ? ";
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
        if(aFilterObject.recordDistance != null){
            number++;
            aFilterObject.recordDistance = aFilterObject.recordDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.recordDistance);
        }
        if(aFilterObject.recordtDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.recordtDate.getTime()));
        }
       if(aFilterObject.tiresRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.tiresRef.code);
       }
       if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportRealRef.code);
       }
       if(aFilterObject.travelSheetRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.travelSheetRef.code);
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

        anObject = new ENAutoTiresDistanceShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.recordDistance = set.getBigDecimal(2);
        if(anObject.recordDistance != null)
            anObject.recordDistance = anObject.recordDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.recordtDate = set.getDate(3);

        anObject.tiresRefCode = set.getInt(4);
        if(set.wasNull())
        anObject.tiresRefCode = Integer.MIN_VALUE;
        anObject.tiresRefTypeName = set.getString(5);
        anObject.tiresRefGarageNumber = set.getString(6);
        anObject.tiresRefSerialNumber = set.getString(7);
        anObject.tiresRefFactory = set.getString(8);
        anObject.tiresRefPotencial = set.getBigDecimal(9);
        if(anObject.tiresRefPotencial != null)
          anObject.tiresRefPotencial = anObject.tiresRefPotencial.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.tiresRefDistanceAll = set.getBigDecimal(10);
        if(anObject.tiresRefDistanceAll != null)
          anObject.tiresRefDistanceAll = anObject.tiresRefDistanceAll.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.tiresRefNominal = set.getString(11);
        anObject.transportRealRefCode = set.getInt(12);
        if(set.wasNull())
        anObject.transportRealRefCode = Integer.MIN_VALUE;
        anObject.travelSheetRefCode = set.getInt(13);
        if(set.wasNull())
        anObject.travelSheetRefCode = Integer.MIN_VALUE;

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

} // end of ENAutoTiresDistanceDAO

