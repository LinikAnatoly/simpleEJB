
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer.generated;

import com.ksoe.lla.persistence.GenericDataMiner;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;


import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
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

import com.ksoe.energynet.valueobject.ENTransportRealFuelRemains;
import com.ksoe.energynet.valueobject.filter.ENTransportRealFuelRemainsFilter;
import com.ksoe.energynet.valueobject.brief.ENTransportRealFuelRemainsShort;
import com.ksoe.energynet.valueobject.lists.ENTransportRealFuelRemainsShortList;

import com.ksoe.techcard.dataminer.TKFuelTypeDAO;
import com.ksoe.techcard.dataminer.TKTransportRealDAO;

/**
 * DAO Object for ENTransportRealFuelRemains;
 *
 */

public class ENTransportRealFuelRemainsDAOGen extends GenericDataMiner {

  public ENTransportRealFuelRemainsDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTransportRealFuelRemainsDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENTransportRealFuelRemains inObject) throws PersistenceException
   {
      ENTransportRealFuelRemains obj = new ENTransportRealFuelRemains();
      obj.code = inObject.code;
      loadObject(obj);

     if ( ! inObject.dateStart.equals(obj.dateStart)){
       return false;
     }

     if ( ! inObject.dateFinal.equals(obj.dateFinal)){
       return false;
     }

     if ( ! inObject.countGenStart.equals(obj.countGenStart)){
       return false;
     }

     if ( ! inObject.priceGenStart.equals(obj.priceGenStart)){
       return false;
     }

     if ( ! inObject.sumGenStart.equals(obj.sumGenStart)){
       return false;
     }

     if ( ! inObject.countGenIn.equals(obj.countGenIn)){
       return false;
     }

     if ( ! inObject.priceGenIn.equals(obj.priceGenIn)){
       return false;
     }

     if ( ! inObject.sumGenIn.equals(obj.sumGenIn)){
       return false;
     }

     if ( ! inObject.countGenOut.equals(obj.countGenOut)){
       return false;
     }

     if ( ! inObject.priceGenOut.equals(obj.priceGenOut)){
       return false;
     }

     if ( ! inObject.sumGenOut.equals(obj.sumGenOut)){
       return false;
     }

     if ( ! inObject.countGenFinal.equals(obj.countGenFinal)){
       return false;
     }

     if ( ! inObject.priceGenFinal.equals(obj.priceGenFinal)){
       return false;
     }

     if ( ! inObject.sumGenFinal.equals(obj.sumGenFinal)){
       return false;
     }
     if (inObject.fuelTypeRef.code != obj.fuelTypeRef.code){
        return false;
     }
     if (inObject.realTransport.code != obj.realTransport.code){
        return false;
     }
     if (inObject.travelSheetFuelTypeRef.code != obj.travelSheetFuelTypeRef.code){
        return false;
     }
      return true;
   }

   public int add(ENTransportRealFuelRemains anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENTransportRealFuelRemains anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

	anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENTRANSPORTREALFULRMNS (CODE,DATESTART,DATEFINAL,COUNTGENSTART,PRICEGENSTART,SUMGENSTART,COUNTGENIN,PRICEGENIN,SUMGENIN,COUNTGENOUT,PRICEGENOUT,SUMGENOUT,COUNTGENFINAL,PRICEGENFINAL,SUMGENFINAL,MODIFY_TIME,FUELTYPEREFCODE,REALTRANSPORTCODE,TRAVELSHEETFUELTYPRFCD) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.dateStart == null)
        statement.setDate(2,null);
      else
        statement.setDate(2,new java.sql.Date(anObject.dateStart.getTime()));
      if (anObject.dateFinal == null)
        statement.setDate(3,null);
      else
        statement.setDate(3,new java.sql.Date(anObject.dateFinal.getTime()));
      if (anObject.countGenStart != null)
        anObject.countGenStart = anObject.countGenStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.countGenStart);
      if (anObject.priceGenStart != null)
        anObject.priceGenStart = anObject.priceGenStart.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.priceGenStart);
      if (anObject.sumGenStart != null)
        anObject.sumGenStart = anObject.sumGenStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.sumGenStart);
      if (anObject.countGenIn != null)
        anObject.countGenIn = anObject.countGenIn.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.countGenIn);
      if (anObject.priceGenIn != null)
        anObject.priceGenIn = anObject.priceGenIn.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.priceGenIn);
      if (anObject.sumGenIn != null)
        anObject.sumGenIn = anObject.sumGenIn.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(9,anObject.sumGenIn);
      if (anObject.countGenOut != null)
        anObject.countGenOut = anObject.countGenOut.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(10,anObject.countGenOut);
      if (anObject.priceGenOut != null)
        anObject.priceGenOut = anObject.priceGenOut.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(11,anObject.priceGenOut);
      if (anObject.sumGenOut != null)
        anObject.sumGenOut = anObject.sumGenOut.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(12,anObject.sumGenOut);
      if (anObject.countGenFinal != null)
        anObject.countGenFinal = anObject.countGenFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(13,anObject.countGenFinal);
      if (anObject.priceGenFinal != null)
        anObject.priceGenFinal = anObject.priceGenFinal.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(14,anObject.priceGenFinal);
      if (anObject.sumGenFinal != null)
        anObject.sumGenFinal = anObject.sumGenFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(15,anObject.sumGenFinal);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(16,null);
      else
        statement.setBigDecimal(16,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.fuelTypeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKFuelTypeDAOGen(connection,getUserProfile()).exists(anObject.fuelTypeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENTransportRealFuelRemains.fuelTypeRef.code%} = {%"+anObject.fuelTypeRef.code+"%}");
        statement.setInt(17,anObject.fuelTypeRef.code);
      }
      else
        statement.setNull(17,java.sql.Types.INTEGER);
      if (anObject.realTransport.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).exists(anObject.realTransport.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENTransportRealFuelRemains.realTransport.code%} = {%"+anObject.realTransport.code+"%}");
        statement.setInt(18,anObject.realTransport.code);
      }
      else
        statement.setNull(18,java.sql.Types.INTEGER);
      if (anObject.travelSheetFuelTypeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTravelSheetFuelTypeDAOGen(connection,getUserProfile()).exists(anObject.travelSheetFuelTypeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTransportRealFuelRemains.travelSheetFuelTypeRef.code%} = {%"+anObject.travelSheetFuelTypeRef.code+"%}");
        statement.setInt(19,anObject.travelSheetFuelTypeRef.code);
      }
      else
        statement.setNull(19,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENTransportRealFuelRemainsDAOGen.add%}",e);
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

   public void save(ENTransportRealFuelRemains anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENTransportRealFuelRemains anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENTransportRealFuelRemains oldObject = new ENTransportRealFuelRemains();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENTransportRealFuelRemains.modify_time_Field+" FROM  ENTRANSPORTREALFULRMNS WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("COUNTGENSTART") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PRICEGENSTART") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUMGENSTART") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COUNTGENIN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PRICEGENIN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUMGENIN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COUNTGENOUT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PRICEGENOUT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUMGENOUT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COUNTGENFINAL") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PRICEGENFINAL") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUMGENFINAL") == 0)
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
          if(fieldNameStr.compareTo("FUELTYPEREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("REALTRANSPORT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TRAVELSHEETFUELTYPEREF") == 0)
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
        "UPDATE ENTRANSPORTREALFULRMNS SET  DATESTART = ? , DATEFINAL = ? , COUNTGENSTART = ? , PRICEGENSTART = ? , SUMGENSTART = ? , COUNTGENIN = ? , PRICEGENIN = ? , SUMGENIN = ? , COUNTGENOUT = ? , PRICEGENOUT = ? , SUMGENOUT = ? , COUNTGENFINAL = ? , PRICEGENFINAL = ? , SUMGENFINAL = ? , MODIFY_TIME = ? , FUELTYPEREFCODE = ? , REALTRANSPORTCODE = ? , TRAVELSHEETFUELTYPRFCD = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENTRANSPORTREALFUELREMAINS SET ";
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
      if (anObject.dateStart == null)
        statement.setDate(1,null);
      else
        statement.setDate(1,new java.sql.Date(anObject.dateStart.getTime()));
      if (anObject.dateFinal == null)
        statement.setDate(2,null);
      else
        statement.setDate(2,new java.sql.Date(anObject.dateFinal.getTime()));
      if (anObject.countGenStart != null)
        anObject.countGenStart = anObject.countGenStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.countGenStart);
      if (anObject.priceGenStart != null)
        anObject.priceGenStart = anObject.priceGenStart.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.priceGenStart);
      if (anObject.sumGenStart != null)
        anObject.sumGenStart = anObject.sumGenStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.sumGenStart);
      if (anObject.countGenIn != null)
        anObject.countGenIn = anObject.countGenIn.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.countGenIn);
      if (anObject.priceGenIn != null)
        anObject.priceGenIn = anObject.priceGenIn.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.priceGenIn);
      if (anObject.sumGenIn != null)
        anObject.sumGenIn = anObject.sumGenIn.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.sumGenIn);
      if (anObject.countGenOut != null)
        anObject.countGenOut = anObject.countGenOut.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(9,anObject.countGenOut);
      if (anObject.priceGenOut != null)
        anObject.priceGenOut = anObject.priceGenOut.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(10,anObject.priceGenOut);
      if (anObject.sumGenOut != null)
        anObject.sumGenOut = anObject.sumGenOut.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(11,anObject.sumGenOut);
      if (anObject.countGenFinal != null)
        anObject.countGenFinal = anObject.countGenFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(12,anObject.countGenFinal);
      if (anObject.priceGenFinal != null)
        anObject.priceGenFinal = anObject.priceGenFinal.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(13,anObject.priceGenFinal);
      if (anObject.sumGenFinal != null)
        anObject.sumGenFinal = anObject.sumGenFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(14,anObject.sumGenFinal);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(15,null);
      else
        statement.setBigDecimal(15,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.fuelTypeRef.code != Integer.MIN_VALUE)
        statement.setInt(16,anObject.fuelTypeRef.code);
      else
        statement.setNull(16,java.sql.Types.INTEGER);
      if (anObject.realTransport.code != Integer.MIN_VALUE)
        statement.setInt(17,anObject.realTransport.code);
      else
        statement.setNull(17,java.sql.Types.INTEGER);
      if (anObject.travelSheetFuelTypeRef.code != Integer.MIN_VALUE)
        statement.setInt(18,anObject.travelSheetFuelTypeRef.code);
      else
        statement.setNull(18,java.sql.Types.INTEGER);
          statement.setInt(19,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
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
            if("COUNTGENSTART".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.countGenStart != null)
                    anObject.countGenStart = anObject.countGenStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.countGenStart);
                continue;
             }
            if("PRICEGENSTART".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.priceGenStart != null)
                    anObject.priceGenStart = anObject.priceGenStart.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.priceGenStart);
                continue;
             }
            if("SUMGENSTART".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sumGenStart != null)
                    anObject.sumGenStart = anObject.sumGenStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sumGenStart);
                continue;
             }
            if("COUNTGENIN".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.countGenIn != null)
                    anObject.countGenIn = anObject.countGenIn.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.countGenIn);
                continue;
             }
            if("PRICEGENIN".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.priceGenIn != null)
                    anObject.priceGenIn = anObject.priceGenIn.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.priceGenIn);
                continue;
             }
            if("SUMGENIN".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sumGenIn != null)
                    anObject.sumGenIn = anObject.sumGenIn.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sumGenIn);
                continue;
             }
            if("COUNTGENOUT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.countGenOut != null)
                    anObject.countGenOut = anObject.countGenOut.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.countGenOut);
                continue;
             }
            if("PRICEGENOUT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.priceGenOut != null)
                    anObject.priceGenOut = anObject.priceGenOut.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.priceGenOut);
                continue;
             }
            if("SUMGENOUT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sumGenOut != null)
                    anObject.sumGenOut = anObject.sumGenOut.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sumGenOut);
                continue;
             }
            if("COUNTGENFINAL".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.countGenFinal != null)
                    anObject.countGenFinal = anObject.countGenFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.countGenFinal);
                continue;
             }
            if("PRICEGENFINAL".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.priceGenFinal != null)
                    anObject.priceGenFinal = anObject.priceGenFinal.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.priceGenFinal);
                continue;
             }
            if("SUMGENFINAL".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sumGenFinal != null)
                    anObject.sumGenFinal = anObject.sumGenFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sumGenFinal);
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
            if("FUELTYPEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.fuelTypeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.fuelTypeRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("REALTRANSPORT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.realTransport.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.realTransport.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("TRAVELSHEETFUELTYPEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.travelSheetFuelTypeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.travelSheetFuelTypeRef.code);
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

   } // end of save(ENTransportRealFuelRemains anObject,String[] anAttributes)


 public ENTransportRealFuelRemainsShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENTransportRealFuelRemains filterObject = new ENTransportRealFuelRemains();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENTransportRealFuelRemainsShort)list.get(0);
   return null;
  }

  public ENTransportRealFuelRemainsShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENTransportRealFuelRemainsShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENTransportRealFuelRemainsShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENTransportRealFuelRemainsShortList getFilteredList(ENTransportRealFuelRemains filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENTransportRealFuelRemainsShortList getScrollableFilteredList(ENTransportRealFuelRemains aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENTransportRealFuelRemainsShortList getScrollableFilteredList(ENTransportRealFuelRemains aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENTransportRealFuelRemainsShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENTransportRealFuelRemainsShortList getScrollableFilteredList(ENTransportRealFuelRemainsFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENTransportRealFuelRemainsShortList getScrollableFilteredList(ENTransportRealFuelRemainsFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENTransportRealFuelRemainsShortList getScrollableFilteredList(ENTransportRealFuelRemains aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENTransportRealFuelRemainsShortList getScrollableFilteredList(ENTransportRealFuelRemains aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENTransportRealFuelRemainsShortList result = new ENTransportRealFuelRemainsShortList();
    ENTransportRealFuelRemainsShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRANSPORTREALFULRMNS.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENTRANSPORTREALFULRMNS.CODE"+
     ",ENTRANSPORTREALFULRMNS.DATESTART"+
     ",ENTRANSPORTREALFULRMNS.DATEFINAL"+
     ",ENTRANSPORTREALFULRMNS.COUNTGENSTART"+
     ",ENTRANSPORTREALFULRMNS.PRICEGENSTART"+
     ",ENTRANSPORTREALFULRMNS.SUMGENSTART"+
     ",ENTRANSPORTREALFULRMNS.COUNTGENIN"+
     ",ENTRANSPORTREALFULRMNS.PRICEGENIN"+
     ",ENTRANSPORTREALFULRMNS.SUMGENIN"+
     ",ENTRANSPORTREALFULRMNS.COUNTGENOUT"+
     ",ENTRANSPORTREALFULRMNS.PRICEGENOUT"+
     ",ENTRANSPORTREALFULRMNS.SUMGENOUT"+
     ",ENTRANSPORTREALFULRMNS.COUNTGENFINAL"+
     ",ENTRANSPORTREALFULRMNS.PRICEGENFINAL"+
     ",ENTRANSPORTREALFULRMNS.SUMGENFINAL"+

      ", TKFUELTYPE.CODE " +
      ", TKFUELTYPE.NAME " +
      ", TKTRANSPORTREAL.CODE " +
      ", TKTRANSPORTREAL.NAME " +
      ", TKTRANSPORTREAL.INVNUMBER " +
      ", TKTRANSPORTREAL.GOSNUMBER " +
     ", ENTRANSPORTREALFULRMNS.TRAVELSHEETFUELTYPRFCD" +
     " FROM ENTRANSPORTREALFULRMNS " +
     ", TKFUELTYPE " +
     ", TKTRANSPORTREAL " +
     //" WHERE "
	"";
     whereStr = " TKFUELTYPE.CODE = ENTRANSPORTREALFULRMNS.FUELTYPEREFCODE" ; //+
      whereStr = whereStr +" AND TKTRANSPORTREAL.CODE = ENTRANSPORTREALFULRMNS.REALTRANSPORTCODE" ; //+
		//selectStr = selectStr + " ${s} ENTRANSPORTREALFULRMNS.CODE IN ( SELECT ENTRANSPORTREALFULRMNS.CODE FROM ENTRANSPORTREALFULRMNS ";

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.CODE = ?";
        }
        if(aFilterObject.dateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.DATESTART = ?";
        }
        if(aFilterObject.dateFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.DATEFINAL = ?";
        }
        if(aFilterObject.countGenStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.COUNTGENSTART = ?";
        }
        if(aFilterObject.priceGenStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.PRICEGENSTART = ?";
        }
        if(aFilterObject.sumGenStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.SUMGENSTART = ?";
        }
        if(aFilterObject.countGenIn != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.COUNTGENIN = ?";
        }
        if(aFilterObject.priceGenIn != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.PRICEGENIN = ?";
        }
        if(aFilterObject.sumGenIn != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.SUMGENIN = ?";
        }
        if(aFilterObject.countGenOut != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.COUNTGENOUT = ?";
        }
        if(aFilterObject.priceGenOut != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.PRICEGENOUT = ?";
        }
        if(aFilterObject.sumGenOut != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.SUMGENOUT = ?";
        }
        if(aFilterObject.countGenFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.COUNTGENFINAL = ?";
        }
        if(aFilterObject.priceGenFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.PRICEGENFINAL = ?";
        }
        if(aFilterObject.sumGenFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.SUMGENFINAL = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.MODIFY_TIME = ?";
        }
        if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPORTREALFULRMNS.FUELTYPEREFCODE = ? ";
        }
        if(aFilterObject.realTransport.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPORTREALFULRMNS.REALTRANSPORTCODE = ? ";
        }
        if(aFilterObject.travelSheetFuelTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPORTREALFULRMNS.TRAVELSHEETFUELTYPRFCD = ? ";
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
        if(aFilterObject.dateStart != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
        }
        if(aFilterObject.countGenStart != null){
            number++;
            aFilterObject.countGenStart = aFilterObject.countGenStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGenStart);
        }
        if(aFilterObject.priceGenStart != null){
            number++;
            aFilterObject.priceGenStart = aFilterObject.priceGenStart.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.priceGenStart);
        }
        if(aFilterObject.sumGenStart != null){
            number++;
            aFilterObject.sumGenStart = aFilterObject.sumGenStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGenStart);
        }
        if(aFilterObject.countGenIn != null){
            number++;
            aFilterObject.countGenIn = aFilterObject.countGenIn.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGenIn);
        }
        if(aFilterObject.priceGenIn != null){
            number++;
            aFilterObject.priceGenIn = aFilterObject.priceGenIn.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.priceGenIn);
        }
        if(aFilterObject.sumGenIn != null){
            number++;
            aFilterObject.sumGenIn = aFilterObject.sumGenIn.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGenIn);
        }
        if(aFilterObject.countGenOut != null){
            number++;
            aFilterObject.countGenOut = aFilterObject.countGenOut.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGenOut);
        }
        if(aFilterObject.priceGenOut != null){
            number++;
            aFilterObject.priceGenOut = aFilterObject.priceGenOut.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.priceGenOut);
        }
        if(aFilterObject.sumGenOut != null){
            number++;
            aFilterObject.sumGenOut = aFilterObject.sumGenOut.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGenOut);
        }
        if(aFilterObject.countGenFinal != null){
            number++;
            aFilterObject.countGenFinal = aFilterObject.countGenFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGenFinal);
        }
        if(aFilterObject.priceGenFinal != null){
            number++;
            aFilterObject.priceGenFinal = aFilterObject.priceGenFinal.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.priceGenFinal);
        }
        if(aFilterObject.sumGenFinal != null){
            number++;
            aFilterObject.sumGenFinal = aFilterObject.sumGenFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGenFinal);
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fuelTypeRef.code);
       }
       if(aFilterObject.realTransport.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.realTransport.code);
       }
       if(aFilterObject.travelSheetFuelTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.travelSheetFuelTypeRef.code);
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

        anObject = new ENTransportRealFuelRemainsShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.dateStart = set.getDate(2);
        anObject.dateFinal = set.getDate(3);
        anObject.countGenStart = set.getBigDecimal(4);
        if(anObject.countGenStart != null)
            anObject.countGenStart = anObject.countGenStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.priceGenStart = set.getBigDecimal(5);
        if(anObject.priceGenStart != null)
            anObject.priceGenStart = anObject.priceGenStart.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumGenStart = set.getBigDecimal(6);
        if(anObject.sumGenStart != null)
            anObject.sumGenStart = anObject.sumGenStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.countGenIn = set.getBigDecimal(7);
        if(anObject.countGenIn != null)
            anObject.countGenIn = anObject.countGenIn.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.priceGenIn = set.getBigDecimal(8);
        if(anObject.priceGenIn != null)
            anObject.priceGenIn = anObject.priceGenIn.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumGenIn = set.getBigDecimal(9);
        if(anObject.sumGenIn != null)
            anObject.sumGenIn = anObject.sumGenIn.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.countGenOut = set.getBigDecimal(10);
        if(anObject.countGenOut != null)
            anObject.countGenOut = anObject.countGenOut.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.priceGenOut = set.getBigDecimal(11);
        if(anObject.priceGenOut != null)
            anObject.priceGenOut = anObject.priceGenOut.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumGenOut = set.getBigDecimal(12);
        if(anObject.sumGenOut != null)
            anObject.sumGenOut = anObject.sumGenOut.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.countGenFinal = set.getBigDecimal(13);
        if(anObject.countGenFinal != null)
            anObject.countGenFinal = anObject.countGenFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.priceGenFinal = set.getBigDecimal(14);
        if(anObject.priceGenFinal != null)
            anObject.priceGenFinal = anObject.priceGenFinal.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumGenFinal = set.getBigDecimal(15);
        if(anObject.sumGenFinal != null)
            anObject.sumGenFinal = anObject.sumGenFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.fuelTypeRefCode = set.getInt(16);
		if(set.wasNull())
		   anObject.fuelTypeRefCode = Integer.MIN_VALUE;
        anObject.fuelTypeRefName = set.getString(17);
        anObject.realTransportCode = set.getInt(18);
		if(set.wasNull())
		   anObject.realTransportCode = Integer.MIN_VALUE;
        anObject.realTransportName = set.getString(19);
        anObject.realTransportInvNumber = set.getString(20);
        anObject.realTransportGosNumber = set.getString(21);
        anObject.travelSheetFuelTypeRefCode = set.getInt(22);
		if(set.wasNull())
		   anObject.travelSheetFuelTypeRefCode = Integer.MIN_VALUE;

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

  public int[] getFilteredCodeArrayOLD(ENTransportRealFuelRemains aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRANSPORTREALFULRMNS.CODE FROM ENTRANSPORTREALFULRMNS";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRANSPORTREALFULRMNS.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.CODE = ?";
        }
        if(aFilterObject.dateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.DATESTART = ?";
        }
        if(aFilterObject.dateFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.DATEFINAL = ?";
        }
        if(aFilterObject.countGenStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.COUNTGENSTART = ?";
        }
        if(aFilterObject.priceGenStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.PRICEGENSTART = ?";
        }
        if(aFilterObject.sumGenStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.SUMGENSTART = ?";
        }
        if(aFilterObject.countGenIn != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.COUNTGENIN = ?";
        }
        if(aFilterObject.priceGenIn != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.PRICEGENIN = ?";
        }
        if(aFilterObject.sumGenIn != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.SUMGENIN = ?";
        }
        if(aFilterObject.countGenOut != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.COUNTGENOUT = ?";
        }
        if(aFilterObject.priceGenOut != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.PRICEGENOUT = ?";
        }
        if(aFilterObject.sumGenOut != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.SUMGENOUT = ?";
        }
        if(aFilterObject.countGenFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.COUNTGENFINAL = ?";
        }
        if(aFilterObject.priceGenFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.PRICEGENFINAL = ?";
        }
        if(aFilterObject.sumGenFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.SUMGENFINAL = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.MODIFY_TIME = ?";
        }
        if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTREALFULRMNS.FUELTYPEREFCODE = ? ";
        }
        if(aFilterObject.realTransport.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTREALFULRMNS.REALTRANSPORTCODE = ? ";
        }
        if(aFilterObject.travelSheetFuelTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTREALFULRMNS.TRAVELSHEETFUELTYPRFCD = ? ";
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
        if(aFilterObject.dateStart != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
        }
        if(aFilterObject.countGenStart != null){
            number++;
            aFilterObject.countGenStart = aFilterObject.countGenStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGenStart);
        }
        if(aFilterObject.priceGenStart != null){
            number++;
            aFilterObject.priceGenStart = aFilterObject.priceGenStart.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.priceGenStart);
        }
        if(aFilterObject.sumGenStart != null){
            number++;
            aFilterObject.sumGenStart = aFilterObject.sumGenStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGenStart);
        }
        if(aFilterObject.countGenIn != null){
            number++;
            aFilterObject.countGenIn = aFilterObject.countGenIn.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGenIn);
        }
        if(aFilterObject.priceGenIn != null){
            number++;
            aFilterObject.priceGenIn = aFilterObject.priceGenIn.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.priceGenIn);
        }
        if(aFilterObject.sumGenIn != null){
            number++;
            aFilterObject.sumGenIn = aFilterObject.sumGenIn.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGenIn);
        }
        if(aFilterObject.countGenOut != null){
            number++;
            aFilterObject.countGenOut = aFilterObject.countGenOut.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGenOut);
        }
        if(aFilterObject.priceGenOut != null){
            number++;
            aFilterObject.priceGenOut = aFilterObject.priceGenOut.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.priceGenOut);
        }
        if(aFilterObject.sumGenOut != null){
            number++;
            aFilterObject.sumGenOut = aFilterObject.sumGenOut.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGenOut);
        }
        if(aFilterObject.countGenFinal != null){
            number++;
            aFilterObject.countGenFinal = aFilterObject.countGenFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGenFinal);
        }
        if(aFilterObject.priceGenFinal != null){
            number++;
            aFilterObject.priceGenFinal = aFilterObject.priceGenFinal.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.priceGenFinal);
        }
        if(aFilterObject.sumGenFinal != null){
            number++;
            aFilterObject.sumGenFinal = aFilterObject.sumGenFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGenFinal);
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fuelTypeRef.code);
       }
       if(aFilterObject.realTransport.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.realTransport.code);
       }
       if(aFilterObject.travelSheetFuelTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.travelSheetFuelTypeRef.code);
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

  public int[] getFilteredCodeArray(ENTransportRealFuelRemainsFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
	return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENTransportRealFuelRemains aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRANSPORTREALFULRMNS.CODE FROM ENTRANSPORTREALFULRMNS";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRANSPORTREALFULRMNS.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.CODE = ?";
        }
        if(aFilterObject.dateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.DATESTART = ?";
        }
        if(aFilterObject.dateFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.DATEFINAL = ?";
        }
        if(aFilterObject.countGenStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.COUNTGENSTART = ?";
        }
        if(aFilterObject.priceGenStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.PRICEGENSTART = ?";
        }
        if(aFilterObject.sumGenStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.SUMGENSTART = ?";
        }
        if(aFilterObject.countGenIn != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.COUNTGENIN = ?";
        }
        if(aFilterObject.priceGenIn != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.PRICEGENIN = ?";
        }
        if(aFilterObject.sumGenIn != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.SUMGENIN = ?";
        }
        if(aFilterObject.countGenOut != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.COUNTGENOUT = ?";
        }
        if(aFilterObject.priceGenOut != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.PRICEGENOUT = ?";
        }
        if(aFilterObject.sumGenOut != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.SUMGENOUT = ?";
        }
        if(aFilterObject.countGenFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.COUNTGENFINAL = ?";
        }
        if(aFilterObject.priceGenFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.PRICEGENFINAL = ?";
        }
        if(aFilterObject.sumGenFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.SUMGENFINAL = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTREALFULRMNS.MODIFY_TIME = ?";
        }
        if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTREALFULRMNS.FUELTYPEREFCODE = ? ";
        }
        if(aFilterObject.realTransport.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTREALFULRMNS.REALTRANSPORTCODE = ? ";
        }
        if(aFilterObject.travelSheetFuelTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTREALFULRMNS.TRAVELSHEETFUELTYPRFCD = ? ";
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
        if(aFilterObject.dateStart != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
        }
        if(aFilterObject.countGenStart != null){
            number++;
            aFilterObject.countGenStart = aFilterObject.countGenStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGenStart);
        }
        if(aFilterObject.priceGenStart != null){
            number++;
            aFilterObject.priceGenStart = aFilterObject.priceGenStart.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.priceGenStart);
        }
        if(aFilterObject.sumGenStart != null){
            number++;
            aFilterObject.sumGenStart = aFilterObject.sumGenStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGenStart);
        }
        if(aFilterObject.countGenIn != null){
            number++;
            aFilterObject.countGenIn = aFilterObject.countGenIn.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGenIn);
        }
        if(aFilterObject.priceGenIn != null){
            number++;
            aFilterObject.priceGenIn = aFilterObject.priceGenIn.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.priceGenIn);
        }
        if(aFilterObject.sumGenIn != null){
            number++;
            aFilterObject.sumGenIn = aFilterObject.sumGenIn.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGenIn);
        }
        if(aFilterObject.countGenOut != null){
            number++;
            aFilterObject.countGenOut = aFilterObject.countGenOut.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGenOut);
        }
        if(aFilterObject.priceGenOut != null){
            number++;
            aFilterObject.priceGenOut = aFilterObject.priceGenOut.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.priceGenOut);
        }
        if(aFilterObject.sumGenOut != null){
            number++;
            aFilterObject.sumGenOut = aFilterObject.sumGenOut.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGenOut);
        }
        if(aFilterObject.countGenFinal != null){
            number++;
            aFilterObject.countGenFinal = aFilterObject.countGenFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGenFinal);
        }
        if(aFilterObject.priceGenFinal != null){
            number++;
            aFilterObject.priceGenFinal = aFilterObject.priceGenFinal.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.priceGenFinal);
        }
        if(aFilterObject.sumGenFinal != null){
            number++;
            aFilterObject.sumGenFinal = aFilterObject.sumGenFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGenFinal);
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.fuelTypeRef.code);
       }
       if(aFilterObject.realTransport.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.realTransport.code);
       }
       if(aFilterObject.travelSheetFuelTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.travelSheetFuelTypeRef.code);
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


   public ENTransportRealFuelRemains getObject(int uid) throws PersistenceException
   {
    ENTransportRealFuelRemains result = new ENTransportRealFuelRemains();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENTransportRealFuelRemains anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENTRANSPORTREALFULRMNS.CODE, ENTRANSPORTREALFULRMNS.DATESTART, ENTRANSPORTREALFULRMNS.DATEFINAL, ENTRANSPORTREALFULRMNS.COUNTGENSTART, ENTRANSPORTREALFULRMNS.PRICEGENSTART, ENTRANSPORTREALFULRMNS.SUMGENSTART, ENTRANSPORTREALFULRMNS.COUNTGENIN, ENTRANSPORTREALFULRMNS.PRICEGENIN, ENTRANSPORTREALFULRMNS.SUMGENIN, ENTRANSPORTREALFULRMNS.COUNTGENOUT, ENTRANSPORTREALFULRMNS.PRICEGENOUT, ENTRANSPORTREALFULRMNS.SUMGENOUT, ENTRANSPORTREALFULRMNS.COUNTGENFINAL, ENTRANSPORTREALFULRMNS.PRICEGENFINAL, ENTRANSPORTREALFULRMNS.SUMGENFINAL, ENTRANSPORTREALFULRMNS.MODIFY_TIME, ENTRANSPORTREALFULRMNS.FUELTYPEREFCODE, ENTRANSPORTREALFULRMNS.REALTRANSPORTCODE, ENTRANSPORTREALFULRMNS.TRAVELSHEETFUELTYPRFCD "
    +" FROM ENTRANSPORTREALFULRMNS WHERE ENTRANSPORTREALFULRMNS.CODE = ?";

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
        anObject.dateStart = set.getDate(2);
        anObject.dateFinal = set.getDate(3);
        anObject.countGenStart = set.getBigDecimal(4);
        if(anObject.countGenStart != null)
            anObject.countGenStart = anObject.countGenStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.priceGenStart = set.getBigDecimal(5);
        if(anObject.priceGenStart != null)
            anObject.priceGenStart = anObject.priceGenStart.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumGenStart = set.getBigDecimal(6);
        if(anObject.sumGenStart != null)
            anObject.sumGenStart = anObject.sumGenStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.countGenIn = set.getBigDecimal(7);
        if(anObject.countGenIn != null)
            anObject.countGenIn = anObject.countGenIn.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.priceGenIn = set.getBigDecimal(8);
        if(anObject.priceGenIn != null)
            anObject.priceGenIn = anObject.priceGenIn.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumGenIn = set.getBigDecimal(9);
        if(anObject.sumGenIn != null)
            anObject.sumGenIn = anObject.sumGenIn.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.countGenOut = set.getBigDecimal(10);
        if(anObject.countGenOut != null)
            anObject.countGenOut = anObject.countGenOut.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.priceGenOut = set.getBigDecimal(11);
        if(anObject.priceGenOut != null)
            anObject.priceGenOut = anObject.priceGenOut.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumGenOut = set.getBigDecimal(12);
        if(anObject.sumGenOut != null)
            anObject.sumGenOut = anObject.sumGenOut.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.countGenFinal = set.getBigDecimal(13);
        if(anObject.countGenFinal != null)
            anObject.countGenFinal = anObject.countGenFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.priceGenFinal = set.getBigDecimal(14);
        if(anObject.priceGenFinal != null)
            anObject.priceGenFinal = anObject.priceGenFinal.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumGenFinal = set.getBigDecimal(15);
        if(anObject.sumGenFinal != null)
            anObject.sumGenFinal = anObject.sumGenFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.modify_time = set.getLong(16);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.fuelTypeRef.code = set.getInt(17);
        if ( set.wasNull() )
            anObject.fuelTypeRef.code = Integer.MIN_VALUE;
        anObject.realTransport.code = set.getInt(18);
        if ( set.wasNull() )
            anObject.realTransport.code = Integer.MIN_VALUE;
        anObject.travelSheetFuelTypeRef.code = set.getInt(19);
        if ( set.wasNull() )
            anObject.travelSheetFuelTypeRef.code = Integer.MIN_VALUE;
        if(anObject.fuelTypeRef.code != Integer.MIN_VALUE)
        {
           anObject.setFuelTypeRef(
		   new com.ksoe.techcard.dataminer.generated.TKFuelTypeDAOGen(connection,getUserProfile()).getRef(anObject.fuelTypeRef.code));
	   }
        if(anObject.realTransport.code != Integer.MIN_VALUE)
        {
           anObject.setRealTransport(
		   new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).getObject(anObject.realTransport.code));
	   }
        if(anObject.travelSheetFuelTypeRef.code != Integer.MIN_VALUE)
        {
           anObject.setTravelSheetFuelTypeRef(
		   new com.ksoe.energynet.dataminer.generated.ENTravelSheetFuelTypeDAOGen(connection,getUserProfile()).getRef(anObject.travelSheetFuelTypeRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENTransportRealFuelRemainsRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENTransportRealFuelRemainsRef ref = new com.ksoe.energynet.valueobject.references.ENTransportRealFuelRemainsRef();
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

    selectStr = "DELETE FROM  ENTRANSPORTREALFULRMNS WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENTransportRealFuelRemains object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENTransportRealFuelRemains.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENTransportRealFuelRemains.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENTransportRealFuelRemains.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTransportRealFuelRemains.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENTransportRealFuelRemains.getObject%} access denied");

    selectStr =

    "SELECT  ENTRANSPORTREALFULRMNS.CODE FROM  ENTRANSPORTREALFULRMNS WHERE  ENTRANSPORTREALFULRMNS.CODE = ?";
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
    _checkConditionToken(condition,"code","ENTRANSPORTREALFULRMNS.CODE");
    _checkConditionToken(condition,"datestart","ENTRANSPORTREALFULRMNS.DATESTART");
    _checkConditionToken(condition,"datefinal","ENTRANSPORTREALFULRMNS.DATEFINAL");
    _checkConditionToken(condition,"countgenstart","ENTRANSPORTREALFULRMNS.COUNTGENSTART");
    _checkConditionToken(condition,"pricegenstart","ENTRANSPORTREALFULRMNS.PRICEGENSTART");
    _checkConditionToken(condition,"sumgenstart","ENTRANSPORTREALFULRMNS.SUMGENSTART");
    _checkConditionToken(condition,"countgenin","ENTRANSPORTREALFULRMNS.COUNTGENIN");
    _checkConditionToken(condition,"pricegenin","ENTRANSPORTREALFULRMNS.PRICEGENIN");
    _checkConditionToken(condition,"sumgenin","ENTRANSPORTREALFULRMNS.SUMGENIN");
    _checkConditionToken(condition,"countgenout","ENTRANSPORTREALFULRMNS.COUNTGENOUT");
    _checkConditionToken(condition,"pricegenout","ENTRANSPORTREALFULRMNS.PRICEGENOUT");
    _checkConditionToken(condition,"sumgenout","ENTRANSPORTREALFULRMNS.SUMGENOUT");
    _checkConditionToken(condition,"countgenfinal","ENTRANSPORTREALFULRMNS.COUNTGENFINAL");
    _checkConditionToken(condition,"pricegenfinal","ENTRANSPORTREALFULRMNS.PRICEGENFINAL");
    _checkConditionToken(condition,"sumgenfinal","ENTRANSPORTREALFULRMNS.SUMGENFINAL");
    _checkConditionToken(condition,"modify_time","ENTRANSPORTREALFULRMNS.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"fueltyperef","FUELTYPEREFCODE");
    _checkConditionToken(condition,"fueltyperef.code","FUELTYPEREFCODE");
    _checkConditionToken(condition,"realtransport","REALTRANSPORTCODE");
    _checkConditionToken(condition,"realtransport.code","REALTRANSPORTCODE");
    _checkConditionToken(condition,"travelsheetfueltyperef","TRAVELSHEETFUELTYPRFCD");
    _checkConditionToken(condition,"travelsheetfueltyperef.code","TRAVELSHEETFUELTYPRFCD");
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

	private void _collectAutoIncrementFields(ENTransportRealFuelRemains anObject,
			Connection connection) throws PersistenceException {
		
		SequenceKey hashKey = new SequenceKey("ENTRANSPORTREALFULRMNS", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENTRANSPORTREALFULRMNS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENTRANSPORTREALFULRMNS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}
		
		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
					"Can't obtain auto increment value from: ENTRANSPORTREALFULRMNS");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENTransportRealFuelRemainsDAO
