
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
// Generated at Wed Oct 07 14:18:06 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENPlanCorrectHistoryDAOGen;
import com.ksoe.energynet.valueobject.ENPlanCorrectHistory;
import com.ksoe.energynet.valueobject.brief.ENPlanCorrectHistoryShort;
import com.ksoe.energynet.valueobject.lists.ENPlanCorrectHistoryShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENPlanCorrectHistory;
  *
  */

public class ENPlanCorrectHistoryDAO extends ENPlanCorrectHistoryDAOGen {

    @Override
	public ENPlanCorrectHistoryShortList getScrollableFilteredList(ENPlanCorrectHistory aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
        ENPlanCorrectHistoryShortList result = new ENPlanCorrectHistoryShortList();
        ENPlanCorrectHistoryShort anObject;
        result.list = new Vector();

        String     selectStr;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet  set = null;
        String     whereStr = "";
        String     condition = processCondition(anCondition);
        String     orderBy = processCondition(anOrderBy);

        if(orderBy.length() == 0)
        orderBy = "ENPLANCORRECTHISTORY.CODE";

        if(quantity < 0)
        quantity = Integer.MAX_VALUE/2;

        if(getUserProfile() == null)
        throw new PersistenceException("Internal Error (User Profile Is Undefined)");

        selectStr = "SELECT "+
        "ENPLANCORRECTHISTORY.CODE"+
        ",ENPLANCORRECTHISTORY.DATEGEN"+
        ",ENPLANCORRECTHISTORY.USERGEN"+
        ",ENPLANCORRECTHISTORY.DATEEDIT"+
        ", ENPLANCORRECTHISTORY.PLANOLDREFCODE " +
        ", ENPLANCORRECTHISTORY.PLANNEWREFCODE " +
/*
        ", ENPLANWORK.CODE " +
        ", ENPLANWORK.DATEGEN " +
        ", ENPLANWORK.YEARGEN " +
        ", ENPLANWORK.MONTHGEN " +
        ", ENPLANWORK.USERGEN " +
        ", ENPLANWORK.DATEEDIT " +
        ", ENPLANWORK.CODE " +
        ", ENPLANWORK.DATEGEN " +
        ", ENPLANWORK.YEARGEN " +
        ", ENPLANWORK.MONTHGEN " +
        ", ENPLANWORK.USERGEN " +
        ", ENPLANWORK.DATEEDIT " +
        */
        ", ENPLANCORRECTREASON.CODE " +
        ", ENPLANCORRECTREASON.NAME " +
        " , ENPLANCORRECTHISTORY.PLANREFCODE " +
        " FROM ENPLANCORRECTHISTORY " +
        //", ENPLANWORK " +
        //", ENPLANWORK " +
        ", ENPLANCORRECTREASON " +

        //" WHERE "
        "";
        //whereStr = " ENPLANWORK.CODE = ENPLANCORRECTHISTORY.PLANOLDREFCODE" ; //+

        // whereStr = whereStr +" AND ENPLANWORK.CODE = ENPLANCORRECTHISTORY.PLANNEWREFCODE" ; //+


        whereStr = whereStr +" ENPLANCORRECTREASON.CODE = ENPLANCORRECTHISTORY.REASONCODE" ; //+



            //selectStr = selectStr + " ${s} ENPLANCORRECTHISTORY.CODE IN ( SELECT ENPLANCORRECTHISTORY.CODE FROM ENPLANCORRECTHISTORY ";

//     " ";
        if(aFilterObject != null)
        {
            if(aFilterObject.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANCORRECTHISTORY.CODE = ?";
            }
            if(aFilterObject.dateGen != null) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANCORRECTHISTORY.DATEGEN = ?";
            }
            if (aFilterObject.userGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                    whereStr = whereStr + "  ENPLANCORRECTHISTORY.USERGEN = ?";
                else
                    whereStr = whereStr + "  ENPLANCORRECTHISTORY.USERGEN LIKE ?";
            }
            if(aFilterObject.dateEdit != null) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "  ENPLANCORRECTHISTORY.DATEEDIT = ?";
            }
            if(aFilterObject.planOldRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENPLANCORRECTHISTORY.PLANOLDREFCODE = ? ";
            }
            if(aFilterObject.planNewRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENPLANCORRECTHISTORY.PLANNEWREFCODE = ? ";
            }
            if(aFilterObject.reason.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENPLANCORRECTHISTORY.REASONCODE = ? ";
            }
            if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + "ENPLANCORRECTHISTORY.PLANREFCODE = ? ";
            }

        }


        if(condition.length() != 0)
        {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";

            whereStr = whereStr + " (" + condition + ")";
        }
//     + " WHERE" +  сделано выше ????
        if(whereStr.length() != 0)
            selectStr = selectStr + " WHERE" + whereStr;

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
            if(aFilterObject.dateGen != null){
                number++;
                statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
            }
            if (aFilterObject.commentGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND";
                if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                    whereStr = whereStr + " ENPLANCORRECTHISTORY.COMMENTGEN = ?";
                else
                    whereStr = whereStr + " ENPLANCORRECTHISTORY.COMMENTGEN LIKE ?";

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
            if (aFilterObject.userGen != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND";
                if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                    whereStr = whereStr + " ENPLANCORRECTHISTORY.USERGEN = ?";
                else
                    whereStr = whereStr + " ENPLANCORRECTHISTORY.USERGEN LIKE ?";

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

            if(aFilterObject.modify_time != Long.MIN_VALUE){
                number++;
                if(aFilterObject.modify_time == Long.MIN_VALUE)
                    statement.setBigDecimal(number,null);
                else
                    statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
            }
        if(aFilterObject.planOldRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.planOldRef.code);
        }
        if(aFilterObject.planNewRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.planNewRef.code);
        }
        if(aFilterObject.reason.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.reason.code);
        }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.planRef.code);
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

            anObject = new ENPlanCorrectHistoryShort();

            anObject.code = set.getInt(1);
            if ( set.wasNull() )
                anObject.code = Integer.MIN_VALUE;
            anObject.dateGen = set.getDate(2);
            anObject.userGen = set.getString(3);
            anObject.dateEdit = set.getDate(4);


            anObject.planOldRefCode = set.getInt(5);
            anObject.planNewRefCode = set.getInt(6);
/*
            anObject.planOldRefDateGen = set.getDate(6);
            anObject.planOldRefYearGen = set.getInt(7);
            anObject.planOldRefMonthGen = set.getInt(8);
            anObject.planOldRefUserGen = set.getString(9);
            anObject.planOldRefDateEdit = set.getDate(10);
            anObject.planNewRefCode = set.getInt(11);
            anObject.planNewRefDateGen = set.getDate(12);
            anObject.planNewRefYearGen = set.getInt(13);
            anObject.planNewRefMonthGen = set.getInt(14);
            anObject.planNewRefUserGen = set.getString(15);
            anObject.planNewRefDateEdit = set.getDate(16);
*/
            anObject.reasonCode = set.getInt(7);

            anObject.reasonName = set.getString(8);

            anObject.planRefCode = set.getInt(9);
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

    @Override
	public int[] getFilteredCodeArray(ENPlanCorrectHistory aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
     Vector result = new Vector();

     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     selectStr = "SELECT ENPLANCORRECTHISTORY.CODE FROM ENPLANCORRECTHISTORY";
     String     whereStr = "";
     String     condition = processCondition(anCondition);
     String     orderBy = processCondition(anOrderBy);

     if(orderBy.length() == 0)
      orderBy = "ENPLANCORRECTHISTORY.CODE";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");


       if(aFilterObject != null)
       {
         if(aFilterObject.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENPLANCORRECTHISTORY.CODE = ?";
         }
         if(aFilterObject.dateGen != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENPLANCORRECTHISTORY.DATEGEN = ?";
         }
          if (aFilterObject.commentGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  ENPLANCORRECTHISTORY.COMMENTGEN = ?";
              else
                  whereStr = whereStr + "  ENPLANCORRECTHISTORY.COMMENTGEN LIKE ?";
          }
          if (aFilterObject.userGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  ENPLANCORRECTHISTORY.USERGEN = ?";
              else
                  whereStr = whereStr + "  ENPLANCORRECTHISTORY.USERGEN LIKE ?";
          }
         if(aFilterObject.dateEdit != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENPLANCORRECTHISTORY.DATEEDIT = ?";
         }

         if(aFilterObject.modify_time != Long.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENPLANCORRECTHISTORY.MODIFY_TIME = ?";
         }
         if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + " ENPLANCORRECTHISTORY.PLANREFCODE = ? ";
         }
         if(aFilterObject.planOldRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + " ENPLANCORRECTHISTORY.PLANOLDREFCODE = ? ";
         }
         if(aFilterObject.planNewRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + " ENPLANCORRECTHISTORY.PLANNEWREFCODE = ? ";
         }
         if(aFilterObject.reason.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + " ENPLANCORRECTHISTORY.REASONCODE = ? ";
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
         if(aFilterObject.dateGen != null){
             number++;
             statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
         }
          if (aFilterObject.commentGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND";
              if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                  whereStr = whereStr + " ENPLANCORRECTHISTORY.COMMENTGEN = ?";
              else
                  whereStr = whereStr + " ENPLANCORRECTHISTORY.COMMENTGEN LIKE ?";

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
          if (aFilterObject.userGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND";
              if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                  whereStr = whereStr + " ENPLANCORRECTHISTORY.USERGEN = ?";
              else
                  whereStr = whereStr + " ENPLANCORRECTHISTORY.USERGEN LIKE ?";

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

         if(aFilterObject.modify_time != Long.MIN_VALUE){
             number++;
             if(aFilterObject.modify_time == Long.MIN_VALUE)
                 statement.setBigDecimal(number,null);
             else
                 statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
         }
        if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.planRef.code);
        }
        if(aFilterObject.planOldRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.planOldRef.code);
        }
        if(aFilterObject.planNewRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.planNewRef.code);
        }
        if(aFilterObject.reason.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.reason.code);
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



  public ENPlanCorrectHistoryDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENPlanCorrectHistoryDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

} // end of ENPlanCorrectHistoryDAO

