
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

import com.ksoe.energynet.valueobject.FINExecutor2Plan;
import com.ksoe.energynet.valueobject.filter.FINExecutor2PlanFilter;
import com.ksoe.energynet.valueobject.brief.FINExecutor2PlanShort;
import com.ksoe.energynet.valueobject.lists.FINExecutor2PlanShortList;


/**
 * DAO Object for FINExecutor2Plan;
 *
 */

public class FINExecutor2PlanDAOGen extends GenericDataMiner {

   public FINExecutor2PlanDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public FINExecutor2PlanDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   public boolean isEqual(FINExecutor2Plan inObject) throws PersistenceException
   {
      FINExecutor2Plan obj = new FINExecutor2Plan();
      obj.code = inObject.code;
      loadObject(obj);

	if(inObject.percentLoad == null && obj.percentLoad == null){}
	else
		if(inObject.percentLoad == null || obj.percentLoad == null) return false;
		else
			if ( ! inObject.percentLoad.equals(obj.percentLoad)){
				return false;
			}

	if(inObject.dateStart == null && obj.dateStart == null){}
	else
		if(inObject.dateStart == null || obj.dateStart == null) return false;
		else
			if (inObject.dateStart.compareTo(obj.dateStart) != 0){
				return false;
			}

	if(inObject.dateFinal == null && obj.dateFinal == null){}
	else
		if(inObject.dateFinal == null || obj.dateFinal == null) return false;
		else
			if (inObject.dateFinal.compareTo(obj.dateFinal) != 0){
				return false;
			}

	if(inObject.totalTimeHours == null && obj.totalTimeHours == null){}
	else
		if(inObject.totalTimeHours == null || obj.totalTimeHours == null) return false;
		else
			if ( ! inObject.totalTimeHours.equals(obj.totalTimeHours)){
				return false;
			}

	if(inObject.totalTimeDays == null && obj.totalTimeDays == null){}
	else
		if(inObject.totalTimeDays == null || obj.totalTimeDays == null) return false;
		else
			if ( ! inObject.totalTimeDays.equals(obj.totalTimeDays)){
				return false;
			}

	if(inObject.totalTimeManHours == null && obj.totalTimeManHours == null){}
	else
		if(inObject.totalTimeManHours == null || obj.totalTimeManHours == null) return false;
		else
			if ( ! inObject.totalTimeManHours.equals(obj.totalTimeManHours)){
				return false;
			}

	if(inObject.deliveryTime == null && obj.deliveryTime == null){}
	else
		if(inObject.deliveryTime == null || obj.deliveryTime == null) return false;
		else
			if ( ! inObject.deliveryTime.equals(obj.deliveryTime)){
				return false;
			}

	if(inObject.userGen == null && obj.userGen == null){}
	else
		if(inObject.userGen == null || obj.userGen == null) return false;
		else
			if ( ! inObject.userGen.equals(obj.userGen)){
				return false;
			}

	if(inObject.dateEdit == null && obj.dateEdit == null){}
	else
		if(inObject.dateEdit == null || obj.dateEdit == null) return false;
		else
			if (inObject.dateEdit.compareTo(obj.dateEdit) != 0){
				return false;
			}
     if (inObject.finExecutorTypeRef.code != obj.finExecutorTypeRef.code){
        return false;
     }
     if (inObject.planRef.code != obj.planRef.code){
        return false;
     }
     if (inObject.finExecutor.code != obj.finExecutor.code){
        return false;
     }
     if (inObject.budgetRef.code != obj.budgetRef.code){
        return false;
     }
      return true;
   }

