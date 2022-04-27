
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
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
import com.ksoe.energynet.valueobject.ENTransportRouteDistance;
import com.ksoe.energynet.valueobject.brief.ENTransportRouteDistanceShort;
import com.ksoe.energynet.valueobject.filter.ENTransportRouteDistanceFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportRouteDistanceShortList;
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
  *  DAO Generated for ENTransportRouteDistance;
  *
  */

public class ENTransportRouteDistanceDAOGen extends GenericDataMiner {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENTransportRouteDistanceDAOGen() {super();}
  //public ENTransportRouteDistanceDAOGen(Connection aConnection) {super(aConnection);}
  //public ENTransportRouteDistanceDAOGen(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTransportRouteDistanceDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTransportRouteDistanceDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENTransportRouteDistance inObject) throws PersistenceException
   {
      ENTransportRouteDistance obj = new ENTransportRouteDistance();
      obj.code = inObject.code;
      loadObject(obj);

     if ( ! inObject.distance.equals(obj.distance)){
       return false;
     }

     if ( ! inObject.koef.equals(obj.koef)){
       return false;
     }
     if (inObject.transportRouteRef.code != obj.transportRouteRef.code){
        return false;
     }
      return true;
   }

   public int add(ENTransportRouteDistance anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENTransportRouteDistance anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENTRANSPORTROUTEDISTNC (CODE,DISTANCE,KOEF,TRANSPORTROUTEREFCODE) VALUES (?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.distance != null)
        anObject.distance = anObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.distance);
      if (anObject.koef != null)
        anObject.koef = anObject.koef.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.koef);
      if (anObject.transportRouteRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTransportRouteDAOGen(connection,getUserProfile()).exists(anObject.transportRouteRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTransportRouteDistance.transportRouteRef.code%} = {%"+anObject.transportRouteRef.code+"%}");
        statement.setInt(4,anObject.transportRouteRef.code);
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
      throw new PersistenceException("Error in method {%ENTransportRouteDistanceDAOGen.add%}",e);
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

   public void save(ENTransportRouteDistance anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENTransportRouteDistance anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("DISTANCE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("KOEF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TRANSPORTROUTEREF") == 0)
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
        "UPDATE ENTRANSPORTROUTEDISTNC SET  DISTANCE = ? , KOEF = ? , TRANSPORTROUTEREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENTRANSPORTROUTEDISTANCE SET ";
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
      if (anObject.distance != null)
        anObject.distance = anObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(1,anObject.distance);

      if (anObject.koef != null)
        anObject.koef = anObject.koef.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.koef);

      if (anObject.transportRouteRef.code != Integer.MIN_VALUE)
        statement.setInt(3,anObject.transportRouteRef.code);
      else
        statement.setNull(3,java.sql.Types.INTEGER);
          statement.setInt(4,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("DISTANCE".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.distance != null)
                    anObject.distance = anObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.distance);
                continue;
             }
            if("KOEF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.koef != null)
                    anObject.koef = anObject.koef.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.koef);
                continue;
             }
            if("TRANSPORTROUTEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.transportRouteRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.transportRouteRef.code);
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

   } // end of save(ENTransportRouteDistance anObject,String[] anAttributes)


 public ENTransportRouteDistanceShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENTransportRouteDistance filterObject = new ENTransportRouteDistance();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENTransportRouteDistanceShort)list.get(0);
   return null;
  }

  public ENTransportRouteDistanceShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENTransportRouteDistanceShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENTransportRouteDistanceShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENTransportRouteDistanceShortList getFilteredList(ENTransportRouteDistance filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENTransportRouteDistanceShortList getScrollableFilteredList(ENTransportRouteDistance aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENTransportRouteDistanceShortList getScrollableFilteredList(ENTransportRouteDistance aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENTransportRouteDistanceShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENTransportRouteDistanceShortList getScrollableFilteredList(ENTransportRouteDistanceFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENTransportRouteDistanceShortList getScrollableFilteredList(ENTransportRouteDistanceFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENTransportRouteDistanceShortList getScrollableFilteredList(ENTransportRouteDistance aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENTransportRouteDistanceShortList getScrollableFilteredList(ENTransportRouteDistance aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENTransportRouteDistanceShortList result = new ENTransportRouteDistanceShortList();
    ENTransportRouteDistanceShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRANSPORTROUTEDISTNC.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENTRANSPORTROUTEDISTNC.CODE"+
     ",ENTRANSPORTROUTEDISTNC.DISTANCE"+
     ",ENTRANSPORTROUTEDISTNC.KOEF"+

      ", ENTRANSPORTROUTE.CODE " +
      ", ENTRANSPORTROUTE.DISTANCE " +
      ", ENTRANSPORTROUTE.WEIGHT " +
      ", ENTRANSPORTROUTE.DISTANCENEW " +
      ", ENTRANSPORTROUTE.SPEEDOMETERSTART " +
      ", ENTRANSPORTROUTE.SPEEDOMETERFINAL " +
      ", ENTRANSPORTROUTE.FUELCOUNTERSTART " +
      ", ENTRANSPORTROUTE.FUELCOUNTERFINAL " +
      ", ENTRANSPORTROUTE.DATEEDIT " +
      ", ENTRANSPORTROUTE.USERGEN " +
     " FROM ENTRANSPORTROUTEDISTNC " +
     ", ENTRANSPORTROUTE " +
     //" WHERE "
    "";
     whereStr = " ENTRANSPORTROUTE.CODE = ENTRANSPORTROUTEDISTNC.TRANSPORTROUTEREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENTRANSPORTROUTEDISTNC.CODE IN ( SELECT ENTRANSPORTROUTEDISTNC.CODE FROM ENTRANSPORTROUTEDISTNC ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTEDISTNC.CODE = ?";
        }
        if(aFilterObject.distance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTEDISTNC.DISTANCE = ?";
        }
        if(aFilterObject.koef != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTEDISTNC.KOEF = ?";
        }
        if(aFilterObject.transportRouteRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPORTROUTEDISTNC.TRANSPORTROUTEREFCODE = ? ";
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
        if(aFilterObject.distance != null){
            number++;
            aFilterObject.distance = aFilterObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distance);
        }
        if(aFilterObject.koef != null){
            number++;
            aFilterObject.koef = aFilterObject.koef.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.koef);
        }
       if(aFilterObject.transportRouteRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportRouteRef.code);
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

        anObject = new ENTransportRouteDistanceShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.distance = set.getBigDecimal(2);
        if(anObject.distance != null)
            anObject.distance = anObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.koef = set.getBigDecimal(3);
        if(anObject.koef != null)
            anObject.koef = anObject.koef.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.transportRouteRefCode = set.getInt(4);
        if(set.wasNull())
        anObject.transportRouteRefCode = Integer.MIN_VALUE;
        anObject.transportRouteRefDistance = set.getBigDecimal(5);
        if(anObject.transportRouteRefDistance != null)
          anObject.transportRouteRefDistance = anObject.transportRouteRefDistance.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.transportRouteRefWeight = set.getBigDecimal(6);
        if(anObject.transportRouteRefWeight != null)
          anObject.transportRouteRefWeight = anObject.transportRouteRefWeight.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.transportRouteRefDistanceNew = set.getBigDecimal(7);
        if(anObject.transportRouteRefDistanceNew != null)
          anObject.transportRouteRefDistanceNew = anObject.transportRouteRefDistanceNew.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.transportRouteRefSpeedometerStart = set.getBigDecimal(8);
        if(anObject.transportRouteRefSpeedometerStart != null)
          anObject.transportRouteRefSpeedometerStart = anObject.transportRouteRefSpeedometerStart.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.transportRouteRefSpeedometerFinal = set.getBigDecimal(9);
        if(anObject.transportRouteRefSpeedometerFinal != null)
          anObject.transportRouteRefSpeedometerFinal = anObject.transportRouteRefSpeedometerFinal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.transportRouteRefFuelCounterStart = set.getBigDecimal(10);
        if(anObject.transportRouteRefFuelCounterStart != null)
          anObject.transportRouteRefFuelCounterStart = anObject.transportRouteRefFuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.transportRouteRefFuelCounterFinal = set.getBigDecimal(11);
        if(anObject.transportRouteRefFuelCounterFinal != null)
          anObject.transportRouteRefFuelCounterFinal = anObject.transportRouteRefFuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.transportRouteRefDateEdit = set.getTimestamp(12);
        anObject.transportRouteRefUserGen = set.getString(13);

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

  public int[] getFilteredCodeArrayOLD(ENTransportRouteDistance aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRANSPORTROUTEDISTNC.CODE FROM ENTRANSPORTROUTEDISTNC";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRANSPORTROUTEDISTNC.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTEDISTNC.CODE = ?";
        }
        if(aFilterObject.distance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTEDISTNC.DISTANCE = ?";
        }
        if(aFilterObject.koef != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTEDISTNC.KOEF = ?";
        }
        if(aFilterObject.transportRouteRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTROUTEDISTNC.TRANSPORTROUTEREFCODE = ? ";
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
        if(aFilterObject.distance != null){
            number++;
            aFilterObject.distance = aFilterObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distance);
        }
        if(aFilterObject.koef != null){
            number++;
            aFilterObject.koef = aFilterObject.koef.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.koef);
        }
       if(aFilterObject.transportRouteRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportRouteRef.code);
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

  public int[] getFilteredCodeArray(ENTransportRouteDistanceFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENTransportRouteDistance aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRANSPORTROUTEDISTNC.CODE FROM ENTRANSPORTROUTEDISTNC";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRANSPORTROUTEDISTNC.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTEDISTNC.CODE = ?";
        }
        if(aFilterObject.distance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTEDISTNC.DISTANCE = ?";
        }
        if(aFilterObject.koef != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROUTEDISTNC.KOEF = ?";
        }
        if(aFilterObject.transportRouteRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTROUTEDISTNC.TRANSPORTROUTEREFCODE = ? ";
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
        if(aFilterObject.distance != null){
            number++;
            aFilterObject.distance = aFilterObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distance);
        }
        if(aFilterObject.koef != null){
            number++;
            aFilterObject.koef = aFilterObject.koef.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.koef);
        }
       if(aFilterObject.transportRouteRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportRouteRef.code);
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


   public ENTransportRouteDistance getObject(int uid) throws PersistenceException
   {
    ENTransportRouteDistance result = new ENTransportRouteDistance();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENTransportRouteDistance anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENTRANSPORTROUTEDISTNC.CODE, ENTRANSPORTROUTEDISTNC.DISTANCE, ENTRANSPORTROUTEDISTNC.KOEF, ENTRANSPORTROUTEDISTNC.TRANSPORTROUTEREFCODE "
    +" FROM ENTRANSPORTROUTEDISTNC WHERE ENTRANSPORTROUTEDISTNC.CODE = ?";

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
        anObject.distance = set.getBigDecimal(2);
        if(anObject.distance != null)
            anObject.distance = anObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.koef = set.getBigDecimal(3);
        if(anObject.koef != null)
            anObject.koef = anObject.koef.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.transportRouteRef.code = set.getInt(4);
        if ( set.wasNull() )
            anObject.transportRouteRef.code = Integer.MIN_VALUE;
        if(anObject.transportRouteRef.code != Integer.MIN_VALUE)
        {
           anObject.setTransportRouteRef(
        new com.ksoe.energynet.dataminer.generated.ENTransportRouteDAOGen(connection,getUserProfile()).getRef(anObject.transportRouteRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENTransportRouteDistanceRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENTransportRouteDistanceRef ref = new com.ksoe.energynet.valueobject.references.ENTransportRouteDistanceRef();
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

    selectStr = "DELETE FROM  ENTRANSPORTROUTEDISTNC WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENTransportRouteDistance object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENTransportRouteDistance.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENTransportRouteDistance.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENTransportRouteDistance.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTransportRouteDistance.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENTransportRouteDistance.getObject%} access denied");

    selectStr =

    "SELECT  ENTRANSPORTROUTEDISTNC.CODE FROM  ENTRANSPORTROUTEDISTNC WHERE  ENTRANSPORTROUTEDISTNC.CODE = ?";
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
    _checkConditionToken(condition,"code","ENTRANSPORTROUTEDISTNC.CODE");
    _checkConditionToken(condition,"distance","ENTRANSPORTROUTEDISTNC.DISTANCE");
    _checkConditionToken(condition,"koef","ENTRANSPORTROUTEDISTNC.KOEF");
      // relationship conditions
    _checkConditionToken(condition,"transportrouteref","TRANSPORTROUTEREFCODE");
    _checkConditionToken(condition,"transportrouteref.code","TRANSPORTROUTEREFCODE");
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

   private void _collectAutoIncrementFields(ENTransportRouteDistance anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("ENTRANSPORTROUTEDISTNC", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("ENTRANSPORTROUTEDISTNC", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("ENTRANSPORTROUTEDISTNC", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: ENTRANSPORTROUTEDISTNC");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of ENTransportRouteDistanceDAO

