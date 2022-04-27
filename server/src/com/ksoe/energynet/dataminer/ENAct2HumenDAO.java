
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENAct2HumenDAOGen;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENAct2Humen;
import com.ksoe.energynet.valueobject.brief.ENAct2HumenShort;
import com.ksoe.energynet.valueobject.filter.ENAct2HumenFilter;
import com.ksoe.energynet.valueobject.lists.ENAct2HumenShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENAct2Humen;
  *
  */

public class ENAct2HumenDAO extends ENAct2HumenDAOGen {


  public ENAct2HumenDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENAct2HumenDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public void removeHumensByActCode__(int actCode) throws PersistenceException
  {
    if(getUserProfile() == null)
            throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    //ResultSet  set = null;


    selectStr = "delete from ENACT2HUMEN where ACTREFCODE = ?";

        try
            {
            statement = connection.prepareStatement(selectStr);

            statement.setInt(1, actCode);

            statement.execute();
            }
        catch(SQLException e)
            {
            System.out.println(e.getMessage()+"\nstatement - "+selectStr);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
            }
        finally
            {
            //try {if (set != null) set.close();}             catch (SQLException e) {}
            try {if (statement != null) statement.close();} catch (SQLException e) {}
            if(connection != super.getConnection())
            {
            try{connection.close();} catch(SQLException e){}
            }
            }
  }

