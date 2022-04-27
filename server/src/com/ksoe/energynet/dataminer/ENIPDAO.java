
//---------------------------------------------------------
// Application: EnergyNET2
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

import com.ksoe.energynet.dataminer.generated.ENIPDAOGen;
import com.ksoe.energynet.valueobject.ENIP;
import com.ksoe.energynet.valueobject.brief.ENIPShort;
import com.ksoe.energynet.valueobject.lists.ENIPShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENIP;
 *
 */

public class ENIPDAO extends ENIPDAOGen {

    public ENIPDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENIPDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    public int add(ENIP anObject) throws PersistenceException
    {
        anObject.userAdd = getUserProfile().userName;
        anObject.dateAdd = new Date();
        anObject.userEdit = getUserProfile().userName;
        anObject.dateEdit = new Date();

        return super.add(anObject);
    }

    public void save(ENIP anObject) throws PersistenceException
    {
        anObject.userEdit = getUserProfile().userName;
        anObject.dateEdit = new Date();

        super.save(anObject);
    }    
    
    public ENIPShortList getScrollableFilteredList(ENIP aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
     ENIPShortList result = new ENIPShortList();
     ENIPShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     whereStr = "";
     String     condition = processCondition(anCondition);
     String     orderBy = processCondition(anOrderBy);

     if(orderBy.length() == 0)
      //orderBy = "ENIP.CODE";
    	orderBy = "ENIP.YEARGEN DESC, ENIP.VERSION";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr = "SELECT "+
      "ENIP.CODE"+
      ",ENIP.NAME"+
      ",ENIP.YEARGEN"+
      ",ENIP.VERSION"+
      ",ENIP.COMMENTGEN"+
      ",ENIP.DATEADD"+
      ",ENIP.DATEEDIT"+
      ",ENIP.USERADD"+
      ",ENIP.USEREDIT"+

       ", ENIPSTATUS.CODE " +
       ", ENIPSTATUS.NAME " +
       ", ENIP.CODE " +
       ", ENIP.NAME " +
       ", ENIP.YEARGEN " +
       ", ENIP.VERSION " +
       ", ENIP.COMMENTGEN " +
       ", ENIP.DATEADD " +
       ", ENIP.DATEEDIT " +
       ", ENIP.USERADD " +
       ", ENIP.USEREDIT " +
       ", max(ENIP.code) over (  ) as lastipcode " + 
      " FROM ENIP " +
      ", ENIPSTATUS " +
      // ", ENIP " +
      //" WHERE "
 	"";
      whereStr = " ENIPSTATUS.CODE = ENIP.STATUSREFCODE" ; //+
      // whereStr = whereStr +" AND ENIP.CODE = ENIP.PARENTREFCODE" ; //+
 		//selectStr = selectStr + " ${s} ENIP.CODE IN ( SELECT ENIP.CODE FROM ENIP ";

 // " ";
       if(aFilterObject != null)
       {
         if(aFilterObject.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENIP.CODE = ?";
         }
          if (aFilterObject.name != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENIP.NAME) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENIP.NAME) LIKE UPPER(?)";
          }
         if(aFilterObject.yearGen != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENIP.YEARGEN = ?";
         }
         if(aFilterObject.version != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENIP.VERSION = ?";
         }
          if (aFilterObject.commentGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENIP.COMMENTGEN) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENIP.COMMENTGEN) LIKE UPPER(?)";
          }
         if(aFilterObject.dateAdd != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENIP.DATEADD = ?";
         }
         if(aFilterObject.dateEdit != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENIP.DATEEDIT = ?";
         }
          if (aFilterObject.userAdd != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENIP.USERADD) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENIP.USERADD) LIKE UPPER(?)";
          }
          if (aFilterObject.userEdit != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userEdit.indexOf('*',0) < 0 && aFilterObject.userEdit.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENIP.USEREDIT) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENIP.USEREDIT) LIKE UPPER(?)";
          }
         if(aFilterObject.modify_time != Long.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENIP.MODIFY_TIME = ?";
         }
         if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENIP.STATUSREFCODE = ? ";
         }
         if(aFilterObject.parentRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENIP.PARENTREFCODE = ? ";
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
          if(aFilterObject.yearGen != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.yearGen);
          }
          if(aFilterObject.version != Integer.MIN_VALUE){
              number++;
              statement.setInt(number,aFilterObject.version);
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
         if(aFilterObject.dateAdd != null){
             number++;
             statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateAdd.getTime()));
         }
         if(aFilterObject.dateEdit != null){
             number++;
             statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
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

            if(aFilterObject.userEdit != null){
                number++;
                StringBuffer likeStr = new StringBuffer();
                likeStr.append(aFilterObject.userEdit);
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
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.statusRef.code);
        }
        if(aFilterObject.parentRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.parentRef.code);
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

         anObject = new ENIPShort();

         anObject.code = set.getInt(1);
         if ( set.wasNull() )
             anObject.code = Integer.MIN_VALUE;
         anObject.name = set.getString(2);
         anObject.yearGen = set.getInt(3);
         if ( set.wasNull() )
             anObject.yearGen = Integer.MIN_VALUE;
         anObject.version = set.getInt(4);
         if ( set.wasNull() )
             anObject.version = Integer.MIN_VALUE;
         anObject.commentGen = set.getString(5);
         anObject.dateAdd = set.getTimestamp(6);
         anObject.dateEdit = set.getTimestamp(7);
         anObject.userAdd = set.getString(8);
         anObject.userEdit = set.getString(9);

         anObject.statusRefCode = set.getInt(10);
 		if(set.wasNull())
 		   anObject.statusRefCode = Integer.MIN_VALUE;
         anObject.statusRefName = set.getString(11);
         anObject.parentRefCode = set.getInt(12);
 		if(set.wasNull())
 		   anObject.parentRefCode = Integer.MIN_VALUE;
         anObject.parentRefName = set.getString(13);
         anObject.parentRefYearGen = set.getInt(14);
 		if(set.wasNull())
 		   anObject.parentRefYearGen = Integer.MIN_VALUE;
         anObject.parentRefVersion = set.getInt(15);
 		if(set.wasNull())
 		   anObject.parentRefVersion = Integer.MIN_VALUE;
         anObject.parentRefCommentGen = set.getString(16);
         anObject.parentRefDateAdd = set.getTimestamp(17);
         anObject.parentRefDateEdit = set.getTimestamp(18);
         anObject.parentRefUserAdd = set.getString(19);
         anObject.parentRefUserEdit = set.getString(20);
         
         anObject.lastIpCode = set.getInt(21);

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



} // end of ENIPDAO
