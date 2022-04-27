//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENServicesObject2TechCondtnsServicesDAOGen;
import com.ksoe.energynet.valueobject.ENServicesObject2TechCondtnsServices;
import com.ksoe.energynet.valueobject.brief.ENServicesObject2TechCondtnsServicesShort;
import com.ksoe.energynet.valueobject.lists.ENServicesObject2TechCondtnsServicesShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;

/**
 * DAO Object for ENServicesObject2TechCondtnsServices;
 *
 */

public class ENServicesObject2TechCondtnsServicesDAO extends
        ENServicesObject2TechCondtnsServicesDAOGen {

    public ENServicesObject2TechCondtnsServicesDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENServicesObject2TechCondtnsServicesDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    

    public ENServicesObject2TechCondtnsServicesShortList getScrollableFilteredList(ENServicesObject2TechCondtnsServices aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
     {
      ENServicesObject2TechCondtnsServicesShortList result = new ENServicesObject2TechCondtnsServicesShortList();
      ENServicesObject2TechCondtnsServicesShort anObject;
      result.list = new Vector();

      String     selectStr;
      Connection connection = getConnection();
      PreparedStatement statement = null;
      ResultSet  set = null;
      String     whereStr = "";
      String     condition = processCondition(anCondition);
      String     orderBy = processCondition(anOrderBy);

      if(orderBy.length() == 0)
       orderBy = "ENSERVICESOBJECT2TECHCONDTNSSERVICES.CODE";

      if(quantity < 0)
       quantity = Integer.MAX_VALUE/2;

      if(getUserProfile() == null)
       throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      selectStr = "SELECT "+
       "ENSERVICESOBJECT2TECHCONDTNSSERVICES.CODE"+

        ", entechconditionsservcs.CODE " +
        ", entechconditionsservcs.CONTRACTNUMBER " +
        ", entechconditionsservcs.CONTRACTDATE " +
        ", entechconditionsservcs.FINCONTRACTNUMBER " +
        ", entechconditionsservcs.FINCONTRACTDATE " +
        ", entechconditionsservcs.PARTNERNAME " +
        ", entechconditionsservcs.PARTNERCODE " +
        ", entechconditionsservcs.FINDOCCODE " +
        ", entechconditionsservcs.FINDOCID " +
        ", entechconditionsservcs.FINCOMMENTGEN " +
        ", entechconditionsservcs.TYSUMMAGEN " +
        ", entechconditionsservcs.TYSUMMAVAT " +
        ", entechconditionsservcs.TYSERVICESSUMMA " +
        ", entechconditionsservcs.TYSERVICESPOWER " +
        ", entechconditionsservcs.COMMENTSERVICESGEN " +
        ", entechconditionsservcs.USERGEN " +
        ", entechconditionsservcs.DATEEDIT " +
        ", entechconditionsservcs.CNPACKCODE " +
        ", entechconditionsservcs.EXECUTIONTERM " +
        ", entechconditionsservcs.BUILDERSAREA " +
        ", entechconditionsservcs.CONTRACTDATEFINAL " +
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
        ", ENSERVICESOBJECT.contractservicesdistnc " +
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
       " FROM ENSERVICESOBJECT2TECHCONDTNSSERVICES " +
       ", entechconditionsservcs " +
       ", ENSERVICESOBJECT " +
       //" WHERE "
    "";
       whereStr = " entechconditionsservcs.CODE = ENSERVICESOBJECT2TECHCONDTNSSERVICES.TECHCONDSERVREFCODE" ; //+
        whereStr = whereStr +" AND ENSERVICESOBJECT.CODE = ENSERVICESOBJECT2TECHCONDTNSSERVICES.SERVICESOBJECTREFCODE" ; //+
      //selectStr = selectStr + " ${s} ENSERVICESOBJECT2TECHCONDTNSSERVICES.CODE IN ( SELECT ENSERVICESOBJECT2TECHCONDTNSSERVICES.CODE FROM ENSERVICESOBJECT2TECHCONDTNSSERVICES ";

  // " ";
        if(aFilterObject != null)
        {
          if(aFilterObject.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENSERVICESOBJECT2TECHCONDTNSSERVICES.CODE = ?";
          }
          if(aFilterObject.techCondServRef.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "ENSERVICESOBJECT2TECHCONDTNSSERVICES.TECHCONDSERVREFCODE = ? ";
          }
          if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "ENSERVICESOBJECT2TECHCONDTNSSERVICES.SERVICESOBJECTREFCODE = ? ";
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
         if(aFilterObject.techCondServRef.code != Integer.MIN_VALUE) {
             number++;
             statement.setInt(number,aFilterObject.techCondServRef.code);
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

          anObject = new ENServicesObject2TechCondtnsServicesShort();

          anObject.code = set.getInt(1);
          if ( set.wasNull() )
              anObject.code = Integer.MIN_VALUE;

          anObject.techCondServRefCode = set.getInt(2);
      if(set.wasNull())
        anObject.techCondServRefCode = Integer.MIN_VALUE;
          anObject.techCondServRefContractNumber = set.getString(3);
          anObject.techCondServRefContractDate = set.getDate(4);
          anObject.techCondServRefFinContractNumber = set.getString(5);
          anObject.techCondServRefFinContractDate = set.getDate(6);
          anObject.techCondServRefPartnerName = set.getString(7);
          anObject.techCondServRefPartnerCode = set.getString(8);
          anObject.techCondServRefFinDocCode = set.getString(9);
          anObject.techCondServRefFinDocID = set.getInt(10);
      if(set.wasNull())
        anObject.techCondServRefFinDocID = Integer.MIN_VALUE;
          anObject.techCondServRefFinCommentGen = set.getString(11);
          anObject.techCondServRefTySummaGen = set.getBigDecimal(12);
          if(anObject.techCondServRefTySummaGen != null)
            anObject.techCondServRefTySummaGen = anObject.techCondServRefTySummaGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.techCondServRefTySummaVat = set.getBigDecimal(13);
          if(anObject.techCondServRefTySummaVat != null)
            anObject.techCondServRefTySummaVat = anObject.techCondServRefTySummaVat.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.techCondServRefTyServicesSumma = set.getBigDecimal(14);
          if(anObject.techCondServRefTyServicesSumma != null)
            anObject.techCondServRefTyServicesSumma = anObject.techCondServRefTyServicesSumma.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.techCondServRefTyServicesPower = set.getBigDecimal(15);
          if(anObject.techCondServRefTyServicesPower != null)
            anObject.techCondServRefTyServicesPower = anObject.techCondServRefTyServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.techCondServRefCommentServicesGen = set.getString(16);
          anObject.techCondServRefUserGen = set.getString(17);
          anObject.techCondServRefDateEdit = set.getDate(18);
          anObject.techCondServRefCnPackCode = set.getInt(19);
      if(set.wasNull())
        anObject.techCondServRefCnPackCode = Integer.MIN_VALUE;
          anObject.techCondServRefExecutionTerm = set.getString(20);
          anObject.techCondServRefBuildersArea = set.getInt(21);
      if(set.wasNull())
        anObject.techCondServRefBuildersArea = Integer.MIN_VALUE;
          anObject.techCondServRefContractDateFinal = set.getDate(22);
          anObject.servicesObjectRefCode = set.getInt(23);
      if(set.wasNull())
        anObject.servicesObjectRefCode = Integer.MIN_VALUE;
          anObject.servicesObjectRefContractNumber = set.getString(24);
          anObject.servicesObjectRefContractDate = set.getDate(25);
          anObject.servicesObjectRefName = set.getString(26);
          anObject.servicesObjectRefPartnerCode = set.getString(27);
          anObject.servicesObjectRefFinDocCode = set.getString(28);
          anObject.servicesObjectRefFinDocID = set.getInt(29);
      if(set.wasNull())
        anObject.servicesObjectRefFinDocID = Integer.MIN_VALUE;
          anObject.servicesObjectRefCommentGen = set.getString(30);
          anObject.servicesObjectRefContractNumberServices = set.getString(31);
          anObject.servicesObjectRefContractDateServices = set.getDate(32);
          anObject.servicesObjectRefContragentName = set.getString(33);
          anObject.servicesObjectRefContragentAddress = set.getString(34);
          anObject.servicesObjectRefContragentAddressWork = set.getString(35);
          anObject.servicesObjectRefContragentOkpo = set.getString(36);
          anObject.servicesObjectRefContragentBankAccount = set.getString(37);
          anObject.servicesObjectRefContragentBankName = set.getString(38);
          anObject.servicesObjectRefContragentBankMfo = set.getString(39);
          anObject.servicesObjectRefContragentBossName = set.getString(40);
          anObject.servicesObjectRefContragentPassport = set.getString(41);
          anObject.servicesObjectRefContractServicesSumma = set.getBigDecimal(42);
          if(anObject.servicesObjectRefContractServicesSumma != null)
            anObject.servicesObjectRefContractServicesSumma = anObject.servicesObjectRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.servicesObjectRefContractServicesPower = set.getBigDecimal(43);
          if(anObject.servicesObjectRefContractServicesPower != null)
            anObject.servicesObjectRefContractServicesPower = anObject.servicesObjectRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.servicesObjectRefCommentServicesGen = set.getString(44);
          anObject.servicesObjectRefContractServicesDistance = set.getBigDecimal(45);
          if(anObject.servicesObjectRefContractServicesDistance != null)
            anObject.servicesObjectRefContractServicesDistance = anObject.servicesObjectRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.servicesObjectRefContractServicesDay = set.getBigDecimal(46);
          if(anObject.servicesObjectRefContractServicesDay != null)
            anObject.servicesObjectRefContractServicesDay = anObject.servicesObjectRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.servicesObjectRefUserGen = set.getString(47);
          anObject.servicesObjectRefDateEdit = set.getDate(48);
          anObject.servicesObjectRefWarrantDate = set.getDate(49);
          anObject.servicesObjectRefWarrantNumber = set.getString(50);
          anObject.servicesObjectRefWarrantFIO = set.getString(51);
          anObject.servicesObjectRefRegionalType = set.getInt(52);
      if(set.wasNull())
        anObject.servicesObjectRefRegionalType = Integer.MIN_VALUE;
          anObject.servicesObjectRefBasisType = set.getBigDecimal(53);
          if(anObject.servicesObjectRefBasisType != null)
            anObject.servicesObjectRefBasisType = anObject.servicesObjectRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.servicesObjectRefContragentPosition = set.getString(54);
          anObject.servicesObjectRefExecuteWorkDate = set.getDate(55);
          anObject.servicesObjectRefTimeStart = set.getTimestamp(56);
          anObject.servicesObjectRefTimeFinal = set.getTimestamp(57);
          anObject.servicesObjectRefContragentPhoneNumber = set.getString(58);
          anObject.servicesObjectRefExecutorPhoneNumber = set.getString(59);
          anObject.servicesObjectRefContragentObjectWork = set.getString(60);
          anObject.servicesObjectRefIsNoPay = set.getInt(61);
      if(set.wasNull())
        anObject.servicesObjectRefIsNoPay = Integer.MIN_VALUE;
          anObject.servicesObjectRefIsCustomerMaterials = set.getInt(62);
      if(set.wasNull())
        anObject.servicesObjectRefIsCustomerMaterials = Integer.MIN_VALUE;
          anObject.servicesObjectRefPayDate = set.getDate(63);
          anObject.servicesObjectRefFinPayFormCode = set.getInt(64);
      if(set.wasNull())
        anObject.servicesObjectRefFinPayFormCode = Integer.MIN_VALUE;
          anObject.servicesObjectRefFinPayFormName = set.getString(65);
          anObject.servicesObjectRefPartnerId = set.getInt(66);
      if(set.wasNull())
        anObject.servicesObjectRefPartnerId = Integer.MIN_VALUE;
          anObject.servicesObjectRefPayDetail = set.getString(67);
          anObject.servicesObjectRefActTransferNumber = set.getString(68);
          anObject.servicesObjectRefActTransferDate = set.getDate(69);
          anObject.servicesObjectRefResposible = set.getString(70);
          anObject.servicesObjectRefResposiblePosition = set.getString(71);
          anObject.servicesObjectRefResposibleTabNumber = set.getString(72);
          anObject.servicesObjectRefCnPackCode = set.getInt(73);
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


} // end of ENServicesObject2TechCondtnsServicesDAO

