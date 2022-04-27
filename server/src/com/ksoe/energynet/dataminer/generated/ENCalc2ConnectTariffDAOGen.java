
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
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

import com.ksoe.energynet.valueobject.ENCalc2ConnectTariff;
import com.ksoe.energynet.valueobject.filter.ENCalc2ConnectTariffFilter;
import com.ksoe.energynet.valueobject.brief.ENCalc2ConnectTariffShort;
import com.ksoe.energynet.valueobject.lists.ENCalc2ConnectTariffShortList;


/**
 * DAO Object for ENCalc2ConnectTariff;
 *
 */

public class ENCalc2ConnectTariffDAOGen extends GenericDataMiner {

   public ENCalc2ConnectTariffDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENCalc2ConnectTariffDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   private boolean isEqual(ENCalc2ConnectTariff inObject) throws PersistenceException
   {
      ENCalc2ConnectTariff obj = new ENCalc2ConnectTariff();
      obj.code = inObject.code;
      loadObject(obj);

     if ( ! inObject.power1Tariff.equals(obj.power1Tariff)){
       return false;
     }

     if ( ! inObject.tariff1value.equals(obj.tariff1value)){
       return false;
     }

     if ( ! inObject.summa1Tariff.equals(obj.summa1Tariff)){
       return false;
     }

     if ( ! inObject.power2Tariff.equals(obj.power2Tariff)){
       return false;
     }

     if ( ! inObject.tariff2value.equals(obj.tariff2value)){
       return false;
     }

     if ( ! inObject.summa2Tariff.equals(obj.summa2Tariff)){
       return false;
     }

     if ( ! inObject.summaTotal.equals(obj.summaTotal)){
       return false;
     }

     if (inObject.userGen != obj.userGen){
       return false;
     }

     if ( ! inObject.dateEdit.equals(obj.dateEdit)){
       return false;
     }
     if (inObject.techCondServRef.code != obj.techCondServRef.code){
        return false;
     }
     if (inObject.tariffEntry1Ref.code != obj.tariffEntry1Ref.code){
        return false;
     }
     if (inObject.tariffEntry2Ref.code != obj.tariffEntry2Ref.code){
        return false;
     }
      return true;
   }

