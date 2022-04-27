
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;
import java.util.Vector;

import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENCalc2ConnectTariffDAOGen;
import com.ksoe.energynet.valueobject.ENCalc2ConnectTariff;
import com.ksoe.energynet.valueobject.brief.ENCalc2ConnectTariffShort;
import com.ksoe.energynet.valueobject.lists.ENCalc2ConnectTariffShortList;

/**
 * DAO Object for ENCalc2ConnectTariff;
 *
 */

public class ENCalc2ConnectTariffDAO extends ENCalc2ConnectTariffDAOGen {

    public ENCalc2ConnectTariffDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENCalc2ConnectTariffDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    protected static Hashtable _sequenceTable = new Hashtable();

    private void _collectAutoIncrementFields(ENCalc2ConnectTariff anObject,
        Connection connection) throws PersistenceException {

      SequenceKey hashKey = new SequenceKey("ENCALC2CONNECTTARIFF", "CODE");
      Integer nextSeqValue = null;
      SequenceValue sequenceValue;
      synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
        if (sequenceValue == null) {
          sequenceValue = getNewSequenceValue("ENCALC2CONNECTTARIFF", "CODE");
          _sequenceTable.put(hashKey, sequenceValue);
        }
        if (!sequenceValue.isNextValueAvailable()) {
          sequenceValue = getNewSequenceValue("ENCALC2CONNECTTARIFF", "CODE");
          _sequenceTable.put(hashKey, sequenceValue);
        }
      }

      nextSeqValue = sequenceValue.getNextValue();
      if (nextSeqValue == null) {
        throw new PersistenceException(
            "Can't obtain auto increment value from: ENCALC2CONNECTTARIFF");
      } else {
        anObject.code = nextSeqValue.intValue();
        return;
      }
    }
    

    public int add(ENCalc2ConnectTariff anObject, boolean aUseSequential) throws PersistenceException
    {
     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;

   anObject.modify_time = System.currentTimeMillis();

     if(aUseSequential)
      _collectAutoIncrementFields(anObject,connection);


     selectStr = "INSERT INTO ENCALC2CONNECTTARIFF (CODE,POWER1TARIFF,TARIFF1VALUE,SUMMA1TARIFF,POWER2TARIFF,TARIFF2VALUE,SUMMA2TARIFF,SUMMATOTAL,USERGEN,DATEEDIT,MODIFY_TIME,TECHCONDSERVREFCODE,TARIFFENTRY1REFCODE,TARIFFENTRY2REFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

     try
      {
       statement = connection.prepareStatement(selectStr);
       if (anObject.code != Integer.MIN_VALUE )
          statement.setInt(1,anObject.code);
       else
          statement.setNull(1,java.sql.Types.INTEGER);
       if (anObject.power1Tariff != null)
         anObject.power1Tariff = anObject.power1Tariff.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(2,anObject.power1Tariff);
       if (anObject.tariff1value != null)
         anObject.tariff1value = anObject.tariff1value.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(3,anObject.tariff1value);
       if (anObject.summa1Tariff != null)
         anObject.summa1Tariff = anObject.summa1Tariff.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(4,anObject.summa1Tariff);
       if (anObject.power2Tariff != null)
         anObject.power2Tariff = anObject.power2Tariff.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(5,anObject.power2Tariff);
       if (anObject.tariff2value != null)
         anObject.tariff2value = anObject.tariff2value.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(6,anObject.tariff2value);
       if (anObject.summa2Tariff != null)
         anObject.summa2Tariff = anObject.summa2Tariff.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(7,anObject.summa2Tariff);
       if (anObject.summaTotal != null)
         anObject.summaTotal = anObject.summaTotal.setScale(4,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(8,anObject.summaTotal);
       statement.setString(9,anObject.userGen);
       if (anObject.dateEdit == null)
         statement.setTimestamp(10,null);
       else
         statement.setTimestamp(10,new java.sql.Timestamp(anObject.dateEdit.getTime()));
       if (anObject.modify_time == Long.MIN_VALUE)
         statement.setBigDecimal(11,null);
       else
         statement.setBigDecimal(11,new java.math.BigDecimal(anObject.modify_time));
       if (anObject.techCondServRef.code != Integer.MIN_VALUE){
         if( ! new com.ksoe.energynet.dataminer.generated.ENTechConditionsServicesDAOGen(connection,getUserProfile()).exists(anObject.techCondServRef.code))
            throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENCalc2ConnectTariff.techCondServRef.code%} = {%"+anObject.techCondServRef.code+"%}");
         statement.setInt(12,anObject.techCondServRef.code);
       }
       else
         statement.setNull(12,java.sql.Types.INTEGER);
       if (anObject.tariffEntry1Ref.code != Integer.MIN_VALUE){
         if( ! new com.ksoe.energynet.dataminer.generated.ENConnectionTariffEntryDAOGen(connection,getUserProfile()).exists(anObject.tariffEntry1Ref.code))
            throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENCalc2ConnectTariff.tariffEntry1Ref.code%} = {%"+anObject.tariffEntry1Ref.code+"%}");
         statement.setInt(13,anObject.tariffEntry1Ref.code);
       }
       else
         statement.setNull(13,java.sql.Types.INTEGER);
       if (anObject.tariffEntry2Ref.code != Integer.MIN_VALUE){
         if( ! new com.ksoe.energynet.dataminer.generated.ENConnectionTariffEntryDAOGen(connection,getUserProfile()).exists(anObject.tariffEntry2Ref.code))
            throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENCalc2ConnectTariff.tariffEntry2Ref.code%} = {%"+anObject.tariffEntry2Ref.code+"%}");
         statement.setInt(14,anObject.tariffEntry2Ref.code);
       }
       else
         statement.setNull(14,java.sql.Types.INTEGER);

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
       throw new PersistenceException("Error in method {%ENCalc2ConnectTariffDAOGen.add%}",e);
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

    
    public ENCalc2ConnectTariffShortList getScrollableFilteredList(
            ENCalc2ConnectTariff aFilterObject, String anCondition,
            String anOrderBy, int fromPosition, int quantity,
            Vector aBindObjects) throws PersistenceException {

        ENCalc2ConnectTariffShortList result = new ENCalc2ConnectTariffShortList();
        ENCalc2ConnectTariffShort anObject;
        result.list = new Vector();

        String selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;
        String whereStr = "";
        String condition = processCondition(anCondition);
        String orderBy = processCondition(anOrderBy);

      if(orderBy.length() == 0)
       orderBy = "ENCALC2CONNECTTARIFF.CODE";

      if(quantity < 0)
       quantity = Integer.MAX_VALUE/2;

      if(getUserProfile() == null)
       throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      selectStr = "SELECT "+
       "ENCALC2CONNECTTARIFF.CODE"+
       ",ENCALC2CONNECTTARIFF.POWER1TARIFF"+
       ",ENCALC2CONNECTTARIFF.TARIFF1VALUE"+
       ",ENCALC2CONNECTTARIFF.SUMMA1TARIFF"+
       ",ENCALC2CONNECTTARIFF.POWER2TARIFF"+
       ",ENCALC2CONNECTTARIFF.TARIFF2VALUE"+
       ",ENCALC2CONNECTTARIFF.SUMMA2TARIFF"+
       ",ENCALC2CONNECTTARIFF.SUMMATOTAL"+
       ",ENCALC2CONNECTTARIFF.USERGEN"+
       ",ENCALC2CONNECTTARIFF.DATEEDIT"+

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
        ", ENTECHCONDITIONSSERVCS.ISDISCONNECTIONNEEDED " +
        ", ENTECHCONDITIONSSERVCS.ISUSE2TARIFFS " +

        ", te1.code " +
        ", te1.value " +
        ", te1.startdate " +
        ", te1.usergen " +

        ", te2.code " +
        ", te2.value " +
        ", te2.startdate " +
        ", te2.usergen " +

        " FROM ENCALC2CONNECTTARIFF " +
        ", ENTECHCONDITIONSSERVCS " +
        ", ENCONNECTIONTARIFFENTR as te1" +
        ", ENCONNECTIONTARIFFENTR as te2" +

        "";

        whereStr = " ENTECHCONDITIONSSERVCS.CODE = ENCALC2CONNECTTARIFF.TECHCONDSERVREFCODE";
        whereStr = whereStr + " and te1.code = encalc2connecttariff.tariffentry1refcode";
        whereStr = whereStr + " and te2.code = encalc2connecttariff.tariffentry2refcode";

        if(aFilterObject != null)
        {
          if(aFilterObject.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENCALC2CONNECTTARIFF.CODE = ?";
          }
          if(aFilterObject.power1Tariff != null) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENCALC2CONNECTTARIFF.POWER1TARIFF = ?";
          }
          if(aFilterObject.tariff1value != null) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENCALC2CONNECTTARIFF.TARIFF1VALUE = ?";
          }
          if(aFilterObject.summa1Tariff != null) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENCALC2CONNECTTARIFF.SUMMA1TARIFF = ?";
          }
          if(aFilterObject.power2Tariff != null) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENCALC2CONNECTTARIFF.POWER2TARIFF = ?";
          }
          if(aFilterObject.tariff2value != null) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENCALC2CONNECTTARIFF.TARIFF2VALUE = ?";
          }
          if(aFilterObject.summa2Tariff != null) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENCALC2CONNECTTARIFF.SUMMA2TARIFF = ?";
          }
          if(aFilterObject.summaTotal != null) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENCALC2CONNECTTARIFF.SUMMATOTAL = ?";
          }
           if (aFilterObject.userGen != null) {
               if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
               if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                   whereStr = whereStr + "  UPPER(ENCALC2CONNECTTARIFF.USERGEN) = UPPER(?)";
               else
                   whereStr = whereStr + " UPPER(ENCALC2CONNECTTARIFF.USERGEN) LIKE UPPER(?)";
           }
          if(aFilterObject.dateEdit != null) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENCALC2CONNECTTARIFF.DATEEDIT = ?";
          }
          if(aFilterObject.modify_time != Long.MIN_VALUE) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENCALC2CONNECTTARIFF.MODIFY_TIME = ?";
          }
          if(aFilterObject.techCondServRef.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "ENCALC2CONNECTTARIFF.TECHCONDSERVREFCODE = ? ";
          }
          if(aFilterObject.tariffEntry1Ref.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "ENCALC2CONNECTTARIFF.TARIFFENTRY1REFCODE = ? ";
          }
          if(aFilterObject.tariffEntry2Ref.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "ENCALC2CONNECTTARIFF.TARIFFENTRY2REFCODE = ? ";
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
          if(aFilterObject.power1Tariff != null){
              number++;
              aFilterObject.power1Tariff = aFilterObject.power1Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
              statement.setBigDecimal(number,aFilterObject.power1Tariff);
          }
          if(aFilterObject.tariff1value != null){
              number++;
              aFilterObject.tariff1value = aFilterObject.tariff1value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
              statement.setBigDecimal(number,aFilterObject.tariff1value);
          }
          if(aFilterObject.summa1Tariff != null){
              number++;
              aFilterObject.summa1Tariff = aFilterObject.summa1Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
              statement.setBigDecimal(number,aFilterObject.summa1Tariff);
          }
          if(aFilterObject.power2Tariff != null){
              number++;
              aFilterObject.power2Tariff = aFilterObject.power2Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
              statement.setBigDecimal(number,aFilterObject.power2Tariff);
          }
          if(aFilterObject.tariff2value != null){
              number++;
              aFilterObject.tariff2value = aFilterObject.tariff2value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
              statement.setBigDecimal(number,aFilterObject.tariff2value);
          }
          if(aFilterObject.summa2Tariff != null){
              number++;
              aFilterObject.summa2Tariff = aFilterObject.summa2Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
              statement.setBigDecimal(number,aFilterObject.summa2Tariff);
          }
          if(aFilterObject.summaTotal != null){
              number++;
              aFilterObject.summaTotal = aFilterObject.summaTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
              statement.setBigDecimal(number,aFilterObject.summaTotal);
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
         if(aFilterObject.techCondServRef.code != Integer.MIN_VALUE) {
             number++;
             statement.setInt(number,aFilterObject.techCondServRef.code);
         }
         if(aFilterObject.tariffEntry1Ref.code != Integer.MIN_VALUE) {
             number++;
             statement.setInt(number,aFilterObject.tariffEntry1Ref.code);
         }
         if(aFilterObject.tariffEntry2Ref.code != Integer.MIN_VALUE) {
             number++;
             statement.setInt(number,aFilterObject.tariffEntry2Ref.code);
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

          anObject = new ENCalc2ConnectTariffShort();

          anObject.code = set.getInt(1);
          if ( set.wasNull() )
              anObject.code = Integer.MIN_VALUE;
          anObject.power1Tariff = set.getBigDecimal(2);
          if(anObject.power1Tariff != null)
              anObject.power1Tariff = anObject.power1Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.tariff1value = set.getBigDecimal(3);
          if(anObject.tariff1value != null)
              anObject.tariff1value = anObject.tariff1value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.summa1Tariff = set.getBigDecimal(4);
          if(anObject.summa1Tariff != null)
              anObject.summa1Tariff = anObject.summa1Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.power2Tariff = set.getBigDecimal(5);
          if(anObject.power2Tariff != null)
              anObject.power2Tariff = anObject.power2Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.tariff2value = set.getBigDecimal(6);
          if(anObject.tariff2value != null)
              anObject.tariff2value = anObject.tariff2value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.summa2Tariff = set.getBigDecimal(7);
          if(anObject.summa2Tariff != null)
              anObject.summa2Tariff = anObject.summa2Tariff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.summaTotal = set.getBigDecimal(8);
          if(anObject.summaTotal != null)
              anObject.summaTotal = anObject.summaTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.userGen = set.getString(9);
          anObject.dateEdit = set.getTimestamp(10);

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
          anObject.techCondServRefIsDisconnectionNeeded = set.getInt(35);
      if(set.wasNull())
        anObject.techCondServRefIsDisconnectionNeeded = Integer.MIN_VALUE;
          anObject.techCondServRefIsUse2Tariffs = set.getInt(36);
      if(set.wasNull())
        anObject.techCondServRefIsUse2Tariffs = Integer.MIN_VALUE;
          anObject.tariffEntry1RefCode = set.getInt(37);
      if(set.wasNull())
        anObject.tariffEntry1RefCode = Integer.MIN_VALUE;
          anObject.tariffEntry1RefValue = set.getBigDecimal(38);
          if(anObject.tariffEntry1RefValue != null)
            anObject.tariffEntry1RefValue = anObject.tariffEntry1RefValue.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.tariffEntry1RefStartDate = set.getDate(39);
          anObject.tariffEntry1RefUserGen = set.getString(40);
          anObject.tariffEntry2RefCode = set.getInt(41);
      if(set.wasNull())
        anObject.tariffEntry2RefCode = Integer.MIN_VALUE;
          anObject.tariffEntry2RefValue = set.getBigDecimal(42);
          if(anObject.tariffEntry2RefValue != null)
            anObject.tariffEntry2RefValue = anObject.tariffEntry2RefValue.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.tariffEntry2RefStartDate = set.getDate(43);
          anObject.tariffEntry2RefUserGen = set.getString(44);

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



} // end of ENCalc2ConnectTariffDAO
