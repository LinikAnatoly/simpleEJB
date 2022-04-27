
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
import java.util.Vector;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENBonusListItemDAOGen;
import com.ksoe.energynet.valueobject.ENBonusListItem;
import com.ksoe.energynet.valueobject.brief.ENBonusListItemShort;
import com.ksoe.energynet.valueobject.lists.ENBonusListItemShortList;

/**
 * DAO Object for ENBonusListItem;
 *
 */

public class ENBonusListItemDAO extends ENBonusListItemDAOGen {

    public ENBonusListItemDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENBonusListItemDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
  
    public ENBonusListItemShortList getScrollableFilteredList(ENBonusListItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
     ENBonusListItemShortList result = new ENBonusListItemShortList();
     ENBonusListItemShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     whereStr = "";
     String     condition = processCondition(anCondition);
     String     orderBy = processCondition(anOrderBy);

     if(orderBy.length() == 0)
      orderBy = "ENBONUSLISTITEM.CODE";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr = "SELECT "+
      "ENBONUSLISTITEM.CODE"+
      ",ENBONUSLISTITEM.PODRID"+
      ",ENBONUSLISTITEM.PODRNAME"+
      ",ENBONUSLISTITEM.FIO"+
      ",ENBONUSLISTITEM.TABNUMBER"+
      ",ENBONUSLISTITEM.POSITIONID"+
      ",ENBONUSLISTITEM.POSITIONNAME || ' ' || ENBONUSLISTITEM.TRADECATEGORYID as POSITIONNAME "+
      ",ENBONUSLISTITEM.FUNDWORKTIME"+
      ",ENBONUSLISTITEM.WORKTIMEFACT"+
      ",ENBONUSLISTITEM.HOURSWORKEDWITHSTAFF"+
      ",ENBONUSLISTITEM.TIMEDELIVERY"+
      ",ENBONUSLISTITEM.HOURSWORKEDPLAN"+
      ",ENBONUSLISTITEM.HOURSWORKEDNOTPLAN"+
      ",ENBONUSLISTITEM.HOURSWORKEDSUM"+
      ",ENBONUSLISTITEM.PERCENTLOADWORK"+
      ",ENBONUSLISTITEM.PERCENTLOADBYPLANWORK"+
      ",ENBONUSLISTITEM.PERCENTLOADBYNOTPLNWRK"+
      ",ENBONUSLISTITEM.PERCENTBONUS"+
      ",ENBONUSLISTITEM.COEFFICIENT"+
      ",ENBONUSLISTITEM.PERCENTBONUSFORCHARGNG"+
      ",ENBONUSLISTITEM.COUNTFACTWORKEDDAYS"+
      ",ENBONUSLISTITEM.TRADECATEGORYID"+
      ",ENBONUSLISTITEM.DATESTART"+
      ",ENBONUSLISTITEM.DATEFINAL"+
      ",ENBONUSLISTITEM.NOWAYOUTFROMPERIOD"+
      ",ENBONUSLISTITEM.USERADD"+
      ",ENBONUSLISTITEM.DATEADD"+
      ",ENBONUSLISTITEM.USERGEN"+
      ",ENBONUSLISTITEM.DATEEDIT"+
      ",ENBONUSLISTITEM.REASONINVALID"+
      ",ENBONUSLISTITEM.USERSETINVALID"+
      ",ENBONUSLISTITEM.DATESETINVALID"+

       ", ENBONUSLIST.CODE " +
       ", ENBONUSLIST.NUMBERGEN " +
       ", ENBONUSLIST.MONTHGEN " +
       ", ENBONUSLIST.YEARGEN " +
       ", ENBONUSLIST.USERADD " +
       ", ENBONUSLIST.DATEADD " +
       ", ENBONUSLIST.USERGEN " +
       ", ENBONUSLIST.DATEEDIT " +
       ", ENBONUSLISTITEMSTATUS.CODE " +
       ", ENBONUSLISTITEMSTATUS.NAME " +
       ", (ENBONUSLISTITEM.SUMMACOMPENSATION/1000)::numeric(15,3) as SUMMACOMPENSATION "+
	   ",ENBONUSLISTITEM.COEFFICIENTQUALITY"+
      " FROM ENBONUSLISTITEM " +
      ", ENBONUSLIST " +
      ", ENBONUSLISTITEMSTATUS " +
      //" WHERE "
   "";
      whereStr = " ENBONUSLIST.CODE = ENBONUSLISTITEM.BONUSLISTCODE" ; //+
       whereStr = whereStr +" AND ENBONUSLISTITEMSTATUS.CODE = ENBONUSLISTITEM.STATUSCODE" ; //+
     //selectStr = selectStr + " ${s} ENBONUSLISTITEM.CODE IN ( SELECT ENBONUSLISTITEM.CODE FROM ENBONUSLISTITEM ";

 // " ";
       if(aFilterObject != null)
       {
         if(aFilterObject.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENBONUSLISTITEM.CODE = ?";
         }
          if (aFilterObject.podrId != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.podrId.indexOf('*',0) < 0 && aFilterObject.podrId.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENBONUSLISTITEM.PODRID) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENBONUSLISTITEM.PODRID) LIKE UPPER(?)";
          }
          if (aFilterObject.podrName != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.podrName.indexOf('*',0) < 0 && aFilterObject.podrName.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENBONUSLISTITEM.PODRNAME) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENBONUSLISTITEM.PODRNAME) LIKE UPPER(?)";
          }
          if (aFilterObject.fio != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.fio.indexOf('*',0) < 0 && aFilterObject.fio.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENBONUSLISTITEM.FIO) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENBONUSLISTITEM.FIO) LIKE UPPER(?)";
          }
          if (aFilterObject.tabNumber != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.tabNumber.indexOf('*',0) < 0 && aFilterObject.tabNumber.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENBONUSLISTITEM.TABNUMBER) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENBONUSLISTITEM.TABNUMBER) LIKE UPPER(?)";
          }
          if (aFilterObject.positionId != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.positionId.indexOf('*',0) < 0 && aFilterObject.positionId.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENBONUSLISTITEM.POSITIONID) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENBONUSLISTITEM.POSITIONID) LIKE UPPER(?)";
          }
          if (aFilterObject.positionName != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.positionName.indexOf('*',0) < 0 && aFilterObject.positionName.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENBONUSLISTITEM.POSITIONNAME) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENBONUSLISTITEM.POSITIONNAME) LIKE UPPER(?)";
          }
         if(aFilterObject.fundWorkTime != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENBONUSLISTITEM.FUNDWORKTIME = ?";
         }
         if(aFilterObject.workTimeFact != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENBONUSLISTITEM.WORKTIMEFACT = ?";
         }
         if(aFilterObject.hoursWorkedWithStaff != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENBONUSLISTITEM.HOURSWORKEDWITHSTAFF = ?";
         }
         if(aFilterObject.timeDelivery != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENBONUSLISTITEM.TIMEDELIVERY = ?";
         }
         if(aFilterObject.hoursWorkedPlan != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENBONUSLISTITEM.HOURSWORKEDPLAN = ?";
         }
         if(aFilterObject.hoursWorkedNotPlan != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENBONUSLISTITEM.HOURSWORKEDNOTPLAN = ?";
         }
         if(aFilterObject.hoursWorkedSum != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENBONUSLISTITEM.HOURSWORKEDSUM = ?";
         }
         if(aFilterObject.percentLoadWork != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENBONUSLISTITEM.PERCENTLOADWORK = ?";
         }
         if(aFilterObject.percentLoadByPlanWork != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENBONUSLISTITEM.PERCENTLOADBYPLANWORK = ?";
         }
         if(aFilterObject.percentLoadByNotPlanWork != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENBONUSLISTITEM.PERCENTLOADBYNOTPLNWRK = ?";
         }
         if(aFilterObject.percentBonus != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENBONUSLISTITEM.PERCENTBONUS = ?";
         }
         if(aFilterObject.coefficient != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENBONUSLISTITEM.COEFFICIENT = ?";
         }
         if(aFilterObject.percentBonusForCharging != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENBONUSLISTITEM.PERCENTBONUSFORCHARGNG = ?";
         }
         if(aFilterObject.countFactWorkedDays != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENBONUSLISTITEM.COUNTFACTWORKEDDAYS = ?";
         }
          if (aFilterObject.tradeCategoryId != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.tradeCategoryId.indexOf('*',0) < 0 && aFilterObject.tradeCategoryId.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENBONUSLISTITEM.TRADECATEGORYID) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENBONUSLISTITEM.TRADECATEGORYID) LIKE UPPER(?)";
          }
         if(aFilterObject.dateStart != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENBONUSLISTITEM.DATESTART = ?";
         }
         if(aFilterObject.dateFinal != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENBONUSLISTITEM.DATEFINAL = ?";
         }
         if(aFilterObject.noWayOutFromPeriod != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENBONUSLISTITEM.NOWAYOUTFROMPERIOD = ?";
         }
          if (aFilterObject.userAdd != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENBONUSLISTITEM.USERADD) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENBONUSLISTITEM.USERADD) LIKE UPPER(?)";
          }
         if(aFilterObject.dateAdd != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENBONUSLISTITEM.DATEADD = ?";
         }
          if (aFilterObject.userGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENBONUSLISTITEM.USERGEN) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENBONUSLISTITEM.USERGEN) LIKE UPPER(?)";
          }
         if(aFilterObject.dateEdit != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENBONUSLISTITEM.DATEEDIT = ?";
         }
         if(aFilterObject.modify_time != Long.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENBONUSLISTITEM.MODIFY_TIME = ?";
         }
          if (aFilterObject.reasonInvalid != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.reasonInvalid.indexOf('*',0) < 0 && aFilterObject.reasonInvalid.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENBONUSLISTITEM.REASONINVALID) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENBONUSLISTITEM.REASONINVALID) LIKE UPPER(?)";
          }
          if (aFilterObject.userSetInvalid != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userSetInvalid.indexOf('*',0) < 0 && aFilterObject.userSetInvalid.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENBONUSLISTITEM.USERSETINVALID) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENBONUSLISTITEM.USERSETINVALID) LIKE UPPER(?)";
          }
         if(aFilterObject.dateSetInvalid != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENBONUSLISTITEM.DATESETINVALID = ?";
         }
         if(aFilterObject.bonusList.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENBONUSLISTITEM.BONUSLISTCODE = ? ";
         }
         if(aFilterObject.status.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENBONUSLISTITEM.STATUSCODE = ? ";
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

            if(aFilterObject.podrId != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.podrId);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.podrName != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.podrName);
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

            if(aFilterObject.positionId != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.positionId);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.positionName != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.positionName);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
         if(aFilterObject.fundWorkTime != null){
             number++;
             aFilterObject.fundWorkTime = aFilterObject.fundWorkTime.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.fundWorkTime);
         }
         if(aFilterObject.workTimeFact != null){
             number++;
             aFilterObject.workTimeFact = aFilterObject.workTimeFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.workTimeFact);
         }
         if(aFilterObject.hoursWorkedWithStaff != null){
             number++;
             aFilterObject.hoursWorkedWithStaff = aFilterObject.hoursWorkedWithStaff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.hoursWorkedWithStaff);
         }
         if(aFilterObject.timeDelivery != null){
             number++;
             aFilterObject.timeDelivery = aFilterObject.timeDelivery.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.timeDelivery);
         }
         if(aFilterObject.hoursWorkedPlan != null){
             number++;
             aFilterObject.hoursWorkedPlan = aFilterObject.hoursWorkedPlan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.hoursWorkedPlan);
         }
         if(aFilterObject.hoursWorkedNotPlan != null){
             number++;
             aFilterObject.hoursWorkedNotPlan = aFilterObject.hoursWorkedNotPlan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.hoursWorkedNotPlan);
         }
         if(aFilterObject.hoursWorkedSum != null){
             number++;
             aFilterObject.hoursWorkedSum = aFilterObject.hoursWorkedSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.hoursWorkedSum);
         }
         if(aFilterObject.percentLoadWork != null){
             number++;
             aFilterObject.percentLoadWork = aFilterObject.percentLoadWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.percentLoadWork);
         }
         if(aFilterObject.percentLoadByPlanWork != null){
             number++;
             aFilterObject.percentLoadByPlanWork = aFilterObject.percentLoadByPlanWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.percentLoadByPlanWork);
         }
         if(aFilterObject.percentLoadByNotPlanWork != null){
             number++;
             aFilterObject.percentLoadByNotPlanWork = aFilterObject.percentLoadByNotPlanWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.percentLoadByNotPlanWork);
         }
         if(aFilterObject.percentBonus != null){
             number++;
             aFilterObject.percentBonus = aFilterObject.percentBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.percentBonus);
         }
         if(aFilterObject.coefficient != null){
             number++;
             aFilterObject.coefficient = aFilterObject.coefficient.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.coefficient);
         }
         if(aFilterObject.percentBonusForCharging != null){
             number++;
             aFilterObject.percentBonusForCharging = aFilterObject.percentBonusForCharging.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.percentBonusForCharging);
         }
         if(aFilterObject.countFactWorkedDays != null){
             number++;
             aFilterObject.countFactWorkedDays = aFilterObject.countFactWorkedDays.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.countFactWorkedDays);
         }

            if(aFilterObject.tradeCategoryId != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.tradeCategoryId);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
         if(aFilterObject.dateStart != null){
             number++;
             statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
         }
         if(aFilterObject.dateFinal != null){
             number++;
             statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
         }
         if(aFilterObject.noWayOutFromPeriod != null){
             number++;
             aFilterObject.noWayOutFromPeriod = aFilterObject.noWayOutFromPeriod.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.noWayOutFromPeriod);
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
         if(aFilterObject.modify_time != Long.MIN_VALUE){
             number++;
             if(aFilterObject.modify_time == Long.MIN_VALUE)
                 statement.setBigDecimal(number,null);
             else
                 statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
         }

            if(aFilterObject.reasonInvalid != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.reasonInvalid);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.userSetInvalid != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.userSetInvalid);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
         if(aFilterObject.dateSetInvalid != null){
             number++;
             statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateSetInvalid.getTime()));
         }
        if(aFilterObject.bonusList.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.bonusList.code);
        }
        if(aFilterObject.status.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.status.code);
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

         anObject = new ENBonusListItemShort();

         anObject.code = set.getInt(1);
         if ( set.wasNull() )
             anObject.code = Integer.MIN_VALUE;
         anObject.podrId = set.getString(2);
         anObject.podrName = set.getString(3);
         anObject.fio = set.getString(4);
         anObject.tabNumber = set.getString(5);
         anObject.positionId = set.getString(6);
         anObject.positionName = set.getString(7);
         anObject.fundWorkTime = set.getBigDecimal(8);
         if(anObject.fundWorkTime != null)
             anObject.fundWorkTime = anObject.fundWorkTime.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.workTimeFact = set.getBigDecimal(9);
         if(anObject.workTimeFact != null)
             anObject.workTimeFact = anObject.workTimeFact.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.hoursWorkedWithStaff = set.getBigDecimal(10);
         if(anObject.hoursWorkedWithStaff != null)
             anObject.hoursWorkedWithStaff = anObject.hoursWorkedWithStaff.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.timeDelivery = set.getBigDecimal(11);
         if(anObject.timeDelivery != null)
             anObject.timeDelivery = anObject.timeDelivery.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.hoursWorkedPlan = set.getBigDecimal(12);
         if(anObject.hoursWorkedPlan != null)
             anObject.hoursWorkedPlan = anObject.hoursWorkedPlan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.hoursWorkedNotPlan = set.getBigDecimal(13);
         if(anObject.hoursWorkedNotPlan != null)
             anObject.hoursWorkedNotPlan = anObject.hoursWorkedNotPlan.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.hoursWorkedSum = set.getBigDecimal(14);
         if(anObject.hoursWorkedSum != null)
             anObject.hoursWorkedSum = anObject.hoursWorkedSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.percentLoadWork = set.getBigDecimal(15);
         if(anObject.percentLoadWork != null)
             anObject.percentLoadWork = anObject.percentLoadWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.percentLoadByPlanWork = set.getBigDecimal(16);
         if(anObject.percentLoadByPlanWork != null)
             anObject.percentLoadByPlanWork = anObject.percentLoadByPlanWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.percentLoadByNotPlanWork = set.getBigDecimal(17);
         if(anObject.percentLoadByNotPlanWork != null)
             anObject.percentLoadByNotPlanWork = anObject.percentLoadByNotPlanWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.percentBonus = set.getBigDecimal(18);
         if(anObject.percentBonus != null)
             anObject.percentBonus = anObject.percentBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.coefficient = set.getBigDecimal(19);
         if(anObject.coefficient != null)
             anObject.coefficient = anObject.coefficient.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.percentBonusForCharging = set.getBigDecimal(20);
         if(anObject.percentBonusForCharging != null)
             anObject.percentBonusForCharging = anObject.percentBonusForCharging.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.countFactWorkedDays = set.getBigDecimal(21);
         if(anObject.countFactWorkedDays != null)
             anObject.countFactWorkedDays = anObject.countFactWorkedDays.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.tradeCategoryId = set.getString(22);
         anObject.dateStart = set.getDate(23);
         anObject.dateFinal = set.getDate(24);
         anObject.noWayOutFromPeriod = set.getBigDecimal(25);
         if(anObject.noWayOutFromPeriod != null)
             anObject.noWayOutFromPeriod = anObject.noWayOutFromPeriod.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.userAdd = set.getString(26);
         anObject.dateAdd = set.getTimestamp(27);
         anObject.userGen = set.getString(28);
         anObject.dateEdit = set.getTimestamp(29);
         anObject.reasonInvalid = set.getString(30);
         anObject.userSetInvalid = set.getString(31);
         anObject.dateSetInvalid = set.getTimestamp(32);

         anObject.bonusListCode = set.getInt(33);
     if(set.wasNull())
       anObject.bonusListCode = Integer.MIN_VALUE;
         anObject.bonusListNumberGen = set.getString(34);
         anObject.bonusListMonthGen = set.getInt(35);
     if(set.wasNull())
       anObject.bonusListMonthGen = Integer.MIN_VALUE;
         anObject.bonusListYearGen = set.getInt(36);
     if(set.wasNull())
       anObject.bonusListYearGen = Integer.MIN_VALUE;
         anObject.bonusListUserAdd = set.getString(37);
         anObject.bonusListDateAdd = set.getTimestamp(38);
         anObject.bonusListUserGen = set.getString(39);
         anObject.bonusListDateEdit = set.getTimestamp(40);
         anObject.statusCode = set.getInt(41);
     if(set.wasNull())
       anObject.statusCode = Integer.MIN_VALUE;
         anObject.statusName = set.getString(42);
         
     anObject.summaCompensation = set.getBigDecimal(43);
		if(anObject.summaCompensation != null) {
			anObject.summaCompensation = anObject.summaCompensation.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
		}
	 anObject.coefficientQuality = set.getBigDecimal(44);
	   if(anObject.coefficientQuality != null) {
	      anObject.coefficientQuality = anObject.coefficientQuality.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
	   }

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



} // end of ENBonusListItemDAO
