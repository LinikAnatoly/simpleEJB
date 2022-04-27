
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENIPItemDAOGen;
import com.ksoe.energynet.valueobject.ENIPItem;
import com.ksoe.energynet.valueobject.brief.ENIPItemShort;
import com.ksoe.energynet.valueobject.lists.ENIPItemShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENIPItem;
 *
 */

public class ENIPItemDAO extends ENIPItemDAOGen {

    public ENIPItemDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENIPItemDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    public int add(ENIPItem anObject) throws PersistenceException
    {
    	anObject.countGenInside = new BigDecimal(0);
    	anObject.priceInside = new BigDecimal(0);
    	anObject.sumGenInside = new BigDecimal(0);
    	anObject.mm1countInside = new BigDecimal(0);
    	anObject.mm1sumInside = new BigDecimal(0);

    	anObject.mm2countInside = new BigDecimal(0);
    	anObject.mm2sumInside = new BigDecimal(0);
    	anObject.mm3countInside = new BigDecimal(0);
    	anObject.mm3sumInside = new BigDecimal(0);
    	anObject.mm4countInside = new BigDecimal(0);
    	anObject.mm4sumInside = new BigDecimal(0);
    	anObject.mm5countInside = new BigDecimal(0);
    	anObject.mm5sumInside = new BigDecimal(0);
    	anObject.mm6countInside = new BigDecimal(0);
    	anObject.mm6sumInside = new BigDecimal(0);
    	anObject.mm7countInside = new BigDecimal(0);
    	anObject.mm7sumInside = new BigDecimal(0);
    	anObject.mm8countInside = new BigDecimal(0);
    	anObject.mm8sumInside = new BigDecimal(0);
    	anObject.mm9countInside = new BigDecimal(0);
    	anObject.mm9sumInside = new BigDecimal(0);
    	anObject.mm10countInside = new BigDecimal(0);
    	anObject.mm10sumInside = new BigDecimal(0);
    	anObject.mm11countInside = new BigDecimal(0);
    	anObject.mm11sumInside = new BigDecimal(0);
    	anObject.mm12countInside = new BigDecimal(0);
    	anObject.mm12sumInside = new BigDecimal(0);


    	anObject.userAdd = getUserProfile().userName;
        anObject.dateAdd = new Date();
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();

        return super.add(anObject);
    }

    public void save(ENIPItem anObject) throws PersistenceException
    {
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();

        this.save(anObject,null);
    }

