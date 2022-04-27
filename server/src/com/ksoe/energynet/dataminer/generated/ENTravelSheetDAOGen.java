
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
import com.ksoe.energynet.valueobject.ENTravelSheet;
import com.ksoe.energynet.valueobject.brief.ENTravelSheetShort;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetFilter;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetShortList;
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
 * DAO Object for ENTravelSheet;
 *
 */

public class ENTravelSheetDAOGen extends GenericDataMiner {

   public ENTravelSheetDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENTravelSheetDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   private boolean isEqual(ENTravelSheet inObject) throws PersistenceException
   {
      ENTravelSheet obj = new ENTravelSheet();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.numberGen != obj.numberGen){
       return false;
     }

     if ( ! inObject.dateStart.equals(obj.dateStart)){
       return false;
     }

     if ( ! inObject.dateFinal.equals(obj.dateFinal)){
       return false;
     }

     if ( ! inObject.speedometerStart.equals(obj.speedometerStart)){
       return false;
     }

     if ( ! inObject.speedometerFinal.equals(obj.speedometerFinal)){
       return false;
     }

     if ( ! inObject.fuelCounterStart.equals(obj.fuelCounterStart)){
       return false;
     }

     if ( ! inObject.fuelCounterFinal.equals(obj.fuelCounterFinal)){
       return false;
     }

     if ( ! inObject.timeStart.equals(obj.timeStart)){
       return false;
     }

     if ( ! inObject.timeFinal.equals(obj.timeFinal)){
       return false;
     }

     if (inObject.commentGen != obj.commentGen){
       return false;
     }

     if ( ! inObject.dateEdit.equals(obj.dateEdit)){
       return false;
     }

     if (inObject.userGen != obj.userGen){
       return false;
     }

