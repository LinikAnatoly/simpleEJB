
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENSOPayBillProvDAOGen;
import com.ksoe.energynet.valueobject.ENSOPayBillProv;
import com.ksoe.energynet.valueobject.ENServicesObject2Prov;
import com.ksoe.energynet.valueobject.brief.ENSOPayBillProvShort;
import com.ksoe.energynet.valueobject.lists.ENSOPayBillProvShortList;

/**
 * DAO Object for ENSOPayBillProv;
 *
 */

public class ENSOPayBillProvDAO extends ENSOPayBillProvDAOGen {

    public ENSOPayBillProvDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENSOPayBillProvDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


    public int add(ENSOPayBillProv anObject) throws PersistenceException
    {
  	  anObject.dateEdit = new Date();
  	  anObject.userGen = getUserProfile().userName;
  	  return super.add(anObject);   
    }

    public void save(ENSOPayBillProv anObject) throws PersistenceException
    {
  	  anObject.dateEdit = new Date();
  	  anObject.userGen = getUserProfile().userName;
  	  super.save(anObject);
    }
    
    public ENSOPayBillProvShortList getScrollableFilteredList(ENSOPayBillProv aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
     ENSOPayBillProvShortList result = new ENSOPayBillProvShortList();
     ENSOPayBillProvShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     whereStr = "";
     String     condition = processCondition(anCondition);
     String     orderBy = processCondition(anOrderBy);

     if(orderBy.length() == 0)
      orderBy = "ENSOPAYBILLPROV.CODE";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr = "SELECT "+
      "ENSOPAYBILLPROV.CODE"+
      ",ENSOPAYBILLPROV.USERGEN"+
      ",ENSOPAYBILLPROV.DATEEDIT"+

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
       ", ENSERVICESOBJECT.PREVCONTRACTSTATUS " +
       ", ENSERVICESOBJECT.RECONNECTIONTU " +
       ", ENSERVICESOBJECT.PERSONALACCOUNTCODE " +
       ", ENSERVICESOBJECT.PERSONALACCOUNTNUMBER " +
       ", ENSERVICESOBJECT.TABNUMBER " +
       ", ENSERVICESOBJECT.CNPACKCODE " +
       ", ENSERVICESOBJECT.DFPACKCODE " +
       ", ENSERVICESOBJECT.COUNTERSZONETYPE " +
       ", null " +
       ", null " + /// просуммируем все оплаты по счету
       ", COALESCE((SELECT SUM(ENPAYMENT2SO.SUMTOTAL) FROM ENPAYMENT2SO WHERE ENPAYMENT2SO.SOBILLREFCODE = ENSOPAYBILLPROV.SOBILLREFCODE),0) as SUMTOTAL" +
       ", null " +
       ", null " +
       ", null " +
       ", null " +
       ", ENSOBILL.CODE " +
       ", ENSOBILL.DATEGEN " +
       ", ENSOBILL.SUMTOTAL " +
       ", ENSOBILL.SUMGEN " +
       ", ENSOBILL.SUMVAT " +
       ", ENSOBILL.USERGEN " +
       ", ENSOBILL.DATEEDIT " +
       ", ENSERVICESOBJECT2PROV.CODE " +
       ", ENSERVICESOBJECT2PROV.PARTID " +
       ", ENSERVICESOBJECT2PROV.USERGEN " +
       ", ENSERVICESOBJECT2PROV.DATEPOSTING " +
       ", ENSERVICESOBJECT2PROV.DATEEDIT " +
      " FROM " +
      " ENSERVICESOBJECT " +
      ", ENSOPAYBILLPROV " +
      ", ENSOBILL " +
      ", ENSERVICESOBJECT2PROV " +
      //" WHERE "
   "";
      whereStr = " ENSERVICESOBJECT.CODE = ENSOPAYBILLPROV.SOREFCODE" ; //+
       whereStr = whereStr +" AND ENSOBILL.CODE = ENSOPAYBILLPROV.SOBILLREFCODE" ; //+
       whereStr = whereStr +" AND ENSERVICESOBJECT2PROV.CODE = ENSOPAYBILLPROV.SO2PROVREFCODE" ; //+
     //selectStr = selectStr + " ${s} ENSOPAYBILLPROV.CODE IN ( SELECT ENSOPAYBILLPROV.CODE FROM ENSOPAYBILLPROV ";

 // " ";
       if(aFilterObject != null)
       {
         if(aFilterObject.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENSOPAYBILLPROV.CODE = ?";
         }
          if (aFilterObject.userGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENSOPAYBILLPROV.USERGEN) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENSOPAYBILLPROV.USERGEN) LIKE UPPER(?)";
          }
         if(aFilterObject.dateEdit != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENSOPAYBILLPROV.DATEEDIT = ?";
         }
         if(aFilterObject.soRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENSOPAYBILLPROV.SOREFCODE = ? ";
         }
         if(aFilterObject.payment2soRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENSOPAYBILLPROV.PAYMENT2SOREFCODE = ? ";
         }
         if(aFilterObject.soBillRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENSOPAYBILLPROV.SOBILLREFCODE = ? ";
         }
         if(aFilterObject.so2ProvRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENSOPAYBILLPROV.SO2PROVREFCODE = ? ";
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
        if(aFilterObject.soRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.soRef.code);
        }
        if(aFilterObject.payment2soRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.payment2soRef.code);
        }
        if(aFilterObject.soBillRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.soBillRef.code);
        }
        if(aFilterObject.so2ProvRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.so2ProvRef.code);
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

         anObject = new ENSOPayBillProvShort();

         anObject.code = set.getInt(1);
         if ( set.wasNull() )
             anObject.code = Integer.MIN_VALUE;
         anObject.userGen = set.getString(2);
         anObject.dateEdit = set.getTimestamp(3);

         anObject.soRefCode = set.getInt(4);
     if(set.wasNull())
       anObject.soRefCode = Integer.MIN_VALUE;
         anObject.soRefContractNumber = set.getString(5);
         anObject.soRefContractDate = set.getDate(6);
         anObject.soRefName = set.getString(7);
         anObject.soRefPartnerCode = set.getString(8);
         anObject.soRefFinDocCode = set.getString(9);
         anObject.soRefFinDocID = set.getInt(10);
     if(set.wasNull())
       anObject.soRefFinDocID = Integer.MIN_VALUE;
         anObject.soRefCommentGen = set.getString(11);
         anObject.soRefContractNumberServices = set.getString(12);
         anObject.soRefContractDateServices = set.getDate(13);
         anObject.soRefContragentName = set.getString(14);
         anObject.soRefContragentAddress = set.getString(15);
         anObject.soRefContragentAddressWork = set.getString(16);
         anObject.soRefContragentOkpo = set.getString(17);
         anObject.soRefContragentBankAccount = set.getString(18);
         anObject.soRefContragentBankName = set.getString(19);
         anObject.soRefContragentBankMfo = set.getString(20);
         anObject.soRefContragentBossName = set.getString(21);
         anObject.soRefContragentPassport = set.getString(22);
         anObject.soRefContractServicesSumma = set.getBigDecimal(23);
         if(anObject.soRefContractServicesSumma != null)
           anObject.soRefContractServicesSumma = anObject.soRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.soRefContractServicesPower = set.getBigDecimal(24);
         if(anObject.soRefContractServicesPower != null)
           anObject.soRefContractServicesPower = anObject.soRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.soRefCommentServicesGen = set.getString(25);
         anObject.soRefContractServicesDistance = set.getBigDecimal(26);
         if(anObject.soRefContractServicesDistance != null)
           anObject.soRefContractServicesDistance = anObject.soRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.soRefContractServicesDay = set.getBigDecimal(27);
         if(anObject.soRefContractServicesDay != null)
           anObject.soRefContractServicesDay = anObject.soRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.soRefUserGen = set.getString(28);
         anObject.soRefDateEdit = set.getDate(29);
         anObject.soRefWarrantDate = set.getDate(30);
         anObject.soRefWarrantNumber = set.getString(31);
         anObject.soRefWarrantFIO = set.getString(32);
         anObject.soRefRegionalType = set.getInt(33);
     if(set.wasNull())
       anObject.soRefRegionalType = Integer.MIN_VALUE;
         anObject.soRefBasisType = set.getBigDecimal(34);
         if(anObject.soRefBasisType != null)
           anObject.soRefBasisType = anObject.soRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.soRefContragentPosition = set.getString(35);
         anObject.soRefExecuteWorkDate = set.getDate(36);
         anObject.soRefTimeStart = set.getTimestamp(37);
         anObject.soRefTimeFinal = set.getTimestamp(38);
         anObject.soRefContragentPhoneNumber = set.getString(39);
         anObject.soRefExecutorPhoneNumber = set.getString(40);
         anObject.soRefContragentObjectWork = set.getString(41);
         anObject.soRefIsNoPay = set.getInt(42);
     if(set.wasNull())
       anObject.soRefIsNoPay = Integer.MIN_VALUE;
         anObject.soRefIsCustomerMaterials = set.getInt(43);
     if(set.wasNull())
       anObject.soRefIsCustomerMaterials = Integer.MIN_VALUE;
         anObject.soRefPayDate = set.getDate(44);
         anObject.soRefFinPayFormCode = set.getInt(45);
     if(set.wasNull())
       anObject.soRefFinPayFormCode = Integer.MIN_VALUE;
         anObject.soRefFinPayFormName = set.getString(46);
         anObject.soRefPartnerId = set.getInt(47);
     if(set.wasNull())
       anObject.soRefPartnerId = Integer.MIN_VALUE;
         anObject.soRefPayDetail = set.getString(48);
         anObject.soRefActTransferNumber = set.getString(49);
         anObject.soRefActTransferDate = set.getDate(50);
         anObject.soRefResposible = set.getString(51);
         anObject.soRefResposiblePosition = set.getString(52);
         anObject.soRefResposibleTabNumber = set.getString(53);
         anObject.soRefPrevContractStatus = set.getInt(54);
     if(set.wasNull())
       anObject.soRefPrevContractStatus = Integer.MIN_VALUE;
         anObject.soRefReconnectionTU = set.getInt(55);
     if(set.wasNull())
       anObject.soRefReconnectionTU = Integer.MIN_VALUE;
         anObject.soRefPersonalAccountCode = set.getInt(56);
     if(set.wasNull())
       anObject.soRefPersonalAccountCode = Integer.MIN_VALUE;
         anObject.soRefPersonalAccountNumber = set.getString(57);
         anObject.soRefTabNumber = set.getString(58);
         anObject.soRefCnPackCode = set.getInt(59);
     if(set.wasNull())
       anObject.soRefCnPackCode = Integer.MIN_VALUE;
         anObject.soRefDfPackCode = set.getInt(60);
     if(set.wasNull())
       anObject.soRefDfPackCode = Integer.MIN_VALUE;
         anObject.soRefCountersZoneType = set.getInt(61);
     if(set.wasNull())
       anObject.soRefCountersZoneType = Integer.MIN_VALUE;
         anObject.payment2soRefCode = set.getInt(62);
     if(set.wasNull())
       anObject.payment2soRefCode = Integer.MIN_VALUE;
         anObject.payment2soRefDateGen = set.getDate(63);
         anObject.payment2soRefSumTotal = set.getBigDecimal(64);
         if(anObject.payment2soRefSumTotal != null)
           anObject.payment2soRefSumTotal = anObject.payment2soRefSumTotal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.payment2soRefSumGen = set.getBigDecimal(65);
         if(anObject.payment2soRefSumGen != null)
           anObject.payment2soRefSumGen = anObject.payment2soRefSumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.payment2soRefSumVat = set.getBigDecimal(66);
         if(anObject.payment2soRefSumVat != null)
           anObject.payment2soRefSumVat = anObject.payment2soRefSumVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.payment2soRefUserGen = set.getString(67);
         anObject.payment2soRefDateEdit = set.getTimestamp(68);
         anObject.soBillRefCode = set.getInt(69);
     if(set.wasNull())
       anObject.soBillRefCode = Integer.MIN_VALUE;
         anObject.soBillRefDateGen = set.getDate(70);
         anObject.soBillRefSumTotal = set.getBigDecimal(71);
         if(anObject.soBillRefSumTotal != null)
           anObject.soBillRefSumTotal = anObject.soBillRefSumTotal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.soBillRefSumGen = set.getBigDecimal(72);
         if(anObject.soBillRefSumGen != null)
           anObject.soBillRefSumGen = anObject.soBillRefSumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.soBillRefSumVat = set.getBigDecimal(73);
         if(anObject.soBillRefSumVat != null)
           anObject.soBillRefSumVat = anObject.soBillRefSumVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.soBillRefUserGen = set.getString(74);
         anObject.soBillRefDateEdit = set.getTimestamp(75);
         anObject.so2ProvRefCode = set.getInt(76);
     if(set.wasNull())
       anObject.so2ProvRefCode = Integer.MIN_VALUE;
         anObject.so2ProvRefPartId = set.getInt(77);
     if(set.wasNull())
       anObject.so2ProvRefPartId = Integer.MIN_VALUE;
         anObject.so2ProvRefUserGen = set.getString(78);
         anObject.so2ProvRefDatePosting = set.getDate(79);
         anObject.so2ProvRefDateEdit = set.getDate(80);

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

    
} // end of ENSOPayBillProvDAO
