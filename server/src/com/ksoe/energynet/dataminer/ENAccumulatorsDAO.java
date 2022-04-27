
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.dataminer.generated.ENAccumulatorsDAOGen;
import com.ksoe.energynet.valueobject.ENAccumulators;
import com.ksoe.energynet.valueobject.brief.ENAccumulatorsShort;
import com.ksoe.energynet.valueobject.lists.ENAccumulatorsShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;

  /**
  *  DAO Object for ENAccumulators;
  *
  */

public class ENAccumulatorsDAO extends ENAccumulatorsDAOGen {


  public ENAccumulatorsDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENAccumulatorsDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public ENAccumulatorsShortList getScrollableFilteredList(ENAccumulators aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENAccumulatorsShortList result = new ENAccumulatorsShortList();
    ENAccumulatorsShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACCUMULATORS.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENACCUMULATORS.CODE"+
     ",ENACCUMULATORS.NAME"+
     ",ENACCUMULATORS.TYPENAME"+
     ",ENACCUMULATORS.FACTORY"+
     ",ENACCUMULATORS.GARAGENUMBER"+
     ",ENACCUMULATORS.YEARPRODUCTION"+
     ",ENACCUMULATORS.SERIALNUMBER"+
     ",ENACCUMULATORS.RECEIPTDATE"+
     ",ENACCUMULATORS.MILEAGE"+
     ",ENACCUMULATORS.MILEAGEALL"+
     ",ENACCUMULATORS.POTENCIAL"+

     ", ENACCUMULATORS.MATERIALREFCODE" +
     ", ENACCUMULATORSTATUS.CODE " +
     ", ENACCUMULATORSTATUS.NAME " +

     " FROM ENACCUMULATORS " +
     ", ENACCUMULATORSTATUS " +
     //" WHERE "
    "";
     whereStr = " ENACCUMULATORSTATUS.CODE = ENACCUMULATORS.INSTALLSTATUSREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENACCUMULATORS.CODE IN ( SELECT ENACCUMULATORS.CODE FROM ENACCUMULATORS ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORS.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACCUMULATORS.NAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACCUMULATORS.NAME) LIKE UPPER(?)";
         }
         if (aFilterObject.typeName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.typeName.indexOf('*',0) < 0 && aFilterObject.typeName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACCUMULATORS.TYPENAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACCUMULATORS.TYPENAME) LIKE UPPER(?)";
         }
         if (aFilterObject.factory != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.factory.indexOf('*',0) < 0 && aFilterObject.factory.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACCUMULATORS.FACTORY) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACCUMULATORS.FACTORY) LIKE UPPER(?)";
         }
         if (aFilterObject.garageNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.garageNumber.indexOf('*',0) < 0 && aFilterObject.garageNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACCUMULATORS.GARAGENUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACCUMULATORS.GARAGENUMBER) LIKE UPPER(?)";
         }
         if (aFilterObject.yearProduction != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.yearProduction.indexOf('*',0) < 0 && aFilterObject.yearProduction.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACCUMULATORS.YEARPRODUCTION) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACCUMULATORS.YEARPRODUCTION) LIKE UPPER(?)";
         }
         if (aFilterObject.serialNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.serialNumber.indexOf('*',0) < 0 && aFilterObject.serialNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACCUMULATORS.SERIALNUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACCUMULATORS.SERIALNUMBER) LIKE UPPER(?)";
         }
        if(aFilterObject.receiptDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORS.RECEIPTDATE = ?";
        }
        if(aFilterObject.mileage != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORS.MILEAGE = ?";
        }
        if(aFilterObject.mileageAll != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORS.MILEAGEALL = ?";
        }
        if(aFilterObject.potencial != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORS.POTENCIAL = ?";
        }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACCUMULATORS.DOMAIN_INFO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACCUMULATORS.DOMAIN_INFO) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORS.MODIFY_TIME = ?";
        }
        if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACCUMULATORS.MATERIALREFCODE = ? ";
        }
        if(aFilterObject.installStatusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACCUMULATORS.INSTALLSTATUSREFCODE = ? ";
        }

      }


    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAccumulators.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENAccumulators.getList%} access denied");

    String domainWhereStr = SegregationQueryBuilder.addWhere("ENACCUMULATORS",segregationInfo,getUserProfile().getDomainInfo());

    if (domainWhereStr.length() != 0){
    // domainWhereStr = "  AND ENACCUMULATORS.DOMAIN_INFO IS NOT NULL";
    //else
    if (whereStr.length() == 0)
        whereStr = domainWhereStr;
    else
        whereStr = " "+whereStr + " AND " +domainWhereStr;
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

           if(aFilterObject.typeName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.typeName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.factory != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.factory);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.garageNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.garageNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.yearProduction != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.yearProduction);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.serialNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.serialNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.receiptDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.receiptDate.getTime()));
        }
        if(aFilterObject.mileage != null){
            number++;
            aFilterObject.mileage = aFilterObject.mileage.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.mileage);
        }
        if(aFilterObject.mileageAll != null){
            number++;
            aFilterObject.mileageAll = aFilterObject.mileageAll.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.mileageAll);
        }
        if(aFilterObject.potencial != null){
            number++;
            aFilterObject.potencial = aFilterObject.potencial.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.potencial);
        }

           if(aFilterObject.domain_info != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.domain_info);
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
       if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.materialRef.code);
       }
       if(aFilterObject.installStatusRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.installStatusRef.code);
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

        anObject = new ENAccumulatorsShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.name = set.getString(2);
        anObject.typeName = set.getString(3);
        anObject.factory = set.getString(4);
        anObject.garageNumber = set.getString(5);
        anObject.yearProduction = set.getString(6);
        anObject.serialNumber = set.getString(7);
        anObject.receiptDate = set.getDate(8);
        anObject.mileage = set.getBigDecimal(9);
        if(anObject.mileage != null)
            anObject.mileage = anObject.mileage.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.mileageAll = set.getBigDecimal(10);
        if(anObject.mileageAll != null)
            anObject.mileageAll = anObject.mileageAll.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.potencial = set.getBigDecimal(11);
        if(anObject.potencial != null)
            anObject.potencial = anObject.potencial.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.materialRefCode = set.getInt(12);
        if(set.wasNull())
        anObject.materialRefCode = Integer.MIN_VALUE;
        anObject.installStatusRefCode = set.getInt(13);
        if(set.wasNull())
        anObject.installStatusRefCode = Integer.MIN_VALUE;
        anObject.installStatusRefName = set.getString(14);

         result.list.add(anObject);
       }

      result.setTotalCount(i);
      return result;
     }
    catch(SQLException e)
     {
      System.out.println(e.getMessage()+"\nstatement - "+selectStr);
      EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
      return null;
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

} // end of ENAccumulatorsDAO

