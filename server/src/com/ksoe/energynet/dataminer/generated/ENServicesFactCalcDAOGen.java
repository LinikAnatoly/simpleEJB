
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
import com.ksoe.energynet.valueobject.ENServicesFactCalc;
import com.ksoe.energynet.valueobject.brief.ENServicesFactCalcShort;
import com.ksoe.energynet.valueobject.filter.ENServicesFactCalcFilter;
import com.ksoe.energynet.valueobject.lists.ENServicesFactCalcShortList;
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
  *  DAO Generated for ENServicesFactCalc;
  *
  */

public class ENServicesFactCalcDAOGen extends GenericDataMiner {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENServicesFactCalcDAOGen() {super();}
  //public ENServicesFactCalcDAOGen(Connection aConnection) {super(aConnection);}
  //public ENServicesFactCalcDAOGen(UserProfile anUserProfile) {super(anUserProfile);}
  public ENServicesFactCalcDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENServicesFactCalcDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENServicesFactCalc inObject) throws PersistenceException
   {
      ENServicesFactCalc obj = new ENServicesFactCalc();
      obj.code = inObject.code;
      loadObject(obj);

     if ( ! inObject.calcCost.equals(obj.calcCost)){
       return false;
     }

     if ( ! inObject.materialsCost.equals(obj.materialsCost)){
       return false;
     }

     if ( ! inObject.transportCost.equals(obj.transportCost)){
       return false;
     }

     if ( ! inObject.deliveryCost.equals(obj.deliveryCost)){
       return false;
     }

     if ( ! inObject.sumGen.equals(obj.sumGen)){
       return false;
     }

     if ( ! inObject.vatSum.equals(obj.vatSum)){
       return false;
     }

     if ( ! inObject.totalSum.equals(obj.totalSum)){
       return false;
     }

     if ( ! inObject.sumCalc.equals(obj.sumCalc)){
       return false;
     }

     if ( ! inObject.vatSumCalc.equals(obj.vatSumCalc)){
       return false;
     }

     if ( ! inObject.totalSumCalc.equals(obj.totalSumCalc)){
       return false;
     }

     if ( ! inObject.percentPrepay.equals(obj.percentPrepay)){
       return false;
     }

     if ( ! inObject.sumPrepay.equals(obj.sumPrepay)){
       return false;
     }

     if ( ! inObject.vatSumPrepay.equals(obj.vatSumPrepay)){
       return false;
     }

     if ( ! inObject.totalSumPrepay.equals(obj.totalSumPrepay)){
       return false;
     }

     if ( ! inObject.sumRest.equals(obj.sumRest)){
       return false;
     }

     if ( ! inObject.vatSumRest.equals(obj.vatSumRest)){
       return false;
     }

     if ( ! inObject.totalSumRest.equals(obj.totalSumRest)){
       return false;
     }

     if (inObject.commentGen != obj.commentGen){
       return false;
     }

     if (inObject.userGen != obj.userGen){
       return false;
     }

     if ( ! inObject.dateEdit.equals(obj.dateEdit)){
       return false;
     }
     if (inObject.servicesObjectRef.code != obj.servicesObjectRef.code){
        return false;
     }
      return true;
   }

   public int add(ENServicesFactCalc anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENServicesFactCalc anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENSERVICESFACTCALC (CODE,CALCCOST,MATERIALSCOST,TRANSPORTCOST,DELIVERYCOST,SUMGEN,VATSUM,TOTALSUM,SUMCALC,VATSUMCALC,TOTALSUMCALC,PERCENTPREPAY,SUMPREPAY,VATSUMPREPAY,TOTALSUMPREPAY,SUMREST,VATSUMREST,TOTALSUMREST,COMMENTGEN,USERGEN,DATEEDIT,MODIFY_TIME,SERVICESOBJECTREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.calcCost != null)
        anObject.calcCost = anObject.calcCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.calcCost);
      if (anObject.materialsCost != null)
        anObject.materialsCost = anObject.materialsCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.materialsCost);
      if (anObject.transportCost != null)
        anObject.transportCost = anObject.transportCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.transportCost);
      if (anObject.deliveryCost != null)
        anObject.deliveryCost = anObject.deliveryCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.deliveryCost);
      if (anObject.sumGen != null)
        anObject.sumGen = anObject.sumGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.sumGen);
      if (anObject.vatSum != null)
        anObject.vatSum = anObject.vatSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.vatSum);
      if (anObject.totalSum != null)
        anObject.totalSum = anObject.totalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.totalSum);
      if (anObject.sumCalc != null)
        anObject.sumCalc = anObject.sumCalc.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(9,anObject.sumCalc);
      if (anObject.vatSumCalc != null)
        anObject.vatSumCalc = anObject.vatSumCalc.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(10,anObject.vatSumCalc);
      if (anObject.totalSumCalc != null)
        anObject.totalSumCalc = anObject.totalSumCalc.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(11,anObject.totalSumCalc);
      if (anObject.percentPrepay != null)
        anObject.percentPrepay = anObject.percentPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(12,anObject.percentPrepay);
      if (anObject.sumPrepay != null)
        anObject.sumPrepay = anObject.sumPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(13,anObject.sumPrepay);
      if (anObject.vatSumPrepay != null)
        anObject.vatSumPrepay = anObject.vatSumPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(14,anObject.vatSumPrepay);
      if (anObject.totalSumPrepay != null)
        anObject.totalSumPrepay = anObject.totalSumPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(15,anObject.totalSumPrepay);
      if (anObject.sumRest != null)
        anObject.sumRest = anObject.sumRest.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(16,anObject.sumRest);
      if (anObject.vatSumRest != null)
        anObject.vatSumRest = anObject.vatSumRest.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(17,anObject.vatSumRest);
      if (anObject.totalSumRest != null)
        anObject.totalSumRest = anObject.totalSumRest.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(18,anObject.totalSumRest);
      statement.setString(19,anObject.commentGen);
      statement.setString(20,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(21,null);
      else
        statement.setTimestamp(21,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(22,null);
      else
        statement.setBigDecimal(22,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.servicesObjectRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).exists(anObject.servicesObjectRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENServicesFactCalc.servicesObjectRef.code%} = {%"+anObject.servicesObjectRef.code+"%}");
        statement.setInt(23,anObject.servicesObjectRef.code);
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
      throw new PersistenceException("Error in method {%ENServicesFactCalcDAOGen.add%}",e);
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

   public void save(ENServicesFactCalc anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENServicesFactCalc anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENServicesFactCalc oldObject = new ENServicesFactCalc();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENServicesFactCalc.modify_time_Field+" FROM  ENSERVICESFACTCALC WHERE CODE = ?";

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
      String selectStr;

      Vector fields = null;
      if(anAttributes != null)
       {
        String fieldNameStr;
        fields = new Vector();
        for(int attrIndex = 0;attrIndex < anAttributes.length;attrIndex++)
         {
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CALCCOST") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("MATERIALSCOST") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TRANSPORTCOST") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DELIVERYCOST") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUMGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("VATSUM") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TOTALSUM") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUMCALC") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("VATSUMCALC") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TOTALSUMCALC") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PERCENTPREPAY") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUMPREPAY") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("VATSUMPREPAY") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TOTALSUMPREPAY") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUMREST") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("VATSUMREST") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TOTALSUMREST") == 0)
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
          if(fieldNameStr.compareTo("SERVICESOBJECTREF") == 0)
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
        "UPDATE ENSERVICESFACTCALC SET  CALCCOST = ? , MATERIALSCOST = ? , TRANSPORTCOST = ? , DELIVERYCOST = ? , SUMGEN = ? , VATSUM = ? , TOTALSUM = ? , SUMCALC = ? , VATSUMCALC = ? , TOTALSUMCALC = ? , PERCENTPREPAY = ? , SUMPREPAY = ? , VATSUMPREPAY = ? , TOTALSUMPREPAY = ? , SUMREST = ? , VATSUMREST = ? , TOTALSUMREST = ? , COMMENTGEN = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , SERVICESOBJECTREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENSERVICESFACTCALC SET ";
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
      if (anObject.calcCost != null)
        anObject.calcCost = anObject.calcCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(1,anObject.calcCost);

      if (anObject.materialsCost != null)
        anObject.materialsCost = anObject.materialsCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.materialsCost);

      if (anObject.transportCost != null)
        anObject.transportCost = anObject.transportCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.transportCost);

      if (anObject.deliveryCost != null)
        anObject.deliveryCost = anObject.deliveryCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.deliveryCost);

      if (anObject.sumGen != null)
        anObject.sumGen = anObject.sumGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.sumGen);

      if (anObject.vatSum != null)
        anObject.vatSum = anObject.vatSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.vatSum);

      if (anObject.totalSum != null)
        anObject.totalSum = anObject.totalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.totalSum);

      if (anObject.sumCalc != null)
        anObject.sumCalc = anObject.sumCalc.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.sumCalc);

      if (anObject.vatSumCalc != null)
        anObject.vatSumCalc = anObject.vatSumCalc.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(9,anObject.vatSumCalc);

      if (anObject.totalSumCalc != null)
        anObject.totalSumCalc = anObject.totalSumCalc.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(10,anObject.totalSumCalc);

      if (anObject.percentPrepay != null)
        anObject.percentPrepay = anObject.percentPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(11,anObject.percentPrepay);

      if (anObject.sumPrepay != null)
        anObject.sumPrepay = anObject.sumPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(12,anObject.sumPrepay);

      if (anObject.vatSumPrepay != null)
        anObject.vatSumPrepay = anObject.vatSumPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(13,anObject.vatSumPrepay);

      if (anObject.totalSumPrepay != null)
        anObject.totalSumPrepay = anObject.totalSumPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(14,anObject.totalSumPrepay);

      if (anObject.sumRest != null)
        anObject.sumRest = anObject.sumRest.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(15,anObject.sumRest);

      if (anObject.vatSumRest != null)
        anObject.vatSumRest = anObject.vatSumRest.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(16,anObject.vatSumRest);

      if (anObject.totalSumRest != null)
        anObject.totalSumRest = anObject.totalSumRest.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(17,anObject.totalSumRest);

      statement.setString(18,anObject.commentGen);
      statement.setString(19,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setDate(20,null);
      else
        statement.setTimestamp(20,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(21,null);
      else
        statement.setBigDecimal(21,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.servicesObjectRef.code != Integer.MIN_VALUE)
        statement.setInt(22,anObject.servicesObjectRef.code);
      else
        statement.setNull(22,java.sql.Types.INTEGER);
          statement.setInt(23,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("CALCCOST".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.calcCost != null)
                    anObject.calcCost = anObject.calcCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.calcCost);
                continue;
             }
            if("MATERIALSCOST".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.materialsCost != null)
                    anObject.materialsCost = anObject.materialsCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.materialsCost);
                continue;
             }
            if("TRANSPORTCOST".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.transportCost != null)
                    anObject.transportCost = anObject.transportCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.transportCost);
                continue;
             }
            if("DELIVERYCOST".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.deliveryCost != null)
                    anObject.deliveryCost = anObject.deliveryCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.deliveryCost);
                continue;
             }
            if("SUMGEN".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sumGen != null)
                    anObject.sumGen = anObject.sumGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sumGen);
                continue;
             }
            if("VATSUM".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.vatSum != null)
                    anObject.vatSum = anObject.vatSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.vatSum);
                continue;
             }
            if("TOTALSUM".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.totalSum != null)
                    anObject.totalSum = anObject.totalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.totalSum);
                continue;
             }
            if("SUMCALC".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sumCalc != null)
                    anObject.sumCalc = anObject.sumCalc.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sumCalc);
                continue;
             }
            if("VATSUMCALC".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.vatSumCalc != null)
                    anObject.vatSumCalc = anObject.vatSumCalc.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.vatSumCalc);
                continue;
             }
            if("TOTALSUMCALC".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.totalSumCalc != null)
                    anObject.totalSumCalc = anObject.totalSumCalc.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.totalSumCalc);
                continue;
             }
            if("PERCENTPREPAY".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.percentPrepay != null)
                    anObject.percentPrepay = anObject.percentPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.percentPrepay);
                continue;
             }
            if("SUMPREPAY".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sumPrepay != null)
                    anObject.sumPrepay = anObject.sumPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sumPrepay);
                continue;
             }
            if("VATSUMPREPAY".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.vatSumPrepay != null)
                    anObject.vatSumPrepay = anObject.vatSumPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.vatSumPrepay);
                continue;
             }
            if("TOTALSUMPREPAY".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.totalSumPrepay != null)
                    anObject.totalSumPrepay = anObject.totalSumPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.totalSumPrepay);
                continue;
             }
            if("SUMREST".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sumRest != null)
                    anObject.sumRest = anObject.sumRest.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sumRest);
                continue;
             }
            if("VATSUMREST".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.vatSumRest != null)
                    anObject.vatSumRest = anObject.vatSumRest.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.vatSumRest);
                continue;
             }
            if("TOTALSUMREST".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.totalSumRest != null)
                    anObject.totalSumRest = anObject.totalSumRest.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.totalSumRest);
                continue;
             }
            if("COMMENTGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.commentGen);
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
            if("SERVICESOBJECTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.servicesObjectRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.servicesObjectRef.code);
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

   } // end of save(ENServicesFactCalc anObject,String[] anAttributes)


 public ENServicesFactCalcShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENServicesFactCalc filterObject = new ENServicesFactCalc();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENServicesFactCalcShort)list.get(0);
   return null;
  }

  public ENServicesFactCalcShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENServicesFactCalcShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENServicesFactCalcShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENServicesFactCalcShortList getFilteredList(ENServicesFactCalc filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENServicesFactCalcShortList getScrollableFilteredList(ENServicesFactCalc aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENServicesFactCalcShortList getScrollableFilteredList(ENServicesFactCalc aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENServicesFactCalcShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENServicesFactCalcShortList getScrollableFilteredList(ENServicesFactCalcFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENServicesFactCalcShortList getScrollableFilteredList(ENServicesFactCalcFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENServicesFactCalcShortList getScrollableFilteredList(ENServicesFactCalc aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENServicesFactCalcShortList getScrollableFilteredList(ENServicesFactCalc aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENServicesFactCalcShortList result = new ENServicesFactCalcShortList();
    ENServicesFactCalcShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENSERVICESFACTCALC.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENSERVICESFACTCALC.CODE"+
     ",ENSERVICESFACTCALC.CALCCOST"+
     ",ENSERVICESFACTCALC.MATERIALSCOST"+
     ",ENSERVICESFACTCALC.TRANSPORTCOST"+
     ",ENSERVICESFACTCALC.DELIVERYCOST"+
     ",ENSERVICESFACTCALC.SUMGEN"+
     ",ENSERVICESFACTCALC.VATSUM"+
     ",ENSERVICESFACTCALC.TOTALSUM"+
     ",ENSERVICESFACTCALC.SUMCALC"+
     ",ENSERVICESFACTCALC.VATSUMCALC"+
     ",ENSERVICESFACTCALC.TOTALSUMCALC"+
     ",ENSERVICESFACTCALC.PERCENTPREPAY"+
     ",ENSERVICESFACTCALC.SUMPREPAY"+
     ",ENSERVICESFACTCALC.VATSUMPREPAY"+
     ",ENSERVICESFACTCALC.TOTALSUMPREPAY"+
     ",ENSERVICESFACTCALC.SUMREST"+
     ",ENSERVICESFACTCALC.VATSUMREST"+
     ",ENSERVICESFACTCALC.TOTALSUMREST"+
     ",ENSERVICESFACTCALC.USERGEN"+
     ",ENSERVICESFACTCALC.DATEEDIT"+

      ", ENSERVICESOBJECT.CODE " +
      ", ENSERVICESOBJECT.CONTRACTNUMBER " +
      ", ENSERVICESOBJECT.CONTRACTDATE " +
      ", ENSERVICESOBJECT.NAME " +
      ", ENSERVICESOBJECT.PARTNERCODE " +
      ", ENSERVICESOBJECT.FINDOCCODE " +
      ", ENSERVICESOBJECT.FINDOCID " +
      ", ENSERVICESOBJECT.COMMENTGEN " +
      ", ENSERVICESOBJECT.CONTRACTNUMBERSERVICES " +
      ", ENSERVICESOBJECT.CONTRACTDATESERVICES " +
      ", ENSERVICESOBJECT.CONTRAGENTNAME " +
      ", ENSERVICESOBJECT.CONTRAGENTADDRESS " +
      ", ENSERVICESOBJECT.CONTRAGENTADDRESSWORK " +
      ", ENSERVICESOBJECT.CONTRAGENTOKPO " +
      ", ENSERVICESOBJECT.CONTRAGENTBANKACCOUNT " +
      ", ENSERVICESOBJECT.CONTRAGENTBANKNAME " +
      ", ENSERVICESOBJECT.CONTRAGENTBANKMFO " +
      ", ENSERVICESOBJECT.CONTRAGENTBOSSNAME " +
      ", ENSERVICESOBJECT.CONTRAGENTPASSPORT " +
      ", ENSERVICESOBJECT.CONTRACTSERVICESSUMMA " +
      ", ENSERVICESOBJECT.CONTRACTSERVICESPOWER " +
      ", ENSERVICESOBJECT.COMMENTSERVICESGEN " +
      ", ENSERVICESOBJECT.CONTRACTSERVICESDISTNC " +
      ", ENSERVICESOBJECT.CONTRACTSERVICESDAY " +
      ", ENSERVICESOBJECT.USERGEN " +
      ", ENSERVICESOBJECT.DATEEDIT " +
      ", ENSERVICESOBJECT.WARRANTDATE " +
      ", ENSERVICESOBJECT.WARRANTNUMBER " +
      ", ENSERVICESOBJECT.WARRANTFIO " +
      ", ENSERVICESOBJECT.REGIONALTYPE " +
      ", ENSERVICESOBJECT.BASISTYPE " +
      ", ENSERVICESOBJECT.CONTRAGENTPOSITION " +
      ", ENSERVICESOBJECT.EXECUTEWORKDATE " +
      ", ENSERVICESOBJECT.TIMESTART " +
      ", ENSERVICESOBJECT.TIMEFINAL " +
      ", ENSERVICESOBJECT.CONTRAGENTPHONENUMBER " +
      ", ENSERVICESOBJECT.EXECUTORPHONENUMBER " +
      ", ENSERVICESOBJECT.CONTRAGENTOBJECTWORK " +
      ", ENSERVICESOBJECT.ISNOPAY " +
      ", ENSERVICESOBJECT.ISCUSTOMERMATERIALS " +
      ", ENSERVICESOBJECT.PAYDATE " +
      ", ENSERVICESOBJECT.FINPAYFORMCODE " +
      ", ENSERVICESOBJECT.FINPAYFORMNAME " +
      ", ENSERVICESOBJECT.PARTNERID " +
      ", ENSERVICESOBJECT.PAYDETAIL " +
      ", ENSERVICESOBJECT.ACTTRANSFERNUMBER " +
      ", ENSERVICESOBJECT.ACTTRANSFERDATE " +
      ", ENSERVICESOBJECT.RESPOSIBLE " +
      ", ENSERVICESOBJECT.RESPOSIBLEPOSITION " +
      ", ENSERVICESOBJECT.RESPOSIBLETABNUMBER " +
      ", ENSERVICESOBJECT.CNPACKCODE " +
     " FROM ENSERVICESFACTCALC " +
     ", ENSERVICESOBJECT " +
     //" WHERE "
    "";
     whereStr = " ENSERVICESOBJECT.CODE = ENSERVICESFACTCALC.SERVICESOBJECTREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENSERVICESFACTCALC.CODE IN ( SELECT ENSERVICESFACTCALC.CODE FROM ENSERVICESFACTCALC ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.CODE = ?";
        }
        if(aFilterObject.calcCost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.CALCCOST = ?";
        }
        if(aFilterObject.materialsCost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.MATERIALSCOST = ?";
        }
        if(aFilterObject.transportCost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.TRANSPORTCOST = ?";
        }
        if(aFilterObject.deliveryCost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.DELIVERYCOST = ?";
        }
        if(aFilterObject.sumGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.SUMGEN = ?";
        }
        if(aFilterObject.vatSum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.VATSUM = ?";
        }
        if(aFilterObject.totalSum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.TOTALSUM = ?";
        }
        if(aFilterObject.sumCalc != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.SUMCALC = ?";
        }
        if(aFilterObject.vatSumCalc != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.VATSUMCALC = ?";
        }
        if(aFilterObject.totalSumCalc != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.TOTALSUMCALC = ?";
        }
        if(aFilterObject.percentPrepay != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.PERCENTPREPAY = ?";
        }
        if(aFilterObject.sumPrepay != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.SUMPREPAY = ?";
        }
        if(aFilterObject.vatSumPrepay != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.VATSUMPREPAY = ?";
        }
        if(aFilterObject.totalSumPrepay != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.TOTALSUMPREPAY = ?";
        }
        if(aFilterObject.sumRest != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.SUMREST = ?";
        }
        if(aFilterObject.vatSumRest != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.VATSUMREST = ?";
        }
        if(aFilterObject.totalSumRest != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.TOTALSUMREST = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSERVICESFACTCALC.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSERVICESFACTCALC.COMMENTGEN) LIKE UPPER(?)";
         }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENSERVICESFACTCALC.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENSERVICESFACTCALC.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.MODIFY_TIME = ?";
        }
        if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENSERVICESFACTCALC.SERVICESOBJECTREFCODE = ? ";
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
        if(aFilterObject.calcCost != null){
            number++;
            aFilterObject.calcCost = aFilterObject.calcCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.calcCost);
        }
        if(aFilterObject.materialsCost != null){
            number++;
            aFilterObject.materialsCost = aFilterObject.materialsCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.materialsCost);
        }
        if(aFilterObject.transportCost != null){
            number++;
            aFilterObject.transportCost = aFilterObject.transportCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.transportCost);
        }
        if(aFilterObject.deliveryCost != null){
            number++;
            aFilterObject.deliveryCost = aFilterObject.deliveryCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.deliveryCost);
        }
        if(aFilterObject.sumGen != null){
            number++;
            aFilterObject.sumGen = aFilterObject.sumGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGen);
        }
        if(aFilterObject.vatSum != null){
            number++;
            aFilterObject.vatSum = aFilterObject.vatSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.vatSum);
        }
        if(aFilterObject.totalSum != null){
            number++;
            aFilterObject.totalSum = aFilterObject.totalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalSum);
        }
        if(aFilterObject.sumCalc != null){
            number++;
            aFilterObject.sumCalc = aFilterObject.sumCalc.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumCalc);
        }
        if(aFilterObject.vatSumCalc != null){
            number++;
            aFilterObject.vatSumCalc = aFilterObject.vatSumCalc.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.vatSumCalc);
        }
        if(aFilterObject.totalSumCalc != null){
            number++;
            aFilterObject.totalSumCalc = aFilterObject.totalSumCalc.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalSumCalc);
        }
        if(aFilterObject.percentPrepay != null){
            number++;
            aFilterObject.percentPrepay = aFilterObject.percentPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.percentPrepay);
        }
        if(aFilterObject.sumPrepay != null){
            number++;
            aFilterObject.sumPrepay = aFilterObject.sumPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumPrepay);
        }
        if(aFilterObject.vatSumPrepay != null){
            number++;
            aFilterObject.vatSumPrepay = aFilterObject.vatSumPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.vatSumPrepay);
        }
        if(aFilterObject.totalSumPrepay != null){
            number++;
            aFilterObject.totalSumPrepay = aFilterObject.totalSumPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalSumPrepay);
        }
        if(aFilterObject.sumRest != null){
            number++;
            aFilterObject.sumRest = aFilterObject.sumRest.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumRest);
        }
        if(aFilterObject.vatSumRest != null){
            number++;
            aFilterObject.vatSumRest = aFilterObject.vatSumRest.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.vatSumRest);
        }
        if(aFilterObject.totalSumRest != null){
            number++;
            aFilterObject.totalSumRest = aFilterObject.totalSumRest.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalSumRest);
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
       if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.servicesObjectRef.code);
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

        anObject = new ENServicesFactCalcShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.calcCost = set.getBigDecimal(2);
        if(anObject.calcCost != null)
            anObject.calcCost = anObject.calcCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.materialsCost = set.getBigDecimal(3);
        if(anObject.materialsCost != null)
            anObject.materialsCost = anObject.materialsCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.transportCost = set.getBigDecimal(4);
        if(anObject.transportCost != null)
            anObject.transportCost = anObject.transportCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.deliveryCost = set.getBigDecimal(5);
        if(anObject.deliveryCost != null)
            anObject.deliveryCost = anObject.deliveryCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumGen = set.getBigDecimal(6);
        if(anObject.sumGen != null)
            anObject.sumGen = anObject.sumGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.vatSum = set.getBigDecimal(7);
        if(anObject.vatSum != null)
            anObject.vatSum = anObject.vatSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.totalSum = set.getBigDecimal(8);
        if(anObject.totalSum != null)
            anObject.totalSum = anObject.totalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumCalc = set.getBigDecimal(9);
        if(anObject.sumCalc != null)
            anObject.sumCalc = anObject.sumCalc.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.vatSumCalc = set.getBigDecimal(10);
        if(anObject.vatSumCalc != null)
            anObject.vatSumCalc = anObject.vatSumCalc.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.totalSumCalc = set.getBigDecimal(11);
        if(anObject.totalSumCalc != null)
            anObject.totalSumCalc = anObject.totalSumCalc.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.percentPrepay = set.getBigDecimal(12);
        if(anObject.percentPrepay != null)
            anObject.percentPrepay = anObject.percentPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumPrepay = set.getBigDecimal(13);
        if(anObject.sumPrepay != null)
            anObject.sumPrepay = anObject.sumPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.vatSumPrepay = set.getBigDecimal(14);
        if(anObject.vatSumPrepay != null)
            anObject.vatSumPrepay = anObject.vatSumPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.totalSumPrepay = set.getBigDecimal(15);
        if(anObject.totalSumPrepay != null)
            anObject.totalSumPrepay = anObject.totalSumPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumRest = set.getBigDecimal(16);
        if(anObject.sumRest != null)
            anObject.sumRest = anObject.sumRest.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.vatSumRest = set.getBigDecimal(17);
        if(anObject.vatSumRest != null)
            anObject.vatSumRest = anObject.vatSumRest.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.totalSumRest = set.getBigDecimal(18);
        if(anObject.totalSumRest != null)
            anObject.totalSumRest = anObject.totalSumRest.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userGen = set.getString(19);
        anObject.dateEdit = set.getTimestamp(20);

        anObject.servicesObjectRefCode = set.getInt(21);
        if(set.wasNull())
        anObject.servicesObjectRefCode = Integer.MIN_VALUE;
        anObject.servicesObjectRefContractNumber = set.getString(22);
        anObject.servicesObjectRefContractDate = set.getDate(23);
        anObject.servicesObjectRefName = set.getString(24);
        anObject.servicesObjectRefPartnerCode = set.getString(25);
        anObject.servicesObjectRefFinDocCode = set.getString(26);
        anObject.servicesObjectRefFinDocID = set.getInt(27);
        if(set.wasNull())
        anObject.servicesObjectRefFinDocID = Integer.MIN_VALUE;
        anObject.servicesObjectRefCommentGen = set.getString(28);
        anObject.servicesObjectRefContractNumberServices = set.getString(29);
        anObject.servicesObjectRefContractDateServices = set.getDate(30);
        anObject.servicesObjectRefContragentName = set.getString(31);
        anObject.servicesObjectRefContragentAddress = set.getString(32);
        anObject.servicesObjectRefContragentAddressWork = set.getString(33);
        anObject.servicesObjectRefContragentOkpo = set.getString(34);
        anObject.servicesObjectRefContragentBankAccount = set.getString(35);
        anObject.servicesObjectRefContragentBankName = set.getString(36);
        anObject.servicesObjectRefContragentBankMfo = set.getString(37);
        anObject.servicesObjectRefContragentBossName = set.getString(38);
        anObject.servicesObjectRefContragentPassport = set.getString(39);
        anObject.servicesObjectRefContractServicesSumma = set.getBigDecimal(40);
        if(anObject.servicesObjectRefContractServicesSumma != null)
          anObject.servicesObjectRefContractServicesSumma = anObject.servicesObjectRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefContractServicesPower = set.getBigDecimal(41);
        if(anObject.servicesObjectRefContractServicesPower != null)
          anObject.servicesObjectRefContractServicesPower = anObject.servicesObjectRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefCommentServicesGen = set.getString(42);
        anObject.servicesObjectRefContractServicesDistance = set.getBigDecimal(43);
        if(anObject.servicesObjectRefContractServicesDistance != null)
          anObject.servicesObjectRefContractServicesDistance = anObject.servicesObjectRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefContractServicesDay = set.getBigDecimal(44);
        if(anObject.servicesObjectRefContractServicesDay != null)
          anObject.servicesObjectRefContractServicesDay = anObject.servicesObjectRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefUserGen = set.getString(45);
        anObject.servicesObjectRefDateEdit = set.getDate(46);
        anObject.servicesObjectRefWarrantDate = set.getDate(47);
        anObject.servicesObjectRefWarrantNumber = set.getString(48);
        anObject.servicesObjectRefWarrantFIO = set.getString(49);
        anObject.servicesObjectRefRegionalType = set.getInt(50);
        if(set.wasNull())
        anObject.servicesObjectRefRegionalType = Integer.MIN_VALUE;
        anObject.servicesObjectRefBasisType = set.getBigDecimal(51);
        if(anObject.servicesObjectRefBasisType != null)
          anObject.servicesObjectRefBasisType = anObject.servicesObjectRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.servicesObjectRefContragentPosition = set.getString(52);
        anObject.servicesObjectRefExecuteWorkDate = set.getDate(53);
        anObject.servicesObjectRefTimeStart = set.getTimestamp(54);
        anObject.servicesObjectRefTimeFinal = set.getTimestamp(55);
        anObject.servicesObjectRefContragentPhoneNumber = set.getString(56);
        anObject.servicesObjectRefExecutorPhoneNumber = set.getString(57);
        anObject.servicesObjectRefContragentObjectWork = set.getString(58);
        anObject.servicesObjectRefIsNoPay = set.getInt(59);
        if(set.wasNull())
        anObject.servicesObjectRefIsNoPay = Integer.MIN_VALUE;
        anObject.servicesObjectRefIsCustomerMaterials = set.getInt(60);
        if(set.wasNull())
        anObject.servicesObjectRefIsCustomerMaterials = Integer.MIN_VALUE;
        anObject.servicesObjectRefPayDate = set.getDate(61);
        anObject.servicesObjectRefFinPayFormCode = set.getInt(62);
        if(set.wasNull())
        anObject.servicesObjectRefFinPayFormCode = Integer.MIN_VALUE;
        anObject.servicesObjectRefFinPayFormName = set.getString(63);
        anObject.servicesObjectRefPartnerId = set.getInt(64);
        if(set.wasNull())
        anObject.servicesObjectRefPartnerId = Integer.MIN_VALUE;
        anObject.servicesObjectRefPayDetail = set.getString(65);
        anObject.servicesObjectRefActTransferNumber = set.getString(66);
        anObject.servicesObjectRefActTransferDate = set.getDate(67);
        anObject.servicesObjectRefResposible = set.getString(68);
        anObject.servicesObjectRefResposiblePosition = set.getString(69);
        anObject.servicesObjectRefResposibleTabNumber = set.getString(70);
        anObject.servicesObjectRefCnPackCode = set.getInt(71);
        if(set.wasNull())
        anObject.servicesObjectRefCnPackCode = Integer.MIN_VALUE;

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

  public int[] getFilteredCodeArrayOLD(ENServicesFactCalc aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENSERVICESFACTCALC.CODE FROM ENSERVICESFACTCALC";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENSERVICESFACTCALC.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.CODE = ?";
        }
        if(aFilterObject.calcCost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.CALCCOST = ?";
        }
        if(aFilterObject.materialsCost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.MATERIALSCOST = ?";
        }
        if(aFilterObject.transportCost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.TRANSPORTCOST = ?";
        }
        if(aFilterObject.deliveryCost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.DELIVERYCOST = ?";
        }
        if(aFilterObject.sumGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.SUMGEN = ?";
        }
        if(aFilterObject.vatSum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.VATSUM = ?";
        }
        if(aFilterObject.totalSum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.TOTALSUM = ?";
        }
        if(aFilterObject.sumCalc != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.SUMCALC = ?";
        }
        if(aFilterObject.vatSumCalc != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.VATSUMCALC = ?";
        }
        if(aFilterObject.totalSumCalc != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.TOTALSUMCALC = ?";
        }
        if(aFilterObject.percentPrepay != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.PERCENTPREPAY = ?";
        }
        if(aFilterObject.sumPrepay != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.SUMPREPAY = ?";
        }
        if(aFilterObject.vatSumPrepay != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.VATSUMPREPAY = ?";
        }
        if(aFilterObject.totalSumPrepay != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.TOTALSUMPREPAY = ?";
        }
        if(aFilterObject.sumRest != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.SUMREST = ?";
        }
        if(aFilterObject.vatSumRest != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.VATSUMREST = ?";
        }
        if(aFilterObject.totalSumRest != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.TOTALSUMREST = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSERVICESFACTCALC.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENSERVICESFACTCALC.COMMENTGEN LIKE ?";
         }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSERVICESFACTCALC.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENSERVICESFACTCALC.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.MODIFY_TIME = ?";
        }
        if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSERVICESFACTCALC.SERVICESOBJECTREFCODE = ? ";
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
        if(aFilterObject.calcCost != null){
            number++;
            aFilterObject.calcCost = aFilterObject.calcCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.calcCost);
        }
        if(aFilterObject.materialsCost != null){
            number++;
            aFilterObject.materialsCost = aFilterObject.materialsCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.materialsCost);
        }
        if(aFilterObject.transportCost != null){
            number++;
            aFilterObject.transportCost = aFilterObject.transportCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.transportCost);
        }
        if(aFilterObject.deliveryCost != null){
            number++;
            aFilterObject.deliveryCost = aFilterObject.deliveryCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.deliveryCost);
        }
        if(aFilterObject.sumGen != null){
            number++;
            aFilterObject.sumGen = aFilterObject.sumGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGen);
        }
        if(aFilterObject.vatSum != null){
            number++;
            aFilterObject.vatSum = aFilterObject.vatSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.vatSum);
        }
        if(aFilterObject.totalSum != null){
            number++;
            aFilterObject.totalSum = aFilterObject.totalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalSum);
        }
        if(aFilterObject.sumCalc != null){
            number++;
            aFilterObject.sumCalc = aFilterObject.sumCalc.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumCalc);
        }
        if(aFilterObject.vatSumCalc != null){
            number++;
            aFilterObject.vatSumCalc = aFilterObject.vatSumCalc.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.vatSumCalc);
        }
        if(aFilterObject.totalSumCalc != null){
            number++;
            aFilterObject.totalSumCalc = aFilterObject.totalSumCalc.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalSumCalc);
        }
        if(aFilterObject.percentPrepay != null){
            number++;
            aFilterObject.percentPrepay = aFilterObject.percentPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.percentPrepay);
        }
        if(aFilterObject.sumPrepay != null){
            number++;
            aFilterObject.sumPrepay = aFilterObject.sumPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumPrepay);
        }
        if(aFilterObject.vatSumPrepay != null){
            number++;
            aFilterObject.vatSumPrepay = aFilterObject.vatSumPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.vatSumPrepay);
        }
        if(aFilterObject.totalSumPrepay != null){
            number++;
            aFilterObject.totalSumPrepay = aFilterObject.totalSumPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalSumPrepay);
        }
        if(aFilterObject.sumRest != null){
            number++;
            aFilterObject.sumRest = aFilterObject.sumRest.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumRest);
        }
        if(aFilterObject.vatSumRest != null){
            number++;
            aFilterObject.vatSumRest = aFilterObject.vatSumRest.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.vatSumRest);
        }
        if(aFilterObject.totalSumRest != null){
            number++;
            aFilterObject.totalSumRest = aFilterObject.totalSumRest.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalSumRest);
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENSERVICESFACTCALC.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENSERVICESFACTCALC.COMMENTGEN LIKE ?";

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
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENSERVICESFACTCALC.USERGEN = ?";
             else
                 whereStr = whereStr + " ENSERVICESFACTCALC.USERGEN LIKE ?";

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
       if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.servicesObjectRef.code);
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

  public int[] getFilteredCodeArray(ENServicesFactCalcFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENServicesFactCalc aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENSERVICESFACTCALC.CODE FROM ENSERVICESFACTCALC";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENSERVICESFACTCALC.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.CODE = ?";
        }
        if(aFilterObject.calcCost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.CALCCOST = ?";
        }
        if(aFilterObject.materialsCost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.MATERIALSCOST = ?";
        }
        if(aFilterObject.transportCost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.TRANSPORTCOST = ?";
        }
        if(aFilterObject.deliveryCost != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.DELIVERYCOST = ?";
        }
        if(aFilterObject.sumGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.SUMGEN = ?";
        }
        if(aFilterObject.vatSum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.VATSUM = ?";
        }
        if(aFilterObject.totalSum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.TOTALSUM = ?";
        }
        if(aFilterObject.sumCalc != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.SUMCALC = ?";
        }
        if(aFilterObject.vatSumCalc != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.VATSUMCALC = ?";
        }
        if(aFilterObject.totalSumCalc != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.TOTALSUMCALC = ?";
        }
        if(aFilterObject.percentPrepay != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.PERCENTPREPAY = ?";
        }
        if(aFilterObject.sumPrepay != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.SUMPREPAY = ?";
        }
        if(aFilterObject.vatSumPrepay != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.VATSUMPREPAY = ?";
        }
        if(aFilterObject.totalSumPrepay != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.TOTALSUMPREPAY = ?";
        }
        if(aFilterObject.sumRest != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.SUMREST = ?";
        }
        if(aFilterObject.vatSumRest != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.VATSUMREST = ?";
        }
        if(aFilterObject.totalSumRest != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.TOTALSUMREST = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSERVICESFACTCALC.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENSERVICESFACTCALC.COMMENTGEN LIKE ?";
         }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENSERVICESFACTCALC.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENSERVICESFACTCALC.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENSERVICESFACTCALC.MODIFY_TIME = ?";
        }
        if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENSERVICESFACTCALC.SERVICESOBJECTREFCODE = ? ";
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
        if(aFilterObject.calcCost != null){
            number++;
            aFilterObject.calcCost = aFilterObject.calcCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.calcCost);
        }
        if(aFilterObject.materialsCost != null){
            number++;
            aFilterObject.materialsCost = aFilterObject.materialsCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.materialsCost);
        }
        if(aFilterObject.transportCost != null){
            number++;
            aFilterObject.transportCost = aFilterObject.transportCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.transportCost);
        }
        if(aFilterObject.deliveryCost != null){
            number++;
            aFilterObject.deliveryCost = aFilterObject.deliveryCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.deliveryCost);
        }
        if(aFilterObject.sumGen != null){
            number++;
            aFilterObject.sumGen = aFilterObject.sumGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGen);
        }
        if(aFilterObject.vatSum != null){
            number++;
            aFilterObject.vatSum = aFilterObject.vatSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.vatSum);
        }
        if(aFilterObject.totalSum != null){
            number++;
            aFilterObject.totalSum = aFilterObject.totalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalSum);
        }
        if(aFilterObject.sumCalc != null){
            number++;
            aFilterObject.sumCalc = aFilterObject.sumCalc.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumCalc);
        }
        if(aFilterObject.vatSumCalc != null){
            number++;
            aFilterObject.vatSumCalc = aFilterObject.vatSumCalc.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.vatSumCalc);
        }
        if(aFilterObject.totalSumCalc != null){
            number++;
            aFilterObject.totalSumCalc = aFilterObject.totalSumCalc.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalSumCalc);
        }
        if(aFilterObject.percentPrepay != null){
            number++;
            aFilterObject.percentPrepay = aFilterObject.percentPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.percentPrepay);
        }
        if(aFilterObject.sumPrepay != null){
            number++;
            aFilterObject.sumPrepay = aFilterObject.sumPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumPrepay);
        }
        if(aFilterObject.vatSumPrepay != null){
            number++;
            aFilterObject.vatSumPrepay = aFilterObject.vatSumPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.vatSumPrepay);
        }
        if(aFilterObject.totalSumPrepay != null){
            number++;
            aFilterObject.totalSumPrepay = aFilterObject.totalSumPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalSumPrepay);
        }
        if(aFilterObject.sumRest != null){
            number++;
            aFilterObject.sumRest = aFilterObject.sumRest.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumRest);
        }
        if(aFilterObject.vatSumRest != null){
            number++;
            aFilterObject.vatSumRest = aFilterObject.vatSumRest.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.vatSumRest);
        }
        if(aFilterObject.totalSumRest != null){
            number++;
            aFilterObject.totalSumRest = aFilterObject.totalSumRest.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.totalSumRest);
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENSERVICESFACTCALC.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENSERVICESFACTCALC.COMMENTGEN LIKE ?";

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
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENSERVICESFACTCALC.USERGEN = ?";
             else
                 whereStr = whereStr + " ENSERVICESFACTCALC.USERGEN LIKE ?";

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
       if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.servicesObjectRef.code);
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


   public ENServicesFactCalc getObject(int uid) throws PersistenceException
   {
    ENServicesFactCalc result = new ENServicesFactCalc();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENServicesFactCalc anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENSERVICESFACTCALC.CODE, ENSERVICESFACTCALC.CALCCOST, ENSERVICESFACTCALC.MATERIALSCOST, ENSERVICESFACTCALC.TRANSPORTCOST, ENSERVICESFACTCALC.DELIVERYCOST, ENSERVICESFACTCALC.SUMGEN, ENSERVICESFACTCALC.VATSUM, ENSERVICESFACTCALC.TOTALSUM, ENSERVICESFACTCALC.SUMCALC, ENSERVICESFACTCALC.VATSUMCALC, ENSERVICESFACTCALC.TOTALSUMCALC, ENSERVICESFACTCALC.PERCENTPREPAY, ENSERVICESFACTCALC.SUMPREPAY, ENSERVICESFACTCALC.VATSUMPREPAY, ENSERVICESFACTCALC.TOTALSUMPREPAY, ENSERVICESFACTCALC.SUMREST, ENSERVICESFACTCALC.VATSUMREST, ENSERVICESFACTCALC.TOTALSUMREST, ENSERVICESFACTCALC.COMMENTGEN, ENSERVICESFACTCALC.USERGEN, ENSERVICESFACTCALC.DATEEDIT, ENSERVICESFACTCALC.MODIFY_TIME, ENSERVICESFACTCALC.SERVICESOBJECTREFCODE "
    +" FROM ENSERVICESFACTCALC WHERE ENSERVICESFACTCALC.CODE = ?";

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
        anObject.calcCost = set.getBigDecimal(2);
        if(anObject.calcCost != null)
            anObject.calcCost = anObject.calcCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.materialsCost = set.getBigDecimal(3);
        if(anObject.materialsCost != null)
            anObject.materialsCost = anObject.materialsCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.transportCost = set.getBigDecimal(4);
        if(anObject.transportCost != null)
            anObject.transportCost = anObject.transportCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.deliveryCost = set.getBigDecimal(5);
        if(anObject.deliveryCost != null)
            anObject.deliveryCost = anObject.deliveryCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumGen = set.getBigDecimal(6);
        if(anObject.sumGen != null)
            anObject.sumGen = anObject.sumGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.vatSum = set.getBigDecimal(7);
        if(anObject.vatSum != null)
            anObject.vatSum = anObject.vatSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.totalSum = set.getBigDecimal(8);
        if(anObject.totalSum != null)
            anObject.totalSum = anObject.totalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumCalc = set.getBigDecimal(9);
        if(anObject.sumCalc != null)
            anObject.sumCalc = anObject.sumCalc.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.vatSumCalc = set.getBigDecimal(10);
        if(anObject.vatSumCalc != null)
            anObject.vatSumCalc = anObject.vatSumCalc.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.totalSumCalc = set.getBigDecimal(11);
        if(anObject.totalSumCalc != null)
            anObject.totalSumCalc = anObject.totalSumCalc.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.percentPrepay = set.getBigDecimal(12);
        if(anObject.percentPrepay != null)
            anObject.percentPrepay = anObject.percentPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumPrepay = set.getBigDecimal(13);
        if(anObject.sumPrepay != null)
            anObject.sumPrepay = anObject.sumPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.vatSumPrepay = set.getBigDecimal(14);
        if(anObject.vatSumPrepay != null)
            anObject.vatSumPrepay = anObject.vatSumPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.totalSumPrepay = set.getBigDecimal(15);
        if(anObject.totalSumPrepay != null)
            anObject.totalSumPrepay = anObject.totalSumPrepay.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumRest = set.getBigDecimal(16);
        if(anObject.sumRest != null)
            anObject.sumRest = anObject.sumRest.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.vatSumRest = set.getBigDecimal(17);
        if(anObject.vatSumRest != null)
            anObject.vatSumRest = anObject.vatSumRest.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.totalSumRest = set.getBigDecimal(18);
        if(anObject.totalSumRest != null)
            anObject.totalSumRest = anObject.totalSumRest.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.commentGen = set.getString(19);
        anObject.userGen = set.getString(20);
        anObject.dateEdit = set.getTimestamp(21);
        anObject.modify_time = set.getLong(22);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.servicesObjectRef.code = set.getInt(23);
        if ( set.wasNull() )
            anObject.servicesObjectRef.code = Integer.MIN_VALUE;
        if(anObject.servicesObjectRef.code != Integer.MIN_VALUE)
        {
           anObject.setServicesObjectRef(
        new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).getRef(anObject.servicesObjectRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENServicesFactCalcRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENServicesFactCalcRef ref = new com.ksoe.energynet.valueobject.references.ENServicesFactCalcRef();
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

    selectStr = "DELETE FROM  ENSERVICESFACTCALC WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENServicesFactCalc object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENServicesFactCalc.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesFactCalc.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENServicesFactCalc.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesFactCalc.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENServicesFactCalc.getObject%} access denied");

    selectStr =

    "SELECT  ENSERVICESFACTCALC.CODE FROM  ENSERVICESFACTCALC WHERE  ENSERVICESFACTCALC.CODE = ?";
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
    _checkConditionToken(condition,"code","ENSERVICESFACTCALC.CODE");
    _checkConditionToken(condition,"calccost","ENSERVICESFACTCALC.CALCCOST");
    _checkConditionToken(condition,"materialscost","ENSERVICESFACTCALC.MATERIALSCOST");
    _checkConditionToken(condition,"transportcost","ENSERVICESFACTCALC.TRANSPORTCOST");
    _checkConditionToken(condition,"deliverycost","ENSERVICESFACTCALC.DELIVERYCOST");
    _checkConditionToken(condition,"sumgen","ENSERVICESFACTCALC.SUMGEN");
    _checkConditionToken(condition,"vatsum","ENSERVICESFACTCALC.VATSUM");
    _checkConditionToken(condition,"totalsum","ENSERVICESFACTCALC.TOTALSUM");
    _checkConditionToken(condition,"sumcalc","ENSERVICESFACTCALC.SUMCALC");
    _checkConditionToken(condition,"vatsumcalc","ENSERVICESFACTCALC.VATSUMCALC");
    _checkConditionToken(condition,"totalsumcalc","ENSERVICESFACTCALC.TOTALSUMCALC");
    _checkConditionToken(condition,"percentprepay","ENSERVICESFACTCALC.PERCENTPREPAY");
    _checkConditionToken(condition,"sumprepay","ENSERVICESFACTCALC.SUMPREPAY");
    _checkConditionToken(condition,"vatsumprepay","ENSERVICESFACTCALC.VATSUMPREPAY");
    _checkConditionToken(condition,"totalsumprepay","ENSERVICESFACTCALC.TOTALSUMPREPAY");
    _checkConditionToken(condition,"sumrest","ENSERVICESFACTCALC.SUMREST");
    _checkConditionToken(condition,"vatsumrest","ENSERVICESFACTCALC.VATSUMREST");
    _checkConditionToken(condition,"totalsumrest","ENSERVICESFACTCALC.TOTALSUMREST");
    _checkConditionToken(condition,"commentgen","ENSERVICESFACTCALC.COMMENTGEN");
    _checkConditionToken(condition,"usergen","ENSERVICESFACTCALC.USERGEN");
    _checkConditionToken(condition,"dateedit","ENSERVICESFACTCALC.DATEEDIT");
    _checkConditionToken(condition,"modify_time","ENSERVICESFACTCALC.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"servicesobjectref","SERVICESOBJECTREFCODE");
    _checkConditionToken(condition,"servicesobjectref.code","SERVICESOBJECTREFCODE");
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

   private void _collectAutoIncrementFields(ENServicesFactCalc anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("ENSERVICESFACTCALC", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("ENSERVICESFACTCALC", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("ENSERVICESFACTCALC", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: ENSERVICESFACTCALC");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of ENServicesFactCalcDAO

