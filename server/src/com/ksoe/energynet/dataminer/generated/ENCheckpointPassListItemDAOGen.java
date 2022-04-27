
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer.generated;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


import java.util.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Connection;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.energynet.valueobject.ENCheckpointPassListItem;
import com.ksoe.energynet.valueobject.filter.ENCheckpointPassListItemFilter;
import com.ksoe.energynet.valueobject.brief.ENCheckpointPassListItemShort;
import com.ksoe.energynet.valueobject.lists.ENCheckpointPassListItemShortList;

import com.ksoe.techcard.dataminer.TKTransportRealDAO;

/**
 * DAO Object for ENCheckpointPassListItem;
 *
 */

public class ENCheckpointPassListItemDAOGen extends GenericDataMiner {

   public ENCheckpointPassListItemDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENCheckpointPassListItemDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   public boolean isEqual(ENCheckpointPassListItem inObject) throws PersistenceException
   {
      ENCheckpointPassListItem obj = new ENCheckpointPassListItem();
      obj.code = inObject.code;
      loadObject(obj);

	if(inObject.dateEvent == null && obj.dateEvent == null){}
	else
		if(inObject.dateEvent == null || obj.dateEvent == null) return false;
		else
			if (inObject.dateEvent.compareTo(obj.dateEvent) != 0){
				return false;
			}

	if(inObject.userGen == null && obj.userGen == null){}
	else
		if(inObject.userGen == null || obj.userGen == null) return false;
		else
			if ( ! inObject.userGen.equals(obj.userGen)){
				return false;
			}

	if(inObject.dateEdit == null && obj.dateEdit == null){}
	else
		if(inObject.dateEdit == null || obj.dateEdit == null) return false;
		else
			if (inObject.dateEdit.compareTo(obj.dateEdit) != 0){
				return false;
			}
     if (inObject.transportRealRef.code != obj.transportRealRef.code){
        return false;
     }
     if (inObject.checkpointPassListRef.code != obj.checkpointPassListRef.code){
        return false;
     }
     if (inObject.eventTypeRef.code != obj.eventTypeRef.code){
        return false;
     }
     if (inObject.travelSheetRef.code != obj.travelSheetRef.code){
        return false;
     }
      return true;
   }

   public int add(ENCheckpointPassListItem anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENCheckpointPassListItem anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

  anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENCHECKPOINTPASSLISTTM (CODE,DATEEVENT,MODIFY_TIME,USERGEN,DATEEDIT,TRANSPORTREALREFCODE,CHECKPOINTPASSLISTRFCD,EVENTTYPEREFCODE,TRAVELSHEETREFCODE) VALUES (?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.dateEvent == null)
        statement.setTimestamp(2,null);
      else
        statement.setTimestamp(2,new java.sql.Timestamp(anObject.dateEvent.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(3,null);
      else
        statement.setBigDecimal(3,new java.math.BigDecimal(anObject.modify_time));
      statement.setString(4,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(5,null);
      else
        statement.setTimestamp(5,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.transportRealRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).exists(anObject.transportRealRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENCheckpointPassListItem.transportRealRef.code%} = {%"+anObject.transportRealRef.code+"%}");
        statement.setInt(6,anObject.transportRealRef.code);
      }
      else
        statement.setNull(6,java.sql.Types.INTEGER);
      if (anObject.checkpointPassListRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENCheckpointPassListDAOGen(connection,getUserProfile()).exists(anObject.checkpointPassListRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENCheckpointPassListItem.checkpointPassListRef.code%} = {%"+anObject.checkpointPassListRef.code+"%}");
        statement.setInt(7,anObject.checkpointPassListRef.code);
      }
      else
        statement.setNull(7,java.sql.Types.INTEGER);
      if (anObject.eventTypeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENCheckpointEventTypeDAOGen(connection,getUserProfile()).exists(anObject.eventTypeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENCheckpointPassListItem.eventTypeRef.code%} = {%"+anObject.eventTypeRef.code+"%}");
        statement.setInt(8,anObject.eventTypeRef.code);
      }
      else
        statement.setNull(8,java.sql.Types.INTEGER);
      if (anObject.travelSheetRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTravelSheetDAOGen(connection,getUserProfile()).exists(anObject.travelSheetRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENCheckpointPassListItem.travelSheetRef.code%} = {%"+anObject.travelSheetRef.code+"%}");
        statement.setInt(9,anObject.travelSheetRef.code);
      }
      else
        statement.setNull(9,java.sql.Types.INTEGER);

      statement.execute();
      return anObject.code;
     }
    catch(SQLException e)
     {
           _sequenceTable.clear();
           throw new SystemException(e.getMessage(), e);
      //return Integer.MIN_VALUE;
     }
        catch(Exception e)
     {
      _sequenceTable.clear();
      throw new PersistenceException("Error in method {%ENCheckpointPassListItemDAOGen.add%}",e);
     }
        finally
     {
      try {if (statement != null) statement.close();} catch (SQLException e) {}
      if(connection != super.getConnection())
       {
        try{connection.close();} catch(SQLException e){}
       }
     }
   }

   public void save(ENCheckpointPassListItem anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENCheckpointPassListItem anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENCheckpointPassListItem oldObject = new ENCheckpointPassListItem();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENCheckpointPassListItem.modify_time_Field+" FROM  ENCHECKPOINTPASSLISTTM WHERE CODE = ?";

      ResultSet set = null;
      try
       {
        statement = connection.prepareStatement(oldObjectSelectStr);
        statement.setInt(1,oldObject.code);
        set = statement.executeQuery();
        if(!set.next())
           throw new PersistenceException("Can't get old object.");

        oldObject.modify_time = set.getLong(1);
        if(set.wasNull())
          oldObject.modify_time = Long.MIN_VALUE;
       }
      catch(SQLException e)
       {
        System.out.println(e.getMessage()+"\nstatement - "+oldObjectSelectStr);
        throw new SystemException(e.getMessage(), e);
       }
      finally
       {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
       }

      if(oldObject.modify_time != anObject.modify_time)
         throw new PersistenceException("Can't update object (optimistic locking).");

      anObject.modify_time = System.currentTimeMillis();

      String selectStr;

      Vector fields = null;
      if(anAttributes != null)
       {
        String fieldNameStr;
        fields = new Vector();
        for(int attrIndex = 0;attrIndex < anAttributes.length;attrIndex++)
         {
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATEEVENT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("MODIFY_TIME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("USERGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATEEDIT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TRANSPORTREALREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CHECKPOINTPASSLISTREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("EVENTTYPEREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TRAVELSHEETREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
         }
       if(fields.size() == 0)
         return;
       }
      if(fields == null)
       {
        selectStr =
        "UPDATE ENCHECKPOINTPASSLISTTM SET  DATEEVENT = ? , MODIFY_TIME = ? , USERGEN = ? , DATEEDIT = ? , TRANSPORTREALREFCODE = ? , CHECKPOINTPASSLISTRFCD = ? , EVENTTYPEREFCODE = ? , TRAVELSHEETREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENCHECKPOINTPASSLISTITEM SET ";
        for(int fldIndex = 0;fldIndex < fields.size();fldIndex++)
         {
          selectStr+=(String)fields.get(fldIndex);
          if(fldIndex > 0)
           selectStr+=",";
         }
        selectStr += " WHERE CODE = ?";
       }

      statement = null;

      try
       {
        statement = connection.prepareStatement(selectStr);
        if(fields == null)
         {
      if (anObject.dateEvent == null)
        statement.setTimestamp(1,null);
      else
        statement.setTimestamp(1,new java.sql.Timestamp(anObject.dateEvent.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(2,null);
      else
        statement.setBigDecimal(2,new java.math.BigDecimal(anObject.modify_time));
      statement.setString(3,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(4,null);
      else
        statement.setTimestamp(4,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.transportRealRef.code != Integer.MIN_VALUE)
        statement.setInt(5,anObject.transportRealRef.code);
      else
        statement.setNull(5,java.sql.Types.INTEGER);
      if (anObject.checkpointPassListRef.code != Integer.MIN_VALUE)
        statement.setInt(6,anObject.checkpointPassListRef.code);
      else
        statement.setNull(6,java.sql.Types.INTEGER);
      if (anObject.eventTypeRef.code != Integer.MIN_VALUE)
        statement.setInt(7,anObject.eventTypeRef.code);
      else
        statement.setNull(7,java.sql.Types.INTEGER);
      if (anObject.travelSheetRef.code != Integer.MIN_VALUE)
        statement.setInt(8,anObject.travelSheetRef.code);
      else
        statement.setNull(8,java.sql.Types.INTEGER);
          statement.setInt(9,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("DATEEVENT".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dateEvent == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateEvent.getTime()));
                continue;
             }
            if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.modify_time == Long.MIN_VALUE)
                    statement.setBigDecimal(i+1,null);
                else
                     statement.setBigDecimal(i+1,new java.math.BigDecimal(anObject.modify_time));
                continue;
             }
            if("USERGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.userGen);
                continue;
             }
            if("DATEEDIT".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dateEdit == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateEdit.getTime()));
                continue;
             }
            if("TRANSPORTREALREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.transportRealRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.transportRealRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("CHECKPOINTPASSLISTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.checkpointPassListRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.checkpointPassListRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("EVENTTYPEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.eventTypeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.eventTypeRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("TRAVELSHEETREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.travelSheetRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.travelSheetRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            }
         statement.setInt(fields.size(),anObject.code);
         }

        statement.execute();
       }
      catch(SQLException e)
       {
        System.out.println(e.getMessage()+"\nstatement - "+selectStr);
        throw new SystemException(e.getMessage(), e);
       }
      finally
       {
        try {if (statement != null) statement.close();} catch (SQLException e) {}
       }
     }
    finally
     {
      if(connection != super.getConnection())
       {
        try{connection.close();} catch(SQLException e){}
       }
     }

   } // end of save(ENCheckpointPassListItem anObject,String[] anAttributes)


 public ENCheckpointPassListItemShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENCheckpointPassListItem filterObject = new ENCheckpointPassListItem();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENCheckpointPassListItemShort)list.get(0);
   return null;
  }

  public ENCheckpointPassListItemShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENCheckpointPassListItemShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENCheckpointPassListItemShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENCheckpointPassListItemShortList getFilteredList(ENCheckpointPassListItem filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENCheckpointPassListItemShortList getScrollableFilteredList(ENCheckpointPassListItem aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENCheckpointPassListItemShortList getScrollableFilteredList(ENCheckpointPassListItem aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENCheckpointPassListItemShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENCheckpointPassListItemShortList getScrollableFilteredList(ENCheckpointPassListItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENCheckpointPassListItemShortList getScrollableFilteredList(ENCheckpointPassListItemFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENCheckpointPassListItemShortList getScrollableFilteredList(ENCheckpointPassListItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

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
     " FROM ENCHECKPOINTPASSLISTTM " +
     ", TKTRANSPORTREAL " +
     ", ENCHECKPOINTPASSLIST " +
     ", ENCHECKPOINTEVENTTYPE " +
     ", ENTRAVELSHEET " +
     //" WHERE "
  "";
     whereStr = " TKTRANSPORTREAL.CODE = ENCHECKPOINTPASSLISTTM.TRANSPORTREALREFCODE" ; //+
      whereStr = whereStr +" AND ENCHECKPOINTPASSLIST.CODE = ENCHECKPOINTPASSLISTTM.CHECKPOINTPASSLISTRFCD" ; //+
      whereStr = whereStr +" AND ENCHECKPOINTEVENTTYPE.CODE = ENCHECKPOINTPASSLISTTM.EVENTTYPEREFCODE" ; //+
      whereStr = whereStr +" AND ENTRAVELSHEET.CODE = ENCHECKPOINTPASSLISTTM.TRAVELSHEETREFCODE" ; //+
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

  public int[] getFilteredCodeArrayOLD(ENCheckpointPassListItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENCHECKPOINTPASSLISTTM.CODE FROM ENCHECKPOINTPASSLISTTM";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCHECKPOINTPASSLISTTM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

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
                 whereStr = whereStr + "  ENCHECKPOINTPASSLISTTM.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENCHECKPOINTPASSLISTTM.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCHECKPOINTPASSLISTTM.DATEEDIT = ?";
        }
        if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCHECKPOINTPASSLISTTM.TRANSPORTREALREFCODE = ? ";
        }
        if(aFilterObject.checkpointPassListRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCHECKPOINTPASSLISTTM.CHECKPOINTPASSLISTRFCD = ? ";
        }
        if(aFilterObject.eventTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCHECKPOINTPASSLISTTM.EVENTTYPEREFCODE = ? ";
        }
        if(aFilterObject.travelSheetRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCHECKPOINTPASSLISTTM.TRAVELSHEETREFCODE = ? ";
        }

      }

      if(condition.length() != 0)
      {
         if(whereStr.length() != 0)
            whereStr = whereStr + " AND ";
         whereStr = whereStr + " (" + condition + ")";
      }

     if(whereStr.length() != 0)
         selectStr = selectStr + " WHERE " + whereStr;

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
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCHECKPOINTPASSLISTTM.USERGEN = ?";
             else
                 whereStr = whereStr + " ENCHECKPOINTPASSLISTTM.USERGEN LIKE ?";

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
      for(i = 0;set.next();i++)
       {
        if(i < fromPosition)
         continue;
        else if(i >= fromPosition + quantity)
         {
          i++;
          break;
         }

        result.add(new Integer(set.getInt(1)));
       }

      int[] array;

      array = new int[result.size()];
      for(int j = 0;j < result.size();j++)
       array[j] = ((Integer)result.get(j)).intValue();

      return array;
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


    } // end of getFilteredCodeArray

/*********************************/

  public int[] getFilteredCodeArray(ENCheckpointPassListItemFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENCheckpointPassListItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENCHECKPOINTPASSLISTTM.CODE FROM ENCHECKPOINTPASSLISTTM";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCHECKPOINTPASSLISTTM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

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
                 whereStr = whereStr + "  ENCHECKPOINTPASSLISTTM.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENCHECKPOINTPASSLISTTM.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCHECKPOINTPASSLISTTM.DATEEDIT = ?";
        }
        if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCHECKPOINTPASSLISTTM.TRANSPORTREALREFCODE = ? ";
        }
        if(aFilterObject.checkpointPassListRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCHECKPOINTPASSLISTTM.CHECKPOINTPASSLISTRFCD = ? ";
        }
        if(aFilterObject.eventTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCHECKPOINTPASSLISTTM.EVENTTYPEREFCODE = ? ";
        }
        if(aFilterObject.travelSheetRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCHECKPOINTPASSLISTTM.TRAVELSHEETREFCODE = ? ";
        }

      }

      if(condition.length() != 0)
      {
         if(whereStr.length() != 0)
            whereStr = whereStr + " AND ";
         whereStr = whereStr + " (" + condition + ")";
      }

     if(whereStr.length() != 0)
         selectStr = selectStr + " WHERE " + whereStr;

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
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCHECKPOINTPASSLISTTM.USERGEN = ?";
             else
                 whereStr = whereStr + " ENCHECKPOINTPASSLISTTM.USERGEN LIKE ?";

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
      for(i = 0;set.next();i++)
       {
        if(i < fromPosition)
         continue;
        else if(i >= fromPosition + quantity)
         {
          i++;
          break;
         }

        result.add(new Integer(set.getInt(1)));
       }

      int[] array;

      array = new int[result.size()];
      for(int j = 0;j < result.size();j++)
       array[j] = ((Integer)result.get(j)).intValue();

      return array;
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


    } // end of getFilteredCodeArray


   public ENCheckpointPassListItem getObject(int uid) throws PersistenceException
   {
    ENCheckpointPassListItem result = new ENCheckpointPassListItem();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENCheckpointPassListItem anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENCHECKPOINTPASSLISTTM.CODE, ENCHECKPOINTPASSLISTTM.DATEEVENT, ENCHECKPOINTPASSLISTTM.MODIFY_TIME, ENCHECKPOINTPASSLISTTM.USERGEN, ENCHECKPOINTPASSLISTTM.DATEEDIT, ENCHECKPOINTPASSLISTTM.TRANSPORTREALREFCODE, ENCHECKPOINTPASSLISTTM.CHECKPOINTPASSLISTRFCD, ENCHECKPOINTPASSLISTTM.EVENTTYPEREFCODE, ENCHECKPOINTPASSLISTTM.TRAVELSHEETREFCODE "
    +" FROM ENCHECKPOINTPASSLISTTM WHERE ENCHECKPOINTPASSLISTTM.CODE = ?";

    try
     {
      statement = connection.prepareStatement(selectStr);
      statement.setInt(1,anObject.code);
      set = statement.executeQuery();
      if(!set.next())
       anObject.code = Integer.MIN_VALUE;
      else
       {
        anObject.code = set.getInt(1);
        anObject.dateEvent = set.getTimestamp(2);
        anObject.modify_time = set.getLong(3);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.userGen = set.getString(4);
        anObject.dateEdit = set.getTimestamp(5);
        anObject.transportRealRef.code = set.getInt(6);
        if ( set.wasNull() )
            anObject.transportRealRef.code = Integer.MIN_VALUE;
        anObject.checkpointPassListRef.code = set.getInt(7);
        if ( set.wasNull() )
            anObject.checkpointPassListRef.code = Integer.MIN_VALUE;
        anObject.eventTypeRef.code = set.getInt(8);
        if ( set.wasNull() )
            anObject.eventTypeRef.code = Integer.MIN_VALUE;
        anObject.travelSheetRef.code = set.getInt(9);
        if ( set.wasNull() )
            anObject.travelSheetRef.code = Integer.MIN_VALUE;
        if(anObject.transportRealRef.code != Integer.MIN_VALUE)
        {
           anObject.setTransportRealRef(
      new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).getRef(anObject.transportRealRef.code));
    }
        if(anObject.checkpointPassListRef.code != Integer.MIN_VALUE)
        {
           anObject.setCheckpointPassListRef(
      new com.ksoe.energynet.dataminer.generated.ENCheckpointPassListDAOGen(connection,getUserProfile()).getRef(anObject.checkpointPassListRef.code));
    }
        if(anObject.eventTypeRef.code != Integer.MIN_VALUE)
        {
           anObject.setEventTypeRef(
      new com.ksoe.energynet.dataminer.generated.ENCheckpointEventTypeDAOGen(connection,getUserProfile()).getRef(anObject.eventTypeRef.code));
    }
        if(anObject.travelSheetRef.code != Integer.MIN_VALUE)
        {
           anObject.setTravelSheetRef(
      new com.ksoe.energynet.dataminer.generated.ENTravelSheetDAOGen(connection,getUserProfile()).getRef(anObject.travelSheetRef.code));
    }
      }
    }
    catch(SQLException e)
     {
      System.out.println(e.getMessage()+"\nstatement - "+selectStr);
      throw new SystemException(e.getMessage(), e);
     }
    finally
     {
      try {if(set != null) set.close(); if (statement != null) statement.close();}
      catch (SQLException e) {}
      if(connection != super.getConnection())
       {
        try{connection.close();} catch(SQLException e){}
       }
     }
   }


  public com.ksoe.energynet.valueobject.references.ENCheckpointPassListItemRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENCheckpointPassListItemRef ref = new com.ksoe.energynet.valueobject.references.ENCheckpointPassListItemRef();
    if(exists(anObjectCode))
     ref.code = anObjectCode;
    else
     ref.code = Integer.MIN_VALUE;
    return ref;
   }


   public void remove(int uid) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();

    selectStr = "DELETE FROM  ENCHECKPOINTPASSLISTTM WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENCheckpointPassListItem object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENCheckpointPassListItem.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENCheckpointPassListItem.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENCheckpointPassListItem.remove%} access denied");

    PreparedStatement statement = null;
    try
     {
      statement = connection.prepareStatement(selectStr);
      statement.setInt(1,uid);
      statement.execute();
     }
    catch(SQLException e)
     {
      System.out.println(e.getMessage()+"\nstatement - "+selectStr);
      throw new SystemException(e.getMessage(), e);
     }
    finally
     {
      try {if (statement != null) statement.close();} catch (SQLException e) {}
      if(connection != super.getConnection())
       {
        try{connection.close();} catch(SQLException e){}
       }
     }
   }

   public boolean exists(int anObjectCode) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;

    if(anObjectCode == Integer.MIN_VALUE)
     return false;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENCheckpointPassListItem.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENCheckpointPassListItem.getObject%} access denied");

    selectStr =

    "SELECT  ENCHECKPOINTPASSLISTTM.CODE FROM  ENCHECKPOINTPASSLISTTM WHERE  ENCHECKPOINTPASSLISTTM.CODE = ?";
    try
     {
      statement = connection.prepareStatement(selectStr);
      statement.setInt(1,anObjectCode);
      set = statement.executeQuery();
      if(set.next())
       return true;
      return false;
     }
    catch(SQLException e)
     {
      System.out.println(e.getMessage()+"\nstatement - "+selectStr);
      throw new SystemException(e.getMessage(), e);
      //return false;
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

  public static String processCondition(String aCondition)
   {
    if(aCondition == null || aCondition.length() == 0)
     return "";

    StringBuffer condition = new StringBuffer(aCondition);
    _checkConditionToken(condition,";"," ");
    _checkConditionToken(condition,"--"," ");
    _checkConditionToken(condition,"\r"," ");
    _checkConditionToken(condition,"\n"," ");
    _checkConditionToken(condition,"||"," OR ");
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

   public Connection getConnection()
   {
    try
     {
      if(super.getConnection() != null && !super.getConnection().isClosed())
       return super.getConnection();

      InitialContext initialContext = new InitialContext();
      DataSource dataSource = (DataSource)initialContext.lookup(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
      return dataSource.getConnection();
     }
    catch (NamingException e) {throw new SystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.ENERGYNET_DATASOURCE+"%}",e);}
    catch (SQLException e)    {throw new SystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.ENERGYNET_DATASOURCE+"%}",e);}
   }


  ///////////// PRIVATE SECTION ///////////////
  protected static Hashtable _sequenceTable = new Hashtable();

  private void _collectAutoIncrementFields(ENCheckpointPassListItem anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENCHECKPOINTPASSLISTTM", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENCHECKPOINTPASSLISTTM", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENCHECKPOINTPASSLISTTM", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENCHECKPOINTPASSLISTTM");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENCheckpointPassListItemDAO
