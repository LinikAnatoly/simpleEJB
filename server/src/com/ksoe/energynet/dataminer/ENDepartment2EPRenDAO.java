
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer ;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENDepartment2EPRenDAOGen;
import com.ksoe.energynet.valueobject.ENDepartment2EPRen;
import com.ksoe.energynet.valueobject.brief.ENDepartment2EPRenShort;
import com.ksoe.energynet.valueobject.lists.ENDepartment2EPRenShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENDepartment2EPRen;
  *
  */

public class ENDepartment2EPRenDAO extends ENDepartment2EPRenDAOGen {

  public ENDepartment2EPRenDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENDepartment2EPRenDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}



  @Override
public ENDepartment2EPRenShortList getScrollableFilteredList(ENDepartment2EPRen aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENDepartment2EPRenShortList result = new ENDepartment2EPRenShortList();
    ENDepartment2EPRenShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENDEPARTMENT2EPREN.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENDEPARTMENT2EPREN.CODE"+
     ",ENDEPARTMENT2EPREN.FINRENCODE"+

      ", ENDEPARTMENT.CODE " +
      ", ENDEPARTMENT.SHORTNAME " +
      ", ENDEPARTMENT.DATESTART " +
      ", ENDEPARTMENT.DATEFINAL " +
      ", EPREN.CODE " +
      ", EPREN.NAME " +
      ", ENDEPARTMENT2EPREN.FINCFOCODE " +
      ", ENDEPARTMENT2EPREN.FINSERVICESCODE " +

      ", ENDEPARTMENT2EPREN.BILLINGSERVERIP " +
      ", ENDEPARTMENT2EPREN.BILLINGSERVERJNPPORT " +
      ", ENDEPARTMENT2EPREN.BILLINGSERVERPORT " +
      ",ENDEPARTMENT2EPREN.DOMAINCODE"+

     " FROM ENDEPARTMENT2EPREN " +
     ", ENDEPARTMENT " +
     ", EPREN " +
     //" WHERE "
    "";
     whereStr = " ENDEPARTMENT.CODE = ENDEPARTMENT2EPREN.DEPARTMENTREFCODE" ; //+
      whereStr = whereStr +" AND EPREN.CODE = ENDEPARTMENT2EPREN.RENREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENDEPARTMENT2EPREN.CODE IN ( SELECT ENDEPARTMENT2EPREN.CODE FROM ENDEPARTMENT2EPREN ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT2EPREN.CODE = ?";
        }
        if (aFilterObject.billingServerIp != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.billingServerIp.indexOf('*',0) < 0 && aFilterObject.billingServerIp.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENDEPARTMENT2EPREN.BILLINGSERVERIP) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENDEPARTMENT2EPREN.BILLINGSERVERIP) LIKE UPPER(?)";
        }
        if(aFilterObject.finRenCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT2EPREN.FINRENCODE = ?";
        }
        if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENDEPARTMENT2EPREN.DEPARTMENTREFCODE = ? ";
        }
        if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENDEPARTMENT2EPREN.RENREFCODE = ? ";
        }

        if (aFilterObject.finCFOCode != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.finCFOCode.indexOf('*',0) < 0 && aFilterObject.finCFOCode.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENDEPARTMENT2EPREN.FINCFOCODE) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENDEPARTMENT2EPREN.FINCFOCODE) LIKE UPPER(?)";
        }

        if (aFilterObject.finServicesCode != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.finServicesCode.indexOf('*',0) < 0 && aFilterObject.finServicesCode.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENDEPARTMENT2EPREN.FINSERVICESCODE) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENDEPARTMENT2EPREN.FINSERVICESCODE) LIKE UPPER(?)";
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
         if(aFilterObject.billingServerIp != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.billingServerIp);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }
         if(aFilterObject.finRenCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finRenCode);
         }
       if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.departmentRef.code);
       }
       if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.renRef.code);
       }

       if(aFilterObject.finCFOCode != null){
           number++;
           StringBuffer likeStr = new StringBuffer();
           likeStr.append(aFilterObject.finCFOCode);
           for(int i = 0;i < likeStr.length();i++){
                if(likeStr.charAt(i) == '*')
                     likeStr.setCharAt(i,'%');
                if(likeStr.charAt(i) == '?')
                     likeStr.setCharAt(i,'_');
           }
           statement.setString(number,likeStr.toString());
       }

       if(aFilterObject.finServicesCode != null){
           number++;
           StringBuffer likeStr = new StringBuffer();
           likeStr.append(aFilterObject.finServicesCode);
           for(int i = 0;i < likeStr.length();i++){
                if(likeStr.charAt(i) == '*')
                     likeStr.setCharAt(i,'%');
                if(likeStr.charAt(i) == '?')
                     likeStr.setCharAt(i,'_');
           }
           statement.setString(number,likeStr.toString());
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

        anObject = new ENDepartment2EPRenShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.finRenCode = set.getInt(2);
        if ( set.wasNull() )
            anObject.finRenCode = Integer.MIN_VALUE;


        anObject.departmentRefCode = set.getInt(3);

        anObject.departmentRefShortName = set.getString(4);

        anObject.departmentRefDateStart = set.getDate(5);

        anObject.departmentRefDateFinal = set.getDate(6);

        anObject.renRefCode = set.getInt(7);

        anObject.renRefName = set.getString(8);

        anObject.finCFOCode = set.getString(9);

        anObject.finServicesCode = set.getString(10);

        anObject.billingServerIp = set.getString(11);
        anObject.billingServerJnpPort = set.getString(12);
        anObject.billingServerPort = set.getString(13);
        
        anObject.domainCode = set.getInt(14);

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



} // end of ENDepartment2EPRenDAO