     if (inObject.isMobiliztn != obj.isMobiliztn){
       return false;
     }
     if (inObject.department.code != obj.department.code){
        return false;
     }
     if (inObject.transportReal.code != obj.transportReal.code){
        return false;
     }
     if (inObject.trailer1.code != obj.trailer1.code){
        return false;
     }
     if (inObject.trailer2.code != obj.trailer2.code){
        return false;
     }
     if (inObject.finWorker.code != obj.finWorker.code){
        return false;
     }
     if (inObject.finWorker_additional_1.code != obj.finWorker_additional_1.code){
        return false;
     }
     if (inObject.finWorker_additional_2.code != obj.finWorker_additional_2.code){
        return false;
     }
     if (inObject.workModeRef.code != obj.workModeRef.code){
        return false;
     }
     if (inObject.typeRef.code != obj.typeRef.code){
        return false;
     }
     if (inObject.statusRef.code != obj.statusRef.code){
        return false;
     }
      return true;
   }

   public int add(ENTravelSheet anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENTravelSheet anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

  anObject.modify_time = System.currentTimeMillis();
  if(anObject.getDomain_info() == null)
        anObject.setDomain_info(getUserProfile().getDomainInfo().getDomain());

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENTRAVELSHEET (CODE,NUMBERGEN,DATESTART,DATEFINAL,SPEEDOMETERSTART,SPEEDOMETERFINAL,FUELCOUNTERSTART,FUELCOUNTERFINAL,TIMESTART,TIMEFINAL,COMMENTGEN,DATEEDIT,USERGEN,DOMAIN_INFO,MODIFY_TIME,ISMOBILIZTN,DEPARTMENTCODE,TRANSPORTREALCODE,TRAILER1CODE,TRAILER2CODE,FINWORKERCODE,FINWORKER_ADDITINL_1CD,FINWORKER_ADDITINL_2CD,WORKMODEREFCODE,TYPEREFCODE,STATUSREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.numberGen);
      if (anObject.dateStart == null)
        statement.setDate(3,null);
      else
        statement.setDate(3,new java.sql.Date(anObject.dateStart.getTime()));
      if (anObject.dateFinal == null)
        statement.setDate(4,null);
      else
        statement.setDate(4,new java.sql.Date(anObject.dateFinal.getTime()));
      if (anObject.speedometerStart != null)
        anObject.speedometerStart = anObject.speedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.speedometerStart);
      if (anObject.speedometerFinal != null)
        anObject.speedometerFinal = anObject.speedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.speedometerFinal);
      if (anObject.fuelCounterStart != null)
        anObject.fuelCounterStart = anObject.fuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.fuelCounterStart);
      if (anObject.fuelCounterFinal != null)
        anObject.fuelCounterFinal = anObject.fuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.fuelCounterFinal);
      if (anObject.timeStart == null)
        statement.setTimestamp(9,null);
      else
        statement.setTimestamp(9,new java.sql.Timestamp(anObject.timeStart.getTime()));
      if (anObject.timeFinal == null)
        statement.setTimestamp(10,null);
      else
        statement.setTimestamp(10,new java.sql.Timestamp(anObject.timeFinal.getTime()));
      statement.setString(11,anObject.commentGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(12,null);
      else
        statement.setTimestamp(12,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      statement.setString(13,anObject.userGen);
      statement.setString(14,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(15,null);
      else
        statement.setBigDecimal(15,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.isMobiliztn != Integer.MIN_VALUE )
         statement.setInt(16,anObject.isMobiliztn);
      else
         statement.setNull(16,java.sql.Types.INTEGER);
      if (anObject.department.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).exists(anObject.department.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTravelSheet.department.code%} = {%"+anObject.department.code+"%}");
        statement.setInt(17,anObject.department.code);
      }
      else
        statement.setNull(17,java.sql.Types.INTEGER);
      if (anObject.transportReal.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).exists(anObject.transportReal.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENTravelSheet.transportReal.code%} = {%"+anObject.transportReal.code+"%}");
        statement.setInt(18,anObject.transportReal.code);
      }
      else
        statement.setNull(18,java.sql.Types.INTEGER);
      if (anObject.trailer1.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).exists(anObject.trailer1.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENTravelSheet.trailer1.code%} = {%"+anObject.trailer1.code+"%}");
        statement.setInt(19,anObject.trailer1.code);
      }
      else
        statement.setNull(19,java.sql.Types.INTEGER);
      if (anObject.trailer2.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).exists(anObject.trailer2.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENTravelSheet.trailer2.code%} = {%"+anObject.trailer2.code+"%}");
        statement.setInt(20,anObject.trailer2.code);
      }
      else
        statement.setNull(20,java.sql.Types.INTEGER);
      if (anObject.finWorker.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.FINWorkerDAOGen(connection,getUserProfile()).exists(anObject.finWorker.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTravelSheet.finWorker.code%} = {%"+anObject.finWorker.code+"%}");
        statement.setInt(21,anObject.finWorker.code);
      }
      else
        statement.setNull(21,java.sql.Types.INTEGER);
      if (anObject.finWorker_additional_1.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.FINWorkerDAOGen(connection,getUserProfile()).exists(anObject.finWorker_additional_1.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTravelSheet.finWorker_additional_1.code%} = {%"+anObject.finWorker_additional_1.code+"%}");
        statement.setInt(22,anObject.finWorker_additional_1.code);
      }
      else
        statement.setNull(22,java.sql.Types.INTEGER);
      if (anObject.finWorker_additional_2.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.FINWorkerDAOGen(connection,getUserProfile()).exists(anObject.finWorker_additional_2.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTravelSheet.finWorker_additional_2.code%} = {%"+anObject.finWorker_additional_2.code+"%}");
        statement.setInt(23,anObject.finWorker_additional_2.code);
      }
      else
        statement.setNull(23,java.sql.Types.INTEGER);
      if (anObject.workModeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTravelWorkModeDAOGen(connection,getUserProfile()).exists(anObject.workModeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTravelSheet.workModeRef.code%} = {%"+anObject.workModeRef.code+"%}");
        statement.setInt(24,anObject.workModeRef.code);
      }
      else
        statement.setNull(24,java.sql.Types.INTEGER);
      if (anObject.typeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTravelSheetTypeDAOGen(connection,getUserProfile()).exists(anObject.typeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTravelSheet.typeRef.code%} = {%"+anObject.typeRef.code+"%}");
        statement.setInt(25,anObject.typeRef.code);
      }
      else
        statement.setNull(25,java.sql.Types.INTEGER);
      if (anObject.statusRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTravelSheetStatusDAOGen(connection,getUserProfile()).exists(anObject.statusRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTravelSheet.statusRef.code%} = {%"+anObject.statusRef.code+"%}");
        statement.setInt(26,anObject.statusRef.code);
      }
      else
        statement.setNull(26,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENTravelSheetDAOGen.add%}",e);
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

   public void save(ENTravelSheet anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENTravelSheet anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENTravelSheet oldObject = new ENTravelSheet();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENTravelSheet.modify_time_Field + "," + ENTravelSheet.domain_info_Field+" FROM  ENTRAVELSHEET WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("NUMBERGEN") == 0)
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
          if(fieldNameStr.compareTo("SPEEDOMETERSTART") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SPEEDOMETERFINAL") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FUELCOUNTERSTART") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FUELCOUNTERFINAL") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TIMESTART") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TIMEFINAL") == 0)
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
          if(fieldNameStr.compareTo("DATEEDIT") == 0)
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
          if(fieldNameStr.compareTo("ISMOBILIZTN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DEPARTMENT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TRANSPORTREAL") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TRAILER1") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TRAILER2") == 0)
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
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FINWORKER_ADDITIONAL_1") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FINWORKER_ADDITIONAL_2") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("WORKMODEREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TYPEREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("STATUSREF") == 0)
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
        "UPDATE ENTRAVELSHEET SET  NUMBERGEN = ? , DATESTART = ? , DATEFINAL = ? , SPEEDOMETERSTART = ? , SPEEDOMETERFINAL = ? , FUELCOUNTERSTART = ? , FUELCOUNTERFINAL = ? , TIMESTART = ? , TIMEFINAL = ? , COMMENTGEN = ? , DATEEDIT = ? , USERGEN = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , ISMOBILIZTN = ? , DEPARTMENTCODE = ? , TRANSPORTREALCODE = ? , TRAILER1CODE = ? , TRAILER2CODE = ? , FINWORKERCODE = ? , FINWORKER_ADDITINL_1CD = ? , FINWORKER_ADDITINL_2CD = ? , WORKMODEREFCODE = ? , TYPEREFCODE = ? , STATUSREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENTRAVELSHEET SET ";
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
      statement.setString(1,anObject.numberGen);
      if (anObject.dateStart == null)
        statement.setDate(2,null);
      else
        statement.setDate(2,new java.sql.Date(anObject.dateStart.getTime()));
      if (anObject.dateFinal == null)
        statement.setDate(3,null);
      else
        statement.setDate(3,new java.sql.Date(anObject.dateFinal.getTime()));
      if (anObject.speedometerStart != null)
        anObject.speedometerStart = anObject.speedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.speedometerStart);
      if (anObject.speedometerFinal != null)
        anObject.speedometerFinal = anObject.speedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.speedometerFinal);
      if (anObject.fuelCounterStart != null)
        anObject.fuelCounterStart = anObject.fuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.fuelCounterStart);
      if (anObject.fuelCounterFinal != null)
        anObject.fuelCounterFinal = anObject.fuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.fuelCounterFinal);
      if (anObject.timeStart == null)
        statement.setTimestamp(8,null);
      else
        statement.setTimestamp(8,new java.sql.Timestamp(anObject.timeStart.getTime()));
      if (anObject.timeFinal == null)
        statement.setTimestamp(9,null);
      else
        statement.setTimestamp(9,new java.sql.Timestamp(anObject.timeFinal.getTime()));
      statement.setString(10,anObject.commentGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(11,null);
      else
        statement.setTimestamp(11,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      statement.setString(12,anObject.userGen);
      statement.setString(13,anObject.domain_info);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(14,null);
      else
        statement.setBigDecimal(14,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.isMobiliztn != Integer.MIN_VALUE )
         statement.setInt(15,anObject.isMobiliztn);
      else
         statement.setNull(15,java.sql.Types.INTEGER);
      if (anObject.department.code != Integer.MIN_VALUE)
        statement.setInt(16,anObject.department.code);
      else
        statement.setNull(16,java.sql.Types.INTEGER);
      if (anObject.transportReal.code != Integer.MIN_VALUE)
        statement.setInt(17,anObject.transportReal.code);
      else
        statement.setNull(17,java.sql.Types.INTEGER);
      if (anObject.trailer1.code != Integer.MIN_VALUE)
        statement.setInt(18,anObject.trailer1.code);
      else
        statement.setNull(18,java.sql.Types.INTEGER);
      if (anObject.trailer2.code != Integer.MIN_VALUE)
        statement.setInt(19,anObject.trailer2.code);
      else
        statement.setNull(19,java.sql.Types.INTEGER);
      if (anObject.finWorker.code != Integer.MIN_VALUE)
        statement.setInt(20,anObject.finWorker.code);
      else
        statement.setNull(20,java.sql.Types.INTEGER);
      if (anObject.finWorker_additional_1.code != Integer.MIN_VALUE)
        statement.setInt(21,anObject.finWorker_additional_1.code);
      else
        statement.setNull(21,java.sql.Types.INTEGER);
      if (anObject.finWorker_additional_2.code != Integer.MIN_VALUE)
        statement.setInt(22,anObject.finWorker_additional_2.code);
      else
        statement.setNull(22,java.sql.Types.INTEGER);
      if (anObject.workModeRef.code != Integer.MIN_VALUE)
        statement.setInt(23,anObject.workModeRef.code);
      else
        statement.setNull(23,java.sql.Types.INTEGER);
      if (anObject.typeRef.code != Integer.MIN_VALUE)
        statement.setInt(24,anObject.typeRef.code);
      else
        statement.setNull(24,java.sql.Types.INTEGER);
      if (anObject.statusRef.code != Integer.MIN_VALUE)
        statement.setInt(25,anObject.statusRef.code);
      else
        statement.setNull(25,java.sql.Types.INTEGER);
          statement.setInt(26,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("NUMBERGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.numberGen);
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
            if("SPEEDOMETERSTART".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.speedometerStart != null)
                    anObject.speedometerStart = anObject.speedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.speedometerStart);
                continue;
             }
            if("SPEEDOMETERFINAL".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.speedometerFinal != null)
                    anObject.speedometerFinal = anObject.speedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.speedometerFinal);
                continue;
             }
            if("FUELCOUNTERSTART".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.fuelCounterStart != null)
                    anObject.fuelCounterStart = anObject.fuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.fuelCounterStart);
                continue;
             }
            if("FUELCOUNTERFINAL".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.fuelCounterFinal != null)
                    anObject.fuelCounterFinal = anObject.fuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.fuelCounterFinal);
                continue;
             }
            if("TIMESTART".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.timeStart == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.timeStart.getTime()));
                continue;
             }
            if("TIMEFINAL".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.timeFinal == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.timeFinal.getTime()));
                continue;
             }
            if("COMMENTGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.commentGen);
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
            if("USERGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.userGen);
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
            if("ISMOBILIZTN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.isMobiliztn);
                continue;
             }
            if("DEPARTMENT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.department.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.department.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("TRANSPORTREAL".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.transportReal.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.transportReal.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("TRAILER1".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.trailer1.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.trailer1.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("TRAILER2".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.trailer2.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.trailer2.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("FINWORKER".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.finWorker.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.finWorker.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("FINWORKER_ADDITIONAL_1".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.finWorker_additional_1.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.finWorker_additional_1.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("FINWORKER_ADDITIONAL_2".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.finWorker_additional_2.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.finWorker_additional_2.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("WORKMODEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.workModeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.workModeRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("TYPEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.typeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.typeRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("STATUSREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.statusRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.statusRef.code);
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

   } // end of save(ENTravelSheet anObject,String[] anAttributes)


 public ENTravelSheetShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENTravelSheet filterObject = new ENTravelSheet();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENTravelSheetShort)list.get(0);
   return null;
  }

  public ENTravelSheetShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENTravelSheetShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENTravelSheetShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENTravelSheetShortList getFilteredList(ENTravelSheet filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENTravelSheetShortList getScrollableFilteredList(ENTravelSheet aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENTravelSheetShortList getScrollableFilteredList(ENTravelSheet aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENTravelSheetShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENTravelSheetShortList getScrollableFilteredList(ENTravelSheetFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENTravelSheetShortList getScrollableFilteredList(ENTravelSheetFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENTravelSheetShortList getScrollableFilteredList(ENTravelSheet aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENTravelSheetShortList getScrollableFilteredList(ENTravelSheet aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENTravelSheetShortList result = new ENTravelSheetShortList();
    ENTravelSheetShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRAVELSHEET.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENTRAVELSHEET.CODE"+
     ",ENTRAVELSHEET.NUMBERGEN"+
     ",ENTRAVELSHEET.DATESTART"+
     ",ENTRAVELSHEET.DATEFINAL"+
     ",ENTRAVELSHEET.SPEEDOMETERSTART"+
     ",ENTRAVELSHEET.SPEEDOMETERFINAL"+
     ",ENTRAVELSHEET.FUELCOUNTERSTART"+
     ",ENTRAVELSHEET.FUELCOUNTERFINAL"+
     ",ENTRAVELSHEET.TIMESTART"+
     ",ENTRAVELSHEET.TIMEFINAL"+
     ",ENTRAVELSHEET.DATEEDIT"+
     ",ENTRAVELSHEET.USERGEN"+

      ", ENDEPARTMENT.CODE " +
      ", ENDEPARTMENT.SHORTNAME " +
      ", ENDEPARTMENT.DATESTART " +
      ", ENDEPARTMENT.DATEFINAL " +
      ", ENDEPARTMENT.RENCODE " +
      ", ENDEPARTMENT.SHPZBALANS " +
      ", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
      ", ENDEPARTMENT.KAU_1884 " +
      ", ENDEPARTMENT.NAME_1884 " +
      ", TKTRANSPORTREAL.CODE " +
      ", TKTRANSPORTREAL.NAME " +
      ", TKTRANSPORTREAL.INVNUMBER " +
      ", TKTRANSPORTREAL.GOSNUMBER " +
      ", TKTRANSPORTREAL.CODE " +
      ", TKTRANSPORTREAL.NAME " +
      ", TKTRANSPORTREAL.INVNUMBER " +
      ", TKTRANSPORTREAL.GOSNUMBER " +
      ", TKTRANSPORTREAL.CODE " +
      ", TKTRANSPORTREAL.NAME " +
      ", TKTRANSPORTREAL.INVNUMBER " +
      ", TKTRANSPORTREAL.GOSNUMBER " +
      ", FINWORKER.CODE " +
      ", FINWORKER.NAME " +
      ", FINWORKER.TABNUMBER " +
      ", FINWORKER.POSITIONNAME " +
      ", FINWORKER.POSITIONCODE " +
      ", FINWORKER.DEPARTMENTNAME " +
      ", FINWORKER.DEPARTMENTCODE " +
      ", FINWORKER.PRICEGEN " +
      ", FINWORKER.CATEGOR " +
      ", FINWORKER.FINCODE " +
      ", FINWORKER.ISSENTASSIGNMENT " +
      ", FINWORKER.CHARGEPERCENT " +
      ", FINWORKER.CODE " +
      ", FINWORKER.NAME " +
      ", FINWORKER.TABNUMBER " +
      ", FINWORKER.POSITIONNAME " +
      ", FINWORKER.POSITIONCODE " +
      ", FINWORKER.DEPARTMENTNAME " +
      ", FINWORKER.DEPARTMENTCODE " +
      ", FINWORKER.PRICEGEN " +
      ", FINWORKER.CATEGOR " +
      ", FINWORKER.FINCODE " +
      ", FINWORKER.ISSENTASSIGNMENT " +
      ", FINWORKER.CHARGEPERCENT " +
      ", FINWORKER.CODE " +
      ", FINWORKER.NAME " +
      ", FINWORKER.TABNUMBER " +
      ", FINWORKER.POSITIONNAME " +
      ", FINWORKER.POSITIONCODE " +
      ", FINWORKER.DEPARTMENTNAME " +
      ", FINWORKER.DEPARTMENTCODE " +
      ", FINWORKER.PRICEGEN " +
      ", FINWORKER.CATEGOR " +
      ", FINWORKER.FINCODE " +
      ", FINWORKER.ISSENTASSIGNMENT " +
      ", FINWORKER.CHARGEPERCENT " +
      ", ENTRAVELWORKMODE.CODE " +
      ", ENTRAVELWORKMODE.NAME " +
      ", ENTRAVELSHEETTYPE.CODE " +
      ", ENTRAVELSHEETTYPE.NAME " +
      ", ENTRAVELSHEETSTATUS.CODE " +
      ", ENTRAVELSHEETSTATUS.NAME " +
     " FROM ENTRAVELSHEET " +
     ", ENDEPARTMENT " +
     ", TKTRANSPORTREAL " +
     ", TKTRANSPORTREAL " +
     ", TKTRANSPORTREAL " +
     ", FINWORKER " +
     ", FINWORKER " +
     ", FINWORKER " +
     ", ENTRAVELWORKMODE " +
     ", ENTRAVELSHEETTYPE " +
     ", ENTRAVELSHEETSTATUS " +
     //" WHERE "
  "";
     whereStr = " ENDEPARTMENT.CODE = ENTRAVELSHEET.DEPARTMENTCODE" ; //+
      whereStr = whereStr +" AND TKTRANSPORTREAL.CODE = ENTRAVELSHEET.TRANSPORTREALCODE" ; //+
      whereStr = whereStr +" AND TKTRANSPORTREAL.CODE = ENTRAVELSHEET.TRAILER1CODE" ; //+
      whereStr = whereStr +" AND TKTRANSPORTREAL.CODE = ENTRAVELSHEET.TRAILER2CODE" ; //+
      whereStr = whereStr +" AND FINWORKER.CODE = ENTRAVELSHEET.FINWORKERCODE" ; //+
      whereStr = whereStr +" AND FINWORKER.CODE = ENTRAVELSHEET.FINWORKER_ADDITINL_1CD" ; //+
      whereStr = whereStr +" AND FINWORKER.CODE = ENTRAVELSHEET.FINWORKER_ADDITINL_2CD" ; //+
      whereStr = whereStr +" AND ENTRAVELWORKMODE.CODE = ENTRAVELSHEET.WORKMODEREFCODE" ; //+
      whereStr = whereStr +" AND ENTRAVELSHEETTYPE.CODE = ENTRAVELSHEET.TYPEREFCODE" ; //+
      whereStr = whereStr +" AND ENTRAVELSHEETSTATUS.CODE = ENTRAVELSHEET.STATUSREFCODE" ; //+
    //selectStr = selectStr + " ${s} ENTRAVELSHEET.CODE IN ( SELECT ENTRAVELSHEET.CODE FROM ENTRAVELSHEET ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.CODE = ?";
        }
         if (aFilterObject.numberGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTRAVELSHEET.NUMBERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTRAVELSHEET.NUMBERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.DATESTART = ?";
        }
        if(aFilterObject.dateFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.DATEFINAL = ?";
        }
        if(aFilterObject.speedometerStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.SPEEDOMETERSTART = ?";
        }
        if(aFilterObject.speedometerFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.SPEEDOMETERFINAL = ?";
        }
        if(aFilterObject.fuelCounterStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.FUELCOUNTERSTART = ?";
        }
        if(aFilterObject.fuelCounterFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.FUELCOUNTERFINAL = ?";
        }
        if(aFilterObject.timeStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.TIMESTART = ?";
        }
        if(aFilterObject.timeFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.TIMEFINAL = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTRAVELSHEET.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTRAVELSHEET.COMMENTGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.DATEEDIT = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTRAVELSHEET.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTRAVELSHEET.USERGEN) LIKE UPPER(?)";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTRAVELSHEET.DOMAIN_INFO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTRAVELSHEET.DOMAIN_INFO) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.MODIFY_TIME = ?";
        }
        if(aFilterObject.isMobiliztn != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.ISMOBILIZTN = ?";
        }
        if(aFilterObject.department.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRAVELSHEET.DEPARTMENTCODE = ? ";
        }
        if(aFilterObject.transportReal.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRAVELSHEET.TRANSPORTREALCODE = ? ";
        }
        if(aFilterObject.trailer1.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRAVELSHEET.TRAILER1CODE = ? ";
        }
        if(aFilterObject.trailer2.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRAVELSHEET.TRAILER2CODE = ? ";
        }
        if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRAVELSHEET.FINWORKERCODE = ? ";
        }
        if(aFilterObject.finWorker_additional_1.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRAVELSHEET.FINWORKER_ADDITINL_1CD = ? ";
        }
        if(aFilterObject.finWorker_additional_2.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRAVELSHEET.FINWORKER_ADDITINL_2CD = ? ";
        }
        if(aFilterObject.workModeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRAVELSHEET.WORKMODEREFCODE = ? ";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRAVELSHEET.TYPEREFCODE = ? ";
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRAVELSHEET.STATUSREFCODE = ? ";
        }

      }


    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTravelSheet.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENTravelSheet.getList%} access denied");

    String domainWhereStr = SegregationQueryBuilder.addWhere("ENTRAVELSHEET",segregationInfo,getUserProfile().getDomainInfo());

    if (domainWhereStr.length() != 0){
    // domainWhereStr = "  AND ENTRAVELSHEET.DOMAIN_INFO IS NOT NULL";
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

           if(aFilterObject.numberGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.numberGen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.dateStart != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
        }
        if(aFilterObject.speedometerStart != null){
            number++;
            aFilterObject.speedometerStart = aFilterObject.speedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.speedometerStart);
        }
        if(aFilterObject.speedometerFinal != null){
            number++;
            aFilterObject.speedometerFinal = aFilterObject.speedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.speedometerFinal);
        }
        if(aFilterObject.fuelCounterStart != null){
            number++;
            aFilterObject.fuelCounterStart = aFilterObject.fuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.fuelCounterStart);
        }
        if(aFilterObject.fuelCounterFinal != null){
            number++;
            aFilterObject.fuelCounterFinal = aFilterObject.fuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.fuelCounterFinal);
        }
        if(aFilterObject.timeStart != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeStart.getTime()));
        }
        if(aFilterObject.timeFinal != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeFinal.getTime()));
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
        if(aFilterObject.dateEdit != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
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
         if(aFilterObject.isMobiliztn != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isMobiliztn);
         }
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.department.code);
       }
       if(aFilterObject.transportReal.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportReal.code);
       }
       if(aFilterObject.trailer1.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.trailer1.code);
       }
       if(aFilterObject.trailer2.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.trailer2.code);
       }
       if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finWorker.code);
       }
       if(aFilterObject.finWorker_additional_1.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finWorker_additional_1.code);
       }
       if(aFilterObject.finWorker_additional_2.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finWorker_additional_2.code);
       }
       if(aFilterObject.workModeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.workModeRef.code);
       }
       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.typeRef.code);
       }
       if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.statusRef.code);
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

        anObject = new ENTravelSheetShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.numberGen = set.getString(2);
        anObject.dateStart = set.getDate(3);
        anObject.dateFinal = set.getDate(4);
        anObject.speedometerStart = set.getBigDecimal(5);
        if(anObject.speedometerStart != null)
            anObject.speedometerStart = anObject.speedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.speedometerFinal = set.getBigDecimal(6);
        if(anObject.speedometerFinal != null)
            anObject.speedometerFinal = anObject.speedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelCounterStart = set.getBigDecimal(7);
        if(anObject.fuelCounterStart != null)
            anObject.fuelCounterStart = anObject.fuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelCounterFinal = set.getBigDecimal(8);
        if(anObject.fuelCounterFinal != null)
            anObject.fuelCounterFinal = anObject.fuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.timeStart = set.getTimestamp(9);
        anObject.timeFinal = set.getTimestamp(10);
        anObject.dateEdit = set.getTimestamp(11);
        anObject.userGen = set.getString(12);

        anObject.departmentCode = set.getInt(13);
    if(set.wasNull())
      anObject.departmentCode = Integer.MIN_VALUE;
        anObject.departmentShortName = set.getString(14);
        anObject.departmentDateStart = set.getDate(15);
        anObject.departmentDateFinal = set.getDate(16);
        anObject.departmentRenCode = set.getInt(17);
    if(set.wasNull())
      anObject.departmentRenCode = Integer.MIN_VALUE;
        anObject.departmentShpzBalans = set.getString(18);
        anObject.departmentKau_table_id_1884 = set.getInt(19);
    if(set.wasNull())
      anObject.departmentKau_table_id_1884 = Integer.MIN_VALUE;
        anObject.departmentKau_1884 = set.getString(20);
        anObject.departmentName_1884 = set.getString(21);
        anObject.transportRealCode = set.getInt(22);
    if(set.wasNull())
      anObject.transportRealCode = Integer.MIN_VALUE;
        anObject.transportRealName = set.getString(23);
        anObject.transportRealInvNumber = set.getString(24);
        anObject.transportRealGosNumber = set.getString(25);
        anObject.trailer1Code = set.getInt(26);
    if(set.wasNull())
      anObject.trailer1Code = Integer.MIN_VALUE;
        anObject.trailer1Name = set.getString(27);
        anObject.trailer1InvNumber = set.getString(28);
        anObject.trailer1GosNumber = set.getString(29);
        anObject.trailer2Code = set.getInt(30);
    if(set.wasNull())
      anObject.trailer2Code = Integer.MIN_VALUE;
        anObject.trailer2Name = set.getString(31);
        anObject.trailer2InvNumber = set.getString(32);
        anObject.trailer2GosNumber = set.getString(33);
        anObject.finWorkerCode = set.getInt(34);
    if(set.wasNull())
      anObject.finWorkerCode = Integer.MIN_VALUE;
        anObject.finWorkerName = set.getString(35);
        anObject.finWorkerTabNumber = set.getString(36);

        anObject.finWorkerPositionName = set.getString(37);
        anObject.finWorkerPositionCode = set.getInt(38);
    if(set.wasNull())
      anObject.finWorkerPositionCode = Integer.MIN_VALUE;
        anObject.finWorkerDepartmentName = set.getString(39);
        anObject.finWorkerDepartmentCode = set.getString(40);
        anObject.finWorkerPriceGen = set.getBigDecimal(41);
        if(anObject.finWorkerPriceGen != null)
          anObject.finWorkerPriceGen = anObject.finWorkerPriceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.finWorkerCategor = set.getInt(42);
    if(set.wasNull())
      anObject.finWorkerCategor = Integer.MIN_VALUE;
        anObject.finWorkerFinCode = set.getInt(43);
    if(set.wasNull())
      anObject.finWorkerFinCode = Integer.MIN_VALUE;
        anObject.finWorkerIsSentAssignment = set.getInt(44);
    if(set.wasNull())
      anObject.finWorkerIsSentAssignment = Integer.MIN_VALUE;
        anObject.finWorkerChargePercent = set.getBigDecimal(45);
        if(anObject.finWorkerChargePercent != null)
          anObject.finWorkerChargePercent = anObject.finWorkerChargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.finWorker_additional_1Code = set.getInt(46);
    if(set.wasNull())
      anObject.finWorker_additional_1Code = Integer.MIN_VALUE;
        anObject.finWorker_additional_1Name = set.getString(47);
        anObject.finWorker_additional_1TabNumber = set.getInt(48);
    if(set.wasNull())
      anObject.finWorker_additional_1TabNumber = Integer.MIN_VALUE;
        anObject.finWorker_additional_1PositionName = set.getString(49);
        anObject.finWorker_additional_1PositionCode = set.getInt(50);
    if(set.wasNull())
      anObject.finWorker_additional_1PositionCode = Integer.MIN_VALUE;
        anObject.finWorker_additional_1DepartmentName = set.getString(51);
        anObject.finWorker_additional_1DepartmentCode = set.getString(52);
        anObject.finWorker_additional_1PriceGen = set.getBigDecimal(53);
        if(anObject.finWorker_additional_1PriceGen != null)
          anObject.finWorker_additional_1PriceGen = anObject.finWorker_additional_1PriceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.finWorker_additional_1Categor = set.getInt(54);
    if(set.wasNull())
      anObject.finWorker_additional_1Categor = Integer.MIN_VALUE;
        anObject.finWorker_additional_1FinCode = set.getInt(55);
    if(set.wasNull())
      anObject.finWorker_additional_1FinCode = Integer.MIN_VALUE;
        anObject.finWorker_additional_1IsSentAssignment = set.getInt(56);
    if(set.wasNull())
      anObject.finWorker_additional_1IsSentAssignment = Integer.MIN_VALUE;
        anObject.finWorker_additional_1ChargePercent = set.getBigDecimal(57);
        if(anObject.finWorker_additional_1ChargePercent != null)
          anObject.finWorker_additional_1ChargePercent = anObject.finWorker_additional_1ChargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.finWorker_additional_2Code = set.getInt(58);
    if(set.wasNull())
      anObject.finWorker_additional_2Code = Integer.MIN_VALUE;
        anObject.finWorker_additional_2Name = set.getString(59);
        anObject.finWorker_additional_2TabNumber = set.getInt(60);
    if(set.wasNull())
      anObject.finWorker_additional_2TabNumber = Integer.MIN_VALUE;
        anObject.finWorker_additional_2PositionName = set.getString(61);
        anObject.finWorker_additional_2PositionCode = set.getInt(62);
    if(set.wasNull())
      anObject.finWorker_additional_2PositionCode = Integer.MIN_VALUE;
        anObject.finWorker_additional_2DepartmentName = set.getString(63);
        anObject.finWorker_additional_2DepartmentCode = set.getString(64);
        anObject.finWorker_additional_2PriceGen = set.getBigDecimal(65);
        if(anObject.finWorker_additional_2PriceGen != null)
          anObject.finWorker_additional_2PriceGen = anObject.finWorker_additional_2PriceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.finWorker_additional_2Categor = set.getInt(66);
    if(set.wasNull())
      anObject.finWorker_additional_2Categor = Integer.MIN_VALUE;
        anObject.finWorker_additional_2FinCode = set.getInt(67);
    if(set.wasNull())
      anObject.finWorker_additional_2FinCode = Integer.MIN_VALUE;
        anObject.finWorker_additional_2IsSentAssignment = set.getInt(68);
    if(set.wasNull())
      anObject.finWorker_additional_2IsSentAssignment = Integer.MIN_VALUE;
        anObject.finWorker_additional_2ChargePercent = set.getBigDecimal(69);
        if(anObject.finWorker_additional_2ChargePercent != null)
          anObject.finWorker_additional_2ChargePercent = anObject.finWorker_additional_2ChargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.workModeRefCode = set.getInt(70);
    if(set.wasNull())
      anObject.workModeRefCode = Integer.MIN_VALUE;
        anObject.workModeRefName = set.getString(71);
        anObject.typeRefCode = set.getInt(72);
    if(set.wasNull())
      anObject.typeRefCode = Integer.MIN_VALUE;
        anObject.typeRefName = set.getString(73);
        anObject.statusRefCode = set.getInt(74);
    if(set.wasNull())
      anObject.statusRefCode = Integer.MIN_VALUE;
        anObject.statusRefName = set.getString(75);

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

  public int[] getFilteredCodeArrayOLD(ENTravelSheet aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRAVELSHEET.CODE FROM ENTRAVELSHEET";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRAVELSHEET.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTravelSheet.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENTravelSheet.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("ENTRAVELSHEET",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (ENTRAVELSHEET.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.CODE = ?";
        }
         if (aFilterObject.numberGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRAVELSHEET.NUMBERGEN = ?";
             else
                 whereStr = whereStr + "  ENTRAVELSHEET.NUMBERGEN LIKE ?";
         }
        if(aFilterObject.dateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.DATESTART = ?";
        }
        if(aFilterObject.dateFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.DATEFINAL = ?";
        }
        if(aFilterObject.speedometerStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.SPEEDOMETERSTART = ?";
        }
        if(aFilterObject.speedometerFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.SPEEDOMETERFINAL = ?";
        }
        if(aFilterObject.fuelCounterStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.FUELCOUNTERSTART = ?";
        }
        if(aFilterObject.fuelCounterFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.FUELCOUNTERFINAL = ?";
        }
        if(aFilterObject.timeStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.TIMESTART = ?";
        }
        if(aFilterObject.timeFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.TIMEFINAL = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRAVELSHEET.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENTRAVELSHEET.COMMENTGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.DATEEDIT = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRAVELSHEET.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENTRAVELSHEET.USERGEN LIKE ?";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRAVELSHEET.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENTRAVELSHEET.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.MODIFY_TIME = ?";
        }
        if(aFilterObject.isMobiliztn != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.ISMOBILIZTN = ?";
        }
        if(aFilterObject.department.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.DEPARTMENTCODE = ? ";
        }
        if(aFilterObject.transportReal.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.TRANSPORTREALCODE = ? ";
        }
        if(aFilterObject.trailer1.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.TRAILER1CODE = ? ";
        }
        if(aFilterObject.trailer2.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.TRAILER2CODE = ? ";
        }
        if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.FINWORKERCODE = ? ";
        }
        if(aFilterObject.finWorker_additional_1.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.FINWORKER_ADDITINL_1CD = ? ";
        }
        if(aFilterObject.finWorker_additional_2.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.FINWORKER_ADDITINL_2CD = ? ";
        }
        if(aFilterObject.workModeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.WORKMODEREFCODE = ? ";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.TYPEREFCODE = ? ";
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.STATUSREFCODE = ? ";
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
         if (aFilterObject.numberGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRAVELSHEET.NUMBERGEN = ?";
             else
                 whereStr = whereStr + " ENTRAVELSHEET.NUMBERGEN LIKE ?";

           if(aFilterObject.numberGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.numberGen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.dateStart != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
        }
        if(aFilterObject.speedometerStart != null){
            number++;
            aFilterObject.speedometerStart = aFilterObject.speedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.speedometerStart);
        }
        if(aFilterObject.speedometerFinal != null){
            number++;
            aFilterObject.speedometerFinal = aFilterObject.speedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.speedometerFinal);
        }
        if(aFilterObject.fuelCounterStart != null){
            number++;
            aFilterObject.fuelCounterStart = aFilterObject.fuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.fuelCounterStart);
        }
        if(aFilterObject.fuelCounterFinal != null){
            number++;
            aFilterObject.fuelCounterFinal = aFilterObject.fuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.fuelCounterFinal);
        }
        if(aFilterObject.timeStart != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeStart.getTime()));
        }
        if(aFilterObject.timeFinal != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeFinal.getTime()));
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRAVELSHEET.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENTRAVELSHEET.COMMENTGEN LIKE ?";

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
        if(aFilterObject.dateEdit != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRAVELSHEET.USERGEN = ?";
             else
                 whereStr = whereStr + " ENTRAVELSHEET.USERGEN LIKE ?";

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
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRAVELSHEET.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENTRAVELSHEET.DOMAIN_INFO LIKE ?";

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
         if(aFilterObject.isMobiliztn != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isMobiliztn);
         }
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.department.code);
       }
       if(aFilterObject.transportReal.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportReal.code);
       }
       if(aFilterObject.trailer1.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.trailer1.code);
       }
       if(aFilterObject.trailer2.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.trailer2.code);
       }
       if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finWorker.code);
       }
       if(aFilterObject.finWorker_additional_1.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finWorker_additional_1.code);
       }
       if(aFilterObject.finWorker_additional_2.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finWorker_additional_2.code);
       }
       if(aFilterObject.workModeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.workModeRef.code);
       }
       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.typeRef.code);
       }
       if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.statusRef.code);
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

  public int[] getFilteredCodeArray(ENTravelSheetFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENTravelSheet aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRAVELSHEET.CODE FROM ENTRAVELSHEET";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRAVELSHEET.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTravelSheet.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENTravelSheet.getList%} access denied");

    whereStr = SegregationQueryBuilder.addWhere("ENTRAVELSHEET",segregationInfo,getUserProfile().getDomainInfo());

    if(whereStr.length() == 0)
     whereStr = " (ENTRAVELSHEET.DOMAIN_INFO IS NOT NULL) ";
    else
     whereStr = " "+whereStr;

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.CODE = ?";
        }
         if (aFilterObject.numberGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRAVELSHEET.NUMBERGEN = ?";
             else
                 whereStr = whereStr + "  ENTRAVELSHEET.NUMBERGEN LIKE ?";
         }
        if(aFilterObject.dateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.DATESTART = ?";
        }
        if(aFilterObject.dateFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.DATEFINAL = ?";
        }
        if(aFilterObject.speedometerStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.SPEEDOMETERSTART = ?";
        }
        if(aFilterObject.speedometerFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.SPEEDOMETERFINAL = ?";
        }
        if(aFilterObject.fuelCounterStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.FUELCOUNTERSTART = ?";
        }
        if(aFilterObject.fuelCounterFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.FUELCOUNTERFINAL = ?";
        }
        if(aFilterObject.timeStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.TIMESTART = ?";
        }
        if(aFilterObject.timeFinal != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.TIMEFINAL = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRAVELSHEET.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENTRAVELSHEET.COMMENTGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.DATEEDIT = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRAVELSHEET.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENTRAVELSHEET.USERGEN LIKE ?";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTRAVELSHEET.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + "  ENTRAVELSHEET.DOMAIN_INFO LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.MODIFY_TIME = ?";
        }
        if(aFilterObject.isMobiliztn != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRAVELSHEET.ISMOBILIZTN = ?";
        }
        if(aFilterObject.department.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.DEPARTMENTCODE = ? ";
        }
        if(aFilterObject.transportReal.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.TRANSPORTREALCODE = ? ";
        }
        if(aFilterObject.trailer1.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.TRAILER1CODE = ? ";
        }
        if(aFilterObject.trailer2.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.TRAILER2CODE = ? ";
        }
        if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.FINWORKERCODE = ? ";
        }
        if(aFilterObject.finWorker_additional_1.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.FINWORKER_ADDITINL_1CD = ? ";
        }
        if(aFilterObject.finWorker_additional_2.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.FINWORKER_ADDITINL_2CD = ? ";
        }
        if(aFilterObject.workModeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.WORKMODEREFCODE = ? ";
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.TYPEREFCODE = ? ";
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRAVELSHEET.STATUSREFCODE = ? ";
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
         if (aFilterObject.numberGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRAVELSHEET.NUMBERGEN = ?";
             else
                 whereStr = whereStr + " ENTRAVELSHEET.NUMBERGEN LIKE ?";

           if(aFilterObject.numberGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.numberGen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.dateStart != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
        }
        if(aFilterObject.dateFinal != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
        }
        if(aFilterObject.speedometerStart != null){
            number++;
            aFilterObject.speedometerStart = aFilterObject.speedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.speedometerStart);
        }
        if(aFilterObject.speedometerFinal != null){
            number++;
            aFilterObject.speedometerFinal = aFilterObject.speedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.speedometerFinal);
        }
        if(aFilterObject.fuelCounterStart != null){
            number++;
            aFilterObject.fuelCounterStart = aFilterObject.fuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.fuelCounterStart);
        }
        if(aFilterObject.fuelCounterFinal != null){
            number++;
            aFilterObject.fuelCounterFinal = aFilterObject.fuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.fuelCounterFinal);
        }
        if(aFilterObject.timeStart != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeStart.getTime()));
        }
        if(aFilterObject.timeFinal != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeFinal.getTime()));
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRAVELSHEET.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENTRAVELSHEET.COMMENTGEN LIKE ?";

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
        if(aFilterObject.dateEdit != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRAVELSHEET.USERGEN = ?";
             else
                 whereStr = whereStr + " ENTRAVELSHEET.USERGEN LIKE ?";

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
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTRAVELSHEET.DOMAIN_INFO = ?";
             else
                 whereStr = whereStr + " ENTRAVELSHEET.DOMAIN_INFO LIKE ?";

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
         if(aFilterObject.isMobiliztn != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.isMobiliztn);
         }
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.department.code);
       }
       if(aFilterObject.transportReal.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportReal.code);
       }
       if(aFilterObject.trailer1.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.trailer1.code);
       }
       if(aFilterObject.trailer2.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.trailer2.code);
       }
       if(aFilterObject.finWorker.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finWorker.code);
       }
       if(aFilterObject.finWorker_additional_1.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finWorker_additional_1.code);
       }
       if(aFilterObject.finWorker_additional_2.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finWorker_additional_2.code);
       }
       if(aFilterObject.workModeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.workModeRef.code);
       }
       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.typeRef.code);
       }
       if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.statusRef.code);
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


   public ENTravelSheet getObject(int uid) throws PersistenceException
   {
    ENTravelSheet result = new ENTravelSheet();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENTravelSheet anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTravelSheet.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENTravelSheet.getObject%} access denied");



    selectStr =
    "SELECT  ENTRAVELSHEET.CODE, ENTRAVELSHEET.NUMBERGEN, ENTRAVELSHEET.DATESTART, ENTRAVELSHEET.DATEFINAL, ENTRAVELSHEET.SPEEDOMETERSTART, ENTRAVELSHEET.SPEEDOMETERFINAL, ENTRAVELSHEET.FUELCOUNTERSTART, ENTRAVELSHEET.FUELCOUNTERFINAL, ENTRAVELSHEET.TIMESTART, ENTRAVELSHEET.TIMEFINAL, ENTRAVELSHEET.COMMENTGEN, ENTRAVELSHEET.DATEEDIT, ENTRAVELSHEET.USERGEN, ENTRAVELSHEET.DOMAIN_INFO, ENTRAVELSHEET.MODIFY_TIME, ENTRAVELSHEET.ISMOBILIZTN, ENTRAVELSHEET.DEPARTMENTCODE, ENTRAVELSHEET.TRANSPORTREALCODE, ENTRAVELSHEET.TRAILER1CODE, ENTRAVELSHEET.TRAILER2CODE, ENTRAVELSHEET.FINWORKERCODE, ENTRAVELSHEET.FINWORKER_ADDITINL_1CD, ENTRAVELSHEET.FINWORKER_ADDITINL_2CD, ENTRAVELSHEET.WORKMODEREFCODE, ENTRAVELSHEET.TYPEREFCODE, ENTRAVELSHEET.STATUSREFCODE "
    +" FROM ENTRAVELSHEET WHERE ENTRAVELSHEET.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("ENTRAVELSHEET",segregationInfo,getUserProfile().getDomainInfo());
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
        anObject.numberGen = set.getString(2);
        anObject.dateStart = set.getDate(3);
        anObject.dateFinal = set.getDate(4);
        anObject.speedometerStart = set.getBigDecimal(5);
        if(anObject.speedometerStart != null)
            anObject.speedometerStart = anObject.speedometerStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.speedometerFinal = set.getBigDecimal(6);
        if(anObject.speedometerFinal != null)
            anObject.speedometerFinal = anObject.speedometerFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelCounterStart = set.getBigDecimal(7);
        if(anObject.fuelCounterStart != null)
            anObject.fuelCounterStart = anObject.fuelCounterStart.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.fuelCounterFinal = set.getBigDecimal(8);
        if(anObject.fuelCounterFinal != null)
            anObject.fuelCounterFinal = anObject.fuelCounterFinal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.timeStart = set.getTimestamp(9);
        anObject.timeFinal = set.getTimestamp(10);
        anObject.commentGen = set.getString(11);
        anObject.dateEdit = set.getTimestamp(12);
        anObject.userGen = set.getString(13);
        anObject.domain_info = set.getString(14);
        anObject.modify_time = set.getLong(15);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.isMobiliztn = set.getInt(16);
        if ( set.wasNull() )
           anObject.isMobiliztn = Integer.MIN_VALUE;
        anObject.department.code = set.getInt(17);
        if ( set.wasNull() )
            anObject.department.code = Integer.MIN_VALUE;
        anObject.transportReal.code = set.getInt(18);
        if ( set.wasNull() )
            anObject.transportReal.code = Integer.MIN_VALUE;
        anObject.trailer1.code = set.getInt(19);
        if ( set.wasNull() )
            anObject.trailer1.code = Integer.MIN_VALUE;
        anObject.trailer2.code = set.getInt(20);
        if ( set.wasNull() )
            anObject.trailer2.code = Integer.MIN_VALUE;
        anObject.finWorker.code = set.getInt(21);
        if ( set.wasNull() )
            anObject.finWorker.code = Integer.MIN_VALUE;
        anObject.finWorker_additional_1.code = set.getInt(22);
        if ( set.wasNull() )
            anObject.finWorker_additional_1.code = Integer.MIN_VALUE;
        anObject.finWorker_additional_2.code = set.getInt(23);
        if ( set.wasNull() )
            anObject.finWorker_additional_2.code = Integer.MIN_VALUE;
        anObject.workModeRef.code = set.getInt(24);
        if ( set.wasNull() )
            anObject.workModeRef.code = Integer.MIN_VALUE;
        anObject.typeRef.code = set.getInt(25);
        if ( set.wasNull() )
            anObject.typeRef.code = Integer.MIN_VALUE;
        anObject.statusRef.code = set.getInt(26);
        if ( set.wasNull() )
            anObject.statusRef.code = Integer.MIN_VALUE;
        if(anObject.department.code != Integer.MIN_VALUE)
        {
           anObject.setDepartment(
      new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getObject(anObject.department.code));
    }
        if(anObject.transportReal.code != Integer.MIN_VALUE)
        {
           anObject.setTransportReal(
      new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).getObject(anObject.transportReal.code));
    }
        if(anObject.trailer1.code != Integer.MIN_VALUE)
        {
           anObject.setTrailer1(
      new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).getObject(anObject.trailer1.code));
    }
        if(anObject.trailer2.code != Integer.MIN_VALUE)
        {
           anObject.setTrailer2(
      new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).getObject(anObject.trailer2.code));
    }
        if(anObject.finWorker.code != Integer.MIN_VALUE)
        {
           anObject.setFinWorker(
      new com.ksoe.energynet.dataminer.generated.FINWorkerDAOGen(connection,getUserProfile()).getObject(anObject.finWorker.code));
    }
        if(anObject.finWorker_additional_1.code != Integer.MIN_VALUE)
        {
           anObject.setFinWorker_additional_1(
      new com.ksoe.energynet.dataminer.generated.FINWorkerDAOGen(connection,getUserProfile()).getObject(anObject.finWorker_additional_1.code));
    }
        if(anObject.finWorker_additional_2.code != Integer.MIN_VALUE)
        {
           anObject.setFinWorker_additional_2(
      new com.ksoe.energynet.dataminer.generated.FINWorkerDAOGen(connection,getUserProfile()).getObject(anObject.finWorker_additional_2.code));
    }
        if(anObject.workModeRef.code != Integer.MIN_VALUE)
        {
           anObject.setWorkModeRef(
      new com.ksoe.energynet.dataminer.generated.ENTravelWorkModeDAOGen(connection,getUserProfile()).getRef(anObject.workModeRef.code));
    }
        if(anObject.typeRef.code != Integer.MIN_VALUE)
        {
           anObject.setTypeRef(
      new com.ksoe.energynet.dataminer.generated.ENTravelSheetTypeDAOGen(connection,getUserProfile()).getRef(anObject.typeRef.code));
    }
        if(anObject.statusRef.code != Integer.MIN_VALUE)
        {
           anObject.setStatusRef(
      new com.ksoe.energynet.dataminer.generated.ENTravelSheetStatusDAOGen(connection,getUserProfile()).getRef(anObject.statusRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENTravelSheetRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENTravelSheetRef ref = new com.ksoe.energynet.valueobject.references.ENTravelSheetRef();
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

    selectStr = "DELETE FROM  ENTRAVELSHEET WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENTravelSheet object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENTravelSheet.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENTravelSheet.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENTravelSheet.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTravelSheet.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENTravelSheet.getObject%} access denied");

    selectStr =

    "SELECT  ENTRAVELSHEET.CODE FROM  ENTRAVELSHEET WHERE  ENTRAVELSHEET.CODE = ?";
    String segregationWhereStr = SegregationQueryBuilder.addWhere("ENTRAVELSHEET",segregationInfo,getUserProfile().getDomainInfo());
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
    _checkConditionToken(condition,"code","ENTRAVELSHEET.CODE");
    _checkConditionToken(condition,"numbergen","ENTRAVELSHEET.NUMBERGEN");
    _checkConditionToken(condition,"datestart","ENTRAVELSHEET.DATESTART");
    _checkConditionToken(condition,"datefinal","ENTRAVELSHEET.DATEFINAL");
    _checkConditionToken(condition,"speedometerstart","ENTRAVELSHEET.SPEEDOMETERSTART");
    _checkConditionToken(condition,"speedometerfinal","ENTRAVELSHEET.SPEEDOMETERFINAL");
    _checkConditionToken(condition,"fuelcounterstart","ENTRAVELSHEET.FUELCOUNTERSTART");
    _checkConditionToken(condition,"fuelcounterfinal","ENTRAVELSHEET.FUELCOUNTERFINAL");
    _checkConditionToken(condition,"timestart","ENTRAVELSHEET.TIMESTART");
    _checkConditionToken(condition,"timefinal","ENTRAVELSHEET.TIMEFINAL");
    _checkConditionToken(condition,"commentgen","ENTRAVELSHEET.COMMENTGEN");
    _checkConditionToken(condition,"dateedit","ENTRAVELSHEET.DATEEDIT");
    _checkConditionToken(condition,"usergen","ENTRAVELSHEET.USERGEN");
    _checkConditionToken(condition,"domain_info","ENTRAVELSHEET.DOMAIN_INFO");
    _checkConditionToken(condition,"modify_time","ENTRAVELSHEET.MODIFY_TIME");
    _checkConditionToken(condition,"ismobiliztn","ENTRAVELSHEET.ISMOBILIZTN");
      // relationship conditions
    _checkConditionToken(condition,"department","DEPARTMENTCODE");
    _checkConditionToken(condition,"department.code","DEPARTMENTCODE");
    _checkConditionToken(condition,"transportreal","TRANSPORTREALCODE");
    _checkConditionToken(condition,"transportreal.code","TRANSPORTREALCODE");
    _checkConditionToken(condition,"trailer1","TRAILER1CODE");
    _checkConditionToken(condition,"trailer1.code","TRAILER1CODE");
    _checkConditionToken(condition,"trailer2","TRAILER2CODE");
    _checkConditionToken(condition,"trailer2.code","TRAILER2CODE");
    _checkConditionToken(condition,"finworker","FINWORKERCODE");
    _checkConditionToken(condition,"finworker.code","FINWORKERCODE");
    _checkConditionToken(condition,"finworker_additional_1","FINWORKER_ADDITINL_1CD");
    _checkConditionToken(condition,"finworker_additional_1.code","FINWORKER_ADDITINL_1CD");
    _checkConditionToken(condition,"finworker_additional_2","FINWORKER_ADDITINL_2CD");
    _checkConditionToken(condition,"finworker_additional_2.code","FINWORKER_ADDITINL_2CD");
    _checkConditionToken(condition,"workmoderef","WORKMODEREFCODE");
    _checkConditionToken(condition,"workmoderef.code","WORKMODEREFCODE");
    _checkConditionToken(condition,"typeref","TYPEREFCODE");
    _checkConditionToken(condition,"typeref.code","TYPEREFCODE");
    _checkConditionToken(condition,"statusref","STATUSREFCODE");
    _checkConditionToken(condition,"statusref.code","STATUSREFCODE");
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

  private void _collectAutoIncrementFields(ENTravelSheet anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENTRAVELSHEET", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENTRAVELSHEET", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENTRAVELSHEET", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENTRAVELSHEET");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENTravelSheetDAO
