
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
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENActIncome2ENActDAOGen;
import com.ksoe.energynet.valueobject.ENActIncome2ENAct;
import com.ksoe.energynet.valueobject.brief.ENActIncome2ENActShort;
import com.ksoe.energynet.valueobject.lists.ENActIncome2ENActShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENActIncome2ENAct;
  *
  */

public class ENActIncome2ENActDAO extends ENActIncome2ENActDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENActIncome2ENActDAO() {super();}
  //public ENActIncome2ENActDAO(Connection aConnection) {super(aConnection);}
  //public ENActIncome2ENActDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENActIncome2ENActDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENActIncome2ENActDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}



  public ENActIncome2ENActShortList getScrollableFilteredList(ENActIncome2ENAct aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENActIncome2ENActShortList result = new ENActIncome2ENActShortList();
    ENActIncome2ENActShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACTINCOME2ENACT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENACTINCOME2ENACT.CODE"+

      ", ENACTINCOME.CODE " +
      ", ENACTINCOME.NUMBERGEN " +
      ", ENACTINCOME.DATEGEN " +
      ", ENACTINCOME.CONTRACTNUMBER " +
      ", ENACTINCOME.CONTRACTDATE " +
      ", ENACTINCOME.PARTNERNAME " +
      ", ENACTINCOME.PARTNERCODE " +
      ", ENACTINCOME.FINDOCCODE " +
      ", ENACTINCOME.FINDOCID " +
     ", ENACTINCOME2ENACT.ACTREFCODE" +
     " FROM ENACTINCOME2ENACT " +
     ", ENACTINCOME " +
     //" WHERE "
	"";
     whereStr = " ENACTINCOME.CODE = ENACTINCOME2ENACT.ACTINCOMEREFCODE" ; //+
		//selectStr = selectStr + " ${s} ENACTINCOME2ENACT.CODE IN ( SELECT ENACTINCOME2ENACT.CODE FROM ENACTINCOME2ENACT ";

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOME2ENACT.CODE = ?";
        }
        if(aFilterObject.actIncomeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACTINCOME2ENACT.ACTINCOMEREFCODE = ? ";
        }
        if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACTINCOME2ENACT.ACTREFCODE = ? ";
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
       if(aFilterObject.actIncomeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.actIncomeRef.code);
       }
       if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.actRef.code);
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

        anObject = new ENActIncome2ENActShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;

        anObject.actIncomeRefCode = set.getInt(2);
		if(set.wasNull())
		   anObject.actIncomeRefCode = Integer.MIN_VALUE;
        anObject.actIncomeRefNumbergen = set.getString(3);
        anObject.actIncomeRefDategen = set.getDate(4);
        anObject.actIncomeRefContractNumber = set.getString(5);
        anObject.actIncomeRefContractDate = set.getDate(6);
        anObject.actIncomeRefPartnername = set.getString(7);
        anObject.actIncomeRefPartnerCode = set.getString(8);
        anObject.actIncomeRefFinDocCode = set.getString(9);
        anObject.actIncomeRefFinDocID = set.getInt(10);
		if(set.wasNull())
		   anObject.actIncomeRefFinDocID = Integer.MIN_VALUE;
        anObject.actRefCode = set.getInt(11);
		if(set.wasNull())
		   anObject.actRefCode = Integer.MIN_VALUE;

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


} // end of ENActIncome2ENActDAO

