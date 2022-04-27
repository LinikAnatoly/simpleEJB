
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer.generated;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.valueobject.ENDeliveryTime;
import com.ksoe.energynet.valueobject.brief.ENDeliveryTimeShort;
import com.ksoe.energynet.valueobject.filter.ENDeliveryTimeFilter;
import com.ksoe.energynet.valueobject.lists.ENDeliveryTimeShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENDeliveryTime;
 *
 */

public class ENDeliveryTimeDAOGen extends GenericDataMiner {

  public ENDeliveryTimeDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENDeliveryTimeDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENDeliveryTime inObject) throws PersistenceException
   {
      ENDeliveryTime obj = new ENDeliveryTime();
      obj.code = inObject.code;
      loadObject(obj);

     if ( ! inObject.deliveryTimePlan.equals(obj.deliveryTimePlan)){
       return false;
     }

     if ( ! inObject.deliveryTimeFact.equals(obj.deliveryTimeFact)){
       return false;
     }

     if (inObject.commentGen != obj.commentGen){
       return false;
     }
     if (inObject.deliveryKind.code != obj.deliveryKind.code){
        return false;
     }
     if (inObject.humenItemRef.code != obj.humenItemRef.code){
        return false;
     }
      return true;
   }

   public int add(ENDeliveryTime anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENDeliveryTime anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENDELIVERYTIME (CODE,DELIVERYTIMEPLAN,DELIVERYTIMEFACT,COMMENTGEN,MODIFY_TIME,DELIVERYKINDCODE,HUMENITEMREFCODE) VALUES (?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.deliveryTimePlan != null)
        anObject.deliveryTimePlan = anObject.deliveryTimePlan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.deliveryTimePlan);
      if (anObject.deliveryTimeFact != null)
        anObject.deliveryTimeFact = anObject.deliveryTimeFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.deliveryTimeFact);
      statement.setString(4,anObject.commentGen);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(5,null);
      else
        statement.setBigDecimal(5,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.deliveryKind.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENDeliveryKindDAOGen(connection,getUserProfile()).exists(anObject.deliveryKind.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENDeliveryTime.deliveryKind.code%} = {%"+anObject.deliveryKind.code+"%}");
        statement.setInt(6,anObject.deliveryKind.code);
      }
      else
        statement.setNull(6,java.sql.Types.INTEGER);
      if (anObject.humenItemRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENHumenItemDAOGen(connection,getUserProfile()).exists(anObject.humenItemRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENDeliveryTime.humenItemRef.code%} = {%"+anObject.humenItemRef.code+"%}");
        statement.setInt(7,anObject.humenItemRef.code);
      }
      else
        statement.setNull(7,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENDeliveryTimeDAOGen.add%}",e);
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

   public void save(ENDeliveryTime anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENDeliveryTime anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENDeliveryTime oldObject = new ENDeliveryTime();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENDeliveryTime.modify_time_Field + " FROM  ENDELIVERYTIME WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("DELIVERYTIMEPLAN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DELIVERYTIMEFACT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COMMENTGEN") == 0)
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
          if(fieldNameStr.compareTo("DELIVERYKIND") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("HUMENITEMREF") == 0)
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
        "UPDATE ENDELIVERYTIME SET  DELIVERYTIMEPLAN = ? , DELIVERYTIMEFACT = ? , COMMENTGEN = ? , MODIFY_TIME = ? , DELIVERYKINDCODE = ? , HUMENITEMREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENDELIVERYTIME SET ";
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
      if (anObject.deliveryTimePlan != null)
        anObject.deliveryTimePlan = anObject.deliveryTimePlan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(1,anObject.deliveryTimePlan);
      if (anObject.deliveryTimeFact != null)
        anObject.deliveryTimeFact = anObject.deliveryTimeFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.deliveryTimeFact);
      statement.setString(3,anObject.commentGen);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(4,null);
      else
        statement.setBigDecimal(4,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.deliveryKind.code != Integer.MIN_VALUE)
        statement.setInt(5,anObject.deliveryKind.code);
      else
        statement.setNull(5,java.sql.Types.INTEGER);
      if (anObject.humenItemRef.code != Integer.MIN_VALUE)
        statement.setInt(6,anObject.humenItemRef.code);
      else
        statement.setNull(6,java.sql.Types.INTEGER);
          statement.setInt(7,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("DELIVERYTIMEPLAN".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.deliveryTimePlan != null)
                    anObject.deliveryTimePlan = anObject.deliveryTimePlan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.deliveryTimePlan);
                continue;
             }
            if("DELIVERYTIMEFACT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.deliveryTimeFact != null)
                    anObject.deliveryTimeFact = anObject.deliveryTimeFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.deliveryTimeFact);
                continue;
             }
            if("COMMENTGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.commentGen);
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
            if("DELIVERYKIND".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.deliveryKind.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.deliveryKind.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("HUMENITEMREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.humenItemRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.humenItemRef.code);
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

   } // end of save(ENDeliveryTime anObject,String[] anAttributes)


 public ENDeliveryTimeShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENDeliveryTime filterObject = new ENDeliveryTime();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENDeliveryTimeShort)list.get(0);
   return null;
  }

  public ENDeliveryTimeShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENDeliveryTimeShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENDeliveryTimeShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENDeliveryTimeShortList getFilteredList(ENDeliveryTime filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENDeliveryTimeShortList getScrollableFilteredList(ENDeliveryTime aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENDeliveryTimeShortList getScrollableFilteredList(ENDeliveryTime aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENDeliveryTimeShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENDeliveryTimeShortList getScrollableFilteredList(ENDeliveryTimeFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENDeliveryTimeShortList getScrollableFilteredList(ENDeliveryTimeFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENDeliveryTimeShortList getScrollableFilteredList(ENDeliveryTime aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENDeliveryTimeShortList getScrollableFilteredList(ENDeliveryTime aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENDeliveryTimeShortList result = new ENDeliveryTimeShortList();
    ENDeliveryTimeShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENDELIVERYTIME.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENDELIVERYTIME.CODE"+
     ",ENDELIVERYTIME.DELIVERYTIMEPLAN"+
     ",ENDELIVERYTIME.DELIVERYTIMEFACT"+

      ", ENDELIVERYKIND.CODE " +
      ", ENDELIVERYKIND.NAME " +
      ", ENHUMENITEM.CODE " +
      ", ENHUMENITEM.COUNTGEN " +
      ", ENHUMENITEM.COUNTFACT " +
      ", ENHUMENITEM.PRICE " +
      ", ENHUMENITEM.COST " +
      ", ENHUMENITEM.USERGEN " +
      ", ENHUMENITEM.DATEEDIT " +
     " FROM ENDELIVERYTIME " +
     ", ENDELIVERYKIND " +
     ", ENHUMENITEM " +
     //" WHERE "
    "";
     whereStr = " ENDELIVERYKIND.CODE = ENDELIVERYTIME.DELIVERYKINDCODE" ; //+
      whereStr = whereStr +" AND ENHUMENITEM.CODE = ENDELIVERYTIME.HUMENITEMREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENDELIVERYTIME.CODE IN ( SELECT ENDELIVERYTIME.CODE FROM ENDELIVERYTIME ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDELIVERYTIME.CODE = ?";
        }
        if(aFilterObject.deliveryTimePlan != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDELIVERYTIME.DELIVERYTIMEPLAN = ?";
        }
        if(aFilterObject.deliveryTimeFact != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDELIVERYTIME.DELIVERYTIMEFACT = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENDELIVERYTIME.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENDELIVERYTIME.COMMENTGEN) LIKE UPPER(?)";
         }

        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDELIVERYTIME.MODIFY_TIME = ?";
        }
        if(aFilterObject.deliveryKind.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENDELIVERYTIME.DELIVERYKINDCODE = ? ";
        }
        if(aFilterObject.humenItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENDELIVERYTIME.HUMENITEMREFCODE = ? ";
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
        if(aFilterObject.deliveryTimePlan != null){
            number++;
            aFilterObject.deliveryTimePlan = aFilterObject.deliveryTimePlan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.deliveryTimePlan);
        }
        if(aFilterObject.deliveryTimeFact != null){
            number++;
            aFilterObject.deliveryTimeFact = aFilterObject.deliveryTimeFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.deliveryTimeFact);
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

        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.deliveryKind.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.deliveryKind.code);
       }
       if(aFilterObject.humenItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.humenItemRef.code);
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

        anObject = new ENDeliveryTimeShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.deliveryTimePlan = set.getBigDecimal(2);
        if(anObject.deliveryTimePlan != null)
            anObject.deliveryTimePlan = anObject.deliveryTimePlan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.deliveryTimeFact = set.getBigDecimal(3);
        if(anObject.deliveryTimeFact != null)
            anObject.deliveryTimeFact = anObject.deliveryTimeFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.deliveryKindCode = set.getInt(4);
        if(set.wasNull())
        anObject.deliveryKindCode = Integer.MIN_VALUE;
        anObject.deliveryKindName = set.getString(5);
        anObject.humenItemRefCode = set.getInt(6);
        if(set.wasNull())
        anObject.humenItemRefCode = Integer.MIN_VALUE;
        anObject.humenItemRefCountGen = set.getBigDecimal(7);
        if(anObject.humenItemRefCountGen != null)
          anObject.humenItemRefCountGen = anObject.humenItemRefCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.humenItemRefCountFact = set.getBigDecimal(8);
        if(anObject.humenItemRefCountFact != null)
          anObject.humenItemRefCountFact = anObject.humenItemRefCountFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.humenItemRefPrice = set.getBigDecimal(9);
        if(anObject.humenItemRefPrice != null)
          anObject.humenItemRefPrice = anObject.humenItemRefPrice.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.humenItemRefCost = set.getBigDecimal(10);
        if(anObject.humenItemRefCost != null)
          anObject.humenItemRefCost = anObject.humenItemRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.humenItemRefUserGen = set.getString(11);
        anObject.humenItemRefDateEdit = set.getDate(12);

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

  public int[] getFilteredCodeArrayOLD(ENDeliveryTime aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENDELIVERYTIME.CODE FROM ENDELIVERYTIME";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENDELIVERYTIME.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
  
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDELIVERYTIME.CODE = ?";
        }
        if(aFilterObject.deliveryTimePlan != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDELIVERYTIME.DELIVERYTIMEPLAN = ?";
        }
        if(aFilterObject.deliveryTimeFact != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDELIVERYTIME.DELIVERYTIMEFACT = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDELIVERYTIME.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENDELIVERYTIME.COMMENTGEN LIKE ?";
         }
         
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDELIVERYTIME.MODIFY_TIME = ?";
        }
        if(aFilterObject.deliveryKind.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDELIVERYTIME.DELIVERYKINDCODE = ? ";
        }
        if(aFilterObject.humenItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDELIVERYTIME.HUMENITEMREFCODE = ? ";
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
        if(aFilterObject.deliveryTimePlan != null){
            number++;
            aFilterObject.deliveryTimePlan = aFilterObject.deliveryTimePlan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.deliveryTimePlan);
        }
        if(aFilterObject.deliveryTimeFact != null){
            number++;
            aFilterObject.deliveryTimeFact = aFilterObject.deliveryTimeFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.deliveryTimeFact);
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDELIVERYTIME.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENDELIVERYTIME.COMMENTGEN LIKE ?";

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
         }

        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.deliveryKind.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.deliveryKind.code);
       }
       if(aFilterObject.humenItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.humenItemRef.code);
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

  public int[] getFilteredCodeArray(ENDeliveryTimeFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENDeliveryTime aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENDELIVERYTIME.CODE FROM ENDELIVERYTIME";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENDELIVERYTIME.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDELIVERYTIME.CODE = ?";
        }
        if(aFilterObject.deliveryTimePlan != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDELIVERYTIME.DELIVERYTIMEPLAN = ?";
        }
        if(aFilterObject.deliveryTimeFact != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDELIVERYTIME.DELIVERYTIMEFACT = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDELIVERYTIME.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENDELIVERYTIME.COMMENTGEN LIKE ?";
         }

        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDELIVERYTIME.MODIFY_TIME = ?";
        }
        if(aFilterObject.deliveryKind.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDELIVERYTIME.DELIVERYKINDCODE = ? ";
        }
        if(aFilterObject.humenItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDELIVERYTIME.HUMENITEMREFCODE = ? ";
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
        if(aFilterObject.deliveryTimePlan != null){
            number++;
            aFilterObject.deliveryTimePlan = aFilterObject.deliveryTimePlan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.deliveryTimePlan);
        }
        if(aFilterObject.deliveryTimeFact != null){
            number++;
            aFilterObject.deliveryTimeFact = aFilterObject.deliveryTimeFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.deliveryTimeFact);
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDELIVERYTIME.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENDELIVERYTIME.COMMENTGEN LIKE ?";

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
         }

        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.deliveryKind.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.deliveryKind.code);
       }
       if(aFilterObject.humenItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.humenItemRef.code);
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


   public ENDeliveryTime getObject(int uid) throws PersistenceException
   {
    ENDeliveryTime result = new ENDeliveryTime();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENDeliveryTime anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr =
    "SELECT  ENDELIVERYTIME.CODE, ENDELIVERYTIME.DELIVERYTIMEPLAN, ENDELIVERYTIME.DELIVERYTIMEFACT, ENDELIVERYTIME.COMMENTGEN, ENDELIVERYTIME.MODIFY_TIME, ENDELIVERYTIME.DELIVERYKINDCODE, ENDELIVERYTIME.HUMENITEMREFCODE "
    +" FROM ENDELIVERYTIME WHERE ENDELIVERYTIME.CODE = ?";

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
        anObject.deliveryTimePlan = set.getBigDecimal(2);
        if(anObject.deliveryTimePlan != null)
            anObject.deliveryTimePlan = anObject.deliveryTimePlan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.deliveryTimeFact = set.getBigDecimal(3);
        if(anObject.deliveryTimeFact != null)
            anObject.deliveryTimeFact = anObject.deliveryTimeFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.commentGen = set.getString(4);
        anObject.modify_time = set.getLong(5);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.deliveryKind.code = set.getInt(6);
        if ( set.wasNull() )
            anObject.deliveryKind.code = Integer.MIN_VALUE;
        anObject.humenItemRef.code = set.getInt(7);
        if ( set.wasNull() )
            anObject.humenItemRef.code = Integer.MIN_VALUE;
        if(anObject.deliveryKind.code != Integer.MIN_VALUE)
        {
           anObject.setDeliveryKind(
        new com.ksoe.energynet.dataminer.generated.ENDeliveryKindDAOGen(connection,getUserProfile()).getObject(anObject.deliveryKind.code));
    }
        if(anObject.humenItemRef.code != Integer.MIN_VALUE)
        {
           anObject.setHumenItemRef(
        new com.ksoe.energynet.dataminer.generated.ENHumenItemDAOGen(connection,getUserProfile()).getRef(anObject.humenItemRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENDeliveryTimeRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENDeliveryTimeRef ref = new com.ksoe.energynet.valueobject.references.ENDeliveryTimeRef();
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

    selectStr = "DELETE FROM  ENDELIVERYTIME WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENDeliveryTime object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENDeliveryTime.getObject%} access denied");

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

    selectStr =

    "SELECT  ENDELIVERYTIME.CODE FROM  ENDELIVERYTIME WHERE  ENDELIVERYTIME.CODE = ?";

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
    _checkConditionToken(condition,"code","ENDELIVERYTIME.CODE");
    _checkConditionToken(condition,"deliverytimeplan","ENDELIVERYTIME.DELIVERYTIMEPLAN");
    _checkConditionToken(condition,"deliverytimefact","ENDELIVERYTIME.DELIVERYTIMEFACT");
    _checkConditionToken(condition,"commentgen","ENDELIVERYTIME.COMMENTGEN");
    _checkConditionToken(condition,"modify_time","ENDELIVERYTIME.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"deliverykind","DELIVERYKINDCODE");
    _checkConditionToken(condition,"deliverykind.code","DELIVERYKINDCODE");
    _checkConditionToken(condition,"humenitemref","HUMENITEMREFCODE");
    _checkConditionToken(condition,"humenitemref.code","HUMENITEMREFCODE");
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

    private void _collectAutoIncrementFields(ENDeliveryTime anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENDELIVERYTIME", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENDELIVERYTIME", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENDELIVERYTIME", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENDELIVERYTIME");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENDeliveryTimeDAO
