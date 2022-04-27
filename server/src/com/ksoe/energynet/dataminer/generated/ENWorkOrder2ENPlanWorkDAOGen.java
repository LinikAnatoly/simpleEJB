
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
import com.ksoe.energynet.valueobject.ENWorkOrder2ENPlanWork;
import com.ksoe.energynet.valueobject.brief.ENWorkOrder2ENPlanWorkShort;
import com.ksoe.energynet.valueobject.filter.ENWorkOrder2ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.lists.ENWorkOrder2ENPlanWorkShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENWorkOrder2ENPlanWork;
 *
 */

public class ENWorkOrder2ENPlanWorkDAOGen extends GenericDataMiner {

  public ENWorkOrder2ENPlanWorkDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENWorkOrder2ENPlanWorkDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENWorkOrder2ENPlanWork inObject) throws PersistenceException
   {
      ENWorkOrder2ENPlanWork obj = new ENWorkOrder2ENPlanWork();
      obj.code = inObject.code;
      loadObject(obj);
     if (inObject.workOrder.code != obj.workOrder.code){
        return false;
     }
     if (inObject.plan.code != obj.plan.code){
        return false;
     }
      return true;
   }

   public int add(ENWorkOrder2ENPlanWork anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENWorkOrder2ENPlanWork anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENWORKORDER2ENPLANWORK (CODE,MODIFY_TIME,WORKORDERCODE,PLANCODE) VALUES (?,?,?,?)";

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
      if (anObject.workOrder.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENWorkOrderDAOGen(connection,getUserProfile()).exists(anObject.workOrder.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENWorkOrder2ENPlanWork.workOrder.code%} = {%"+anObject.workOrder.code+"%}");
        statement.setInt(3,anObject.workOrder.code);
      }
      else
        statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.plan.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.plan.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENWorkOrder2ENPlanWork.plan.code%} = {%"+anObject.plan.code+"%}");
        statement.setInt(4,anObject.plan.code);
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
      throw new PersistenceException("Error in method {%ENWorkOrder2ENPlanWorkDAOGen.add%}",e);
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

   public void save(ENWorkOrder2ENPlanWork anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENWorkOrder2ENPlanWork anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENWorkOrder2ENPlanWork oldObject = new ENWorkOrder2ENPlanWork();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENWorkOrder2ENPlanWork.modify_time_Field + " FROM  ENWORKORDER2ENPLANWORK WHERE CODE = ?";

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
        throw new SystemException(e.getMessage(), e);
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
          if(fieldNameStr.compareTo("WORKORDER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PLAN") == 0)
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
        "UPDATE ENWORKORDER2ENPLANWORK SET   MODIFY_TIME = ? , WORKORDERCODE = ? , PLANCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENWORKORDER2ENPLANWORK SET ";
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
      if (anObject.workOrder.code != Integer.MIN_VALUE)
        statement.setInt(2,anObject.workOrder.code);
      else
        statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.plan.code != Integer.MIN_VALUE)
        statement.setInt(3,anObject.plan.code);
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
            if("WORKORDER".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.workOrder.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.workOrder.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("PLAN".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.plan.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.plan.code);
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

   } // end of save(ENWorkOrder2ENPlanWork anObject,String[] anAttributes)


 public ENWorkOrder2ENPlanWorkShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENWorkOrder2ENPlanWork filterObject = new ENWorkOrder2ENPlanWork();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENWorkOrder2ENPlanWorkShort)list.get(0);
   return null;
  }

  public ENWorkOrder2ENPlanWorkShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENWorkOrder2ENPlanWorkShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENWorkOrder2ENPlanWorkShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENWorkOrder2ENPlanWorkShortList getFilteredList(ENWorkOrder2ENPlanWork filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENWorkOrder2ENPlanWorkShortList getScrollableFilteredList(ENWorkOrder2ENPlanWork aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENWorkOrder2ENPlanWorkShortList getScrollableFilteredList(ENWorkOrder2ENPlanWork aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENWorkOrder2ENPlanWorkShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENWorkOrder2ENPlanWorkShortList getScrollableFilteredList(ENWorkOrder2ENPlanWorkFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENWorkOrder2ENPlanWorkShortList getScrollableFilteredList(ENWorkOrder2ENPlanWorkFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENWorkOrder2ENPlanWorkShortList getScrollableFilteredList(ENWorkOrder2ENPlanWork aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENWorkOrder2ENPlanWorkShortList getScrollableFilteredList(ENWorkOrder2ENPlanWork aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENWorkOrder2ENPlanWorkShortList result = new ENWorkOrder2ENPlanWorkShortList();
    ENWorkOrder2ENPlanWorkShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENWORKORDER2ENPLANWORK.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENWORKORDER2ENPLANWORK.CODE"+

      ", ENWORKORDER.CODE " +
      ", ENWORKORDER.WORKORDERNUMBER " +
      ", ENWORKORDER.DATEGEN " +
      ", ENWORKORDER.FINMOLCODE " +
      ", ENWORKORDER.FINMOLNAME " +
      ", ENWORKORDER.FINMECHANICCODE " +
      ", ENWORKORDER.FINMECHANICNAME " +
      ", ENWORKORDER.USERGEN " +
      ", ENWORKORDER.DATEEDIT " +
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
     " FROM ENWORKORDER2ENPLANWORK " +
     ", ENWORKORDER " +
     ", ENPLANWORK " +
     //" WHERE "
    "";
     whereStr = " ENWORKORDER.CODE = ENWORKORDER2ENPLANWORK.WORKORDERCODE" ; //+
      whereStr = whereStr +" AND ENPLANWORK.CODE = ENWORKORDER2ENPLANWORK.PLANCODE" ; //+
        //selectStr = selectStr + " ${s} ENWORKORDER2ENPLANWORK.CODE IN ( SELECT ENWORKORDER2ENPLANWORK.CODE FROM ENWORKORDER2ENPLANWORK ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDER2ENPLANWORK.CODE = ?";
        }

        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDER2ENPLANWORK.MODIFY_TIME = ?";
        }
        if(aFilterObject.workOrder.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENWORKORDER2ENPLANWORK.WORKORDERCODE = ? ";
        }
        if(aFilterObject.plan.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENWORKORDER2ENPLANWORK.PLANCODE = ? ";
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
       if(aFilterObject.workOrder.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.workOrder.code);
       }
       if(aFilterObject.plan.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.plan.code);
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

        anObject = new ENWorkOrder2ENPlanWorkShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;

        anObject.workOrderCode = set.getInt(2);
        if(set.wasNull())
        anObject.workOrderCode = Integer.MIN_VALUE;
        anObject.workOrderWorkOrderNumber = set.getString(3);
        anObject.workOrderDateGen = set.getDate(4);

        anObject.workOrderFinMolName = set.getString(6);

        anObject.workOrderFinMechanicName = set.getString(8);
        anObject.workOrderUserGen = set.getString(9);
        anObject.workOrderDateEdit = set.getDate(10);
        anObject.planCode = set.getInt(11);
        if(set.wasNull())
        anObject.planCode = Integer.MIN_VALUE;
        anObject.planDateGen = set.getTimestamp(12);
        anObject.planDateStart = set.getDate(13);
        anObject.planDateFinal = set.getDate(14);
        anObject.planYearGen = set.getInt(15);
        if(set.wasNull())
        anObject.planYearGen = Integer.MIN_VALUE;
        anObject.planMonthGen = set.getInt(16);
        if(set.wasNull())
        anObject.planMonthGen = Integer.MIN_VALUE;

        anObject.planUserGen = set.getString(19);
        anObject.planDateEdit = set.getDate(20);
        anObject.planWorkOrderNumber = set.getString(21);
        anObject.planDateWorkOrder = set.getDate(22);
        anObject.planPriConnectionNumber = set.getString(23);


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

  public int[] getFilteredCodeArrayOLD(ENWorkOrder2ENPlanWork aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENWORKORDER2ENPLANWORK.CODE FROM ENWORKORDER2ENPLANWORK";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENWORKORDER2ENPLANWORK.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDER2ENPLANWORK.CODE = ?";
        }
         
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDER2ENPLANWORK.MODIFY_TIME = ?";
        }
        if(aFilterObject.workOrder.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENWORKORDER2ENPLANWORK.WORKORDERCODE = ? ";
        }
        if(aFilterObject.plan.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENWORKORDER2ENPLANWORK.PLANCODE = ? ";
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
       if(aFilterObject.workOrder.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.workOrder.code);
       }
       if(aFilterObject.plan.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.plan.code);
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

  public int[] getFilteredCodeArray(ENWorkOrder2ENPlanWorkFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENWorkOrder2ENPlanWork aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENWORKORDER2ENPLANWORK.CODE FROM ENWORKORDER2ENPLANWORK";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENWORKORDER2ENPLANWORK.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDER2ENPLANWORK.CODE = ?";
        }
         
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDER2ENPLANWORK.MODIFY_TIME = ?";
        }
        if(aFilterObject.workOrder.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENWORKORDER2ENPLANWORK.WORKORDERCODE = ? ";
        }
        if(aFilterObject.plan.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENWORKORDER2ENPLANWORK.PLANCODE = ? ";
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
       if(aFilterObject.workOrder.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.workOrder.code);
       }
       if(aFilterObject.plan.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.plan.code);
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


   public ENWorkOrder2ENPlanWork getObject(int uid) throws PersistenceException
   {
    ENWorkOrder2ENPlanWork result = new ENWorkOrder2ENPlanWork();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENWorkOrder2ENPlanWork anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");


    selectStr =
    "SELECT  ENWORKORDER2ENPLANWORK.CODE, ENWORKORDER2ENPLANWORK.MODIFY_TIME, ENWORKORDER2ENPLANWORK.WORKORDERCODE, ENWORKORDER2ENPLANWORK.PLANCODE "
    +" FROM ENWORKORDER2ENPLANWORK WHERE ENWORKORDER2ENPLANWORK.CODE = ?";

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
        anObject.workOrder.code = set.getInt(3);
        if ( set.wasNull() )
            anObject.workOrder.code = Integer.MIN_VALUE;
        anObject.plan.code = set.getInt(4);
        if ( set.wasNull() )
            anObject.plan.code = Integer.MIN_VALUE;
        if(anObject.workOrder.code != Integer.MIN_VALUE)
        {
           anObject.setWorkOrder(
        new com.ksoe.energynet.dataminer.generated.ENWorkOrderDAOGen(connection,getUserProfile()).getObject(anObject.workOrder.code));
    }
        if(anObject.plan.code != Integer.MIN_VALUE)
        {
           anObject.setPlan(
        new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).getObject(anObject.plan.code));
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


  public com.ksoe.energynet.valueobject.references.ENWorkOrder2ENPlanWorkRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENWorkOrder2ENPlanWorkRef ref = new com.ksoe.energynet.valueobject.references.ENWorkOrder2ENPlanWorkRef();
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

    selectStr = "DELETE FROM  ENWORKORDER2ENPLANWORK WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENWorkOrder2ENPlanWork object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENWorkOrder2ENPlanWork.getObject%} access denied");

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


    selectStr =

    "SELECT  ENWORKORDER2ENPLANWORK.CODE FROM  ENWORKORDER2ENPLANWORK WHERE  ENWORKORDER2ENPLANWORK.CODE = ?";

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
    _checkConditionToken(condition,"code","ENWORKORDER2ENPLANWORK.CODE");
    _checkConditionToken(condition,"modify_time","ENWORKORDER2ENPLANWORK.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"workorder","WORKORDERCODE");
    _checkConditionToken(condition,"workorder.code","WORKORDERCODE");
    _checkConditionToken(condition,"plan","PLANCODE");
    _checkConditionToken(condition,"plan.code","PLANCODE");
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

    private void _collectAutoIncrementFields(ENWorkOrder2ENPlanWork anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENWORKORDER2ENPLANWORK", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENWORKORDER2ENPLANWORK", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENWORKORDER2ENPLANWORK", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENWORKORDER2ENPLANWORK");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENWorkOrder2ENPlanWorkDAO
