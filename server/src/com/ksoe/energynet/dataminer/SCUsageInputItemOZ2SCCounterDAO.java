
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

import com.ksoe.energynet.dataminer.generated.SCUsageInputItemOZ2SCCounterDAOGen;
import com.ksoe.energynet.valueobject.SCUsageInputItemOZ2SCCounter;
import com.ksoe.energynet.valueobject.brief.SCUsageInputItemOZ2SCCounterShort;
import com.ksoe.energynet.valueobject.lists.SCUsageInputItemOZ2SCCounterShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for SCUsageInputItemOZ2SCCounter;
  *
  */

public class SCUsageInputItemOZ2SCCounterDAO extends SCUsageInputItemOZ2SCCounterDAOGen {


  public SCUsageInputItemOZ2SCCounterDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public SCUsageInputItemOZ2SCCounterDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}



  public SCUsageInputItemOZ2SCCounterShortList getScrollableFilteredList(SCUsageInputItemOZ2SCCounter aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    SCUsageInputItemOZ2SCCounterShortList result = new SCUsageInputItemOZ2SCCounterShortList();
    SCUsageInputItemOZ2SCCounterShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "SCUSAGEINPUTTMZ2SCCNTR.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "SCUSAGEINPUTTMZ2SCCNTR.CODE"+

      ", SCUSAGEINPUTITEMOZ.CODE " +
      ", SCUSAGEINPUTITEMOZ.NUMBERDOC " +
      ", SCUSAGEINPUTITEMOZ.COUNTERTYPE " +
      ", SCUSAGEINPUTITEMOZ.ACCOUNT " +
      ", SCUSAGEINPUTITEMOZ.COST " +
      ", SCUSAGEINPUTITEMOZ.COUNTGEN " +
      ", SCUSAGEINPUTITEMOZ.SCCODE " +
      ", SCCOUNTER.CODE " +
      ", SCCOUNTER.INVNUMBER " +
      ", SCCOUNTER.NAME " +
      ", SCCOUNTER.BUILDNUMBER " +
      ", SCCOUNTER.ACCOUNT " +
      ", SCCOUNTER.DEPARTMETFKCODE " +
      ", SCCOUNTER.MOLCODE " +
      ", SCCOUNTER.DATEIN " +
      ", SCCOUNTER.DATEBUILD " +
      ", SCCOUNTER.DATECHECK " +
      ", SCCOUNTER.COST " +
      ", SCCOUNTER.SCCODE " +
      ", SCCOUNTER.COUNTERTYPE " +
      ", SCCOUNTER.INSTALLORDERNUMBER " +
      ", SCCOUNTER.READING " +
      ", SCCOUNTER.DATEEDIT " +

      ", SCCOUNTER.ESTIMATEITEMREFCODE " +

     " FROM SCUSAGEINPUTTMZ2SCCNTR " +
     ", SCUSAGEINPUTITEMOZ " +
     ", SCCOUNTER " +
     //" WHERE "
    "";
     whereStr = " SCUSAGEINPUTITEMOZ.CODE = SCUSAGEINPUTTMZ2SCCNTR.OZREFCODE" ; //+
      whereStr = whereStr +" AND SCCOUNTER.CODE = SCUSAGEINPUTTMZ2SCCNTR.SCCOUNTERREFCODE" ; //+
        //selectStr = selectStr + " ${s} SCUSAGEINPUTTMZ2SCCNTR.CODE IN ( SELECT SCUSAGEINPUTTMZ2SCCNTR.CODE FROM SCUSAGEINPUTTMZ2SCCNTR ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTTMZ2SCCNTR.CODE = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTTMZ2SCCNTR.MODIFY_TIME = ?";
        }
        if(aFilterObject.ozRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "SCUSAGEINPUTTMZ2SCCNTR.OZREFCODE = ? ";
        }
        if(aFilterObject.scCounterRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "SCUSAGEINPUTTMZ2SCCNTR.SCCOUNTERREFCODE = ? ";
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
       if(aFilterObject.ozRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.ozRef.code);
       }
       if(aFilterObject.scCounterRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.scCounterRef.code);
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

        anObject = new SCUsageInputItemOZ2SCCounterShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;

        anObject.ozRefCode = set.getInt(2);
        if(set.wasNull())
        anObject.ozRefCode = Integer.MIN_VALUE;
        anObject.ozRefNumberDoc = set.getString(3);
        anObject.ozRefCounterType = set.getString(4);
        anObject.ozRefAccount = set.getString(5);
        anObject.ozRefCost = set.getBigDecimal(6);
        if(anObject.ozRefCost != null)
          anObject.ozRefCost = anObject.ozRefCost.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ozRefCountGen = set.getInt(7);
        if(set.wasNull())
        anObject.ozRefCountGen = Integer.MIN_VALUE;
        anObject.ozRefScCode = set.getInt(8);
        if(set.wasNull())
        anObject.ozRefScCode = Integer.MIN_VALUE;
        anObject.scCounterRefCode = set.getInt(9);
        if(set.wasNull())
        anObject.scCounterRefCode = Integer.MIN_VALUE;
        anObject.scCounterRefInvNumber = set.getString(10);
        anObject.scCounterRefName = set.getString(11);
        anObject.scCounterRefBuildNumber = set.getString(12);
        anObject.scCounterRefAccount = set.getString(13);
        anObject.scCounterRefDepartmetFKCode = set.getString(14);
        anObject.scCounterRefMolCode = set.getString(15);
        anObject.scCounterRefDateIn = set.getDate(16);
        anObject.scCounterRefDateBuild = set.getDate(17);
        anObject.scCounterRefDateCheck = set.getDate(18);
        anObject.scCounterRefCost = set.getBigDecimal(19);
        if(anObject.scCounterRefCost != null)
          anObject.scCounterRefCost = anObject.scCounterRefCost.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.scCounterRefScCode = set.getInt(20);
        if(set.wasNull())
        anObject.scCounterRefScCode = Integer.MIN_VALUE;
        anObject.scCounterRefCounterType = set.getString(21);
        anObject.scCounterRefInstallOrderNumber = set.getString(22);
        anObject.scCounterRefReading = set.getString(23);
        anObject.scCounterRefDateEdit = set.getTimestamp(24);

        anObject.scCounterEstimateItemRefCode = set.getInt(25);

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




} // end of SCUsageInputItemOZ2SCCounterDAO