   public int add(FINExecutor2Plan anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(FINExecutor2Plan anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

  anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO FINEXECUTOR2PLAN (CODE,PERCENTLOAD,DATESTART,DATEFINAL,TOTALTIMEHOURS,TOTALTIMEDAYS,TOTALTIMEMANHOURS,DELIVERYTIME,USERGEN,DATEEDIT,MODIFY_TIME,FINEXECUTORTYPEREFCODE,PLANREFCODE,FINEXECUTORCODE,BUDGETREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.percentLoad != null)
        anObject.percentLoad = anObject.percentLoad.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.percentLoad);
      if (anObject.dateStart == null)
        statement.setDate(3,null);
      else
        statement.setDate(3,new java.sql.Date(anObject.dateStart.getTime()));
      if (anObject.dateFinal == null)
        statement.setDate(4,null);
      else
        statement.setDate(4,new java.sql.Date(anObject.dateFinal.getTime()));
      if (anObject.totalTimeHours != null)
        anObject.totalTimeHours = anObject.totalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.totalTimeHours);
      if (anObject.totalTimeDays != null)
        anObject.totalTimeDays = anObject.totalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.totalTimeDays);
      if (anObject.totalTimeManHours != null)
        anObject.totalTimeManHours = anObject.totalTimeManHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.totalTimeManHours);
      if (anObject.deliveryTime != null)
        anObject.deliveryTime = anObject.deliveryTime.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.deliveryTime);
      statement.setString(9,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(10,null);
      else
        statement.setTimestamp(10,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(11,null);
      else
        statement.setBigDecimal(11,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.finExecutorTypeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.FINExecutorTypeDAOGen(connection,getUserProfile()).exists(anObject.finExecutorTypeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.FINExecutor2Plan.finExecutorTypeRef.code%} = {%"+anObject.finExecutorTypeRef.code+"%}");
        statement.setInt(12,anObject.finExecutorTypeRef.code);
      }
      else
        statement.setNull(12,java.sql.Types.INTEGER);
      if (anObject.planRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.FINExecutor2Plan.planRef.code%} = {%"+anObject.planRef.code+"%}");
        statement.setInt(13,anObject.planRef.code);
      }
      else
        statement.setNull(13,java.sql.Types.INTEGER);
      if (anObject.finExecutor.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.FINExecutorDAOGen(connection,getUserProfile()).exists(anObject.finExecutor.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.FINExecutor2Plan.finExecutor.code%} = {%"+anObject.finExecutor.code+"%}");
        statement.setInt(14,anObject.finExecutor.code);
      }
      else
        statement.setNull(14,java.sql.Types.INTEGER);
      if (anObject.budgetRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).exists(anObject.budgetRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.FINExecutor2Plan.budgetRef.code%} = {%"+anObject.budgetRef.code+"%}");
        statement.setInt(15,anObject.budgetRef.code);
      }
      else
        statement.setNull(15,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%FINExecutor2PlanDAOGen.add%}",e);
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

   public void save(FINExecutor2Plan anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(FINExecutor2Plan anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      FINExecutor2Plan oldObject = new FINExecutor2Plan();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+FINExecutor2Plan.modify_time_Field+" FROM  FINEXECUTOR2PLAN WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("PERCENTLOAD") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATESTART") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATEFINAL") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TOTALTIMEHOURS") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TOTALTIMEDAYS") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TOTALTIMEMANHOURS") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DELIVERYTIME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("USERGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATEEDIT") == 0)
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
          if(fieldNameStr.compareTo("FINEXECUTORTYPEREF") == 0)
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
          if(fieldNameStr.compareTo("FINEXECUTOR") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("BUDGETREF") == 0)
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
        "UPDATE FINEXECUTOR2PLAN SET  PERCENTLOAD = ? , DATESTART = ? , DATEFINAL = ? , TOTALTIMEHOURS = ? , TOTALTIMEDAYS = ? , TOTALTIMEMANHOURS = ? , DELIVERYTIME = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , FINEXECUTORTYPEREFCODE = ? , PLANREFCODE = ? , FINEXECUTORCODE = ? , BUDGETREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE FINEXECUTOR2PLAN SET ";
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
      if (anObject.percentLoad != null)
        anObject.percentLoad = anObject.percentLoad.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(1,anObject.percentLoad);
      if (anObject.dateStart == null)
        statement.setDate(2,null);
      else
        statement.setDate(2,new java.sql.Date(anObject.dateStart.getTime()));
      if (anObject.dateFinal == null)
        statement.setDate(3,null);
      else
        statement.setDate(3,new java.sql.Date(anObject.dateFinal.getTime()));
      if (anObject.totalTimeHours != null)
        anObject.totalTimeHours = anObject.totalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.totalTimeHours);
      if (anObject.totalTimeDays != null)
        anObject.totalTimeDays = anObject.totalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.totalTimeDays);
      if (anObject.totalTimeManHours != null)
        anObject.totalTimeManHours = anObject.totalTimeManHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.totalTimeManHours);
      if (anObject.deliveryTime != null)
        anObject.deliveryTime = anObject.deliveryTime.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.deliveryTime);
      statement.setString(8,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(9,null);
      else
        statement.setTimestamp(9,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(10,null);
      else
        statement.setBigDecimal(10,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.finExecutorTypeRef.code != Integer.MIN_VALUE)
        statement.setInt(11,anObject.finExecutorTypeRef.code);
      else
        statement.setNull(11,java.sql.Types.INTEGER);
      if (anObject.planRef.code != Integer.MIN_VALUE)
        statement.setInt(12,anObject.planRef.code);
      else
        statement.setNull(12,java.sql.Types.INTEGER);
      if (anObject.finExecutor.code != Integer.MIN_VALUE)
        statement.setInt(13,anObject.finExecutor.code);
      else
        statement.setNull(13,java.sql.Types.INTEGER);
      if (anObject.budgetRef.code != Integer.MIN_VALUE)
        statement.setInt(14,anObject.budgetRef.code);
      else
        statement.setNull(14,java.sql.Types.INTEGER);
          statement.setInt(15,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("PERCENTLOAD".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.percentLoad != null)
                    anObject.percentLoad = anObject.percentLoad.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.percentLoad);
                continue;
             }
            if("DATESTART".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dateStart == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.dateStart.getTime()));
                continue;
             }
            if("DATEFINAL".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dateFinal == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.dateFinal.getTime()));
                continue;
             }
            if("TOTALTIMEHOURS".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.totalTimeHours != null)
                    anObject.totalTimeHours = anObject.totalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.totalTimeHours);
                continue;
             }
            if("TOTALTIMEDAYS".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.totalTimeDays != null)
                    anObject.totalTimeDays = anObject.totalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.totalTimeDays);
                continue;
             }
            if("TOTALTIMEMANHOURS".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.totalTimeManHours != null)
                    anObject.totalTimeManHours = anObject.totalTimeManHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.totalTimeManHours);
                continue;
             }
            if("DELIVERYTIME".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.deliveryTime != null)
                    anObject.deliveryTime = anObject.deliveryTime.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.deliveryTime);
                continue;
             }
            if("USERGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.userGen);
                continue;
             }
            if("DATEEDIT".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dateEdit == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateEdit.getTime()));
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
            if("FINEXECUTORTYPEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.finExecutorTypeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.finExecutorTypeRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
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
            if("FINEXECUTOR".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.finExecutor.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.finExecutor.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("BUDGETREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.budgetRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.budgetRef.code);
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

   } // end of save(FINExecutor2Plan anObject,String[] anAttributes)


 public FINExecutor2PlanShort getShortObject(int anObjectCode) throws PersistenceException
  {
   FINExecutor2Plan filterObject = new FINExecutor2Plan();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (FINExecutor2PlanShort)list.get(0);
   return null;
  }

  public FINExecutor2PlanShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public FINExecutor2PlanShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public FINExecutor2PlanShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public FINExecutor2PlanShortList getFilteredList(FINExecutor2Plan filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public FINExecutor2PlanShortList getScrollableFilteredList(FINExecutor2Plan aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public FINExecutor2PlanShortList getScrollableFilteredList(FINExecutor2Plan aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public FINExecutor2PlanShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public FINExecutor2PlanShortList getScrollableFilteredList(FINExecutor2PlanFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public FINExecutor2PlanShortList getScrollableFilteredList(FINExecutor2PlanFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public FINExecutor2PlanShortList getScrollableFilteredList(FINExecutor2Plan aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public FINExecutor2PlanShortList getScrollableFilteredList(FINExecutor2Plan aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    FINExecutor2PlanShortList result = new FINExecutor2PlanShortList();
    FINExecutor2PlanShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "FINEXECUTOR2PLAN.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "FINEXECUTOR2PLAN.CODE"+
     ",FINEXECUTOR2PLAN.PERCENTLOAD"+
     ",FINEXECUTOR2PLAN.DATESTART"+
     ",FINEXECUTOR2PLAN.DATEFINAL"+
     ",FINEXECUTOR2PLAN.TOTALTIMEHOURS"+
     ",FINEXECUTOR2PLAN.TOTALTIMEDAYS"+
     ",FINEXECUTOR2PLAN.TOTALTIMEMANHOURS"+
     ",FINEXECUTOR2PLAN.DELIVERYTIME"+
     ",FINEXECUTOR2PLAN.USERGEN"+
     ",FINEXECUTOR2PLAN.DATEEDIT"+

      ", FINEXECUTORTYPE.CODE " +
      ", FINEXECUTORTYPE.NAME " +
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
      ", FINEXECUTOR.CODE " +
      ", FINEXECUTOR.NAME " +
      ", FINEXECUTOR.FINCODE " +
      ", FINEXECUTOR.FINTYPENAME " +
      ", FINEXECUTOR.FINTYPECODE " +
      ", FINEXECUTOR.FINKINDNAME " +
      ", FINEXECUTOR.FINKINDCODE " +
      ", FINEXECUTOR.FINCEHNAME " +
      ", FINEXECUTOR.FINCEHCODE " +
      ", FINEXECUTOR.AXORGID " +
      ", FINEXECUTOR.AXPARENTORGID " +
      ", FINEXECUTOR.AXPARENTORGNAME " +
      ", FINEXECUTOR.AXORGTYPEID " +
      ", FINEXECUTOR.AXORGTYPENAME " +
      ", ENDEPARTMENT.CODE " +
      ", ENDEPARTMENT.SHORTNAME " +
      ", ENDEPARTMENT.DATESTART " +
      ", ENDEPARTMENT.DATEFINAL " +
      ", ENDEPARTMENT.RENCODE " +
      ", ENDEPARTMENT.SHPZBALANS " +
      ", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
      ", ENDEPARTMENT.KAU_1884 " +
      ", ENDEPARTMENT.NAME_1884 " +
      ", ENDEPARTMENT.HRMORGANIZATIONID " +
     " FROM FINEXECUTOR2PLAN " +
     ", FINEXECUTORTYPE " +
     ", ENPLANWORK " +
     ", FINEXECUTOR " +
     ", ENDEPARTMENT " +
     //" WHERE "
  "";
     whereStr = " FINEXECUTORTYPE.CODE = FINEXECUTOR2PLAN.FINEXECUTORTYPEREFCODE" ; //+
      whereStr = whereStr +" AND ENPLANWORK.CODE = FINEXECUTOR2PLAN.PLANREFCODE" ; //+
      whereStr = whereStr +" AND FINEXECUTOR.CODE = FINEXECUTOR2PLAN.FINEXECUTORCODE" ; //+
      whereStr = whereStr +" AND ENDEPARTMENT.CODE = FINEXECUTOR2PLAN.BUDGETREFCODE" ; //+
    //selectStr = selectStr + " ${s} FINEXECUTOR2PLAN.CODE IN ( SELECT FINEXECUTOR2PLAN.CODE FROM FINEXECUTOR2PLAN ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.CODE = ?";
        }
        if(aFilterObject.percentLoad != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.PERCENTLOAD = ?";
        }
        if(aFilterObject.dateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.DATESTART = ?";
        }
        if(aFilterObject.dateFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.DATEFINAL = ?";
        }
        if(aFilterObject.totalTimeHours != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.TOTALTIMEHOURS = ?";
        }
        if(aFilterObject.totalTimeDays != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.TOTALTIMEDAYS = ?";
        }
        if(aFilterObject.totalTimeManHours != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.TOTALTIMEMANHOURS = ?";
        }
        if(aFilterObject.deliveryTime != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.DELIVERYTIME = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(FINEXECUTOR2PLAN.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(FINEXECUTOR2PLAN.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.MODIFY_TIME = ?";
        }
        if(aFilterObject.finExecutorTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "FINEXECUTOR2PLAN.FINEXECUTORTYPEREFCODE = ? ";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "FINEXECUTOR2PLAN.PLANREFCODE = ? ";
        }
        if(aFilterObject.finExecutor.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "FINEXECUTOR2PLAN.FINEXECUTORCODE = ? ";
        }
        if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "FINEXECUTOR2PLAN.BUDGETREFCODE = ? ";
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
        if(aFilterObject.percentLoad != null){
            number++;
            aFilterObject.percentLoad = aFilterObject.percentLoad.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.percentLoad);
        }
        if(aFilterObject.dateStart != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
        }
        if(aFilterObject.totalTimeHours != null){
            number++;
            aFilterObject.totalTimeHours = aFilterObject.totalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalTimeHours);
        }
        if(aFilterObject.totalTimeDays != null){
            number++;
            aFilterObject.totalTimeDays = aFilterObject.totalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalTimeDays);
        }
        if(aFilterObject.totalTimeManHours != null){
            number++;
            aFilterObject.totalTimeManHours = aFilterObject.totalTimeManHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalTimeManHours);
        }
        if(aFilterObject.deliveryTime != null){
            number++;
            aFilterObject.deliveryTime = aFilterObject.deliveryTime.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.deliveryTime);
        }

           if(aFilterObject.userGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.userGen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.dateEdit != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.finExecutorTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finExecutorTypeRef.code);
       }
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
       }
       if(aFilterObject.finExecutor.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finExecutor.code);
       }
       if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.budgetRef.code);
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

        anObject = new FINExecutor2PlanShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.percentLoad = set.getBigDecimal(2);
        if(anObject.percentLoad != null)
            anObject.percentLoad = anObject.percentLoad.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.dateStart = set.getDate(3);
        anObject.dateFinal = set.getDate(4);
        anObject.totalTimeHours = set.getBigDecimal(5);
        if(anObject.totalTimeHours != null)
            anObject.totalTimeHours = anObject.totalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.totalTimeDays = set.getBigDecimal(6);
        if(anObject.totalTimeDays != null)
            anObject.totalTimeDays = anObject.totalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.totalTimeManHours = set.getBigDecimal(7);
        if(anObject.totalTimeManHours != null)
            anObject.totalTimeManHours = anObject.totalTimeManHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.deliveryTime = set.getBigDecimal(8);
        if(anObject.deliveryTime != null)
            anObject.deliveryTime = anObject.deliveryTime.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userGen = set.getString(9);
        anObject.dateEdit = set.getTimestamp(10);

        anObject.finExecutorTypeRefCode = set.getInt(11);
    if(set.wasNull())
      anObject.finExecutorTypeRefCode = Integer.MIN_VALUE;
        anObject.finExecutorTypeRefName = set.getString(12);
        anObject.planRefCode = set.getInt(13);
    if(set.wasNull())
      anObject.planRefCode = Integer.MIN_VALUE;
        anObject.planRefDateGen = set.getTimestamp(14);
        anObject.planRefDateStart = set.getDate(15);
        anObject.planRefDateFinal = set.getDate(16);
        anObject.planRefYearGen = set.getInt(17);
    if(set.wasNull())
      anObject.planRefYearGen = Integer.MIN_VALUE;
        anObject.planRefMonthGen = set.getInt(18);
    if(set.wasNull())
      anObject.planRefMonthGen = Integer.MIN_VALUE;
        anObject.planRefYearOriginal = set.getInt(19);
    if(set.wasNull())
      anObject.planRefYearOriginal = Integer.MIN_VALUE;
        anObject.planRefMonthOriginal = set.getInt(20);
    if(set.wasNull())
      anObject.planRefMonthOriginal = Integer.MIN_VALUE;
        anObject.planRefUserGen = set.getString(21);
        anObject.planRefDateEdit = set.getDate(22);
        anObject.planRefWorkOrderNumber = set.getString(23);
        anObject.planRefDateWorkOrder = set.getDate(24);
        anObject.planRefPriConnectionNumber = set.getString(25);
        anObject.planRefDateEndPriConnection = set.getDate(26);
        anObject.planRefInvestWorksDescription = set.getString(27);
        anObject.planRefServicesFSideFinId = set.getInt(28);
    if(set.wasNull())
      anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;
        anObject.planRefServicesFSideCnNum = set.getString(29);
        anObject.planRefTotalTimeHours = set.getBigDecimal(30);
        if(anObject.planRefTotalTimeHours != null)
          anObject.planRefTotalTimeHours = anObject.planRefTotalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.planRefTotalTimeDays = set.getBigDecimal(31);
        if(anObject.planRefTotalTimeDays != null)
          anObject.planRefTotalTimeDays = anObject.planRefTotalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.planRefInvestItemNumber = set.getString(32);
        anObject.finExecutorCode = set.getInt(33);
    if(set.wasNull())
      anObject.finExecutorCode = Integer.MIN_VALUE;
        anObject.finExecutorName = set.getString(34);
        anObject.finExecutorFinCode = set.getInt(35);
    if(set.wasNull())
      anObject.finExecutorFinCode = Integer.MIN_VALUE;
        anObject.finExecutorFinTypeName = set.getString(36);
        anObject.finExecutorFinTypeCode = set.getInt(37);
    if(set.wasNull())
      anObject.finExecutorFinTypeCode = Integer.MIN_VALUE;
        anObject.finExecutorFinKindName = set.getString(38);
        anObject.finExecutorFinKindCode = set.getInt(39);
    if(set.wasNull())
      anObject.finExecutorFinKindCode = Integer.MIN_VALUE;
        anObject.finExecutorFinCehName = set.getString(40);
        anObject.finExecutorFinCehCode = set.getInt(41);
    if(set.wasNull())
      anObject.finExecutorFinCehCode = Integer.MIN_VALUE;
        anObject.finExecutorAxOrgId = set.getString(42);
        anObject.finExecutorAxParentOrgId = set.getString(43);
        anObject.finExecutorAxParentOrgName = set.getString(44);
        anObject.finExecutorAxOrgTypeId = set.getInt(45);
    if(set.wasNull())
      anObject.finExecutorAxOrgTypeId = Integer.MIN_VALUE;
        anObject.finExecutorAxOrgTypeName = set.getString(46);
        anObject.budgetRefCode = set.getInt(47);
    if(set.wasNull())
      anObject.budgetRefCode = Integer.MIN_VALUE;
        anObject.budgetRefShortName = set.getString(48);
        anObject.budgetRefDateStart = set.getDate(49);
        anObject.budgetRefDateFinal = set.getDate(50);
        anObject.budgetRefRenCode = set.getInt(51);
    if(set.wasNull())
      anObject.budgetRefRenCode = Integer.MIN_VALUE;
        anObject.budgetRefShpzBalans = set.getString(52);
        anObject.budgetRefKau_table_id_1884 = set.getInt(53);
    if(set.wasNull())
      anObject.budgetRefKau_table_id_1884 = Integer.MIN_VALUE;
        anObject.budgetRefKau_1884 = set.getString(54);
        anObject.budgetRefName_1884 = set.getString(55);
        anObject.budgetRefHrmorganizationid = set.getString(56);

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

  public int[] getFilteredCodeArrayOLD(FINExecutor2Plan aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT FINEXECUTOR2PLAN.CODE FROM FINEXECUTOR2PLAN";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "FINEXECUTOR2PLAN.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.CODE = ?";
        }
        if(aFilterObject.percentLoad != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.PERCENTLOAD = ?";
        }
        if(aFilterObject.dateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.DATESTART = ?";
        }
        if(aFilterObject.dateFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.DATEFINAL = ?";
        }
        if(aFilterObject.totalTimeHours != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.TOTALTIMEHOURS = ?";
        }
        if(aFilterObject.totalTimeDays != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.TOTALTIMEDAYS = ?";
        }
        if(aFilterObject.totalTimeManHours != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.TOTALTIMEMANHOURS = ?";
        }
        if(aFilterObject.deliveryTime != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.DELIVERYTIME = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINEXECUTOR2PLAN.USERGEN = ?";
             else
                 whereStr = whereStr + "  FINEXECUTOR2PLAN.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.MODIFY_TIME = ?";
        }
        if(aFilterObject.finExecutorTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " FINEXECUTOR2PLAN.FINEXECUTORTYPEREFCODE = ? ";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " FINEXECUTOR2PLAN.PLANREFCODE = ? ";
        }
        if(aFilterObject.finExecutor.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " FINEXECUTOR2PLAN.FINEXECUTORCODE = ? ";
        }
        if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " FINEXECUTOR2PLAN.BUDGETREFCODE = ? ";
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
        if(aFilterObject.percentLoad != null){
            number++;
            aFilterObject.percentLoad = aFilterObject.percentLoad.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.percentLoad);
        }
        if(aFilterObject.dateStart != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
        }
        if(aFilterObject.totalTimeHours != null){
            number++;
            aFilterObject.totalTimeHours = aFilterObject.totalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalTimeHours);
        }
        if(aFilterObject.totalTimeDays != null){
            number++;
            aFilterObject.totalTimeDays = aFilterObject.totalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalTimeDays);
        }
        if(aFilterObject.totalTimeManHours != null){
            number++;
            aFilterObject.totalTimeManHours = aFilterObject.totalTimeManHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalTimeManHours);
        }
        if(aFilterObject.deliveryTime != null){
            number++;
            aFilterObject.deliveryTime = aFilterObject.deliveryTime.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.deliveryTime);
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINEXECUTOR2PLAN.USERGEN = ?";
             else
                 whereStr = whereStr + " FINEXECUTOR2PLAN.USERGEN LIKE ?";

           if(aFilterObject.userGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.userGen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.dateEdit != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.finExecutorTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finExecutorTypeRef.code);
       }
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
       }
       if(aFilterObject.finExecutor.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finExecutor.code);
       }
       if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.budgetRef.code);
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

  public int[] getFilteredCodeArray(FINExecutor2PlanFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(FINExecutor2Plan aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT FINEXECUTOR2PLAN.CODE FROM FINEXECUTOR2PLAN";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "FINEXECUTOR2PLAN.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.CODE = ?";
        }
        if(aFilterObject.percentLoad != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.PERCENTLOAD = ?";
        }
        if(aFilterObject.dateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.DATESTART = ?";
        }
        if(aFilterObject.dateFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.DATEFINAL = ?";
        }
        if(aFilterObject.totalTimeHours != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.TOTALTIMEHOURS = ?";
        }
        if(aFilterObject.totalTimeDays != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.TOTALTIMEDAYS = ?";
        }
        if(aFilterObject.totalTimeManHours != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.TOTALTIMEMANHOURS = ?";
        }
        if(aFilterObject.deliveryTime != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.DELIVERYTIME = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINEXECUTOR2PLAN.USERGEN = ?";
             else
                 whereStr = whereStr + "  FINEXECUTOR2PLAN.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR2PLAN.MODIFY_TIME = ?";
        }
        if(aFilterObject.finExecutorTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " FINEXECUTOR2PLAN.FINEXECUTORTYPEREFCODE = ? ";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " FINEXECUTOR2PLAN.PLANREFCODE = ? ";
        }
        if(aFilterObject.finExecutor.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " FINEXECUTOR2PLAN.FINEXECUTORCODE = ? ";
        }
        if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " FINEXECUTOR2PLAN.BUDGETREFCODE = ? ";
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
        if(aFilterObject.percentLoad != null){
            number++;
            aFilterObject.percentLoad = aFilterObject.percentLoad.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.percentLoad);
        }
        if(aFilterObject.dateStart != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
        }
        if(aFilterObject.totalTimeHours != null){
            number++;
            aFilterObject.totalTimeHours = aFilterObject.totalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalTimeHours);
        }
        if(aFilterObject.totalTimeDays != null){
            number++;
            aFilterObject.totalTimeDays = aFilterObject.totalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalTimeDays);
        }
        if(aFilterObject.totalTimeManHours != null){
            number++;
            aFilterObject.totalTimeManHours = aFilterObject.totalTimeManHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalTimeManHours);
        }
        if(aFilterObject.deliveryTime != null){
            number++;
            aFilterObject.deliveryTime = aFilterObject.deliveryTime.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.deliveryTime);
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINEXECUTOR2PLAN.USERGEN = ?";
             else
                 whereStr = whereStr + " FINEXECUTOR2PLAN.USERGEN LIKE ?";

           if(aFilterObject.userGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.userGen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.dateEdit != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.finExecutorTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finExecutorTypeRef.code);
       }
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
       }
       if(aFilterObject.finExecutor.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finExecutor.code);
       }
       if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.budgetRef.code);
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


   public FINExecutor2Plan getObject(int uid) throws PersistenceException
   {
    FINExecutor2Plan result = new FINExecutor2Plan();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(FINExecutor2Plan anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  FINEXECUTOR2PLAN.CODE, FINEXECUTOR2PLAN.PERCENTLOAD, FINEXECUTOR2PLAN.DATESTART, FINEXECUTOR2PLAN.DATEFINAL, FINEXECUTOR2PLAN.TOTALTIMEHOURS, FINEXECUTOR2PLAN.TOTALTIMEDAYS, FINEXECUTOR2PLAN.TOTALTIMEMANHOURS, FINEXECUTOR2PLAN.DELIVERYTIME, FINEXECUTOR2PLAN.USERGEN, FINEXECUTOR2PLAN.DATEEDIT, FINEXECUTOR2PLAN.MODIFY_TIME, FINEXECUTOR2PLAN.FINEXECUTORTYPEREFCODE, FINEXECUTOR2PLAN.PLANREFCODE, FINEXECUTOR2PLAN.FINEXECUTORCODE, FINEXECUTOR2PLAN.BUDGETREFCODE "
    +" FROM FINEXECUTOR2PLAN WHERE FINEXECUTOR2PLAN.CODE = ?";

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
        anObject.percentLoad = set.getBigDecimal(2);
        if(anObject.percentLoad != null)
            anObject.percentLoad = anObject.percentLoad.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.dateStart = set.getDate(3);
        anObject.dateFinal = set.getDate(4);
        anObject.totalTimeHours = set.getBigDecimal(5);
        if(anObject.totalTimeHours != null)
            anObject.totalTimeHours = anObject.totalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.totalTimeDays = set.getBigDecimal(6);
        if(anObject.totalTimeDays != null)
            anObject.totalTimeDays = anObject.totalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.totalTimeManHours = set.getBigDecimal(7);
        if(anObject.totalTimeManHours != null)
            anObject.totalTimeManHours = anObject.totalTimeManHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.deliveryTime = set.getBigDecimal(8);
        if(anObject.deliveryTime != null)
            anObject.deliveryTime = anObject.deliveryTime.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userGen = set.getString(9);
        anObject.dateEdit = set.getTimestamp(10);
        anObject.modify_time = set.getLong(11);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.finExecutorTypeRef.code = set.getInt(12);
        if ( set.wasNull() )
            anObject.finExecutorTypeRef.code = Integer.MIN_VALUE;
        anObject.planRef.code = set.getInt(13);
        if ( set.wasNull() )
            anObject.planRef.code = Integer.MIN_VALUE;
        anObject.finExecutor.code = set.getInt(14);
        if ( set.wasNull() )
            anObject.finExecutor.code = Integer.MIN_VALUE;
        anObject.budgetRef.code = set.getInt(15);
        if ( set.wasNull() )
            anObject.budgetRef.code = Integer.MIN_VALUE;
        if(anObject.finExecutorTypeRef.code != Integer.MIN_VALUE)
        {
           anObject.setFinExecutorTypeRef(
      new com.ksoe.energynet.dataminer.generated.FINExecutorTypeDAOGen(connection,getUserProfile()).getRef(anObject.finExecutorTypeRef.code));
    }
        if(anObject.planRef.code != Integer.MIN_VALUE)
        {
           anObject.setPlanRef(
      new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).getRef(anObject.planRef.code));
    }
        if(anObject.finExecutor.code != Integer.MIN_VALUE)
        {
           anObject.setFinExecutor(
      new com.ksoe.energynet.dataminer.generated.FINExecutorDAOGen(connection,getUserProfile()).getObject(anObject.finExecutor.code));
    }
        if(anObject.budgetRef.code != Integer.MIN_VALUE)
        {
           anObject.setBudgetRef(
      new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getRef(anObject.budgetRef.code));
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


  public com.ksoe.energynet.valueobject.references.FINExecutor2PlanRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.FINExecutor2PlanRef ref = new com.ksoe.energynet.valueobject.references.FINExecutor2PlanRef();
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

    selectStr = "DELETE FROM  FINEXECUTOR2PLAN WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    FINExecutor2Plan object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%FINExecutor2Plan.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(FINExecutor2Plan.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%FINExecutor2Plan.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(FINExecutor2Plan.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%FINExecutor2Plan.getObject%} access denied");

    selectStr =

    "SELECT  FINEXECUTOR2PLAN.CODE FROM  FINEXECUTOR2PLAN WHERE  FINEXECUTOR2PLAN.CODE = ?";
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
    _checkConditionToken(condition,"code","FINEXECUTOR2PLAN.CODE");
    _checkConditionToken(condition,"percentload","FINEXECUTOR2PLAN.PERCENTLOAD");
    _checkConditionToken(condition,"datestart","FINEXECUTOR2PLAN.DATESTART");
    _checkConditionToken(condition,"datefinal","FINEXECUTOR2PLAN.DATEFINAL");
    _checkConditionToken(condition,"totaltimehours","FINEXECUTOR2PLAN.TOTALTIMEHOURS");
    _checkConditionToken(condition,"totaltimedays","FINEXECUTOR2PLAN.TOTALTIMEDAYS");
    _checkConditionToken(condition,"totaltimemanhours","FINEXECUTOR2PLAN.TOTALTIMEMANHOURS");
    _checkConditionToken(condition,"deliverytime","FINEXECUTOR2PLAN.DELIVERYTIME");
    _checkConditionToken(condition,"usergen","FINEXECUTOR2PLAN.USERGEN");
    _checkConditionToken(condition,"dateedit","FINEXECUTOR2PLAN.DATEEDIT");
    _checkConditionToken(condition,"modify_time","FINEXECUTOR2PLAN.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"finexecutortyperef","FINEXECUTORTYPEREFCODE");
    _checkConditionToken(condition,"finexecutortyperef.code","FINEXECUTORTYPEREFCODE");
    _checkConditionToken(condition,"planref","PLANREFCODE");
    _checkConditionToken(condition,"planref.code","PLANREFCODE");
    _checkConditionToken(condition,"finexecutor","FINEXECUTORCODE");
    _checkConditionToken(condition,"finexecutor.code","FINEXECUTORCODE");
    _checkConditionToken(condition,"budgetref","BUDGETREFCODE");
    _checkConditionToken(condition,"budgetref.code","BUDGETREFCODE");
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

  private void _collectAutoIncrementFields(FINExecutor2Plan anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("FINEXECUTOR2PLAN", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("FINEXECUTOR2PLAN", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("FINEXECUTOR2PLAN", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: FINEXECUTOR2PLAN");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of FINExecutor2PlanDAO
