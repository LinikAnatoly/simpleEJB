
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
import com.ksoe.energynet.valueobject.ENEstimateItemStatusHistory;
import com.ksoe.energynet.valueobject.brief.ENEstimateItemStatusHistoryShort;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemStatusHistoryFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimateItemStatusHistoryShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENEstimateItemStatusHistory;
 *
 */

public class ENEstimateItemStatusHistoryDAOGen extends GenericDataMiner {

  public ENEstimateItemStatusHistoryDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENEstimateItemStatusHistoryDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENEstimateItemStatusHistory inObject) throws PersistenceException
   {
      ENEstimateItemStatusHistory obj = new ENEstimateItemStatusHistory();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.isLast != obj.isLast){
       return false;
     }

     if ( ! inObject.dateEdit.equals(obj.dateEdit)){
       return false;
     }
     if (inObject.estimateItemRef.code != obj.estimateItemRef.code){
        return false;
     }
     if (inObject.statusRef.code != obj.statusRef.code){
        return false;
     }
     if (inObject.typeRef.code != obj.typeRef.code){
        return false;
     }
      return true;
   }

   public int add(ENEstimateItemStatusHistory anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENEstimateItemStatusHistory anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENESTIMATEITEMSTTSHSTR (CODE,ISLAST,DATEEDIT,MODIFY_TIME,ESTIMATEITEMREFCODE,STATUSREFCODE,TYPEREFCODE) VALUES (?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.isLast != Integer.MIN_VALUE )
         statement.setInt(2,anObject.isLast);
      else
         statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.dateEdit == null)
        statement.setTimestamp(3,null);
      else
        statement.setTimestamp(3,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(4,null);
      else
        statement.setBigDecimal(4,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.estimateItemRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENEstimateItemDAOGen(connection,getUserProfile()).exists(anObject.estimateItemRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENEstimateItemStatusHistory.estimateItemRef.code%} = {%"+anObject.estimateItemRef.code+"%}");
        statement.setInt(5,anObject.estimateItemRef.code);
      }
      else
        statement.setNull(5,java.sql.Types.INTEGER);
      if (anObject.statusRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENEstimateItemStatusDAOGen(connection,getUserProfile()).exists(anObject.statusRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENEstimateItemStatusHistory.statusRef.code%} = {%"+anObject.statusRef.code+"%}");
        statement.setInt(6,anObject.statusRef.code);
      }
      else
        statement.setNull(6,java.sql.Types.INTEGER);
      if (anObject.typeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENEstimateItem2TypeDAOGen(connection,getUserProfile()).exists(anObject.typeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENEstimateItemStatusHistory.typeRef.code%} = {%"+anObject.typeRef.code+"%}");
        statement.setInt(7,anObject.typeRef.code);
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
      throw new PersistenceException("Error in method {%ENEstimateItemStatusHistoryDAOGen.add%}",e);
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

   public void save(ENEstimateItemStatusHistory anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENEstimateItemStatusHistory anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENEstimateItemStatusHistory oldObject = new ENEstimateItemStatusHistory();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENEstimateItemStatusHistory.modify_time_Field+" FROM  ENESTIMATEITEMSTTSHSTR WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("ISLAST") == 0)
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
          if(fieldNameStr.compareTo("MODIFY_TIME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ESTIMATEITEMREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("STATUSREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TYPEREF") == 0)
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
        "UPDATE ENESTIMATEITEMSTTSHSTR SET  ISLAST = ? , DATEEDIT = ? , MODIFY_TIME = ? , ESTIMATEITEMREFCODE = ? , STATUSREFCODE = ? , TYPEREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENESTIMATEITEMSTATUSHISTORY SET ";
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
      if (anObject.isLast != Integer.MIN_VALUE )
         statement.setInt(1,anObject.isLast);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.dateEdit == null)
        statement.setTimestamp(2,null);
      else
        statement.setTimestamp(2,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(3,null);
      else
        statement.setBigDecimal(3,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.estimateItemRef.code != Integer.MIN_VALUE)
        statement.setInt(4,anObject.estimateItemRef.code);
      else
        statement.setNull(4,java.sql.Types.INTEGER);
      if (anObject.statusRef.code != Integer.MIN_VALUE)
        statement.setInt(5,anObject.statusRef.code);
      else
        statement.setNull(5,java.sql.Types.INTEGER);
      if (anObject.typeRef.code != Integer.MIN_VALUE)
        statement.setInt(6,anObject.typeRef.code);
      else
        statement.setNull(6,java.sql.Types.INTEGER);
          statement.setInt(7,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("ISLAST".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.isLast);
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
            if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.modify_time == Long.MIN_VALUE)
                    statement.setBigDecimal(i+1,null);
                else
                     statement.setBigDecimal(i+1,new java.math.BigDecimal(anObject.modify_time));
                continue;
             }
            if("ESTIMATEITEMREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.estimateItemRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.estimateItemRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("STATUSREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.statusRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.statusRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("TYPEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.typeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.typeRef.code);
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

   } // end of save(ENEstimateItemStatusHistory anObject,String[] anAttributes)


 public ENEstimateItemStatusHistoryShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENEstimateItemStatusHistory filterObject = new ENEstimateItemStatusHistory();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENEstimateItemStatusHistoryShort)list.get(0);
   return null;
  }

  public ENEstimateItemStatusHistoryShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENEstimateItemStatusHistoryShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENEstimateItemStatusHistoryShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENEstimateItemStatusHistoryShortList getFilteredList(ENEstimateItemStatusHistory filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENEstimateItemStatusHistoryShortList getScrollableFilteredList(ENEstimateItemStatusHistory aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENEstimateItemStatusHistoryShortList getScrollableFilteredList(ENEstimateItemStatusHistory aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENEstimateItemStatusHistoryShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENEstimateItemStatusHistoryShortList getScrollableFilteredList(ENEstimateItemStatusHistoryFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENEstimateItemStatusHistoryShortList getScrollableFilteredList(ENEstimateItemStatusHistoryFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENEstimateItemStatusHistoryShortList getScrollableFilteredList(ENEstimateItemStatusHistory aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENEstimateItemStatusHistoryShortList getScrollableFilteredList(ENEstimateItemStatusHistory aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENEstimateItemStatusHistoryShortList result = new ENEstimateItemStatusHistoryShortList();
    ENEstimateItemStatusHistoryShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENESTIMATEITEMSTTSHSTR.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENESTIMATEITEMSTTSHSTR.CODE"+
     ",ENESTIMATEITEMSTTSHSTR.ISLAST"+
     ",ENESTIMATEITEMSTTSHSTR.DATEEDIT"+

      ", ENESTIMATEITEM.CODE " +
      ", ENESTIMATEITEM.COUNTGEN " +
      ", ENESTIMATEITEM.COUNTFACT " +
      ", ENESTIMATEITEM.PRICE " +
      ", ENESTIMATEITEM.COST " +
      ", ENESTIMATEITEM.ISUSEVAT " +
      ", ENESTIMATEITEM.DELIVERYTIME " +
      ", ENESTIMATEITEM.USEWORKTIME " +
      ", ENESTIMATEITEM.USERGEN " +
      ", ENESTIMATEITEM.DATEEDIT " +
      ", ENESTIMATEITEMSTATUS.CODE " +
      ", ENESTIMATEITEMSTATUS.NAME " +
      ", ENESTIMATEITEM2TYPE.CODE " +
      ", ENESTIMATEITEM2TYPE.NAME " +
     " FROM ENESTIMATEITEMSTTSHSTR " +
     ", ENESTIMATEITEM " +
     ", ENESTIMATEITEMSTATUS " +
     ", ENESTIMATEITEM2TYPE " +
     //" WHERE "
    "";
     whereStr = " ENESTIMATEITEM.CODE = ENESTIMATEITEMSTTSHSTR.ESTIMATEITEMREFCODE" ; //+
      whereStr = whereStr +" AND ENESTIMATEITEMSTATUS.CODE = ENESTIMATEITEMSTTSHSTR.STATUSREFCODE" ; //+
      whereStr = whereStr +" AND ENESTIMATEITEM2TYPE.CODE = ENESTIMATEITEMSTTSHSTR.TYPEREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENESTIMATEITEMSTTSHSTR.CODE IN ( SELECT ENESTIMATEITEMSTTSHSTR.CODE FROM ENESTIMATEITEMSTTSHSTR ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMSTTSHSTR.CODE = ?";
        }
        if(aFilterObject.isLast != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMSTTSHSTR.ISLAST = ?";
        }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMSTTSHSTR.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMSTTSHSTR.MODIFY_TIME = ?";
        }
        if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEMSTTSHSTR.ESTIMATEITEMREFCODE = ? ";
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEMSTTSHSTR.STATUSREFCODE = ? ";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENESTIMATEITEMSTTSHSTR.TYPEREFCODE = ? ";
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
         if(aFilterObject.isLast != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isLast);
         }
        if(aFilterObject.dateEdit != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.estimateItemRef.code);
       }
       if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.statusRef.code);
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

        anObject = new ENEstimateItemStatusHistoryShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.isLast = set.getInt(2);
        if ( set.wasNull() )
            anObject.isLast = Integer.MIN_VALUE;
        anObject.dateEdit = set.getTimestamp(3);

        anObject.estimateItemRefCode = set.getInt(4);
        if(set.wasNull())
        anObject.estimateItemRefCode = Integer.MIN_VALUE;
        anObject.estimateItemRefCountGen = set.getBigDecimal(5);
        if(anObject.estimateItemRefCountGen != null)
          anObject.estimateItemRefCountGen = anObject.estimateItemRefCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemRefCountFact = set.getBigDecimal(6);
        if(anObject.estimateItemRefCountFact != null)
          anObject.estimateItemRefCountFact = anObject.estimateItemRefCountFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemRefPrice = set.getBigDecimal(7);
        if(anObject.estimateItemRefPrice != null)
          anObject.estimateItemRefPrice = anObject.estimateItemRefPrice.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.estimateItemRefCost = set.getBigDecimal(8);
        if(anObject.estimateItemRefCost != null)
          anObject.estimateItemRefCost = anObject.estimateItemRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.estimateItemRefDeliveryTime = set.getInt(10);
        if(set.wasNull())
        anObject.estimateItemRefDeliveryTime = Integer.MIN_VALUE;

        anObject.estimateItemRefUserGen = set.getString(12);
        anObject.estimateItemRefDateEdit = set.getDate(13);
        anObject.statusRefCode = set.getInt(14);
        if(set.wasNull())
        anObject.statusRefCode = Integer.MIN_VALUE;
        anObject.statusRefName = set.getString(15);
        anObject.typeRefCode = set.getInt(16);
        if(set.wasNull())
        anObject.typeRefCode = Integer.MIN_VALUE;
        anObject.typeRefName = set.getString(17);

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

  public int[] getFilteredCodeArrayOLD(ENEstimateItemStatusHistory aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENESTIMATEITEMSTTSHSTR.CODE FROM ENESTIMATEITEMSTTSHSTR";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENESTIMATEITEMSTTSHSTR.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMSTTSHSTR.CODE = ?";
        }
        if(aFilterObject.isLast != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMSTTSHSTR.ISLAST = ?";
        }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMSTTSHSTR.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMSTTSHSTR.MODIFY_TIME = ?";
        }
        if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENESTIMATEITEMSTTSHSTR.ESTIMATEITEMREFCODE = ? ";
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENESTIMATEITEMSTTSHSTR.STATUSREFCODE = ? ";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENESTIMATEITEMSTTSHSTR.TYPEREFCODE = ? ";
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
         if(aFilterObject.isLast != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isLast);
         }
        if(aFilterObject.dateEdit != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.estimateItemRef.code);
       }
       if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.statusRef.code);
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

  public int[] getFilteredCodeArray(ENEstimateItemStatusHistoryFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENEstimateItemStatusHistory aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENESTIMATEITEMSTTSHSTR.CODE FROM ENESTIMATEITEMSTTSHSTR";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENESTIMATEITEMSTTSHSTR.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMSTTSHSTR.CODE = ?";
        }
        if(aFilterObject.isLast != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMSTTSHSTR.ISLAST = ?";
        }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMSTTSHSTR.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENESTIMATEITEMSTTSHSTR.MODIFY_TIME = ?";
        }
        if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENESTIMATEITEMSTTSHSTR.ESTIMATEITEMREFCODE = ? ";
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENESTIMATEITEMSTTSHSTR.STATUSREFCODE = ? ";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENESTIMATEITEMSTTSHSTR.TYPEREFCODE = ? ";
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
         if(aFilterObject.isLast != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isLast);
         }
        if(aFilterObject.dateEdit != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.estimateItemRef.code);
       }
       if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.statusRef.code);
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


   public ENEstimateItemStatusHistory getObject(int uid) throws PersistenceException
   {
    ENEstimateItemStatusHistory result = new ENEstimateItemStatusHistory();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENEstimateItemStatusHistory anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENESTIMATEITEMSTTSHSTR.CODE, ENESTIMATEITEMSTTSHSTR.ISLAST, ENESTIMATEITEMSTTSHSTR.DATEEDIT, ENESTIMATEITEMSTTSHSTR.MODIFY_TIME, ENESTIMATEITEMSTTSHSTR.ESTIMATEITEMREFCODE, ENESTIMATEITEMSTTSHSTR.STATUSREFCODE, ENESTIMATEITEMSTTSHSTR.TYPEREFCODE "
    +" FROM ENESTIMATEITEMSTTSHSTR WHERE ENESTIMATEITEMSTTSHSTR.CODE = ?";

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
        anObject.isLast = set.getInt(2);
        if ( set.wasNull() )
           anObject.isLast = Integer.MIN_VALUE;
        anObject.dateEdit = set.getTimestamp(3);
        anObject.modify_time = set.getLong(4);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.estimateItemRef.code = set.getInt(5);
        if ( set.wasNull() )
            anObject.estimateItemRef.code = Integer.MIN_VALUE;
        anObject.statusRef.code = set.getInt(6);
        if ( set.wasNull() )
            anObject.statusRef.code = Integer.MIN_VALUE;
        anObject.typeRef.code = set.getInt(7);
        if ( set.wasNull() )
            anObject.typeRef.code = Integer.MIN_VALUE;
        if(anObject.estimateItemRef.code != Integer.MIN_VALUE)
        {
           anObject.setEstimateItemRef(
        new com.ksoe.energynet.dataminer.generated.ENEstimateItemDAOGen(connection,getUserProfile()).getRef(anObject.estimateItemRef.code));
    }
        if(anObject.statusRef.code != Integer.MIN_VALUE)
        {
           anObject.setStatusRef(
        new com.ksoe.energynet.dataminer.generated.ENEstimateItemStatusDAOGen(connection,getUserProfile()).getRef(anObject.statusRef.code));
    }
        if(anObject.typeRef.code != Integer.MIN_VALUE)
        {
           anObject.setTypeRef(
        new com.ksoe.energynet.dataminer.generated.ENEstimateItem2TypeDAOGen(connection,getUserProfile()).getRef(anObject.typeRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENEstimateItemStatusHistoryRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENEstimateItemStatusHistoryRef ref = new com.ksoe.energynet.valueobject.references.ENEstimateItemStatusHistoryRef();
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

    selectStr = "DELETE FROM  ENESTIMATEITEMSTTSHSTR WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENEstimateItemStatusHistory object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENEstimateItemStatusHistory.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENEstimateItemStatusHistory.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENEstimateItemStatusHistory.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENEstimateItemStatusHistory.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENEstimateItemStatusHistory.getObject%} access denied");

    selectStr =

    "SELECT  ENESTIMATEITEMSTTSHSTR.CODE FROM  ENESTIMATEITEMSTTSHSTR WHERE  ENESTIMATEITEMSTTSHSTR.CODE = ?";
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
    _checkConditionToken(condition,"code","ENESTIMATEITEMSTTSHSTR.CODE");
    _checkConditionToken(condition,"islast","ENESTIMATEITEMSTTSHSTR.ISLAST");
    _checkConditionToken(condition,"dateedit","ENESTIMATEITEMSTTSHSTR.DATEEDIT");
    _checkConditionToken(condition,"modify_time","ENESTIMATEITEMSTTSHSTR.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"estimateitemref","ESTIMATEITEMREFCODE");
    _checkConditionToken(condition,"estimateitemref.code","ESTIMATEITEMREFCODE");
    _checkConditionToken(condition,"statusref","STATUSREFCODE");
    _checkConditionToken(condition,"statusref.code","STATUSREFCODE");
    _checkConditionToken(condition,"typeref","TYPEREFCODE");
    _checkConditionToken(condition,"typeref.code","TYPEREFCODE");
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

    private void _collectAutoIncrementFields(ENEstimateItemStatusHistory anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENESTIMATEITEMSTTSHSTR", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENESTIMATEITEMSTTSHSTR", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENESTIMATEITEMSTTSHSTR", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENESTIMATEITEMSTTSHSTR");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENEstimateItemStatusHistoryDAO
