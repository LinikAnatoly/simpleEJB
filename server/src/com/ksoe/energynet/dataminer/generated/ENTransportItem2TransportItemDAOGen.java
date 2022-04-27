
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
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
import com.ksoe.energynet.valueobject.ENTransportItem2TransportItem;
import com.ksoe.energynet.valueobject.brief.ENTransportItem2TransportItemShort;
import com.ksoe.energynet.valueobject.filter.ENTransportItem2TransportItemFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportItem2TransportItemShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


  /**
  *  DAO Generated for ENTransportItem2TransportItem;
  *
  */

public class ENTransportItem2TransportItemDAOGen extends GenericDataMiner {

  public ENTransportItem2TransportItemDAOGen() {super();}
  public ENTransportItem2TransportItemDAOGen(Connection aConnection) {super(aConnection);}
  public ENTransportItem2TransportItemDAOGen(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTransportItem2TransportItemDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTransportItem2TransportItemDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENTransportItem2TransportItem inObject) throws PersistenceException
   {
      ENTransportItem2TransportItem obj = new ENTransportItem2TransportItem();
      obj.code = inObject.code;
      loadObject(obj);
     if (inObject.inRef.code != obj.inRef.code){
        return false;
     }
     if (inObject.outRef.code != obj.outRef.code){
        return false;
     }
      return true;
   }

   public int add(ENTransportItem2TransportItem anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENTransportItem2TransportItem anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENTRANSPRTTM2TRNSPRTTM (CODE,MODIFY_TIME,INREFCODE,OUTREFCODE) VALUES (?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(2,null);
      else
        statement.setBigDecimal(2,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.inRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTransportItemDAOGen(connection,getUserProfile()).exists(anObject.inRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTransportItem2TransportItem.inRef.code%} = {%"+anObject.inRef.code+"%}");
        statement.setInt(3,anObject.inRef.code);
      }
      else
        statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.outRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTransportItemDAOGen(connection,getUserProfile()).exists(anObject.outRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTransportItem2TransportItem.outRef.code%} = {%"+anObject.outRef.code+"%}");
        statement.setInt(4,anObject.outRef.code);
      }
      else
        statement.setNull(4,java.sql.Types.INTEGER);

      statement.execute();
      return anObject.code;
     }
    catch(SQLException e)
     {
           _sequenceTable.clear();
           EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
      return Integer.MIN_VALUE;
     }
        catch(Exception e)
     {
      _sequenceTable.clear();
      throw new PersistenceException("Error in method {%ENTransportItem2TransportItemDAOGen.add%}",e);
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

   public void save(ENTransportItem2TransportItem anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENTransportItem2TransportItem anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENTransportItem2TransportItem oldObject = new ENTransportItem2TransportItem();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENTransportItem2TransportItem.modify_time_Field+" FROM  ENTRANSPRTTM2TRNSPRTTM WHERE CODE = ?";

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
        EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
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
          if(fieldNameStr.compareTo("MODIFY_TIME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("INREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("OUTREF") == 0)
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
        "UPDATE ENTRANSPRTTM2TRNSPRTTM SET  MODIFY_TIME = ? , INREFCODE = ? , OUTREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENTRANSPORTITEM2TRANSPORTITEM SET ";
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
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(1,null);
      else
        statement.setBigDecimal(1,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.inRef.code != Integer.MIN_VALUE)
        statement.setInt(2,anObject.inRef.code);
      else
        statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.outRef.code != Integer.MIN_VALUE)
        statement.setInt(3,anObject.outRef.code);
      else
        statement.setNull(3,java.sql.Types.INTEGER);
          statement.setInt(4,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.modify_time == Long.MIN_VALUE)
                    statement.setBigDecimal(i+1,null);
                else
                     statement.setBigDecimal(i+1,new java.math.BigDecimal(anObject.modify_time));
                continue;
             }
            if("INREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.inRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.inRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("OUTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.outRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.outRef.code);
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
        EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
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

   } // end of save(ENTransportItem2TransportItem anObject,String[] anAttributes)


 public ENTransportItem2TransportItemShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENTransportItem2TransportItem filterObject = new ENTransportItem2TransportItem();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENTransportItem2TransportItemShort)list.get(0);
   return null;
  }

  public ENTransportItem2TransportItemShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENTransportItem2TransportItemShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENTransportItem2TransportItemShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENTransportItem2TransportItemShortList getFilteredList(ENTransportItem2TransportItem filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENTransportItem2TransportItemShortList getScrollableFilteredList(ENTransportItem2TransportItem aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENTransportItem2TransportItemShortList getScrollableFilteredList(ENTransportItem2TransportItem aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENTransportItem2TransportItemShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENTransportItem2TransportItemShortList getScrollableFilteredList(ENTransportItem2TransportItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENTransportItem2TransportItemShortList getScrollableFilteredList(ENTransportItem2TransportItemFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENTransportItem2TransportItemShortList getScrollableFilteredList(ENTransportItem2TransportItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

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
      ", ENTRANSPORTITEM.CODE " +
      ", ENTRANSPORTITEM.COUNTWORKGEN " +
      ", ENTRANSPORTITEM.COUNTWORKFACT " +
      ", ENTRANSPORTITEM.PRICE " +
      ", ENTRANSPORTITEM.COST " +
      ", ENTRANSPORTITEM.USERGEN " +
      ", ENTRANSPORTITEM.DATEEDIT " +
     " FROM ENTRANSPRTTM2TRNSPRTTM " +
     ", ENTRANSPORTITEM " +
     ", ENTRANSPORTITEM " +
     //" WHERE "
    "";
     whereStr = " ENTRANSPORTITEM.CODE = ENTRANSPRTTM2TRNSPRTTM.INREFCODE" ; //+
      whereStr = whereStr +" AND ENTRANSPORTITEM.CODE = ENTRANSPRTTM2TRNSPRTTM.OUTREFCODE" ; //+
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

  public int[] getFilteredCodeArrayOLD(ENTransportItem2TransportItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRANSPRTTM2TRNSPRTTM.CODE FROM ENTRANSPRTTM2TRNSPRTTM";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRANSPRTTM2TRNSPRTTM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

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
            whereStr = whereStr + " ENTRANSPRTTM2TRNSPRTTM.INREFCODE = ? ";
        }
        if(aFilterObject.outRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPRTTM2TRNSPRTTM.OUTREFCODE = ? ";
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


    } // end of getFilteredCodeArray

/*********************************/

  public int[] getFilteredCodeArray(ENTransportItem2TransportItemFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENTransportItem2TransportItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRANSPRTTM2TRNSPRTTM.CODE FROM ENTRANSPRTTM2TRNSPRTTM";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRANSPRTTM2TRNSPRTTM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

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
            whereStr = whereStr + " ENTRANSPRTTM2TRNSPRTTM.INREFCODE = ? ";
        }
        if(aFilterObject.outRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPRTTM2TRNSPRTTM.OUTREFCODE = ? ";
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


    } // end of getFilteredCodeArray


   public ENTransportItem2TransportItem getObject(int uid) throws PersistenceException
   {
    ENTransportItem2TransportItem result = new ENTransportItem2TransportItem();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENTransportItem2TransportItem anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENTRANSPRTTM2TRNSPRTTM.CODE, ENTRANSPRTTM2TRNSPRTTM.MODIFY_TIME, ENTRANSPRTTM2TRNSPRTTM.INREFCODE, ENTRANSPRTTM2TRNSPRTTM.OUTREFCODE "
    +" FROM ENTRANSPRTTM2TRNSPRTTM WHERE ENTRANSPRTTM2TRNSPRTTM.CODE = ?";

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
        anObject.modify_time = set.getLong(2);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.inRef.code = set.getInt(3);
        if ( set.wasNull() )
            anObject.inRef.code = Integer.MIN_VALUE;
        anObject.outRef.code = set.getInt(4);
        if ( set.wasNull() )
            anObject.outRef.code = Integer.MIN_VALUE;
        if(anObject.inRef.code != Integer.MIN_VALUE)
        {
           anObject.setInRef(
        new com.ksoe.energynet.dataminer.generated.ENTransportItemDAOGen(connection,getUserProfile()).getRef(anObject.inRef.code));
    }
        if(anObject.outRef.code != Integer.MIN_VALUE)
        {
           anObject.setOutRef(
        new com.ksoe.energynet.dataminer.generated.ENTransportItemDAOGen(connection,getUserProfile()).getRef(anObject.outRef.code));
    }
      }
    }
    catch(SQLException e)
     {
      System.out.println(e.getMessage()+"\nstatement - "+selectStr);
      EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
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


  public com.ksoe.energynet.valueobject.references.ENTransportItem2TransportItemRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENTransportItem2TransportItemRef ref = new com.ksoe.energynet.valueobject.references.ENTransportItem2TransportItemRef();
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

    selectStr = "DELETE FROM  ENTRANSPRTTM2TRNSPRTTM WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENTransportItem2TransportItem object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENTransportItem2TransportItem.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENTransportItem2TransportItem.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENTransportItem2TransportItem.remove%} access denied");

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
      EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTransportItem2TransportItem.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENTransportItem2TransportItem.getObject%} access denied");

    selectStr =

    "SELECT  ENTRANSPRTTM2TRNSPRTTM.CODE FROM  ENTRANSPRTTM2TRNSPRTTM WHERE  ENTRANSPRTTM2TRNSPRTTM.CODE = ?";
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
      EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
      return false;
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
    _checkConditionToken(condition,"code","ENTRANSPRTTM2TRNSPRTTM.CODE");
    _checkConditionToken(condition,"modify_time","ENTRANSPRTTM2TRNSPRTTM.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"inref","INREFCODE");
    _checkConditionToken(condition,"inref.code","INREFCODE");
    _checkConditionToken(condition,"outref","OUTREFCODE");
    _checkConditionToken(condition,"outref.code","OUTREFCODE");
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
    catch (NamingException e) {throw new EnergyproSystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.ENERGYNET_DATASOURCE+"%}",e);}
    catch (SQLException e)    {throw new EnergyproSystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.ENERGYNET_DATASOURCE+"%}",e);}
   }



   ///////////// PRIVATE SECTION ///////////////
   protected static Hashtable _sequenceTable = new Hashtable();

   private void _collectAutoIncrementFields(ENTransportItem2TransportItem anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("ENTRANSPRTTM2TRNSPRTTM", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("ENTRANSPRTTM2TRNSPRTTM", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("ENTRANSPRTTM2TRNSPRTTM", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: ENTRANSPRTTM2TRNSPRTTM");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of ENTransportItem2TransportItemDAO

