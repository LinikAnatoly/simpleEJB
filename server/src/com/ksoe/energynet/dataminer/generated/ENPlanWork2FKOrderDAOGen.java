
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
import com.ksoe.energynet.valueobject.ENPlanWork2FKOrder;
import com.ksoe.energynet.valueobject.brief.ENPlanWork2FKOrderShort;
import com.ksoe.energynet.valueobject.filter.ENPlanWork2FKOrderFilter;
import com.ksoe.energynet.valueobject.lists.ENPlanWork2FKOrderShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;

/**
 * DAO Object for ENPlanWork2FKOrder;
 *
 */

public class ENPlanWork2FKOrderDAOGen extends GenericDataMiner {

  public ENPlanWork2FKOrderDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENPlanWork2FKOrderDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENPlanWork2FKOrder inObject) throws PersistenceException
   {
      ENPlanWork2FKOrder obj = new ENPlanWork2FKOrder();
      obj.code = inObject.code;
      loadObject(obj);
     if (inObject.planRef.code != obj.planRef.code){
        return false;
     }
     if (inObject.fkOrderRef.code != obj.fkOrderRef.code){
        return false;
     }
      return true;
   }

   public int add(ENPlanWork2FKOrder anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENPlanWork2FKOrder anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENPLANWORK2FKORDER (CODE,MODIFY_TIME,PLANREFCODE,FKORDERREFCODE) VALUES (?,?,?,?)";

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
      if (anObject.planRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPlanWork2FKOrder.planRef.code%} = {%"+anObject.planRef.code+"%}");
        statement.setInt(3,anObject.planRef.code);
      }
      else
        statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.fkOrderRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.rqorder.dataminer.generated.RQFKOrderDAOGen(connection,getUserProfile()).exists(anObject.fkOrderRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.rqorder.valueobject.ENPlanWork2FKOrder.fkOrderRef.code%} = {%"+anObject.fkOrderRef.code+"%}");
        statement.setInt(4,anObject.fkOrderRef.code);
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
      throw new PersistenceException("Error in method {%ENPlanWork2FKOrderDAOGen.add%}",e);
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

   public void save(ENPlanWork2FKOrder anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENPlanWork2FKOrder anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENPlanWork2FKOrder oldObject = new ENPlanWork2FKOrder();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENPlanWork2FKOrder.modify_time_Field+" FROM  ENPLANWORK2FKORDER WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("PLANREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FKORDERREF") == 0)
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
        "UPDATE ENPLANWORK2FKORDER SET  MODIFY_TIME = ? , PLANREFCODE = ? , FKORDERREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENPLANWORK2FKORDER SET ";
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
      if (anObject.planRef.code != Integer.MIN_VALUE)
        statement.setInt(2,anObject.planRef.code);
      else
        statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.fkOrderRef.code != Integer.MIN_VALUE)
        statement.setInt(3,anObject.fkOrderRef.code);
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
            if("PLANREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.planRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.planRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("FKORDERREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.fkOrderRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.fkOrderRef.code);
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

   } // end of save(ENPlanWork2FKOrder anObject,String[] anAttributes)


 public ENPlanWork2FKOrderShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENPlanWork2FKOrder filterObject = new ENPlanWork2FKOrder();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENPlanWork2FKOrderShort)list.get(0);
   return null;
  }

  public ENPlanWork2FKOrderShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENPlanWork2FKOrderShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENPlanWork2FKOrderShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENPlanWork2FKOrderShortList getFilteredList(ENPlanWork2FKOrder filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENPlanWork2FKOrderShortList getScrollableFilteredList(ENPlanWork2FKOrder aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENPlanWork2FKOrderShortList getScrollableFilteredList(ENPlanWork2FKOrder aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENPlanWork2FKOrderShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENPlanWork2FKOrderShortList getScrollableFilteredList(ENPlanWork2FKOrderFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENPlanWork2FKOrderShortList getScrollableFilteredList(ENPlanWork2FKOrderFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENPlanWork2FKOrderShortList getScrollableFilteredList(ENPlanWork2FKOrder aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENPlanWork2FKOrderShortList getScrollableFilteredList(ENPlanWork2FKOrder aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENPlanWork2FKOrderShortList result = new ENPlanWork2FKOrderShortList();
    ENPlanWork2FKOrderShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENPLANWORK2FKORDER.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENPLANWORK2FKORDER.CODE"+

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
      ", RQFKORDER.CODE " +
      ", RQFKORDER.NUMBERDOC " +
      ", RQFKORDER.DATEGEN " +
      ", RQFKORDER.DATESHIPMENT " +
      ", RQFKORDER.MOLOUTCODE " +
      ", RQFKORDER.MOLOUTNAME " +
      ", RQFKORDER.MOLINCODE " +
      ", RQFKORDER.MOLINNAME " +
      ", RQFKORDER.EXPEDITORCODE " +
      ", RQFKORDER.EXPEDITORNAME " +
      ", RQFKORDER.WARRANTNUMBER " +
      ", RQFKORDER.WARRANTDATE " +
      ", RQFKORDER.WARRANTFIO " +
      ", RQFKORDER.SUMWITHOUTNDS " +
      ", RQFKORDER.SUMNDS " +
      ", RQFKORDER.NDSPERCENT " +
      ", RQFKORDER.DATEADD " +
      ", RQFKORDER.USERADD " +
      ", RQFKORDER.DATEEDIT " +
      ", RQFKORDER.USERGEN " +
     " FROM ENPLANWORK2FKORDER " +
     ", ENPLANWORK " +
     ", RQFKORDER " +
     //" WHERE "
    "";
     whereStr = " ENPLANWORK.CODE = ENPLANWORK2FKORDER.PLANREFCODE" ; //+
      whereStr = whereStr +" AND RQFKORDER.CODE = ENPLANWORK2FKORDER.FKORDERREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENPLANWORK2FKORDER.CODE IN ( SELECT ENPLANWORK2FKORDER.CODE FROM ENPLANWORK2FKORDER ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK2FKORDER.CODE = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK2FKORDER.MODIFY_TIME = ?";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENPLANWORK2FKORDER.PLANREFCODE = ? ";
        }
        if(aFilterObject.fkOrderRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENPLANWORK2FKORDER.FKORDERREFCODE = ? ";
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
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
       }
       if(aFilterObject.fkOrderRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fkOrderRef.code);
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

        anObject = new ENPlanWork2FKOrderShort();

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

        anObject.fkOrderRefCode = set.getInt(22);
        if(set.wasNull())
        anObject.fkOrderRefCode = Integer.MIN_VALUE;
        anObject.fkOrderRefNumberDoc = set.getString(23);
        anObject.fkOrderRefDateGen = set.getDate(24);
        anObject.fkOrderRefDateShipment = set.getDate(25);
        anObject.fkOrderRefMolOutCode = set.getString(26);
        anObject.fkOrderRefMolOutName = set.getString(27);
        anObject.fkOrderRefMolInCode = set.getString(28);
        anObject.fkOrderRefMolInName = set.getString(29);
        anObject.fkOrderRefExpeditorCode = set.getString(30);
        anObject.fkOrderRefExpeditorName = set.getString(31);
        anObject.fkOrderRefWarrantNumber = set.getString(32);
        anObject.fkOrderRefWarrantDate = set.getDate(33);
        anObject.fkOrderRefWarrantFIO = set.getString(34);
        anObject.fkOrderRefSumWithoutNds = set.getBigDecimal(35);
        if(anObject.fkOrderRefSumWithoutNds != null)
          anObject.fkOrderRefSumWithoutNds = anObject.fkOrderRefSumWithoutNds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fkOrderRefSumNds = set.getBigDecimal(36);
        if(anObject.fkOrderRefSumNds != null)
          anObject.fkOrderRefSumNds = anObject.fkOrderRefSumNds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fkOrderRefNdsPercent = set.getInt(37);
        if(set.wasNull())
        anObject.fkOrderRefNdsPercent = Integer.MIN_VALUE;
        anObject.fkOrderRefDateAdd = set.getTimestamp(38);
        anObject.fkOrderRefUserAdd = set.getString(39);
        anObject.fkOrderRefDateEdit = set.getTimestamp(40);
        anObject.fkOrderRefUserGen = set.getString(41);

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

  public int[] getFilteredCodeArrayOLD(ENPlanWork2FKOrder aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENPLANWORK2FKORDER.CODE FROM ENPLANWORK2FKORDER";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENPLANWORK2FKORDER.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK2FKORDER.CODE = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK2FKORDER.MODIFY_TIME = ?";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANWORK2FKORDER.PLANREFCODE = ? ";
        }
        if(aFilterObject.fkOrderRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANWORK2FKORDER.FKORDERREFCODE = ? ";
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
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
       }
       if(aFilterObject.fkOrderRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fkOrderRef.code);
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

  public int[] getFilteredCodeArray(ENPlanWork2FKOrderFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENPlanWork2FKOrder aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENPLANWORK2FKORDER.CODE FROM ENPLANWORK2FKORDER";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENPLANWORK2FKORDER.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK2FKORDER.CODE = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENPLANWORK2FKORDER.MODIFY_TIME = ?";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANWORK2FKORDER.PLANREFCODE = ? ";
        }
        if(aFilterObject.fkOrderRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENPLANWORK2FKORDER.FKORDERREFCODE = ? ";
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
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
       }
       if(aFilterObject.fkOrderRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fkOrderRef.code);
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


   public ENPlanWork2FKOrder getObject(int uid) throws PersistenceException
   {
    ENPlanWork2FKOrder result = new ENPlanWork2FKOrder();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENPlanWork2FKOrder anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENPLANWORK2FKORDER.CODE, ENPLANWORK2FKORDER.MODIFY_TIME, ENPLANWORK2FKORDER.PLANREFCODE, ENPLANWORK2FKORDER.FKORDERREFCODE "
    +" FROM ENPLANWORK2FKORDER WHERE ENPLANWORK2FKORDER.CODE = ?";

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
        anObject.planRef.code = set.getInt(3);
        if ( set.wasNull() )
            anObject.planRef.code = Integer.MIN_VALUE;
        anObject.fkOrderRef.code = set.getInt(4);
        if ( set.wasNull() )
            anObject.fkOrderRef.code = Integer.MIN_VALUE;
        if(anObject.planRef.code != Integer.MIN_VALUE)
        {
           anObject.setPlanRef(
        new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).getRef(anObject.planRef.code));
    }
        if(anObject.fkOrderRef.code != Integer.MIN_VALUE)
        {
           anObject.setFkOrderRef(
        new com.ksoe.rqorder.dataminer.generated.RQFKOrderDAOGen(connection,getUserProfile()).getRef(anObject.fkOrderRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENPlanWork2FKOrderRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENPlanWork2FKOrderRef ref = new com.ksoe.energynet.valueobject.references.ENPlanWork2FKOrderRef();
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

    selectStr = "DELETE FROM  ENPLANWORK2FKORDER WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENPlanWork2FKOrder object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENPlanWork2FKOrder.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENPlanWork2FKOrder.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENPlanWork2FKOrder.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPlanWork2FKOrder.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENPlanWork2FKOrder.getObject%} access denied");

    selectStr =

    "SELECT  ENPLANWORK2FKORDER.CODE FROM  ENPLANWORK2FKORDER WHERE  ENPLANWORK2FKORDER.CODE = ?";
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
    _checkConditionToken(condition,"code","ENPLANWORK2FKORDER.CODE");
    _checkConditionToken(condition,"modify_time","ENPLANWORK2FKORDER.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"planref","PLANREFCODE");
    _checkConditionToken(condition,"planref.code","PLANREFCODE");
    _checkConditionToken(condition,"fkorderref","FKORDERREFCODE");
    _checkConditionToken(condition,"fkorderref.code","FKORDERREFCODE");
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

    private void _collectAutoIncrementFields(ENPlanWork2FKOrder anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENPLANWORK2FKORDER", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENPLANWORK2FKORDER", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENPLANWORK2FKORDER", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENPLANWORK2FKORDER");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENPlanWork2FKOrderDAO
