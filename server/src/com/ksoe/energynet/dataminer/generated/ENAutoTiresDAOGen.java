
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
import com.ksoe.energynet.valueobject.ENAutoTires;
import com.ksoe.energynet.valueobject.brief.ENAutoTiresShort;
import com.ksoe.energynet.valueobject.filter.ENAutoTiresFilter;
import com.ksoe.energynet.valueobject.lists.ENAutoTiresShortList;
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
 * DAO Object for ENAutoTires;
 *
 */

public class ENAutoTiresDAOGen extends GenericDataMiner {

  public ENAutoTiresDAOGen() {super();}
  public ENAutoTiresDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENAutoTiresDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENAutoTires inObject) throws PersistenceException
   {
      ENAutoTires obj = new ENAutoTires();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.typeName != obj.typeName){
       return false;
     }

     if (inObject.garageNumber != obj.garageNumber){
       return false;
     }

     if (inObject.serialNumber != obj.serialNumber){
       return false;
     }

     if (inObject.factory != obj.factory){
       return false;
     }

     if ( ! inObject.potencial.equals(obj.potencial)){
       return false;
     }

     if ( ! inObject.distanceAll.equals(obj.distanceAll)){
       return false;
     }

     if (inObject.nominal != obj.nominal){
       return false;
     }
     if (inObject.materialRef.code != obj.materialRef.code){
        return false;
     }
     if (inObject.departmentRef.code != obj.departmentRef.code){
        return false;
     }
     if (inObject.installStatusRef.code != obj.installStatusRef.code){
        return false;
     }
      return true;
   }

   public int add(ENAutoTires anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENAutoTires anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();
    if(anObject.getDomain_info() == null)
        anObject.setDomain_info(getUserProfile().getDomainInfo().getDomain());

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENAUTOTIRES (CODE,TYPENAME,GARAGENUMBER,SERIALNUMBER,FACTORY,POTENCIAL,DISTANCEALL,NOMINAL,DOMAIN_INFO,MODIFY_TIME,MATERIALREFCODE,DEPARTMENTREFCODE,INSTALLSTATUSREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.typeName);
      statement.setString(3,anObject.garageNumber);
      statement.setString(4,anObject.serialNumber);
      statement.setString(5,anObject.factory);
      if (anObject.potencial != null)
        anObject.potencial = anObject.potencial.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.potencial);
      if (anObject.distanceAll != null)
        anObject.distanceAll = anObject.distanceAll.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.distanceAll);
      statement.setString(8,anObject.nominal);
      statement.setString(9,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(10,null);
      else
        statement.setBigDecimal(10,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.materialRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKMaterialsDAOGen(connection,getUserProfile()).exists(anObject.materialRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENAutoTires.materialRef.code%} = {%"+anObject.materialRef.code+"%}");
        statement.setInt(11,anObject.materialRef.code);
      }
      else
        statement.setNull(11,java.sql.Types.INTEGER);
      if (anObject.departmentRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).exists(anObject.departmentRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENAutoTires.departmentRef.code%} = {%"+anObject.departmentRef.code+"%}");
        statement.setInt(12,anObject.departmentRef.code);
      }
      else
        statement.setNull(12,java.sql.Types.INTEGER);
      if (anObject.installStatusRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTiresInstallStatusDAOGen(connection,getUserProfile()).exists(anObject.installStatusRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENAutoTires.installStatusRef.code%} = {%"+anObject.installStatusRef.code+"%}");
        statement.setInt(13,anObject.installStatusRef.code);
      }
      else
        statement.setNull(13,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENAutoTiresDAOGen.add%}",e);
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

   public void save(ENAutoTires anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENAutoTires anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENAutoTires oldObject = new ENAutoTires();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENAutoTires.modify_time_Field + "," + ENAutoTires.domain_info_Field+" FROM  ENAUTOTIRES WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("TYPENAME") == 0)
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
          if(fieldNameStr.compareTo("SERIALNUMBER") == 0)
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
          if(fieldNameStr.compareTo("POTENCIAL") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DISTANCEALL") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("NOMINAL") == 0)
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
          if(fieldNameStr.compareTo("DEPARTMENTREF") == 0)
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
        "UPDATE ENAUTOTIRES SET  TYPENAME = ? , GARAGENUMBER = ? , SERIALNUMBER = ? , FACTORY = ? , POTENCIAL = ? , DISTANCEALL = ? , NOMINAL = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , MATERIALREFCODE = ? , DEPARTMENTREFCODE = ? , INSTALLSTATUSREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENAUTOTIRES SET ";
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
      statement.setString(1,anObject.typeName);
      statement.setString(2,anObject.garageNumber);
      statement.setString(3,anObject.serialNumber);
      statement.setString(4,anObject.factory);
      if (anObject.potencial != null)
        anObject.potencial = anObject.potencial.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.potencial);
      if (anObject.distanceAll != null)
        anObject.distanceAll = anObject.distanceAll.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.distanceAll);
      statement.setString(7,anObject.nominal);
      statement.setString(8,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(9,null);
      else
        statement.setBigDecimal(9,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.materialRef.code != Integer.MIN_VALUE)
        statement.setInt(10,anObject.materialRef.code);
      else
        statement.setNull(10,java.sql.Types.INTEGER);
      if (anObject.departmentRef.code != Integer.MIN_VALUE)
        statement.setInt(11,anObject.departmentRef.code);
      else
        statement.setNull(11,java.sql.Types.INTEGER);
      if (anObject.installStatusRef.code != Integer.MIN_VALUE)
        statement.setInt(12,anObject.installStatusRef.code);
      else
        statement.setNull(12,java.sql.Types.INTEGER);
          statement.setInt(13,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("TYPENAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.typeName);
                continue;
             }
            if("GARAGENUMBER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.garageNumber);
                continue;
             }
            if("SERIALNUMBER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.serialNumber);
                continue;
             }
            if("FACTORY".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.factory);
                continue;
             }
            if("POTENCIAL".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.potencial != null)
                    anObject.potencial = anObject.potencial.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.potencial);
                continue;
             }
            if("DISTANCEALL".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.distanceAll != null)
                    anObject.distanceAll = anObject.distanceAll.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.distanceAll);
                continue;
             }
            if("NOMINAL".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.nominal);
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
            if("DEPARTMENTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.departmentRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.departmentRef.code);
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

   } // end of save(ENAutoTires anObject,String[] anAttributes)


 public ENAutoTiresShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENAutoTires filterObject = new ENAutoTires();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENAutoTiresShort)list.get(0);
   return null;
  }

  public ENAutoTiresShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENAutoTiresShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENAutoTiresShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENAutoTiresShortList getFilteredList(ENAutoTires filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENAutoTiresShortList getScrollableFilteredList(ENAutoTires aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENAutoTiresShortList getScrollableFilteredList(ENAutoTires aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENAutoTiresShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENAutoTiresShortList getScrollableFilteredList(ENAutoTiresFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENAutoTiresShortList getScrollableFilteredList(ENAutoTiresFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENAutoTiresShortList getScrollableFilteredList(ENAutoTires aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENAutoTiresShortList getScrollableFilteredList(ENAutoTires aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENAutoTiresShortList result = new ENAutoTiresShortList();
    ENAutoTiresShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENAUTOTIRES.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENAUTOTIRES.CODE"+
     ",ENAUTOTIRES.TYPENAME"+
     ",ENAUTOTIRES.GARAGENUMBER"+
     ",ENAUTOTIRES.SERIALNUMBER"+
     ",ENAUTOTIRES.FACTORY"+
     ",ENAUTOTIRES.POTENCIAL"+
     ",ENAUTOTIRES.DISTANCEALL"+
     ",ENAUTOTIRES.NOMINAL"+

      ", TKMATERIALS.CODE " +
      ", TKMATERIALS.NAME " +
      ", TKMATERIALS.COST " +
      ", TKMATERIALS.DELIVERYDATE " +
      ", TKMATERIALS.NUMKATALOG " +
      ", TKMATERIALS.IDENTID " +
      ", ENDEPARTMENT.CODE " +
      ", ENDEPARTMENT.SHORTNAME " +
      ", ENDEPARTMENT.DATESTART " +
      ", ENDEPARTMENT.DATEFINAL " +
      ", ENDEPARTMENT.RENCODE " +
      ", ENDEPARTMENT.SHPZBALANS " +
      ", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
      ", ENDEPARTMENT.KAU_1884 " +
      ", ENDEPARTMENT.NAME_1884 " +
      ", ENTIRESINSTALLSTATUS.CODE " +
      ", ENTIRESINSTALLSTATUS.NAME " +
     " FROM ENAUTOTIRES " +
     ", TKMATERIALS " +
     ", ENDEPARTMENT " +
     ", ENTIRESINSTALLSTATUS " +
     //" WHERE "
    "";
     whereStr = " TKMATERIALS.CODE = ENAUTOTIRES.MATERIALREFCODE" ; //+
      whereStr = whereStr +" AND ENDEPARTMENT.CODE = ENAUTOTIRES.DEPARTMENTREFCODE" ; //+
      whereStr = whereStr +" AND ENTIRESINSTALLSTATUS.CODE = ENAUTOTIRES.INSTALLSTATUSREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENAUTOTIRES.CODE IN ( SELECT ENAUTOTIRES.CODE FROM ENAUTOTIRES ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRES.CODE = ?";
        }
         if (aFilterObject.typeName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.typeName.indexOf('*',0) < 0 && aFilterObject.typeName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENAUTOTIRES.TYPENAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENAUTOTIRES.TYPENAME) LIKE UPPER(?)";
         }
         if (aFilterObject.garageNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.garageNumber.indexOf('*',0) < 0 && aFilterObject.garageNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENAUTOTIRES.GARAGENUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENAUTOTIRES.GARAGENUMBER) LIKE UPPER(?)";
         }
         if (aFilterObject.serialNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.serialNumber.indexOf('*',0) < 0 && aFilterObject.serialNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENAUTOTIRES.SERIALNUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENAUTOTIRES.SERIALNUMBER) LIKE UPPER(?)";
         }
         if (aFilterObject.factory != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.factory.indexOf('*',0) < 0 && aFilterObject.factory.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENAUTOTIRES.FACTORY) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENAUTOTIRES.FACTORY) LIKE UPPER(?)";
         }
        if(aFilterObject.potencial != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRES.POTENCIAL = ?";
        }
        if(aFilterObject.distanceAll != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRES.DISTANCEALL = ?";
        }
         if (aFilterObject.nominal != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.nominal.indexOf('*',0) < 0 && aFilterObject.nominal.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENAUTOTIRES.NOMINAL) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENAUTOTIRES.NOMINAL) LIKE UPPER(?)";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENAUTOTIRES.DOMAIN_INFO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENAUTOTIRES.DOMAIN_INFO) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRES.MODIFY_TIME = ?";
        }
        if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENAUTOTIRES.MATERIALREFCODE = ? ";
        }
        if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENAUTOTIRES.DEPARTMENTREFCODE = ? ";
        }
        if(aFilterObject.installStatusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENAUTOTIRES.INSTALLSTATUSREFCODE = ? ";
        }

      }


    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAutoTires.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENAutoTires.getList%} access denied");

    String domainWhereStr = SegregationQueryBuilder.addWhere("ENAUTOTIRES",segregationInfo,getUserProfile().getDomainInfo());

    if (domainWhereStr.length() != 0){
    // domainWhereStr = "  AND ENAUTOTIRES.DOMAIN_INFO IS NOT NULL";
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
        if(aFilterObject.potencial != null){
            number++;
            aFilterObject.potencial = aFilterObject.potencial.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.potencial);
        }
        if(aFilterObject.distanceAll != null){
            number++;
            aFilterObject.distanceAll = aFilterObject.distanceAll.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distanceAll);
        }

           if(aFilterObject.nominal != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.nominal);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
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
       if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.departmentRef.code);
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

        anObject = new ENAutoTiresShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.typeName = set.getString(2);
        anObject.garageNumber = set.getString(3);
        anObject.serialNumber = set.getString(4);
        anObject.factory = set.getString(5);
        anObject.potencial = set.getBigDecimal(6);
        if(anObject.potencial != null)
            anObject.potencial = anObject.potencial.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.distanceAll = set.getBigDecimal(7);
        if(anObject.distanceAll != null)
            anObject.distanceAll = anObject.distanceAll.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.nominal = set.getString(8);

        anObject.materialRefCode = set.getInt(9);
        if(set.wasNull())
        anObject.materialRefCode = Integer.MIN_VALUE;

        anObject.departmentRefCode = set.getInt(15);
        if(set.wasNull())
        anObject.departmentRefCode = Integer.MIN_VALUE;

        anObject.installStatusRefCode = set.getInt(24);
        if(set.wasNull())
        anObject.installStatusRefCode = Integer.MIN_VALUE;
        anObject.installStatusRefName = set.getString(25);

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

  public int[] getFilteredCodeArrayOLD(ENAutoTires aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENAUTOTIRES.CODE FROM ENAUTOTIRES";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENAUTOTIRES.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAutoTires.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENAutoTires.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("ENAUTOTIRES",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (ENAUTOTIRES.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRES.CODE = ?";
        }
         if (aFilterObject.typeName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.typeName.indexOf('*',0) < 0 && aFilterObject.typeName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENAUTOTIRES.TYPENAME = ?";
             else
                 whereStr = whereStr + "  ENAUTOTIRES.TYPENAME LIKE ?";
         }
         if (aFilterObject.garageNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.garageNumber.indexOf('*',0) < 0 && aFilterObject.garageNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENAUTOTIRES.GARAGENUMBER = ?";
             else
                 whereStr = whereStr + "  ENAUTOTIRES.GARAGENUMBER LIKE ?";
         }
         if (aFilterObject.serialNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.serialNumber.indexOf('*',0) < 0 && aFilterObject.serialNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENAUTOTIRES.SERIALNUMBER = ?";
             else
                 whereStr = whereStr + "  ENAUTOTIRES.SERIALNUMBER LIKE ?";
         }
         if (aFilterObject.factory != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.factory.indexOf('*',0) < 0 && aFilterObject.factory.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENAUTOTIRES.FACTORY = ?";
             else
                 whereStr = whereStr + "  ENAUTOTIRES.FACTORY LIKE ?";
         }
        if(aFilterObject.potencial != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRES.POTENCIAL = ?";
        }
        if(aFilterObject.distanceAll != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRES.DISTANCEALL = ?";
        }
         if (aFilterObject.nominal != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.nominal.indexOf('*',0) < 0 && aFilterObject.nominal.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENAUTOTIRES.NOMINAL = ?";
             else
                 whereStr = whereStr + "  ENAUTOTIRES.NOMINAL LIKE ?";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENAUTOTIRES.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENAUTOTIRES.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRES.MODIFY_TIME = ?";
        }
        if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENAUTOTIRES.MATERIALREFCODE = ? ";
        }
        if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENAUTOTIRES.DEPARTMENTREFCODE = ? ";
        }
        if(aFilterObject.installStatusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENAUTOTIRES.INSTALLSTATUSREFCODE = ? ";
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
         if (aFilterObject.typeName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.typeName.indexOf('*',0) < 0 && aFilterObject.typeName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENAUTOTIRES.TYPENAME = ?";
             else
                 whereStr = whereStr + " ENAUTOTIRES.TYPENAME LIKE ?";

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
         if (aFilterObject.garageNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.garageNumber.indexOf('*',0) < 0 && aFilterObject.garageNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENAUTOTIRES.GARAGENUMBER = ?";
             else
                 whereStr = whereStr + " ENAUTOTIRES.GARAGENUMBER LIKE ?";

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
         if (aFilterObject.serialNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.serialNumber.indexOf('*',0) < 0 && aFilterObject.serialNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENAUTOTIRES.SERIALNUMBER = ?";
             else
                 whereStr = whereStr + " ENAUTOTIRES.SERIALNUMBER LIKE ?";

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
         if (aFilterObject.factory != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.factory.indexOf('*',0) < 0 && aFilterObject.factory.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENAUTOTIRES.FACTORY = ?";
             else
                 whereStr = whereStr + " ENAUTOTIRES.FACTORY LIKE ?";

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
        if(aFilterObject.potencial != null){
            number++;
            aFilterObject.potencial = aFilterObject.potencial.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.potencial);
        }
        if(aFilterObject.distanceAll != null){
            number++;
            aFilterObject.distanceAll = aFilterObject.distanceAll.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distanceAll);
        }
         if (aFilterObject.nominal != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.nominal.indexOf('*',0) < 0 && aFilterObject.nominal.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENAUTOTIRES.NOMINAL = ?";
             else
                 whereStr = whereStr + " ENAUTOTIRES.NOMINAL LIKE ?";

           if(aFilterObject.nominal != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.nominal);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENAUTOTIRES.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENAUTOTIRES.DOMAIN_INFO LIKE ?";

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
       if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.departmentRef.code);
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

  public int[] getFilteredCodeArray(ENAutoTiresFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENAutoTires aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENAUTOTIRES.CODE FROM ENAUTOTIRES";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENAUTOTIRES.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAutoTires.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENAutoTires.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("ENAUTOTIRES",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (ENAUTOTIRES.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRES.CODE = ?";
        }
         if (aFilterObject.typeName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.typeName.indexOf('*',0) < 0 && aFilterObject.typeName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENAUTOTIRES.TYPENAME = ?";
             else
                 whereStr = whereStr + "  ENAUTOTIRES.TYPENAME LIKE ?";
         }
         if (aFilterObject.garageNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.garageNumber.indexOf('*',0) < 0 && aFilterObject.garageNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENAUTOTIRES.GARAGENUMBER = ?";
             else
                 whereStr = whereStr + "  ENAUTOTIRES.GARAGENUMBER LIKE ?";
         }
         if (aFilterObject.serialNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.serialNumber.indexOf('*',0) < 0 && aFilterObject.serialNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENAUTOTIRES.SERIALNUMBER = ?";
             else
                 whereStr = whereStr + "  ENAUTOTIRES.SERIALNUMBER LIKE ?";
         }
         if (aFilterObject.factory != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.factory.indexOf('*',0) < 0 && aFilterObject.factory.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENAUTOTIRES.FACTORY = ?";
             else
                 whereStr = whereStr + "  ENAUTOTIRES.FACTORY LIKE ?";
         }
        if(aFilterObject.potencial != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRES.POTENCIAL = ?";
        }
        if(aFilterObject.distanceAll != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRES.DISTANCEALL = ?";
        }
         if (aFilterObject.nominal != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.nominal.indexOf('*',0) < 0 && aFilterObject.nominal.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENAUTOTIRES.NOMINAL = ?";
             else
                 whereStr = whereStr + "  ENAUTOTIRES.NOMINAL LIKE ?";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENAUTOTIRES.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENAUTOTIRES.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENAUTOTIRES.MODIFY_TIME = ?";
        }
        if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENAUTOTIRES.MATERIALREFCODE = ? ";
        }
        if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENAUTOTIRES.DEPARTMENTREFCODE = ? ";
        }
        if(aFilterObject.installStatusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENAUTOTIRES.INSTALLSTATUSREFCODE = ? ";
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
         if (aFilterObject.typeName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.typeName.indexOf('*',0) < 0 && aFilterObject.typeName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENAUTOTIRES.TYPENAME = ?";
             else
                 whereStr = whereStr + " ENAUTOTIRES.TYPENAME LIKE ?";

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
         if (aFilterObject.garageNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.garageNumber.indexOf('*',0) < 0 && aFilterObject.garageNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENAUTOTIRES.GARAGENUMBER = ?";
             else
                 whereStr = whereStr + " ENAUTOTIRES.GARAGENUMBER LIKE ?";

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
         if (aFilterObject.serialNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.serialNumber.indexOf('*',0) < 0 && aFilterObject.serialNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENAUTOTIRES.SERIALNUMBER = ?";
             else
                 whereStr = whereStr + " ENAUTOTIRES.SERIALNUMBER LIKE ?";

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
         if (aFilterObject.factory != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.factory.indexOf('*',0) < 0 && aFilterObject.factory.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENAUTOTIRES.FACTORY = ?";
             else
                 whereStr = whereStr + " ENAUTOTIRES.FACTORY LIKE ?";

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
        if(aFilterObject.potencial != null){
            number++;
            aFilterObject.potencial = aFilterObject.potencial.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.potencial);
        }
        if(aFilterObject.distanceAll != null){
            number++;
            aFilterObject.distanceAll = aFilterObject.distanceAll.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distanceAll);
        }
         if (aFilterObject.nominal != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.nominal.indexOf('*',0) < 0 && aFilterObject.nominal.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENAUTOTIRES.NOMINAL = ?";
             else
                 whereStr = whereStr + " ENAUTOTIRES.NOMINAL LIKE ?";

           if(aFilterObject.nominal != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.nominal);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENAUTOTIRES.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENAUTOTIRES.DOMAIN_INFO LIKE ?";

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
       if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.departmentRef.code);
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


   public ENAutoTires getObject(int uid) throws PersistenceException
   {
    ENAutoTires result = new ENAutoTires();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENAutoTires anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAutoTires.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENAutoTires.getObject%} access denied");



    selectStr =
    "SELECT  ENAUTOTIRES.CODE, ENAUTOTIRES.TYPENAME, ENAUTOTIRES.GARAGENUMBER, ENAUTOTIRES.SERIALNUMBER, ENAUTOTIRES.FACTORY, ENAUTOTIRES.POTENCIAL, ENAUTOTIRES.DISTANCEALL, ENAUTOTIRES.NOMINAL, ENAUTOTIRES.DOMAIN_INFO, ENAUTOTIRES.MODIFY_TIME, ENAUTOTIRES.MATERIALREFCODE, ENAUTOTIRES.DEPARTMENTREFCODE, ENAUTOTIRES.INSTALLSTATUSREFCODE "
    +" FROM ENAUTOTIRES WHERE ENAUTOTIRES.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("ENAUTOTIRES",segregationInfo,getUserProfile().getDomainInfo());
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
        anObject.typeName = set.getString(2);
        anObject.garageNumber = set.getString(3);
        anObject.serialNumber = set.getString(4);
        anObject.factory = set.getString(5);
        anObject.potencial = set.getBigDecimal(6);
        if(anObject.potencial != null)
            anObject.potencial = anObject.potencial.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.distanceAll = set.getBigDecimal(7);
        if(anObject.distanceAll != null)
            anObject.distanceAll = anObject.distanceAll.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.nominal = set.getString(8);
        anObject.domain_info = set.getString(9);
        anObject.modify_time = set.getLong(10);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.materialRef.code = set.getInt(11);
        if ( set.wasNull() )
            anObject.materialRef.code = Integer.MIN_VALUE;
        anObject.departmentRef.code = set.getInt(12);
        if ( set.wasNull() )
            anObject.departmentRef.code = Integer.MIN_VALUE;
        anObject.installStatusRef.code = set.getInt(13);
        if ( set.wasNull() )
            anObject.installStatusRef.code = Integer.MIN_VALUE;
        if(anObject.materialRef.code != Integer.MIN_VALUE)
        {
           anObject.setMaterialRef(
        new com.ksoe.techcard.dataminer.generated.TKMaterialsDAOGen(connection,getUserProfile()).getRef(anObject.materialRef.code));
    }
        if(anObject.departmentRef.code != Integer.MIN_VALUE)
        {
           anObject.setDepartmentRef(
        new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getRef(anObject.departmentRef.code));
    }
        if(anObject.installStatusRef.code != Integer.MIN_VALUE)
        {
           anObject.setInstallStatusRef(
        new com.ksoe.energynet.dataminer.generated.ENTiresInstallStatusDAOGen(connection,getUserProfile()).getRef(anObject.installStatusRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENAutoTiresRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENAutoTiresRef ref = new com.ksoe.energynet.valueobject.references.ENAutoTiresRef();
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

    selectStr = "DELETE FROM  ENAUTOTIRES WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENAutoTires object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENAutoTires.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENAutoTires.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENAutoTires.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAutoTires.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENAutoTires.getObject%} access denied");

    selectStr =

    "SELECT  ENAUTOTIRES.CODE FROM  ENAUTOTIRES WHERE  ENAUTOTIRES.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("ENAUTOTIRES",segregationInfo,getUserProfile().getDomainInfo());
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
    _checkConditionToken(condition,"code","ENAUTOTIRES.CODE");
    _checkConditionToken(condition,"typename","ENAUTOTIRES.TYPENAME");
    _checkConditionToken(condition,"garagenumber","ENAUTOTIRES.GARAGENUMBER");
    _checkConditionToken(condition,"serialnumber","ENAUTOTIRES.SERIALNUMBER");
    _checkConditionToken(condition,"factory","ENAUTOTIRES.FACTORY");
    _checkConditionToken(condition,"potencial","ENAUTOTIRES.POTENCIAL");
    _checkConditionToken(condition,"distanceall","ENAUTOTIRES.DISTANCEALL");
    _checkConditionToken(condition,"nominal","ENAUTOTIRES.NOMINAL");
    _checkConditionToken(condition,"domain_info","ENAUTOTIRES.DOMAIN_INFO");
    _checkConditionToken(condition,"modify_time","ENAUTOTIRES.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"materialref","MATERIALREFCODE");
    _checkConditionToken(condition,"materialref.code","MATERIALREFCODE");
    _checkConditionToken(condition,"departmentref","DEPARTMENTREFCODE");
    _checkConditionToken(condition,"departmentref.code","DEPARTMENTREFCODE");
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

    private void _collectAutoIncrementFields(ENAutoTires anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENAUTOTIRES", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENAUTOTIRES", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENAUTOTIRES", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENAUTOTIRES");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENAutoTiresDAO
