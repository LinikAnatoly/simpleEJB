
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
import com.ksoe.energynet.valueobject.ENAccumulatorsDistance;
import com.ksoe.energynet.valueobject.brief.ENAccumulatorsDistanceShort;
import com.ksoe.energynet.valueobject.filter.ENAccumulatorsDistanceFilter;
import com.ksoe.energynet.valueobject.lists.ENAccumulatorsDistanceShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;

/**
 * DAO Object for ENAccumulatorsDistance;
 *
 */

public class ENAccumulatorsDistanceDAOGen extends GenericDataMiner {

  public ENAccumulatorsDistanceDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENAccumulatorsDistanceDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENAccumulatorsDistance inObject) throws PersistenceException
   {
      ENAccumulatorsDistance obj = new ENAccumulatorsDistance();
      obj.code = inObject.code;
      loadObject(obj);

     if ( ! inObject.recordDistance.equals(obj.recordDistance)){
       return false;
     }

     if ( ! inObject.recordtDate.equals(obj.recordtDate)){
       return false;
     }
     if (inObject.accumulatorsRef.code != obj.accumulatorsRef.code){
        return false;
     }
     if (inObject.transportRealRef.code != obj.transportRealRef.code){
        return false;
     }
     if (inObject.travelSheetRef.code != obj.travelSheetRef.code){
        return false;
     }
      return true;
   }

   public int add(ENAccumulatorsDistance anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENAccumulatorsDistance anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENACCUMULATORSDISTANCE (CODE,RECORDDISTANCE,RECORDTDATE,ACCUMULATORSREFCODE,TRANSPORTREALREFCODE,TRAVELSHEETREFCODE) VALUES (?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.recordDistance != null)
        anObject.recordDistance = anObject.recordDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.recordDistance);
      if (anObject.recordtDate == null)
        statement.setDate(3,null);
      else
        statement.setDate(3,new java.sql.Date(anObject.recordtDate.getTime()));
      if (anObject.accumulatorsRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENAccumulatorsDAOGen(connection,getUserProfile()).exists(anObject.accumulatorsRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENAccumulatorsDistance.accumulatorsRef.code%} = {%"+anObject.accumulatorsRef.code+"%}");
        statement.setInt(4,anObject.accumulatorsRef.code);
      }
      else
        statement.setNull(4,java.sql.Types.INTEGER);
      if (anObject.transportRealRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).exists(anObject.transportRealRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENAccumulatorsDistance.transportRealRef.code%} = {%"+anObject.transportRealRef.code+"%}");
        statement.setInt(5,anObject.transportRealRef.code);
      }
      else
        statement.setNull(5,java.sql.Types.INTEGER);
      if (anObject.travelSheetRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTravelSheetDAOGen(connection,getUserProfile()).exists(anObject.travelSheetRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENAccumulatorsDistance.travelSheetRef.code%} = {%"+anObject.travelSheetRef.code+"%}");
        statement.setInt(6,anObject.travelSheetRef.code);
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
      throw new PersistenceException("Error in method {%ENAccumulatorsDistanceDAOGen.add%}",e);
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

   public void save(ENAccumulatorsDistance anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENAccumulatorsDistance anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("RECORDDISTANCE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("RECORDTDATE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ACCUMULATORSREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TRANSPORTREALREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TRAVELSHEETREF") == 0)
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
        "UPDATE ENACCUMULATORSDISTANCE SET  RECORDDISTANCE = ? , RECORDTDATE = ? , ACCUMULATORSREFCODE = ? , TRANSPORTREALREFCODE = ? , TRAVELSHEETREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENACCUMULATORSDISTANCE SET ";
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
      if (anObject.recordDistance != null)
        anObject.recordDistance = anObject.recordDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(1,anObject.recordDistance);
      if (anObject.recordtDate == null)
        statement.setDate(2,null);
      else
        statement.setDate(2,new java.sql.Date(anObject.recordtDate.getTime()));
      if (anObject.accumulatorsRef.code != Integer.MIN_VALUE)
        statement.setInt(3,anObject.accumulatorsRef.code);
      else
        statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.transportRealRef.code != Integer.MIN_VALUE)
        statement.setInt(4,anObject.transportRealRef.code);
      else
        statement.setNull(4,java.sql.Types.INTEGER);
      if (anObject.travelSheetRef.code != Integer.MIN_VALUE)
        statement.setInt(5,anObject.travelSheetRef.code);
      else
        statement.setNull(5,java.sql.Types.INTEGER);
          statement.setInt(6,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("RECORDDISTANCE".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.recordDistance != null)
                    anObject.recordDistance = anObject.recordDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.recordDistance);
                continue;
             }
            if("RECORDTDATE".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.recordtDate == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.recordtDate.getTime()));
                continue;
             }
            if("ACCUMULATORSREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.accumulatorsRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.accumulatorsRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("TRANSPORTREALREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.transportRealRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.transportRealRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("TRAVELSHEETREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.travelSheetRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.travelSheetRef.code);
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

   } // end of save(ENAccumulatorsDistance anObject,String[] anAttributes)


 public ENAccumulatorsDistanceShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENAccumulatorsDistance filterObject = new ENAccumulatorsDistance();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENAccumulatorsDistanceShort)list.get(0);
   return null;
  }

  public ENAccumulatorsDistanceShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENAccumulatorsDistanceShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENAccumulatorsDistanceShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENAccumulatorsDistanceShortList getFilteredList(ENAccumulatorsDistance filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENAccumulatorsDistanceShortList getScrollableFilteredList(ENAccumulatorsDistance aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENAccumulatorsDistanceShortList getScrollableFilteredList(ENAccumulatorsDistance aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENAccumulatorsDistanceShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENAccumulatorsDistanceShortList getScrollableFilteredList(ENAccumulatorsDistanceFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENAccumulatorsDistanceShortList getScrollableFilteredList(ENAccumulatorsDistanceFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENAccumulatorsDistanceShortList getScrollableFilteredList(ENAccumulatorsDistance aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENAccumulatorsDistanceShortList getScrollableFilteredList(ENAccumulatorsDistance aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENAccumulatorsDistanceShortList result = new ENAccumulatorsDistanceShortList();
    ENAccumulatorsDistanceShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACCUMULATORSDISTANCE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENACCUMULATORSDISTANCE.CODE"+
     ",ENACCUMULATORSDISTANCE.RECORDDISTANCE"+
     ",ENACCUMULATORSDISTANCE.RECORDTDATE"+

      ", ENACCUMULATORS.CODE " +
      ", ENACCUMULATORS.NAME " +
      ", ENACCUMULATORS.TYPENAME " +
      ", ENACCUMULATORS.FACTORY " +
      ", ENACCUMULATORS.GARAGENUMBER " +
      ", ENACCUMULATORS.YEARPRODUCTION " +
      ", ENACCUMULATORS.SERIALNUMBER " +
      ", ENACCUMULATORS.RECEIPTDATE " +
      ", ENACCUMULATORS.MILEAGE " +
      ", ENACCUMULATORS.MILEAGEALL " +
      ", ENACCUMULATORS.POTENCIAL " +
      ", TKTRANSPORTREAL.CODE " +
      ", TKTRANSPORTREAL.NAME " +
      ", TKTRANSPORTREAL.INVNUMBER " +
      ", TKTRANSPORTREAL.GOSNUMBER " +
      ", ENTRAVELSHEET.CODE " +
      ", ENTRAVELSHEET.NUMBERGEN " +
      ", ENTRAVELSHEET.DATESTART " +
      ", ENTRAVELSHEET.DATEFINAL " +
      ", ENTRAVELSHEET.SPEEDOMETERSTART " +
      ", ENTRAVELSHEET.SPEEDOMETERFINAL " +
      ", ENTRAVELSHEET.FUELCOUNTERSTART " +
      ", ENTRAVELSHEET.FUELCOUNTERFINAL " +
      ", ENTRAVELSHEET.TIMESTART " +
      ", ENTRAVELSHEET.TIMEFINAL " +
      ", ENTRAVELSHEET.DATEEDIT " +
      ", ENTRAVELSHEET.USERGEN " +
     " FROM ENACCUMULATORSDISTANCE " +
     ", ENACCUMULATORS " +
     ", TKTRANSPORTREAL " +
     ", ENTRAVELSHEET " +
     //" WHERE "
    "";
     whereStr = " ENACCUMULATORS.CODE = ENACCUMULATORSDISTANCE.ACCUMULATORSREFCODE" ; //+
      whereStr = whereStr +" AND TKTRANSPORTREAL.CODE = ENACCUMULATORSDISTANCE.TRANSPORTREALREFCODE" ; //+
      whereStr = whereStr +" AND ENTRAVELSHEET.CODE = ENACCUMULATORSDISTANCE.TRAVELSHEETREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENACCUMULATORSDISTANCE.CODE IN ( SELECT ENACCUMULATORSDISTANCE.CODE FROM ENACCUMULATORSDISTANCE ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSDISTANCE.CODE = ?";
        }
        if(aFilterObject.recordDistance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSDISTANCE.RECORDDISTANCE = ?";
        }
        if(aFilterObject.recordtDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSDISTANCE.RECORDTDATE = ?";
        }
        if(aFilterObject.accumulatorsRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACCUMULATORSDISTANCE.ACCUMULATORSREFCODE = ? ";
        }
        if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACCUMULATORSDISTANCE.TRANSPORTREALREFCODE = ? ";
        }
        if(aFilterObject.travelSheetRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACCUMULATORSDISTANCE.TRAVELSHEETREFCODE = ? ";
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
        if(aFilterObject.recordDistance != null){
            number++;
            aFilterObject.recordDistance = aFilterObject.recordDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.recordDistance);
        }
        if(aFilterObject.recordtDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.recordtDate.getTime()));
        }
       if(aFilterObject.accumulatorsRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.accumulatorsRef.code);
       }
       if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportRealRef.code);
       }
       if(aFilterObject.travelSheetRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.travelSheetRef.code);
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

        anObject = new ENAccumulatorsDistanceShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.recordDistance = set.getBigDecimal(2);
        if(anObject.recordDistance != null)
            anObject.recordDistance = anObject.recordDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.recordtDate = set.getDate(3);

        anObject.accumulatorsRefCode = set.getInt(4);
        if(set.wasNull())
        anObject.accumulatorsRefCode = Integer.MIN_VALUE;
        anObject.accumulatorsRefName = set.getString(5);
        anObject.accumulatorsRefTypeName = set.getString(6);
        anObject.accumulatorsRefFactory = set.getString(7);
        anObject.accumulatorsRefGarageNumber = set.getString(8);
        anObject.accumulatorsRefYearProduction = set.getString(9);
        anObject.accumulatorsRefSerialNumber = set.getString(10);
        anObject.accumulatorsRefReceiptDate = set.getDate(11);
        anObject.accumulatorsRefMileage = set.getBigDecimal(12);
        if(anObject.accumulatorsRefMileage != null)
          anObject.accumulatorsRefMileage = anObject.accumulatorsRefMileage.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.accumulatorsRefMileageAll = set.getBigDecimal(13);
        if(anObject.accumulatorsRefMileageAll != null)
          anObject.accumulatorsRefMileageAll = anObject.accumulatorsRefMileageAll.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.accumulatorsRefPotencial = set.getBigDecimal(14);
        if(anObject.accumulatorsRefPotencial != null)
          anObject.accumulatorsRefPotencial = anObject.accumulatorsRefPotencial.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.transportRealRefCode = set.getInt(15);
        if(set.wasNull())
        anObject.transportRealRefCode = Integer.MIN_VALUE;

        anObject.travelSheetRefCode = set.getInt(19);
        if(set.wasNull())
        anObject.travelSheetRefCode = Integer.MIN_VALUE;


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

  public int[] getFilteredCodeArrayOLD(ENAccumulatorsDistance aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENACCUMULATORSDISTANCE.CODE FROM ENACCUMULATORSDISTANCE";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACCUMULATORSDISTANCE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSDISTANCE.CODE = ?";
        }
        if(aFilterObject.recordDistance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSDISTANCE.RECORDDISTANCE = ?";
        }
        if(aFilterObject.recordtDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSDISTANCE.RECORDTDATE = ?";
        }
        if(aFilterObject.accumulatorsRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACCUMULATORSDISTANCE.ACCUMULATORSREFCODE = ? ";
        }
        if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACCUMULATORSDISTANCE.TRANSPORTREALREFCODE = ? ";
        }
        if(aFilterObject.travelSheetRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACCUMULATORSDISTANCE.TRAVELSHEETREFCODE = ? ";
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
        if(aFilterObject.recordDistance != null){
            number++;
            aFilterObject.recordDistance = aFilterObject.recordDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.recordDistance);
        }
        if(aFilterObject.recordtDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.recordtDate.getTime()));
        }
       if(aFilterObject.accumulatorsRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.accumulatorsRef.code);
       }
       if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportRealRef.code);
       }
       if(aFilterObject.travelSheetRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.travelSheetRef.code);
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

  public int[] getFilteredCodeArray(ENAccumulatorsDistanceFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENAccumulatorsDistance aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENACCUMULATORSDISTANCE.CODE FROM ENACCUMULATORSDISTANCE";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACCUMULATORSDISTANCE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSDISTANCE.CODE = ?";
        }
        if(aFilterObject.recordDistance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSDISTANCE.RECORDDISTANCE = ?";
        }
        if(aFilterObject.recordtDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSDISTANCE.RECORDTDATE = ?";
        }
        if(aFilterObject.accumulatorsRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACCUMULATORSDISTANCE.ACCUMULATORSREFCODE = ? ";
        }
        if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACCUMULATORSDISTANCE.TRANSPORTREALREFCODE = ? ";
        }
        if(aFilterObject.travelSheetRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACCUMULATORSDISTANCE.TRAVELSHEETREFCODE = ? ";
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
        if(aFilterObject.recordDistance != null){
            number++;
            aFilterObject.recordDistance = aFilterObject.recordDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.recordDistance);
        }
        if(aFilterObject.recordtDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.recordtDate.getTime()));
        }
       if(aFilterObject.accumulatorsRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.accumulatorsRef.code);
       }
       if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportRealRef.code);
       }
       if(aFilterObject.travelSheetRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.travelSheetRef.code);
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


   public ENAccumulatorsDistance getObject(int uid) throws PersistenceException
   {
    ENAccumulatorsDistance result = new ENAccumulatorsDistance();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENAccumulatorsDistance anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENACCUMULATORSDISTANCE.CODE, ENACCUMULATORSDISTANCE.RECORDDISTANCE, ENACCUMULATORSDISTANCE.RECORDTDATE, ENACCUMULATORSDISTANCE.ACCUMULATORSREFCODE, ENACCUMULATORSDISTANCE.TRANSPORTREALREFCODE, ENACCUMULATORSDISTANCE.TRAVELSHEETREFCODE "
    +" FROM ENACCUMULATORSDISTANCE WHERE ENACCUMULATORSDISTANCE.CODE = ?";

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
        anObject.recordDistance = set.getBigDecimal(2);
        if(anObject.recordDistance != null)
            anObject.recordDistance = anObject.recordDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.recordtDate = set.getDate(3);
        anObject.accumulatorsRef.code = set.getInt(4);
        if ( set.wasNull() )
            anObject.accumulatorsRef.code = Integer.MIN_VALUE;
        anObject.transportRealRef.code = set.getInt(5);
        if ( set.wasNull() )
            anObject.transportRealRef.code = Integer.MIN_VALUE;
        anObject.travelSheetRef.code = set.getInt(6);
        if ( set.wasNull() )
            anObject.travelSheetRef.code = Integer.MIN_VALUE;
        if(anObject.accumulatorsRef.code != Integer.MIN_VALUE)
        {
           anObject.setAccumulatorsRef(
        new com.ksoe.energynet.dataminer.generated.ENAccumulatorsDAOGen(connection,getUserProfile()).getRef(anObject.accumulatorsRef.code));
    }
        if(anObject.transportRealRef.code != Integer.MIN_VALUE)
        {
           anObject.setTransportRealRef(
        new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).getRef(anObject.transportRealRef.code));
    }
        if(anObject.travelSheetRef.code != Integer.MIN_VALUE)
        {
           anObject.setTravelSheetRef(
        new com.ksoe.energynet.dataminer.generated.ENTravelSheetDAOGen(connection,getUserProfile()).getRef(anObject.travelSheetRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENAccumulatorsDistanceRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENAccumulatorsDistanceRef ref = new com.ksoe.energynet.valueobject.references.ENAccumulatorsDistanceRef();
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

    selectStr = "DELETE FROM  ENACCUMULATORSDISTANCE WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENAccumulatorsDistance object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENAccumulatorsDistance.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENAccumulatorsDistance.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENAccumulatorsDistance.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAccumulatorsDistance.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENAccumulatorsDistance.getObject%} access denied");

    selectStr =

    "SELECT  ENACCUMULATORSDISTANCE.CODE FROM  ENACCUMULATORSDISTANCE WHERE  ENACCUMULATORSDISTANCE.CODE = ?";
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
    _checkConditionToken(condition,"code","ENACCUMULATORSDISTANCE.CODE");
    _checkConditionToken(condition,"recorddistance","ENACCUMULATORSDISTANCE.RECORDDISTANCE");
    _checkConditionToken(condition,"recordtdate","ENACCUMULATORSDISTANCE.RECORDTDATE");
      // relationship conditions
    _checkConditionToken(condition,"accumulatorsref","ACCUMULATORSREFCODE");
    _checkConditionToken(condition,"accumulatorsref.code","ACCUMULATORSREFCODE");
    _checkConditionToken(condition,"transportrealref","TRANSPORTREALREFCODE");
    _checkConditionToken(condition,"transportrealref.code","TRANSPORTREALREFCODE");
    _checkConditionToken(condition,"travelsheetref","TRAVELSHEETREFCODE");
    _checkConditionToken(condition,"travelsheetref.code","TRAVELSHEETREFCODE");
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

    private void _collectAutoIncrementFields(ENAccumulatorsDistance anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENACCUMULATORSDISTANCE", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENACCUMULATORSDISTANCE", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENACCUMULATORSDISTANCE", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENACCUMULATORSDISTANCE");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENAccumulatorsDistanceDAO
