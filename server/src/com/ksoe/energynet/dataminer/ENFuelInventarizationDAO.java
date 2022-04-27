
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
import java.util.Date;
import java.util.Set;
import java.util.Vector;
import java.util.stream.Collectors;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENFuelInventarizationDAOGen;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENFuelInventarization;
import com.ksoe.energynet.valueobject.ENFuelInventarizationStatus;
import com.ksoe.energynet.valueobject.ENTravelSheet;
import com.ksoe.energynet.valueobject.brief.ENFuelInventarizationShort;
import com.ksoe.energynet.valueobject.filter.ENFuelInventarizationFilter;
import com.ksoe.energynet.valueobject.lists.ENFuelInventarizationItemShortList;
import com.ksoe.energynet.valueobject.lists.ENFuelInventarizationShortList;
import com.ksoe.energynet.valueobject.brief.ENFuelInventarizationItemShort;

/**
 * DAO Object for ENFuelInventarization;
 *
 */

public class ENFuelInventarizationDAO extends ENFuelInventarizationDAOGen {

    public ENFuelInventarizationDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENFuelInventarizationDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    
    public void save(ENFuelInventarization anObject) throws PersistenceException
    {
    	
     save(anObject,null);
    }
    
    public int add(ENFuelInventarization anObject) throws PersistenceException
    {
        anObject.userAdd = getUserProfile().userName;
        anObject.dateAdd = new Date();
        anObject.statusRef.code = ENFuelInventarizationStatus.DRAFT;
        
     return add(anObject,true);
    }
    
    
    public ENFuelInventarizationShortList getScrollableFilteredList(ENFuelInventarization aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
     ENFuelInventarizationShortList result = new ENFuelInventarizationShortList();
     ENFuelInventarizationShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     whereStr = "";
     String     condition = processCondition(anCondition);
     String     orderBy = processCondition(anOrderBy);

     if(orderBy.length() == 0)
      orderBy = "ENFUELINVENTARIZATION.CODE";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr = "SELECT "+
      "ENFUELINVENTARIZATION.CODE"+
      ",ENFUELINVENTARIZATION.NUMBERGEN"+
      ",ENFUELINVENTARIZATION.DATEGEN"+
      ",ENFUELINVENTARIZATION.MOLCODE"+
      ",ENFUELINVENTARIZATION.MOLNAME"+
      ",ENFUELINVENTARIZATION.COMMENTGEN"+
      ",ENFUELINVENTARIZATION.USERADD"+
      ",ENFUELINVENTARIZATION.DATEADD"+
      ",ENFUELINVENTARIZATION.USERGEN"+
      ",ENFUELINVENTARIZATION.DATEEDIT"+

       ", ENFUELINVENTARIZTNSTTS.CODE " +
       ", ENFUELINVENTARIZTNSTTS.NAME " +
       
      " FROM ENFUELINVENTARIZATION " +
      ", ENFUELINVENTARIZTNSTTS " +
      //" WHERE "
   "";
      whereStr = " ENFUELINVENTARIZTNSTTS.CODE = ENFUELINVENTARIZATION.STATUSREFCODE" ; //+
     //selectStr = selectStr + " ${s} ENFUELINVENTARIZATION.CODE IN ( SELECT ENFUELINVENTARIZATION.CODE FROM ENFUELINVENTARIZATION ";

 // " ";
       if(aFilterObject != null)
       {
         if(aFilterObject.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENFUELINVENTARIZATION.CODE = ?";
         }
          if (aFilterObject.numberGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.numberGen.indexOf('*',0) < 0 && aFilterObject.numberGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENFUELINVENTARIZATION.NUMBERGEN) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENFUELINVENTARIZATION.NUMBERGEN) LIKE UPPER(?)";
          }
         if(aFilterObject.dateGen != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENFUELINVENTARIZATION.DATEGEN = ?";
         }
          if (aFilterObject.molCode != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.molCode.indexOf('*',0) < 0 && aFilterObject.molCode.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENFUELINVENTARIZATION.MOLCODE) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENFUELINVENTARIZATION.MOLCODE) LIKE UPPER(?)";
          }
          if (aFilterObject.molName != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.molName.indexOf('*',0) < 0 && aFilterObject.molName.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENFUELINVENTARIZATION.MOLNAME) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENFUELINVENTARIZATION.MOLNAME) LIKE UPPER(?)";
          }
          if (aFilterObject.commentGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENFUELINVENTARIZATION.COMMENTGEN) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENFUELINVENTARIZATION.COMMENTGEN) LIKE UPPER(?)";
          }
          if (aFilterObject.userAdd != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENFUELINVENTARIZATION.USERADD) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENFUELINVENTARIZATION.USERADD) LIKE UPPER(?)";
          }
         if(aFilterObject.dateAdd != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENFUELINVENTARIZATION.DATEADD = ?";
         }
          if (aFilterObject.userGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENFUELINVENTARIZATION.USERGEN) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENFUELINVENTARIZATION.USERGEN) LIKE UPPER(?)";
          }
         if(aFilterObject.dateEdit != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENFUELINVENTARIZATION.DATEEDIT = ?";
         }
         if(aFilterObject.modify_time != Long.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENFUELINVENTARIZATION.MODIFY_TIME = ?";
         }
         if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENFUELINVENTARIZATION.STATUSREFCODE = ? ";
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
             statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateGen.getTime()));
         }

            if(aFilterObject.molCode != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.molCode);
                for(int i = 0;i < likeStr.length();i++){
                     if(likeStr.charAt(i) == '*')
                          likeStr.setCharAt(i,'%');
                     if(likeStr.charAt(i) == '?')
                          likeStr.setCharAt(i,'_');
                }
                statement.setString(number,likeStr.toString());
            }

            if(aFilterObject.molName != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.molName);
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
         if(aFilterObject.modify_time != Long.MIN_VALUE){
             number++;
             if(aFilterObject.modify_time == Long.MIN_VALUE)
                 statement.setBigDecimal(number,null);
             else
                 statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
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
       for (i = 0; set.next(); i++) {
         /*
         if (i < fromPosition)
           continue;
         else if (i >= fromPosition + quantity) {
           i++;
           break;
         } */

         anObject = new ENFuelInventarizationShort();

         anObject.code = set.getInt(1);
         if ( set.wasNull() )
             anObject.code = Integer.MIN_VALUE;
         anObject.numberGen = set.getString(2);
         anObject.dateGen = set.getTimestamp(3);
         anObject.molCode = set.getString(4);
         anObject.molName = set.getString(5);
         anObject.commentGen = set.getString(6);
         anObject.userAdd = set.getString(7);
         anObject.dateAdd = set.getTimestamp(8);
         anObject.userGen = set.getString(9);
         anObject.dateEdit = set.getTimestamp(10);

         anObject.statusRefCode = set.getInt(11);
     if(set.wasNull())
       anObject.statusRefCode = Integer.MIN_VALUE;
         anObject.statusRefName = set.getString(12);
        
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
    
    public ENFuelInventarizationShortList getListByTravelSheet(ENTravelSheet travelSheet) throws PersistenceException {
    	if(travelSheet == null || travelSheet.code == Integer.MIN_VALUE) throw new NullPointerException("Не задан путевой лист!");
    	ENFuelInventarizationItemDAO itemDao = new ENFuelInventarizationItemDAO(this.getUserProfile(), this.getConnection());
    	ENFuelInventarizationItemShortList itemList = itemDao.getListByTravelSheet(travelSheet);
    	if(itemList == null || itemList.totalCount == 0) {
    		return new ENFuelInventarizationShortList();
    	} else {
    		Set<Integer> inventarizationCodes = itemList.getList().stream()
    				.map(ENFuelInventarizationItemShort::getInventarizationRefCode)
    				.collect(Collectors.toSet());
    		ENFuelInventarizationFilter filter = new ENFuelInventarizationFilter();
    		filter.conditionSQL = String.format("code IN (%s)", Tools.repeatSymbol("?", ",", itemList.totalCount));
    		return this.getScrollableFilteredList(filter, 0, -1, new Vector<Object>(inventarizationCodes));
    	}
    }

    
} // end of ENFuelInventarizationDAO
