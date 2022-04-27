
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
import java.util.Date;
import java.util.Vector;

import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.dataminer.generated.ENAccumulatorsHistoryDAOGen;
import com.ksoe.energynet.valueobject.ENAccumulatorStatus;
import com.ksoe.energynet.valueobject.ENAccumulators;
import com.ksoe.energynet.valueobject.ENAccumulatorsHistory;
import com.ksoe.energynet.valueobject.brief.ENAccumulatorsHistoryShort;
import com.ksoe.energynet.valueobject.lists.ENAccumulatorsHistoryShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;

  /**
  *  DAO Object for ENAccumulatorsHistory;
  *
  */

public class ENAccumulatorsHistoryDAO extends ENAccumulatorsHistoryDAOGen {


  public ENAccumulatorsHistoryDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENAccumulatorsHistoryDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public ENAccumulatorsHistoryShortList getScrollableFilteredList(ENAccumulatorsHistory aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENAccumulatorsHistoryShortList result = new ENAccumulatorsHistoryShortList();
    ENAccumulatorsHistoryShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACCUMULATORSHISTORY.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENACCUMULATORSHISTORY.CODE"+
     ",ENACCUMULATORSHISTORY.INSTALLDATE"+
     ",ENACCUMULATORSHISTORY.UNINSTALLDATE"+
     ",ENACCUMULATORSHISTORY.DISTANCE"+
     ",ENACCUMULATORSHISTORY.REPLACEMENTREASON"+

     ", ENACCUMULATORS.CODE " +
     ", ENACCUMULATORS.NAME " +
     ", ENACCUMULATORS.TYPENAME " +
     ", ENACCUMULATORS.FACTORY " +
     ", ENACCUMULATORS.GARAGENUMBER " +
     ", ENACCUMULATORS.YEARPRODUCTION " +
     ", ENACCUMULATORS.SERIALNUMBER " +
     ", ENACCUMULATORS.RECEIPTDATE " +
     ", ENACCUMULATORS.MILEAGE " +
     ", ENACCUMULATORS.MILEAGEALL " +
     ", ENACCUMULATORS.POTENCIAL " +
     ", ENACCUMULATORSHISTORY.TRANSPORTREALREFCODE" +

     " FROM ENACCUMULATORSHISTORY " +
     ", ENACCUMULATORS " +
     //" WHERE "
    "";
     whereStr = " ENACCUMULATORS.CODE = ENACCUMULATORSHISTORY.ACCUMULATORSREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENACCUMULATORSHISTORY.CODE IN ( SELECT ENACCUMULATORSHISTORY.CODE FROM ENACCUMULATORSHISTORY ";

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSHISTORY.CODE = ?";
        }
        if(aFilterObject.installDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSHISTORY.INSTALLDATE = ?";
        }
        if(aFilterObject.uninstallDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSHISTORY.UNINSTALLDATE = ?";
        }
        if(aFilterObject.distance != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSHISTORY.DISTANCE = ?";
        }
         if (aFilterObject.replacementReason != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.replacementReason.indexOf('*',0) < 0 && aFilterObject.replacementReason.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACCUMULATORSHISTORY.REPLACEMENTREASON) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACCUMULATORSHISTORY.REPLACEMENTREASON) LIKE UPPER(?)";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACCUMULATORSHISTORY.DOMAIN_INFO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACCUMULATORSHISTORY.DOMAIN_INFO) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACCUMULATORSHISTORY.MODIFY_TIME = ?";
        }
        if(aFilterObject.accumulatorsRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACCUMULATORSHISTORY.ACCUMULATORSREFCODE = ? ";
        }
        if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACCUMULATORSHISTORY.TRANSPORTREALREFCODE = ? ";
        }

      }


    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAccumulatorsHistory.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENAccumulatorsHistory.getList%} access denied");

    String domainWhereStr = SegregationQueryBuilder.addWhere("ENACCUMULATORSHISTORY",segregationInfo,getUserProfile().getDomainInfo());

    if (domainWhereStr.length() != 0){
    // domainWhereStr = "  AND ENACCUMULATORSHISTORY.DOMAIN_INFO IS NOT NULL";
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
        if(aFilterObject.installDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.installDate.getTime()));
        }
        if(aFilterObject.uninstallDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.uninstallDate.getTime()));
        }
        if(aFilterObject.distance != null){
            number++;
            aFilterObject.distance = aFilterObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.distance);
        }

           if(aFilterObject.replacementReason != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.replacementReason);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
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
       if(aFilterObject.accumulatorsRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.accumulatorsRef.code);
       }
       if(aFilterObject.transportRealRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportRealRef.code);
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

        anObject = new ENAccumulatorsHistoryShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.installDate = set.getDate(2);
        anObject.uninstallDate = set.getDate(3);
        anObject.distance = set.getBigDecimal(4);
        if(anObject.distance != null)
            anObject.distance = anObject.distance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.replacementReason = set.getString(5);

        anObject.accumulatorsRefCode = set.getInt(6);
        if(set.wasNull())
        anObject.accumulatorsRefCode = Integer.MIN_VALUE;
        anObject.accumulatorsRefName = set.getString(7);
        anObject.accumulatorsRefTypeName = set.getString(8);
        anObject.accumulatorsRefFactory = set.getString(9);
        anObject.accumulatorsRefGarageNumber = set.getString(10);
        anObject.accumulatorsRefYearProduction = set.getString(11);
        anObject.accumulatorsRefSerialNumber = set.getString(12);
        anObject.accumulatorsRefReceiptDate = set.getDate(13);
        anObject.accumulatorsRefMileage = set.getBigDecimal(14);
        if(anObject.accumulatorsRefMileage != null)
          anObject.accumulatorsRefMileage = anObject.accumulatorsRefMileage.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.accumulatorsRefMileageAll = set.getBigDecimal(15);
        if(anObject.accumulatorsRefMileageAll != null)
          anObject.accumulatorsRefMileageAll = anObject.accumulatorsRefMileageAll.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.accumulatorsRefPotencial = set.getBigDecimal(16);
        if(anObject.accumulatorsRefPotencial != null)
          anObject.accumulatorsRefPotencial = anObject.accumulatorsRefPotencial.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.transportRealRefCode = set.getInt(17);
        if(set.wasNull())
        anObject.transportRealRefCode = Integer.MIN_VALUE;

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

    public int add(ENAccumulatorsHistory anObject) throws PersistenceException {
        UserProfile userProfile = getUserProfile();
        Connection connection = getConnection();
        try {
            if (anObject.installDate != null && anObject.uninstallDate == null) {
                ENAccumulatorsDAO acDao = new ENAccumulatorsDAO(
                        getUserProfile(), getConnection());
                ENAccumulators accum = acDao.getObject(anObject.accumulatorsRef.code);
                accum.installStatusRef.code = ENAccumulatorStatus.YES;
                acDao.save(accum);
            }
            return super.add(anObject);
        } finally {
            if (connection != super.getConnection()) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    public void save(ENAccumulatorsHistory anObject)
            throws PersistenceException {
        UserProfile userProfile = getUserProfile();
        Connection connection = getConnection();
        try {
            if (anObject.installDate != null && anObject.uninstallDate != null) {
                ENAccumulatorsDAO acDao = new ENAccumulatorsDAO(
                        getUserProfile(), getConnection());
                ENAccumulators accum = acDao.getObject(anObject.accumulatorsRef.code);
                accum.installStatusRef.code = ENAccumulatorStatus.NO;
                acDao.save(accum);
            }
            super.save(anObject);
        } finally {
            if (connection != super.getConnection()) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    public Date getLastUninstallDate(int accumulatorsCode) throws PersistenceException {
        Connection connection = getConnection();
        PreparedStatement statement = null;
        Date lastUninstallDate = null;

        try {
            String selectStr =
                " select max(ah.uninstalldate) from enaccumulatorshistory ah " +
                " where ah.accumulatorsrefcode = " + accumulatorsCode;

            statement = connection.prepareStatement(selectStr);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                lastUninstallDate = resultSet.getDate(1);
            }

            resultSet.close();

            return lastUninstallDate;
        } catch (SQLException e) {
            throw new PersistenceException(
                    "Can't get lastUninstallDate for ENAccumulator", e);
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            if (connection != super.getConnection()) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    public Date getLastInstallDate(int accumulatorsCode) throws PersistenceException {
        Connection connection = getConnection();
        PreparedStatement statement = null;
        Date lastInstallDate = null;

        try {
            String selectStr =
                " select max(ah.installdate) from enaccumulatorshistory ah " +
                " where ah.accumulatorsrefcode = " + accumulatorsCode;

            statement = connection.prepareStatement(selectStr);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                lastInstallDate = resultSet.getDate(1);
            }

            resultSet.close();

            return lastInstallDate;
        } catch (SQLException e) {
            throw new PersistenceException(
                    "Can't get lastInstallDate for ENAccumulator", e);
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            if (connection != super.getConnection()) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }

} // end of ENAccumulatorsHistoryDAO