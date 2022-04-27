
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

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.valueobject.CNTechTerms;
import com.ksoe.energynet.valueobject.brief.CNTechTermsShort;
import com.ksoe.energynet.valueobject.filter.CNTechTermsFilter;
import com.ksoe.energynet.valueobject.lists.CNTechTermsShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for CNTechTerms;
 *
 */

public class CNTechTermsDAOGen extends GenericDataMiner {

  public CNTechTermsDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public CNTechTermsDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(CNTechTerms inObject) throws PersistenceException
   {
      CNTechTerms obj = new CNTechTerms();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.id_proposal != obj.id_proposal){
       return false;
     }

     if (inObject.proposalName != obj.proposalName){
       return false;
     }

     if ( ! inObject.power1.equals(obj.power1)){
       return false;
     }

     if ( ! inObject.power1prosp.equals(obj.power1prosp)){
       return false;
     }

     if ( ! inObject.power1heat.equals(obj.power1heat)){
       return false;
     }

     if ( ! inObject.power2.equals(obj.power2)){
       return false;
     }

     if ( ! inObject.power2prosp.equals(obj.power2prosp)){
       return false;
     }

     if ( ! inObject.power2heat.equals(obj.power2heat)){
       return false;
     }

     if ( ! inObject.power3.equals(obj.power3)){
       return false;
     }

     if ( ! inObject.power3prosp.equals(obj.power3prosp)){
       return false;
     }

     if ( ! inObject.power3heat.equals(obj.power3heat)){
       return false;
     }

     if ( ! inObject.pow_stove.equals(obj.pow_stove)){
       return false;
     }

     if ( ! inObject.pow_water_heat.equals(obj.pow_water_heat)){
       return false;
     }

     if ( ! inObject.pow_house_heat.equals(obj.pow_house_heat)){
       return false;
     }

     if ( ! inObject.tension_point.equals(obj.tension_point)){
       return false;
     }

     if ( ! inObject.current_automat.equals(obj.current_automat)){
       return false;
     }

     if ( ! inObject.pow_exist.equals(obj.pow_exist)){
       return false;
     }

     if ( ! inObject.tension_exist.equals(obj.tension_exist)){
       return false;
     }

     if (inObject.is_realized != obj.is_realized){
       return false;
     }

     if (inObject.reason != obj.reason){
       return false;
     }

     if (inObject.source != obj.source){
       return false;
     }

     if (inObject.source_num != obj.source_num){
       return false;
     }

     if (inObject.ensur_point != obj.ensur_point){
       return false;
     }

     if (inObject.ensur_point_num != obj.ensur_point_num){
       return false;
     }

     if (inObject.connect_point != obj.connect_point){
       return false;
     }

     if (inObject.connect_point_num != obj.connect_point_num){
       return false;
     }

     if (inObject.exploit_year != obj.exploit_year){
       return false;
     }

     if (inObject.baseStation != obj.baseStation){
       return false;
     }
     if (inObject.subsystemRef.code != obj.subsystemRef.code){
        return false;
     }
     if (inObject.cnPackRef.code != obj.cnPackRef.code){
        return false;
     }
      return true;
   }

   public int add(CNTechTerms anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(CNTechTerms anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO CNTECHTERMS (CODE,ID_PROPOSAL,PROPOSALNAME,POWER1,POWER1PROSP,POWER1HEAT,POWER2,POWER2PROSP,POWER2HEAT,POWER3,POWER3PROSP,POWER3HEAT,POW_STOVE,POW_WATER_HEAT,POW_HOUSE_HEAT,TENSION_POINT,CURRENT_AUTOMAT,POW_EXIST,TENSION_EXIST,IS_REALIZED,REASON,SOURCE,SOURCE_NUM,ENSUR_POINT,ENSUR_POINT_NUM,CONNECT_POINT,CONNECT_POINT_NUM,EXPLOIT_YEAR,BASESTATION,SUBSYSTEMREFCODE,CNPACKREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.id_proposal != Integer.MIN_VALUE )
         statement.setInt(2,anObject.id_proposal);
      else
         statement.setNull(2,java.sql.Types.INTEGER);
      statement.setString(3,anObject.proposalName);
      if (anObject.power1 != null)
        anObject.power1 = anObject.power1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.power1);
      if (anObject.power1prosp != null)
        anObject.power1prosp = anObject.power1prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.power1prosp);
      if (anObject.power1heat != null)
        anObject.power1heat = anObject.power1heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.power1heat);
      if (anObject.power2 != null)
        anObject.power2 = anObject.power2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.power2);
      if (anObject.power2prosp != null)
        anObject.power2prosp = anObject.power2prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.power2prosp);
      if (anObject.power2heat != null)
        anObject.power2heat = anObject.power2heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(9,anObject.power2heat);
      if (anObject.power3 != null)
        anObject.power3 = anObject.power3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(10,anObject.power3);
      if (anObject.power3prosp != null)
        anObject.power3prosp = anObject.power3prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(11,anObject.power3prosp);
      if (anObject.power3heat != null)
        anObject.power3heat = anObject.power3heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(12,anObject.power3heat);
      if (anObject.pow_stove != null)
        anObject.pow_stove = anObject.pow_stove.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(13,anObject.pow_stove);
      if (anObject.pow_water_heat != null)
        anObject.pow_water_heat = anObject.pow_water_heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(14,anObject.pow_water_heat);
      if (anObject.pow_house_heat != null)
        anObject.pow_house_heat = anObject.pow_house_heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(15,anObject.pow_house_heat);
      if (anObject.tension_point != null)
        anObject.tension_point = anObject.tension_point.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(16,anObject.tension_point);
      if (anObject.current_automat != null)
        anObject.current_automat = anObject.current_automat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(17,anObject.current_automat);
      if (anObject.pow_exist != null)
        anObject.pow_exist = anObject.pow_exist.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(18,anObject.pow_exist);
      if (anObject.tension_exist != null)
        anObject.tension_exist = anObject.tension_exist.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(19,anObject.tension_exist);
      if (anObject.is_realized != Integer.MIN_VALUE )
         statement.setInt(20,anObject.is_realized);
      else
         statement.setNull(20,java.sql.Types.INTEGER);
      statement.setString(21,anObject.reason);
      statement.setString(22,anObject.source);
      statement.setString(23,anObject.source_num);
      statement.setString(24,anObject.ensur_point);
      statement.setString(25,anObject.ensur_point_num);
      statement.setString(26,anObject.connect_point);
      statement.setString(27,anObject.connect_point_num);
      if (anObject.exploit_year != Integer.MIN_VALUE )
         statement.setInt(28,anObject.exploit_year);
      else
         statement.setNull(28,java.sql.Types.INTEGER);
      if (anObject.baseStation != Integer.MIN_VALUE )
         statement.setInt(29,anObject.baseStation);
      else
         statement.setNull(29,java.sql.Types.INTEGER);
      if (anObject.subsystemRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.CNSubsystemTypeDAOGen(connection,getUserProfile()).exists(anObject.subsystemRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.CNTechTerms.subsystemRef.code%} = {%"+anObject.subsystemRef.code+"%}");
        statement.setInt(30,anObject.subsystemRef.code);
      }
      else
        statement.setNull(30,java.sql.Types.INTEGER);
      if (anObject.cnPackRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.CNPackDAOGen(connection,getUserProfile()).exists(anObject.cnPackRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.CNTechTerms.cnPackRef.code%} = {%"+anObject.cnPackRef.code+"%}");
        statement.setInt(31,anObject.cnPackRef.code);
      }
      else
        statement.setNull(31,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%CNTechTermsDAOGen.add%}",e);
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

   public void save(CNTechTerms anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(CNTechTerms anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("ID_PROPOSAL") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PROPOSALNAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("POWER1") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("POWER1PROSP") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("POWER1HEAT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("POWER2") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("POWER2PROSP") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("POWER2HEAT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("POWER3") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("POWER3PROSP") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("POWER3HEAT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("POW_STOVE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("POW_WATER_HEAT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("POW_HOUSE_HEAT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TENSION_POINT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CURRENT_AUTOMAT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("POW_EXIST") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TENSION_EXIST") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("IS_REALIZED") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("REASON") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SOURCE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SOURCE_NUM") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ENSUR_POINT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ENSUR_POINT_NUM") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CONNECT_POINT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CONNECT_POINT_NUM") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("EXPLOIT_YEAR") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("BASESTATION") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUBSYSTEMREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CNPACKREF") == 0)
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
        "UPDATE CNTECHTERMS SET  ID_PROPOSAL = ? , PROPOSALNAME = ? , POWER1 = ? , POWER1PROSP = ? , POWER1HEAT = ? , POWER2 = ? , POWER2PROSP = ? , POWER2HEAT = ? , POWER3 = ? , POWER3PROSP = ? , POWER3HEAT = ? , POW_STOVE = ? , POW_WATER_HEAT = ? , POW_HOUSE_HEAT = ? , TENSION_POINT = ? , CURRENT_AUTOMAT = ? , POW_EXIST = ? , TENSION_EXIST = ? , IS_REALIZED = ? , REASON = ? , SOURCE = ? , SOURCE_NUM = ? , ENSUR_POINT = ? , ENSUR_POINT_NUM = ? , CONNECT_POINT = ? , CONNECT_POINT_NUM = ? , EXPLOIT_YEAR = ? , BASESTATION = ? , SUBSYSTEMREFCODE = ? , CNPACKREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE CNTECHTERMS SET ";
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
      if (anObject.id_proposal != Integer.MIN_VALUE )
         statement.setInt(1,anObject.id_proposal);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.proposalName);
      if (anObject.power1 != null)
        anObject.power1 = anObject.power1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.power1);
      if (anObject.power1prosp != null)
        anObject.power1prosp = anObject.power1prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.power1prosp);
      if (anObject.power1heat != null)
        anObject.power1heat = anObject.power1heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.power1heat);
      if (anObject.power2 != null)
        anObject.power2 = anObject.power2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.power2);
      if (anObject.power2prosp != null)
        anObject.power2prosp = anObject.power2prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.power2prosp);
      if (anObject.power2heat != null)
        anObject.power2heat = anObject.power2heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(8,anObject.power2heat);
      if (anObject.power3 != null)
        anObject.power3 = anObject.power3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(9,anObject.power3);
      if (anObject.power3prosp != null)
        anObject.power3prosp = anObject.power3prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(10,anObject.power3prosp);
      if (anObject.power3heat != null)
        anObject.power3heat = anObject.power3heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(11,anObject.power3heat);
      if (anObject.pow_stove != null)
        anObject.pow_stove = anObject.pow_stove.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(12,anObject.pow_stove);
      if (anObject.pow_water_heat != null)
        anObject.pow_water_heat = anObject.pow_water_heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(13,anObject.pow_water_heat);
      if (anObject.pow_house_heat != null)
        anObject.pow_house_heat = anObject.pow_house_heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(14,anObject.pow_house_heat);
      if (anObject.tension_point != null)
        anObject.tension_point = anObject.tension_point.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(15,anObject.tension_point);
      if (anObject.current_automat != null)
        anObject.current_automat = anObject.current_automat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(16,anObject.current_automat);
      if (anObject.pow_exist != null)
        anObject.pow_exist = anObject.pow_exist.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(17,anObject.pow_exist);
      if (anObject.tension_exist != null)
        anObject.tension_exist = anObject.tension_exist.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(18,anObject.tension_exist);
      if (anObject.is_realized != Integer.MIN_VALUE )
         statement.setInt(19,anObject.is_realized);
      else
         statement.setNull(19,java.sql.Types.INTEGER);
      statement.setString(20,anObject.reason);
      statement.setString(21,anObject.source);
      statement.setString(22,anObject.source_num);
      statement.setString(23,anObject.ensur_point);
      statement.setString(24,anObject.ensur_point_num);
      statement.setString(25,anObject.connect_point);
      statement.setString(26,anObject.connect_point_num);
      if (anObject.exploit_year != Integer.MIN_VALUE )
         statement.setInt(27,anObject.exploit_year);
      else
         statement.setNull(27,java.sql.Types.INTEGER);
      if (anObject.baseStation != Integer.MIN_VALUE )
         statement.setInt(28,anObject.baseStation);
      else
         statement.setNull(28,java.sql.Types.INTEGER);
      if (anObject.subsystemRef.code != Integer.MIN_VALUE)
        statement.setInt(29,anObject.subsystemRef.code);
      else
        statement.setNull(29,java.sql.Types.INTEGER);
      if (anObject.cnPackRef.code != Integer.MIN_VALUE)
        statement.setInt(30,anObject.cnPackRef.code);
      else
        statement.setNull(30,java.sql.Types.INTEGER);
          statement.setInt(31,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("ID_PROPOSAL".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.id_proposal);
                continue;
             }
            if("PROPOSALNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.proposalName);
                continue;
             }
            if("POWER1".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.power1 != null)
                    anObject.power1 = anObject.power1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.power1);
                continue;
             }
            if("POWER1PROSP".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.power1prosp != null)
                    anObject.power1prosp = anObject.power1prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.power1prosp);
                continue;
             }
            if("POWER1HEAT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.power1heat != null)
                    anObject.power1heat = anObject.power1heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.power1heat);
                continue;
             }
            if("POWER2".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.power2 != null)
                    anObject.power2 = anObject.power2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.power2);
                continue;
             }
            if("POWER2PROSP".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.power2prosp != null)
                    anObject.power2prosp = anObject.power2prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.power2prosp);
                continue;
             }
            if("POWER2HEAT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.power2heat != null)
                    anObject.power2heat = anObject.power2heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.power2heat);
                continue;
             }
            if("POWER3".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.power3 != null)
                    anObject.power3 = anObject.power3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.power3);
                continue;
             }
            if("POWER3PROSP".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.power3prosp != null)
                    anObject.power3prosp = anObject.power3prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.power3prosp);
                continue;
             }
            if("POWER3HEAT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.power3heat != null)
                    anObject.power3heat = anObject.power3heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.power3heat);
                continue;
             }
            if("POW_STOVE".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.pow_stove != null)
                    anObject.pow_stove = anObject.pow_stove.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.pow_stove);
                continue;
             }
            if("POW_WATER_HEAT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.pow_water_heat != null)
                    anObject.pow_water_heat = anObject.pow_water_heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.pow_water_heat);
                continue;
             }
            if("POW_HOUSE_HEAT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.pow_house_heat != null)
                    anObject.pow_house_heat = anObject.pow_house_heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.pow_house_heat);
                continue;
             }
            if("TENSION_POINT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.tension_point != null)
                    anObject.tension_point = anObject.tension_point.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.tension_point);
                continue;
             }
            if("CURRENT_AUTOMAT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.current_automat != null)
                    anObject.current_automat = anObject.current_automat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.current_automat);
                continue;
             }
            if("POW_EXIST".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.pow_exist != null)
                    anObject.pow_exist = anObject.pow_exist.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.pow_exist);
                continue;
             }
            if("TENSION_EXIST".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.tension_exist != null)
                    anObject.tension_exist = anObject.tension_exist.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.tension_exist);
                continue;
             }
            if("IS_REALIZED".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.is_realized);
                continue;
             }
            if("REASON".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.reason);
                continue;
             }
            if("SOURCE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.source);
                continue;
             }
            if("SOURCE_NUM".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.source_num);
                continue;
             }
            if("ENSUR_POINT".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.ensur_point);
                continue;
             }
            if("ENSUR_POINT_NUM".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.ensur_point_num);
                continue;
             }
            if("CONNECT_POINT".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.connect_point);
                continue;
             }
            if("CONNECT_POINT_NUM".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.connect_point_num);
                continue;
             }
            if("EXPLOIT_YEAR".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.exploit_year);
                continue;
             }
            if("BASESTATION".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.baseStation);
                continue;
             }
            if("SUBSYSTEMREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.subsystemRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.subsystemRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("CNPACKREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.cnPackRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.cnPackRef.code);
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

   } // end of save(CNTechTerms anObject,String[] anAttributes)


 public CNTechTermsShort getShortObject(int anObjectCode) throws PersistenceException
  {
   CNTechTerms filterObject = new CNTechTerms();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (CNTechTermsShort)list.get(0);
   return null;
  }

  public CNTechTermsShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public CNTechTermsShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public CNTechTermsShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public CNTechTermsShortList getFilteredList(CNTechTerms filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public CNTechTermsShortList getScrollableFilteredList(CNTechTerms aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public CNTechTermsShortList getScrollableFilteredList(CNTechTerms aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public CNTechTermsShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public CNTechTermsShortList getScrollableFilteredList(CNTechTermsFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public CNTechTermsShortList getScrollableFilteredList(CNTechTermsFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public CNTechTermsShortList getScrollableFilteredList(CNTechTerms aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public CNTechTermsShortList getScrollableFilteredList(CNTechTerms aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    CNTechTermsShortList result = new CNTechTermsShortList();
    CNTechTermsShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "CNTECHTERMS.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "CNTECHTERMS.CODE"+
     ",CNTECHTERMS.ID_PROPOSAL"+
     ",CNTECHTERMS.PROPOSALNAME"+
     ",CNTECHTERMS.POWER1"+
     ",CNTECHTERMS.POWER1PROSP"+
     ",CNTECHTERMS.POWER1HEAT"+
     ",CNTECHTERMS.POWER2"+
     ",CNTECHTERMS.POWER2PROSP"+
     ",CNTECHTERMS.POWER2HEAT"+
     ",CNTECHTERMS.POWER3"+
     ",CNTECHTERMS.POWER3PROSP"+
     ",CNTECHTERMS.POWER3HEAT"+
     ",CNTECHTERMS.POW_STOVE"+
     ",CNTECHTERMS.POW_WATER_HEAT"+
     ",CNTECHTERMS.POW_HOUSE_HEAT"+
     ",CNTECHTERMS.TENSION_POINT"+
     ",CNTECHTERMS.CURRENT_AUTOMAT"+
     ",CNTECHTERMS.POW_EXIST"+
     ",CNTECHTERMS.TENSION_EXIST"+
     ",CNTECHTERMS.IS_REALIZED"+
     ",CNTECHTERMS.REASON"+
     ",CNTECHTERMS.SOURCE"+
     ",CNTECHTERMS.SOURCE_NUM"+
     ",CNTECHTERMS.ENSUR_POINT"+
     ",CNTECHTERMS.ENSUR_POINT_NUM"+
     ",CNTECHTERMS.CONNECT_POINT"+
     ",CNTECHTERMS.CONNECT_POINT_NUM"+
     ",CNTECHTERMS.EXPLOIT_YEAR"+
     ",CNTECHTERMS.BASESTATION"+

      ", CNSUBSYSTEMTYPE.CODE " +
      ", CNSUBSYSTEMTYPE.NAME " +
      ", CNPACK.CODE " +
      ", CNPACK.PACKCODE " +
      ", CNPACK.NAME " +
      ", CNPACK.ID_REN " +
      ", CNPACK.RENNAME " +
      ", CNPACK.ID_DISTRICT " +
      ", CNPACK.DISTRICTNAME " +
      ", CNPACK.ID_PACK_STATUS " +
      ", CNPACK.STATUSNAME " +
      ", CNPACK.DESCRIPTION " +
      ", CNPACK.POWER " +
      ", CNPACK.ADDRESS " +
      ", CNPACK.ADDRESS_JUR " +
      ", CNPACK.REG_NUM_CN_CONTRACT " +
      ", CNPACK.DATE_CN_CONTRACT " +
      ", CNPACK.REG_NUM_SPL_PP_CONTRCT " +
      ", CNPACK.DATE_SPL_PP_CONTRACT " +
      ", CNPACK.REG_NUM_TU_CONTRACT " +
      ", CNPACK.DATE_TU_CONTRACT " +
      ", CNPACK.REG_NUM_TU_CR_CONTRACT " +
      ", CNPACK.DATE_TU_CR_CONTRACT " +
      ", CNPACK.PROJECT_NUM " +
      ", CNPACK.PROJECT_DATE " +
      ", CNPACK.OVER5 " +
      ", CNPACK.STATUS " +
      ", CNPACK.LETTER_NUM_CUSTOMER " +
      ", CNPACK.DATE_LETTER_CUSTOMER " +
      ", CNPACK.LETTER_NUM " +
      ", CNPACK.DATE_LETTER " +
      ", CNPACK.RELIABILITY_CLASS " +
      ", CNPACK.ID_WAITING_STATUS " +
      ", CNPACK.WAITINGSTATUS " +
      ", CNPACK.IS_PAYABLE " +
      ", CNPACK.WORKSIZE " +
      ", CNPACK.WORK_INC_NET " +
      ", CNPACK.BUSINESS_TYPE " +
      ", CNPACK.ESTIMATETERM " +
      ", CNPACK.ESTIMATEDATE " +
      ", CNPACK.BUILDINGTERM " +
      ", CNPACK.BUILDINGDATE " +
      ", CNPACK.BUYINGTERM " +
      ", CNPACK.BUYINGDATE " +
      ", CNPACK.ESTIMATE_NUM " +
      ", CNPACK.ESTIMATE_CONTRACT_DATE " +
      ", CNPACK.IS_RESERV " +
      ", CNPACK.PURPOSE " +
      ", CNPACK.IS_KSOE " +
      ", CNPACK.OVER150 " +
      ", CNPACK.IS_NEW " +
      ", CNPACK.IS3PHASES " +
     " FROM CNTECHTERMS " +
     ", CNSUBSYSTEMTYPE " +
     ", CNPACK " +
     //" WHERE "
    "";
     whereStr = " CNSUBSYSTEMTYPE.CODE = CNTECHTERMS.SUBSYSTEMREFCODE" ; //+
      whereStr = whereStr +" AND CNPACK.CODE = CNTECHTERMS.CNPACKREFCODE" ; //+
        //selectStr = selectStr + " ${s} CNTECHTERMS.CODE IN ( SELECT CNTECHTERMS.CODE FROM CNTECHTERMS ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.CODE = ?";
        }
        if(aFilterObject.id_proposal != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.ID_PROPOSAL = ?";
        }
         if (aFilterObject.proposalName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.proposalName.indexOf('*',0) < 0 && aFilterObject.proposalName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNTECHTERMS.PROPOSALNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNTECHTERMS.PROPOSALNAME) LIKE UPPER(?)";
         }
        if(aFilterObject.power1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POWER1 = ?";
        }
        if(aFilterObject.power1prosp != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POWER1PROSP = ?";
        }
        if(aFilterObject.power1heat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POWER1HEAT = ?";
        }
        if(aFilterObject.power2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POWER2 = ?";
        }
        if(aFilterObject.power2prosp != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POWER2PROSP = ?";
        }
        if(aFilterObject.power2heat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POWER2HEAT = ?";
        }
        if(aFilterObject.power3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POWER3 = ?";
        }
        if(aFilterObject.power3prosp != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POWER3PROSP = ?";
        }
        if(aFilterObject.power3heat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POWER3HEAT = ?";
        }
        if(aFilterObject.pow_stove != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POW_STOVE = ?";
        }
        if(aFilterObject.pow_water_heat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POW_WATER_HEAT = ?";
        }
        if(aFilterObject.pow_house_heat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POW_HOUSE_HEAT = ?";
        }
        if(aFilterObject.tension_point != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.TENSION_POINT = ?";
        }
        if(aFilterObject.current_automat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.CURRENT_AUTOMAT = ?";
        }
        if(aFilterObject.pow_exist != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POW_EXIST = ?";
        }
        if(aFilterObject.tension_exist != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.TENSION_EXIST = ?";
        }
        if(aFilterObject.is_realized != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.IS_REALIZED = ?";
        }
         if (aFilterObject.reason != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.reason.indexOf('*',0) < 0 && aFilterObject.reason.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNTECHTERMS.REASON) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNTECHTERMS.REASON) LIKE UPPER(?)";
         }
         if (aFilterObject.source != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.source.indexOf('*',0) < 0 && aFilterObject.source.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNTECHTERMS.SOURCE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNTECHTERMS.SOURCE) LIKE UPPER(?)";
         }
         if (aFilterObject.source_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.source_num.indexOf('*',0) < 0 && aFilterObject.source_num.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNTECHTERMS.SOURCE_NUM) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNTECHTERMS.SOURCE_NUM) LIKE UPPER(?)";
         }
         if (aFilterObject.ensur_point != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.ensur_point.indexOf('*',0) < 0 && aFilterObject.ensur_point.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNTECHTERMS.ENSUR_POINT) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNTECHTERMS.ENSUR_POINT) LIKE UPPER(?)";
         }
         if (aFilterObject.ensur_point_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.ensur_point_num.indexOf('*',0) < 0 && aFilterObject.ensur_point_num.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNTECHTERMS.ENSUR_POINT_NUM) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNTECHTERMS.ENSUR_POINT_NUM) LIKE UPPER(?)";
         }
         if (aFilterObject.connect_point != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.connect_point.indexOf('*',0) < 0 && aFilterObject.connect_point.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNTECHTERMS.CONNECT_POINT) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNTECHTERMS.CONNECT_POINT) LIKE UPPER(?)";
         }
         if (aFilterObject.connect_point_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.connect_point_num.indexOf('*',0) < 0 && aFilterObject.connect_point_num.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNTECHTERMS.CONNECT_POINT_NUM) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNTECHTERMS.CONNECT_POINT_NUM) LIKE UPPER(?)";
         }
        if(aFilterObject.exploit_year != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.EXPLOIT_YEAR = ?";
        }
        if(aFilterObject.baseStation != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.BASESTATION = ?";
        }
        if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "CNTECHTERMS.SUBSYSTEMREFCODE = ? ";
        }
        if(aFilterObject.cnPackRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "CNTECHTERMS.CNPACKREFCODE = ? ";
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
         if(aFilterObject.id_proposal != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_proposal);
         }

           if(aFilterObject.proposalName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.proposalName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.power1 != null){
            number++;
            aFilterObject.power1 = aFilterObject.power1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power1);
        }
        if(aFilterObject.power1prosp != null){
            number++;
            aFilterObject.power1prosp = aFilterObject.power1prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power1prosp);
        }
        if(aFilterObject.power1heat != null){
            number++;
            aFilterObject.power1heat = aFilterObject.power1heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power1heat);
        }
        if(aFilterObject.power2 != null){
            number++;
            aFilterObject.power2 = aFilterObject.power2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power2);
        }
        if(aFilterObject.power2prosp != null){
            number++;
            aFilterObject.power2prosp = aFilterObject.power2prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power2prosp);
        }
        if(aFilterObject.power2heat != null){
            number++;
            aFilterObject.power2heat = aFilterObject.power2heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power2heat);
        }
        if(aFilterObject.power3 != null){
            number++;
            aFilterObject.power3 = aFilterObject.power3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power3);
        }
        if(aFilterObject.power3prosp != null){
            number++;
            aFilterObject.power3prosp = aFilterObject.power3prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power3prosp);
        }
        if(aFilterObject.power3heat != null){
            number++;
            aFilterObject.power3heat = aFilterObject.power3heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power3heat);
        }
        if(aFilterObject.pow_stove != null){
            number++;
            aFilterObject.pow_stove = aFilterObject.pow_stove.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.pow_stove);
        }
        if(aFilterObject.pow_water_heat != null){
            number++;
            aFilterObject.pow_water_heat = aFilterObject.pow_water_heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.pow_water_heat);
        }
        if(aFilterObject.pow_house_heat != null){
            number++;
            aFilterObject.pow_house_heat = aFilterObject.pow_house_heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.pow_house_heat);
        }
        if(aFilterObject.tension_point != null){
            number++;
            aFilterObject.tension_point = aFilterObject.tension_point.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.tension_point);
        }
        if(aFilterObject.current_automat != null){
            number++;
            aFilterObject.current_automat = aFilterObject.current_automat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.current_automat);
        }
        if(aFilterObject.pow_exist != null){
            number++;
            aFilterObject.pow_exist = aFilterObject.pow_exist.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.pow_exist);
        }
        if(aFilterObject.tension_exist != null){
            number++;
            aFilterObject.tension_exist = aFilterObject.tension_exist.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.tension_exist);
        }
         if(aFilterObject.is_realized != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is_realized);
         }

           if(aFilterObject.reason != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.reason);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.source != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.source);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.source_num != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.source_num);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.ensur_point != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.ensur_point);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.ensur_point_num != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.ensur_point_num);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.connect_point != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.connect_point);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.connect_point_num != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.connect_point_num);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.exploit_year != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.exploit_year);
         }
         if(aFilterObject.baseStation != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.baseStation);
         }
       if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.subsystemRef.code);
       }
       if(aFilterObject.cnPackRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cnPackRef.code);
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

        anObject = new CNTechTermsShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.id_proposal = set.getInt(2);
        if ( set.wasNull() )
            anObject.id_proposal = Integer.MIN_VALUE;
        anObject.proposalName = set.getString(3);
        anObject.power1 = set.getBigDecimal(4);
        if(anObject.power1 != null)
            anObject.power1 = anObject.power1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power1prosp = set.getBigDecimal(5);
        if(anObject.power1prosp != null)
            anObject.power1prosp = anObject.power1prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power1heat = set.getBigDecimal(6);
        if(anObject.power1heat != null)
            anObject.power1heat = anObject.power1heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power2 = set.getBigDecimal(7);
        if(anObject.power2 != null)
            anObject.power2 = anObject.power2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power2prosp = set.getBigDecimal(8);
        if(anObject.power2prosp != null)
            anObject.power2prosp = anObject.power2prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power2heat = set.getBigDecimal(9);
        if(anObject.power2heat != null)
            anObject.power2heat = anObject.power2heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power3 = set.getBigDecimal(10);
        if(anObject.power3 != null)
            anObject.power3 = anObject.power3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power3prosp = set.getBigDecimal(11);
        if(anObject.power3prosp != null)
            anObject.power3prosp = anObject.power3prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power3heat = set.getBigDecimal(12);
        if(anObject.power3heat != null)
            anObject.power3heat = anObject.power3heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.pow_stove = set.getBigDecimal(13);
        if(anObject.pow_stove != null)
            anObject.pow_stove = anObject.pow_stove.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.pow_water_heat = set.getBigDecimal(14);
        if(anObject.pow_water_heat != null)
            anObject.pow_water_heat = anObject.pow_water_heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.pow_house_heat = set.getBigDecimal(15);
        if(anObject.pow_house_heat != null)
            anObject.pow_house_heat = anObject.pow_house_heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.tension_point = set.getBigDecimal(16);
        if(anObject.tension_point != null)
            anObject.tension_point = anObject.tension_point.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.current_automat = set.getBigDecimal(17);
        if(anObject.current_automat != null)
            anObject.current_automat = anObject.current_automat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.pow_exist = set.getBigDecimal(18);
        if(anObject.pow_exist != null)
            anObject.pow_exist = anObject.pow_exist.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.tension_exist = set.getBigDecimal(19);
        if(anObject.tension_exist != null)
            anObject.tension_exist = anObject.tension_exist.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.is_realized = set.getInt(20);
        if ( set.wasNull() )
            anObject.is_realized = Integer.MIN_VALUE;
        anObject.reason = set.getString(21);
        anObject.source = set.getString(22);
        anObject.source_num = set.getString(23);
        anObject.ensur_point = set.getString(24);
        anObject.ensur_point_num = set.getString(25);
        anObject.connect_point = set.getString(26);
        anObject.connect_point_num = set.getString(27);
        anObject.exploit_year = set.getInt(28);
        if ( set.wasNull() )
            anObject.exploit_year = Integer.MIN_VALUE;
        anObject.baseStation = set.getInt(29);
        if ( set.wasNull() )
            anObject.baseStation = Integer.MIN_VALUE;

        anObject.subsystemRefCode = set.getInt(30);
        if(set.wasNull())
        anObject.subsystemRefCode = Integer.MIN_VALUE;
        anObject.subsystemRefName = set.getString(31);
        anObject.cnPackRefCode = set.getInt(32);
        if(set.wasNull())
        anObject.cnPackRefCode = Integer.MIN_VALUE;
        anObject.cnPackRefPackCode = set.getInt(33);
        if(set.wasNull())
        anObject.cnPackRefPackCode = Integer.MIN_VALUE;
        anObject.cnPackRefName = set.getString(34);
        anObject.cnPackRefId_ren = set.getInt(35);
        if(set.wasNull())
        anObject.cnPackRefId_ren = Integer.MIN_VALUE;
        anObject.cnPackRefRenName = set.getString(36);
        anObject.cnPackRefId_district = set.getInt(37);
        if(set.wasNull())
        anObject.cnPackRefId_district = Integer.MIN_VALUE;
        anObject.cnPackRefDistrictName = set.getString(38);
        anObject.cnPackRefId_pack_status = set.getInt(39);
        if(set.wasNull())
        anObject.cnPackRefId_pack_status = Integer.MIN_VALUE;
        anObject.cnPackRefStatusName = set.getString(40);
        anObject.cnPackRefDescription = set.getString(41);
        anObject.cnPackRefPower = set.getBigDecimal(42);
        if(anObject.cnPackRefPower != null)
          anObject.cnPackRefPower = anObject.cnPackRefPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.cnPackRefAddress = set.getString(43);
        anObject.cnPackRefAddress_jur = set.getString(44);
        anObject.cnPackRefReg_num_cn_contract = set.getString(45);
        anObject.cnPackRefDate_cn_contract = set.getDate(46);
        anObject.cnPackRefReg_num_spl_pp_contract = set.getString(47);
        anObject.cnPackRefDate_spl_pp_contract = set.getDate(48);
        anObject.cnPackRefReg_num_tu_contract = set.getString(49);
        anObject.cnPackRefDate_tu_contract = set.getDate(50);
        anObject.cnPackRefReg_num_tu_cr_contract = set.getString(51);
        anObject.cnPackRefDate_tu_cr_contract = set.getDate(52);
        anObject.cnPackRefProject_num = set.getString(53);
        anObject.cnPackRefProject_date = set.getDate(54);
        anObject.cnPackRefOver5 = set.getInt(55);
        if(set.wasNull())
        anObject.cnPackRefOver5 = Integer.MIN_VALUE;
        anObject.cnPackRefStatus = set.getInt(56);
        if(set.wasNull())
        anObject.cnPackRefStatus = Integer.MIN_VALUE;
        anObject.cnPackRefLetter_num_customer = set.getString(57);
        anObject.cnPackRefDate_letter_customer = set.getDate(58);
        anObject.cnPackRefLetter_num = set.getString(59);
        anObject.cnPackRefDate_letter = set.getDate(60);
        anObject.cnPackRefReliability_class = set.getString(61);
        anObject.cnPackRefId_waiting_status = set.getInt(62);
        if(set.wasNull())
        anObject.cnPackRefId_waiting_status = Integer.MIN_VALUE;
        anObject.cnPackRefWaitingStatus = set.getString(63);
        anObject.cnPackRefIs_payable = set.getInt(64);
        if(set.wasNull())
        anObject.cnPackRefIs_payable = Integer.MIN_VALUE;
        anObject.cnPackRefWorksize = set.getString(65);
        anObject.cnPackRefWork_inc_net = set.getString(66);
        anObject.cnPackRefBusiness_type = set.getString(67);
        anObject.cnPackRefEstimateterm = set.getInt(68);
        if(set.wasNull())
        anObject.cnPackRefEstimateterm = Integer.MIN_VALUE;
        anObject.cnPackRefEstimatedate = set.getDate(69);
        anObject.cnPackRefBuildingterm = set.getInt(70);
        if(set.wasNull())
        anObject.cnPackRefBuildingterm = Integer.MIN_VALUE;
        anObject.cnPackRefBuildingdate = set.getDate(71);
        anObject.cnPackRefBuyingterm = set.getInt(72);
        if(set.wasNull())
        anObject.cnPackRefBuyingterm = Integer.MIN_VALUE;
        anObject.cnPackRefBuyingdate = set.getDate(73);
        anObject.cnPackRefEstimate_num = set.getString(74);
        anObject.cnPackRefEstimate_contract_date = set.getDate(75);
        anObject.cnPackRefIs_reserv = set.getInt(76);
        if(set.wasNull())
        anObject.cnPackRefIs_reserv = Integer.MIN_VALUE;


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

  public int[] getFilteredCodeArrayOLD(CNTechTerms aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT CNTECHTERMS.CODE FROM CNTECHTERMS";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "CNTECHTERMS.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.CODE = ?";
        }
        if(aFilterObject.id_proposal != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.ID_PROPOSAL = ?";
        }
         if (aFilterObject.proposalName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.proposalName.indexOf('*',0) < 0 && aFilterObject.proposalName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNTECHTERMS.PROPOSALNAME = ?";
             else
                 whereStr = whereStr + "  CNTECHTERMS.PROPOSALNAME LIKE ?";
         }
        if(aFilterObject.power1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POWER1 = ?";
        }
        if(aFilterObject.power1prosp != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POWER1PROSP = ?";
        }
        if(aFilterObject.power1heat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POWER1HEAT = ?";
        }
        if(aFilterObject.power2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POWER2 = ?";
        }
        if(aFilterObject.power2prosp != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POWER2PROSP = ?";
        }
        if(aFilterObject.power2heat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POWER2HEAT = ?";
        }
        if(aFilterObject.power3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POWER3 = ?";
        }
        if(aFilterObject.power3prosp != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POWER3PROSP = ?";
        }
        if(aFilterObject.power3heat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POWER3HEAT = ?";
        }
        if(aFilterObject.pow_stove != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POW_STOVE = ?";
        }
        if(aFilterObject.pow_water_heat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POW_WATER_HEAT = ?";
        }
        if(aFilterObject.pow_house_heat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POW_HOUSE_HEAT = ?";
        }
        if(aFilterObject.tension_point != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.TENSION_POINT = ?";
        }
        if(aFilterObject.current_automat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.CURRENT_AUTOMAT = ?";
        }
        if(aFilterObject.pow_exist != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POW_EXIST = ?";
        }
        if(aFilterObject.tension_exist != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.TENSION_EXIST = ?";
        }
        if(aFilterObject.is_realized != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.IS_REALIZED = ?";
        }
         if (aFilterObject.reason != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.reason.indexOf('*',0) < 0 && aFilterObject.reason.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNTECHTERMS.REASON = ?";
             else
                 whereStr = whereStr + "  CNTECHTERMS.REASON LIKE ?";
         }
         if (aFilterObject.source != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.source.indexOf('*',0) < 0 && aFilterObject.source.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNTECHTERMS.SOURCE = ?";
             else
                 whereStr = whereStr + "  CNTECHTERMS.SOURCE LIKE ?";
         }
         if (aFilterObject.source_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.source_num.indexOf('*',0) < 0 && aFilterObject.source_num.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNTECHTERMS.SOURCE_NUM = ?";
             else
                 whereStr = whereStr + "  CNTECHTERMS.SOURCE_NUM LIKE ?";
         }
         if (aFilterObject.ensur_point != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.ensur_point.indexOf('*',0) < 0 && aFilterObject.ensur_point.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNTECHTERMS.ENSUR_POINT = ?";
             else
                 whereStr = whereStr + "  CNTECHTERMS.ENSUR_POINT LIKE ?";
         }
         if (aFilterObject.ensur_point_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.ensur_point_num.indexOf('*',0) < 0 && aFilterObject.ensur_point_num.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNTECHTERMS.ENSUR_POINT_NUM = ?";
             else
                 whereStr = whereStr + "  CNTECHTERMS.ENSUR_POINT_NUM LIKE ?";
         }
         if (aFilterObject.connect_point != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.connect_point.indexOf('*',0) < 0 && aFilterObject.connect_point.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNTECHTERMS.CONNECT_POINT = ?";
             else
                 whereStr = whereStr + "  CNTECHTERMS.CONNECT_POINT LIKE ?";
         }
         if (aFilterObject.connect_point_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.connect_point_num.indexOf('*',0) < 0 && aFilterObject.connect_point_num.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNTECHTERMS.CONNECT_POINT_NUM = ?";
             else
                 whereStr = whereStr + "  CNTECHTERMS.CONNECT_POINT_NUM LIKE ?";
         }
        if(aFilterObject.exploit_year != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.EXPLOIT_YEAR = ?";
        }
        if(aFilterObject.baseStation != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.BASESTATION = ?";
        }
        if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNTECHTERMS.SUBSYSTEMREFCODE = ? ";
        }
        if(aFilterObject.cnPackRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNTECHTERMS.CNPACKREFCODE = ? ";
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
         if(aFilterObject.id_proposal != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_proposal);
         }
         if (aFilterObject.proposalName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.proposalName.indexOf('*',0) < 0 && aFilterObject.proposalName.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNTECHTERMS.PROPOSALNAME = ?";
             else
                 whereStr = whereStr + " CNTECHTERMS.PROPOSALNAME LIKE ?";

           if(aFilterObject.proposalName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.proposalName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.power1 != null){
            number++;
            aFilterObject.power1 = aFilterObject.power1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power1);
        }
        if(aFilterObject.power1prosp != null){
            number++;
            aFilterObject.power1prosp = aFilterObject.power1prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power1prosp);
        }
        if(aFilterObject.power1heat != null){
            number++;
            aFilterObject.power1heat = aFilterObject.power1heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power1heat);
        }
        if(aFilterObject.power2 != null){
            number++;
            aFilterObject.power2 = aFilterObject.power2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power2);
        }
        if(aFilterObject.power2prosp != null){
            number++;
            aFilterObject.power2prosp = aFilterObject.power2prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power2prosp);
        }
        if(aFilterObject.power2heat != null){
            number++;
            aFilterObject.power2heat = aFilterObject.power2heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power2heat);
        }
        if(aFilterObject.power3 != null){
            number++;
            aFilterObject.power3 = aFilterObject.power3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power3);
        }
        if(aFilterObject.power3prosp != null){
            number++;
            aFilterObject.power3prosp = aFilterObject.power3prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power3prosp);
        }
        if(aFilterObject.power3heat != null){
            number++;
            aFilterObject.power3heat = aFilterObject.power3heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power3heat);
        }
        if(aFilterObject.pow_stove != null){
            number++;
            aFilterObject.pow_stove = aFilterObject.pow_stove.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.pow_stove);
        }
        if(aFilterObject.pow_water_heat != null){
            number++;
            aFilterObject.pow_water_heat = aFilterObject.pow_water_heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.pow_water_heat);
        }
        if(aFilterObject.pow_house_heat != null){
            number++;
            aFilterObject.pow_house_heat = aFilterObject.pow_house_heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.pow_house_heat);
        }
        if(aFilterObject.tension_point != null){
            number++;
            aFilterObject.tension_point = aFilterObject.tension_point.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.tension_point);
        }
        if(aFilterObject.current_automat != null){
            number++;
            aFilterObject.current_automat = aFilterObject.current_automat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.current_automat);
        }
        if(aFilterObject.pow_exist != null){
            number++;
            aFilterObject.pow_exist = aFilterObject.pow_exist.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.pow_exist);
        }
        if(aFilterObject.tension_exist != null){
            number++;
            aFilterObject.tension_exist = aFilterObject.tension_exist.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.tension_exist);
        }
         if(aFilterObject.is_realized != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is_realized);
         }
         if (aFilterObject.reason != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.reason.indexOf('*',0) < 0 && aFilterObject.reason.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNTECHTERMS.REASON = ?";
             else
                 whereStr = whereStr + " CNTECHTERMS.REASON LIKE ?";

           if(aFilterObject.reason != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.reason);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.source != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.source.indexOf('*',0) < 0 && aFilterObject.source.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNTECHTERMS.SOURCE = ?";
             else
                 whereStr = whereStr + " CNTECHTERMS.SOURCE LIKE ?";

           if(aFilterObject.source != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.source);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.source_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.source_num.indexOf('*',0) < 0 && aFilterObject.source_num.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNTECHTERMS.SOURCE_NUM = ?";
             else
                 whereStr = whereStr + " CNTECHTERMS.SOURCE_NUM LIKE ?";

           if(aFilterObject.source_num != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.source_num);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.ensur_point != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.ensur_point.indexOf('*',0) < 0 && aFilterObject.ensur_point.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNTECHTERMS.ENSUR_POINT = ?";
             else
                 whereStr = whereStr + " CNTECHTERMS.ENSUR_POINT LIKE ?";

           if(aFilterObject.ensur_point != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.ensur_point);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.ensur_point_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.ensur_point_num.indexOf('*',0) < 0 && aFilterObject.ensur_point_num.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNTECHTERMS.ENSUR_POINT_NUM = ?";
             else
                 whereStr = whereStr + " CNTECHTERMS.ENSUR_POINT_NUM LIKE ?";

           if(aFilterObject.ensur_point_num != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.ensur_point_num);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.connect_point != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.connect_point.indexOf('*',0) < 0 && aFilterObject.connect_point.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNTECHTERMS.CONNECT_POINT = ?";
             else
                 whereStr = whereStr + " CNTECHTERMS.CONNECT_POINT LIKE ?";

           if(aFilterObject.connect_point != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.connect_point);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.connect_point_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.connect_point_num.indexOf('*',0) < 0 && aFilterObject.connect_point_num.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNTECHTERMS.CONNECT_POINT_NUM = ?";
             else
                 whereStr = whereStr + " CNTECHTERMS.CONNECT_POINT_NUM LIKE ?";

           if(aFilterObject.connect_point_num != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.connect_point_num);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.exploit_year != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.exploit_year);
         }
         if(aFilterObject.baseStation != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.baseStation);
         }
       if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.subsystemRef.code);
       }
       if(aFilterObject.cnPackRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cnPackRef.code);
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

  public int[] getFilteredCodeArray(CNTechTermsFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(CNTechTerms aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT CNTECHTERMS.CODE FROM CNTECHTERMS";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "CNTECHTERMS.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.CODE = ?";
        }
        if(aFilterObject.id_proposal != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.ID_PROPOSAL = ?";
        }
         if (aFilterObject.proposalName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.proposalName.indexOf('*',0) < 0 && aFilterObject.proposalName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNTECHTERMS.PROPOSALNAME = ?";
             else
                 whereStr = whereStr + "  CNTECHTERMS.PROPOSALNAME LIKE ?";
         }
        if(aFilterObject.power1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POWER1 = ?";
        }
        if(aFilterObject.power1prosp != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POWER1PROSP = ?";
        }
        if(aFilterObject.power1heat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POWER1HEAT = ?";
        }
        if(aFilterObject.power2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POWER2 = ?";
        }
        if(aFilterObject.power2prosp != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POWER2PROSP = ?";
        }
        if(aFilterObject.power2heat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POWER2HEAT = ?";
        }
        if(aFilterObject.power3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POWER3 = ?";
        }
        if(aFilterObject.power3prosp != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POWER3PROSP = ?";
        }
        if(aFilterObject.power3heat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POWER3HEAT = ?";
        }
        if(aFilterObject.pow_stove != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POW_STOVE = ?";
        }
        if(aFilterObject.pow_water_heat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POW_WATER_HEAT = ?";
        }
        if(aFilterObject.pow_house_heat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POW_HOUSE_HEAT = ?";
        }
        if(aFilterObject.tension_point != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.TENSION_POINT = ?";
        }
        if(aFilterObject.current_automat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.CURRENT_AUTOMAT = ?";
        }
        if(aFilterObject.pow_exist != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.POW_EXIST = ?";
        }
        if(aFilterObject.tension_exist != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.TENSION_EXIST = ?";
        }
        if(aFilterObject.is_realized != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.IS_REALIZED = ?";
        }
         if (aFilterObject.reason != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.reason.indexOf('*',0) < 0 && aFilterObject.reason.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNTECHTERMS.REASON = ?";
             else
                 whereStr = whereStr + "  CNTECHTERMS.REASON LIKE ?";
         }
         if (aFilterObject.source != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.source.indexOf('*',0) < 0 && aFilterObject.source.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNTECHTERMS.SOURCE = ?";
             else
                 whereStr = whereStr + "  CNTECHTERMS.SOURCE LIKE ?";
         }
         if (aFilterObject.source_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.source_num.indexOf('*',0) < 0 && aFilterObject.source_num.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNTECHTERMS.SOURCE_NUM = ?";
             else
                 whereStr = whereStr + "  CNTECHTERMS.SOURCE_NUM LIKE ?";
         }
         if (aFilterObject.ensur_point != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.ensur_point.indexOf('*',0) < 0 && aFilterObject.ensur_point.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNTECHTERMS.ENSUR_POINT = ?";
             else
                 whereStr = whereStr + "  CNTECHTERMS.ENSUR_POINT LIKE ?";
         }
         if (aFilterObject.ensur_point_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.ensur_point_num.indexOf('*',0) < 0 && aFilterObject.ensur_point_num.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNTECHTERMS.ENSUR_POINT_NUM = ?";
             else
                 whereStr = whereStr + "  CNTECHTERMS.ENSUR_POINT_NUM LIKE ?";
         }
         if (aFilterObject.connect_point != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.connect_point.indexOf('*',0) < 0 && aFilterObject.connect_point.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNTECHTERMS.CONNECT_POINT = ?";
             else
                 whereStr = whereStr + "  CNTECHTERMS.CONNECT_POINT LIKE ?";
         }
         if (aFilterObject.connect_point_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.connect_point_num.indexOf('*',0) < 0 && aFilterObject.connect_point_num.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNTECHTERMS.CONNECT_POINT_NUM = ?";
             else
                 whereStr = whereStr + "  CNTECHTERMS.CONNECT_POINT_NUM LIKE ?";
         }
        if(aFilterObject.exploit_year != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.EXPLOIT_YEAR = ?";
        }
        if(aFilterObject.baseStation != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNTECHTERMS.BASESTATION = ?";
        }
        if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNTECHTERMS.SUBSYSTEMREFCODE = ? ";
        }
        if(aFilterObject.cnPackRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNTECHTERMS.CNPACKREFCODE = ? ";
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
         if(aFilterObject.id_proposal != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_proposal);
         }
         if (aFilterObject.proposalName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.proposalName.indexOf('*',0) < 0 && aFilterObject.proposalName.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNTECHTERMS.PROPOSALNAME = ?";
             else
                 whereStr = whereStr + " CNTECHTERMS.PROPOSALNAME LIKE ?";

           if(aFilterObject.proposalName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.proposalName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.power1 != null){
            number++;
            aFilterObject.power1 = aFilterObject.power1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power1);
        }
        if(aFilterObject.power1prosp != null){
            number++;
            aFilterObject.power1prosp = aFilterObject.power1prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power1prosp);
        }
        if(aFilterObject.power1heat != null){
            number++;
            aFilterObject.power1heat = aFilterObject.power1heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power1heat);
        }
        if(aFilterObject.power2 != null){
            number++;
            aFilterObject.power2 = aFilterObject.power2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power2);
        }
        if(aFilterObject.power2prosp != null){
            number++;
            aFilterObject.power2prosp = aFilterObject.power2prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power2prosp);
        }
        if(aFilterObject.power2heat != null){
            number++;
            aFilterObject.power2heat = aFilterObject.power2heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power2heat);
        }
        if(aFilterObject.power3 != null){
            number++;
            aFilterObject.power3 = aFilterObject.power3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power3);
        }
        if(aFilterObject.power3prosp != null){
            number++;
            aFilterObject.power3prosp = aFilterObject.power3prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power3prosp);
        }
        if(aFilterObject.power3heat != null){
            number++;
            aFilterObject.power3heat = aFilterObject.power3heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power3heat);
        }
        if(aFilterObject.pow_stove != null){
            number++;
            aFilterObject.pow_stove = aFilterObject.pow_stove.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.pow_stove);
        }
        if(aFilterObject.pow_water_heat != null){
            number++;
            aFilterObject.pow_water_heat = aFilterObject.pow_water_heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.pow_water_heat);
        }
        if(aFilterObject.pow_house_heat != null){
            number++;
            aFilterObject.pow_house_heat = aFilterObject.pow_house_heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.pow_house_heat);
        }
        if(aFilterObject.tension_point != null){
            number++;
            aFilterObject.tension_point = aFilterObject.tension_point.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.tension_point);
        }
        if(aFilterObject.current_automat != null){
            number++;
            aFilterObject.current_automat = aFilterObject.current_automat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.current_automat);
        }
        if(aFilterObject.pow_exist != null){
            number++;
            aFilterObject.pow_exist = aFilterObject.pow_exist.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.pow_exist);
        }
        if(aFilterObject.tension_exist != null){
            number++;
            aFilterObject.tension_exist = aFilterObject.tension_exist.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.tension_exist);
        }
         if(aFilterObject.is_realized != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is_realized);
         }
         if (aFilterObject.reason != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.reason.indexOf('*',0) < 0 && aFilterObject.reason.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNTECHTERMS.REASON = ?";
             else
                 whereStr = whereStr + " CNTECHTERMS.REASON LIKE ?";

           if(aFilterObject.reason != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.reason);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.source != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.source.indexOf('*',0) < 0 && aFilterObject.source.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNTECHTERMS.SOURCE = ?";
             else
                 whereStr = whereStr + " CNTECHTERMS.SOURCE LIKE ?";

           if(aFilterObject.source != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.source);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.source_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.source_num.indexOf('*',0) < 0 && aFilterObject.source_num.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNTECHTERMS.SOURCE_NUM = ?";
             else
                 whereStr = whereStr + " CNTECHTERMS.SOURCE_NUM LIKE ?";

           if(aFilterObject.source_num != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.source_num);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.ensur_point != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.ensur_point.indexOf('*',0) < 0 && aFilterObject.ensur_point.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNTECHTERMS.ENSUR_POINT = ?";
             else
                 whereStr = whereStr + " CNTECHTERMS.ENSUR_POINT LIKE ?";

           if(aFilterObject.ensur_point != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.ensur_point);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.ensur_point_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.ensur_point_num.indexOf('*',0) < 0 && aFilterObject.ensur_point_num.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNTECHTERMS.ENSUR_POINT_NUM = ?";
             else
                 whereStr = whereStr + " CNTECHTERMS.ENSUR_POINT_NUM LIKE ?";

           if(aFilterObject.ensur_point_num != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.ensur_point_num);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.connect_point != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.connect_point.indexOf('*',0) < 0 && aFilterObject.connect_point.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNTECHTERMS.CONNECT_POINT = ?";
             else
                 whereStr = whereStr + " CNTECHTERMS.CONNECT_POINT LIKE ?";

           if(aFilterObject.connect_point != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.connect_point);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.connect_point_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.connect_point_num.indexOf('*',0) < 0 && aFilterObject.connect_point_num.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNTECHTERMS.CONNECT_POINT_NUM = ?";
             else
                 whereStr = whereStr + " CNTECHTERMS.CONNECT_POINT_NUM LIKE ?";

           if(aFilterObject.connect_point_num != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.connect_point_num);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.exploit_year != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.exploit_year);
         }
         if(aFilterObject.baseStation != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.baseStation);
         }
       if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.subsystemRef.code);
       }
       if(aFilterObject.cnPackRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cnPackRef.code);
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


   public CNTechTerms getObject(int uid) throws PersistenceException
   {
    CNTechTerms result = new CNTechTerms();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(CNTechTerms anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  CNTECHTERMS.CODE, CNTECHTERMS.ID_PROPOSAL, CNTECHTERMS.PROPOSALNAME, CNTECHTERMS.POWER1, CNTECHTERMS.POWER1PROSP, CNTECHTERMS.POWER1HEAT, CNTECHTERMS.POWER2, CNTECHTERMS.POWER2PROSP, CNTECHTERMS.POWER2HEAT, CNTECHTERMS.POWER3, CNTECHTERMS.POWER3PROSP, CNTECHTERMS.POWER3HEAT, CNTECHTERMS.POW_STOVE, CNTECHTERMS.POW_WATER_HEAT, CNTECHTERMS.POW_HOUSE_HEAT, CNTECHTERMS.TENSION_POINT, CNTECHTERMS.CURRENT_AUTOMAT, CNTECHTERMS.POW_EXIST, CNTECHTERMS.TENSION_EXIST, CNTECHTERMS.IS_REALIZED, CNTECHTERMS.REASON, CNTECHTERMS.SOURCE, CNTECHTERMS.SOURCE_NUM, CNTECHTERMS.ENSUR_POINT, CNTECHTERMS.ENSUR_POINT_NUM, CNTECHTERMS.CONNECT_POINT, CNTECHTERMS.CONNECT_POINT_NUM, CNTECHTERMS.EXPLOIT_YEAR, CNTECHTERMS.BASESTATION, CNTECHTERMS.SUBSYSTEMREFCODE, CNTECHTERMS.CNPACKREFCODE "
    +" FROM CNTECHTERMS WHERE CNTECHTERMS.CODE = ?";

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
        anObject.id_proposal = set.getInt(2);
        if ( set.wasNull() )
           anObject.id_proposal = Integer.MIN_VALUE;
        anObject.proposalName = set.getString(3);
        anObject.power1 = set.getBigDecimal(4);
        if(anObject.power1 != null)
            anObject.power1 = anObject.power1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power1prosp = set.getBigDecimal(5);
        if(anObject.power1prosp != null)
            anObject.power1prosp = anObject.power1prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power1heat = set.getBigDecimal(6);
        if(anObject.power1heat != null)
            anObject.power1heat = anObject.power1heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power2 = set.getBigDecimal(7);
        if(anObject.power2 != null)
            anObject.power2 = anObject.power2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power2prosp = set.getBigDecimal(8);
        if(anObject.power2prosp != null)
            anObject.power2prosp = anObject.power2prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power2heat = set.getBigDecimal(9);
        if(anObject.power2heat != null)
            anObject.power2heat = anObject.power2heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power3 = set.getBigDecimal(10);
        if(anObject.power3 != null)
            anObject.power3 = anObject.power3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power3prosp = set.getBigDecimal(11);
        if(anObject.power3prosp != null)
            anObject.power3prosp = anObject.power3prosp.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.power3heat = set.getBigDecimal(12);
        if(anObject.power3heat != null)
            anObject.power3heat = anObject.power3heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.pow_stove = set.getBigDecimal(13);
        if(anObject.pow_stove != null)
            anObject.pow_stove = anObject.pow_stove.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.pow_water_heat = set.getBigDecimal(14);
        if(anObject.pow_water_heat != null)
            anObject.pow_water_heat = anObject.pow_water_heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.pow_house_heat = set.getBigDecimal(15);
        if(anObject.pow_house_heat != null)
            anObject.pow_house_heat = anObject.pow_house_heat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.tension_point = set.getBigDecimal(16);
        if(anObject.tension_point != null)
            anObject.tension_point = anObject.tension_point.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.current_automat = set.getBigDecimal(17);
        if(anObject.current_automat != null)
            anObject.current_automat = anObject.current_automat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.pow_exist = set.getBigDecimal(18);
        if(anObject.pow_exist != null)
            anObject.pow_exist = anObject.pow_exist.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.tension_exist = set.getBigDecimal(19);
        if(anObject.tension_exist != null)
            anObject.tension_exist = anObject.tension_exist.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.is_realized = set.getInt(20);
        if ( set.wasNull() )
           anObject.is_realized = Integer.MIN_VALUE;
        anObject.reason = set.getString(21);
        anObject.source = set.getString(22);
        anObject.source_num = set.getString(23);
        anObject.ensur_point = set.getString(24);
        anObject.ensur_point_num = set.getString(25);
        anObject.connect_point = set.getString(26);
        anObject.connect_point_num = set.getString(27);
        anObject.exploit_year = set.getInt(28);
        if ( set.wasNull() )
           anObject.exploit_year = Integer.MIN_VALUE;
        anObject.baseStation = set.getInt(29);
        if ( set.wasNull() )
           anObject.baseStation = Integer.MIN_VALUE;
        anObject.subsystemRef.code = set.getInt(30);
        if ( set.wasNull() )
            anObject.subsystemRef.code = Integer.MIN_VALUE;
        anObject.cnPackRef.code = set.getInt(31);
        if ( set.wasNull() )
            anObject.cnPackRef.code = Integer.MIN_VALUE;
        if(anObject.subsystemRef.code != Integer.MIN_VALUE)
        {
           anObject.setSubsystemRef(
        new com.ksoe.energynet.dataminer.generated.CNSubsystemTypeDAOGen(connection,getUserProfile()).getRef(anObject.subsystemRef.code));
    }
        if(anObject.cnPackRef.code != Integer.MIN_VALUE)
        {
           anObject.setCnPackRef(
        new com.ksoe.energynet.dataminer.generated.CNPackDAOGen(connection,getUserProfile()).getRef(anObject.cnPackRef.code));
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


  public com.ksoe.energynet.valueobject.references.CNTechTermsRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.CNTechTermsRef ref = new com.ksoe.energynet.valueobject.references.CNTechTermsRef();
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

    selectStr = "DELETE FROM  CNTECHTERMS WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    CNTechTerms object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%CNTechTerms.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(CNTechTerms.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%CNTechTerms.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(CNTechTerms.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%CNTechTerms.getObject%} access denied");

    selectStr =

    "SELECT  CNTECHTERMS.CODE FROM  CNTECHTERMS WHERE  CNTECHTERMS.CODE = ?";
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
    _checkConditionToken(condition,"code","CNTECHTERMS.CODE");
    _checkConditionToken(condition,"id_proposal","CNTECHTERMS.ID_PROPOSAL");
    _checkConditionToken(condition,"proposalname","CNTECHTERMS.PROPOSALNAME");
    _checkConditionToken(condition,"power1","CNTECHTERMS.POWER1");
    _checkConditionToken(condition,"power1prosp","CNTECHTERMS.POWER1PROSP");
    _checkConditionToken(condition,"power1heat","CNTECHTERMS.POWER1HEAT");
    _checkConditionToken(condition,"power2","CNTECHTERMS.POWER2");
    _checkConditionToken(condition,"power2prosp","CNTECHTERMS.POWER2PROSP");
    _checkConditionToken(condition,"power2heat","CNTECHTERMS.POWER2HEAT");
    _checkConditionToken(condition,"power3","CNTECHTERMS.POWER3");
    _checkConditionToken(condition,"power3prosp","CNTECHTERMS.POWER3PROSP");
    _checkConditionToken(condition,"power3heat","CNTECHTERMS.POWER3HEAT");
    _checkConditionToken(condition,"pow_stove","CNTECHTERMS.POW_STOVE");
    _checkConditionToken(condition,"pow_water_heat","CNTECHTERMS.POW_WATER_HEAT");
    _checkConditionToken(condition,"pow_house_heat","CNTECHTERMS.POW_HOUSE_HEAT");
    _checkConditionToken(condition,"tension_point","CNTECHTERMS.TENSION_POINT");
    _checkConditionToken(condition,"current_automat","CNTECHTERMS.CURRENT_AUTOMAT");
    _checkConditionToken(condition,"pow_exist","CNTECHTERMS.POW_EXIST");
    _checkConditionToken(condition,"tension_exist","CNTECHTERMS.TENSION_EXIST");
    _checkConditionToken(condition,"is_realized","CNTECHTERMS.IS_REALIZED");
    _checkConditionToken(condition,"reason","CNTECHTERMS.REASON");
    _checkConditionToken(condition,"source","CNTECHTERMS.SOURCE");
    _checkConditionToken(condition,"source_num","CNTECHTERMS.SOURCE_NUM");
    _checkConditionToken(condition,"ensur_point","CNTECHTERMS.ENSUR_POINT");
    _checkConditionToken(condition,"ensur_point_num","CNTECHTERMS.ENSUR_POINT_NUM");
    _checkConditionToken(condition,"connect_point","CNTECHTERMS.CONNECT_POINT");
    _checkConditionToken(condition,"connect_point_num","CNTECHTERMS.CONNECT_POINT_NUM");
    _checkConditionToken(condition,"exploit_year","CNTECHTERMS.EXPLOIT_YEAR");
    _checkConditionToken(condition,"basestation","CNTECHTERMS.BASESTATION");
      // relationship conditions
    _checkConditionToken(condition,"subsystemref","SUBSYSTEMREFCODE");
    _checkConditionToken(condition,"subsystemref.code","SUBSYSTEMREFCODE");
    _checkConditionToken(condition,"cnpackref","CNPACKREFCODE");
    _checkConditionToken(condition,"cnpackref.code","CNPACKREFCODE");
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
      DataSource dataSource = (DataSource)initialContext.lookup(AuthorizationJNDINames.CN_DATASOURCE);
      return dataSource.getConnection();
     }
    catch (NamingException e) {throw new SystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.CN_DATASOURCE+"%}",e);}
    catch (SQLException e)    {throw new SystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.CN_DATASOURCE+"%}",e);}
   }

    ///////////// PRIVATE SECTION ///////////////
    protected static Hashtable _sequenceTable = new Hashtable();

    private void _collectAutoIncrementFields(CNTechTerms anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("CNTECHTERMS", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("CNTECHTERMS", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("CNTECHTERMS", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: CNTECHTERMS");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of CNTechTermsDAO
