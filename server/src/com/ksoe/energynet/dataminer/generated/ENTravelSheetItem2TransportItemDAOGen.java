
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
import com.ksoe.energynet.valueobject.ENTravelSheetItem2TransportItem;
import com.ksoe.energynet.valueobject.brief.ENTravelSheetItem2TransportItemShort;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItem2TransportItemFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItem2TransportItemShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENTravelSheetItem2TransportItem;
 *
 */

public class ENTravelSheetItem2TransportItemDAOGen extends GenericDataMiner {

  public ENTravelSheetItem2TransportItemDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTravelSheetItem2TransportItemDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENTravelSheetItem2TransportItem inObject) throws PersistenceException
   {
      ENTravelSheetItem2TransportItem obj = new ENTravelSheetItem2TransportItem();
      obj.code = inObject.code;
      loadObject(obj);
     if (inObject.travelSheetItemRef.code != obj.travelSheetItemRef.code){
        return false;
     }
     if (inObject.transportItemRef.code != obj.transportItemRef.code){
        return false;
     }
      return true;
   }

   public int add(ENTravelSheetItem2TransportItem anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENTravelSheetItem2TransportItem anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENTRAVLSHTTM2TRNSPRTTM (CODE,MODIFY_TIME,TRAVELSHEETITEMREFCODE,TRANSPORTITEMREFCODE) VALUES (?,?,?,?)";

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
      if (anObject.travelSheetItemRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTravelSheetItemDAOGen(connection,getUserProfile()).exists(anObject.travelSheetItemRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTravelSheetItem2TransportItem.travelSheetItemRef.code%} = {%"+anObject.travelSheetItemRef.code+"%}");
        statement.setInt(3,anObject.travelSheetItemRef.code);
      }
      else
        statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.transportItemRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTransportItemDAOGen(connection,getUserProfile()).exists(anObject.transportItemRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTravelSheetItem2TransportItem.transportItemRef.code%} = {%"+anObject.transportItemRef.code+"%}");
        statement.setInt(4,anObject.transportItemRef.code);
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
      throw new PersistenceException("Error in method {%ENTravelSheetItem2TransportItemDAOGen.add%}",e);
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

   public void save(ENTravelSheetItem2TransportItem anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENTravelSheetItem2TransportItem anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENTravelSheetItem2TransportItem oldObject = new ENTravelSheetItem2TransportItem();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENTravelSheetItem2TransportItem.modify_time_Field+" FROM  ENTRAVLSHTTM2TRNSPRTTM WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("TRAVELSHEETITEMREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TRANSPORTITEMREF") == 0)
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
        "UPDATE ENTRAVLSHTTM2TRNSPRTTM SET  MODIFY_TIME = ? , TRAVELSHEETITEMREFCODE = ? , TRANSPORTITEMREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENTRAVELSHEETITEM2TRANSPORTITEM SET ";
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
      if (anObject.travelSheetItemRef.code != Integer.MIN_VALUE)
        statement.setInt(2,anObject.travelSheetItemRef.code);
      else
        statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.transportItemRef.code != Integer.MIN_VALUE)
        statement.setInt(3,anObject.transportItemRef.code);
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
            if("TRAVELSHEETITEMREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.travelSheetItemRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.travelSheetItemRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("TRANSPORTITEMREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.transportItemRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.transportItemRef.code);
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

   } // end of save(ENTravelSheetItem2TransportItem anObject,String[] anAttributes)


 public ENTravelSheetItem2TransportItemShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENTravelSheetItem2TransportItem filterObject = new ENTravelSheetItem2TransportItem();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENTravelSheetItem2TransportItemShort)list.get(0);
   return null;
  }

  public ENTravelSheetItem2TransportItemShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENTravelSheetItem2TransportItemShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENTravelSheetItem2TransportItemShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENTravelSheetItem2TransportItemShortList getFilteredList(ENTravelSheetItem2TransportItem filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENTravelSheetItem2TransportItemShortList getScrollableFilteredList(ENTravelSheetItem2TransportItem aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENTravelSheetItem2TransportItemShortList getScrollableFilteredList(ENTravelSheetItem2TransportItem aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENTravelSheetItem2TransportItemShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENTravelSheetItem2TransportItemShortList getScrollableFilteredList(ENTravelSheetItem2TransportItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENTravelSheetItem2TransportItemShortList getScrollableFilteredList(ENTravelSheetItem2TransportItemFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENTravelSheetItem2TransportItemShortList getScrollableFilteredList(ENTravelSheetItem2TransportItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENTravelSheetItem2TransportItemShortList getScrollableFilteredList(ENTravelSheetItem2TransportItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENTravelSheetItem2TransportItemShortList result = new ENTravelSheetItem2TransportItemShortList();
    ENTravelSheetItem2TransportItemShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRAVLSHTTM2TRNSPRTTM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENTRAVLSHTTM2TRNSPRTTM.CODE"+

      ", ENTRAVELSHEETITEM.CODE " +
      ", ENTRAVELSHEETITEM.TRAVELFROM " +
      ", ENTRAVELSHEETITEM.TRAVELTO " +
      ", ENTRAVELSHEETITEM.TIMESTART " +
      ", ENTRAVELSHEETITEM.TIMEFINAL " +
      ", ENTRAVELSHEETITEM.SPEEDOMETERSTART " +
      ", ENTRAVELSHEETITEM.SPEEDOMETERFINAL " +
      ", ENTRAVELSHEETITEM.FUELCOUNTERSTART " +
      ", ENTRAVELSHEETITEM.FUELCOUNTERFINAL " +
      ", ENTRAVELSHEETITEM.SUMDISTANCES " +
      ", ENTRAVELSHEETITEM.SUMMACHINEHOURS " +
      ", ENTRAVELSHEETITEM.HEATINGTIME " +
      ", ENTRAVELSHEETITEM.DATEEDIT " +
      ", ENTRAVELSHEETITEM.USERGEN " +
      ", ENTRANSPORTITEM.CODE " +
      ", ENTRANSPORTITEM.COUNTWORKGEN " +
      ", ENTRANSPORTITEM.COUNTWORKFACT " +
      ", ENTRANSPORTITEM.PRICE " +
      ", ENTRANSPORTITEM.COST " +
      ", ENTRANSPORTITEM.USERGEN " +
      ", ENTRANSPORTITEM.DATEEDIT " +
      ", ENTRANSPORTITEM.DISTANCENORM " +
      ", ENTRANSPORTITEM.AMOUNTOFJOURNEYS " +
     " FROM ENTRAVLSHTTM2TRNSPRTTM " +
     ", ENTRAVELSHEETITEM " +
     ", ENTRANSPORTITEM " +
     //" WHERE "
    "";
     whereStr = " ENTRAVELSHEETITEM.CODE = ENTRAVLSHTTM2TRNSPRTTM.TRAVELSHEETITEMREFCODE" ; //+
      whereStr = whereStr +" AND ENTRANSPORTITEM.CODE = ENTRAVLSHTTM2TRNSPRTTM.TRANSPORTITEMREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENTRAVLSHTTM2TRNSPRTTM.CODE IN ( SELECT ENTRAVLSHTTM2TRNSPRTTM.CODE FROM ENTRAVLSHTTM2TRNSPRTTM ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVLSHTTM2TRNSPRTTM.CODE = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVLSHTTM2TRNSPRTTM.MODIFY_TIME = ?";
        }
        if(aFilterObject.travelSheetItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRAVLSHTTM2TRNSPRTTM.TRAVELSHEETITEMREFCODE = ? ";
        }
        if(aFilterObject.transportItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRAVLSHTTM2TRNSPRTTM.TRANSPORTITEMREFCODE = ? ";
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
       if(aFilterObject.travelSheetItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.travelSheetItemRef.code);
       }
       if(aFilterObject.transportItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportItemRef.code);
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

        anObject = new ENTravelSheetItem2TransportItemShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;

        anObject.travelSheetItemRefCode = set.getInt(2);
        if(set.wasNull())
        anObject.travelSheetItemRefCode = Integer.MIN_VALUE;
        anObject.travelSheetItemRefTravelFrom = set.getString(3);
        anObject.travelSheetItemRefTravelTo = set.getString(4);
        anObject.travelSheetItemRefTimeStart = set.getTimestamp(5);
        anObject.travelSheetItemRefTimeFinal = set.getTimestamp(6);
        anObject.travelSheetItemRefSpeedometerStart = set.getBigDecimal(7);
        if(anObject.travelSheetItemRefSpeedometerStart != null)
          anObject.travelSheetItemRefSpeedometerStart = anObject.travelSheetItemRefSpeedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.travelSheetItemRefSpeedometerFinal = set.getBigDecimal(8);
        if(anObject.travelSheetItemRefSpeedometerFinal != null)
          anObject.travelSheetItemRefSpeedometerFinal = anObject.travelSheetItemRefSpeedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.travelSheetItemRefSumDistances = set.getBigDecimal(11);
        if(anObject.travelSheetItemRefSumDistances != null)
          anObject.travelSheetItemRefSumDistances = anObject.travelSheetItemRefSumDistances.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.travelSheetItemRefSumMachineHours = set.getBigDecimal(12);
        if(anObject.travelSheetItemRefSumMachineHours != null)
          anObject.travelSheetItemRefSumMachineHours = anObject.travelSheetItemRefSumMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.travelSheetItemRefDateEdit = set.getTimestamp(14);
        anObject.travelSheetItemRefUserGen = set.getString(15);
        anObject.transportItemRefCode = set.getInt(16);
        if(set.wasNull())
        anObject.transportItemRefCode = Integer.MIN_VALUE;
        anObject.transportItemRefCountWorkGen = set.getBigDecimal(17);
        if(anObject.transportItemRefCountWorkGen != null)
          anObject.transportItemRefCountWorkGen = anObject.transportItemRefCountWorkGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.transportItemRefCountWorkFact = set.getBigDecimal(18);
        if(anObject.transportItemRefCountWorkFact != null)
          anObject.transportItemRefCountWorkFact = anObject.transportItemRefCountWorkFact.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.transportItemRefPrice = set.getBigDecimal(19);
        if(anObject.transportItemRefPrice != null)
          anObject.transportItemRefPrice = anObject.transportItemRefPrice.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.transportItemRefCost = set.getBigDecimal(20);
        if(anObject.transportItemRefCost != null)
          anObject.transportItemRefCost = anObject.transportItemRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.transportItemRefUserGen = set.getString(21);
        anObject.transportItemRefDateEdit = set.getDate(22);


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

  public int[] getFilteredCodeArrayOLD(ENTravelSheetItem2TransportItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRAVLSHTTM2TRNSPRTTM.CODE FROM ENTRAVLSHTTM2TRNSPRTTM";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRAVLSHTTM2TRNSPRTTM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVLSHTTM2TRNSPRTTM.CODE = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVLSHTTM2TRNSPRTTM.MODIFY_TIME = ?";
        }
        if(aFilterObject.travelSheetItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVLSHTTM2TRNSPRTTM.TRAVELSHEETITEMREFCODE = ? ";
        }
        if(aFilterObject.transportItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVLSHTTM2TRNSPRTTM.TRANSPORTITEMREFCODE = ? ";
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
       if(aFilterObject.travelSheetItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.travelSheetItemRef.code);
       }
       if(aFilterObject.transportItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportItemRef.code);
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

  public int[] getFilteredCodeArray(ENTravelSheetItem2TransportItemFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENTravelSheetItem2TransportItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRAVLSHTTM2TRNSPRTTM.CODE FROM ENTRAVLSHTTM2TRNSPRTTM";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRAVLSHTTM2TRNSPRTTM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVLSHTTM2TRNSPRTTM.CODE = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVLSHTTM2TRNSPRTTM.MODIFY_TIME = ?";
        }
        if(aFilterObject.travelSheetItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVLSHTTM2TRNSPRTTM.TRAVELSHEETITEMREFCODE = ? ";
        }
        if(aFilterObject.transportItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVLSHTTM2TRNSPRTTM.TRANSPORTITEMREFCODE = ? ";
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
       if(aFilterObject.travelSheetItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.travelSheetItemRef.code);
       }
       if(aFilterObject.transportItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportItemRef.code);
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


   public ENTravelSheetItem2TransportItem getObject(int uid) throws PersistenceException
   {
    ENTravelSheetItem2TransportItem result = new ENTravelSheetItem2TransportItem();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENTravelSheetItem2TransportItem anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENTRAVLSHTTM2TRNSPRTTM.CODE, ENTRAVLSHTTM2TRNSPRTTM.MODIFY_TIME, ENTRAVLSHTTM2TRNSPRTTM.TRAVELSHEETITEMREFCODE, ENTRAVLSHTTM2TRNSPRTTM.TRANSPORTITEMREFCODE "
    +" FROM ENTRAVLSHTTM2TRNSPRTTM WHERE ENTRAVLSHTTM2TRNSPRTTM.CODE = ?";

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
        anObject.travelSheetItemRef.code = set.getInt(3);
        if ( set.wasNull() )
            anObject.travelSheetItemRef.code = Integer.MIN_VALUE;
        anObject.transportItemRef.code = set.getInt(4);
        if ( set.wasNull() )
            anObject.transportItemRef.code = Integer.MIN_VALUE;
        if(anObject.travelSheetItemRef.code != Integer.MIN_VALUE)
        {
           anObject.setTravelSheetItemRef(
        new com.ksoe.energynet.dataminer.generated.ENTravelSheetItemDAOGen(connection,getUserProfile()).getRef(anObject.travelSheetItemRef.code));
    }
        if(anObject.transportItemRef.code != Integer.MIN_VALUE)
        {
           anObject.setTransportItemRef(
        new com.ksoe.energynet.dataminer.generated.ENTransportItemDAOGen(connection,getUserProfile()).getRef(anObject.transportItemRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENTravelSheetItem2TransportItemRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENTravelSheetItem2TransportItemRef ref = new com.ksoe.energynet.valueobject.references.ENTravelSheetItem2TransportItemRef();
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

    selectStr = "DELETE FROM  ENTRAVLSHTTM2TRNSPRTTM WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENTravelSheetItem2TransportItem object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENTravelSheetItem2TransportItem.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENTravelSheetItem2TransportItem.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENTravelSheetItem2TransportItem.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTravelSheetItem2TransportItem.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENTravelSheetItem2TransportItem.getObject%} access denied");

    selectStr =

    "SELECT  ENTRAVLSHTTM2TRNSPRTTM.CODE FROM  ENTRAVLSHTTM2TRNSPRTTM WHERE  ENTRAVLSHTTM2TRNSPRTTM.CODE = ?";
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
    _checkConditionToken(condition,"code","ENTRAVLSHTTM2TRNSPRTTM.CODE");
    _checkConditionToken(condition,"modify_time","ENTRAVLSHTTM2TRNSPRTTM.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"travelsheetitemref","TRAVELSHEETITEMREFCODE");
    _checkConditionToken(condition,"travelsheetitemref.code","TRAVELSHEETITEMREFCODE");
    _checkConditionToken(condition,"transportitemref","TRANSPORTITEMREFCODE");
    _checkConditionToken(condition,"transportitemref.code","TRANSPORTITEMREFCODE");
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

    private void _collectAutoIncrementFields(ENTravelSheetItem2TransportItem anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENTRAVLSHTTM2TRNSPRTTM", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENTRAVLSHTTM2TRNSPRTTM", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENTRAVLSHTTM2TRNSPRTTM", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENTRAVLSHTTM2TRNSPRTTM");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENTravelSheetItem2TransportItemDAO
