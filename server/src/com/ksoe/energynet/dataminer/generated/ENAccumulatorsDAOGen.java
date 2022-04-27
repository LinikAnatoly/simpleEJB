
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
import com.ksoe.energynet.valueobject.ENAccumulators;
import com.ksoe.energynet.valueobject.brief.ENAccumulatorsShort;
import com.ksoe.energynet.valueobject.filter.ENAccumulatorsFilter;
import com.ksoe.energynet.valueobject.lists.ENAccumulatorsShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;

/**
 * DAO Object for ENAccumulators;
 *
 */

public class ENAccumulatorsDAOGen extends GenericDataMiner {

  public ENAccumulatorsDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENAccumulatorsDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENAccumulators inObject) throws PersistenceException
   {
      ENAccumulators obj = new ENAccumulators();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.name != obj.name){
       return false;
     }

     if (inObject.typeName != obj.typeName){
       return false;
     }

     if (inObject.factory != obj.factory){
       return false;
     }

     if (inObject.garageNumber != obj.garageNumber){
       return false;
     }

     if (inObject.yearProduction != obj.yearProduction){
       return false;
     }

     if (inObject.serialNumber != obj.serialNumber){
       return false;
     }

     if ( ! inObject.receiptDate.equals(obj.receiptDate)){
       return false;
     }

     if ( ! inObject.mileage.equals(obj.mileage)){
       return false;
     }

     if ( ! inObject.mileageAll.equals(obj.mileageAll)){
       return false;
     }

     if ( ! inObject.potencial.equals(obj.potencial)){
       return false;
     }
     if (inObject.materialRef.code != obj.materialRef.code){
        return false;
     }
     if (inObject.installStatusRef.code != obj.installStatusRef.code){
        return false;
     }
      return true;
   }

   public int add(ENAccumulators anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENAccumulators anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();
    if(anObject.getDomain_info() == null)
        anObject.setDomain_info(getUserProfile().getDomainInfo().getDomain());

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENACCUMULATORS (CODE,NAME,TYPENAME,FACTORY,GARAGENUMBER,YEARPRODUCTION,SERIALNUMBER,RECEIPTDATE,MILEAGE,MILEAGEALL,POTENCIAL,DOMAIN_INFO,MODIFY_TIME,MATERIALREFCODE,INSTALLSTATUSREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.name);
      statement.setString(3,anObject.typeName);
      statement.setString(4,anObject.factory);
      statement.setString(5,anObject.garageNumber);
      statement.setString(6,anObject.yearProduction);
      statement.setString(7,anObject.serialNumber);
      if (anObject.receiptDate == null)
        statement.setDate(8,null);
      else
        statement.setDate(8,new java.sql.Date(anObject.receiptDate.getTime()));
      if (anObject.mileage != null)
        anObject.mileage = anObject.mileage.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(9,anObject.mileage);
      if (anObject.mileageAll != null)
        anObject.mileageAll = anObject.mileageAll.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(10,anObject.mileageAll);
      if (anObject.potencial != null)
        anObject.potencial = anObject.potencial.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(11,anObject.potencial);
      statement.setString(12,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(13,null);
      else
        statement.setBigDecimal(13,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.materialRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKMaterialsDAOGen(connection,getUserProfile()).exists(anObject.materialRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENAccumulators.materialRef.code%} = {%"+anObject.materialRef.code+"%}");
        statement.setInt(14,anObject.materialRef.code);
      }
      else
        statement.setNull(14,java.sql.Types.INTEGER);
      if (anObject.installStatusRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENAccumulatorStatusDAOGen(connection,getUserProfile()).exists(anObject.installStatusRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENAccumulators.installStatusRef.code%} = {%"+anObject.installStatusRef.code+"%}");
        statement.setInt(15,anObject.installStatusRef.code);
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
      throw new PersistenceException("Error in method {%ENAccumulatorsDAOGen.add%}",e);
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

   public void save(ENAccumulators anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENAccumulators anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENAccumulators oldObject = new ENAccumulators();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENAccumulators.modify_time_Field + "," + ENAccumulators.domain_info_Field+" FROM  ENACCUMULATORS WHERE CODE = ?";

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
        oldObject.domain_info = set.getString(2);
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
    if(anObject.getDomain_info() == null)
        anObject.setDomain_info(getUserProfile().getDomainInfo().getDomain());
      String selectStr;

      Vector fields = null;
      if(anAttributes != null)
       {
        String fieldNameStr;
        fields = new Vector();
        for(int attrIndex = 0;attrIndex < anAttributes.length;attrIndex++)
         {
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("NAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TYPENAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FACTORY") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("GARAGENUMBER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("YEARPRODUCTION") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SERIALNUMBER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("RECEIPTDATE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("MILEAGE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("MILEAGEALL") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("POTENCIAL") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DOMAIN_INFO") == 0)
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
          if(fieldNameStr.compareTo("MATERIALREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("INSTALLSTATUSREF") == 0)
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
        "UPDATE ENACCUMULATORS SET  NAME = ? , TYPENAME = ? , FACTORY = ? , GARAGENUMBER = ? , YEARPRODUCTION = ? , SERIALNUMBER = ? , RECEIPTDATE = ? , MILEAGE = ? , MILEAGEALL = ? , POTENCIAL = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , MATERIALREFCODE = ? , INSTALLSTATUSREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENACCUMULATORS SET ";
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
      statement.setString(1,anObject.name);
      statement.setString(2,anObject.typeName);
      statement.setString(3,anObject.factory);
      statement.setString(4,anObject.garageNumber);
      statement.setString(5,anObject.yearProduction);
      statement.setString(6,anObject.serialNumber);
      if (anObject.receiptDate == null)
        statement.setDate(7,null);
      else
        statement.setDate(7,new java.sql.Date(anObject.receiptDate.getTime()));
      if (anObject.mileage != null)
        anObject.mileage = anObject.mileage.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.mileage);
      if (anObject.mileageAll != null)
        anObject.mileageAll = anObject.mileageAll.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(9,anObject.mileageAll);
      if (anObject.potencial != null)
        anObject.potencial = anObject.potencial.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(10,anObject.potencial);
      statement.setString(11,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(12,null);
      else
        statement.setBigDecimal(12,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.materialRef.code != Integer.MIN_VALUE)
        statement.setInt(13,anObject.materialRef.code);
      else
        statement.setNull(13,java.sql.Types.INTEGER);
      if (anObject.installStatusRef.code != Integer.MIN_VALUE)
        statement.setInt(14,anObject.installStatusRef.code);
      else
        statement.setNull(14,java.sql.Types.INTEGER);
          statement.setInt(15,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("NAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.name);
                continue;
             }
            if("TYPENAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.typeName);
                continue;
             }
            if("FACTORY".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.factory);
                continue;
             }
            if("GARAGENUMBER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.garageNumber);
                continue;
             }
            if("YEARPRODUCTION".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.yearProduction);
                continue;
             }
            if("SERIALNUMBER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.serialNumber);
                continue;
             }
            if("RECEIPTDATE".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.receiptDate == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.receiptDate.getTime()));
                continue;
             }
            if("MILEAGE".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.mileage != null)
                    anObject.mileage = anObject.mileage.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.mileage);
                continue;
             }
            if("MILEAGEALL".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.mileageAll != null)
                    anObject.mileageAll = anObject.mileageAll.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.mileageAll);
                continue;
             }
            if("POTENCIAL".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.potencial != null)
                    anObject.potencial = anObject.potencial.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.potencial);
                continue;
             }
            if("DOMAIN_INFO".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.domain_info);
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
            if("MATERIALREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.materialRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.materialRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("INSTALLSTATUSREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.installStatusRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.installStatusRef.code);
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

   } // end of save(ENAccumulators anObject,String[] anAttributes)


 public ENAccumulatorsShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENAccumulators filterObject = new ENAccumulators();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENAccumulatorsShort)list.get(0);
   return null;
  }

  public ENAccumulatorsShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENAccumulatorsShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENAccumulatorsShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENAccumulatorsShortList getFilteredList(ENAccumulators filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENAccumulatorsShortList getScrollableFilteredList(ENAccumulators aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENAccumulatorsShortList getScrollableFilteredList(ENAccumulators aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENAccumulatorsShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENAccumulatorsShortList getScrollableFilteredList(ENAccumulatorsFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENAccumulatorsShortList getScrollableFilteredList(ENAccumulatorsFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENAccumulatorsShortList getScrollableFilteredList(ENAccumulators aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENAccumulatorsShortList getScrollableFilteredList(ENAccumulators aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENAccumulatorsShortList result = new ENAccumulatorsShortList();
    ENAccumulatorsShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACCUMULATORS.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENACCUMULATORS.CODE"+
     ",ENACCUMULATORS.NAME"+
     ",ENACCUMULATORS.TYPENAME"+
     ",ENACCUMULATORS.FACTORY"+
     ",ENACCUMULATORS.GARAGENUMBER"+
     ",ENACCUMULATORS.YEARPRODUCTION"+
     ",ENACCUMULATORS.SERIALNUMBER"+
     ",ENACCUMULATORS.RECEIPTDATE"+
     ",ENACCUMULATORS.MILEAGE"+
     ",ENACCUMULATORS.MILEAGEALL"+
     ",ENACCUMULATORS.POTENCIAL"+

      ", TKMATERIALS.CODE " +
      ", TKMATERIALS.NAME " +
      ", TKMATERIALS.COST " +
      ", TKMATERIALS.DELIVERYDATE " +
      ", TKMATERIALS.NUMKATALOG " +
      ", TKMATERIALS.IDENTID " +
      ", ENACCUMULATORSTATUS.CODE " +
      ", ENACCUMULATORSTATUS.NAME " +
     " FROM ENACCUMULATORS " +
     ", TKMATERIALS " +
     ", ENACCUMULATORSTATUS " +
     //" WHERE "
    "";
     whereStr = " TKMATERIALS.CODE = ENACCUMULATORS.MATERIALREFCODE" ; //+
      whereStr = whereStr +" AND ENACCUMULATORSTATUS.CODE = ENACCUMULATORS.INSTALLSTATUSREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENACCUMULATORS.CODE IN ( SELECT ENACCUMULATORS.CODE FROM ENACCUMULATORS ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORS.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACCUMULATORS.NAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACCUMULATORS.NAME) LIKE UPPER(?)";
         }
         if (aFilterObject.typeName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.typeName.indexOf('*',0) < 0 && aFilterObject.typeName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACCUMULATORS.TYPENAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACCUMULATORS.TYPENAME) LIKE UPPER(?)";
         }
         if (aFilterObject.factory != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.factory.indexOf('*',0) < 0 && aFilterObject.factory.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACCUMULATORS.FACTORY) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACCUMULATORS.FACTORY) LIKE UPPER(?)";
         }
         if (aFilterObject.garageNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.garageNumber.indexOf('*',0) < 0 && aFilterObject.garageNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACCUMULATORS.GARAGENUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACCUMULATORS.GARAGENUMBER) LIKE UPPER(?)";
         }
         if (aFilterObject.yearProduction != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.yearProduction.indexOf('*',0) < 0 && aFilterObject.yearProduction.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACCUMULATORS.YEARPRODUCTION) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACCUMULATORS.YEARPRODUCTION) LIKE UPPER(?)";
         }
         if (aFilterObject.serialNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.serialNumber.indexOf('*',0) < 0 && aFilterObject.serialNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACCUMULATORS.SERIALNUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACCUMULATORS.SERIALNUMBER) LIKE UPPER(?)";
         }
        if(aFilterObject.receiptDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORS.RECEIPTDATE = ?";
        }
        if(aFilterObject.mileage != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORS.MILEAGE = ?";
        }
        if(aFilterObject.mileageAll != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORS.MILEAGEALL = ?";
        }
        if(aFilterObject.potencial != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORS.POTENCIAL = ?";
        }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACCUMULATORS.DOMAIN_INFO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACCUMULATORS.DOMAIN_INFO) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORS.MODIFY_TIME = ?";
        }
        if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACCUMULATORS.MATERIALREFCODE = ? ";
        }
        if(aFilterObject.installStatusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACCUMULATORS.INSTALLSTATUSREFCODE = ? ";
        }

      }


    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAccumulators.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENAccumulators.getList%} access denied");

    String domainWhereStr = SegregationQueryBuilder.addWhere("ENACCUMULATORS",segregationInfo,getUserProfile().getDomainInfo());

    if (domainWhereStr.length() != 0){
    // domainWhereStr = "  AND ENACCUMULATORS.DOMAIN_INFO IS NOT NULL";
    //else
    if (whereStr.length() == 0)
        whereStr = domainWhereStr;
    else
        whereStr = " "+whereStr + " AND " +domainWhereStr;
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

           if(aFilterObject.name != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.name);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.typeName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.typeName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.factory != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.factory);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.garageNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.garageNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.yearProduction != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.yearProduction);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.serialNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.serialNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.receiptDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.receiptDate.getTime()));
        }
        if(aFilterObject.mileage != null){
            number++;
            aFilterObject.mileage = aFilterObject.mileage.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.mileage);
        }
        if(aFilterObject.mileageAll != null){
            number++;
            aFilterObject.mileageAll = aFilterObject.mileageAll.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.mileageAll);
        }
        if(aFilterObject.potencial != null){
            number++;
            aFilterObject.potencial = aFilterObject.potencial.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.potencial);
        }

           if(aFilterObject.domain_info != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.domain_info);
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
       if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.materialRef.code);
       }
       if(aFilterObject.installStatusRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.installStatusRef.code);
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

        anObject = new ENAccumulatorsShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.name = set.getString(2);
        anObject.typeName = set.getString(3);
        anObject.factory = set.getString(4);
        anObject.garageNumber = set.getString(5);
        anObject.yearProduction = set.getString(6);
        anObject.serialNumber = set.getString(7);
        anObject.receiptDate = set.getDate(8);
        anObject.mileage = set.getBigDecimal(9);
        if(anObject.mileage != null)
            anObject.mileage = anObject.mileage.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.mileageAll = set.getBigDecimal(10);
        if(anObject.mileageAll != null)
            anObject.mileageAll = anObject.mileageAll.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.potencial = set.getBigDecimal(11);
        if(anObject.potencial != null)
            anObject.potencial = anObject.potencial.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.materialRefCode = set.getInt(12);
        if(set.wasNull())
        anObject.materialRefCode = Integer.MIN_VALUE;

        anObject.installStatusRefCode = set.getInt(18);
        if(set.wasNull())
        anObject.installStatusRefCode = Integer.MIN_VALUE;
        anObject.installStatusRefName = set.getString(19);

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

  public int[] getFilteredCodeArrayOLD(ENAccumulators aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENACCUMULATORS.CODE FROM ENACCUMULATORS";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACCUMULATORS.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAccumulators.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENAccumulators.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("ENACCUMULATORS",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (ENACCUMULATORS.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORS.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACCUMULATORS.NAME = ?";
             else
                 whereStr = whereStr + "  ENACCUMULATORS.NAME LIKE ?";
         }
         if (aFilterObject.typeName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.typeName.indexOf('*',0) < 0 && aFilterObject.typeName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACCUMULATORS.TYPENAME = ?";
             else
                 whereStr = whereStr + "  ENACCUMULATORS.TYPENAME LIKE ?";
         }
         if (aFilterObject.factory != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.factory.indexOf('*',0) < 0 && aFilterObject.factory.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACCUMULATORS.FACTORY = ?";
             else
                 whereStr = whereStr + "  ENACCUMULATORS.FACTORY LIKE ?";
         }
         if (aFilterObject.garageNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.garageNumber.indexOf('*',0) < 0 && aFilterObject.garageNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACCUMULATORS.GARAGENUMBER = ?";
             else
                 whereStr = whereStr + "  ENACCUMULATORS.GARAGENUMBER LIKE ?";
         }
         if (aFilterObject.yearProduction != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.yearProduction.indexOf('*',0) < 0 && aFilterObject.yearProduction.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACCUMULATORS.YEARPRODUCTION = ?";
             else
                 whereStr = whereStr + "  ENACCUMULATORS.YEARPRODUCTION LIKE ?";
         }
         if (aFilterObject.serialNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.serialNumber.indexOf('*',0) < 0 && aFilterObject.serialNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACCUMULATORS.SERIALNUMBER = ?";
             else
                 whereStr = whereStr + "  ENACCUMULATORS.SERIALNUMBER LIKE ?";
         }
        if(aFilterObject.receiptDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORS.RECEIPTDATE = ?";
        }
        if(aFilterObject.mileage != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORS.MILEAGE = ?";
        }
        if(aFilterObject.mileageAll != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORS.MILEAGEALL = ?";
        }
        if(aFilterObject.potencial != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORS.POTENCIAL = ?";
        }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACCUMULATORS.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENACCUMULATORS.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORS.MODIFY_TIME = ?";
        }
        if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACCUMULATORS.MATERIALREFCODE = ? ";
        }
        if(aFilterObject.installStatusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACCUMULATORS.INSTALLSTATUSREFCODE = ? ";
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
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACCUMULATORS.NAME = ?";
             else
                 whereStr = whereStr + " ENACCUMULATORS.NAME LIKE ?";

           if(aFilterObject.name != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.name);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.typeName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.typeName.indexOf('*',0) < 0 && aFilterObject.typeName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACCUMULATORS.TYPENAME = ?";
             else
                 whereStr = whereStr + " ENACCUMULATORS.TYPENAME LIKE ?";

           if(aFilterObject.typeName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.typeName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.factory != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.factory.indexOf('*',0) < 0 && aFilterObject.factory.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACCUMULATORS.FACTORY = ?";
             else
                 whereStr = whereStr + " ENACCUMULATORS.FACTORY LIKE ?";

           if(aFilterObject.factory != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.factory);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.garageNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.garageNumber.indexOf('*',0) < 0 && aFilterObject.garageNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACCUMULATORS.GARAGENUMBER = ?";
             else
                 whereStr = whereStr + " ENACCUMULATORS.GARAGENUMBER LIKE ?";

           if(aFilterObject.garageNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.garageNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.yearProduction != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.yearProduction.indexOf('*',0) < 0 && aFilterObject.yearProduction.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACCUMULATORS.YEARPRODUCTION = ?";
             else
                 whereStr = whereStr + " ENACCUMULATORS.YEARPRODUCTION LIKE ?";

           if(aFilterObject.yearProduction != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.yearProduction);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.serialNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.serialNumber.indexOf('*',0) < 0 && aFilterObject.serialNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACCUMULATORS.SERIALNUMBER = ?";
             else
                 whereStr = whereStr + " ENACCUMULATORS.SERIALNUMBER LIKE ?";

           if(aFilterObject.serialNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.serialNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.receiptDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.receiptDate.getTime()));
        }
        if(aFilterObject.mileage != null){
            number++;
            aFilterObject.mileage = aFilterObject.mileage.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.mileage);
        }
        if(aFilterObject.mileageAll != null){
            number++;
            aFilterObject.mileageAll = aFilterObject.mileageAll.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.mileageAll);
        }
        if(aFilterObject.potencial != null){
            number++;
            aFilterObject.potencial = aFilterObject.potencial.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.potencial);
        }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACCUMULATORS.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENACCUMULATORS.DOMAIN_INFO LIKE ?";

           if(aFilterObject.domain_info != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.domain_info);
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
       if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.materialRef.code);
       }
       if(aFilterObject.installStatusRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.installStatusRef.code);
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

  public int[] getFilteredCodeArray(ENAccumulatorsFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENAccumulators aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENACCUMULATORS.CODE FROM ENACCUMULATORS";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACCUMULATORS.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAccumulators.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENAccumulators.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("ENACCUMULATORS",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (ENACCUMULATORS.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORS.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACCUMULATORS.NAME = ?";
             else
                 whereStr = whereStr + "  ENACCUMULATORS.NAME LIKE ?";
         }
         if (aFilterObject.typeName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.typeName.indexOf('*',0) < 0 && aFilterObject.typeName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACCUMULATORS.TYPENAME = ?";
             else
                 whereStr = whereStr + "  ENACCUMULATORS.TYPENAME LIKE ?";
         }
         if (aFilterObject.factory != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.factory.indexOf('*',0) < 0 && aFilterObject.factory.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACCUMULATORS.FACTORY = ?";
             else
                 whereStr = whereStr + "  ENACCUMULATORS.FACTORY LIKE ?";
         }
         if (aFilterObject.garageNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.garageNumber.indexOf('*',0) < 0 && aFilterObject.garageNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACCUMULATORS.GARAGENUMBER = ?";
             else
                 whereStr = whereStr + "  ENACCUMULATORS.GARAGENUMBER LIKE ?";
         }
         if (aFilterObject.yearProduction != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.yearProduction.indexOf('*',0) < 0 && aFilterObject.yearProduction.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACCUMULATORS.YEARPRODUCTION = ?";
             else
                 whereStr = whereStr + "  ENACCUMULATORS.YEARPRODUCTION LIKE ?";
         }
         if (aFilterObject.serialNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.serialNumber.indexOf('*',0) < 0 && aFilterObject.serialNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACCUMULATORS.SERIALNUMBER = ?";
             else
                 whereStr = whereStr + "  ENACCUMULATORS.SERIALNUMBER LIKE ?";
         }
        if(aFilterObject.receiptDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORS.RECEIPTDATE = ?";
        }
        if(aFilterObject.mileage != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORS.MILEAGE = ?";
        }
        if(aFilterObject.mileageAll != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORS.MILEAGEALL = ?";
        }
        if(aFilterObject.potencial != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORS.POTENCIAL = ?";
        }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENACCUMULATORS.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENACCUMULATORS.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORS.MODIFY_TIME = ?";
        }
        if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACCUMULATORS.MATERIALREFCODE = ? ";
        }
        if(aFilterObject.installStatusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACCUMULATORS.INSTALLSTATUSREFCODE = ? ";
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
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACCUMULATORS.NAME = ?";
             else
                 whereStr = whereStr + " ENACCUMULATORS.NAME LIKE ?";

           if(aFilterObject.name != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.name);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.typeName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.typeName.indexOf('*',0) < 0 && aFilterObject.typeName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACCUMULATORS.TYPENAME = ?";
             else
                 whereStr = whereStr + " ENACCUMULATORS.TYPENAME LIKE ?";

           if(aFilterObject.typeName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.typeName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.factory != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.factory.indexOf('*',0) < 0 && aFilterObject.factory.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACCUMULATORS.FACTORY = ?";
             else
                 whereStr = whereStr + " ENACCUMULATORS.FACTORY LIKE ?";

           if(aFilterObject.factory != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.factory);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.garageNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.garageNumber.indexOf('*',0) < 0 && aFilterObject.garageNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACCUMULATORS.GARAGENUMBER = ?";
             else
                 whereStr = whereStr + " ENACCUMULATORS.GARAGENUMBER LIKE ?";

           if(aFilterObject.garageNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.garageNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.yearProduction != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.yearProduction.indexOf('*',0) < 0 && aFilterObject.yearProduction.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACCUMULATORS.YEARPRODUCTION = ?";
             else
                 whereStr = whereStr + " ENACCUMULATORS.YEARPRODUCTION LIKE ?";

           if(aFilterObject.yearProduction != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.yearProduction);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.serialNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.serialNumber.indexOf('*',0) < 0 && aFilterObject.serialNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACCUMULATORS.SERIALNUMBER = ?";
             else
                 whereStr = whereStr + " ENACCUMULATORS.SERIALNUMBER LIKE ?";

           if(aFilterObject.serialNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.serialNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.receiptDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.receiptDate.getTime()));
        }
        if(aFilterObject.mileage != null){
            number++;
            aFilterObject.mileage = aFilterObject.mileage.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.mileage);
        }
        if(aFilterObject.mileageAll != null){
            number++;
            aFilterObject.mileageAll = aFilterObject.mileageAll.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.mileageAll);
        }
        if(aFilterObject.potencial != null){
            number++;
            aFilterObject.potencial = aFilterObject.potencial.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.potencial);
        }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENACCUMULATORS.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENACCUMULATORS.DOMAIN_INFO LIKE ?";

           if(aFilterObject.domain_info != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.domain_info);
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
       if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.materialRef.code);
       }
       if(aFilterObject.installStatusRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.installStatusRef.code);
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


   public ENAccumulators getObject(int uid) throws PersistenceException
   {
    ENAccumulators result = new ENAccumulators();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENAccumulators anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAccumulators.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENAccumulators.getObject%} access denied");



    selectStr =
    "SELECT  ENACCUMULATORS.CODE, ENACCUMULATORS.NAME, ENACCUMULATORS.TYPENAME, ENACCUMULATORS.FACTORY, ENACCUMULATORS.GARAGENUMBER, ENACCUMULATORS.YEARPRODUCTION, ENACCUMULATORS.SERIALNUMBER, ENACCUMULATORS.RECEIPTDATE, ENACCUMULATORS.MILEAGE, ENACCUMULATORS.MILEAGEALL, ENACCUMULATORS.POTENCIAL, ENACCUMULATORS.DOMAIN_INFO, ENACCUMULATORS.MODIFY_TIME, ENACCUMULATORS.MATERIALREFCODE, ENACCUMULATORS.INSTALLSTATUSREFCODE "
    +" FROM ENACCUMULATORS WHERE ENACCUMULATORS.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("ENACCUMULATORS",segregationInfo,getUserProfile().getDomainInfo());
    if(segregationWhereStr.length() > 0)
     selectStr = selectStr + " AND " + segregationWhereStr;

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
        anObject.name = set.getString(2);
        anObject.typeName = set.getString(3);
        anObject.factory = set.getString(4);
        anObject.garageNumber = set.getString(5);
        anObject.yearProduction = set.getString(6);
        anObject.serialNumber = set.getString(7);
        anObject.receiptDate = set.getDate(8);
        anObject.mileage = set.getBigDecimal(9);
        if(anObject.mileage != null)
            anObject.mileage = anObject.mileage.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.mileageAll = set.getBigDecimal(10);
        if(anObject.mileageAll != null)
            anObject.mileageAll = anObject.mileageAll.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.potencial = set.getBigDecimal(11);
        if(anObject.potencial != null)
            anObject.potencial = anObject.potencial.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.domain_info = set.getString(12);
        anObject.modify_time = set.getLong(13);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.materialRef.code = set.getInt(14);
        if ( set.wasNull() )
            anObject.materialRef.code = Integer.MIN_VALUE;
        anObject.installStatusRef.code = set.getInt(15);
        if ( set.wasNull() )
            anObject.installStatusRef.code = Integer.MIN_VALUE;
        if(anObject.materialRef.code != Integer.MIN_VALUE)
        {
           anObject.setMaterialRef(
        new com.ksoe.techcard.dataminer.generated.TKMaterialsDAOGen(connection,getUserProfile()).getRef(anObject.materialRef.code));
    }
        if(anObject.installStatusRef.code != Integer.MIN_VALUE)
        {
           anObject.setInstallStatusRef(
        new com.ksoe.energynet.dataminer.generated.ENAccumulatorStatusDAOGen(connection,getUserProfile()).getRef(anObject.installStatusRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENAccumulatorsRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENAccumulatorsRef ref = new com.ksoe.energynet.valueobject.references.ENAccumulatorsRef();
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

    selectStr = "DELETE FROM  ENACCUMULATORS WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENAccumulators object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENAccumulators.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENAccumulators.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENAccumulators.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAccumulators.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENAccumulators.getObject%} access denied");

    selectStr =

    "SELECT  ENACCUMULATORS.CODE FROM  ENACCUMULATORS WHERE  ENACCUMULATORS.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("ENACCUMULATORS",segregationInfo,getUserProfile().getDomainInfo());
    if(segregationWhereStr.length() > 0)
     selectStr = selectStr +
      " AND " + segregationWhereStr;
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
    _checkConditionToken(condition,"code","ENACCUMULATORS.CODE");
    _checkConditionToken(condition,"name","ENACCUMULATORS.NAME");
    _checkConditionToken(condition,"typename","ENACCUMULATORS.TYPENAME");
    _checkConditionToken(condition,"factory","ENACCUMULATORS.FACTORY");
    _checkConditionToken(condition,"garagenumber","ENACCUMULATORS.GARAGENUMBER");
    _checkConditionToken(condition,"yearproduction","ENACCUMULATORS.YEARPRODUCTION");
    _checkConditionToken(condition,"serialnumber","ENACCUMULATORS.SERIALNUMBER");
    _checkConditionToken(condition,"receiptdate","ENACCUMULATORS.RECEIPTDATE");
    _checkConditionToken(condition,"mileage","ENACCUMULATORS.MILEAGE");
    _checkConditionToken(condition,"mileageall","ENACCUMULATORS.MILEAGEALL");
    _checkConditionToken(condition,"potencial","ENACCUMULATORS.POTENCIAL");
    _checkConditionToken(condition,"domain_info","ENACCUMULATORS.DOMAIN_INFO");
    _checkConditionToken(condition,"modify_time","ENACCUMULATORS.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"materialref","MATERIALREFCODE");
    _checkConditionToken(condition,"materialref.code","MATERIALREFCODE");
    _checkConditionToken(condition,"installstatusref","INSTALLSTATUSREFCODE");
    _checkConditionToken(condition,"installstatusref.code","INSTALLSTATUSREFCODE");
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

    private void _collectAutoIncrementFields(ENAccumulators anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENACCUMULATORS", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENACCUMULATORS", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENACCUMULATORS", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENACCUMULATORS");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENAccumulatorsDAO
