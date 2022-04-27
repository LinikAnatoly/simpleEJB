
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

import com.ksoe.energynet.valueobject.ENDestinationPoint2Point;
import com.ksoe.energynet.valueobject.filter.ENDestinationPoint2PointFilter;
import com.ksoe.energynet.valueobject.brief.ENDestinationPoint2PointShort;
import com.ksoe.energynet.valueobject.lists.ENDestinationPoint2PointShortList;


/**
 * DAO Object for ENDestinationPoint2Point;
 *
 */

public class ENDestinationPoint2PointDAOGen extends GenericDataMiner {

  public ENDestinationPoint2PointDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENDestinationPoint2PointDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENDestinationPoint2Point inObject) throws PersistenceException
   {
      ENDestinationPoint2Point obj = new ENDestinationPoint2Point();
      obj.code = inObject.code;
      loadObject(obj);

     if ( ! inObject.distance.equals(obj.distance)){
       return false;
     }
     if (inObject.elementInRef.code != obj.elementInRef.code){
        return false;
     }
     if (inObject.elementOutRef.code != obj.elementOutRef.code){
        return false;
     }
      return true;
   }

   public int add(ENDestinationPoint2Point anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENDestinationPoint2Point anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENDESTINATIONPOINT2PNT (CODE,DISTANCE,ELEMENTINREFCODE,ELEMENTOUTREFCODE) VALUES (?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.distance != null)
        anObject.distance = anObject.distance.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.distance);
      if (anObject.elementInRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).exists(anObject.elementInRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENDestinationPoint2Point.elementInRef.code%} = {%"+anObject.elementInRef.code+"%}");
        statement.setInt(3,anObject.elementInRef.code);
      }
      else
        statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.elementOutRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).exists(anObject.elementOutRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENDestinationPoint2Point.elementOutRef.code%} = {%"+anObject.elementOutRef.code+"%}");
        statement.setInt(4,anObject.elementOutRef.code);
      }
      else
        statement.setNull(4,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENDestinationPoint2PointDAOGen.add%}",e);
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

   public void save(ENDestinationPoint2Point anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENDestinationPoint2Point anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("ELEMENTINREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ELEMENTOUTREF") == 0)
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
        "UPDATE ENDESTINATIONPOINT2PNT SET  DISTANCE = ? , ELEMENTINREFCODE = ? , ELEMENTOUTREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENDESTINATIONPOINT2POINT SET ";
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
        anObject.distance = anObject.distance.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(1,anObject.distance);
      if (anObject.elementInRef.code != Integer.MIN_VALUE)
        statement.setInt(2,anObject.elementInRef.code);
      else
        statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.elementOutRef.code != Integer.MIN_VALUE)
        statement.setInt(3,anObject.elementOutRef.code);
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
                    anObject.distance = anObject.distance.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.distance);
                continue;
             }
            if("ELEMENTINREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.elementInRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.elementInRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("ELEMENTOUTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.elementOutRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.elementOutRef.code);
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

   } // end of save(ENDestinationPoint2Point anObject,String[] anAttributes)


 public ENDestinationPoint2PointShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENDestinationPoint2Point filterObject = new ENDestinationPoint2Point();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENDestinationPoint2PointShort)list.get(0);
   return null;
  }

  public ENDestinationPoint2PointShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENDestinationPoint2PointShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENDestinationPoint2PointShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENDestinationPoint2PointShortList getFilteredList(ENDestinationPoint2Point filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENDestinationPoint2PointShortList getScrollableFilteredList(ENDestinationPoint2Point aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENDestinationPoint2PointShortList getScrollableFilteredList(ENDestinationPoint2Point aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENDestinationPoint2PointShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENDestinationPoint2PointShortList getScrollableFilteredList(ENDestinationPoint2PointFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENDestinationPoint2PointShortList getScrollableFilteredList(ENDestinationPoint2PointFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENDestinationPoint2PointShortList getScrollableFilteredList(ENDestinationPoint2Point aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENDestinationPoint2PointShortList getScrollableFilteredList(ENDestinationPoint2Point aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENDestinationPoint2PointShortList result = new ENDestinationPoint2PointShortList();
    ENDestinationPoint2PointShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENDESTINATIONPOINT2PNT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENDESTINATIONPOINT2PNT.CODE"+
     ",ENDESTINATIONPOINT2PNT.DISTANCE"+

      ", ENELEMENT.CODE " +
      ", ENELEMENT.CODE " +
     " FROM ENDESTINATIONPOINT2PNT " +
     ", ENELEMENT " +
     ", ENELEMENT " +
     //" WHERE "
	"";
     whereStr = " ENELEMENT.CODE = ENDESTINATIONPOINT2PNT.ELEMENTINREFCODE" ; //+
      whereStr = whereStr +" AND ENELEMENT.CODE = ENDESTINATIONPOINT2PNT.ELEMENTOUTREFCODE" ; //+
		//selectStr = selectStr + " ${s} ENDESTINATIONPOINT2PNT.CODE IN ( SELECT ENDESTINATIONPOINT2PNT.CODE FROM ENDESTINATIONPOINT2PNT ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDESTINATIONPOINT2PNT.CODE = ?";
        }
        if(aFilterObject.distance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDESTINATIONPOINT2PNT.DISTANCE = ?";
        }
        if(aFilterObject.elementInRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENDESTINATIONPOINT2PNT.ELEMENTINREFCODE = ? ";
        }
        if(aFilterObject.elementOutRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENDESTINATIONPOINT2PNT.ELEMENTOUTREFCODE = ? ";
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
            aFilterObject.distance = aFilterObject.distance.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distance);
        }
       if(aFilterObject.elementInRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.elementInRef.code);
       }
       if(aFilterObject.elementOutRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.elementOutRef.code);
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

        anObject = new ENDestinationPoint2PointShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.distance = set.getBigDecimal(2);
        if(anObject.distance != null)
            anObject.distance = anObject.distance.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.elementInRefCode = set.getInt(3);
		if(set.wasNull())
		   anObject.elementInRefCode = Integer.MIN_VALUE;
        anObject.elementOutRefCode = set.getInt(4);
		if(set.wasNull())
		   anObject.elementOutRefCode = Integer.MIN_VALUE;

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

  public int[] getFilteredCodeArrayOLD(ENDestinationPoint2Point aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENDESTINATIONPOINT2PNT.CODE FROM ENDESTINATIONPOINT2PNT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENDESTINATIONPOINT2PNT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDESTINATIONPOINT2PNT.CODE = ?";
        }
        if(aFilterObject.distance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDESTINATIONPOINT2PNT.DISTANCE = ?";
        }
        if(aFilterObject.elementInRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDESTINATIONPOINT2PNT.ELEMENTINREFCODE = ? ";
        }
        if(aFilterObject.elementOutRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDESTINATIONPOINT2PNT.ELEMENTOUTREFCODE = ? ";
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
            aFilterObject.distance = aFilterObject.distance.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distance);
        }
       if(aFilterObject.elementInRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.elementInRef.code);
       }
       if(aFilterObject.elementOutRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.elementOutRef.code);
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

  public int[] getFilteredCodeArray(ENDestinationPoint2PointFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
	return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENDestinationPoint2Point aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENDESTINATIONPOINT2PNT.CODE FROM ENDESTINATIONPOINT2PNT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENDESTINATIONPOINT2PNT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDESTINATIONPOINT2PNT.CODE = ?";
        }
        if(aFilterObject.distance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDESTINATIONPOINT2PNT.DISTANCE = ?";
        }
        if(aFilterObject.elementInRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDESTINATIONPOINT2PNT.ELEMENTINREFCODE = ? ";
        }
        if(aFilterObject.elementOutRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDESTINATIONPOINT2PNT.ELEMENTOUTREFCODE = ? ";
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
            aFilterObject.distance = aFilterObject.distance.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distance);
        }
       if(aFilterObject.elementInRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.elementInRef.code);
       }
       if(aFilterObject.elementOutRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.elementOutRef.code);
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


   public ENDestinationPoint2Point getObject(int uid) throws PersistenceException
   {
    ENDestinationPoint2Point result = new ENDestinationPoint2Point();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENDestinationPoint2Point anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENDESTINATIONPOINT2PNT.CODE, ENDESTINATIONPOINT2PNT.DISTANCE, ENDESTINATIONPOINT2PNT.ELEMENTINREFCODE, ENDESTINATIONPOINT2PNT.ELEMENTOUTREFCODE "
    +" FROM ENDESTINATIONPOINT2PNT WHERE ENDESTINATIONPOINT2PNT.CODE = ?";

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
            anObject.distance = anObject.distance.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.elementInRef.code = set.getInt(3);
        if ( set.wasNull() )
            anObject.elementInRef.code = Integer.MIN_VALUE;
        anObject.elementOutRef.code = set.getInt(4);
        if ( set.wasNull() )
            anObject.elementOutRef.code = Integer.MIN_VALUE;
        if(anObject.elementInRef.code != Integer.MIN_VALUE)
        {
           anObject.setElementInRef(
		   new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).getRef(anObject.elementInRef.code));
	   }
        if(anObject.elementOutRef.code != Integer.MIN_VALUE)
        {
           anObject.setElementOutRef(
		   new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).getRef(anObject.elementOutRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENDestinationPoint2PointRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENDestinationPoint2PointRef ref = new com.ksoe.energynet.valueobject.references.ENDestinationPoint2PointRef();
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

    selectStr = "DELETE FROM  ENDESTINATIONPOINT2PNT WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENDestinationPoint2Point object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENDestinationPoint2Point.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENDestinationPoint2Point.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENDestinationPoint2Point.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENDestinationPoint2Point.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENDestinationPoint2Point.getObject%} access denied");

    selectStr =

    "SELECT  ENDESTINATIONPOINT2PNT.CODE FROM  ENDESTINATIONPOINT2PNT WHERE  ENDESTINATIONPOINT2PNT.CODE = ?";
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
    _checkConditionToken(condition,"code","ENDESTINATIONPOINT2PNT.CODE");
    _checkConditionToken(condition,"distance","ENDESTINATIONPOINT2PNT.DISTANCE");
      // relationship conditions
    _checkConditionToken(condition,"elementinref","ELEMENTINREFCODE");
    _checkConditionToken(condition,"elementinref.code","ELEMENTINREFCODE");
    _checkConditionToken(condition,"elementoutref","ELEMENTOUTREFCODE");
    _checkConditionToken(condition,"elementoutref.code","ELEMENTOUTREFCODE");
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

	private void _collectAutoIncrementFields(ENDestinationPoint2Point anObject,
			Connection connection) throws PersistenceException {
		
		SequenceKey hashKey = new SequenceKey("ENDESTINATIONPOINT2PNT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENDESTINATIONPOINT2PNT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENDESTINATIONPOINT2PNT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}
		
		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
					"Can't obtain auto increment value from: ENDESTINATIONPOINT2PNT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENDestinationPoint2PointDAO
