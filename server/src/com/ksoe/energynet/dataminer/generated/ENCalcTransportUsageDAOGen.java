
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
import com.ksoe.energynet.valueobject.ENCalcTransportUsage;
import com.ksoe.energynet.valueobject.brief.ENCalcTransportUsageShort;
import com.ksoe.energynet.valueobject.filter.ENCalcTransportUsageFilter;
import com.ksoe.energynet.valueobject.lists.ENCalcTransportUsageShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;

/**
 * DAO Object for ENCalcTransportUsage;
 *
 */

public class ENCalcTransportUsageDAOGen extends GenericDataMiner {

  public ENCalcTransportUsageDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENCalcTransportUsageDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENCalcTransportUsage inObject) throws PersistenceException
   {
      ENCalcTransportUsage obj = new ENCalcTransportUsage();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.numberGen != obj.numberGen){
       return false;
     }

     if (inObject.classificationTypeNumber != obj.classificationTypeNumber){
       return false;
     }

     if (inObject.transportName != obj.transportName){
       return false;
     }

     if ( ! inObject.normMachineHours.equals(obj.normMachineHours)){
       return false;
     }

     if ( ! inObject.normDistance.equals(obj.normDistance)){
       return false;
     }

     if ( ! inObject.priceMachineHours.equals(obj.priceMachineHours)){
       return false;
     }

     if ( ! inObject.priceDistance.equals(obj.priceDistance)){
       return false;
     }

     if ( ! inObject.costMachineHours.equals(obj.costMachineHours)){
       return false;
     }

     if ( ! inObject.costDistance.equals(obj.costDistance)){
       return false;
     }

     if ( ! inObject.costTotal.equals(obj.costTotal)){
       return false;
     }

     if (inObject.commentPriceDistance != obj.commentPriceDistance){
       return false;
     }
     if (inObject.planRef.code != obj.planRef.code){
        return false;
     }
     if (inObject.tkTransportRef.code != obj.tkTransportRef.code){
        return false;
     }
     if (inObject.plan2CTypeRef.code != obj.plan2CTypeRef.code){
        return false;
     }
      return true;
   }

   public int add(ENCalcTransportUsage anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENCalcTransportUsage anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENCALCTRANSPORTUSAGE (CODE,NUMBERGEN,CLASSIFICATIONTYPENMBR,TRANSPORTNAME,NORMMACHINEHOURS,NORMDISTANCE,PRICEMACHINEHOURS,PRICEDISTANCE,COSTMACHINEHOURS,COSTDISTANCE,COSTTOTAL,COMMENTPRICEDISTANCE,MODIFY_TIME,PLANREFCODE,TKTRANSPORTREFCODE,PLAN2CTYPEREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.numberGen != Integer.MIN_VALUE )
         statement.setInt(2,anObject.numberGen);
      else
         statement.setNull(2,java.sql.Types.INTEGER);
      statement.setString(3,anObject.classificationTypeNumber);
      statement.setString(4,anObject.transportName);
      if (anObject.normMachineHours != null)
        anObject.normMachineHours = anObject.normMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.normMachineHours);
      if (anObject.normDistance != null)
        anObject.normDistance = anObject.normDistance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.normDistance);
      if (anObject.priceMachineHours != null)
        anObject.priceMachineHours = anObject.priceMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.priceMachineHours);
      if (anObject.priceDistance != null)
        anObject.priceDistance = anObject.priceDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.priceDistance);
      if (anObject.costMachineHours != null)
        anObject.costMachineHours = anObject.costMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(9,anObject.costMachineHours);
      if (anObject.costDistance != null)
        anObject.costDistance = anObject.costDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(10,anObject.costDistance);
      if (anObject.costTotal != null)
        anObject.costTotal = anObject.costTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(11,anObject.costTotal);
      statement.setString(12,anObject.commentPriceDistance);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(13,null);
      else
        statement.setBigDecimal(13,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.planRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENCalcTransportUsage.planRef.code%} = {%"+anObject.planRef.code+"%}");
        statement.setInt(14,anObject.planRef.code);
      }
      else
        statement.setNull(14,java.sql.Types.INTEGER);
      if (anObject.tkTransportRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKTransportDAOGen(connection,getUserProfile()).exists(anObject.tkTransportRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENCalcTransportUsage.tkTransportRef.code%} = {%"+anObject.tkTransportRef.code+"%}");
        statement.setInt(15,anObject.tkTransportRef.code);
      }
      else
        statement.setNull(15,java.sql.Types.INTEGER);
      if (anObject.plan2CTypeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWork2ClassificationTypeDAOGen(connection,getUserProfile()).exists(anObject.plan2CTypeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENCalcTransportUsage.plan2CTypeRef.code%} = {%"+anObject.plan2CTypeRef.code+"%}");
        statement.setInt(16,anObject.plan2CTypeRef.code);
      }
      else
        statement.setNull(16,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENCalcTransportUsageDAOGen.add%}",e);
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

   public void save(ENCalcTransportUsage anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENCalcTransportUsage anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENCalcTransportUsage oldObject = new ENCalcTransportUsage();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENCalcTransportUsage.modify_time_Field+" FROM  ENCALCTRANSPORTUSAGE WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("NUMBERGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CLASSIFICATIONTYPENUMBER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TRANSPORTNAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("NORMMACHINEHOURS") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("NORMDISTANCE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PRICEMACHINEHOURS") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PRICEDISTANCE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COSTMACHINEHOURS") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COSTDISTANCE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COSTTOTAL") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COMMENTPRICEDISTANCE") == 0)
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
          if(fieldNameStr.compareTo("PLANREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TKTRANSPORTREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PLAN2CTYPEREF") == 0)
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
        "UPDATE ENCALCTRANSPORTUSAGE SET  NUMBERGEN = ? , CLASSIFICATIONTYPENMBR = ? , TRANSPORTNAME = ? , NORMMACHINEHOURS = ? , NORMDISTANCE = ? , PRICEMACHINEHOURS = ? , PRICEDISTANCE = ? , COSTMACHINEHOURS = ? , COSTDISTANCE = ? , COSTTOTAL = ? , COMMENTPRICEDISTANCE = ? , MODIFY_TIME = ? , PLANREFCODE = ? , TKTRANSPORTREFCODE = ? , PLAN2CTYPEREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENCALCTRANSPORTUSAGE SET ";
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
      if (anObject.numberGen != Integer.MIN_VALUE )
         statement.setInt(1,anObject.numberGen);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.classificationTypeNumber);
      statement.setString(3,anObject.transportName);
      if (anObject.normMachineHours != null)
        anObject.normMachineHours = anObject.normMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.normMachineHours);
      if (anObject.normDistance != null)
        anObject.normDistance = anObject.normDistance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.normDistance);
      if (anObject.priceMachineHours != null)
        anObject.priceMachineHours = anObject.priceMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.priceMachineHours);
      if (anObject.priceDistance != null)
        anObject.priceDistance = anObject.priceDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.priceDistance);
      if (anObject.costMachineHours != null)
        anObject.costMachineHours = anObject.costMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.costMachineHours);
      if (anObject.costDistance != null)
        anObject.costDistance = anObject.costDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(9,anObject.costDistance);
      if (anObject.costTotal != null)
        anObject.costTotal = anObject.costTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(10,anObject.costTotal);
      statement.setString(11,anObject.commentPriceDistance);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(12,null);
      else
        statement.setBigDecimal(12,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.planRef.code != Integer.MIN_VALUE)
        statement.setInt(13,anObject.planRef.code);
      else
        statement.setNull(13,java.sql.Types.INTEGER);
      if (anObject.tkTransportRef.code != Integer.MIN_VALUE)
        statement.setInt(14,anObject.tkTransportRef.code);
      else
        statement.setNull(14,java.sql.Types.INTEGER);
      if (anObject.plan2CTypeRef.code != Integer.MIN_VALUE)
        statement.setInt(15,anObject.plan2CTypeRef.code);
      else
        statement.setNull(15,java.sql.Types.INTEGER);
          statement.setInt(16,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("NUMBERGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.numberGen);
                continue;
             }
            if("CLASSIFICATIONTYPENUMBER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.classificationTypeNumber);
                continue;
             }
            if("TRANSPORTNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.transportName);
                continue;
             }
            if("NORMMACHINEHOURS".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.normMachineHours != null)
                    anObject.normMachineHours = anObject.normMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.normMachineHours);
                continue;
             }
            if("NORMDISTANCE".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.normDistance != null)
                    anObject.normDistance = anObject.normDistance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.normDistance);
                continue;
             }
            if("PRICEMACHINEHOURS".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.priceMachineHours != null)
                    anObject.priceMachineHours = anObject.priceMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.priceMachineHours);
                continue;
             }
            if("PRICEDISTANCE".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.priceDistance != null)
                    anObject.priceDistance = anObject.priceDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.priceDistance);
                continue;
             }
            if("COSTMACHINEHOURS".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.costMachineHours != null)
                    anObject.costMachineHours = anObject.costMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.costMachineHours);
                continue;
             }
            if("COSTDISTANCE".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.costDistance != null)
                    anObject.costDistance = anObject.costDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.costDistance);
                continue;
             }
            if("COSTTOTAL".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.costTotal != null)
                    anObject.costTotal = anObject.costTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.costTotal);
                continue;
             }
            if("COMMENTPRICEDISTANCE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.commentPriceDistance);
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
            if("PLANREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.planRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.planRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("TKTRANSPORTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.tkTransportRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.tkTransportRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("PLAN2CTYPEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.plan2CTypeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.plan2CTypeRef.code);
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

   } // end of save(ENCalcTransportUsage anObject,String[] anAttributes)


 public ENCalcTransportUsageShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENCalcTransportUsage filterObject = new ENCalcTransportUsage();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENCalcTransportUsageShort)list.get(0);
   return null;
  }

  public ENCalcTransportUsageShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENCalcTransportUsageShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENCalcTransportUsageShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENCalcTransportUsageShortList getFilteredList(ENCalcTransportUsage filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENCalcTransportUsageShortList getScrollableFilteredList(ENCalcTransportUsage aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENCalcTransportUsageShortList getScrollableFilteredList(ENCalcTransportUsage aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENCalcTransportUsageShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENCalcTransportUsageShortList getScrollableFilteredList(ENCalcTransportUsageFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENCalcTransportUsageShortList getScrollableFilteredList(ENCalcTransportUsageFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENCalcTransportUsageShortList getScrollableFilteredList(ENCalcTransportUsage aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENCalcTransportUsageShortList getScrollableFilteredList(ENCalcTransportUsage aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENCalcTransportUsageShortList result = new ENCalcTransportUsageShortList();
    ENCalcTransportUsageShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCALCTRANSPORTUSAGE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENCALCTRANSPORTUSAGE.CODE"+
     ",ENCALCTRANSPORTUSAGE.NUMBERGEN"+
     ",ENCALCTRANSPORTUSAGE.CLASSIFICATIONTYPENMBR"+
     ",ENCALCTRANSPORTUSAGE.TRANSPORTNAME"+
     ",ENCALCTRANSPORTUSAGE.NORMMACHINEHOURS"+
     ",ENCALCTRANSPORTUSAGE.NORMDISTANCE"+
     ",ENCALCTRANSPORTUSAGE.PRICEMACHINEHOURS"+
     ",ENCALCTRANSPORTUSAGE.PRICEDISTANCE"+
     ",ENCALCTRANSPORTUSAGE.COSTMACHINEHOURS"+
     ",ENCALCTRANSPORTUSAGE.COSTDISTANCE"+
     ",ENCALCTRANSPORTUSAGE.COSTTOTAL"+
     ",ENCALCTRANSPORTUSAGE.COMMENTPRICEDISTANCE"+

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
      ", TKTRANSPORT.CODE " +
      ", TKTRANSPORT.NAME " +
      ", ENPLANWORK2CLASSFCTNTP.CODE " +
      ", ENPLANWORK2CLASSFCTNTP.COUNTGEN " +
      ", ENPLANWORK2CLASSFCTNTP.USERGEN " +
      ", ENPLANWORK2CLASSFCTNTP.DATEEDIT " +
      ", ENPLANWORK2CLASSFCTNTP.MACHINEHOURS " +
      ", ENPLANWORK2CLASSFCTNTP.RELOCATIONKM " +
      ", ENPLANWORK2CLASSFCTNTP.TRANSPORTATIONLOAD " +
      ", ENPLANWORK2CLASSFCTNTP.ISPRINTONKMORMH " +
      ", ENPLANWORK2CLASSFCTNTP.COSTWORKSCONTRACTOR " +
      ", ENPLANWORK2CLASSFCTNTP.DATEGEN " +
      ", ENPLANWORK2CLASSFCTNTP.TIMESTART " +
      ", ENPLANWORK2CLASSFCTNTP.TIMEFINAL " +
      ", ENPLANWORK2CLASSFCTNTP.CODEVIRTUALBRIGADE " +
      ", ENPLANWORK2CLASSFCTNTP.ISJOBSBYTIME " +
      ", ENPLANWORK2CLASSFCTNTP.ISVISITCLIENT " +
     " FROM ENCALCTRANSPORTUSAGE " +
     ", ENPLANWORK " +
     ", TKTRANSPORT " +
     ", ENPLANWORK2CLASSFCTNTP " +
     //" WHERE "
    "";
     whereStr = " ENPLANWORK.CODE = ENCALCTRANSPORTUSAGE.PLANREFCODE" ; //+
      whereStr = whereStr +" AND TKTRANSPORT.CODE = ENCALCTRANSPORTUSAGE.TKTRANSPORTREFCODE" ; //+
      whereStr = whereStr +" AND ENPLANWORK2CLASSFCTNTP.CODE = ENCALCTRANSPORTUSAGE.PLAN2CTYPEREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENCALCTRANSPORTUSAGE.CODE IN ( SELECT ENCALCTRANSPORTUSAGE.CODE FROM ENCALCTRANSPORTUSAGE ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.CODE = ?";
        }
        if(aFilterObject.numberGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.NUMBERGEN = ?";
        }
         if (aFilterObject.classificationTypeNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.classificationTypeNumber.indexOf('*',0) < 0 && aFilterObject.classificationTypeNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCALCTRANSPORTUSAGE.CLASSIFICATIONTYPENMBR) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCALCTRANSPORTUSAGE.CLASSIFICATIONTYPENMBR) LIKE UPPER(?)";
         }
         if (aFilterObject.transportName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.transportName.indexOf('*',0) < 0 && aFilterObject.transportName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCALCTRANSPORTUSAGE.TRANSPORTNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCALCTRANSPORTUSAGE.TRANSPORTNAME) LIKE UPPER(?)";
         }
        if(aFilterObject.normMachineHours != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.NORMMACHINEHOURS = ?";
        }
        if(aFilterObject.normDistance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.NORMDISTANCE = ?";
        }
        if(aFilterObject.priceMachineHours != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.PRICEMACHINEHOURS = ?";
        }
        if(aFilterObject.priceDistance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.PRICEDISTANCE = ?";
        }
        if(aFilterObject.costMachineHours != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.COSTMACHINEHOURS = ?";
        }
        if(aFilterObject.costDistance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.COSTDISTANCE = ?";
        }
        if(aFilterObject.costTotal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.COSTTOTAL = ?";
        }
         if (aFilterObject.commentPriceDistance != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentPriceDistance.indexOf('*',0) < 0 && aFilterObject.commentPriceDistance.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCALCTRANSPORTUSAGE.COMMENTPRICEDISTANCE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCALCTRANSPORTUSAGE.COMMENTPRICEDISTANCE) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.MODIFY_TIME = ?";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENCALCTRANSPORTUSAGE.PLANREFCODE = ? ";
        }
        if(aFilterObject.tkTransportRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENCALCTRANSPORTUSAGE.TKTRANSPORTREFCODE = ? ";
        }
        if(aFilterObject.plan2CTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENCALCTRANSPORTUSAGE.PLAN2CTYPEREFCODE = ? ";
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
         if(aFilterObject.numberGen != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.numberGen);
         }

           if(aFilterObject.classificationTypeNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.classificationTypeNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.transportName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.transportName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.normMachineHours != null){
            number++;
            aFilterObject.normMachineHours = aFilterObject.normMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.normMachineHours);
        }
        if(aFilterObject.normDistance != null){
            number++;
            aFilterObject.normDistance = aFilterObject.normDistance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.normDistance);
        }
        if(aFilterObject.priceMachineHours != null){
            number++;
            aFilterObject.priceMachineHours = aFilterObject.priceMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.priceMachineHours);
        }
        if(aFilterObject.priceDistance != null){
            number++;
            aFilterObject.priceDistance = aFilterObject.priceDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.priceDistance);
        }
        if(aFilterObject.costMachineHours != null){
            number++;
            aFilterObject.costMachineHours = aFilterObject.costMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costMachineHours);
        }
        if(aFilterObject.costDistance != null){
            number++;
            aFilterObject.costDistance = aFilterObject.costDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costDistance);
        }
        if(aFilterObject.costTotal != null){
            number++;
            aFilterObject.costTotal = aFilterObject.costTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costTotal);
        }

           if(aFilterObject.commentPriceDistance != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.commentPriceDistance);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
       }
       if(aFilterObject.tkTransportRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.tkTransportRef.code);
       }
       if(aFilterObject.plan2CTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.plan2CTypeRef.code);
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

        anObject = new ENCalcTransportUsageShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.numberGen = set.getInt(2);
        if ( set.wasNull() )
            anObject.numberGen = Integer.MIN_VALUE;
        anObject.classificationTypeNumber = set.getString(3);
        anObject.transportName = set.getString(4);
        anObject.normMachineHours = set.getBigDecimal(5);
        if(anObject.normMachineHours != null)
            anObject.normMachineHours = anObject.normMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.normDistance = set.getBigDecimal(6);
        if(anObject.normDistance != null)
            anObject.normDistance = anObject.normDistance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.priceMachineHours = set.getBigDecimal(7);
        if(anObject.priceMachineHours != null)
            anObject.priceMachineHours = anObject.priceMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.priceDistance = set.getBigDecimal(8);
        if(anObject.priceDistance != null)
            anObject.priceDistance = anObject.priceDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.costMachineHours = set.getBigDecimal(9);
        if(anObject.costMachineHours != null)
            anObject.costMachineHours = anObject.costMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.costDistance = set.getBigDecimal(10);
        if(anObject.costDistance != null)
            anObject.costDistance = anObject.costDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.costTotal = set.getBigDecimal(11);
        if(anObject.costTotal != null)
            anObject.costTotal = anObject.costTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.commentPriceDistance = set.getString(12);

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

        anObject.tkTransportRefCode = set.getInt(33);
        if(set.wasNull())
        anObject.tkTransportRefCode = Integer.MIN_VALUE;
        anObject.tkTransportRefName = set.getString(34);
        anObject.plan2CTypeRefCode = set.getInt(35);
        if(set.wasNull())
        anObject.plan2CTypeRefCode = Integer.MIN_VALUE;
        anObject.plan2CTypeRefCountGen = set.getBigDecimal(36);
        if(anObject.plan2CTypeRefCountGen != null)
          anObject.plan2CTypeRefCountGen = anObject.plan2CTypeRefCountGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.plan2CTypeRefUserGen = set.getString(37);
        anObject.plan2CTypeRefDateEdit = set.getDate(38);


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

  public int[] getFilteredCodeArrayOLD(ENCalcTransportUsage aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENCALCTRANSPORTUSAGE.CODE FROM ENCALCTRANSPORTUSAGE";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCALCTRANSPORTUSAGE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.CODE = ?";
        }
        if(aFilterObject.numberGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.NUMBERGEN = ?";
        }
         if (aFilterObject.classificationTypeNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.classificationTypeNumber.indexOf('*',0) < 0 && aFilterObject.classificationTypeNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.CLASSIFICATIONTYPENMBR = ?";
             else
                 whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.CLASSIFICATIONTYPENMBR LIKE ?";
         }
         if (aFilterObject.transportName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.transportName.indexOf('*',0) < 0 && aFilterObject.transportName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.TRANSPORTNAME = ?";
             else
                 whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.TRANSPORTNAME LIKE ?";
         }
        if(aFilterObject.normMachineHours != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.NORMMACHINEHOURS = ?";
        }
        if(aFilterObject.normDistance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.NORMDISTANCE = ?";
        }
        if(aFilterObject.priceMachineHours != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.PRICEMACHINEHOURS = ?";
        }
        if(aFilterObject.priceDistance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.PRICEDISTANCE = ?";
        }
        if(aFilterObject.costMachineHours != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.COSTMACHINEHOURS = ?";
        }
        if(aFilterObject.costDistance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.COSTDISTANCE = ?";
        }
        if(aFilterObject.costTotal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.COSTTOTAL = ?";
        }
         if (aFilterObject.commentPriceDistance != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentPriceDistance.indexOf('*',0) < 0 && aFilterObject.commentPriceDistance.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.COMMENTPRICEDISTANCE = ?";
             else
                 whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.COMMENTPRICEDISTANCE LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.MODIFY_TIME = ?";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCALCTRANSPORTUSAGE.PLANREFCODE = ? ";
        }
        if(aFilterObject.tkTransportRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCALCTRANSPORTUSAGE.TKTRANSPORTREFCODE = ? ";
        }
        if(aFilterObject.plan2CTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCALCTRANSPORTUSAGE.PLAN2CTYPEREFCODE = ? ";
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
         if(aFilterObject.numberGen != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.numberGen);
         }
         if (aFilterObject.classificationTypeNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.classificationTypeNumber.indexOf('*',0) < 0 && aFilterObject.classificationTypeNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCALCTRANSPORTUSAGE.CLASSIFICATIONTYPENMBR = ?";
             else
                 whereStr = whereStr + " ENCALCTRANSPORTUSAGE.CLASSIFICATIONTYPENMBR LIKE ?";

           if(aFilterObject.classificationTypeNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.classificationTypeNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.transportName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.transportName.indexOf('*',0) < 0 && aFilterObject.transportName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCALCTRANSPORTUSAGE.TRANSPORTNAME = ?";
             else
                 whereStr = whereStr + " ENCALCTRANSPORTUSAGE.TRANSPORTNAME LIKE ?";

           if(aFilterObject.transportName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.transportName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.normMachineHours != null){
            number++;
            aFilterObject.normMachineHours = aFilterObject.normMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.normMachineHours);
        }
        if(aFilterObject.normDistance != null){
            number++;
            aFilterObject.normDistance = aFilterObject.normDistance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.normDistance);
        }
        if(aFilterObject.priceMachineHours != null){
            number++;
            aFilterObject.priceMachineHours = aFilterObject.priceMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.priceMachineHours);
        }
        if(aFilterObject.priceDistance != null){
            number++;
            aFilterObject.priceDistance = aFilterObject.priceDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.priceDistance);
        }
        if(aFilterObject.costMachineHours != null){
            number++;
            aFilterObject.costMachineHours = aFilterObject.costMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costMachineHours);
        }
        if(aFilterObject.costDistance != null){
            number++;
            aFilterObject.costDistance = aFilterObject.costDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costDistance);
        }
        if(aFilterObject.costTotal != null){
            number++;
            aFilterObject.costTotal = aFilterObject.costTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costTotal);
        }
         if (aFilterObject.commentPriceDistance != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentPriceDistance.indexOf('*',0) < 0 && aFilterObject.commentPriceDistance.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCALCTRANSPORTUSAGE.COMMENTPRICEDISTANCE = ?";
             else
                 whereStr = whereStr + " ENCALCTRANSPORTUSAGE.COMMENTPRICEDISTANCE LIKE ?";

           if(aFilterObject.commentPriceDistance != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.commentPriceDistance);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
       }
       if(aFilterObject.tkTransportRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.tkTransportRef.code);
       }
       if(aFilterObject.plan2CTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.plan2CTypeRef.code);
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

  public int[] getFilteredCodeArray(ENCalcTransportUsageFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENCalcTransportUsage aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENCALCTRANSPORTUSAGE.CODE FROM ENCALCTRANSPORTUSAGE";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCALCTRANSPORTUSAGE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.CODE = ?";
        }
        if(aFilterObject.numberGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.NUMBERGEN = ?";
        }
         if (aFilterObject.classificationTypeNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.classificationTypeNumber.indexOf('*',0) < 0 && aFilterObject.classificationTypeNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.CLASSIFICATIONTYPENMBR = ?";
             else
                 whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.CLASSIFICATIONTYPENMBR LIKE ?";
         }
         if (aFilterObject.transportName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.transportName.indexOf('*',0) < 0 && aFilterObject.transportName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.TRANSPORTNAME = ?";
             else
                 whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.TRANSPORTNAME LIKE ?";
         }
        if(aFilterObject.normMachineHours != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.NORMMACHINEHOURS = ?";
        }
        if(aFilterObject.normDistance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.NORMDISTANCE = ?";
        }
        if(aFilterObject.priceMachineHours != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.PRICEMACHINEHOURS = ?";
        }
        if(aFilterObject.priceDistance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.PRICEDISTANCE = ?";
        }
        if(aFilterObject.costMachineHours != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.COSTMACHINEHOURS = ?";
        }
        if(aFilterObject.costDistance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.COSTDISTANCE = ?";
        }
        if(aFilterObject.costTotal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.COSTTOTAL = ?";
        }
         if (aFilterObject.commentPriceDistance != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentPriceDistance.indexOf('*',0) < 0 && aFilterObject.commentPriceDistance.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.COMMENTPRICEDISTANCE = ?";
             else
                 whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.COMMENTPRICEDISTANCE LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCALCTRANSPORTUSAGE.MODIFY_TIME = ?";
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCALCTRANSPORTUSAGE.PLANREFCODE = ? ";
        }
        if(aFilterObject.tkTransportRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCALCTRANSPORTUSAGE.TKTRANSPORTREFCODE = ? ";
        }
        if(aFilterObject.plan2CTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCALCTRANSPORTUSAGE.PLAN2CTYPEREFCODE = ? ";
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
         if(aFilterObject.numberGen != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.numberGen);
         }
         if (aFilterObject.classificationTypeNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.classificationTypeNumber.indexOf('*',0) < 0 && aFilterObject.classificationTypeNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCALCTRANSPORTUSAGE.CLASSIFICATIONTYPENMBR = ?";
             else
                 whereStr = whereStr + " ENCALCTRANSPORTUSAGE.CLASSIFICATIONTYPENMBR LIKE ?";

           if(aFilterObject.classificationTypeNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.classificationTypeNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.transportName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.transportName.indexOf('*',0) < 0 && aFilterObject.transportName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCALCTRANSPORTUSAGE.TRANSPORTNAME = ?";
             else
                 whereStr = whereStr + " ENCALCTRANSPORTUSAGE.TRANSPORTNAME LIKE ?";

           if(aFilterObject.transportName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.transportName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.normMachineHours != null){
            number++;
            aFilterObject.normMachineHours = aFilterObject.normMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.normMachineHours);
        }
        if(aFilterObject.normDistance != null){
            number++;
            aFilterObject.normDistance = aFilterObject.normDistance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.normDistance);
        }
        if(aFilterObject.priceMachineHours != null){
            number++;
            aFilterObject.priceMachineHours = aFilterObject.priceMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.priceMachineHours);
        }
        if(aFilterObject.priceDistance != null){
            number++;
            aFilterObject.priceDistance = aFilterObject.priceDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.priceDistance);
        }
        if(aFilterObject.costMachineHours != null){
            number++;
            aFilterObject.costMachineHours = aFilterObject.costMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costMachineHours);
        }
        if(aFilterObject.costDistance != null){
            number++;
            aFilterObject.costDistance = aFilterObject.costDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costDistance);
        }
        if(aFilterObject.costTotal != null){
            number++;
            aFilterObject.costTotal = aFilterObject.costTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costTotal);
        }
         if (aFilterObject.commentPriceDistance != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentPriceDistance.indexOf('*',0) < 0 && aFilterObject.commentPriceDistance.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCALCTRANSPORTUSAGE.COMMENTPRICEDISTANCE = ?";
             else
                 whereStr = whereStr + " ENCALCTRANSPORTUSAGE.COMMENTPRICEDISTANCE LIKE ?";

           if(aFilterObject.commentPriceDistance != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.commentPriceDistance);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planRef.code);
       }
       if(aFilterObject.tkTransportRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.tkTransportRef.code);
       }
       if(aFilterObject.plan2CTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.plan2CTypeRef.code);
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


   public ENCalcTransportUsage getObject(int uid) throws PersistenceException
   {
    ENCalcTransportUsage result = new ENCalcTransportUsage();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENCalcTransportUsage anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENCALCTRANSPORTUSAGE.CODE, ENCALCTRANSPORTUSAGE.NUMBERGEN, ENCALCTRANSPORTUSAGE.CLASSIFICATIONTYPENMBR, ENCALCTRANSPORTUSAGE.TRANSPORTNAME, ENCALCTRANSPORTUSAGE.NORMMACHINEHOURS, ENCALCTRANSPORTUSAGE.NORMDISTANCE, ENCALCTRANSPORTUSAGE.PRICEMACHINEHOURS, ENCALCTRANSPORTUSAGE.PRICEDISTANCE, ENCALCTRANSPORTUSAGE.COSTMACHINEHOURS, ENCALCTRANSPORTUSAGE.COSTDISTANCE, ENCALCTRANSPORTUSAGE.COSTTOTAL, ENCALCTRANSPORTUSAGE.COMMENTPRICEDISTANCE, ENCALCTRANSPORTUSAGE.MODIFY_TIME, ENCALCTRANSPORTUSAGE.PLANREFCODE, ENCALCTRANSPORTUSAGE.TKTRANSPORTREFCODE, ENCALCTRANSPORTUSAGE.PLAN2CTYPEREFCODE "
    +" FROM ENCALCTRANSPORTUSAGE WHERE ENCALCTRANSPORTUSAGE.CODE = ?";

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
        anObject.numberGen = set.getInt(2);
        if ( set.wasNull() )
           anObject.numberGen = Integer.MIN_VALUE;
        anObject.classificationTypeNumber = set.getString(3);
        anObject.transportName = set.getString(4);
        anObject.normMachineHours = set.getBigDecimal(5);
        if(anObject.normMachineHours != null)
            anObject.normMachineHours = anObject.normMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.normDistance = set.getBigDecimal(6);
        if(anObject.normDistance != null)
            anObject.normDistance = anObject.normDistance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.priceMachineHours = set.getBigDecimal(7);
        if(anObject.priceMachineHours != null)
            anObject.priceMachineHours = anObject.priceMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.priceDistance = set.getBigDecimal(8);
        if(anObject.priceDistance != null)
            anObject.priceDistance = anObject.priceDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.costMachineHours = set.getBigDecimal(9);
        if(anObject.costMachineHours != null)
            anObject.costMachineHours = anObject.costMachineHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.costDistance = set.getBigDecimal(10);
        if(anObject.costDistance != null)
            anObject.costDistance = anObject.costDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.costTotal = set.getBigDecimal(11);
        if(anObject.costTotal != null)
            anObject.costTotal = anObject.costTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.commentPriceDistance = set.getString(12);
        anObject.modify_time = set.getLong(13);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.planRef.code = set.getInt(14);
        if ( set.wasNull() )
            anObject.planRef.code = Integer.MIN_VALUE;
        anObject.tkTransportRef.code = set.getInt(15);
        if ( set.wasNull() )
            anObject.tkTransportRef.code = Integer.MIN_VALUE;
        anObject.plan2CTypeRef.code = set.getInt(16);
        if ( set.wasNull() )
            anObject.plan2CTypeRef.code = Integer.MIN_VALUE;
        if(anObject.planRef.code != Integer.MIN_VALUE)
        {
           anObject.setPlanRef(
        new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).getRef(anObject.planRef.code));
    }
        if(anObject.tkTransportRef.code != Integer.MIN_VALUE)
        {
           anObject.setTkTransportRef(
        new com.ksoe.techcard.dataminer.generated.TKTransportDAOGen(connection,getUserProfile()).getRef(anObject.tkTransportRef.code));
    }
        if(anObject.plan2CTypeRef.code != Integer.MIN_VALUE)
        {
           anObject.setPlan2CTypeRef(
        new com.ksoe.energynet.dataminer.generated.ENPlanWork2ClassificationTypeDAOGen(connection,getUserProfile()).getRef(anObject.plan2CTypeRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENCalcTransportUsageRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENCalcTransportUsageRef ref = new com.ksoe.energynet.valueobject.references.ENCalcTransportUsageRef();
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

    selectStr = "DELETE FROM  ENCALCTRANSPORTUSAGE WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENCalcTransportUsage object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENCalcTransportUsage.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENCalcTransportUsage.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENCalcTransportUsage.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENCalcTransportUsage.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENCalcTransportUsage.getObject%} access denied");

    selectStr =

    "SELECT  ENCALCTRANSPORTUSAGE.CODE FROM  ENCALCTRANSPORTUSAGE WHERE  ENCALCTRANSPORTUSAGE.CODE = ?";
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
    _checkConditionToken(condition,"code","ENCALCTRANSPORTUSAGE.CODE");
    _checkConditionToken(condition,"numbergen","ENCALCTRANSPORTUSAGE.NUMBERGEN");
    _checkConditionToken(condition,"classificationtypenumber","ENCALCTRANSPORTUSAGE.CLASSIFICATIONTYPENMBR");
    _checkConditionToken(condition,"transportname","ENCALCTRANSPORTUSAGE.TRANSPORTNAME");
    _checkConditionToken(condition,"normmachinehours","ENCALCTRANSPORTUSAGE.NORMMACHINEHOURS");
    _checkConditionToken(condition,"normdistance","ENCALCTRANSPORTUSAGE.NORMDISTANCE");
    _checkConditionToken(condition,"pricemachinehours","ENCALCTRANSPORTUSAGE.PRICEMACHINEHOURS");
    _checkConditionToken(condition,"pricedistance","ENCALCTRANSPORTUSAGE.PRICEDISTANCE");
    _checkConditionToken(condition,"costmachinehours","ENCALCTRANSPORTUSAGE.COSTMACHINEHOURS");
    _checkConditionToken(condition,"costdistance","ENCALCTRANSPORTUSAGE.COSTDISTANCE");
    _checkConditionToken(condition,"costtotal","ENCALCTRANSPORTUSAGE.COSTTOTAL");
    _checkConditionToken(condition,"commentpricedistance","ENCALCTRANSPORTUSAGE.COMMENTPRICEDISTANCE");
    _checkConditionToken(condition,"modify_time","ENCALCTRANSPORTUSAGE.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"planref","PLANREFCODE");
    _checkConditionToken(condition,"planref.code","PLANREFCODE");
    _checkConditionToken(condition,"tktransportref","TKTRANSPORTREFCODE");
    _checkConditionToken(condition,"tktransportref.code","TKTRANSPORTREFCODE");
    _checkConditionToken(condition,"plan2ctyperef","PLAN2CTYPEREFCODE");
    _checkConditionToken(condition,"plan2ctyperef.code","PLAN2CTYPEREFCODE");
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

    private void _collectAutoIncrementFields(ENCalcTransportUsage anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENCALCTRANSPORTUSAGE", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENCALCTRANSPORTUSAGE", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENCALCTRANSPORTUSAGE", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENCALCTRANSPORTUSAGE");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENCalcTransportUsageDAO
