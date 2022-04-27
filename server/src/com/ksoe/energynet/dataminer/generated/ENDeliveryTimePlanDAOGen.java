
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
import com.ksoe.energynet.valueobject.ENDeliveryTimePlan;
import com.ksoe.energynet.valueobject.brief.ENDeliveryTimePlanShort;
import com.ksoe.energynet.valueobject.filter.ENDeliveryTimePlanFilter;
import com.ksoe.energynet.valueobject.lists.ENDeliveryTimePlanShortList;
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
 * DAO Object for ENDeliveryTimePlan;
 *
 */

public class ENDeliveryTimePlanDAOGen extends GenericDataMiner {

  public ENDeliveryTimePlanDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENDeliveryTimePlanDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENDeliveryTimePlan inObject) throws PersistenceException
   {
      ENDeliveryTimePlan obj = new ENDeliveryTimePlan();
      obj.code = inObject.code;
      loadObject(obj);

     if ( ! inObject.deliveryTimePlan.equals(obj.deliveryTimePlan)){
       return false;
     }

     if ( ! inObject.deliveryTimeFact.equals(obj.deliveryTimeFact)){
       return false;
     }

     if ( ! inObject.deliveryDistance.equals(obj.deliveryDistance)){
       return false;
     }

     if (inObject.commentGen != obj.commentGen){
       return false;
     }
     if (inObject.planWorkRef.code != obj.planWorkRef.code){
        return false;
     }
      return true;
   }

   public int add(ENDeliveryTimePlan anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENDeliveryTimePlan anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENDELIVERYTIMEPLAN (CODE,DELIVERYTIMEPLAN,DELIVERYTIMEFACT,DELIVERYDISTANCE,COMMENTGEN,MODIFY_TIME,PLANWORKREFCODE) VALUES (?,?,?,?,?,?,?)";

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
      if (anObject.deliveryDistance != null)
        anObject.deliveryDistance = anObject.deliveryDistance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.deliveryDistance);
      statement.setString(5,anObject.commentGen);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(6,null);
      else
        statement.setBigDecimal(6,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.planWorkRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planWorkRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENDeliveryTimePlan.planWorkRef.code%} = {%"+anObject.planWorkRef.code+"%}");
        statement.setInt(7,anObject.planWorkRef.code);
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
      throw new PersistenceException("Error in method {%ENDeliveryTimePlanDAOGen.add%}",e);
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

   public void save(ENDeliveryTimePlan anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENDeliveryTimePlan anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENDeliveryTimePlan oldObject = new ENDeliveryTimePlan();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENDeliveryTimePlan.modify_time_Field + " FROM  ENDELIVERYTIMEPLAN WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("DELIVERYDISTANCE") == 0)
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
          if(fieldNameStr.compareTo("PLANWORKREF") == 0)
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
        "UPDATE ENDELIVERYTIMEPLAN SET  DELIVERYTIMEPLAN = ? , DELIVERYTIMEFACT = ? , DELIVERYDISTANCE = ? , COMMENTGEN = ? , MODIFY_TIME = ? , PLANWORKREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENDELIVERYTIMEPLAN SET ";
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
      if (anObject.deliveryDistance != null)
        anObject.deliveryDistance = anObject.deliveryDistance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.deliveryDistance);
      statement.setString(4,anObject.commentGen);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(5,null);
      else
        statement.setBigDecimal(5,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.planWorkRef.code != Integer.MIN_VALUE)
        statement.setInt(6,anObject.planWorkRef.code);
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
            if("DELIVERYDISTANCE".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.deliveryDistance != null)
                    anObject.deliveryDistance = anObject.deliveryDistance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.deliveryDistance);
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
            if("PLANWORKREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.planWorkRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.planWorkRef.code);
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

   } // end of save(ENDeliveryTimePlan anObject,String[] anAttributes)


 public ENDeliveryTimePlanShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENDeliveryTimePlan filterObject = new ENDeliveryTimePlan();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENDeliveryTimePlanShort)list.get(0);
   return null;
  }

  public ENDeliveryTimePlanShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENDeliveryTimePlanShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENDeliveryTimePlanShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENDeliveryTimePlanShortList getFilteredList(ENDeliveryTimePlan filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENDeliveryTimePlanShortList getScrollableFilteredList(ENDeliveryTimePlan aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENDeliveryTimePlanShortList getScrollableFilteredList(ENDeliveryTimePlan aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENDeliveryTimePlanShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENDeliveryTimePlanShortList getScrollableFilteredList(ENDeliveryTimePlanFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENDeliveryTimePlanShortList getScrollableFilteredList(ENDeliveryTimePlanFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENDeliveryTimePlanShortList getScrollableFilteredList(ENDeliveryTimePlan aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENDeliveryTimePlanShortList getScrollableFilteredList(ENDeliveryTimePlan aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENDeliveryTimePlanShortList result = new ENDeliveryTimePlanShortList();
    ENDeliveryTimePlanShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENDELIVERYTIMEPLAN.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENDELIVERYTIMEPLAN.CODE"+
     ",ENDELIVERYTIMEPLAN.DELIVERYTIMEPLAN"+
     ",ENDELIVERYTIMEPLAN.DELIVERYTIMEFACT"+
     ",ENDELIVERYTIMEPLAN.DELIVERYDISTANCE"+

      ", ENPLANWORK.CODE " +
      ", ENPLANWORK.DATEGEN " +
      ", ENPLANWORK.DATESTART " +
      ", ENPLANWORK.DATEFINAL " +
      ", ENPLANWORK.YEARGEN " +
      ", ENPLANWORK.MONTHGEN " +
      ", ENPLANWORK.YEARORIGINAL " +
      ", ENPLANWORK.MONTHORIGINAL " +
      ", ENPLANWORK.USERGEN " +
      ", ENPLANWORK.DATEEDIT " +
      ", ENPLANWORK.WORKORDERNUMBER " +
      ", ENPLANWORK.DATEWORKORDER " +
      ", ENPLANWORK.PRICONNECTIONNUMBER " +
      ", ENPLANWORK.DATEENDPRICONNECTION " +
      ", ENPLANWORK.INVESTWORKSDESCRIPTION " +
      ", ENPLANWORK.SERVICESFSIDEFINID " +
      ", ENPLANWORK.SERVICESFSIDECNNUM " +
      ", ENPLANWORK.TOTALTIMEHOURS " +
      ", ENPLANWORK.TOTALTIMEDAYS " +
      ", ENPLANWORK.INVESTITEMNUMBER " +
     " FROM ENDELIVERYTIMEPLAN " +
     ", ENPLANWORK " +
     //" WHERE "
    "";
     whereStr = " ENPLANWORK.CODE = ENDELIVERYTIMEPLAN.PLANWORKREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENDELIVERYTIMEPLAN.CODE IN ( SELECT ENDELIVERYTIMEPLAN.CODE FROM ENDELIVERYTIMEPLAN ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDELIVERYTIMEPLAN.CODE = ?";
        }
        if(aFilterObject.deliveryTimePlan != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDELIVERYTIMEPLAN.DELIVERYTIMEPLAN = ?";
        }
        if(aFilterObject.deliveryTimeFact != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDELIVERYTIMEPLAN.DELIVERYTIMEFACT = ?";
        }
        if(aFilterObject.deliveryDistance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDELIVERYTIMEPLAN.DELIVERYDISTANCE = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENDELIVERYTIMEPLAN.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENDELIVERYTIMEPLAN.COMMENTGEN) LIKE UPPER(?)";
         }
        
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDELIVERYTIMEPLAN.MODIFY_TIME = ?";
        }
        if(aFilterObject.planWorkRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENDELIVERYTIMEPLAN.PLANWORKREFCODE = ? ";
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
        if(aFilterObject.deliveryDistance != null){
            number++;
            aFilterObject.deliveryDistance = aFilterObject.deliveryDistance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.deliveryDistance);
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
       if(aFilterObject.planWorkRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planWorkRef.code);
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

        anObject = new ENDeliveryTimePlanShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.deliveryTimePlan = set.getBigDecimal(2);
        if(anObject.deliveryTimePlan != null)
            anObject.deliveryTimePlan = anObject.deliveryTimePlan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.deliveryTimeFact = set.getBigDecimal(3);
        if(anObject.deliveryTimeFact != null)
            anObject.deliveryTimeFact = anObject.deliveryTimeFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.deliveryDistance = set.getBigDecimal(4);
        if(anObject.deliveryDistance != null)
            anObject.deliveryDistance = anObject.deliveryDistance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.planWorkRefCode = set.getInt(5);
        if(set.wasNull())
        anObject.planWorkRefCode = Integer.MIN_VALUE;
        anObject.planWorkRefDateGen = set.getTimestamp(6);
        anObject.planWorkRefDateStart = set.getDate(7);
        anObject.planWorkRefDateFinal = set.getDate(8);
        anObject.planWorkRefYearGen = set.getInt(9);
        if(set.wasNull())
        anObject.planWorkRefYearGen = Integer.MIN_VALUE;
        anObject.planWorkRefMonthGen = set.getInt(10);
        if(set.wasNull())
        anObject.planWorkRefMonthGen = Integer.MIN_VALUE;

        anObject.planWorkRefUserGen = set.getString(13);
        anObject.planWorkRefDateEdit = set.getDate(14);
        anObject.planWorkRefWorkOrderNumber = set.getString(15);
        anObject.planWorkRefDateWorkOrder = set.getDate(16);
        anObject.planWorkRefPriConnectionNumber = set.getString(17);


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

  public int[] getFilteredCodeArrayOLD(ENDeliveryTimePlan aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENDELIVERYTIMEPLAN.CODE FROM ENDELIVERYTIMEPLAN";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENDELIVERYTIMEPLAN.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDELIVERYTIMEPLAN.CODE = ?";
        }
        if(aFilterObject.deliveryTimePlan != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDELIVERYTIMEPLAN.DELIVERYTIMEPLAN = ?";
        }
        if(aFilterObject.deliveryTimeFact != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDELIVERYTIMEPLAN.DELIVERYTIMEFACT = ?";
        }
        if(aFilterObject.deliveryDistance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDELIVERYTIMEPLAN.DELIVERYDISTANCE = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDELIVERYTIMEPLAN.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENDELIVERYTIMEPLAN.COMMENTGEN LIKE ?";
         }
        
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDELIVERYTIMEPLAN.MODIFY_TIME = ?";
        }
        if(aFilterObject.planWorkRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDELIVERYTIMEPLAN.PLANWORKREFCODE = ? ";
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
        if(aFilterObject.deliveryDistance != null){
            number++;
            aFilterObject.deliveryDistance = aFilterObject.deliveryDistance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.deliveryDistance);
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDELIVERYTIMEPLAN.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENDELIVERYTIMEPLAN.COMMENTGEN LIKE ?";

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
       if(aFilterObject.planWorkRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planWorkRef.code);
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

  public int[] getFilteredCodeArray(ENDeliveryTimePlanFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENDeliveryTimePlan aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENDELIVERYTIMEPLAN.CODE FROM ENDELIVERYTIMEPLAN";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENDELIVERYTIMEPLAN.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDELIVERYTIMEPLAN.CODE = ?";
        }
        if(aFilterObject.deliveryTimePlan != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDELIVERYTIMEPLAN.DELIVERYTIMEPLAN = ?";
        }
        if(aFilterObject.deliveryTimeFact != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDELIVERYTIMEPLAN.DELIVERYTIMEFACT = ?";
        }
        if(aFilterObject.deliveryDistance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDELIVERYTIMEPLAN.DELIVERYDISTANCE = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENDELIVERYTIMEPLAN.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENDELIVERYTIMEPLAN.COMMENTGEN LIKE ?";
         }
         
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDELIVERYTIMEPLAN.MODIFY_TIME = ?";
        }
        if(aFilterObject.planWorkRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDELIVERYTIMEPLAN.PLANWORKREFCODE = ? ";
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
        if(aFilterObject.deliveryDistance != null){
            number++;
            aFilterObject.deliveryDistance = aFilterObject.deliveryDistance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.deliveryDistance);
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENDELIVERYTIMEPLAN.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENDELIVERYTIMEPLAN.COMMENTGEN LIKE ?";

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
       if(aFilterObject.planWorkRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planWorkRef.code);
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


   public ENDeliveryTimePlan getObject(int uid) throws PersistenceException
   {
    ENDeliveryTimePlan result = new ENDeliveryTimePlan();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENDeliveryTimePlan anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");


    selectStr =
    "SELECT  ENDELIVERYTIMEPLAN.CODE, ENDELIVERYTIMEPLAN.DELIVERYTIMEPLAN, ENDELIVERYTIMEPLAN.DELIVERYTIMEFACT, ENDELIVERYTIMEPLAN.DELIVERYDISTANCE, ENDELIVERYTIMEPLAN.COMMENTGEN, ENDELIVERYTIMEPLAN.MODIFY_TIME, ENDELIVERYTIMEPLAN.PLANWORKREFCODE "
    +" FROM ENDELIVERYTIMEPLAN WHERE ENDELIVERYTIMEPLAN.CODE = ?";

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
        anObject.deliveryDistance = set.getBigDecimal(4);
        if(anObject.deliveryDistance != null)
            anObject.deliveryDistance = anObject.deliveryDistance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.commentGen = set.getString(5);
        anObject.modify_time = set.getLong(6);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.planWorkRef.code = set.getInt(7);
        if ( set.wasNull() )
            anObject.planWorkRef.code = Integer.MIN_VALUE;
        if(anObject.planWorkRef.code != Integer.MIN_VALUE)
        {
           anObject.setPlanWorkRef(
        new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).getRef(anObject.planWorkRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENDeliveryTimePlanRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENDeliveryTimePlanRef ref = new com.ksoe.energynet.valueobject.references.ENDeliveryTimePlanRef();
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

    selectStr = "DELETE FROM  ENDELIVERYTIMEPLAN WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENDeliveryTimePlan object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENDeliveryTimePlan.getObject%} access denied");

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

    "SELECT  ENDELIVERYTIMEPLAN.CODE FROM  ENDELIVERYTIMEPLAN WHERE  ENDELIVERYTIMEPLAN.CODE = ?";

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
    _checkConditionToken(condition,"code","ENDELIVERYTIMEPLAN.CODE");
    _checkConditionToken(condition,"deliverytimeplan","ENDELIVERYTIMEPLAN.DELIVERYTIMEPLAN");
    _checkConditionToken(condition,"deliverytimefact","ENDELIVERYTIMEPLAN.DELIVERYTIMEFACT");
    _checkConditionToken(condition,"deliverydistance","ENDELIVERYTIMEPLAN.DELIVERYDISTANCE");
    _checkConditionToken(condition,"commentgen","ENDELIVERYTIMEPLAN.COMMENTGEN");
    _checkConditionToken(condition,"modify_time","ENDELIVERYTIMEPLAN.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"planworkref","PLANWORKREFCODE");
    _checkConditionToken(condition,"planworkref.code","PLANWORKREFCODE");
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

    private void _collectAutoIncrementFields(ENDeliveryTimePlan anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENDELIVERYTIMEPLAN", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENDELIVERYTIMEPLAN", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENDELIVERYTIMEPLAN", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENDELIVERYTIMEPLAN");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENDeliveryTimePlanDAO
