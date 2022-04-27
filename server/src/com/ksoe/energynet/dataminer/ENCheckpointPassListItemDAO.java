
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENCheckpointPassListItemDAOGen;
import com.ksoe.energynet.valueobject.ENCheckpointPassListItem;
import com.ksoe.energynet.valueobject.brief.ENCheckpointPassListItemShort;
import com.ksoe.energynet.valueobject.lists.ENCheckpointPassListItemShortList;

/**
 * DAO Object for ENCheckpointPassListItem;
 *
 */

public class ENCheckpointPassListItemDAO extends ENCheckpointPassListItemDAOGen {

    public ENCheckpointPassListItemDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENCheckpointPassListItemDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    public static String processCondition(String aCondition)
    {
     if(aCondition == null || aCondition.length() == 0)
      return "";

     StringBuffer condition = new StringBuffer(aCondition);
     _checkConditionToken(condition,";"," ");
     _checkConditionToken(condition,"--"," ");
     _checkConditionToken(condition,"\r"," ");
     _checkConditionToken(condition,"\n"," ");
     _checkConditionToken(condition,"&&"," AND ");
     _checkConditionToken(condition,"==","=");
     _checkConditionToken(condition,"!=","<>");
     _checkConditionToken(condition,"code","ENCHECKPOINTPASSLISTTM.CODE");
     _checkConditionToken(condition,"dateevent","ENCHECKPOINTPASSLISTTM.DATEEVENT");
     _checkConditionToken(condition,"modify_time","ENCHECKPOINTPASSLISTTM.MODIFY_TIME");
     _checkConditionToken(condition,"usergen","ENCHECKPOINTPASSLISTTM.USERGEN");
     _checkConditionToken(condition,"dateedit","ENCHECKPOINTPASSLISTTM.DATEEDIT");
       // relationship conditions
     _checkConditionToken(condition,"transportrealref","TRANSPORTREALREFCODE");
     _checkConditionToken(condition,"transportrealref.code","TRANSPORTREALREFCODE");
     _checkConditionToken(condition,"checkpointpasslistref","CHECKPOINTPASSLISTRFCD");
     _checkConditionToken(condition,"checkpointpasslistref.code","CHECKPOINTPASSLISTRFCD");
     _checkConditionToken(condition,"eventtyperef","EVENTTYPEREFCODE");
     _checkConditionToken(condition,"eventtyperef.code","EVENTTYPEREFCODE");
     _checkConditionToken(condition,"travelsheetref","TRAVELSHEETREFCODE");
     _checkConditionToken(condition,"travelsheetref.code","TRAVELSHEETREFCODE");
     return condition.toString();
    }
    
    public ENCheckpointPassListItemShortList getScrollableFilteredList(ENCheckpointPassListItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
     ENCheckpointPassListItemShortList result = new ENCheckpointPassListItemShortList();
     ENCheckpointPassListItemShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     whereStr = "";
     String     condition = processCondition(anCondition);
     String     orderBy = processCondition(anOrderBy);

     if(orderBy.length() == 0)
      orderBy = "ENCHECKPOINTPASSLISTTM.CODE";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr = "SELECT "+
      "ENCHECKPOINTPASSLISTTM.CODE"+
      ",ENCHECKPOINTPASSLISTTM.DATEEVENT"+
      ",ENCHECKPOINTPASSLISTTM.USERGEN"+
      ",ENCHECKPOINTPASSLISTTM.DATEEDIT"+

       ", TKTRANSPORTREAL.CODE " +
       ", TKTRANSPORTREAL.NAME " +
       ", TKTRANSPORTREAL.INVNUMBER " +
       ", TKTRANSPORTREAL.GOSNUMBER " +
       ", ENCHECKPOINTPASSLIST.CODE " +
       ", ENCHECKPOINTPASSLIST.DATESTART " +
       ", ENCHECKPOINTPASSLIST.DATEFINAL " +
       ", ENCHECKPOINTPASSLIST.USERGEN " +
       ", ENCHECKPOINTPASSLIST.DATEEDIT " +
       ", ENCHECKPOINTEVENTTYPE.CODE " +
       ", ENCHECKPOINTEVENTTYPE.NAME " +
       ", ENTRAVELSHEET.CODE " +
       ", ENTRAVELSHEET.NUMBERGEN " +
       ", ENTRAVELSHEET.DATESTART " +
       ", ENTRAVELSHEET.DATEFINAL " +
       ", ENTRAVELSHEET.SPEEDOMETERSTART " +
       ", ENTRAVELSHEET.SPEEDOMETERFINAL " +
       ", ENTRAVELSHEET.FUELCOUNTERSTART " +
       ", ENTRAVELSHEET.FUELCOUNTERFINAL " +
       ", ENTRAVELSHEET.TIMESTART " +
       ", ENTRAVELSHEET.TIMEFINAL " +
       ", ENTRAVELSHEET.DATEEDIT " +
       ", ENTRAVELSHEET.USERGEN " +
       ", (SELECT ENCHECKPOINT.NAME FROM ENCHECKPOINT WHERE ENCHECKPOINT.CODE = ENCHECKPOINTPASSLIST.CHECKPOINTREFCODE)" + 
      " FROM ENCHECKPOINTPASSLISTTM LEFT JOIN ENTRAVELSHEET ON (ENTRAVELSHEET.CODE = ENCHECKPOINTPASSLISTTM.TRAVELSHEETREFCODE)" +
      ", TKTRANSPORTREAL " +
      ", ENCHECKPOINTPASSLIST " +
      ", ENCHECKPOINTEVENTTYPE " +
      " " +
      //" WHERE "
   "";
      whereStr = " TKTRANSPORTREAL.CODE = ENCHECKPOINTPASSLISTTM.TRANSPORTREALREFCODE" ; //+
       whereStr = whereStr +" AND ENCHECKPOINTPASSLIST.CODE = ENCHECKPOINTPASSLISTTM.CHECKPOINTPASSLISTRFCD" ; //+
       whereStr = whereStr +" AND ENCHECKPOINTEVENTTYPE.CODE = ENCHECKPOINTPASSLISTTM.EVENTTYPEREFCODE" ; //+
     //selectStr = selectStr + " ${s} ENCHECKPOINTPASSLISTTM.CODE IN ( SELECT ENCHECKPOINTPASSLISTTM.CODE FROM ENCHECKPOINTPASSLISTTM ";

 // " ";
       if(aFilterObject != null)
       {
         if(aFilterObject.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENCHECKPOINTPASSLISTTM.CODE = ?";
         }
         if(aFilterObject.dateEvent != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENCHECKPOINTPASSLISTTM.DATEEVENT = ?";
         }
         if(aFilterObject.modify_time != Long.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENCHECKPOINTPASSLISTTM.MODIFY_TIME = ?";
         }
          if (aFilterObject.userGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENCHECKPOINTPASSLISTTM.USERGEN) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENCHECKPOINTPASSLISTTM.USERGEN) LIKE UPPER(?)";
          }
         if(aFilterObject.dateEdit != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENCHECKPOINTPASSLISTTM.DATEEDIT = ?";
         }
         if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENCHECKPOINTPASSLISTTM.TRANSPORTREALREFCODE = ? ";
         }
         if(aFilterObject.checkpointPassListRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENCHECKPOINTPASSLISTTM.CHECKPOINTPASSLISTRFCD = ? ";
         }
         if(aFilterObject.eventTypeRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENCHECKPOINTPASSLISTTM.EVENTTYPEREFCODE = ? ";
         }
         if(aFilterObject.travelSheetRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENCHECKPOINTPASSLISTTM.TRAVELSHEETREFCODE = ? ";
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

     selectStr = selectStr + " OFFSET " + fromPosition;
     if (quantity>-1) selectStr = selectStr + " LIMIT " + quantity;

     try
      {
       statement = connection.prepareStatement(selectStr);
       int number = 0;
       if(aFilterObject != null){
          if(aFilterObject.code != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.code);
          }
         if(aFilterObject.dateEvent != null){
             number++;
             statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEvent.getTime()));
         }
         if(aFilterObject.modify_time != Long.MIN_VALUE){
             number++;
             if(aFilterObject.modify_time == Long.MIN_VALUE)
                 statement.setBigDecimal(number,null);
             else
                 statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
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
         if(aFilterObject.dateEdit != null){
             number++;
             statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
         }
        if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.transportRealRef.code);
        }
        if(aFilterObject.checkpointPassListRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.checkpointPassListRef.code);
        }
        if(aFilterObject.eventTypeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.eventTypeRef.code);
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
       for (i = 0; set.next(); i++) {
         /*
         if (i < fromPosition)
           continue;
         else if (i >= fromPosition + quantity) {
           i++;
           break;
         } */

         anObject = new ENCheckpointPassListItemShort();

         anObject.code = set.getInt(1);
         if ( set.wasNull() )
             anObject.code = Integer.MIN_VALUE;
         anObject.dateEvent = set.getTimestamp(2);
         anObject.userGen = set.getString(3);
         anObject.dateEdit = set.getTimestamp(4);

         anObject.transportRealRefCode = set.getInt(5);
     if(set.wasNull())
       anObject.transportRealRefCode = Integer.MIN_VALUE;
         anObject.transportRealRefName = set.getString(6);
         anObject.transportRealRefInvNumber = set.getString(7);
         anObject.transportRealRefGosNumber = set.getString(8);
         anObject.checkpointPassListRefCode = set.getInt(9);
     if(set.wasNull())
       anObject.checkpointPassListRefCode = Integer.MIN_VALUE;
         anObject.checkpointPassListRefDateStart = set.getTimestamp(10);
         anObject.checkpointPassListRefDateFinal = set.getTimestamp(11);
         anObject.checkpointPassListRefUserGen = set.getString(12);
         anObject.checkpointPassListRefDateEdit = set.getTimestamp(13);
         anObject.eventTypeRefCode = set.getInt(14);
     if(set.wasNull())
       anObject.eventTypeRefCode = Integer.MIN_VALUE;
         anObject.eventTypeRefName = set.getString(15);
         anObject.travelSheetRefCode = set.getInt(16);
     if(set.wasNull())
       anObject.travelSheetRefCode = Integer.MIN_VALUE;
         anObject.travelSheetRefNumberGen = set.getString(17);
         anObject.travelSheetRefDateStart = set.getDate(18);
         anObject.travelSheetRefDateFinal = set.getDate(19);
         anObject.travelSheetRefSpeedometerStart = set.getBigDecimal(20);
         if(anObject.travelSheetRefSpeedometerStart != null)
           anObject.travelSheetRefSpeedometerStart = anObject.travelSheetRefSpeedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.travelSheetRefSpeedometerFinal = set.getBigDecimal(21);
         if(anObject.travelSheetRefSpeedometerFinal != null)
           anObject.travelSheetRefSpeedometerFinal = anObject.travelSheetRefSpeedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.travelSheetRefFuelCounterStart = set.getBigDecimal(22);
         if(anObject.travelSheetRefFuelCounterStart != null)
           anObject.travelSheetRefFuelCounterStart = anObject.travelSheetRefFuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.travelSheetRefFuelCounterFinal = set.getBigDecimal(23);
         if(anObject.travelSheetRefFuelCounterFinal != null)
           anObject.travelSheetRefFuelCounterFinal = anObject.travelSheetRefFuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.travelSheetRefTimeStart = set.getTimestamp(24);
         anObject.travelSheetRefTimeFinal = set.getTimestamp(25);
         anObject.travelSheetRefDateEdit = set.getTimestamp(26);
         anObject.travelSheetRefUserGen = set.getString(27);
         anObject.checkpointName = set.getString(28);

          result.list.add(anObject);
        }

       result.setTotalCount(i);
       return result;
      }
     catch(SQLException e)
      {
       System.out.println(e.getMessage()+"\nstatement - "+selectStr);
       throw new SystemException(e.getMessage(), e);
       //return null;
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


} // end of ENCheckpointPassListItemDAO
