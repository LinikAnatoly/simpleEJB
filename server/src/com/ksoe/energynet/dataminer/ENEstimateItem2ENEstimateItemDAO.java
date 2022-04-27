
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

import com.ksoe.energynet.dataminer.generated.ENEstimateItem2ENEstimateItemDAOGen;
import com.ksoe.energynet.valueobject.ENEstimateItem2ENEstimateItem;
import com.ksoe.energynet.valueobject.brief.ENEstimateItem2ENEstimateItemShort;
import com.ksoe.energynet.valueobject.lists.ENEstimateItem2ENEstimateItemShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENEstimateItem2ENEstimateItem;
  *
  */

public class ENEstimateItem2ENEstimateItemDAO extends ENEstimateItem2ENEstimateItemDAOGen {


  public ENEstimateItem2ENEstimateItemDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENEstimateItem2ENEstimateItemDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}



  public ENEstimateItem2ENEstimateItemShortList getScrollableFilteredList(ENEstimateItem2ENEstimateItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENEstimateItem2ENEstimateItemShortList result = new ENEstimateItem2ENEstimateItemShortList();
    ENEstimateItem2ENEstimateItemShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENESTIMATEITEM2NSTMTTM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENESTIMATEITEM2NSTMTTM.CODE"+
     ",ENESTIMATEITEM2NSTMTTM.COUNTGEN"+

      ", e1.CODE " +
      ", e1.COUNTGEN " +
      ", e1.COUNTFACT " +
      ", e1.PRICE " +
      ", e1.COST " +
      ", e1.DELIVERYTIME " +
      ", e1.USERGEN " +
      ", e1.DATEEDIT " +
      ", e2.CODE " +
      ", e2.COUNTGEN " +
      ", e2.COUNTFACT " +
      ", e2.PRICE " +
      ", e2.COST " +
      ", e2.DELIVERYTIME " +
      ", e2.USERGEN " +
      ", e2.DATEEDIT " +
      ", ENESTIMATEITEM2TYPE.CODE " +
      ", ENESTIMATEITEM2TYPE.NAME " +
     " FROM ENESTIMATEITEM2NSTMTTM " +
     ", ENESTIMATEITEM e1 " +
     ", ENESTIMATEITEM e2 " +
     ", ENESTIMATEITEM2TYPE " +
     //" WHERE "
    "";
     whereStr = " e1.CODE = ENESTIMATEITEM2NSTMTTM.ESTIMATEITEMINREFCODE" ; //+
      whereStr = whereStr +" AND e2.CODE = ENESTIMATEITEM2NSTMTTM.ESTIMATEITEMOUTREFCODE" ; //+
      whereStr = whereStr +" AND ENESTIMATEITEM2TYPE.CODE = ENESTIMATEITEM2NSTMTTM.TYPEREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENESTIMATEITEM2NSTMTTM.CODE IN ( SELECT ENESTIMATEITEM2NSTMTTM.CODE FROM ENESTIMATEITEM2NSTMTTM ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEM2NSTMTTM.CODE = ?";
        }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEM2NSTMTTM.COUNTGEN = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEM2NSTMTTM.MODIFY_TIME = ?";
        }
        if(aFilterObject.estimateItemInRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM2NSTMTTM.ESTIMATEITEMINREFCODE = ? ";
        }
        if(aFilterObject.estimateItemOutRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM2NSTMTTM.ESTIMATEITEMOUTREFCODE = ? ";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEM2NSTMTTM.TYPEREFCODE = ? ";
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
        if(aFilterObject.countGen != null){
            number++;
            aFilterObject.countGen = aFilterObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.estimateItemInRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.estimateItemInRef.code);
       }
       if(aFilterObject.estimateItemOutRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.estimateItemOutRef.code);
       }
       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.typeRef.code);
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

        anObject = new ENEstimateItem2ENEstimateItemShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.countGen = set.getBigDecimal(2);
        if(anObject.countGen != null)
            anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.estimateItemInRefCode = set.getInt(3);
        if(set.wasNull())
        anObject.estimateItemInRefCode = Integer.MIN_VALUE;
        anObject.estimateItemInRefCountGen = set.getBigDecimal(4);
        if(anObject.estimateItemInRefCountGen != null)
          anObject.estimateItemInRefCountGen = anObject.estimateItemInRefCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemInRefCountFact = set.getBigDecimal(5);
        if(anObject.estimateItemInRefCountFact != null)
          anObject.estimateItemInRefCountFact = anObject.estimateItemInRefCountFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemInRefPrice = set.getBigDecimal(6);
        if(anObject.estimateItemInRefPrice != null)
          anObject.estimateItemInRefPrice = anObject.estimateItemInRefPrice.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemInRefCost = set.getBigDecimal(7);
        if(anObject.estimateItemInRefCost != null)
          anObject.estimateItemInRefCost = anObject.estimateItemInRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemInRefDeliveryTime = set.getInt(8);
        if(set.wasNull())
        anObject.estimateItemInRefDeliveryTime = Integer.MIN_VALUE;
        anObject.estimateItemInRefUserGen = set.getString(9);
        anObject.estimateItemInRefDateEdit = set.getDate(10);
        anObject.estimateItemOutRefCode = set.getInt(11);
        if(set.wasNull())
        anObject.estimateItemOutRefCode = Integer.MIN_VALUE;
        anObject.estimateItemOutRefCountGen = set.getBigDecimal(12);
        if(anObject.estimateItemOutRefCountGen != null)
          anObject.estimateItemOutRefCountGen = anObject.estimateItemOutRefCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemOutRefCountFact = set.getBigDecimal(13);
        if(anObject.estimateItemOutRefCountFact != null)
          anObject.estimateItemOutRefCountFact = anObject.estimateItemOutRefCountFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemOutRefPrice = set.getBigDecimal(14);
        if(anObject.estimateItemOutRefPrice != null)
          anObject.estimateItemOutRefPrice = anObject.estimateItemOutRefPrice.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemOutRefCost = set.getBigDecimal(15);
        if(anObject.estimateItemOutRefCost != null)
          anObject.estimateItemOutRefCost = anObject.estimateItemOutRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemOutRefDeliveryTime = set.getInt(16);
        if(set.wasNull())
        anObject.estimateItemOutRefDeliveryTime = Integer.MIN_VALUE;
        anObject.estimateItemOutRefUserGen = set.getString(17);
        anObject.estimateItemOutRefDateEdit = set.getDate(18);
        anObject.typeRefCode = set.getInt(19);
        if(set.wasNull())
        anObject.typeRefCode = Integer.MIN_VALUE;
        anObject.typeRefName = set.getString(20);

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



} // end of ENEstimateItem2ENEstimateItemDAO

