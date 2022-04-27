
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
import com.ksoe.energynet.valueobject.ENUnitedGroup2TechCondServices;
import com.ksoe.energynet.valueobject.brief.ENUnitedGroup2TechCondServicesShort;
import com.ksoe.energynet.valueobject.filter.ENUnitedGroup2TechCondServicesFilter;
import com.ksoe.energynet.valueobject.lists.ENUnitedGroup2TechCondServicesShortList;
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
  *  DAO Generated for ENUnitedGroup2TechCondServices;
  *
  */

public class ENUnitedGroup2TechCondServicesDAOGen extends GenericDataMiner {

  public ENUnitedGroup2TechCondServicesDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENUnitedGroup2TechCondServicesDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENUnitedGroup2TechCondServices inObject) throws PersistenceException
   {
      ENUnitedGroup2TechCondServices obj = new ENUnitedGroup2TechCondServices();
      obj.code = inObject.code;
      loadObject(obj);

     if ( ! inObject.costLines04Building.equals(obj.costLines04Building)){
       return false;
     }

     if ( ! inObject.costLines04Building1.equals(obj.costLines04Building1)){
       return false;
     }

     if ( ! inObject.costLines04Building2.equals(obj.costLines04Building2)){
       return false;
     }

     if ( ! inObject.costLines04Building3.equals(obj.costLines04Building3)){
       return false;
     }

     if ( ! inObject.costLines10Building.equals(obj.costLines10Building)){
       return false;
     }

     if ( ! inObject.costLines10Building1.equals(obj.costLines10Building1)){
       return false;
     }

     if ( ! inObject.costLines10Building2.equals(obj.costLines10Building2)){
       return false;
     }

     if ( ! inObject.costLines10Building3.equals(obj.costLines10Building3)){
       return false;
     }

     if ( ! inObject.costLines10Building4.equals(obj.costLines10Building4)){
       return false;
     }
     if (inObject.techCondServRef.code != obj.techCondServRef.code){
        return false;
     }
     if (inObject.unitedGroupL04D1Ref.code != obj.unitedGroupL04D1Ref.code){
        return false;
     }
     if (inObject.unitedGroupL04D2Ref.code != obj.unitedGroupL04D2Ref.code){
        return false;
     }
     if (inObject.unitedGroupL04D3Ref.code != obj.unitedGroupL04D3Ref.code){
        return false;
     }
     if (inObject.unitedGroupTP04Ref.code != obj.unitedGroupTP04Ref.code){
        return false;
     }
     if (inObject.unitedGroupL10D1Ref.code != obj.unitedGroupL10D1Ref.code){
        return false;
     }
     if (inObject.unitedGroupL10D2Ref.code != obj.unitedGroupL10D2Ref.code){
        return false;
     }
     if (inObject.unitedGroupL10D3Ref.code != obj.unitedGroupL10D3Ref.code){
        return false;
     }
     if (inObject.unitedGroupL10D4Ref.code != obj.unitedGroupL10D4Ref.code){
        return false;
     }
     if (inObject.unitedGroupPS35Ref.code != obj.unitedGroupPS35Ref.code){
        return false;
     }
      return true;
   }

   public int add(ENUnitedGroup2TechCondServices anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENUnitedGroup2TechCondServices anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENUNITDGRP2TCHCNDSRVCS (CODE,COSTLINES04BUILDING,COSTLINES04BUILDING1,COSTLINES04BUILDING2,COSTLINES04BUILDING3,COSTLINES10BUILDING,COSTLINES10BUILDING1,COSTLINES10BUILDING2,COSTLINES10BUILDING3,COSTLINES10BUILDING4,TECHCONDSERVREFCODE,UNITEDGROUPL04D1REFCOD,UNITEDGROUPL04D2REFCOD,UNITEDGROUPL04D3REFCOD,UNITEDGROUPTP04REFCODE,UNITEDGROUPL10D1REFCOD,UNITEDGROUPL10D2REFCOD,UNITEDGROUPL10D3REFCOD,UNITEDGROUPL10D4REFCOD,UNITEDGROUPPS35REFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.costLines04Building != null)
        anObject.costLines04Building = anObject.costLines04Building.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.costLines04Building);
      if (anObject.costLines04Building1 != null)
        anObject.costLines04Building1 = anObject.costLines04Building1.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.costLines04Building1);
      if (anObject.costLines04Building2 != null)
        anObject.costLines04Building2 = anObject.costLines04Building2.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.costLines04Building2);
      if (anObject.costLines04Building3 != null)
        anObject.costLines04Building3 = anObject.costLines04Building3.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.costLines04Building3);
      if (anObject.costLines10Building != null)
        anObject.costLines10Building = anObject.costLines10Building.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.costLines10Building);
      if (anObject.costLines10Building1 != null)
        anObject.costLines10Building1 = anObject.costLines10Building1.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.costLines10Building1);
      if (anObject.costLines10Building2 != null)
        anObject.costLines10Building2 = anObject.costLines10Building2.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.costLines10Building2);
      if (anObject.costLines10Building3 != null)
        anObject.costLines10Building3 = anObject.costLines10Building3.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(9,anObject.costLines10Building3);
      if (anObject.costLines10Building4 != null)
        anObject.costLines10Building4 = anObject.costLines10Building4.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(10,anObject.costLines10Building4);
      if (anObject.techCondServRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTechConditionsServicesDAOGen(connection,getUserProfile()).exists(anObject.techCondServRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENUnitedGroup2TechCondServices.techCondServRef.code%} = {%"+anObject.techCondServRef.code+"%}");
        statement.setInt(11,anObject.techCondServRef.code);
      }
      else
        statement.setNull(11,java.sql.Types.INTEGER);
      if (anObject.unitedGroupL04D1Ref.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENUnitedGroupConnectionsDAOGen(connection,getUserProfile()).exists(anObject.unitedGroupL04D1Ref.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENUnitedGroup2TechCondServices.unitedGroupL04D1Ref.code%} = {%"+anObject.unitedGroupL04D1Ref.code+"%}");
        statement.setInt(12,anObject.unitedGroupL04D1Ref.code);
      }
      else
        statement.setNull(12,java.sql.Types.INTEGER);
      if (anObject.unitedGroupL04D2Ref.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENUnitedGroupConnectionsDAOGen(connection,getUserProfile()).exists(anObject.unitedGroupL04D2Ref.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENUnitedGroup2TechCondServices.unitedGroupL04D2Ref.code%} = {%"+anObject.unitedGroupL04D2Ref.code+"%}");
        statement.setInt(13,anObject.unitedGroupL04D2Ref.code);
      }
      else
        statement.setNull(13,java.sql.Types.INTEGER);
      if (anObject.unitedGroupL04D3Ref.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENUnitedGroupConnectionsDAOGen(connection,getUserProfile()).exists(anObject.unitedGroupL04D3Ref.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENUnitedGroup2TechCondServices.unitedGroupL04D3Ref.code%} = {%"+anObject.unitedGroupL04D3Ref.code+"%}");
        statement.setInt(14,anObject.unitedGroupL04D3Ref.code);
      }
      else
        statement.setNull(14,java.sql.Types.INTEGER);
      if (anObject.unitedGroupTP04Ref.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENUnitedGroupConnectionsDAOGen(connection,getUserProfile()).exists(anObject.unitedGroupTP04Ref.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENUnitedGroup2TechCondServices.unitedGroupTP04Ref.code%} = {%"+anObject.unitedGroupTP04Ref.code+"%}");
        statement.setInt(15,anObject.unitedGroupTP04Ref.code);
      }
      else
        statement.setNull(15,java.sql.Types.INTEGER);
      if (anObject.unitedGroupL10D1Ref.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENUnitedGroupConnectionsDAOGen(connection,getUserProfile()).exists(anObject.unitedGroupL10D1Ref.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENUnitedGroup2TechCondServices.unitedGroupL10D1Ref.code%} = {%"+anObject.unitedGroupL10D1Ref.code+"%}");
        statement.setInt(16,anObject.unitedGroupL10D1Ref.code);
      }
      else
        statement.setNull(16,java.sql.Types.INTEGER);
      if (anObject.unitedGroupL10D2Ref.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENUnitedGroupConnectionsDAOGen(connection,getUserProfile()).exists(anObject.unitedGroupL10D2Ref.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENUnitedGroup2TechCondServices.unitedGroupL10D2Ref.code%} = {%"+anObject.unitedGroupL10D2Ref.code+"%}");
        statement.setInt(17,anObject.unitedGroupL10D2Ref.code);
      }
      else
        statement.setNull(17,java.sql.Types.INTEGER);
      if (anObject.unitedGroupL10D3Ref.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENUnitedGroupConnectionsDAOGen(connection,getUserProfile()).exists(anObject.unitedGroupL10D3Ref.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENUnitedGroup2TechCondServices.unitedGroupL10D3Ref.code%} = {%"+anObject.unitedGroupL10D3Ref.code+"%}");
        statement.setInt(18,anObject.unitedGroupL10D3Ref.code);
      }
      else
        statement.setNull(18,java.sql.Types.INTEGER);
      if (anObject.unitedGroupL10D4Ref.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENUnitedGroupConnectionsDAOGen(connection,getUserProfile()).exists(anObject.unitedGroupL10D4Ref.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENUnitedGroup2TechCondServices.unitedGroupL10D4Ref.code%} = {%"+anObject.unitedGroupL10D4Ref.code+"%}");
        statement.setInt(19,anObject.unitedGroupL10D4Ref.code);
      }
      else
        statement.setNull(19,java.sql.Types.INTEGER);
      if (anObject.unitedGroupPS35Ref.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENUnitedGroupConnectionsDAOGen(connection,getUserProfile()).exists(anObject.unitedGroupPS35Ref.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENUnitedGroup2TechCondServices.unitedGroupPS35Ref.code%} = {%"+anObject.unitedGroupPS35Ref.code+"%}");
        statement.setInt(20,anObject.unitedGroupPS35Ref.code);
      }
      else
        statement.setNull(20,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENUnitedGroup2TechCondServicesDAOGen.add%}",e);
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

   public void save(ENUnitedGroup2TechCondServices anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENUnitedGroup2TechCondServices anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("COSTLINES04BUILDING") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COSTLINES04BUILDING1") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COSTLINES04BUILDING2") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COSTLINES04BUILDING3") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COSTLINES10BUILDING") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COSTLINES10BUILDING1") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COSTLINES10BUILDING2") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COSTLINES10BUILDING3") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COSTLINES10BUILDING4") == 0)
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
          if(fieldNameStr.compareTo("UNITEDGROUPL04D1REF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("UNITEDGROUPL04D2REF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("UNITEDGROUPL04D3REF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("UNITEDGROUPTP04REF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("UNITEDGROUPL10D1REF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("UNITEDGROUPL10D2REF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("UNITEDGROUPL10D3REF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("UNITEDGROUPL10D4REF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("UNITEDGROUPPS35REF") == 0)
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
        "UPDATE ENUNITDGRP2TCHCNDSRVCS SET  COSTLINES04BUILDING = ? , COSTLINES04BUILDING1 = ? , COSTLINES04BUILDING2 = ? , COSTLINES04BUILDING3 = ? , COSTLINES10BUILDING = ? , COSTLINES10BUILDING1 = ? , COSTLINES10BUILDING2 = ? , COSTLINES10BUILDING3 = ? , COSTLINES10BUILDING4 = ? , TECHCONDSERVREFCODE = ? , UNITEDGROUPL04D1REFCOD = ? , UNITEDGROUPL04D2REFCOD = ? , UNITEDGROUPL04D3REFCOD = ? , UNITEDGROUPTP04REFCODE = ? , UNITEDGROUPL10D1REFCOD = ? , UNITEDGROUPL10D2REFCOD = ? , UNITEDGROUPL10D3REFCOD = ? , UNITEDGROUPL10D4REFCOD = ? , UNITEDGROUPPS35REFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENUNITEDGROUP2TECHCONDSERVICES SET ";
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
      if (anObject.costLines04Building != null)
        anObject.costLines04Building = anObject.costLines04Building.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(1,anObject.costLines04Building);

      if (anObject.costLines04Building1 != null)
        anObject.costLines04Building1 = anObject.costLines04Building1.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.costLines04Building1);

      if (anObject.costLines04Building2 != null)
        anObject.costLines04Building2 = anObject.costLines04Building2.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.costLines04Building2);

      if (anObject.costLines04Building3 != null)
        anObject.costLines04Building3 = anObject.costLines04Building3.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.costLines04Building3);

      if (anObject.costLines10Building != null)
        anObject.costLines10Building = anObject.costLines10Building.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.costLines10Building);

      if (anObject.costLines10Building1 != null)
        anObject.costLines10Building1 = anObject.costLines10Building1.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.costLines10Building1);

      if (anObject.costLines10Building2 != null)
        anObject.costLines10Building2 = anObject.costLines10Building2.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.costLines10Building2);

      if (anObject.costLines10Building3 != null)
        anObject.costLines10Building3 = anObject.costLines10Building3.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.costLines10Building3);

      if (anObject.costLines10Building4 != null)
        anObject.costLines10Building4 = anObject.costLines10Building4.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(9,anObject.costLines10Building4);

      if (anObject.techCondServRef.code != Integer.MIN_VALUE)
        statement.setInt(10,anObject.techCondServRef.code);
      else
        statement.setNull(10,java.sql.Types.INTEGER);
      if (anObject.unitedGroupL04D1Ref.code != Integer.MIN_VALUE)
        statement.setInt(11,anObject.unitedGroupL04D1Ref.code);
      else
        statement.setNull(11,java.sql.Types.INTEGER);
      if (anObject.unitedGroupL04D2Ref.code != Integer.MIN_VALUE)
        statement.setInt(12,anObject.unitedGroupL04D2Ref.code);
      else
        statement.setNull(12,java.sql.Types.INTEGER);
      if (anObject.unitedGroupL04D3Ref.code != Integer.MIN_VALUE)
        statement.setInt(13,anObject.unitedGroupL04D3Ref.code);
      else
        statement.setNull(13,java.sql.Types.INTEGER);
      if (anObject.unitedGroupTP04Ref.code != Integer.MIN_VALUE)
        statement.setInt(14,anObject.unitedGroupTP04Ref.code);
      else
        statement.setNull(14,java.sql.Types.INTEGER);
      if (anObject.unitedGroupL10D1Ref.code != Integer.MIN_VALUE)
        statement.setInt(15,anObject.unitedGroupL10D1Ref.code);
      else
        statement.setNull(15,java.sql.Types.INTEGER);
      if (anObject.unitedGroupL10D2Ref.code != Integer.MIN_VALUE)
        statement.setInt(16,anObject.unitedGroupL10D2Ref.code);
      else
        statement.setNull(16,java.sql.Types.INTEGER);
      if (anObject.unitedGroupL10D3Ref.code != Integer.MIN_VALUE)
        statement.setInt(17,anObject.unitedGroupL10D3Ref.code);
      else
        statement.setNull(17,java.sql.Types.INTEGER);
      if (anObject.unitedGroupL10D4Ref.code != Integer.MIN_VALUE)
        statement.setInt(18,anObject.unitedGroupL10D4Ref.code);
      else
        statement.setNull(18,java.sql.Types.INTEGER);
      if (anObject.unitedGroupPS35Ref.code != Integer.MIN_VALUE)
        statement.setInt(19,anObject.unitedGroupPS35Ref.code);
      else
        statement.setNull(19,java.sql.Types.INTEGER);
          statement.setInt(20,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("COSTLINES04BUILDING".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.costLines04Building != null)
                    anObject.costLines04Building = anObject.costLines04Building.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.costLines04Building);
                continue;
             }
            if("COSTLINES04BUILDING1".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.costLines04Building1 != null)
                    anObject.costLines04Building1 = anObject.costLines04Building1.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.costLines04Building1);
                continue;
             }
            if("COSTLINES04BUILDING2".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.costLines04Building2 != null)
                    anObject.costLines04Building2 = anObject.costLines04Building2.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.costLines04Building2);
                continue;
             }
            if("COSTLINES04BUILDING3".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.costLines04Building3 != null)
                    anObject.costLines04Building3 = anObject.costLines04Building3.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.costLines04Building3);
                continue;
             }
            if("COSTLINES10BUILDING".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.costLines10Building != null)
                    anObject.costLines10Building = anObject.costLines10Building.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.costLines10Building);
                continue;
             }
            if("COSTLINES10BUILDING1".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.costLines10Building1 != null)
                    anObject.costLines10Building1 = anObject.costLines10Building1.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.costLines10Building1);
                continue;
             }
            if("COSTLINES10BUILDING2".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.costLines10Building2 != null)
                    anObject.costLines10Building2 = anObject.costLines10Building2.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.costLines10Building2);
                continue;
             }
            if("COSTLINES10BUILDING3".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.costLines10Building3 != null)
                    anObject.costLines10Building3 = anObject.costLines10Building3.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.costLines10Building3);
                continue;
             }
            if("COSTLINES10BUILDING4".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.costLines10Building4 != null)
                    anObject.costLines10Building4 = anObject.costLines10Building4.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.costLines10Building4);
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
            if("UNITEDGROUPL04D1REF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.unitedGroupL04D1Ref.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.unitedGroupL04D1Ref.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("UNITEDGROUPL04D2REF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.unitedGroupL04D2Ref.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.unitedGroupL04D2Ref.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("UNITEDGROUPL04D3REF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.unitedGroupL04D3Ref.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.unitedGroupL04D3Ref.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("UNITEDGROUPTP04REF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.unitedGroupTP04Ref.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.unitedGroupTP04Ref.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("UNITEDGROUPL10D1REF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.unitedGroupL10D1Ref.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.unitedGroupL10D1Ref.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("UNITEDGROUPL10D2REF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.unitedGroupL10D2Ref.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.unitedGroupL10D2Ref.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("UNITEDGROUPL10D3REF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.unitedGroupL10D3Ref.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.unitedGroupL10D3Ref.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("UNITEDGROUPL10D4REF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.unitedGroupL10D4Ref.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.unitedGroupL10D4Ref.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("UNITEDGROUPPS35REF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.unitedGroupPS35Ref.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.unitedGroupPS35Ref.code);
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

   } // end of save(ENUnitedGroup2TechCondServices anObject,String[] anAttributes)


 public ENUnitedGroup2TechCondServicesShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENUnitedGroup2TechCondServices filterObject = new ENUnitedGroup2TechCondServices();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENUnitedGroup2TechCondServicesShort)list.get(0);
   return null;
  }

  public ENUnitedGroup2TechCondServicesShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENUnitedGroup2TechCondServicesShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENUnitedGroup2TechCondServicesShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENUnitedGroup2TechCondServicesShortList getFilteredList(ENUnitedGroup2TechCondServices filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENUnitedGroup2TechCondServicesShortList getScrollableFilteredList(ENUnitedGroup2TechCondServices aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENUnitedGroup2TechCondServicesShortList getScrollableFilteredList(ENUnitedGroup2TechCondServices aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENUnitedGroup2TechCondServicesShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENUnitedGroup2TechCondServicesShortList getScrollableFilteredList(ENUnitedGroup2TechCondServicesFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENUnitedGroup2TechCondServicesShortList getScrollableFilteredList(ENUnitedGroup2TechCondServicesFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENUnitedGroup2TechCondServicesShortList getScrollableFilteredList(ENUnitedGroup2TechCondServices aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENUnitedGroup2TechCondServicesShortList getScrollableFilteredList(ENUnitedGroup2TechCondServices aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENUnitedGroup2TechCondServicesShortList result = new ENUnitedGroup2TechCondServicesShortList();
    ENUnitedGroup2TechCondServicesShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENUNITDGRP2TCHCNDSRVCS.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENUNITDGRP2TCHCNDSRVCS.CODE"+
     ",ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING"+
     ",ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING1"+
     ",ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING2"+
     ",ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING3"+
     ",ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING"+
     ",ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING1"+
     ",ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING2"+
     ",ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING3"+
     ",ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING4"+

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
      ", ENUNITEDGROUPCONNECTNS.CODE " +
      ", ENUNITEDGROUPCONNECTNS.NAME " +
      ", ENUNITEDGROUPCONNECTNS.DESCRIPTION " +
      ", ENUNITEDGROUPCONNECTNS.CODE " +
      ", ENUNITEDGROUPCONNECTNS.NAME " +
      ", ENUNITEDGROUPCONNECTNS.DESCRIPTION " +
      ", ENUNITEDGROUPCONNECTNS.CODE " +
      ", ENUNITEDGROUPCONNECTNS.NAME " +
      ", ENUNITEDGROUPCONNECTNS.DESCRIPTION " +
      ", ENUNITEDGROUPCONNECTNS.CODE " +
      ", ENUNITEDGROUPCONNECTNS.NAME " +
      ", ENUNITEDGROUPCONNECTNS.DESCRIPTION " +
      ", ENUNITEDGROUPCONNECTNS.CODE " +
      ", ENUNITEDGROUPCONNECTNS.NAME " +
      ", ENUNITEDGROUPCONNECTNS.DESCRIPTION " +
      ", ENUNITEDGROUPCONNECTNS.CODE " +
      ", ENUNITEDGROUPCONNECTNS.NAME " +
      ", ENUNITEDGROUPCONNECTNS.DESCRIPTION " +
      ", ENUNITEDGROUPCONNECTNS.CODE " +
      ", ENUNITEDGROUPCONNECTNS.NAME " +
      ", ENUNITEDGROUPCONNECTNS.DESCRIPTION " +
      ", ENUNITEDGROUPCONNECTNS.CODE " +
      ", ENUNITEDGROUPCONNECTNS.NAME " +
      ", ENUNITEDGROUPCONNECTNS.DESCRIPTION " +
      ", ENUNITEDGROUPCONNECTNS.CODE " +
      ", ENUNITEDGROUPCONNECTNS.NAME " +
      ", ENUNITEDGROUPCONNECTNS.DESCRIPTION " +
     " FROM ENUNITDGRP2TCHCNDSRVCS " +
     ", ENTECHCONDITIONSSERVCS " +
     ", ENUNITEDGROUPCONNECTNS " +
     ", ENUNITEDGROUPCONNECTNS " +
     ", ENUNITEDGROUPCONNECTNS " +
     ", ENUNITEDGROUPCONNECTNS " +
     ", ENUNITEDGROUPCONNECTNS " +
     ", ENUNITEDGROUPCONNECTNS " +
     ", ENUNITEDGROUPCONNECTNS " +
     ", ENUNITEDGROUPCONNECTNS " +
     ", ENUNITEDGROUPCONNECTNS " +
     //" WHERE "
    "";
     whereStr = " ENTECHCONDITIONSSERVCS.CODE = ENUNITDGRP2TCHCNDSRVCS.TECHCONDSERVREFCODE" ; //+
      whereStr = whereStr +" AND ENUNITEDGROUPCONNECTNS.CODE = ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL04D1REFCOD" ; //+
      whereStr = whereStr +" AND ENUNITEDGROUPCONNECTNS.CODE = ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL04D2REFCOD" ; //+
      whereStr = whereStr +" AND ENUNITEDGROUPCONNECTNS.CODE = ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL04D3REFCOD" ; //+
      whereStr = whereStr +" AND ENUNITEDGROUPCONNECTNS.CODE = ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPTP04REFCODE" ; //+
      whereStr = whereStr +" AND ENUNITEDGROUPCONNECTNS.CODE = ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL10D1REFCOD" ; //+
      whereStr = whereStr +" AND ENUNITEDGROUPCONNECTNS.CODE = ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL10D2REFCOD" ; //+
      whereStr = whereStr +" AND ENUNITEDGROUPCONNECTNS.CODE = ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL10D3REFCOD" ; //+
      whereStr = whereStr +" AND ENUNITEDGROUPCONNECTNS.CODE = ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL10D4REFCOD" ; //+
      whereStr = whereStr +" AND ENUNITEDGROUPCONNECTNS.CODE = ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPPS35REFCODE" ; //+
        //selectStr = selectStr + " ${s} ENUNITDGRP2TCHCNDSRVCS.CODE IN ( SELECT ENUNITDGRP2TCHCNDSRVCS.CODE FROM ENUNITDGRP2TCHCNDSRVCS ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.CODE = ?";
        }
        if(aFilterObject.costLines04Building != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING = ?";
        }
        if(aFilterObject.costLines04Building1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING1 = ?";
        }
        if(aFilterObject.costLines04Building2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING2 = ?";
        }
        if(aFilterObject.costLines04Building3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING3 = ?";
        }
        if(aFilterObject.costLines10Building != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING = ?";
        }
        if(aFilterObject.costLines10Building1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING1 = ?";
        }
        if(aFilterObject.costLines10Building2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING2 = ?";
        }
        if(aFilterObject.costLines10Building3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING3 = ?";
        }
        if(aFilterObject.costLines10Building4 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING4 = ?";
        }
        if(aFilterObject.techCondServRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENUNITDGRP2TCHCNDSRVCS.TECHCONDSERVREFCODE = ? ";
        }
        if(aFilterObject.unitedGroupL04D1Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL04D1REFCOD = ? ";
        }
        if(aFilterObject.unitedGroupL04D2Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL04D2REFCOD = ? ";
        }
        if(aFilterObject.unitedGroupL04D3Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL04D3REFCOD = ? ";
        }
        if(aFilterObject.unitedGroupTP04Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPTP04REFCODE = ? ";
        }
        if(aFilterObject.unitedGroupL10D1Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL10D1REFCOD = ? ";
        }
        if(aFilterObject.unitedGroupL10D2Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL10D2REFCOD = ? ";
        }
        if(aFilterObject.unitedGroupL10D3Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL10D3REFCOD = ? ";
        }
        if(aFilterObject.unitedGroupL10D4Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL10D4REFCOD = ? ";
        }
        if(aFilterObject.unitedGroupPS35Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPPS35REFCODE = ? ";
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
        if(aFilterObject.costLines04Building != null){
            number++;
            aFilterObject.costLines04Building = aFilterObject.costLines04Building.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costLines04Building);
        }
        if(aFilterObject.costLines04Building1 != null){
            number++;
            aFilterObject.costLines04Building1 = aFilterObject.costLines04Building1.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costLines04Building1);
        }
        if(aFilterObject.costLines04Building2 != null){
            number++;
            aFilterObject.costLines04Building2 = aFilterObject.costLines04Building2.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costLines04Building2);
        }
        if(aFilterObject.costLines04Building3 != null){
            number++;
            aFilterObject.costLines04Building3 = aFilterObject.costLines04Building3.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costLines04Building3);
        }
        if(aFilterObject.costLines10Building != null){
            number++;
            aFilterObject.costLines10Building = aFilterObject.costLines10Building.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costLines10Building);
        }
        if(aFilterObject.costLines10Building1 != null){
            number++;
            aFilterObject.costLines10Building1 = aFilterObject.costLines10Building1.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costLines10Building1);
        }
        if(aFilterObject.costLines10Building2 != null){
            number++;
            aFilterObject.costLines10Building2 = aFilterObject.costLines10Building2.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costLines10Building2);
        }
        if(aFilterObject.costLines10Building3 != null){
            number++;
            aFilterObject.costLines10Building3 = aFilterObject.costLines10Building3.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costLines10Building3);
        }
        if(aFilterObject.costLines10Building4 != null){
            number++;
            aFilterObject.costLines10Building4 = aFilterObject.costLines10Building4.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costLines10Building4);
        }
       if(aFilterObject.techCondServRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.techCondServRef.code);
       }
       if(aFilterObject.unitedGroupL04D1Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.unitedGroupL04D1Ref.code);
       }
       if(aFilterObject.unitedGroupL04D2Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.unitedGroupL04D2Ref.code);
       }
       if(aFilterObject.unitedGroupL04D3Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.unitedGroupL04D3Ref.code);
       }
       if(aFilterObject.unitedGroupTP04Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.unitedGroupTP04Ref.code);
       }
       if(aFilterObject.unitedGroupL10D1Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.unitedGroupL10D1Ref.code);
       }
       if(aFilterObject.unitedGroupL10D2Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.unitedGroupL10D2Ref.code);
       }
       if(aFilterObject.unitedGroupL10D3Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.unitedGroupL10D3Ref.code);
       }
       if(aFilterObject.unitedGroupL10D4Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.unitedGroupL10D4Ref.code);
       }
       if(aFilterObject.unitedGroupPS35Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.unitedGroupPS35Ref.code);
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

        anObject = new ENUnitedGroup2TechCondServicesShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.costLines04Building = set.getBigDecimal(2);
        if(anObject.costLines04Building != null)
            anObject.costLines04Building = anObject.costLines04Building.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.costLines04Building1 = set.getBigDecimal(3);
        if(anObject.costLines04Building1 != null)
            anObject.costLines04Building1 = anObject.costLines04Building1.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.costLines04Building2 = set.getBigDecimal(4);
        if(anObject.costLines04Building2 != null)
            anObject.costLines04Building2 = anObject.costLines04Building2.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.costLines04Building3 = set.getBigDecimal(5);
        if(anObject.costLines04Building3 != null)
            anObject.costLines04Building3 = anObject.costLines04Building3.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.costLines10Building = set.getBigDecimal(6);
        if(anObject.costLines10Building != null)
            anObject.costLines10Building = anObject.costLines10Building.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.costLines10Building1 = set.getBigDecimal(7);
        if(anObject.costLines10Building1 != null)
            anObject.costLines10Building1 = anObject.costLines10Building1.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.costLines10Building2 = set.getBigDecimal(8);
        if(anObject.costLines10Building2 != null)
            anObject.costLines10Building2 = anObject.costLines10Building2.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.costLines10Building3 = set.getBigDecimal(9);
        if(anObject.costLines10Building3 != null)
            anObject.costLines10Building3 = anObject.costLines10Building3.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.costLines10Building4 = set.getBigDecimal(10);
        if(anObject.costLines10Building4 != null)
            anObject.costLines10Building4 = anObject.costLines10Building4.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

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
        anObject.unitedGroupL04D1RefCode = set.getInt(35);
        if(set.wasNull())
        anObject.unitedGroupL04D1RefCode = Integer.MIN_VALUE;
        anObject.unitedGroupL04D1RefName = set.getString(36);
        anObject.unitedGroupL04D1RefDescription = set.getString(37);
        anObject.unitedGroupL04D2RefCode = set.getInt(38);
        if(set.wasNull())
        anObject.unitedGroupL04D2RefCode = Integer.MIN_VALUE;
        anObject.unitedGroupL04D2RefName = set.getString(39);
        anObject.unitedGroupL04D2RefDescription = set.getString(40);
        anObject.unitedGroupL04D3RefCode = set.getInt(41);
        if(set.wasNull())
        anObject.unitedGroupL04D3RefCode = Integer.MIN_VALUE;
        anObject.unitedGroupL04D3RefName = set.getString(42);
        anObject.unitedGroupL04D3RefDescription = set.getString(43);
        anObject.unitedGroupTP04RefCode = set.getInt(44);
        if(set.wasNull())
        anObject.unitedGroupTP04RefCode = Integer.MIN_VALUE;
        anObject.unitedGroupTP04RefName = set.getString(45);
        anObject.unitedGroupTP04RefDescription = set.getString(46);
        anObject.unitedGroupL10D1RefCode = set.getInt(47);
        if(set.wasNull())
        anObject.unitedGroupL10D1RefCode = Integer.MIN_VALUE;
        anObject.unitedGroupL10D1RefName = set.getString(48);
        anObject.unitedGroupL10D1RefDescription = set.getString(49);
        anObject.unitedGroupL10D2RefCode = set.getInt(50);
        if(set.wasNull())
        anObject.unitedGroupL10D2RefCode = Integer.MIN_VALUE;
        anObject.unitedGroupL10D2RefName = set.getString(51);
        anObject.unitedGroupL10D2RefDescription = set.getString(52);
        anObject.unitedGroupL10D3RefCode = set.getInt(53);
        if(set.wasNull())
        anObject.unitedGroupL10D3RefCode = Integer.MIN_VALUE;
        anObject.unitedGroupL10D3RefName = set.getString(54);
        anObject.unitedGroupL10D3RefDescription = set.getString(55);
        anObject.unitedGroupL10D4RefCode = set.getInt(56);
        if(set.wasNull())
        anObject.unitedGroupL10D4RefCode = Integer.MIN_VALUE;
        anObject.unitedGroupL10D4RefName = set.getString(57);
        anObject.unitedGroupL10D4RefDescription = set.getString(58);
        anObject.unitedGroupPS35RefCode = set.getInt(59);
        if(set.wasNull())
        anObject.unitedGroupPS35RefCode = Integer.MIN_VALUE;
        anObject.unitedGroupPS35RefName = set.getString(60);
        anObject.unitedGroupPS35RefDescription = set.getString(61);

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

  public int[] getFilteredCodeArrayOLD(ENUnitedGroup2TechCondServices aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENUNITDGRP2TCHCNDSRVCS.CODE FROM ENUNITDGRP2TCHCNDSRVCS";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENUNITDGRP2TCHCNDSRVCS.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.CODE = ?";
        }
        if(aFilterObject.costLines04Building != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING = ?";
        }
        if(aFilterObject.costLines04Building1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING1 = ?";
        }
        if(aFilterObject.costLines04Building2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING2 = ?";
        }
        if(aFilterObject.costLines04Building3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING3 = ?";
        }
        if(aFilterObject.costLines10Building != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING = ?";
        }
        if(aFilterObject.costLines10Building1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING1 = ?";
        }
        if(aFilterObject.costLines10Building2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING2 = ?";
        }
        if(aFilterObject.costLines10Building3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING3 = ?";
        }
        if(aFilterObject.costLines10Building4 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING4 = ?";
        }
        if(aFilterObject.techCondServRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENUNITDGRP2TCHCNDSRVCS.TECHCONDSERVREFCODE = ? ";
        }
        if(aFilterObject.unitedGroupL04D1Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL04D1REFCOD = ? ";
        }
        if(aFilterObject.unitedGroupL04D2Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL04D2REFCOD = ? ";
        }
        if(aFilterObject.unitedGroupL04D3Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL04D3REFCOD = ? ";
        }
        if(aFilterObject.unitedGroupTP04Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPTP04REFCODE = ? ";
        }
        if(aFilterObject.unitedGroupL10D1Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL10D1REFCOD = ? ";
        }
        if(aFilterObject.unitedGroupL10D2Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL10D2REFCOD = ? ";
        }
        if(aFilterObject.unitedGroupL10D3Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL10D3REFCOD = ? ";
        }
        if(aFilterObject.unitedGroupL10D4Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL10D4REFCOD = ? ";
        }
        if(aFilterObject.unitedGroupPS35Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPPS35REFCODE = ? ";
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
        if(aFilterObject.costLines04Building != null){
            number++;
            aFilterObject.costLines04Building = aFilterObject.costLines04Building.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costLines04Building);
        }
        if(aFilterObject.costLines04Building1 != null){
            number++;
            aFilterObject.costLines04Building1 = aFilterObject.costLines04Building1.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costLines04Building1);
        }
        if(aFilterObject.costLines04Building2 != null){
            number++;
            aFilterObject.costLines04Building2 = aFilterObject.costLines04Building2.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costLines04Building2);
        }
        if(aFilterObject.costLines04Building3 != null){
            number++;
            aFilterObject.costLines04Building3 = aFilterObject.costLines04Building3.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costLines04Building3);
        }
        if(aFilterObject.costLines10Building != null){
            number++;
            aFilterObject.costLines10Building = aFilterObject.costLines10Building.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costLines10Building);
        }
        if(aFilterObject.costLines10Building1 != null){
            number++;
            aFilterObject.costLines10Building1 = aFilterObject.costLines10Building1.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costLines10Building1);
        }
        if(aFilterObject.costLines10Building2 != null){
            number++;
            aFilterObject.costLines10Building2 = aFilterObject.costLines10Building2.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costLines10Building2);
        }
        if(aFilterObject.costLines10Building3 != null){
            number++;
            aFilterObject.costLines10Building3 = aFilterObject.costLines10Building3.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costLines10Building3);
        }
        if(aFilterObject.costLines10Building4 != null){
            number++;
            aFilterObject.costLines10Building4 = aFilterObject.costLines10Building4.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costLines10Building4);
        }
       if(aFilterObject.techCondServRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.techCondServRef.code);
       }
       if(aFilterObject.unitedGroupL04D1Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.unitedGroupL04D1Ref.code);
       }
       if(aFilterObject.unitedGroupL04D2Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.unitedGroupL04D2Ref.code);
       }
       if(aFilterObject.unitedGroupL04D3Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.unitedGroupL04D3Ref.code);
       }
       if(aFilterObject.unitedGroupTP04Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.unitedGroupTP04Ref.code);
       }
       if(aFilterObject.unitedGroupL10D1Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.unitedGroupL10D1Ref.code);
       }
       if(aFilterObject.unitedGroupL10D2Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.unitedGroupL10D2Ref.code);
       }
       if(aFilterObject.unitedGroupL10D3Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.unitedGroupL10D3Ref.code);
       }
       if(aFilterObject.unitedGroupL10D4Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.unitedGroupL10D4Ref.code);
       }
       if(aFilterObject.unitedGroupPS35Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.unitedGroupPS35Ref.code);
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

  public int[] getFilteredCodeArray(ENUnitedGroup2TechCondServicesFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENUnitedGroup2TechCondServices aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENUNITDGRP2TCHCNDSRVCS.CODE FROM ENUNITDGRP2TCHCNDSRVCS";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENUNITDGRP2TCHCNDSRVCS.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.CODE = ?";
        }
        if(aFilterObject.costLines04Building != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING = ?";
        }
        if(aFilterObject.costLines04Building1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING1 = ?";
        }
        if(aFilterObject.costLines04Building2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING2 = ?";
        }
        if(aFilterObject.costLines04Building3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING3 = ?";
        }
        if(aFilterObject.costLines10Building != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING = ?";
        }
        if(aFilterObject.costLines10Building1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING1 = ?";
        }
        if(aFilterObject.costLines10Building2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING2 = ?";
        }
        if(aFilterObject.costLines10Building3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING3 = ?";
        }
        if(aFilterObject.costLines10Building4 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING4 = ?";
        }
        if(aFilterObject.techCondServRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENUNITDGRP2TCHCNDSRVCS.TECHCONDSERVREFCODE = ? ";
        }
        if(aFilterObject.unitedGroupL04D1Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL04D1REFCOD = ? ";
        }
        if(aFilterObject.unitedGroupL04D2Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL04D2REFCOD = ? ";
        }
        if(aFilterObject.unitedGroupL04D3Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL04D3REFCOD = ? ";
        }
        if(aFilterObject.unitedGroupTP04Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPTP04REFCODE = ? ";
        }
        if(aFilterObject.unitedGroupL10D1Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL10D1REFCOD = ? ";
        }
        if(aFilterObject.unitedGroupL10D2Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL10D2REFCOD = ? ";
        }
        if(aFilterObject.unitedGroupL10D3Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL10D3REFCOD = ? ";
        }
        if(aFilterObject.unitedGroupL10D4Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL10D4REFCOD = ? ";
        }
        if(aFilterObject.unitedGroupPS35Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPPS35REFCODE = ? ";
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
        if(aFilterObject.costLines04Building != null){
            number++;
            aFilterObject.costLines04Building = aFilterObject.costLines04Building.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costLines04Building);
        }
        if(aFilterObject.costLines04Building1 != null){
            number++;
            aFilterObject.costLines04Building1 = aFilterObject.costLines04Building1.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costLines04Building1);
        }
        if(aFilterObject.costLines04Building2 != null){
            number++;
            aFilterObject.costLines04Building2 = aFilterObject.costLines04Building2.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costLines04Building2);
        }
        if(aFilterObject.costLines04Building3 != null){
            number++;
            aFilterObject.costLines04Building3 = aFilterObject.costLines04Building3.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costLines04Building3);
        }
        if(aFilterObject.costLines10Building != null){
            number++;
            aFilterObject.costLines10Building = aFilterObject.costLines10Building.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costLines10Building);
        }
        if(aFilterObject.costLines10Building1 != null){
            number++;
            aFilterObject.costLines10Building1 = aFilterObject.costLines10Building1.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costLines10Building1);
        }
        if(aFilterObject.costLines10Building2 != null){
            number++;
            aFilterObject.costLines10Building2 = aFilterObject.costLines10Building2.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costLines10Building2);
        }
        if(aFilterObject.costLines10Building3 != null){
            number++;
            aFilterObject.costLines10Building3 = aFilterObject.costLines10Building3.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costLines10Building3);
        }
        if(aFilterObject.costLines10Building4 != null){
            number++;
            aFilterObject.costLines10Building4 = aFilterObject.costLines10Building4.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.costLines10Building4);
        }
       if(aFilterObject.techCondServRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.techCondServRef.code);
       }
       if(aFilterObject.unitedGroupL04D1Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.unitedGroupL04D1Ref.code);
       }
       if(aFilterObject.unitedGroupL04D2Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.unitedGroupL04D2Ref.code);
       }
       if(aFilterObject.unitedGroupL04D3Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.unitedGroupL04D3Ref.code);
       }
       if(aFilterObject.unitedGroupTP04Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.unitedGroupTP04Ref.code);
       }
       if(aFilterObject.unitedGroupL10D1Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.unitedGroupL10D1Ref.code);
       }
       if(aFilterObject.unitedGroupL10D2Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.unitedGroupL10D2Ref.code);
       }
       if(aFilterObject.unitedGroupL10D3Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.unitedGroupL10D3Ref.code);
       }
       if(aFilterObject.unitedGroupL10D4Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.unitedGroupL10D4Ref.code);
       }
       if(aFilterObject.unitedGroupPS35Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.unitedGroupPS35Ref.code);
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


   public ENUnitedGroup2TechCondServices getObject(int uid) throws PersistenceException
   {
    ENUnitedGroup2TechCondServices result = new ENUnitedGroup2TechCondServices();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENUnitedGroup2TechCondServices anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENUNITDGRP2TCHCNDSRVCS.CODE, ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING, ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING1, ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING2, ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING3, ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING, ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING1, ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING2, ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING3, ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING4, ENUNITDGRP2TCHCNDSRVCS.TECHCONDSERVREFCODE, ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL04D1REFCOD, ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL04D2REFCOD, ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL04D3REFCOD, ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPTP04REFCODE, ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL10D1REFCOD, ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL10D2REFCOD, ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL10D3REFCOD, ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPL10D4REFCOD, ENUNITDGRP2TCHCNDSRVCS.UNITEDGROUPPS35REFCODE "
    +" FROM ENUNITDGRP2TCHCNDSRVCS WHERE ENUNITDGRP2TCHCNDSRVCS.CODE = ?";

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
        anObject.costLines04Building = set.getBigDecimal(2);
        if(anObject.costLines04Building != null)
            anObject.costLines04Building = anObject.costLines04Building.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.costLines04Building1 = set.getBigDecimal(3);
        if(anObject.costLines04Building1 != null)
            anObject.costLines04Building1 = anObject.costLines04Building1.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.costLines04Building2 = set.getBigDecimal(4);
        if(anObject.costLines04Building2 != null)
            anObject.costLines04Building2 = anObject.costLines04Building2.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.costLines04Building3 = set.getBigDecimal(5);
        if(anObject.costLines04Building3 != null)
            anObject.costLines04Building3 = anObject.costLines04Building3.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.costLines10Building = set.getBigDecimal(6);
        if(anObject.costLines10Building != null)
            anObject.costLines10Building = anObject.costLines10Building.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.costLines10Building1 = set.getBigDecimal(7);
        if(anObject.costLines10Building1 != null)
            anObject.costLines10Building1 = anObject.costLines10Building1.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.costLines10Building2 = set.getBigDecimal(8);
        if(anObject.costLines10Building2 != null)
            anObject.costLines10Building2 = anObject.costLines10Building2.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.costLines10Building3 = set.getBigDecimal(9);
        if(anObject.costLines10Building3 != null)
            anObject.costLines10Building3 = anObject.costLines10Building3.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.costLines10Building4 = set.getBigDecimal(10);
        if(anObject.costLines10Building4 != null)
            anObject.costLines10Building4 = anObject.costLines10Building4.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techCondServRef.code = set.getInt(11);
        if ( set.wasNull() )
            anObject.techCondServRef.code = Integer.MIN_VALUE;
        anObject.unitedGroupL04D1Ref.code = set.getInt(12);
        if ( set.wasNull() )
            anObject.unitedGroupL04D1Ref.code = Integer.MIN_VALUE;
        anObject.unitedGroupL04D2Ref.code = set.getInt(13);
        if ( set.wasNull() )
            anObject.unitedGroupL04D2Ref.code = Integer.MIN_VALUE;
        anObject.unitedGroupL04D3Ref.code = set.getInt(14);
        if ( set.wasNull() )
            anObject.unitedGroupL04D3Ref.code = Integer.MIN_VALUE;
        anObject.unitedGroupTP04Ref.code = set.getInt(15);
        if ( set.wasNull() )
            anObject.unitedGroupTP04Ref.code = Integer.MIN_VALUE;
        anObject.unitedGroupL10D1Ref.code = set.getInt(16);
        if ( set.wasNull() )
            anObject.unitedGroupL10D1Ref.code = Integer.MIN_VALUE;
        anObject.unitedGroupL10D2Ref.code = set.getInt(17);
        if ( set.wasNull() )
            anObject.unitedGroupL10D2Ref.code = Integer.MIN_VALUE;
        anObject.unitedGroupL10D3Ref.code = set.getInt(18);
        if ( set.wasNull() )
            anObject.unitedGroupL10D3Ref.code = Integer.MIN_VALUE;
        anObject.unitedGroupL10D4Ref.code = set.getInt(19);
        if ( set.wasNull() )
            anObject.unitedGroupL10D4Ref.code = Integer.MIN_VALUE;
        anObject.unitedGroupPS35Ref.code = set.getInt(20);
        if ( set.wasNull() )
            anObject.unitedGroupPS35Ref.code = Integer.MIN_VALUE;
        if(anObject.techCondServRef.code != Integer.MIN_VALUE)
        {
           anObject.setTechCondServRef(
        new com.ksoe.energynet.dataminer.generated.ENTechConditionsServicesDAOGen(connection,getUserProfile()).getRef(anObject.techCondServRef.code));
    }
        if(anObject.unitedGroupL04D1Ref.code != Integer.MIN_VALUE)
        {
           anObject.setUnitedGroupL04D1Ref(
        new com.ksoe.energynet.dataminer.generated.ENUnitedGroupConnectionsDAOGen(connection,getUserProfile()).getRef(anObject.unitedGroupL04D1Ref.code));
    }
        if(anObject.unitedGroupL04D2Ref.code != Integer.MIN_VALUE)
        {
           anObject.setUnitedGroupL04D2Ref(
        new com.ksoe.energynet.dataminer.generated.ENUnitedGroupConnectionsDAOGen(connection,getUserProfile()).getRef(anObject.unitedGroupL04D2Ref.code));
    }
        if(anObject.unitedGroupL04D3Ref.code != Integer.MIN_VALUE)
        {
           anObject.setUnitedGroupL04D3Ref(
        new com.ksoe.energynet.dataminer.generated.ENUnitedGroupConnectionsDAOGen(connection,getUserProfile()).getRef(anObject.unitedGroupL04D3Ref.code));
    }
        if(anObject.unitedGroupTP04Ref.code != Integer.MIN_VALUE)
        {
           anObject.setUnitedGroupTP04Ref(
        new com.ksoe.energynet.dataminer.generated.ENUnitedGroupConnectionsDAOGen(connection,getUserProfile()).getRef(anObject.unitedGroupTP04Ref.code));
    }
        if(anObject.unitedGroupL10D1Ref.code != Integer.MIN_VALUE)
        {
           anObject.setUnitedGroupL10D1Ref(
        new com.ksoe.energynet.dataminer.generated.ENUnitedGroupConnectionsDAOGen(connection,getUserProfile()).getRef(anObject.unitedGroupL10D1Ref.code));
    }
        if(anObject.unitedGroupL10D2Ref.code != Integer.MIN_VALUE)
        {
           anObject.setUnitedGroupL10D2Ref(
        new com.ksoe.energynet.dataminer.generated.ENUnitedGroupConnectionsDAOGen(connection,getUserProfile()).getRef(anObject.unitedGroupL10D2Ref.code));
    }
        if(anObject.unitedGroupL10D3Ref.code != Integer.MIN_VALUE)
        {
           anObject.setUnitedGroupL10D3Ref(
        new com.ksoe.energynet.dataminer.generated.ENUnitedGroupConnectionsDAOGen(connection,getUserProfile()).getRef(anObject.unitedGroupL10D3Ref.code));
    }
        if(anObject.unitedGroupL10D4Ref.code != Integer.MIN_VALUE)
        {
           anObject.setUnitedGroupL10D4Ref(
        new com.ksoe.energynet.dataminer.generated.ENUnitedGroupConnectionsDAOGen(connection,getUserProfile()).getRef(anObject.unitedGroupL10D4Ref.code));
    }
        if(anObject.unitedGroupPS35Ref.code != Integer.MIN_VALUE)
        {
           anObject.setUnitedGroupPS35Ref(
        new com.ksoe.energynet.dataminer.generated.ENUnitedGroupConnectionsDAOGen(connection,getUserProfile()).getRef(anObject.unitedGroupPS35Ref.code));
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


  public com.ksoe.energynet.valueobject.references.ENUnitedGroup2TechCondServicesRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENUnitedGroup2TechCondServicesRef ref = new com.ksoe.energynet.valueobject.references.ENUnitedGroup2TechCondServicesRef();
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

    selectStr = "DELETE FROM  ENUNITDGRP2TCHCNDSRVCS WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENUnitedGroup2TechCondServices object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENUnitedGroup2TechCondServices.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENUnitedGroup2TechCondServices.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENUnitedGroup2TechCondServices.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENUnitedGroup2TechCondServices.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENUnitedGroup2TechCondServices.getObject%} access denied");

    selectStr =

    "SELECT  ENUNITDGRP2TCHCNDSRVCS.CODE FROM  ENUNITDGRP2TCHCNDSRVCS WHERE  ENUNITDGRP2TCHCNDSRVCS.CODE = ?";
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
    _checkConditionToken(condition,"code","ENUNITDGRP2TCHCNDSRVCS.CODE");
    _checkConditionToken(condition,"costlines04building","ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING");
    _checkConditionToken(condition,"costlines04building1","ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING1");
    _checkConditionToken(condition,"costlines04building2","ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING2");
    _checkConditionToken(condition,"costlines04building3","ENUNITDGRP2TCHCNDSRVCS.COSTLINES04BUILDING3");
    _checkConditionToken(condition,"costlines10building","ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING");
    _checkConditionToken(condition,"costlines10building1","ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING1");
    _checkConditionToken(condition,"costlines10building2","ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING2");
    _checkConditionToken(condition,"costlines10building3","ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING3");
    _checkConditionToken(condition,"costlines10building4","ENUNITDGRP2TCHCNDSRVCS.COSTLINES10BUILDING4");
      // relationship conditions
    _checkConditionToken(condition,"techcondservref","TECHCONDSERVREFCODE");
    _checkConditionToken(condition,"techcondservref.code","TECHCONDSERVREFCODE");
    _checkConditionToken(condition,"unitedgroupl04d1ref","UNITEDGROUPL04D1REFCOD");
    _checkConditionToken(condition,"unitedgroupl04d1ref.code","UNITEDGROUPL04D1REFCOD");
    _checkConditionToken(condition,"unitedgroupl04d2ref","UNITEDGROUPL04D2REFCOD");
    _checkConditionToken(condition,"unitedgroupl04d2ref.code","UNITEDGROUPL04D2REFCOD");
    _checkConditionToken(condition,"unitedgroupl04d3ref","UNITEDGROUPL04D3REFCOD");
    _checkConditionToken(condition,"unitedgroupl04d3ref.code","UNITEDGROUPL04D3REFCOD");
    _checkConditionToken(condition,"unitedgrouptp04ref","UNITEDGROUPTP04REFCODE");
    _checkConditionToken(condition,"unitedgrouptp04ref.code","UNITEDGROUPTP04REFCODE");
    _checkConditionToken(condition,"unitedgroupl10d1ref","UNITEDGROUPL10D1REFCOD");
    _checkConditionToken(condition,"unitedgroupl10d1ref.code","UNITEDGROUPL10D1REFCOD");
    _checkConditionToken(condition,"unitedgroupl10d2ref","UNITEDGROUPL10D2REFCOD");
    _checkConditionToken(condition,"unitedgroupl10d2ref.code","UNITEDGROUPL10D2REFCOD");
    _checkConditionToken(condition,"unitedgroupl10d3ref","UNITEDGROUPL10D3REFCOD");
    _checkConditionToken(condition,"unitedgroupl10d3ref.code","UNITEDGROUPL10D3REFCOD");
    _checkConditionToken(condition,"unitedgroupl10d4ref","UNITEDGROUPL10D4REFCOD");
    _checkConditionToken(condition,"unitedgroupl10d4ref.code","UNITEDGROUPL10D4REFCOD");
    _checkConditionToken(condition,"unitedgroupps35ref","UNITEDGROUPPS35REFCODE");
    _checkConditionToken(condition,"unitedgroupps35ref.code","UNITEDGROUPPS35REFCODE");
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

   private void _collectAutoIncrementFields(ENUnitedGroup2TechCondServices anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("ENUNITDGRP2TCHCNDSRVCS", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("ENUNITDGRP2TCHCNDSRVCS", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("ENUNITDGRP2TCHCNDSRVCS", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: ENUNITDGRP2TCHCNDSRVCS");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of ENUnitedGroup2TechCondServicesDAO

