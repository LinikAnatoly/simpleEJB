
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

import com.ksoe.energynet.dataminer.generated.ENActIncomeTechConditionsDAOGen;
import com.ksoe.energynet.valueobject.ENActIncomeTechConditions;
import com.ksoe.energynet.valueobject.brief.ENActIncomeTechConditionsShort;
import com.ksoe.energynet.valueobject.filter.ENActIncomeTechConditionsFilter;
import com.ksoe.energynet.valueobject.lists.ENActIncomeTechConditionsShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENActIncomeTechConditions;
  *
  */

public class ENActIncomeTechConditionsDAO extends ENActIncomeTechConditionsDAOGen {

  public ENActIncomeTechConditionsDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENActIncomeTechConditionsDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public ENActIncomeTechConditionsShortList getScrollableFilteredList(ENActIncomeTechConditions aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENActIncomeTechConditionsShortList result = new ENActIncomeTechConditionsShortList();
    ENActIncomeTechConditionsShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACTINCOMETECHCONDTNS.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENACTINCOMETECHCONDTNS.CODE"+
     ",ENACTINCOMETECHCONDTNS.NUMBERGEN"+
     ",ENACTINCOMETECHCONDTNS.DATEGEN"+
     ",ENACTINCOMETECHCONDTNS.ACTDATESTART"+
     ",ENACTINCOMETECHCONDTNS.ACTDATEEND"+
     ",ENACTINCOMETECHCONDTNS.SUMMAGEN"+
     ",ENACTINCOMETECHCONDTNS.SUMMAVAT"+

      ", ENTECHCONDITIONSSERVCS.CODE " +
      ", ENTECHCONDITIONSSERVCS.CONTRACTNUMBER " +
      ", ENTECHCONDITIONSSERVCS.CONTRACTDATE " +
      ", ENTECHCONDITIONSSERVCS.FINCONTRACTNUMBER " +
      ", ENTECHCONDITIONSSERVCS.FINCONTRACTDATE " +
      ", ENTECHCONDITIONSSERVCS.PARTNERNAME " +
      ", ENTECHCONDITIONSSERVCS.PARTNERCODE " +
      ", ENTECHCONDITIONSSERVCS.FINDOCCODE " +
      ", ENTECHCONDITIONSSERVCS.FINDOCID " +
      ", ENTECHCONDITIONSSERVCS.FINCOMMENTGEN " +
      ", ENTECHCONDITIONSSERVCS.TYSUMMAGEN " +
      ", ENTECHCONDITIONSSERVCS.TYSUMMAVAT " +
      ", ENTECHCONDITIONSSERVCS.TYSERVICESSUMMA " +
      ", ENTECHCONDITIONSSERVCS.TYSERVICESPOWER " +
      ", ENTECHCONDITIONSSERVCS.COMMENTSERVICESGEN " +
      ", ENTECHCONDITIONSSERVCS.USERGEN " +
      ", ENTECHCONDITIONSSERVCS.DATEEDIT " +
      ", ENTECHCONDITIONSSERVCS.CNPACKCODE " +
      ", ENACTINCOMESTATUS.CODE " +
      ", ENACTINCOMESTATUS.NAME " +

     " FROM ENACTINCOMETECHCONDTNS " +
     ", ENTECHCONDITIONSSERVCS " +
     ", ENACTINCOMESTATUS " +


      "";
      whereStr = " ENTECHCONDITIONSSERVCS.CODE = ENACTINCOMETECHCONDTNS.TECHCONDSERVICESREFCOD" ; //+
      whereStr = whereStr +" AND ENACTINCOMESTATUS.CODE = ENACTINCOMETECHCONDTNS.STATUSREFCODE" ; //+

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.CODE = ?";
        }
         if (aFilterObject.numbergen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numbergen.indexOf('*',0) < 0 && aFilterObject.numbergen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACTINCOMETECHCONDTNS.NUMBERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACTINCOMETECHCONDTNS.NUMBERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dategen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.DATEGEN = ?";
        }
        if(aFilterObject.actDateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.ACTDATESTART = ?";
        }
        if(aFilterObject.actDateEnd != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.ACTDATEEND = ?";
        }
        if(aFilterObject.summaGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.SUMMAGEN = ?";
        }
        if(aFilterObject.summaVat != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.SUMMAVAT = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACTINCOMETECHCONDTNS.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACTINCOMETECHCONDTNS.COMMENTGEN) LIKE UPPER(?)";
         }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACTINCOMETECHCONDTNS.DOMAIN_INFO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACTINCOMETECHCONDTNS.DOMAIN_INFO) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.MODIFY_TIME = ?";
        }
        if(aFilterObject.techCondServicesRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACTINCOMETECHCONDTNS.TECHCONDSERVICESREFCOD = ? ";
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACTINCOMETECHCONDTNS.STATUSREFCODE = ? ";
        }

      }


    /*
    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENActIncomeTechConditions.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENActIncomeTechConditions.getList%} access denied");

    String domainWhereStr = SegregationQueryBuilder.addWhere("ENACTINCOMETECHCONDTNS",segregationInfo,getUserProfile().getDomainInfo());

    if (domainWhereStr.length() != 0){
    // domainWhereStr = "  AND ENACTINCOMETECHCONDTNS.DOMAIN_INFO IS NOT NULL";
    //else
    if (whereStr.length() == 0)
        whereStr = domainWhereStr;
    else
        whereStr = " "+whereStr + " AND " +domainWhereStr;
    }
    */


      if(condition.length() != 0)
      {
         if(whereStr.length() != 0)
            whereStr = whereStr + " AND ";

         whereStr = whereStr + " (" + condition + ")";
      }

     if(whereStr.length() != 0)
         selectStr = selectStr + " WHERE " + whereStr;

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

           if(aFilterObject.numbergen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.numbergen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.dategen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dategen.getTime()));
        }
        if(aFilterObject.actDateStart != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.actDateStart.getTime()));
        }
        if(aFilterObject.actDateEnd != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.actDateEnd.getTime()));
        }
        if(aFilterObject.summaGen != null){
            number++;
            aFilterObject.summaGen = aFilterObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.summaGen);
        }
        if(aFilterObject.summaVat != null){
            number++;
            aFilterObject.summaVat = aFilterObject.summaVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.summaVat);
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
       if(aFilterObject.techCondServicesRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.techCondServicesRef.code);
       }
       if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.statusRef.code);
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

        anObject = new ENActIncomeTechConditionsShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.numbergen = set.getString(2);
        anObject.dategen = set.getDate(3);
        anObject.actDateStart = set.getDate(4);
        anObject.actDateEnd = set.getDate(5);
        anObject.summaGen = set.getBigDecimal(6);
        if(anObject.summaGen != null)
            anObject.summaGen = anObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.summaVat = set.getBigDecimal(7);
        if(anObject.summaVat != null)
            anObject.summaVat = anObject.summaVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.techCondServicesRefCode = set.getInt(8);
        if(set.wasNull())
        anObject.techCondServicesRefCode = Integer.MIN_VALUE;
        anObject.techCondServicesRefContractNumber = set.getString(9);
        anObject.techCondServicesRefContractDate = set.getDate(10);
        anObject.techCondServicesRefFinContractNumber = set.getString(11);
        anObject.techCondServicesRefFinContractDate = set.getDate(12);
        anObject.techCondServicesRefPartnerName = set.getString(13);
        anObject.techCondServicesRefPartnerCode = set.getString(14);
        anObject.techCondServicesRefFinDocCode = set.getString(15);
        anObject.techCondServicesRefFinDocID = set.getInt(16);
        if(set.wasNull())
        anObject.techCondServicesRefFinDocID = Integer.MIN_VALUE;
        anObject.techCondServicesRefFinCommentGen = set.getString(17);
        anObject.techCondServicesRefTySummaGen = set.getBigDecimal(18);
        if(anObject.techCondServicesRefTySummaGen != null)
          anObject.techCondServicesRefTySummaGen = anObject.techCondServicesRefTySummaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techCondServicesRefTySummaVat = set.getBigDecimal(19);
        if(anObject.techCondServicesRefTySummaVat != null)
          anObject.techCondServicesRefTySummaVat = anObject.techCondServicesRefTySummaVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techCondServicesRefTyServicesSumma = set.getBigDecimal(20);
        if(anObject.techCondServicesRefTyServicesSumma != null)
          anObject.techCondServicesRefTyServicesSumma = anObject.techCondServicesRefTyServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techCondServicesRefTyServicesPower = set.getBigDecimal(21);
        if(anObject.techCondServicesRefTyServicesPower != null)
          anObject.techCondServicesRefTyServicesPower = anObject.techCondServicesRefTyServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.techCondServicesRefCommentServicesGen = set.getString(22);
        anObject.techCondServicesRefUserGen = set.getString(23);
        anObject.techCondServicesRefDateEdit = set.getDate(24);
        anObject.techCondServicesRefCnPackCode = set.getInt(25);
        if(set.wasNull())
        anObject.techCondServicesRefCnPackCode = Integer.MIN_VALUE;
        anObject.statusRefCode = set.getInt(26);
        if(set.wasNull())
        anObject.statusRefCode = Integer.MIN_VALUE;
        anObject.statusRefName = set.getString(27);

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


    public void loadObject(ENActIncomeTechConditions anObject)
            throws PersistenceException {
        String selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;

        if (getUserProfile() == null)
            throw new PersistenceException(
                    "Internal Error (User Profile Is Undefined)");

        selectStr = "SELECT ENACTINCOMETECHCONDTNS.CODE, ENACTINCOMETECHCONDTNS.NUMBERGEN, ENACTINCOMETECHCONDTNS.DATEGEN, " +
                " ENACTINCOMETECHCONDTNS.ACTDATESTART, ENACTINCOMETECHCONDTNS.ACTDATEEND, ENACTINCOMETECHCONDTNS.SUMMAGEN, " +
                " ENACTINCOMETECHCONDTNS.SUMMAVAT, ENACTINCOMETECHCONDTNS.COMMENTGEN, ENACTINCOMETECHCONDTNS.DOMAIN_INFO, " +
                " ENACTINCOMETECHCONDTNS.MODIFY_TIME, ENACTINCOMETECHCONDTNS.TECHCONDSERVICESREFCOD, ENACTINCOMETECHCONDTNS.STATUSREFCODE, " +
                " ENACTINCOMETECHCONDTNS.WARRANTREFCODE " +
                " FROM ENACTINCOMETECHCONDTNS WHERE ENACTINCOMETECHCONDTNS.CODE = ?";

        try {
            statement = connection.prepareStatement(selectStr);
            statement.setInt(1, anObject.code);
            set = statement.executeQuery();
            if (!set.next())
                anObject.code = Integer.MIN_VALUE;
            else {
                anObject.code = set.getInt(1);
                anObject.numbergen = set.getString(2);
                anObject.dategen = set.getDate(3);
                anObject.actDateStart = set.getDate(4);
                anObject.actDateEnd = set.getDate(5);
                anObject.summaGen = set.getBigDecimal(6);
                if (anObject.summaGen != null)
                    anObject.summaGen = anObject.summaGen.setScale(6,
                            java.math.BigDecimal.ROUND_HALF_UP);
                anObject.summaVat = set.getBigDecimal(7);
                if (anObject.summaVat != null)
                    anObject.summaVat = anObject.summaVat.setScale(6,
                            java.math.BigDecimal.ROUND_HALF_UP);
                anObject.commentGen = set.getString(8);
                anObject.domain_info = set.getString(9);
                anObject.modify_time = set.getLong(10);
                if (set.wasNull())
                    anObject.modify_time = Long.MIN_VALUE;
                anObject.techCondServicesRef.code = set.getInt(11);
                if (set.wasNull())
                    anObject.techCondServicesRef.code = Integer.MIN_VALUE;
                anObject.statusRef.code = set.getInt(12);
                if (set.wasNull())
                    anObject.statusRef.code = Integer.MIN_VALUE;
                anObject.warrantRef.code = set.getInt(13);
                if (set.wasNull())
                    anObject.warrantRef.code = Integer.MIN_VALUE;
                if (anObject.techCondServicesRef.code != Integer.MIN_VALUE) {
                    anObject.setTechCondServicesRef(new com.ksoe.energynet.dataminer.generated.ENTechConditionsServicesDAOGen(
                            connection, getUserProfile()).getRef(anObject.techCondServicesRef.code));
                }
                if (anObject.statusRef.code != Integer.MIN_VALUE) {
                    anObject.setStatusRef(new com.ksoe.energynet.dataminer.generated.ENActIncomeStatusDAOGen(
                            connection, getUserProfile()).getRef(anObject.statusRef.code));
                }
                if (anObject.warrantRef.code != Integer.MIN_VALUE) {
                    anObject.setWarrantRef(new com.ksoe.energynet.dataminer.generated.ENWarrantDAOGen(
                            connection, getUserProfile()).getRef(anObject.warrantRef.code));
                }
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + selectStr);
            EnergyproPersistenceExceptionAnalyzer.analyser
                    .throwPersistenceException(e);
        } finally {
            try {
                if (set != null)
                    set.close();
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


    public ENActIncomeTechConditions getObject(int uid)
            throws PersistenceException {
        ENActIncomeTechConditions result = new ENActIncomeTechConditions();
        result.code = uid;
        loadObject(result);
        if (result.code == Integer.MIN_VALUE)
            return null;
        return result;
    }


    public boolean exists(int anObjectCode) throws PersistenceException {
        String selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;

        if (anObjectCode == Integer.MIN_VALUE)
            return false;

        if (getUserProfile() == null)
            throw new PersistenceException(
                    "Internal Error (User Profile Is Undefined)");

        selectStr =

        "SELECT ENACTINCOMETECHCONDTNS.CODE FROM  ENACTINCOMETECHCONDTNS WHERE  ENACTINCOMETECHCONDTNS.CODE = ?";

        try {
            statement = connection.prepareStatement(selectStr);
            statement.setInt(1, anObjectCode);
            set = statement.executeQuery();
            if (set.next())
                return true;
            return false;
        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + selectStr);
            EnergyproPersistenceExceptionAnalyzer.analyser
                    .throwPersistenceException(e);
            return false;
        } finally {
            try {
                if (set != null)
                    set.close();
            } catch (SQLException e) {
            }
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


    public int[] getFilteredCodeArray(
            ENActIncomeTechConditionsFilter aFilterObject, int fromPosition,
            int quantity) throws PersistenceException {
        return getFilteredCodeArray(
                aFilterObject,
                (aFilterObject == null) ? (null) : (aFilterObject.conditionSQL),
                (aFilterObject == null) ? (null) : (aFilterObject.orderBySQL),
                fromPosition, quantity, null);
    }


    public int[] getFilteredCodeArray(ENActIncomeTechConditions aFilterObject,
            String anCondition, String anOrderBy, int fromPosition,
            int quantity, Vector aBindObjects) throws PersistenceException {
      Vector result = new Vector();

      Connection connection = getConnection();
      PreparedStatement statement = null;
      ResultSet  set = null;
      String     selectStr = "SELECT ENACTINCOMETECHCONDTNS.CODE FROM ENACTINCOMETECHCONDTNS";
      String     whereStr = "";
      String     condition = processCondition(anCondition);
      String     orderBy = processCondition(anOrderBy);

      if(orderBy.length() == 0)
       orderBy = "ENACTINCOMETECHCONDTNS.CODE";

      if(quantity < 0)
       quantity = Integer.MAX_VALUE/2;

      if(getUserProfile() == null)
       throw new PersistenceException("Internal Error (User Profile Is Undefined)");

        if(aFilterObject != null)
        {
          if(aFilterObject.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.CODE = ?";
          }
           if (aFilterObject.numbergen != null) {
               if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
               if (aFilterObject.numbergen.indexOf('*',0) < 0 && aFilterObject.numbergen.indexOf('?',0) < 0)
                   whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.NUMBERGEN = ?";
               else
                   whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.NUMBERGEN LIKE ?";
           }
          if(aFilterObject.dategen != null) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.DATEGEN = ?";
          }
          if(aFilterObject.actDateStart != null) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.ACTDATESTART = ?";
          }
          if(aFilterObject.actDateEnd != null) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.ACTDATEEND = ?";
          }
          if(aFilterObject.summaGen != null) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.SUMMAGEN = ?";
          }
          if(aFilterObject.summaVat != null) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.SUMMAVAT = ?";
          }
           if (aFilterObject.commentGen != null) {
               if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
               if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                   whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.COMMENTGEN = ?";
               else
                   whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.COMMENTGEN LIKE ?";
           }
           if (aFilterObject.domain_info != null) {
               if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
               if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                   whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.DOMAIN_INFO = ?";
               else
                   whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.DOMAIN_INFO LIKE ?";
           }
          if(aFilterObject.modify_time != Long.MIN_VALUE) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  ENACTINCOMETECHCONDTNS.MODIFY_TIME = ?";
          }
          if(aFilterObject.techCondServicesRef.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + " ENACTINCOMETECHCONDTNS.TECHCONDSERVICESREFCOD = ? ";
          }
          if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + " ENACTINCOMETECHCONDTNS.STATUSREFCODE = ? ";
          }
          if(aFilterObject.warrantRef.code != Integer.MIN_VALUE) {
              if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + " ENACTINCOMETECHCONDTNS.WARRANTREFCODE = ? ";
          }

        }

        if(condition.length() != 0)
        {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + " (" + condition + ")";
        }

       if(whereStr.length() != 0)
           selectStr = selectStr + " WHERE " + whereStr;

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
           if (aFilterObject.numbergen != null) {
               if(whereStr.length() != 0)
                   whereStr = whereStr + " AND";
               if (aFilterObject.numbergen.indexOf('*',0) < 0 && aFilterObject.numbergen.indexOf('?',0) < 0)
                   whereStr = whereStr + " ENACTINCOMETECHCONDTNS.NUMBERGEN = ?";
               else
                   whereStr = whereStr + " ENACTINCOMETECHCONDTNS.NUMBERGEN LIKE ?";

             if(aFilterObject.numbergen != null){
                 number++;
                 StringBuffer likeStr = new StringBuffer();
                 likeStr.append(aFilterObject.numbergen);
                 for(int i = 0;i < likeStr.length();i++){
                      if(likeStr.charAt(i) == '*')
                           likeStr.setCharAt(i,'%');
                      if(likeStr.charAt(i) == '?')
                           likeStr.setCharAt(i,'_');
                 }
                 statement.setString(number,likeStr.toString());
             }
           }
          if(aFilterObject.dategen != null){
              number++;
              statement.setDate(number,new java.sql.Date(aFilterObject.dategen.getTime()));
          }
          if(aFilterObject.actDateStart != null){
              number++;
              statement.setDate(number,new java.sql.Date(aFilterObject.actDateStart.getTime()));
          }
          if(aFilterObject.actDateEnd != null){
              number++;
              statement.setDate(number,new java.sql.Date(aFilterObject.actDateEnd.getTime()));
          }
          if(aFilterObject.summaGen != null){
              number++;
              aFilterObject.summaGen = aFilterObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
              statement.setBigDecimal(number,aFilterObject.summaGen);
          }
          if(aFilterObject.summaVat != null){
              number++;
              aFilterObject.summaVat = aFilterObject.summaVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
              statement.setBigDecimal(number,aFilterObject.summaVat);
          }
           if (aFilterObject.commentGen != null) {
               if(whereStr.length() != 0)
                   whereStr = whereStr + " AND";
               if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                   whereStr = whereStr + " ENACTINCOMETECHCONDTNS.COMMENTGEN = ?";
               else
                   whereStr = whereStr + " ENACTINCOMETECHCONDTNS.COMMENTGEN LIKE ?";

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
           }
           if (aFilterObject.domain_info != null) {
               if(whereStr.length() != 0)
                   whereStr = whereStr + " AND";
               if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                   whereStr = whereStr + " ENACTINCOMETECHCONDTNS.DOMAIN_INFO = ?";
               else
                   whereStr = whereStr + " ENACTINCOMETECHCONDTNS.DOMAIN_INFO LIKE ?";

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
           }
          if(aFilterObject.modify_time != Long.MIN_VALUE){
              number++;
              if(aFilterObject.modify_time == Long.MIN_VALUE)
                  statement.setBigDecimal(number,null);
              else
                  statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
          }
         if(aFilterObject.techCondServicesRef.code != Integer.MIN_VALUE) {
             number++;
             statement.setInt(number,aFilterObject.techCondServicesRef.code);
         }
         if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
             number++;
             statement.setInt(number,aFilterObject.statusRef.code);
         }
         if(aFilterObject.warrantRef.code != Integer.MIN_VALUE) {
             number++;
             statement.setInt(number,aFilterObject.warrantRef.code);
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

          result.add(new Integer(set.getInt(1)));
         }

        int[] array;

        array = new int[result.size()];
        for(int j = 0;j < result.size();j++)
         array[j] = ((Integer)result.get(j)).intValue();

        return array;
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


      } // end of getFilteredCodeArray


} // end of ENActIncomeTechConditionsDAO
