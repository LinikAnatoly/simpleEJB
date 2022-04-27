
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

import com.ksoe.energynet.dataminer.generated.ENAccumulatorsDistanceDAOGen;
import com.ksoe.energynet.valueobject.ENAccumulatorsDistance;
import com.ksoe.energynet.valueobject.brief.ENAccumulatorsDistanceShort;
import com.ksoe.energynet.valueobject.lists.ENAccumulatorsDistanceShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENAccumulatorsDistance;
  *
  */

public class ENAccumulatorsDistanceDAO extends ENAccumulatorsDistanceDAOGen {


  public ENAccumulatorsDistanceDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENAccumulatorsDistanceDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public ENAccumulatorsDistanceShortList getScrollableFilteredList(ENAccumulatorsDistance aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENAccumulatorsDistanceShortList result = new ENAccumulatorsDistanceShortList();
    ENAccumulatorsDistanceShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACCUMULATORSDISTANCE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENACCUMULATORSDISTANCE.CODE"+
     ",ENACCUMULATORSDISTANCE.RECORDDISTANCE"+
     ",ENACCUMULATORSDISTANCE.RECORDTDATE"+

      ", ENACCUMULATORS.CODE " +
      ", ENACCUMULATORS.NAME " +
      ", ENACCUMULATORS.TYPENAME " +
      ", ENACCUMULATORS.FACTORY " +
      ", ENACCUMULATORS.GARAGENUMBER " +
      ", ENACCUMULATORS.YEARPRODUCTION " +
      ", ENACCUMULATORS.SERIALNUMBER " +
      ", ENACCUMULATORS.RECEIPTDATE " +
      ", ENACCUMULATORS.MILEAGE " +
      ", ENACCUMULATORS.MILEAGEALL " +
      ", ENACCUMULATORS.POTENCIAL " +
      ", ENACCUMULATORSDISTANCE.TRANSPORTREALREFCODE" +
      ", ENACCUMULATORSDISTANCE.TRAVELSHEETREFCODE" +

      " FROM ENACCUMULATORSDISTANCE " +
      ", ENACCUMULATORS " +
     //" WHERE "
    "";
     whereStr = " ENACCUMULATORS.CODE = ENACCUMULATORSDISTANCE.ACCUMULATORSREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENACCUMULATORSDISTANCE.CODE IN ( SELECT ENACCUMULATORSDISTANCE.CODE FROM ENACCUMULATORSDISTANCE ";

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSDISTANCE.CODE = ?";
        }
        if(aFilterObject.recordDistance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSDISTANCE.RECORDDISTANCE = ?";
        }
        if(aFilterObject.recordtDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSDISTANCE.RECORDTDATE = ?";
        }
        if(aFilterObject.accumulatorsRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACCUMULATORSDISTANCE.ACCUMULATORSREFCODE = ? ";
        }
        if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACCUMULATORSDISTANCE.TRANSPORTREALREFCODE = ? ";
        }
        if(aFilterObject.travelSheetRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACCUMULATORSDISTANCE.TRAVELSHEETREFCODE = ? ";
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
       if(aFilterObject.accumulatorsRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.accumulatorsRef.code);
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

        anObject = new ENAccumulatorsDistanceShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.recordDistance = set.getBigDecimal(2);
        if(anObject.recordDistance != null)
            anObject.recordDistance = anObject.recordDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.recordtDate = set.getDate(3);

        anObject.accumulatorsRefCode = set.getInt(4);
        if(set.wasNull())
        anObject.accumulatorsRefCode = Integer.MIN_VALUE;
        anObject.accumulatorsRefName = set.getString(5);
        anObject.accumulatorsRefTypeName = set.getString(6);
        anObject.accumulatorsRefFactory = set.getString(7);
        anObject.accumulatorsRefGarageNumber = set.getString(8);
        anObject.accumulatorsRefYearProduction = set.getString(9);
        anObject.accumulatorsRefSerialNumber = set.getString(10);
        anObject.accumulatorsRefReceiptDate = set.getDate(11);
        anObject.accumulatorsRefMileage = set.getBigDecimal(12);
        if(anObject.accumulatorsRefMileage != null)
          anObject.accumulatorsRefMileage = anObject.accumulatorsRefMileage.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.accumulatorsRefMileageAll = set.getBigDecimal(13);
        if(anObject.accumulatorsRefMileageAll != null)
          anObject.accumulatorsRefMileageAll = anObject.accumulatorsRefMileageAll.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.accumulatorsRefPotencial = set.getBigDecimal(14);
        if(anObject.accumulatorsRefPotencial != null)
          anObject.accumulatorsRefPotencial = anObject.accumulatorsRefPotencial.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.transportRealRefCode = set.getInt(15);
        if(set.wasNull())
        anObject.transportRealRefCode = Integer.MIN_VALUE;
        anObject.travelSheetRefCode = set.getInt(16);
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

} // end of ENAccumulatorsDistanceDAO

