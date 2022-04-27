
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
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
import com.ksoe.energynet.dataminer.generated.ENWarrantDAOGen;
import com.ksoe.energynet.valueobject.ENWarrant;
import com.ksoe.energynet.valueobject.ENWarrantType;
import com.ksoe.energynet.valueobject.brief.ENWarrantShort;
import com.ksoe.energynet.valueobject.lists.ENWarrantShortList;

/**
 * DAO Object for ENWarrant;
 *
 */

public class ENWarrantDAO extends ENWarrantDAOGen {

    public ENWarrantDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENWarrantDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    public ENWarrantShortList getScrollableFilteredList(ENWarrant aFilterObject
    		,String anCondition
    		,String anOrderBy
    		,int fromPosition
    		,int quantity
    		,Vector<? extends Object> aBindObjects) throws PersistenceException
    {
    	
    	return this.getScrollableFilteredList(aFilterObject, anCondition, anOrderBy, fromPosition, quantity, aBindObjects, ENWarrantType.INNER);
    }
    
    
    public ENWarrantShortList getScrollableFilteredList(ENWarrant aFilterObject
    		, String anCondition
    		, String anOrderBy
    		, int fromPosition
    		, int quantity
    		, Vector<? extends Object> aBindObjects
    		, Integer typeCode) throws PersistenceException
    {
     ENWarrantShortList result = new ENWarrantShortList();
     ENWarrantShort anObject;
     result.list = new Vector<ENWarrantShort>();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     whereStr = "";
     String     condition = processCondition(anCondition);
     String     orderBy = processCondition(anOrderBy);
      
     if(typeCode != null) {
    	 condition += String.format("%s %s = ?", (condition.length() == 0
    			 ? "" : "and" ), ENWarrant.warrantTypeRef_QFielld);
     }

     if(orderBy.length() == 0)
      orderBy = "ENWARRANT.CODE";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr = "SELECT "+
      "ENWARRANT.CODE"+
      ",ENWARRANT.NUMBERGEN"+
      ",ENWARRANT.NAME"+
      ",ENWARRANT.WARRANTFIO"+
      ",ENWARRANT.WARRANTSHORTFIO"+
      ",ENWARRANT.WARRANTPOSITION"+
      ",ENWARRANT.GENITIVEFIO"+
      ",ENWARRANT.GENITIVEPOSITION"+
      ",ENWARRANT.PASSPORT"+
      ",ENWARRANT.ADDRESS"+
      ",ENWARRANT.POWER"+
      ",ENWARRANT.MAXSUM"+

       ", ENDEPARTMENT.CODE " +
       ", ENDEPARTMENT.SHORTNAME " +
       ", ENDEPARTMENT.DATESTART " +
       ", ENDEPARTMENT.DATEFINAL " +
       ", ENDEPARTMENT.RENCODE " +
       ", ENDEPARTMENT.SHPZBALANS " +
       ", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
       ", ENDEPARTMENT.KAU_1884 " +
       ", ENDEPARTMENT.NAME_1884 " +
       ", ENDEPARTMENT.HRMORGANIZATIONID " +
       ", ENWARRANTSTATUS.CODE " +
       ", ENWARRANTSTATUS.NAME " +
       
       ", ENWARRANT.DEPARTMENTNAME"+
  	   ", ENWARRANT.DEPARTMENTNAMEGENITIVE"+
  	   ",ENWARRANT.DATEGEN"+
      " FROM ENWARRANT " +
      "LEFT JOIN ENDEPARTMENT ON ENWARRANT.DEPARTMENTREFCODE = ENDEPARTMENT.CODE " +
      "INNER JOIN ENWARRANTSTATUS ON ENWARRANTSTATUS.CODE = ENWARRANT.WARRANTSTATUSREFCODE ";
      //" WHERE "


 // " ";
       if(aFilterObject != null)
       {
         if(aFilterObject.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENWARRANT.CODE = ?";
         }
          if (aFilterObject.numbergen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.numbergen.indexOf('*',0) < 0 && aFilterObject.numbergen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWARRANT.NUMBERGEN) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWARRANT.NUMBERGEN) LIKE UPPER(?)";
          }
          if (aFilterObject.name != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWARRANT.NAME) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWARRANT.NAME) LIKE UPPER(?)";
          }
         if(aFilterObject.dateStart != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENWARRANT.DATESTART = ?";
         }
         if(aFilterObject.dateFinal != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENWARRANT.DATEFINAL = ?";
         }
          if (aFilterObject.warrantFIO != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.warrantFIO.indexOf('*',0) < 0 && aFilterObject.warrantFIO.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWARRANT.WARRANTFIO) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWARRANT.WARRANTFIO) LIKE UPPER(?)";
          }
          if (aFilterObject.warrantShortFIO != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.warrantShortFIO.indexOf('*',0) < 0 && aFilterObject.warrantShortFIO.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWARRANT.WARRANTSHORTFIO) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWARRANT.WARRANTSHORTFIO) LIKE UPPER(?)";
          }
          if (aFilterObject.warrantPosition != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.warrantPosition.indexOf('*',0) < 0 && aFilterObject.warrantPosition.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWARRANT.WARRANTPOSITION) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWARRANT.WARRANTPOSITION) LIKE UPPER(?)";
          }
          if (aFilterObject.genitiveFIO != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.genitiveFIO.indexOf('*',0) < 0 && aFilterObject.genitiveFIO.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWARRANT.GENITIVEFIO) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWARRANT.GENITIVEFIO) LIKE UPPER(?)";
          }
          if (aFilterObject.genitivePosition != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.genitivePosition.indexOf('*',0) < 0 && aFilterObject.genitivePosition.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWARRANT.GENITIVEPOSITION) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWARRANT.GENITIVEPOSITION) LIKE UPPER(?)";
          }
          if (aFilterObject.passport != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.passport.indexOf('*',0) < 0 && aFilterObject.passport.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWARRANT.PASSPORT) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWARRANT.PASSPORT) LIKE UPPER(?)";
          }
          if (aFilterObject.address != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.address.indexOf('*',0) < 0 && aFilterObject.address.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWARRANT.ADDRESS) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWARRANT.ADDRESS) LIKE UPPER(?)";
          }
         if(aFilterObject.dateGen != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENWARRANT.DATEGEN = ?";
         }
         if(aFilterObject.power != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENWARRANT.POWER = ?";
         }
         if(aFilterObject.maxSum != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENWARRANT.MAXSUM = ?";
         }
          if (aFilterObject.domain_info != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENWARRANT.DOMAIN_INFO) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENWARRANT.DOMAIN_INFO) LIKE UPPER(?)";
          }
         if(aFilterObject.modify_time != Long.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENWARRANT.MODIFY_TIME = ?";
         }
         if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWARRANT.DEPARTMENTREFCODE = ? ";
         }
         if(aFilterObject.warrantStatusRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWARRANT.WARRANTSTATUSREFCODE = ? ";
         }
         if(aFilterObject.warrantTypeRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENWARRANT.WARRANTTYPEREFCODE = ? ";
         }
       }

     
//     SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENWarrant.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
//     if(segregationInfo.isAccessDenied())
//       throw new PersistenceException("{%ENWarrant.getList%} access denied");
//
//     String domainWhereStr = SegregationQueryBuilder.addWhere("ENWARRANT",segregationInfo,getUserProfile().getDomainInfo());
//
//     if (domainWhereStr.length() != 0){
//     // domainWhereStr = "  AND ENWARRANT.DOMAIN_INFO IS NOT NULL";
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
         if(aFilterObject.dateStart != null){
             number++;
             statement.setDate(number,new java.sql.Date(aFilterObject.dateStart.getTime()));
         }
         if(aFilterObject.dateFinal != null){
             number++;
             statement.setDate(number,new java.sql.Date(aFilterObject.dateFinal.getTime()));
         }

            if(aFilterObject.warrantFIO != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.warrantFIO);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.warrantShortFIO != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.warrantShortFIO);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.warrantPosition != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.warrantPosition);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.genitiveFIO != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.genitiveFIO);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.genitivePosition != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.genitivePosition);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.passport != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.passport);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.address != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.address);
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
          if(aFilterObject.power != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.power);
          }
         if(aFilterObject.maxSum != null){
             number++;
             aFilterObject.maxSum = aFilterObject.maxSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.maxSum);
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
        if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.departmentRef.code);
        }
        if(aFilterObject.warrantStatusRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.warrantStatusRef.code);
        }
        if(aFilterObject.warrantTypeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.warrantTypeRef.code);
        }
        
       }

       if(condition.length() > 0 && aBindObjects != null)
        _bindObjectsToPreparedStatement(statement,aBindObjects,number);
       
       if(typeCode != null) {
      	 statement.setInt(number + (aBindObjects != null ? aBindObjects.size() : 0) + 1, typeCode);
       }

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

         anObject = new ENWarrantShort();

         anObject.code = set.getInt(1);
         if ( set.wasNull() )
             anObject.code = Integer.MIN_VALUE;
         anObject.numbergen = set.getString(2);
         anObject.name = set.getString(3);
         anObject.warrantFIO = set.getString(4);
         anObject.warrantShortFIO = set.getString(5);
         anObject.warrantPosition = set.getString(6);
         anObject.genitiveFIO = set.getString(7);
         anObject.genitivePosition = set.getString(8);
         anObject.passport = set.getString(9);
         anObject.address = set.getString(10);
         anObject.power = set.getInt(11);
         if ( set.wasNull() )
             anObject.power = Integer.MIN_VALUE;
         anObject.maxSum = set.getBigDecimal(12);
         if(anObject.maxSum != null)
             anObject.maxSum = anObject.maxSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

         anObject.departmentRefCode = set.getInt(13);
     if(set.wasNull())
       anObject.departmentRefCode = Integer.MIN_VALUE;
         anObject.departmentRefShortName = set.getString(14);
         anObject.departmentRefDateStart = set.getDate(15);
         anObject.departmentRefDateFinal = set.getDate(16);
         anObject.departmentRefRenCode = set.getInt(17);
     if(set.wasNull())
       anObject.departmentRefRenCode = Integer.MIN_VALUE;
         anObject.departmentRefShpzBalans = set.getString(18);
         anObject.departmentRefKau_table_id_1884 = set.getInt(19);
     if(set.wasNull())
       anObject.departmentRefKau_table_id_1884 = Integer.MIN_VALUE;
         anObject.departmentRefKau_1884 = set.getString(20);
         anObject.departmentRefName_1884 = set.getString(21);
         anObject.departmentRefHrmorganizationid = set.getString(22);
         anObject.warrantStatusRefCode = set.getInt(23);
     if(set.wasNull())
       anObject.warrantStatusRefCode = Integer.MIN_VALUE;
         anObject.warrantStatusRefName = set.getString(24);
         
         anObject.departmentName = set.getString(25);
		 anObject.departmentNameGenitive = set.getString(26);
		 anObject.dateGen = set.getDate(27);
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


} // end of ENWarrantDAO
