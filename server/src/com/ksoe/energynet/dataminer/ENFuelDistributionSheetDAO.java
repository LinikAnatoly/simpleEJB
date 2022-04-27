
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
import com.ksoe.energynet.dataminer.generated.ENFuelDistributionSheetDAOGen;
import com.ksoe.energynet.valueobject.ENFuelDistributionSheet;
import com.ksoe.energynet.valueobject.brief.ENFuelDistributionSheetShort;
import com.ksoe.energynet.valueobject.lists.ENFuelDistributionSheetShortList;

/**
 * DAO Object for ENFuelDistributionSheet;
 *
 */

public class ENFuelDistributionSheetDAO extends ENFuelDistributionSheetDAOGen {

    public ENFuelDistributionSheetDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENFuelDistributionSheetDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    public int add(ENFuelDistributionSheet anObject) throws PersistenceException
    {
    	anObject.userGen = getUserProfile().userName;
    	anObject.dateEdit = new Date();
     return super.add(anObject);
    }
    
    public void save(ENFuelDistributionSheet anObject) throws PersistenceException
    {
    	anObject.userGen = getUserProfile().userName;
    	anObject.dateEdit = new Date();
        super.save(anObject);
    }

  public ENFuelDistributionSheetShortList getScrollableFilteredList(ENFuelDistributionSheet aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENFuelDistributionSheetShortList result = new ENFuelDistributionSheetShortList();
    ENFuelDistributionSheetShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENFUELDISTRIBUTIONSHET.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENFUELDISTRIBUTIONSHET.CODE"+
     ",ENFUELDISTRIBUTIONSHET.MONTHGEN"+
     ",ENFUELDISTRIBUTIONSHET.YEARGEN"+
     ",ENFUELDISTRIBUTIONSHET.TOTALSUM"+
     ",ENFUELDISTRIBUTIONSHET.SUM1"+
     ",ENFUELDISTRIBUTIONSHET.SUM2"+
     ",ENFUELDISTRIBUTIONSHET.SUM3"+
     ",ENFUELDISTRIBUTIONSHET.SUM4"+
     ",ENFUELDISTRIBUTIONSHET.SUM5"+
     ",ENFUELDISTRIBUTIONSHET.SUM6"+
     ",ENFUELDISTRIBUTIONSHET.SUM7"+
     ",ENFUELDISTRIBUTIONSHET.SUM1DEC1"+
     ",ENFUELDISTRIBUTIONSHET.SUM2DEC1"+
     ",ENFUELDISTRIBUTIONSHET.SUM3DEC1"+
     ",ENFUELDISTRIBUTIONSHET.SUM4DEC1"+
     ",ENFUELDISTRIBUTIONSHET.SUM5DEC1"+
     ",ENFUELDISTRIBUTIONSHET.SUM6DEC1"+
     ",ENFUELDISTRIBUTIONSHET.SUM7DEC1"+
     ",ENFUELDISTRIBUTIONSHET.SUM1DEC2"+
     ",ENFUELDISTRIBUTIONSHET.SUM2DEC2"+
     ",ENFUELDISTRIBUTIONSHET.SUM3DEC2"+
     ",ENFUELDISTRIBUTIONSHET.SUM4DEC2"+
     ",ENFUELDISTRIBUTIONSHET.SUM5DEC2"+
     ",ENFUELDISTRIBUTIONSHET.SUM6DEC2"+
     ",ENFUELDISTRIBUTIONSHET.SUM7DEC2"+
     ",ENFUELDISTRIBUTIONSHET.SUM1DEC3"+
     ",ENFUELDISTRIBUTIONSHET.SUM2DEC3"+
     ",ENFUELDISTRIBUTIONSHET.SUM3DEC3"+
     ",ENFUELDISTRIBUTIONSHET.SUM4DEC3"+
     ",ENFUELDISTRIBUTIONSHET.SUM5DEC3"+
     ",ENFUELDISTRIBUTIONSHET.SUM6DEC3"+
     ",ENFUELDISTRIBUTIONSHET.SUM7DEC3"+
     ",ENFUELDISTRIBUTIONSHET.USERGEN"+
     ",ENFUELDISTRIBUTIONSHET.DATEEDIT"+

       ", TKFUELTYPE.CODE " +
      // ", TKFUELTYPE.NAME " +
    		", case  when TKFUELTYPE.code = " + TKFuelType.A92 + " then 'Бензин 92' "+ 
    		" when TKFUELTYPE.code = " + TKFuelType.A95 + " then 'Бензин 95'  "+
    		" when TKFUELTYPE.code = " + TKFuelType.DT + " then 'ДП'  "+
    		" else '' " +
    		" end " +
     " FROM ENFUELDISTRIBUTIONSHET " +
     ", TKFUELTYPE " +
     //" WHERE "
  "";
     whereStr = " TKFUELTYPE.CODE = ENFUELDISTRIBUTIONSHET.FUELTYPEREFCODE" ; //+
    //selectStr = selectStr + " ${s} ENFUELDISTRIBUTIONSHET.CODE IN ( SELECT ENFUELDISTRIBUTIONSHET.CODE FROM ENFUELDISTRIBUTIONSHET ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.CODE = ?";
        }
        if(aFilterObject.monthGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.MONTHGEN = ?";
        }
        if(aFilterObject.yearGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.YEARGEN = ?";
        }
        if(aFilterObject.totalSum != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.TOTALSUM = ?";
        }
        if(aFilterObject.sum1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM1 = ?";
        }
        if(aFilterObject.sum2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM2 = ?";
        }
        if(aFilterObject.sum3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM3 = ?";
        }
        if(aFilterObject.sum4 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM4 = ?";
        }
        if(aFilterObject.sum5 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM5 = ?";
        }
        if(aFilterObject.sum6 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM6 = ?";
        }
        if(aFilterObject.sum7 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM7 = ?";
        }
        if(aFilterObject.sum1dec1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM1DEC1 = ?";
        }
        if(aFilterObject.sum2dec1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM2DEC1 = ?";
        }
        if(aFilterObject.sum3dec1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM3DEC1 = ?";
        }
        if(aFilterObject.sum4dec1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM4DEC1 = ?";
        }
        if(aFilterObject.sum5dec1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM5DEC1 = ?";
        }
        if(aFilterObject.sum6dec1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM6DEC1 = ?";
        }
        if(aFilterObject.sum7dec1 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM7DEC1 = ?";
        }
        if(aFilterObject.sum1dec2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM1DEC2 = ?";
        }
        if(aFilterObject.sum2dec2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM2DEC2 = ?";
        }
        if(aFilterObject.sum3dec2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM3DEC2 = ?";
        }
        if(aFilterObject.sum4dec2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM4DEC2 = ?";
        }
        if(aFilterObject.sum5dec2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM5DEC2 = ?";
        }
        if(aFilterObject.sum6dec2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM6DEC2 = ?";
        }
        if(aFilterObject.sum7dec2 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM7DEC2 = ?";
        }
        if(aFilterObject.sum1dec3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM1DEC3 = ?";
        }
        if(aFilterObject.sum2dec3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM2DEC3 = ?";
        }
        if(aFilterObject.sum3dec3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM3DEC3 = ?";
        }
        if(aFilterObject.sum4dec3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM4DEC3 = ?";
        }
        if(aFilterObject.sum5dec3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM5DEC3 = ?";
        }
        if(aFilterObject.sum6dec3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM6DEC3 = ?";
        }
        if(aFilterObject.sum7dec3 != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.SUM7DEC3 = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENFUELDISTRIBUTIONSHET.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENFUELDISTRIBUTIONSHET.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENFUELDISTRIBUTIONSHET.MODIFY_TIME = ?";
        }
        if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENFUELDISTRIBUTIONSHET.FUELTYPEREFCODE = ? ";
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
        if(aFilterObject.sum1 != null){
            number++;
            aFilterObject.sum1 = aFilterObject.sum1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum1);
        }
        if(aFilterObject.sum2 != null){
            number++;
            aFilterObject.sum2 = aFilterObject.sum2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum2);
        }
        if(aFilterObject.sum3 != null){
            number++;
            aFilterObject.sum3 = aFilterObject.sum3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum3);
        }
        if(aFilterObject.sum4 != null){
            number++;
            aFilterObject.sum4 = aFilterObject.sum4.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum4);
        }
        if(aFilterObject.sum5 != null){
            number++;
            aFilterObject.sum5 = aFilterObject.sum5.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum5);
        }
        if(aFilterObject.sum6 != null){
            number++;
            aFilterObject.sum6 = aFilterObject.sum6.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum6);
        }
        if(aFilterObject.sum7 != null){
            number++;
            aFilterObject.sum7 = aFilterObject.sum7.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum7);
        }
        if(aFilterObject.sum1dec1 != null){
            number++;
            aFilterObject.sum1dec1 = aFilterObject.sum1dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum1dec1);
        }
        if(aFilterObject.sum2dec1 != null){
            number++;
            aFilterObject.sum2dec1 = aFilterObject.sum2dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum2dec1);
        }
        if(aFilterObject.sum3dec1 != null){
            number++;
            aFilterObject.sum3dec1 = aFilterObject.sum3dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum3dec1);
        }
        if(aFilterObject.sum4dec1 != null){
            number++;
            aFilterObject.sum4dec1 = aFilterObject.sum4dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum4dec1);
        }
        if(aFilterObject.sum5dec1 != null){
            number++;
            aFilterObject.sum5dec1 = aFilterObject.sum5dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum5dec1);
        }
        if(aFilterObject.sum6dec1 != null){
            number++;
            aFilterObject.sum6dec1 = aFilterObject.sum6dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum6dec1);
        }
        if(aFilterObject.sum7dec1 != null){
            number++;
            aFilterObject.sum7dec1 = aFilterObject.sum7dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum7dec1);
        }
        if(aFilterObject.sum1dec2 != null){
            number++;
            aFilterObject.sum1dec2 = aFilterObject.sum1dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum1dec2);
        }
        if(aFilterObject.sum2dec2 != null){
            number++;
            aFilterObject.sum2dec2 = aFilterObject.sum2dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum2dec2);
        }
        if(aFilterObject.sum3dec2 != null){
            number++;
            aFilterObject.sum3dec2 = aFilterObject.sum3dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum3dec2);
        }
        if(aFilterObject.sum4dec2 != null){
            number++;
            aFilterObject.sum4dec2 = aFilterObject.sum4dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum4dec2);
        }
        if(aFilterObject.sum5dec2 != null){
            number++;
            aFilterObject.sum5dec2 = aFilterObject.sum5dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum5dec2);
        }
        if(aFilterObject.sum6dec2 != null){
            number++;
            aFilterObject.sum6dec2 = aFilterObject.sum6dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum6dec2);
        }
        if(aFilterObject.sum7dec2 != null){
            number++;
            aFilterObject.sum7dec2 = aFilterObject.sum7dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum7dec2);
        }
        if(aFilterObject.sum1dec3 != null){
            number++;
            aFilterObject.sum1dec3 = aFilterObject.sum1dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum1dec3);
        }
        if(aFilterObject.sum2dec3 != null){
            number++;
            aFilterObject.sum2dec3 = aFilterObject.sum2dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum2dec3);
        }
        if(aFilterObject.sum3dec3 != null){
            number++;
            aFilterObject.sum3dec3 = aFilterObject.sum3dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum3dec3);
        }
        if(aFilterObject.sum4dec3 != null){
            number++;
            aFilterObject.sum4dec3 = aFilterObject.sum4dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum4dec3);
        }
        if(aFilterObject.sum5dec3 != null){
            number++;
            aFilterObject.sum5dec3 = aFilterObject.sum5dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum5dec3);
        }
        if(aFilterObject.sum6dec3 != null){
            number++;
            aFilterObject.sum6dec3 = aFilterObject.sum6dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum6dec3);
        }
        if(aFilterObject.sum7dec3 != null){
            number++;
            aFilterObject.sum7dec3 = aFilterObject.sum7dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sum7dec3);
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

        anObject = new ENFuelDistributionSheetShort();

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
        anObject.sum1 = set.getBigDecimal(5);
        if(anObject.sum1 != null)
            anObject.sum1 = anObject.sum1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum2 = set.getBigDecimal(6);
        if(anObject.sum2 != null)
            anObject.sum2 = anObject.sum2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum3 = set.getBigDecimal(7);
        if(anObject.sum3 != null)
            anObject.sum3 = anObject.sum3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum4 = set.getBigDecimal(8);
        if(anObject.sum4 != null)
            anObject.sum4 = anObject.sum4.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum5 = set.getBigDecimal(9);
        if(anObject.sum5 != null)
            anObject.sum5 = anObject.sum5.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum6 = set.getBigDecimal(10);
        if(anObject.sum6 != null)
            anObject.sum6 = anObject.sum6.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum7 = set.getBigDecimal(11);
        if(anObject.sum7 != null)
            anObject.sum7 = anObject.sum7.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum1dec1 = set.getBigDecimal(12);
        if(anObject.sum1dec1 != null)
            anObject.sum1dec1 = anObject.sum1dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum2dec1 = set.getBigDecimal(13);
        if(anObject.sum2dec1 != null)
            anObject.sum2dec1 = anObject.sum2dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum3dec1 = set.getBigDecimal(14);
        if(anObject.sum3dec1 != null)
            anObject.sum3dec1 = anObject.sum3dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum4dec1 = set.getBigDecimal(15);
        if(anObject.sum4dec1 != null)
            anObject.sum4dec1 = anObject.sum4dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum5dec1 = set.getBigDecimal(16);
        if(anObject.sum5dec1 != null)
            anObject.sum5dec1 = anObject.sum5dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum6dec1 = set.getBigDecimal(17);
        if(anObject.sum6dec1 != null)
            anObject.sum6dec1 = anObject.sum6dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum7dec1 = set.getBigDecimal(18);
        if(anObject.sum7dec1 != null)
            anObject.sum7dec1 = anObject.sum7dec1.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum1dec2 = set.getBigDecimal(19);
        if(anObject.sum1dec2 != null)
            anObject.sum1dec2 = anObject.sum1dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum2dec2 = set.getBigDecimal(20);
        if(anObject.sum2dec2 != null)
            anObject.sum2dec2 = anObject.sum2dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum3dec2 = set.getBigDecimal(21);
        if(anObject.sum3dec2 != null)
            anObject.sum3dec2 = anObject.sum3dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum4dec2 = set.getBigDecimal(22);
        if(anObject.sum4dec2 != null)
            anObject.sum4dec2 = anObject.sum4dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum5dec2 = set.getBigDecimal(23);
        if(anObject.sum5dec2 != null)
            anObject.sum5dec2 = anObject.sum5dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum6dec2 = set.getBigDecimal(24);
        if(anObject.sum6dec2 != null)
            anObject.sum6dec2 = anObject.sum6dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum7dec2 = set.getBigDecimal(25);
        if(anObject.sum7dec2 != null)
            anObject.sum7dec2 = anObject.sum7dec2.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum1dec3 = set.getBigDecimal(26);
        if(anObject.sum1dec3 != null)
            anObject.sum1dec3 = anObject.sum1dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum2dec3 = set.getBigDecimal(27);
        if(anObject.sum2dec3 != null)
            anObject.sum2dec3 = anObject.sum2dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum3dec3 = set.getBigDecimal(28);
        if(anObject.sum3dec3 != null)
            anObject.sum3dec3 = anObject.sum3dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum4dec3 = set.getBigDecimal(29);
        if(anObject.sum4dec3 != null)
            anObject.sum4dec3 = anObject.sum4dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum5dec3 = set.getBigDecimal(30);
        if(anObject.sum5dec3 != null)
            anObject.sum5dec3 = anObject.sum5dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum6dec3 = set.getBigDecimal(31);
        if(anObject.sum6dec3 != null)
            anObject.sum6dec3 = anObject.sum6dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sum7dec3 = set.getBigDecimal(32);
        if(anObject.sum7dec3 != null)
            anObject.sum7dec3 = anObject.sum7dec3.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userGen = set.getString(33);
        anObject.dateEdit = set.getTimestamp(34);

        anObject.fuelTypeRefCode = set.getInt(35);
    if(set.wasNull())
      anObject.fuelTypeRefCode = Integer.MIN_VALUE;
        anObject.fuelTypeRefName = set.getString(36);

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

  

} // end of ENFuelDistributionSheetDAO
