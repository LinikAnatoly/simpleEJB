
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENInvestProgramItemDAOGen;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.valueobject.ENEstimateItemStatus;
import com.ksoe.energynet.valueobject.ENInvestProgramItem;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENStandardConst;
import com.ksoe.energynet.valueobject.brief.ENInvestProgramItemShort;
import com.ksoe.energynet.valueobject.lists.ENInvestProgramItemShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENInvestProgramItem;
 *
 */

public class ENInvestProgramItemDAO extends ENInvestProgramItemDAOGen {

    public ENInvestProgramItemDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENInvestProgramItemDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    public int add(ENInvestProgramItem anObject) throws PersistenceException
    {
    	anObject.userAdd = getUserProfile().userName;
    	anObject.dateAdd = new Date();    	
    	anObject.userGen = getUserProfile().userName;
    	anObject.dateEdit = new Date();
        
    	return super.add(anObject);
    }    
    
    public void save(ENInvestProgramItem anObject) throws PersistenceException
    {
    	anObject.userGen = getUserProfile().userName;
    	anObject.dateEdit = new Date();
    	
    	super.save(anObject);
    }    
    
    public ENInvestProgramItemShortList getScrollableFilteredList(ENInvestProgramItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
     ENInvestProgramItemShortList result = new ENInvestProgramItemShortList();
     ENInvestProgramItemShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     whereStr = "";
     String     condition = processCondition(anCondition);
     String     orderBy = processCondition(anOrderBy);

     if(orderBy.length() == 0)
      orderBy = "ENINVESTPROGRAMITEM.CODE";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr = "SELECT "+
      "ENINVESTPROGRAMITEM.CODE"+
      ",ENINVESTPROGRAMITEM.NAME"+
      ",ENINVESTPROGRAMITEM.COMMENTGEN"+
      ",ENINVESTPROGRAMITEM.COUNTGEN"+
      ",ENINVESTPROGRAMITEM.PRICE"+
      ",ENINVESTPROGRAMITEM.SUMGEN"+
      ",ENINVESTPROGRAMITEM.QUARTER1COUNT"+
      ",ENINVESTPROGRAMITEM.QUARTER1SUM"+
      ",ENINVESTPROGRAMITEM.QUARTER2COUNT"+
      ",ENINVESTPROGRAMITEM.QUARTER2SUM"+
      ",ENINVESTPROGRAMITEM.QUARTER3COUNT"+
      ",ENINVESTPROGRAMITEM.QUARTER3SUM"+
      ",ENINVESTPROGRAMITEM.QUARTER4COUNT"+
      ",ENINVESTPROGRAMITEM.QUARTER4SUM"+
      ",ENINVESTPROGRAMITEM.USERADD"+
      ",ENINVESTPROGRAMITEM.DATEADD"+
      ",ENINVESTPROGRAMITEM.USERGEN"+
      ",ENINVESTPROGRAMITEM.DATEEDIT"+

       ", ENINVESTPROGRAM.CODE " +
       ", ENINVESTPROGRAM.NAME " +
       ", ENINVESTPROGRAM.YEARGEN " +
       ", ENINVESTPROGRAM.COMMENTGEN " +
       ", ENINVESTPROGRAM.COUNTGEN " +
       ", ENINVESTPROGRAM.PRICE " +
       ", ENINVESTPROGRAM.SUMGEN " +
       ", ENINVESTPROGRAM.QUARTER1COUNT " +
       ", ENINVESTPROGRAM.QUARTER1SUM " +
       ", ENINVESTPROGRAM.QUARTER2COUNT " +
       ", ENINVESTPROGRAM.QUARTER2SUM " +
       ", ENINVESTPROGRAM.QUARTER3COUNT " +
       ", ENINVESTPROGRAM.QUARTER3SUM " +
       ", ENINVESTPROGRAM.QUARTER4COUNT " +
       ", ENINVESTPROGRAM.QUARTER4SUM " +
       ", ENINVESTPROGRAM.USERADD " +
       ", ENINVESTPROGRAM.DATEADD " +
       ", ENINVESTPROGRAM.USERGEN " +
       ", ENINVESTPROGRAM.DATEEDIT " +
       ", TKMATERIALS.CODE " +
       ", TKMATERIALS.NAME " +
       ", TKMATERIALS.COST " +
       ", TKMATERIALS.DELIVERYDATE " +
       ", TKMATERIALS.NUMKATALOG " +
       ", TKMATERIALS.IDENTID " +
       
       ", TKMATERIALS.measurementcode " +
       ", (select m.name from tkmeasurement m where m.code = TKMATERIALS.measurementcode) " +
       
      " FROM ENINVESTPROGRAMITEM " +
      ", ENINVESTPROGRAM " +
      ", TKMATERIALS " +
      //" WHERE "
 	"";
      whereStr = " ENINVESTPROGRAM.CODE = ENINVESTPROGRAMITEM.INVESTPROGRAMREFCODE" ; //+
       whereStr = whereStr +" AND TKMATERIALS.CODE = ENINVESTPROGRAMITEM.MATERIALREFCODE" ; //+
 		//selectStr = selectStr + " ${s} ENINVESTPROGRAMITEM.CODE IN ( SELECT ENINVESTPROGRAMITEM.CODE FROM ENINVESTPROGRAMITEM ";

 // " ";
       if(aFilterObject != null)
       {
         if(aFilterObject.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENINVESTPROGRAMITEM.CODE = ?";
         }
          if (aFilterObject.name != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENINVESTPROGRAMITEM.NAME) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENINVESTPROGRAMITEM.NAME) LIKE UPPER(?)";
          }
          if (aFilterObject.commentGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENINVESTPROGRAMITEM.COMMENTGEN) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENINVESTPROGRAMITEM.COMMENTGEN) LIKE UPPER(?)";
          }
         if(aFilterObject.countGen != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENINVESTPROGRAMITEM.COUNTGEN = ?";
         }
         if(aFilterObject.price != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENINVESTPROGRAMITEM.PRICE = ?";
         }
         if(aFilterObject.sumGen != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENINVESTPROGRAMITEM.SUMGEN = ?";
         }
         if(aFilterObject.quarter1count != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER1COUNT = ?";
         }
         if(aFilterObject.quarter1sum != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER1SUM = ?";
         }
         if(aFilterObject.quarter2count != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER2COUNT = ?";
         }
         if(aFilterObject.quarter2sum != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER2SUM = ?";
         }
         if(aFilterObject.quarter3count != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER3COUNT = ?";
         }
         if(aFilterObject.quarter3sum != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER3SUM = ?";
         }
         if(aFilterObject.quarter4count != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER4COUNT = ?";
         }
         if(aFilterObject.quarter4sum != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENINVESTPROGRAMITEM.QUARTER4SUM = ?";
         }
         if(aFilterObject.modify_time != Long.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENINVESTPROGRAMITEM.MODIFY_TIME = ?";
         }
          if (aFilterObject.userAdd != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENINVESTPROGRAMITEM.USERADD) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENINVESTPROGRAMITEM.USERADD) LIKE UPPER(?)";
          }
         if(aFilterObject.dateAdd != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENINVESTPROGRAMITEM.DATEADD = ?";
         }
          if (aFilterObject.userGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENINVESTPROGRAMITEM.USERGEN) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENINVESTPROGRAMITEM.USERGEN) LIKE UPPER(?)";
          }
         if(aFilterObject.dateEdit != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENINVESTPROGRAMITEM.DATEEDIT = ?";
         }
         if(aFilterObject.investProgramRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENINVESTPROGRAMITEM.INVESTPROGRAMREFCODE = ? ";
         }
         if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENINVESTPROGRAMITEM.MATERIALREFCODE = ? ";
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
        if(aFilterObject.investProgramRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.investProgramRef.code);
        }
        if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.materialRef.code);
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

         anObject = new ENInvestProgramItemShort();

         anObject.code = set.getInt(1);
         if ( set.wasNull() )
             anObject.code = Integer.MIN_VALUE;
         anObject.name = set.getString(2);
         anObject.commentGen = set.getString(3);
         anObject.countGen = set.getBigDecimal(4);
         if(anObject.countGen != null)
             anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.price = set.getBigDecimal(5);
         if(anObject.price != null)
             anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.sumGen = set.getBigDecimal(6);
         if(anObject.sumGen != null)
             anObject.sumGen = anObject.sumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.quarter1count = set.getBigDecimal(7);
         if(anObject.quarter1count != null)
             anObject.quarter1count = anObject.quarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.quarter1sum = set.getBigDecimal(8);
         if(anObject.quarter1sum != null)
             anObject.quarter1sum = anObject.quarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.quarter2count = set.getBigDecimal(9);
         if(anObject.quarter2count != null)
             anObject.quarter2count = anObject.quarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.quarter2sum = set.getBigDecimal(10);
         if(anObject.quarter2sum != null)
             anObject.quarter2sum = anObject.quarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.quarter3count = set.getBigDecimal(11);
         if(anObject.quarter3count != null)
             anObject.quarter3count = anObject.quarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.quarter3sum = set.getBigDecimal(12);
         if(anObject.quarter3sum != null)
             anObject.quarter3sum = anObject.quarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.quarter4count = set.getBigDecimal(13);
         if(anObject.quarter4count != null)
             anObject.quarter4count = anObject.quarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.quarter4sum = set.getBigDecimal(14);
         if(anObject.quarter4sum != null)
             anObject.quarter4sum = anObject.quarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.userAdd = set.getString(15);
         anObject.dateAdd = set.getTimestamp(16);
         anObject.userGen = set.getString(17);
         anObject.dateEdit = set.getTimestamp(18);

         anObject.investProgramRefCode = set.getInt(19);
 		if(set.wasNull())
 		   anObject.investProgramRefCode = Integer.MIN_VALUE;
         anObject.investProgramRefName = set.getString(20);
         anObject.investProgramRefYearGen = set.getInt(21);
 		if(set.wasNull())
 		   anObject.investProgramRefYearGen = Integer.MIN_VALUE;
         anObject.investProgramRefCommentGen = set.getString(22);
         anObject.investProgramRefCountGen = set.getBigDecimal(23);
         if(anObject.investProgramRefCountGen != null)
           anObject.investProgramRefCountGen = anObject.investProgramRefCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.investProgramRefPrice = set.getBigDecimal(24);
         if(anObject.investProgramRefPrice != null)
           anObject.investProgramRefPrice = anObject.investProgramRefPrice.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.investProgramRefSumGen = set.getBigDecimal(25);
         if(anObject.investProgramRefSumGen != null)
           anObject.investProgramRefSumGen = anObject.investProgramRefSumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.investProgramRefQuarter1count = set.getBigDecimal(26);
         if(anObject.investProgramRefQuarter1count != null)
           anObject.investProgramRefQuarter1count = anObject.investProgramRefQuarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.investProgramRefQuarter1sum = set.getBigDecimal(27);
         if(anObject.investProgramRefQuarter1sum != null)
           anObject.investProgramRefQuarter1sum = anObject.investProgramRefQuarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.investProgramRefQuarter2count = set.getBigDecimal(28);
         if(anObject.investProgramRefQuarter2count != null)
           anObject.investProgramRefQuarter2count = anObject.investProgramRefQuarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.investProgramRefQuarter2sum = set.getBigDecimal(29);
         if(anObject.investProgramRefQuarter2sum != null)
           anObject.investProgramRefQuarter2sum = anObject.investProgramRefQuarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.investProgramRefQuarter3count = set.getBigDecimal(30);
         if(anObject.investProgramRefQuarter3count != null)
           anObject.investProgramRefQuarter3count = anObject.investProgramRefQuarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.investProgramRefQuarter3sum = set.getBigDecimal(31);
         if(anObject.investProgramRefQuarter3sum != null)
           anObject.investProgramRefQuarter3sum = anObject.investProgramRefQuarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.investProgramRefQuarter4count = set.getBigDecimal(32);
         if(anObject.investProgramRefQuarter4count != null)
           anObject.investProgramRefQuarter4count = anObject.investProgramRefQuarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.investProgramRefQuarter4sum = set.getBigDecimal(33);
         if(anObject.investProgramRefQuarter4sum != null)
           anObject.investProgramRefQuarter4sum = anObject.investProgramRefQuarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.investProgramRefUserAdd = set.getString(34);
         anObject.investProgramRefDateAdd = set.getTimestamp(35);
         anObject.investProgramRefUserGen = set.getString(36);
         anObject.investProgramRefDateEdit = set.getTimestamp(37);
         anObject.materialRefCode = set.getInt(38);
 		if(set.wasNull())
 		   anObject.materialRefCode = Integer.MIN_VALUE;
         anObject.materialRefName = set.getString(39);
         anObject.materialRefCost = set.getBigDecimal(40);
         if(anObject.materialRefCost != null)
           anObject.materialRefCost = anObject.materialRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.materialRefDeliveryDate = set.getInt(41);
 		if(set.wasNull())
 		   anObject.materialRefDeliveryDate = Integer.MIN_VALUE;
         anObject.materialRefNumkatalog = set.getString(42);
         anObject.materialRefIdentid = set.getString(43);

         anObject.measurementCode = set.getInt(44);
  		 if(set.wasNull())
  		   anObject.measurementCode = Integer.MIN_VALUE;
         anObject.measurementName = set.getString(45);         
         
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
    
	public ENInvestProgramItemShortList getMaterialsFromPlans(int investProgramCode) throws PersistenceException
	{
	     ENInvestProgramItemShortList result = new ENInvestProgramItemShortList();
	     ENInvestProgramItemShort anObject;

		Connection connection = getConnection();
	    PreparedStatement statement = null;
	    ResultSet  set = null;

		String sql =
			" select code, name,  \n" +
			"        cast((pricewithoutvat * vat) as numeric(15, 3)) as price, \n" +
			"        cast(sum(countfact) as numeric(15, 6)) as countfact,  \n" +
			"        cast(sum(countfact * cast((pricewithoutvat * vat) as numeric(15, 3))) as numeric(15, 3)) as cost \n" +
			" from \n" +
			" ( \n" +
			" select m.code, m.name,  \n" +
			"        cast((m.cost / 1000) as numeric(15, 3)) as pricewithoutvat, \n" +
			//"        -- cast((case when coalesce(ei.isusevat, 1) = 1 then 1.2 else 1 end) as numeric(15, 3)) as vat, \n" +
			"        cast( \n" +
			"          (case  \n" +
			//"            when coalesce(ei.isusevat, 1) = 1 then  \n" +
			"            when coalesce(ei.isusevat, " + ENConsts.ENESTIMATEITEM_USEVAT + ") = " + ENConsts.ENESTIMATEITEM_USEVAT + " then  \n" +
			"              (select cast(1 + (sce.constentry / 100) as numeric(15, 2)) \n" +
			"                 from enstandardconst sc, enstandardconstentry sce \n" +
			"                where sce.constrefcode = sc.code \n" +
			"                  and sc.code = " + ENStandardConst.PDV + " \n" +
			"                  and p.datestart between sce.startdate and sce.enddate)  \n" +
			"            else 1  \n" +
			"          end)  \n" +
			"        as numeric(15, 3)) as vat,          \n" +
			"        cast(ei.countfact as numeric(15, 6)) as countfact,  \n" +
			"        cast(ei.countfact * (m.cost / 1000) as numeric(15, 3)) as cost \n" +
			" from eninvestprogram ip, enplanwork p, enestimateitem ei, tkmaterials m \n" +
			" where p.elementrefcode = ip.elementrefcode \n" +
			"   and p.yeargen = ip.yeargen \n" +
			"   and p.typerefcode = ip.plantyperefcode \n" +
			"   and p.kindcode = " + ENPlanWorkKind.CURRENT +
			"   and ip.code = ? \n" + 
			"   and ei.planrefcode = p.code \n" +
			"   and ei.statusrefcode = " + ENEstimateItemStatus.PLANNED +
			"   and ei.countfact > 0 \n" +
			"   and ei.materialrefcode = m.code \n" +
			" ) q \n" +
			" group by code, name, price \n" +
			" order by name ";

	 try
	     {
	      statement = connection.prepareStatement(sql);

	      statement.setInt(1, investProgramCode);

	      set = statement.executeQuery();
	      int i;
	      for(i = 0;set.next();i++)
	       {
	          anObject = new ENInvestProgramItemShort();

	          anObject.code = Integer.MIN_VALUE; //set.getInt(1);
	          //if ( set.wasNull() )
	          //    anObject.code = Integer.MIN_VALUE;
	          anObject.name = set.getString(2);
	          anObject.price = set.getBigDecimal(3);
	          if(anObject.price != null)
	              anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
	          anObject.countGen = set.getBigDecimal(4);
	          if(anObject.countGen != null)
	              anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
	          anObject.sumGen = set.getBigDecimal(5);
	          if(anObject.sumGen != null)
	              anObject.sumGen = anObject.sumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
	          
	          anObject.quarter1count = new BigDecimal(0);
	          anObject.quarter1sum = new BigDecimal(0);
	          anObject.quarter2count = new BigDecimal(0);
	          anObject.quarter2sum = new BigDecimal(0);
	          anObject.quarter3count = new BigDecimal(0);
	          anObject.quarter3sum = new BigDecimal(0);
	          anObject.quarter4count = new BigDecimal(0);
	          anObject.quarter4sum = new BigDecimal(0);

	          anObject.investProgramRefCode = investProgramCode;

	          anObject.materialRefCode = set.getInt(1);
	  		  if(set.wasNull())
	  			  anObject.materialRefCode = Integer.MIN_VALUE;
	          anObject.materialRefName = set.getString(2);

	          result.list.add(anObject);
	       }

	      result.setTotalCount(i);
	      return result;
	     }
	    catch(SQLException e)
	     {
	      System.out.println(e.getMessage()+"\nstatement - "+sql);
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
    
} // end of ENInvestProgramItemDAO
