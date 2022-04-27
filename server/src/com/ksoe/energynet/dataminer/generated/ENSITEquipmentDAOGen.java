
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
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
import com.ksoe.energynet.valueobject.ENSITEquipment;
import com.ksoe.energynet.valueobject.brief.ENSITEquipmentShort;
import com.ksoe.energynet.valueobject.filter.ENSITEquipmentFilter;
import com.ksoe.energynet.valueobject.lists.ENSITEquipmentShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


  /**
  *  DAO Generated for ENSITEquipment;
  *
  */

public class ENSITEquipmentDAOGen extends GenericDataMiner {

  public ENSITEquipmentDAOGen() {super();}
  public ENSITEquipmentDAOGen(Connection aConnection) {super(aConnection);}
  public ENSITEquipmentDAOGen(UserProfile anUserProfile) {super(anUserProfile);}
  public ENSITEquipmentDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENSITEquipmentDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENSITEquipment inObject) throws PersistenceException
   {
      ENSITEquipment obj = new ENSITEquipment();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.name != obj.name){
       return false;
     }

     if (inObject.serialnumber != obj.serialnumber){
       return false;
     }

     if (inObject.suppliername != obj.suppliername){
       return false;
     }

     if (inObject.isserver != obj.isserver){
       return false;
     }

     if (inObject.num != obj.num){
       return false;
     }

     if ( ! inObject.supplierdate.equals(obj.supplierdate)){
       return false;
     }

     if (inObject.warranty != obj.warranty){
       return false;
     }

     if (inObject.isliquidation != obj.isliquidation){
       return false;
     }

     if (inObject.technum1 != obj.technum1){
       return false;
     }

     if (inObject.lisencepack != obj.lisencepack){
       return false;
     }

     if (inObject.technum2 != obj.technum2){
       return false;
     }

     if (inObject.batch != obj.batch){
       return false;
     }

     if (inObject.descr != obj.descr){
       return false;
     }

     if (inObject.location != obj.location){
       return false;
     }

     if ( ! inObject.installdate.equals(obj.installdate)){
       return false;
     }

     if ( ! inObject.inputdate.equals(obj.inputdate)){
       return false;
     }

     if (inObject.commentGen != obj.commentGen){
       return false;
     }
     if (inObject.objectType.code != obj.objectType.code){
        return false;
     }
     if (inObject.element.code != obj.element.code){
        return false;
     }
     if (inObject.finworker.code != obj.finworker.code){
        return false;
     }
      return true;
   }

   public int add(ENSITEquipment anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENSITEquipment anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();
    if(anObject.getDomain_info() == null)
        anObject.setDomain_info(getUserProfile().getDomainInfo().getDomain());

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENSITEQUIPMENT (CODE,NAME,SERIALNUMBER,SUPPLIERNAME,ISSERVER,NUM,SUPPLIERDATE,WARRANTY,ISLIQUIDATION,TECHNUM1,LISENCEPACK,TECHNUM2,BATCH,DESCR,LOCATION,INSTALLDATE,INPUTDATE,COMMENTGEN,DOMAIN_INFO,MODIFY_TIME,OBJECTTYPECODE,ELEMENTCODE,FINWORKERCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.name);
      statement.setString(3,anObject.serialnumber);
      statement.setString(4,anObject.suppliername);
      if (anObject.isserver != Integer.MIN_VALUE )
         statement.setInt(5,anObject.isserver);
      else
         statement.setNull(5,java.sql.Types.INTEGER);
      statement.setString(6,anObject.num);
      if (anObject.supplierdate == null)
        statement.setDate(7,null);
      else
        statement.setDate(7,new java.sql.Date(anObject.supplierdate.getTime()));
      if (anObject.warranty != Integer.MIN_VALUE )
         statement.setInt(8,anObject.warranty);
      else
         statement.setNull(8,java.sql.Types.INTEGER);
      if (anObject.isliquidation != Integer.MIN_VALUE )
         statement.setInt(9,anObject.isliquidation);
      else
         statement.setNull(9,java.sql.Types.INTEGER);
      if (anObject.technum1 != Integer.MIN_VALUE )
         statement.setInt(10,anObject.technum1);
      else
         statement.setNull(10,java.sql.Types.INTEGER);
      statement.setString(11,anObject.lisencepack);
      if (anObject.technum2 != Integer.MIN_VALUE )
         statement.setInt(12,anObject.technum2);
      else
         statement.setNull(12,java.sql.Types.INTEGER);
      if (anObject.batch != Integer.MIN_VALUE )
         statement.setInt(13,anObject.batch);
      else
         statement.setNull(13,java.sql.Types.INTEGER);
      statement.setString(14,anObject.descr);
      statement.setString(15,anObject.location);
      if (anObject.installdate == null)
        statement.setDate(16,null);
      else
        statement.setDate(16,new java.sql.Date(anObject.installdate.getTime()));
      if (anObject.inputdate == null)
        statement.setDate(17,null);
      else
        statement.setDate(17,new java.sql.Date(anObject.inputdate.getTime()));
      statement.setString(18,anObject.commentGen);
      statement.setString(19,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(20,null);
      else
        statement.setBigDecimal(20,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.objectType.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENSITEquipTypeDAOGen(connection,getUserProfile()).exists(anObject.objectType.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENSITEquipment.objectType.code%} = {%"+anObject.objectType.code+"%}");
        statement.setInt(21,anObject.objectType.code);
      }
      else
        statement.setNull(21,java.sql.Types.INTEGER);
      if (anObject.element.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).exists(anObject.element.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENSITEquipment.element.code%} = {%"+anObject.element.code+"%}");
        statement.setInt(22,anObject.element.code);
      }
      else
        statement.setNull(22,java.sql.Types.INTEGER);
      if (anObject.finworker.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.FINWorkerDAOGen(connection,getUserProfile()).exists(anObject.finworker.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENSITEquipment.finworker.code%} = {%"+anObject.finworker.code+"%}");
        statement.setInt(23,anObject.finworker.code);
      }
      else
        statement.setNull(23,java.sql.Types.INTEGER);

      statement.execute();
      return anObject.code;
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
      throw new PersistenceException("Error in method {%ENSITEquipmentDAOGen.add%}",e);
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

   public void save(ENSITEquipment anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENSITEquipment anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENSITEquipment oldObject = new ENSITEquipment();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENSITEquipment.modify_time_Field + "," + ENSITEquipment.domain_info_Field+" FROM  ENSITEQUIPMENT WHERE CODE = ?";

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
        EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
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
          if(fieldNameStr.compareTo("SERIALNUMBER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUPPLIERNAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ISSERVER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("NUM") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUPPLIERDATE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("WARRANTY") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ISLIQUIDATION") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TECHNUM1") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("LISENCEPACK") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TECHNUM2") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("BATCH") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DESCR") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("LOCATION") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("INSTALLDATE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("INPUTDATE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COMMENTGEN") == 0)
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
          if(fieldNameStr.compareTo("OBJECTTYPE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ELEMENT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FINWORKER") == 0)
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
        "UPDATE ENSITEQUIPMENT SET  NAME = ? , SERIALNUMBER = ? , SUPPLIERNAME = ? , ISSERVER = ? , NUM = ? , SUPPLIERDATE = ? , WARRANTY = ? , ISLIQUIDATION = ? , TECHNUM1 = ? , LISENCEPACK = ? , TECHNUM2 = ? , BATCH = ? , DESCR = ? , LOCATION = ? , INSTALLDATE = ? , INPUTDATE = ? , COMMENTGEN = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , OBJECTTYPECODE = ? , ELEMENTCODE = ? , FINWORKERCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENSITEQUIPMENT SET ";
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
      statement.setString(2,anObject.serialnumber);
      statement.setString(3,anObject.suppliername);
      if (anObject.isserver != Integer.MIN_VALUE )
         statement.setInt(4,anObject.isserver);
      else
         statement.setNull(4,java.sql.Types.INTEGER);
      statement.setString(5,anObject.num);
      if (anObject.supplierdate == null)
        statement.setDate(6,null);
      else
        statement.setDate(6,new java.sql.Date(anObject.supplierdate.getTime()));
      if (anObject.warranty != Integer.MIN_VALUE )
         statement.setInt(7,anObject.warranty);
      else
         statement.setNull(7,java.sql.Types.INTEGER);
      if (anObject.isliquidation != Integer.MIN_VALUE )
         statement.setInt(8,anObject.isliquidation);
      else
         statement.setNull(8,java.sql.Types.INTEGER);
      if (anObject.technum1 != Integer.MIN_VALUE )
         statement.setInt(9,anObject.technum1);
      else
         statement.setNull(9,java.sql.Types.INTEGER);
      statement.setString(10,anObject.lisencepack);
      if (anObject.technum2 != Integer.MIN_VALUE )
         statement.setInt(11,anObject.technum2);
      else
         statement.setNull(11,java.sql.Types.INTEGER);
      if (anObject.batch != Integer.MIN_VALUE )
         statement.setInt(12,anObject.batch);
      else
         statement.setNull(12,java.sql.Types.INTEGER);
      statement.setString(13,anObject.descr);
      statement.setString(14,anObject.location);
      if (anObject.installdate == null)
        statement.setDate(15,null);
      else
        statement.setDate(15,new java.sql.Date(anObject.installdate.getTime()));
      if (anObject.inputdate == null)
        statement.setDate(16,null);
      else
        statement.setDate(16,new java.sql.Date(anObject.inputdate.getTime()));
      statement.setString(17,anObject.commentGen);
      statement.setString(18,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(19,null);
      else
        statement.setBigDecimal(19,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.objectType.code != Integer.MIN_VALUE)
        statement.setInt(20,anObject.objectType.code);
      else
        statement.setNull(20,java.sql.Types.INTEGER);
      if (anObject.element.code != Integer.MIN_VALUE)
        statement.setInt(21,anObject.element.code);
      else
        statement.setNull(21,java.sql.Types.INTEGER);
      if (anObject.finworker.code != Integer.MIN_VALUE)
        statement.setInt(22,anObject.finworker.code);
      else
        statement.setNull(22,java.sql.Types.INTEGER);
          statement.setInt(23,anObject.code);
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
            if("SERIALNUMBER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.serialnumber);
                continue;
             }
            if("SUPPLIERNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.suppliername);
                continue;
             }
            if("ISSERVER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.isserver);
                continue;
             }
            if("NUM".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.num);
                continue;
             }
            if("SUPPLIERDATE".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.supplierdate == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.supplierdate.getTime()));
                continue;
             }
            if("WARRANTY".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.warranty);
                continue;
             }
            if("ISLIQUIDATION".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.isliquidation);
                continue;
             }
            if("TECHNUM1".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.technum1);
                continue;
             }
            if("LISENCEPACK".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.lisencepack);
                continue;
             }
            if("TECHNUM2".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.technum2);
                continue;
             }
            if("BATCH".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.batch);
                continue;
             }
            if("DESCR".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.descr);
                continue;
             }
            if("LOCATION".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.location);
                continue;
             }
            if("INSTALLDATE".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.installdate == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.installdate.getTime()));
                continue;
             }
            if("INPUTDATE".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.inputdate == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.inputdate.getTime()));
                continue;
             }
            if("COMMENTGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.commentGen);
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
            if("OBJECTTYPE".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.objectType.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.objectType.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("ELEMENT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.element.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.element.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("FINWORKER".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.finworker.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.finworker.code);
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

   } // end of save(ENSITEquipment anObject,String[] anAttributes)


 public ENSITEquipmentShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENSITEquipment filterObject = new ENSITEquipment();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENSITEquipmentShort)list.get(0);
   return null;
  }

  public ENSITEquipmentShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENSITEquipmentShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENSITEquipmentShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENSITEquipmentShortList getFilteredList(ENSITEquipment filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENSITEquipmentShortList getScrollableFilteredList(ENSITEquipment aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENSITEquipmentShortList getScrollableFilteredList(ENSITEquipment aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENSITEquipmentShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENSITEquipmentShortList getScrollableFilteredList(ENSITEquipmentFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENSITEquipmentShortList getScrollableFilteredList(ENSITEquipmentFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENSITEquipmentShortList getScrollableFilteredList(ENSITEquipment aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENSITEquipmentShortList getScrollableFilteredList(ENSITEquipment aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENSITEquipmentShortList result = new ENSITEquipmentShortList();
    ENSITEquipmentShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENSITEQUIPMENT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENSITEQUIPMENT.CODE"+
     ",ENSITEQUIPMENT.NAME"+
     ",ENSITEQUIPMENT.SERIALNUMBER"+
     ",ENSITEQUIPMENT.SUPPLIERNAME"+
     ",ENSITEQUIPMENT.NUM"+
     ",ENSITEQUIPMENT.SUPPLIERDATE"+
     ",ENSITEQUIPMENT.LISENCEPACK"+
     ",ENSITEQUIPMENT.DESCR"+
     ",ENSITEQUIPMENT.LOCATION"+
     ",ENSITEQUIPMENT.INSTALLDATE"+
     ",ENSITEQUIPMENT.INPUTDATE"+

      ", ENSITEQUIPTYPE.CODE " +
      ", ENSITEQUIPTYPE.NAME " +
      ", ENSITEQUIPTYPE.DESCRIPTION " +
     ", ENSITEQUIPMENT.ELEMENTCODE" +
     ", ENSITEQUIPMENT.FINWORKERCODE" +
     ", EPREN.NAME" +
     " FROM ENSITEQUIPMENT " +
     ", ENSITEQUIPTYPE " +
     ", ENELEMENT " +
     ", EPREN " +
     //" WHERE "
    "";
     whereStr = " ENSITEQUIPTYPE.CODE = ENSITEQUIPMENT.OBJECTTYPECODE" ; //+
     whereStr += " AND ENELEMENT.CODE = ENSITEQUIPMENT.ELEMENTCODE" ; //+
     whereStr += " AND EPREN.CODE = ENELEMENT.RENREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENSITEQUIPMENT.CODE IN ( SELECT ENSITEQUIPMENT.CODE FROM ENSITEQUIPMENT ";

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSITEQUIPMENT.NAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSITEQUIPMENT.NAME) LIKE UPPER(?)";
         }
         if (aFilterObject.serialnumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.serialnumber.indexOf('*',0) < 0 && aFilterObject.serialnumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSITEQUIPMENT.SERIALNUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSITEQUIPMENT.SERIALNUMBER) LIKE UPPER(?)";
         }
         if (aFilterObject.suppliername != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.suppliername.indexOf('*',0) < 0 && aFilterObject.suppliername.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSITEQUIPMENT.SUPPLIERNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSITEQUIPMENT.SUPPLIERNAME) LIKE UPPER(?)";
         }
        if(aFilterObject.isserver != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.ISSERVER = ?";
        }
         if (aFilterObject.num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.num.indexOf('*',0) < 0 && aFilterObject.num.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSITEQUIPMENT.NUM) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSITEQUIPMENT.NUM) LIKE UPPER(?)";
         }
        if(aFilterObject.supplierdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.SUPPLIERDATE = ?";
        }
        if(aFilterObject.warranty != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.WARRANTY = ?";
        }
        if(aFilterObject.isliquidation != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.ISLIQUIDATION = ?";
        }
        if(aFilterObject.technum1 != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.TECHNUM1 = ?";
        }
         if (aFilterObject.lisencepack != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.lisencepack.indexOf('*',0) < 0 && aFilterObject.lisencepack.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSITEQUIPMENT.LISENCEPACK) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSITEQUIPMENT.LISENCEPACK) LIKE UPPER(?)";
         }
        if(aFilterObject.technum2 != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.TECHNUM2 = ?";
        }
        if(aFilterObject.batch != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.BATCH = ?";
        }
         if (aFilterObject.descr != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.descr.indexOf('*',0) < 0 && aFilterObject.descr.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSITEQUIPMENT.DESCR) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSITEQUIPMENT.DESCR) LIKE UPPER(?)";
         }
         if (aFilterObject.location != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.location.indexOf('*',0) < 0 && aFilterObject.location.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSITEQUIPMENT.LOCATION) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSITEQUIPMENT.LOCATION) LIKE UPPER(?)";
         }
        if(aFilterObject.installdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.INSTALLDATE = ?";
        }
        if(aFilterObject.inputdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.INPUTDATE = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSITEQUIPMENT.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSITEQUIPMENT.COMMENTGEN) LIKE UPPER(?)";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSITEQUIPMENT.DOMAIN_INFO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSITEQUIPMENT.DOMAIN_INFO) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.MODIFY_TIME = ?";
        }
        if(aFilterObject.objectType.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENSITEQUIPMENT.OBJECTTYPECODE = ? ";
        }
        if(aFilterObject.element.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENSITEQUIPMENT.ELEMENTCODE = ? ";
        }
        if(aFilterObject.finworker.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENSITEQUIPMENT.FINWORKERCODE = ? ";
        }
        if(aFilterObject.element.renRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENELEMENT.RENREFCODE = ? ";
        }

      }


    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENSITEquipment.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENSITEquipment.getList%} access denied");

    String domainWhereStr = SegregationQueryBuilder.addWhere("ENSITEQUIPMENT",segregationInfo,getUserProfile().getDomainInfo());

    if (domainWhereStr.length() != 0){
    // domainWhereStr = "  AND ENSITEQUIPMENT.DOMAIN_INFO IS NOT NULL";
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
         selectStr = selectStr + " WHERE" + whereStr;

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

           if(aFilterObject.serialnumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.serialnumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.suppliername != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.suppliername);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.isserver != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isserver);
         }

           if(aFilterObject.num != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.num);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.supplierdate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.supplierdate.getTime()));
        }
         if(aFilterObject.warranty != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.warranty);
         }
         if(aFilterObject.isliquidation != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isliquidation);
         }
         if(aFilterObject.technum1 != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.technum1);
         }

           if(aFilterObject.lisencepack != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.lisencepack);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.technum2 != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.technum2);
         }
         if(aFilterObject.batch != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.batch);
         }

           if(aFilterObject.descr != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.descr);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.location != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.location);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.installdate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.installdate.getTime()));
        }
        if(aFilterObject.inputdate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.inputdate.getTime()));
        }

           if(aFilterObject.commentGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.commentGen);
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
       if(aFilterObject.objectType.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.objectType.code);
       }
       if(aFilterObject.element.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.element.code);
       }
       if(aFilterObject.finworker.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finworker.code);
       }
       if(aFilterObject.element.renRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.element.renRef.code);
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

        anObject = new ENSITEquipmentShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.name = set.getString(2);
        anObject.serialnumber = set.getString(3);
        anObject.suppliername = set.getString(4);
        anObject.num = set.getString(5);
        anObject.supplierdate = set.getDate(6);
        anObject.lisencepack = set.getString(7);
        anObject.descr = set.getString(8);
        anObject.location = set.getString(9);
        anObject.installdate = set.getDate(10);
        anObject.inputdate = set.getDate(11);


        anObject.objectTypeCode = set.getInt(12);

        anObject.objectTypeName = set.getString(13);

        anObject.objectTypeDescription = set.getString(14);
        anObject.elementCode = set.getInt(15);
        anObject.finworkerCode = set.getInt(16);
        anObject.ren = set.getString(17);

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

  public int[] getFilteredCodeArrayOLD(ENSITEquipment aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENSITEQUIPMENT.CODE FROM ENSITEQUIPMENT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENSITEQUIPMENT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENSITEquipment.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENSITEquipment.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("ENSITEQUIPMENT",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (ENSITEQUIPMENT.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSITEQUIPMENT.NAME = ?";
             else
                 whereStr = whereStr + "  ENSITEQUIPMENT.NAME LIKE ?";
         }
         if (aFilterObject.serialnumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.serialnumber.indexOf('*',0) < 0 && aFilterObject.serialnumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSITEQUIPMENT.SERIALNUMBER = ?";
             else
                 whereStr = whereStr + "  ENSITEQUIPMENT.SERIALNUMBER LIKE ?";
         }
         if (aFilterObject.suppliername != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.suppliername.indexOf('*',0) < 0 && aFilterObject.suppliername.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSITEQUIPMENT.SUPPLIERNAME = ?";
             else
                 whereStr = whereStr + "  ENSITEQUIPMENT.SUPPLIERNAME LIKE ?";
         }
        if(aFilterObject.isserver != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.ISSERVER = ?";
        }
         if (aFilterObject.num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.num.indexOf('*',0) < 0 && aFilterObject.num.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSITEQUIPMENT.NUM = ?";
             else
                 whereStr = whereStr + "  ENSITEQUIPMENT.NUM LIKE ?";
         }
        if(aFilterObject.supplierdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.SUPPLIERDATE = ?";
        }
        if(aFilterObject.warranty != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.WARRANTY = ?";
        }
        if(aFilterObject.isliquidation != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.ISLIQUIDATION = ?";
        }
        if(aFilterObject.technum1 != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.TECHNUM1 = ?";
        }
         if (aFilterObject.lisencepack != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.lisencepack.indexOf('*',0) < 0 && aFilterObject.lisencepack.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSITEQUIPMENT.LISENCEPACK = ?";
             else
                 whereStr = whereStr + "  ENSITEQUIPMENT.LISENCEPACK LIKE ?";
         }
        if(aFilterObject.technum2 != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.TECHNUM2 = ?";
        }
        if(aFilterObject.batch != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.BATCH = ?";
        }
         if (aFilterObject.descr != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.descr.indexOf('*',0) < 0 && aFilterObject.descr.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSITEQUIPMENT.DESCR = ?";
             else
                 whereStr = whereStr + "  ENSITEQUIPMENT.DESCR LIKE ?";
         }
         if (aFilterObject.location != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.location.indexOf('*',0) < 0 && aFilterObject.location.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSITEQUIPMENT.LOCATION = ?";
             else
                 whereStr = whereStr + "  ENSITEQUIPMENT.LOCATION LIKE ?";
         }
        if(aFilterObject.installdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.INSTALLDATE = ?";
        }
        if(aFilterObject.inputdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.INPUTDATE = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSITEQUIPMENT.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENSITEQUIPMENT.COMMENTGEN LIKE ?";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSITEQUIPMENT.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENSITEQUIPMENT.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.MODIFY_TIME = ?";
        }
        if(aFilterObject.objectType.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSITEQUIPMENT.OBJECTTYPECODE = ? ";
        }
        if(aFilterObject.element.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSITEQUIPMENT.ELEMENTCODE = ? ";
        }
        if(aFilterObject.finworker.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSITEQUIPMENT.FINWORKERCODE = ? ";
        }

      }

      if(condition.length() != 0)
      {
         if(whereStr.length() != 0)
            whereStr = whereStr + " AND ";
         whereStr = whereStr + " (" + condition + ")";
      }

     if(whereStr.length() != 0)
         selectStr = selectStr + " WHERE" + whereStr;

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
                 whereStr = whereStr + " ENSITEQUIPMENT.NAME = ?";
             else
                 whereStr = whereStr + " ENSITEQUIPMENT.NAME LIKE ?";

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
         if (aFilterObject.serialnumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.serialnumber.indexOf('*',0) < 0 && aFilterObject.serialnumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENSITEQUIPMENT.SERIALNUMBER = ?";
             else
                 whereStr = whereStr + " ENSITEQUIPMENT.SERIALNUMBER LIKE ?";

           if(aFilterObject.serialnumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.serialnumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.suppliername != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.suppliername.indexOf('*',0) < 0 && aFilterObject.suppliername.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENSITEQUIPMENT.SUPPLIERNAME = ?";
             else
                 whereStr = whereStr + " ENSITEQUIPMENT.SUPPLIERNAME LIKE ?";

           if(aFilterObject.suppliername != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.suppliername);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.isserver != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isserver);
         }
         if (aFilterObject.num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.num.indexOf('*',0) < 0 && aFilterObject.num.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENSITEQUIPMENT.NUM = ?";
             else
                 whereStr = whereStr + " ENSITEQUIPMENT.NUM LIKE ?";

           if(aFilterObject.num != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.num);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.supplierdate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.supplierdate.getTime()));
        }
         if(aFilterObject.warranty != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.warranty);
         }
         if(aFilterObject.isliquidation != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isliquidation);
         }
         if(aFilterObject.technum1 != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.technum1);
         }
         if (aFilterObject.lisencepack != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.lisencepack.indexOf('*',0) < 0 && aFilterObject.lisencepack.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENSITEQUIPMENT.LISENCEPACK = ?";
             else
                 whereStr = whereStr + " ENSITEQUIPMENT.LISENCEPACK LIKE ?";

           if(aFilterObject.lisencepack != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.lisencepack);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.technum2 != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.technum2);
         }
         if(aFilterObject.batch != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.batch);
         }
         if (aFilterObject.descr != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.descr.indexOf('*',0) < 0 && aFilterObject.descr.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENSITEQUIPMENT.DESCR = ?";
             else
                 whereStr = whereStr + " ENSITEQUIPMENT.DESCR LIKE ?";

           if(aFilterObject.descr != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.descr);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.location != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.location.indexOf('*',0) < 0 && aFilterObject.location.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENSITEQUIPMENT.LOCATION = ?";
             else
                 whereStr = whereStr + " ENSITEQUIPMENT.LOCATION LIKE ?";

           if(aFilterObject.location != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.location);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.installdate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.installdate.getTime()));
        }
        if(aFilterObject.inputdate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.inputdate.getTime()));
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENSITEQUIPMENT.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENSITEQUIPMENT.COMMENTGEN LIKE ?";

           if(aFilterObject.commentGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.commentGen);
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
                 whereStr = whereStr + " ENSITEQUIPMENT.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENSITEQUIPMENT.DOMAIN_INFO LIKE ?";

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
       if(aFilterObject.objectType.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.objectType.code);
       }
       if(aFilterObject.element.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.element.code);
       }
       if(aFilterObject.finworker.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finworker.code);
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

  public int[] getFilteredCodeArray(ENSITEquipmentFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENSITEquipment aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENSITEQUIPMENT.CODE FROM ENSITEQUIPMENT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENSITEQUIPMENT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENSITEquipment.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENSITEquipment.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("ENSITEQUIPMENT",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (ENSITEQUIPMENT.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSITEQUIPMENT.NAME = ?";
             else
                 whereStr = whereStr + "  ENSITEQUIPMENT.NAME LIKE ?";
         }
         if (aFilterObject.serialnumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.serialnumber.indexOf('*',0) < 0 && aFilterObject.serialnumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSITEQUIPMENT.SERIALNUMBER = ?";
             else
                 whereStr = whereStr + "  ENSITEQUIPMENT.SERIALNUMBER LIKE ?";
         }
         if (aFilterObject.suppliername != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.suppliername.indexOf('*',0) < 0 && aFilterObject.suppliername.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSITEQUIPMENT.SUPPLIERNAME = ?";
             else
                 whereStr = whereStr + "  ENSITEQUIPMENT.SUPPLIERNAME LIKE ?";
         }
        if(aFilterObject.isserver != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.ISSERVER = ?";
        }
         if (aFilterObject.num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.num.indexOf('*',0) < 0 && aFilterObject.num.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSITEQUIPMENT.NUM = ?";
             else
                 whereStr = whereStr + "  ENSITEQUIPMENT.NUM LIKE ?";
         }
        if(aFilterObject.supplierdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.SUPPLIERDATE = ?";
        }
        if(aFilterObject.warranty != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.WARRANTY = ?";
        }
        if(aFilterObject.isliquidation != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.ISLIQUIDATION = ?";
        }
        if(aFilterObject.technum1 != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.TECHNUM1 = ?";
        }
         if (aFilterObject.lisencepack != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.lisencepack.indexOf('*',0) < 0 && aFilterObject.lisencepack.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSITEQUIPMENT.LISENCEPACK = ?";
             else
                 whereStr = whereStr + "  ENSITEQUIPMENT.LISENCEPACK LIKE ?";
         }
        if(aFilterObject.technum2 != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.TECHNUM2 = ?";
        }
        if(aFilterObject.batch != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.BATCH = ?";
        }
         if (aFilterObject.descr != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.descr.indexOf('*',0) < 0 && aFilterObject.descr.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSITEQUIPMENT.DESCR = ?";
             else
                 whereStr = whereStr + "  ENSITEQUIPMENT.DESCR LIKE ?";
         }
         if (aFilterObject.location != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.location.indexOf('*',0) < 0 && aFilterObject.location.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSITEQUIPMENT.LOCATION = ?";
             else
                 whereStr = whereStr + "  ENSITEQUIPMENT.LOCATION LIKE ?";
         }
        if(aFilterObject.installdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.INSTALLDATE = ?";
        }
        if(aFilterObject.inputdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.INPUTDATE = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSITEQUIPMENT.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENSITEQUIPMENT.COMMENTGEN LIKE ?";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSITEQUIPMENT.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENSITEQUIPMENT.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSITEQUIPMENT.MODIFY_TIME = ?";
        }
        if(aFilterObject.objectType.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSITEQUIPMENT.OBJECTTYPECODE = ? ";
        }
        if(aFilterObject.element.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSITEQUIPMENT.ELEMENTCODE = ? ";
        }
        if(aFilterObject.finworker.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSITEQUIPMENT.FINWORKERCODE = ? ";
        }

      }

      if(condition.length() != 0)
      {
         if(whereStr.length() != 0)
            whereStr = whereStr + " AND ";
         whereStr = whereStr + " (" + condition + ")";
      }

     if(whereStr.length() != 0)
         selectStr = selectStr + " WHERE" + whereStr;

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
                 whereStr = whereStr + " ENSITEQUIPMENT.NAME = ?";
             else
                 whereStr = whereStr + " ENSITEQUIPMENT.NAME LIKE ?";

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
         if (aFilterObject.serialnumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.serialnumber.indexOf('*',0) < 0 && aFilterObject.serialnumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENSITEQUIPMENT.SERIALNUMBER = ?";
             else
                 whereStr = whereStr + " ENSITEQUIPMENT.SERIALNUMBER LIKE ?";

           if(aFilterObject.serialnumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.serialnumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.suppliername != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.suppliername.indexOf('*',0) < 0 && aFilterObject.suppliername.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENSITEQUIPMENT.SUPPLIERNAME = ?";
             else
                 whereStr = whereStr + " ENSITEQUIPMENT.SUPPLIERNAME LIKE ?";

           if(aFilterObject.suppliername != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.suppliername);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.isserver != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isserver);
         }
         if (aFilterObject.num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.num.indexOf('*',0) < 0 && aFilterObject.num.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENSITEQUIPMENT.NUM = ?";
             else
                 whereStr = whereStr + " ENSITEQUIPMENT.NUM LIKE ?";

           if(aFilterObject.num != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.num);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.supplierdate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.supplierdate.getTime()));
        }
         if(aFilterObject.warranty != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.warranty);
         }
         if(aFilterObject.isliquidation != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isliquidation);
         }
         if(aFilterObject.technum1 != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.technum1);
         }
         if (aFilterObject.lisencepack != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.lisencepack.indexOf('*',0) < 0 && aFilterObject.lisencepack.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENSITEQUIPMENT.LISENCEPACK = ?";
             else
                 whereStr = whereStr + " ENSITEQUIPMENT.LISENCEPACK LIKE ?";

           if(aFilterObject.lisencepack != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.lisencepack);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.technum2 != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.technum2);
         }
         if(aFilterObject.batch != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.batch);
         }
         if (aFilterObject.descr != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.descr.indexOf('*',0) < 0 && aFilterObject.descr.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENSITEQUIPMENT.DESCR = ?";
             else
                 whereStr = whereStr + " ENSITEQUIPMENT.DESCR LIKE ?";

           if(aFilterObject.descr != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.descr);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.location != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.location.indexOf('*',0) < 0 && aFilterObject.location.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENSITEQUIPMENT.LOCATION = ?";
             else
                 whereStr = whereStr + " ENSITEQUIPMENT.LOCATION LIKE ?";

           if(aFilterObject.location != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.location);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.installdate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.installdate.getTime()));
        }
        if(aFilterObject.inputdate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.inputdate.getTime()));
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENSITEQUIPMENT.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENSITEQUIPMENT.COMMENTGEN LIKE ?";

           if(aFilterObject.commentGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.commentGen);
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
                 whereStr = whereStr + " ENSITEQUIPMENT.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENSITEQUIPMENT.DOMAIN_INFO LIKE ?";

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
       if(aFilterObject.objectType.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.objectType.code);
       }
       if(aFilterObject.element.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.element.code);
       }
       if(aFilterObject.finworker.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finworker.code);
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


   public ENSITEquipment getObject(int uid) throws PersistenceException
   {
    ENSITEquipment result = new ENSITEquipment();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENSITEquipment anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENSITEquipment.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENSITEquipment.getObject%} access denied");



    selectStr =
    "SELECT  ENSITEQUIPMENT.CODE, ENSITEQUIPMENT.NAME, ENSITEQUIPMENT.SERIALNUMBER, ENSITEQUIPMENT.SUPPLIERNAME, ENSITEQUIPMENT.ISSERVER, ENSITEQUIPMENT.NUM, ENSITEQUIPMENT.SUPPLIERDATE, ENSITEQUIPMENT.WARRANTY, ENSITEQUIPMENT.ISLIQUIDATION, ENSITEQUIPMENT.TECHNUM1, ENSITEQUIPMENT.LISENCEPACK, ENSITEQUIPMENT.TECHNUM2, ENSITEQUIPMENT.BATCH, ENSITEQUIPMENT.DESCR, ENSITEQUIPMENT.LOCATION, ENSITEQUIPMENT.INSTALLDATE, ENSITEQUIPMENT.INPUTDATE, ENSITEQUIPMENT.COMMENTGEN, ENSITEQUIPMENT.DOMAIN_INFO, ENSITEQUIPMENT.MODIFY_TIME, ENSITEQUIPMENT.OBJECTTYPECODE, ENSITEQUIPMENT.ELEMENTCODE, ENSITEQUIPMENT.FINWORKERCODE "
    +" FROM ENSITEQUIPMENT WHERE ENSITEQUIPMENT.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("ENSITEQUIPMENT",segregationInfo,getUserProfile().getDomainInfo());
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
        anObject.serialnumber = set.getString(3);
        anObject.suppliername = set.getString(4);
        anObject.isserver = set.getInt(5);
        if ( set.wasNull() )
           anObject.isserver = Integer.MIN_VALUE;
        anObject.num = set.getString(6);
        anObject.supplierdate = set.getDate(7);
        anObject.warranty = set.getInt(8);
        if ( set.wasNull() )
           anObject.warranty = Integer.MIN_VALUE;
        anObject.isliquidation = set.getInt(9);
        if ( set.wasNull() )
           anObject.isliquidation = Integer.MIN_VALUE;
        anObject.technum1 = set.getInt(10);
        if ( set.wasNull() )
           anObject.technum1 = Integer.MIN_VALUE;
        anObject.lisencepack = set.getString(11);
        anObject.technum2 = set.getInt(12);
        if ( set.wasNull() )
           anObject.technum2 = Integer.MIN_VALUE;
        anObject.batch = set.getInt(13);
        if ( set.wasNull() )
           anObject.batch = Integer.MIN_VALUE;
        anObject.descr = set.getString(14);
        anObject.location = set.getString(15);
        anObject.installdate = set.getDate(16);
        anObject.inputdate = set.getDate(17);
        anObject.commentGen = set.getString(18);
        anObject.domain_info = set.getString(19);
        anObject.modify_time = set.getLong(20);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.objectType.code = set.getInt(21);
        if ( set.wasNull() )
            anObject.objectType.code = Integer.MIN_VALUE;
        anObject.element.code = set.getInt(22);
        if ( set.wasNull() )
            anObject.element.code = Integer.MIN_VALUE;
        anObject.finworker.code = set.getInt(23);
        if ( set.wasNull() )
            anObject.finworker.code = Integer.MIN_VALUE;
        if(anObject.objectType.code != Integer.MIN_VALUE)
        {
           anObject.setObjectType(
        new com.ksoe.energynet.dataminer.generated.ENSITEquipTypeDAOGen(connection,getUserProfile()).getObject(anObject.objectType.code));
    }
        if(anObject.element.code != Integer.MIN_VALUE)
        {
           anObject.setElement(
        new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).getObject(anObject.element.code));
    }
        if(anObject.finworker.code != Integer.MIN_VALUE)
        {
           anObject.setFinworker(
        new com.ksoe.energynet.dataminer.generated.FINWorkerDAOGen(connection,getUserProfile()).getObject(anObject.finworker.code));
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


  public com.ksoe.energynet.valueobject.references.ENSITEquipmentRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENSITEquipmentRef ref = new com.ksoe.energynet.valueobject.references.ENSITEquipmentRef();
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

    selectStr = "DELETE FROM  ENSITEQUIPMENT WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENSITEquipment object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENSITEquipment.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENSITEquipment.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENSITEquipment.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENSITEquipment.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENSITEquipment.getObject%} access denied");

    selectStr =

    "SELECT  ENSITEQUIPMENT.CODE FROM  ENSITEQUIPMENT WHERE  ENSITEQUIPMENT.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("ENSITEQUIPMENT",segregationInfo,getUserProfile().getDomainInfo());
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
    _checkConditionToken(condition,"code","ENSITEQUIPMENT.CODE");
    _checkConditionToken(condition,"name","ENSITEQUIPMENT.NAME");
    _checkConditionToken(condition,"serialnumber","ENSITEQUIPMENT.SERIALNUMBER");
    _checkConditionToken(condition,"suppliername","ENSITEQUIPMENT.SUPPLIERNAME");
    _checkConditionToken(condition,"isserver","ENSITEQUIPMENT.ISSERVER");
    _checkConditionToken(condition,"num","ENSITEQUIPMENT.NUM");
    _checkConditionToken(condition,"supplierdate","ENSITEQUIPMENT.SUPPLIERDATE");
    _checkConditionToken(condition,"warranty","ENSITEQUIPMENT.WARRANTY");
    _checkConditionToken(condition,"isliquidation","ENSITEQUIPMENT.ISLIQUIDATION");
    _checkConditionToken(condition,"technum1","ENSITEQUIPMENT.TECHNUM1");
    _checkConditionToken(condition,"lisencepack","ENSITEQUIPMENT.LISENCEPACK");
    _checkConditionToken(condition,"technum2","ENSITEQUIPMENT.TECHNUM2");
    _checkConditionToken(condition,"batch","ENSITEQUIPMENT.BATCH");
    _checkConditionToken(condition,"descr","ENSITEQUIPMENT.DESCR");
    _checkConditionToken(condition,"location","ENSITEQUIPMENT.LOCATION");
    _checkConditionToken(condition,"installdate","ENSITEQUIPMENT.INSTALLDATE");
    _checkConditionToken(condition,"inputdate","ENSITEQUIPMENT.INPUTDATE");
    _checkConditionToken(condition,"commentgen","ENSITEQUIPMENT.COMMENTGEN");
    _checkConditionToken(condition,"domain_info","ENSITEQUIPMENT.DOMAIN_INFO");
    _checkConditionToken(condition,"modify_time","ENSITEQUIPMENT.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"objecttype","OBJECTTYPECODE");
    _checkConditionToken(condition,"objecttype.code","OBJECTTYPECODE");
    _checkConditionToken(condition,"element","ELEMENTCODE");
    _checkConditionToken(condition,"element.code","ELEMENTCODE");
    _checkConditionToken(condition,"finworker","FINWORKERCODE");
    _checkConditionToken(condition,"finworker.code","FINWORKERCODE");
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

   private void _collectAutoIncrementFields(ENSITEquipment anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("ENSITEQUIPMENT", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("ENSITEQUIPMENT", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("ENSITEQUIPMENT", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: ENSITEQUIPMENT");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of ENSITEquipmentDAO