    public ENIPItemShortList getScrollableFilteredList(ENIPItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
     ENIPItemShortList result = new ENIPItemShortList();
     ENIPItemShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     whereStr = "";
     String     condition = processCondition(anCondition);
     String     orderBy = processCondition(anOrderBy);

     if(orderBy.length() == 0)
      orderBy = "ENIPITEM.CODE";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr = "SELECT "+
      "ENIPITEM.CODE"+
      ",ENIPITEM.NAME"+
      ",ENIPITEM.BUHNAME"+
      ",ENIPITEM.ITEMNUMBER"+
      ",ENIPITEM.INVNUMBER"+
      ",ENIPITEM.ISPROJECTDOCUMENT"+
      ",ENIPITEM.financing"+
      ",ENIPITEM.COMMENTGEN"+

      ",coalesce(ENIPITEM.COUNTGEN,0)"+
      ",coalesce(ENIPITEM.PRICE,0)"+
      ",coalesce(ENIPITEM.SUMGEN,0)"+
      ",coalesce(ENIPITEM.QUARTER1COUNT,0)"+
      ",coalesce(ENIPITEM.QUARTER1SUM,0)"+
      ",coalesce(ENIPITEM.QUARTER2COUNT,0)"+
      ",coalesce(ENIPITEM.QUARTER2SUM,0)"+
      ",coalesce(ENIPITEM.QUARTER3COUNT,0)"+
      ",coalesce(ENIPITEM.QUARTER3SUM,0)"+
      ",coalesce(ENIPITEM.QUARTER4COUNT,0)"+
      ",coalesce(ENIPITEM.QUARTER4SUM,0)"+

      ",ENIPITEM.USERADD"+
      ",ENIPITEM.DATEADD"+
      ",ENIPITEM.USERGEN"+
      ",ENIPITEM.DATEEDIT"+

       ", TKMEASUREMENT.CODE " +
       ", TKMEASUREMENT.NAME " +
       ", ENIPITEMSTATUS.CODE " +
       ", ENIPITEMSTATUS.NAME " +
       ", ENINVESTPROGRAMGROUPS.CODE " +
       ", ENINVESTPROGRAMGROUPS.NAME " +
       ", ENINVESTPROGRAMGROUPS.COMMENTGEN " +
       ", EPREN.CODE " +
       ", EPREN.NAME " +
       ", ENIPPURPOSEPROGRAM.CODE " +
       ", ENIPPURPOSEPROGRAM.NAME " +
       ", ENIP.CODE " +
       ", ENIP.NAME " +
       ", ENIP.YEARGEN " +
       ", ENIP.VERSION " +
       ", ENIP.COMMENTGEN " +
       ", ENIP.DATEADD " +
       ", ENIP.DATEEDIT " +
       ", ENIP.USERADD " +
       ", ENIP.USEREDIT " +
       ", ENIPITEM.CODE " +
       ", ENIPITEM.NAME " +
       ", ENIPITEM.BUHNAME " +
       ", ENIPITEM.ITEMNUMBER " +
       ", ENIPITEM.INVNUMBER " +
       ", ENIPITEM.ISPROJECTDOCUMENT " +
       ", ENIPITEM.financing " +
       ", ENIPITEM.COMMENTGEN " +

		",coalesce(ENIPITEM.COUNTGEN,0)"+
		",coalesce(ENIPITEM.PRICE,0)"+
		",coalesce(ENIPITEM.SUMGEN,0)"+
		",coalesce(ENIPITEM.QUARTER1COUNT,0)"+
		",coalesce(ENIPITEM.QUARTER1SUM,0)"+
		",coalesce(ENIPITEM.QUARTER2COUNT,0)"+
		",coalesce(ENIPITEM.QUARTER2SUM,0)"+
		",coalesce(ENIPITEM.QUARTER3COUNT,0)"+
		",coalesce(ENIPITEM.QUARTER3SUM,0)"+
		",coalesce(ENIPITEM.QUARTER4COUNT,0)"+
		",coalesce(ENIPITEM.QUARTER4SUM,0)"+

       ", ENIPITEM.USERADD " +
       ", ENIPITEM.DATEADD " +
       ", ENIPITEM.USERGEN " +
       ", ENIPITEM.DATEEDIT " +
       ", ENMETHODEXECUTEWORK.CODE " +
       ", ENMETHODEXECUTEWORK.NAME " +
     //------
     ",coalesce(ENIPITEM.COUNTGENINSIDE,0)"+
     ",coalesce(ENIPITEM.PRICEINSIDE,0)"+
     ",coalesce(ENIPITEM.SUMGENINSIDE,0)"+
     ",coalesce(ENIPITEM.MM1COUNTINSIDE,0)"+
     ",coalesce(ENIPITEM.MM1SUMINSIDE,0)"+
     ",coalesce(ENIPITEM.MM2COUNTINSIDE,0)"+
     ",coalesce(ENIPITEM.MM2SUMINSIDE,0)"+
     ",coalesce(ENIPITEM.MM3COUNTINSIDE,0)"+
     ",coalesce(ENIPITEM.MM3SUMINSIDE,0)"+
     ",coalesce(ENIPITEM.MM4COUNTINSIDE,0)"+
     ",coalesce(ENIPITEM.MM4SUMINSIDE,0)"+
     ",coalesce(ENIPITEM.MM5COUNTINSIDE,0)"+
     ",coalesce(ENIPITEM.MM5SUMINSIDE,0)"+
     ",coalesce(ENIPITEM.MM6COUNTINSIDE,0)"+
     ",coalesce(ENIPITEM.MM6SUMINSIDE,0)"+
     ",coalesce(ENIPITEM.MM7COUNTINSIDE,0)"+
     ",coalesce(ENIPITEM.MM7SUMINSIDE,0)"+
     ",coalesce(ENIPITEM.MM8COUNTINSIDE,0)"+
     ",coalesce(ENIPITEM.MM8SUMINSIDE,0)"+
     ",coalesce(ENIPITEM.MM9COUNTINSIDE,0)"+
     ",coalesce(ENIPITEM.MM9SUMINSIDE,0)"+
     ",coalesce(ENIPITEM.MM10COUNTINSIDE,0)"+
     ",coalesce(ENIPITEM.MM10SUMINSIDE,0)"+
     ",coalesce(ENIPITEM.MM11COUNTINSIDE,0)"+
     ",coalesce(ENIPITEM.MM11SUMINSIDE,0)"+
     ",coalesce(ENIPITEM.MM12COUNTINSIDE,0)"+
     ",coalesce(ENIPITEM.MM12SUMINSIDE,0)"+

      ", (select ENIPIMPLEMENTATIONTYPE.CODE from ENIPIMPLEMENTATIONTYPE where ENIPIMPLEMENTATIONTYPE.CODE = ENIPITEM.IPIMPLEMENTTYPEREFCODE)" +
      ", (select ENIPIMPLEMENTATIONTYPE.NAME from ENIPIMPLEMENTATIONTYPE where ENIPIMPLEMENTATIONTYPE.CODE = ENIPITEM.IPIMPLEMENTTYPEREFCODE)" +
      ", ENIPITEM.INFOTENDERS " +
      " FROM ENIPITEM left join EPREN on EPREN.CODE = ENIPITEM.RENREFCODE " +
      ", TKMEASUREMENT " +
      ", ENIPITEMSTATUS " +
      ", ENINVESTPROGRAMGROUPS " +

      ", ENIPPURPOSEPROGRAM " +
      ", ENIP " +
      ///", ENIPITEM " +
      ", ENMETHODEXECUTEWORK " +
      //" WHERE "
 	"";
      whereStr = " TKMEASUREMENT.CODE = ENIPITEM.MEASUREMENTCODE" ; //+
       whereStr = whereStr +" AND ENIPITEMSTATUS.CODE = ENIPITEM.STATUSREFCODE" ; //+
       whereStr = whereStr +" AND ENINVESTPROGRAMGROUPS.CODE = ENIPITEM.INVGROUPREFCODE" ; //+
      // whereStr = whereStr +" AND EPREN.CODE = ENIPITEM.RENREFCODE" ; //+
       whereStr = whereStr +" AND ENIPPURPOSEPROGRAM.CODE = ENIPITEM.PURPOSEPROGRAMREFCODE" ; //+
       whereStr = whereStr +" AND ENIP.CODE = ENIPITEM.IPREFCODE" ; //+
      // whereStr = whereStr +" AND ENIPITEM.CODE = ENIPITEM.PARENTREFCODE" ; //+
       whereStr = whereStr +" AND ENMETHODEXECUTEWORK.CODE = ENIPITEM.METHODEXECWORKREFCODE" ; //+
 		//selectStr = selectStr + " ${s} ENIPITEM.CODE IN ( SELECT ENIPITEM.CODE FROM ENIPITEM ";

 // " ";
       if(aFilterObject != null)
       {
         if(aFilterObject.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENIPITEM.CODE = ?";
         }
          if (aFilterObject.name != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENIPITEM.NAME) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENIPITEM.NAME) LIKE UPPER(?)";
          }
          if (aFilterObject.buhName != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.buhName.indexOf('*',0) < 0 && aFilterObject.buhName.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENIPITEM.BUHNAME) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENIPITEM.BUHNAME) LIKE UPPER(?)";
          }
          if (aFilterObject.itemNumber != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.itemNumber.indexOf('*',0) < 0 && aFilterObject.itemNumber.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENIPITEM.ITEMNUMBER) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENIPITEM.ITEMNUMBER) LIKE UPPER(?)";
          }
          if (aFilterObject.invNumber != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.invNumber.indexOf('*',0) < 0 && aFilterObject.invNumber.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENIPITEM.INVNUMBER) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENIPITEM.INVNUMBER) LIKE UPPER(?)";
          }
         if(aFilterObject.isProjectDocument != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENIPITEM.ISPROJECTDOCUMENT = ?";
         }
          if (aFilterObject.financing != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.financing.indexOf('*',0) < 0 && aFilterObject.financing.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENIPITEM.FINANCING) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENIPITEM.FINANCING) LIKE UPPER(?)";
          }
          if (aFilterObject.commentGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENIPITEM.COMMENTGEN) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENIPITEM.COMMENTGEN) LIKE UPPER(?)";
          }
         if(aFilterObject.countGen != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENIPITEM.COUNTGEN = ?";
         }
         if(aFilterObject.price != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENIPITEM.PRICE = ?";
         }
         if(aFilterObject.sumGen != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENIPITEM.SUMGEN = ?";
         }
         if(aFilterObject.quarter1count != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENIPITEM.QUARTER1COUNT = ?";
         }
         if(aFilterObject.quarter1sum != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENIPITEM.QUARTER1SUM = ?";
         }
         if(aFilterObject.quarter2count != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENIPITEM.QUARTER2COUNT = ?";
         }
         if(aFilterObject.quarter2sum != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENIPITEM.QUARTER2SUM = ?";
         }
         if(aFilterObject.quarter3count != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENIPITEM.QUARTER3COUNT = ?";
         }
         if(aFilterObject.quarter3sum != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENIPITEM.QUARTER3SUM = ?";
         }
         if(aFilterObject.quarter4count != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENIPITEM.QUARTER4COUNT = ?";
         }
         if(aFilterObject.quarter4sum != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENIPITEM.QUARTER4SUM = ?";
         }
         if(aFilterObject.modify_time != Long.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENIPITEM.MODIFY_TIME = ?";
         }
          if (aFilterObject.userAdd != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENIPITEM.USERADD) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENIPITEM.USERADD) LIKE UPPER(?)";
          }
         if(aFilterObject.dateAdd != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENIPITEM.DATEADD = ?";
         }
          if (aFilterObject.userGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENIPITEM.USERGEN) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENIPITEM.USERGEN) LIKE UPPER(?)";
          }
         if(aFilterObject.dateEdit != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENIPITEM.DATEEDIT = ?";
         }
         if(aFilterObject.measurement.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENIPITEM.MEASUREMENTCODE = ? ";
         }
         if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENIPITEM.STATUSREFCODE = ? ";
         }
         if(aFilterObject.invGroupRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENIPITEM.INVGROUPREFCODE = ? ";
         }
         if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENIPITEM.RENREFCODE = ? ";
         }
         if(aFilterObject.purposeProgramRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENIPITEM.PURPOSEPROGRAMREFCODE = ? ";
         }
         if(aFilterObject.ipRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENIPITEM.IPREFCODE = ? ";
         }
         if(aFilterObject.parentRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENIPITEM.PARENTREFCODE = ? ";
         }
         if(aFilterObject.methodExecWorkRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENIPITEM.METHODEXECWORKREFCODE = ? ";
         }
         if(aFilterObject.ipImplementTypeRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENIPITEM.IPIMPLEMENTTYPEREFCODE = ? ";
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

            if(aFilterObject.buhName != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.buhName);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
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

            if(aFilterObject.invNumber != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.invNumber);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
          if(aFilterObject.isProjectDocument != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.isProjectDocument);
          }

            if(aFilterObject.financing != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.financing);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
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
             aFilterObject.countGen = aFilterObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.countGen);
         }
         if(aFilterObject.price != null){
             number++;
             aFilterObject.price = aFilterObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.price);
         }
         if(aFilterObject.sumGen != null){
             number++;
             aFilterObject.sumGen = aFilterObject.sumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.sumGen);
         }
         if(aFilterObject.quarter1count != null){
             number++;
             aFilterObject.quarter1count = aFilterObject.quarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.quarter1count);
         }
         if(aFilterObject.quarter1sum != null){
             number++;
             aFilterObject.quarter1sum = aFilterObject.quarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.quarter1sum);
         }
         if(aFilterObject.quarter2count != null){
             number++;
             aFilterObject.quarter2count = aFilterObject.quarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.quarter2count);
         }
         if(aFilterObject.quarter2sum != null){
             number++;
             aFilterObject.quarter2sum = aFilterObject.quarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.quarter2sum);
         }
         if(aFilterObject.quarter3count != null){
             number++;
             aFilterObject.quarter3count = aFilterObject.quarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.quarter3count);
         }
         if(aFilterObject.quarter3sum != null){
             number++;
             aFilterObject.quarter3sum = aFilterObject.quarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.quarter3sum);
         }
         if(aFilterObject.quarter4count != null){
             number++;
             aFilterObject.quarter4count = aFilterObject.quarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.quarter4count);
         }
         if(aFilterObject.quarter4sum != null){
             number++;
             aFilterObject.quarter4sum = aFilterObject.quarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
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
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.statusRef.code);
        }
        if(aFilterObject.invGroupRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.invGroupRef.code);
        }
        if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.renRef.code);
        }
        if(aFilterObject.purposeProgramRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.purposeProgramRef.code);
        }
        if(aFilterObject.ipRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.ipRef.code);
        }
        if(aFilterObject.parentRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.parentRef.code);
        }
        if(aFilterObject.methodExecWorkRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.methodExecWorkRef.code);
        }
        if(aFilterObject.ipImplementTypeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.ipImplementTypeRef.code);
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

         anObject = new ENIPItemShort();

         anObject.code = set.getInt(1);
         if ( set.wasNull() )
             anObject.code = Integer.MIN_VALUE;
         anObject.name = set.getString(2);
         anObject.buhName = set.getString(3);
         anObject.itemNumber = set.getString(4);
         anObject.invNumber = set.getString(5);
         anObject.isProjectDocument = set.getInt(6);
         if ( set.wasNull() )
             anObject.isProjectDocument = Integer.MIN_VALUE;
         anObject.financing = set.getString(7);
         anObject.commentGen = set.getString(8);
         anObject.countGen = set.getBigDecimal(9);
         if(anObject.countGen != null)
             anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.price = set.getBigDecimal(10);
         if(anObject.price != null)
             anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.sumGen = set.getBigDecimal(11);
         if(anObject.sumGen != null)
             anObject.sumGen = anObject.sumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.quarter1count = set.getBigDecimal(12);
         if(anObject.quarter1count != null)
             anObject.quarter1count = anObject.quarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.quarter1sum = set.getBigDecimal(13);
         if(anObject.quarter1sum != null)
             anObject.quarter1sum = anObject.quarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.quarter2count = set.getBigDecimal(14);
         if(anObject.quarter2count != null)
             anObject.quarter2count = anObject.quarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.quarter2sum = set.getBigDecimal(15);
         if(anObject.quarter2sum != null)
             anObject.quarter2sum = anObject.quarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.quarter3count = set.getBigDecimal(16);
         if(anObject.quarter3count != null)
             anObject.quarter3count = anObject.quarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.quarter3sum = set.getBigDecimal(17);
         if(anObject.quarter3sum != null)
             anObject.quarter3sum = anObject.quarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.quarter4count = set.getBigDecimal(18);
         if(anObject.quarter4count != null)
             anObject.quarter4count = anObject.quarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.quarter4sum = set.getBigDecimal(19);
         if(anObject.quarter4sum != null)
             anObject.quarter4sum = anObject.quarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.userAdd = set.getString(20);
         anObject.dateAdd = set.getTimestamp(21);
         anObject.userGen = set.getString(22);
         anObject.dateEdit = set.getTimestamp(23);

         anObject.measurementCode = set.getInt(24);
 		if(set.wasNull())
 		   anObject.measurementCode = Integer.MIN_VALUE;
         anObject.measurementName = set.getString(25);
         anObject.statusRefCode = set.getInt(26);
 		if(set.wasNull())
 		   anObject.statusRefCode = Integer.MIN_VALUE;
         anObject.statusRefName = set.getString(27);
         anObject.invGroupRefCode = set.getInt(28);
 		if(set.wasNull())
 		   anObject.invGroupRefCode = Integer.MIN_VALUE;
         anObject.invGroupRefName = set.getString(29);
         anObject.invGroupRefCommentgen = set.getString(30);
         anObject.renRefCode = set.getInt(31);
 		if(set.wasNull())
 		   anObject.renRefCode = Integer.MIN_VALUE;
         anObject.renRefName = set.getString(32);
         anObject.purposeProgramRefCode = set.getInt(33);
 		if(set.wasNull())
 		   anObject.purposeProgramRefCode = Integer.MIN_VALUE;
         anObject.purposeProgramRefName = set.getString(34);
         anObject.ipRefCode = set.getInt(35);
 		if(set.wasNull())
 		   anObject.ipRefCode = Integer.MIN_VALUE;
         anObject.ipRefName = set.getString(36);
         anObject.ipRefYearGen = set.getInt(37);
 		if(set.wasNull())
 		   anObject.ipRefYearGen = Integer.MIN_VALUE;
         anObject.ipRefVersion = set.getInt(38);
 		if(set.wasNull())
 		   anObject.ipRefVersion = Integer.MIN_VALUE;
         anObject.ipRefCommentGen = set.getString(39);
         anObject.ipRefDateAdd = set.getTimestamp(40);
         anObject.ipRefDateEdit = set.getTimestamp(41);
         anObject.ipRefUserAdd = set.getString(42);
         anObject.ipRefUserEdit = set.getString(43);
         anObject.parentRefCode = set.getInt(44);
 		if(set.wasNull())
 		   anObject.parentRefCode = Integer.MIN_VALUE;
         anObject.parentRefName = set.getString(45);
         anObject.parentRefBuhName = set.getString(46);
         anObject.parentRefItemNumber = set.getString(47);
         anObject.parentRefInvNumber = set.getString(48);
         anObject.parentRefIsProjectDocument = set.getInt(49);
 		if(set.wasNull())
 		   anObject.parentRefIsProjectDocument = Integer.MIN_VALUE;
         anObject.parentRefFinancing = set.getString(50);
         anObject.parentRefCommentGen = set.getString(51);
         anObject.parentRefCountGen = set.getBigDecimal(52);
         if(anObject.parentRefCountGen != null)
           anObject.parentRefCountGen = anObject.parentRefCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.parentRefPrice = set.getBigDecimal(53);
         if(anObject.parentRefPrice != null)
           anObject.parentRefPrice = anObject.parentRefPrice.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.parentRefSumGen = set.getBigDecimal(54);
         if(anObject.parentRefSumGen != null)
           anObject.parentRefSumGen = anObject.parentRefSumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.parentRefQuarter1count = set.getBigDecimal(55);
         if(anObject.parentRefQuarter1count != null)
           anObject.parentRefQuarter1count = anObject.parentRefQuarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.parentRefQuarter1sum = set.getBigDecimal(56);
         if(anObject.parentRefQuarter1sum != null)
           anObject.parentRefQuarter1sum = anObject.parentRefQuarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.parentRefQuarter2count = set.getBigDecimal(57);
         if(anObject.parentRefQuarter2count != null)
           anObject.parentRefQuarter2count = anObject.parentRefQuarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.parentRefQuarter2sum = set.getBigDecimal(58);
         if(anObject.parentRefQuarter2sum != null)
           anObject.parentRefQuarter2sum = anObject.parentRefQuarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.parentRefQuarter3count = set.getBigDecimal(59);
         if(anObject.parentRefQuarter3count != null)
           anObject.parentRefQuarter3count = anObject.parentRefQuarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.parentRefQuarter3sum = set.getBigDecimal(60);
         if(anObject.parentRefQuarter3sum != null)
           anObject.parentRefQuarter3sum = anObject.parentRefQuarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.parentRefQuarter4count = set.getBigDecimal(61);
         if(anObject.parentRefQuarter4count != null)
           anObject.parentRefQuarter4count = anObject.parentRefQuarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.parentRefQuarter4sum = set.getBigDecimal(62);
         if(anObject.parentRefQuarter4sum != null)
           anObject.parentRefQuarter4sum = anObject.parentRefQuarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.parentRefUserAdd = set.getString(63);
         anObject.parentRefDateAdd = set.getTimestamp(64);
         anObject.parentRefUserGen = set.getString(65);
         anObject.parentRefDateEdit = set.getTimestamp(66);
         anObject.methodExecWorkRefCode = set.getInt(67);
 		if(set.wasNull())
 		   anObject.methodExecWorkRefCode = Integer.MIN_VALUE;
         anObject.methodExecWorkRefName = set.getString(68);


         anObject.countGenInside = set.getBigDecimal(69);
         if(anObject.countGenInside != null)
             anObject.countGenInside = anObject.countGenInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.priceInside = set.getBigDecimal(70);
         if(anObject.priceInside != null)
             anObject.priceInside = anObject.priceInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.sumGenInside = set.getBigDecimal(71);
         if(anObject.sumGenInside != null)
             anObject.sumGenInside = anObject.sumGenInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.mm1countInside = set.getBigDecimal(72);
         if(anObject.mm1countInside != null)
             anObject.mm1countInside = anObject.mm1countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.mm1sumInside = set.getBigDecimal(73);
         if(anObject.mm1sumInside != null)
             anObject.mm1sumInside = anObject.mm1sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.mm2countInside = set.getBigDecimal(74);
         if(anObject.mm2countInside != null)
             anObject.mm2countInside = anObject.mm2countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.mm2sumInside = set.getBigDecimal(75);
         if(anObject.mm2sumInside != null)
             anObject.mm2sumInside = anObject.mm2sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.mm3countInside = set.getBigDecimal(76);
         if(anObject.mm3countInside != null)
             anObject.mm3countInside = anObject.mm3countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.mm3sumInside = set.getBigDecimal(77);
         if(anObject.mm3sumInside != null)
             anObject.mm3sumInside = anObject.mm3sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.mm4countInside = set.getBigDecimal(78);
         if(anObject.mm4countInside != null)
             anObject.mm4countInside = anObject.mm4countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.mm4sumInside = set.getBigDecimal(79);
         if(anObject.mm4sumInside != null)
             anObject.mm4sumInside = anObject.mm4sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.mm5countInside = set.getBigDecimal(80);
         if(anObject.mm5countInside != null)
             anObject.mm5countInside = anObject.mm5countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.mm5sumInside = set.getBigDecimal(81);
         if(anObject.mm5sumInside != null)
             anObject.mm5sumInside = anObject.mm5sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.mm6countInside = set.getBigDecimal(82);
         if(anObject.mm6countInside != null)
             anObject.mm6countInside = anObject.mm6countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.mm6sumInside = set.getBigDecimal(83);
         if(anObject.mm6sumInside != null)
             anObject.mm6sumInside = anObject.mm6sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.mm7countInside = set.getBigDecimal(84);
         if(anObject.mm7countInside != null)
             anObject.mm7countInside = anObject.mm7countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.mm7sumInside = set.getBigDecimal(85);
         if(anObject.mm7sumInside != null)
             anObject.mm7sumInside = anObject.mm7sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.mm8countInside = set.getBigDecimal(86);
         if(anObject.mm8countInside != null)
             anObject.mm8countInside = anObject.mm8countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.mm8sumInside = set.getBigDecimal(87);
         if(anObject.mm8sumInside != null)
             anObject.mm8sumInside = anObject.mm8sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.mm9countInside = set.getBigDecimal(88);
         if(anObject.mm9countInside != null)
             anObject.mm9countInside = anObject.mm9countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.mm9sumInside = set.getBigDecimal(89);
         if(anObject.mm9sumInside != null)
             anObject.mm9sumInside = anObject.mm9sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.mm10countInside = set.getBigDecimal(90);
         if(anObject.mm10countInside != null)
             anObject.mm10countInside = anObject.mm10countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.mm10sumInside = set.getBigDecimal(91);
         if(anObject.mm10sumInside != null)
             anObject.mm10sumInside = anObject.mm10sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.mm11countInside = set.getBigDecimal(92);
         if(anObject.mm11countInside != null)
             anObject.mm11countInside = anObject.mm11countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.mm11sumInside = set.getBigDecimal(93);
         if(anObject.mm11sumInside != null)
             anObject.mm11sumInside = anObject.mm11sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.mm12countInside = set.getBigDecimal(94);
         if(anObject.mm12countInside != null)
             anObject.mm12countInside = anObject.mm12countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.mm12sumInside = set.getBigDecimal(95);
         if(anObject.mm12sumInside != null)
             anObject.mm12sumInside = anObject.mm12sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

         anObject.ipImplementTypeRefCode = set.getInt(96);
         if(set.wasNull())
           anObject.ipImplementTypeRefCode = Integer.MIN_VALUE;

         anObject.ipImplementTypeRefName = set.getString(97);

         anObject.infoTenders = set.getString(98);

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

    /** изменение сумм для финансирования  */
    public void saveSumInside(ENIPItem anObject) throws PersistenceException
    {

    	Connection connection = getConnection();
     try
      {
       PreparedStatement statement = null;

       ENIPItem oldObject = new ENIPItem();
       oldObject.code = anObject.code;
       String selectStr = "";


       Vector fields = null;

       if(fields == null)
        {
         selectStr =
         "UPDATE ENIPITEM SET  COUNTGENINSIDE = ? , PRICEINSIDE = ? , SUMGENINSIDE = ? , MM1COUNTINSIDE = ? , MM1SUMINSIDE = ? , MM2COUNTINSIDE = ? , MM2SUMINSIDE = ? , MM3COUNTINSIDE = ? , MM3SUMINSIDE = ? , MM4COUNTINSIDE = ? , MM4SUMINSIDE = ? , MM5COUNTINSIDE = ? , MM5SUMINSIDE = ? , MM6COUNTINSIDE = ? , MM6SUMINSIDE = ? , MM7COUNTINSIDE = ? , MM7SUMINSIDE = ? , MM8COUNTINSIDE = ? , MM8SUMINSIDE = ? , MM9COUNTINSIDE = ? , MM9SUMINSIDE = ? , MM10COUNTINSIDE = ? , MM10SUMINSIDE = ? , MM11COUNTINSIDE = ? , MM11SUMINSIDE = ? , MM12COUNTINSIDE = ? , MM12SUMINSIDE = ?  "
         +" WHERE CODE = ?";
        }

       statement = null;

       try
        {
         statement = connection.prepareStatement(selectStr);
         if(fields == null)
          {

       if (anObject.countGenInside != null)
         anObject.countGenInside = anObject.countGenInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(1,anObject.countGenInside);
       if (anObject.priceInside != null)
         anObject.priceInside = anObject.priceInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(2,anObject.priceInside);
       if (anObject.sumGenInside != null)
         anObject.sumGenInside = anObject.sumGenInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(3,anObject.sumGenInside);
       if (anObject.mm1countInside != null)
         anObject.mm1countInside = anObject.mm1countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(4,anObject.mm1countInside);
       if (anObject.mm1sumInside != null)
         anObject.mm1sumInside = anObject.mm1sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(5,anObject.mm1sumInside);
       if (anObject.mm2countInside != null)
         anObject.mm2countInside = anObject.mm2countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(6,anObject.mm2countInside);
       if (anObject.mm2sumInside != null)
         anObject.mm2sumInside = anObject.mm2sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(7,anObject.mm2sumInside);
       if (anObject.mm3countInside != null)
         anObject.mm3countInside = anObject.mm3countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(8,anObject.mm3countInside);
       if (anObject.mm3sumInside != null)
         anObject.mm3sumInside = anObject.mm3sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(9,anObject.mm3sumInside);
       if (anObject.mm4countInside != null)
         anObject.mm4countInside = anObject.mm4countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(10,anObject.mm4countInside);
       if (anObject.mm4sumInside != null)
         anObject.mm4sumInside = anObject.mm4sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(11,anObject.mm4sumInside);
       if (anObject.mm5countInside != null)
         anObject.mm5countInside = anObject.mm5countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(12,anObject.mm5countInside);
       if (anObject.mm5sumInside != null)
         anObject.mm5sumInside = anObject.mm5sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(13,anObject.mm5sumInside);
       if (anObject.mm6countInside != null)
         anObject.mm6countInside = anObject.mm6countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(14,anObject.mm6countInside);
       if (anObject.mm6sumInside != null)
         anObject.mm6sumInside = anObject.mm6sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(15,anObject.mm6sumInside);
       if (anObject.mm7countInside != null)
         anObject.mm7countInside = anObject.mm7countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(16,anObject.mm7countInside);
       if (anObject.mm7sumInside != null)
         anObject.mm7sumInside = anObject.mm7sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(17,anObject.mm7sumInside);
       if (anObject.mm8countInside != null)
         anObject.mm8countInside = anObject.mm8countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(18,anObject.mm8countInside);
       if (anObject.mm8sumInside != null)
         anObject.mm8sumInside = anObject.mm8sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(19,anObject.mm8sumInside);
       if (anObject.mm9countInside != null)
         anObject.mm9countInside = anObject.mm9countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(20,anObject.mm9countInside);
       if (anObject.mm9sumInside != null)
         anObject.mm9sumInside = anObject.mm9sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(21,anObject.mm9sumInside);
       if (anObject.mm10countInside != null)
         anObject.mm10countInside = anObject.mm10countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(22,anObject.mm10countInside);
       if (anObject.mm10sumInside != null)
         anObject.mm10sumInside = anObject.mm10sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(23,anObject.mm10sumInside);
       if (anObject.mm11countInside != null)
         anObject.mm11countInside = anObject.mm11countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(24,anObject.mm11countInside);
       if (anObject.mm11sumInside != null)
         anObject.mm11sumInside = anObject.mm11sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(25,anObject.mm11sumInside);
       if (anObject.mm12countInside != null)
         anObject.mm12countInside = anObject.mm12countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(26,anObject.mm12countInside);
       if (anObject.mm12sumInside != null)
         anObject.mm12sumInside = anObject.mm12sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(27,anObject.mm12sumInside);

          statement.setInt(/*fields.size()*/28,anObject.code);
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

    } // end of save(ENIPItem anObject,String[] anAttributes)


    /** апдейт строки ИП перенесли в ДАО и тут не апдейтятся поля по суммам финансирования  */

    public void save(ENIPItem anObject,String[] anAttributes) throws PersistenceException
    {
     if(anAttributes != null && anAttributes.length == 0)
        return;

     Connection connection = getConnection();
     try
      {
       PreparedStatement statement = null;

       ENIPItem oldObject = new ENIPItem();
       oldObject.code = anObject.code;

       String oldObjectSelectStr =
        "SELECT "+ENIPItem.modify_time_Field+" FROM  ENIPITEM WHERE CODE = ?";

       ResultSet set = null;
       try
        {
         statement = connection.prepareStatement(oldObjectSelectStr);
         statement.setInt(1,oldObject.code);
         set = statement.executeQuery();
         if(!set.next())
            throw new PersistenceException("Can't get old object.");
        oldObject.modify_time = set.getLong(1);
         if(set.wasNull())
          oldObject.modify_time = Long.MIN_VALUE;
        }
       catch(SQLException e)
        {
         System.out.println(e.getMessage()+"\nstatement - "+oldObjectSelectStr);
         throw new SystemException(e.getMessage(), e);
        }
       finally
        {
         try {if (set != null) set.close();}             catch (SQLException e) {}
         try {if (statement != null) statement.close();} catch (SQLException e) {}
         statement = null;
        }

       if(oldObject.modify_time != anObject.modify_time)
        throw new PersistenceException("Can't update object (optimistic locking).");

       anObject.modify_time = System.currentTimeMillis();
       String selectStr;

       Vector fields = null;
       if(anAttributes != null)
        {
         String fieldNameStr;
         fields = new Vector();
         for(int attrIndex = 0;attrIndex < anAttributes.length;attrIndex++)
          {
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("NAME") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("BUHNAME") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("ITEMNUMBER") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("INVNUMBER") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("ISPROJECTDOCUMENT") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("FINANCING") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("COMMENTGEN") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("COUNTGEN") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("PRICE") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("SUMGEN") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("QUARTER1COUNT") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("QUARTER1SUM") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("QUARTER2COUNT") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("QUARTER2SUM") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("QUARTER3COUNT") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("QUARTER3SUM") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("QUARTER4COUNT") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("QUARTER4SUM") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }

           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("MODIFY_TIME") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("USERADD") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("DATEADD") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("USERGEN") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("DATEEDIT") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("MEASUREMENT") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("STATUSREF") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("INVGROUPREF") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("RENREF") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("PURPOSEPROGRAMREF") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("IPREF") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("PARENTREF") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("METHODEXECWORKREF") == 0)
            {
             fields.add(fieldNameStr);
             continue;
            }
           fieldNameStr = processCondition(anAttributes[attrIndex]);
           if(fieldNameStr.compareTo("IPIMPLEMENTTYPEREF") == 0)
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
         "UPDATE ENIPITEM SET  NAME = ? , BUHNAME = ? , ITEMNUMBER = ? , INVNUMBER = ? , ISPROJECTDOCUMENT = ? , FINANCING = ? , COMMENTGEN = ? , COUNTGEN = ? , PRICE = ? , SUMGEN = ? , QUARTER1COUNT = ? , QUARTER1SUM = ? , QUARTER2COUNT = ? , QUARTER2SUM = ? , QUARTER3COUNT = ? , QUARTER3SUM = ? , QUARTER4COUNT = ? , QUARTER4SUM = ? , MODIFY_TIME = ? , USERADD = ? , DATEADD = ? , USERGEN = ? , DATEEDIT = ? , MEASUREMENTCODE = ? , STATUSREFCODE = ? , INVGROUPREFCODE = ? , RENREFCODE = ? , PURPOSEPROGRAMREFCODE = ? , IPREFCODE = ? , PARENTREFCODE = ? , METHODEXECWORKREFCODE = ? , IPIMPLEMENTTYPEREFCODE = ?  "
         +" WHERE CODE = ?";
        }
       else
        {
         selectStr =
         "UPDATE ENIPITEM SET ";
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
       statement.setString(1,anObject.name);
       statement.setString(2,anObject.buhName);
       statement.setString(3,anObject.itemNumber);
       statement.setString(4,anObject.invNumber);
       if (anObject.isProjectDocument != Integer.MIN_VALUE )
          statement.setInt(5,anObject.isProjectDocument);
       else
          statement.setNull(5,java.sql.Types.INTEGER);
       statement.setString(6,anObject.financing);
       statement.setString(7,anObject.commentGen);
       if (anObject.countGen != null)
         anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(8,anObject.countGen);
       if (anObject.price != null)
         anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(9,anObject.price);
       if (anObject.sumGen != null)
         anObject.sumGen = anObject.sumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(10,anObject.sumGen);
       if (anObject.quarter1count != null)
         anObject.quarter1count = anObject.quarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(11,anObject.quarter1count);
       if (anObject.quarter1sum != null)
         anObject.quarter1sum = anObject.quarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(12,anObject.quarter1sum);
       if (anObject.quarter2count != null)
         anObject.quarter2count = anObject.quarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(13,anObject.quarter2count);
       if (anObject.quarter2sum != null)
         anObject.quarter2sum = anObject.quarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(14,anObject.quarter2sum);
       if (anObject.quarter3count != null)
         anObject.quarter3count = anObject.quarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(15,anObject.quarter3count);
       if (anObject.quarter3sum != null)
         anObject.quarter3sum = anObject.quarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(16,anObject.quarter3sum);
       if (anObject.quarter4count != null)
         anObject.quarter4count = anObject.quarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(17,anObject.quarter4count);
       if (anObject.quarter4sum != null)
         anObject.quarter4sum = anObject.quarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       statement.setBigDecimal(18,anObject.quarter4sum);

       if (anObject.modify_time == Long.MIN_VALUE)
         statement.setBigDecimal(19,null);
       else
         statement.setBigDecimal(19,new java.math.BigDecimal(anObject.modify_time));
       statement.setString(20,anObject.userAdd);
       if (anObject.dateAdd == null)
         statement.setTimestamp(21,null);
       else
         statement.setTimestamp(21,new java.sql.Timestamp(anObject.dateAdd.getTime()));
       statement.setString(22,anObject.userGen);
       if (anObject.dateEdit == null)
         statement.setTimestamp(23,null);
       else
         statement.setTimestamp(23,new java.sql.Timestamp(anObject.dateEdit.getTime()));
       if (anObject.measurement.code != Integer.MIN_VALUE)
         statement.setInt(24,anObject.measurement.code);
       else
         statement.setNull(24,java.sql.Types.INTEGER);
       if (anObject.statusRef.code != Integer.MIN_VALUE)
         statement.setInt(25,anObject.statusRef.code);
       else
         statement.setNull(25,java.sql.Types.INTEGER);
       if (anObject.invGroupRef.code != Integer.MIN_VALUE)
         statement.setInt(26,anObject.invGroupRef.code);
       else
         statement.setNull(26,java.sql.Types.INTEGER);
       if (anObject.renRef.code != Integer.MIN_VALUE)
         statement.setInt(27,anObject.renRef.code);
       else
         statement.setNull(27,java.sql.Types.INTEGER);
       if (anObject.purposeProgramRef.code != Integer.MIN_VALUE)
         statement.setInt(28,anObject.purposeProgramRef.code);
       else
         statement.setNull(28,java.sql.Types.INTEGER);
       if (anObject.ipRef.code != Integer.MIN_VALUE)
         statement.setInt(29,anObject.ipRef.code);
       else
         statement.setNull(29,java.sql.Types.INTEGER);
       if (anObject.parentRef.code != Integer.MIN_VALUE)
         statement.setInt(30,anObject.parentRef.code);
       else
         statement.setNull(30,java.sql.Types.INTEGER);
       if (anObject.methodExecWorkRef.code != Integer.MIN_VALUE)
         statement.setInt(31,anObject.methodExecWorkRef.code);
       else
         statement.setNull(31,java.sql.Types.INTEGER);
       if (anObject.ipImplementTypeRef.code != Integer.MIN_VALUE)
         statement.setInt(32,anObject.ipImplementTypeRef.code);
       else
         statement.setNull(32,java.sql.Types.INTEGER);



       statement.setInt(33,anObject.code);
          }
         else
          {

           for(int i = 0;i < fields.size();i++)
            {
             if("NAME".compareTo((String)fields.get(i)) == 0)
              {
                 statement.setString(i+1,anObject.name);
                 continue;
              }
             if("BUHNAME".compareTo((String)fields.get(i)) == 0)
              {
                 statement.setString(i+1,anObject.buhName);
                 continue;
              }
             if("ITEMNUMBER".compareTo((String)fields.get(i)) == 0)
              {
                 statement.setString(i+1,anObject.itemNumber);
                 continue;
              }
             if("INVNUMBER".compareTo((String)fields.get(i)) == 0)
              {
                 statement.setString(i+1,anObject.invNumber);
                 continue;
              }
             if("ISPROJECTDOCUMENT".compareTo((String)fields.get(i)) == 0)
              {
                 statement.setInt(i+1,anObject.isProjectDocument);
                 continue;
              }
             if("FINANCING".compareTo((String)fields.get(i)) == 0)
              {
                 statement.setString(i+1,anObject.financing);
                 continue;
              }
             if("COMMENTGEN".compareTo((String)fields.get(i)) == 0)
              {
                 statement.setString(i+1,anObject.commentGen);
                 continue;
              }
             if("COUNTGEN".compareTo((String)fields.get(i)) == 0)
              {
                 if (anObject.countGen != null)
                     anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                 statement.setBigDecimal(i+1,anObject.countGen);
                 continue;
              }
             if("PRICE".compareTo((String)fields.get(i)) == 0)
              {
                 if (anObject.price != null)
                     anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                 statement.setBigDecimal(i+1,anObject.price);
                 continue;
              }
             if("SUMGEN".compareTo((String)fields.get(i)) == 0)
              {
                 if (anObject.sumGen != null)
                     anObject.sumGen = anObject.sumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                 statement.setBigDecimal(i+1,anObject.sumGen);
                 continue;
              }
             if("QUARTER1COUNT".compareTo((String)fields.get(i)) == 0)
              {
                 if (anObject.quarter1count != null)
                     anObject.quarter1count = anObject.quarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                 statement.setBigDecimal(i+1,anObject.quarter1count);
                 continue;
              }
             if("QUARTER1SUM".compareTo((String)fields.get(i)) == 0)
              {
                 if (anObject.quarter1sum != null)
                     anObject.quarter1sum = anObject.quarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                 statement.setBigDecimal(i+1,anObject.quarter1sum);
                 continue;
              }
             if("QUARTER2COUNT".compareTo((String)fields.get(i)) == 0)
              {
                 if (anObject.quarter2count != null)
                     anObject.quarter2count = anObject.quarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                 statement.setBigDecimal(i+1,anObject.quarter2count);
                 continue;
              }
             if("QUARTER2SUM".compareTo((String)fields.get(i)) == 0)
              {
                 if (anObject.quarter2sum != null)
                     anObject.quarter2sum = anObject.quarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                 statement.setBigDecimal(i+1,anObject.quarter2sum);
                 continue;
              }
             if("QUARTER3COUNT".compareTo((String)fields.get(i)) == 0)
              {
                 if (anObject.quarter3count != null)
                     anObject.quarter3count = anObject.quarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                 statement.setBigDecimal(i+1,anObject.quarter3count);
                 continue;
              }
             if("QUARTER3SUM".compareTo((String)fields.get(i)) == 0)
              {
                 if (anObject.quarter3sum != null)
                     anObject.quarter3sum = anObject.quarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                 statement.setBigDecimal(i+1,anObject.quarter3sum);
                 continue;
              }
             if("QUARTER4COUNT".compareTo((String)fields.get(i)) == 0)
              {
                 if (anObject.quarter4count != null)
                     anObject.quarter4count = anObject.quarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                 statement.setBigDecimal(i+1,anObject.quarter4count);
                 continue;
              }
             if("QUARTER4SUM".compareTo((String)fields.get(i)) == 0)
              {
                 if (anObject.quarter4sum != null)
                     anObject.quarter4sum = anObject.quarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
                 statement.setBigDecimal(i+1,anObject.quarter4sum);
                 continue;
              }

             if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0)
              {
                 if (anObject.modify_time == Long.MIN_VALUE)
                     statement.setBigDecimal(i+1,null);
                 else
                      statement.setBigDecimal(i+1,new java.math.BigDecimal(anObject.modify_time));
                 continue;
              }
             if("USERADD".compareTo((String)fields.get(i)) == 0)
              {
                 statement.setString(i+1,anObject.userAdd);
                 continue;
              }
             if("DATEADD".compareTo((String)fields.get(i)) == 0)
              {
       if (anObject.dateAdd == null)
                 statement.setTimestamp(i+1,null);
       else
                 statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateAdd.getTime()));
                 continue;
              }
             if("USERGEN".compareTo((String)fields.get(i)) == 0)
              {
                 statement.setString(i+1,anObject.userGen);
                 continue;
              }
             if("DATEEDIT".compareTo((String)fields.get(i)) == 0)
              {
       if (anObject.dateEdit == null)
                 statement.setTimestamp(i+1,null);
       else
                 statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateEdit.getTime()));
                 continue;
              }
             if("MEASUREMENT".compareTo((String)fields.get(i)) == 0)
              {
                 if (anObject.measurement.code != Integer.MIN_VALUE)
                      statement.setInt(i+1,anObject.measurement.code);
                 else
                      statement.setNull(i+1,java.sql.Types.INTEGER);
                 continue;
              }
             if("STATUSREF".compareTo((String)fields.get(i)) == 0)
              {
                 if (anObject.statusRef.code != Integer.MIN_VALUE)
                      statement.setInt(i+1,anObject.statusRef.code);
                 else
                      statement.setNull(i+1,java.sql.Types.INTEGER);
                 continue;
              }
             if("INVGROUPREF".compareTo((String)fields.get(i)) == 0)
              {
                 if (anObject.invGroupRef.code != Integer.MIN_VALUE)
                      statement.setInt(i+1,anObject.invGroupRef.code);
                 else
                      statement.setNull(i+1,java.sql.Types.INTEGER);
                 continue;
              }
             if("RENREF".compareTo((String)fields.get(i)) == 0)
              {
                 if (anObject.renRef.code != Integer.MIN_VALUE)
                      statement.setInt(i+1,anObject.renRef.code);
                 else
                      statement.setNull(i+1,java.sql.Types.INTEGER);
                 continue;
              }
             if("PURPOSEPROGRAMREF".compareTo((String)fields.get(i)) == 0)
              {
                 if (anObject.purposeProgramRef.code != Integer.MIN_VALUE)
                      statement.setInt(i+1,anObject.purposeProgramRef.code);
                 else
                      statement.setNull(i+1,java.sql.Types.INTEGER);
                 continue;
              }
             if("IPREF".compareTo((String)fields.get(i)) == 0)
              {
                 if (anObject.ipRef.code != Integer.MIN_VALUE)
                      statement.setInt(i+1,anObject.ipRef.code);
                 else
                      statement.setNull(i+1,java.sql.Types.INTEGER);
                 continue;
              }
             if("PARENTREF".compareTo((String)fields.get(i)) == 0)
              {
                 if (anObject.parentRef.code != Integer.MIN_VALUE)
                      statement.setInt(i+1,anObject.parentRef.code);
                 else
                      statement.setNull(i+1,java.sql.Types.INTEGER);
                 continue;
              }
             if("METHODEXECWORKREF".compareTo((String)fields.get(i)) == 0)
              {
                 if (anObject.methodExecWorkRef.code != Integer.MIN_VALUE)
                      statement.setInt(i+1,anObject.methodExecWorkRef.code);
                 else
                      statement.setNull(i+1,java.sql.Types.INTEGER);
                 continue;
              }
             if("IPIMPLEMENTTYPEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.ipImplementTypeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.ipImplementTypeRef.code);
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

    } // end of save(ENIPItem anObject,String[] anAttributes)

    /** изменение информации по торгам   */
    public void saveinfoTenders(ENIPItem anObject) throws PersistenceException
    {

    	Connection connection = getConnection();
     try
      {
       PreparedStatement statement = null;

       ENIPItem oldObject = new ENIPItem();
       oldObject.code = anObject.code;
       String selectStr = "";


       Vector fields = null;

       if(fields == null)
        {
         selectStr =
         "UPDATE ENIPITEM SET INFOTENDERS = ?   "
         +" WHERE CODE = ?";
        }

       statement = null;

       try
        {
         statement = connection.prepareStatement(selectStr);
         if(fields == null)
          {

        	 statement.setString(1,anObject.infoTenders);
             statement.setInt(2,anObject.code);
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

    }


    public int copyEnIpitem(ENIPItem anObject) throws PersistenceException
    {



    	anObject.userAdd = getUserProfile().userName;
        anObject.dateAdd = new Date();
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();

        return super.add(anObject);
    }



} // end of ENIPItemDAO
