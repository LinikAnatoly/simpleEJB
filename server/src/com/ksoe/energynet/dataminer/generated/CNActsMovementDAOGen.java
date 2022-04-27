
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
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

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.valueobject.CNActsMovement;
import com.ksoe.energynet.valueobject.brief.CNActsMovementShort;
import com.ksoe.energynet.valueobject.filter.CNActsMovementFilter;
import com.ksoe.energynet.valueobject.lists.CNActsMovementShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for CNActsMovement;
 *
 */

public class CNActsMovementDAOGen extends GenericDataMiner {

  public CNActsMovementDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public CNActsMovementDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(CNActsMovement inObject) throws PersistenceException
   {
      CNActsMovement obj = new CNActsMovement();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.id_state != obj.id_state){
       return false;
     }

     if (inObject.state_name != obj.state_name){
       return false;
     }

     if ( ! inObject.startdate.equals(obj.startdate)){
       return false;
     }

     if (inObject.note != obj.note){
       return false;
     }

     if (inObject.id_parent != obj.id_parent){
       return false;
     }

     if (inObject.id_user != obj.id_user){
       return false;
     }

     if ( ! inObject.realdate.equals(obj.realdate)){
       return false;
     }

     if (inObject.canceled != obj.canceled){
       return false;
     }

     if (inObject.id_user_canceled != obj.id_user_canceled){
       return false;
     }

     if ( ! inObject.canceleddate.equals(obj.canceleddate)){
       return false;
     }

     if (inObject.cancelednote != obj.cancelednote){
       return false;
     }

     if (inObject.is_completed != obj.is_completed){
       return false;
     }

     if (inObject.id_movement_status != obj.id_movement_status){
       return false;
     }

     if (inObject.read_status != obj.read_status){
       return false;
     }

     if (inObject.id_user_read != obj.id_user_read){
       return false;
     }

     if ( ! inObject.read_date.equals(obj.read_date)){
       return false;
     }

     if (inObject.id_user_created != obj.id_user_created){
       return false;
     }

     if ( ! inObject.modifytime.equals(obj.modifytime)){
       return false;
     }

     if ( ! inObject.pastdate.equals(obj.pastdate)){
       return false;
     }
     if (inObject.subsystemRef.code != obj.subsystemRef.code){
        return false;
     }
     if (inObject.actsPackRef.code != obj.actsPackRef.code){
        return false;
     }
      return true;
   }

   public int add(CNActsMovement anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(CNActsMovement anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO CNACTSMOVEMENT (CODE,ID_STATE,STATE_NAME,STARTDATE,NOTE,ID_PARENT,ID_USER,REALDATE,CANCELED,ID_USER_CANCELED,CANCELEDDATE,CANCELEDNOTE,IS_COMPLETED,ID_MOVEMENT_STATUS,READ_STATUS,ID_USER_READ,READ_DATE,ID_USER_CREATED,MODIFYTIME,PASTDATE,SUBSYSTEMREFCODE,ACTSPACKREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.id_state != Integer.MIN_VALUE )
         statement.setInt(2,anObject.id_state);
      else
         statement.setNull(2,java.sql.Types.INTEGER);
      statement.setString(3,anObject.state_name);
      if (anObject.startdate == null)
        statement.setTimestamp(4,null);
      else
        statement.setTimestamp(4,new java.sql.Timestamp(anObject.startdate.getTime()));
      statement.setString(5,anObject.note);
      if (anObject.id_parent != Integer.MIN_VALUE )
         statement.setInt(6,anObject.id_parent);
      else
         statement.setNull(6,java.sql.Types.INTEGER);
      if (anObject.id_user != Integer.MIN_VALUE )
         statement.setInt(7,anObject.id_user);
      else
         statement.setNull(7,java.sql.Types.INTEGER);
      if (anObject.realdate == null)
        statement.setTimestamp(8,null);
      else
        statement.setTimestamp(8,new java.sql.Timestamp(anObject.realdate.getTime()));
      if (anObject.canceled != Integer.MIN_VALUE )
         statement.setInt(9,anObject.canceled);
      else
         statement.setNull(9,java.sql.Types.INTEGER);
      if (anObject.id_user_canceled != Integer.MIN_VALUE )
         statement.setInt(10,anObject.id_user_canceled);
      else
         statement.setNull(10,java.sql.Types.INTEGER);
      if (anObject.canceleddate == null)
        statement.setTimestamp(11,null);
      else
        statement.setTimestamp(11,new java.sql.Timestamp(anObject.canceleddate.getTime()));
      statement.setString(12,anObject.cancelednote);
      if (anObject.is_completed != Integer.MIN_VALUE )
         statement.setInt(13,anObject.is_completed);
      else
         statement.setNull(13,java.sql.Types.INTEGER);
      if (anObject.id_movement_status != Integer.MIN_VALUE )
         statement.setInt(14,anObject.id_movement_status);
      else
         statement.setNull(14,java.sql.Types.INTEGER);
      if (anObject.read_status != Integer.MIN_VALUE )
         statement.setInt(15,anObject.read_status);
      else
         statement.setNull(15,java.sql.Types.INTEGER);
      if (anObject.id_user_read != Integer.MIN_VALUE )
         statement.setInt(16,anObject.id_user_read);
      else
         statement.setNull(16,java.sql.Types.INTEGER);
      if (anObject.read_date == null)
        statement.setTimestamp(17,null);
      else
        statement.setTimestamp(17,new java.sql.Timestamp(anObject.read_date.getTime()));
      if (anObject.id_user_created != Integer.MIN_VALUE )
         statement.setInt(18,anObject.id_user_created);
      else
         statement.setNull(18,java.sql.Types.INTEGER);
      if (anObject.modifytime == null)
        statement.setTimestamp(19,null);
      else
        statement.setTimestamp(19,new java.sql.Timestamp(anObject.modifytime.getTime()));
      if (anObject.pastdate == null)
        statement.setTimestamp(20,null);
      else
        statement.setTimestamp(20,new java.sql.Timestamp(anObject.pastdate.getTime()));
      if (anObject.subsystemRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.CNSubsystemTypeDAOGen(connection,getUserProfile()).exists(anObject.subsystemRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.CNActsMovement.subsystemRef.code%} = {%"+anObject.subsystemRef.code+"%}");
        statement.setInt(21,anObject.subsystemRef.code);
      }
      else
        statement.setNull(21,java.sql.Types.INTEGER);
      if (anObject.actsPackRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.CNActsPackDAOGen(connection,getUserProfile()).exists(anObject.actsPackRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.CNActsMovement.actsPackRef.code%} = {%"+anObject.actsPackRef.code+"%}");
        statement.setInt(22,anObject.actsPackRef.code);
      }
      else
        statement.setNull(22,java.sql.Types.INTEGER);

      statement.execute();
      return anObject.code;
     }
    catch(SQLException e)
     {
           _sequenceTable.clear();
           new SystemException(e.getMessage(), e);
      return Integer.MIN_VALUE;
     }
        catch(Exception e)
     {
      _sequenceTable.clear();
      throw new PersistenceException("Error in method {%CNActsMovementDAOGen.add%}",e);
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

   public void save(CNActsMovement anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(CNActsMovement anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("ID_STATE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("STATE_NAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("STARTDATE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("NOTE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ID_PARENT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ID_USER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("REALDATE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CANCELED") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ID_USER_CANCELED") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CANCELEDDATE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CANCELEDNOTE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("IS_COMPLETED") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ID_MOVEMENT_STATUS") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("READ_STATUS") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ID_USER_READ") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("READ_DATE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ID_USER_CREATED") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("MODIFYTIME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PASTDATE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUBSYSTEMREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ACTSPACKREF") == 0)
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
        "UPDATE CNACTSMOVEMENT SET  ID_STATE = ? , STATE_NAME = ? , STARTDATE = ? , NOTE = ? , ID_PARENT = ? , ID_USER = ? , REALDATE = ? , CANCELED = ? , ID_USER_CANCELED = ? , CANCELEDDATE = ? , CANCELEDNOTE = ? , IS_COMPLETED = ? , ID_MOVEMENT_STATUS = ? , READ_STATUS = ? , ID_USER_READ = ? , READ_DATE = ? , ID_USER_CREATED = ? , MODIFYTIME = ? , PASTDATE = ? , SUBSYSTEMREFCODE = ? , ACTSPACKREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE CNACTSMOVEMENT SET ";
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
      if (anObject.id_state != Integer.MIN_VALUE )
         statement.setInt(1,anObject.id_state);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.state_name);
      if (anObject.startdate == null)
        statement.setDate(3,null);
      else
        statement.setTimestamp(3,new java.sql.Timestamp(anObject.startdate.getTime()));
      statement.setString(4,anObject.note);
      if (anObject.id_parent != Integer.MIN_VALUE )
         statement.setInt(5,anObject.id_parent);
      else
         statement.setNull(5,java.sql.Types.INTEGER);
      if (anObject.id_user != Integer.MIN_VALUE )
         statement.setInt(6,anObject.id_user);
      else
         statement.setNull(6,java.sql.Types.INTEGER);
      if (anObject.realdate == null)
        statement.setDate(7,null);
      else
        statement.setTimestamp(7,new java.sql.Timestamp(anObject.realdate.getTime()));
      if (anObject.canceled != Integer.MIN_VALUE )
         statement.setInt(8,anObject.canceled);
      else
         statement.setNull(8,java.sql.Types.INTEGER);
      if (anObject.id_user_canceled != Integer.MIN_VALUE )
         statement.setInt(9,anObject.id_user_canceled);
      else
         statement.setNull(9,java.sql.Types.INTEGER);
      if (anObject.canceleddate == null)
        statement.setDate(10,null);
      else
        statement.setTimestamp(10,new java.sql.Timestamp(anObject.canceleddate.getTime()));
      statement.setString(11,anObject.cancelednote);
      if (anObject.is_completed != Integer.MIN_VALUE )
         statement.setInt(12,anObject.is_completed);
      else
         statement.setNull(12,java.sql.Types.INTEGER);
      if (anObject.id_movement_status != Integer.MIN_VALUE )
         statement.setInt(13,anObject.id_movement_status);
      else
         statement.setNull(13,java.sql.Types.INTEGER);
      if (anObject.read_status != Integer.MIN_VALUE )
         statement.setInt(14,anObject.read_status);
      else
         statement.setNull(14,java.sql.Types.INTEGER);
      if (anObject.id_user_read != Integer.MIN_VALUE )
         statement.setInt(15,anObject.id_user_read);
      else
         statement.setNull(15,java.sql.Types.INTEGER);
      if (anObject.read_date == null)
        statement.setDate(16,null);
      else
        statement.setTimestamp(16,new java.sql.Timestamp(anObject.read_date.getTime()));
      if (anObject.id_user_created != Integer.MIN_VALUE )
         statement.setInt(17,anObject.id_user_created);
      else
         statement.setNull(17,java.sql.Types.INTEGER);
      if (anObject.modifytime == null)
        statement.setDate(18,null);
      else
        statement.setTimestamp(18,new java.sql.Timestamp(anObject.modifytime.getTime()));
      if (anObject.pastdate == null)
        statement.setDate(19,null);
      else
        statement.setTimestamp(19,new java.sql.Timestamp(anObject.pastdate.getTime()));
      if (anObject.subsystemRef.code != Integer.MIN_VALUE)
        statement.setInt(20,anObject.subsystemRef.code);
      else
        statement.setNull(20,java.sql.Types.INTEGER);
      if (anObject.actsPackRef.code != Integer.MIN_VALUE)
        statement.setInt(21,anObject.actsPackRef.code);
      else
        statement.setNull(21,java.sql.Types.INTEGER);
          statement.setInt(22,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("ID_STATE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.id_state);
                continue;
             }
            if("STATE_NAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.state_name);
                continue;
             }
            if("STARTDATE".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.startdate == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.startdate.getTime()));
                continue;
             }
            if("NOTE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.note);
                continue;
             }
            if("ID_PARENT".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.id_parent);
                continue;
             }
            if("ID_USER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.id_user);
                continue;
             }
            if("REALDATE".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.realdate == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.realdate.getTime()));
                continue;
             }
            if("CANCELED".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.canceled);
                continue;
             }
            if("ID_USER_CANCELED".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.id_user_canceled);
                continue;
             }
            if("CANCELEDDATE".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.canceleddate == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.canceleddate.getTime()));
                continue;
             }
            if("CANCELEDNOTE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.cancelednote);
                continue;
             }
            if("IS_COMPLETED".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.is_completed);
                continue;
             }
            if("ID_MOVEMENT_STATUS".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.id_movement_status);
                continue;
             }
            if("READ_STATUS".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.read_status);
                continue;
             }
            if("ID_USER_READ".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.id_user_read);
                continue;
             }
            if("READ_DATE".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.read_date == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.read_date.getTime()));
                continue;
             }
            if("ID_USER_CREATED".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.id_user_created);
                continue;
             }
            if("MODIFYTIME".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.modifytime == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.modifytime.getTime()));
                continue;
             }
            if("PASTDATE".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.pastdate == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.pastdate.getTime()));
                continue;
             }
            if("SUBSYSTEMREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.subsystemRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.subsystemRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("ACTSPACKREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.actsPackRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.actsPackRef.code);
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
        new SystemException(e.getMessage(), e);
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

   } // end of save(CNActsMovement anObject,String[] anAttributes)


 public CNActsMovementShort getShortObject(int anObjectCode) throws PersistenceException
  {
   CNActsMovement filterObject = new CNActsMovement();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (CNActsMovementShort)list.get(0);
   return null;
  }

  public CNActsMovementShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public CNActsMovementShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public CNActsMovementShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public CNActsMovementShortList getFilteredList(CNActsMovement filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public CNActsMovementShortList getScrollableFilteredList(CNActsMovement aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public CNActsMovementShortList getScrollableFilteredList(CNActsMovement aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public CNActsMovementShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public CNActsMovementShortList getScrollableFilteredList(CNActsMovementFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public CNActsMovementShortList getScrollableFilteredList(CNActsMovementFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public CNActsMovementShortList getScrollableFilteredList(CNActsMovement aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public CNActsMovementShortList getScrollableFilteredList(CNActsMovement aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    CNActsMovementShortList result = new CNActsMovementShortList();
    CNActsMovementShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "CNACTSMOVEMENT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "CNACTSMOVEMENT.CODE"+
     ",CNACTSMOVEMENT.ID_STATE"+
     ",CNACTSMOVEMENT.STATE_NAME"+
     ",CNACTSMOVEMENT.STARTDATE"+
     ",CNACTSMOVEMENT.NOTE"+
     ",CNACTSMOVEMENT.ID_PARENT"+
     ",CNACTSMOVEMENT.ID_USER"+
     ",CNACTSMOVEMENT.REALDATE"+
     ",CNACTSMOVEMENT.CANCELED"+
     ",CNACTSMOVEMENT.ID_USER_CANCELED"+
     ",CNACTSMOVEMENT.CANCELEDDATE"+
     ",CNACTSMOVEMENT.CANCELEDNOTE"+
     ",CNACTSMOVEMENT.IS_COMPLETED"+
     ",CNACTSMOVEMENT.ID_MOVEMENT_STATUS"+
     ",CNACTSMOVEMENT.READ_STATUS"+
     ",CNACTSMOVEMENT.ID_USER_READ"+
     ",CNACTSMOVEMENT.READ_DATE"+
     ",CNACTSMOVEMENT.ID_USER_CREATED"+
     ",CNACTSMOVEMENT.MODIFYTIME"+
     ",CNACTSMOVEMENT.PASTDATE"+

      ", CNSUBSYSTEMTYPE.CODE " +
      ", CNSUBSYSTEMTYPE.NAME " +
      ", CNACTSPACK.CODE " +
      ", CNACTSPACK.NAME " +
      ", CNACTSPACK.ADDRESS " +
      ", CNACTSPACK.ADDRESS_JUR " +
      ", CNACTSPACK.PURPOSE " +
      ", CNACTSPACK.BUSINESS_TYPE " +
      ", CNACTSPACK.BLANK_NUMBER " +
      ", CNACTSPACK.ACT_NUMBER " +
      ", CNACTSPACK.ACT_DATE " +
      ", CNACTSPACK.ACT_SUM " +
      ", CNACTSPACK.PAY_DATE " +
      ", CNACTSPACK.PAY_SUM " +
      ", CNACTSPACK.IS_KSOE " +
      ", CNACTSPACK.STATUS " +
      ", CNACTSPACK.ID_REN " +
      ", CNACTSPACK.RENNAME " +
      ", CNACTSPACK.ID_PACK_STATUS " +
      ", CNACTSPACK.STATUSNAME " +
      ", CNACTSPACK.ID_WAITING_STATUS " +
      ", CNACTSPACK.WAITINGSTATUS " +
     " FROM CNACTSMOVEMENT " +
     ", CNSUBSYSTEMTYPE " +
     ", CNACTSPACK " +
     //" WHERE "
    "";
     whereStr = " CNSUBSYSTEMTYPE.CODE = CNACTSMOVEMENT.SUBSYSTEMREFCODE" ; //+
      whereStr = whereStr +" AND CNACTSPACK.CODE = CNACTSMOVEMENT.ACTSPACKREFCODE" ; //+
        //selectStr = selectStr + " ${s} CNACTSMOVEMENT.CODE IN ( SELECT CNACTSMOVEMENT.CODE FROM CNACTSMOVEMENT ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.CODE = ?";
        }
        if(aFilterObject.id_state != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.ID_STATE = ?";
        }
         if (aFilterObject.state_name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.state_name.indexOf('*',0) < 0 && aFilterObject.state_name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNACTSMOVEMENT.STATE_NAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNACTSMOVEMENT.STATE_NAME) LIKE UPPER(?)";
         }
        if(aFilterObject.startdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.STARTDATE = ?";
        }
         if (aFilterObject.note != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.note.indexOf('*',0) < 0 && aFilterObject.note.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNACTSMOVEMENT.NOTE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNACTSMOVEMENT.NOTE) LIKE UPPER(?)";
         }
        if(aFilterObject.id_parent != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.ID_PARENT = ?";
        }
        if(aFilterObject.id_user != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.ID_USER = ?";
        }
        if(aFilterObject.realdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.REALDATE = ?";
        }
        if(aFilterObject.canceled != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.CANCELED = ?";
        }
        if(aFilterObject.id_user_canceled != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.ID_USER_CANCELED = ?";
        }
        if(aFilterObject.canceleddate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.CANCELEDDATE = ?";
        }
         if (aFilterObject.cancelednote != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.cancelednote.indexOf('*',0) < 0 && aFilterObject.cancelednote.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNACTSMOVEMENT.CANCELEDNOTE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNACTSMOVEMENT.CANCELEDNOTE) LIKE UPPER(?)";
         }
        if(aFilterObject.is_completed != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.IS_COMPLETED = ?";
        }
        if(aFilterObject.id_movement_status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.ID_MOVEMENT_STATUS = ?";
        }
        if(aFilterObject.read_status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.READ_STATUS = ?";
        }
        if(aFilterObject.id_user_read != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.ID_USER_READ = ?";
        }
        if(aFilterObject.read_date != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.READ_DATE = ?";
        }
        if(aFilterObject.id_user_created != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.ID_USER_CREATED = ?";
        }
        if(aFilterObject.modifytime != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.MODIFYTIME = ?";
        }
        if(aFilterObject.pastdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.PASTDATE = ?";
        }
        if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "CNACTSMOVEMENT.SUBSYSTEMREFCODE = ? ";
        }
        if(aFilterObject.actsPackRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "CNACTSMOVEMENT.ACTSPACKREFCODE = ? ";
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
         if(aFilterObject.id_state != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_state);
         }

           if(aFilterObject.state_name != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.state_name);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.startdate != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.startdate.getTime()));
        }

           if(aFilterObject.note != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.note);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.id_parent != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_parent);
         }
         if(aFilterObject.id_user != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_user);
         }
        if(aFilterObject.realdate != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.realdate.getTime()));
        }
         if(aFilterObject.canceled != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.canceled);
         }
         if(aFilterObject.id_user_canceled != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_user_canceled);
         }
        if(aFilterObject.canceleddate != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.canceleddate.getTime()));
        }

           if(aFilterObject.cancelednote != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.cancelednote);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.is_completed != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is_completed);
         }
         if(aFilterObject.id_movement_status != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_movement_status);
         }
         if(aFilterObject.read_status != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.read_status);
         }
         if(aFilterObject.id_user_read != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_user_read);
         }
        if(aFilterObject.read_date != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.read_date.getTime()));
        }
         if(aFilterObject.id_user_created != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_user_created);
         }
        if(aFilterObject.modifytime != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.modifytime.getTime()));
        }
        if(aFilterObject.pastdate != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.pastdate.getTime()));
        }
       if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.subsystemRef.code);
       }
       if(aFilterObject.actsPackRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.actsPackRef.code);
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

        anObject = new CNActsMovementShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.id_state = set.getInt(2);
        if ( set.wasNull() )
            anObject.id_state = Integer.MIN_VALUE;
        anObject.state_name = set.getString(3);
        anObject.startdate = set.getTimestamp(4);
        anObject.note = set.getString(5);
        anObject.id_parent = set.getInt(6);
        if ( set.wasNull() )
            anObject.id_parent = Integer.MIN_VALUE;
        anObject.id_user = set.getInt(7);
        if ( set.wasNull() )
            anObject.id_user = Integer.MIN_VALUE;
        anObject.realdate = set.getTimestamp(8);
        anObject.canceled = set.getInt(9);
        if ( set.wasNull() )
            anObject.canceled = Integer.MIN_VALUE;
        anObject.id_user_canceled = set.getInt(10);
        if ( set.wasNull() )
            anObject.id_user_canceled = Integer.MIN_VALUE;
        anObject.canceleddate = set.getTimestamp(11);
        anObject.cancelednote = set.getString(12);
        anObject.is_completed = set.getInt(13);
        if ( set.wasNull() )
            anObject.is_completed = Integer.MIN_VALUE;
        anObject.id_movement_status = set.getInt(14);
        if ( set.wasNull() )
            anObject.id_movement_status = Integer.MIN_VALUE;
        anObject.read_status = set.getInt(15);
        if ( set.wasNull() )
            anObject.read_status = Integer.MIN_VALUE;
        anObject.id_user_read = set.getInt(16);
        if ( set.wasNull() )
            anObject.id_user_read = Integer.MIN_VALUE;
        anObject.read_date = set.getTimestamp(17);
        anObject.id_user_created = set.getInt(18);
        if ( set.wasNull() )
            anObject.id_user_created = Integer.MIN_VALUE;
        anObject.modifytime = set.getTimestamp(19);
        anObject.pastdate = set.getTimestamp(20);

        anObject.subsystemRefCode = set.getInt(21);
        if(set.wasNull())
        anObject.subsystemRefCode = Integer.MIN_VALUE;
        anObject.subsystemRefName = set.getString(22);
        anObject.actsPackRefCode = set.getInt(23);
        if(set.wasNull())
        anObject.actsPackRefCode = Integer.MIN_VALUE;
        anObject.actsPackRefName = set.getString(24);
        anObject.actsPackRefAddress = set.getString(25);
        anObject.actsPackRefAddress_jur = set.getString(26);
        anObject.actsPackRefPurpose = set.getString(27);
        anObject.actsPackRefBusiness_type = set.getString(28);
        anObject.actsPackRefBlank_number = set.getString(29);
        anObject.actsPackRefAct_number = set.getString(30);
        anObject.actsPackRefAct_date = set.getDate(31);
        anObject.actsPackRefAct_sum = set.getBigDecimal(32);
        if(anObject.actsPackRefAct_sum != null)
          anObject.actsPackRefAct_sum = anObject.actsPackRefAct_sum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.actsPackRefPay_date = set.getDate(33);
        anObject.actsPackRefPay_sum = set.getBigDecimal(34);
        if(anObject.actsPackRefPay_sum != null)
          anObject.actsPackRefPay_sum = anObject.actsPackRefPay_sum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.actsPackRefIs_ksoe = set.getInt(35);
        if(set.wasNull())
        anObject.actsPackRefIs_ksoe = Integer.MIN_VALUE;
        anObject.actsPackRefStatus = set.getInt(36);
        if(set.wasNull())
        anObject.actsPackRefStatus = Integer.MIN_VALUE;
        anObject.actsPackRefId_ren = set.getInt(37);
        if(set.wasNull())
        anObject.actsPackRefId_ren = Integer.MIN_VALUE;
        anObject.actsPackRefRenName = set.getString(38);
        anObject.actsPackRefId_pack_status = set.getInt(39);
        if(set.wasNull())
        anObject.actsPackRefId_pack_status = Integer.MIN_VALUE;
        anObject.actsPackRefStatusName = set.getString(40);
        anObject.actsPackRefId_waiting_status = set.getInt(41);
        if(set.wasNull())
        anObject.actsPackRefId_waiting_status = Integer.MIN_VALUE;
        anObject.actsPackRefWaitingStatus = set.getString(42);

         result.list.add(anObject);
       }

      result.setTotalCount(i);
      return result;
     }
    catch(SQLException e)
     {
      System.out.println(e.getMessage()+"\nstatement - "+selectStr);
      new SystemException(e.getMessage(), e);
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

  public int[] getFilteredCodeArrayOLD(CNActsMovement aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT CNACTSMOVEMENT.CODE FROM CNACTSMOVEMENT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "CNACTSMOVEMENT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.CODE = ?";
        }
        if(aFilterObject.id_state != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.ID_STATE = ?";
        }
         if (aFilterObject.state_name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.state_name.indexOf('*',0) < 0 && aFilterObject.state_name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNACTSMOVEMENT.STATE_NAME = ?";
             else
                 whereStr = whereStr + "  CNACTSMOVEMENT.STATE_NAME LIKE ?";
         }
        if(aFilterObject.startdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.STARTDATE = ?";
        }
         if (aFilterObject.note != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.note.indexOf('*',0) < 0 && aFilterObject.note.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNACTSMOVEMENT.NOTE = ?";
             else
                 whereStr = whereStr + "  CNACTSMOVEMENT.NOTE LIKE ?";
         }
        if(aFilterObject.id_parent != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.ID_PARENT = ?";
        }
        if(aFilterObject.id_user != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.ID_USER = ?";
        }
        if(aFilterObject.realdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.REALDATE = ?";
        }
        if(aFilterObject.canceled != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.CANCELED = ?";
        }
        if(aFilterObject.id_user_canceled != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.ID_USER_CANCELED = ?";
        }
        if(aFilterObject.canceleddate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.CANCELEDDATE = ?";
        }
         if (aFilterObject.cancelednote != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.cancelednote.indexOf('*',0) < 0 && aFilterObject.cancelednote.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNACTSMOVEMENT.CANCELEDNOTE = ?";
             else
                 whereStr = whereStr + "  CNACTSMOVEMENT.CANCELEDNOTE LIKE ?";
         }
        if(aFilterObject.is_completed != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.IS_COMPLETED = ?";
        }
        if(aFilterObject.id_movement_status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.ID_MOVEMENT_STATUS = ?";
        }
        if(aFilterObject.read_status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.READ_STATUS = ?";
        }
        if(aFilterObject.id_user_read != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.ID_USER_READ = ?";
        }
        if(aFilterObject.read_date != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.READ_DATE = ?";
        }
        if(aFilterObject.id_user_created != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.ID_USER_CREATED = ?";
        }
        if(aFilterObject.modifytime != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.MODIFYTIME = ?";
        }
        if(aFilterObject.pastdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.PASTDATE = ?";
        }
        if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNACTSMOVEMENT.SUBSYSTEMREFCODE = ? ";
        }
        if(aFilterObject.actsPackRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNACTSMOVEMENT.ACTSPACKREFCODE = ? ";
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
         if(aFilterObject.id_state != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_state);
         }
         if (aFilterObject.state_name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.state_name.indexOf('*',0) < 0 && aFilterObject.state_name.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNACTSMOVEMENT.STATE_NAME = ?";
             else
                 whereStr = whereStr + " CNACTSMOVEMENT.STATE_NAME LIKE ?";

           if(aFilterObject.state_name != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.state_name);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.startdate != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.startdate.getTime()));
        }
         if (aFilterObject.note != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.note.indexOf('*',0) < 0 && aFilterObject.note.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNACTSMOVEMENT.NOTE = ?";
             else
                 whereStr = whereStr + " CNACTSMOVEMENT.NOTE LIKE ?";

           if(aFilterObject.note != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.note);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.id_parent != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_parent);
         }
         if(aFilterObject.id_user != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_user);
         }
        if(aFilterObject.realdate != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.realdate.getTime()));
        }
         if(aFilterObject.canceled != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.canceled);
         }
         if(aFilterObject.id_user_canceled != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_user_canceled);
         }
        if(aFilterObject.canceleddate != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.canceleddate.getTime()));
        }
         if (aFilterObject.cancelednote != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.cancelednote.indexOf('*',0) < 0 && aFilterObject.cancelednote.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNACTSMOVEMENT.CANCELEDNOTE = ?";
             else
                 whereStr = whereStr + " CNACTSMOVEMENT.CANCELEDNOTE LIKE ?";

           if(aFilterObject.cancelednote != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.cancelednote);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.is_completed != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is_completed);
         }
         if(aFilterObject.id_movement_status != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_movement_status);
         }
         if(aFilterObject.read_status != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.read_status);
         }
         if(aFilterObject.id_user_read != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_user_read);
         }
        if(aFilterObject.read_date != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.read_date.getTime()));
        }
         if(aFilterObject.id_user_created != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_user_created);
         }
        if(aFilterObject.modifytime != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.modifytime.getTime()));
        }
        if(aFilterObject.pastdate != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.pastdate.getTime()));
        }
       if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.subsystemRef.code);
       }
       if(aFilterObject.actsPackRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.actsPackRef.code);
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
      new SystemException(e.getMessage(), e);
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

  public int[] getFilteredCodeArray(CNActsMovementFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(CNActsMovement aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT CNACTSMOVEMENT.CODE FROM CNACTSMOVEMENT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "CNACTSMOVEMENT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.CODE = ?";
        }
        if(aFilterObject.id_state != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.ID_STATE = ?";
        }
         if (aFilterObject.state_name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.state_name.indexOf('*',0) < 0 && aFilterObject.state_name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNACTSMOVEMENT.STATE_NAME = ?";
             else
                 whereStr = whereStr + "  CNACTSMOVEMENT.STATE_NAME LIKE ?";
         }
        if(aFilterObject.startdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.STARTDATE = ?";
        }
         if (aFilterObject.note != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.note.indexOf('*',0) < 0 && aFilterObject.note.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNACTSMOVEMENT.NOTE = ?";
             else
                 whereStr = whereStr + "  CNACTSMOVEMENT.NOTE LIKE ?";
         }
        if(aFilterObject.id_parent != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.ID_PARENT = ?";
        }
        if(aFilterObject.id_user != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.ID_USER = ?";
        }
        if(aFilterObject.realdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.REALDATE = ?";
        }
        if(aFilterObject.canceled != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.CANCELED = ?";
        }
        if(aFilterObject.id_user_canceled != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.ID_USER_CANCELED = ?";
        }
        if(aFilterObject.canceleddate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.CANCELEDDATE = ?";
        }
         if (aFilterObject.cancelednote != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.cancelednote.indexOf('*',0) < 0 && aFilterObject.cancelednote.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNACTSMOVEMENT.CANCELEDNOTE = ?";
             else
                 whereStr = whereStr + "  CNACTSMOVEMENT.CANCELEDNOTE LIKE ?";
         }
        if(aFilterObject.is_completed != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.IS_COMPLETED = ?";
        }
        if(aFilterObject.id_movement_status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.ID_MOVEMENT_STATUS = ?";
        }
        if(aFilterObject.read_status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.READ_STATUS = ?";
        }
        if(aFilterObject.id_user_read != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.ID_USER_READ = ?";
        }
        if(aFilterObject.read_date != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.READ_DATE = ?";
        }
        if(aFilterObject.id_user_created != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.ID_USER_CREATED = ?";
        }
        if(aFilterObject.modifytime != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.MODIFYTIME = ?";
        }
        if(aFilterObject.pastdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNACTSMOVEMENT.PASTDATE = ?";
        }
        if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNACTSMOVEMENT.SUBSYSTEMREFCODE = ? ";
        }
        if(aFilterObject.actsPackRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNACTSMOVEMENT.ACTSPACKREFCODE = ? ";
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
         if(aFilterObject.id_state != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_state);
         }
         if (aFilterObject.state_name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.state_name.indexOf('*',0) < 0 && aFilterObject.state_name.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNACTSMOVEMENT.STATE_NAME = ?";
             else
                 whereStr = whereStr + " CNACTSMOVEMENT.STATE_NAME LIKE ?";

           if(aFilterObject.state_name != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.state_name);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.startdate != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.startdate.getTime()));
        }
         if (aFilterObject.note != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.note.indexOf('*',0) < 0 && aFilterObject.note.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNACTSMOVEMENT.NOTE = ?";
             else
                 whereStr = whereStr + " CNACTSMOVEMENT.NOTE LIKE ?";

           if(aFilterObject.note != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.note);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.id_parent != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_parent);
         }
         if(aFilterObject.id_user != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_user);
         }
        if(aFilterObject.realdate != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.realdate.getTime()));
        }
         if(aFilterObject.canceled != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.canceled);
         }
         if(aFilterObject.id_user_canceled != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_user_canceled);
         }
        if(aFilterObject.canceleddate != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.canceleddate.getTime()));
        }
         if (aFilterObject.cancelednote != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.cancelednote.indexOf('*',0) < 0 && aFilterObject.cancelednote.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNACTSMOVEMENT.CANCELEDNOTE = ?";
             else
                 whereStr = whereStr + " CNACTSMOVEMENT.CANCELEDNOTE LIKE ?";

           if(aFilterObject.cancelednote != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.cancelednote);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.is_completed != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is_completed);
         }
         if(aFilterObject.id_movement_status != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_movement_status);
         }
         if(aFilterObject.read_status != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.read_status);
         }
         if(aFilterObject.id_user_read != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_user_read);
         }
        if(aFilterObject.read_date != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.read_date.getTime()));
        }
         if(aFilterObject.id_user_created != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_user_created);
         }
        if(aFilterObject.modifytime != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.modifytime.getTime()));
        }
        if(aFilterObject.pastdate != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.pastdate.getTime()));
        }
       if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.subsystemRef.code);
       }
       if(aFilterObject.actsPackRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.actsPackRef.code);
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
      new SystemException(e.getMessage(), e);
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


   public CNActsMovement getObject(int uid) throws PersistenceException
   {
    CNActsMovement result = new CNActsMovement();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(CNActsMovement anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  CNACTSMOVEMENT.CODE, CNACTSMOVEMENT.ID_STATE, CNACTSMOVEMENT.STATE_NAME, CNACTSMOVEMENT.STARTDATE, CNACTSMOVEMENT.NOTE, CNACTSMOVEMENT.ID_PARENT, CNACTSMOVEMENT.ID_USER, CNACTSMOVEMENT.REALDATE, CNACTSMOVEMENT.CANCELED, CNACTSMOVEMENT.ID_USER_CANCELED, CNACTSMOVEMENT.CANCELEDDATE, CNACTSMOVEMENT.CANCELEDNOTE, CNACTSMOVEMENT.IS_COMPLETED, CNACTSMOVEMENT.ID_MOVEMENT_STATUS, CNACTSMOVEMENT.READ_STATUS, CNACTSMOVEMENT.ID_USER_READ, CNACTSMOVEMENT.READ_DATE, CNACTSMOVEMENT.ID_USER_CREATED, CNACTSMOVEMENT.MODIFYTIME, CNACTSMOVEMENT.PASTDATE, CNACTSMOVEMENT.SUBSYSTEMREFCODE, CNACTSMOVEMENT.ACTSPACKREFCODE "
    +" FROM CNACTSMOVEMENT WHERE CNACTSMOVEMENT.CODE = ?";

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
        anObject.id_state = set.getInt(2);
        if ( set.wasNull() )
           anObject.id_state = Integer.MIN_VALUE;
        anObject.state_name = set.getString(3);
        anObject.startdate = set.getTimestamp(4);
        anObject.note = set.getString(5);
        anObject.id_parent = set.getInt(6);
        if ( set.wasNull() )
           anObject.id_parent = Integer.MIN_VALUE;
        anObject.id_user = set.getInt(7);
        if ( set.wasNull() )
           anObject.id_user = Integer.MIN_VALUE;
        anObject.realdate = set.getTimestamp(8);
        anObject.canceled = set.getInt(9);
        if ( set.wasNull() )
           anObject.canceled = Integer.MIN_VALUE;
        anObject.id_user_canceled = set.getInt(10);
        if ( set.wasNull() )
           anObject.id_user_canceled = Integer.MIN_VALUE;
        anObject.canceleddate = set.getTimestamp(11);
        anObject.cancelednote = set.getString(12);
        anObject.is_completed = set.getInt(13);
        if ( set.wasNull() )
           anObject.is_completed = Integer.MIN_VALUE;
        anObject.id_movement_status = set.getInt(14);
        if ( set.wasNull() )
           anObject.id_movement_status = Integer.MIN_VALUE;
        anObject.read_status = set.getInt(15);
        if ( set.wasNull() )
           anObject.read_status = Integer.MIN_VALUE;
        anObject.id_user_read = set.getInt(16);
        if ( set.wasNull() )
           anObject.id_user_read = Integer.MIN_VALUE;
        anObject.read_date = set.getTimestamp(17);
        anObject.id_user_created = set.getInt(18);
        if ( set.wasNull() )
           anObject.id_user_created = Integer.MIN_VALUE;
        anObject.modifytime = set.getTimestamp(19);
        anObject.pastdate = set.getTimestamp(20);
        anObject.subsystemRef.code = set.getInt(21);
        if ( set.wasNull() )
            anObject.subsystemRef.code = Integer.MIN_VALUE;
        anObject.actsPackRef.code = set.getInt(22);
        if ( set.wasNull() )
            anObject.actsPackRef.code = Integer.MIN_VALUE;
        if(anObject.subsystemRef.code != Integer.MIN_VALUE)
        {
           anObject.setSubsystemRef(
        new com.ksoe.energynet.dataminer.generated.CNSubsystemTypeDAOGen(connection,getUserProfile()).getRef(anObject.subsystemRef.code));
    }
        if(anObject.actsPackRef.code != Integer.MIN_VALUE)
        {
           anObject.setActsPackRef(
        new com.ksoe.energynet.dataminer.generated.CNActsPackDAOGen(connection,getUserProfile()).getRef(anObject.actsPackRef.code));
    }
      }
    }
    catch(SQLException e)
     {
      System.out.println(e.getMessage()+"\nstatement - "+selectStr);
      new SystemException(e.getMessage(), e);
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


  public com.ksoe.energynet.valueobject.references.CNActsMovementRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.CNActsMovementRef ref = new com.ksoe.energynet.valueobject.references.CNActsMovementRef();
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

    selectStr = "DELETE FROM  CNACTSMOVEMENT WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    CNActsMovement object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%CNActsMovement.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(CNActsMovement.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%CNActsMovement.remove%} access denied");

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
      new SystemException(e.getMessage(), e);
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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(CNActsMovement.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%CNActsMovement.getObject%} access denied");

    selectStr =

    "SELECT  CNACTSMOVEMENT.CODE FROM  CNACTSMOVEMENT WHERE  CNACTSMOVEMENT.CODE = ?";
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
      new SystemException(e.getMessage(), e);
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
    _checkConditionToken(condition,"code","CNACTSMOVEMENT.CODE");
    _checkConditionToken(condition,"id_state","CNACTSMOVEMENT.ID_STATE");
    _checkConditionToken(condition,"state_name","CNACTSMOVEMENT.STATE_NAME");
    _checkConditionToken(condition,"startdate","CNACTSMOVEMENT.STARTDATE");
    _checkConditionToken(condition,"note","CNACTSMOVEMENT.NOTE");
    _checkConditionToken(condition,"id_parent","CNACTSMOVEMENT.ID_PARENT");
    _checkConditionToken(condition,"id_user","CNACTSMOVEMENT.ID_USER");
    _checkConditionToken(condition,"realdate","CNACTSMOVEMENT.REALDATE");
    _checkConditionToken(condition,"canceled","CNACTSMOVEMENT.CANCELED");
    _checkConditionToken(condition,"id_user_canceled","CNACTSMOVEMENT.ID_USER_CANCELED");
    _checkConditionToken(condition,"canceleddate","CNACTSMOVEMENT.CANCELEDDATE");
    _checkConditionToken(condition,"cancelednote","CNACTSMOVEMENT.CANCELEDNOTE");
    _checkConditionToken(condition,"is_completed","CNACTSMOVEMENT.IS_COMPLETED");
    _checkConditionToken(condition,"id_movement_status","CNACTSMOVEMENT.ID_MOVEMENT_STATUS");
    _checkConditionToken(condition,"read_status","CNACTSMOVEMENT.READ_STATUS");
    _checkConditionToken(condition,"id_user_read","CNACTSMOVEMENT.ID_USER_READ");
    _checkConditionToken(condition,"read_date","CNACTSMOVEMENT.READ_DATE");
    _checkConditionToken(condition,"id_user_created","CNACTSMOVEMENT.ID_USER_CREATED");
    _checkConditionToken(condition,"modifytime","CNACTSMOVEMENT.MODIFYTIME");
    _checkConditionToken(condition,"pastdate","CNACTSMOVEMENT.PASTDATE");
      // relationship conditions
    _checkConditionToken(condition,"subsystemref","SUBSYSTEMREFCODE");
    _checkConditionToken(condition,"subsystemref.code","SUBSYSTEMREFCODE");
    _checkConditionToken(condition,"actspackref","ACTSPACKREFCODE");
    _checkConditionToken(condition,"actspackref.code","ACTSPACKREFCODE");
    return condition.toString();
   }

   @Override
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

   private void _collectAutoIncrementFields(CNActsMovement anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("CNACTSMOVEMENT", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("CNACTSMOVEMENT", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("CNACTSMOVEMENT", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: CNACTSMOVEMENT");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of CNActsMovementDAO