  public int getCountDaysInActByTabNumber(int actCode, String tabNumber) throws PersistenceException
   {

    int out = 0;

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = " select count(dat.*) from " +
    " ( " +
    " select  " +
    " fw.tabnumber, " +
    " p.datestart " +
    " from  " +
    " finworker fw, enhumenitem hi, enact2enplanwork a2p, enplanworkitem pi, enplanwork p " +
    " where " +
    " a2p.actrefcode = ? and fw.tabnumber = ? " +
    " and a2p.plancode = p.code " +
    " and a2p.plancode = pi.planrefcode  " +
    " and pi.countgen <> 0 " +
    " and hi.planitemrefcode = pi.code " +
    " and hi.planrefcode = a2p.plancode " +
    " and hi.finworkercode = fw.code " +
    "  " +
    " union " +
    "  " +
    " select  " +
    " fw.tabnumber, " +
    " p.datestart " +
    " from  " +
    " finworker fw, entransportitem hi, enact2enplanwork a2p, enplanworkitem pi, enplanwork p " +
    " where " +
    " a2p.actrefcode = ? and fw.tabnumber = ? " +
    " and a2p.plancode = p.code " +
    " and a2p.plancode = pi.planrefcode  " +
    " and pi.countgen <> 0 " +
    " and hi.planitemrefcode = pi.code " +
    " and hi.planrefcode = a2p.plancode " +
    " and hi.finworkercode = fw.code " +
    " ) dat ";



    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");


    try
     {
      statement = connection.prepareStatement(selectStr);

      statement.setInt(1, actCode);
      statement.setString(2, tabNumber);

      statement.setInt(3, actCode);
      statement.setString(4, tabNumber);



      set = statement.executeQuery();
      int i;
      for(i = 0;set.next();i++)
       {
        out = set.getInt(1);
       }

      return out;

     }
    catch(SQLException e)
     {
      System.out.println(e.getMessage()+"\nstatement - "+selectStr);
      throw new EnergyproSystemException("Error in runn sql : " + selectStr);
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


  @Override
public ENAct2HumenShortList getScrollableFilteredList(ENAct2Humen aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {
   ENAct2HumenShortList result = new ENAct2HumenShortList();
   ENAct2HumenShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);

   if(orderBy.length() == 0)
    orderBy = "ENACT2HUMEN.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "SELECT "+
    "ENACT2HUMEN.CODE"+
    ",ENACT2HUMEN.OREDERNUM"+
    ",ENACT2HUMEN.TABNUMBER"+
    ",ENACT2HUMEN.FIO"+
    ",ENACT2HUMEN.SALARY"+
    ",ENACT2HUMEN.TIMEMONTH"+
    ",ENACT2HUMEN.DAYSMONTH"+
    ",ENACT2HUMEN.SALARYHOURS"+
    ",ENACT2HUMEN.TIMEWORK"+
    ",ENACT2HUMEN.TIMEOBJECTWORK"+
    ",ENACT2HUMEN.TIMEWORKFACT"+
    ",ENACT2HUMEN.TIMEDELIVERY"+
    ",ENACT2HUMEN.PAYSWORK"+
    ",ENACT2HUMEN.BONUS"+
    ",ENACT2HUMEN.SALARYHOURSBONUS"+
    ",ENACT2HUMEN.PAYSWORKBONUS"+
    ",ENACT2HUMEN.CHARGEPERCENT"+
    ",ENACT2HUMEN.CHARGESUM"+
    ",ENACT2HUMEN.BALANS"+
    ",ENACT2HUMEN.PODRCOD"+
    ",ENACT2HUMEN.PAYWORKCOU"+

     ", ENHUMENITEMKIND.CODE " +
     ", ENHUMENITEMKIND.NAME " +
     ", ENACT.CODE " +
     ", ENACT.NUMBERGEN " +
     ", ENACT.DATEGEN " +
     ", ENACT.FINDOCCODE " +
     ", ENACT.FINDOCMECHANICCODE " +
     ", ENACT.FINMOLNAME " +
     ", ENACT.FINMECHANICNAME " +
     ", ENACT.INVNUMBER " +
     ", ENACT.USERGEN " +
     ", ENACT.DATEEDIT " +
     ", ENACT.DATEACT " +

     ", ENACT2HUMEN.CHARGEREFCODE " +
     ", (select FINCHARGETYPE.NAME from FINCHARGETYPE where FINCHARGETYPE.CODE = ENACT2HUMEN.CHARGEREFCODE) " +
     
     ",ENACT2HUMEN.CEHID"+
     
    " FROM ENACT2HUMEN " +
    ", ENHUMENITEMKIND " +
    ", ENACT " +
    //", FINCHARGETYPE " +
    //" WHERE "
 "";
    whereStr = " ENHUMENITEMKIND.CODE = ENACT2HUMEN.HUMENKINDREFCODE" ; //+
     whereStr = whereStr +" AND ENACT.CODE = ENACT2HUMEN.ACTREFCODE" ; //+
     //whereStr = whereStr +" AND FINCHARGETYPE.CODE = ENACT2HUMEN.CHARGEREFCODE" ; //+
   //selectStr = selectStr + " ${s} ENACT2HUMEN.CODE IN ( SELECT ENACT2HUMEN.CODE FROM ENACT2HUMEN ";

//" ";
     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2HUMEN.CODE = ?";
       }
       if(aFilterObject.orederNum != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2HUMEN.OREDERNUM = ?";
       }
        if (aFilterObject.tabNumber != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.tabNumber.indexOf('*',0) < 0 && aFilterObject.tabNumber.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENACT2HUMEN.TABNUMBER) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENACT2HUMEN.TABNUMBER) LIKE UPPER(?)";
        }
        if (aFilterObject.fio != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.fio.indexOf('*',0) < 0 && aFilterObject.fio.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENACT2HUMEN.FIO) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENACT2HUMEN.FIO) LIKE UPPER(?)";
        }
       if(aFilterObject.salary != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2HUMEN.SALARY = ?";
       }
       if(aFilterObject.timeMonth != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2HUMEN.TIMEMONTH = ?";
       }
       if(aFilterObject.daysMonth != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2HUMEN.DAYSMONTH = ?";
       }
       if(aFilterObject.salaryHours != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2HUMEN.SALARYHOURS = ?";
       }
       if(aFilterObject.timeWork != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2HUMEN.TIMEWORK = ?";
       }
       if(aFilterObject.timeObjectWork != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2HUMEN.TIMEOBJECTWORK = ?";
       }
       if(aFilterObject.timeWorkFact != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2HUMEN.TIMEWORKFACT = ?";
       }
       if(aFilterObject.timeDelivery != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2HUMEN.TIMEDELIVERY = ?";
       }
       if(aFilterObject.paysWork != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2HUMEN.PAYSWORK = ?";
       }
       if(aFilterObject.bonus != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2HUMEN.BONUS = ?";
       }
       if(aFilterObject.salaryHoursBonus != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2HUMEN.SALARYHOURSBONUS = ?";
       }
       if(aFilterObject.paysWorkBonus != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2HUMEN.PAYSWORKBONUS = ?";
       }
       if(aFilterObject.chargePercent != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2HUMEN.CHARGEPERCENT = ?";
       }
       if(aFilterObject.chargeSum != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2HUMEN.CHARGESUM = ?";
       }
        if (aFilterObject.balans != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.balans.indexOf('*',0) < 0 && aFilterObject.balans.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENACT2HUMEN.BALANS) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENACT2HUMEN.BALANS) LIKE UPPER(?)";
        }
        if (aFilterObject.podrcod != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.podrcod.indexOf('*',0) < 0 && aFilterObject.podrcod.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENACT2HUMEN.PODRCOD) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENACT2HUMEN.PODRCOD) LIKE UPPER(?)";
        }
       if(aFilterObject.modify_time != Long.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2HUMEN.MODIFY_TIME = ?";
       }
       if(aFilterObject.payWorkCou != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENACT2HUMEN.PAYWORKCOU = ?";
       }
       if(aFilterObject.humenKindRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENACT2HUMEN.HUMENKINDREFCODE = ? ";
       }
       if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENACT2HUMEN.ACTREFCODE = ? ";
       }
       if(aFilterObject.chargeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENACT2HUMEN.CHARGEREFCODE = ? ";
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
        if(aFilterObject.orederNum != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.orederNum);
        }

          if(aFilterObject.tabNumber != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.tabNumber);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.fio != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.fio);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.salary != null){
           number++;
           aFilterObject.salary = aFilterObject.salary.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.salary);
       }
       if(aFilterObject.timeMonth != null){
           number++;
           aFilterObject.timeMonth = aFilterObject.timeMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.timeMonth);
       }
       if(aFilterObject.daysMonth != null){
           number++;
           aFilterObject.daysMonth = aFilterObject.daysMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.daysMonth);
       }
       if(aFilterObject.salaryHours != null){
           number++;
           aFilterObject.salaryHours = aFilterObject.salaryHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.salaryHours);
       }
       if(aFilterObject.timeWork != null){
           number++;
           aFilterObject.timeWork = aFilterObject.timeWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.timeWork);
       }
       if(aFilterObject.timeObjectWork != null){
           number++;
           aFilterObject.timeObjectWork = aFilterObject.timeObjectWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.timeObjectWork);
       }
       if(aFilterObject.timeWorkFact != null){
           number++;
           aFilterObject.timeWorkFact = aFilterObject.timeWorkFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.timeWorkFact);
       }
       if(aFilterObject.timeDelivery != null){
           number++;
           aFilterObject.timeDelivery = aFilterObject.timeDelivery.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.timeDelivery);
       }
       if(aFilterObject.paysWork != null){
           number++;
           aFilterObject.paysWork = aFilterObject.paysWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.paysWork);
       }
       if(aFilterObject.bonus != null){
           number++;
           aFilterObject.bonus = aFilterObject.bonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.bonus);
       }
       if(aFilterObject.salaryHoursBonus != null){
           number++;
           aFilterObject.salaryHoursBonus = aFilterObject.salaryHoursBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.salaryHoursBonus);
       }
       if(aFilterObject.paysWorkBonus != null){
           number++;
           aFilterObject.paysWorkBonus = aFilterObject.paysWorkBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.paysWorkBonus);
       }
       if(aFilterObject.chargePercent != null){
           number++;
           aFilterObject.chargePercent = aFilterObject.chargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.chargePercent);
       }
       if(aFilterObject.chargeSum != null){
           number++;
           aFilterObject.chargeSum = aFilterObject.chargeSum.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.chargeSum);
       }

          if(aFilterObject.balans != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.balans);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.podrcod != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.podrcod);
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
       if(aFilterObject.payWorkCou != null){
           number++;
           aFilterObject.payWorkCou = aFilterObject.payWorkCou.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.payWorkCou);
       }
      if(aFilterObject.humenKindRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.humenKindRef.code);
      }
      if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.actRef.code);
      }
      if(aFilterObject.chargeRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.chargeRef.code);
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

       anObject = new ENAct2HumenShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.orederNum = set.getInt(2);
       if ( set.wasNull() )
           anObject.orederNum = Integer.MIN_VALUE;
       anObject.tabNumber = set.getString(3);
       anObject.fio = set.getString(4);
       anObject.salary = set.getBigDecimal(5);
       if(anObject.salary != null)
           anObject.salary = anObject.salary.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.timeMonth = set.getBigDecimal(6);
       if(anObject.timeMonth != null)
           anObject.timeMonth = anObject.timeMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.daysMonth = set.getBigDecimal(7);
       if(anObject.daysMonth != null)
           anObject.daysMonth = anObject.daysMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.salaryHours = set.getBigDecimal(8);
       if(anObject.salaryHours != null)
           anObject.salaryHours = anObject.salaryHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.timeWork = set.getBigDecimal(9);
       if(anObject.timeWork != null)
           anObject.timeWork = anObject.timeWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.timeObjectWork = set.getBigDecimal(10);
       if(anObject.timeObjectWork != null)
           anObject.timeObjectWork = anObject.timeObjectWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.timeWorkFact = set.getBigDecimal(11);
       if(anObject.timeWorkFact != null)
           anObject.timeWorkFact = anObject.timeWorkFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.timeDelivery = set.getBigDecimal(12);
       if(anObject.timeDelivery != null)
           anObject.timeDelivery = anObject.timeDelivery.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.paysWork = set.getBigDecimal(13);
       if(anObject.paysWork != null)
           anObject.paysWork = anObject.paysWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.bonus = set.getBigDecimal(14);
       if(anObject.bonus != null)
           anObject.bonus = anObject.bonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.salaryHoursBonus = set.getBigDecimal(15);
       if(anObject.salaryHoursBonus != null)
           anObject.salaryHoursBonus = anObject.salaryHoursBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.paysWorkBonus = set.getBigDecimal(16);
       if(anObject.paysWorkBonus != null)
           anObject.paysWorkBonus = anObject.paysWorkBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.chargePercent = set.getBigDecimal(17);
       if(anObject.chargePercent != null)
           anObject.chargePercent = anObject.chargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.chargeSum = set.getBigDecimal(18);
       if(anObject.chargeSum != null)
           anObject.chargeSum = anObject.chargeSum.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.balans = set.getString(19);
       anObject.podrcod = set.getString(20);
       anObject.payWorkCou = set.getBigDecimal(21);
       if(anObject.payWorkCou != null)
           anObject.payWorkCou = anObject.payWorkCou.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

       anObject.humenKindRefCode = set.getInt(22);
   if(set.wasNull())
     anObject.humenKindRefCode = Integer.MIN_VALUE;
       anObject.humenKindRefName = set.getString(23);
       anObject.actRefCode = set.getInt(24);
   if(set.wasNull())
     anObject.actRefCode = Integer.MIN_VALUE;
       anObject.actRefNumberGen = set.getString(25);
       anObject.actRefDateGen = set.getDate(26);
       anObject.actRefFinDocCode = set.getInt(27);
   if(set.wasNull())
     anObject.actRefFinDocCode = Integer.MIN_VALUE;
       anObject.actRefFinDocMechanicCode = set.getInt(28);
   if(set.wasNull())
     anObject.actRefFinDocMechanicCode = Integer.MIN_VALUE;
       anObject.actRefFinMolName = set.getString(29);
       anObject.actRefFinMechanicName = set.getString(30);
       anObject.actRefInvNumber = set.getString(31);
       anObject.actRefUserGen = set.getString(32);
       anObject.actRefDateEdit = set.getDate(33);
       anObject.actRefDateAct = set.getDate(34);
       anObject.chargeRefCode = set.getInt(35);
   if(set.wasNull())
     anObject.chargeRefCode = Integer.MIN_VALUE;
       anObject.chargeRefName = set.getString(36);
       
       anObject.cehId = set.getString(37);

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
  
  public ENAct2HumenShortList getScrollableFilteredListByAct(ENAct act) throws PersistenceException {
	  ENAct2HumenFilter filter = new ENAct2HumenFilter();
	  filter.actRef.code = act.code;
	  return this.getScrollableFilteredList(filter, 0, -1);
  }

  public ENAct2HumenShortList getSalaryChargesList(int actCode) throws PersistenceException
  {
	   ENAct2HumenShortList result = new ENAct2HumenShortList();
	   ENAct2HumenShort anObject;
	   result.list = new Vector();

	   String     selectStr;
	   Connection connection = getConnection();
	   PreparedStatement statement = null;
	   ResultSet  set = null;


	   if(getUserProfile() == null)
		   throw new PersistenceException("Internal Error (User Profile Is Undefined)");

	   selectStr =
		   "  select " +
		   "     en2h.code, " +
		   "     en2h.tabnumber, " +
		   "     en2h.fio as fioposada, " +
		   "     en2h.salary as oklad, " +

		   "     en2h.timemonth as timemonth, " +
		   "     en2h.salaryhours, " +
		   "     en2h.timework, " +

		   "     cast(en2h.paysworkbonus as numeric(15,2)) as payswork, " +

		   "     (select fww.chargepercent from finworker fww " +
		   "       where fww.code in (select case when en2h.humenkindrefcode = 1 /*если електротехнич персонал*/ " +
		   "                        then ( " +

		   " 			select max(fw.code) from enact2enplanwork a2p, enhumenitem hum, finworker fw, enplanworkitem pi " +
		   " 			 where a2p.actrefcode = en2h.actrefcode " +
		   " 			   and fw.tabnumber =  en2h.tabnumber " +
		   " 			   and a2p.plancode = hum.planrefcode " +
		   " 			   and hum.finworkercode = fw.code " +
		   " 			   and pi.code = hum.planitemrefcode " +
		   "               and hum.countfact <> 0 " +
		   "               and pi.countgen <> 0 ) " +

		   "                        else ( " +

		   " 			select max(fw.code) from enact2enplanwork a2p, entransportitem aut, finworker fw, enplanworkitem pi " +
		   " 			 where a2p.actrefcode = en2h.actrefcode " +
		   " 			   and fw.tabnumber =  en2h.tabnumber " +
		   " 			   and a2p.plancode = aut.planrefcode " +
		   " 			   and aut.finworkercode = fw.code " +
		   " 			   and pi.code = aut.planitemrefcode " +
		   "               and pi.countgen <> 0 ) end " +

		   "                         ) " +
		   "      ) as chargepercent, " +
		   "       " +
		   "      (select fww.chargerefcode from finworker fww " +
		   "       where fww.code in (select case when en2h.humenkindrefcode = 1 /*если електротехнич персонал*/ " +
		   "                        then ( " +

		   " 			select max(fw.code) from enact2enplanwork a2p, enhumenitem hum, finworker fw, enplanworkitem pi " +
		   " 			 where a2p.actrefcode = en2h.actrefcode " +
		   " 			   and fw.tabnumber =  en2h.tabnumber " +
		   " 			   and a2p.plancode = hum.planrefcode " +
		   " 			   and hum.finworkercode = fw.code " +
		   " 			   and pi.code = hum.planitemrefcode " +
		   "               and hum.countfact <> 0 " +
		   "               and pi.countgen <> 0 ) " +

		   "                        else ( " +

		   " 			select max(fw.code) from enact2enplanwork a2p, entransportitem aut, finworker fw, enplanworkitem pi " +
		   " 			 where a2p.actrefcode = en2h.actrefcode " +
		   " 			   and fw.tabnumber =  en2h.tabnumber " +
		   " 			   and a2p.plancode = aut.planrefcode " +
		   " 			   and aut.finworkercode = fw.code " +
		   " 			   and pi.code = aut.planitemrefcode " +
		   "               and pi.countgen <> 0 ) end " +

		   "                         ) " +
		   "      ) as chargerefcode, " +
		   "           " +
		   "      en2h.humenkindrefcode, " +

		   "      (select fww.departmentcode from finworker fww " +
		   "       where fww.code in (select case when en2h.humenkindrefcode = 1 /*если електротехнич персонал*/ " +
		   "                        then ( " +

		   " 			select max(fw.code) from enact2enplanwork a2p, enhumenitem hum, finworker fw, enplanworkitem pi " +
		   " 			 where a2p.actrefcode = en2h.actrefcode " +
		   " 			   and fw.tabnumber =  en2h.tabnumber " +
		   " 			   and a2p.plancode = hum.planrefcode " +
		   " 			   and hum.finworkercode = fw.code " +
		   " 			   and pi.code = hum.planitemrefcode " +
		   "               and hum.countfact <> 0 " +
		   "               and pi.countgen <> 0 ) " +

		   "                        else ( " +

		   " 			select max(fw.code) from enact2enplanwork a2p, entransportitem aut, finworker fw, enplanworkitem pi " +
		   " 			 where a2p.actrefcode = en2h.actrefcode " +
		   " 			   and fw.tabnumber =  en2h.tabnumber " +
		   " 			   and a2p.plancode = aut.planrefcode " +
		   " 			   and aut.finworkercode = fw.code " +
		   " 			   and pi.code = aut.planitemrefcode " +
		   "               and pi.countgen <> 0 ) end " +

		   "                         ) " +
		   "      ) as podrcode " +
		   ", ac.dateGen " +
		   "  from enact2humen en2h " +
		   " inner join enact as ac on en2h.actrefcode = ac.code " +
		   "  where en2h.actrefcode = " + actCode +
		   "  order by en2h.code ";

	    try
	    {
		     statement = connection.prepareStatement(selectStr);

		     set = statement.executeQuery();

		     int i;

		     for (i = 0; set.next(); i++)
		     {
			     anObject = new ENAct2HumenShort();

			     anObject.code = set.getInt(1);
			     if ( set.wasNull() )
			         anObject.code = Integer.MIN_VALUE;

			     anObject.tabNumber = set.getString(2);
			     anObject.fio = set.getString(3);

			     anObject.salary = set.getBigDecimal(4);
			     if(anObject.salary != null)
			         anObject.salary = anObject.salary.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

			     anObject.timeMonth = set.getBigDecimal(5);
			     if(anObject.timeMonth != null)
			         anObject.timeMonth = anObject.timeMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

			     anObject.salaryHours = set.getBigDecimal(6);
			     if(anObject.salaryHours != null)
			         anObject.salaryHours = anObject.salaryHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

			     anObject.timeWork = set.getBigDecimal(7);
			     if(anObject.timeWork != null)
			         anObject.timeWork = anObject.timeWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

			     anObject.paysWork = set.getBigDecimal(8);
			     if(anObject.paysWork != null)
			         anObject.paysWork = anObject.paysWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

			     anObject.chargePercent = set.getBigDecimal(9);
			     if(anObject.chargePercent != null)
			         anObject.chargePercent = anObject.chargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

			     /*
			     anObject.chargeSum = set.getBigDecimal(18);
			     if(anObject.chargeSum != null)
			         anObject.chargeSum = anObject.chargeSum.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);

			     anObject.balans = set.getString(19);
			     anObject.podrcod = set.getString(20);
			     */

			     anObject.chargeRefCode = set.getInt(10);
			     if(set.wasNull())
				   anObject.chargeRefCode = Integer.MIN_VALUE;

			     anObject.humenKindRefCode = set.getInt(11);
				 if(set.wasNull())
				   anObject.humenKindRefCode = Integer.MIN_VALUE;

				 anObject.podrcod = set.getString(12);
				 
				 anObject.actRefDateGen = set.getDate(13);

				 anObject.actRefCode = actCode;

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

  public ENAct2Humen getObjectNOSEGR(int uid) throws PersistenceException
  {
   ENAct2Humen result = new ENAct2Humen();
   result.code = uid;
   loadObjectNOSEGR(result);
   if(result.code == Integer.MIN_VALUE)
    return null;
   return result;
  }


 public void loadObjectNOSEGR(ENAct2Humen anObject) throws PersistenceException
  {
   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet set = null;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   /*
   SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAct2Humen.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
   if(segregationInfo.isAccessDenied())
     throw new PersistenceException("{%ENAct2Humen.getObject%} access denied");
   */

   selectStr =
   "SELECT  ENACT2HUMEN.CODE, ENACT2HUMEN.OREDERNUM, ENACT2HUMEN.TABNUMBER, ENACT2HUMEN.FIO, ENACT2HUMEN.SALARY, ENACT2HUMEN.TIMEMONTH, ENACT2HUMEN.DAYSMONTH, ENACT2HUMEN.SALARYHOURS, ENACT2HUMEN.TIMEWORK, ENACT2HUMEN.TIMEOBJECTWORK, ENACT2HUMEN.TIMEWORKFACT, ENACT2HUMEN.TIMEDELIVERY, ENACT2HUMEN.PAYSWORK, ENACT2HUMEN.BONUS, ENACT2HUMEN.SALARYHOURSBONUS, ENACT2HUMEN.PAYSWORKBONUS, ENACT2HUMEN.CHARGEPERCENT, ENACT2HUMEN.CHARGESUM, ENACT2HUMEN.BALANS, ENACT2HUMEN.PODRCOD, ENACT2HUMEN.MODIFY_TIME, ENACT2HUMEN.PAYWORKCOU, ENACT2HUMEN.HUMENKINDREFCODE, ENACT2HUMEN.ACTREFCODE, ENACT2HUMEN.CHARGEREFCODE , ENACT2HUMEN.CEHID , ENACT2HUMEN.PLANREFCODE "
   +" FROM ENACT2HUMEN WHERE ENACT2HUMEN.CODE = ?";

   /*
   String segregationWhereStr = SegregationQueryBuilder.addWhere("ENACT2HUMEN",segregationInfo,getUserProfile().getDomainInfo());
   if(segregationWhereStr.length() > 0)
    selectStr = selectStr + " AND " + segregationWhereStr;
   */

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
       anObject.orederNum = set.getInt(2);
       if ( set.wasNull() )
          anObject.orederNum = Integer.MIN_VALUE;
       anObject.tabNumber = set.getString(3);
       anObject.fio = set.getString(4);
       anObject.salary = set.getBigDecimal(5);
       if(anObject.salary != null)
           anObject.salary = anObject.salary.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.timeMonth = set.getBigDecimal(6);
       if(anObject.timeMonth != null)
           anObject.timeMonth = anObject.timeMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.daysMonth = set.getBigDecimal(7);
       if(anObject.daysMonth != null)
           anObject.daysMonth = anObject.daysMonth.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.salaryHours = set.getBigDecimal(8);
       if(anObject.salaryHours != null)
           anObject.salaryHours = anObject.salaryHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.timeWork = set.getBigDecimal(9);
       if(anObject.timeWork != null)
           anObject.timeWork = anObject.timeWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.timeObjectWork = set.getBigDecimal(10);
       if(anObject.timeObjectWork != null)
           anObject.timeObjectWork = anObject.timeObjectWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.timeWorkFact = set.getBigDecimal(11);
       if(anObject.timeWorkFact != null)
           anObject.timeWorkFact = anObject.timeWorkFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.timeDelivery = set.getBigDecimal(12);
       if(anObject.timeDelivery != null)
           anObject.timeDelivery = anObject.timeDelivery.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.paysWork = set.getBigDecimal(13);
       if(anObject.paysWork != null)
           anObject.paysWork = anObject.paysWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.bonus = set.getBigDecimal(14);
       if(anObject.bonus != null)
           anObject.bonus = anObject.bonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.salaryHoursBonus = set.getBigDecimal(15);
       if(anObject.salaryHoursBonus != null)
           anObject.salaryHoursBonus = anObject.salaryHoursBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.paysWorkBonus = set.getBigDecimal(16);
       if(anObject.paysWorkBonus != null)
           anObject.paysWorkBonus = anObject.paysWorkBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.chargePercent = set.getBigDecimal(17);
       if(anObject.chargePercent != null)
           anObject.chargePercent = anObject.chargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.chargeSum = set.getBigDecimal(18);
       if(anObject.chargeSum != null)
           anObject.chargeSum = anObject.chargeSum.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.balans = set.getString(19);
       anObject.podrcod = set.getString(20);
       anObject.modify_time = set.getLong(21);
       if(set.wasNull())
        anObject.modify_time = Long.MIN_VALUE;
       anObject.payWorkCou = set.getBigDecimal(22);
       if(anObject.payWorkCou != null)
           anObject.payWorkCou = anObject.payWorkCou.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.humenKindRef.code = set.getInt(23);
       if ( set.wasNull() )
           anObject.humenKindRef.code = Integer.MIN_VALUE;
       anObject.actRef.code = set.getInt(24);
       if ( set.wasNull() )
           anObject.actRef.code = Integer.MIN_VALUE;
       anObject.chargeRef.code = set.getInt(25);
       if ( set.wasNull() )
           anObject.chargeRef.code = Integer.MIN_VALUE;
       
       anObject.cehId = set.getString(26);
       
       anObject.planRef.code = set.getInt(27);
		if (set.wasNull()) {
			anObject.planRef.code = Integer.MIN_VALUE;
		}
		
       if(anObject.planRef.code != Integer.MIN_VALUE) {
			anObject.setPlanRef(
				new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).getRef(anObject.planRef.code));
		}
       
       if(anObject.humenKindRef.code != Integer.MIN_VALUE)
       {
          anObject.setHumenKindRef(
     new com.ksoe.energynet.dataminer.generated.ENHumenItemKindDAOGen(connection,getUserProfile()).getRef(anObject.humenKindRef.code));
   }
       if(anObject.actRef.code != Integer.MIN_VALUE)
       {
          anObject.setActRef(
     new com.ksoe.energynet.dataminer.generated.ENActDAOGen(connection,getUserProfile()).getRef(anObject.actRef.code));
   }
       if(anObject.chargeRef.code != Integer.MIN_VALUE)
       {
          anObject.setChargeRef(
     new com.ksoe.energynet.dataminer.generated.FINChargeTypeDAOGen(connection,getUserProfile()).getRef(anObject.chargeRef.code));
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



} // end of ENAct2HumenDAO

