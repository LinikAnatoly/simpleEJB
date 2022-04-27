
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENPayment2SODAOGen;
import com.ksoe.energynet.valueobject.ENPayment2SO;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.brief.ENPayment2SOShort;
import com.ksoe.energynet.valueobject.filter.ENPayment2SOFilter;
import com.ksoe.energynet.valueobject.lists.ENPayment2SOShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENPayment2SO;
 *
 */

public class ENPayment2SODAO extends ENPayment2SODAOGen {

    public ENPayment2SODAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENPayment2SODAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    public BigDecimal getOverallSumByENServicesObject(ENServicesObject servicesObject) throws PersistenceException {
    	BigDecimal out = BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_HALF_UP);
    	ENPayment2SOShortList list = this.getListByENServicesObject(servicesObject);
    	for(ENPayment2SOShort item : list.list) out = out.add(item.sumTotal);
    	out = out.setScale(2, BigDecimal.ROUND_HALF_UP);
    	return out;
    }
    
    /**
     * 
     * Получить лист оплат по договору в хронологическом порядке
     * 
     * @param servicesObject договор {@link ENServicesObject}
     * @return {@link ENPayment2SOShortList} лист оплат по договору в
     * хронологическом порядке
     * @throws PersistenceException
     */
    public ENPayment2SOShortList getListByENServicesObject(ENServicesObject servicesObject) throws PersistenceException {
    	if(servicesObject == null || servicesObject.code == Integer.MIN_VALUE) {
    		throw new java.lang.NullPointerException("Не заданий договір");
    	}
    	ENPayment2SOFilter filter = new ENPayment2SOFilter();
    	filter.servicesObjectRef.code = servicesObject.code;
    	filter.orderBySQL = String.format("%s asc", ENPayment2SO.dateGen_QFielld);
    	return this.getFilteredList(filter);	
    }
    
    
    @Override
	public ENPayment2SOShortList getScrollableFilteredList(ENPayment2SO aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
     {
      ENPayment2SOShortList result = new ENPayment2SOShortList();
      ENPayment2SOShort anObject;
      result.list = new Vector();

      String     selectStr;
      Connection connection = getConnection();
      PreparedStatement statement = null;
      ResultSet  set = null;
      String     whereStr = "";
      String     condition = processCondition(anCondition);
      String     orderBy = processCondition(anOrderBy);

      if(orderBy.length() == 0)
       orderBy = "ENPAYMENT2SO.CODE";

      if(quantity < 0)
       quantity = Integer.MAX_VALUE/2;

      if(getUserProfile() == null)
       throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      selectStr = "SELECT "+
       "ENPAYMENT2SO.CODE"+
       ",ENPAYMENT2SO.DATEGEN"+
       ",ENPAYMENT2SO.SUMTOTAL"+
       ",ENPAYMENT2SO.SUMGEN"+
       ",ENPAYMENT2SO.SUMVAT"+
       ",ENPAYMENT2SO.USERGEN"+
       ",ENPAYMENT2SO.DATEEDIT"+

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
        ", ENSERVICESOBJECT.CITIESLIST " +
        ", ENSERVICESOBJECT.LINELENGTH " +
        ", ENSERVICESOBJECT.PROJECTCODE " +
        ", ENSERVICESOBJECT.CNPACKCODE " +
        ", ENSERVICESOBJECT.DFPACKCODE " +
        ", ENSERVICESOBJECT.COUNTERSZONETYPE " +
        ", ENPAYMENT2SOTYPE.CODE " +
        ", ENPAYMENT2SOTYPE.NAME " +
        ", ENSOBILL.CODE " +
        ", ENSOBILL.DATEGEN " +
        ", ENSOBILL.SUMTOTAL " +
        ", ENSOBILL.SUMGEN " +
        ", ENSOBILL.SUMVAT " +
        ", ENSOBILL.USERGEN " +
        ", ENSOBILL.DATEEDIT " +
       ", ENPAYMENT2SO.ORDERREFCODE" +

       " FROM ENSERVICESOBJECT " +
       ", ENPAYMENT2SOTYPE " +
       ", ENPAYMENT2SO left join ENSOBILL on ENSOBILL.CODE = ENPAYMENT2SO.SOBILLREFCODE " +
       "";

      whereStr = " ENSERVICESOBJECT.CODE = ENPAYMENT2SO.SERVICESOBJECTREFCODE" ; //+
        whereStr = whereStr +" AND ENPAYMENT2SOTYPE.CODE = ENPAYMENT2SO.PAYMENTTYPEREFCODE" ; //+
      //  whereStr = whereStr +" AND ENSOBILL.CODE = ENPAYMENT2SO.SOBILLREFCODE" ; //+
      //selectStr = selectStr + " ${s} ENPAYMENT2SO.CODE IN ( SELECT ENPAYMENT2SO.CODE FROM ENPAYMENT2SO ";

        if(aFilterObject != null)
        {
          if(aFilterObject.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENPAYMENT2SO.CODE = ?";
          }
          if(aFilterObject.dateGen != null) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENPAYMENT2SO.DATEGEN = ?";
          }
          if(aFilterObject.sumTotal != null) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENPAYMENT2SO.SUMTOTAL = ?";
          }
          if(aFilterObject.sumGen != null) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENPAYMENT2SO.SUMGEN = ?";
          }
          if(aFilterObject.sumVat != null) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENPAYMENT2SO.SUMVAT = ?";
          }
           if (aFilterObject.userGen != null) {
               if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
               if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                   whereStr = whereStr + "  UPPER(ENPAYMENT2SO.USERGEN) = UPPER(?)";
               else
                   whereStr = whereStr + " UPPER(ENPAYMENT2SO.USERGEN) LIKE UPPER(?)";
           }
          if(aFilterObject.dateEdit != null) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENPAYMENT2SO.DATEEDIT = ?";
          }
          if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "ENPAYMENT2SO.SERVICESOBJECTREFCODE = ? ";
          }
          if(aFilterObject.paymentTypeRef.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "ENPAYMENT2SO.PAYMENTTYPEREFCODE = ? ";
          }
          if(aFilterObject.soBillRef.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "ENPAYMENT2SO.SOBILLREFCODE = ? ";
          }
          if(aFilterObject.orderRef.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "ENPAYMENT2SO.ORDERREFCODE = ? ";
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
          if(aFilterObject.dateGen != null){
              number++;
              statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
          }
          if(aFilterObject.sumTotal != null){
              number++;
              aFilterObject.sumTotal = aFilterObject.sumTotal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
              statement.setBigDecimal(number,aFilterObject.sumTotal);
          }
          if(aFilterObject.sumGen != null){
              number++;
              aFilterObject.sumGen = aFilterObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
              statement.setBigDecimal(number,aFilterObject.sumGen);
          }
          if(aFilterObject.sumVat != null){
              number++;
              aFilterObject.sumVat = aFilterObject.sumVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
              statement.setBigDecimal(number,aFilterObject.sumVat);
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
         if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
             number++;
             statement.setInt(number,aFilterObject.servicesObjectRef.code);
         }
         if(aFilterObject.paymentTypeRef.code != Integer.MIN_VALUE) {
             number++;
             statement.setInt(number,aFilterObject.paymentTypeRef.code);
         }
         if(aFilterObject.soBillRef.code != Integer.MIN_VALUE) {
             number++;
             statement.setInt(number,aFilterObject.soBillRef.code);
         }
         if(aFilterObject.orderRef.code != Integer.MIN_VALUE) {
             number++;
             statement.setInt(number,aFilterObject.orderRef.code);
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

          anObject = new ENPayment2SOShort();

          anObject.code = set.getInt(1);
          if ( set.wasNull() )
              anObject.code = Integer.MIN_VALUE;
          anObject.dateGen = set.getDate(2);
          anObject.sumTotal = set.getBigDecimal(3);
          if(anObject.sumTotal != null)
              anObject.sumTotal = anObject.sumTotal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.sumGen = set.getBigDecimal(4);
          if(anObject.sumGen != null)
              anObject.sumGen = anObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.sumVat = set.getBigDecimal(5);
          if(anObject.sumVat != null)
              anObject.sumVat = anObject.sumVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.userGen = set.getString(6);
          anObject.dateEdit = set.getTimestamp(7);

          anObject.servicesObjectRefCode = set.getInt(8);
      if(set.wasNull())
        anObject.servicesObjectRefCode = Integer.MIN_VALUE;
          anObject.servicesObjectRefContractNumber = set.getString(9);
          anObject.servicesObjectRefContractDate = set.getDate(10);
          anObject.servicesObjectRefName = set.getString(11);
          anObject.servicesObjectRefPartnerCode = set.getString(12);
          anObject.servicesObjectRefFinDocCode = set.getString(13);
          anObject.servicesObjectRefFinDocID = set.getInt(14);
      if(set.wasNull())
        anObject.servicesObjectRefFinDocID = Integer.MIN_VALUE;
          anObject.servicesObjectRefCommentGen = set.getString(15);
          anObject.servicesObjectRefContractNumberServices = set.getString(16);
          anObject.servicesObjectRefContractDateServices = set.getDate(17);
          anObject.servicesObjectRefContragentName = set.getString(18);
          anObject.servicesObjectRefContragentAddress = set.getString(19);
          anObject.servicesObjectRefContragentAddressWork = set.getString(20);
          anObject.servicesObjectRefContragentOkpo = set.getString(21);
          anObject.servicesObjectRefContragentBankAccount = set.getString(22);
          anObject.servicesObjectRefContragentBankName = set.getString(23);
          anObject.servicesObjectRefContragentBankMfo = set.getString(24);
          anObject.servicesObjectRefContragentBossName = set.getString(25);
          anObject.servicesObjectRefContragentPassport = set.getString(26);
          anObject.servicesObjectRefContractServicesSumma = set.getBigDecimal(27);
          if(anObject.servicesObjectRefContractServicesSumma != null)
            anObject.servicesObjectRefContractServicesSumma = anObject.servicesObjectRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.servicesObjectRefContractServicesPower = set.getBigDecimal(28);
          if(anObject.servicesObjectRefContractServicesPower != null)
            anObject.servicesObjectRefContractServicesPower = anObject.servicesObjectRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.servicesObjectRefCommentServicesGen = set.getString(29);
          anObject.servicesObjectRefContractServicesDistance = set.getBigDecimal(30);
          if(anObject.servicesObjectRefContractServicesDistance != null)
            anObject.servicesObjectRefContractServicesDistance = anObject.servicesObjectRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.servicesObjectRefContractServicesDay = set.getBigDecimal(31);
          if(anObject.servicesObjectRefContractServicesDay != null)
            anObject.servicesObjectRefContractServicesDay = anObject.servicesObjectRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.servicesObjectRefUserGen = set.getString(32);
          anObject.servicesObjectRefDateEdit = set.getDate(33);
          anObject.servicesObjectRefWarrantDate = set.getDate(34);
          anObject.servicesObjectRefWarrantNumber = set.getString(35);
          anObject.servicesObjectRefWarrantFIO = set.getString(36);
          anObject.servicesObjectRefRegionalType = set.getInt(37);
      if(set.wasNull())
        anObject.servicesObjectRefRegionalType = Integer.MIN_VALUE;
          anObject.servicesObjectRefBasisType = set.getBigDecimal(38);
          if(anObject.servicesObjectRefBasisType != null)
            anObject.servicesObjectRefBasisType = anObject.servicesObjectRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.servicesObjectRefContragentPosition = set.getString(39);
          anObject.servicesObjectRefExecuteWorkDate = set.getDate(40);
          anObject.servicesObjectRefTimeStart = set.getTimestamp(41);
          anObject.servicesObjectRefTimeFinal = set.getTimestamp(42);
          anObject.servicesObjectRefContragentPhoneNumber = set.getString(43);
          anObject.servicesObjectRefExecutorPhoneNumber = set.getString(44);
          anObject.servicesObjectRefContragentObjectWork = set.getString(45);
          anObject.servicesObjectRefIsNoPay = set.getInt(46);
      if(set.wasNull())
        anObject.servicesObjectRefIsNoPay = Integer.MIN_VALUE;
          anObject.servicesObjectRefIsCustomerMaterials = set.getInt(47);
      if(set.wasNull())
        anObject.servicesObjectRefIsCustomerMaterials = Integer.MIN_VALUE;
          anObject.servicesObjectRefPayDate = set.getDate(48);
          anObject.servicesObjectRefFinPayFormCode = set.getInt(49);
      if(set.wasNull())
        anObject.servicesObjectRefFinPayFormCode = Integer.MIN_VALUE;
          anObject.servicesObjectRefFinPayFormName = set.getString(50);
          anObject.servicesObjectRefPartnerId = set.getInt(51);
      if(set.wasNull())
        anObject.servicesObjectRefPartnerId = Integer.MIN_VALUE;
          anObject.servicesObjectRefPayDetail = set.getString(52);
          anObject.servicesObjectRefActTransferNumber = set.getString(53);
          anObject.servicesObjectRefActTransferDate = set.getDate(54);
          anObject.servicesObjectRefResposible = set.getString(55);
          anObject.servicesObjectRefResposiblePosition = set.getString(56);
          anObject.servicesObjectRefResposibleTabNumber = set.getString(57);
          anObject.servicesObjectRefPrevContractStatus = set.getInt(58);
      if(set.wasNull())
        anObject.servicesObjectRefPrevContractStatus = Integer.MIN_VALUE;
          anObject.servicesObjectRefReconnectionTU = set.getInt(59);
      if(set.wasNull())
        anObject.servicesObjectRefReconnectionTU = Integer.MIN_VALUE;
          anObject.servicesObjectRefPersonalAccountCode = set.getInt(60);
      if(set.wasNull())
        anObject.servicesObjectRefPersonalAccountCode = Integer.MIN_VALUE;
          anObject.servicesObjectRefPersonalAccountNumber = set.getString(61);
          anObject.servicesObjectRefTabNumber = set.getString(62);
//          anObject.servicesObjectRefCitiesList = set.getString(63);
//          anObject.servicesObjectRefLineLength = set.getBigDecimal(64);
//          if(anObject.servicesObjectRefLineLength != null)
//            anObject.servicesObjectRefLineLength = anObject.servicesObjectRefLineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
//          anObject.servicesObjectRefProjectCode = set.getString(65);
          anObject.servicesObjectRefCnPackCode = set.getInt(66);
      if(set.wasNull())
        anObject.servicesObjectRefCnPackCode = Integer.MIN_VALUE;
          anObject.servicesObjectRefDfPackCode = set.getInt(67);
      if(set.wasNull())
        anObject.servicesObjectRefDfPackCode = Integer.MIN_VALUE;
          anObject.servicesObjectRefCountersZoneType = set.getInt(68);
      if(set.wasNull())
        anObject.servicesObjectRefCountersZoneType = Integer.MIN_VALUE;
          anObject.paymentTypeRefCode = set.getInt(69);
      if(set.wasNull())
        anObject.paymentTypeRefCode = Integer.MIN_VALUE;
          anObject.paymentTypeRefName = set.getString(70);
          anObject.soBillRefCode = set.getInt(71);
      if(set.wasNull())
        anObject.soBillRefCode = Integer.MIN_VALUE;
          anObject.soBillRefDateGen = set.getDate(72);
          anObject.soBillRefSumTotal = set.getBigDecimal(73);
          if(anObject.soBillRefSumTotal != null)
            anObject.soBillRefSumTotal = anObject.soBillRefSumTotal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.soBillRefSumGen = set.getBigDecimal(74);
          if(anObject.soBillRefSumGen != null)
            anObject.soBillRefSumGen = anObject.soBillRefSumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.soBillRefSumVat = set.getBigDecimal(75);
          if(anObject.soBillRefSumVat != null)
            anObject.soBillRefSumVat = anObject.soBillRefSumVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.soBillRefUserGen = set.getString(76);
          anObject.soBillRefDateEdit = set.getTimestamp(77);
          anObject.orderRefCode = set.getInt(78);
      if(set.wasNull())
        anObject.orderRefCode = Integer.MIN_VALUE;

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



} // end of ENPayment2SODAO
