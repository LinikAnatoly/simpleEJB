
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer.generated;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
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

import com.ksoe.energynet.valueobject.ENPlanWork2ActFailure;
import com.ksoe.energynet.valueobject.filter.ENPlanWork2ActFailureFilter;
import com.ksoe.energynet.valueobject.brief.ENPlanWork2ActFailureShort;
import com.ksoe.energynet.valueobject.lists.ENPlanWork2ActFailureShortList;


/**
 * DAO Object for ENPlanWork2ActFailure;
 *
 */

public class ENPlanWork2ActFailureDAOGen extends GenericDataMiner {

   public ENPlanWork2ActFailureDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENPlanWork2ActFailureDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   protected boolean isEqual(ENPlanWork2ActFailure inObject) throws PersistenceException
   {
      ENPlanWork2ActFailure obj = new ENPlanWork2ActFailure();
      obj.code = inObject.code;
      loadObject(obj);
     if (inObject.planRef.code != obj.planRef.code){
        return false;
     }
     if (inObject.actFailureRef.code != obj.actFailureRef.code){
        return false;
     }
      return true;
   }

   public int add(ENPlanWork2ActFailure anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENPlanWork2ActFailure anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENPLANWORK2ACTFAILURE (CODE,PLANREFCODE,ACTFAILUREREFCODE) VALUES (?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.planRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPlanWork2ActFailure.planRef.code%} = {%"+anObject.planRef.code+"%}");
        statement.setInt(2,anObject.planRef.code);
      }
      else
        statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.actFailureRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENActFailureDAOGen(connection,getUserProfile()).exists(anObject.actFailureRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPlanWork2ActFailure.actFailureRef.code%} = {%"+anObject.actFailureRef.code+"%}");
        statement.setInt(3,anObject.actFailureRef.code);
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
      throw new PersistenceException("Error in method {%ENPlanWork2ActFailureDAOGen.add%}",e);
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

   public void save(ENPlanWork2ActFailure anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENPlanWork2ActFailure anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("PLANREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ACTFAILUREREF") == 0)
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
        "UPDATE ENPLANWORK2ACTFAILURE SET PLANREFCODE = ? , ACTFAILUREREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENPLANWORK2ACTFAILURE SET ";
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
      if (anObject.planRef.code != Integer.MIN_VALUE)
        statement.setInt(1,anObject.planRef.code);
      else
        statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.actFailureRef.code != Integer.MIN_VALUE)
        statement.setInt(2,anObject.actFailureRef.code);
      else
        statement.setNull(2,java.sql.Types.INTEGER);
          statement.setInt(3,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("PLANREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.planRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.planRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("ACTFAILUREREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.actFailureRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.actFailureRef.code);
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

   } // end of save(ENPlanWork2ActFailure anObject,String[] anAttributes)


 public ENPlanWork2ActFailureShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENPlanWork2ActFailure filterObject = new ENPlanWork2ActFailure();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENPlanWork2ActFailureShort)list.get(0);
   return null;
  }

  public ENPlanWork2ActFailureShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENPlanWork2ActFailureShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENPlanWork2ActFailureShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENPlanWork2ActFailureShortList getFilteredList(ENPlanWork2ActFailure filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENPlanWork2ActFailureShortList getScrollableFilteredList(ENPlanWork2ActFailure aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENPlanWork2ActFailureShortList getScrollableFilteredList(ENPlanWork2ActFailure aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENPlanWork2ActFailureShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENPlanWork2ActFailureShortList getScrollableFilteredList(ENPlanWork2ActFailureFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENPlanWork2ActFailureShortList getScrollableFilteredList(ENPlanWork2ActFailureFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENPlanWork2ActFailureShortList getScrollableFilteredList(ENPlanWork2ActFailure aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENPlanWork2ActFailureShortList getScrollableFilteredList(ENPlanWork2ActFailure aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENPlanWork2ActFailureShortList result = new ENPlanWork2ActFailureShortList();
    ENPlanWork2ActFailureShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENPLANWORK2ACTFAILURE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENPLANWORK2ACTFAILURE.CODE"+

      ", ENPLANWORK.CODE " +
      ", ENPLANWORK.DATEGEN " +
      ", ENPLANWORK.DATESTART " +
      ", ENPLANWORK.DATEFINAL " +
      ", ENPLANWORK.YEARGEN " +
      ", ENPLANWORK.MONTHGEN " +
      ", ENPLANWORK.YEARORIGINAL " +
      ", ENPLANWORK.MONTHORIGINAL " +
      ", ENPLANWORK.USERGEN " +
      ", ENPLANWORK.DATEEDIT " +
      ", ENPLANWORK.WORKORDERNUMBER " +
      ", ENPLANWORK.DATEWORKORDER " +
      ", ENPLANWORK.PRICONNECTIONNUMBER " +
      ", ENPLANWORK.DATEENDPRICONNECTION " +
      ", ENPLANWORK.INVESTWORKSDESCRIPTION " +
      ", ENPLANWORK.SERVICESFSIDEFINID " +
      ", ENPLANWORK.SERVICESFSIDECNNUM " +
      ", ENPLANWORK.TOTALTIMEHOURS " +
      ", ENPLANWORK.TOTALTIMEDAYS " +
      ", ENPLANWORK.INVESTITEMNUMBER " +
      ", ENACTFAILURE.CODE " +
      ", ENACTFAILURE.NUMBERGEN " +
      ", ENACTFAILURE.DATEACT " +
      ", ENACTFAILURE.COMMENTGEN " +
      ", ENACTFAILURE.USERADD " +
      ", ENACTFAILURE.DATEADD " +
      ", ENACTFAILURE.USERGEN " +
      ", ENACTFAILURE.DATEEDIT " +
     " FROM ENPLANWORK2ACTFAILURE " +
     ", ENPLANWORK " +
     ", ENACTFAILURE " +
     //" WHERE "
  "";
     whereStr = " ENPLANWORK.CODE = ENPLANWORK2ACTFAILURE.PLANREFCODE" ; //+
      whereStr = whereStr +" AND ENACTFAILURE.CODE = ENPLANWORK2ACTFAILURE.ACTFAILUREREFCODE" ; //+
    //selectStr = selectStr + " ${s} ENPLANWORK2ACTFAILURE.CODE IN ( SELECT ENPLANWORK2ACTFAILURE.CODE FROM ENPLANWORK2ACTFAILURE ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK2ACTFAILURE.CODE = ?";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENPLANWORK2ACTFAILURE.PLANREFCODE = ? ";
        }
        if(aFilterObject.actFailureRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENPLANWORK2ACTFAILURE.ACTFAILUREREFCODE = ? ";
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

    selectStr = selectStr + " OFFSET " + fromPosition;
    if (quantity>-1) selectStr = selectStr + " LIMIT " + quantity;

    try
     {
      statement = connection.prepareStatement(selectStr);
      int number = 0;
      if(aFilterObject != null){
         if(aFilterObject.code != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.code);
         }
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
       }
       if(aFilterObject.actFailureRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.actFailureRef.code);
       }
      }

      if(condition.length() > 0 && aBindObjects != null)
       _bindObjectsToPreparedStatement(statement,aBindObjects,number);

      set = statement.executeQuery();
      int i;
      for (i = 0; set.next(); i++) {
        /*
        if (i < fromPosition)
          continue;
        else if (i >= fromPosition + quantity) {
          i++;
          break;
        } */

        anObject = new ENPlanWork2ActFailureShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;

        anObject.planRefCode = set.getInt(2);
    if(set.wasNull())
      anObject.planRefCode = Integer.MIN_VALUE;
        anObject.planRefDateGen = set.getTimestamp(3);
        anObject.planRefDateStart = set.getDate(4);
        anObject.planRefDateFinal = set.getDate(5);
        anObject.planRefYearGen = set.getInt(6);
    if(set.wasNull())
      anObject.planRefYearGen = Integer.MIN_VALUE;
        anObject.planRefMonthGen = set.getInt(7);
    if(set.wasNull())
      anObject.planRefMonthGen = Integer.MIN_VALUE;
        anObject.planRefYearOriginal = set.getInt(8);
    if(set.wasNull())
      anObject.planRefYearOriginal = Integer.MIN_VALUE;
        anObject.planRefMonthOriginal = set.getInt(9);
    if(set.wasNull())
      anObject.planRefMonthOriginal = Integer.MIN_VALUE;
        anObject.planRefUserGen = set.getString(10);
        anObject.planRefDateEdit = set.getDate(11);
        anObject.planRefWorkOrderNumber = set.getString(12);
        anObject.planRefDateWorkOrder = set.getDate(13);
        anObject.planRefPriConnectionNumber = set.getString(14);
        anObject.planRefDateEndPriConnection = set.getDate(15);
        anObject.planRefInvestWorksDescription = set.getString(16);
        anObject.planRefServicesFSideFinId = set.getInt(17);
    if(set.wasNull())
      anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;
        anObject.planRefServicesFSideCnNum = set.getString(18);
        anObject.planRefTotalTimeHours = set.getBigDecimal(19);
        if(anObject.planRefTotalTimeHours != null)
          anObject.planRefTotalTimeHours = anObject.planRefTotalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.planRefTotalTimeDays = set.getBigDecimal(20);
        if(anObject.planRefTotalTimeDays != null)
          anObject.planRefTotalTimeDays = anObject.planRefTotalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.planRefInvestItemNumber = set.getString(21);
        anObject.actFailureRefCode = set.getInt(22);
    if(set.wasNull())
      anObject.actFailureRefCode = Integer.MIN_VALUE;
        anObject.actFailureRefNumberGen = set.getString(23);
        anObject.actFailureRefDateAct = set.getTimestamp(24);
        anObject.actFailureRefCommentGen = set.getString(25);
        anObject.actFailureRefUserAdd = set.getString(26);
        anObject.actFailureRefDateAdd = set.getTimestamp(27);
        anObject.actFailureRefUserGen = set.getString(28);
        anObject.actFailureRefDateEdit = set.getTimestamp(29);

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

  public int[] getFilteredCodeArrayOLD(ENPlanWork2ActFailure aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENPLANWORK2ACTFAILURE.CODE FROM ENPLANWORK2ACTFAILURE";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENPLANWORK2ACTFAILURE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK2ACTFAILURE.CODE = ?";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANWORK2ACTFAILURE.PLANREFCODE = ? ";
        }
        if(aFilterObject.actFailureRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANWORK2ACTFAILURE.ACTFAILUREREFCODE = ? ";
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
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
       }
       if(aFilterObject.actFailureRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.actFailureRef.code);
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

  public int[] getFilteredCodeArray(ENPlanWork2ActFailureFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENPlanWork2ActFailure aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENPLANWORK2ACTFAILURE.CODE FROM ENPLANWORK2ACTFAILURE";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENPLANWORK2ACTFAILURE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK2ACTFAILURE.CODE = ?";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANWORK2ACTFAILURE.PLANREFCODE = ? ";
        }
        if(aFilterObject.actFailureRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANWORK2ACTFAILURE.ACTFAILUREREFCODE = ? ";
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
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
       }
       if(aFilterObject.actFailureRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.actFailureRef.code);
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


   public ENPlanWork2ActFailure getObject(int uid) throws PersistenceException
   {
    ENPlanWork2ActFailure result = new ENPlanWork2ActFailure();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENPlanWork2ActFailure anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENPLANWORK2ACTFAILURE.CODE, ENPLANWORK2ACTFAILURE.PLANREFCODE, ENPLANWORK2ACTFAILURE.ACTFAILUREREFCODE "
    +" FROM ENPLANWORK2ACTFAILURE WHERE ENPLANWORK2ACTFAILURE.CODE = ?";

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
        anObject.planRef.code = set.getInt(2);
        if ( set.wasNull() )
            anObject.planRef.code = Integer.MIN_VALUE;
        anObject.actFailureRef.code = set.getInt(3);
        if ( set.wasNull() )
            anObject.actFailureRef.code = Integer.MIN_VALUE;
        if(anObject.planRef.code != Integer.MIN_VALUE)
        {
           anObject.setPlanRef(
      new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).getRef(anObject.planRef.code));
    }
        if(anObject.actFailureRef.code != Integer.MIN_VALUE)
        {
           anObject.setActFailureRef(
      new com.ksoe.energynet.dataminer.generated.ENActFailureDAOGen(connection,getUserProfile()).getRef(anObject.actFailureRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENPlanWork2ActFailureRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENPlanWork2ActFailureRef ref = new com.ksoe.energynet.valueobject.references.ENPlanWork2ActFailureRef();
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

    selectStr = "DELETE FROM  ENPLANWORK2ACTFAILURE WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENPlanWork2ActFailure object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENPlanWork2ActFailure.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENPlanWork2ActFailure.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENPlanWork2ActFailure.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPlanWork2ActFailure.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENPlanWork2ActFailure.getObject%} access denied");

    selectStr =

    "SELECT  ENPLANWORK2ACTFAILURE.CODE FROM  ENPLANWORK2ACTFAILURE WHERE  ENPLANWORK2ACTFAILURE.CODE = ?";
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
    _checkConditionToken(condition,"code","ENPLANWORK2ACTFAILURE.CODE");
      // relationship conditions
    _checkConditionToken(condition,"planref","PLANREFCODE");
    _checkConditionToken(condition,"planref.code","PLANREFCODE");
    _checkConditionToken(condition,"actfailureref","ACTFAILUREREFCODE");
    _checkConditionToken(condition,"actfailureref.code","ACTFAILUREREFCODE");
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

  private void _collectAutoIncrementFields(ENPlanWork2ActFailure anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENPLANWORK2ACTFAILURE", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENPLANWORK2ACTFAILURE", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENPLANWORK2ACTFAILURE", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENPLANWORK2ACTFAILURE");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENPlanWork2ActFailureDAO
