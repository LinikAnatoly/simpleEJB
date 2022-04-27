
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer.generated;

import com.ksoe.lla.persistence.GenericDataMiner;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;


import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
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

import com.ksoe.energynet.valueobject.ENTrafficGPS;
import com.ksoe.energynet.valueobject.filter.ENTrafficGPSFilter;
import com.ksoe.energynet.valueobject.brief.ENTrafficGPSShort;
import com.ksoe.energynet.valueobject.lists.ENTrafficGPSShortList;

import com.ksoe.techcard.dataminer.TKTransportRealDAO;

/**
 * DAO Object for ENTrafficGPS;
 *
 */

public class ENTrafficGPSDAOGen extends GenericDataMiner {

  public ENTrafficGPSDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTrafficGPSDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENTrafficGPS inObject) throws PersistenceException
   {
      ENTrafficGPS obj = new ENTrafficGPS();
      obj.code = inObject.code;
      loadObject(obj);

     if ( ! inObject.dateGen.equals(obj.dateGen)){
       return false;
     }

     if ( ! inObject.sumKm.equals(obj.sumKm)){
       return false;
     }

     if ( ! inObject.sumFuel.equals(obj.sumFuel)){
       return false;
     }
     if (inObject.realTransport.code != obj.realTransport.code){
        return false;
     }
      return true;
   }

   public int add(ENTrafficGPS anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENTrafficGPS anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENTRAFFICGPS (CODE,DATEGEN,SUMKM,SUMFUEL,REALTRANSPORTCODE) VALUES (?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.dateGen == null)
        statement.setDate(2,null);
      else
        statement.setDate(2,new java.sql.Date(anObject.dateGen.getTime()));
      if (anObject.sumKm != null)
        anObject.sumKm = anObject.sumKm.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.sumKm);
      if (anObject.sumFuel != null)
        anObject.sumFuel = anObject.sumFuel.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.sumFuel);
      if (anObject.realTransport.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).exists(anObject.realTransport.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENTrafficGPS.realTransport.code%} = {%"+anObject.realTransport.code+"%}");
        statement.setInt(5,anObject.realTransport.code);
      }
      else
        statement.setNull(5,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENTrafficGPSDAOGen.add%}",e);
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

   public void save(ENTrafficGPS anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENTrafficGPS anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("DATEGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUMKM") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUMFUEL") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("REALTRANSPORT") == 0)
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
        "UPDATE ENTRAFFICGPS SET  DATEGEN = ? , SUMKM = ? , SUMFUEL = ? , REALTRANSPORTCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENTRAFFICGPS SET ";
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
      if (anObject.dateGen == null)
        statement.setDate(1,null);
      else
        statement.setDate(1,new java.sql.Date(anObject.dateGen.getTime()));
      if (anObject.sumKm != null)
        anObject.sumKm = anObject.sumKm.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.sumKm);
      if (anObject.sumFuel != null)
        anObject.sumFuel = anObject.sumFuel.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.sumFuel);
      if (anObject.realTransport.code != Integer.MIN_VALUE)
        statement.setInt(4,anObject.realTransport.code);
      else
        statement.setNull(4,java.sql.Types.INTEGER);
          statement.setInt(5,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("DATEGEN".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dateGen == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.dateGen.getTime()));
                continue;
             }
            if("SUMKM".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sumKm != null)
                    anObject.sumKm = anObject.sumKm.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sumKm);
                continue;
             }
            if("SUMFUEL".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sumFuel != null)
                    anObject.sumFuel = anObject.sumFuel.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sumFuel);
                continue;
             }
            if("REALTRANSPORT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.realTransport.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.realTransport.code);
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

   } // end of save(ENTrafficGPS anObject,String[] anAttributes)


 public ENTrafficGPSShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENTrafficGPS filterObject = new ENTrafficGPS();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENTrafficGPSShort)list.get(0);
   return null;
  }

  public ENTrafficGPSShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENTrafficGPSShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENTrafficGPSShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENTrafficGPSShortList getFilteredList(ENTrafficGPS filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENTrafficGPSShortList getScrollableFilteredList(ENTrafficGPS aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENTrafficGPSShortList getScrollableFilteredList(ENTrafficGPS aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENTrafficGPSShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENTrafficGPSShortList getScrollableFilteredList(ENTrafficGPSFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENTrafficGPSShortList getScrollableFilteredList(ENTrafficGPSFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENTrafficGPSShortList getScrollableFilteredList(ENTrafficGPS aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENTrafficGPSShortList getScrollableFilteredList(ENTrafficGPS aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENTrafficGPSShortList result = new ENTrafficGPSShortList();
    ENTrafficGPSShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRAFFICGPS.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENTRAFFICGPS.CODE"+
     ",ENTRAFFICGPS.DATEGEN"+
     ",ENTRAFFICGPS.SUMKM"+
     ",ENTRAFFICGPS.SUMFUEL"+

      ", TKTRANSPORTREAL.CODE " +
      ", TKTRANSPORTREAL.NAME " +
      ", TKTRANSPORTREAL.INVNUMBER " +
      ", TKTRANSPORTREAL.GOSNUMBER " +
     " FROM ENTRAFFICGPS " +
     ", TKTRANSPORTREAL " +
     //" WHERE "
	"";
     whereStr = " TKTRANSPORTREAL.CODE = ENTRAFFICGPS.REALTRANSPORTCODE" ; //+
		//selectStr = selectStr + " ${s} ENTRAFFICGPS.CODE IN ( SELECT ENTRAFFICGPS.CODE FROM ENTRAFFICGPS ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAFFICGPS.CODE = ?";
        }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAFFICGPS.DATEGEN = ?";
        }
        if(aFilterObject.sumKm != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAFFICGPS.SUMKM = ?";
        }
        if(aFilterObject.sumFuel != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAFFICGPS.SUMFUEL = ?";
        }
        if(aFilterObject.realTransport.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRAFFICGPS.REALTRANSPORTCODE = ? ";
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
        if(aFilterObject.dateGen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
        }
        if(aFilterObject.sumKm != null){
            number++;
            aFilterObject.sumKm = aFilterObject.sumKm.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumKm);
        }
        if(aFilterObject.sumFuel != null){
            number++;
            aFilterObject.sumFuel = aFilterObject.sumFuel.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumFuel);
        }
       if(aFilterObject.realTransport.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.realTransport.code);
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

        anObject = new ENTrafficGPSShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.dateGen = set.getDate(2);
        anObject.sumKm = set.getBigDecimal(3);
        if(anObject.sumKm != null)
            anObject.sumKm = anObject.sumKm.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumFuel = set.getBigDecimal(4);
        if(anObject.sumFuel != null)
            anObject.sumFuel = anObject.sumFuel.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.realTransportCode = set.getInt(5);
		if(set.wasNull())
		   anObject.realTransportCode = Integer.MIN_VALUE;
        anObject.realTransportName = set.getString(6);
        anObject.realTransportInvNumber = set.getString(7);
        anObject.realTransportGosNumber = set.getString(8);

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

  public int[] getFilteredCodeArrayOLD(ENTrafficGPS aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRAFFICGPS.CODE FROM ENTRAFFICGPS";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRAFFICGPS.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAFFICGPS.CODE = ?";
        }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAFFICGPS.DATEGEN = ?";
        }
        if(aFilterObject.sumKm != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAFFICGPS.SUMKM = ?";
        }
        if(aFilterObject.sumFuel != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAFFICGPS.SUMFUEL = ?";
        }
        if(aFilterObject.realTransport.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAFFICGPS.REALTRANSPORTCODE = ? ";
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
        if(aFilterObject.dateGen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
        }
        if(aFilterObject.sumKm != null){
            number++;
            aFilterObject.sumKm = aFilterObject.sumKm.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumKm);
        }
        if(aFilterObject.sumFuel != null){
            number++;
            aFilterObject.sumFuel = aFilterObject.sumFuel.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumFuel);
        }
       if(aFilterObject.realTransport.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.realTransport.code);
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

  public int[] getFilteredCodeArray(ENTrafficGPSFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
	return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENTrafficGPS aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRAFFICGPS.CODE FROM ENTRAFFICGPS";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRAFFICGPS.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAFFICGPS.CODE = ?";
        }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAFFICGPS.DATEGEN = ?";
        }
        if(aFilterObject.sumKm != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAFFICGPS.SUMKM = ?";
        }
        if(aFilterObject.sumFuel != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAFFICGPS.SUMFUEL = ?";
        }
        if(aFilterObject.realTransport.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAFFICGPS.REALTRANSPORTCODE = ? ";
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
        if(aFilterObject.dateGen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
        }
        if(aFilterObject.sumKm != null){
            number++;
            aFilterObject.sumKm = aFilterObject.sumKm.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumKm);
        }
        if(aFilterObject.sumFuel != null){
            number++;
            aFilterObject.sumFuel = aFilterObject.sumFuel.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumFuel);
        }
       if(aFilterObject.realTransport.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.realTransport.code);
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


   public ENTrafficGPS getObject(int uid) throws PersistenceException
   {
    ENTrafficGPS result = new ENTrafficGPS();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENTrafficGPS anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENTRAFFICGPS.CODE, ENTRAFFICGPS.DATEGEN, ENTRAFFICGPS.SUMKM, ENTRAFFICGPS.SUMFUEL, ENTRAFFICGPS.REALTRANSPORTCODE "
    +" FROM ENTRAFFICGPS WHERE ENTRAFFICGPS.CODE = ?";

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
        anObject.dateGen = set.getDate(2);
        anObject.sumKm = set.getBigDecimal(3);
        if(anObject.sumKm != null)
            anObject.sumKm = anObject.sumKm.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumFuel = set.getBigDecimal(4);
        if(anObject.sumFuel != null)
            anObject.sumFuel = anObject.sumFuel.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.realTransport.code = set.getInt(5);
        if ( set.wasNull() )
            anObject.realTransport.code = Integer.MIN_VALUE;
        if(anObject.realTransport.code != Integer.MIN_VALUE)
        {
           anObject.setRealTransport(
		   new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).getObject(anObject.realTransport.code));
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


  public com.ksoe.energynet.valueobject.references.ENTrafficGPSRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENTrafficGPSRef ref = new com.ksoe.energynet.valueobject.references.ENTrafficGPSRef();
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

    selectStr = "DELETE FROM  ENTRAFFICGPS WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENTrafficGPS object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENTrafficGPS.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENTrafficGPS.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENTrafficGPS.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTrafficGPS.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENTrafficGPS.getObject%} access denied");

    selectStr =

    "SELECT  ENTRAFFICGPS.CODE FROM  ENTRAFFICGPS WHERE  ENTRAFFICGPS.CODE = ?";
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
    _checkConditionToken(condition,"code","ENTRAFFICGPS.CODE");
    _checkConditionToken(condition,"dategen","ENTRAFFICGPS.DATEGEN");
    _checkConditionToken(condition,"sumkm","ENTRAFFICGPS.SUMKM");
    _checkConditionToken(condition,"sumfuel","ENTRAFFICGPS.SUMFUEL");
      // relationship conditions
    _checkConditionToken(condition,"realtransport","REALTRANSPORTCODE");
    _checkConditionToken(condition,"realtransport.code","REALTRANSPORTCODE");
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

	private void _collectAutoIncrementFields(ENTrafficGPS anObject,
			Connection connection) throws PersistenceException {
		
		SequenceKey hashKey = new SequenceKey("ENTRAFFICGPS", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENTRAFFICGPS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENTRAFFICGPS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}
		
		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
					"Can't obtain auto increment value from: ENTRAFFICGPS");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENTrafficGPSDAO
