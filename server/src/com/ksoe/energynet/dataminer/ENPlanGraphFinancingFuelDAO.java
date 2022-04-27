
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
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
import com.ksoe.techcard.valueobject.TKFuelType;
import com.ksoe.energynet.dataminer.generated.ENPlanGraphFinancingFuelDAOGen;
import com.ksoe.energynet.valueobject.ENPlanGraphFinancingFuel;
import com.ksoe.energynet.valueobject.ENPlanGraphFinancingFuelItem;
import com.ksoe.energynet.valueobject.brief.ENPlanGraphFinancingFuelShort;
import com.ksoe.energynet.valueobject.lists.ENPlanGraphFinancingFuelShortList;

/**
 * DAO Object for ENPlanGraphFinancingFuel;
 *
 */

public class ENPlanGraphFinancingFuelDAO extends ENPlanGraphFinancingFuelDAOGen {

    public ENPlanGraphFinancingFuelDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENPlanGraphFinancingFuelDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    public int add(ENPlanGraphFinancingFuel anObject) throws PersistenceException {
    	anObject.userGen = getUserProfile().userName;
    	anObject.dateEdit = new Date();
    	return super.add(anObject);
    }
    
    public void save(ENPlanGraphFinancingFuel anObject) throws PersistenceException {
    	anObject.userGen = getUserProfile().userName;
    	anObject.dateEdit = new Date();
    	super.save(anObject);
    }


    public ENPlanGraphFinancingFuelShortList getScrollableFilteredList(ENPlanGraphFinancingFuel aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
     {
      ENPlanGraphFinancingFuelShortList result = new ENPlanGraphFinancingFuelShortList();
      ENPlanGraphFinancingFuelShort anObject;
      result.list = new Vector();

      String     selectStr;
      Connection connection = getConnection();
      PreparedStatement statement = null;
      ResultSet  set = null;
      String     whereStr = "";
      String     condition = processCondition(anCondition);
      String     orderBy = processCondition(anOrderBy);

      if(orderBy.length() == 0)
       orderBy = "ENPLANGRAPHFINANCINGFL.CODE";

      if(quantity < 0)
       quantity = Integer.MAX_VALUE/2;

      if(getUserProfile() == null)
       throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      selectStr = "SELECT "+
       "ENPLANGRAPHFINANCINGFL.CODE"+
       ",ENPLANGRAPHFINANCINGFL.MONTHGEN"+
       ",ENPLANGRAPHFINANCINGFL.YEARGEN"+
       ",ENPLANGRAPHFINANCINGFL.TOTALSUM"+
       ",ENPLANGRAPHFINANCINGFL.KOEFDEKADA1"+
       ",ENPLANGRAPHFINANCINGFL.KOEFDEKADA2"+
       ",ENPLANGRAPHFINANCINGFL.KOEFDEKADA3"+
       ",ENPLANGRAPHFINANCINGFL.COUNTFUELSPENT"+
       ",ENPLANGRAPHFINANCINGFL.USERGEN"+
       ",ENPLANGRAPHFINANCINGFL.DATEEDIT"+

        ", TKFUELTYPE.CODE " +
        //", TKFUELTYPE.NAME " +
		", case  when TKFUELTYPE.code = " + TKFuelType.A92 + " then 'Бензин' "+ 
		" when TKFUELTYPE.code = " + TKFuelType.DT + " then 'ДП'  "+
		" else '' " +
		" end " +
   
       " FROM ENPLANGRAPHFINANCINGFL " +
       ", TKFUELTYPE " +
       //" WHERE "
    "";
       whereStr = " TKFUELTYPE.CODE = ENPLANGRAPHFINANCINGFL.FUELTYPEREFCODE" ; //+
      //selectStr = selectStr + " ${s} ENPLANGRAPHFINANCINGFL.CODE IN ( SELECT ENPLANGRAPHFINANCINGFL.CODE FROM ENPLANGRAPHFINANCINGFL ";

  // " ";
        if(aFilterObject != null)
        {
          if(aFilterObject.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.CODE = ?";
          }
          if(aFilterObject.monthGen != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.MONTHGEN = ?";
          }
          if(aFilterObject.yearGen != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.YEARGEN = ?";
          }
          if(aFilterObject.totalSum != null) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.TOTALSUM = ?";
          }
          if(aFilterObject.koefDekada1 != null) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.KOEFDEKADA1 = ?";
          }
          if(aFilterObject.koefDekada2 != null) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.KOEFDEKADA2 = ?";
          }
          if(aFilterObject.koefDekada3 != null) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.KOEFDEKADA3 = ?";
          }
          if(aFilterObject.countFuelSpent != null) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.COUNTFUELSPENT = ?";
          }
           if (aFilterObject.userGen != null) {
               if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
               if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                   whereStr = whereStr + "  UPPER(ENPLANGRAPHFINANCINGFL.USERGEN) = UPPER(?)";
               else
                   whereStr = whereStr + " UPPER(ENPLANGRAPHFINANCINGFL.USERGEN) LIKE UPPER(?)";
           }
          if(aFilterObject.dateEdit != null) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.DATEEDIT = ?";
          }
          if(aFilterObject.modify_time != Long.MIN_VALUE) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENPLANGRAPHFINANCINGFL.MODIFY_TIME = ?";
          }
          if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "ENPLANGRAPHFINANCINGFL.FUELTYPEREFCODE = ? ";
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
           if(aFilterObject.monthGen != Integer.MIN_VALUE){
               number++;
               statement.setInt(number,aFilterObject.monthGen);
           }
           if(aFilterObject.yearGen != Integer.MIN_VALUE){
               number++;
               statement.setInt(number,aFilterObject.yearGen);
           }
          if(aFilterObject.totalSum != null){
              number++;
              aFilterObject.totalSum = aFilterObject.totalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
              statement.setBigDecimal(number,aFilterObject.totalSum);
          }
          if(aFilterObject.koefDekada1 != null){
              number++;
              aFilterObject.koefDekada1 = aFilterObject.koefDekada1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
              statement.setBigDecimal(number,aFilterObject.koefDekada1);
          }
          if(aFilterObject.koefDekada2 != null){
              number++;
              aFilterObject.koefDekada2 = aFilterObject.koefDekada2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
              statement.setBigDecimal(number,aFilterObject.koefDekada2);
          }
          if(aFilterObject.koefDekada3 != null){
              number++;
              aFilterObject.koefDekada3 = aFilterObject.koefDekada3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
              statement.setBigDecimal(number,aFilterObject.koefDekada3);
          }
          if(aFilterObject.countFuelSpent != null){
              number++;
              aFilterObject.countFuelSpent = aFilterObject.countFuelSpent.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
              statement.setBigDecimal(number,aFilterObject.countFuelSpent);
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
         if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
             number++;
             statement.setInt(number,aFilterObject.fuelTypeRef.code);
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

          anObject = new ENPlanGraphFinancingFuelShort();

          anObject.code = set.getInt(1);
          if ( set.wasNull() )
              anObject.code = Integer.MIN_VALUE;
          anObject.monthGen = set.getInt(2);
          if ( set.wasNull() )
              anObject.monthGen = Integer.MIN_VALUE;
          anObject.yearGen = set.getInt(3);
          if ( set.wasNull() )
              anObject.yearGen = Integer.MIN_VALUE;
          anObject.totalSum = set.getBigDecimal(4);
          if(anObject.totalSum != null)
              anObject.totalSum = anObject.totalSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.koefDekada1 = set.getBigDecimal(5);
          if(anObject.koefDekada1 != null)
              anObject.koefDekada1 = anObject.koefDekada1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.koefDekada2 = set.getBigDecimal(6);
          if(anObject.koefDekada2 != null)
              anObject.koefDekada2 = anObject.koefDekada2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.koefDekada3 = set.getBigDecimal(7);
          if(anObject.koefDekada3 != null)
              anObject.koefDekada3 = anObject.koefDekada3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.countFuelSpent = set.getBigDecimal(8);
          if(anObject.countFuelSpent != null)
              anObject.countFuelSpent = anObject.countFuelSpent.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
          anObject.userGen = set.getString(9);
          anObject.dateEdit = set.getTimestamp(10);

          anObject.fuelTypeRefCode = set.getInt(11);
      if(set.wasNull())
        anObject.fuelTypeRefCode = Integer.MIN_VALUE;
          anObject.fuelTypeRefName = set.getString(12);

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



} // end of ENPlanGraphFinancingFuelDAO
