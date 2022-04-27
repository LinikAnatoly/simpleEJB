
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
import com.ksoe.energynet.valueobject.ENTransportOrder2TransportItem;
import com.ksoe.energynet.valueobject.brief.ENTransportOrder2TransportItemShort;
import com.ksoe.energynet.valueobject.filter.ENTransportOrder2TransportItemFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportOrder2TransportItemShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENTransportOrder2TransportItem;
 *
 */

public class ENTransportOrder2TransportItemDAOGen extends GenericDataMiner {

  public ENTransportOrder2TransportItemDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTransportOrder2TransportItemDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENTransportOrder2TransportItem inObject) throws PersistenceException
   {
      ENTransportOrder2TransportItem obj = new ENTransportOrder2TransportItem();
      obj.code = inObject.code;
      loadObject(obj);
     if (inObject.transportOrder.code != obj.transportOrder.code){
        return false;
     }
     if (inObject.transportItem.code != obj.transportItem.code){
        return false;
     }
      return true;
   }

   public int add(ENTransportOrder2TransportItem anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENTransportOrder2TransportItem anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENTRNSPRTRDR2TRNSPRTTM (CODE,TRANSPORTORDERCODE,TRANSPORTITEMCODE) VALUES (?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.transportOrder.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTransportOrderDAOGen(connection,getUserProfile()).exists(anObject.transportOrder.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTransportOrder2TransportItem.transportOrder.code%} = {%"+anObject.transportOrder.code+"%}");
        statement.setInt(2,anObject.transportOrder.code);
      }
      else
        statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.transportItem.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTransportItemDAOGen(connection,getUserProfile()).exists(anObject.transportItem.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTransportOrder2TransportItem.transportItem.code%} = {%"+anObject.transportItem.code+"%}");
        statement.setInt(3,anObject.transportItem.code);
      }
      else
        statement.setNull(3,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENTransportOrder2TransportItemDAOGen.add%}",e);
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

   public void save(ENTransportOrder2TransportItem anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENTransportOrder2TransportItem anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      String selectStr;

      Vector fields = null;
      if(anAttributes != null)
       {
        String fieldNameStr;
        fields = new Vector();
        for(int attrIndex = 0;attrIndex < anAttributes.length;attrIndex++)
         {
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TRANSPORTORDER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TRANSPORTITEM") == 0)
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
        "UPDATE ENTRNSPRTRDR2TRNSPRTTM SET TRANSPORTORDERCODE = ? , TRANSPORTITEMCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENTRANSPORTORDER2TRANSPORTITEM SET ";
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
      if (anObject.transportOrder.code != Integer.MIN_VALUE)
        statement.setInt(1,anObject.transportOrder.code);
      else
        statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.transportItem.code != Integer.MIN_VALUE)
        statement.setInt(2,anObject.transportItem.code);
      else
        statement.setNull(2,java.sql.Types.INTEGER);
          statement.setInt(3,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("TRANSPORTORDER".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.transportOrder.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.transportOrder.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("TRANSPORTITEM".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.transportItem.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.transportItem.code);
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

   } // end of save(ENTransportOrder2TransportItem anObject,String[] anAttributes)


 public ENTransportOrder2TransportItemShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENTransportOrder2TransportItem filterObject = new ENTransportOrder2TransportItem();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENTransportOrder2TransportItemShort)list.get(0);
   return null;
  }

  public ENTransportOrder2TransportItemShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENTransportOrder2TransportItemShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENTransportOrder2TransportItemShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENTransportOrder2TransportItemShortList getFilteredList(ENTransportOrder2TransportItem filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENTransportOrder2TransportItemShortList getScrollableFilteredList(ENTransportOrder2TransportItem aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENTransportOrder2TransportItemShortList getScrollableFilteredList(ENTransportOrder2TransportItem aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENTransportOrder2TransportItemShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENTransportOrder2TransportItemShortList getScrollableFilteredList(ENTransportOrder2TransportItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENTransportOrder2TransportItemShortList getScrollableFilteredList(ENTransportOrder2TransportItemFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENTransportOrder2TransportItemShortList getScrollableFilteredList(ENTransportOrder2TransportItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENTransportOrder2TransportItemShortList getScrollableFilteredList(ENTransportOrder2TransportItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENTransportOrder2TransportItemShortList result = new ENTransportOrder2TransportItemShortList();
    ENTransportOrder2TransportItemShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRNSPRTRDR2TRNSPRTTM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENTRNSPRTRDR2TRNSPRTTM.CODE"+

      ", ENTRANSPORTORDER.CODE " +
      ", ENTRANSPORTORDER.NUMBERGEN " +
      ", ENTRANSPORTORDER.TIMESTART " +
      ", ENTRANSPORTORDER.TIMEFINAL " +
      ", ENTRANSPORTORDER.DATESTART " +
      ", ENTRANSPORTORDER.DATEFINAL " +
      ", ENTRANSPORTORDER.ISASSIGNMENT " +
      ", ENTRANSPORTORDER.DATEEDIT " +
      ", ENTRANSPORTORDER.USERGEN " +
      ", ENTRANSPORTITEM.CODE " +
      ", ENTRANSPORTITEM.COUNTWORKGEN " +
      ", ENTRANSPORTITEM.COUNTWORKFACT " +
      ", ENTRANSPORTITEM.PRICE " +
      ", ENTRANSPORTITEM.COST " +
      ", ENTRANSPORTITEM.USERGEN " +
      ", ENTRANSPORTITEM.DATEEDIT " +
      ", ENTRANSPORTITEM.DISTANCENORM " +
      ", ENTRANSPORTITEM.AMOUNTOFJOURNEYS " +
     " FROM ENTRNSPRTRDR2TRNSPRTTM " +
     ", ENTRANSPORTORDER " +
     ", ENTRANSPORTITEM " +
     //" WHERE "
    "";
     whereStr = " ENTRANSPORTORDER.CODE = ENTRNSPRTRDR2TRNSPRTTM.TRANSPORTORDERCODE" ; //+
      whereStr = whereStr +" AND ENTRANSPORTITEM.CODE = ENTRNSPRTRDR2TRNSPRTTM.TRANSPORTITEMCODE" ; //+
        //selectStr = selectStr + " ${s} ENTRNSPRTRDR2TRNSPRTTM.CODE IN ( SELECT ENTRNSPRTRDR2TRNSPRTTM.CODE FROM ENTRNSPRTRDR2TRNSPRTTM ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRNSPRTRDR2TRNSPRTTM.CODE = ?";
        }
        if(aFilterObject.transportOrder.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRNSPRTRDR2TRNSPRTTM.TRANSPORTORDERCODE = ? ";
        }
        if(aFilterObject.transportItem.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRNSPRTRDR2TRNSPRTTM.TRANSPORTITEMCODE = ? ";
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
       if(aFilterObject.transportOrder.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportOrder.code);
       }
       if(aFilterObject.transportItem.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportItem.code);
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

        anObject = new ENTransportOrder2TransportItemShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;

        anObject.transportOrderCode = set.getInt(2);
        if(set.wasNull())
        anObject.transportOrderCode = Integer.MIN_VALUE;

        anObject.transportOrderTimeStart = set.getTimestamp(4);
        anObject.transportOrderTimeFinal = set.getTimestamp(5);
        anObject.transportOrderDateStart = set.getTimestamp(6);
        anObject.transportOrderDateFinal = set.getTimestamp(7);

        anObject.transportOrderDateEdit = set.getTimestamp(9);
        anObject.transportOrderUserGen = set.getString(10);
        anObject.transportItemCode = set.getInt(11);
        if(set.wasNull())
        anObject.transportItemCode = Integer.MIN_VALUE;
        anObject.transportItemCountWorkGen = set.getBigDecimal(12);
        if(anObject.transportItemCountWorkGen != null)
          anObject.transportItemCountWorkGen = anObject.transportItemCountWorkGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.transportItemCountWorkFact = set.getBigDecimal(13);
        if(anObject.transportItemCountWorkFact != null)
          anObject.transportItemCountWorkFact = anObject.transportItemCountWorkFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.transportItemPrice = set.getBigDecimal(14);
        if(anObject.transportItemPrice != null)
          anObject.transportItemPrice = anObject.transportItemPrice.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.transportItemCost = set.getBigDecimal(15);
        if(anObject.transportItemCost != null)
          anObject.transportItemCost = anObject.transportItemCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.transportItemUserGen = set.getString(16);
        anObject.transportItemDateEdit = set.getDate(17);

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

  public int[] getFilteredCodeArrayOLD(ENTransportOrder2TransportItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRNSPRTRDR2TRNSPRTTM.CODE FROM ENTRNSPRTRDR2TRNSPRTTM";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRNSPRTRDR2TRNSPRTTM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRNSPRTRDR2TRNSPRTTM.CODE = ?";
        }
        if(aFilterObject.transportOrder.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRNSPRTRDR2TRNSPRTTM.TRANSPORTORDERCODE = ? ";
        }
        if(aFilterObject.transportItem.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRNSPRTRDR2TRNSPRTTM.TRANSPORTITEMCODE = ? ";
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
       if(aFilterObject.transportOrder.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportOrder.code);
       }
       if(aFilterObject.transportItem.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportItem.code);
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

  public int[] getFilteredCodeArray(ENTransportOrder2TransportItemFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENTransportOrder2TransportItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRNSPRTRDR2TRNSPRTTM.CODE FROM ENTRNSPRTRDR2TRNSPRTTM";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRNSPRTRDR2TRNSPRTTM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRNSPRTRDR2TRNSPRTTM.CODE = ?";
        }
        if(aFilterObject.transportOrder.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRNSPRTRDR2TRNSPRTTM.TRANSPORTORDERCODE = ? ";
        }
        if(aFilterObject.transportItem.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRNSPRTRDR2TRNSPRTTM.TRANSPORTITEMCODE = ? ";
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
       if(aFilterObject.transportOrder.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportOrder.code);
       }
       if(aFilterObject.transportItem.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportItem.code);
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


   public ENTransportOrder2TransportItem getObject(int uid) throws PersistenceException
   {
    ENTransportOrder2TransportItem result = new ENTransportOrder2TransportItem();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENTransportOrder2TransportItem anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENTRNSPRTRDR2TRNSPRTTM.CODE, ENTRNSPRTRDR2TRNSPRTTM.TRANSPORTORDERCODE, ENTRNSPRTRDR2TRNSPRTTM.TRANSPORTITEMCODE "
    +" FROM ENTRNSPRTRDR2TRNSPRTTM WHERE ENTRNSPRTRDR2TRNSPRTTM.CODE = ?";

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
        anObject.transportOrder.code = set.getInt(2);
        if ( set.wasNull() )
            anObject.transportOrder.code = Integer.MIN_VALUE;
        anObject.transportItem.code = set.getInt(3);
        if ( set.wasNull() )
            anObject.transportItem.code = Integer.MIN_VALUE;
        if(anObject.transportOrder.code != Integer.MIN_VALUE)
        {
           anObject.setTransportOrder(
        new com.ksoe.energynet.dataminer.generated.ENTransportOrderDAOGen(connection,getUserProfile()).getRef(anObject.transportOrder.code));
    }
        if(anObject.transportItem.code != Integer.MIN_VALUE)
        {
           anObject.setTransportItem(
        new com.ksoe.energynet.dataminer.generated.ENTransportItemDAOGen(connection,getUserProfile()).getRef(anObject.transportItem.code));
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


  public com.ksoe.energynet.valueobject.references.ENTransportOrder2TransportItemRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENTransportOrder2TransportItemRef ref = new com.ksoe.energynet.valueobject.references.ENTransportOrder2TransportItemRef();
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

    selectStr = "DELETE FROM  ENTRNSPRTRDR2TRNSPRTTM WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENTransportOrder2TransportItem object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENTransportOrder2TransportItem.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENTransportOrder2TransportItem.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENTransportOrder2TransportItem.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTransportOrder2TransportItem.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENTransportOrder2TransportItem.getObject%} access denied");

    selectStr =

    "SELECT  ENTRNSPRTRDR2TRNSPRTTM.CODE FROM  ENTRNSPRTRDR2TRNSPRTTM WHERE  ENTRNSPRTRDR2TRNSPRTTM.CODE = ?";
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
    _checkConditionToken(condition,"code","ENTRNSPRTRDR2TRNSPRTTM.CODE");
      // relationship conditions
    _checkConditionToken(condition,"transportorder","TRANSPORTORDERCODE");
    _checkConditionToken(condition,"transportorder.code","TRANSPORTORDERCODE");
    _checkConditionToken(condition,"transportitem","TRANSPORTITEMCODE");
    _checkConditionToken(condition,"transportitem.code","TRANSPORTITEMCODE");
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

    private void _collectAutoIncrementFields(ENTransportOrder2TransportItem anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENTRNSPRTRDR2TRNSPRTTM", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENTRNSPRTRDR2TRNSPRTTM", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENTRNSPRTRDR2TRNSPRTTM", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENTRNSPRTRDR2TRNSPRTTM");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENTransportOrder2TransportItemDAO
