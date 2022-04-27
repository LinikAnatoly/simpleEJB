
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
import com.ksoe.energynet.valueobject.ENTransportOrder2Travel;
import com.ksoe.energynet.valueobject.brief.ENTransportOrder2TravelShort;
import com.ksoe.energynet.valueobject.filter.ENTransportOrder2TravelFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportOrder2TravelShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENTransportOrder2Travel;
 *
 */

public class ENTransportOrder2TravelDAOGen extends GenericDataMiner {

  public ENTransportOrder2TravelDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTransportOrder2TravelDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENTransportOrder2Travel inObject) throws PersistenceException
   {
      ENTransportOrder2Travel obj = new ENTransportOrder2Travel();
      obj.code = inObject.code;
      loadObject(obj);
     if (inObject.transportorder.code != obj.transportorder.code){
        return false;
     }
     if (inObject.travelsheet.code != obj.travelsheet.code){
        return false;
     }
      return true;
   }

   public int add(ENTransportOrder2Travel anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENTransportOrder2Travel anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENTRANSPORTORDER2TRAVL (CODE,TRANSPORTORDERCODE,TRAVELSHEETCODE) VALUES (?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.transportorder.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTransportOrderDAOGen(connection,getUserProfile()).exists(anObject.transportorder.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTransportOrder2Travel.transportorder.code%} = {%"+anObject.transportorder.code+"%}");
        statement.setInt(2,anObject.transportorder.code);
      }
      else
        statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.travelsheet.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTravelSheetDAOGen(connection,getUserProfile()).exists(anObject.travelsheet.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTransportOrder2Travel.travelsheet.code%} = {%"+anObject.travelsheet.code+"%}");
        statement.setInt(3,anObject.travelsheet.code);
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
      throw new PersistenceException("Error in method {%ENTransportOrder2TravelDAOGen.add%}",e);
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

   public void save(ENTransportOrder2Travel anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENTransportOrder2Travel anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("TRAVELSHEET") == 0)
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
        "UPDATE ENTRANSPORTORDER2TRAVL SET TRANSPORTORDERCODE = ? , TRAVELSHEETCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENTRANSPORTORDER2TRAVEL SET ";
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
      if (anObject.transportorder.code != Integer.MIN_VALUE)
        statement.setInt(1,anObject.transportorder.code);
      else
        statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.travelsheet.code != Integer.MIN_VALUE)
        statement.setInt(2,anObject.travelsheet.code);
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
                if (anObject.transportorder.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.transportorder.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("TRAVELSHEET".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.travelsheet.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.travelsheet.code);
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

   } // end of save(ENTransportOrder2Travel anObject,String[] anAttributes)


 public ENTransportOrder2TravelShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENTransportOrder2Travel filterObject = new ENTransportOrder2Travel();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENTransportOrder2TravelShort)list.get(0);
   return null;
  }

  public ENTransportOrder2TravelShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENTransportOrder2TravelShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENTransportOrder2TravelShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENTransportOrder2TravelShortList getFilteredList(ENTransportOrder2Travel filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENTransportOrder2TravelShortList getScrollableFilteredList(ENTransportOrder2Travel aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENTransportOrder2TravelShortList getScrollableFilteredList(ENTransportOrder2Travel aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENTransportOrder2TravelShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENTransportOrder2TravelShortList getScrollableFilteredList(ENTransportOrder2TravelFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENTransportOrder2TravelShortList getScrollableFilteredList(ENTransportOrder2TravelFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENTransportOrder2TravelShortList getScrollableFilteredList(ENTransportOrder2Travel aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENTransportOrder2TravelShortList getScrollableFilteredList(ENTransportOrder2Travel aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENTransportOrder2TravelShortList result = new ENTransportOrder2TravelShortList();
    ENTransportOrder2TravelShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRANSPORTORDER2TRAVL.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENTRANSPORTORDER2TRAVL.CODE"+

      ", ENTRANSPORTORDER.CODE " +
      ", ENTRANSPORTORDER.NUMBERGEN " +
      ", ENTRANSPORTORDER.TIMESTART " +
      ", ENTRANSPORTORDER.TIMEFINAL " +
      ", ENTRANSPORTORDER.DATESTART " +
      ", ENTRANSPORTORDER.DATEFINAL " +
      ", ENTRANSPORTORDER.ISASSIGNMENT " +
      ", ENTRANSPORTORDER.DATEEDIT " +
      ", ENTRANSPORTORDER.USERGEN " +
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
     " FROM ENTRANSPORTORDER2TRAVL " +
     ", ENTRANSPORTORDER " +
     ", ENTRAVELSHEET " +
     //" WHERE "
    "";
     whereStr = " ENTRANSPORTORDER.CODE = ENTRANSPORTORDER2TRAVL.TRANSPORTORDERCODE" ; //+
      whereStr = whereStr +" AND ENTRAVELSHEET.CODE = ENTRANSPORTORDER2TRAVL.TRAVELSHEETCODE" ; //+
        //selectStr = selectStr + " ${s} ENTRANSPORTORDER2TRAVL.CODE IN ( SELECT ENTRANSPORTORDER2TRAVL.CODE FROM ENTRANSPORTORDER2TRAVL ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER2TRAVL.CODE = ?";
        }
        if(aFilterObject.transportorder.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPORTORDER2TRAVL.TRANSPORTORDERCODE = ? ";
        }
        if(aFilterObject.travelsheet.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPORTORDER2TRAVL.TRAVELSHEETCODE = ? ";
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
       if(aFilterObject.transportorder.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportorder.code);
       }
       if(aFilterObject.travelsheet.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.travelsheet.code);
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

        anObject = new ENTransportOrder2TravelShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;

        anObject.transportorderCode = set.getInt(2);
        if(set.wasNull())
        anObject.transportorderCode = Integer.MIN_VALUE;
        anObject.transportorderNumbergen = set.getString(3);
        anObject.transportorderTimeStart = set.getTimestamp(4);
        anObject.transportorderTimeFinal = set.getTimestamp(5);
        anObject.transportorderDateStart = set.getTimestamp(6);
        anObject.transportorderDateFinal = set.getTimestamp(7);

        anObject.transportorderDateEdit = set.getTimestamp(9);
        anObject.transportorderUserGen = set.getString(10);
        anObject.travelsheetCode = set.getInt(11);
        if(set.wasNull())
        anObject.travelsheetCode = Integer.MIN_VALUE;
        anObject.travelsheetNumberGen = set.getString(12);
        anObject.travelsheetDateStart = set.getDate(13);
        anObject.travelsheetDateFinal = set.getDate(14);
        anObject.travelsheetSpeedometerStart = set.getBigDecimal(15);
        if(anObject.travelsheetSpeedometerStart != null)
          anObject.travelsheetSpeedometerStart = anObject.travelsheetSpeedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.travelsheetSpeedometerFinal = set.getBigDecimal(16);
        if(anObject.travelsheetSpeedometerFinal != null)
          anObject.travelsheetSpeedometerFinal = anObject.travelsheetSpeedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.travelsheetFuelCounterStart = set.getBigDecimal(17);
        if(anObject.travelsheetFuelCounterStart != null)
          anObject.travelsheetFuelCounterStart = anObject.travelsheetFuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.travelsheetFuelCounterFinal = set.getBigDecimal(18);
        if(anObject.travelsheetFuelCounterFinal != null)
          anObject.travelsheetFuelCounterFinal = anObject.travelsheetFuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.travelsheetTimeStart = set.getTimestamp(19);
        anObject.travelsheetTimeFinal = set.getTimestamp(20);
        anObject.travelsheetDateEdit = set.getTimestamp(21);
        anObject.travelsheetUserGen = set.getString(22);

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

  public int[] getFilteredCodeArrayOLD(ENTransportOrder2Travel aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRANSPORTORDER2TRAVL.CODE FROM ENTRANSPORTORDER2TRAVL";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRANSPORTORDER2TRAVL.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER2TRAVL.CODE = ?";
        }
        if(aFilterObject.transportorder.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTORDER2TRAVL.TRANSPORTORDERCODE = ? ";
        }
        if(aFilterObject.travelsheet.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTORDER2TRAVL.TRAVELSHEETCODE = ? ";
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
       if(aFilterObject.transportorder.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportorder.code);
       }
       if(aFilterObject.travelsheet.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.travelsheet.code);
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

  public int[] getFilteredCodeArray(ENTransportOrder2TravelFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENTransportOrder2Travel aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRANSPORTORDER2TRAVL.CODE FROM ENTRANSPORTORDER2TRAVL";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRANSPORTORDER2TRAVL.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTORDER2TRAVL.CODE = ?";
        }
        if(aFilterObject.transportorder.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTORDER2TRAVL.TRANSPORTORDERCODE = ? ";
        }
        if(aFilterObject.travelsheet.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTORDER2TRAVL.TRAVELSHEETCODE = ? ";
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
       if(aFilterObject.transportorder.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportorder.code);
       }
       if(aFilterObject.travelsheet.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.travelsheet.code);
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


   public ENTransportOrder2Travel getObject(int uid) throws PersistenceException
   {
    ENTransportOrder2Travel result = new ENTransportOrder2Travel();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENTransportOrder2Travel anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENTRANSPORTORDER2TRAVL.CODE, ENTRANSPORTORDER2TRAVL.TRANSPORTORDERCODE, ENTRANSPORTORDER2TRAVL.TRAVELSHEETCODE "
    +" FROM ENTRANSPORTORDER2TRAVL WHERE ENTRANSPORTORDER2TRAVL.CODE = ?";

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
        anObject.transportorder.code = set.getInt(2);
        if ( set.wasNull() )
            anObject.transportorder.code = Integer.MIN_VALUE;
        anObject.travelsheet.code = set.getInt(3);
        if ( set.wasNull() )
            anObject.travelsheet.code = Integer.MIN_VALUE;
        if(anObject.transportorder.code != Integer.MIN_VALUE)
        {
           anObject.setTransportorder(
        new com.ksoe.energynet.dataminer.generated.ENTransportOrderDAOGen(connection,getUserProfile()).getObject(anObject.transportorder.code));
    }
        if(anObject.travelsheet.code != Integer.MIN_VALUE)
        {
           anObject.setTravelsheet(
        new com.ksoe.energynet.dataminer.generated.ENTravelSheetDAOGen(connection,getUserProfile()).getObject(anObject.travelsheet.code));
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


  public com.ksoe.energynet.valueobject.references.ENTransportOrder2TravelRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENTransportOrder2TravelRef ref = new com.ksoe.energynet.valueobject.references.ENTransportOrder2TravelRef();
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

    selectStr = "DELETE FROM  ENTRANSPORTORDER2TRAVL WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENTransportOrder2Travel object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENTransportOrder2Travel.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENTransportOrder2Travel.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENTransportOrder2Travel.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTransportOrder2Travel.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENTransportOrder2Travel.getObject%} access denied");

    selectStr =

    "SELECT  ENTRANSPORTORDER2TRAVL.CODE FROM  ENTRANSPORTORDER2TRAVL WHERE  ENTRANSPORTORDER2TRAVL.CODE = ?";
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
    _checkConditionToken(condition,"code","ENTRANSPORTORDER2TRAVL.CODE");
      // relationship conditions
    _checkConditionToken(condition,"transportorder","TRANSPORTORDERCODE");
    _checkConditionToken(condition,"transportorder.code","TRANSPORTORDERCODE");
    _checkConditionToken(condition,"travelsheet","TRAVELSHEETCODE");
    _checkConditionToken(condition,"travelsheet.code","TRAVELSHEETCODE");
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

    private void _collectAutoIncrementFields(ENTransportOrder2Travel anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENTRANSPORTORDER2TRAVL", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENTRANSPORTORDER2TRAVL", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENTRANSPORTORDER2TRAVL", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENTRANSPORTORDER2TRAVL");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENTransportOrder2TravelDAO
