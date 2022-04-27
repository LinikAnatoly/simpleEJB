
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
import com.ksoe.energynet.valueobject.ENAutoTiresDistance;
import com.ksoe.energynet.valueobject.brief.ENAutoTiresDistanceShort;
import com.ksoe.energynet.valueobject.filter.ENAutoTiresDistanceFilter;
import com.ksoe.energynet.valueobject.lists.ENAutoTiresDistanceShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;

/**
 * DAO Object for ENAutoTiresDistance;
 *
 */

public class ENAutoTiresDistanceDAOGen extends GenericDataMiner {

  public ENAutoTiresDistanceDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENAutoTiresDistanceDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENAutoTiresDistance inObject) throws PersistenceException
   {
      ENAutoTiresDistance obj = new ENAutoTiresDistance();
      obj.code = inObject.code;
      loadObject(obj);

     if ( ! inObject.recordDistance.equals(obj.recordDistance)){
       return false;
     }

     if ( ! inObject.recordtDate.equals(obj.recordtDate)){
       return false;
     }
     if (inObject.tiresRef.code != obj.tiresRef.code){
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

   public int add(ENAutoTiresDistance anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENAutoTiresDistance anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENAUTOTIRESDISTANCE (CODE,RECORDDISTANCE,RECORDTDATE,TIRESREFCODE,TRANSPORTREALREFCODE,TRAVELSHEETREFCODE) VALUES (?,?,?,?,?,?)";

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
      if (anObject.tiresRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENAutoTiresDAOGen(connection,getUserProfile()).exists(anObject.tiresRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENAutoTiresDistance.tiresRef.code%} = {%"+anObject.tiresRef.code+"%}");
        statement.setInt(4,anObject.tiresRef.code);
      }
      else
        statement.setNull(4,java.sql.Types.INTEGER);
      if (anObject.transportRealRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).exists(anObject.transportRealRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENAutoTiresDistance.transportRealRef.code%} = {%"+anObject.transportRealRef.code+"%}");
        statement.setInt(5,anObject.transportRealRef.code);
      }
      else
        statement.setNull(5,java.sql.Types.INTEGER);
      if (anObject.travelSheetRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTravelSheetDAOGen(connection,getUserProfile()).exists(anObject.travelSheetRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENAutoTiresDistance.travelSheetRef.code%} = {%"+anObject.travelSheetRef.code+"%}");
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
      throw new PersistenceException("Error in method {%ENAutoTiresDistanceDAOGen.add%}",e);
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

   public void save(ENAutoTiresDistance anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENAutoTiresDistance anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("TIRESREF") == 0)
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
        "UPDATE ENAUTOTIRESDISTANCE SET  RECORDDISTANCE = ? , RECORDTDATE = ? , TIRESREFCODE = ? , TRANSPORTREALREFCODE = ? , TRAVELSHEETREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENAUTOTIRESDISTANCE SET ";
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
      if (anObject.tiresRef.code != Integer.MIN_VALUE)
        statement.setInt(3,anObject.tiresRef.code);
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
            if("TIRESREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.tiresRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.tiresRef.code);
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

   } // end of save(ENAutoTiresDistance anObject,String[] anAttributes)


 public ENAutoTiresDistanceShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENAutoTiresDistance filterObject = new ENAutoTiresDistance();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENAutoTiresDistanceShort)list.get(0);
   return null;
  }

  public ENAutoTiresDistanceShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENAutoTiresDistanceShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENAutoTiresDistanceShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENAutoTiresDistanceShortList getFilteredList(ENAutoTiresDistance filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENAutoTiresDistanceShortList getScrollableFilteredList(ENAutoTiresDistance aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENAutoTiresDistanceShortList getScrollableFilteredList(ENAutoTiresDistance aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENAutoTiresDistanceShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENAutoTiresDistanceShortList getScrollableFilteredList(ENAutoTiresDistanceFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENAutoTiresDistanceShortList getScrollableFilteredList(ENAutoTiresDistanceFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENAutoTiresDistanceShortList getScrollableFilteredList(ENAutoTiresDistance aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENAutoTiresDistanceShortList getScrollableFilteredList(ENAutoTiresDistance aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENAutoTiresDistanceShortList result = new ENAutoTiresDistanceShortList();
    ENAutoTiresDistanceShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENAUTOTIRESDISTANCE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENAUTOTIRESDISTANCE.CODE"+
     ",ENAUTOTIRESDISTANCE.RECORDDISTANCE"+
     ",ENAUTOTIRESDISTANCE.RECORDTDATE"+

      ", ENAUTOTIRES.CODE " +
      ", ENAUTOTIRES.TYPENAME " +
      ", ENAUTOTIRES.GARAGENUMBER " +
      ", ENAUTOTIRES.SERIALNUMBER " +
      ", ENAUTOTIRES.FACTORY " +
      ", ENAUTOTIRES.POTENCIAL " +
      ", ENAUTOTIRES.DISTANCEALL " +
      ", ENAUTOTIRES.NOMINAL " +
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
     " FROM ENAUTOTIRESDISTANCE " +
     ", ENAUTOTIRES " +
     ", TKTRANSPORTREAL " +
     ", ENTRAVELSHEET " +
     //" WHERE "
    "";
     whereStr = " ENAUTOTIRES.CODE = ENAUTOTIRESDISTANCE.TIRESREFCODE" ; //+
      whereStr = whereStr +" AND TKTRANSPORTREAL.CODE = ENAUTOTIRESDISTANCE.TRANSPORTREALREFCODE" ; //+
      whereStr = whereStr +" AND ENTRAVELSHEET.CODE = ENAUTOTIRESDISTANCE.TRAVELSHEETREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENAUTOTIRESDISTANCE.CODE IN ( SELECT ENAUTOTIRESDISTANCE.CODE FROM ENAUTOTIRESDISTANCE ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESDISTANCE.CODE = ?";
        }
        if(aFilterObject.recordDistance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESDISTANCE.RECORDDISTANCE = ?";
        }
        if(aFilterObject.recordtDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESDISTANCE.RECORDTDATE = ?";
        }
        if(aFilterObject.tiresRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENAUTOTIRESDISTANCE.TIRESREFCODE = ? ";
        }
        if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENAUTOTIRESDISTANCE.TRANSPORTREALREFCODE = ? ";
        }
        if(aFilterObject.travelSheetRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENAUTOTIRESDISTANCE.TRAVELSHEETREFCODE = ? ";
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
       if(aFilterObject.tiresRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.tiresRef.code);
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

        anObject = new ENAutoTiresDistanceShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.recordDistance = set.getBigDecimal(2);
        if(anObject.recordDistance != null)
            anObject.recordDistance = anObject.recordDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.recordtDate = set.getDate(3);

        anObject.tiresRefCode = set.getInt(4);
        if(set.wasNull())
        anObject.tiresRefCode = Integer.MIN_VALUE;
        anObject.tiresRefTypeName = set.getString(5);
        anObject.tiresRefGarageNumber = set.getString(6);
        anObject.tiresRefSerialNumber = set.getString(7);
        anObject.tiresRefFactory = set.getString(8);
        anObject.tiresRefPotencial = set.getBigDecimal(9);
        if(anObject.tiresRefPotencial != null)
          anObject.tiresRefPotencial = anObject.tiresRefPotencial.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.tiresRefDistanceAll = set.getBigDecimal(10);
        if(anObject.tiresRefDistanceAll != null)
          anObject.tiresRefDistanceAll = anObject.tiresRefDistanceAll.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.tiresRefNominal = set.getString(11);
        anObject.transportRealRefCode = set.getInt(12);
        if(set.wasNull())
        anObject.transportRealRefCode = Integer.MIN_VALUE;

        anObject.travelSheetRefCode = set.getInt(16);
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

  public int[] getFilteredCodeArrayOLD(ENAutoTiresDistance aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENAUTOTIRESDISTANCE.CODE FROM ENAUTOTIRESDISTANCE";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENAUTOTIRESDISTANCE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESDISTANCE.CODE = ?";
        }
        if(aFilterObject.recordDistance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESDISTANCE.RECORDDISTANCE = ?";
        }
        if(aFilterObject.recordtDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESDISTANCE.RECORDTDATE = ?";
        }
        if(aFilterObject.tiresRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENAUTOTIRESDISTANCE.TIRESREFCODE = ? ";
        }
        if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENAUTOTIRESDISTANCE.TRANSPORTREALREFCODE = ? ";
        }
        if(aFilterObject.travelSheetRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENAUTOTIRESDISTANCE.TRAVELSHEETREFCODE = ? ";
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
       if(aFilterObject.tiresRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.tiresRef.code);
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

  public int[] getFilteredCodeArray(ENAutoTiresDistanceFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENAutoTiresDistance aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENAUTOTIRESDISTANCE.CODE FROM ENAUTOTIRESDISTANCE";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENAUTOTIRESDISTANCE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESDISTANCE.CODE = ?";
        }
        if(aFilterObject.recordDistance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESDISTANCE.RECORDDISTANCE = ?";
        }
        if(aFilterObject.recordtDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRESDISTANCE.RECORDTDATE = ?";
        }
        if(aFilterObject.tiresRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENAUTOTIRESDISTANCE.TIRESREFCODE = ? ";
        }
        if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENAUTOTIRESDISTANCE.TRANSPORTREALREFCODE = ? ";
        }
        if(aFilterObject.travelSheetRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENAUTOTIRESDISTANCE.TRAVELSHEETREFCODE = ? ";
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
       if(aFilterObject.tiresRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.tiresRef.code);
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


   public ENAutoTiresDistance getObject(int uid) throws PersistenceException
   {
    ENAutoTiresDistance result = new ENAutoTiresDistance();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENAutoTiresDistance anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENAUTOTIRESDISTANCE.CODE, ENAUTOTIRESDISTANCE.RECORDDISTANCE, ENAUTOTIRESDISTANCE.RECORDTDATE, ENAUTOTIRESDISTANCE.TIRESREFCODE, ENAUTOTIRESDISTANCE.TRANSPORTREALREFCODE, ENAUTOTIRESDISTANCE.TRAVELSHEETREFCODE "
    +" FROM ENAUTOTIRESDISTANCE WHERE ENAUTOTIRESDISTANCE.CODE = ?";

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
        anObject.tiresRef.code = set.getInt(4);
        if ( set.wasNull() )
            anObject.tiresRef.code = Integer.MIN_VALUE;
        anObject.transportRealRef.code = set.getInt(5);
        if ( set.wasNull() )
            anObject.transportRealRef.code = Integer.MIN_VALUE;
        anObject.travelSheetRef.code = set.getInt(6);
        if ( set.wasNull() )
            anObject.travelSheetRef.code = Integer.MIN_VALUE;
        if(anObject.tiresRef.code != Integer.MIN_VALUE)
        {
           anObject.setTiresRef(
        new com.ksoe.energynet.dataminer.generated.ENAutoTiresDAOGen(connection,getUserProfile()).getRef(anObject.tiresRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENAutoTiresDistanceRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENAutoTiresDistanceRef ref = new com.ksoe.energynet.valueobject.references.ENAutoTiresDistanceRef();
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

    selectStr = "DELETE FROM  ENAUTOTIRESDISTANCE WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENAutoTiresDistance object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENAutoTiresDistance.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENAutoTiresDistance.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENAutoTiresDistance.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAutoTiresDistance.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENAutoTiresDistance.getObject%} access denied");

    selectStr =

    "SELECT  ENAUTOTIRESDISTANCE.CODE FROM  ENAUTOTIRESDISTANCE WHERE  ENAUTOTIRESDISTANCE.CODE = ?";
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
    _checkConditionToken(condition,"code","ENAUTOTIRESDISTANCE.CODE");
    _checkConditionToken(condition,"recorddistance","ENAUTOTIRESDISTANCE.RECORDDISTANCE");
    _checkConditionToken(condition,"recordtdate","ENAUTOTIRESDISTANCE.RECORDTDATE");
      // relationship conditions
    _checkConditionToken(condition,"tiresref","TIRESREFCODE");
    _checkConditionToken(condition,"tiresref.code","TIRESREFCODE");
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

    private void _collectAutoIncrementFields(ENAutoTiresDistance anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENAUTOTIRESDISTANCE", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENAUTOTIRESDISTANCE", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENAUTOTIRESDISTANCE", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENAUTOTIRESDISTANCE");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENAutoTiresDistanceDAO
