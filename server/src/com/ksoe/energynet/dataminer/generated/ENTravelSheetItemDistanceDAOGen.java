
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
import com.ksoe.energynet.valueobject.ENTravelSheetItemDistance;
import com.ksoe.energynet.valueobject.brief.ENTravelSheetItemDistanceShort;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemDistanceFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItemDistanceShortList;
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
  *  DAO Generated for ENTravelSheetItemDistance;
  *
  */

public class ENTravelSheetItemDistanceDAOGen extends GenericDataMiner {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENTravelSheetItemDistanceDAOGen() {super();}
  //public ENTravelSheetItemDistanceDAOGen(Connection aConnection) {super(aConnection);}
  //public ENTravelSheetItemDistanceDAOGen(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTravelSheetItemDistanceDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTravelSheetItemDistanceDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENTravelSheetItemDistance inObject) throws PersistenceException
   {
      ENTravelSheetItemDistance obj = new ENTravelSheetItemDistance();
      obj.code = inObject.code;
      loadObject(obj);

     if ( ! inObject.distance.equals(obj.distance)){
       return false;
     }

     if ( ! inObject.sumMachineHours.equals(obj.sumMachineHours)){
       return false;
     }

     if ( ! inObject.koef.equals(obj.koef)){
       return false;
     }
     if (inObject.travelSheetItemRef.code != obj.travelSheetItemRef.code){
        return false;
     }
      return true;
   }

   public int add(ENTravelSheetItemDistance anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENTravelSheetItemDistance anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENTRAVELSHEETITEMDSTNC (CODE,DISTANCE,SUMMACHINEHOURS,KOEF,TRAVELSHEETITEMREFCODE) VALUES (?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.distance != null)
        anObject.distance = anObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.distance);
      if (anObject.sumMachineHours != null)
        anObject.sumMachineHours = anObject.sumMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.sumMachineHours);
      if (anObject.koef != null)
        anObject.koef = anObject.koef.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.koef);
      if (anObject.travelSheetItemRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTravelSheetItemDAOGen(connection,getUserProfile()).exists(anObject.travelSheetItemRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTravelSheetItemDistance.travelSheetItemRef.code%} = {%"+anObject.travelSheetItemRef.code+"%}");
        statement.setInt(5,anObject.travelSheetItemRef.code);
      }
      else
        statement.setNull(5,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENTravelSheetItemDistanceDAOGen.add%}",e);
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

   public void save(ENTravelSheetItemDistance anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENTravelSheetItemDistance anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("SUMMACHINEHOURS") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("KOEF") == 0)
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
         }
       if(fields.size() == 0)
         return;
       }
      if(fields == null)
       {
        selectStr =
        "UPDATE ENTRAVELSHEETITEMDSTNC SET  DISTANCE = ? , SUMMACHINEHOURS = ? , KOEF = ? , TRAVELSHEETITEMREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENTRAVELSHEETITEMDISTANCE SET ";
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
        anObject.distance = anObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(1,anObject.distance);

      if (anObject.sumMachineHours != null)
        anObject.sumMachineHours = anObject.sumMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.sumMachineHours);

      if (anObject.koef != null)
        anObject.koef = anObject.koef.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.koef);

      if (anObject.travelSheetItemRef.code != Integer.MIN_VALUE)
        statement.setInt(4,anObject.travelSheetItemRef.code);
      else
        statement.setNull(4,java.sql.Types.INTEGER);
          statement.setInt(5,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("DISTANCE".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.distance != null)
                    anObject.distance = anObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.distance);
                continue;
             }
            if("SUMMACHINEHOURS".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sumMachineHours != null)
                    anObject.sumMachineHours = anObject.sumMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sumMachineHours);
                continue;
             }
            if("KOEF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.koef != null)
                    anObject.koef = anObject.koef.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.koef);
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

   } // end of save(ENTravelSheetItemDistance anObject,String[] anAttributes)


 public ENTravelSheetItemDistanceShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENTravelSheetItemDistance filterObject = new ENTravelSheetItemDistance();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENTravelSheetItemDistanceShort)list.get(0);
   return null;
  }

  public ENTravelSheetItemDistanceShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENTravelSheetItemDistanceShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENTravelSheetItemDistanceShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENTravelSheetItemDistanceShortList getFilteredList(ENTravelSheetItemDistance filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENTravelSheetItemDistanceShortList getScrollableFilteredList(ENTravelSheetItemDistance aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENTravelSheetItemDistanceShortList getScrollableFilteredList(ENTravelSheetItemDistance aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENTravelSheetItemDistanceShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENTravelSheetItemDistanceShortList getScrollableFilteredList(ENTravelSheetItemDistanceFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENTravelSheetItemDistanceShortList getScrollableFilteredList(ENTravelSheetItemDistanceFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENTravelSheetItemDistanceShortList getScrollableFilteredList(ENTravelSheetItemDistance aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENTravelSheetItemDistanceShortList getScrollableFilteredList(ENTravelSheetItemDistance aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENTravelSheetItemDistanceShortList result = new ENTravelSheetItemDistanceShortList();
    ENTravelSheetItemDistanceShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRAVELSHEETITEMDSTNC.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENTRAVELSHEETITEMDSTNC.CODE"+
     ",ENTRAVELSHEETITEMDSTNC.DISTANCE"+
     ",ENTRAVELSHEETITEMDSTNC.SUMMACHINEHOURS"+
     ",ENTRAVELSHEETITEMDSTNC.KOEF"+

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
      ", ENTRAVELSHEETITEM.DATEEDIT " +
      ", ENTRAVELSHEETITEM.USERGEN " +
     " FROM ENTRAVELSHEETITEMDSTNC " +
     ", ENTRAVELSHEETITEM " +
     //" WHERE "
    "";
     whereStr = " ENTRAVELSHEETITEM.CODE = ENTRAVELSHEETITEMDSTNC.TRAVELSHEETITEMREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENTRAVELSHEETITEMDSTNC.CODE IN ( SELECT ENTRAVELSHEETITEMDSTNC.CODE FROM ENTRAVELSHEETITEMDSTNC ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEMDSTNC.CODE = ?";
        }
        if(aFilterObject.distance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEMDSTNC.DISTANCE = ?";
        }
        if(aFilterObject.sumMachineHours != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEMDSTNC.SUMMACHINEHOURS = ?";
        }
        if(aFilterObject.koef != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEMDSTNC.KOEF = ?";
        }
        if(aFilterObject.travelSheetItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRAVELSHEETITEMDSTNC.TRAVELSHEETITEMREFCODE = ? ";
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
            aFilterObject.distance = aFilterObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distance);
        }
        if(aFilterObject.sumMachineHours != null){
            number++;
            aFilterObject.sumMachineHours = aFilterObject.sumMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumMachineHours);
        }
        if(aFilterObject.koef != null){
            number++;
            aFilterObject.koef = aFilterObject.koef.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.koef);
        }
       if(aFilterObject.travelSheetItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.travelSheetItemRef.code);
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

        anObject = new ENTravelSheetItemDistanceShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.distance = set.getBigDecimal(2);
        if(anObject.distance != null)
            anObject.distance = anObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumMachineHours = set.getBigDecimal(3);
        if(anObject.sumMachineHours != null)
            anObject.sumMachineHours = anObject.sumMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.koef = set.getBigDecimal(4);
        if(anObject.koef != null)
            anObject.koef = anObject.koef.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.travelSheetItemRefCode = set.getInt(5);
        if(set.wasNull())
        anObject.travelSheetItemRefCode = Integer.MIN_VALUE;
        anObject.travelSheetItemRefTravelFrom = set.getString(6);
        anObject.travelSheetItemRefTravelTo = set.getString(7);
        anObject.travelSheetItemRefTimeStart = set.getTimestamp(8);
        anObject.travelSheetItemRefTimeFinal = set.getTimestamp(9);
        anObject.travelSheetItemRefSpeedometerStart = set.getBigDecimal(10);
        if(anObject.travelSheetItemRefSpeedometerStart != null)
          anObject.travelSheetItemRefSpeedometerStart = anObject.travelSheetItemRefSpeedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.travelSheetItemRefSpeedometerFinal = set.getBigDecimal(11);
        if(anObject.travelSheetItemRefSpeedometerFinal != null)
          anObject.travelSheetItemRefSpeedometerFinal = anObject.travelSheetItemRefSpeedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.travelSheetItemRefFuelCounterStart = set.getBigDecimal(12);
        if(anObject.travelSheetItemRefFuelCounterStart != null)
          anObject.travelSheetItemRefFuelCounterStart = anObject.travelSheetItemRefFuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.travelSheetItemRefFuelCounterFinal = set.getBigDecimal(13);
        if(anObject.travelSheetItemRefFuelCounterFinal != null)
          anObject.travelSheetItemRefFuelCounterFinal = anObject.travelSheetItemRefFuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.travelSheetItemRefSumDistances = set.getBigDecimal(14);
        if(anObject.travelSheetItemRefSumDistances != null)
          anObject.travelSheetItemRefSumDistances = anObject.travelSheetItemRefSumDistances.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.travelSheetItemRefSumMachineHours = set.getBigDecimal(15);
        if(anObject.travelSheetItemRefSumMachineHours != null)
          anObject.travelSheetItemRefSumMachineHours = anObject.travelSheetItemRefSumMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.travelSheetItemRefDateEdit = set.getTimestamp(16);
        anObject.travelSheetItemRefUserGen = set.getString(17);

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

  public int[] getFilteredCodeArrayOLD(ENTravelSheetItemDistance aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRAVELSHEETITEMDSTNC.CODE FROM ENTRAVELSHEETITEMDSTNC";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRAVELSHEETITEMDSTNC.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEMDSTNC.CODE = ?";
        }
        if(aFilterObject.distance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEMDSTNC.DISTANCE = ?";
        }
        if(aFilterObject.sumMachineHours != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEMDSTNC.SUMMACHINEHOURS = ?";
        }
        if(aFilterObject.koef != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEMDSTNC.KOEF = ?";
        }
        if(aFilterObject.travelSheetItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEETITEMDSTNC.TRAVELSHEETITEMREFCODE = ? ";
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
            aFilterObject.distance = aFilterObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distance);
        }
        if(aFilterObject.sumMachineHours != null){
            number++;
            aFilterObject.sumMachineHours = aFilterObject.sumMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumMachineHours);
        }
        if(aFilterObject.koef != null){
            number++;
            aFilterObject.koef = aFilterObject.koef.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.koef);
        }
       if(aFilterObject.travelSheetItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.travelSheetItemRef.code);
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

  public int[] getFilteredCodeArray(ENTravelSheetItemDistanceFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENTravelSheetItemDistance aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRAVELSHEETITEMDSTNC.CODE FROM ENTRAVELSHEETITEMDSTNC";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRAVELSHEETITEMDSTNC.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEMDSTNC.CODE = ?";
        }
        if(aFilterObject.distance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEMDSTNC.DISTANCE = ?";
        }
        if(aFilterObject.sumMachineHours != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEMDSTNC.SUMMACHINEHOURS = ?";
        }
        if(aFilterObject.koef != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETITEMDSTNC.KOEF = ?";
        }
        if(aFilterObject.travelSheetItemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEETITEMDSTNC.TRAVELSHEETITEMREFCODE = ? ";
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
            aFilterObject.distance = aFilterObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distance);
        }
        if(aFilterObject.sumMachineHours != null){
            number++;
            aFilterObject.sumMachineHours = aFilterObject.sumMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumMachineHours);
        }
        if(aFilterObject.koef != null){
            number++;
            aFilterObject.koef = aFilterObject.koef.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.koef);
        }
       if(aFilterObject.travelSheetItemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.travelSheetItemRef.code);
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


   public ENTravelSheetItemDistance getObject(int uid) throws PersistenceException
   {
    ENTravelSheetItemDistance result = new ENTravelSheetItemDistance();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENTravelSheetItemDistance anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENTRAVELSHEETITEMDSTNC.CODE, ENTRAVELSHEETITEMDSTNC.DISTANCE, ENTRAVELSHEETITEMDSTNC.SUMMACHINEHOURS, ENTRAVELSHEETITEMDSTNC.KOEF, ENTRAVELSHEETITEMDSTNC.TRAVELSHEETITEMREFCODE "
    +" FROM ENTRAVELSHEETITEMDSTNC WHERE ENTRAVELSHEETITEMDSTNC.CODE = ?";

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
            anObject.distance = anObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumMachineHours = set.getBigDecimal(3);
        if(anObject.sumMachineHours != null)
            anObject.sumMachineHours = anObject.sumMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.koef = set.getBigDecimal(4);
        if(anObject.koef != null)
            anObject.koef = anObject.koef.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.travelSheetItemRef.code = set.getInt(5);
        if ( set.wasNull() )
            anObject.travelSheetItemRef.code = Integer.MIN_VALUE;
        if(anObject.travelSheetItemRef.code != Integer.MIN_VALUE)
        {
           anObject.setTravelSheetItemRef(
        new com.ksoe.energynet.dataminer.generated.ENTravelSheetItemDAOGen(connection,getUserProfile()).getRef(anObject.travelSheetItemRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENTravelSheetItemDistanceRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENTravelSheetItemDistanceRef ref = new com.ksoe.energynet.valueobject.references.ENTravelSheetItemDistanceRef();
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

    selectStr = "DELETE FROM  ENTRAVELSHEETITEMDSTNC WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENTravelSheetItemDistance object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENTravelSheetItemDistance.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENTravelSheetItemDistance.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENTravelSheetItemDistance.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTravelSheetItemDistance.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENTravelSheetItemDistance.getObject%} access denied");

    selectStr =

    "SELECT  ENTRAVELSHEETITEMDSTNC.CODE FROM  ENTRAVELSHEETITEMDSTNC WHERE  ENTRAVELSHEETITEMDSTNC.CODE = ?";
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
    _checkConditionToken(condition,"code","ENTRAVELSHEETITEMDSTNC.CODE");
    _checkConditionToken(condition,"distance","ENTRAVELSHEETITEMDSTNC.DISTANCE");
    _checkConditionToken(condition,"summachinehours","ENTRAVELSHEETITEMDSTNC.SUMMACHINEHOURS");
    _checkConditionToken(condition,"koef","ENTRAVELSHEETITEMDSTNC.KOEF");
      // relationship conditions
    _checkConditionToken(condition,"travelsheetitemref","TRAVELSHEETITEMREFCODE");
    _checkConditionToken(condition,"travelsheetitemref.code","TRAVELSHEETITEMREFCODE");
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

   private void _collectAutoIncrementFields(ENTravelSheetItemDistance anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("ENTRAVELSHEETITEMDSTNC", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("ENTRAVELSHEETITEMDSTNC", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("ENTRAVELSHEETITEMDSTNC", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: ENTRAVELSHEETITEMDSTNC");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of ENTravelSheetItemDistanceDAO

