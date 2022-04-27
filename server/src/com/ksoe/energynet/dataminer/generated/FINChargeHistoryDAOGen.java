
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

import com.ksoe.energynet.valueobject.FINChargeHistory;
import com.ksoe.energynet.valueobject.filter.FINChargeHistoryFilter;
import com.ksoe.energynet.valueobject.brief.FINChargeHistoryShort;
import com.ksoe.energynet.valueobject.lists.FINChargeHistoryShortList;


/**
 * DAO Object for FINChargeHistory;
 *
 */

public class FINChargeHistoryDAOGen extends GenericDataMiner {

  public FINChargeHistoryDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public FINChargeHistoryDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(FINChargeHistory inObject) throws PersistenceException
   {
      FINChargeHistory obj = new FINChargeHistory();
      obj.code = inObject.code;
      loadObject(obj);

     if ( ! inObject.chargePercent.equals(obj.chargePercent)){
       return false;
     }

     if ( ! inObject.dategen.equals(obj.dategen)){
       return false;
     }
     if (inObject.chargeRef.code != obj.chargeRef.code){
        return false;
     }
      return true;
   }

   public int add(FINChargeHistory anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(FINChargeHistory anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO FINCHARGEHISTORY (CODE,CHARGEPERCENT,DATEGEN,CHARGEREFCODE) VALUES (?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.chargePercent != null)
        anObject.chargePercent = anObject.chargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.chargePercent);
      if (anObject.dategen == null)
        statement.setDate(3,null);
      else
        statement.setDate(3,new java.sql.Date(anObject.dategen.getTime()));
      if (anObject.chargeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.FINChargeTypeDAOGen(connection,getUserProfile()).exists(anObject.chargeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.FINChargeHistory.chargeRef.code%} = {%"+anObject.chargeRef.code+"%}");
        statement.setInt(4,anObject.chargeRef.code);
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
      throw new PersistenceException("Error in method {%FINChargeHistoryDAOGen.add%}",e);
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

   public void save(FINChargeHistory anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(FINChargeHistory anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("CHARGEPERCENT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATEGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CHARGEREF") == 0)
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
        "UPDATE FINCHARGEHISTORY SET  CHARGEPERCENT = ? , DATEGEN = ? , CHARGEREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE FINCHARGEHISTORY SET ";
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
      if (anObject.chargePercent != null)
        anObject.chargePercent = anObject.chargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(1,anObject.chargePercent);
      if (anObject.dategen == null)
        statement.setDate(2,null);
      else
        statement.setDate(2,new java.sql.Date(anObject.dategen.getTime()));
      if (anObject.chargeRef.code != Integer.MIN_VALUE)
        statement.setInt(3,anObject.chargeRef.code);
      else
        statement.setNull(3,java.sql.Types.INTEGER);
          statement.setInt(4,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("CHARGEPERCENT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.chargePercent != null)
                    anObject.chargePercent = anObject.chargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.chargePercent);
                continue;
             }
            if("DATEGEN".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dategen == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.dategen.getTime()));
                continue;
             }
            if("CHARGEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.chargeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.chargeRef.code);
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

   } // end of save(FINChargeHistory anObject,String[] anAttributes)


 public FINChargeHistoryShort getShortObject(int anObjectCode) throws PersistenceException
  {
   FINChargeHistory filterObject = new FINChargeHistory();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (FINChargeHistoryShort)list.get(0);
   return null;
  }

  public FINChargeHistoryShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public FINChargeHistoryShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public FINChargeHistoryShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public FINChargeHistoryShortList getFilteredList(FINChargeHistory filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public FINChargeHistoryShortList getScrollableFilteredList(FINChargeHistory aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public FINChargeHistoryShortList getScrollableFilteredList(FINChargeHistory aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public FINChargeHistoryShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public FINChargeHistoryShortList getScrollableFilteredList(FINChargeHistoryFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public FINChargeHistoryShortList getScrollableFilteredList(FINChargeHistoryFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public FINChargeHistoryShortList getScrollableFilteredList(FINChargeHistory aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public FINChargeHistoryShortList getScrollableFilteredList(FINChargeHistory aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    FINChargeHistoryShortList result = new FINChargeHistoryShortList();
    FINChargeHistoryShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "FINCHARGEHISTORY.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "FINCHARGEHISTORY.CODE"+
     ",FINCHARGEHISTORY.CHARGEPERCENT"+
     ",FINCHARGEHISTORY.DATEGEN"+

      ", FINCHARGETYPE.CODE " +
      ", FINCHARGETYPE.NAME " +
     " FROM FINCHARGEHISTORY " +
     ", FINCHARGETYPE " +
     //" WHERE "
	"";
     whereStr = " FINCHARGETYPE.CODE = FINCHARGEHISTORY.CHARGEREFCODE" ; //+
		//selectStr = selectStr + " ${s} FINCHARGEHISTORY.CODE IN ( SELECT FINCHARGEHISTORY.CODE FROM FINCHARGEHISTORY ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINCHARGEHISTORY.CODE = ?";
        }
        if(aFilterObject.chargePercent != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINCHARGEHISTORY.CHARGEPERCENT = ?";
        }
        if(aFilterObject.dategen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINCHARGEHISTORY.DATEGEN = ?";
        }
        if(aFilterObject.chargeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "FINCHARGEHISTORY.CHARGEREFCODE = ? ";
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
        if(aFilterObject.chargePercent != null){
            number++;
            aFilterObject.chargePercent = aFilterObject.chargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.chargePercent);
        }
        if(aFilterObject.dategen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dategen.getTime()));
        }
       if(aFilterObject.chargeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.chargeRef.code);
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

        anObject = new FINChargeHistoryShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.chargePercent = set.getBigDecimal(2);
        if(anObject.chargePercent != null)
            anObject.chargePercent = anObject.chargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.dategen = set.getDate(3);

        anObject.chargeRefCode = set.getInt(4);
		if(set.wasNull())
		   anObject.chargeRefCode = Integer.MIN_VALUE;
        anObject.chargeRefName = set.getString(5);

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

  public int[] getFilteredCodeArrayOLD(FINChargeHistory aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT FINCHARGEHISTORY.CODE FROM FINCHARGEHISTORY";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "FINCHARGEHISTORY.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINCHARGEHISTORY.CODE = ?";
        }
        if(aFilterObject.chargePercent != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINCHARGEHISTORY.CHARGEPERCENT = ?";
        }
        if(aFilterObject.dategen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINCHARGEHISTORY.DATEGEN = ?";
        }
        if(aFilterObject.chargeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " FINCHARGEHISTORY.CHARGEREFCODE = ? ";
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
        if(aFilterObject.chargePercent != null){
            number++;
            aFilterObject.chargePercent = aFilterObject.chargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.chargePercent);
        }
        if(aFilterObject.dategen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dategen.getTime()));
        }
       if(aFilterObject.chargeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.chargeRef.code);
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

  public int[] getFilteredCodeArray(FINChargeHistoryFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
	return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(FINChargeHistory aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT FINCHARGEHISTORY.CODE FROM FINCHARGEHISTORY";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "FINCHARGEHISTORY.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINCHARGEHISTORY.CODE = ?";
        }
        if(aFilterObject.chargePercent != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINCHARGEHISTORY.CHARGEPERCENT = ?";
        }
        if(aFilterObject.dategen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINCHARGEHISTORY.DATEGEN = ?";
        }
        if(aFilterObject.chargeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " FINCHARGEHISTORY.CHARGEREFCODE = ? ";
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
        if(aFilterObject.chargePercent != null){
            number++;
            aFilterObject.chargePercent = aFilterObject.chargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.chargePercent);
        }
        if(aFilterObject.dategen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dategen.getTime()));
        }
       if(aFilterObject.chargeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.chargeRef.code);
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


   public FINChargeHistory getObject(int uid) throws PersistenceException
   {
    FINChargeHistory result = new FINChargeHistory();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(FINChargeHistory anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  FINCHARGEHISTORY.CODE, FINCHARGEHISTORY.CHARGEPERCENT, FINCHARGEHISTORY.DATEGEN, FINCHARGEHISTORY.CHARGEREFCODE "
    +" FROM FINCHARGEHISTORY WHERE FINCHARGEHISTORY.CODE = ?";

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
        anObject.chargePercent = set.getBigDecimal(2);
        if(anObject.chargePercent != null)
            anObject.chargePercent = anObject.chargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.dategen = set.getDate(3);
        anObject.chargeRef.code = set.getInt(4);
        if ( set.wasNull() )
            anObject.chargeRef.code = Integer.MIN_VALUE;
        if(anObject.chargeRef.code != Integer.MIN_VALUE)
        {
           anObject.setChargeRef(
		   new com.ksoe.energynet.dataminer.generated.FINChargeTypeDAOGen(connection,getUserProfile()).getRef(anObject.chargeRef.code));
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


  public com.ksoe.energynet.valueobject.references.FINChargeHistoryRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.FINChargeHistoryRef ref = new com.ksoe.energynet.valueobject.references.FINChargeHistoryRef();
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

    selectStr = "DELETE FROM  FINCHARGEHISTORY WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    FINChargeHistory object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%FINChargeHistory.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(FINChargeHistory.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%FINChargeHistory.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(FINChargeHistory.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%FINChargeHistory.getObject%} access denied");

    selectStr =

    "SELECT  FINCHARGEHISTORY.CODE FROM  FINCHARGEHISTORY WHERE  FINCHARGEHISTORY.CODE = ?";
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
    _checkConditionToken(condition,"code","FINCHARGEHISTORY.CODE");
    _checkConditionToken(condition,"chargepercent","FINCHARGEHISTORY.CHARGEPERCENT");
    _checkConditionToken(condition,"dategen","FINCHARGEHISTORY.DATEGEN");
      // relationship conditions
    _checkConditionToken(condition,"chargeref","CHARGEREFCODE");
    _checkConditionToken(condition,"chargeref.code","CHARGEREFCODE");
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

	private void _collectAutoIncrementFields(FINChargeHistory anObject,
			Connection connection) throws PersistenceException {
		
		SequenceKey hashKey = new SequenceKey("FINCHARGEHISTORY", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("FINCHARGEHISTORY", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("FINCHARGEHISTORY", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}
		
		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
					"Can't obtain auto increment value from: FINCHARGEHISTORY");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of FINChargeHistoryDAO
