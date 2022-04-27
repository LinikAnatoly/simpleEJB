
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

import com.ksoe.energynet.dataminer.generated.ENDestinationPointDAOGen;
import com.ksoe.energynet.valueobject.ENDestinationPoint;
import com.ksoe.energynet.valueobject.brief.ENDestinationPointShort;
import com.ksoe.energynet.valueobject.lists.ENDestinationPointShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENDestinationPoint;
  *
  */

public class ENDestinationPointDAO extends ENDestinationPointDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENDestinationPointDAO() {super();}
  //public ENDestinationPointDAO(Connection aConnection) {super(aConnection);}
  //public ENDestinationPointDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENDestinationPointDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENDestinationPointDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}



  public ENDestinationPointShortList getScrollableFilteredList(ENDestinationPoint aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENDestinationPointShortList result = new ENDestinationPointShortList();
    ENDestinationPointShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENDESTINATIONPOINT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     " ENDESTINATIONPOINT.CODE"+
     ",ENDESTINATIONPOINT.NAME"+
     ",ENDESTINATIONPOINT.DATEEDIT"+
     ",ENDESTINATIONPOINT.USERGEN"+
     ",ENELEMENT.CODE " +
     ",ENDEPARTMENT.CODE " +
     ",ENDEPARTMENT.SHORTNAME " +

     " FROM ENDESTINATIONPOINT LEFT JOIN ENDEPARTMENT ON ENDESTINATIONPOINT.DEPARTMENTREFCODE = ENDEPARTMENT.CODE, ENELEMENT " +

	 "";

    whereStr = " ENELEMENT.CODE = ENDESTINATIONPOINT.ELEMENTREFCODE" ; //+


     if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDESTINATIONPOINT.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENDESTINATIONPOINT.NAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENDESTINATIONPOINT.NAME) LIKE UPPER(?)";
         }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENDESTINATIONPOINT.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENDESTINATIONPOINT.COMMENTGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDESTINATIONPOINT.DATEEDIT = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENDESTINATIONPOINT.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENDESTINATIONPOINT.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDESTINATIONPOINT.MODIFY_TIME = ?";
        }
        if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENDESTINATIONPOINT.ELEMENTREFCODE = ? ";
        }
        if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENDEPARTMENT.CODE = ? ";
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
        if(aFilterObject.dateEdit != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
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
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.elementRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.elementRef.code);
       }
       if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.departmentRef.code);
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

        anObject = new ENDestinationPointShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.name = set.getString(2);
        anObject.dateEdit = set.getTimestamp(3);
        anObject.userGen = set.getString(4);

        anObject.elementRefCode = set.getInt(5);
		if(set.wasNull())
		   anObject.elementRefCode = Integer.MIN_VALUE;
        anObject.departmentRefCode = set.getInt(6);
        if ( set.wasNull() )
            anObject.departmentRefCode = Integer.MIN_VALUE;
        anObject.departmentRefShortName = set.getString(7);

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



} // end of ENDestinationPointDAO

