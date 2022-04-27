
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
import com.ksoe.energynet.valueobject.CNPack;
import com.ksoe.energynet.valueobject.brief.CNPackShort;
import com.ksoe.energynet.valueobject.filter.CNPackFilter;
import com.ksoe.energynet.valueobject.lists.CNPackShortList;
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
  *  DAO Generated for CNPack;
  *
  */

public class CNPackDAOGen extends GenericDataMiner {

  // нах они такие .. потом вылетают ошибки !!!
  //public CNPackDAOGen() {super();}
  //public CNPackDAOGen(Connection aConnection) {super(aConnection);}
  //public CNPackDAOGen(UserProfile anUserProfile) {super(anUserProfile);}
  public CNPackDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public CNPackDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(CNPack inObject) throws PersistenceException
   {
      CNPack obj = new CNPack();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.packCode != obj.packCode){
       return false;
     }

     if (inObject.name != obj.name){
       return false;
     }

     if (inObject.id_ren != obj.id_ren){
       return false;
     }

     if (inObject.renName != obj.renName){
       return false;
     }

     if (inObject.id_district != obj.id_district){
       return false;
     }

     if (inObject.districtName != obj.districtName){
       return false;
     }

     if (inObject.id_pack_status != obj.id_pack_status){
       return false;
     }

     if (inObject.statusName != obj.statusName){
       return false;
     }

     if (inObject.description != obj.description){
       return false;
     }

     if ( ! inObject.power.equals(obj.power)){
       return false;
     }

     if (inObject.address != obj.address){
       return false;
     }

     if (inObject.address_jur != obj.address_jur){
       return false;
     }

     if (inObject.reg_num_cn_contract != obj.reg_num_cn_contract){
       return false;
     }

     if ( ! inObject.date_cn_contract.equals(obj.date_cn_contract)){
       return false;
     }

     if (inObject.reg_num_spl_pp_contract != obj.reg_num_spl_pp_contract){
       return false;
     }

     if ( ! inObject.date_spl_pp_contract.equals(obj.date_spl_pp_contract)){
       return false;
     }

     if (inObject.reg_num_tu_contract != obj.reg_num_tu_contract){
       return false;
     }

     if ( ! inObject.date_tu_contract.equals(obj.date_tu_contract)){
       return false;
     }

     if (inObject.reg_num_tu_cr_contract != obj.reg_num_tu_cr_contract){
       return false;
     }

     if ( ! inObject.date_tu_cr_contract.equals(obj.date_tu_cr_contract)){
       return false;
     }

     if (inObject.project_num != obj.project_num){
       return false;
     }

     if ( ! inObject.project_date.equals(obj.project_date)){
       return false;
     }

     if (inObject.over5 != obj.over5){
       return false;
     }

     if (inObject.status != obj.status){
       return false;
     }

     if (inObject.letter_num_customer != obj.letter_num_customer){
       return false;
     }

     if ( ! inObject.date_letter_customer.equals(obj.date_letter_customer)){
       return false;
     }

     if (inObject.letter_num != obj.letter_num){
       return false;
     }

     if ( ! inObject.date_letter.equals(obj.date_letter)){
       return false;
     }

     if (inObject.reliability_class != obj.reliability_class){
       return false;
     }

     if (inObject.id_waiting_status != obj.id_waiting_status){
       return false;
     }

     if (inObject.waitingStatus != obj.waitingStatus){
       return false;
     }

     if (inObject.is_payable != obj.is_payable){
       return false;
     }

     if (inObject.worksize != obj.worksize){
       return false;
     }

     if (inObject.work_inc_net != obj.work_inc_net){
       return false;
     }

     if (inObject.business_type != obj.business_type){
       return false;
     }

     if (inObject.estimateterm != obj.estimateterm){
       return false;
     }

     if ( ! inObject.estimatedate.equals(obj.estimatedate)){
       return false;
     }

     if (inObject.buildingterm != obj.buildingterm){
       return false;
     }

     if ( ! inObject.buildingdate.equals(obj.buildingdate)){
       return false;
     }

     if (inObject.buyingterm != obj.buyingterm){
       return false;
     }

     if ( ! inObject.buyingdate.equals(obj.buyingdate)){
       return false;
     }

     if (inObject.estimate_num != obj.estimate_num){
       return false;
     }

     if ( ! inObject.estimate_contract_date.equals(obj.estimate_contract_date)){
       return false;
     }

     if (inObject.is_reserv != obj.is_reserv){
       return false;
     }

     if (inObject.purpose != obj.purpose){
       return false;
     }

     if (inObject.is_ksoe != obj.is_ksoe){
       return false;
     }

     if (inObject.over150 != obj.over150){
       return false;
     }

     if (inObject.is_new != obj.is_new){
       return false;
     }

     if (inObject.is3phases != obj.is3phases){
       return false;
     }
     if (inObject.subsystemRef.code != obj.subsystemRef.code){
        return false;
     }
     if (inObject.airLine04Ref.code != obj.airLine04Ref.code){
        return false;
     }
     if (inObject.cableLine04Ref.code != obj.cableLine04Ref.code){
        return false;
     }
     if (inObject.trRef.code != obj.trRef.code){
        return false;
     }
     if (inObject.s04Ref.code != obj.s04Ref.code){
        return false;
     }
     if (inObject.airLine10Ref.code != obj.airLine10Ref.code){
        return false;
     }
     if (inObject.cableLine10Ref.code != obj.cableLine10Ref.code){
        return false;
     }
     if (inObject.s35Ref.code != obj.s35Ref.code){
        return false;
     }
     if (inObject.airLine150Ref.code != obj.airLine150Ref.code){
        return false;
     }
     if (inObject.cableLine150Ref.code != obj.cableLine150Ref.code){
        return false;
     }
     if (inObject.s150Ref.code != obj.s150Ref.code){
        return false;
     }
      return true;
   }

   public int add(CNPack anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(CNPack anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO CNPACK (CODE,PACKCODE,NAME,ID_REN,RENNAME,ID_DISTRICT,DISTRICTNAME,ID_PACK_STATUS,STATUSNAME,DESCRIPTION,POWER,ADDRESS,ADDRESS_JUR,REG_NUM_CN_CONTRACT,DATE_CN_CONTRACT,REG_NUM_SPL_PP_CONTRCT,DATE_SPL_PP_CONTRACT,REG_NUM_TU_CONTRACT,DATE_TU_CONTRACT,REG_NUM_TU_CR_CONTRACT,DATE_TU_CR_CONTRACT,PROJECT_NUM,PROJECT_DATE,OVER5,STATUS,LETTER_NUM_CUSTOMER,DATE_LETTER_CUSTOMER,LETTER_NUM,DATE_LETTER,RELIABILITY_CLASS,ID_WAITING_STATUS,WAITINGSTATUS,IS_PAYABLE,WORKSIZE,WORK_INC_NET,BUSINESS_TYPE,ESTIMATETERM,ESTIMATEDATE,BUILDINGTERM,BUILDINGDATE,BUYINGTERM,BUYINGDATE,ESTIMATE_NUM,ESTIMATE_CONTRACT_DATE,IS_RESERV,PURPOSE,IS_KSOE,OVER150,IS_NEW,IS3PHASES,SUBSYSTEMREFCODE,AIRLINE04REFCODE,CABLELINE04REFCODE,TRREFCODE,S04REFCODE,AIRLINE10REFCODE,CABLELINE10REFCODE,S35REFCODE,AIRLINE150REFCODE,CABLELINE150REFCODE,S150REFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.packCode != Integer.MIN_VALUE )
         statement.setInt(2,anObject.packCode);
      else
         statement.setNull(2,java.sql.Types.INTEGER);
      statement.setString(3,anObject.name);
      if (anObject.id_ren != Integer.MIN_VALUE )
         statement.setInt(4,anObject.id_ren);
      else
         statement.setNull(4,java.sql.Types.INTEGER);
      statement.setString(5,anObject.renName);
      if (anObject.id_district != Integer.MIN_VALUE )
         statement.setInt(6,anObject.id_district);
      else
         statement.setNull(6,java.sql.Types.INTEGER);
      statement.setString(7,anObject.districtName);
      if (anObject.id_pack_status != Integer.MIN_VALUE )
         statement.setInt(8,anObject.id_pack_status);
      else
         statement.setNull(8,java.sql.Types.INTEGER);
      statement.setString(9,anObject.statusName);
      statement.setString(10,anObject.description);
      if (anObject.power != null)
        anObject.power = anObject.power.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(11,anObject.power);
      statement.setString(12,anObject.address);
      statement.setString(13,anObject.address_jur);
      statement.setString(14,anObject.reg_num_cn_contract);
      if (anObject.date_cn_contract == null)
        statement.setDate(15,null);
      else
        statement.setDate(15,new java.sql.Date(anObject.date_cn_contract.getTime()));
      statement.setString(16,anObject.reg_num_spl_pp_contract);
      if (anObject.date_spl_pp_contract == null)
        statement.setDate(17,null);
      else
        statement.setDate(17,new java.sql.Date(anObject.date_spl_pp_contract.getTime()));
      statement.setString(18,anObject.reg_num_tu_contract);
      if (anObject.date_tu_contract == null)
        statement.setDate(19,null);
      else
        statement.setDate(19,new java.sql.Date(anObject.date_tu_contract.getTime()));
      statement.setString(20,anObject.reg_num_tu_cr_contract);
      if (anObject.date_tu_cr_contract == null)
        statement.setDate(21,null);
      else
        statement.setDate(21,new java.sql.Date(anObject.date_tu_cr_contract.getTime()));
      statement.setString(22,anObject.project_num);
      if (anObject.project_date == null)
        statement.setDate(23,null);
      else
        statement.setDate(23,new java.sql.Date(anObject.project_date.getTime()));
      if (anObject.over5 != Integer.MIN_VALUE )
         statement.setInt(24,anObject.over5);
      else
         statement.setNull(24,java.sql.Types.INTEGER);
      if (anObject.status != Integer.MIN_VALUE )
         statement.setInt(25,anObject.status);
      else
         statement.setNull(25,java.sql.Types.INTEGER);
      statement.setString(26,anObject.letter_num_customer);
      if (anObject.date_letter_customer == null)
        statement.setDate(27,null);
      else
        statement.setDate(27,new java.sql.Date(anObject.date_letter_customer.getTime()));
      statement.setString(28,anObject.letter_num);
      if (anObject.date_letter == null)
        statement.setDate(29,null);
      else
        statement.setDate(29,new java.sql.Date(anObject.date_letter.getTime()));
      statement.setString(30,anObject.reliability_class);
      if (anObject.id_waiting_status != Integer.MIN_VALUE )
         statement.setInt(31,anObject.id_waiting_status);
      else
         statement.setNull(31,java.sql.Types.INTEGER);
      statement.setString(32,anObject.waitingStatus);
      if (anObject.is_payable != Integer.MIN_VALUE )
         statement.setInt(33,anObject.is_payable);
      else
         statement.setNull(33,java.sql.Types.INTEGER);
      statement.setString(34,anObject.worksize);
      statement.setString(35,anObject.work_inc_net);
      statement.setString(36,anObject.business_type);
      if (anObject.estimateterm != Integer.MIN_VALUE )
         statement.setInt(37,anObject.estimateterm);
      else
         statement.setNull(37,java.sql.Types.INTEGER);
      if (anObject.estimatedate == null)
        statement.setDate(38,null);
      else
        statement.setDate(38,new java.sql.Date(anObject.estimatedate.getTime()));
      if (anObject.buildingterm != Integer.MIN_VALUE )
         statement.setInt(39,anObject.buildingterm);
      else
         statement.setNull(39,java.sql.Types.INTEGER);
      if (anObject.buildingdate == null)
        statement.setDate(40,null);
      else
        statement.setDate(40,new java.sql.Date(anObject.buildingdate.getTime()));
      if (anObject.buyingterm != Integer.MIN_VALUE )
         statement.setInt(41,anObject.buyingterm);
      else
         statement.setNull(41,java.sql.Types.INTEGER);
      if (anObject.buyingdate == null)
        statement.setDate(42,null);
      else
        statement.setDate(42,new java.sql.Date(anObject.buyingdate.getTime()));
      statement.setString(43,anObject.estimate_num);
      if (anObject.estimate_contract_date == null)
        statement.setDate(44,null);
      else
        statement.setDate(44,new java.sql.Date(anObject.estimate_contract_date.getTime()));
      if (anObject.is_reserv != Integer.MIN_VALUE )
         statement.setInt(45,anObject.is_reserv);
      else
         statement.setNull(45,java.sql.Types.INTEGER);
      statement.setString(46,anObject.purpose);
      if (anObject.is_ksoe != Integer.MIN_VALUE )
         statement.setInt(47,anObject.is_ksoe);
      else
         statement.setNull(47,java.sql.Types.INTEGER);
      if (anObject.over150 != Integer.MIN_VALUE )
         statement.setInt(48,anObject.over150);
      else
         statement.setNull(48,java.sql.Types.INTEGER);
      if (anObject.is_new != Integer.MIN_VALUE )
         statement.setInt(49,anObject.is_new);
      else
         statement.setNull(49,java.sql.Types.INTEGER);
      if (anObject.is3phases != Integer.MIN_VALUE )
         statement.setInt(50,anObject.is3phases);
      else
         statement.setNull(50,java.sql.Types.INTEGER);
      if (anObject.subsystemRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.CNSubsystemTypeDAOGen(connection,getUserProfile()).exists(anObject.subsystemRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.CNPack.subsystemRef.code%} = {%"+anObject.subsystemRef.code+"%}");
        statement.setInt(51,anObject.subsystemRef.code);
      }
      else
        statement.setNull(51,java.sql.Types.INTEGER);
    /*  if (anObject.airLine04Ref.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENLine04DAOGen(connection,getUserProfile()).exists(anObject.airLine04Ref.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.CNPack.airLine04Ref.code%} = {%"+anObject.airLine04Ref.code+"%}");
        statement.setInt(52,anObject.airLine04Ref.code);
      }
      else
        statement.setNull(52,java.sql.Types.INTEGER);
      if (anObject.cableLine04Ref.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENLineCableDAOGen(connection,getUserProfile()).exists(anObject.cableLine04Ref.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.CNPack.cableLine04Ref.code%} = {%"+anObject.cableLine04Ref.code+"%}");
        statement.setInt(53,anObject.cableLine04Ref.code);
      }
      else
        statement.setNull(53,java.sql.Types.INTEGER);
      if (anObject.trRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTransformerDAOGen(connection,getUserProfile()).exists(anObject.trRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.CNPack.trRef.code%} = {%"+anObject.trRef.code+"%}");
        statement.setInt(54,anObject.trRef.code);
      }
      else
        statement.setNull(54,java.sql.Types.INTEGER);
      if (anObject.s04Ref.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENSubstation04DAOGen(connection,getUserProfile()).exists(anObject.s04Ref.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.CNPack.s04Ref.code%} = {%"+anObject.s04Ref.code+"%}");
        statement.setInt(55,anObject.s04Ref.code);
      }
      else
        statement.setNull(55,java.sql.Types.INTEGER);
      if (anObject.airLine10Ref.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENLine10DAOGen(connection,getUserProfile()).exists(anObject.airLine10Ref.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.CNPack.airLine10Ref.code%} = {%"+anObject.airLine10Ref.code+"%}");
        statement.setInt(56,anObject.airLine10Ref.code);
      }
      else
        statement.setNull(56,java.sql.Types.INTEGER);
      if (anObject.cableLine10Ref.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENLineCableDAOGen(connection,getUserProfile()).exists(anObject.cableLine10Ref.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.CNPack.cableLine10Ref.code%} = {%"+anObject.cableLine10Ref.code+"%}");
        statement.setInt(57,anObject.cableLine10Ref.code);
      }
      else
        statement.setNull(57,java.sql.Types.INTEGER);
      if (anObject.s35Ref.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENSubstation150DAOGen(connection,getUserProfile()).exists(anObject.s35Ref.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.CNPack.s35Ref.code%} = {%"+anObject.s35Ref.code+"%}");
        statement.setInt(58,anObject.s35Ref.code);
      }
      else
        statement.setNull(58,java.sql.Types.INTEGER);
      if (anObject.airLine150Ref.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENLine150DAOGen(connection,getUserProfile()).exists(anObject.airLine150Ref.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.CNPack.airLine150Ref.code%} = {%"+anObject.airLine150Ref.code+"%}");
        statement.setInt(59,anObject.airLine150Ref.code);
      }
      else
        statement.setNull(59,java.sql.Types.INTEGER);
      if (anObject.cableLine150Ref.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENLineCableDAOGen(connection,getUserProfile()).exists(anObject.cableLine150Ref.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.CNPack.cableLine150Ref.code%} = {%"+anObject.cableLine150Ref.code+"%}");
        statement.setInt(60,anObject.cableLine150Ref.code);
      }
      else
        statement.setNull(60,java.sql.Types.INTEGER);
      if (anObject.s150Ref.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENSubstation150DAOGen(connection,getUserProfile()).exists(anObject.s150Ref.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.CNPack.s150Ref.code%} = {%"+anObject.s150Ref.code+"%}");
        statement.setInt(61,anObject.s150Ref.code);
      }
      else
        statement.setNull(61,java.sql.Types.INTEGER);*/

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
      throw new PersistenceException("Error in method {%CNPackDAOGen.add%}",e);
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

   public void save(CNPack anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(CNPack anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("PACKCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("NAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ID_REN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("RENNAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ID_DISTRICT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DISTRICTNAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ID_PACK_STATUS") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("STATUSNAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DESCRIPTION") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("POWER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ADDRESS") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ADDRESS_JUR") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("REG_NUM_CN_CONTRACT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATE_CN_CONTRACT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("REG_NUM_SPL_PP_CONTRACT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATE_SPL_PP_CONTRACT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("REG_NUM_TU_CONTRACT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATE_TU_CONTRACT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("REG_NUM_TU_CR_CONTRACT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATE_TU_CR_CONTRACT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PROJECT_NUM") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PROJECT_DATE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("OVER5") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("STATUS") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("LETTER_NUM_CUSTOMER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATE_LETTER_CUSTOMER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("LETTER_NUM") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATE_LETTER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("RELIABILITY_CLASS") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ID_WAITING_STATUS") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("WAITINGSTATUS") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("IS_PAYABLE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("WORKSIZE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("WORK_INC_NET") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("BUSINESS_TYPE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ESTIMATETERM") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ESTIMATEDATE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("BUILDINGTERM") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("BUILDINGDATE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("BUYINGTERM") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("BUYINGDATE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ESTIMATE_NUM") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ESTIMATE_CONTRACT_DATE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("IS_RESERV") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PURPOSE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("IS_KSOE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("OVER150") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("IS_NEW") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("IS3PHASES") == 0)
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
          if(fieldNameStr.compareTo("AIRLINE04REF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CABLELINE04REF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("TRREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("S04REF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("AIRLINE10REF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CABLELINE10REF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("S35REF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("AIRLINE150REF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CABLELINE150REF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("S150REF") == 0)
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
        "UPDATE CNPACK SET  PACKCODE = ? , NAME = ? , ID_REN = ? , RENNAME = ? , ID_DISTRICT = ? , DISTRICTNAME = ? , ID_PACK_STATUS = ? , STATUSNAME = ? , DESCRIPTION = ? , POWER = ? , ADDRESS = ? , ADDRESS_JUR = ? , REG_NUM_CN_CONTRACT = ? , DATE_CN_CONTRACT = ? , REG_NUM_SPL_PP_CONTRCT = ? , DATE_SPL_PP_CONTRACT = ? , REG_NUM_TU_CONTRACT = ? , DATE_TU_CONTRACT = ? , REG_NUM_TU_CR_CONTRACT = ? , DATE_TU_CR_CONTRACT = ? , PROJECT_NUM = ? , PROJECT_DATE = ? , OVER5 = ? , STATUS = ? , LETTER_NUM_CUSTOMER = ? , DATE_LETTER_CUSTOMER = ? , LETTER_NUM = ? , DATE_LETTER = ? , RELIABILITY_CLASS = ? , ID_WAITING_STATUS = ? , WAITINGSTATUS = ? , IS_PAYABLE = ? , WORKSIZE = ? , WORK_INC_NET = ? , BUSINESS_TYPE = ? , ESTIMATETERM = ? , ESTIMATEDATE = ? , BUILDINGTERM = ? , BUILDINGDATE = ? , BUYINGTERM = ? , BUYINGDATE = ? , ESTIMATE_NUM = ? , ESTIMATE_CONTRACT_DATE = ? , IS_RESERV = ? , PURPOSE = ? , IS_KSOE = ? , OVER150 = ? , IS_NEW = ? , IS3PHASES = ? , SUBSYSTEMREFCODE = ? , AIRLINE04REFCODE = ? , CABLELINE04REFCODE = ? , TRREFCODE = ? , S04REFCODE = ? , AIRLINE10REFCODE = ? , CABLELINE10REFCODE = ? , S35REFCODE = ? , AIRLINE150REFCODE = ? , CABLELINE150REFCODE = ? , S150REFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE CNPACK SET ";
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
      if (anObject.packCode != Integer.MIN_VALUE )
         statement.setInt(1,anObject.packCode);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.name);
      if (anObject.id_ren != Integer.MIN_VALUE )
         statement.setInt(3,anObject.id_ren);
      else
         statement.setNull(3,java.sql.Types.INTEGER);
      statement.setString(4,anObject.renName);
      if (anObject.id_district != Integer.MIN_VALUE )
         statement.setInt(5,anObject.id_district);
      else
         statement.setNull(5,java.sql.Types.INTEGER);
      statement.setString(6,anObject.districtName);
      if (anObject.id_pack_status != Integer.MIN_VALUE )
         statement.setInt(7,anObject.id_pack_status);
      else
         statement.setNull(7,java.sql.Types.INTEGER);
      statement.setString(8,anObject.statusName);
      statement.setString(9,anObject.description);
      if (anObject.power != null)
        anObject.power = anObject.power.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(10,anObject.power);

      statement.setString(11,anObject.address);
      statement.setString(12,anObject.address_jur);
      statement.setString(13,anObject.reg_num_cn_contract);
      if (anObject.date_cn_contract == null)
        statement.setDate(14,null);
      else
        statement.setDate(14,new java.sql.Date(anObject.date_cn_contract.getTime()));
      statement.setString(15,anObject.reg_num_spl_pp_contract);
      if (anObject.date_spl_pp_contract == null)
        statement.setDate(16,null);
      else
        statement.setDate(16,new java.sql.Date(anObject.date_spl_pp_contract.getTime()));
      statement.setString(17,anObject.reg_num_tu_contract);
      if (anObject.date_tu_contract == null)
        statement.setDate(18,null);
      else
        statement.setDate(18,new java.sql.Date(anObject.date_tu_contract.getTime()));
      statement.setString(19,anObject.reg_num_tu_cr_contract);
      if (anObject.date_tu_cr_contract == null)
        statement.setDate(20,null);
      else
        statement.setDate(20,new java.sql.Date(anObject.date_tu_cr_contract.getTime()));
      statement.setString(21,anObject.project_num);
      if (anObject.project_date == null)
        statement.setDate(22,null);
      else
        statement.setDate(22,new java.sql.Date(anObject.project_date.getTime()));
      if (anObject.over5 != Integer.MIN_VALUE )
         statement.setInt(23,anObject.over5);
      else
         statement.setNull(23,java.sql.Types.INTEGER);
      if (anObject.status != Integer.MIN_VALUE )
         statement.setInt(24,anObject.status);
      else
         statement.setNull(24,java.sql.Types.INTEGER);
      statement.setString(25,anObject.letter_num_customer);
      if (anObject.date_letter_customer == null)
        statement.setDate(26,null);
      else
        statement.setDate(26,new java.sql.Date(anObject.date_letter_customer.getTime()));
      statement.setString(27,anObject.letter_num);
      if (anObject.date_letter == null)
        statement.setDate(28,null);
      else
        statement.setDate(28,new java.sql.Date(anObject.date_letter.getTime()));
      statement.setString(29,anObject.reliability_class);
      if (anObject.id_waiting_status != Integer.MIN_VALUE )
         statement.setInt(30,anObject.id_waiting_status);
      else
         statement.setNull(30,java.sql.Types.INTEGER);
      statement.setString(31,anObject.waitingStatus);
      if (anObject.is_payable != Integer.MIN_VALUE )
         statement.setInt(32,anObject.is_payable);
      else
         statement.setNull(32,java.sql.Types.INTEGER);
      statement.setString(33,anObject.worksize);
      statement.setString(34,anObject.work_inc_net);
      statement.setString(35,anObject.business_type);
      if (anObject.estimateterm != Integer.MIN_VALUE )
         statement.setInt(36,anObject.estimateterm);
      else
         statement.setNull(36,java.sql.Types.INTEGER);
      if (anObject.estimatedate == null)
        statement.setDate(37,null);
      else
        statement.setDate(37,new java.sql.Date(anObject.estimatedate.getTime()));
      if (anObject.buildingterm != Integer.MIN_VALUE )
         statement.setInt(38,anObject.buildingterm);
      else
         statement.setNull(38,java.sql.Types.INTEGER);
      if (anObject.buildingdate == null)
        statement.setDate(39,null);
      else
        statement.setDate(39,new java.sql.Date(anObject.buildingdate.getTime()));
      if (anObject.buyingterm != Integer.MIN_VALUE )
         statement.setInt(40,anObject.buyingterm);
      else
         statement.setNull(40,java.sql.Types.INTEGER);
      if (anObject.buyingdate == null)
        statement.setDate(41,null);
      else
        statement.setDate(41,new java.sql.Date(anObject.buyingdate.getTime()));
      statement.setString(42,anObject.estimate_num);
      if (anObject.estimate_contract_date == null)
        statement.setDate(43,null);
      else
        statement.setDate(43,new java.sql.Date(anObject.estimate_contract_date.getTime()));
      if (anObject.is_reserv != Integer.MIN_VALUE )
         statement.setInt(44,anObject.is_reserv);
      else
         statement.setNull(44,java.sql.Types.INTEGER);
      statement.setString(45,anObject.purpose);
      if (anObject.is_ksoe != Integer.MIN_VALUE )
         statement.setInt(46,anObject.is_ksoe);
      else
         statement.setNull(46,java.sql.Types.INTEGER);
      if (anObject.over150 != Integer.MIN_VALUE )
         statement.setInt(47,anObject.over150);
      else
         statement.setNull(47,java.sql.Types.INTEGER);
      if (anObject.is_new != Integer.MIN_VALUE )
         statement.setInt(48,anObject.is_new);
      else
         statement.setNull(48,java.sql.Types.INTEGER);
      if (anObject.is3phases != Integer.MIN_VALUE )
         statement.setInt(49,anObject.is3phases);
      else
         statement.setNull(49,java.sql.Types.INTEGER);
      if (anObject.subsystemRef.code != Integer.MIN_VALUE)
        statement.setInt(50,anObject.subsystemRef.code);
      else
        statement.setNull(50,java.sql.Types.INTEGER);
      if (anObject.airLine04Ref.code != Integer.MIN_VALUE)
        statement.setInt(51,anObject.airLine04Ref.code);
      else
        statement.setNull(51,java.sql.Types.INTEGER);
      if (anObject.cableLine04Ref.code != Integer.MIN_VALUE)
        statement.setInt(52,anObject.cableLine04Ref.code);
      else
        statement.setNull(52,java.sql.Types.INTEGER);
      if (anObject.trRef.code != Integer.MIN_VALUE)
        statement.setInt(53,anObject.trRef.code);
      else
        statement.setNull(53,java.sql.Types.INTEGER);
      if (anObject.s04Ref.code != Integer.MIN_VALUE)
        statement.setInt(54,anObject.s04Ref.code);
      else
        statement.setNull(54,java.sql.Types.INTEGER);
      if (anObject.airLine10Ref.code != Integer.MIN_VALUE)
        statement.setInt(55,anObject.airLine10Ref.code);
      else
        statement.setNull(55,java.sql.Types.INTEGER);
      if (anObject.cableLine10Ref.code != Integer.MIN_VALUE)
        statement.setInt(56,anObject.cableLine10Ref.code);
      else
        statement.setNull(56,java.sql.Types.INTEGER);
      if (anObject.s35Ref.code != Integer.MIN_VALUE)
        statement.setInt(57,anObject.s35Ref.code);
      else
        statement.setNull(57,java.sql.Types.INTEGER);
      if (anObject.airLine150Ref.code != Integer.MIN_VALUE)
        statement.setInt(58,anObject.airLine150Ref.code);
      else
        statement.setNull(58,java.sql.Types.INTEGER);
      if (anObject.cableLine150Ref.code != Integer.MIN_VALUE)
        statement.setInt(59,anObject.cableLine150Ref.code);
      else
        statement.setNull(59,java.sql.Types.INTEGER);
      if (anObject.s150Ref.code != Integer.MIN_VALUE)
        statement.setInt(60,anObject.s150Ref.code);
      else
        statement.setNull(60,java.sql.Types.INTEGER);
          statement.setInt(61,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("PACKCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.packCode);
                continue;
             }
            if("NAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.name);
                continue;
             }
            if("ID_REN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.id_ren);
                continue;
             }
            if("RENNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.renName);
                continue;
             }
            if("ID_DISTRICT".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.id_district);
                continue;
             }
            if("DISTRICTNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.districtName);
                continue;
             }
            if("ID_PACK_STATUS".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.id_pack_status);
                continue;
             }
            if("STATUSNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.statusName);
                continue;
             }
            if("DESCRIPTION".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.description);
                continue;
             }
            if("POWER".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.power != null)
                    anObject.power = anObject.power.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.power);
                continue;
             }
            if("ADDRESS".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.address);
                continue;
             }
            if("ADDRESS_JUR".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.address_jur);
                continue;
             }
            if("REG_NUM_CN_CONTRACT".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.reg_num_cn_contract);
                continue;
             }
            if("DATE_CN_CONTRACT".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.date_cn_contract == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.date_cn_contract.getTime()));
                continue;
             }
            if("REG_NUM_SPL_PP_CONTRACT".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.reg_num_spl_pp_contract);
                continue;
             }
            if("DATE_SPL_PP_CONTRACT".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.date_spl_pp_contract == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.date_spl_pp_contract.getTime()));
                continue;
             }
            if("REG_NUM_TU_CONTRACT".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.reg_num_tu_contract);
                continue;
             }
            if("DATE_TU_CONTRACT".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.date_tu_contract == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.date_tu_contract.getTime()));
                continue;
             }
            if("REG_NUM_TU_CR_CONTRACT".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.reg_num_tu_cr_contract);
                continue;
             }
            if("DATE_TU_CR_CONTRACT".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.date_tu_cr_contract == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.date_tu_cr_contract.getTime()));
                continue;
             }
            if("PROJECT_NUM".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.project_num);
                continue;
             }
            if("PROJECT_DATE".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.project_date == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.project_date.getTime()));
                continue;
             }
            if("OVER5".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.over5);
                continue;
             }
            if("STATUS".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.status);
                continue;
             }
            if("LETTER_NUM_CUSTOMER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.letter_num_customer);
                continue;
             }
            if("DATE_LETTER_CUSTOMER".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.date_letter_customer == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.date_letter_customer.getTime()));
                continue;
             }
            if("LETTER_NUM".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.letter_num);
                continue;
             }
            if("DATE_LETTER".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.date_letter == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.date_letter.getTime()));
                continue;
             }
            if("RELIABILITY_CLASS".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.reliability_class);
                continue;
             }
            if("ID_WAITING_STATUS".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.id_waiting_status);
                continue;
             }
            if("WAITINGSTATUS".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.waitingStatus);
                continue;
             }
            if("IS_PAYABLE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.is_payable);
                continue;
             }
            if("WORKSIZE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.worksize);
                continue;
             }
            if("WORK_INC_NET".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.work_inc_net);
                continue;
             }
            if("BUSINESS_TYPE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.business_type);
                continue;
             }
            if("ESTIMATETERM".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.estimateterm);
                continue;
             }
            if("ESTIMATEDATE".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.estimatedate == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.estimatedate.getTime()));
                continue;
             }
            if("BUILDINGTERM".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.buildingterm);
                continue;
             }
            if("BUILDINGDATE".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.buildingdate == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.buildingdate.getTime()));
                continue;
             }
            if("BUYINGTERM".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.buyingterm);
                continue;
             }
            if("BUYINGDATE".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.buyingdate == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.buyingdate.getTime()));
                continue;
             }
            if("ESTIMATE_NUM".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.estimate_num);
                continue;
             }
            if("ESTIMATE_CONTRACT_DATE".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.estimate_contract_date == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.estimate_contract_date.getTime()));
                continue;
             }
            if("IS_RESERV".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.is_reserv);
                continue;
             }
            if("PURPOSE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.purpose);
                continue;
             }
            if("IS_KSOE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.is_ksoe);
                continue;
             }
            if("OVER150".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.over150);
                continue;
             }
            if("IS_NEW".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.is_new);
                continue;
             }
            if("IS3PHASES".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.is3phases);
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
            if("AIRLINE04REF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.airLine04Ref.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.airLine04Ref.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("CABLELINE04REF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.cableLine04Ref.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.cableLine04Ref.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("TRREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.trRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.trRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("S04REF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.s04Ref.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.s04Ref.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("AIRLINE10REF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.airLine10Ref.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.airLine10Ref.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("CABLELINE10REF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.cableLine10Ref.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.cableLine10Ref.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("S35REF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.s35Ref.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.s35Ref.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("AIRLINE150REF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.airLine150Ref.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.airLine150Ref.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("CABLELINE150REF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.cableLine150Ref.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.cableLine150Ref.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("S150REF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.s150Ref.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.s150Ref.code);
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

   } // end of save(CNPack anObject,String[] anAttributes)


 public CNPackShort getShortObject(int anObjectCode) throws PersistenceException
  {
   CNPack filterObject = new CNPack();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (CNPackShort)list.get(0);
   return null;
  }

  public CNPackShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public CNPackShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public CNPackShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public CNPackShortList getFilteredList(CNPack filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public CNPackShortList getScrollableFilteredList(CNPack aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public CNPackShortList getScrollableFilteredList(CNPack aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public CNPackShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public CNPackShortList getScrollableFilteredList(CNPackFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public CNPackShortList getScrollableFilteredList(CNPackFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public CNPackShortList getScrollableFilteredList(CNPack aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public CNPackShortList getScrollableFilteredList(CNPack aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    CNPackShortList result = new CNPackShortList();
    CNPackShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "CNPACK.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "CNPACK.CODE"+
     ",CNPACK.PACKCODE"+
     ",CNPACK.NAME"+
     ",CNPACK.ID_REN"+
     ",CNPACK.RENNAME"+
     ",CNPACK.ID_DISTRICT"+
     ",CNPACK.DISTRICTNAME"+
     ",CNPACK.ID_PACK_STATUS"+
     ",CNPACK.STATUSNAME"+
     ",CNPACK.DESCRIPTION"+
     ",CNPACK.POWER"+
     ",CNPACK.ADDRESS"+
     ",CNPACK.ADDRESS_JUR"+
     ",CNPACK.REG_NUM_CN_CONTRACT"+
     ",CNPACK.DATE_CN_CONTRACT"+
     ",CNPACK.REG_NUM_SPL_PP_CONTRCT"+
     ",CNPACK.DATE_SPL_PP_CONTRACT"+
     ",CNPACK.REG_NUM_TU_CONTRACT"+
     ",CNPACK.DATE_TU_CONTRACT"+
     ",CNPACK.REG_NUM_TU_CR_CONTRACT"+
     ",CNPACK.DATE_TU_CR_CONTRACT"+
     ",CNPACK.PROJECT_NUM"+
     ",CNPACK.PROJECT_DATE"+
     ",CNPACK.OVER5"+
     ",CNPACK.STATUS"+
     ",CNPACK.LETTER_NUM_CUSTOMER"+
     ",CNPACK.DATE_LETTER_CUSTOMER"+
     ",CNPACK.LETTER_NUM"+
     ",CNPACK.DATE_LETTER"+
     ",CNPACK.RELIABILITY_CLASS"+
     ",CNPACK.ID_WAITING_STATUS"+
     ",CNPACK.WAITINGSTATUS"+
     ",CNPACK.IS_PAYABLE"+
     ",CNPACK.WORKSIZE"+
     ",CNPACK.WORK_INC_NET"+
     ",CNPACK.BUSINESS_TYPE"+
     ",CNPACK.ESTIMATETERM"+
     ",CNPACK.ESTIMATEDATE"+
     ",CNPACK.BUILDINGTERM"+
     ",CNPACK.BUILDINGDATE"+
     ",CNPACK.BUYINGTERM"+
     ",CNPACK.BUYINGDATE"+
     ",CNPACK.ESTIMATE_NUM"+
     ",CNPACK.ESTIMATE_CONTRACT_DATE"+
     ",CNPACK.IS_RESERV"+
     ",CNPACK.PURPOSE"+
     ",CNPACK.IS_KSOE"+
     ",CNPACK.OVER150"+
     ",CNPACK.IS_NEW"+
     ",CNPACK.IS3PHASES"+

      ", CNSUBSYSTEMTYPE.CODE " +
      ", CNSUBSYSTEMTYPE.NAME " +
     ", CNPACK.AIRLINE04REFCODE" +
     ", CNPACK.CABLELINE04REFCODE" +
     ", CNPACK.TRREFCODE" +
     ", CNPACK.S04REFCODE" +
     ", CNPACK.AIRLINE10REFCODE" +
     ", CNPACK.CABLELINE10REFCODE" +
     ", CNPACK.S35REFCODE" +
     ", CNPACK.AIRLINE150REFCODE" +
     ", CNPACK.CABLELINE150REFCODE" +
     ", CNPACK.S150REFCODE" +
     " FROM CNPACK " +
     ", CNSUBSYSTEMTYPE " +
     //" WHERE "
    "";
     whereStr = " CNSUBSYSTEMTYPE.CODE = CNPACK.SUBSYSTEMREFCODE" ; //+
        //selectStr = selectStr + " ${s} CNPACK.CODE IN ( SELECT CNPACK.CODE FROM CNPACK ";

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.CODE = ?";
        }
        if(aFilterObject.packCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.PACKCODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNPACK.NAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNPACK.NAME) LIKE UPPER(?)";
         }
        if(aFilterObject.id_ren != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.ID_REN = ?";
        }
         if (aFilterObject.renName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.renName.indexOf('*',0) < 0 && aFilterObject.renName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNPACK.RENNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNPACK.RENNAME) LIKE UPPER(?)";
         }
        if(aFilterObject.id_district != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.ID_DISTRICT = ?";
        }
         if (aFilterObject.districtName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.districtName.indexOf('*',0) < 0 && aFilterObject.districtName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNPACK.DISTRICTNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNPACK.DISTRICTNAME) LIKE UPPER(?)";
         }
        if(aFilterObject.id_pack_status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.ID_PACK_STATUS = ?";
        }
         if (aFilterObject.statusName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.statusName.indexOf('*',0) < 0 && aFilterObject.statusName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNPACK.STATUSNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNPACK.STATUSNAME) LIKE UPPER(?)";
         }
         if (aFilterObject.description != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.description.indexOf('*',0) < 0 && aFilterObject.description.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNPACK.DESCRIPTION) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNPACK.DESCRIPTION) LIKE UPPER(?)";
         }
        if(aFilterObject.power != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.POWER = ?";
        }
         if (aFilterObject.address != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.address.indexOf('*',0) < 0 && aFilterObject.address.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNPACK.ADDRESS) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNPACK.ADDRESS) LIKE UPPER(?)";
         }
         if (aFilterObject.address_jur != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.address_jur.indexOf('*',0) < 0 && aFilterObject.address_jur.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNPACK.ADDRESS_JUR) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNPACK.ADDRESS_JUR) LIKE UPPER(?)";
         }
         if (aFilterObject.reg_num_cn_contract != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.reg_num_cn_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_cn_contract.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNPACK.REG_NUM_CN_CONTRACT) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNPACK.REG_NUM_CN_CONTRACT) LIKE UPPER(?)";
         }
        if(aFilterObject.date_cn_contract != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.DATE_CN_CONTRACT = ?";
        }
         if (aFilterObject.reg_num_spl_pp_contract != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.reg_num_spl_pp_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_spl_pp_contract.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNPACK.REG_NUM_SPL_PP_CONTRCT) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNPACK.REG_NUM_SPL_PP_CONTRCT) LIKE UPPER(?)";
         }
        if(aFilterObject.date_spl_pp_contract != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.DATE_SPL_PP_CONTRACT = ?";
        }
         if (aFilterObject.reg_num_tu_contract != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.reg_num_tu_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_tu_contract.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNPACK.REG_NUM_TU_CONTRACT) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNPACK.REG_NUM_TU_CONTRACT) LIKE UPPER(?)";
         }
        if(aFilterObject.date_tu_contract != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.DATE_TU_CONTRACT = ?";
        }
         if (aFilterObject.reg_num_tu_cr_contract != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.reg_num_tu_cr_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_tu_cr_contract.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNPACK.REG_NUM_TU_CR_CONTRACT) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNPACK.REG_NUM_TU_CR_CONTRACT) LIKE UPPER(?)";
         }
        if(aFilterObject.date_tu_cr_contract != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.DATE_TU_CR_CONTRACT = ?";
        }
         if (aFilterObject.project_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.project_num.indexOf('*',0) < 0 && aFilterObject.project_num.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNPACK.PROJECT_NUM) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNPACK.PROJECT_NUM) LIKE UPPER(?)";
         }
        if(aFilterObject.project_date != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.PROJECT_DATE = ?";
        }
        if(aFilterObject.over5 != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.OVER5 = ?";
        }
        if(aFilterObject.status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.STATUS = ?";
        }
         if (aFilterObject.letter_num_customer != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.letter_num_customer.indexOf('*',0) < 0 && aFilterObject.letter_num_customer.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNPACK.LETTER_NUM_CUSTOMER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNPACK.LETTER_NUM_CUSTOMER) LIKE UPPER(?)";
         }
        if(aFilterObject.date_letter_customer != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.DATE_LETTER_CUSTOMER = ?";
        }
         if (aFilterObject.letter_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.letter_num.indexOf('*',0) < 0 && aFilterObject.letter_num.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNPACK.LETTER_NUM) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNPACK.LETTER_NUM) LIKE UPPER(?)";
         }
        if(aFilterObject.date_letter != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.DATE_LETTER = ?";
        }
         if (aFilterObject.reliability_class != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.reliability_class.indexOf('*',0) < 0 && aFilterObject.reliability_class.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNPACK.RELIABILITY_CLASS) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNPACK.RELIABILITY_CLASS) LIKE UPPER(?)";
         }
        if(aFilterObject.id_waiting_status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.ID_WAITING_STATUS = ?";
        }
         if (aFilterObject.waitingStatus != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.waitingStatus.indexOf('*',0) < 0 && aFilterObject.waitingStatus.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNPACK.WAITINGSTATUS) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNPACK.WAITINGSTATUS) LIKE UPPER(?)";
         }
        if(aFilterObject.is_payable != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.IS_PAYABLE = ?";
        }
         if (aFilterObject.worksize != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.worksize.indexOf('*',0) < 0 && aFilterObject.worksize.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNPACK.WORKSIZE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNPACK.WORKSIZE) LIKE UPPER(?)";
         }
         if (aFilterObject.work_inc_net != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.work_inc_net.indexOf('*',0) < 0 && aFilterObject.work_inc_net.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNPACK.WORK_INC_NET) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNPACK.WORK_INC_NET) LIKE UPPER(?)";
         }
         if (aFilterObject.business_type != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.business_type.indexOf('*',0) < 0 && aFilterObject.business_type.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNPACK.BUSINESS_TYPE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNPACK.BUSINESS_TYPE) LIKE UPPER(?)";
         }
        if(aFilterObject.estimateterm != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.ESTIMATETERM = ?";
        }
        if(aFilterObject.estimatedate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.ESTIMATEDATE = ?";
        }
        if(aFilterObject.buildingterm != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.BUILDINGTERM = ?";
        }
        if(aFilterObject.buildingdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.BUILDINGDATE = ?";
        }
        if(aFilterObject.buyingterm != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.BUYINGTERM = ?";
        }
        if(aFilterObject.buyingdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.BUYINGDATE = ?";
        }
         if (aFilterObject.estimate_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.estimate_num.indexOf('*',0) < 0 && aFilterObject.estimate_num.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNPACK.ESTIMATE_NUM) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNPACK.ESTIMATE_NUM) LIKE UPPER(?)";
         }
        if(aFilterObject.estimate_contract_date != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.ESTIMATE_CONTRACT_DATE = ?";
        }
        if(aFilterObject.is_reserv != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.IS_RESERV = ?";
        }
         if (aFilterObject.purpose != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.purpose.indexOf('*',0) < 0 && aFilterObject.purpose.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(CNPACK.PURPOSE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(CNPACK.PURPOSE) LIKE UPPER(?)";
         }
        if(aFilterObject.is_ksoe != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.IS_KSOE = ?";
        }
        if(aFilterObject.over150 != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.OVER150 = ?";
        }
        if(aFilterObject.is_new != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.IS_NEW = ?";
        }
        if(aFilterObject.is3phases != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.IS3PHASES = ?";
        }
        if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "CNPACK.SUBSYSTEMREFCODE = ? ";
        }
        if(aFilterObject.airLine04Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "CNPACK.AIRLINE04REFCODE = ? ";
        }
        if(aFilterObject.cableLine04Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "CNPACK.CABLELINE04REFCODE = ? ";
        }
        if(aFilterObject.trRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "CNPACK.TRREFCODE = ? ";
        }
        if(aFilterObject.s04Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "CNPACK.S04REFCODE = ? ";
        }
        if(aFilterObject.airLine10Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "CNPACK.AIRLINE10REFCODE = ? ";
        }
        if(aFilterObject.cableLine10Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "CNPACK.CABLELINE10REFCODE = ? ";
        }
        if(aFilterObject.s35Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "CNPACK.S35REFCODE = ? ";
        }
        if(aFilterObject.airLine150Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "CNPACK.AIRLINE150REFCODE = ? ";
        }
        if(aFilterObject.cableLine150Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "CNPACK.CABLELINE150REFCODE = ? ";
        }
        if(aFilterObject.s150Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "CNPACK.S150REFCODE = ? ";
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
         if(aFilterObject.packCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.packCode);
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
         if(aFilterObject.id_ren != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_ren);
         }

           if(aFilterObject.renName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.renName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.id_district != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_district);
         }

           if(aFilterObject.districtName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.districtName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.id_pack_status != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_pack_status);
         }

           if(aFilterObject.statusName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.statusName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.description != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.description);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.power != null){
            number++;
            aFilterObject.power = aFilterObject.power.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power);
        }

           if(aFilterObject.address != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.address);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.address_jur != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.address_jur);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.reg_num_cn_contract != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.reg_num_cn_contract);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.date_cn_contract != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.date_cn_contract.getTime()));
        }

           if(aFilterObject.reg_num_spl_pp_contract != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.reg_num_spl_pp_contract);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.date_spl_pp_contract != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.date_spl_pp_contract.getTime()));
        }

           if(aFilterObject.reg_num_tu_contract != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.reg_num_tu_contract);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.date_tu_contract != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.date_tu_contract.getTime()));
        }

           if(aFilterObject.reg_num_tu_cr_contract != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.reg_num_tu_cr_contract);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.date_tu_cr_contract != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.date_tu_cr_contract.getTime()));
        }

           if(aFilterObject.project_num != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.project_num);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.project_date != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.project_date.getTime()));
        }
         if(aFilterObject.over5 != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.over5);
         }
         if(aFilterObject.status != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.status);
         }

           if(aFilterObject.letter_num_customer != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.letter_num_customer);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.date_letter_customer != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.date_letter_customer.getTime()));
        }

           if(aFilterObject.letter_num != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.letter_num);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.date_letter != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.date_letter.getTime()));
        }

           if(aFilterObject.reliability_class != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.reliability_class);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.id_waiting_status != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_waiting_status);
         }

           if(aFilterObject.waitingStatus != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.waitingStatus);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.is_payable != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is_payable);
         }

           if(aFilterObject.worksize != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.worksize);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.work_inc_net != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.work_inc_net);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.business_type != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.business_type);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.estimateterm != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.estimateterm);
         }
        if(aFilterObject.estimatedate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.estimatedate.getTime()));
        }
         if(aFilterObject.buildingterm != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.buildingterm);
         }
        if(aFilterObject.buildingdate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.buildingdate.getTime()));
        }
         if(aFilterObject.buyingterm != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.buyingterm);
         }
        if(aFilterObject.buyingdate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.buyingdate.getTime()));
        }

           if(aFilterObject.estimate_num != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.estimate_num);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.estimate_contract_date != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.estimate_contract_date.getTime()));
        }
         if(aFilterObject.is_reserv != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is_reserv);
         }

           if(aFilterObject.purpose != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.purpose);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.is_ksoe != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is_ksoe);
         }
         if(aFilterObject.over150 != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.over150);
         }
         if(aFilterObject.is_new != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is_new);
         }
         if(aFilterObject.is3phases != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is3phases);
         }
       if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.subsystemRef.code);
       }
       if(aFilterObject.airLine04Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.airLine04Ref.code);
       }
       if(aFilterObject.cableLine04Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cableLine04Ref.code);
       }
       if(aFilterObject.trRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.trRef.code);
       }
       if(aFilterObject.s04Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.s04Ref.code);
       }
       if(aFilterObject.airLine10Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.airLine10Ref.code);
       }
       if(aFilterObject.cableLine10Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cableLine10Ref.code);
       }
       if(aFilterObject.s35Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.s35Ref.code);
       }
       if(aFilterObject.airLine150Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.airLine150Ref.code);
       }
       if(aFilterObject.cableLine150Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cableLine150Ref.code);
       }
       if(aFilterObject.s150Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.s150Ref.code);
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

        anObject = new CNPackShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.packCode = set.getInt(2);
        if ( set.wasNull() )
            anObject.packCode = Integer.MIN_VALUE;
        anObject.name = set.getString(3);
        anObject.id_ren = set.getInt(4);
        if ( set.wasNull() )
            anObject.id_ren = Integer.MIN_VALUE;
        anObject.renName = set.getString(5);
        anObject.id_district = set.getInt(6);
        if ( set.wasNull() )
            anObject.id_district = Integer.MIN_VALUE;
        anObject.districtName = set.getString(7);
        anObject.id_pack_status = set.getInt(8);
        if ( set.wasNull() )
            anObject.id_pack_status = Integer.MIN_VALUE;
        anObject.statusName = set.getString(9);
        anObject.description = set.getString(10);
        anObject.power = set.getBigDecimal(11);
        if(anObject.power != null)
            anObject.power = anObject.power.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.address = set.getString(12);
        anObject.address_jur = set.getString(13);
        anObject.reg_num_cn_contract = set.getString(14);
        anObject.date_cn_contract = set.getDate(15);
        anObject.reg_num_spl_pp_contract = set.getString(16);
        anObject.date_spl_pp_contract = set.getDate(17);
        anObject.reg_num_tu_contract = set.getString(18);
        anObject.date_tu_contract = set.getDate(19);
        anObject.reg_num_tu_cr_contract = set.getString(20);
        anObject.date_tu_cr_contract = set.getDate(21);
        anObject.project_num = set.getString(22);
        anObject.project_date = set.getDate(23);
        anObject.over5 = set.getInt(24);
        if ( set.wasNull() )
            anObject.over5 = Integer.MIN_VALUE;
        anObject.status = set.getInt(25);
        if ( set.wasNull() )
            anObject.status = Integer.MIN_VALUE;
        anObject.letter_num_customer = set.getString(26);
        anObject.date_letter_customer = set.getDate(27);
        anObject.letter_num = set.getString(28);
        anObject.date_letter = set.getDate(29);
        anObject.reliability_class = set.getString(30);
        anObject.id_waiting_status = set.getInt(31);
        if ( set.wasNull() )
            anObject.id_waiting_status = Integer.MIN_VALUE;
        anObject.waitingStatus = set.getString(32);
        anObject.is_payable = set.getInt(33);
        if ( set.wasNull() )
            anObject.is_payable = Integer.MIN_VALUE;
        anObject.worksize = set.getString(34);
        anObject.work_inc_net = set.getString(35);
        anObject.business_type = set.getString(36);
        anObject.estimateterm = set.getInt(37);
        if ( set.wasNull() )
            anObject.estimateterm = Integer.MIN_VALUE;
        anObject.estimatedate = set.getDate(38);
        anObject.buildingterm = set.getInt(39);
        if ( set.wasNull() )
            anObject.buildingterm = Integer.MIN_VALUE;
        anObject.buildingdate = set.getDate(40);
        anObject.buyingterm = set.getInt(41);
        if ( set.wasNull() )
            anObject.buyingterm = Integer.MIN_VALUE;
        anObject.buyingdate = set.getDate(42);
        anObject.estimate_num = set.getString(43);
        anObject.estimate_contract_date = set.getDate(44);
        anObject.is_reserv = set.getInt(45);
        if ( set.wasNull() )
            anObject.is_reserv = Integer.MIN_VALUE;
        anObject.purpose = set.getString(46);
        anObject.is_ksoe = set.getInt(47);
        if ( set.wasNull() )
            anObject.is_ksoe = Integer.MIN_VALUE;
        anObject.over150 = set.getInt(48);
        if ( set.wasNull() )
            anObject.over150 = Integer.MIN_VALUE;
        anObject.is_new = set.getInt(49);
        if ( set.wasNull() )
            anObject.is_new = Integer.MIN_VALUE;
        anObject.is3phases = set.getInt(50);
        if ( set.wasNull() )
            anObject.is3phases = Integer.MIN_VALUE;

        anObject.subsystemRefCode = set.getInt(51);
        if(set.wasNull())
        anObject.subsystemRefCode = Integer.MIN_VALUE;
        anObject.subsystemRefName = set.getString(52);
        anObject.airLine04RefCode = set.getInt(53);
        if(set.wasNull())
        anObject.airLine04RefCode = Integer.MIN_VALUE;
        anObject.cableLine04RefCode = set.getInt(54);
        if(set.wasNull())
        anObject.cableLine04RefCode = Integer.MIN_VALUE;
        anObject.trRefCode = set.getInt(55);
        if(set.wasNull())
        anObject.trRefCode = Integer.MIN_VALUE;
        anObject.s04RefCode = set.getInt(56);
        if(set.wasNull())
        anObject.s04RefCode = Integer.MIN_VALUE;
        anObject.airLine10RefCode = set.getInt(57);
        if(set.wasNull())
        anObject.airLine10RefCode = Integer.MIN_VALUE;
        anObject.cableLine10RefCode = set.getInt(58);
        if(set.wasNull())
        anObject.cableLine10RefCode = Integer.MIN_VALUE;
        anObject.s35RefCode = set.getInt(59);
        if(set.wasNull())
        anObject.s35RefCode = Integer.MIN_VALUE;
        anObject.airLine150RefCode = set.getInt(60);
        if(set.wasNull())
        anObject.airLine150RefCode = Integer.MIN_VALUE;
        anObject.cableLine150RefCode = set.getInt(61);
        if(set.wasNull())
        anObject.cableLine150RefCode = Integer.MIN_VALUE;
        anObject.s150RefCode = set.getInt(62);
        if(set.wasNull())
        anObject.s150RefCode = Integer.MIN_VALUE;

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

  public int[] getFilteredCodeArrayOLD(CNPack aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT CNPACK.CODE FROM CNPACK";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "CNPACK.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.CODE = ?";
        }
        if(aFilterObject.packCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.PACKCODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.NAME = ?";
             else
                 whereStr = whereStr + "  CNPACK.NAME LIKE ?";
         }
        if(aFilterObject.id_ren != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.ID_REN = ?";
        }
         if (aFilterObject.renName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.renName.indexOf('*',0) < 0 && aFilterObject.renName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.RENNAME = ?";
             else
                 whereStr = whereStr + "  CNPACK.RENNAME LIKE ?";
         }
        if(aFilterObject.id_district != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.ID_DISTRICT = ?";
        }
         if (aFilterObject.districtName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.districtName.indexOf('*',0) < 0 && aFilterObject.districtName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.DISTRICTNAME = ?";
             else
                 whereStr = whereStr + "  CNPACK.DISTRICTNAME LIKE ?";
         }
        if(aFilterObject.id_pack_status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.ID_PACK_STATUS = ?";
        }
         if (aFilterObject.statusName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.statusName.indexOf('*',0) < 0 && aFilterObject.statusName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.STATUSNAME = ?";
             else
                 whereStr = whereStr + "  CNPACK.STATUSNAME LIKE ?";
         }
         if (aFilterObject.description != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.description.indexOf('*',0) < 0 && aFilterObject.description.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.DESCRIPTION = ?";
             else
                 whereStr = whereStr + "  CNPACK.DESCRIPTION LIKE ?";
         }
        if(aFilterObject.power != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.POWER = ?";
        }
         if (aFilterObject.address != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.address.indexOf('*',0) < 0 && aFilterObject.address.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.ADDRESS = ?";
             else
                 whereStr = whereStr + "  CNPACK.ADDRESS LIKE ?";
         }
         if (aFilterObject.address_jur != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.address_jur.indexOf('*',0) < 0 && aFilterObject.address_jur.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.ADDRESS_JUR = ?";
             else
                 whereStr = whereStr + "  CNPACK.ADDRESS_JUR LIKE ?";
         }
         if (aFilterObject.reg_num_cn_contract != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.reg_num_cn_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_cn_contract.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.REG_NUM_CN_CONTRACT = ?";
             else
                 whereStr = whereStr + "  CNPACK.REG_NUM_CN_CONTRACT LIKE ?";
         }
        if(aFilterObject.date_cn_contract != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.DATE_CN_CONTRACT = ?";
        }
         if (aFilterObject.reg_num_spl_pp_contract != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.reg_num_spl_pp_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_spl_pp_contract.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.REG_NUM_SPL_PP_CONTRCT = ?";
             else
                 whereStr = whereStr + "  CNPACK.REG_NUM_SPL_PP_CONTRCT LIKE ?";
         }
        if(aFilterObject.date_spl_pp_contract != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.DATE_SPL_PP_CONTRACT = ?";
        }
         if (aFilterObject.reg_num_tu_contract != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.reg_num_tu_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_tu_contract.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.REG_NUM_TU_CONTRACT = ?";
             else
                 whereStr = whereStr + "  CNPACK.REG_NUM_TU_CONTRACT LIKE ?";
         }
        if(aFilterObject.date_tu_contract != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.DATE_TU_CONTRACT = ?";
        }
         if (aFilterObject.reg_num_tu_cr_contract != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.reg_num_tu_cr_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_tu_cr_contract.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.REG_NUM_TU_CR_CONTRACT = ?";
             else
                 whereStr = whereStr + "  CNPACK.REG_NUM_TU_CR_CONTRACT LIKE ?";
         }
        if(aFilterObject.date_tu_cr_contract != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.DATE_TU_CR_CONTRACT = ?";
        }
         if (aFilterObject.project_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.project_num.indexOf('*',0) < 0 && aFilterObject.project_num.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.PROJECT_NUM = ?";
             else
                 whereStr = whereStr + "  CNPACK.PROJECT_NUM LIKE ?";
         }
        if(aFilterObject.project_date != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.PROJECT_DATE = ?";
        }
        if(aFilterObject.over5 != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.OVER5 = ?";
        }
        if(aFilterObject.status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.STATUS = ?";
        }
         if (aFilterObject.letter_num_customer != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.letter_num_customer.indexOf('*',0) < 0 && aFilterObject.letter_num_customer.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.LETTER_NUM_CUSTOMER = ?";
             else
                 whereStr = whereStr + "  CNPACK.LETTER_NUM_CUSTOMER LIKE ?";
         }
        if(aFilterObject.date_letter_customer != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.DATE_LETTER_CUSTOMER = ?";
        }
         if (aFilterObject.letter_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.letter_num.indexOf('*',0) < 0 && aFilterObject.letter_num.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.LETTER_NUM = ?";
             else
                 whereStr = whereStr + "  CNPACK.LETTER_NUM LIKE ?";
         }
        if(aFilterObject.date_letter != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.DATE_LETTER = ?";
        }
         if (aFilterObject.reliability_class != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.reliability_class.indexOf('*',0) < 0 && aFilterObject.reliability_class.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.RELIABILITY_CLASS = ?";
             else
                 whereStr = whereStr + "  CNPACK.RELIABILITY_CLASS LIKE ?";
         }
        if(aFilterObject.id_waiting_status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.ID_WAITING_STATUS = ?";
        }
         if (aFilterObject.waitingStatus != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.waitingStatus.indexOf('*',0) < 0 && aFilterObject.waitingStatus.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.WAITINGSTATUS = ?";
             else
                 whereStr = whereStr + "  CNPACK.WAITINGSTATUS LIKE ?";
         }
        if(aFilterObject.is_payable != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.IS_PAYABLE = ?";
        }
         if (aFilterObject.worksize != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.worksize.indexOf('*',0) < 0 && aFilterObject.worksize.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.WORKSIZE = ?";
             else
                 whereStr = whereStr + "  CNPACK.WORKSIZE LIKE ?";
         }
         if (aFilterObject.work_inc_net != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.work_inc_net.indexOf('*',0) < 0 && aFilterObject.work_inc_net.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.WORK_INC_NET = ?";
             else
                 whereStr = whereStr + "  CNPACK.WORK_INC_NET LIKE ?";
         }
         if (aFilterObject.business_type != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.business_type.indexOf('*',0) < 0 && aFilterObject.business_type.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.BUSINESS_TYPE = ?";
             else
                 whereStr = whereStr + "  CNPACK.BUSINESS_TYPE LIKE ?";
         }
        if(aFilterObject.estimateterm != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.ESTIMATETERM = ?";
        }
        if(aFilterObject.estimatedate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.ESTIMATEDATE = ?";
        }
        if(aFilterObject.buildingterm != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.BUILDINGTERM = ?";
        }
        if(aFilterObject.buildingdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.BUILDINGDATE = ?";
        }
        if(aFilterObject.buyingterm != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.BUYINGTERM = ?";
        }
        if(aFilterObject.buyingdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.BUYINGDATE = ?";
        }
         if (aFilterObject.estimate_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.estimate_num.indexOf('*',0) < 0 && aFilterObject.estimate_num.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.ESTIMATE_NUM = ?";
             else
                 whereStr = whereStr + "  CNPACK.ESTIMATE_NUM LIKE ?";
         }
        if(aFilterObject.estimate_contract_date != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.ESTIMATE_CONTRACT_DATE = ?";
        }
        if(aFilterObject.is_reserv != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.IS_RESERV = ?";
        }
         if (aFilterObject.purpose != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.purpose.indexOf('*',0) < 0 && aFilterObject.purpose.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.PURPOSE = ?";
             else
                 whereStr = whereStr + "  CNPACK.PURPOSE LIKE ?";
         }
        if(aFilterObject.is_ksoe != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.IS_KSOE = ?";
        }
        if(aFilterObject.over150 != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.OVER150 = ?";
        }
        if(aFilterObject.is_new != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.IS_NEW = ?";
        }
        if(aFilterObject.is3phases != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.IS3PHASES = ?";
        }
        if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNPACK.SUBSYSTEMREFCODE = ? ";
        }
        if(aFilterObject.airLine04Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNPACK.AIRLINE04REFCODE = ? ";
        }
        if(aFilterObject.cableLine04Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNPACK.CABLELINE04REFCODE = ? ";
        }
        if(aFilterObject.trRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNPACK.TRREFCODE = ? ";
        }
        if(aFilterObject.s04Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNPACK.S04REFCODE = ? ";
        }
        if(aFilterObject.airLine10Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNPACK.AIRLINE10REFCODE = ? ";
        }
        if(aFilterObject.cableLine10Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNPACK.CABLELINE10REFCODE = ? ";
        }
        if(aFilterObject.s35Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNPACK.S35REFCODE = ? ";
        }
        if(aFilterObject.airLine150Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNPACK.AIRLINE150REFCODE = ? ";
        }
        if(aFilterObject.cableLine150Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNPACK.CABLELINE150REFCODE = ? ";
        }
        if(aFilterObject.s150Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNPACK.S150REFCODE = ? ";
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
         if(aFilterObject.packCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.packCode);
         }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.NAME = ?";
             else
                 whereStr = whereStr + " CNPACK.NAME LIKE ?";

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
         if(aFilterObject.id_ren != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_ren);
         }
         if (aFilterObject.renName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.renName.indexOf('*',0) < 0 && aFilterObject.renName.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.RENNAME = ?";
             else
                 whereStr = whereStr + " CNPACK.RENNAME LIKE ?";

           if(aFilterObject.renName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.renName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.id_district != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_district);
         }
         if (aFilterObject.districtName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.districtName.indexOf('*',0) < 0 && aFilterObject.districtName.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.DISTRICTNAME = ?";
             else
                 whereStr = whereStr + " CNPACK.DISTRICTNAME LIKE ?";

           if(aFilterObject.districtName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.districtName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.id_pack_status != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_pack_status);
         }
         if (aFilterObject.statusName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.statusName.indexOf('*',0) < 0 && aFilterObject.statusName.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.STATUSNAME = ?";
             else
                 whereStr = whereStr + " CNPACK.STATUSNAME LIKE ?";

           if(aFilterObject.statusName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.statusName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.description != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.description.indexOf('*',0) < 0 && aFilterObject.description.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.DESCRIPTION = ?";
             else
                 whereStr = whereStr + " CNPACK.DESCRIPTION LIKE ?";

           if(aFilterObject.description != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.description);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.power != null){
            number++;
            aFilterObject.power = aFilterObject.power.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power);
        }
         if (aFilterObject.address != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.address.indexOf('*',0) < 0 && aFilterObject.address.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.ADDRESS = ?";
             else
                 whereStr = whereStr + " CNPACK.ADDRESS LIKE ?";

           if(aFilterObject.address != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.address);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.address_jur != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.address_jur.indexOf('*',0) < 0 && aFilterObject.address_jur.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.ADDRESS_JUR = ?";
             else
                 whereStr = whereStr + " CNPACK.ADDRESS_JUR LIKE ?";

           if(aFilterObject.address_jur != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.address_jur);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.reg_num_cn_contract != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.reg_num_cn_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_cn_contract.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.REG_NUM_CN_CONTRACT = ?";
             else
                 whereStr = whereStr + " CNPACK.REG_NUM_CN_CONTRACT LIKE ?";

           if(aFilterObject.reg_num_cn_contract != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.reg_num_cn_contract);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.date_cn_contract != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.date_cn_contract.getTime()));
        }
         if (aFilterObject.reg_num_spl_pp_contract != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.reg_num_spl_pp_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_spl_pp_contract.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.REG_NUM_SPL_PP_CONTRCT = ?";
             else
                 whereStr = whereStr + " CNPACK.REG_NUM_SPL_PP_CONTRCT LIKE ?";

           if(aFilterObject.reg_num_spl_pp_contract != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.reg_num_spl_pp_contract);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.date_spl_pp_contract != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.date_spl_pp_contract.getTime()));
        }
         if (aFilterObject.reg_num_tu_contract != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.reg_num_tu_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_tu_contract.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.REG_NUM_TU_CONTRACT = ?";
             else
                 whereStr = whereStr + " CNPACK.REG_NUM_TU_CONTRACT LIKE ?";

           if(aFilterObject.reg_num_tu_contract != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.reg_num_tu_contract);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.date_tu_contract != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.date_tu_contract.getTime()));
        }
         if (aFilterObject.reg_num_tu_cr_contract != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.reg_num_tu_cr_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_tu_cr_contract.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.REG_NUM_TU_CR_CONTRACT = ?";
             else
                 whereStr = whereStr + " CNPACK.REG_NUM_TU_CR_CONTRACT LIKE ?";

           if(aFilterObject.reg_num_tu_cr_contract != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.reg_num_tu_cr_contract);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.date_tu_cr_contract != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.date_tu_cr_contract.getTime()));
        }
         if (aFilterObject.project_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.project_num.indexOf('*',0) < 0 && aFilterObject.project_num.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.PROJECT_NUM = ?";
             else
                 whereStr = whereStr + " CNPACK.PROJECT_NUM LIKE ?";

           if(aFilterObject.project_num != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.project_num);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.project_date != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.project_date.getTime()));
        }
         if(aFilterObject.over5 != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.over5);
         }
         if(aFilterObject.status != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.status);
         }
         if (aFilterObject.letter_num_customer != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.letter_num_customer.indexOf('*',0) < 0 && aFilterObject.letter_num_customer.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.LETTER_NUM_CUSTOMER = ?";
             else
                 whereStr = whereStr + " CNPACK.LETTER_NUM_CUSTOMER LIKE ?";

           if(aFilterObject.letter_num_customer != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.letter_num_customer);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.date_letter_customer != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.date_letter_customer.getTime()));
        }
         if (aFilterObject.letter_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.letter_num.indexOf('*',0) < 0 && aFilterObject.letter_num.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.LETTER_NUM = ?";
             else
                 whereStr = whereStr + " CNPACK.LETTER_NUM LIKE ?";

           if(aFilterObject.letter_num != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.letter_num);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.date_letter != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.date_letter.getTime()));
        }
         if (aFilterObject.reliability_class != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.reliability_class.indexOf('*',0) < 0 && aFilterObject.reliability_class.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.RELIABILITY_CLASS = ?";
             else
                 whereStr = whereStr + " CNPACK.RELIABILITY_CLASS LIKE ?";

           if(aFilterObject.reliability_class != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.reliability_class);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.id_waiting_status != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_waiting_status);
         }
         if (aFilterObject.waitingStatus != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.waitingStatus.indexOf('*',0) < 0 && aFilterObject.waitingStatus.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.WAITINGSTATUS = ?";
             else
                 whereStr = whereStr + " CNPACK.WAITINGSTATUS LIKE ?";

           if(aFilterObject.waitingStatus != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.waitingStatus);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.is_payable != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is_payable);
         }
         if (aFilterObject.worksize != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.worksize.indexOf('*',0) < 0 && aFilterObject.worksize.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.WORKSIZE = ?";
             else
                 whereStr = whereStr + " CNPACK.WORKSIZE LIKE ?";

           if(aFilterObject.worksize != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.worksize);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.work_inc_net != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.work_inc_net.indexOf('*',0) < 0 && aFilterObject.work_inc_net.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.WORK_INC_NET = ?";
             else
                 whereStr = whereStr + " CNPACK.WORK_INC_NET LIKE ?";

           if(aFilterObject.work_inc_net != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.work_inc_net);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.business_type != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.business_type.indexOf('*',0) < 0 && aFilterObject.business_type.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.BUSINESS_TYPE = ?";
             else
                 whereStr = whereStr + " CNPACK.BUSINESS_TYPE LIKE ?";

           if(aFilterObject.business_type != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.business_type);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.estimateterm != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.estimateterm);
         }
        if(aFilterObject.estimatedate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.estimatedate.getTime()));
        }
         if(aFilterObject.buildingterm != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.buildingterm);
         }
        if(aFilterObject.buildingdate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.buildingdate.getTime()));
        }
         if(aFilterObject.buyingterm != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.buyingterm);
         }
        if(aFilterObject.buyingdate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.buyingdate.getTime()));
        }
         if (aFilterObject.estimate_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.estimate_num.indexOf('*',0) < 0 && aFilterObject.estimate_num.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.ESTIMATE_NUM = ?";
             else
                 whereStr = whereStr + " CNPACK.ESTIMATE_NUM LIKE ?";

           if(aFilterObject.estimate_num != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.estimate_num);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.estimate_contract_date != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.estimate_contract_date.getTime()));
        }
         if(aFilterObject.is_reserv != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is_reserv);
         }
         if (aFilterObject.purpose != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.purpose.indexOf('*',0) < 0 && aFilterObject.purpose.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.PURPOSE = ?";
             else
                 whereStr = whereStr + " CNPACK.PURPOSE LIKE ?";

           if(aFilterObject.purpose != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.purpose);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.is_ksoe != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is_ksoe);
         }
         if(aFilterObject.over150 != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.over150);
         }
         if(aFilterObject.is_new != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is_new);
         }
         if(aFilterObject.is3phases != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is3phases);
         }
       if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.subsystemRef.code);
       }
       if(aFilterObject.airLine04Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.airLine04Ref.code);
       }
       if(aFilterObject.cableLine04Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cableLine04Ref.code);
       }
       if(aFilterObject.trRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.trRef.code);
       }
       if(aFilterObject.s04Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.s04Ref.code);
       }
       if(aFilterObject.airLine10Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.airLine10Ref.code);
       }
       if(aFilterObject.cableLine10Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cableLine10Ref.code);
       }
       if(aFilterObject.s35Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.s35Ref.code);
       }
       if(aFilterObject.airLine150Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.airLine150Ref.code);
       }
       if(aFilterObject.cableLine150Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cableLine150Ref.code);
       }
       if(aFilterObject.s150Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.s150Ref.code);
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

  public int[] getFilteredCodeArray(CNPackFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(CNPack aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT CNPACK.CODE FROM CNPACK";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "CNPACK.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.CODE = ?";
        }
        if(aFilterObject.packCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.PACKCODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.NAME = ?";
             else
                 whereStr = whereStr + "  CNPACK.NAME LIKE ?";
         }
        if(aFilterObject.id_ren != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.ID_REN = ?";
        }
         if (aFilterObject.renName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.renName.indexOf('*',0) < 0 && aFilterObject.renName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.RENNAME = ?";
             else
                 whereStr = whereStr + "  CNPACK.RENNAME LIKE ?";
         }
        if(aFilterObject.id_district != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.ID_DISTRICT = ?";
        }
         if (aFilterObject.districtName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.districtName.indexOf('*',0) < 0 && aFilterObject.districtName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.DISTRICTNAME = ?";
             else
                 whereStr = whereStr + "  CNPACK.DISTRICTNAME LIKE ?";
         }
        if(aFilterObject.id_pack_status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.ID_PACK_STATUS = ?";
        }
         if (aFilterObject.statusName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.statusName.indexOf('*',0) < 0 && aFilterObject.statusName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.STATUSNAME = ?";
             else
                 whereStr = whereStr + "  CNPACK.STATUSNAME LIKE ?";
         }
         if (aFilterObject.description != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.description.indexOf('*',0) < 0 && aFilterObject.description.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.DESCRIPTION = ?";
             else
                 whereStr = whereStr + "  CNPACK.DESCRIPTION LIKE ?";
         }
        if(aFilterObject.power != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.POWER = ?";
        }
         if (aFilterObject.address != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.address.indexOf('*',0) < 0 && aFilterObject.address.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.ADDRESS = ?";
             else
                 whereStr = whereStr + "  CNPACK.ADDRESS LIKE ?";
         }
         if (aFilterObject.address_jur != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.address_jur.indexOf('*',0) < 0 && aFilterObject.address_jur.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.ADDRESS_JUR = ?";
             else
                 whereStr = whereStr + "  CNPACK.ADDRESS_JUR LIKE ?";
         }
         if (aFilterObject.reg_num_cn_contract != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.reg_num_cn_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_cn_contract.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.REG_NUM_CN_CONTRACT = ?";
             else
                 whereStr = whereStr + "  CNPACK.REG_NUM_CN_CONTRACT LIKE ?";
         }
        if(aFilterObject.date_cn_contract != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.DATE_CN_CONTRACT = ?";
        }
         if (aFilterObject.reg_num_spl_pp_contract != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.reg_num_spl_pp_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_spl_pp_contract.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.REG_NUM_SPL_PP_CONTRCT = ?";
             else
                 whereStr = whereStr + "  CNPACK.REG_NUM_SPL_PP_CONTRCT LIKE ?";
         }
        if(aFilterObject.date_spl_pp_contract != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.DATE_SPL_PP_CONTRACT = ?";
        }
         if (aFilterObject.reg_num_tu_contract != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.reg_num_tu_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_tu_contract.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.REG_NUM_TU_CONTRACT = ?";
             else
                 whereStr = whereStr + "  CNPACK.REG_NUM_TU_CONTRACT LIKE ?";
         }
        if(aFilterObject.date_tu_contract != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.DATE_TU_CONTRACT = ?";
        }
         if (aFilterObject.reg_num_tu_cr_contract != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.reg_num_tu_cr_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_tu_cr_contract.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.REG_NUM_TU_CR_CONTRACT = ?";
             else
                 whereStr = whereStr + "  CNPACK.REG_NUM_TU_CR_CONTRACT LIKE ?";
         }
        if(aFilterObject.date_tu_cr_contract != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.DATE_TU_CR_CONTRACT = ?";
        }
         if (aFilterObject.project_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.project_num.indexOf('*',0) < 0 && aFilterObject.project_num.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.PROJECT_NUM = ?";
             else
                 whereStr = whereStr + "  CNPACK.PROJECT_NUM LIKE ?";
         }
        if(aFilterObject.project_date != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.PROJECT_DATE = ?";
        }
        if(aFilterObject.over5 != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.OVER5 = ?";
        }
        if(aFilterObject.status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.STATUS = ?";
        }
         if (aFilterObject.letter_num_customer != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.letter_num_customer.indexOf('*',0) < 0 && aFilterObject.letter_num_customer.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.LETTER_NUM_CUSTOMER = ?";
             else
                 whereStr = whereStr + "  CNPACK.LETTER_NUM_CUSTOMER LIKE ?";
         }
        if(aFilterObject.date_letter_customer != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.DATE_LETTER_CUSTOMER = ?";
        }
         if (aFilterObject.letter_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.letter_num.indexOf('*',0) < 0 && aFilterObject.letter_num.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.LETTER_NUM = ?";
             else
                 whereStr = whereStr + "  CNPACK.LETTER_NUM LIKE ?";
         }
        if(aFilterObject.date_letter != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.DATE_LETTER = ?";
        }
         if (aFilterObject.reliability_class != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.reliability_class.indexOf('*',0) < 0 && aFilterObject.reliability_class.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.RELIABILITY_CLASS = ?";
             else
                 whereStr = whereStr + "  CNPACK.RELIABILITY_CLASS LIKE ?";
         }
        if(aFilterObject.id_waiting_status != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.ID_WAITING_STATUS = ?";
        }
         if (aFilterObject.waitingStatus != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.waitingStatus.indexOf('*',0) < 0 && aFilterObject.waitingStatus.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.WAITINGSTATUS = ?";
             else
                 whereStr = whereStr + "  CNPACK.WAITINGSTATUS LIKE ?";
         }
        if(aFilterObject.is_payable != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.IS_PAYABLE = ?";
        }
         if (aFilterObject.worksize != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.worksize.indexOf('*',0) < 0 && aFilterObject.worksize.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.WORKSIZE = ?";
             else
                 whereStr = whereStr + "  CNPACK.WORKSIZE LIKE ?";
         }
         if (aFilterObject.work_inc_net != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.work_inc_net.indexOf('*',0) < 0 && aFilterObject.work_inc_net.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.WORK_INC_NET = ?";
             else
                 whereStr = whereStr + "  CNPACK.WORK_INC_NET LIKE ?";
         }
         if (aFilterObject.business_type != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.business_type.indexOf('*',0) < 0 && aFilterObject.business_type.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.BUSINESS_TYPE = ?";
             else
                 whereStr = whereStr + "  CNPACK.BUSINESS_TYPE LIKE ?";
         }
        if(aFilterObject.estimateterm != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.ESTIMATETERM = ?";
        }
        if(aFilterObject.estimatedate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.ESTIMATEDATE = ?";
        }
        if(aFilterObject.buildingterm != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.BUILDINGTERM = ?";
        }
        if(aFilterObject.buildingdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.BUILDINGDATE = ?";
        }
        if(aFilterObject.buyingterm != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.BUYINGTERM = ?";
        }
        if(aFilterObject.buyingdate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.BUYINGDATE = ?";
        }
         if (aFilterObject.estimate_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.estimate_num.indexOf('*',0) < 0 && aFilterObject.estimate_num.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.ESTIMATE_NUM = ?";
             else
                 whereStr = whereStr + "  CNPACK.ESTIMATE_NUM LIKE ?";
         }
        if(aFilterObject.estimate_contract_date != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.ESTIMATE_CONTRACT_DATE = ?";
        }
        if(aFilterObject.is_reserv != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.IS_RESERV = ?";
        }
         if (aFilterObject.purpose != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.purpose.indexOf('*',0) < 0 && aFilterObject.purpose.indexOf('?',0) < 0)
                 whereStr = whereStr + "  CNPACK.PURPOSE = ?";
             else
                 whereStr = whereStr + "  CNPACK.PURPOSE LIKE ?";
         }
        if(aFilterObject.is_ksoe != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.IS_KSOE = ?";
        }
        if(aFilterObject.over150 != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.OVER150 = ?";
        }
        if(aFilterObject.is_new != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.IS_NEW = ?";
        }
        if(aFilterObject.is3phases != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNPACK.IS3PHASES = ?";
        }
        if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNPACK.SUBSYSTEMREFCODE = ? ";
        }
        if(aFilterObject.airLine04Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNPACK.AIRLINE04REFCODE = ? ";
        }
        if(aFilterObject.cableLine04Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNPACK.CABLELINE04REFCODE = ? ";
        }
        if(aFilterObject.trRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNPACK.TRREFCODE = ? ";
        }
        if(aFilterObject.s04Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNPACK.S04REFCODE = ? ";
        }
        if(aFilterObject.airLine10Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNPACK.AIRLINE10REFCODE = ? ";
        }
        if(aFilterObject.cableLine10Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNPACK.CABLELINE10REFCODE = ? ";
        }
        if(aFilterObject.s35Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNPACK.S35REFCODE = ? ";
        }
        if(aFilterObject.airLine150Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNPACK.AIRLINE150REFCODE = ? ";
        }
        if(aFilterObject.cableLine150Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNPACK.CABLELINE150REFCODE = ? ";
        }
        if(aFilterObject.s150Ref.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNPACK.S150REFCODE = ? ";
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
         if(aFilterObject.packCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.packCode);
         }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.NAME = ?";
             else
                 whereStr = whereStr + " CNPACK.NAME LIKE ?";

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
         if(aFilterObject.id_ren != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_ren);
         }
         if (aFilterObject.renName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.renName.indexOf('*',0) < 0 && aFilterObject.renName.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.RENNAME = ?";
             else
                 whereStr = whereStr + " CNPACK.RENNAME LIKE ?";

           if(aFilterObject.renName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.renName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.id_district != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_district);
         }
         if (aFilterObject.districtName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.districtName.indexOf('*',0) < 0 && aFilterObject.districtName.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.DISTRICTNAME = ?";
             else
                 whereStr = whereStr + " CNPACK.DISTRICTNAME LIKE ?";

           if(aFilterObject.districtName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.districtName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.id_pack_status != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_pack_status);
         }
         if (aFilterObject.statusName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.statusName.indexOf('*',0) < 0 && aFilterObject.statusName.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.STATUSNAME = ?";
             else
                 whereStr = whereStr + " CNPACK.STATUSNAME LIKE ?";

           if(aFilterObject.statusName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.statusName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.description != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.description.indexOf('*',0) < 0 && aFilterObject.description.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.DESCRIPTION = ?";
             else
                 whereStr = whereStr + " CNPACK.DESCRIPTION LIKE ?";

           if(aFilterObject.description != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.description);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.power != null){
            number++;
            aFilterObject.power = aFilterObject.power.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.power);
        }
         if (aFilterObject.address != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.address.indexOf('*',0) < 0 && aFilterObject.address.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.ADDRESS = ?";
             else
                 whereStr = whereStr + " CNPACK.ADDRESS LIKE ?";

           if(aFilterObject.address != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.address);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.address_jur != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.address_jur.indexOf('*',0) < 0 && aFilterObject.address_jur.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.ADDRESS_JUR = ?";
             else
                 whereStr = whereStr + " CNPACK.ADDRESS_JUR LIKE ?";

           if(aFilterObject.address_jur != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.address_jur);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.reg_num_cn_contract != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.reg_num_cn_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_cn_contract.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.REG_NUM_CN_CONTRACT = ?";
             else
                 whereStr = whereStr + " CNPACK.REG_NUM_CN_CONTRACT LIKE ?";

           if(aFilterObject.reg_num_cn_contract != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.reg_num_cn_contract);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.date_cn_contract != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.date_cn_contract.getTime()));
        }
         if (aFilterObject.reg_num_spl_pp_contract != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.reg_num_spl_pp_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_spl_pp_contract.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.REG_NUM_SPL_PP_CONTRCT = ?";
             else
                 whereStr = whereStr + " CNPACK.REG_NUM_SPL_PP_CONTRCT LIKE ?";

           if(aFilterObject.reg_num_spl_pp_contract != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.reg_num_spl_pp_contract);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.date_spl_pp_contract != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.date_spl_pp_contract.getTime()));
        }
         if (aFilterObject.reg_num_tu_contract != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.reg_num_tu_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_tu_contract.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.REG_NUM_TU_CONTRACT = ?";
             else
                 whereStr = whereStr + " CNPACK.REG_NUM_TU_CONTRACT LIKE ?";

           if(aFilterObject.reg_num_tu_contract != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.reg_num_tu_contract);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.date_tu_contract != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.date_tu_contract.getTime()));
        }
         if (aFilterObject.reg_num_tu_cr_contract != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.reg_num_tu_cr_contract.indexOf('*',0) < 0 && aFilterObject.reg_num_tu_cr_contract.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.REG_NUM_TU_CR_CONTRACT = ?";
             else
                 whereStr = whereStr + " CNPACK.REG_NUM_TU_CR_CONTRACT LIKE ?";

           if(aFilterObject.reg_num_tu_cr_contract != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.reg_num_tu_cr_contract);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.date_tu_cr_contract != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.date_tu_cr_contract.getTime()));
        }
         if (aFilterObject.project_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.project_num.indexOf('*',0) < 0 && aFilterObject.project_num.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.PROJECT_NUM = ?";
             else
                 whereStr = whereStr + " CNPACK.PROJECT_NUM LIKE ?";

           if(aFilterObject.project_num != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.project_num);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.project_date != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.project_date.getTime()));
        }
         if(aFilterObject.over5 != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.over5);
         }
         if(aFilterObject.status != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.status);
         }
         if (aFilterObject.letter_num_customer != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.letter_num_customer.indexOf('*',0) < 0 && aFilterObject.letter_num_customer.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.LETTER_NUM_CUSTOMER = ?";
             else
                 whereStr = whereStr + " CNPACK.LETTER_NUM_CUSTOMER LIKE ?";

           if(aFilterObject.letter_num_customer != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.letter_num_customer);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.date_letter_customer != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.date_letter_customer.getTime()));
        }
         if (aFilterObject.letter_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.letter_num.indexOf('*',0) < 0 && aFilterObject.letter_num.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.LETTER_NUM = ?";
             else
                 whereStr = whereStr + " CNPACK.LETTER_NUM LIKE ?";

           if(aFilterObject.letter_num != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.letter_num);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.date_letter != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.date_letter.getTime()));
        }
         if (aFilterObject.reliability_class != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.reliability_class.indexOf('*',0) < 0 && aFilterObject.reliability_class.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.RELIABILITY_CLASS = ?";
             else
                 whereStr = whereStr + " CNPACK.RELIABILITY_CLASS LIKE ?";

           if(aFilterObject.reliability_class != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.reliability_class);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.id_waiting_status != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.id_waiting_status);
         }
         if (aFilterObject.waitingStatus != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.waitingStatus.indexOf('*',0) < 0 && aFilterObject.waitingStatus.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.WAITINGSTATUS = ?";
             else
                 whereStr = whereStr + " CNPACK.WAITINGSTATUS LIKE ?";

           if(aFilterObject.waitingStatus != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.waitingStatus);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.is_payable != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is_payable);
         }
         if (aFilterObject.worksize != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.worksize.indexOf('*',0) < 0 && aFilterObject.worksize.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.WORKSIZE = ?";
             else
                 whereStr = whereStr + " CNPACK.WORKSIZE LIKE ?";

           if(aFilterObject.worksize != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.worksize);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.work_inc_net != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.work_inc_net.indexOf('*',0) < 0 && aFilterObject.work_inc_net.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.WORK_INC_NET = ?";
             else
                 whereStr = whereStr + " CNPACK.WORK_INC_NET LIKE ?";

           if(aFilterObject.work_inc_net != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.work_inc_net);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.business_type != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.business_type.indexOf('*',0) < 0 && aFilterObject.business_type.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.BUSINESS_TYPE = ?";
             else
                 whereStr = whereStr + " CNPACK.BUSINESS_TYPE LIKE ?";

           if(aFilterObject.business_type != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.business_type);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.estimateterm != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.estimateterm);
         }
        if(aFilterObject.estimatedate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.estimatedate.getTime()));
        }
         if(aFilterObject.buildingterm != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.buildingterm);
         }
        if(aFilterObject.buildingdate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.buildingdate.getTime()));
        }
         if(aFilterObject.buyingterm != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.buyingterm);
         }
        if(aFilterObject.buyingdate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.buyingdate.getTime()));
        }
         if (aFilterObject.estimate_num != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.estimate_num.indexOf('*',0) < 0 && aFilterObject.estimate_num.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.ESTIMATE_NUM = ?";
             else
                 whereStr = whereStr + " CNPACK.ESTIMATE_NUM LIKE ?";

           if(aFilterObject.estimate_num != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.estimate_num);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.estimate_contract_date != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.estimate_contract_date.getTime()));
        }
         if(aFilterObject.is_reserv != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is_reserv);
         }
         if (aFilterObject.purpose != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.purpose.indexOf('*',0) < 0 && aFilterObject.purpose.indexOf('?',0) < 0)
                 whereStr = whereStr + " CNPACK.PURPOSE = ?";
             else
                 whereStr = whereStr + " CNPACK.PURPOSE LIKE ?";

           if(aFilterObject.purpose != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.purpose);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.is_ksoe != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is_ksoe);
         }
         if(aFilterObject.over150 != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.over150);
         }
         if(aFilterObject.is_new != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is_new);
         }
         if(aFilterObject.is3phases != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.is3phases);
         }
       if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.subsystemRef.code);
       }
       if(aFilterObject.airLine04Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.airLine04Ref.code);
       }
       if(aFilterObject.cableLine04Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cableLine04Ref.code);
       }
       if(aFilterObject.trRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.trRef.code);
       }
       if(aFilterObject.s04Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.s04Ref.code);
       }
       if(aFilterObject.airLine10Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.airLine10Ref.code);
       }
       if(aFilterObject.cableLine10Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cableLine10Ref.code);
       }
       if(aFilterObject.s35Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.s35Ref.code);
       }
       if(aFilterObject.airLine150Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.airLine150Ref.code);
       }
       if(aFilterObject.cableLine150Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cableLine150Ref.code);
       }
       if(aFilterObject.s150Ref.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.s150Ref.code);
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


   public CNPack getObject(int uid) throws PersistenceException
   {
    CNPack result = new CNPack();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(CNPack anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  CNPACK.CODE, CNPACK.PACKCODE, CNPACK.NAME, CNPACK.ID_REN, CNPACK.RENNAME, CNPACK.ID_DISTRICT, CNPACK.DISTRICTNAME, CNPACK.ID_PACK_STATUS, CNPACK.STATUSNAME, CNPACK.DESCRIPTION, CNPACK.POWER, CNPACK.ADDRESS, CNPACK.ADDRESS_JUR, CNPACK.REG_NUM_CN_CONTRACT, CNPACK.DATE_CN_CONTRACT, CNPACK.REG_NUM_SPL_PP_CONTRCT, CNPACK.DATE_SPL_PP_CONTRACT, CNPACK.REG_NUM_TU_CONTRACT, CNPACK.DATE_TU_CONTRACT, CNPACK.REG_NUM_TU_CR_CONTRACT, CNPACK.DATE_TU_CR_CONTRACT, CNPACK.PROJECT_NUM, CNPACK.PROJECT_DATE, CNPACK.OVER5, CNPACK.STATUS, CNPACK.LETTER_NUM_CUSTOMER, CNPACK.DATE_LETTER_CUSTOMER, CNPACK.LETTER_NUM, CNPACK.DATE_LETTER, CNPACK.RELIABILITY_CLASS, CNPACK.ID_WAITING_STATUS, CNPACK.WAITINGSTATUS, CNPACK.IS_PAYABLE, CNPACK.WORKSIZE, CNPACK.WORK_INC_NET, CNPACK.BUSINESS_TYPE, CNPACK.ESTIMATETERM, CNPACK.ESTIMATEDATE, CNPACK.BUILDINGTERM, CNPACK.BUILDINGDATE, CNPACK.BUYINGTERM, CNPACK.BUYINGDATE, CNPACK.ESTIMATE_NUM, CNPACK.ESTIMATE_CONTRACT_DATE, CNPACK.IS_RESERV, CNPACK.PURPOSE, CNPACK.IS_KSOE, CNPACK.OVER150, CNPACK.IS_NEW, CNPACK.IS3PHASES, CNPACK.SUBSYSTEMREFCODE, CNPACK.AIRLINE04REFCODE, CNPACK.CABLELINE04REFCODE, CNPACK.TRREFCODE, CNPACK.S04REFCODE, CNPACK.AIRLINE10REFCODE, CNPACK.CABLELINE10REFCODE, CNPACK.S35REFCODE, CNPACK.AIRLINE150REFCODE, CNPACK.CABLELINE150REFCODE, CNPACK.S150REFCODE "
    +" FROM CNPACK WHERE CNPACK.CODE = ?";

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
        anObject.packCode = set.getInt(2);
        if ( set.wasNull() )
           anObject.packCode = Integer.MIN_VALUE;
        anObject.name = set.getString(3);
        anObject.id_ren = set.getInt(4);
        if ( set.wasNull() )
           anObject.id_ren = Integer.MIN_VALUE;
        anObject.renName = set.getString(5);
        anObject.id_district = set.getInt(6);
        if ( set.wasNull() )
           anObject.id_district = Integer.MIN_VALUE;
        anObject.districtName = set.getString(7);
        anObject.id_pack_status = set.getInt(8);
        if ( set.wasNull() )
           anObject.id_pack_status = Integer.MIN_VALUE;
        anObject.statusName = set.getString(9);
        anObject.description = set.getString(10);
        anObject.power = set.getBigDecimal(11);
        if(anObject.power != null)
            anObject.power = anObject.power.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.address = set.getString(12);
        anObject.address_jur = set.getString(13);
        anObject.reg_num_cn_contract = set.getString(14);
        anObject.date_cn_contract = set.getDate(15);
        anObject.reg_num_spl_pp_contract = set.getString(16);
        anObject.date_spl_pp_contract = set.getDate(17);
        anObject.reg_num_tu_contract = set.getString(18);
        anObject.date_tu_contract = set.getDate(19);
        anObject.reg_num_tu_cr_contract = set.getString(20);
        anObject.date_tu_cr_contract = set.getDate(21);
        anObject.project_num = set.getString(22);
        anObject.project_date = set.getDate(23);
        anObject.over5 = set.getInt(24);
        if ( set.wasNull() )
           anObject.over5 = Integer.MIN_VALUE;
        anObject.status = set.getInt(25);
        if ( set.wasNull() )
           anObject.status = Integer.MIN_VALUE;
        anObject.letter_num_customer = set.getString(26);
        anObject.date_letter_customer = set.getDate(27);
        anObject.letter_num = set.getString(28);
        anObject.date_letter = set.getDate(29);
        anObject.reliability_class = set.getString(30);
        anObject.id_waiting_status = set.getInt(31);
        if ( set.wasNull() )
           anObject.id_waiting_status = Integer.MIN_VALUE;
        anObject.waitingStatus = set.getString(32);
        anObject.is_payable = set.getInt(33);
        if ( set.wasNull() )
           anObject.is_payable = Integer.MIN_VALUE;
        anObject.worksize = set.getString(34);
        anObject.work_inc_net = set.getString(35);
        anObject.business_type = set.getString(36);
        anObject.estimateterm = set.getInt(37);
        if ( set.wasNull() )
           anObject.estimateterm = Integer.MIN_VALUE;
        anObject.estimatedate = set.getDate(38);
        anObject.buildingterm = set.getInt(39);
        if ( set.wasNull() )
           anObject.buildingterm = Integer.MIN_VALUE;
        anObject.buildingdate = set.getDate(40);
        anObject.buyingterm = set.getInt(41);
        if ( set.wasNull() )
           anObject.buyingterm = Integer.MIN_VALUE;
        anObject.buyingdate = set.getDate(42);
        anObject.estimate_num = set.getString(43);
        anObject.estimate_contract_date = set.getDate(44);
        anObject.is_reserv = set.getInt(45);
        if ( set.wasNull() )
           anObject.is_reserv = Integer.MIN_VALUE;
        anObject.purpose = set.getString(46);
        anObject.is_ksoe = set.getInt(47);
        if ( set.wasNull() )
           anObject.is_ksoe = Integer.MIN_VALUE;
        anObject.over150 = set.getInt(48);
        if ( set.wasNull() )
           anObject.over150 = Integer.MIN_VALUE;
        anObject.is_new = set.getInt(49);
        if ( set.wasNull() )
           anObject.is_new = Integer.MIN_VALUE;
        anObject.is3phases = set.getInt(50);
        if ( set.wasNull() )
           anObject.is3phases = Integer.MIN_VALUE;
        anObject.subsystemRef.code = set.getInt(51);
        if ( set.wasNull() )
            anObject.subsystemRef.code = Integer.MIN_VALUE;
        anObject.airLine04Ref.code = set.getInt(52);
        if ( set.wasNull() )
            anObject.airLine04Ref.code = Integer.MIN_VALUE;
        anObject.cableLine04Ref.code = set.getInt(53);
        if ( set.wasNull() )
            anObject.cableLine04Ref.code = Integer.MIN_VALUE;
        anObject.trRef.code = set.getInt(54);
        if ( set.wasNull() )
            anObject.trRef.code = Integer.MIN_VALUE;
        anObject.s04Ref.code = set.getInt(55);
        if ( set.wasNull() )
            anObject.s04Ref.code = Integer.MIN_VALUE;
        anObject.airLine10Ref.code = set.getInt(56);
        if ( set.wasNull() )
            anObject.airLine10Ref.code = Integer.MIN_VALUE;
        anObject.cableLine10Ref.code = set.getInt(57);
        if ( set.wasNull() )
            anObject.cableLine10Ref.code = Integer.MIN_VALUE;
        anObject.s35Ref.code = set.getInt(58);
        if ( set.wasNull() )
            anObject.s35Ref.code = Integer.MIN_VALUE;
        anObject.airLine150Ref.code = set.getInt(59);
        if ( set.wasNull() )
            anObject.airLine150Ref.code = Integer.MIN_VALUE;
        anObject.cableLine150Ref.code = set.getInt(60);
        if ( set.wasNull() )
            anObject.cableLine150Ref.code = Integer.MIN_VALUE;
        anObject.s150Ref.code = set.getInt(61);
        if ( set.wasNull() )
            anObject.s150Ref.code = Integer.MIN_VALUE;
        if(anObject.subsystemRef.code != Integer.MIN_VALUE)
        {
           anObject.setSubsystemRef(
        new com.ksoe.energynet.dataminer.generated.CNSubsystemTypeDAOGen(connection,getUserProfile()).getRef(anObject.subsystemRef.code));
    }
 /*       if(anObject.airLine04Ref.code != Integer.MIN_VALUE)
        {
           anObject.setAirLine04Ref(
        new com.ksoe.energynet.dataminer.generated.ENLine04DAOGen(connection,getUserProfile()).getRef(anObject.airLine04Ref.code));
    }
        if(anObject.cableLine04Ref.code != Integer.MIN_VALUE)
        {
           anObject.setCableLine04Ref(
        new com.ksoe.energynet.dataminer.generated.ENLineCableDAOGen(connection,getUserProfile()).getRef(anObject.cableLine04Ref.code));
    }
        if(anObject.trRef.code != Integer.MIN_VALUE)
        {
           anObject.setTrRef(
        new com.ksoe.energynet.dataminer.generated.ENTransformerDAOGen(connection,getUserProfile()).getRef(anObject.trRef.code));
    }
        if(anObject.s04Ref.code != Integer.MIN_VALUE)
        {
           anObject.setS04Ref(
        new com.ksoe.energynet.dataminer.generated.ENSubstation04DAOGen(connection,getUserProfile()).getRef(anObject.s04Ref.code));
    }
        if(anObject.airLine10Ref.code != Integer.MIN_VALUE)
        {
           anObject.setAirLine10Ref(
        new com.ksoe.energynet.dataminer.generated.ENLine10DAOGen(connection,getUserProfile()).getRef(anObject.airLine10Ref.code));
    }
        if(anObject.cableLine10Ref.code != Integer.MIN_VALUE)
        {
           anObject.setCableLine10Ref(
        new com.ksoe.energynet.dataminer.generated.ENLineCableDAOGen(connection,getUserProfile()).getRef(anObject.cableLine10Ref.code));
    }
        if(anObject.s35Ref.code != Integer.MIN_VALUE)
        {
           anObject.setS35Ref(
        new com.ksoe.energynet.dataminer.generated.ENSubstation150DAOGen(connection,getUserProfile()).getRef(anObject.s35Ref.code));
    }
        if(anObject.airLine150Ref.code != Integer.MIN_VALUE)
        {
           anObject.setAirLine150Ref(
        new com.ksoe.energynet.dataminer.generated.ENLine150DAOGen(connection,getUserProfile()).getRef(anObject.airLine150Ref.code));
    }
        if(anObject.cableLine150Ref.code != Integer.MIN_VALUE)
        {
           anObject.setCableLine150Ref(
        new com.ksoe.energynet.dataminer.generated.ENLineCableDAOGen(connection,getUserProfile()).getRef(anObject.cableLine150Ref.code));
    }
        if(anObject.s150Ref.code != Integer.MIN_VALUE)
        {
           anObject.setS150Ref(
        new com.ksoe.energynet.dataminer.generated.ENSubstation150DAOGen(connection,getUserProfile()).getRef(anObject.s150Ref.code));
    }*/
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


  public com.ksoe.energynet.valueobject.references.CNPackRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.CNPackRef ref = new com.ksoe.energynet.valueobject.references.CNPackRef();
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

    selectStr = "DELETE FROM  CNPACK WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    CNPack object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%CNPack.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(CNPack.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%CNPack.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(CNPack.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%CNPack.getObject%} access denied");

    selectStr =

    "SELECT  CNPACK.CODE FROM  CNPACK WHERE  CNPACK.CODE = ?";
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
    _checkConditionToken(condition,"code","CNPACK.CODE");
    _checkConditionToken(condition,"packcode","CNPACK.PACKCODE");
    _checkConditionToken(condition,"name","CNPACK.NAME");
    _checkConditionToken(condition,"id_ren","CNPACK.ID_REN");
    _checkConditionToken(condition,"renname","CNPACK.RENNAME");
    _checkConditionToken(condition,"id_district","CNPACK.ID_DISTRICT");
    _checkConditionToken(condition,"districtname","CNPACK.DISTRICTNAME");
    _checkConditionToken(condition,"id_pack_status","CNPACK.ID_PACK_STATUS");
    _checkConditionToken(condition,"statusname","CNPACK.STATUSNAME");
    _checkConditionToken(condition,"description","CNPACK.DESCRIPTION");
    _checkConditionToken(condition,"power","CNPACK.POWER");
    _checkConditionToken(condition,"address","CNPACK.ADDRESS");
    _checkConditionToken(condition,"address_jur","CNPACK.ADDRESS_JUR");
    _checkConditionToken(condition,"reg_num_cn_contract","CNPACK.REG_NUM_CN_CONTRACT");
    _checkConditionToken(condition,"date_cn_contract","CNPACK.DATE_CN_CONTRACT");
    _checkConditionToken(condition,"reg_num_spl_pp_contract","CNPACK.REG_NUM_SPL_PP_CONTRCT");
    _checkConditionToken(condition,"date_spl_pp_contract","CNPACK.DATE_SPL_PP_CONTRACT");
    _checkConditionToken(condition,"reg_num_tu_contract","CNPACK.REG_NUM_TU_CONTRACT");
    _checkConditionToken(condition,"date_tu_contract","CNPACK.DATE_TU_CONTRACT");
    _checkConditionToken(condition,"reg_num_tu_cr_contract","CNPACK.REG_NUM_TU_CR_CONTRACT");
    _checkConditionToken(condition,"date_tu_cr_contract","CNPACK.DATE_TU_CR_CONTRACT");
    _checkConditionToken(condition,"project_num","CNPACK.PROJECT_NUM");
    _checkConditionToken(condition,"project_date","CNPACK.PROJECT_DATE");
    _checkConditionToken(condition,"over5","CNPACK.OVER5");
    _checkConditionToken(condition,"status","CNPACK.STATUS");
    _checkConditionToken(condition,"letter_num_customer","CNPACK.LETTER_NUM_CUSTOMER");
    _checkConditionToken(condition,"date_letter_customer","CNPACK.DATE_LETTER_CUSTOMER");
    _checkConditionToken(condition,"letter_num","CNPACK.LETTER_NUM");
    _checkConditionToken(condition,"date_letter","CNPACK.DATE_LETTER");
    _checkConditionToken(condition,"reliability_class","CNPACK.RELIABILITY_CLASS");
    _checkConditionToken(condition,"id_waiting_status","CNPACK.ID_WAITING_STATUS");
    _checkConditionToken(condition,"waitingstatus","CNPACK.WAITINGSTATUS");
    _checkConditionToken(condition,"is_payable","CNPACK.IS_PAYABLE");
    _checkConditionToken(condition,"worksize","CNPACK.WORKSIZE");
    _checkConditionToken(condition,"work_inc_net","CNPACK.WORK_INC_NET");
    _checkConditionToken(condition,"business_type","CNPACK.BUSINESS_TYPE");
    _checkConditionToken(condition,"estimateterm","CNPACK.ESTIMATETERM");
    _checkConditionToken(condition,"estimatedate","CNPACK.ESTIMATEDATE");
    _checkConditionToken(condition,"buildingterm","CNPACK.BUILDINGTERM");
    _checkConditionToken(condition,"buildingdate","CNPACK.BUILDINGDATE");
    _checkConditionToken(condition,"buyingterm","CNPACK.BUYINGTERM");
    _checkConditionToken(condition,"buyingdate","CNPACK.BUYINGDATE");
    _checkConditionToken(condition,"estimate_num","CNPACK.ESTIMATE_NUM");
    _checkConditionToken(condition,"estimate_contract_date","CNPACK.ESTIMATE_CONTRACT_DATE");
    _checkConditionToken(condition,"is_reserv","CNPACK.IS_RESERV");
    _checkConditionToken(condition,"purpose","CNPACK.PURPOSE");
    _checkConditionToken(condition,"is_ksoe","CNPACK.IS_KSOE");
    _checkConditionToken(condition,"over150","CNPACK.OVER150");
    _checkConditionToken(condition,"is_new","CNPACK.IS_NEW");
    _checkConditionToken(condition,"is3phases","CNPACK.IS3PHASES");
      // relationship conditions
    _checkConditionToken(condition,"subsystemref","SUBSYSTEMREFCODE");
    _checkConditionToken(condition,"subsystemref.code","SUBSYSTEMREFCODE");
    _checkConditionToken(condition,"airline04ref","AIRLINE04REFCODE");
    _checkConditionToken(condition,"airline04ref.code","AIRLINE04REFCODE");
    _checkConditionToken(condition,"cableline04ref","CABLELINE04REFCODE");
    _checkConditionToken(condition,"cableline04ref.code","CABLELINE04REFCODE");
    _checkConditionToken(condition,"trref","TRREFCODE");
    _checkConditionToken(condition,"trref.code","TRREFCODE");
    _checkConditionToken(condition,"s04ref","S04REFCODE");
    _checkConditionToken(condition,"s04ref.code","S04REFCODE");
    _checkConditionToken(condition,"airline10ref","AIRLINE10REFCODE");
    _checkConditionToken(condition,"airline10ref.code","AIRLINE10REFCODE");
    _checkConditionToken(condition,"cableline10ref","CABLELINE10REFCODE");
    _checkConditionToken(condition,"cableline10ref.code","CABLELINE10REFCODE");
    _checkConditionToken(condition,"s35ref","S35REFCODE");
    _checkConditionToken(condition,"s35ref.code","S35REFCODE");
    _checkConditionToken(condition,"airline150ref","AIRLINE150REFCODE");
    _checkConditionToken(condition,"airline150ref.code","AIRLINE150REFCODE");
    _checkConditionToken(condition,"cableline150ref","CABLELINE150REFCODE");
    _checkConditionToken(condition,"cableline150ref.code","CABLELINE150REFCODE");
    _checkConditionToken(condition,"s150ref","S150REFCODE");
    _checkConditionToken(condition,"s150ref.code","S150REFCODE");
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

   private void _collectAutoIncrementFields(CNPack anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("CNPACK", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("CNPACK", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("CNPACK", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: CNPACK");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of CNPackDAO

