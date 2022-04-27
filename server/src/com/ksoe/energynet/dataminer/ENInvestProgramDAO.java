
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
import java.util.Date;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENInvestProgramDAOGen;
import com.ksoe.energynet.valueobject.ENInvestProgram;
import com.ksoe.energynet.valueobject.ENInvestProgramStatus;
import com.ksoe.energynet.valueobject.brief.ENInvestProgramShort;
import com.ksoe.energynet.valueobject.lists.ENInvestProgramShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENInvestProgram;
 *
 */

public class ENInvestProgramDAO extends ENInvestProgramDAOGen {

    public ENInvestProgramDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENInvestProgramDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    public int add(ENInvestProgram anObject) throws PersistenceException
    {
        anObject.userAdd = getUserProfile().userName;
        anObject.dateAdd = new Date();
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();

        if (anObject.statusRef == null)
        {
            anObject.statusRef.code = ENInvestProgramStatus.DRAFT;
        }

        if (anObject.statusRef.code == Integer.MIN_VALUE)
        {
            anObject.statusRef.code = ENInvestProgramStatus.DRAFT;
        }

        return super.add(anObject);
    }

    public void save(ENInvestProgram anObject) throws PersistenceException
    {
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();

        super.save(anObject);
    }

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

       ", (select ENELEMENTDATA.ENAME from ENELEMENTDATA where ENELEMENTDATA.ECODE = ENINVESTPROGRAM.ELEMENTREFCODE) " +
       ", (select ENELEMENTDATA.invnumber from ENELEMENTDATA where ENELEMENTDATA.ECODE = ENINVESTPROGRAM.ELEMENTREFCODE) " +

       ", ENINVESTPROGRAM.ITEMNUMBER " +
       ", ENINVESTPROGRAM.INVGROUPREFCODE " +
       ", (select ENINVESTPROGRAMGROUPS.NAME from ENINVESTPROGRAMGROUPS where ENINVESTPROGRAMGROUPS.CODE = ENINVESTPROGRAM.INVGROUPREFCODE) " +
       ", (select ENINVESTPROGRAMGROUPS.COMMENTGEN from ENINVESTPROGRAMGROUPS where ENINVESTPROGRAMGROUPS.CODE = ENINVESTPROGRAM.INVGROUPREFCODE) " +

      " FROM ENINVESTPROGRAM " +
      ", TKMEASUREMENT " +
      ", ENELEMENT " +
      ", ENDEPARTMENT " +
      ", ENINVESTPROGRAMSTATUS " +
      ", ENINVESTOBJECTTYPE " +
      ", ENPLANWORKTYPE " +
      //" WHERE "
    "";
      whereStr = " TKMEASUREMENT.CODE = ENINVESTPROGRAM.MEASUREMENTCODE" ; //+
       whereStr = whereStr +" AND ENELEMENT.CODE = ENINVESTPROGRAM.ELEMENTREFCODE" ; //+
       whereStr = whereStr +" AND ENDEPARTMENT.CODE = ENINVESTPROGRAM.BUDGETREFCODE" ; //+
       whereStr = whereStr +" AND ENINVESTPROGRAMSTATUS.CODE = ENINVESTPROGRAM.STATUSREFCODE" ; //+
       whereStr = whereStr +" AND ENINVESTOBJECTTYPE.CODE = ENINVESTPROGRAM.OBJECTTYPEREFCODE" ; //+
       whereStr = whereStr +" AND ENPLANWORKTYPE.CODE = ENINVESTPROGRAM.PLANTYPEREFCODE" ; //+
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

         if (aFilterObject.itemNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.itemNumber.indexOf('*',0) < 0 && aFilterObject.itemNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENINVESTPROGRAM.ITEMNUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENINVESTPROGRAM.ITEMNUMBER) LIKE UPPER(?)";
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
             aFilterObject.countGen = aFilterObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.countGen);
         }
         if(aFilterObject.price != null){
             number++;
             aFilterObject.price = aFilterObject.price.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.price);
         }
         if(aFilterObject.sumGen != null){
             number++;
             aFilterObject.sumGen = aFilterObject.sumGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.sumGen);
         }
         if(aFilterObject.quarter1count != null){
             number++;
             aFilterObject.quarter1count = aFilterObject.quarter1count.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.quarter1count);
         }
         if(aFilterObject.quarter1sum != null){
             number++;
             aFilterObject.quarter1sum = aFilterObject.quarter1sum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.quarter1sum);
         }
         if(aFilterObject.quarter2count != null){
             number++;
             aFilterObject.quarter2count = aFilterObject.quarter2count.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.quarter2count);
         }
         if(aFilterObject.quarter2sum != null){
             number++;
             aFilterObject.quarter2sum = aFilterObject.quarter2sum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.quarter2sum);
         }
         if(aFilterObject.quarter3count != null){
             number++;
             aFilterObject.quarter3count = aFilterObject.quarter3count.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.quarter3count);
         }
         if(aFilterObject.quarter3sum != null){
             number++;
             aFilterObject.quarter3sum = aFilterObject.quarter3sum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.quarter3sum);
         }
         if(aFilterObject.quarter4count != null){
             number++;
             aFilterObject.quarter4count = aFilterObject.quarter4count.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.quarter4count);
         }
         if(aFilterObject.quarter4sum != null){
             number++;
             aFilterObject.quarter4sum = aFilterObject.quarter4sum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
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
        /*
         if(i < fromPosition)
          continue;
         else if(i >= fromPosition + quantity)
          {
           i++;
           break;
          }
          */

         anObject = new ENInvestProgramShort();

         anObject.code = set.getInt(1);
         if ( set.wasNull() )
             anObject.code = Integer.MIN_VALUE;
         anObject.name = set.getString(2);
         anObject.yearGen = set.getInt(3);
         if ( set.wasNull() )
             anObject.yearGen = Integer.MIN_VALUE;
         anObject.commentGen = set.getString(4);
         anObject.countGen = set.getBigDecimal(5);
         if(anObject.countGen != null)
             anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.price = set.getBigDecimal(6);
         if(anObject.price != null)
             anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.sumGen = set.getBigDecimal(7);
         if(anObject.sumGen != null)
             anObject.sumGen = anObject.sumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.quarter1count = set.getBigDecimal(8);
         if(anObject.quarter1count != null)
             anObject.quarter1count = anObject.quarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.quarter1sum = set.getBigDecimal(9);
         if(anObject.quarter1sum != null)
             anObject.quarter1sum = anObject.quarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.quarter2count = set.getBigDecimal(10);
         if(anObject.quarter2count != null)
             anObject.quarter2count = anObject.quarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.quarter2sum = set.getBigDecimal(11);
         if(anObject.quarter2sum != null)
             anObject.quarter2sum = anObject.quarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.quarter3count = set.getBigDecimal(12);
         if(anObject.quarter3count != null)
             anObject.quarter3count = anObject.quarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.quarter3sum = set.getBigDecimal(13);
         if(anObject.quarter3sum != null)
             anObject.quarter3sum = anObject.quarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.quarter4count = set.getBigDecimal(14);
         if(anObject.quarter4count != null)
             anObject.quarter4count = anObject.quarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.quarter4sum = set.getBigDecimal(15);
         if(anObject.quarter4sum != null)
             anObject.quarter4sum = anObject.quarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.userAdd = set.getString(16);
         anObject.dateAdd = set.getTimestamp(17);
         anObject.userGen = set.getString(18);
         anObject.dateEdit = set.getTimestamp(19);

         anObject.measurementCode = set.getInt(20);
        if(set.wasNull())
            anObject.measurementCode = Integer.MIN_VALUE;
         anObject.measurementName = set.getString(21);
         anObject.elementRefCode = set.getInt(22);
        if(set.wasNull())
            anObject.elementRefCode = Integer.MIN_VALUE;
         anObject.budgetRefCode = set.getInt(23);
        if(set.wasNull())
            anObject.budgetRefCode = Integer.MIN_VALUE;
         anObject.budgetRefShortName = set.getString(24);
         anObject.budgetRefDateStart = set.getDate(25);
         anObject.budgetRefDateFinal = set.getDate(26);
         anObject.budgetRefRenCode = set.getInt(27);
        if(set.wasNull())
            anObject.budgetRefRenCode = Integer.MIN_VALUE;
         anObject.budgetRefShpzBalans = set.getString(28);
         anObject.budgetRefKau_table_id_1884 = set.getInt(29);
        if(set.wasNull())
            anObject.budgetRefKau_table_id_1884 = Integer.MIN_VALUE;
         anObject.budgetRefKau_1884 = set.getString(30);
         anObject.budgetRefName_1884 = set.getString(31);
         anObject.statusRefCode = set.getInt(32);
        if(set.wasNull())
            anObject.statusRefCode = Integer.MIN_VALUE;
         anObject.statusRefName = set.getString(33);
         anObject.objectTypeRefCode = set.getInt(34);
        if(set.wasNull())
            anObject.objectTypeRefCode = Integer.MIN_VALUE;
         anObject.objectTypeRefName = set.getString(35);
         anObject.planTypeRefCode = set.getInt(36);
        if(set.wasNull())
            anObject.planTypeRefCode = Integer.MIN_VALUE;
         anObject.planTypeRefName = set.getString(37);
         anObject.planTypeRefShortName = set.getString(38);

         anObject.elementRefName = set.getString(39);
         anObject.invNumber = set.getString(40);

         anObject.itemNumber = set.getString(41);
         anObject.invGroupRefCode = set.getInt(42);
        if(set.wasNull())
            anObject.invGroupRefCode = Integer.MIN_VALUE;
         anObject.invGroupRefName = set.getString(43);
         anObject.invGroupRefCommentgen = set.getString(44);

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


} // end of ENInvestProgramDAO
