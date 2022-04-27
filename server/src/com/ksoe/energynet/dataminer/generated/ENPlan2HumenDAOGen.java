
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
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

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.valueobject.ENPlan2Humen;
import com.ksoe.energynet.valueobject.brief.ENPlan2HumenShort;
import com.ksoe.energynet.valueobject.filter.ENPlan2HumenFilter;
import com.ksoe.energynet.valueobject.lists.ENPlan2HumenShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENPlan2Humen;
 *
 */

public class ENPlan2HumenDAOGen extends GenericDataMiner {

   public ENPlan2HumenDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENPlan2HumenDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   public int add(ENPlan2Humen anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENPlan2Humen anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

  anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENPLAN2HUMEN (CODE,TABNUMBER,FIO,POSITIONCODE,PRICEGEN,TIMEWORKGEN,TIMEWORKFACT,TIMEDELIVERY,POSITIONID,MODIFY_TIME,PLANREFCODE,HUMENKINDREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.tabNumber);
      statement.setString(3,anObject.fio);
      if (anObject.positionCode != Integer.MIN_VALUE )
         statement.setInt(4,anObject.positionCode);
      else
         statement.setNull(4,java.sql.Types.INTEGER);
      if (anObject.priceGen != null)
        anObject.priceGen = anObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.priceGen);
      if (anObject.timeWorkGen != null)
        anObject.timeWorkGen = anObject.timeWorkGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.timeWorkGen);
      if (anObject.timeWorkFact != null)
        anObject.timeWorkFact = anObject.timeWorkFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.timeWorkFact);
      if (anObject.timeDelivery != null)
        anObject.timeDelivery = anObject.timeDelivery.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.timeDelivery);
      statement.setString(9,anObject.positionId);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(10,null);
      else
        statement.setBigDecimal(10,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.planRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPlan2Humen.planRef.code%} = {%"+anObject.planRef.code+"%}");
        statement.setInt(11,anObject.planRef.code);
      }
      else
        statement.setNull(11,java.sql.Types.INTEGER);
      if (anObject.humenKindRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENHumenItemKindDAOGen(connection,getUserProfile()).exists(anObject.humenKindRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPlan2Humen.humenKindRef.code%} = {%"+anObject.humenKindRef.code+"%}");
        statement.setInt(12,anObject.humenKindRef.code);
      }
      else
        statement.setNull(12,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENPlan2HumenDAOGen.add%}",e);
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

   public void save(ENPlan2Humen anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENPlan2Humen anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENPlan2Humen oldObject = new ENPlan2Humen();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENPlan2Humen.modify_time_Field+" FROM  ENPLAN2HUMEN WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("TABNUMBER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FIO") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("POSITIONCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PRICEGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TIMEWORKGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TIMEWORKFACT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TIMEDELIVERY") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("POSITIONID") == 0)
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
          if(fieldNameStr.compareTo("PLANREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("HUMENKINDREF") == 0)
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
        "UPDATE ENPLAN2HUMEN SET  TABNUMBER = ? , FIO = ? , POSITIONCODE = ? , PRICEGEN = ? , TIMEWORKGEN = ? , TIMEWORKFACT = ? , TIMEDELIVERY = ? , POSITIONID = ? , MODIFY_TIME = ? , PLANREFCODE = ? , HUMENKINDREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENPLAN2HUMEN SET ";
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
      statement.setString(1,anObject.tabNumber);
      statement.setString(2,anObject.fio);
      if (anObject.positionCode != Integer.MIN_VALUE )
         statement.setInt(3,anObject.positionCode);
      else
         statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.priceGen != null)
        anObject.priceGen = anObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.priceGen);
      if (anObject.timeWorkGen != null)
        anObject.timeWorkGen = anObject.timeWorkGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.timeWorkGen);
      if (anObject.timeWorkFact != null)
        anObject.timeWorkFact = anObject.timeWorkFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.timeWorkFact);
      if (anObject.timeDelivery != null)
        anObject.timeDelivery = anObject.timeDelivery.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.timeDelivery);
      statement.setString(8,anObject.positionId);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(9,null);
      else
        statement.setBigDecimal(9,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.planRef.code != Integer.MIN_VALUE)
        statement.setInt(10,anObject.planRef.code);
      else
        statement.setNull(10,java.sql.Types.INTEGER);
      if (anObject.humenKindRef.code != Integer.MIN_VALUE)
        statement.setInt(11,anObject.humenKindRef.code);
      else
        statement.setNull(11,java.sql.Types.INTEGER);
          statement.setInt(12,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("TABNUMBER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.tabNumber);
                continue;
             }
            if("FIO".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.fio);
                continue;
             }
            if("POSITIONCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.positionCode);
                continue;
             }
            if("PRICEGEN".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.priceGen != null)
                    anObject.priceGen = anObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.priceGen);
                continue;
             }
            if("TIMEWORKGEN".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.timeWorkGen != null)
                    anObject.timeWorkGen = anObject.timeWorkGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.timeWorkGen);
                continue;
             }
            if("TIMEWORKFACT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.timeWorkFact != null)
                    anObject.timeWorkFact = anObject.timeWorkFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.timeWorkFact);
                continue;
             }
            if("TIMEDELIVERY".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.timeDelivery != null)
                    anObject.timeDelivery = anObject.timeDelivery.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.timeDelivery);
                continue;
             }
            if("POSITIONID".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.positionId);
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
            if("PLANREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.planRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.planRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("HUMENKINDREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.humenKindRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.humenKindRef.code);
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

   } // end of save(ENPlan2Humen anObject,String[] anAttributes)


 public ENPlan2HumenShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENPlan2Humen filterObject = new ENPlan2Humen();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENPlan2HumenShort)list.get(0);
   return null;
  }

  public ENPlan2HumenShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENPlan2HumenShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENPlan2HumenShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENPlan2HumenShortList getFilteredList(ENPlan2Humen filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENPlan2HumenShortList getScrollableFilteredList(ENPlan2Humen aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENPlan2HumenShortList getScrollableFilteredList(ENPlan2Humen aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENPlan2HumenShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENPlan2HumenShortList getScrollableFilteredList(ENPlan2HumenFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENPlan2HumenShortList getScrollableFilteredList(ENPlan2HumenFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENPlan2HumenShortList getScrollableFilteredList(ENPlan2Humen aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENPlan2HumenShortList getScrollableFilteredList(ENPlan2Humen aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENPlan2HumenShortList result = new ENPlan2HumenShortList();
    ENPlan2HumenShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENPLAN2HUMEN.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENPLAN2HUMEN.CODE"+
     ",ENPLAN2HUMEN.TABNUMBER"+
     ",ENPLAN2HUMEN.FIO"+
     ",ENPLAN2HUMEN.POSITIONCODE"+
     ",ENPLAN2HUMEN.PRICEGEN"+
     ",ENPLAN2HUMEN.TIMEWORKGEN"+
     ",ENPLAN2HUMEN.TIMEWORKFACT"+
     ",ENPLAN2HUMEN.TIMEDELIVERY"+
     ",ENPLAN2HUMEN.POSITIONID"+

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
      ", ENHUMENITEMKIND.CODE " +
      ", ENHUMENITEMKIND.NAME " +
     " FROM ENPLAN2HUMEN " +
     ", ENPLANWORK " +
     ", ENHUMENITEMKIND " +
     //" WHERE "
  "";
     whereStr = " ENPLANWORK.CODE = ENPLAN2HUMEN.PLANREFCODE" ; //+
      whereStr = whereStr +" AND ENHUMENITEMKIND.CODE = ENPLAN2HUMEN.HUMENKINDREFCODE" ; //+
    //selectStr = selectStr + " ${s} ENPLAN2HUMEN.CODE IN ( SELECT ENPLAN2HUMEN.CODE FROM ENPLAN2HUMEN ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLAN2HUMEN.CODE = ?";
        }
         if (aFilterObject.tabNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.tabNumber.indexOf('*',0) < 0 && aFilterObject.tabNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENPLAN2HUMEN.TABNUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENPLAN2HUMEN.TABNUMBER) LIKE UPPER(?)";
         }
         if (aFilterObject.fio != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.fio.indexOf('*',0) < 0 && aFilterObject.fio.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENPLAN2HUMEN.FIO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENPLAN2HUMEN.FIO) LIKE UPPER(?)";
         }
        if(aFilterObject.positionCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLAN2HUMEN.POSITIONCODE = ?";
        }
        if(aFilterObject.priceGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLAN2HUMEN.PRICEGEN = ?";
        }
        if(aFilterObject.timeWorkGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLAN2HUMEN.TIMEWORKGEN = ?";
        }
        if(aFilterObject.timeWorkFact != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLAN2HUMEN.TIMEWORKFACT = ?";
        }
        if(aFilterObject.timeDelivery != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLAN2HUMEN.TIMEDELIVERY = ?";
        }
         if (aFilterObject.positionId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.positionId.indexOf('*',0) < 0 && aFilterObject.positionId.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENPLAN2HUMEN.POSITIONID) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENPLAN2HUMEN.POSITIONID) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLAN2HUMEN.MODIFY_TIME = ?";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENPLAN2HUMEN.PLANREFCODE = ? ";
        }
        if(aFilterObject.humenKindRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENPLAN2HUMEN.HUMENKINDREFCODE = ? ";
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

           if(aFilterObject.tabNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.tabNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.fio != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.fio);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.positionCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.positionCode);
         }
        if(aFilterObject.priceGen != null){
            number++;
            aFilterObject.priceGen = aFilterObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.priceGen);
        }
        if(aFilterObject.timeWorkGen != null){
            number++;
            aFilterObject.timeWorkGen = aFilterObject.timeWorkGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.timeWorkGen);
        }
        if(aFilterObject.timeWorkFact != null){
            number++;
            aFilterObject.timeWorkFact = aFilterObject.timeWorkFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.timeWorkFact);
        }
        if(aFilterObject.timeDelivery != null){
            number++;
            aFilterObject.timeDelivery = aFilterObject.timeDelivery.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.timeDelivery);
        }

           if(aFilterObject.positionId != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.positionId);
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
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
       }
       if(aFilterObject.humenKindRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.humenKindRef.code);
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

        anObject = new ENPlan2HumenShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.tabNumber = set.getString(2);
        anObject.fio = set.getString(3);
        anObject.positionCode = set.getInt(4);
        if ( set.wasNull() )
            anObject.positionCode = Integer.MIN_VALUE;
        anObject.priceGen = set.getBigDecimal(5);
        if(anObject.priceGen != null)
            anObject.priceGen = anObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.timeWorkGen = set.getBigDecimal(6);
        if(anObject.timeWorkGen != null)
            anObject.timeWorkGen = anObject.timeWorkGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.timeWorkFact = set.getBigDecimal(7);
        if(anObject.timeWorkFact != null)
            anObject.timeWorkFact = anObject.timeWorkFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.timeDelivery = set.getBigDecimal(8);
        if(anObject.timeDelivery != null)
            anObject.timeDelivery = anObject.timeDelivery.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.positionId = set.getString(9);

        anObject.planRefCode = set.getInt(10);
    if(set.wasNull())
      anObject.planRefCode = Integer.MIN_VALUE;
        anObject.planRefDateGen = set.getTimestamp(11);
        anObject.planRefDateStart = set.getDate(12);
        anObject.planRefDateFinal = set.getDate(13);
        anObject.planRefYearGen = set.getInt(14);
    if(set.wasNull())
      anObject.planRefYearGen = Integer.MIN_VALUE;
        anObject.planRefMonthGen = set.getInt(15);
    if(set.wasNull())
      anObject.planRefMonthGen = Integer.MIN_VALUE;
        anObject.planRefYearOriginal = set.getInt(16);
    if(set.wasNull())
      anObject.planRefYearOriginal = Integer.MIN_VALUE;
        anObject.planRefMonthOriginal = set.getInt(17);
    if(set.wasNull())
      anObject.planRefMonthOriginal = Integer.MIN_VALUE;
        anObject.planRefUserGen = set.getString(18);
        anObject.planRefDateEdit = set.getDate(19);
        anObject.planRefWorkOrderNumber = set.getString(20);
        anObject.planRefDateWorkOrder = set.getDate(21);
        anObject.planRefPriConnectionNumber = set.getString(22);
        anObject.planRefDateEndPriConnection = set.getDate(23);
        anObject.planRefInvestWorksDescription = set.getString(24);
        anObject.planRefServicesFSideFinId = set.getInt(25);
    if(set.wasNull())
      anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;
        anObject.planRefServicesFSideCnNum = set.getString(26);
        anObject.planRefTotalTimeHours = set.getBigDecimal(27);
        if(anObject.planRefTotalTimeHours != null)
          anObject.planRefTotalTimeHours = anObject.planRefTotalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.planRefTotalTimeDays = set.getBigDecimal(28);
        if(anObject.planRefTotalTimeDays != null)
          anObject.planRefTotalTimeDays = anObject.planRefTotalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.planRefInvestItemNumber = set.getString(29);
        anObject.humenKindRefCode = set.getInt(30);
    if(set.wasNull())
      anObject.humenKindRefCode = Integer.MIN_VALUE;
        anObject.humenKindRefName = set.getString(31);

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

  public int[] getFilteredCodeArrayOLD(ENPlan2Humen aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENPLAN2HUMEN.CODE FROM ENPLAN2HUMEN";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENPLAN2HUMEN.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLAN2HUMEN.CODE = ?";
        }
         if (aFilterObject.tabNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.tabNumber.indexOf('*',0) < 0 && aFilterObject.tabNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENPLAN2HUMEN.TABNUMBER = ?";
             else
                 whereStr = whereStr + "  ENPLAN2HUMEN.TABNUMBER LIKE ?";
         }
         if (aFilterObject.fio != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.fio.indexOf('*',0) < 0 && aFilterObject.fio.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENPLAN2HUMEN.FIO = ?";
             else
                 whereStr = whereStr + "  ENPLAN2HUMEN.FIO LIKE ?";
         }
        if(aFilterObject.positionCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLAN2HUMEN.POSITIONCODE = ?";
        }
        if(aFilterObject.priceGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLAN2HUMEN.PRICEGEN = ?";
        }
        if(aFilterObject.timeWorkGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLAN2HUMEN.TIMEWORKGEN = ?";
        }
        if(aFilterObject.timeWorkFact != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLAN2HUMEN.TIMEWORKFACT = ?";
        }
        if(aFilterObject.timeDelivery != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLAN2HUMEN.TIMEDELIVERY = ?";
        }
         if (aFilterObject.positionId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.positionId.indexOf('*',0) < 0 && aFilterObject.positionId.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENPLAN2HUMEN.POSITIONID = ?";
             else
                 whereStr = whereStr + "  ENPLAN2HUMEN.POSITIONID LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLAN2HUMEN.MODIFY_TIME = ?";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLAN2HUMEN.PLANREFCODE = ? ";
        }
        if(aFilterObject.humenKindRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLAN2HUMEN.HUMENKINDREFCODE = ? ";
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
         if (aFilterObject.tabNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.tabNumber.indexOf('*',0) < 0 && aFilterObject.tabNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENPLAN2HUMEN.TABNUMBER = ?";
             else
                 whereStr = whereStr + " ENPLAN2HUMEN.TABNUMBER LIKE ?";

           if(aFilterObject.tabNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.tabNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.fio != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.fio.indexOf('*',0) < 0 && aFilterObject.fio.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENPLAN2HUMEN.FIO = ?";
             else
                 whereStr = whereStr + " ENPLAN2HUMEN.FIO LIKE ?";

           if(aFilterObject.fio != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.fio);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.positionCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.positionCode);
         }
        if(aFilterObject.priceGen != null){
            number++;
            aFilterObject.priceGen = aFilterObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.priceGen);
        }
        if(aFilterObject.timeWorkGen != null){
            number++;
            aFilterObject.timeWorkGen = aFilterObject.timeWorkGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.timeWorkGen);
        }
        if(aFilterObject.timeWorkFact != null){
            number++;
            aFilterObject.timeWorkFact = aFilterObject.timeWorkFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.timeWorkFact);
        }
        if(aFilterObject.timeDelivery != null){
            number++;
            aFilterObject.timeDelivery = aFilterObject.timeDelivery.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.timeDelivery);
        }
         if (aFilterObject.positionId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.positionId.indexOf('*',0) < 0 && aFilterObject.positionId.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENPLAN2HUMEN.POSITIONID = ?";
             else
                 whereStr = whereStr + " ENPLAN2HUMEN.POSITIONID LIKE ?";

           if(aFilterObject.positionId != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.positionId);
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
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
       }
       if(aFilterObject.humenKindRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.humenKindRef.code);
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

  public int[] getFilteredCodeArray(ENPlan2HumenFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENPlan2Humen aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENPLAN2HUMEN.CODE FROM ENPLAN2HUMEN";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENPLAN2HUMEN.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLAN2HUMEN.CODE = ?";
        }
         if (aFilterObject.tabNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.tabNumber.indexOf('*',0) < 0 && aFilterObject.tabNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENPLAN2HUMEN.TABNUMBER = ?";
             else
                 whereStr = whereStr + "  ENPLAN2HUMEN.TABNUMBER LIKE ?";
         }
         if (aFilterObject.fio != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.fio.indexOf('*',0) < 0 && aFilterObject.fio.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENPLAN2HUMEN.FIO = ?";
             else
                 whereStr = whereStr + "  ENPLAN2HUMEN.FIO LIKE ?";
         }
        if(aFilterObject.positionCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLAN2HUMEN.POSITIONCODE = ?";
        }
        if(aFilterObject.priceGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLAN2HUMEN.PRICEGEN = ?";
        }
        if(aFilterObject.timeWorkGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLAN2HUMEN.TIMEWORKGEN = ?";
        }
        if(aFilterObject.timeWorkFact != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLAN2HUMEN.TIMEWORKFACT = ?";
        }
        if(aFilterObject.timeDelivery != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLAN2HUMEN.TIMEDELIVERY = ?";
        }
         if (aFilterObject.positionId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.positionId.indexOf('*',0) < 0 && aFilterObject.positionId.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENPLAN2HUMEN.POSITIONID = ?";
             else
                 whereStr = whereStr + "  ENPLAN2HUMEN.POSITIONID LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLAN2HUMEN.MODIFY_TIME = ?";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLAN2HUMEN.PLANREFCODE = ? ";
        }
        if(aFilterObject.humenKindRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLAN2HUMEN.HUMENKINDREFCODE = ? ";
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
         if (aFilterObject.tabNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.tabNumber.indexOf('*',0) < 0 && aFilterObject.tabNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENPLAN2HUMEN.TABNUMBER = ?";
             else
                 whereStr = whereStr + " ENPLAN2HUMEN.TABNUMBER LIKE ?";

           if(aFilterObject.tabNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.tabNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.fio != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.fio.indexOf('*',0) < 0 && aFilterObject.fio.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENPLAN2HUMEN.FIO = ?";
             else
                 whereStr = whereStr + " ENPLAN2HUMEN.FIO LIKE ?";

           if(aFilterObject.fio != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.fio);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.positionCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.positionCode);
         }
        if(aFilterObject.priceGen != null){
            number++;
            aFilterObject.priceGen = aFilterObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.priceGen);
        }
        if(aFilterObject.timeWorkGen != null){
            number++;
            aFilterObject.timeWorkGen = aFilterObject.timeWorkGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.timeWorkGen);
        }
        if(aFilterObject.timeWorkFact != null){
            number++;
            aFilterObject.timeWorkFact = aFilterObject.timeWorkFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.timeWorkFact);
        }
        if(aFilterObject.timeDelivery != null){
            number++;
            aFilterObject.timeDelivery = aFilterObject.timeDelivery.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.timeDelivery);
        }
         if (aFilterObject.positionId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.positionId.indexOf('*',0) < 0 && aFilterObject.positionId.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENPLAN2HUMEN.POSITIONID = ?";
             else
                 whereStr = whereStr + " ENPLAN2HUMEN.POSITIONID LIKE ?";

           if(aFilterObject.positionId != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.positionId);
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
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
       }
       if(aFilterObject.humenKindRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.humenKindRef.code);
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


  public com.ksoe.energynet.valueobject.references.ENPlan2HumenRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENPlan2HumenRef ref = new com.ksoe.energynet.valueobject.references.ENPlan2HumenRef();
    if(exists(anObjectCode))
     ref.code = anObjectCode;
    else
     ref.code = Integer.MIN_VALUE;
    return ref;
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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPlan2Humen.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENPlan2Humen.getObject%} access denied");

    selectStr =

    "SELECT  ENPLAN2HUMEN.CODE FROM  ENPLAN2HUMEN WHERE  ENPLAN2HUMEN.CODE = ?";
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
    _checkConditionToken(condition,"code","ENPLAN2HUMEN.CODE");
    _checkConditionToken(condition,"tabnumber","ENPLAN2HUMEN.TABNUMBER");
    _checkConditionToken(condition,"fio","ENPLAN2HUMEN.FIO");
    _checkConditionToken(condition,"positioncode","ENPLAN2HUMEN.POSITIONCODE");
    _checkConditionToken(condition,"pricegen","ENPLAN2HUMEN.PRICEGEN");
    _checkConditionToken(condition,"timeworkgen","ENPLAN2HUMEN.TIMEWORKGEN");
    _checkConditionToken(condition,"timeworkfact","ENPLAN2HUMEN.TIMEWORKFACT");
    _checkConditionToken(condition,"timedelivery","ENPLAN2HUMEN.TIMEDELIVERY");
    _checkConditionToken(condition,"positionid","ENPLAN2HUMEN.POSITIONID");
    _checkConditionToken(condition,"modify_time","ENPLAN2HUMEN.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"planref","PLANREFCODE");
    _checkConditionToken(condition,"planref.code","PLANREFCODE");
    _checkConditionToken(condition,"humenkindref","HUMENKINDREFCODE");
    _checkConditionToken(condition,"humenkindref.code","HUMENKINDREFCODE");
    return condition.toString();
   }

   @Override
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

  public void _collectAutoIncrementFields(ENPlan2Humen anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENPLAN2HUMEN", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENPLAN2HUMEN", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENPLAN2HUMEN", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENPLAN2HUMEN");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENPlan2HumenDAO
