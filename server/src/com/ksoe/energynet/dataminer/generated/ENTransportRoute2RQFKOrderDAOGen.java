
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
import com.ksoe.energynet.valueobject.ENTransportRoute2RQFKOrder;
import com.ksoe.energynet.valueobject.brief.ENTransportRoute2RQFKOrderShort;
import com.ksoe.energynet.valueobject.filter.ENTransportRoute2RQFKOrderFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportRoute2RQFKOrderShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;

/**
 * DAO Object for ENTransportRoute2RQFKOrder;
 *
 */

public class ENTransportRoute2RQFKOrderDAOGen extends GenericDataMiner {

  public ENTransportRoute2RQFKOrderDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTransportRoute2RQFKOrderDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENTransportRoute2RQFKOrder inObject) throws PersistenceException
   {
      ENTransportRoute2RQFKOrder obj = new ENTransportRoute2RQFKOrder();
      obj.code = inObject.code;
      loadObject(obj);
     if (inObject.fkOrderRef.code != obj.fkOrderRef.code){
        return false;
     }
     if (inObject.transportRouteRef.code != obj.transportRouteRef.code){
        return false;
     }
      return true;
   }

   public int add(ENTransportRoute2RQFKOrder anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENTransportRoute2RQFKOrder anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENTRANSPORTROT2RQFKRDR (CODE,FKORDERREFCODE,TRANSPORTROUTEREFCODE) VALUES (?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.fkOrderRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.rqorder.dataminer.generated.RQFKOrderDAOGen(connection,getUserProfile()).exists(anObject.fkOrderRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.rqorder.valueobject.ENTransportRoute2RQFKOrder.fkOrderRef.code%} = {%"+anObject.fkOrderRef.code+"%}");
        statement.setInt(2,anObject.fkOrderRef.code);
      }
      else
        statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.transportRouteRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTransportRouteDAOGen(connection,getUserProfile()).exists(anObject.transportRouteRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTransportRoute2RQFKOrder.transportRouteRef.code%} = {%"+anObject.transportRouteRef.code+"%}");
        statement.setInt(3,anObject.transportRouteRef.code);
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
      throw new PersistenceException("Error in method {%ENTransportRoute2RQFKOrderDAOGen.add%}",e);
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

   public void save(ENTransportRoute2RQFKOrder anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENTransportRoute2RQFKOrder anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("FKORDERREF") == 0)
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
        "UPDATE ENTRANSPORTROT2RQFKRDR SET FKORDERREFCODE = ? , TRANSPORTROUTEREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENTRANSPORTROUTE2RQFKORDER SET ";
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
      if (anObject.fkOrderRef.code != Integer.MIN_VALUE)
        statement.setInt(1,anObject.fkOrderRef.code);
      else
        statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.transportRouteRef.code != Integer.MIN_VALUE)
        statement.setInt(2,anObject.transportRouteRef.code);
      else
        statement.setNull(2,java.sql.Types.INTEGER);
          statement.setInt(3,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("FKORDERREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.fkOrderRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.fkOrderRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
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

   } // end of save(ENTransportRoute2RQFKOrder anObject,String[] anAttributes)


 public ENTransportRoute2RQFKOrderShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENTransportRoute2RQFKOrder filterObject = new ENTransportRoute2RQFKOrder();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENTransportRoute2RQFKOrderShort)list.get(0);
   return null;
  }

  public ENTransportRoute2RQFKOrderShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENTransportRoute2RQFKOrderShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENTransportRoute2RQFKOrderShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENTransportRoute2RQFKOrderShortList getFilteredList(ENTransportRoute2RQFKOrder filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENTransportRoute2RQFKOrderShortList getScrollableFilteredList(ENTransportRoute2RQFKOrder aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENTransportRoute2RQFKOrderShortList getScrollableFilteredList(ENTransportRoute2RQFKOrder aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENTransportRoute2RQFKOrderShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENTransportRoute2RQFKOrderShortList getScrollableFilteredList(ENTransportRoute2RQFKOrderFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENTransportRoute2RQFKOrderShortList getScrollableFilteredList(ENTransportRoute2RQFKOrderFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENTransportRoute2RQFKOrderShortList getScrollableFilteredList(ENTransportRoute2RQFKOrder aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENTransportRoute2RQFKOrderShortList getScrollableFilteredList(ENTransportRoute2RQFKOrder aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENTransportRoute2RQFKOrderShortList result = new ENTransportRoute2RQFKOrderShortList();
    ENTransportRoute2RQFKOrderShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRANSPORTROT2RQFKRDR.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENTRANSPORTROT2RQFKRDR.CODE"+

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
     " FROM ENTRANSPORTROT2RQFKRDR " +
     ", RQFKORDER " +
     ", ENTRANSPORTROUTE " +
     //" WHERE "
    "";
     whereStr = " RQFKORDER.CODE = ENTRANSPORTROT2RQFKRDR.FKORDERREFCODE" ; //+
      whereStr = whereStr +" AND ENTRANSPORTROUTE.CODE = ENTRANSPORTROT2RQFKRDR.TRANSPORTROUTEREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENTRANSPORTROT2RQFKRDR.CODE IN ( SELECT ENTRANSPORTROT2RQFKRDR.CODE FROM ENTRANSPORTROT2RQFKRDR ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROT2RQFKRDR.CODE = ?";
        }
        if(aFilterObject.fkOrderRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPORTROT2RQFKRDR.FKORDERREFCODE = ? ";
        }
        if(aFilterObject.transportRouteRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPORTROT2RQFKRDR.TRANSPORTROUTEREFCODE = ? ";
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
       if(aFilterObject.fkOrderRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fkOrderRef.code);
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

        anObject = new ENTransportRoute2RQFKOrderShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;

        anObject.fkOrderRefCode = set.getInt(2);
        if(set.wasNull())
        anObject.fkOrderRefCode = Integer.MIN_VALUE;
        anObject.fkOrderRefNumberDoc = set.getString(3);
        anObject.fkOrderRefDateGen = set.getDate(4);
        anObject.fkOrderRefDateShipment = set.getDate(5);
        anObject.fkOrderRefMolOutCode = set.getString(6);
        anObject.fkOrderRefMolOutName = set.getString(7);
        anObject.fkOrderRefMolInCode = set.getString(8);
        anObject.fkOrderRefMolInName = set.getString(9);
        anObject.fkOrderRefExpeditorCode = set.getString(10);
        anObject.fkOrderRefExpeditorName = set.getString(11);
        anObject.fkOrderRefWarrantNumber = set.getString(12);
        anObject.fkOrderRefWarrantDate = set.getDate(13);
        anObject.fkOrderRefWarrantFIO = set.getString(14);
        anObject.fkOrderRefSumWithoutNds = set.getBigDecimal(15);
        if(anObject.fkOrderRefSumWithoutNds != null)
          anObject.fkOrderRefSumWithoutNds = anObject.fkOrderRefSumWithoutNds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fkOrderRefSumNds = set.getBigDecimal(16);
        if(anObject.fkOrderRefSumNds != null)
          anObject.fkOrderRefSumNds = anObject.fkOrderRefSumNds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fkOrderRefNdsPercent = set.getInt(17);
        if(set.wasNull())
        anObject.fkOrderRefNdsPercent = Integer.MIN_VALUE;
        anObject.fkOrderRefDateAdd = set.getTimestamp(18);
        anObject.fkOrderRefUserAdd = set.getString(19);
        anObject.fkOrderRefDateEdit = set.getTimestamp(20);
        anObject.fkOrderRefUserGen = set.getString(21);
        anObject.transportRouteRefCode = set.getInt(22);
        if(set.wasNull())
        anObject.transportRouteRefCode = Integer.MIN_VALUE;
        anObject.transportRouteRefDistance = set.getBigDecimal(23);
        if(anObject.transportRouteRefDistance != null)
          anObject.transportRouteRefDistance = anObject.transportRouteRefDistance.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.transportRouteRefWeight = set.getBigDecimal(24);
        if(anObject.transportRouteRefWeight != null)
          anObject.transportRouteRefWeight = anObject.transportRouteRefWeight.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.transportRouteRefDateEdit = set.getTimestamp(30);
        anObject.transportRouteRefUserGen = set.getString(31);

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

  public int[] getFilteredCodeArrayOLD(ENTransportRoute2RQFKOrder aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRANSPORTROT2RQFKRDR.CODE FROM ENTRANSPORTROT2RQFKRDR";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRANSPORTROT2RQFKRDR.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROT2RQFKRDR.CODE = ?";
        }
        if(aFilterObject.fkOrderRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTROT2RQFKRDR.FKORDERREFCODE = ? ";
        }
        if(aFilterObject.transportRouteRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTROT2RQFKRDR.TRANSPORTROUTEREFCODE = ? ";
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
       if(aFilterObject.fkOrderRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fkOrderRef.code);
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

  public int[] getFilteredCodeArray(ENTransportRoute2RQFKOrderFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENTransportRoute2RQFKOrder aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRANSPORTROT2RQFKRDR.CODE FROM ENTRANSPORTROT2RQFKRDR";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRANSPORTROT2RQFKRDR.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTROT2RQFKRDR.CODE = ?";
        }
        if(aFilterObject.fkOrderRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTROT2RQFKRDR.FKORDERREFCODE = ? ";
        }
        if(aFilterObject.transportRouteRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTROT2RQFKRDR.TRANSPORTROUTEREFCODE = ? ";
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
       if(aFilterObject.fkOrderRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fkOrderRef.code);
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


   public ENTransportRoute2RQFKOrder getObject(int uid) throws PersistenceException
   {
    ENTransportRoute2RQFKOrder result = new ENTransportRoute2RQFKOrder();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENTransportRoute2RQFKOrder anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENTRANSPORTROT2RQFKRDR.CODE, ENTRANSPORTROT2RQFKRDR.FKORDERREFCODE, ENTRANSPORTROT2RQFKRDR.TRANSPORTROUTEREFCODE "
    +" FROM ENTRANSPORTROT2RQFKRDR WHERE ENTRANSPORTROT2RQFKRDR.CODE = ?";

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
        anObject.fkOrderRef.code = set.getInt(2);
        if ( set.wasNull() )
            anObject.fkOrderRef.code = Integer.MIN_VALUE;
        anObject.transportRouteRef.code = set.getInt(3);
        if ( set.wasNull() )
            anObject.transportRouteRef.code = Integer.MIN_VALUE;
        if(anObject.fkOrderRef.code != Integer.MIN_VALUE)
        {
           anObject.setFkOrderRef(
        new com.ksoe.rqorder.dataminer.generated.RQFKOrderDAOGen(connection,getUserProfile()).getRef(anObject.fkOrderRef.code));
    }
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


  public com.ksoe.energynet.valueobject.references.ENTransportRoute2RQFKOrderRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENTransportRoute2RQFKOrderRef ref = new com.ksoe.energynet.valueobject.references.ENTransportRoute2RQFKOrderRef();
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

    selectStr = "DELETE FROM  ENTRANSPORTROT2RQFKRDR WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENTransportRoute2RQFKOrder object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENTransportRoute2RQFKOrder.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENTransportRoute2RQFKOrder.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENTransportRoute2RQFKOrder.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTransportRoute2RQFKOrder.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENTransportRoute2RQFKOrder.getObject%} access denied");

    selectStr =

    "SELECT  ENTRANSPORTROT2RQFKRDR.CODE FROM  ENTRANSPORTROT2RQFKRDR WHERE  ENTRANSPORTROT2RQFKRDR.CODE = ?";
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
    _checkConditionToken(condition,"code","ENTRANSPORTROT2RQFKRDR.CODE");
      // relationship conditions
    _checkConditionToken(condition,"fkorderref","FKORDERREFCODE");
    _checkConditionToken(condition,"fkorderref.code","FKORDERREFCODE");
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
    catch (NamingException e) {throw new SystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.ENERGYNET_DATASOURCE+"%}",e);}
    catch (SQLException e)    {throw new SystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.ENERGYNET_DATASOURCE+"%}",e);}
   }

    ///////////// PRIVATE SECTION ///////////////
    protected static Hashtable _sequenceTable = new Hashtable();

    private void _collectAutoIncrementFields(ENTransportRoute2RQFKOrder anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENTRANSPORTROT2RQFKRDR", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENTRANSPORTROT2RQFKRDR", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENTRANSPORTROT2RQFKRDR", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENTRANSPORTROT2RQFKRDR");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENTransportRoute2RQFKOrderDAO
