
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

import com.ksoe.energynet.dataminer.generated.ENTransportItem2TransportItemDAOGen;
import com.ksoe.energynet.valueobject.ENTransportItem2TransportItem;
import com.ksoe.energynet.valueobject.brief.ENTransportItem2TransportItemShort;
import com.ksoe.energynet.valueobject.lists.ENTransportItem2TransportItemShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENTransportItem2TransportItem;
  *
  */

public class ENTransportItem2TransportItemDAO extends ENTransportItem2TransportItemDAOGen {


  public ENTransportItem2TransportItemDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTransportItem2TransportItemDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}



  public ENTransportItem2TransportItemShortList getScrollableFilteredList(ENTransportItem2TransportItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENTransportItem2TransportItemShortList result = new ENTransportItem2TransportItemShortList();
    ENTransportItem2TransportItemShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRANSPRTTM2TRNSPRTTM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENTRANSPRTTM2TRNSPRTTM.CODE"+

      ", ENTRANSPORTITEM.CODE " +
      ", ENTRANSPORTITEM.COUNTWORKGEN " +
      ", ENTRANSPORTITEM.COUNTWORKFACT " +
      ", ENTRANSPORTITEM.PRICE " +
      ", ENTRANSPORTITEM.COST " +
      ", ENTRANSPORTITEM.USERGEN " +
      ", ENTRANSPORTITEM.DATEEDIT " +
      ", t1.CODE " +
      ", t1.COUNTWORKGEN " +
      ", t1.COUNTWORKFACT " +
      ", t1.PRICE " +
      ", t1.COST " +
      ", t1.USERGEN " +
      ", t1.DATEEDIT " +
     " FROM ENTRANSPRTTM2TRNSPRTTM " +
     ", ENTRANSPORTITEM " +
     ", ENTRANSPORTITEM t1" +
     //" WHERE "
    "";
     whereStr = " ENTRANSPORTITEM.CODE = ENTRANSPRTTM2TRNSPRTTM.INREFCODE" ; //+
      whereStr = whereStr +" AND t1.CODE = ENTRANSPRTTM2TRNSPRTTM.OUTREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENTRANSPRTTM2TRNSPRTTM.CODE IN ( SELECT ENTRANSPRTTM2TRNSPRTTM.CODE FROM ENTRANSPRTTM2TRNSPRTTM ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPRTTM2TRNSPRTTM.CODE = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPRTTM2TRNSPRTTM.MODIFY_TIME = ?";
        }
        if(aFilterObject.inRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPRTTM2TRNSPRTTM.INREFCODE = ? ";
        }
        if(aFilterObject.outRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPRTTM2TRNSPRTTM.OUTREFCODE = ? ";
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
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.inRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.inRef.code);
       }
       if(aFilterObject.outRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.outRef.code);
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

        anObject = new ENTransportItem2TransportItemShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;

        anObject.inRefCode = set.getInt(2);
        if(set.wasNull())
        anObject.inRefCode = Integer.MIN_VALUE;
        anObject.inRefCountWorkGen = set.getBigDecimal(3);
        if(anObject.inRefCountWorkGen != null)
          anObject.inRefCountWorkGen = anObject.inRefCountWorkGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.inRefCountWorkFact = set.getBigDecimal(4);
        if(anObject.inRefCountWorkFact != null)
          anObject.inRefCountWorkFact = anObject.inRefCountWorkFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.inRefPrice = set.getBigDecimal(5);
        if(anObject.inRefPrice != null)
          anObject.inRefPrice = anObject.inRefPrice.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.inRefCost = set.getBigDecimal(6);
        if(anObject.inRefCost != null)
          anObject.inRefCost = anObject.inRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.inRefUserGen = set.getString(7);
        anObject.inRefDateEdit = set.getDate(8);
        anObject.outRefCode = set.getInt(9);
        if(set.wasNull())
        anObject.outRefCode = Integer.MIN_VALUE;
        anObject.outRefCountWorkGen = set.getBigDecimal(10);
        if(anObject.outRefCountWorkGen != null)
          anObject.outRefCountWorkGen = anObject.outRefCountWorkGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.outRefCountWorkFact = set.getBigDecimal(11);
        if(anObject.outRefCountWorkFact != null)
          anObject.outRefCountWorkFact = anObject.outRefCountWorkFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.outRefPrice = set.getBigDecimal(12);
        if(anObject.outRefPrice != null)
          anObject.outRefPrice = anObject.outRefPrice.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.outRefCost = set.getBigDecimal(13);
        if(anObject.outRefCost != null)
          anObject.outRefCost = anObject.outRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.outRefUserGen = set.getString(14);
        anObject.outRefDateEdit = set.getDate(15);

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




} // end of ENTransportItem2TransportItemDAO

