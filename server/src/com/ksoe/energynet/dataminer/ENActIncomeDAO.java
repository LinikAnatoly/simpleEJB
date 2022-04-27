
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

import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.dataminer.generated.ENActIncomeDAOGen;
import com.ksoe.energynet.logic.ContractLogic;
import com.ksoe.energynet.valueobject.ENActIncome;
import com.ksoe.energynet.valueobject.brief.ENActIncomeShort;
import com.ksoe.energynet.valueobject.lists.ENActIncomeShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;

  /**
  *  DAO Object for ENActIncome;
  *
  */

public class ENActIncomeDAO extends ENActIncomeDAOGen {

	public ENActIncomeDAO(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile, aConnection);
	}

	public ENActIncomeDAO(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection, anUserProfile);
	}


	@Override
	public int add(ENActIncome actIncome) throws PersistenceException {

	    /** добавление и проверка договора на наличие в АХ и ФК */
	    //// DEBUG !!!!!
	    if ( 1 == 1 ) {
		    if (actIncome.finDocCode != null && !actIncome.finDocCode.equals("")) {

		    	if (actIncome.contractNumber != null && !actIncome.contractNumber.equals("")) {

		    		boolean isCustomer = true;
		    		boolean isException = true;
		        	ContractLogic contractLogic = new ContractLogic(getConnection(), getUserProfile());
		        	actIncome.generalContractRef.code = contractLogic
								.addByContractNumber(actIncome.contractNumber, actIncome.partnerCode, actIncome.finDocCode, isCustomer, isException);

		        }
		    }
	    }

		return super.add(actIncome);
	}


	@Override
	public void save(ENActIncome actIncome) throws PersistenceException {

	    /** добавление и проверка договора на наличие в АХ и ФК */
	    //// DEBUG !!!!!
	    if ( 1 == 1 ) {
		    if (actIncome.finDocCode != null && !actIncome.finDocCode.equals("")) {

		    	if (actIncome.contractNumber != null && !actIncome.contractNumber.equals("")) {

		    		boolean isCustomer = true;
		    		boolean isException = true;
		        	ContractLogic contractLogic = new ContractLogic(getConnection(), getUserProfile());
		        	actIncome.generalContractRef.code = contractLogic
								.addByContractNumber(actIncome.contractNumber, actIncome.partnerCode, actIncome.finDocCode, isCustomer, isException);

		        }
		    }
	    }

		super.save(actIncome);
	}


	@Override
	public ENActIncomeShortList getScrollableFilteredList(
			ENActIncome aFilterObject, String anCondition, String anOrderBy,
			int fromPosition, int quantity, Vector aBindObjects)
			throws PersistenceException {
		ENActIncomeShortList result = new ENActIncomeShortList();
		ENActIncomeShort anObject;
		result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACTINCOME.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENACTINCOME.CODE"+
     ",ENACTINCOME.NUMBERGEN"+
     ",ENACTINCOME.DATEGEN"+
     ",ENACTINCOME.ACTDATESTART"+
     ",ENACTINCOME.ACTDATEEND"+
     ",ENACTINCOME.CONTRACTNUMBER"+
     ",ENACTINCOME.CONTRACTDATE"+
     ",ENACTINCOME.PARTNERNAME"+
     ",ENACTINCOME.PARTNERCODE"+
     ",ENACTINCOME.FINDOCCODE"+
     ",ENACTINCOME.FINDOCID"+

      ", ENACTINCOMESTATUS.CODE " +
      ", ENACTINCOMESTATUS.NAME " +
      ", ENACTINCOME.GENERALCONTRACTREFCODE " +

      " FROM ENACTINCOME " +
     ", ENACTINCOMESTATUS " +
     //" WHERE "
	"";
     whereStr = " ENACTINCOMESTATUS.CODE = ENACTINCOME.STATUSREFCODE" ; //+
		//selectStr = selectStr + " ${s} ENACTINCOME.CODE IN ( SELECT ENACTINCOME.CODE FROM ENACTINCOME ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOME.CODE = ?";
        }
         if (aFilterObject.numbergen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numbergen.indexOf('*',0) < 0 && aFilterObject.numbergen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACTINCOME.NUMBERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACTINCOME.NUMBERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dategen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOME.DATEGEN = ?";
        }
        if(aFilterObject.actDateStart != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOME.ACTDATESTART = ?";
        }
        if(aFilterObject.actDateEnd != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOME.ACTDATEEND = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACTINCOME.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACTINCOME.COMMENTGEN) LIKE UPPER(?)";
         }
         if (aFilterObject.contractNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.contractNumber.indexOf('*',0) < 0 && aFilterObject.contractNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACTINCOME.CONTRACTNUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACTINCOME.CONTRACTNUMBER) LIKE UPPER(?)";
         }
        if(aFilterObject.contractDate != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOME.CONTRACTDATE = ?";
        }
         if (aFilterObject.partnername != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.partnername.indexOf('*',0) < 0 && aFilterObject.partnername.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACTINCOME.PARTNERNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACTINCOME.PARTNERNAME) LIKE UPPER(?)";
         }
         if (aFilterObject.partnerCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.partnerCode.indexOf('*',0) < 0 && aFilterObject.partnerCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACTINCOME.PARTNERCODE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACTINCOME.PARTNERCODE) LIKE UPPER(?)";
         }
         if (aFilterObject.finDocCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finDocCode.indexOf('*',0) < 0 && aFilterObject.finDocCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACTINCOME.FINDOCCODE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACTINCOME.FINDOCCODE) LIKE UPPER(?)";
         }
        if(aFilterObject.finDocID != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOME.FINDOCID = ?";
        }
         if (aFilterObject.domain_info != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENACTINCOME.DOMAIN_INFO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENACTINCOME.DOMAIN_INFO) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOME.MODIFY_TIME = ?";
        }
        if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACTINCOME.STATUSREFCODE = ? ";
        }

        if(aFilterObject.generalContractRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACTINCOME.GENERALCONTRACTREFCODE = ? ";
        }

      }


    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENActIncome.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENActIncome.getList%} access denied");

    String domainWhereStr = SegregationQueryBuilder.addWhere("ENACTINCOME",segregationInfo,getUserProfile().getDomainInfo());

    if (domainWhereStr.length() != 0){
    // domainWhereStr = "  AND ENACTINCOME.DOMAIN_INFO IS NOT NULL";
    //else
	  if (whereStr.length() == 0)
	     whereStr = domainWhereStr;
	  else
	     whereStr = " "+whereStr + " AND " +domainWhereStr;
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

           if(aFilterObject.contractNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.contractNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.contractDate != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.contractDate.getTime()));
        }

           if(aFilterObject.partnername != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.partnername);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.partnerCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.partnerCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.finDocCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finDocCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.finDocID != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finDocID);
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
       if(aFilterObject.statusRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.statusRef.code);
       }

       if(aFilterObject.generalContractRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.generalContractRef.code);
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

        anObject = new ENActIncomeShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.numbergen = set.getString(2);
        anObject.dategen = set.getDate(3);
        anObject.actDateStart = set.getDate(4);
        anObject.actDateEnd = set.getDate(5);
        anObject.contractNumber = set.getString(6);
        anObject.contractDate = set.getDate(7);
        anObject.partnername = set.getString(8);
        anObject.partnerCode = set.getString(9);
        anObject.finDocCode = set.getString(10);
        anObject.finDocID = set.getInt(11);
        if ( set.wasNull() )
            anObject.finDocID = Integer.MIN_VALUE;

        anObject.statusRefCode = set.getInt(12);
		if(set.wasNull())
		   anObject.statusRefCode = Integer.MIN_VALUE;
        anObject.statusRefName = set.getString(13);

        anObject.generalContractRefCode = set.getInt(14);
		if(set.wasNull())
		   anObject.generalContractRefCode = Integer.MIN_VALUE;

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


} // end of ENActIncomeDAO

