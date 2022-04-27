
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENTimeLineDAOGen;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.brief.ENTimeLineShort;
import com.ksoe.energynet.valueobject.filter.ENTimeLineFilter;
import com.ksoe.energynet.valueobject.lists.ENTimeLineShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENTimeLine;  
  * 	
  */

public class ENTimeLineDAO extends ENTimeLineDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENTimeLineDAO() {super();}
  //public ENTimeLineDAO(Connection aConnection) {super(aConnection);}
  //public ENTimeLineDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTimeLineDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTimeLineDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public ENTimeLineShortList getScrollableFilteredListForPlanning(ENTimeLineFilter aFilterObject,/*String anCondition,String anOrderBy,*/int fromPosition,int quantity/*,Vector aBindObjects*/) throws PersistenceException
  {
   ENTimeLineShortList result = new ENTimeLineShortList();
   ENTimeLineShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   //String     condition = processCondition(anCondition);
   String     condition = processCondition(aFilterObject.conditionSQL);
   //String     orderBy = processCondition(anOrderBy);
   String     orderBy = processCondition(aFilterObject.orderBySQL);

   if(orderBy.length() == 0)
	orderBy = "ENTIMELINE.DATEGEN, ENSERVICESOBJECT.CONTRAGENTADDRESSWORK, ENTIMELINE.TIMEMOVETOOBJECT, ENTIMELINE.TIMESTART, ENTIMELINE.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "SELECT "+
    "ENTIMELINE.CODE"+
    ",ENTIMELINE.DATEGEN"+
    ",ENTIMELINE.TIMESTART"+
    ",ENTIMELINE.TIMEFINAL"+
    ",ENTIMELINE.TIMEMOVETOOBJECT"+
    ",ENTIMELINE.TIMEMOVEOFOBJECT"+

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
     ", ENSERVICESOBJECT.CNPACKCODE " +
     ", ENSERVICESOBJECT.DFPACKCODE " +
     ", ENTIMELINE.VIRTUALBRIGADEREFCODE " +
     
     ", ENPLANWORK.code " +
     
	 ", (select vb.namecompound from TKVIRTUALBRIGADE vb " + 
	 "    where vb.code = ENTIMELINE.virtualbrigaderefcode) as brigadename " +
		  
	// Скопировано из отчета "Звіт про надання послуг на сторону на обрану дату" 
    ", (select distinct group_concat((ty.kod||' '||ty.name),/*', '||*/chr(10)) as name " +
    "   from " +
    "    	tkclassificationtype as ty, " +
    "       enplanwork as pw, " +
    "    	enplanwork2classfctntp as pwct " +
    "   where " +
    "       ty.code = pwct.classificationtyperfcd " +
    "    	and pw.code = pwct.planrefcode " +
    "    	and pw.elementrefcode = ENSERVICESOBJECT.elementcode " +
    "    	and pw.kindcode = " + ENPlanWorkKind.CALCULATION + " /*кошториси*/) as classifications " +	 
    
	 ", (select cs.name from ENSERVICESCONTRACTSTTS cs " + 
	 "    where cs.code = ENSERVICESOBJECT.contractstatusrefcode) as contractstatusname " +
	 ", (select s.name from ENSERVICESOBJECTSTATUS s " + 
	 "    where s.code = ENSERVICESOBJECT.statusrefcode) as buhstatusname " +    
  
    " FROM ENTIMELINE " +
    ", ENSERVICESOBJECT " +
    ", ENPLANWORK " +
    //" WHERE "
   "";
   
   // Выбираем только те договора, по которым есть месячные планы!!!
    whereStr = " ENSERVICESOBJECT.CODE = ENTIMELINE.SERVICESOBJECTREFCODE " +
	       " AND ENSERVICESOBJECT.elementcode = ENPLANWORK.elementrefcode " +
    	   " AND ENPLANWORK.kindcode = " + ENPlanWorkKind.CURRENT;
    

     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTIMELINE.CODE = ?";
       }
       if(aFilterObject.dateGen != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTIMELINE.DATEGEN = ?";
       }
       if(aFilterObject.timeStart != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTIMELINE.TIMESTART = ?";
       }
       if(aFilterObject.timeFinal != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTIMELINE.TIMEFINAL = ?";
       }
       if(aFilterObject.timeMoveToObject != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTIMELINE.TIMEMOVETOOBJECT = ?";
       }
       if(aFilterObject.timeMoveOfObject != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENTIMELINE.TIMEMOVEOFOBJECT = ?";
       }
       if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTIMELINE.SERVICESOBJECTREFCODE = ? ";
       }
       if(aFilterObject.virtualBrigadeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENTIMELINE.VIRTUALBRIGADEREFCODE = ? ";
       }

     }



     if(condition.length() != 0)
     {
        if(whereStr.length() != 0)
           whereStr = whereStr + " AND ";

        whereStr = whereStr + " (" + condition + ")";
     }
//+ " WHERE" +  сделано выше ????
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
       if(aFilterObject.dateGen != null){
           number++;
           statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
       }
       if(aFilterObject.timeStart != null){
           number++;
           statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeStart.getTime()));
       }
       if(aFilterObject.timeFinal != null){
           number++;
           statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeFinal.getTime()));
       }
       if(aFilterObject.timeMoveToObject != null){
           number++;
           statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeMoveToObject.getTime()));
       }
       if(aFilterObject.timeMoveOfObject != null){
           number++;
           statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.timeMoveOfObject.getTime()));
       }
      if(aFilterObject.servicesObjectRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.servicesObjectRef.code);
      }
      if(aFilterObject.virtualBrigadeRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.virtualBrigadeRef.code);
      }
     }

     /*
     if(condition.length() > 0 && aBindObjects != null)
      _bindObjectsToPreparedStatement(statement,aBindObjects,number);
     */
     
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

       anObject = new ENTimeLineShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.dateGen = set.getDate(2);
       anObject.timeStart = set.getTimestamp(3);
       anObject.timeFinal = set.getTimestamp(4);
       anObject.timeMoveToObject = set.getTimestamp(5);
       anObject.timeMoveOfObject = set.getTimestamp(6);

       anObject.servicesObjectRefCode = set.getInt(7);
       if(set.wasNull())
       anObject.servicesObjectRefCode = Integer.MIN_VALUE;
       anObject.servicesObjectRefContractNumber = set.getString(8);
       anObject.servicesObjectRefContractDate = set.getDate(9);
       anObject.servicesObjectRefName = set.getString(10);
       anObject.servicesObjectRefPartnerCode = set.getString(11);
       anObject.servicesObjectRefFinDocCode = set.getString(12);
       anObject.servicesObjectRefFinDocID = set.getInt(13);
       if(set.wasNull())
       anObject.servicesObjectRefFinDocID = Integer.MIN_VALUE;
       anObject.servicesObjectRefCommentGen = set.getString(14);
       anObject.servicesObjectRefContractNumberServices = set.getString(15);
       anObject.servicesObjectRefContractDateServices = set.getDate(16);
       anObject.servicesObjectRefContragentName = set.getString(17);
       anObject.servicesObjectRefContragentAddress = set.getString(18);
       anObject.servicesObjectRefContragentAddressWork = set.getString(19);
       anObject.servicesObjectRefContragentOkpo = set.getString(20);
       anObject.servicesObjectRefContragentBankAccount = set.getString(21);
       anObject.servicesObjectRefContragentBankName = set.getString(22);
       anObject.servicesObjectRefContragentBankMfo = set.getString(23);
       anObject.servicesObjectRefContragentBossName = set.getString(24);
       anObject.servicesObjectRefContragentPassport = set.getString(25);
       anObject.servicesObjectRefContractServicesSumma = set.getBigDecimal(26);
       if(anObject.servicesObjectRefContractServicesSumma != null)
         anObject.servicesObjectRefContractServicesSumma = anObject.servicesObjectRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.servicesObjectRefContractServicesPower = set.getBigDecimal(27);
       if(anObject.servicesObjectRefContractServicesPower != null)
         anObject.servicesObjectRefContractServicesPower = anObject.servicesObjectRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.servicesObjectRefCommentServicesGen = set.getString(28);
       anObject.servicesObjectRefContractServicesDistance = set.getBigDecimal(29);
       if(anObject.servicesObjectRefContractServicesDistance != null)
         anObject.servicesObjectRefContractServicesDistance = anObject.servicesObjectRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.servicesObjectRefContractServicesDay = set.getBigDecimal(30);
       if(anObject.servicesObjectRefContractServicesDay != null)
         anObject.servicesObjectRefContractServicesDay = anObject.servicesObjectRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.servicesObjectRefUserGen = set.getString(31);
       anObject.servicesObjectRefDateEdit = set.getDate(32);
       anObject.servicesObjectRefWarrantDate = set.getDate(33);
       anObject.servicesObjectRefWarrantNumber = set.getString(34);
       anObject.servicesObjectRefWarrantFIO = set.getString(35);
       anObject.servicesObjectRefRegionalType = set.getInt(36);
       if(set.wasNull())
       anObject.servicesObjectRefRegionalType = Integer.MIN_VALUE;
       anObject.servicesObjectRefBasisType = set.getBigDecimal(37);
       if(anObject.servicesObjectRefBasisType != null)
         anObject.servicesObjectRefBasisType = anObject.servicesObjectRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.servicesObjectRefContragentPosition = set.getString(38);
       anObject.servicesObjectRefExecuteWorkDate = set.getDate(39);
       anObject.servicesObjectRefTimeStart = set.getTimestamp(40);
       anObject.servicesObjectRefTimeFinal = set.getTimestamp(41);
       anObject.servicesObjectRefContragentPhoneNumber = set.getString(42);
       anObject.servicesObjectRefExecutorPhoneNumber = set.getString(43);

       anObject.virtualBrigadeRefCode = set.getInt(63);
       if(set.wasNull())
         anObject.virtualBrigadeRefCode = Integer.MIN_VALUE;

       anObject.planCode = set.getInt(64);
       if(set.wasNull())
         anObject.planCode = Integer.MIN_VALUE;
       
       anObject.virtualBrigadeRefNameCompound = set.getString(65);
       
       anObject.classifications = set.getString(66);
       
       anObject.servicesObjectRefContractStatusName = set.getString(67);
       anObject.servicesObjectRefBuhStatusName = set.getString(68);
       
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


} // end of ENTimeLineDAO

