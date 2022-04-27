
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
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.dataminer.generated.ENDamageRecoveryDAOGen;
import com.ksoe.energynet.valueobject.ENDamageRecovery;
import com.ksoe.energynet.valueobject.brief.ENDamageRecoveryShort;
import com.ksoe.energynet.valueobject.lists.ENDamageRecoveryShortList;

/**
 * DAO Object for ENDamageRecovery;
 *
 */

public class ENDamageRecoveryDAO extends ENDamageRecoveryDAOGen {

    public ENDamageRecoveryDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENDamageRecoveryDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    public ENDamageRecoveryShortList getScrollableFilteredList(ENDamageRecovery aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
     ENDamageRecoveryShortList result = new ENDamageRecoveryShortList();
     ENDamageRecoveryShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     whereStr = "";
     String     condition = processCondition(anCondition);
     String     orderBy = processCondition(anOrderBy);

     if(orderBy.length() == 0)
      orderBy = "ENDAMAGERECOVERY.CODE";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr = "SELECT "+
      "ENDAMAGERECOVERY.CODE"+
      ",ENDAMAGERECOVERY.NUMBERGEN"+
      ",ENDAMAGERECOVERY.DATEGEN"+
      ",ENDAMAGERECOVERY.FKCONTRACTCODE"+
      ",ENDAMAGERECOVERY.FKPARTNERCODE"+
      ",ENDAMAGERECOVERY.FKDOCCODE"+
      ",ENDAMAGERECOVERY.FKDOCID"+
      ",ENDAMAGERECOVERY.COMMENTGEN"+
      ",ENDAMAGERECOVERY.CONTRAGENTNAME"+
      ",ENDAMAGERECOVERY.CONTRAGENTADDRESS"+
      ",ENDAMAGERECOVERY.CONTRAGENTPASSPORT"+
      ",ENDAMAGERECOVERY.DAMAGEAMMOUNT"+
      ",ENDAMAGERECOVERY.PARTID"+
      ",ENDAMAGERECOVERY.DATEPOSTING"+
      ",ENDAMAGERECOVERY.USERGEN"+
      ",ENDAMAGERECOVERY.DATEEDIT"+

       ", ENDEPARTMENT.CODE " +
       ", ENDEPARTMENT.SHORTNAME " +
       ", ENDEPARTMENT.DATESTART " +
       ", ENDEPARTMENT.DATEFINAL " +
       ", ENDEPARTMENT.RENCODE " +
       ", ENDEPARTMENT.SHPZBALANS " +
       ", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
       ", ENDEPARTMENT.KAU_1884 " +
       ", ENDEPARTMENT.NAME_1884 " +
       ", ENDAMAGERECOVERYSTATUS.CODE " +
       ", ENDAMAGERECOVERYSTATUS.NAME " +
       ", ENWARRANT.CODE " +
       ", ENWARRANT.NUMBERGEN " +
       ", ENWARRANT.NAME " +
       ", ENWARRANT.WARRANTFIO " +
       ", ENWARRANT.WARRANTSHORTFIO " +
       ", ENWARRANT.WARRANTPOSITION " +
       ", ENWARRANT.GENITIVEFIO " +
       ", ENWARRANT.GENITIVEPOSITION " +
       ", ENWARRANT.PASSPORT " +
       ", ENWARRANT.ADDRESS " +
       ", ENWARRANT.POWER " +
       ", ENWARRANT.MAXSUM " +
      " FROM ENDAMAGERECOVERY " +
      ", ENDEPARTMENT " +
      ", ENDAMAGERECOVERYSTATUS " +
      ", ENWARRANT " +
      //" WHERE "
   "";
      whereStr = " ENDEPARTMENT.CODE = ENDAMAGERECOVERY.DEPARTMENTCODE" ; //+
       whereStr = whereStr +" AND ENDAMAGERECOVERYSTATUS.CODE = ENDAMAGERECOVERY.STATUSREFCODE" ; //+
       whereStr = whereStr +" AND ENWARRANT.CODE = ENDAMAGERECOVERY.WARRANTREFCODE" ; //+
     //selectStr = selectStr + " ${s} ENDAMAGERECOVERY.CODE IN ( SELECT ENDAMAGERECOVERY.CODE FROM ENDAMAGERECOVERY ";

 // " ";
       if(aFilterObject != null)
       {
         if(aFilterObject.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENDAMAGERECOVERY.CODE = ?";
         }
          if (aFilterObject.numberGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENDAMAGERECOVERY.NUMBERGEN) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENDAMAGERECOVERY.NUMBERGEN) LIKE UPPER(?)";
          }
         if(aFilterObject.dateGen != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENDAMAGERECOVERY.DATEGEN = ?";
         }
          if (aFilterObject.FKcontractCode != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.FKcontractCode.indexOf('*',0) < 0 && aFilterObject.FKcontractCode.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENDAMAGERECOVERY.FKCONTRACTCODE) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENDAMAGERECOVERY.FKCONTRACTCODE) LIKE UPPER(?)";
          }
          if (aFilterObject.FKpartnerCode != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.FKpartnerCode.indexOf('*',0) < 0 && aFilterObject.FKpartnerCode.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENDAMAGERECOVERY.FKPARTNERCODE) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENDAMAGERECOVERY.FKPARTNERCODE) LIKE UPPER(?)";
          }
          if (aFilterObject.FKdocCode != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.FKdocCode.indexOf('*',0) < 0 && aFilterObject.FKdocCode.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENDAMAGERECOVERY.FKDOCCODE) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENDAMAGERECOVERY.FKDOCCODE) LIKE UPPER(?)";
          }
         if(aFilterObject.FKdocID != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENDAMAGERECOVERY.FKDOCID = ?";
         }
          if (aFilterObject.commentGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENDAMAGERECOVERY.COMMENTGEN) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENDAMAGERECOVERY.COMMENTGEN) LIKE UPPER(?)";
          }
          if (aFilterObject.contragentName != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.contragentName.indexOf('*',0) < 0 && aFilterObject.contragentName.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENDAMAGERECOVERY.CONTRAGENTNAME) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENDAMAGERECOVERY.CONTRAGENTNAME) LIKE UPPER(?)";
          }
          if (aFilterObject.contragentAddress != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.contragentAddress.indexOf('*',0) < 0 && aFilterObject.contragentAddress.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENDAMAGERECOVERY.CONTRAGENTADDRESS) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENDAMAGERECOVERY.CONTRAGENTADDRESS) LIKE UPPER(?)";
          }
          if (aFilterObject.contragentPassport != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.contragentPassport.indexOf('*',0) < 0 && aFilterObject.contragentPassport.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENDAMAGERECOVERY.CONTRAGENTPASSPORT) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENDAMAGERECOVERY.CONTRAGENTPASSPORT) LIKE UPPER(?)";
          }
         if(aFilterObject.damageAmmount != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENDAMAGERECOVERY.DAMAGEAMMOUNT = ?";
         }
         if(aFilterObject.partId != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENDAMAGERECOVERY.PARTID = ?";
         }
         if(aFilterObject.datePosting != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENDAMAGERECOVERY.DATEPOSTING = ?";
         }
          if (aFilterObject.userGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENDAMAGERECOVERY.USERGEN) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENDAMAGERECOVERY.USERGEN) LIKE UPPER(?)";
          }
         if(aFilterObject.dateEdit != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENDAMAGERECOVERY.DATEEDIT = ?";
         }
          if (aFilterObject.domain_info != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENDAMAGERECOVERY.DOMAIN_INFO) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENDAMAGERECOVERY.DOMAIN_INFO) LIKE UPPER(?)";
          }
         if(aFilterObject.modify_time != Long.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENDAMAGERECOVERY.MODIFY_TIME = ?";
         }
         if(aFilterObject.department.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENDAMAGERECOVERY.DEPARTMENTCODE = ? ";
         }
         if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENDAMAGERECOVERY.STATUSREFCODE = ? ";
         }
         if(aFilterObject.warrantRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENDAMAGERECOVERY.WARRANTREFCODE = ? ";
         }

       }

     
//     SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENDamageRecovery.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
//     if(segregationInfo.isAccessDenied())
//       throw new PersistenceException("{%ENDamageRecovery.getList%} access denied");
//
//     String domainWhereStr = SegregationQueryBuilder.addWhere("ENDAMAGERECOVERY",segregationInfo,getUserProfile().getDomainInfo());
//
//     if (domainWhereStr.length() != 0){
//     // domainWhereStr = "  AND ENDAMAGERECOVERY.DOMAIN_INFO IS NOT NULL";
//     //else
//     if (whereStr.length() == 0)
//       whereStr = domainWhereStr;
//     else
//       whereStr = " "+whereStr + " AND " +domainWhereStr;
//   }


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

            if(aFilterObject.numberGen != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.numberGen);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
         if(aFilterObject.dateGen != null){
             number++;
             statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
         }

            if(aFilterObject.FKcontractCode != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.FKcontractCode);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.FKpartnerCode != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.FKpartnerCode);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.FKdocCode != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.FKdocCode);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
          if(aFilterObject.FKdocID != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.FKdocID);
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

            if(aFilterObject.contragentName != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.contragentName);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.contragentAddress != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.contragentAddress);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.contragentPassport != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.contragentPassport);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
         if(aFilterObject.damageAmmount != null){
             number++;
             aFilterObject.damageAmmount = aFilterObject.damageAmmount.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.damageAmmount);
         }
          if(aFilterObject.partId != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.partId);
          }
         if(aFilterObject.datePosting != null){
             number++;
             statement.setDate(number,new java.sql.Date(aFilterObject.datePosting.getTime()));
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
             statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
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
        if(aFilterObject.department.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.department.code);
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
       for (i = 0; set.next(); i++) {
         /*
         if (i < fromPosition)
           continue;
         else if (i >= fromPosition + quantity) {
           i++;
           break;
         } */

         anObject = new ENDamageRecoveryShort();

         anObject.code = set.getInt(1);
         if ( set.wasNull() )
             anObject.code = Integer.MIN_VALUE;
         anObject.numberGen = set.getString(2);
         anObject.dateGen = set.getDate(3);
         anObject.FKcontractCode = set.getString(4);
         anObject.FKpartnerCode = set.getString(5);
         anObject.FKdocCode = set.getString(6);
         anObject.FKdocID = set.getInt(7);
         if ( set.wasNull() )
             anObject.FKdocID = Integer.MIN_VALUE;
         anObject.commentGen = set.getString(8);
         anObject.contragentName = set.getString(9);
         anObject.contragentAddress = set.getString(10);
         anObject.contragentPassport = set.getString(11);
         anObject.damageAmmount = set.getBigDecimal(12);
         if(anObject.damageAmmount != null)
             anObject.damageAmmount = anObject.damageAmmount.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.partId = set.getInt(13);
         if ( set.wasNull() )
             anObject.partId = Integer.MIN_VALUE;
         anObject.datePosting = set.getDate(14);
         anObject.userGen = set.getString(15);
         anObject.dateEdit = set.getDate(16);

         anObject.departmentCode = set.getInt(17);
     if(set.wasNull())
       anObject.departmentCode = Integer.MIN_VALUE;
         anObject.departmentShortName = set.getString(18);
         anObject.departmentDateStart = set.getDate(19);
         anObject.departmentDateFinal = set.getDate(20);
         anObject.departmentRenCode = set.getInt(21);
     if(set.wasNull())
       anObject.departmentRenCode = Integer.MIN_VALUE;
         anObject.departmentShpzBalans = set.getString(22);
         anObject.departmentKau_table_id_1884 = set.getInt(23);
     if(set.wasNull())
       anObject.departmentKau_table_id_1884 = Integer.MIN_VALUE;
         anObject.departmentKau_1884 = set.getString(24);
         anObject.departmentName_1884 = set.getString(25);
         anObject.statusRefCode = set.getInt(26);
     if(set.wasNull())
       anObject.statusRefCode = Integer.MIN_VALUE;
         anObject.statusRefName = set.getString(27);
         anObject.warrantRefCode = set.getInt(28);
     if(set.wasNull())
       anObject.warrantRefCode = Integer.MIN_VALUE;
         anObject.warrantRefNumbergen = set.getString(29);
         anObject.warrantRefName = set.getString(30);
         anObject.warrantRefWarrantFIO = set.getString(31);
         anObject.warrantRefWarrantShortFIO = set.getString(32);
         anObject.warrantRefWarrantPosition = set.getString(33);
         anObject.warrantRefGenitiveFIO = set.getString(34);
         anObject.warrantRefGenitivePosition = set.getString(35);
         anObject.warrantRefPassport = set.getString(36);
         anObject.warrantRefAddress = set.getString(37);
         anObject.warrantRefPower = set.getInt(38);
     if(set.wasNull())
       anObject.warrantRefPower = Integer.MIN_VALUE;
         anObject.warrantRefMaxSum = set.getBigDecimal(39);
         if(anObject.warrantRefMaxSum != null)
           anObject.warrantRefMaxSum = anObject.warrantRefMaxSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

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
    
    public void loadObject(ENDamageRecovery anObject) throws PersistenceException
    {
     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet set = null;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

//     SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENDamageRecovery.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
//     if(segregationInfo.isAccessDenied())
//       throw new PersistenceException("{%ENDamageRecovery.getObject%} access denied");



     selectStr =
     "SELECT  ENDAMAGERECOVERY.CODE, ENDAMAGERECOVERY.NUMBERGEN, ENDAMAGERECOVERY.DATEGEN, ENDAMAGERECOVERY.FKCONTRACTCODE, ENDAMAGERECOVERY.FKPARTNERCODE, ENDAMAGERECOVERY.FKDOCCODE, ENDAMAGERECOVERY.FKDOCID, ENDAMAGERECOVERY.COMMENTGEN, ENDAMAGERECOVERY.CONTRAGENTNAME, ENDAMAGERECOVERY.CONTRAGENTADDRESS, ENDAMAGERECOVERY.CONTRAGENTPASSPORT, ENDAMAGERECOVERY.DAMAGEAMMOUNT, ENDAMAGERECOVERY.PARTID, ENDAMAGERECOVERY.DATEPOSTING, ENDAMAGERECOVERY.USERGEN, ENDAMAGERECOVERY.DATEEDIT, ENDAMAGERECOVERY.DOMAIN_INFO, ENDAMAGERECOVERY.MODIFY_TIME, ENDAMAGERECOVERY.DEPARTMENTCODE, ENDAMAGERECOVERY.STATUSREFCODE, ENDAMAGERECOVERY.WARRANTREFCODE "
     +" FROM ENDAMAGERECOVERY WHERE ENDAMAGERECOVERY.CODE = ?";
     // String segregationWhereStr = SegregationQueryBuilder.addWhere("ENDAMAGERECOVERY",segregationInfo,getUserProfile().getDomainInfo());
    //  if(segregationWhereStr.length() > 0)
     // selectStr = selectStr  + " AND " + segregationWhereStr;

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
         anObject.numberGen = set.getString(2);
         anObject.dateGen = set.getDate(3);
         anObject.FKcontractCode = set.getString(4);
         anObject.FKpartnerCode = set.getString(5);
         anObject.FKdocCode = set.getString(6);
         anObject.FKdocID = set.getInt(7);
         if ( set.wasNull() )
            anObject.FKdocID = Integer.MIN_VALUE;
         anObject.commentGen = set.getString(8);
         anObject.contragentName = set.getString(9);
         anObject.contragentAddress = set.getString(10);
         anObject.contragentPassport = set.getString(11);
         anObject.damageAmmount = set.getBigDecimal(12);
         if(anObject.damageAmmount != null)
             anObject.damageAmmount = anObject.damageAmmount.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.partId = set.getInt(13);
         if ( set.wasNull() )
            anObject.partId = Integer.MIN_VALUE;
         anObject.datePosting = set.getDate(14);
         anObject.userGen = set.getString(15);
         anObject.dateEdit = set.getDate(16);
         anObject.domain_info = set.getString(17);
         anObject.modify_time = set.getLong(18);
         if(set.wasNull())
          anObject.modify_time = Long.MIN_VALUE;
         anObject.department.code = set.getInt(19);
         if ( set.wasNull() )
             anObject.department.code = Integer.MIN_VALUE;
         anObject.statusRef.code = set.getInt(20);
         if ( set.wasNull() )
             anObject.statusRef.code = Integer.MIN_VALUE;
         anObject.warrantRef.code = set.getInt(21);
         if ( set.wasNull() )
             anObject.warrantRef.code = Integer.MIN_VALUE;
         if(anObject.department.code != Integer.MIN_VALUE)
         {
            anObject.setDepartment(
       new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getRef(anObject.department.code));
     }
         if(anObject.statusRef.code != Integer.MIN_VALUE)
         {
            anObject.setStatusRef(
       new com.ksoe.energynet.dataminer.generated.ENDamageRecoveryStatusDAOGen(connection,getUserProfile()).getRef(anObject.statusRef.code));
     }
         if(anObject.warrantRef.code != Integer.MIN_VALUE)
         {
            anObject.setWarrantRef(
       new com.ksoe.energynet.dataminer.generated.ENWarrantDAOGen(connection,getUserProfile()).getRef(anObject.warrantRef.code));
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

    public boolean exists(int anObjectCode) throws PersistenceException
    {
     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;

     if(anObjectCode == Integer.MIN_VALUE)
      return false;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

//     SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENDamageRecovery.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
//     if(segregationInfo.isAccessDenied())
//       throw new PersistenceException("{%ENDamageRecovery.getObject%} access denied");

     selectStr =

     "SELECT  ENDAMAGERECOVERY.CODE FROM  ENDAMAGERECOVERY WHERE  ENDAMAGERECOVERY.CODE = ?";
//     String segregationWhereStr = SegregationQueryBuilder.addWhere("ENDAMAGERECOVERY",segregationInfo,getUserProfile().getDomainInfo());
//     if(segregationWhereStr.length() > 0)
//      selectStr = selectStr +
//       " AND " + segregationWhereStr;
     try
      {
       statement = connection.prepareStatement(selectStr);
       statement.setInt(1,anObjectCode);
       set = statement.executeQuery();
       if(set.next())
        return true;
       return false;
      }
     catch(SQLException e)
      {
       System.out.println(e.getMessage()+"\nstatement - "+selectStr);
       throw new SystemException(e.getMessage(), e);
       //return false;
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

    public int[] getFilteredCodeArray(ENDamageRecovery aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
     Vector result = new Vector();

     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     selectStr = "SELECT ENDAMAGERECOVERY.CODE FROM ENDAMAGERECOVERY";
     String     whereStr = "";
     String     condition = processCondition(anCondition);
     String     orderBy = processCondition(anOrderBy);

     if(orderBy.length() == 0)
      orderBy = "ENDAMAGERECOVERY.CODE";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

//     if(getUserProfile() == null)
//      throw new PersistenceException("Internal Error (User Profile Is Undefined)");
//     SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENDamageRecovery.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
//     if(segregationInfo.isAccessDenied())
//       throw new PersistenceException("{%ENDamageRecovery.getList%} access denied");
//
//     whereStr = SegregationQueryBuilder.addWhere("ENDAMAGERECOVERY",segregationInfo,getUserProfile().getDomainInfo());

     if(whereStr.length() == 0)
      whereStr = " (ENDAMAGERECOVERY.DOMAIN_INFO IS NOT NULL) ";
     else
      whereStr = " "+whereStr;

       if(aFilterObject != null)
       {
         if(aFilterObject.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENDAMAGERECOVERY.CODE = ?";
         }
          if (aFilterObject.numberGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  ENDAMAGERECOVERY.NUMBERGEN = ?";
              else
                  whereStr = whereStr + "  ENDAMAGERECOVERY.NUMBERGEN LIKE ?";
          }
         if(aFilterObject.dateGen != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENDAMAGERECOVERY.DATEGEN = ?";
         }
          if (aFilterObject.FKcontractCode != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.FKcontractCode.indexOf('*',0) < 0 && aFilterObject.FKcontractCode.indexOf('?',0) < 0)
                  whereStr = whereStr + "  ENDAMAGERECOVERY.FKCONTRACTCODE = ?";
              else
                  whereStr = whereStr + "  ENDAMAGERECOVERY.FKCONTRACTCODE LIKE ?";
          }
          if (aFilterObject.FKpartnerCode != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.FKpartnerCode.indexOf('*',0) < 0 && aFilterObject.FKpartnerCode.indexOf('?',0) < 0)
                  whereStr = whereStr + "  ENDAMAGERECOVERY.FKPARTNERCODE = ?";
              else
                  whereStr = whereStr + "  ENDAMAGERECOVERY.FKPARTNERCODE LIKE ?";
          }
          if (aFilterObject.FKdocCode != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.FKdocCode.indexOf('*',0) < 0 && aFilterObject.FKdocCode.indexOf('?',0) < 0)
                  whereStr = whereStr + "  ENDAMAGERECOVERY.FKDOCCODE = ?";
              else
                  whereStr = whereStr + "  ENDAMAGERECOVERY.FKDOCCODE LIKE ?";
          }
         if(aFilterObject.FKdocID != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENDAMAGERECOVERY.FKDOCID = ?";
         }
          if (aFilterObject.commentGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  ENDAMAGERECOVERY.COMMENTGEN = ?";
              else
                  whereStr = whereStr + "  ENDAMAGERECOVERY.COMMENTGEN LIKE ?";
          }
          if (aFilterObject.contragentName != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.contragentName.indexOf('*',0) < 0 && aFilterObject.contragentName.indexOf('?',0) < 0)
                  whereStr = whereStr + "  ENDAMAGERECOVERY.CONTRAGENTNAME = ?";
              else
                  whereStr = whereStr + "  ENDAMAGERECOVERY.CONTRAGENTNAME LIKE ?";
          }
          if (aFilterObject.contragentAddress != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.contragentAddress.indexOf('*',0) < 0 && aFilterObject.contragentAddress.indexOf('?',0) < 0)
                  whereStr = whereStr + "  ENDAMAGERECOVERY.CONTRAGENTADDRESS = ?";
              else
                  whereStr = whereStr + "  ENDAMAGERECOVERY.CONTRAGENTADDRESS LIKE ?";
          }
          if (aFilterObject.contragentPassport != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.contragentPassport.indexOf('*',0) < 0 && aFilterObject.contragentPassport.indexOf('?',0) < 0)
                  whereStr = whereStr + "  ENDAMAGERECOVERY.CONTRAGENTPASSPORT = ?";
              else
                  whereStr = whereStr + "  ENDAMAGERECOVERY.CONTRAGENTPASSPORT LIKE ?";
          }
         if(aFilterObject.damageAmmount != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENDAMAGERECOVERY.DAMAGEAMMOUNT = ?";
         }
         if(aFilterObject.partId != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENDAMAGERECOVERY.PARTID = ?";
         }
         if(aFilterObject.datePosting != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENDAMAGERECOVERY.DATEPOSTING = ?";
         }
          if (aFilterObject.userGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  ENDAMAGERECOVERY.USERGEN = ?";
              else
                  whereStr = whereStr + "  ENDAMAGERECOVERY.USERGEN LIKE ?";
          }
         if(aFilterObject.dateEdit != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENDAMAGERECOVERY.DATEEDIT = ?";
         }
          if (aFilterObject.domain_info != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                  whereStr = whereStr + "  ENDAMAGERECOVERY.DOMAIN_INFO = ?";
              else
                  whereStr = whereStr + "  ENDAMAGERECOVERY.DOMAIN_INFO LIKE ?";
          }
         if(aFilterObject.modify_time != Long.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENDAMAGERECOVERY.MODIFY_TIME = ?";
         }
         if(aFilterObject.department.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + " ENDAMAGERECOVERY.DEPARTMENTCODE = ? ";
         }
         if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + " ENDAMAGERECOVERY.STATUSREFCODE = ? ";
         }
         if(aFilterObject.warrantRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + " ENDAMAGERECOVERY.WARRANTREFCODE = ? ";
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
          if (aFilterObject.numberGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND";
              if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                  whereStr = whereStr + " ENDAMAGERECOVERY.NUMBERGEN = ?";
              else
                  whereStr = whereStr + " ENDAMAGERECOVERY.NUMBERGEN LIKE ?";

            if(aFilterObject.numberGen != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.numberGen);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
          }
         if(aFilterObject.dateGen != null){
             number++;
             statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
         }
          if (aFilterObject.FKcontractCode != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND";
              if (aFilterObject.FKcontractCode.indexOf('*',0) < 0 && aFilterObject.FKcontractCode.indexOf('?',0) < 0)
                  whereStr = whereStr + " ENDAMAGERECOVERY.FKCONTRACTCODE = ?";
              else
                  whereStr = whereStr + " ENDAMAGERECOVERY.FKCONTRACTCODE LIKE ?";

            if(aFilterObject.FKcontractCode != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.FKcontractCode);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
          }
          if (aFilterObject.FKpartnerCode != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND";
              if (aFilterObject.FKpartnerCode.indexOf('*',0) < 0 && aFilterObject.FKpartnerCode.indexOf('?',0) < 0)
                  whereStr = whereStr + " ENDAMAGERECOVERY.FKPARTNERCODE = ?";
              else
                  whereStr = whereStr + " ENDAMAGERECOVERY.FKPARTNERCODE LIKE ?";

            if(aFilterObject.FKpartnerCode != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.FKpartnerCode);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
          }
          if (aFilterObject.FKdocCode != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND";
              if (aFilterObject.FKdocCode.indexOf('*',0) < 0 && aFilterObject.FKdocCode.indexOf('?',0) < 0)
                  whereStr = whereStr + " ENDAMAGERECOVERY.FKDOCCODE = ?";
              else
                  whereStr = whereStr + " ENDAMAGERECOVERY.FKDOCCODE LIKE ?";

            if(aFilterObject.FKdocCode != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.FKdocCode);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
          }
          if(aFilterObject.FKdocID != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.FKdocID);
          }
          if (aFilterObject.commentGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND";
              if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                  whereStr = whereStr + " ENDAMAGERECOVERY.COMMENTGEN = ?";
              else
                  whereStr = whereStr + " ENDAMAGERECOVERY.COMMENTGEN LIKE ?";

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
          if (aFilterObject.contragentName != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND";
              if (aFilterObject.contragentName.indexOf('*',0) < 0 && aFilterObject.contragentName.indexOf('?',0) < 0)
                  whereStr = whereStr + " ENDAMAGERECOVERY.CONTRAGENTNAME = ?";
              else
                  whereStr = whereStr + " ENDAMAGERECOVERY.CONTRAGENTNAME LIKE ?";

            if(aFilterObject.contragentName != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.contragentName);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
          }
          if (aFilterObject.contragentAddress != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND";
              if (aFilterObject.contragentAddress.indexOf('*',0) < 0 && aFilterObject.contragentAddress.indexOf('?',0) < 0)
                  whereStr = whereStr + " ENDAMAGERECOVERY.CONTRAGENTADDRESS = ?";
              else
                  whereStr = whereStr + " ENDAMAGERECOVERY.CONTRAGENTADDRESS LIKE ?";

            if(aFilterObject.contragentAddress != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.contragentAddress);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
          }
          if (aFilterObject.contragentPassport != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND";
              if (aFilterObject.contragentPassport.indexOf('*',0) < 0 && aFilterObject.contragentPassport.indexOf('?',0) < 0)
                  whereStr = whereStr + " ENDAMAGERECOVERY.CONTRAGENTPASSPORT = ?";
              else
                  whereStr = whereStr + " ENDAMAGERECOVERY.CONTRAGENTPASSPORT LIKE ?";

            if(aFilterObject.contragentPassport != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.contragentPassport);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }
          }
         if(aFilterObject.damageAmmount != null){
             number++;
             aFilterObject.damageAmmount = aFilterObject.damageAmmount.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.damageAmmount);
         }
          if(aFilterObject.partId != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.partId);
          }
         if(aFilterObject.datePosting != null){
             number++;
             statement.setDate(number,new java.sql.Date(aFilterObject.datePosting.getTime()));
         }
          if (aFilterObject.userGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND";
              if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                  whereStr = whereStr + " ENDAMAGERECOVERY.USERGEN = ?";
              else
                  whereStr = whereStr + " ENDAMAGERECOVERY.USERGEN LIKE ?";

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
          }
         if(aFilterObject.dateEdit != null){
             number++;
             statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
         }
          if (aFilterObject.domain_info != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND";
              if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                  whereStr = whereStr + " ENDAMAGERECOVERY.DOMAIN_INFO = ?";
              else
                  whereStr = whereStr + " ENDAMAGERECOVERY.DOMAIN_INFO LIKE ?";

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
        if(aFilterObject.department.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.department.code);
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


     } // end of getFilteredCodeArray




} // end of ENDamageRecoveryDAO
