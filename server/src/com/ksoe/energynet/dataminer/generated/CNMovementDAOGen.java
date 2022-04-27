
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

import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.valueobject.CNMovement;
import com.ksoe.energynet.valueobject.brief.CNMovementShort;
import com.ksoe.energynet.valueobject.filter.CNMovementFilter;
import com.ksoe.energynet.valueobject.lists.CNMovementShortList;
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
  *  DAO Generated for CNMovement;
  *
  */

public class CNMovementDAOGen extends GenericDataMiner {

  // нах они такие .. потом вылетают ошибки !!!
  //public CNMovementDAOGen() {super();}
  //public CNMovementDAOGen(Connection aConnection) {super(aConnection);}
  //public CNMovementDAOGen(UserProfile anUserProfile) {super(anUserProfile);}
  public CNMovementDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public CNMovementDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(CNMovement inObject) throws PersistenceException
   {
      CNMovement obj = new CNMovement();
      obj.id = inObject.id;
      loadObject(obj);

     if (inObject.id_state != obj.id_state){
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

     if (inObject.addnote != obj.addnote){
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
     if (inObject.cnPackRef.code != obj.cnPackRef.code){
        return false;
     }
      return true;
   }

   public int add(CNMovement anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(CNMovement anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO CNMOVEMENT (ID,ID_STATE,STARTDATE,NOTE,ID_PARENT,ID_USER,REALDATE,CANCELED,ID_USER_CANCELED,CANCELEDDATE,CANCELEDNOTE,IS_COMPLETED,ID_MOVEMENT_STATUS,ADDNOTE,READ_STATUS,ID_USER_READ,READ_DATE,ID_USER_CREATED,MODIFYTIME,PASTDATE,SUBSYSTEMREFCODE,CNPACKREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.id != Integer.MIN_VALUE )
         statement.setInt(1,anObject.id);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.id_state != Integer.MIN_VALUE )
         statement.setInt(2,anObject.id_state);
      else
         statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.startdate == null)
        statement.setTimestamp(3,null);
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
        statement.setTimestamp(7,null);
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
        statement.setTimestamp(10,null);
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
      statement.setString(14,anObject.addnote);
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
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.CNMovement.subsystemRef.code%} = {%"+anObject.subsystemRef.code+"%}");
        statement.setInt(21,anObject.subsystemRef.code);
      }
      else
        statement.setNull(21,java.sql.Types.INTEGER);
      if (anObject.cnPackRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.CNPackDAOGen(connection,getUserProfile()).exists(anObject.cnPackRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.CNMovement.cnPackRef.code%} = {%"+anObject.cnPackRef.code+"%}");
        statement.setInt(22,anObject.cnPackRef.code);
      }
      else
        statement.setNull(22,java.sql.Types.INTEGER);

      statement.execute();
      return anObject.id;
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
      throw new PersistenceException("Error in method {%CNMovementDAOGen.add%}",e);
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

   public void save(CNMovement anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(CNMovement anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("ADDNOTE") == 0)
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
          if(fieldNameStr.compareTo("CNPACKREF") == 0)
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
        "UPDATE CNMOVEMENT SET  ID_STATE = ? , STARTDATE = ? , NOTE = ? , ID_PARENT = ? , ID_USER = ? , REALDATE = ? , CANCELED = ? , ID_USER_CANCELED = ? , CANCELEDDATE = ? , CANCELEDNOTE = ? , IS_COMPLETED = ? , ID_MOVEMENT_STATUS = ? , ADDNOTE = ? , READ_STATUS = ? , ID_USER_READ = ? , READ_DATE = ? , ID_USER_CREATED = ? , MODIFYTIME = ? , PASTDATE = ? , SUBSYSTEMREFCODE = ? , CNPACKREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE CNMOVEMENT SET ";
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
      if (anObject.startdate == null)
        statement.setDate(2,null);
      else
        statement.setTimestamp(2,new java.sql.Timestamp(anObject.startdate.getTime()));
      statement.setString(3,anObject.note);
      if (anObject.id_parent != Integer.MIN_VALUE )
         statement.setInt(4,anObject.id_parent);
      else
         statement.setNull(4,java.sql.Types.INTEGER);
      if (anObject.id_user != Integer.MIN_VALUE )
         statement.setInt(5,anObject.id_user);
      else
         statement.setNull(5,java.sql.Types.INTEGER);
      if (anObject.realdate == null)
        statement.setDate(6,null);
      else
        statement.setTimestamp(6,new java.sql.Timestamp(anObject.realdate.getTime()));
      if (anObject.canceled != Integer.MIN_VALUE )
         statement.setInt(7,anObject.canceled);
      else
         statement.setNull(7,java.sql.Types.INTEGER);
      if (anObject.id_user_canceled != Integer.MIN_VALUE )
         statement.setInt(8,anObject.id_user_canceled);
      else
         statement.setNull(8,java.sql.Types.INTEGER);
      if (anObject.canceleddate == null)
        statement.setDate(9,null);
      else
        statement.setTimestamp(9,new java.sql.Timestamp(anObject.canceleddate.getTime()));
      statement.setString(10,anObject.cancelednote);
      if (anObject.is_completed != Integer.MIN_VALUE )
         statement.setInt(11,anObject.is_completed);
      else
         statement.setNull(11,java.sql.Types.INTEGER);
      if (anObject.id_movement_status != Integer.MIN_VALUE )
         statement.setInt(12,anObject.id_movement_status);
      else
         statement.setNull(12,java.sql.Types.INTEGER);
      statement.setString(13,anObject.addnote);
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
      if (anObject.cnPackRef.code != Integer.MIN_VALUE)
        statement.setInt(21,anObject.cnPackRef.code);
      else
        statement.setNull(21,java.sql.Types.INTEGER);
          statement.setInt(22,anObject.id);
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
            if("ADDNOTE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.addnote);
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
            if("CNPACKREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.cnPackRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.cnPackRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            }
         statement.setInt(fields.size(),anObject.id);
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

   } // end of save(CNMovement anObject,String[] anAttributes)


 public CNMovementShort getShortObject(int anObjectCode) throws PersistenceException
  {
   CNMovement filterObject = new CNMovement();
   Vector list;

   filterObject.id = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (CNMovementShort)list.get(0);
   return null;
  }

  public CNMovementShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public CNMovementShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public CNMovementShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public CNMovementShortList getFilteredList(CNMovement filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public CNMovementShortList getScrollableFilteredList(CNMovement aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public CNMovementShortList getScrollableFilteredList(CNMovement aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public CNMovementShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public CNMovementShortList getScrollableFilteredList(CNMovementFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public CNMovementShortList getScrollableFilteredList(CNMovementFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public CNMovementShortList getScrollableFilteredList(CNMovement aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public CNMovementShortList getScrollableFilteredList(CNMovement aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    CNMovementShortList result = new CNMovementShortList();
    CNMovementShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "CNMOVEMENT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "CNMOVEMENT.ID"+
     ",CNMOVEMENT.ID_STATE"+
     ",CNMOVEMENT.STARTDATE"+
     ",CNMOVEMENT.NOTE"+
     ",CNMOVEMENT.ID_PARENT"+
     ",CNMOVEMENT.ID_USER"+
     ",CNMOVEMENT.REALDATE"+
     ",CNMOVEMENT.CANCELED"+
     ",CNMOVEMENT.ID_USER_CANCELED"+
     ",CNMOVEMENT.CANCELEDDATE"+
     ",CNMOVEMENT.CANCELEDNOTE"+
     ",CNMOVEMENT.IS_COMPLETED"+
     ",CNMOVEMENT.ID_MOVEMENT_STATUS"+
     ",CNMOVEMENT.ADDNOTE"+
     ",CNMOVEMENT.READ_STATUS"+
     ",CNMOVEMENT.ID_USER_READ"+
     ",CNMOVEMENT.READ_DATE"+
     ",CNMOVEMENT.ID_USER_CREATED"+
     ",CNMOVEMENT.MODIFYTIME"+
     ",CNMOVEMENT.PASTDATE"+

      ", CNSUBSYSTEMTYPE.CODE " +
      ", CNSUBSYSTEMTYPE.NAME " +
      ", CNPACK.CODE " +
      ", CNPACK.PACKCODE " +
      ", CNPACK.NAME " +
      ", CNPACK.ID_REN " +
      ", CNPACK.RENNAME " +
      ", CNPACK.ID_DISTRICT " +
      ", CNPACK.DISTRICTNAME " +
      ", CNPACK.ID_PACK_STATUS " +
      ", CNPACK.STATUSNAME " +
      ", CNPACK.DESCRIPTION " +
      ", CNPACK.POWER " +
      ", CNPACK.ADDRESS " +
      ", CNPACK.ADDRESS_JUR " +
      ", CNPACK.REG_NUM_CN_CONTRACT " +
      ", CNPACK.DATE_CN_CONTRACT " +
      ", CNPACK.REG_NUM_SPL_PP_CONTRCT " +
      ", CNPACK.DATE_SPL_PP_CONTRACT " +
      ", CNPACK.REG_NUM_TU_CONTRACT " +
      ", CNPACK.DATE_TU_CONTRACT " +
      ", CNPACK.REG_NUM_TU_CR_CONTRACT " +
      ", CNPACK.DATE_TU_CR_CONTRACT " +
      ", CNPACK.PROJECT_NUM " +
      ", CNPACK.PROJECT_DATE " +
      ", CNPACK.OVER5 " +
      ", CNPACK.STATUS " +
      ", CNPACK.LETTER_NUM_CUSTOMER " +
      ", CNPACK.DATE_LETTER_CUSTOMER " +
      ", CNPACK.LETTER_NUM " +
      ", CNPACK.DATE_LETTER " +
      ", CNPACK.RELIABILITY_CLASS " +
      ", CNPACK.ID_WAITING_STATUS " +
      ", CNPACK.WAITINGSTATUS " +
      ", CNPACK.IS_PAYABLE " +
      ", CNPACK.WORKSIZE " +
      ", CNPACK.WORK_INC_NET " +
      ", CNPACK.BUSINESS_TYPE " +
      ", CNPACK.ESTIMATETERM " +
      ", CNPACK.ESTIMATEDATE " +
      ", CNPACK.BUILDINGTERM " +
      ", CNPACK.BUILDINGDATE " +
      ", CNPACK.BUYINGTERM " +
      ", CNPACK.BUYINGDATE " +
      ", CNPACK.ESTIMATE_NUM " +
      ", CNPACK.ESTIMATE_CONTRACT_DATE " +
      ", CNPACK.IS_RESERV " +
     " FROM CNMOVEMENT " +
     ", CNSUBSYSTEMTYPE " +
     ", CNPACK " +
     //" WHERE "
    "";
     whereStr = " CNSUBSYSTEMTYPE.CODE = CNMOVEMENT.SUBSYSTEMREFCODE" ; //+
      whereStr = whereStr +" AND CNPACK.CODE = CNMOVEMENT.CNPACKREFCODE" ; //+
        //selectStr = selectStr + " ${s} CNMOVEMENT.CODE IN ( SELECT CNMOVEMENT.CODE FROM CNMOVEMENT ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.id != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.ID = ?";
        }
        if(aFilterObject.id_state != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.ID_STATE = ?";
        }
        if(aFilterObject.startdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.STARTDATE = ?";
        }
         if (aFilterObject.note != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.note.indexOf('*',0) < 0 && aFilterObject.note.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNMOVEMENT.NOTE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNMOVEMENT.NOTE) LIKE UPPER(?)";
         }
        if(aFilterObject.id_parent != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.ID_PARENT = ?";
        }
        if(aFilterObject.id_user != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.ID_USER = ?";
        }
        if(aFilterObject.realdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.REALDATE = ?";
        }
        if(aFilterObject.canceled != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.CANCELED = ?";
        }
        if(aFilterObject.id_user_canceled != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.ID_USER_CANCELED = ?";
        }
        if(aFilterObject.canceleddate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.CANCELEDDATE = ?";
        }
         if (aFilterObject.cancelednote != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.cancelednote.indexOf('*',0) < 0 && aFilterObject.cancelednote.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNMOVEMENT.CANCELEDNOTE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNMOVEMENT.CANCELEDNOTE) LIKE UPPER(?)";
         }
        if(aFilterObject.is_completed != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.IS_COMPLETED = ?";
        }
        if(aFilterObject.id_movement_status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.ID_MOVEMENT_STATUS = ?";
        }
         if (aFilterObject.addnote != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.addnote.indexOf('*',0) < 0 && aFilterObject.addnote.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNMOVEMENT.ADDNOTE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNMOVEMENT.ADDNOTE) LIKE UPPER(?)";
         }
        if(aFilterObject.read_status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.READ_STATUS = ?";
        }
        if(aFilterObject.id_user_read != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.ID_USER_READ = ?";
        }
        if(aFilterObject.read_date != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.READ_DATE = ?";
        }
        if(aFilterObject.id_user_created != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.ID_USER_CREATED = ?";
        }
        if(aFilterObject.modifytime != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.MODIFYTIME = ?";
        }
        if(aFilterObject.pastdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.PASTDATE = ?";
        }
        if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "CNMOVEMENT.SUBSYSTEMREFCODE = ? ";
        }
        if(aFilterObject.cnPackRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "CNMOVEMENT.CNPACKREFCODE = ? ";
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
         if(aFilterObject.id != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id);
         }
         if(aFilterObject.id_state != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_state);
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

           if(aFilterObject.addnote != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.addnote);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
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
       if(aFilterObject.cnPackRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cnPackRef.code);
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

        anObject = new CNMovementShort();

        anObject.id = set.getInt(1);
        if ( set.wasNull() )
            anObject.id = Integer.MIN_VALUE;
        anObject.id_state = set.getInt(2);
        if ( set.wasNull() )
            anObject.id_state = Integer.MIN_VALUE;
        anObject.startdate = set.getTimestamp(3);
        anObject.note = set.getString(4);
        anObject.id_parent = set.getInt(5);
        if ( set.wasNull() )
            anObject.id_parent = Integer.MIN_VALUE;
        anObject.id_user = set.getInt(6);
        if ( set.wasNull() )
            anObject.id_user = Integer.MIN_VALUE;
        anObject.realdate = set.getTimestamp(7);
        anObject.canceled = set.getInt(8);
        if ( set.wasNull() )
            anObject.canceled = Integer.MIN_VALUE;
        anObject.id_user_canceled = set.getInt(9);
        if ( set.wasNull() )
            anObject.id_user_canceled = Integer.MIN_VALUE;
        anObject.canceleddate = set.getTimestamp(10);
        anObject.cancelednote = set.getString(11);
        anObject.is_completed = set.getInt(12);
        if ( set.wasNull() )
            anObject.is_completed = Integer.MIN_VALUE;
        anObject.id_movement_status = set.getInt(13);
        if ( set.wasNull() )
            anObject.id_movement_status = Integer.MIN_VALUE;
        anObject.addnote = set.getString(14);
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
        anObject.cnPackRefCode = set.getInt(23);
        if(set.wasNull())
        anObject.cnPackRefCode = Integer.MIN_VALUE;
        anObject.cnPackRefPackCode = set.getInt(24);
        if(set.wasNull())
        anObject.cnPackRefPackCode = Integer.MIN_VALUE;
        anObject.cnPackRefName = set.getString(25);
        anObject.cnPackRefId_ren = set.getInt(26);
        if(set.wasNull())
        anObject.cnPackRefId_ren = Integer.MIN_VALUE;
        anObject.cnPackRefRenName = set.getString(27);
        anObject.cnPackRefId_district = set.getInt(28);
        if(set.wasNull())
        anObject.cnPackRefId_district = Integer.MIN_VALUE;
        anObject.cnPackRefDistrictName = set.getString(29);
        anObject.cnPackRefId_pack_status = set.getInt(30);
        if(set.wasNull())
        anObject.cnPackRefId_pack_status = Integer.MIN_VALUE;
        anObject.cnPackRefStatusName = set.getString(31);
        anObject.cnPackRefDescription = set.getString(32);
        anObject.cnPackRefPower = set.getBigDecimal(33);
        if(anObject.cnPackRefPower != null)
          anObject.cnPackRefPower = anObject.cnPackRefPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.cnPackRefAddress = set.getString(34);
        anObject.cnPackRefAddress_jur = set.getString(35);
        anObject.cnPackRefReg_num_cn_contract = set.getString(36);
        anObject.cnPackRefDate_cn_contract = set.getDate(37);
        anObject.cnPackRefReg_num_spl_pp_contract = set.getString(38);
        anObject.cnPackRefDate_spl_pp_contract = set.getDate(39);
        anObject.cnPackRefReg_num_tu_contract = set.getString(40);
        anObject.cnPackRefDate_tu_contract = set.getDate(41);
        anObject.cnPackRefReg_num_tu_cr_contract = set.getString(42);
        anObject.cnPackRefDate_tu_cr_contract = set.getDate(43);
        anObject.cnPackRefProject_num = set.getString(44);
        anObject.cnPackRefProject_date = set.getDate(45);
        anObject.cnPackRefOver5 = set.getInt(46);
        if(set.wasNull())
        anObject.cnPackRefOver5 = Integer.MIN_VALUE;
        anObject.cnPackRefStatus = set.getInt(47);
        if(set.wasNull())
        anObject.cnPackRefStatus = Integer.MIN_VALUE;
        anObject.cnPackRefLetter_num_customer = set.getString(48);
        anObject.cnPackRefDate_letter_customer = set.getDate(49);
        anObject.cnPackRefLetter_num = set.getString(50);
        anObject.cnPackRefDate_letter = set.getDate(51);
        anObject.cnPackRefReliability_class = set.getString(52);
        anObject.cnPackRefId_waiting_status = set.getInt(53);
        if(set.wasNull())
        anObject.cnPackRefId_waiting_status = Integer.MIN_VALUE;
        anObject.cnPackRefWaitingStatus = set.getString(54);
        anObject.cnPackRefIs_payable = set.getInt(55);
        if(set.wasNull())
        anObject.cnPackRefIs_payable = Integer.MIN_VALUE;
        anObject.cnPackRefWorksize = set.getString(56);
        anObject.cnPackRefWork_inc_net = set.getString(57);
        anObject.cnPackRefBusiness_type = set.getString(58);
        anObject.cnPackRefEstimateterm = set.getInt(59);
        if(set.wasNull())
        anObject.cnPackRefEstimateterm = Integer.MIN_VALUE;
        anObject.cnPackRefEstimatedate = set.getDate(60);
        anObject.cnPackRefBuildingterm = set.getInt(61);
        if(set.wasNull())
        anObject.cnPackRefBuildingterm = Integer.MIN_VALUE;
        anObject.cnPackRefBuildingdate = set.getDate(62);
        anObject.cnPackRefBuyingterm = set.getInt(63);
        if(set.wasNull())
        anObject.cnPackRefBuyingterm = Integer.MIN_VALUE;
        anObject.cnPackRefBuyingdate = set.getDate(64);
        anObject.cnPackRefEstimate_num = set.getString(65);
        anObject.cnPackRefEstimate_contract_date = set.getDate(66);
        anObject.cnPackRefIs_reserv = set.getInt(67);
        if(set.wasNull())
        anObject.cnPackRefIs_reserv = Integer.MIN_VALUE;

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

  public int[] getFilteredCodeArrayOLD(CNMovement aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT CNMOVEMENT.CODE FROM CNMOVEMENT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "CNMOVEMENT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.id != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.ID = ?";
        }
        if(aFilterObject.id_state != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.ID_STATE = ?";
        }
        if(aFilterObject.startdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.STARTDATE = ?";
        }
         if (aFilterObject.note != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.note.indexOf('*',0) < 0 && aFilterObject.note.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNMOVEMENT.NOTE = ?";
             else
                 whereStr = whereStr + "  CNMOVEMENT.NOTE LIKE ?";
         }
        if(aFilterObject.id_parent != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.ID_PARENT = ?";
        }
        if(aFilterObject.id_user != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.ID_USER = ?";
        }
        if(aFilterObject.realdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.REALDATE = ?";
        }
        if(aFilterObject.canceled != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.CANCELED = ?";
        }
        if(aFilterObject.id_user_canceled != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.ID_USER_CANCELED = ?";
        }
        if(aFilterObject.canceleddate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.CANCELEDDATE = ?";
        }
         if (aFilterObject.cancelednote != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.cancelednote.indexOf('*',0) < 0 && aFilterObject.cancelednote.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNMOVEMENT.CANCELEDNOTE = ?";
             else
                 whereStr = whereStr + "  CNMOVEMENT.CANCELEDNOTE LIKE ?";
         }
        if(aFilterObject.is_completed != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.IS_COMPLETED = ?";
        }
        if(aFilterObject.id_movement_status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.ID_MOVEMENT_STATUS = ?";
        }
         if (aFilterObject.addnote != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.addnote.indexOf('*',0) < 0 && aFilterObject.addnote.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNMOVEMENT.ADDNOTE = ?";
             else
                 whereStr = whereStr + "  CNMOVEMENT.ADDNOTE LIKE ?";
         }
        if(aFilterObject.read_status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.READ_STATUS = ?";
        }
        if(aFilterObject.id_user_read != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.ID_USER_READ = ?";
        }
        if(aFilterObject.read_date != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.READ_DATE = ?";
        }
        if(aFilterObject.id_user_created != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.ID_USER_CREATED = ?";
        }
        if(aFilterObject.modifytime != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.MODIFYTIME = ?";
        }
        if(aFilterObject.pastdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.PASTDATE = ?";
        }
        if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNMOVEMENT.SUBSYSTEMREFCODE = ? ";
        }
        if(aFilterObject.cnPackRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNMOVEMENT.CNPACKREFCODE = ? ";
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
         if(aFilterObject.id != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id);
         }
         if(aFilterObject.id_state != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_state);
         }
        if(aFilterObject.startdate != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.startdate.getTime()));
        }
         if (aFilterObject.note != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.note.indexOf('*',0) < 0 && aFilterObject.note.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNMOVEMENT.NOTE = ?";
             else
                 whereStr = whereStr + " CNMOVEMENT.NOTE LIKE ?";

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
                 whereStr = whereStr + " CNMOVEMENT.CANCELEDNOTE = ?";
             else
                 whereStr = whereStr + " CNMOVEMENT.CANCELEDNOTE LIKE ?";

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
         if (aFilterObject.addnote != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.addnote.indexOf('*',0) < 0 && aFilterObject.addnote.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNMOVEMENT.ADDNOTE = ?";
             else
                 whereStr = whereStr + " CNMOVEMENT.ADDNOTE LIKE ?";

           if(aFilterObject.addnote != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.addnote);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
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
       if(aFilterObject.cnPackRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cnPackRef.code);
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

  public int[] getFilteredCodeArray(CNMovementFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(CNMovement aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT CNMOVEMENT.CODE FROM CNMOVEMENT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "CNMOVEMENT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.id != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.ID = ?";
        }
        if(aFilterObject.id_state != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.ID_STATE = ?";
        }
        if(aFilterObject.startdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.STARTDATE = ?";
        }
         if (aFilterObject.note != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.note.indexOf('*',0) < 0 && aFilterObject.note.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNMOVEMENT.NOTE = ?";
             else
                 whereStr = whereStr + "  CNMOVEMENT.NOTE LIKE ?";
         }
        if(aFilterObject.id_parent != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.ID_PARENT = ?";
        }
        if(aFilterObject.id_user != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.ID_USER = ?";
        }
        if(aFilterObject.realdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.REALDATE = ?";
        }
        if(aFilterObject.canceled != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.CANCELED = ?";
        }
        if(aFilterObject.id_user_canceled != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.ID_USER_CANCELED = ?";
        }
        if(aFilterObject.canceleddate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.CANCELEDDATE = ?";
        }
         if (aFilterObject.cancelednote != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.cancelednote.indexOf('*',0) < 0 && aFilterObject.cancelednote.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNMOVEMENT.CANCELEDNOTE = ?";
             else
                 whereStr = whereStr + "  CNMOVEMENT.CANCELEDNOTE LIKE ?";
         }
        if(aFilterObject.is_completed != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.IS_COMPLETED = ?";
        }
        if(aFilterObject.id_movement_status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.ID_MOVEMENT_STATUS = ?";
        }
         if (aFilterObject.addnote != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.addnote.indexOf('*',0) < 0 && aFilterObject.addnote.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNMOVEMENT.ADDNOTE = ?";
             else
                 whereStr = whereStr + "  CNMOVEMENT.ADDNOTE LIKE ?";
         }
        if(aFilterObject.read_status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.READ_STATUS = ?";
        }
        if(aFilterObject.id_user_read != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.ID_USER_READ = ?";
        }
        if(aFilterObject.read_date != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.READ_DATE = ?";
        }
        if(aFilterObject.id_user_created != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.ID_USER_CREATED = ?";
        }
        if(aFilterObject.modifytime != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.MODIFYTIME = ?";
        }
        if(aFilterObject.pastdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNMOVEMENT.PASTDATE = ?";
        }
        if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNMOVEMENT.SUBSYSTEMREFCODE = ? ";
        }
        if(aFilterObject.cnPackRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNMOVEMENT.CNPACKREFCODE = ? ";
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
         if(aFilterObject.id != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id);
         }
         if(aFilterObject.id_state != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_state);
         }
        if(aFilterObject.startdate != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.startdate.getTime()));
        }
         if (aFilterObject.note != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.note.indexOf('*',0) < 0 && aFilterObject.note.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNMOVEMENT.NOTE = ?";
             else
                 whereStr = whereStr + " CNMOVEMENT.NOTE LIKE ?";

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
                 whereStr = whereStr + " CNMOVEMENT.CANCELEDNOTE = ?";
             else
                 whereStr = whereStr + " CNMOVEMENT.CANCELEDNOTE LIKE ?";

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
         if (aFilterObject.addnote != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.addnote.indexOf('*',0) < 0 && aFilterObject.addnote.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNMOVEMENT.ADDNOTE = ?";
             else
                 whereStr = whereStr + " CNMOVEMENT.ADDNOTE LIKE ?";

           if(aFilterObject.addnote != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.addnote);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
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
       if(aFilterObject.cnPackRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cnPackRef.code);
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


   public CNMovement getObject(int uid) throws PersistenceException
   {
    CNMovement result = new CNMovement();
    result.id = uid;
    loadObject(result);
    if(result.id == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(CNMovement anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  CNMOVEMENT.ID, CNMOVEMENT.ID_STATE, CNMOVEMENT.STARTDATE, CNMOVEMENT.NOTE, CNMOVEMENT.ID_PARENT, CNMOVEMENT.ID_USER, CNMOVEMENT.REALDATE, CNMOVEMENT.CANCELED, CNMOVEMENT.ID_USER_CANCELED, CNMOVEMENT.CANCELEDDATE, CNMOVEMENT.CANCELEDNOTE, CNMOVEMENT.IS_COMPLETED, CNMOVEMENT.ID_MOVEMENT_STATUS, CNMOVEMENT.ADDNOTE, CNMOVEMENT.READ_STATUS, CNMOVEMENT.ID_USER_READ, CNMOVEMENT.READ_DATE, CNMOVEMENT.ID_USER_CREATED, CNMOVEMENT.MODIFYTIME, CNMOVEMENT.PASTDATE, CNMOVEMENT.SUBSYSTEMREFCODE, CNMOVEMENT.CNPACKREFCODE "
    +" FROM CNMOVEMENT WHERE CNMOVEMENT.CODE = ?";

    try
     {
      statement = connection.prepareStatement(selectStr);
      statement.setInt(1,anObject.id);
      set = statement.executeQuery();
      if(!set.next())
       anObject.id = Integer.MIN_VALUE;
      else
       {
        anObject.id = set.getInt(1);
        anObject.id_state = set.getInt(2);
        if ( set.wasNull() )
           anObject.id_state = Integer.MIN_VALUE;
        anObject.startdate = set.getDate(3);
        anObject.note = set.getString(4);
        anObject.id_parent = set.getInt(5);
        if ( set.wasNull() )
           anObject.id_parent = Integer.MIN_VALUE;
        anObject.id_user = set.getInt(6);
        if ( set.wasNull() )
           anObject.id_user = Integer.MIN_VALUE;
        anObject.realdate = set.getTimestamp(7);
        anObject.canceled = set.getInt(8);
        if ( set.wasNull() )
           anObject.canceled = Integer.MIN_VALUE;
        anObject.id_user_canceled = set.getInt(9);
        if ( set.wasNull() )
           anObject.id_user_canceled = Integer.MIN_VALUE;
        anObject.canceleddate = set.getTimestamp(10);
        anObject.cancelednote = set.getString(11);
        anObject.is_completed = set.getInt(12);
        if ( set.wasNull() )
           anObject.is_completed = Integer.MIN_VALUE;
        anObject.id_movement_status = set.getInt(13);
        if ( set.wasNull() )
           anObject.id_movement_status = Integer.MIN_VALUE;
        anObject.addnote = set.getString(14);
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
        anObject.cnPackRef.code = set.getInt(22);
        if ( set.wasNull() )
            anObject.cnPackRef.code = Integer.MIN_VALUE;
        if(anObject.subsystemRef.code != Integer.MIN_VALUE)
        {
           anObject.setSubsystemRef(
        new com.ksoe.energynet.dataminer.generated.CNSubsystemTypeDAOGen(connection,getUserProfile()).getRef(anObject.subsystemRef.code));
    }
        if(anObject.cnPackRef.code != Integer.MIN_VALUE)
        {
           anObject.setCnPackRef(
        new com.ksoe.energynet.dataminer.generated.CNPackDAOGen(connection,getUserProfile()).getRef(anObject.cnPackRef.code));
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


  public com.ksoe.energynet.valueobject.references.CNMovementRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.CNMovementRef ref = new com.ksoe.energynet.valueobject.references.CNMovementRef();
    if(exists(anObjectCode))
     ref.id = anObjectCode;
    else
     ref.id = Integer.MIN_VALUE;
    return ref;
   }


   public void remove(int uid) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();

    selectStr = "DELETE FROM  CNMOVEMENT WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    CNMovement object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%CNMovement.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(CNMovement.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%CNMovement.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(CNMovement.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%CNMovement.getObject%} access denied");

    selectStr =

    "SELECT  CNMOVEMENT.CODE FROM  CNMOVEMENT WHERE  CNMOVEMENT.CODE = ?";
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
    _checkConditionToken(condition,"id","CNMOVEMENT.ID");
    _checkConditionToken(condition,"id_state","CNMOVEMENT.ID_STATE");
    _checkConditionToken(condition,"startdate","CNMOVEMENT.STARTDATE");
    _checkConditionToken(condition,"note","CNMOVEMENT.NOTE");
    _checkConditionToken(condition,"id_parent","CNMOVEMENT.ID_PARENT");
    _checkConditionToken(condition,"id_user","CNMOVEMENT.ID_USER");
    _checkConditionToken(condition,"realdate","CNMOVEMENT.REALDATE");
    _checkConditionToken(condition,"canceled","CNMOVEMENT.CANCELED");
    _checkConditionToken(condition,"id_user_canceled","CNMOVEMENT.ID_USER_CANCELED");
    _checkConditionToken(condition,"canceleddate","CNMOVEMENT.CANCELEDDATE");
    _checkConditionToken(condition,"cancelednote","CNMOVEMENT.CANCELEDNOTE");
    _checkConditionToken(condition,"is_completed","CNMOVEMENT.IS_COMPLETED");
    _checkConditionToken(condition,"id_movement_status","CNMOVEMENT.ID_MOVEMENT_STATUS");
    _checkConditionToken(condition,"addnote","CNMOVEMENT.ADDNOTE");
    _checkConditionToken(condition,"read_status","CNMOVEMENT.READ_STATUS");
    _checkConditionToken(condition,"id_user_read","CNMOVEMENT.ID_USER_READ");
    _checkConditionToken(condition,"read_date","CNMOVEMENT.READ_DATE");
    _checkConditionToken(condition,"id_user_created","CNMOVEMENT.ID_USER_CREATED");
    _checkConditionToken(condition,"modifytime","CNMOVEMENT.MODIFYTIME");
    _checkConditionToken(condition,"pastdate","CNMOVEMENT.PASTDATE");
      // relationship conditions
    _checkConditionToken(condition,"subsystemref","SUBSYSTEMREFCODE");
    _checkConditionToken(condition,"subsystemref.code","SUBSYSTEMREFCODE");
    _checkConditionToken(condition,"cnpackref","CNPACKREFCODE");
    _checkConditionToken(condition,"cnpackref.code","CNPACKREFCODE");
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

   private void _collectAutoIncrementFields(CNMovement anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("CNMOVEMENT", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("CNMOVEMENT", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("CNMOVEMENT", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: CNMOVEMENT");
       } else {
           anObject.id = nextSeqValue.intValue();
           return;
       }
   }


} // end of CNMovementDAO

