
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
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

import com.ksoe.energynet.valueobject.ENTravelSheetFuelFill;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetFuelFillFilter;
import com.ksoe.energynet.valueobject.brief.ENTravelSheetFuelFillShort;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetFuelFillShortList;


/**
 * DAO Object for ENTravelSheetFuelFill;
 *
 */

public class ENTravelSheetFuelFillDAOGen extends GenericDataMiner {

   public ENTravelSheetFuelFillDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENTravelSheetFuelFillDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   protected boolean isEqual(ENTravelSheetFuelFill inObject) throws PersistenceException
   {
      ENTravelSheetFuelFill obj = new ENTravelSheetFuelFill();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.reg_id != obj.reg_id){
				return false;
			}

	if(inObject.timeGen == null && obj.timeGen == null){}
	else
		if(inObject.timeGen == null || obj.timeGen == null) return false;
		else
			if ( ! inObject.timeGen.equals(obj.timeGen)){
				return false;
			}

	if(inObject.countGen == null && obj.countGen == null){}
	else
		if(inObject.countGen == null || obj.countGen == null) return false;
		else
			if ( ! inObject.countGen.equals(obj.countGen)){
				return false;
			}

	if(inObject.timeReceived == null && obj.timeReceived == null){}
	else
		if(inObject.timeReceived == null || obj.timeReceived == null) return false;
		else
			if ( ! inObject.timeReceived.equals(obj.timeReceived)){
				return false;
			}
     if (inObject.travelSheetRef.code != obj.travelSheetRef.code){
        return false;
     }
      return true;
   }

   public int add(ENTravelSheetFuelFill anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENTravelSheetFuelFill anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

  anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENTRAVELSHEETFUELFILL (CODE,REG_ID,TIMEGEN,COUNTGEN,TIMERECEIVED,MODIFY_TIME,TRAVELSHEETREFCODE) VALUES (?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.reg_id != Integer.MIN_VALUE )
         statement.setInt(2,anObject.reg_id);
      else
         statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.timeGen == null)
        statement.setTimestamp(3,null);
      else
        statement.setTimestamp(3,new java.sql.Timestamp(anObject.timeGen.getTime()));
      if (anObject.countGen != null)
        anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.countGen);
      if (anObject.timeReceived == null)
        statement.setTimestamp(5,null);
      else
        statement.setTimestamp(5,new java.sql.Timestamp(anObject.timeReceived.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(6,null);
      else
        statement.setBigDecimal(6,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.travelSheetRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTravelSheetDAOGen(connection,getUserProfile()).exists(anObject.travelSheetRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTravelSheetFuelFill.travelSheetRef.code%} = {%"+anObject.travelSheetRef.code+"%}");
        statement.setInt(7,anObject.travelSheetRef.code);
      }
      else
        statement.setNull(7,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENTravelSheetFuelFillDAOGen.add%}",e);
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

   public void save(ENTravelSheetFuelFill anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENTravelSheetFuelFill anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENTravelSheetFuelFill oldObject = new ENTravelSheetFuelFill();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENTravelSheetFuelFill.modify_time_Field+" FROM  ENTRAVELSHEETFUELFILL WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("REG_ID") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TIMEGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COUNTGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TIMERECEIVED") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("MODIFY_TIME") == 0)
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
        "UPDATE ENTRAVELSHEETFUELFILL SET  REG_ID = ? , TIMEGEN = ? , COUNTGEN = ? , TIMERECEIVED = ? , MODIFY_TIME = ? , TRAVELSHEETREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENTRAVELSHEETFUELFILL SET ";
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
      if (anObject.reg_id != Integer.MIN_VALUE )
         statement.setInt(1,anObject.reg_id);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.timeGen == null)
        statement.setTimestamp(2,null);
      else
        statement.setTimestamp(2,new java.sql.Timestamp(anObject.timeGen.getTime()));
      if (anObject.countGen != null)
        anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.countGen);
      if (anObject.timeReceived == null)
        statement.setTimestamp(4,null);
      else
        statement.setTimestamp(4,new java.sql.Timestamp(anObject.timeReceived.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(5,null);
      else
        statement.setBigDecimal(5,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.travelSheetRef.code != Integer.MIN_VALUE)
        statement.setInt(6,anObject.travelSheetRef.code);
      else
        statement.setNull(6,java.sql.Types.INTEGER);
          statement.setInt(7,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("REG_ID".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.reg_id);
                continue;
             }
            if("TIMEGEN".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.timeGen == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.timeGen.getTime()));
                continue;
             }
            if("COUNTGEN".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.countGen != null)
                    anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.countGen);
                continue;
             }
            if("TIMERECEIVED".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.timeReceived == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.timeReceived.getTime()));
                continue;
             }
            if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.modify_time == Long.MIN_VALUE)
                    statement.setBigDecimal(i+1,null);
                else
                     statement.setBigDecimal(i+1,new java.math.BigDecimal(anObject.modify_time));
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

   } // end of save(ENTravelSheetFuelFill anObject,String[] anAttributes)


 public ENTravelSheetFuelFillShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENTravelSheetFuelFill filterObject = new ENTravelSheetFuelFill();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENTravelSheetFuelFillShort)list.get(0);
   return null;
  }

  public ENTravelSheetFuelFillShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENTravelSheetFuelFillShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENTravelSheetFuelFillShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENTravelSheetFuelFillShortList getFilteredList(ENTravelSheetFuelFill filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENTravelSheetFuelFillShortList getScrollableFilteredList(ENTravelSheetFuelFill aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENTravelSheetFuelFillShortList getScrollableFilteredList(ENTravelSheetFuelFill aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENTravelSheetFuelFillShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENTravelSheetFuelFillShortList getScrollableFilteredList(ENTravelSheetFuelFillFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENTravelSheetFuelFillShortList getScrollableFilteredList(ENTravelSheetFuelFillFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENTravelSheetFuelFillShortList getScrollableFilteredList(ENTravelSheetFuelFill aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENTravelSheetFuelFillShortList getScrollableFilteredList(ENTravelSheetFuelFill aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENTravelSheetFuelFillShortList result = new ENTravelSheetFuelFillShortList();
    ENTravelSheetFuelFillShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRAVELSHEETFUELFILL.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENTRAVELSHEETFUELFILL.CODE"+
     ",ENTRAVELSHEETFUELFILL.TIMEGEN"+
     ",ENTRAVELSHEETFUELFILL.COUNTGEN"+
     ",ENTRAVELSHEETFUELFILL.TIMERECEIVED"+

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
     " FROM ENTRAVELSHEETFUELFILL " +
     ", ENTRAVELSHEET " +
     //" WHERE "
  "";
     whereStr = " ENTRAVELSHEET.CODE = ENTRAVELSHEETFUELFILL.TRAVELSHEETREFCODE" ; //+
    //selectStr = selectStr + " ${s} ENTRAVELSHEETFUELFILL.CODE IN ( SELECT ENTRAVELSHEETFUELFILL.CODE FROM ENTRAVELSHEETFUELFILL ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETFUELFILL.CODE = ?";
        }
        if(aFilterObject.reg_id != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETFUELFILL.REG_ID = ?";
        }
        if(aFilterObject.timeGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETFUELFILL.TIMEGEN = ?";
        }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETFUELFILL.COUNTGEN = ?";
        }
        if(aFilterObject.timeReceived != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETFUELFILL.TIMERECEIVED = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETFUELFILL.MODIFY_TIME = ?";
        }
        if(aFilterObject.travelSheetRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRAVELSHEETFUELFILL.TRAVELSHEETREFCODE = ? ";
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
         if(aFilterObject.reg_id != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.reg_id);
         }
        if(aFilterObject.timeGen != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeGen.getTime()));
        }
        if(aFilterObject.countGen != null){
            number++;
            aFilterObject.countGen = aFilterObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.timeReceived != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeReceived.getTime()));
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
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
      for (i = 0; set.next(); i++) {
        /*
        if (i < fromPosition)
          continue;
        else if (i >= fromPosition + quantity) {
          i++;
          break;
        } */

        anObject = new ENTravelSheetFuelFillShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.timeGen = set.getTimestamp(2);
        anObject.countGen = set.getBigDecimal(3);
        if(anObject.countGen != null)
            anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.timeReceived = set.getTimestamp(4);

        anObject.travelSheetRefCode = set.getInt(5);
    if(set.wasNull())
      anObject.travelSheetRefCode = Integer.MIN_VALUE;
        anObject.travelSheetRefNumberGen = set.getString(6);
        anObject.travelSheetRefDateStart = set.getDate(7);
        anObject.travelSheetRefDateFinal = set.getDate(8);
        anObject.travelSheetRefSpeedometerStart = set.getBigDecimal(9);
        if(anObject.travelSheetRefSpeedometerStart != null)
          anObject.travelSheetRefSpeedometerStart = anObject.travelSheetRefSpeedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.travelSheetRefSpeedometerFinal = set.getBigDecimal(10);
        if(anObject.travelSheetRefSpeedometerFinal != null)
          anObject.travelSheetRefSpeedometerFinal = anObject.travelSheetRefSpeedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.travelSheetRefFuelCounterStart = set.getBigDecimal(11);
        if(anObject.travelSheetRefFuelCounterStart != null)
          anObject.travelSheetRefFuelCounterStart = anObject.travelSheetRefFuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.travelSheetRefFuelCounterFinal = set.getBigDecimal(12);
        if(anObject.travelSheetRefFuelCounterFinal != null)
          anObject.travelSheetRefFuelCounterFinal = anObject.travelSheetRefFuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.travelSheetRefTimeStart = set.getTimestamp(13);
        anObject.travelSheetRefTimeFinal = set.getTimestamp(14);
        anObject.travelSheetRefDateEdit = set.getTimestamp(15);
        anObject.travelSheetRefUserGen = set.getString(16);

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

  public int[] getFilteredCodeArrayOLD(ENTravelSheetFuelFill aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRAVELSHEETFUELFILL.CODE FROM ENTRAVELSHEETFUELFILL";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRAVELSHEETFUELFILL.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETFUELFILL.CODE = ?";
        }
        if(aFilterObject.reg_id != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETFUELFILL.REG_ID = ?";
        }
        if(aFilterObject.timeGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETFUELFILL.TIMEGEN = ?";
        }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETFUELFILL.COUNTGEN = ?";
        }
        if(aFilterObject.timeReceived != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETFUELFILL.TIMERECEIVED = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETFUELFILL.MODIFY_TIME = ?";
        }
        if(aFilterObject.travelSheetRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEETFUELFILL.TRAVELSHEETREFCODE = ? ";
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
         if(aFilterObject.reg_id != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.reg_id);
         }
        if(aFilterObject.timeGen != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeGen.getTime()));
        }
        if(aFilterObject.countGen != null){
            number++;
            aFilterObject.countGen = aFilterObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.timeReceived != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeReceived.getTime()));
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
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

  public int[] getFilteredCodeArray(ENTravelSheetFuelFillFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENTravelSheetFuelFill aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRAVELSHEETFUELFILL.CODE FROM ENTRAVELSHEETFUELFILL";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRAVELSHEETFUELFILL.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETFUELFILL.CODE = ?";
        }
        if(aFilterObject.reg_id != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETFUELFILL.REG_ID = ?";
        }
        if(aFilterObject.timeGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETFUELFILL.TIMEGEN = ?";
        }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETFUELFILL.COUNTGEN = ?";
        }
        if(aFilterObject.timeReceived != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETFUELFILL.TIMERECEIVED = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEETFUELFILL.MODIFY_TIME = ?";
        }
        if(aFilterObject.travelSheetRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEETFUELFILL.TRAVELSHEETREFCODE = ? ";
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
         if(aFilterObject.reg_id != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.reg_id);
         }
        if(aFilterObject.timeGen != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeGen.getTime()));
        }
        if(aFilterObject.countGen != null){
            number++;
            aFilterObject.countGen = aFilterObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.timeReceived != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeReceived.getTime()));
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
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


   public ENTravelSheetFuelFill getObject(int uid) throws PersistenceException
   {
    ENTravelSheetFuelFill result = new ENTravelSheetFuelFill();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENTravelSheetFuelFill anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENTRAVELSHEETFUELFILL.CODE, ENTRAVELSHEETFUELFILL.REG_ID, ENTRAVELSHEETFUELFILL.TIMEGEN, ENTRAVELSHEETFUELFILL.COUNTGEN, ENTRAVELSHEETFUELFILL.TIMERECEIVED, ENTRAVELSHEETFUELFILL.MODIFY_TIME, ENTRAVELSHEETFUELFILL.TRAVELSHEETREFCODE "
    +" FROM ENTRAVELSHEETFUELFILL WHERE ENTRAVELSHEETFUELFILL.CODE = ?";

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
        anObject.reg_id = set.getInt(2);
        if ( set.wasNull() )
           anObject.reg_id = Integer.MIN_VALUE;
        anObject.timeGen = set.getTimestamp(3);
        anObject.countGen = set.getBigDecimal(4);
        if(anObject.countGen != null)
            anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.timeReceived = set.getTimestamp(5);
        anObject.modify_time = set.getLong(6);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.travelSheetRef.code = set.getInt(7);
        if ( set.wasNull() )
            anObject.travelSheetRef.code = Integer.MIN_VALUE;
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


  public com.ksoe.energynet.valueobject.references.ENTravelSheetFuelFillRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENTravelSheetFuelFillRef ref = new com.ksoe.energynet.valueobject.references.ENTravelSheetFuelFillRef();
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

    selectStr = "DELETE FROM  ENTRAVELSHEETFUELFILL WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENTravelSheetFuelFill object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENTravelSheetFuelFill.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENTravelSheetFuelFill.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENTravelSheetFuelFill.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTravelSheetFuelFill.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENTravelSheetFuelFill.getObject%} access denied");

    selectStr =

    "SELECT  ENTRAVELSHEETFUELFILL.CODE FROM  ENTRAVELSHEETFUELFILL WHERE  ENTRAVELSHEETFUELFILL.CODE = ?";
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
    _checkConditionToken(condition,"code","ENTRAVELSHEETFUELFILL.CODE");
    _checkConditionToken(condition,"reg_id","ENTRAVELSHEETFUELFILL.REG_ID");
    _checkConditionToken(condition,"timegen","ENTRAVELSHEETFUELFILL.TIMEGEN");
    _checkConditionToken(condition,"countgen","ENTRAVELSHEETFUELFILL.COUNTGEN");
    _checkConditionToken(condition,"timereceived","ENTRAVELSHEETFUELFILL.TIMERECEIVED");
    _checkConditionToken(condition,"modify_time","ENTRAVELSHEETFUELFILL.MODIFY_TIME");
      // relationship conditions
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

  private void _collectAutoIncrementFields(ENTravelSheetFuelFill anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENTRAVELSHEETFUELFILL", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENTRAVELSHEETFUELFILL", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENTRAVELSHEETFUELFILL", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENTRAVELSHEETFUELFILL");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENTravelSheetFuelFillDAO
