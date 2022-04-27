
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
import com.ksoe.energynet.valueobject.ENTransportRouteDistance2TKFuelKoef;
import com.ksoe.energynet.valueobject.brief.ENTransportRouteDistance2TKFuelKoefShort;
import com.ksoe.energynet.valueobject.filter.ENTransportRouteDistance2TKFuelKoefFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportRouteDistance2TKFuelKoefShortList;
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
  *  DAO Generated for ENTransportRouteDistance2TKFuelKoef;
  *
  */

public class ENTransportRouteDistance2TKFuelKoefDAOGen extends GenericDataMiner {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENTransportRouteDistance2TKFuelKoefDAOGen() {super();}
  //public ENTransportRouteDistance2TKFuelKoefDAOGen(Connection aConnection) {super(aConnection);}
  //public ENTransportRouteDistance2TKFuelKoefDAOGen(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTransportRouteDistance2TKFuelKoefDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTransportRouteDistance2TKFuelKoefDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENTransportRouteDistance2TKFuelKoef inObject) throws PersistenceException
   {
      ENTransportRouteDistance2TKFuelKoef obj = new ENTransportRouteDistance2TKFuelKoef();
      obj.code = inObject.code;
      loadObject(obj);
     if (inObject.transportRouteDistanceRef.code != obj.transportRouteDistanceRef.code){
        return false;
     }
     if (inObject.tkFuelKoefRef.code != obj.tkFuelKoefRef.code){
        return false;
     }
      return true;
   }

   public int add(ENTransportRouteDistance2TKFuelKoef anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENTransportRouteDistance2TKFuelKoef anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO NTRNSPRTRTDSTNC2TKFLKF (CODE,TRANSPORTROUTDSTNCRFCD,TKFUELKOEFREFCODE) VALUES (?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.transportRouteDistanceRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTransportRouteDistanceDAOGen(connection,getUserProfile()).exists(anObject.transportRouteDistanceRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTransportRouteDistance2TKFuelKoef.transportRouteDistanceRef.code%} = {%"+anObject.transportRouteDistanceRef.code+"%}");
        statement.setInt(2,anObject.transportRouteDistanceRef.code);
      }
      else
        statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.tkFuelKoefRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKFuelKoefDAOGen(connection,getUserProfile()).exists(anObject.tkFuelKoefRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENTransportRouteDistance2TKFuelKoef.tkFuelKoefRef.code%} = {%"+anObject.tkFuelKoefRef.code+"%}");
        statement.setInt(3,anObject.tkFuelKoefRef.code);
      }
      else
        statement.setNull(3,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENTransportRouteDistance2TKFuelKoefDAOGen.add%}",e);
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

   public void save(ENTransportRouteDistance2TKFuelKoef anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENTransportRouteDistance2TKFuelKoef anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("TRANSPORTROUTEDISTANCEREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TKFUELKOEFREF") == 0)
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
        "UPDATE NTRNSPRTRTDSTNC2TKFLKF SET TRANSPORTROUTDSTNCRFCD = ? , TKFUELKOEFREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENTRANSPORTROUTEDISTANCE2TKFUELKOEF SET ";
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
      if (anObject.transportRouteDistanceRef.code != Integer.MIN_VALUE)
        statement.setInt(1,anObject.transportRouteDistanceRef.code);
      else
        statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.tkFuelKoefRef.code != Integer.MIN_VALUE)
        statement.setInt(2,anObject.tkFuelKoefRef.code);
      else
        statement.setNull(2,java.sql.Types.INTEGER);
          statement.setInt(3,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("TRANSPORTROUTEDISTANCEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.transportRouteDistanceRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.transportRouteDistanceRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("TKFUELKOEFREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.tkFuelKoefRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.tkFuelKoefRef.code);
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

   } // end of save(ENTransportRouteDistance2TKFuelKoef anObject,String[] anAttributes)


 public ENTransportRouteDistance2TKFuelKoefShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENTransportRouteDistance2TKFuelKoef filterObject = new ENTransportRouteDistance2TKFuelKoef();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENTransportRouteDistance2TKFuelKoefShort)list.get(0);
   return null;
  }

  public ENTransportRouteDistance2TKFuelKoefShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENTransportRouteDistance2TKFuelKoefShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENTransportRouteDistance2TKFuelKoefShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENTransportRouteDistance2TKFuelKoefShortList getFilteredList(ENTransportRouteDistance2TKFuelKoef filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENTransportRouteDistance2TKFuelKoefShortList getScrollableFilteredList(ENTransportRouteDistance2TKFuelKoef aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENTransportRouteDistance2TKFuelKoefShortList getScrollableFilteredList(ENTransportRouteDistance2TKFuelKoef aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENTransportRouteDistance2TKFuelKoefShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENTransportRouteDistance2TKFuelKoefShortList getScrollableFilteredList(ENTransportRouteDistance2TKFuelKoefFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENTransportRouteDistance2TKFuelKoefShortList getScrollableFilteredList(ENTransportRouteDistance2TKFuelKoefFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENTransportRouteDistance2TKFuelKoefShortList getScrollableFilteredList(ENTransportRouteDistance2TKFuelKoef aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENTransportRouteDistance2TKFuelKoefShortList getScrollableFilteredList(ENTransportRouteDistance2TKFuelKoef aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENTransportRouteDistance2TKFuelKoefShortList result = new ENTransportRouteDistance2TKFuelKoefShortList();
    ENTransportRouteDistance2TKFuelKoefShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "NTRNSPRTRTDSTNC2TKFLKF.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "NTRNSPRTRTDSTNC2TKFLKF.CODE"+

      ", ENTRANSPORTROUTEDISTNC.CODE " +
      ", ENTRANSPORTROUTEDISTNC.DISTANCE " +
      ", ENTRANSPORTROUTEDISTNC.KOEF " +
      ", TKFUELKOEF.CODE " +
      ", TKFUELKOEF.KOEF " +
      ", TKFUELKOEF.NAME " +
     " FROM NTRNSPRTRTDSTNC2TKFLKF " +
     ", ENTRANSPORTROUTEDISTNC " +
     ", TKFUELKOEF " +
     //" WHERE "
    "";
     whereStr = " ENTRANSPORTROUTEDISTNC.CODE = NTRNSPRTRTDSTNC2TKFLKF.TRANSPORTROUTDSTNCRFCD" ; //+
      whereStr = whereStr +" AND TKFUELKOEF.CODE = NTRNSPRTRTDSTNC2TKFLKF.TKFUELKOEFREFCODE" ; //+
        //selectStr = selectStr + " ${s} NTRNSPRTRTDSTNC2TKFLKF.CODE IN ( SELECT NTRNSPRTRTDSTNC2TKFLKF.CODE FROM NTRNSPRTRTDSTNC2TKFLKF ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  NTRNSPRTRTDSTNC2TKFLKF.CODE = ?";
        }
        if(aFilterObject.transportRouteDistanceRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "NTRNSPRTRTDSTNC2TKFLKF.TRANSPORTROUTDSTNCRFCD = ? ";
        }
        if(aFilterObject.tkFuelKoefRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "NTRNSPRTRTDSTNC2TKFLKF.TKFUELKOEFREFCODE = ? ";
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
       if(aFilterObject.transportRouteDistanceRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportRouteDistanceRef.code);
       }
       if(aFilterObject.tkFuelKoefRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.tkFuelKoefRef.code);
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

        anObject = new ENTransportRouteDistance2TKFuelKoefShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;

        anObject.transportRouteDistanceRefCode = set.getInt(2);
        if(set.wasNull())
        anObject.transportRouteDistanceRefCode = Integer.MIN_VALUE;
        anObject.transportRouteDistanceRefDistance = set.getBigDecimal(3);
        if(anObject.transportRouteDistanceRefDistance != null)
          anObject.transportRouteDistanceRefDistance = anObject.transportRouteDistanceRefDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.transportRouteDistanceRefKoef = set.getBigDecimal(4);
        if(anObject.transportRouteDistanceRefKoef != null)
          anObject.transportRouteDistanceRefKoef = anObject.transportRouteDistanceRefKoef.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.tkFuelKoefRefCode = set.getInt(5);
        if(set.wasNull())
        anObject.tkFuelKoefRefCode = Integer.MIN_VALUE;
        anObject.tkFuelKoefRefKoef = set.getBigDecimal(6);
        if(anObject.tkFuelKoefRefKoef != null)
          anObject.tkFuelKoefRefKoef = anObject.tkFuelKoefRefKoef.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.tkFuelKoefRefName = set.getString(7);

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

  public int[] getFilteredCodeArrayOLD(ENTransportRouteDistance2TKFuelKoef aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT NTRNSPRTRTDSTNC2TKFLKF.CODE FROM NTRNSPRTRTDSTNC2TKFLKF";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "NTRNSPRTRTDSTNC2TKFLKF.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  NTRNSPRTRTDSTNC2TKFLKF.CODE = ?";
        }
        if(aFilterObject.transportRouteDistanceRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " NTRNSPRTRTDSTNC2TKFLKF.TRANSPORTROUTDSTNCRFCD = ? ";
        }
        if(aFilterObject.tkFuelKoefRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " NTRNSPRTRTDSTNC2TKFLKF.TKFUELKOEFREFCODE = ? ";
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
       if(aFilterObject.transportRouteDistanceRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportRouteDistanceRef.code);
       }
       if(aFilterObject.tkFuelKoefRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.tkFuelKoefRef.code);
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

  public int[] getFilteredCodeArray(ENTransportRouteDistance2TKFuelKoefFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENTransportRouteDistance2TKFuelKoef aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT NTRNSPRTRTDSTNC2TKFLKF.CODE FROM NTRNSPRTRTDSTNC2TKFLKF";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "NTRNSPRTRTDSTNC2TKFLKF.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  NTRNSPRTRTDSTNC2TKFLKF.CODE = ?";
        }
        if(aFilterObject.transportRouteDistanceRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " NTRNSPRTRTDSTNC2TKFLKF.TRANSPORTROUTDSTNCRFCD = ? ";
        }
        if(aFilterObject.tkFuelKoefRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " NTRNSPRTRTDSTNC2TKFLKF.TKFUELKOEFREFCODE = ? ";
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
       if(aFilterObject.transportRouteDistanceRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportRouteDistanceRef.code);
       }
       if(aFilterObject.tkFuelKoefRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.tkFuelKoefRef.code);
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


   public ENTransportRouteDistance2TKFuelKoef getObject(int uid) throws PersistenceException
   {
    ENTransportRouteDistance2TKFuelKoef result = new ENTransportRouteDistance2TKFuelKoef();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENTransportRouteDistance2TKFuelKoef anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  NTRNSPRTRTDSTNC2TKFLKF.CODE, NTRNSPRTRTDSTNC2TKFLKF.TRANSPORTROUTDSTNCRFCD, NTRNSPRTRTDSTNC2TKFLKF.TKFUELKOEFREFCODE "
    +" FROM NTRNSPRTRTDSTNC2TKFLKF WHERE NTRNSPRTRTDSTNC2TKFLKF.CODE = ?";

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
        anObject.transportRouteDistanceRef.code = set.getInt(2);
        if ( set.wasNull() )
            anObject.transportRouteDistanceRef.code = Integer.MIN_VALUE;
        anObject.tkFuelKoefRef.code = set.getInt(3);
        if ( set.wasNull() )
            anObject.tkFuelKoefRef.code = Integer.MIN_VALUE;
        if(anObject.transportRouteDistanceRef.code != Integer.MIN_VALUE)
        {
           anObject.setTransportRouteDistanceRef(
        new com.ksoe.energynet.dataminer.generated.ENTransportRouteDistanceDAOGen(connection,getUserProfile()).getRef(anObject.transportRouteDistanceRef.code));
    }
        if(anObject.tkFuelKoefRef.code != Integer.MIN_VALUE)
        {
           anObject.setTkFuelKoefRef(
        new com.ksoe.techcard.dataminer.generated.TKFuelKoefDAOGen(connection,getUserProfile()).getRef(anObject.tkFuelKoefRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENTransportRouteDistance2TKFuelKoefRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENTransportRouteDistance2TKFuelKoefRef ref = new com.ksoe.energynet.valueobject.references.ENTransportRouteDistance2TKFuelKoefRef();
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

    selectStr = "DELETE FROM  NTRNSPRTRTDSTNC2TKFLKF WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENTransportRouteDistance2TKFuelKoef object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENTransportRouteDistance2TKFuelKoef.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENTransportRouteDistance2TKFuelKoef.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENTransportRouteDistance2TKFuelKoef.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTransportRouteDistance2TKFuelKoef.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENTransportRouteDistance2TKFuelKoef.getObject%} access denied");

    selectStr =

    "SELECT  NTRNSPRTRTDSTNC2TKFLKF.CODE FROM  NTRNSPRTRTDSTNC2TKFLKF WHERE  NTRNSPRTRTDSTNC2TKFLKF.CODE = ?";
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
    _checkConditionToken(condition,"code","NTRNSPRTRTDSTNC2TKFLKF.CODE");
      // relationship conditions
    _checkConditionToken(condition,"transportroutedistanceref","TRANSPORTROUTDSTNCRFCD");
    _checkConditionToken(condition,"transportroutedistanceref.code","TRANSPORTROUTDSTNCRFCD");
    _checkConditionToken(condition,"tkfuelkoefref","TKFUELKOEFREFCODE");
    _checkConditionToken(condition,"tkfuelkoefref.code","TKFUELKOEFREFCODE");
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

   private void _collectAutoIncrementFields(ENTransportRouteDistance2TKFuelKoef anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("NTRNSPRTRTDSTNC2TKFLKF", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("NTRNSPRTRTDSTNC2TKFLKF", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("NTRNSPRTRTDSTNC2TKFLKF", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: NTRNSPRTRTDSTNC2TKFLKF");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of ENTransportRouteDistance2TKFuelKoefDAO

