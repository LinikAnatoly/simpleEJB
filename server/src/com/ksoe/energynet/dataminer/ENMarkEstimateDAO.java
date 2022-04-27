
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENMarkEstimateDAOGen;
import com.ksoe.energynet.valueobject.ENMarkEstimate;
import com.ksoe.energynet.valueobject.brief.ENMarkEstimateShort;
import com.ksoe.energynet.valueobject.lists.ENMarkEstimateShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENMarkEstimate;
  *
  */

public class ENMarkEstimateDAO extends ENMarkEstimateDAOGen {


  public ENMarkEstimateDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENMarkEstimateDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public ENMarkEstimateShortList getScrollableFilteredList(ENMarkEstimate aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {
   ENMarkEstimateShortList result = new ENMarkEstimateShortList();
   ENMarkEstimateShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);

   if(orderBy.length() == 0)
    orderBy = "ENMARKESTIMATE.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "SELECT "+
    "ENMARKESTIMATE.CODE"+
    ",ENMARKESTIMATE.USERNAME"+

     ", ENMARK.CODE " +
     ", ENMARK.NAME " +
    ", ENMARKESTIMATE.ESTIMATEITEMCODE" +
    " FROM ENMARKESTIMATE " +
    ", ENMARK " +
    //" WHERE "
    "";
    whereStr = " ENMARK.CODE = ENMARKESTIMATE.MARKCODE" ; //+
        //selectStr = selectStr + " ${s} ENMARKESTIMATE.CODE IN ( SELECT ENMARKESTIMATE.CODE FROM ENMARKESTIMATE ";

     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENMARKESTIMATE.CODE = ?";
       }
        if (aFilterObject.userName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.userName.indexOf('*',0) < 0 && aFilterObject.userName.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENMARKESTIMATE.USERNAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENMARKESTIMATE.USERNAME) LIKE UPPER(?)";
        }
       if(aFilterObject.mark.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENMARKESTIMATE.MARKCODE = ? ";
       }
       if(aFilterObject.estimateItem.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENMARKESTIMATE.ESTIMATEITEMCODE = ? ";
       }

     }



     if(condition.length() != 0)
     {
        if(whereStr.length() != 0)
           whereStr = whereStr + " AND ";

        whereStr = whereStr + " (" + condition + ")";
     }
//+ " WHERE" +  сделано выше ????
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

          if(aFilterObject.userName != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.userName);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
      if(aFilterObject.mark.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.mark.code);
      }
      if(aFilterObject.estimateItem.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.estimateItem.code);
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

       anObject = new ENMarkEstimateShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.userName = set.getString(2);


       anObject.markCode = set.getInt(3);

       anObject.markName = set.getString(4);
       anObject.estimateItemCode = set.getInt(5);
        if(set.wasNull())
        anObject.estimateItemCode = Integer.MIN_VALUE;

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

} // end of ENMarkEstimateDAO

