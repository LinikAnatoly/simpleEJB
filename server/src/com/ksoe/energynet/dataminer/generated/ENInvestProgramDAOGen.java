
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
import com.ksoe.energynet.valueobject.ENInvestProgram;
import com.ksoe.energynet.valueobject.brief.ENInvestProgramShort;
import com.ksoe.energynet.valueobject.filter.ENInvestProgramFilter;
import com.ksoe.energynet.valueobject.lists.ENInvestProgramShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;

/**
 * DAO Object for ENInvestProgram;
 *
 */

public class ENInvestProgramDAOGen extends GenericDataMiner {

  public ENInvestProgramDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENInvestProgramDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENInvestProgram inObject) throws PersistenceException
   {
      ENInvestProgram obj = new ENInvestProgram();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.name != obj.name){
       return false;
     }

     if (inObject.itemNumber != obj.itemNumber){
       return false;
     }

     if (inObject.yearGen != obj.yearGen){
       return false;
     }

     if (inObject.commentGen != obj.commentGen){
       return false;
     }

     if ( ! inObject.countGen.equals(obj.countGen)){
       return false;
     }

     if ( ! inObject.price.equals(obj.price)){
       return false;
     }

     if ( ! inObject.sumGen.equals(obj.sumGen)){
       return false;
     }

     if ( ! inObject.quarter1count.equals(obj.quarter1count)){
       return false;
     }

     if ( ! inObject.quarter1sum.equals(obj.quarter1sum)){
       return false;
     }

     if ( ! inObject.quarter2count.equals(obj.quarter2count)){
       return false;
     }

     if ( ! inObject.quarter2sum.equals(obj.quarter2sum)){
       return false;
     }

     if ( ! inObject.quarter3count.equals(obj.quarter3count)){
       return false;
     }

     if ( ! inObject.quarter3sum.equals(obj.quarter3sum)){
       return false;
     }

     if ( ! inObject.quarter4count.equals(obj.quarter4count)){
       return false;
     }

     if ( ! inObject.quarter4sum.equals(obj.quarter4sum)){
       return false;
     }

     if (inObject.userAdd != obj.userAdd){
       return false;
     }

     if ( ! inObject.dateAdd.equals(obj.dateAdd)){
       return false;
     }

     if (inObject.userGen != obj.userGen){
       return false;
     }

     if ( ! inObject.dateEdit.equals(obj.dateEdit)){
       return false;
     }
     if (inObject.measurement.code != obj.measurement.code){
        return false;
     }
     if (inObject.elementRef.code != obj.elementRef.code){
        return false;
     }
     if (inObject.budgetRef.code != obj.budgetRef.code){
        return false;
     }
     if (inObject.statusRef.code != obj.statusRef.code){
        return false;
     }
     if (inObject.objectTypeRef.code != obj.objectTypeRef.code){
        return false;
     }
     if (inObject.planTypeRef.code != obj.planTypeRef.code){
        return false;
     }
     if (inObject.invGroupRef.code != obj.invGroupRef.code){
        return false;
     }
      return true;
   }

   public int add(ENInvestProgram anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENInvestProgram anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

    anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENINVESTPROGRAM (CODE,NAME,ITEMNUMBER,YEARGEN,COMMENTGEN,COUNTGEN,PRICE,SUMGEN,QUARTER1COUNT,QUARTER1SUM,QUARTER2COUNT,QUARTER2SUM,QUARTER3COUNT,QUARTER3SUM,QUARTER4COUNT,QUARTER4SUM,MODIFY_TIME,USERADD,DATEADD,USERGEN,DATEEDIT,MEASUREMENTCODE,ELEMENTREFCODE,BUDGETREFCODE,STATUSREFCODE,OBJECTTYPEREFCODE,PLANTYPEREFCODE,INVGROUPREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.name);
      statement.setString(3,anObject.itemNumber);
      if (anObject.yearGen != Integer.MIN_VALUE )
         statement.setInt(4,anObject.yearGen);
      else
         statement.setNull(4,java.sql.Types.INTEGER);
      statement.setString(5,anObject.commentGen);
      if (anObject.countGen != null)
        anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.countGen);
      if (anObject.price != null)
        anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.price);
      if (anObject.sumGen != null)
        anObject.sumGen = anObject.sumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.sumGen);
      if (anObject.quarter1count != null)
        anObject.quarter1count = anObject.quarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(9,anObject.quarter1count);
      if (anObject.quarter1sum != null)
        anObject.quarter1sum = anObject.quarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(10,anObject.quarter1sum);
      if (anObject.quarter2count != null)
        anObject.quarter2count = anObject.quarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(11,anObject.quarter2count);
      if (anObject.quarter2sum != null)
        anObject.quarter2sum = anObject.quarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(12,anObject.quarter2sum);
      if (anObject.quarter3count != null)
        anObject.quarter3count = anObject.quarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(13,anObject.quarter3count);
      if (anObject.quarter3sum != null)
        anObject.quarter3sum = anObject.quarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(14,anObject.quarter3sum);
      if (anObject.quarter4count != null)
        anObject.quarter4count = anObject.quarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(15,anObject.quarter4count);
      if (anObject.quarter4sum != null)
        anObject.quarter4sum = anObject.quarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(16,anObject.quarter4sum);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(17,null);
      else
        statement.setBigDecimal(17,new java.math.BigDecimal(anObject.modify_time));
      statement.setString(18,anObject.userAdd);
      if (anObject.dateAdd == null)
        statement.setTimestamp(19,null);
      else
        statement.setTimestamp(19,new java.sql.Timestamp(anObject.dateAdd.getTime()));
      statement.setString(20,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(21,null);
      else
        statement.setTimestamp(21,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.measurement.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKMeasurementDAOGen(connection,getUserProfile()).exists(anObject.measurement.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENInvestProgram.measurement.code%} = {%"+anObject.measurement.code+"%}");
        statement.setInt(22,anObject.measurement.code);
      }
      else
        statement.setNull(22,java.sql.Types.INTEGER);
      if (anObject.elementRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).exists(anObject.elementRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENInvestProgram.elementRef.code%} = {%"+anObject.elementRef.code+"%}");
        statement.setInt(23,anObject.elementRef.code);
      }
      else
        statement.setNull(23,java.sql.Types.INTEGER);
      if (anObject.budgetRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).exists(anObject.budgetRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENInvestProgram.budgetRef.code%} = {%"+anObject.budgetRef.code+"%}");
        statement.setInt(24,anObject.budgetRef.code);
      }
      else
        statement.setNull(24,java.sql.Types.INTEGER);
      if (anObject.statusRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENInvestProgramStatusDAOGen(connection,getUserProfile()).exists(anObject.statusRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENInvestProgram.statusRef.code%} = {%"+anObject.statusRef.code+"%}");
        statement.setInt(25,anObject.statusRef.code);
      }
      else
        statement.setNull(25,java.sql.Types.INTEGER);
      if (anObject.objectTypeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENInvestObjectTypeDAOGen(connection,getUserProfile()).exists(anObject.objectTypeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENInvestProgram.objectTypeRef.code%} = {%"+anObject.objectTypeRef.code+"%}");
        statement.setInt(26,anObject.objectTypeRef.code);
      }
      else
        statement.setNull(26,java.sql.Types.INTEGER);
      if (anObject.planTypeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkTypeDAOGen(connection,getUserProfile()).exists(anObject.planTypeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENInvestProgram.planTypeRef.code%} = {%"+anObject.planTypeRef.code+"%}");
        statement.setInt(27,anObject.planTypeRef.code);
      }
      else
        statement.setNull(27,java.sql.Types.INTEGER);
      if (anObject.invGroupRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENInvestProgramGroupsDAOGen(connection,getUserProfile()).exists(anObject.invGroupRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENInvestProgram.invGroupRef.code%} = {%"+anObject.invGroupRef.code+"%}");
        statement.setInt(28,anObject.invGroupRef.code);
      }
      else
        statement.setNull(28,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENInvestProgramDAOGen.add%}",e);
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

   public void save(ENInvestProgram anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENInvestProgram anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENInvestProgram oldObject = new ENInvestProgram();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENInvestProgram.modify_time_Field+" FROM  ENINVESTPROGRAM WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("NAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ITEMNUMBER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("YEARGEN") == 0)
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
          if(fieldNameStr.compareTo("COUNTGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PRICE") == 0)
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
          if(fieldNameStr.compareTo("QUARTER1COUNT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("QUARTER1SUM") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("QUARTER2COUNT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("QUARTER2SUM") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("QUARTER3COUNT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("QUARTER3SUM") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("QUARTER4COUNT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("QUARTER4SUM") == 0)
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
          if(fieldNameStr.compareTo("USERADD") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATEADD") == 0)
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
          if(fieldNameStr.compareTo("MEASUREMENT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ELEMENTREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("BUDGETREF") == 0)
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
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("OBJECTTYPEREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PLANTYPEREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("INVGROUPREF") == 0)
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
        "UPDATE ENINVESTPROGRAM SET  NAME = ? , ITEMNUMBER = ? , YEARGEN = ? , COMMENTGEN = ? , COUNTGEN = ? , PRICE = ? , SUMGEN = ? , QUARTER1COUNT = ? , QUARTER1SUM = ? , QUARTER2COUNT = ? , QUARTER2SUM = ? , QUARTER3COUNT = ? , QUARTER3SUM = ? , QUARTER4COUNT = ? , QUARTER4SUM = ? , MODIFY_TIME = ? , USERADD = ? , DATEADD = ? , USERGEN = ? , DATEEDIT = ? , MEASUREMENTCODE = ? , ELEMENTREFCODE = ? , BUDGETREFCODE = ? , STATUSREFCODE = ? , OBJECTTYPEREFCODE = ? , PLANTYPEREFCODE = ? , INVGROUPREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENINVESTPROGRAM SET ";
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
      statement.setString(2,anObject.itemNumber);
      if (anObject.yearGen != Integer.MIN_VALUE )
         statement.setInt(3,anObject.yearGen);
      else
         statement.setNull(3,java.sql.Types.INTEGER);
      statement.setString(4,anObject.commentGen);
      if (anObject.countGen != null)
        anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.countGen);

      if (anObject.price != null)
        anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.price);

      if (anObject.sumGen != null)
        anObject.sumGen = anObject.sumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.sumGen);

      if (anObject.quarter1count != null)
        anObject.quarter1count = anObject.quarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.quarter1count);

      if (anObject.quarter1sum != null)
        anObject.quarter1sum = anObject.quarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(9,anObject.quarter1sum);

      if (anObject.quarter2count != null)
        anObject.quarter2count = anObject.quarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(10,anObject.quarter2count);

      if (anObject.quarter2sum != null)
        anObject.quarter2sum = anObject.quarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(11,anObject.quarter2sum);

      if (anObject.quarter3count != null)
        anObject.quarter3count = anObject.quarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(12,anObject.quarter3count);

      if (anObject.quarter3sum != null)
        anObject.quarter3sum = anObject.quarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(13,anObject.quarter3sum);

      if (anObject.quarter4count != null)
        anObject.quarter4count = anObject.quarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(14,anObject.quarter4count);

      if (anObject.quarter4sum != null)
        anObject.quarter4sum = anObject.quarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(15,anObject.quarter4sum);

      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(16,null);
      else
        statement.setBigDecimal(16,new java.math.BigDecimal(anObject.modify_time));
      statement.setString(17,anObject.userAdd);
      if (anObject.dateAdd == null)
        statement.setDate(18,null);
      else
        statement.setTimestamp(18,new java.sql.Timestamp(anObject.dateAdd.getTime()));
      statement.setString(19,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setDate(20,null);
      else
        statement.setTimestamp(20,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.measurement.code != Integer.MIN_VALUE)
        statement.setInt(21,anObject.measurement.code);
      else
        statement.setNull(21,java.sql.Types.INTEGER);
      if (anObject.elementRef.code != Integer.MIN_VALUE)
        statement.setInt(22,anObject.elementRef.code);
      else
        statement.setNull(22,java.sql.Types.INTEGER);
      if (anObject.budgetRef.code != Integer.MIN_VALUE)
        statement.setInt(23,anObject.budgetRef.code);
      else
        statement.setNull(23,java.sql.Types.INTEGER);
      if (anObject.statusRef.code != Integer.MIN_VALUE)
        statement.setInt(24,anObject.statusRef.code);
      else
        statement.setNull(24,java.sql.Types.INTEGER);
      if (anObject.objectTypeRef.code != Integer.MIN_VALUE)
        statement.setInt(25,anObject.objectTypeRef.code);
      else
        statement.setNull(25,java.sql.Types.INTEGER);
      if (anObject.planTypeRef.code != Integer.MIN_VALUE)
        statement.setInt(26,anObject.planTypeRef.code);
      else
        statement.setNull(26,java.sql.Types.INTEGER);
      if (anObject.invGroupRef.code != Integer.MIN_VALUE)
        statement.setInt(27,anObject.invGroupRef.code);
      else
        statement.setNull(27,java.sql.Types.INTEGER);
          statement.setInt(28,anObject.code);
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
            if("ITEMNUMBER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.itemNumber);
                continue;
             }
            if("YEARGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.yearGen);
                continue;
             }
            if("COMMENTGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.commentGen);
                continue;
             }
            if("COUNTGEN".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.countGen != null)
                    anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.countGen);
                continue;
             }
            if("PRICE".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.price != null)
                    anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.price);
                continue;
             }
            if("SUMGEN".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sumGen != null)
                    anObject.sumGen = anObject.sumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sumGen);
                continue;
             }
            if("QUARTER1COUNT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.quarter1count != null)
                    anObject.quarter1count = anObject.quarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.quarter1count);
                continue;
             }
            if("QUARTER1SUM".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.quarter1sum != null)
                    anObject.quarter1sum = anObject.quarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.quarter1sum);
                continue;
             }
            if("QUARTER2COUNT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.quarter2count != null)
                    anObject.quarter2count = anObject.quarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.quarter2count);
                continue;
             }
            if("QUARTER2SUM".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.quarter2sum != null)
                    anObject.quarter2sum = anObject.quarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.quarter2sum);
                continue;
             }
            if("QUARTER3COUNT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.quarter3count != null)
                    anObject.quarter3count = anObject.quarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.quarter3count);
                continue;
             }
            if("QUARTER3SUM".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.quarter3sum != null)
                    anObject.quarter3sum = anObject.quarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.quarter3sum);
                continue;
             }
            if("QUARTER4COUNT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.quarter4count != null)
                    anObject.quarter4count = anObject.quarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.quarter4count);
                continue;
             }
            if("QUARTER4SUM".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.quarter4sum != null)
                    anObject.quarter4sum = anObject.quarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.quarter4sum);
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
            if("USERADD".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.userAdd);
                continue;
             }
            if("DATEADD".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dateAdd == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateAdd.getTime()));
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
            if("MEASUREMENT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.measurement.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.measurement.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("ELEMENTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.elementRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.elementRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("BUDGETREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.budgetRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.budgetRef.code);
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
            if("OBJECTTYPEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.objectTypeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.objectTypeRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("PLANTYPEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.planTypeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.planTypeRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("INVGROUPREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.invGroupRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.invGroupRef.code);
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

   } // end of save(ENInvestProgram anObject,String[] anAttributes)


 public ENInvestProgramShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENInvestProgram filterObject = new ENInvestProgram();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENInvestProgramShort)list.get(0);
   return null;
  }

  public ENInvestProgramShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENInvestProgramShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENInvestProgramShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENInvestProgramShortList getFilteredList(ENInvestProgram filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENInvestProgramShortList getScrollableFilteredList(ENInvestProgram aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENInvestProgramShortList getScrollableFilteredList(ENInvestProgram aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENInvestProgramShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENInvestProgramShortList getScrollableFilteredList(ENInvestProgramFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENInvestProgramShortList getScrollableFilteredList(ENInvestProgramFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENInvestProgramShortList getScrollableFilteredList(ENInvestProgram aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENInvestProgramShortList getScrollableFilteredList(ENInvestProgram aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENInvestProgramShortList result = new ENInvestProgramShortList();
    ENInvestProgramShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENINVESTPROGRAM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENINVESTPROGRAM.CODE"+
     ",ENINVESTPROGRAM.NAME"+
     ",ENINVESTPROGRAM.ITEMNUMBER"+
     ",ENINVESTPROGRAM.YEARGEN"+
     ",ENINVESTPROGRAM.COMMENTGEN"+
     ",ENINVESTPROGRAM.COUNTGEN"+
     ",ENINVESTPROGRAM.PRICE"+
     ",ENINVESTPROGRAM.SUMGEN"+
     ",ENINVESTPROGRAM.QUARTER1COUNT"+
     ",ENINVESTPROGRAM.QUARTER1SUM"+
     ",ENINVESTPROGRAM.QUARTER2COUNT"+
     ",ENINVESTPROGRAM.QUARTER2SUM"+
     ",ENINVESTPROGRAM.QUARTER3COUNT"+
     ",ENINVESTPROGRAM.QUARTER3SUM"+
     ",ENINVESTPROGRAM.QUARTER4COUNT"+
     ",ENINVESTPROGRAM.QUARTER4SUM"+
     ",ENINVESTPROGRAM.USERADD"+
     ",ENINVESTPROGRAM.DATEADD"+
     ",ENINVESTPROGRAM.USERGEN"+
     ",ENINVESTPROGRAM.DATEEDIT"+

      ", TKMEASUREMENT.CODE " +
      ", TKMEASUREMENT.NAME " +
      ", ENELEMENT.CODE " +
      ", ENDEPARTMENT.CODE " +
      ", ENDEPARTMENT.SHORTNAME " +
      ", ENDEPARTMENT.DATESTART " +
      ", ENDEPARTMENT.DATEFINAL " +
      ", ENDEPARTMENT.RENCODE " +
      ", ENDEPARTMENT.SHPZBALANS " +
      ", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
      ", ENDEPARTMENT.KAU_1884 " +
      ", ENDEPARTMENT.NAME_1884 " +
      ", ENINVESTPROGRAMSTATUS.CODE " +
      ", ENINVESTPROGRAMSTATUS.NAME " +
      ", ENINVESTOBJECTTYPE.CODE " +
      ", ENINVESTOBJECTTYPE.NAME " +
      ", ENPLANWORKTYPE.CODE " +
      ", ENPLANWORKTYPE.NAME " +
      ", ENPLANWORKTYPE.SHORTNAME " +
      ", ENINVESTPROGRAMGROUPS.CODE " +
      ", ENINVESTPROGRAMGROUPS.NAME " +
      ", ENINVESTPROGRAMGROUPS.COMMENTGEN " +
     " FROM ENINVESTPROGRAM " +
     ", TKMEASUREMENT " +
     ", ENELEMENT " +
     ", ENDEPARTMENT " +
     ", ENINVESTPROGRAMSTATUS " +
     ", ENINVESTOBJECTTYPE " +
     ", ENPLANWORKTYPE " +
     ", ENINVESTPROGRAMGROUPS " +
     //" WHERE "
    "";
     whereStr = " TKMEASUREMENT.CODE = ENINVESTPROGRAM.MEASUREMENTCODE" ; //+
      whereStr = whereStr +" AND ENELEMENT.CODE = ENINVESTPROGRAM.ELEMENTREFCODE" ; //+
      whereStr = whereStr +" AND ENDEPARTMENT.CODE = ENINVESTPROGRAM.BUDGETREFCODE" ; //+
      whereStr = whereStr +" AND ENINVESTPROGRAMSTATUS.CODE = ENINVESTPROGRAM.STATUSREFCODE" ; //+
      whereStr = whereStr +" AND ENINVESTOBJECTTYPE.CODE = ENINVESTPROGRAM.OBJECTTYPEREFCODE" ; //+
      whereStr = whereStr +" AND ENPLANWORKTYPE.CODE = ENINVESTPROGRAM.PLANTYPEREFCODE" ; //+
      whereStr = whereStr +" AND ENINVESTPROGRAMGROUPS.CODE = ENINVESTPROGRAM.INVGROUPREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENINVESTPROGRAM.CODE IN ( SELECT ENINVESTPROGRAM.CODE FROM ENINVESTPROGRAM ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENINVESTPROGRAM.NAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENINVESTPROGRAM.NAME) LIKE UPPER(?)";
         }
         if (aFilterObject.itemNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.itemNumber.indexOf('*',0) < 0 && aFilterObject.itemNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENINVESTPROGRAM.ITEMNUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENINVESTPROGRAM.ITEMNUMBER) LIKE UPPER(?)";
         }
        if(aFilterObject.yearGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.YEARGEN = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENINVESTPROGRAM.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENINVESTPROGRAM.COMMENTGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.COUNTGEN = ?";
        }
        if(aFilterObject.price != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.PRICE = ?";
        }
        if(aFilterObject.sumGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.SUMGEN = ?";
        }
        if(aFilterObject.quarter1count != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.QUARTER1COUNT = ?";
        }
        if(aFilterObject.quarter1sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.QUARTER1SUM = ?";
        }
        if(aFilterObject.quarter2count != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.QUARTER2COUNT = ?";
        }
        if(aFilterObject.quarter2sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.QUARTER2SUM = ?";
        }
        if(aFilterObject.quarter3count != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.QUARTER3COUNT = ?";
        }
        if(aFilterObject.quarter3sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.QUARTER3SUM = ?";
        }
        if(aFilterObject.quarter4count != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.QUARTER4COUNT = ?";
        }
        if(aFilterObject.quarter4sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.QUARTER4SUM = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.MODIFY_TIME = ?";
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENINVESTPROGRAM.USERADD) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENINVESTPROGRAM.USERADD) LIKE UPPER(?)";
         }
        if(aFilterObject.dateAdd != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.DATEADD = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENINVESTPROGRAM.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENINVESTPROGRAM.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.DATEEDIT = ?";
        }
        if(aFilterObject.measurement.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENINVESTPROGRAM.MEASUREMENTCODE = ? ";
        }
        if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENINVESTPROGRAM.ELEMENTREFCODE = ? ";
        }
        if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENINVESTPROGRAM.BUDGETREFCODE = ? ";
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENINVESTPROGRAM.STATUSREFCODE = ? ";
        }
        if(aFilterObject.objectTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENINVESTPROGRAM.OBJECTTYPEREFCODE = ? ";
        }
        if(aFilterObject.planTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENINVESTPROGRAM.PLANTYPEREFCODE = ? ";
        }
        if(aFilterObject.invGroupRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENINVESTPROGRAM.INVGROUPREFCODE = ? ";
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

           if(aFilterObject.itemNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.itemNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.yearGen != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.yearGen);
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
        if(aFilterObject.countGen != null){
            number++;
            aFilterObject.countGen = aFilterObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.price != null){
            number++;
            aFilterObject.price = aFilterObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.price);
        }
        if(aFilterObject.sumGen != null){
            number++;
            aFilterObject.sumGen = aFilterObject.sumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGen);
        }
        if(aFilterObject.quarter1count != null){
            number++;
            aFilterObject.quarter1count = aFilterObject.quarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter1count);
        }
        if(aFilterObject.quarter1sum != null){
            number++;
            aFilterObject.quarter1sum = aFilterObject.quarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter1sum);
        }
        if(aFilterObject.quarter2count != null){
            number++;
            aFilterObject.quarter2count = aFilterObject.quarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter2count);
        }
        if(aFilterObject.quarter2sum != null){
            number++;
            aFilterObject.quarter2sum = aFilterObject.quarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter2sum);
        }
        if(aFilterObject.quarter3count != null){
            number++;
            aFilterObject.quarter3count = aFilterObject.quarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter3count);
        }
        if(aFilterObject.quarter3sum != null){
            number++;
            aFilterObject.quarter3sum = aFilterObject.quarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter3sum);
        }
        if(aFilterObject.quarter4count != null){
            number++;
            aFilterObject.quarter4count = aFilterObject.quarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter4count);
        }
        if(aFilterObject.quarter4sum != null){
            number++;
            aFilterObject.quarter4sum = aFilterObject.quarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter4sum);
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }

           if(aFilterObject.userAdd != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.userAdd);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.dateAdd != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateAdd.getTime()));
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
       if(aFilterObject.measurement.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.measurement.code);
       }
       if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.elementRef.code);
       }
       if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.budgetRef.code);
       }
       if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.statusRef.code);
       }
       if(aFilterObject.objectTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.objectTypeRef.code);
       }
       if(aFilterObject.planTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planTypeRef.code);
       }
       if(aFilterObject.invGroupRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.invGroupRef.code);
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

        anObject = new ENInvestProgramShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.name = set.getString(2);
        anObject.itemNumber = set.getString(3);
        anObject.yearGen = set.getInt(4);
        if ( set.wasNull() )
            anObject.yearGen = Integer.MIN_VALUE;
        anObject.commentGen = set.getString(5);
        anObject.countGen = set.getBigDecimal(6);
        if(anObject.countGen != null)
            anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.price = set.getBigDecimal(7);
        if(anObject.price != null)
            anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumGen = set.getBigDecimal(8);
        if(anObject.sumGen != null)
            anObject.sumGen = anObject.sumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter1count = set.getBigDecimal(9);
        if(anObject.quarter1count != null)
            anObject.quarter1count = anObject.quarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter1sum = set.getBigDecimal(10);
        if(anObject.quarter1sum != null)
            anObject.quarter1sum = anObject.quarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter2count = set.getBigDecimal(11);
        if(anObject.quarter2count != null)
            anObject.quarter2count = anObject.quarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter2sum = set.getBigDecimal(12);
        if(anObject.quarter2sum != null)
            anObject.quarter2sum = anObject.quarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter3count = set.getBigDecimal(13);
        if(anObject.quarter3count != null)
            anObject.quarter3count = anObject.quarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter3sum = set.getBigDecimal(14);
        if(anObject.quarter3sum != null)
            anObject.quarter3sum = anObject.quarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter4count = set.getBigDecimal(15);
        if(anObject.quarter4count != null)
            anObject.quarter4count = anObject.quarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter4sum = set.getBigDecimal(16);
        if(anObject.quarter4sum != null)
            anObject.quarter4sum = anObject.quarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userAdd = set.getString(17);
        anObject.dateAdd = set.getTimestamp(18);
        anObject.userGen = set.getString(19);
        anObject.dateEdit = set.getTimestamp(20);

        anObject.measurementCode = set.getInt(21);
        if(set.wasNull())
        anObject.measurementCode = Integer.MIN_VALUE;
        anObject.measurementName = set.getString(22);
        anObject.elementRefCode = set.getInt(23);
        if(set.wasNull())
        anObject.elementRefCode = Integer.MIN_VALUE;
        anObject.budgetRefCode = set.getInt(24);
        if(set.wasNull())
        anObject.budgetRefCode = Integer.MIN_VALUE;
        anObject.budgetRefShortName = set.getString(25);
        anObject.budgetRefDateStart = set.getDate(26);
        anObject.budgetRefDateFinal = set.getDate(27);
        anObject.budgetRefRenCode = set.getInt(28);
        if(set.wasNull())
        anObject.budgetRefRenCode = Integer.MIN_VALUE;
        anObject.budgetRefShpzBalans = set.getString(29);
        anObject.budgetRefKau_table_id_1884 = set.getInt(30);
        if(set.wasNull())
        anObject.budgetRefKau_table_id_1884 = Integer.MIN_VALUE;
        anObject.budgetRefKau_1884 = set.getString(31);
        anObject.budgetRefName_1884 = set.getString(32);
        anObject.statusRefCode = set.getInt(33);
        if(set.wasNull())
        anObject.statusRefCode = Integer.MIN_VALUE;
        anObject.statusRefName = set.getString(34);
        anObject.objectTypeRefCode = set.getInt(35);
        if(set.wasNull())
        anObject.objectTypeRefCode = Integer.MIN_VALUE;
        anObject.objectTypeRefName = set.getString(36);
        anObject.planTypeRefCode = set.getInt(37);
        if(set.wasNull())
        anObject.planTypeRefCode = Integer.MIN_VALUE;
        anObject.planTypeRefName = set.getString(38);
        anObject.planTypeRefShortName = set.getString(39);
        anObject.invGroupRefCode = set.getInt(40);
        if(set.wasNull())
        anObject.invGroupRefCode = Integer.MIN_VALUE;
        anObject.invGroupRefName = set.getString(41);
        anObject.invGroupRefCommentgen = set.getString(42);

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

  public int[] getFilteredCodeArrayOLD(ENInvestProgram aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENINVESTPROGRAM.CODE FROM ENINVESTPROGRAM";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENINVESTPROGRAM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENINVESTPROGRAM.NAME = ?";
             else
                 whereStr = whereStr + "  ENINVESTPROGRAM.NAME LIKE ?";
         }
         if (aFilterObject.itemNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.itemNumber.indexOf('*',0) < 0 && aFilterObject.itemNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENINVESTPROGRAM.ITEMNUMBER = ?";
             else
                 whereStr = whereStr + "  ENINVESTPROGRAM.ITEMNUMBER LIKE ?";
         }
        if(aFilterObject.yearGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.YEARGEN = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENINVESTPROGRAM.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENINVESTPROGRAM.COMMENTGEN LIKE ?";
         }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.COUNTGEN = ?";
        }
        if(aFilterObject.price != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.PRICE = ?";
        }
        if(aFilterObject.sumGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.SUMGEN = ?";
        }
        if(aFilterObject.quarter1count != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.QUARTER1COUNT = ?";
        }
        if(aFilterObject.quarter1sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.QUARTER1SUM = ?";
        }
        if(aFilterObject.quarter2count != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.QUARTER2COUNT = ?";
        }
        if(aFilterObject.quarter2sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.QUARTER2SUM = ?";
        }
        if(aFilterObject.quarter3count != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.QUARTER3COUNT = ?";
        }
        if(aFilterObject.quarter3sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.QUARTER3SUM = ?";
        }
        if(aFilterObject.quarter4count != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.QUARTER4COUNT = ?";
        }
        if(aFilterObject.quarter4sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.QUARTER4SUM = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.MODIFY_TIME = ?";
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENINVESTPROGRAM.USERADD = ?";
             else
                 whereStr = whereStr + "  ENINVESTPROGRAM.USERADD LIKE ?";
         }
        if(aFilterObject.dateAdd != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.DATEADD = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENINVESTPROGRAM.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENINVESTPROGRAM.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.DATEEDIT = ?";
        }
        if(aFilterObject.measurement.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENINVESTPROGRAM.MEASUREMENTCODE = ? ";
        }
        if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENINVESTPROGRAM.ELEMENTREFCODE = ? ";
        }
        if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENINVESTPROGRAM.BUDGETREFCODE = ? ";
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENINVESTPROGRAM.STATUSREFCODE = ? ";
        }
        if(aFilterObject.objectTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENINVESTPROGRAM.OBJECTTYPEREFCODE = ? ";
        }
        if(aFilterObject.planTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENINVESTPROGRAM.PLANTYPEREFCODE = ? ";
        }
        if(aFilterObject.invGroupRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENINVESTPROGRAM.INVGROUPREFCODE = ? ";
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
                 whereStr = whereStr + " ENINVESTPROGRAM.NAME = ?";
             else
                 whereStr = whereStr + " ENINVESTPROGRAM.NAME LIKE ?";

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
         if (aFilterObject.itemNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.itemNumber.indexOf('*',0) < 0 && aFilterObject.itemNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENINVESTPROGRAM.ITEMNUMBER = ?";
             else
                 whereStr = whereStr + " ENINVESTPROGRAM.ITEMNUMBER LIKE ?";

           if(aFilterObject.itemNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.itemNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.yearGen != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.yearGen);
         }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENINVESTPROGRAM.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENINVESTPROGRAM.COMMENTGEN LIKE ?";

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
        if(aFilterObject.countGen != null){
            number++;
            aFilterObject.countGen = aFilterObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.price != null){
            number++;
            aFilterObject.price = aFilterObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.price);
        }
        if(aFilterObject.sumGen != null){
            number++;
            aFilterObject.sumGen = aFilterObject.sumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGen);
        }
        if(aFilterObject.quarter1count != null){
            number++;
            aFilterObject.quarter1count = aFilterObject.quarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter1count);
        }
        if(aFilterObject.quarter1sum != null){
            number++;
            aFilterObject.quarter1sum = aFilterObject.quarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter1sum);
        }
        if(aFilterObject.quarter2count != null){
            number++;
            aFilterObject.quarter2count = aFilterObject.quarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter2count);
        }
        if(aFilterObject.quarter2sum != null){
            number++;
            aFilterObject.quarter2sum = aFilterObject.quarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter2sum);
        }
        if(aFilterObject.quarter3count != null){
            number++;
            aFilterObject.quarter3count = aFilterObject.quarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter3count);
        }
        if(aFilterObject.quarter3sum != null){
            number++;
            aFilterObject.quarter3sum = aFilterObject.quarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter3sum);
        }
        if(aFilterObject.quarter4count != null){
            number++;
            aFilterObject.quarter4count = aFilterObject.quarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter4count);
        }
        if(aFilterObject.quarter4sum != null){
            number++;
            aFilterObject.quarter4sum = aFilterObject.quarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter4sum);
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENINVESTPROGRAM.USERADD = ?";
             else
                 whereStr = whereStr + " ENINVESTPROGRAM.USERADD LIKE ?";

           if(aFilterObject.userAdd != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.userAdd);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.dateAdd != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateAdd.getTime()));
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENINVESTPROGRAM.USERGEN = ?";
             else
                 whereStr = whereStr + " ENINVESTPROGRAM.USERGEN LIKE ?";

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
       if(aFilterObject.measurement.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.measurement.code);
       }
       if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.elementRef.code);
       }
       if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.budgetRef.code);
       }
       if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.statusRef.code);
       }
       if(aFilterObject.objectTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.objectTypeRef.code);
       }
       if(aFilterObject.planTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planTypeRef.code);
       }
       if(aFilterObject.invGroupRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.invGroupRef.code);
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

  public int[] getFilteredCodeArray(ENInvestProgramFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENInvestProgram aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENINVESTPROGRAM.CODE FROM ENINVESTPROGRAM";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENINVESTPROGRAM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENINVESTPROGRAM.NAME = ?";
             else
                 whereStr = whereStr + "  ENINVESTPROGRAM.NAME LIKE ?";
         }
         if (aFilterObject.itemNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.itemNumber.indexOf('*',0) < 0 && aFilterObject.itemNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENINVESTPROGRAM.ITEMNUMBER = ?";
             else
                 whereStr = whereStr + "  ENINVESTPROGRAM.ITEMNUMBER LIKE ?";
         }
        if(aFilterObject.yearGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.YEARGEN = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENINVESTPROGRAM.COMMENTGEN = ?";
             else
                 whereStr = whereStr + "  ENINVESTPROGRAM.COMMENTGEN LIKE ?";
         }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.COUNTGEN = ?";
        }
        if(aFilterObject.price != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.PRICE = ?";
        }
        if(aFilterObject.sumGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.SUMGEN = ?";
        }
        if(aFilterObject.quarter1count != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.QUARTER1COUNT = ?";
        }
        if(aFilterObject.quarter1sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.QUARTER1SUM = ?";
        }
        if(aFilterObject.quarter2count != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.QUARTER2COUNT = ?";
        }
        if(aFilterObject.quarter2sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.QUARTER2SUM = ?";
        }
        if(aFilterObject.quarter3count != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.QUARTER3COUNT = ?";
        }
        if(aFilterObject.quarter3sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.QUARTER3SUM = ?";
        }
        if(aFilterObject.quarter4count != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.QUARTER4COUNT = ?";
        }
        if(aFilterObject.quarter4sum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.QUARTER4SUM = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.MODIFY_TIME = ?";
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENINVESTPROGRAM.USERADD = ?";
             else
                 whereStr = whereStr + "  ENINVESTPROGRAM.USERADD LIKE ?";
         }
        if(aFilterObject.dateAdd != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.DATEADD = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENINVESTPROGRAM.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENINVESTPROGRAM.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENINVESTPROGRAM.DATEEDIT = ?";
        }
        if(aFilterObject.measurement.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENINVESTPROGRAM.MEASUREMENTCODE = ? ";
        }
        if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENINVESTPROGRAM.ELEMENTREFCODE = ? ";
        }
        if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENINVESTPROGRAM.BUDGETREFCODE = ? ";
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENINVESTPROGRAM.STATUSREFCODE = ? ";
        }
        if(aFilterObject.objectTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENINVESTPROGRAM.OBJECTTYPEREFCODE = ? ";
        }
        if(aFilterObject.planTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENINVESTPROGRAM.PLANTYPEREFCODE = ? ";
        }
        if(aFilterObject.invGroupRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENINVESTPROGRAM.INVGROUPREFCODE = ? ";
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
                 whereStr = whereStr + " ENINVESTPROGRAM.NAME = ?";
             else
                 whereStr = whereStr + " ENINVESTPROGRAM.NAME LIKE ?";

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
         if (aFilterObject.itemNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.itemNumber.indexOf('*',0) < 0 && aFilterObject.itemNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENINVESTPROGRAM.ITEMNUMBER = ?";
             else
                 whereStr = whereStr + " ENINVESTPROGRAM.ITEMNUMBER LIKE ?";

           if(aFilterObject.itemNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.itemNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.yearGen != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.yearGen);
         }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENINVESTPROGRAM.COMMENTGEN = ?";
             else
                 whereStr = whereStr + " ENINVESTPROGRAM.COMMENTGEN LIKE ?";

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
        if(aFilterObject.countGen != null){
            number++;
            aFilterObject.countGen = aFilterObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.price != null){
            number++;
            aFilterObject.price = aFilterObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.price);
        }
        if(aFilterObject.sumGen != null){
            number++;
            aFilterObject.sumGen = aFilterObject.sumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGen);
        }
        if(aFilterObject.quarter1count != null){
            number++;
            aFilterObject.quarter1count = aFilterObject.quarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter1count);
        }
        if(aFilterObject.quarter1sum != null){
            number++;
            aFilterObject.quarter1sum = aFilterObject.quarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter1sum);
        }
        if(aFilterObject.quarter2count != null){
            number++;
            aFilterObject.quarter2count = aFilterObject.quarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter2count);
        }
        if(aFilterObject.quarter2sum != null){
            number++;
            aFilterObject.quarter2sum = aFilterObject.quarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter2sum);
        }
        if(aFilterObject.quarter3count != null){
            number++;
            aFilterObject.quarter3count = aFilterObject.quarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter3count);
        }
        if(aFilterObject.quarter3sum != null){
            number++;
            aFilterObject.quarter3sum = aFilterObject.quarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter3sum);
        }
        if(aFilterObject.quarter4count != null){
            number++;
            aFilterObject.quarter4count = aFilterObject.quarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter4count);
        }
        if(aFilterObject.quarter4sum != null){
            number++;
            aFilterObject.quarter4sum = aFilterObject.quarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.quarter4sum);
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENINVESTPROGRAM.USERADD = ?";
             else
                 whereStr = whereStr + " ENINVESTPROGRAM.USERADD LIKE ?";

           if(aFilterObject.userAdd != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.userAdd);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.dateAdd != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateAdd.getTime()));
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENINVESTPROGRAM.USERGEN = ?";
             else
                 whereStr = whereStr + " ENINVESTPROGRAM.USERGEN LIKE ?";

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
       if(aFilterObject.measurement.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.measurement.code);
       }
       if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.elementRef.code);
       }
       if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.budgetRef.code);
       }
       if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.statusRef.code);
       }
       if(aFilterObject.objectTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.objectTypeRef.code);
       }
       if(aFilterObject.planTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.planTypeRef.code);
       }
       if(aFilterObject.invGroupRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.invGroupRef.code);
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


   public ENInvestProgram getObject(int uid) throws PersistenceException
   {
    ENInvestProgram result = new ENInvestProgram();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENInvestProgram anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENINVESTPROGRAM.CODE, ENINVESTPROGRAM.NAME, ENINVESTPROGRAM.ITEMNUMBER, ENINVESTPROGRAM.YEARGEN, ENINVESTPROGRAM.COMMENTGEN, ENINVESTPROGRAM.COUNTGEN, ENINVESTPROGRAM.PRICE, ENINVESTPROGRAM.SUMGEN, ENINVESTPROGRAM.QUARTER1COUNT, ENINVESTPROGRAM.QUARTER1SUM, ENINVESTPROGRAM.QUARTER2COUNT, ENINVESTPROGRAM.QUARTER2SUM, ENINVESTPROGRAM.QUARTER3COUNT, ENINVESTPROGRAM.QUARTER3SUM, ENINVESTPROGRAM.QUARTER4COUNT, ENINVESTPROGRAM.QUARTER4SUM, ENINVESTPROGRAM.MODIFY_TIME, ENINVESTPROGRAM.USERADD, ENINVESTPROGRAM.DATEADD, ENINVESTPROGRAM.USERGEN, ENINVESTPROGRAM.DATEEDIT, ENINVESTPROGRAM.MEASUREMENTCODE, ENINVESTPROGRAM.ELEMENTREFCODE, ENINVESTPROGRAM.BUDGETREFCODE, ENINVESTPROGRAM.STATUSREFCODE, ENINVESTPROGRAM.OBJECTTYPEREFCODE, ENINVESTPROGRAM.PLANTYPEREFCODE, ENINVESTPROGRAM.INVGROUPREFCODE "
    +" FROM ENINVESTPROGRAM WHERE ENINVESTPROGRAM.CODE = ?";

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
        anObject.itemNumber = set.getString(3);
        anObject.yearGen = set.getInt(4);
        if ( set.wasNull() )
           anObject.yearGen = Integer.MIN_VALUE;
        anObject.commentGen = set.getString(5);
        anObject.countGen = set.getBigDecimal(6);
        if(anObject.countGen != null)
            anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.price = set.getBigDecimal(7);
        if(anObject.price != null)
            anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumGen = set.getBigDecimal(8);
        if(anObject.sumGen != null)
            anObject.sumGen = anObject.sumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter1count = set.getBigDecimal(9);
        if(anObject.quarter1count != null)
            anObject.quarter1count = anObject.quarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter1sum = set.getBigDecimal(10);
        if(anObject.quarter1sum != null)
            anObject.quarter1sum = anObject.quarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter2count = set.getBigDecimal(11);
        if(anObject.quarter2count != null)
            anObject.quarter2count = anObject.quarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter2sum = set.getBigDecimal(12);
        if(anObject.quarter2sum != null)
            anObject.quarter2sum = anObject.quarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter3count = set.getBigDecimal(13);
        if(anObject.quarter3count != null)
            anObject.quarter3count = anObject.quarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter3sum = set.getBigDecimal(14);
        if(anObject.quarter3sum != null)
            anObject.quarter3sum = anObject.quarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter4count = set.getBigDecimal(15);
        if(anObject.quarter4count != null)
            anObject.quarter4count = anObject.quarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.quarter4sum = set.getBigDecimal(16);
        if(anObject.quarter4sum != null)
            anObject.quarter4sum = anObject.quarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.modify_time = set.getLong(17);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.userAdd = set.getString(18);
        anObject.dateAdd = set.getTimestamp(19);
        anObject.userGen = set.getString(20);
        anObject.dateEdit = set.getTimestamp(21);
        anObject.measurement.code = set.getInt(22);
        if ( set.wasNull() )
            anObject.measurement.code = Integer.MIN_VALUE;
        anObject.elementRef.code = set.getInt(23);
        if ( set.wasNull() )
            anObject.elementRef.code = Integer.MIN_VALUE;
        anObject.budgetRef.code = set.getInt(24);
        if ( set.wasNull() )
            anObject.budgetRef.code = Integer.MIN_VALUE;
        anObject.statusRef.code = set.getInt(25);
        if ( set.wasNull() )
            anObject.statusRef.code = Integer.MIN_VALUE;
        anObject.objectTypeRef.code = set.getInt(26);
        if ( set.wasNull() )
            anObject.objectTypeRef.code = Integer.MIN_VALUE;
        anObject.planTypeRef.code = set.getInt(27);
        if ( set.wasNull() )
            anObject.planTypeRef.code = Integer.MIN_VALUE;
        anObject.invGroupRef.code = set.getInt(28);
        if ( set.wasNull() )
            anObject.invGroupRef.code = Integer.MIN_VALUE;
        if(anObject.measurement.code != Integer.MIN_VALUE)
        {
           anObject.setMeasurement(
        new com.ksoe.techcard.dataminer.generated.TKMeasurementDAOGen(connection,getUserProfile()).getObject(anObject.measurement.code));
    }
        if(anObject.elementRef.code != Integer.MIN_VALUE)
        {
           anObject.setElementRef(
        new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).getRef(anObject.elementRef.code));
    }
        if(anObject.budgetRef.code != Integer.MIN_VALUE)
        {
           anObject.setBudgetRef(
        new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getRef(anObject.budgetRef.code));
    }
        if(anObject.statusRef.code != Integer.MIN_VALUE)
        {
           anObject.setStatusRef(
        new com.ksoe.energynet.dataminer.generated.ENInvestProgramStatusDAOGen(connection,getUserProfile()).getRef(anObject.statusRef.code));
    }
        if(anObject.objectTypeRef.code != Integer.MIN_VALUE)
        {
           anObject.setObjectTypeRef(
        new com.ksoe.energynet.dataminer.generated.ENInvestObjectTypeDAOGen(connection,getUserProfile()).getRef(anObject.objectTypeRef.code));
    }
        if(anObject.planTypeRef.code != Integer.MIN_VALUE)
        {
           anObject.setPlanTypeRef(
        new com.ksoe.energynet.dataminer.generated.ENPlanWorkTypeDAOGen(connection,getUserProfile()).getRef(anObject.planTypeRef.code));
    }
        if(anObject.invGroupRef.code != Integer.MIN_VALUE)
        {
           anObject.setInvGroupRef(
        new com.ksoe.energynet.dataminer.generated.ENInvestProgramGroupsDAOGen(connection,getUserProfile()).getRef(anObject.invGroupRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENInvestProgramRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENInvestProgramRef ref = new com.ksoe.energynet.valueobject.references.ENInvestProgramRef();
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

    selectStr = "DELETE FROM  ENINVESTPROGRAM WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENInvestProgram object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENInvestProgram.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENInvestProgram.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENInvestProgram.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENInvestProgram.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENInvestProgram.getObject%} access denied");

    selectStr =

    "SELECT  ENINVESTPROGRAM.CODE FROM  ENINVESTPROGRAM WHERE  ENINVESTPROGRAM.CODE = ?";
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
    _checkConditionToken(condition,"code","ENINVESTPROGRAM.CODE");
    _checkConditionToken(condition,"name","ENINVESTPROGRAM.NAME");
    _checkConditionToken(condition,"itemnumber","ENINVESTPROGRAM.ITEMNUMBER");
    _checkConditionToken(condition,"yeargen","ENINVESTPROGRAM.YEARGEN");
    _checkConditionToken(condition,"commentgen","ENINVESTPROGRAM.COMMENTGEN");
    _checkConditionToken(condition,"countgen","ENINVESTPROGRAM.COUNTGEN");
    _checkConditionToken(condition,"price","ENINVESTPROGRAM.PRICE");
    _checkConditionToken(condition,"sumgen","ENINVESTPROGRAM.SUMGEN");
    _checkConditionToken(condition,"quarter1count","ENINVESTPROGRAM.QUARTER1COUNT");
    _checkConditionToken(condition,"quarter1sum","ENINVESTPROGRAM.QUARTER1SUM");
    _checkConditionToken(condition,"quarter2count","ENINVESTPROGRAM.QUARTER2COUNT");
    _checkConditionToken(condition,"quarter2sum","ENINVESTPROGRAM.QUARTER2SUM");
    _checkConditionToken(condition,"quarter3count","ENINVESTPROGRAM.QUARTER3COUNT");
    _checkConditionToken(condition,"quarter3sum","ENINVESTPROGRAM.QUARTER3SUM");
    _checkConditionToken(condition,"quarter4count","ENINVESTPROGRAM.QUARTER4COUNT");
    _checkConditionToken(condition,"quarter4sum","ENINVESTPROGRAM.QUARTER4SUM");
    _checkConditionToken(condition,"modify_time","ENINVESTPROGRAM.MODIFY_TIME");
    _checkConditionToken(condition,"useradd","ENINVESTPROGRAM.USERADD");
    _checkConditionToken(condition,"dateadd","ENINVESTPROGRAM.DATEADD");
    _checkConditionToken(condition,"usergen","ENINVESTPROGRAM.USERGEN");
    _checkConditionToken(condition,"dateedit","ENINVESTPROGRAM.DATEEDIT");
      // relationship conditions
    _checkConditionToken(condition,"measurement","MEASUREMENTCODE");
    _checkConditionToken(condition,"measurement.code","MEASUREMENTCODE");
    _checkConditionToken(condition,"elementref","ELEMENTREFCODE");
    _checkConditionToken(condition,"elementref.code","ELEMENTREFCODE");
    _checkConditionToken(condition,"budgetref","BUDGETREFCODE");
    _checkConditionToken(condition,"budgetref.code","BUDGETREFCODE");
    _checkConditionToken(condition,"statusref","STATUSREFCODE");
    _checkConditionToken(condition,"statusref.code","STATUSREFCODE");
    _checkConditionToken(condition,"objecttyperef","OBJECTTYPEREFCODE");
    _checkConditionToken(condition,"objecttyperef.code","OBJECTTYPEREFCODE");
    _checkConditionToken(condition,"plantyperef","PLANTYPEREFCODE");
    _checkConditionToken(condition,"plantyperef.code","PLANTYPEREFCODE");
    _checkConditionToken(condition,"invgroupref","INVGROUPREFCODE");
    _checkConditionToken(condition,"invgroupref.code","INVGROUPREFCODE");
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

   private void _collectAutoIncrementFields(ENInvestProgram anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("ENINVESTPROGRAM", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("ENINVESTPROGRAM", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("ENINVESTPROGRAM", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: ENINVESTPROGRAM");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of ENInvestProgramDAO