   public int add(ENCalc2ConnectTariff anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENCalc2ConnectTariff anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

  anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENCALC2CONNECTTARIFF (CODE,POWER1TARIFF,TARIFF1VALUE,SUMMA1TARIFF,POWER2TARIFF,TARIFF2VALUE,SUMMA2TARIFF,SUMMATOTAL,USERGEN,DATEEDIT,MODIFY_TIME,TECHCONDSERVREFCODE,TARIFFENTRY1REFCODE,TARIFFENTRY2REFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.power1Tariff != null)
        anObject.power1Tariff = anObject.power1Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.power1Tariff);
      if (anObject.tariff1value != null)
        anObject.tariff1value = anObject.tariff1value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.tariff1value);
      if (anObject.summa1Tariff != null)
        anObject.summa1Tariff = anObject.summa1Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.summa1Tariff);
      if (anObject.power2Tariff != null)
        anObject.power2Tariff = anObject.power2Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.power2Tariff);
      if (anObject.tariff2value != null)
        anObject.tariff2value = anObject.tariff2value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.tariff2value);
      if (anObject.summa2Tariff != null)
        anObject.summa2Tariff = anObject.summa2Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.summa2Tariff);
      if (anObject.summaTotal != null)
        anObject.summaTotal = anObject.summaTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.summaTotal);
      statement.setString(9,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(10,null);
      else
        statement.setTimestamp(10,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(11,null);
      else
        statement.setBigDecimal(11,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.techCondServRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTechConditionsServicesDAOGen(connection,getUserProfile()).exists(anObject.techCondServRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENCalc2ConnectTariff.techCondServRef.code%} = {%"+anObject.techCondServRef.code+"%}");
        statement.setInt(12,anObject.techCondServRef.code);
      }
      else
        statement.setNull(12,java.sql.Types.INTEGER);
      if (anObject.tariffEntry1Ref.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENConnectionTariffEntryDAOGen(connection,getUserProfile()).exists(anObject.tariffEntry1Ref.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENCalc2ConnectTariff.tariffEntry1Ref.code%} = {%"+anObject.tariffEntry1Ref.code+"%}");
        statement.setInt(13,anObject.tariffEntry1Ref.code);
      }
      else
        statement.setNull(13,java.sql.Types.INTEGER);
      if (anObject.tariffEntry2Ref.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENConnectionTariffEntryDAOGen(connection,getUserProfile()).exists(anObject.tariffEntry2Ref.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENCalc2ConnectTariff.tariffEntry2Ref.code%} = {%"+anObject.tariffEntry2Ref.code+"%}");
        statement.setInt(14,anObject.tariffEntry2Ref.code);
      }
      else
        statement.setNull(14,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENCalc2ConnectTariffDAOGen.add%}",e);
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

   public void save(ENCalc2ConnectTariff anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENCalc2ConnectTariff anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENCalc2ConnectTariff oldObject = new ENCalc2ConnectTariff();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENCalc2ConnectTariff.modify_time_Field+" FROM  ENCALC2CONNECTTARIFF WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("POWER1TARIFF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TARIFF1VALUE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUMMA1TARIFF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("POWER2TARIFF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TARIFF2VALUE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUMMA2TARIFF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUMMATOTAL") == 0)
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
          if(fieldNameStr.compareTo("TECHCONDSERVREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TARIFFENTRY1REF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TARIFFENTRY2REF") == 0)
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
        "UPDATE ENCALC2CONNECTTARIFF SET  POWER1TARIFF = ? , TARIFF1VALUE = ? , SUMMA1TARIFF = ? , POWER2TARIFF = ? , TARIFF2VALUE = ? , SUMMA2TARIFF = ? , SUMMATOTAL = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , TECHCONDSERVREFCODE = ? , TARIFFENTRY1REFCODE = ? , TARIFFENTRY2REFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENCALC2CONNECTTARIFF SET ";
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
      if (anObject.power1Tariff != null)
        anObject.power1Tariff = anObject.power1Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(1,anObject.power1Tariff);
      if (anObject.tariff1value != null)
        anObject.tariff1value = anObject.tariff1value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.tariff1value);
      if (anObject.summa1Tariff != null)
        anObject.summa1Tariff = anObject.summa1Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.summa1Tariff);
      if (anObject.power2Tariff != null)
        anObject.power2Tariff = anObject.power2Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.power2Tariff);
      if (anObject.tariff2value != null)
        anObject.tariff2value = anObject.tariff2value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.tariff2value);
      if (anObject.summa2Tariff != null)
        anObject.summa2Tariff = anObject.summa2Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.summa2Tariff);
      if (anObject.summaTotal != null)
        anObject.summaTotal = anObject.summaTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.summaTotal);
      statement.setString(8,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(9,null);
      else
        statement.setTimestamp(9,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(10,null);
      else
        statement.setBigDecimal(10,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.techCondServRef.code != Integer.MIN_VALUE)
        statement.setInt(11,anObject.techCondServRef.code);
      else
        statement.setNull(11,java.sql.Types.INTEGER);
      if (anObject.tariffEntry1Ref.code != Integer.MIN_VALUE)
        statement.setInt(12,anObject.tariffEntry1Ref.code);
      else
        statement.setNull(12,java.sql.Types.INTEGER);
      if (anObject.tariffEntry2Ref.code != Integer.MIN_VALUE)
        statement.setInt(13,anObject.tariffEntry2Ref.code);
      else
        statement.setNull(13,java.sql.Types.INTEGER);
          statement.setInt(14,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("POWER1TARIFF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.power1Tariff != null)
                    anObject.power1Tariff = anObject.power1Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.power1Tariff);
                continue;
             }
            if("TARIFF1VALUE".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.tariff1value != null)
                    anObject.tariff1value = anObject.tariff1value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.tariff1value);
                continue;
             }
            if("SUMMA1TARIFF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.summa1Tariff != null)
                    anObject.summa1Tariff = anObject.summa1Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.summa1Tariff);
                continue;
             }
            if("POWER2TARIFF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.power2Tariff != null)
                    anObject.power2Tariff = anObject.power2Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.power2Tariff);
                continue;
             }
            if("TARIFF2VALUE".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.tariff2value != null)
                    anObject.tariff2value = anObject.tariff2value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.tariff2value);
                continue;
             }
            if("SUMMA2TARIFF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.summa2Tariff != null)
                    anObject.summa2Tariff = anObject.summa2Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.summa2Tariff);
                continue;
             }
            if("SUMMATOTAL".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.summaTotal != null)
                    anObject.summaTotal = anObject.summaTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.summaTotal);
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
            if("TECHCONDSERVREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.techCondServRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.techCondServRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("TARIFFENTRY1REF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.tariffEntry1Ref.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.tariffEntry1Ref.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("TARIFFENTRY2REF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.tariffEntry2Ref.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.tariffEntry2Ref.code);
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

   } // end of save(ENCalc2ConnectTariff anObject,String[] anAttributes)


 public ENCalc2ConnectTariffShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENCalc2ConnectTariff filterObject = new ENCalc2ConnectTariff();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENCalc2ConnectTariffShort)list.get(0);
   return null;
  }

  public ENCalc2ConnectTariffShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENCalc2ConnectTariffShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENCalc2ConnectTariffShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENCalc2ConnectTariffShortList getFilteredList(ENCalc2ConnectTariff filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENCalc2ConnectTariffShortList getScrollableFilteredList(ENCalc2ConnectTariff aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENCalc2ConnectTariffShortList getScrollableFilteredList(ENCalc2ConnectTariff aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENCalc2ConnectTariffShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENCalc2ConnectTariffShortList getScrollableFilteredList(ENCalc2ConnectTariffFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENCalc2ConnectTariffShortList getScrollableFilteredList(ENCalc2ConnectTariffFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENCalc2ConnectTariffShortList getScrollableFilteredList(ENCalc2ConnectTariff aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENCalc2ConnectTariffShortList getScrollableFilteredList(ENCalc2ConnectTariff aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENCalc2ConnectTariffShortList result = new ENCalc2ConnectTariffShortList();
    ENCalc2ConnectTariffShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCALC2CONNECTTARIFF.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENCALC2CONNECTTARIFF.CODE"+
     ",ENCALC2CONNECTTARIFF.POWER1TARIFF"+
     ",ENCALC2CONNECTTARIFF.TARIFF1VALUE"+
     ",ENCALC2CONNECTTARIFF.SUMMA1TARIFF"+
     ",ENCALC2CONNECTTARIFF.POWER2TARIFF"+
     ",ENCALC2CONNECTTARIFF.TARIFF2VALUE"+
     ",ENCALC2CONNECTTARIFF.SUMMA2TARIFF"+
     ",ENCALC2CONNECTTARIFF.SUMMATOTAL"+
     ",ENCALC2CONNECTTARIFF.USERGEN"+
     ",ENCALC2CONNECTTARIFF.DATEEDIT"+

      ", ENTECHCONDITIONSSERVCS.CODE " +
      ", ENTECHCONDITIONSSERVCS.CONTRACTNUMBER " +
      ", ENTECHCONDITIONSSERVCS.CONTRACTDATE " +
      ", ENTECHCONDITIONSSERVCS.FINCONTRACTNUMBER " +
      ", ENTECHCONDITIONSSERVCS.FINCONTRACTDATE " +
      ", ENTECHCONDITIONSSERVCS.PARTNERNAME " +
      ", ENTECHCONDITIONSSERVCS.PARTNERCODE " +
      ", ENTECHCONDITIONSSERVCS.FINDOCCODE " +
      ", ENTECHCONDITIONSSERVCS.FINDOCID " +
      ", ENTECHCONDITIONSSERVCS.FINCOMMENTGEN " +
      ", ENTECHCONDITIONSSERVCS.TYSUMMAGEN " +
      ", ENTECHCONDITIONSSERVCS.TYSUMMAVAT " +
      ", ENTECHCONDITIONSSERVCS.TYSERVICESSUMMA " +
      ", ENTECHCONDITIONSSERVCS.TYSERVICESPOWER " +
      ", ENTECHCONDITIONSSERVCS.COMMENTSERVICESGEN " +
      ", ENTECHCONDITIONSSERVCS.USERGEN " +
      ", ENTECHCONDITIONSSERVCS.DATEEDIT " +
      ", ENTECHCONDITIONSSERVCS.CNPACKCODE " +
      ", ENTECHCONDITIONSSERVCS.EXECUTIONTERM " +
      ", ENTECHCONDITIONSSERVCS.BUILDERSAREA " +
      ", ENTECHCONDITIONSSERVCS.BASESTATION " +
      ", ENTECHCONDITIONSSERVCS.SMALLARCHFRM " +
      ", ENTECHCONDITIONSSERVCS.CONTRACTDATEFINAL " +
      ", ENTECHCONDITIONSSERVCS.ISSEA " +
      ", ENTECHCONDITIONSSERVCS.ISDISCONNECTIONNEEDED " +
      ", ENTECHCONDITIONSSERVCS.ISUSE2TARIFFS " +
      ", ENCONNECTIONTARIFFENTR.CODE " +
      ", ENCONNECTIONTARIFFENTR.VALUE " +
      ", ENCONNECTIONTARIFFENTR.STARTDATE " +
      ", ENCONNECTIONTARIFFENTR.USERGEN " +
      ", ENCONNECTIONTARIFFENTR.CODE " +
      ", ENCONNECTIONTARIFFENTR.VALUE " +
      ", ENCONNECTIONTARIFFENTR.STARTDATE " +
      ", ENCONNECTIONTARIFFENTR.USERGEN " +
     " FROM ENCALC2CONNECTTARIFF " +
     ", ENTECHCONDITIONSSERVCS " +
     ", ENCONNECTIONTARIFFENTR " +
     ", ENCONNECTIONTARIFFENTR " +
     //" WHERE "
  "";
     whereStr = " ENTECHCONDITIONSSERVCS.CODE = ENCALC2CONNECTTARIFF.TECHCONDSERVREFCODE" ; //+
      whereStr = whereStr +" AND ENCONNECTIONTARIFFENTR.CODE = ENCALC2CONNECTTARIFF.TARIFFENTRY1REFCODE" ; //+
      whereStr = whereStr +" AND ENCONNECTIONTARIFFENTR.CODE = ENCALC2CONNECTTARIFF.TARIFFENTRY2REFCODE" ; //+
    //selectStr = selectStr + " ${s} ENCALC2CONNECTTARIFF.CODE IN ( SELECT ENCALC2CONNECTTARIFF.CODE FROM ENCALC2CONNECTTARIFF ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.CODE = ?";
        }
        if(aFilterObject.power1Tariff != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.POWER1TARIFF = ?";
        }
        if(aFilterObject.tariff1value != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.TARIFF1VALUE = ?";
        }
        if(aFilterObject.summa1Tariff != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.SUMMA1TARIFF = ?";
        }
        if(aFilterObject.power2Tariff != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.POWER2TARIFF = ?";
        }
        if(aFilterObject.tariff2value != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.TARIFF2VALUE = ?";
        }
        if(aFilterObject.summa2Tariff != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.SUMMA2TARIFF = ?";
        }
        if(aFilterObject.summaTotal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.SUMMATOTAL = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCALC2CONNECTTARIFF.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCALC2CONNECTTARIFF.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.MODIFY_TIME = ?";
        }
        if(aFilterObject.techCondServRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENCALC2CONNECTTARIFF.TECHCONDSERVREFCODE = ? ";
        }
        if(aFilterObject.tariffEntry1Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENCALC2CONNECTTARIFF.TARIFFENTRY1REFCODE = ? ";
        }
        if(aFilterObject.tariffEntry2Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENCALC2CONNECTTARIFF.TARIFFENTRY2REFCODE = ? ";
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
        if(aFilterObject.power1Tariff != null){
            number++;
            aFilterObject.power1Tariff = aFilterObject.power1Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power1Tariff);
        }
        if(aFilterObject.tariff1value != null){
            number++;
            aFilterObject.tariff1value = aFilterObject.tariff1value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.tariff1value);
        }
        if(aFilterObject.summa1Tariff != null){
            number++;
            aFilterObject.summa1Tariff = aFilterObject.summa1Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.summa1Tariff);
        }
        if(aFilterObject.power2Tariff != null){
            number++;
            aFilterObject.power2Tariff = aFilterObject.power2Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power2Tariff);
        }
        if(aFilterObject.tariff2value != null){
            number++;
            aFilterObject.tariff2value = aFilterObject.tariff2value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.tariff2value);
        }
        if(aFilterObject.summa2Tariff != null){
            number++;
            aFilterObject.summa2Tariff = aFilterObject.summa2Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.summa2Tariff);
        }
        if(aFilterObject.summaTotal != null){
            number++;
            aFilterObject.summaTotal = aFilterObject.summaTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.summaTotal);
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
       if(aFilterObject.techCondServRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.techCondServRef.code);
       }
       if(aFilterObject.tariffEntry1Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.tariffEntry1Ref.code);
       }
       if(aFilterObject.tariffEntry2Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.tariffEntry2Ref.code);
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

        anObject = new ENCalc2ConnectTariffShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.power1Tariff = set.getBigDecimal(2);
        if(anObject.power1Tariff != null)
            anObject.power1Tariff = anObject.power1Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.tariff1value = set.getBigDecimal(3);
        if(anObject.tariff1value != null)
            anObject.tariff1value = anObject.tariff1value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.summa1Tariff = set.getBigDecimal(4);
        if(anObject.summa1Tariff != null)
            anObject.summa1Tariff = anObject.summa1Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power2Tariff = set.getBigDecimal(5);
        if(anObject.power2Tariff != null)
            anObject.power2Tariff = anObject.power2Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.tariff2value = set.getBigDecimal(6);
        if(anObject.tariff2value != null)
            anObject.tariff2value = anObject.tariff2value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.summa2Tariff = set.getBigDecimal(7);
        if(anObject.summa2Tariff != null)
            anObject.summa2Tariff = anObject.summa2Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.summaTotal = set.getBigDecimal(8);
        if(anObject.summaTotal != null)
            anObject.summaTotal = anObject.summaTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userGen = set.getString(9);
        anObject.dateEdit = set.getTimestamp(10);

        anObject.techCondServRefCode = set.getInt(11);
    if(set.wasNull())
      anObject.techCondServRefCode = Integer.MIN_VALUE;
        anObject.techCondServRefContractNumber = set.getString(12);
        anObject.techCondServRefContractDate = set.getDate(13);
        anObject.techCondServRefFinContractNumber = set.getString(14);
        anObject.techCondServRefFinContractDate = set.getDate(15);
        anObject.techCondServRefPartnerName = set.getString(16);
        anObject.techCondServRefPartnerCode = set.getString(17);
        anObject.techCondServRefFinDocCode = set.getString(18);
        anObject.techCondServRefFinDocID = set.getInt(19);
    if(set.wasNull())
      anObject.techCondServRefFinDocID = Integer.MIN_VALUE;
        anObject.techCondServRefFinCommentGen = set.getString(20);
        anObject.techCondServRefTySummaGen = set.getBigDecimal(21);
        if(anObject.techCondServRefTySummaGen != null)
          anObject.techCondServRefTySummaGen = anObject.techCondServRefTySummaGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techCondServRefTySummaVat = set.getBigDecimal(22);
        if(anObject.techCondServRefTySummaVat != null)
          anObject.techCondServRefTySummaVat = anObject.techCondServRefTySummaVat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techCondServRefTyServicesSumma = set.getBigDecimal(23);
        if(anObject.techCondServRefTyServicesSumma != null)
          anObject.techCondServRefTyServicesSumma = anObject.techCondServRefTyServicesSumma.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techCondServRefTyServicesPower = set.getBigDecimal(24);
        if(anObject.techCondServRefTyServicesPower != null)
          anObject.techCondServRefTyServicesPower = anObject.techCondServRefTyServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techCondServRefCommentServicesGen = set.getString(25);
        anObject.techCondServRefUserGen = set.getString(26);
        anObject.techCondServRefDateEdit = set.getDate(27);
        anObject.techCondServRefCnPackCode = set.getInt(28);
    if(set.wasNull())
      anObject.techCondServRefCnPackCode = Integer.MIN_VALUE;
        anObject.techCondServRefExecutionTerm = set.getString(29);
        anObject.techCondServRefBuildersArea = set.getInt(30);
    if(set.wasNull())
      anObject.techCondServRefBuildersArea = Integer.MIN_VALUE;
        anObject.techCondServRefBaseStation = set.getInt(31);
    if(set.wasNull())
      anObject.techCondServRefBaseStation = Integer.MIN_VALUE;
        anObject.techCondServRefSmallArchFrm = set.getInt(32);
    if(set.wasNull())
      anObject.techCondServRefSmallArchFrm = Integer.MIN_VALUE;
        anObject.techCondServRefContractDateFinal = set.getDate(33);
        anObject.techCondServRefIsSea = set.getInt(34);
    if(set.wasNull())
      anObject.techCondServRefIsSea = Integer.MIN_VALUE;
        anObject.techCondServRefIsDisconnectionNeeded = set.getInt(35);
    if(set.wasNull())
      anObject.techCondServRefIsDisconnectionNeeded = Integer.MIN_VALUE;
        anObject.techCondServRefIsUse2Tariffs = set.getInt(36);
    if(set.wasNull())
      anObject.techCondServRefIsUse2Tariffs = Integer.MIN_VALUE;
        anObject.tariffEntry1RefCode = set.getInt(37);
    if(set.wasNull())
      anObject.tariffEntry1RefCode = Integer.MIN_VALUE;
        anObject.tariffEntry1RefValue = set.getBigDecimal(38);
        if(anObject.tariffEntry1RefValue != null)
          anObject.tariffEntry1RefValue = anObject.tariffEntry1RefValue.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.tariffEntry1RefStartDate = set.getDate(39);
        anObject.tariffEntry1RefUserGen = set.getString(40);
        anObject.tariffEntry2RefCode = set.getInt(41);
    if(set.wasNull())
      anObject.tariffEntry2RefCode = Integer.MIN_VALUE;
        anObject.tariffEntry2RefValue = set.getBigDecimal(42);
        if(anObject.tariffEntry2RefValue != null)
          anObject.tariffEntry2RefValue = anObject.tariffEntry2RefValue.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.tariffEntry2RefStartDate = set.getDate(43);
        anObject.tariffEntry2RefUserGen = set.getString(44);

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

  public int[] getFilteredCodeArrayOLD(ENCalc2ConnectTariff aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENCALC2CONNECTTARIFF.CODE FROM ENCALC2CONNECTTARIFF";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCALC2CONNECTTARIFF.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.CODE = ?";
        }
        if(aFilterObject.power1Tariff != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.POWER1TARIFF = ?";
        }
        if(aFilterObject.tariff1value != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.TARIFF1VALUE = ?";
        }
        if(aFilterObject.summa1Tariff != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.SUMMA1TARIFF = ?";
        }
        if(aFilterObject.power2Tariff != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.POWER2TARIFF = ?";
        }
        if(aFilterObject.tariff2value != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.TARIFF2VALUE = ?";
        }
        if(aFilterObject.summa2Tariff != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.SUMMA2TARIFF = ?";
        }
        if(aFilterObject.summaTotal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.SUMMATOTAL = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCALC2CONNECTTARIFF.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENCALC2CONNECTTARIFF.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.MODIFY_TIME = ?";
        }
        if(aFilterObject.techCondServRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCALC2CONNECTTARIFF.TECHCONDSERVREFCODE = ? ";
        }
        if(aFilterObject.tariffEntry1Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCALC2CONNECTTARIFF.TARIFFENTRY1REFCODE = ? ";
        }
        if(aFilterObject.tariffEntry2Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCALC2CONNECTTARIFF.TARIFFENTRY2REFCODE = ? ";
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
        if(aFilterObject.power1Tariff != null){
            number++;
            aFilterObject.power1Tariff = aFilterObject.power1Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power1Tariff);
        }
        if(aFilterObject.tariff1value != null){
            number++;
            aFilterObject.tariff1value = aFilterObject.tariff1value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.tariff1value);
        }
        if(aFilterObject.summa1Tariff != null){
            number++;
            aFilterObject.summa1Tariff = aFilterObject.summa1Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.summa1Tariff);
        }
        if(aFilterObject.power2Tariff != null){
            number++;
            aFilterObject.power2Tariff = aFilterObject.power2Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power2Tariff);
        }
        if(aFilterObject.tariff2value != null){
            number++;
            aFilterObject.tariff2value = aFilterObject.tariff2value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.tariff2value);
        }
        if(aFilterObject.summa2Tariff != null){
            number++;
            aFilterObject.summa2Tariff = aFilterObject.summa2Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.summa2Tariff);
        }
        if(aFilterObject.summaTotal != null){
            number++;
            aFilterObject.summaTotal = aFilterObject.summaTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.summaTotal);
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCALC2CONNECTTARIFF.USERGEN = ?";
             else
                 whereStr = whereStr + " ENCALC2CONNECTTARIFF.USERGEN LIKE ?";

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
       if(aFilterObject.techCondServRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.techCondServRef.code);
       }
       if(aFilterObject.tariffEntry1Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.tariffEntry1Ref.code);
       }
       if(aFilterObject.tariffEntry2Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.tariffEntry2Ref.code);
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

  public int[] getFilteredCodeArray(ENCalc2ConnectTariffFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENCalc2ConnectTariff aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENCALC2CONNECTTARIFF.CODE FROM ENCALC2CONNECTTARIFF";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCALC2CONNECTTARIFF.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.CODE = ?";
        }
        if(aFilterObject.power1Tariff != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.POWER1TARIFF = ?";
        }
        if(aFilterObject.tariff1value != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.TARIFF1VALUE = ?";
        }
        if(aFilterObject.summa1Tariff != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.SUMMA1TARIFF = ?";
        }
        if(aFilterObject.power2Tariff != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.POWER2TARIFF = ?";
        }
        if(aFilterObject.tariff2value != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.TARIFF2VALUE = ?";
        }
        if(aFilterObject.summa2Tariff != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.SUMMA2TARIFF = ?";
        }
        if(aFilterObject.summaTotal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.SUMMATOTAL = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCALC2CONNECTTARIFF.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENCALC2CONNECTTARIFF.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALC2CONNECTTARIFF.MODIFY_TIME = ?";
        }
        if(aFilterObject.techCondServRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCALC2CONNECTTARIFF.TECHCONDSERVREFCODE = ? ";
        }
        if(aFilterObject.tariffEntry1Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCALC2CONNECTTARIFF.TARIFFENTRY1REFCODE = ? ";
        }
        if(aFilterObject.tariffEntry2Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCALC2CONNECTTARIFF.TARIFFENTRY2REFCODE = ? ";
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
        if(aFilterObject.power1Tariff != null){
            number++;
            aFilterObject.power1Tariff = aFilterObject.power1Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power1Tariff);
        }
        if(aFilterObject.tariff1value != null){
            number++;
            aFilterObject.tariff1value = aFilterObject.tariff1value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.tariff1value);
        }
        if(aFilterObject.summa1Tariff != null){
            number++;
            aFilterObject.summa1Tariff = aFilterObject.summa1Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.summa1Tariff);
        }
        if(aFilterObject.power2Tariff != null){
            number++;
            aFilterObject.power2Tariff = aFilterObject.power2Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power2Tariff);
        }
        if(aFilterObject.tariff2value != null){
            number++;
            aFilterObject.tariff2value = aFilterObject.tariff2value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.tariff2value);
        }
        if(aFilterObject.summa2Tariff != null){
            number++;
            aFilterObject.summa2Tariff = aFilterObject.summa2Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.summa2Tariff);
        }
        if(aFilterObject.summaTotal != null){
            number++;
            aFilterObject.summaTotal = aFilterObject.summaTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.summaTotal);
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCALC2CONNECTTARIFF.USERGEN = ?";
             else
                 whereStr = whereStr + " ENCALC2CONNECTTARIFF.USERGEN LIKE ?";

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
       if(aFilterObject.techCondServRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.techCondServRef.code);
       }
       if(aFilterObject.tariffEntry1Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.tariffEntry1Ref.code);
       }
       if(aFilterObject.tariffEntry2Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.tariffEntry2Ref.code);
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


   public ENCalc2ConnectTariff getObject(int uid) throws PersistenceException
   {
    ENCalc2ConnectTariff result = new ENCalc2ConnectTariff();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENCalc2ConnectTariff anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENCALC2CONNECTTARIFF.CODE, ENCALC2CONNECTTARIFF.POWER1TARIFF, ENCALC2CONNECTTARIFF.TARIFF1VALUE, ENCALC2CONNECTTARIFF.SUMMA1TARIFF, ENCALC2CONNECTTARIFF.POWER2TARIFF, ENCALC2CONNECTTARIFF.TARIFF2VALUE, ENCALC2CONNECTTARIFF.SUMMA2TARIFF, ENCALC2CONNECTTARIFF.SUMMATOTAL, ENCALC2CONNECTTARIFF.USERGEN, ENCALC2CONNECTTARIFF.DATEEDIT, ENCALC2CONNECTTARIFF.MODIFY_TIME, ENCALC2CONNECTTARIFF.TECHCONDSERVREFCODE, ENCALC2CONNECTTARIFF.TARIFFENTRY1REFCODE, ENCALC2CONNECTTARIFF.TARIFFENTRY2REFCODE "
    +" FROM ENCALC2CONNECTTARIFF WHERE ENCALC2CONNECTTARIFF.CODE = ?";

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
        anObject.power1Tariff = set.getBigDecimal(2);
        if(anObject.power1Tariff != null)
            anObject.power1Tariff = anObject.power1Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.tariff1value = set.getBigDecimal(3);
        if(anObject.tariff1value != null)
            anObject.tariff1value = anObject.tariff1value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.summa1Tariff = set.getBigDecimal(4);
        if(anObject.summa1Tariff != null)
            anObject.summa1Tariff = anObject.summa1Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power2Tariff = set.getBigDecimal(5);
        if(anObject.power2Tariff != null)
            anObject.power2Tariff = anObject.power2Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.tariff2value = set.getBigDecimal(6);
        if(anObject.tariff2value != null)
            anObject.tariff2value = anObject.tariff2value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.summa2Tariff = set.getBigDecimal(7);
        if(anObject.summa2Tariff != null)
            anObject.summa2Tariff = anObject.summa2Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.summaTotal = set.getBigDecimal(8);
        if(anObject.summaTotal != null)
            anObject.summaTotal = anObject.summaTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userGen = set.getString(9);
        anObject.dateEdit = set.getTimestamp(10);
        anObject.modify_time = set.getLong(11);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.techCondServRef.code = set.getInt(12);
        if ( set.wasNull() )
            anObject.techCondServRef.code = Integer.MIN_VALUE;
        anObject.tariffEntry1Ref.code = set.getInt(13);
        if ( set.wasNull() )
            anObject.tariffEntry1Ref.code = Integer.MIN_VALUE;
        anObject.tariffEntry2Ref.code = set.getInt(14);
        if ( set.wasNull() )
            anObject.tariffEntry2Ref.code = Integer.MIN_VALUE;
        if(anObject.techCondServRef.code != Integer.MIN_VALUE)
        {
           anObject.setTechCondServRef(
      new com.ksoe.energynet.dataminer.generated.ENTechConditionsServicesDAOGen(connection,getUserProfile()).getRef(anObject.techCondServRef.code));
    }
        if(anObject.tariffEntry1Ref.code != Integer.MIN_VALUE)
        {
           anObject.setTariffEntry1Ref(
      new com.ksoe.energynet.dataminer.generated.ENConnectionTariffEntryDAOGen(connection,getUserProfile()).getRef(anObject.tariffEntry1Ref.code));
    }
        if(anObject.tariffEntry2Ref.code != Integer.MIN_VALUE)
        {
           anObject.setTariffEntry2Ref(
      new com.ksoe.energynet.dataminer.generated.ENConnectionTariffEntryDAOGen(connection,getUserProfile()).getRef(anObject.tariffEntry2Ref.code));
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


  public com.ksoe.energynet.valueobject.references.ENCalc2ConnectTariffRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENCalc2ConnectTariffRef ref = new com.ksoe.energynet.valueobject.references.ENCalc2ConnectTariffRef();
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

    selectStr = "DELETE FROM  ENCALC2CONNECTTARIFF WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENCalc2ConnectTariff object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENCalc2ConnectTariff.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENCalc2ConnectTariff.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENCalc2ConnectTariff.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENCalc2ConnectTariff.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENCalc2ConnectTariff.getObject%} access denied");

    selectStr =

    "SELECT  ENCALC2CONNECTTARIFF.CODE FROM  ENCALC2CONNECTTARIFF WHERE  ENCALC2CONNECTTARIFF.CODE = ?";
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
    _checkConditionToken(condition,"code","ENCALC2CONNECTTARIFF.CODE");
    _checkConditionToken(condition,"power1tariff","ENCALC2CONNECTTARIFF.POWER1TARIFF");
    _checkConditionToken(condition,"tariff1value","ENCALC2CONNECTTARIFF.TARIFF1VALUE");
    _checkConditionToken(condition,"summa1tariff","ENCALC2CONNECTTARIFF.SUMMA1TARIFF");
    _checkConditionToken(condition,"power2tariff","ENCALC2CONNECTTARIFF.POWER2TARIFF");
    _checkConditionToken(condition,"tariff2value","ENCALC2CONNECTTARIFF.TARIFF2VALUE");
    _checkConditionToken(condition,"summa2tariff","ENCALC2CONNECTTARIFF.SUMMA2TARIFF");
    _checkConditionToken(condition,"summatotal","ENCALC2CONNECTTARIFF.SUMMATOTAL");
    _checkConditionToken(condition,"usergen","ENCALC2CONNECTTARIFF.USERGEN");
    _checkConditionToken(condition,"dateedit","ENCALC2CONNECTTARIFF.DATEEDIT");
    _checkConditionToken(condition,"modify_time","ENCALC2CONNECTTARIFF.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"techcondservref","TECHCONDSERVREFCODE");
    _checkConditionToken(condition,"techcondservref.code","TECHCONDSERVREFCODE");
    _checkConditionToken(condition,"tariffentry1ref","TARIFFENTRY1REFCODE");
    _checkConditionToken(condition,"tariffentry1ref.code","TARIFFENTRY1REFCODE");
    _checkConditionToken(condition,"tariffentry2ref","TARIFFENTRY2REFCODE");
    _checkConditionToken(condition,"tariffentry2ref.code","TARIFFENTRY2REFCODE");
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

  private void _collectAutoIncrementFields(ENCalc2ConnectTariff anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENCALC2CONNECTTARIFF", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENCALC2CONNECTTARIFF", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENCALC2CONNECTTARIFF", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENCALC2CONNECTTARIFF");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENCalc2ConnectTariffDAO
