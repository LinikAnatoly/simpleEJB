
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

import com.ksoe.energynet.valueobject.ENRoadTypeData;
import com.ksoe.energynet.valueobject.filter.ENRoadTypeDataFilter;
import com.ksoe.energynet.valueobject.brief.ENRoadTypeDataShort;
import com.ksoe.energynet.valueobject.lists.ENRoadTypeDataShortList;


/**
 * DAO Object for ENRoadTypeData;
 *
 */

public class ENRoadTypeDataDAOGen extends GenericDataMiner {

  public ENRoadTypeDataDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENRoadTypeDataDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENRoadTypeData inObject) throws PersistenceException
   {
      ENRoadTypeData obj = new ENRoadTypeData();
      obj.code = inObject.code;
      loadObject(obj);

     if ( ! inObject.speed.equals(obj.speed)){
       return false;
     }

     if ( ! inObject.distance.equals(obj.distance)){
       return false;
     }

     if (inObject.isWinter != obj.isWinter){
       return false;
     }

     if ( ! inObject.coeff.equals(obj.coeff)){
       return false;
     }
     if (inObject.typeRef.code != obj.typeRef.code){
        return false;
     }
      return true;
   }

   public int add(ENRoadTypeData anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENRoadTypeData anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENROADTYPEDATA (CODE,SPEED,DISTANCE,ISWINTER,COEFF,TYPEREFCODE) VALUES (?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.speed != null)
        anObject.speed = anObject.speed.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.speed);
      if (anObject.distance != null)
        anObject.distance = anObject.distance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.distance);
      if (anObject.isWinter != Integer.MIN_VALUE )
         statement.setInt(4,anObject.isWinter);
      else
         statement.setNull(4,java.sql.Types.INTEGER);
      if (anObject.coeff != null)
        anObject.coeff = anObject.coeff.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.coeff);
      if (anObject.typeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENRoadTypeDAOGen(connection,getUserProfile()).exists(anObject.typeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENRoadTypeData.typeRef.code%} = {%"+anObject.typeRef.code+"%}");
        statement.setInt(6,anObject.typeRef.code);
      }
      else
        statement.setNull(6,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENRoadTypeDataDAOGen.add%}",e);
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

   public void save(ENRoadTypeData anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENRoadTypeData anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("SPEED") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DISTANCE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ISWINTER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COEFF") == 0)
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
        "UPDATE ENROADTYPEDATA SET  SPEED = ? , DISTANCE = ? , ISWINTER = ? , COEFF = ? , TYPEREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENROADTYPEDATA SET ";
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
      if (anObject.speed != null)
        anObject.speed = anObject.speed.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(1,anObject.speed);
      if (anObject.distance != null)
        anObject.distance = anObject.distance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.distance);
      if (anObject.isWinter != Integer.MIN_VALUE )
         statement.setInt(3,anObject.isWinter);
      else
         statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.coeff != null)
        anObject.coeff = anObject.coeff.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.coeff);
      if (anObject.typeRef.code != Integer.MIN_VALUE)
        statement.setInt(5,anObject.typeRef.code);
      else
        statement.setNull(5,java.sql.Types.INTEGER);
          statement.setInt(6,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("SPEED".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.speed != null)
                    anObject.speed = anObject.speed.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.speed);
                continue;
             }
            if("DISTANCE".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.distance != null)
                    anObject.distance = anObject.distance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.distance);
                continue;
             }
            if("ISWINTER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.isWinter);
                continue;
             }
            if("COEFF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.coeff != null)
                    anObject.coeff = anObject.coeff.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.coeff);
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

   } // end of save(ENRoadTypeData anObject,String[] anAttributes)


 public ENRoadTypeDataShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENRoadTypeData filterObject = new ENRoadTypeData();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENRoadTypeDataShort)list.get(0);
   return null;
  }

  public ENRoadTypeDataShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENRoadTypeDataShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENRoadTypeDataShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENRoadTypeDataShortList getFilteredList(ENRoadTypeData filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENRoadTypeDataShortList getScrollableFilteredList(ENRoadTypeData aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENRoadTypeDataShortList getScrollableFilteredList(ENRoadTypeData aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENRoadTypeDataShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENRoadTypeDataShortList getScrollableFilteredList(ENRoadTypeDataFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENRoadTypeDataShortList getScrollableFilteredList(ENRoadTypeDataFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENRoadTypeDataShortList getScrollableFilteredList(ENRoadTypeData aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENRoadTypeDataShortList getScrollableFilteredList(ENRoadTypeData aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENRoadTypeDataShortList result = new ENRoadTypeDataShortList();
    ENRoadTypeDataShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENROADTYPEDATA.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENROADTYPEDATA.CODE"+
     ",ENROADTYPEDATA.SPEED"+
     ",ENROADTYPEDATA.DISTANCE"+
     ",ENROADTYPEDATA.ISWINTER"+
     ",ENROADTYPEDATA.COEFF"+

      ", ENROADTYPE.CODE " +
      ", ENROADTYPE.NAME " +
     " FROM ENROADTYPEDATA " +
     ", ENROADTYPE " +
     //" WHERE "
	"";
     whereStr = " ENROADTYPE.CODE = ENROADTYPEDATA.TYPEREFCODE" ; //+
		//selectStr = selectStr + " ${s} ENROADTYPEDATA.CODE IN ( SELECT ENROADTYPEDATA.CODE FROM ENROADTYPEDATA ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROADTYPEDATA.CODE = ?";
        }
        if(aFilterObject.speed != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROADTYPEDATA.SPEED = ?";
        }
        if(aFilterObject.distance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROADTYPEDATA.DISTANCE = ?";
        }
        if(aFilterObject.isWinter != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROADTYPEDATA.ISWINTER = ?";
        }
        if(aFilterObject.coeff != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROADTYPEDATA.COEFF = ?";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENROADTYPEDATA.TYPEREFCODE = ? ";
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
        if(aFilterObject.speed != null){
            number++;
            aFilterObject.speed = aFilterObject.speed.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.speed);
        }
        if(aFilterObject.distance != null){
            number++;
            aFilterObject.distance = aFilterObject.distance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distance);
        }
         if(aFilterObject.isWinter != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isWinter);
         }
        if(aFilterObject.coeff != null){
            number++;
            aFilterObject.coeff = aFilterObject.coeff.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.coeff);
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

        anObject = new ENRoadTypeDataShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.speed = set.getBigDecimal(2);
        if(anObject.speed != null)
            anObject.speed = anObject.speed.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.distance = set.getBigDecimal(3);
        if(anObject.distance != null)
            anObject.distance = anObject.distance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.isWinter = set.getInt(4);
        if ( set.wasNull() )
            anObject.isWinter = Integer.MIN_VALUE;
        anObject.coeff = set.getBigDecimal(5);
        if(anObject.coeff != null)
            anObject.coeff = anObject.coeff.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.typeRefCode = set.getInt(6);
		if(set.wasNull())
		   anObject.typeRefCode = Integer.MIN_VALUE;
        anObject.typeRefName = set.getString(7);

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

  public int[] getFilteredCodeArrayOLD(ENRoadTypeData aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENROADTYPEDATA.CODE FROM ENROADTYPEDATA";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENROADTYPEDATA.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROADTYPEDATA.CODE = ?";
        }
        if(aFilterObject.speed != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROADTYPEDATA.SPEED = ?";
        }
        if(aFilterObject.distance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROADTYPEDATA.DISTANCE = ?";
        }
        if(aFilterObject.isWinter != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROADTYPEDATA.ISWINTER = ?";
        }
        if(aFilterObject.coeff != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROADTYPEDATA.COEFF = ?";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENROADTYPEDATA.TYPEREFCODE = ? ";
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
        if(aFilterObject.speed != null){
            number++;
            aFilterObject.speed = aFilterObject.speed.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.speed);
        }
        if(aFilterObject.distance != null){
            number++;
            aFilterObject.distance = aFilterObject.distance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distance);
        }
         if(aFilterObject.isWinter != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isWinter);
         }
        if(aFilterObject.coeff != null){
            number++;
            aFilterObject.coeff = aFilterObject.coeff.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.coeff);
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

  public int[] getFilteredCodeArray(ENRoadTypeDataFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
	return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENRoadTypeData aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENROADTYPEDATA.CODE FROM ENROADTYPEDATA";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENROADTYPEDATA.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROADTYPEDATA.CODE = ?";
        }
        if(aFilterObject.speed != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROADTYPEDATA.SPEED = ?";
        }
        if(aFilterObject.distance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROADTYPEDATA.DISTANCE = ?";
        }
        if(aFilterObject.isWinter != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROADTYPEDATA.ISWINTER = ?";
        }
        if(aFilterObject.coeff != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENROADTYPEDATA.COEFF = ?";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENROADTYPEDATA.TYPEREFCODE = ? ";
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
        if(aFilterObject.speed != null){
            number++;
            aFilterObject.speed = aFilterObject.speed.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.speed);
        }
        if(aFilterObject.distance != null){
            number++;
            aFilterObject.distance = aFilterObject.distance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distance);
        }
         if(aFilterObject.isWinter != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isWinter);
         }
        if(aFilterObject.coeff != null){
            number++;
            aFilterObject.coeff = aFilterObject.coeff.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.coeff);
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


   public ENRoadTypeData getObject(int uid) throws PersistenceException
   {
    ENRoadTypeData result = new ENRoadTypeData();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENRoadTypeData anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENROADTYPEDATA.CODE, ENROADTYPEDATA.SPEED, ENROADTYPEDATA.DISTANCE, ENROADTYPEDATA.ISWINTER, ENROADTYPEDATA.COEFF, ENROADTYPEDATA.TYPEREFCODE "
    +" FROM ENROADTYPEDATA WHERE ENROADTYPEDATA.CODE = ?";

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
        anObject.speed = set.getBigDecimal(2);
        if(anObject.speed != null)
            anObject.speed = anObject.speed.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.distance = set.getBigDecimal(3);
        if(anObject.distance != null)
            anObject.distance = anObject.distance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.isWinter = set.getInt(4);
        if ( set.wasNull() )
           anObject.isWinter = Integer.MIN_VALUE;
        anObject.coeff = set.getBigDecimal(5);
        if(anObject.coeff != null)
            anObject.coeff = anObject.coeff.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.typeRef.code = set.getInt(6);
        if ( set.wasNull() )
            anObject.typeRef.code = Integer.MIN_VALUE;
        if(anObject.typeRef.code != Integer.MIN_VALUE)
        {
           anObject.setTypeRef(
		   new com.ksoe.energynet.dataminer.generated.ENRoadTypeDAOGen(connection,getUserProfile()).getRef(anObject.typeRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENRoadTypeDataRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENRoadTypeDataRef ref = new com.ksoe.energynet.valueobject.references.ENRoadTypeDataRef();
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

    selectStr = "DELETE FROM  ENROADTYPEDATA WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENRoadTypeData object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENRoadTypeData.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENRoadTypeData.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENRoadTypeData.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENRoadTypeData.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENRoadTypeData.getObject%} access denied");

    selectStr =

    "SELECT  ENROADTYPEDATA.CODE FROM  ENROADTYPEDATA WHERE  ENROADTYPEDATA.CODE = ?";
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
    _checkConditionToken(condition,"code","ENROADTYPEDATA.CODE");
    _checkConditionToken(condition,"speed","ENROADTYPEDATA.SPEED");
    _checkConditionToken(condition,"distance","ENROADTYPEDATA.DISTANCE");
    _checkConditionToken(condition,"iswinter","ENROADTYPEDATA.ISWINTER");
    _checkConditionToken(condition,"coeff","ENROADTYPEDATA.COEFF");
      // relationship conditions
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

	private void _collectAutoIncrementFields(ENRoadTypeData anObject,
			Connection connection) throws PersistenceException {
		
		SequenceKey hashKey = new SequenceKey("ENROADTYPEDATA", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENROADTYPEDATA", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENROADTYPEDATA", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}
		
		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
					"Can't obtain auto increment value from: ENROADTYPEDATA");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENRoadTypeDataDAO
