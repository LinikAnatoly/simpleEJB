
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.energynet.dataminer.generated.FINWorkerDAOGen;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.FINWorkerLogic;
import com.ksoe.energynet.logic.mDaxLogic;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.valueobject.ENHumenItem;
import com.ksoe.energynet.valueobject.ENTransportItem;
import com.ksoe.energynet.valueobject.ENTravelSheet;
import com.ksoe.energynet.valueobject.ENWorkOrderByt;
import com.ksoe.energynet.valueobject.ENWorkOrderBytItem;
import com.ksoe.energynet.valueobject.FINWorker;
import com.ksoe.energynet.valueobject.FINWorkerKind;
import com.ksoe.energynet.valueobject.brief.FINWorkerShort;
import com.ksoe.energynet.valueobject.filter.ENHumenItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetFilter;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderBytFilter;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderBytItemFilter;
import com.ksoe.energynet.valueobject.filter.FINWorkerFilter;
import com.ksoe.energynet.valueobject.lists.FINWorkerShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.fin.logic.FKConsts;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for FINWorker;
  *
  */

public class FINWorkerDAO extends FINWorkerDAOGen {


  public FINWorkerDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public FINWorkerDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}



  public FINWorkerShortList getListTabNumberFromFinworker(FINWorker aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {
   FINWorkerShortList result = new FINWorkerShortList();
   FINWorkerShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);

   //if(orderBy.length() == 0)
   // orderBy = "FINWORKER.NAME";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "select distinct tabnumber from finworker";

     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINWORKER.CODE = ?";
       }
        if (aFilterObject.name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINWORKER.NAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINWORKER.NAME) LIKE UPPER(?)";
        }

       if (aFilterObject.tabNumber != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.tabNumber.indexOf('*',0) < 0 && aFilterObject.tabNumber.indexOf('?',0) < 0)
               whereStr = whereStr + "  UPPER(FINWORKER.TABNUMBER) = UPPER(?)";
           else
               whereStr = whereStr + " UPPER(FINWORKER.TABNUMBER) LIKE UPPER(?)";
       }

        if (aFilterObject.positionName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.positionName.indexOf('*',0) < 0 && aFilterObject.positionName.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINWORKER.POSITIONNAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINWORKER.POSITIONNAME) LIKE UPPER(?)";
        }
       if(aFilterObject.positionCode != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINWORKER.POSITIONCODE = ?";
       }
        if (aFilterObject.departmentName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.departmentName.indexOf('*',0) < 0 && aFilterObject.departmentName.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINWORKER.DEPARTMENTNAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINWORKER.DEPARTMENTNAME) LIKE UPPER(?)";
        }
        if (aFilterObject.departmentCode != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.departmentCode.indexOf('*',0) < 0 && aFilterObject.departmentCode.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINWORKER.DEPARTMENTCODE) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINWORKER.DEPARTMENTCODE) LIKE UPPER(?)";
        }
       if(aFilterObject.priceGen != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINWORKER.PRICEGEN = ?";
       }
       if(aFilterObject.categor != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINWORKER.CATEGOR = ?";
       }
       if(aFilterObject.finCode != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINWORKER.FINCODE = ?";
       }
       if(aFilterObject.isSentAssignment != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINWORKER.ISSENTASSIGNMENT = ?";
       }
        if (aFilterObject.domain_info != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINWORKER.DOMAIN_INFO) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINWORKER.DOMAIN_INFO) LIKE UPPER(?)";
        }
       if(aFilterObject.modify_time != Long.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINWORKER.MODIFY_TIME = ?";
       }
       if (aFilterObject.positionId != null) {
           if (whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.positionId.indexOf('*', 0) < 0
                   && aFilterObject.positionId.indexOf('?', 0) < 0)
               whereStr = whereStr + "  FINWORKER.POSITIONID = ?";
           else
               whereStr = whereStr + "  FINWORKER.POSITIONID LIKE ?";
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


			if (aFilterObject.tabNumber != null) {
				number++;
				StringBuffer likeStr = new StringBuffer();
				likeStr.append(aFilterObject.tabNumber);
				for (int i = 0; i < likeStr.length(); i++) {
					if (likeStr.charAt(i) == '*')
						likeStr.setCharAt(i, '%');
					if (likeStr.charAt(i) == '?')
						likeStr.setCharAt(i, '_');
				}
				statement.setString(number, likeStr.toString());
			}


          if(aFilterObject.positionName != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.positionName);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

        if(aFilterObject.positionCode != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.positionCode);
        }

          if(aFilterObject.departmentName != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.departmentName);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.departmentCode != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.departmentCode);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.priceGen != null){
           number++;
           aFilterObject.priceGen = aFilterObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.priceGen);
       }
        if(aFilterObject.categor != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.categor);
        }
        if(aFilterObject.finCode != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.finCode);
        }
        if(aFilterObject.isSentAssignment != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.isSentAssignment);
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
       if (aFilterObject.positionId != null) {
           number++;
           StringBuffer likeStr = new StringBuffer();
           likeStr.append(aFilterObject.positionId);
           for (int i = 0; i < likeStr.length(); i++) {
               if (likeStr.charAt(i) == '*')
                   likeStr.setCharAt(i, '%');
               if (likeStr.charAt(i) == '?')
                   likeStr.setCharAt(i, '_');
           }
           statement.setString(number, likeStr.toString());
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

       anObject = new FINWorkerShort();

       anObject.tabNumber = set.getString(1);


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


	public FINWorkerShortList getGroupedListByTabNumber2(
			FINWorker aFilterObject, String anCondition, String anOrderBy,
			int fromPosition, int quantity, Vector aBindObjects)
			throws PersistenceException {
		FINWorkerShortList result = new FINWorkerShortList();
		FINWorkerShort anObject;
		result.list = new Vector();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if (orderBy.length() == 0)
			orderBy = "FINWORKER.NAME";

		if (quantity < 0)
			quantity = Integer.MAX_VALUE / 2;

		if (getUserProfile() == null)
			throw new PersistenceException(
					"Internal Error (User Profile Is Undefined)");

	   ///// 09.12.11
	   // selectStr = "select tabnumber, count(tabnumber), issentassignment, positioncode from finworker";
	   selectStr = "select tabnumber, count(tabnumber), issentassignment, positioncode, pricegen, positionid from finworker";
	   /////
	   //"group by tabnumber";

     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINWORKER.CODE = ?";
       }
        if (aFilterObject.name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINWORKER.NAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINWORKER.NAME) LIKE UPPER(?)";
        }


       if (aFilterObject.tabNumber != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.tabNumber.indexOf('*',0) < 0 && aFilterObject.tabNumber.indexOf('?',0) < 0)
               whereStr = whereStr + "  UPPER(FINWORKER.TABNUMBER) = UPPER(?)";
           else
               whereStr = whereStr + " UPPER(FINWORKER.TABNUMBER) LIKE UPPER(?)";
       }

        if (aFilterObject.positionName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.positionName.indexOf('*',0) < 0 && aFilterObject.positionName.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINWORKER.POSITIONNAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINWORKER.POSITIONNAME) LIKE UPPER(?)";
        }

       if(aFilterObject.positionCode != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINWORKER.POSITIONCODE = ?";
       }
        if (aFilterObject.departmentName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.departmentName.indexOf('*',0) < 0 && aFilterObject.departmentName.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINWORKER.DEPARTMENTNAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINWORKER.DEPARTMENTNAME) LIKE UPPER(?)";
        }
        if (aFilterObject.departmentCode != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.departmentCode.indexOf('*',0) < 0 && aFilterObject.departmentCode.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINWORKER.DEPARTMENTCODE) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINWORKER.DEPARTMENTCODE) LIKE UPPER(?)";
        }
       if(aFilterObject.priceGen != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINWORKER.PRICEGEN = ?";
       }
       if(aFilterObject.categor != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINWORKER.CATEGOR = ?";
       }
       if(aFilterObject.finCode != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINWORKER.FINCODE = ?";
       }
       if(aFilterObject.isSentAssignment != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINWORKER.ISSENTASSIGNMENT = ?";
       }
        if (aFilterObject.domain_info != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINWORKER.DOMAIN_INFO) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINWORKER.DOMAIN_INFO) LIKE UPPER(?)";
        }
       if(aFilterObject.modify_time != Long.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINWORKER.MODIFY_TIME = ?";
       }

       if (aFilterObject.positionId != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.positionId.indexOf('*',0) < 0 && aFilterObject.positionId.indexOf('?',0) < 0)
               whereStr = whereStr + "  UPPER(FINWORKER.POSITIONID) = UPPER(?)";
           else
               whereStr = whereStr + " UPPER(FINWORKER.POSITIONID) LIKE UPPER(?)";
       }

     }

/*
   SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(FINWorker.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
   if(segregationInfo.isAccessDenied())
     throw new PersistenceException("{%FINWorker.getList%} access denied");

   String domainWhereStr = SegregationQueryBuilder.addWhere("FINWORKER",segregationInfo,getUserProfile().getDomainInfo());

   if (domainWhereStr.length() != 0){
   // domainWhereStr = "  AND FINWORKER.DOMAIN_INFO IS NOT NULL";
   //else
    if (whereStr.length() == 0)
        whereStr = domainWhereStr;
    else
        whereStr = " "+whereStr + " AND " +domainWhereStr;
    }
*/

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


    //selectStr = selectStr + "group by tabnumber, name, issentassignment, pricegen ";
    ///// 09.12.11
    // selectStr = selectStr + "group by tabnumber, name, issentassignment, positioncode ";
    selectStr = selectStr + "group by tabnumber, name, issentassignment, positioncode, pricegen, positionid ";
    /////

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


          if(aFilterObject.tabNumber != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.tabNumber);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }


          if(aFilterObject.positionName != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.positionName);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        if(aFilterObject.positionCode != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.positionCode);
        }

          if(aFilterObject.departmentName != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.departmentName);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.departmentCode != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.departmentCode);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.priceGen != null){
           number++;
           aFilterObject.priceGen = aFilterObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.priceGen);
       }
        if(aFilterObject.categor != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.categor);
        }
        if(aFilterObject.finCode != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.finCode);
        }
        if(aFilterObject.isSentAssignment != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.isSentAssignment);
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

       if(aFilterObject.positionId != null){
           number++;
           StringBuffer likeStr = new StringBuffer();
           likeStr.append(aFilterObject.positionId);
           for(int i = 0;i < likeStr.length();i++){
                if(likeStr.charAt(i) == '*')
                     likeStr.setCharAt(i,'%');
                if(likeStr.charAt(i) == '?')
                     likeStr.setCharAt(i,'_');
           }
           statement.setString(number,likeStr.toString());
       }

     }

			if (condition.length() > 0 && aBindObjects != null)
				_bindObjectsToPreparedStatement(statement, aBindObjects, number);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				if (i < fromPosition)
					continue;
				else if (i >= fromPosition + quantity) {
					i++;
					break;
				}

		       anObject = new FINWorkerShort();

		       anObject.tabNumber = set.getString(1);


		       /*
		       anObject.priceGen = set.getBigDecimal(2);
		       if(anObject.priceGen != null)
		           anObject.priceGen = anObject.priceGen.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
		       */

		       anObject.isSentAssignment = set.getInt(3);
		       if ( set.wasNull() )
		        anObject.isSentAssignment = 0;

		       anObject.positionCode = set.getInt(4);
			   if (set.wasNull())
				   anObject.positionCode = Integer.MIN_VALUE;


		       ///// 09.12.11 Это было раньше закомментировано... теперь понадобилось ;)
		       anObject.priceGen = set.getBigDecimal(5);
		       if(anObject.priceGen != null)
		           anObject.priceGen = anObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

				anObject.positionId = set.getString(6);

				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			EnergyproPersistenceExceptionAnalyzer.analyser
					.throwPersistenceException(e);
			return null;
		} finally {
			try {
				if (set != null)
					set.close();
			} catch (SQLException e) {
			}
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}

/** для актов по параметризации , где на печатной форме акт по каждому плану */
  public FINWorkerShortList getGroupedListByTabNumberWithGroupByPlan(
				FINWorker aFilterObject, String anCondition, String anOrderBy,
				int fromPosition, int quantity, Vector aBindObjects  , String planCodes )
				throws PersistenceException {
			FINWorkerShortList result = new FINWorkerShortList();
			FINWorkerShort anObject;
			result.list = new Vector();

			String selectStr;
			Connection connection = getConnection();
			PreparedStatement statement = null;
			ResultSet set = null;
			String whereStr = "  finworker.code =enhumenitem.finworkercode   and enhumenitem.planrefcode=enplanwork.code and enplanwork.code in ("+ planCodes +")";
			String condition = processCondition(anCondition);
			String orderBy = processCondition(anOrderBy);

			if (orderBy.length() == 0)
				orderBy = "FINWORKER.NAME";

			if (quantity < 0)
				quantity = Integer.MAX_VALUE / 2;

			if (getUserProfile() == null)
				throw new PersistenceException(
						"Internal Error (User Profile Is Undefined)");

		   selectStr = " select finworker.tabnumber, \n"+ 
				   " count(finworker.tabnumber),  \n"+
				   "  finworker.issentassignment, \n"+
				   "  finworker.positioncode,     \n"+
				   "  finworker.pricegen,   \n"+
				   "  finworker.positionid, \n"+
				   "  enplanwork.code       \n"+
				   "  from finworker  , enhumenitem , enplanwork ";

		   
	     if(aFilterObject != null)
	     {
	       if(aFilterObject.code != Integer.MIN_VALUE) {
	           if(whereStr.length() != 0)
	              whereStr = whereStr + " AND ";
	           whereStr = whereStr + "  FINWORKER.CODE = ?";
	       }
	        if (aFilterObject.name != null) {
	            if(whereStr.length() != 0)
	                whereStr = whereStr + " AND ";
	            if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
	                whereStr = whereStr + "  UPPER(FINWORKER.NAME) = UPPER(?)";
	            else
	                whereStr = whereStr + " UPPER(FINWORKER.NAME) LIKE UPPER(?)";
	        }


	       if (aFilterObject.tabNumber != null) {
	           if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	           if (aFilterObject.tabNumber.indexOf('*',0) < 0 && aFilterObject.tabNumber.indexOf('?',0) < 0)
	               whereStr = whereStr + "  UPPER(FINWORKER.TABNUMBER) = UPPER(?)";
	           else
	               whereStr = whereStr + " UPPER(FINWORKER.TABNUMBER) LIKE UPPER(?)";
	       }

	        if (aFilterObject.positionName != null) {
	            if(whereStr.length() != 0)
	                whereStr = whereStr + " AND ";
	            if (aFilterObject.positionName.indexOf('*',0) < 0 && aFilterObject.positionName.indexOf('?',0) < 0)
	                whereStr = whereStr + "  UPPER(FINWORKER.POSITIONNAME) = UPPER(?)";
	            else
	                whereStr = whereStr + " UPPER(FINWORKER.POSITIONNAME) LIKE UPPER(?)";
	        }

	       if(aFilterObject.positionCode != Integer.MIN_VALUE) {
	           if(whereStr.length() != 0)
	              whereStr = whereStr + " AND ";
	           whereStr = whereStr + "  FINWORKER.POSITIONCODE = ?";
	       }
	        if (aFilterObject.departmentName != null) {
	            if(whereStr.length() != 0)
	                whereStr = whereStr + " AND ";
	            if (aFilterObject.departmentName.indexOf('*',0) < 0 && aFilterObject.departmentName.indexOf('?',0) < 0)
	                whereStr = whereStr + "  UPPER(FINWORKER.DEPARTMENTNAME) = UPPER(?)";
	            else
	                whereStr = whereStr + " UPPER(FINWORKER.DEPARTMENTNAME) LIKE UPPER(?)";
	        }
	        if (aFilterObject.departmentCode != null) {
	            if(whereStr.length() != 0)
	                whereStr = whereStr + " AND ";
	            if (aFilterObject.departmentCode.indexOf('*',0) < 0 && aFilterObject.departmentCode.indexOf('?',0) < 0)
	                whereStr = whereStr + "  UPPER(FINWORKER.DEPARTMENTCODE) = UPPER(?)";
	            else
	                whereStr = whereStr + " UPPER(FINWORKER.DEPARTMENTCODE) LIKE UPPER(?)";
	        }
	       if(aFilterObject.priceGen != null) {
	           if(whereStr.length() != 0)
	              whereStr = whereStr + " AND ";
	           whereStr = whereStr + "  FINWORKER.PRICEGEN = ?";
	       }
	       if(aFilterObject.categor != Integer.MIN_VALUE) {
	           if(whereStr.length() != 0)
	              whereStr = whereStr + " AND ";
	           whereStr = whereStr + "  FINWORKER.CATEGOR = ?";
	       }
	       if(aFilterObject.finCode != Integer.MIN_VALUE) {
	           if(whereStr.length() != 0)
	              whereStr = whereStr + " AND ";
	           whereStr = whereStr + "  FINWORKER.FINCODE = ?";
	       }
	       if(aFilterObject.isSentAssignment != Integer.MIN_VALUE) {
	           if(whereStr.length() != 0)
	              whereStr = whereStr + " AND ";
	           whereStr = whereStr + "  FINWORKER.ISSENTASSIGNMENT = ?";
	       }
	        if (aFilterObject.domain_info != null) {
	            if(whereStr.length() != 0)
	                whereStr = whereStr + " AND ";
	            if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
	                whereStr = whereStr + "  UPPER(FINWORKER.DOMAIN_INFO) = UPPER(?)";
	            else
	                whereStr = whereStr + " UPPER(FINWORKER.DOMAIN_INFO) LIKE UPPER(?)";
	        }
	       if(aFilterObject.modify_time != Long.MIN_VALUE) {
	           if(whereStr.length() != 0)
	              whereStr = whereStr + " AND ";
	           whereStr = whereStr + "  FINWORKER.MODIFY_TIME = ?";
	       }

	       if (aFilterObject.positionId != null) {
	           if(whereStr.length() != 0)
	               whereStr = whereStr + " AND ";
	           if (aFilterObject.positionId.indexOf('*',0) < 0 && aFilterObject.positionId.indexOf('?',0) < 0)
	               whereStr = whereStr + "  UPPER(FINWORKER.POSITIONID) = UPPER(?)";
	           else
	               whereStr = whereStr + " UPPER(FINWORKER.POSITIONID) LIKE UPPER(?)";
	       }

	     }

     if(condition.length() != 0)
	     {
	        if(whereStr.length() != 0)
	           whereStr = whereStr + " AND ";

	        whereStr = whereStr + " (" + condition + ")";
	     }

	    if(whereStr.length() != 0)
	        selectStr = selectStr + " WHERE" + whereStr;

	    selectStr = selectStr + "group by finworker.tabnumber, finworker.name, finworker.issentassignment, finworker.positioncode, finworker.pricegen, finworker.positionid, enplanwork.code";


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


	          if(aFilterObject.tabNumber != null){
	              number++;
	              StringBuffer likeStr = new StringBuffer();
	              likeStr.append(aFilterObject.tabNumber);
	              for(int i = 0;i < likeStr.length();i++){
	                   if(likeStr.charAt(i) == '*')
	                        likeStr.setCharAt(i,'%');
	                   if(likeStr.charAt(i) == '?')
	                        likeStr.setCharAt(i,'_');
	              }
	              statement.setString(number,likeStr.toString());
	          }


	          if(aFilterObject.positionName != null){
	              number++;
	              StringBuffer likeStr = new StringBuffer();
	              likeStr.append(aFilterObject.positionName);
	              for(int i = 0;i < likeStr.length();i++){
	                   if(likeStr.charAt(i) == '*')
	                        likeStr.setCharAt(i,'%');
	                   if(likeStr.charAt(i) == '?')
	                        likeStr.setCharAt(i,'_');
	              }
	              statement.setString(number,likeStr.toString());
	          }
	        if(aFilterObject.positionCode != Integer.MIN_VALUE){
	            number++;
	            statement.setInt(number,aFilterObject.positionCode);
	        }

	          if(aFilterObject.departmentName != null){
	              number++;
	              StringBuffer likeStr = new StringBuffer();
	              likeStr.append(aFilterObject.departmentName);
	              for(int i = 0;i < likeStr.length();i++){
	                   if(likeStr.charAt(i) == '*')
	                        likeStr.setCharAt(i,'%');
	                   if(likeStr.charAt(i) == '?')
	                        likeStr.setCharAt(i,'_');
	              }
	              statement.setString(number,likeStr.toString());
	          }

	          if(aFilterObject.departmentCode != null){
	              number++;
	              StringBuffer likeStr = new StringBuffer();
	              likeStr.append(aFilterObject.departmentCode);
	              for(int i = 0;i < likeStr.length();i++){
	                   if(likeStr.charAt(i) == '*')
	                        likeStr.setCharAt(i,'%');
	                   if(likeStr.charAt(i) == '?')
	                        likeStr.setCharAt(i,'_');
	              }
	              statement.setString(number,likeStr.toString());
	          }
	       if(aFilterObject.priceGen != null){
	           number++;
	           aFilterObject.priceGen = aFilterObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
	           statement.setBigDecimal(number,aFilterObject.priceGen);
	       }
	        if(aFilterObject.categor != Integer.MIN_VALUE){
	            number++;
	            statement.setInt(number,aFilterObject.categor);
	        }
	        if(aFilterObject.finCode != Integer.MIN_VALUE){
	            number++;
	            statement.setInt(number,aFilterObject.finCode);
	        }
	        if(aFilterObject.isSentAssignment != Integer.MIN_VALUE){
	            number++;
	            statement.setInt(number,aFilterObject.isSentAssignment);
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

	       if(aFilterObject.positionId != null){
	           number++;
	           StringBuffer likeStr = new StringBuffer();
	           likeStr.append(aFilterObject.positionId);
	           for(int i = 0;i < likeStr.length();i++){
	                if(likeStr.charAt(i) == '*')
	                     likeStr.setCharAt(i,'%');
	                if(likeStr.charAt(i) == '?')
	                     likeStr.setCharAt(i,'_');
	           }
	           statement.setString(number,likeStr.toString());
	       }

	     }

				if (condition.length() > 0 && aBindObjects != null)
					_bindObjectsToPreparedStatement(statement, aBindObjects, number);

				set = statement.executeQuery();
				int i;
				for (i = 0; set.next(); i++) {
					if (i < fromPosition)
						continue;
					else if (i >= fromPosition + quantity) {
						i++;
						break;
					}

			       anObject = new FINWorkerShort();

			       anObject.tabNumber = set.getString(1);


			       /*
			       anObject.priceGen = set.getBigDecimal(2);
			       if(anObject.priceGen != null)
			           anObject.priceGen = anObject.priceGen.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
			       */

			       anObject.isSentAssignment = set.getInt(3);
			       if ( set.wasNull() )
			        anObject.isSentAssignment = 0;

			       anObject.positionCode = set.getInt(4);
				   if (set.wasNull())
					   anObject.positionCode = Integer.MIN_VALUE;


			       ///// 09.12.11 Это было раньше закомментировано... теперь понадобилось ;)
			       anObject.priceGen = set.getBigDecimal(5);
			       if(anObject.priceGen != null)
			           anObject.priceGen = anObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

					anObject.positionId = set.getString(6);
					
					anObject.planCode = set.getInt(7);
					   if (set.wasNull())
						   anObject.planCode = Integer.MIN_VALUE;

					result.list.add(anObject);
				}

				result.setTotalCount(i);
				return result;
			} catch (SQLException e) {
				System.out.println(e.getMessage() + "\nstatement - " + selectStr);
				EnergyproPersistenceExceptionAnalyzer.analyser
						.throwPersistenceException(e);
				return null;
			} finally {
				try {
					if (set != null)
						set.close();
				} catch (SQLException e) {
				}
				try {
					if (statement != null)
						statement.close();
				} catch (SQLException e) {
				}
				if (connection != super.getConnection()) {
					try {
						connection.close();
					} catch (SQLException e) {
					}
				}
			}
		}


	
  public FINWorkerShortList getGroupedListByTabNumber(FINWorker aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {
   FINWorkerShortList result = new FINWorkerShortList();
   FINWorkerShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);

   if(orderBy.length() == 0)
    orderBy = "FINWORKER.NAME";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "select tabnumber, count(tabnumber) from finworker";
   //"group by tabnumber";

     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINWORKER.CODE = ?";
       }
        if (aFilterObject.name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINWORKER.NAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINWORKER.NAME) LIKE UPPER(?)";
        }


       if (aFilterObject.tabNumber != null) {
           if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.tabNumber.indexOf('*',0) < 0 && aFilterObject.tabNumber.indexOf('?',0) < 0)
               whereStr = whereStr + "  UPPER(FINWORKER.TABNUMBER) = UPPER(?)";
           else
               whereStr = whereStr + " UPPER(FINWORKER.TABNUMBER) LIKE UPPER(?)";
       }


        if (aFilterObject.positionName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.positionName.indexOf('*',0) < 0 && aFilterObject.positionName.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINWORKER.POSITIONNAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINWORKER.POSITIONNAME) LIKE UPPER(?)";
        }
       if(aFilterObject.positionCode != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINWORKER.POSITIONCODE = ?";
       }
        if (aFilterObject.departmentName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.departmentName.indexOf('*',0) < 0 && aFilterObject.departmentName.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINWORKER.DEPARTMENTNAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINWORKER.DEPARTMENTNAME) LIKE UPPER(?)";
        }
        if (aFilterObject.departmentCode != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.departmentCode.indexOf('*',0) < 0 && aFilterObject.departmentCode.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINWORKER.DEPARTMENTCODE) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINWORKER.DEPARTMENTCODE) LIKE UPPER(?)";
        }
       if(aFilterObject.priceGen != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINWORKER.PRICEGEN = ?";
       }
       if(aFilterObject.categor != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINWORKER.CATEGOR = ?";
       }
       if(aFilterObject.finCode != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINWORKER.FINCODE = ?";
       }
       if(aFilterObject.isSentAssignment != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINWORKER.ISSENTASSIGNMENT = ?";
       }
        if (aFilterObject.domain_info != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(FINWORKER.DOMAIN_INFO) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(FINWORKER.DOMAIN_INFO) LIKE UPPER(?)";
        }
       if(aFilterObject.modify_time != Long.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  FINWORKER.MODIFY_TIME = ?";
       }
       if (aFilterObject.positionId != null) {
           if (whereStr.length() != 0)
               whereStr = whereStr + " AND ";
           if (aFilterObject.positionId.indexOf('*', 0) < 0
                   && aFilterObject.positionId.indexOf('?', 0) < 0)
               whereStr = whereStr + "  FINWORKER.POSITIONID = ?";
           else
               whereStr = whereStr + "  FINWORKER.POSITIONID LIKE ?";
       }
     }

/*
   SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(FINWorker.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
   if(segregationInfo.isAccessDenied())
     throw new PersistenceException("{%FINWorker.getList%} access denied");

   String domainWhereStr = SegregationQueryBuilder.addWhere("FINWORKER",segregationInfo,getUserProfile().getDomainInfo());

   if (domainWhereStr.length() != 0){
   // domainWhereStr = "  AND FINWORKER.DOMAIN_INFO IS NOT NULL";
   //else
    if (whereStr.length() == 0)
        whereStr = domainWhereStr;
    else
        whereStr = " "+whereStr + " AND " +domainWhereStr;
    }
*/

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


    selectStr = selectStr + "group by tabnumber, name";

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


        if(aFilterObject.tabNumber != null){
            number++;
            StringBuffer likeStr = new StringBuffer();
            likeStr.append(aFilterObject.tabNumber);
            for(int i = 0;i < likeStr.length();i++){
                 if(likeStr.charAt(i) == '*')
                      likeStr.setCharAt(i,'%');
                 if(likeStr.charAt(i) == '?')
                      likeStr.setCharAt(i,'_');
            }
            statement.setString(number,likeStr.toString());
        }

          if(aFilterObject.positionName != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.positionName);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        if(aFilterObject.positionCode != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.positionCode);
        }

          if(aFilterObject.departmentName != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.departmentName);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.departmentCode != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.departmentCode);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
       if(aFilterObject.priceGen != null){
           number++;
           aFilterObject.priceGen = aFilterObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
           statement.setBigDecimal(number,aFilterObject.priceGen);
       }
        if(aFilterObject.categor != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.categor);
        }
        if(aFilterObject.finCode != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.finCode);
        }
        if(aFilterObject.isSentAssignment != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.isSentAssignment);
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
       if (aFilterObject.positionId != null) {
           number++;
           StringBuffer likeStr = new StringBuffer();
           likeStr.append(aFilterObject.positionId);
           for (int i = 0; i < likeStr.length(); i++) {
               if (likeStr.charAt(i) == '*')
                   likeStr.setCharAt(i, '%');
               if (likeStr.charAt(i) == '?')
                   likeStr.setCharAt(i, '_');
           }
           statement.setString(number, likeStr.toString());
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

       anObject = new FINWorkerShort();

       anObject.tabNumber = set.getString(1);

       anObject.priceGen = set.getBigDecimal(2);
       if(anObject.priceGen != null)
           anObject.priceGen = anObject.priceGen.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);

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

  /**
   *
   * Список работников на сегодняшнюю дату
   *
   * @param aFilterObject фильтр работников
   * @param fromPosition с какой позиции
   * @param quantity количество
   * @param isShowCEO показывать ли директоров
   * @return FINWorkerShortList список работников
   * @throws PersistenceException
   */
  public FINWorkerShortList getFINWorkerList(FINWorkerFilter aFilterObject,int fromPosition,int quantity, boolean isShowCEO) throws PersistenceException
  {
    Date dateIn = new Date();
    return getFINWorkerList( aFilterObject, fromPosition, quantity, dateIn, isShowCEO);

  }

  /**
   *
   * Список работников на дату
   *
   * @param aFilterObject фильтр работников
   * @param fromPosition с какой позиции
   * @param quantity количество
   * @param isShowCEO показывать ли директоров
   * @param dateIn дата выборки
   * @return FINWorkerShortList список работников
   * @throws PersistenceException
   */
  public FINWorkerShortList getFINWorkerList(FINWorkerFilter aFilterObject,int fromPosition,int quantity, java.util.Date dateIn, boolean isShowCEO) throws PersistenceException
  {

	  	if (dateIn == null) {
	  		dateIn = new Date();
	  	}

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(dateIn);
        calendar.add(Calendar.DATE,-1);

        /// 13.06.12
        /*
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);

        Date dateIn_1 = calendar.getTime();
        */

        Date dateIn_1 = com.ksoe.energynet.util.Tools.clearTimeOfDate(calendar.getTime());


   FINWorkerShortList result = new FINWorkerShortList();
   FINWorkerShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;

   String     whereStr = " ";

   String     condition = aFilterObject.conditionSQL == null ? "" :  aFilterObject.conditionSQL ; //processCondition(anCondition);
   String     orderBy = aFilterObject.orderBySQL == null ? "" : aFilterObject.orderBySQL ; //processCondition(anOrderBy);

   if(orderBy.length() == 0)
    orderBy = " fio.F||' '||fio.I||' '||fio.O, kr.TabN, n.Date_Start desc";


   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
	   throw new PersistenceException("Internal Error (User Profile Is Undefined)");


	AuthLogic netAuth = new AuthLogic(getConnection(), getUserProfile());
	if (netAuth.checkUsesMDAXData()) {
		mDaxLogic mdLogic = new mDaxLogic(getConnection(), getUserProfile());
		return mdLogic.getFINWorkerList(aFilterObject, fromPosition, quantity, dateIn, isShowCEO);
	}


    selectStr =
        " SELECT  " +
        "  " +
        //"   /*+ RULE */  " +
        "               n.karta_id idkadry, fio.f || ' ' || fio.i || ' ' || fio.o fio, " +
        "               trim(to_char(kr.tabn, '000000')) as tabn, " +
        "               ps.post_id post_id, RTRIM (ps.post_nazv) post_nazv, " +
        "               pd.podr_id podrcod, pd.podr_nazv podrname, " +
        "               /*SUPP-2238*/decode(pd.podr_id," + FKConsts.PODR_MANAGEMENT_ID + ",0,NVL (nd.oklad, dd.oklad)) oklad, NULL date_uvol, NULL katgor, kr.prim, " +
        "               n.doljnost_id doljnostid, pd.ceh_id cehid, pd.ceh_nazv cehNazv " +
        /// 25.03.2015 выборка категории персонала , айдишник графика рабочего времени (из zarpherson.work_time)
        " , k.id as kategory_id " +
        " , k.nazv as kategory_nazv " +
        " , ( select kdv.work_time_id from zarpherson.kadry_day kdv " +
        "     where kdv.rowid = (select zarpherson.get_kadry_rowid(kkk.idkadry, ?) " +
        "                 from zarpherson.kadry_day_view kkk " +
        "                where kkk.tabn = kr.tabn) ) as work_time_id " +
        "  , ( select nazv from  kadry.kategory where id = ps.kategory_id ) as position_kategory   "  +
        "               FROM " +
        "  kadry.Prom            prom, " +
        "  kadry.Kategory        k, " +
        "  kadry.Doljnost      d, " +
        "  kadry.Doljnost_Day  dd, " +
        "  (SELECT p.Id             Podr_Id, " +
        "          p.Date_Start     Podr_Date_Start, " +
        "          p.Date_Finish    Podr_Date_Finish, " +
        "          pd.ROWID         Podr_Day_Row_Id, " +
        "          pd.Podr_Id       Podr_Day_Podr_Id, " +
        "          pd.Date_Start    Podr_Day_Date_Start, " +
        "          pd.Main_Podr_Id  Main_Podr_Id, " +
        "          pd.Podr_Vid_Id   Podr_Vid_Id, " +
        "          pd.Nazv          Podr_Nazv, " +
        "          pd.Sokr_Nazv     Podr_Sokr_Nazv, " +
        "          pd.Kod           Podr_Kod, " +
        "          pd.Prom_Id       Podr_Prom_Id, " +
        "          pd.Pos           Podr_Pos, " +
        "          pd.Vne_Shtata    Vne_Shtata, " +
        "          ceh.ROWID        Ceh_Row_Id, " +
        "          ceh.Podr_Id      Ceh_Id, " +
        "          ceh.Date_Start   Ceh_Date_Start, " +
        "          ceh.Main_Podr_Id Ceh_Main_Podr_Id, " +
        "          ceh.Podr_Vid_Id  Ceh_Vid_Id, " +
        "          ceh.Nazv         Ceh_Nazv, " +
        "          ceh.Sokr_Nazv    Ceh_Sokr_Nazv, " +
        "          ceh.Kod          Ceh_Kod, " +
        "          ceh.Prom_Id      Ceh_Prom_Id, " +
        "          ceh.Pos          Ceh_Pos " +
        "     FROM kadry.Podr_Day  ceh, " +
        "          kadry.Podr_Day  pd, " +
        "          kadry.Podr      p " +
        "    WHERE pd.Podr_Id(+) = p.Id " +
        "      AND (pd.Podr_Id IS NULL " +
        "        OR pd.ROWID = (SELECT SUBSTR(MAX(TO_CHAR(pd1.Date_Start,'J')||ROWID),8) " +
        "                          FROM kadry.Podr_Day pd1 " +
        "                         WHERE pd1.Podr_Id=pd.Podr_Id " +
        "                           AND pd1.Date_Start<=?) " +
        "          ) " +
        "      AND ceh.Podr_Id = kadry.pkg_podr_utils.Get_Struct_Ed_Id_Buf(p.Id, ?) " +
        "      AND ceh.ROWID = (SELECT SUBSTR(MAX(TO_CHAR(ceh1.date_start,'J')||ROWID),8) " +
        "                          FROM kadry.Podr_Day ceh1 " +
        "                         WHERE ceh1.Podr_Id=ceh.Podr_Id " +
        "                           AND ceh1.Date_Start<=?) " +
        "             ) pd, " +
        "  kadry.v_Post       ps, " +
        "  kadry.v_Post       ps1, " +
        "  " +
        //" -- предыдущее назначение " +
        "  kadry.Perevod_Vid  pv, " +
        "  kadry.perevod_usl  pu, " +
        "  kadry.Osnova       os, " +
        "  kadry.Nazn         n2, " +
        "  kadry.Doljnost     d2, " +
        "  kadry.Post         ps2, " +
        "  kadry.Razr         rz2, " +
        "  kadry.Prof         pf2, " +
        //" --  Podr_Day     pd2, " +
        //" -- следующее назначение " +
        "  kadry.Perevod_Vid  pv3, " +
        "  kadry.perevod_usl  pu3, " +
        "  kadry.Osnova       os3, " +
        "  kadry.Nazn         n3, " +
        "  kadry.Doljnost     d3, " +
        "  kadry.Post         ps3, " +
        "  kadry.Razr         rz3, " +
        "  kadry.Prof         pf3, " +
        //" --  Podr_Day     pd3, " +
        //" --  " +
        "  " +
        "  kadry.FIO          fio, " +
        "  kadry.Karta        kr, " +
        "  kadry.Nazn_Vid     nv, " +
        "  kadry.Pricaz       pr1, " +
        "  kadry.Pricaz       pr2, " +
        "  kadry.Pricaz       pr3, " +
        "  kadry.Regim        r, " +
        "  kadry.Nazn_Day     nd, " +
        "  kadry.Nazn         n " +
        //" --  " +
        " WHERE ((nd.Nazn_Id = n.Id " +
        //"  -- Выбор параметров на дату среза " +
        "  AND nd.Date_Start <= GREATEST(n.Date_Start, ?) " +
        "  AND NOT EXISTS " +
        "     (SELECT NULL FROM kadry.s_Nazn_Day nd2 " +
        "       WHERE nd2.Nazn_Id = nd.Nazn_Id " +
        "         AND nd2.Date_Start <= GREATEST(n.Date_Start, ?) " +
        "         AND nd2.Date_Start > nd.Date_Start) " +
        "  AND n.Start_Pricaz_Id  = pr1.Id " +
        "  AND n.Finish_Pricaz_Id = pr2.Id " +
        "  AND nd.Pricaz_Id       = pr3.Id " +
        //"  -- " +
        "  AND n.Doljnost_Id = d.Id " +
        "  AND pd.Podr_Id = d.Podr_Id " +
        "  " +
        "  AND ps.Post_Id = NVL(nd.Post_Id, d.Post_Id) " +
        "  AND ps1.Post_Id = d.Post_Id " +
        "  AND k.Id = d.Kategory_Id " +
        "  AND prom.Id = DECODE(k.Prom_Id, 3,pd.Podr_Prom_Id, k.Prom_Id) " +
        //"  -- " +
        "  AND dd.Doljnost_Id(+) = d.Id " +
        //"  -- Выбор параметров должности на дату " +
        "  AND (dd.Doljnost_Id IS NULL " +
        "    OR (dd.Date_Start <= LEAST(n.Date_Finish, ?) " +
        //" --    OR (dd.Date_Start <= n.Date_Finish " +
        "      AND NOT EXISTS (SELECT NULL FROM kadry.Doljnost_Day dd2 " +
        "                      WHERE dd2.Doljnost_Id = dd.Doljnost_Id " +
        "                        AND dd2.Date_Start <= LEAST(n.Date_Finish, ?) " +
        //" --                        AND dd2.Date_Start <= n.Date_Finish " +
        "                        AND dd2.Date_Start > dd.Date_Start))) " +
        //" -- предыдущее назначение " +
        "  AND pv.Id(+) = n.Perevod_Vid_Id " +
        "  AND pu.id(+) = n.Perevod_Usl_id " +
        "  AND os.Id(+) = n.Perevod_Osnova_Id " +
        "  AND n.Perevod_Nazn_Id = n2.Id(+) " +
        "  AND n2.Doljnost_Id = d2.Id(+) " +
        "  AND ps2.Id(+) = d2.Post_Id " +
        "  AND pf2.Id(+) = ps2.Prof_Id " +
        "  AND rz2.Id(+) = ps2.Razr_Id  "+ //-- сдедующее назначение " +
        "  AND n.Id = n3.Perevod_Nazn_Id(+) " +
        "  AND pu3.id(+) = n3.perevod_Usl_id " +
        "  AND pv3.Id(+) = n3.Perevod_Vid_Id " +
        "  AND os3.Id(+) = n3.Perevod_Osnova_Id " +
        "  AND d3.Id(+)  = n3.Doljnost_Id " +
        "  AND ps3.Id(+) = d3.Post_Id " +
        "  AND pf3.Id(+) = ps3.Prof_Id " +
        "  AND rz3.Id(+) = ps3.Razr_Id  " +
        "  " +
        "  AND n.Karta_Id     = kr.Id " +
        "  AND fio.Id         = kr.FIO_Id " +
        "  AND nd.Nazn_Vid_Id = nv.Id(+) " +
        "  AND nd.Regim_Id  = r.Id(+) " +
        //" -- график назначения " +
        //" ) AND ? BETWEEN n.Date_Start AND n.Date_Finish /* открытые */ " +
        " ) AND ? BETWEEN n.Date_Start AND n.Date_Finish " +
        " ) AND INSTR(kadry.pkg_Podr_Utils.Get_Path_Id(d.Podr_Id, GREATEST(n.Date_Start, ?)),  " +
        " '_'||1||'_')>0 " +
        /*SUPP-2238*/((isShowCEO) ? "" : "    AND pd.podr_id <> " + FKConsts.PODR_MANAGEMENT_ID + " " +
        /*NET-4442*/                     "    AND nvl(ps.sokr_prof_dopoln, '-') <> 'n' ");




     if(aFilterObject != null)
     {

        if (aFilterObject.name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(fio.F||' '||fio.I||' '||fio.O) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(fio.F||' '||fio.I||' '||fio.O) LIKE UPPER(?)";
        }

       if(aFilterObject.tabNumber != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  kr.TabN = ?";
       }


        if (aFilterObject.departmentCode != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  pd.Podr_Id = ?";
        }

        if (aFilterObject.departmentName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.departmentName.indexOf('*',0) < 0 && aFilterObject.departmentName.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(pd.Podr_Nazv) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(pd.Podr_Nazv) LIKE UPPER(?)";
        }
        if (aFilterObject.positionName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.positionName.indexOf('*',0) < 0 && aFilterObject.positionName.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(RTRIM(ps.Post_Nazv)) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(RTRIM(ps.Post_Nazv)) LIKE UPPER(?)";
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
        selectStr = selectStr +  whereStr;

   // selectStr = selectStr + ") ";

   selectStr = selectStr + " ORDER BY " + orderBy;

   try
    {
     statement = connection.prepareStatement(selectStr);


     statement.setDate(1, new java.sql.Date(dateIn.getTime()));
     statement.setDate(2, new java.sql.Date(dateIn.getTime()));
     statement.setDate(3, new java.sql.Date(dateIn.getTime()));
     statement.setDate(4, new java.sql.Date(dateIn.getTime()));
     statement.setDate(5, new java.sql.Date(dateIn.getTime()));
     statement.setDate(6, new java.sql.Date(dateIn.getTime()));
     statement.setDate(7, new java.sql.Date(dateIn.getTime()));
     statement.setDate(8, new java.sql.Date(dateIn.getTime()));
     statement.setDate(9, new java.sql.Date(dateIn.getTime()));

     statement.setDate(10, new java.sql.Date(dateIn_1.getTime()));

     int number = 10;

     if(aFilterObject != null){

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


        if(aFilterObject.tabNumber != null){
            number++;
            StringBuffer likeStr = new StringBuffer();
            likeStr.append(aFilterObject.tabNumber);
            for(int i = 0;i < likeStr.length();i++){
                 if(likeStr.charAt(i) == '*')
                      likeStr.setCharAt(i,'%');
                 if(likeStr.charAt(i) == '?')
                      likeStr.setCharAt(i,'_');
            }
            statement.setString(number,likeStr.toString());
        }

          if(aFilterObject.departmentCode != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.departmentCode);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.departmentName != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.departmentName);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.positionName != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.positionName);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

     }

     //if(condition.length() > 0 && aBindObjects != null)
     // _bindObjectsToPreparedStatement(statement,aBindObjects,number);

     /**
     String statementText = statement.toString();
     String query = statementText.substring( statementText.indexOf( ": " ) + 2 );
     System.out.println(query);
     */

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

       anObject = new FINWorkerShort();

       //selectStr = "select kdv.idkadry, kdv.fio, kdv.tabn, s.post_id, s.post_nazv, p.podrcod, p.podrname, kdv.oklad, kdv.date_uvol, kdv.categor "+

       anObject.finCode = set.getInt(1);
       if ( set.wasNull() )
           anObject.finCode = Integer.MIN_VALUE;

       anObject.name = set.getString(2);

       anObject.tabNumber = set.getString(3);

       anObject.positionName = set.getString(5);
       anObject.positionCode = set.getInt(4); // post_id
       if ( set.wasNull() )
           anObject.positionCode = Integer.MIN_VALUE;
       anObject.departmentName = set.getString(7);
       anObject.departmentCode = set.getString(6);
       anObject.priceGen = set.getBigDecimal(8);
       if(anObject.priceGen != null)
           anObject.priceGen = anObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

       // выведем ЛЮДЕЙ .. и закинем признак - может ли он быть в НПЗ !!!
       // это поле все равно везде НАЛЛ ...

       anObject.categor = set.getInt(10);
       if ( set.wasNull() )
           anObject.categor = Integer.MIN_VALUE;


       /*if ( set.getString(11) != null ){
           if (set.getString(11).toUpperCase().startsWith("НВЗ_Е")){
                anObject.categor = FINWorkerKind.ESBYT;
         }
         else
         if (set.getString(11).toUpperCase().startsWith("НВЗ")){
        anObject.categor = FINWorkerKind.PROM;
         }
       }*/
       // SUPP-34938 - признак НВЗ теперь берется с категории профессии , а не с примечания в карточке работника
       if ( set.getString(18) != null ){
           if (set.getString(18).toUpperCase().contains("НВЗ_Е")){
                anObject.categor = FINWorkerKind.ESBYT;
         }
         else
         if (set.getString(18).toUpperCase().contains("НВЗ")){
        anObject.categor = FINWorkerKind.PROM;
         }
       }

       anObject.doljnostid = set.getInt(12);
       if ( set.wasNull() )
           anObject.doljnostid = Integer.MIN_VALUE;
       anObject.cehid = set.getInt(13);
       if ( set.wasNull() )
           anObject.cehid = Integer.MIN_VALUE;

       anObject.cehNazv = set.getString(14);

       anObject.categorId = set.getInt(15);
       if ( set.wasNull() )
           anObject.categorId = Integer.MIN_VALUE;

       anObject.categorName = set.getString(16);
       anObject.workTimeId = set.getString(17);

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


  public FINWorkerShortList getFINWorkerByTechCondResponsibleList(
        FINWorkerFilter aFilterObject, int fromPosition, int quantity)
                throws PersistenceException {
    Date dateIn = new Date();
    return getFINWorkerByTechCondResponsibleList(aFilterObject, fromPosition, quantity, dateIn);
  }


  public FINWorkerShortList getFINWorkerByTechCondResponsibleList(
        FINWorkerFilter aFilterObject, int fromPosition, int quantity,
        java.util.Date dateIn) throws PersistenceException {

    Calendar calendar = Calendar.getInstance();
    calendar.setTime(dateIn);
    calendar.add(Calendar.DATE, -1);
    calendar.set(Calendar.HOUR_OF_DAY, 0);
    calendar.set(Calendar.MINUTE, 0);
    calendar.set(Calendar.SECOND, 0);
    calendar.set(Calendar.MILLISECOND, 0);
    Date dateIn_1 = calendar.getTime();

    FINWorkerShortList result = new FINWorkerShortList();
    FINWorkerShort anObject;
    result.list = new Vector();

    String selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;

    String whereStr = " ";

    String condition = aFilterObject.conditionSQL == null ? "" : aFilterObject.conditionSQL;
    String orderBy = aFilterObject.orderBySQL == null ? "" : aFilterObject.orderBySQL;

    if (orderBy.length() == 0)
        orderBy = " fio.F||' '||fio.I||' '||fio.O, kr.TabN, n.Date_Start desc";

    if(quantity < 0)
        quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
        throw new PersistenceException("Internal Error (User Profile Is Undefined)");


    selectStr =
        " SELECT  " +
        "  " +
        //"   /*+ RULE */  " +
        " n.karta_id idkadry," +  // 1
        " fio.f || ' ' || fio.i || ' ' || fio.o fio, " + // 2
        // " kr.tabn tabn, " + // 3
        " trim(to_char(kr.tabn, '000000')) as tabn, " +
        " ps.post_id post_id, " + // 4
        " RTRIM (ps.post_nazv) post_nazv, " + // 5
        " pd.podr_id podrcod, " + // 6
        " pd.podr_nazv podrname, " + //7
        " NVL (nd.oklad, dd.oklad) oklad, " + // 8
        " NULL date_uvol, " + // 9
        " NULL katgor, " + // 10
        " kr.prim, " + // 11
        " n.doljnost_id doljnostid, " + // 12
        " pd.ceh_id cehid " +  // 13
         /// 25.03.2015 выборка категории персонала , айдишник графика рабочего времени (из zarpherson.work_time)
        " , k.id as kategory_id " + // 14
        " , k.nazv as kategory_nazv " + //15
        " , ( select kdv.work_time_id from zarpherson.kadry_day kdv " +
        "     where kdv.rowid = (select zarpherson.get_kadry_rowid(kkk.idkadry, ?) " +
        "                 from zarpherson.kadry_day_view kkk " +
        "                where kkk.tabn = kr.tabn) ) as work_time_id " + // 16
        "  , ( select nazv from  kadry.kategory where id = ps.kategory_id ) as position_kategory   "  + // 17
        "               FROM " +
        "  kadry.Prom            prom, " +
        "  kadry.Kategory        k, " +
        "  kadry.Doljnost      d, " +
        "  kadry.Doljnost_Day  dd, " +
        "  (SELECT p.Id             Podr_Id, " +
        "          p.Date_Start     Podr_Date_Start, " +
        "          p.Date_Finish    Podr_Date_Finish, " +
        "          pd.ROWID         Podr_Day_Row_Id, " +
        "          pd.Podr_Id       Podr_Day_Podr_Id, " +
        "          pd.Date_Start    Podr_Day_Date_Start, " +
        "          pd.Main_Podr_Id  Main_Podr_Id, " +
        "          pd.Podr_Vid_Id   Podr_Vid_Id, " +
        "          pd.Nazv          Podr_Nazv, " +
        "          pd.Sokr_Nazv     Podr_Sokr_Nazv, " +
        "          pd.Kod           Podr_Kod, " +
        "          pd.Prom_Id       Podr_Prom_Id, " +
        "          pd.Pos           Podr_Pos, " +
        "          pd.Vne_Shtata    Vne_Shtata, " +
        "          ceh.ROWID        Ceh_Row_Id, " +
        "          ceh.Podr_Id      Ceh_Id, " +
        "          ceh.Date_Start   Ceh_Date_Start, " +
        "          ceh.Main_Podr_Id Ceh_Main_Podr_Id, " +
        "          ceh.Podr_Vid_Id  Ceh_Vid_Id, " +
        "          ceh.Nazv         Ceh_Nazv, " +
        "          ceh.Sokr_Nazv    Ceh_Sokr_Nazv, " +
        "          ceh.Kod          Ceh_Kod, " +
        "          ceh.Prom_Id      Ceh_Prom_Id, " +
        "          ceh.Pos          Ceh_Pos " +
        "     FROM kadry.Podr_Day  ceh, " +
        "          kadry.Podr_Day  pd, " +
        "          kadry.Podr      p " +
        "    WHERE pd.Podr_Id(+) = p.Id " +
        "      AND (pd.Podr_Id IS NULL " +
        "        OR pd.ROWID = (SELECT SUBSTR(MAX(TO_CHAR(pd1.Date_Start,'J')||ROWID),8) " +
        "                          FROM kadry.Podr_Day pd1 " +
        "                         WHERE pd1.Podr_Id=pd.Podr_Id " +
        "                           AND pd1.Date_Start<=?) " +
        "          ) " +
        "      AND ceh.Podr_Id = kadry.pkg_podr_utils.Get_Struct_Ed_Id_Buf(p.Id, ?) " +
        "      AND ceh.ROWID = (SELECT SUBSTR(MAX(TO_CHAR(ceh1.date_start,'J')||ROWID),8) " +
        "                          FROM kadry.Podr_Day ceh1 " +
        "                         WHERE ceh1.Podr_Id=ceh.Podr_Id " +
        "                           AND ceh1.Date_Start<=?) " +
        "             ) pd, " +
        "  kadry.v_Post       ps, " +
        "  kadry.v_Post       ps1, " +
        "  " +
        //" -- предыдущее назначение " +
        "  kadry.Perevod_Vid  pv, " +
        "  kadry.perevod_usl  pu, " +
        "  kadry.Osnova       os, " +
        "  kadry.Nazn         n2, " +
        "  kadry.Doljnost     d2, " +
        "  kadry.Post         ps2, " +
        "  kadry.Razr         rz2, " +
        "  kadry.Prof         pf2, " +
        //" --  Podr_Day     pd2, " +
        //" -- следующее назначение " +
        "  kadry.Perevod_Vid  pv3, " +
        "  kadry.perevod_usl  pu3, " +
        "  kadry.Osnova       os3, " +
        "  kadry.Nazn         n3, " +
        "  kadry.Doljnost     d3, " +
        "  kadry.Post         ps3, " +
        "  kadry.Razr         rz3, " +
        "  kadry.Prof         pf3, " +
        //" --  Podr_Day     pd3, " +
        //" --  " +
        "  " +
        "  kadry.FIO          fio, " +
        "  kadry.Karta        kr, " +
        "  kadry.Nazn_Vid     nv, " +
        "  kadry.Pricaz       pr1, " +
        "  kadry.Pricaz       pr2, " +
        "  kadry.Pricaz       pr3, " +
        "  kadry.Regim        r, " +
        "  kadry.Nazn_Day     nd, " +
        "  kadry.Nazn         n " +
        //" --  " +
        " WHERE ((nd.Nazn_Id = n.Id " +
        //"  -- Выбор параметров на дату среза " +
        "  AND nd.Date_Start <= GREATEST(n.Date_Start, ?) " +
        "  AND NOT EXISTS " +
        "     (SELECT NULL FROM kadry.s_Nazn_Day nd2 " +
        "       WHERE nd2.Nazn_Id = nd.Nazn_Id " +
        "         AND nd2.Date_Start <= GREATEST(n.Date_Start, ?) " +
        "         AND nd2.Date_Start > nd.Date_Start) " +
        "  AND n.Start_Pricaz_Id  = pr1.Id " +
        "  AND n.Finish_Pricaz_Id = pr2.Id " +
        "  AND nd.Pricaz_Id       = pr3.Id " +
        //"  -- " +
        "  AND n.Doljnost_Id = d.Id " +
        "  AND pd.Podr_Id = d.Podr_Id " +
        "  " +
        "  AND ps.Post_Id = NVL(nd.Post_Id, d.Post_Id) " +
        "  AND ps1.Post_Id = d.Post_Id " +
        "  AND k.Id = d.Kategory_Id " +
        "  AND prom.Id = DECODE(k.Prom_Id, 3,pd.Podr_Prom_Id, k.Prom_Id) " +
        //"  -- " +
        "  AND dd.Doljnost_Id(+) = d.Id " +
        //"  -- Выбор параметров должности на дату " +
        "  AND (dd.Doljnost_Id IS NULL " +
        "    OR (dd.Date_Start <= LEAST(n.Date_Finish, ?) " +
        //" --    OR (dd.Date_Start <= n.Date_Finish " +
        "      AND NOT EXISTS (SELECT NULL FROM kadry.Doljnost_Day dd2 " +
        "                      WHERE dd2.Doljnost_Id = dd.Doljnost_Id " +
        "                        AND dd2.Date_Start <= LEAST(n.Date_Finish, ?) " +
        //" --                        AND dd2.Date_Start <= n.Date_Finish " +
        "                        AND dd2.Date_Start > dd.Date_Start))) " +
        //" -- предыдущее назначение " +
        "  AND pv.Id(+) = n.Perevod_Vid_Id " +
        "  AND pu.id(+) = n.Perevod_Usl_id " +
        "  AND os.Id(+) = n.Perevod_Osnova_Id " +
        "  AND n.Perevod_Nazn_Id = n2.Id(+) " +
        "  AND n2.Doljnost_Id = d2.Id(+) " +
        "  AND ps2.Id(+) = d2.Post_Id " +
        "  AND pf2.Id(+) = ps2.Prof_Id " +
        "  AND rz2.Id(+) = ps2.Razr_Id  "+ //-- сдедующее назначение " +
        "  AND n.Id = n3.Perevod_Nazn_Id(+) " +
        "  AND pu3.id(+) = n3.perevod_Usl_id " +
        "  AND pv3.Id(+) = n3.Perevod_Vid_Id " +
        "  AND os3.Id(+) = n3.Perevod_Osnova_Id " +
        "  AND d3.Id(+)  = n3.Doljnost_Id " +
        "  AND ps3.Id(+) = d3.Post_Id " +
        "  AND pf3.Id(+) = ps3.Prof_Id " +
        "  AND rz3.Id(+) = ps3.Razr_Id  " +
        "  " +
        "  AND n.Karta_Id     = kr.Id " +
        "  AND fio.Id         = kr.FIO_Id " +
        "  AND nd.Nazn_Vid_Id = nv.Id(+) " +
        "  AND nd.Regim_Id  = r.Id(+) " +
        //" -- график назначения " +
        //" ) AND ? BETWEEN n.Date_Start AND n.Date_Finish /* открытые */ " +
        " ) AND ? BETWEEN n.Date_Start AND n.Date_Finish " +
        " ) AND INSTR(kadry.pkg_Podr_Utils.Get_Path_Id(d.Podr_Id, GREATEST(n.Date_Start, ?)),  " +
        " '_'||1||'_')>0 " +
        "    AND pd.podr_id <> 32 ";


     if(aFilterObject != null)
     {

        if (aFilterObject.name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(fio.F||' '||fio.I||' '||fio.O) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(fio.F||' '||fio.I||' '||fio.O) LIKE UPPER(?)";
        }

       if(aFilterObject.tabNumber != null) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  kr.TabN = ?";
       }


        if (aFilterObject.departmentCode != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  pd.Podr_Id = ?";
        }

        if (aFilterObject.departmentName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.departmentName.indexOf('*',0) < 0 && aFilterObject.departmentName.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(pd.Podr_Nazv) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(pd.Podr_Nazv) LIKE UPPER(?)";
        }
        if (aFilterObject.positionName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.positionName.indexOf('*',0) < 0 && aFilterObject.positionName.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(RTRIM(ps.Post_Nazv)) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(RTRIM(ps.Post_Nazv)) LIKE UPPER(?)";
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
        selectStr = selectStr +  whereStr;

   // selectStr = selectStr + ") ";

   selectStr = selectStr + " ORDER BY " + orderBy;

   try
    {
     statement = connection.prepareStatement(selectStr);


     statement.setDate(1, new java.sql.Date(dateIn.getTime()));
     statement.setDate(2, new java.sql.Date(dateIn.getTime()));
     statement.setDate(3, new java.sql.Date(dateIn.getTime()));
     statement.setDate(4, new java.sql.Date(dateIn.getTime()));
     statement.setDate(5, new java.sql.Date(dateIn.getTime()));
     statement.setDate(6, new java.sql.Date(dateIn.getTime()));
     statement.setDate(7, new java.sql.Date(dateIn.getTime()));
     statement.setDate(8, new java.sql.Date(dateIn.getTime()));
     statement.setDate(9, new java.sql.Date(dateIn.getTime()));

     statement.setDate(10, new java.sql.Date(dateIn_1.getTime()));

     int number = 10;

     if(aFilterObject != null){

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


        if(aFilterObject.tabNumber != null){
            number++;
            StringBuffer likeStr = new StringBuffer();
            likeStr.append(aFilterObject.tabNumber);
            for(int i = 0;i < likeStr.length();i++){
                 if(likeStr.charAt(i) == '*')
                      likeStr.setCharAt(i,'%');
                 if(likeStr.charAt(i) == '?')
                      likeStr.setCharAt(i,'_');
            }
            statement.setString(number,likeStr.toString());
        }

          if(aFilterObject.departmentCode != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.departmentCode);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.departmentName != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.departmentName);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

          if(aFilterObject.positionName != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.positionName);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

     }

     //if(condition.length() > 0 && aBindObjects != null)
     // _bindObjectsToPreparedStatement(statement,aBindObjects,number);

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

       anObject = new FINWorkerShort();

       //selectStr = "select kdv.idkadry, kdv.fio, kdv.tabn, s.post_id, s.post_nazv, p.podrcod, p.podrname, kdv.oklad, kdv.date_uvol, kdv.categor "+


       anObject.name = set.getString(2);
       anObject.tabNumber = set.getString(3);

       anObject.positionName = set.getString(5);
       anObject.positionCode = set.getInt(4);
       if ( set.wasNull() )
           anObject.positionCode = Integer.MIN_VALUE;
       anObject.departmentName = set.getString(7);
       anObject.departmentCode = set.getString(6);
       anObject.priceGen = set.getBigDecimal(8);
       if(anObject.priceGen != null)
           anObject.priceGen = anObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

       // выведем ЛЮДЕЙ .. и закинем признак - может ли он быть в НПЗ !!!
       // это поле все равно везде НАЛЛ ...

       anObject.categor = set.getInt(10);
       if ( set.wasNull() )
           anObject.categor = Integer.MIN_VALUE;


       /*if ( set.getString(11) != null ){
           if (set.getString(11).toUpperCase().startsWith("НВЗ_Е")){
                anObject.categor = FINWorkerKind.ESBYT;
         }
         else
         if (set.getString(11).toUpperCase().startsWith("НВЗ")){
        anObject.categor = FINWorkerKind.PROM;
         }
       }*/
    // SUPP-34938 - признак НВЗ теперь берется с категории профессии , а не с примечания в карточке работника
       if ( set.getString(17) != null ){
           if (set.getString(17).toUpperCase().contains("НВЗ_Е")){
                anObject.categor = FINWorkerKind.ESBYT;
         }
         else
         if (set.getString(17).toUpperCase().contains("НВЗ")){
        anObject.categor = FINWorkerKind.PROM;
         }
       }

       anObject.doljnostid = set.getInt(12);
       if ( set.wasNull() )
           anObject.doljnostid = Integer.MIN_VALUE;
       anObject.cehid = set.getInt(13);
       if ( set.wasNull() )
           anObject.cehid = Integer.MIN_VALUE;


       anObject.finCode = set.getInt(1);
       if ( set.wasNull() )
           anObject.finCode = Integer.MIN_VALUE;


       anObject.categorId = set.getInt(14);
       if ( set.wasNull() )
           anObject.categorId = Integer.MIN_VALUE;

       anObject.categorName = set.getString(15);
       anObject.workTimeId = set.getString(16);

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


    public Vector getCFList()
            throws PersistenceException, DatasourceConnectException {

        Vector list = new Vector();
        String selectStr = null;
        Connection conn = getConnection();
        PreparedStatement statement = null;

        if (getUserProfile() == null)
            throw new PersistenceException(
                    "Internal Error (User Profile Is Undefined)");

        try {
        	selectStr = "select distinct tabnumber from  ( " +
        			" select tabnumber, count(f.code) as sss " +
        			" from finworker f " +
        			//" where f.tabnumber = '58134' " +
        			" group by name, tabnumber, positionname, positioncode, departmentname, " +
        			" departmentcode, pricegen, fincode, " +
        			" issentassignment, kindrefcode, chargepercent, chargerefcode, categorid, worktimeid " +
        			" having count(f.code) > 1 order by 2 desc /* limit 10 */ " +
        			" ) w ";

            statement = conn.prepareStatement(selectStr);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                InfoFinForker info = new InfoFinForker();
                info.tabNumber = resultSet.getString(1);

                list.add(info);
            }

            resultSet.close();

            System.out
                    .println("select InfoFinForker is done ! Total count = "
                            + list.size());

            return list;
        } catch (SQLException e) {
            throw new PersistenceException("Can't InfoFinForker codes", e);
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            if (conn != null) {
                try {
                	conn.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    public class InfoFinForker {
        public String tabNumber;
        public InfoFinForker() {
        }
    }

    public class InfoUpdHumenItem {
        public int minCode;
        //public int codes[];
        public Double[] codes;
        public InfoUpdHumenItem() {
        }
    }


    public Vector getUpdHumenItem(String tabNumber)
            throws PersistenceException, DatasourceConnectException {

        Vector list = new Vector();
        String selectStr = null;
        Connection connection = getConnection();
        PreparedStatement statement = null;

        if (getUserProfile() == null)
            throw new PersistenceException(
                    "Internal Error (User Profile Is Undefined)");

        try {
            selectStr = " select min(code), array_agg(code) from finworker " +
                    " where tabnumber = '" + tabNumber + "'" +
                    " group by name, tabnumber, positionname, positioncode, departmentname, " +
                    " departmentcode, pricegen, fincode, issentassignment, kindrefcode, chargepercent, chargerefcode, " +
                    " categorid, worktimeid";

            statement = connection.prepareStatement(selectStr);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                InfoUpdHumenItem info = new InfoUpdHumenItem();
                info.minCode = resultSet.getInt(1);

                Array rsArray = resultSet.getArray(2);

                // info.codes = (String[]) rsArray.getArray();

                /*
                Array out_list_varchar2 = (Array) resultSet.getArray(2); // Argument #2 from testoutlist

                if (out_list_varchar2 != null) {
                    Double[] names = (Double[]) out_list_varchar2.getArray();

                    for(int i=0;i<names.length; i++){
                        System.out.printf("%d %s\n",i, names[i].intValue() );
                    }
                }
                */

                info.codes = (Double[]) rsArray.getArray();

                // Array arr = resultSet.getArray(2);
                // System.out.println("### arr = " + info.codes.length);

                // int type[] = (int []) arr.getArray();

                // throw new PersistenceException("Can't updHumenItem codes");
                // info.codes = type;

                list.add(info);
            }

            resultSet.close();

            return list;

        } catch (SQLException e) {
            throw new PersistenceException("Can't updHumenItem codes", e);
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
        }
    }

    private transient java.sql.Connection connection = null;

    protected java.sql.Connection getConnection(String dataSourceName)
            throws DatasourceConnectException {
        try {
            InitialContext initialContext = new InitialContext();
            DataSource dataSource = (DataSource) initialContext
                    .lookup(dataSourceName);
            connection = dataSource.getConnection();
            return connection;
        } catch (NamingException e) {
            throw new DatasourceConnectException(dataSourceName, e);
        } catch (SQLException e) {
            throw new DatasourceConnectException(dataSourceName, e);
        }
    }


	public void updHumenItem(int minCode, Double[] codes,
			UserProfile userProfile) throws PersistenceException,
			DatasourceConnectException, SQLException {

		Connection conn = null;
		try {
			conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			ENHumenItemDAO humenDao = new ENHumenItemDAO(conn, userProfile);

			for (int i = 0; i < codes.length; i++) {
				ENHumenItemFilter humenFilter = new ENHumenItemFilter();
				humenFilter.conditionSQL = " finworkercode = "
						+ codes[i].intValue();

				int hArr[] = humenDao.getFilteredCodeArray(humenFilter, 0, -1);
				for (int h = 0; h < hArr.length; h++) {
					ENHumenItem humen = humenDao.getObject(hArr[h]);
					humen.finWorker.code = minCode;
					humenDao.save(humen);
				}

			}
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	public void updTransportItem(int minCode, Double[] codes,
			UserProfile userProfile) throws PersistenceException,
			DatasourceConnectException, SQLException {
		Connection conn = null;
		try {
			conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			ENTransportItemDAO transportItemDao = new ENTransportItemDAO(conn, userProfile);

			for (int i = 0; i < codes.length; i++) {
				ENTransportItemFilter transportItemFilter = new ENTransportItemFilter();
				transportItemFilter.conditionSQL = " finworkercode = "
						+ codes[i].intValue();

				int tArr[] = transportItemDao.getFilteredCodeArray(
						transportItemFilter, 0, -1);
				for (int h = 0; h < tArr.length; h++) {
					ENTransportItem tItem = transportItemDao.getObject(tArr[h]);
					tItem.finWorker.code = minCode;
					transportItemDao.save(tItem);
				}
			}
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	public void updTravelsheet1(int minCode, Double[] codes,
			UserProfile userProfile) throws PersistenceException,
			DatasourceConnectException, SQLException {
		Connection conn = null;
		try {
			conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			ENTravelSheetDAO tSheetDao = new ENTravelSheetDAO(conn, userProfile);

			for (int i = 0; i < codes.length; i++) {
				ENTravelSheetFilter tSheetFilter = new ENTravelSheetFilter();
				tSheetFilter.conditionSQL = " finworkercode = "
						+ codes[i].intValue();

				int tArr[] = tSheetDao.getFilteredArray(tSheetFilter, 0, -1);
				for (int h = 0; h < tArr.length; h++) {
					ENTravelSheet tSheet = tSheetDao.getObject(tArr[h]);
					tSheet.finWorker.code = minCode;
					tSheetDao.save(tSheet);
				}
			}
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	public void updTravelsheet2(int minCode, Double[] codes,
			UserProfile userProfile) throws PersistenceException,
			DatasourceConnectException, SQLException {
		Connection conn = null;
		try {

			conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			ENTravelSheetDAO tSheetDao = new ENTravelSheetDAO(conn, userProfile);

			for (int i = 0; i < codes.length; i++) {
				ENTravelSheetFilter tSheetFilter = new ENTravelSheetFilter();
				tSheetFilter.conditionSQL = " finworker_additinl_1cd = "
						+ codes[i].intValue();

				int tArr[] = tSheetDao.getFilteredArray(tSheetFilter, 0, -1);
				for (int h = 0; h < tArr.length; h++) {
					ENTravelSheet tSheet = tSheetDao.getObject(tArr[h]);
					tSheet.finWorker_additional_1.code = minCode;
					tSheetDao.save(tSheet);
				}
			}
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	public void updTravelsheet3(int minCode, Double[] codes,
			UserProfile userProfile) throws PersistenceException,
			DatasourceConnectException, SQLException {
		Connection conn = null;
		try {
			conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			ENTravelSheetDAO tSheetDao = new ENTravelSheetDAO(conn, userProfile);

			for (int i = 0; i < codes.length; i++) {
				ENTravelSheetFilter tSheetFilter = new ENTravelSheetFilter();
				tSheetFilter.conditionSQL = " finworker_additinl_2cd = "
						+ codes[i].intValue();

				int tArr[] = tSheetDao.getFilteredArray(tSheetFilter, 0, -1);
				for (int h = 0; h < tArr.length; h++) {
					ENTravelSheet tSheet = tSheetDao.getObject(tArr[h]);
					tSheet.finWorker_additional_2.code = minCode;
					tSheetDao.save(tSheet);
				}
			}
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}


	public void enworkorderbyt(int minCode, Double[] codes,
			UserProfile userProfile) throws PersistenceException,
			DatasourceConnectException {
		Connection conn = null;
		try {
			conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			ENWorkOrderBytDAO woDao = new ENWorkOrderBytDAO(conn, userProfile);

			for (int i = 0; i < codes.length; i++) {
				ENWorkOrderBytFilter woFilter = new ENWorkOrderBytFilter();
				woFilter.conditionSQL = " finworkercode = "
						+ codes[i].intValue();

				int tArr[] = woDao.getFilteredCodeArray(woFilter, 0, -1);
				for (int h = 0; h < tArr.length; h++) {
					ENWorkOrderByt wo = woDao.getObject(tArr[h]);
					wo.finWorker.code = minCode;
					woDao.save(wo);
				}
			}
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}


	public void enworkorderbytitem(int minCode, Double[] codes,
			UserProfile userProfile) throws PersistenceException,
			DatasourceConnectException {
		Connection conn = null;
		try {
			conn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			ENWorkOrderBytItemDAO woDao = new ENWorkOrderBytItemDAO(conn, userProfile);

			for (int i = 0; i < codes.length; i++) {
				ENWorkOrderBytItemFilter woFilter = new ENWorkOrderBytItemFilter();
				woFilter.conditionSQL = " finworkercode = "
						+ codes[i].intValue();

				int tArr[] = woDao.getFilteredCodeArray(woFilter, 0, -1);
				for (int h = 0; h < tArr.length; h++) {
					ENWorkOrderBytItem wo = woDao.getObject(tArr[h]);
					wo.finWorker.code = minCode;
					woDao.save(wo);
				}
			}
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}


    public void deleteFinWorker(int minCode, Double[] codes, UserProfile userProfile)
            throws PersistenceException, DatasourceConnectException, SQLException {

        // Connection connection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
        // FINWorkerDAO fwDao = new FINWorkerDAO(connection, userProfile);

        for (int i = 0; i < codes.length; i++) {
        	if (codes[i].intValue() != minCode) {
        		super.remove(codes[i].intValue());
        	}
        }

        /*
        FINWorkerFilter fwFilter = new FINWorkerFilter();
        fwFilter.conditionSQL = " code = any(array[" + codes + "])";
        fwFilter.conditionSQL = fwFilter.conditionSQL.replace("{", "");
        fwFilter.conditionSQL = fwFilter.conditionSQL.replace("}", "");

        int fwArr[] = fwDao.getFilteredCodeArray(fwFilter, 0, -1);
        System.out.println("### total = " + fwArr.length);
        for (int f = 0; f < fwArr.length; f++) {
        	if (fwArr[f] != minCode) {
        		fwDao.remove(fwArr[f]);
        	}
        } */
    }


    @Override
	public void remove(int uid) throws PersistenceException {

        /**
        *  удалять нельзя если есть хоть одна запись в ссылающихся таблицах
        *  enhumenitem, entransportitem, entravelsheet(3)
        */

        boolean inRemove = true;
        Connection connection = getConnection();

        ENHumenItemDAO humenItemDAO = new ENHumenItemDAO(connection, getUserProfile());
        ENHumenItemFilter humenItemFilter = new ENHumenItemFilter();
        humenItemFilter.finWorker.code = uid;
        int[] parrentHumenCodes = humenItemDAO.getFilteredCodeArray(humenItemFilter, 0, -1);

        if (parrentHumenCodes.length > 0) {
            inRemove = false;
        }


        /////
        ENWorkOrderBytDAO workOrderBytDAO = new ENWorkOrderBytDAO(connection, getUserProfile());
        ENWorkOrderBytFilter workOrderBytFilter = new ENWorkOrderBytFilter();
        workOrderBytFilter.finWorker.code = uid;
        int[] workOrderBytCodes = workOrderBytDAO.getFilteredCodeArray(workOrderBytFilter, 0, -1);

        if (workOrderBytCodes.length > 0) {
            inRemove = false;
        }

        ENWorkOrderBytItemDAO workOrderBytItemDAO = new ENWorkOrderBytItemDAO(connection, getUserProfile());
        ENWorkOrderBytItemFilter workOrderBytItemFilter = new ENWorkOrderBytItemFilter();
        workOrderBytItemFilter.finWorker.code = uid;
        int[] workOrderBytItemCodes = workOrderBytItemDAO.getFilteredCodeArray(workOrderBytItemFilter, 0, -1);

        if (workOrderBytItemCodes.length > 0) {
            inRemove = false;
        }
        /////

        ENTransportItemDAO transportItemDAO = new ENTransportItemDAO(connection, getUserProfile());
        ENTransportItemFilter transportItemFilter = new ENTransportItemFilter();
        transportItemFilter.finWorker.code = uid;
        int[] parrentTransportCodes = transportItemDAO.getFilteredCodeArray(transportItemFilter, 0, -1);

        if (parrentTransportCodes.length > 0) {
            inRemove = false;
        }


        ENTravelSheetDAO travelSheetDAO = new ENTravelSheetDAO(connection, getUserProfile());
        ENTravelSheetFilter travelSheetFilter = new ENTravelSheetFilter();
        travelSheetFilter.finWorker.code = uid;
        int[] parrentTtravelSheetCodes = travelSheetDAO.getFilteredCodeArray(travelSheetFilter, 0, -1);

        if (parrentTtravelSheetCodes.length > 0) {
            inRemove = false;
        }


        ENTravelSheetFilter finWorkerAdd1Filter = new ENTravelSheetFilter();
        finWorkerAdd1Filter.finWorker_additional_1.code = uid;
        int[] parrentFinWorkerAdd1Codes = travelSheetDAO.getFilteredCodeArray(finWorkerAdd1Filter, 0, -1);

        if (parrentFinWorkerAdd1Codes.length > 0) {
            inRemove = false;
        }


        ENTravelSheetFilter finWorkerAdd2Filter = new ENTravelSheetFilter();
        finWorkerAdd2Filter.finWorker_additional_2.code = uid;
        int[] parrentFinWorkerAdd2Codes = travelSheetDAO.getFilteredCodeArray(finWorkerAdd2Filter, 0, -1);

        if (parrentFinWorkerAdd2Codes.length > 0) {
            inRemove = false;
        }


        if (inRemove) {
            super.remove(uid);
        }

    }


    @Override
	public int add(FINWorker finWorker) throws PersistenceException {

        UserProfile userProfile = getUserProfile();
        Connection connection = getConnection();

        try {

            /**
             *  проверка уникальности по полям....
             *  name, tabnumber, positionname, positioncode, departmentname,
             *  departmentcode, pricegen, fincode,
             *  issentassignment, kindrefcode, chargepercent, chargerefcode, categorid, worktimeid, positionId
             *
             */


           	/** !!!!!!  DEBUG  !!!!!!! */
        	AuthLogic netAuth = new AuthLogic(getConnection(), getUserProfile());
        	if (!netAuth.checkUsesMDAXData()) {

        		int tabNumber = Integer.parseInt(finWorker.tabNumber);
        		NumberFormat formatter = new DecimalFormat("#000000");

        		finWorker.tabNumber = formatter.format(tabNumber);
        	} else {

            	if (finWorker.positionId == null || finWorker.positionId.equals("") ) {

            		System.out.println("################# finWorker.code = " + finWorker.code);
            		System.out.println("################# finWorker.tabNumber = " + finWorker.tabNumber);
            		System.out.println("##############################  " + getUserProfile().getUserName());


            		throw new SystemException("\n\n"
            				+ " Помилка при визначені посади працівника!!!");
            	}

            	if (finWorker.departmentCode.substring(0,3).equals(FKConsts.AX_PODR_MANAGEMENT_ID)) {
					finWorker.priceGen = new BigDecimal(1).setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
            	}


            	mDaxLogic mdLogic = new mDaxLogic(getConnection(), getUserProfile());
        		if (mdLogic.checkHiddenPosition(finWorker.positionId)) {
        			if (! finWorker.tabNumber.equals("002872")) { // SUPP-96874
        				finWorker.priceGen = new BigDecimal(1).setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
        				/* Пока уберем (начальники ездят как водители - нужно переделать и проверять только 
        				 * финворкеров, привязанных к ENHumenItem, но не к ENTransportItem)
        				// Вообще запретим подвязывать в планах таких людей
        				throw new SystemException("\n\nЗаборонено додавати працівників з посадою \"" + 
        						finWorker.positionName + "\" як виконавців у плани!\n" +
        						"(Таб. №: " + finWorker.tabNumber + ", ПІБ: " + finWorker.name + ")");
        				*/
        			}
        		}

        		if (finWorker.priceGen.doubleValue() < 2) {
        			System.out.println("################# add finWorker tabNumber = " + finWorker.tabNumber
            				+ " :: positionId = " + finWorker.positionId + " :: priceGen = " + finWorker.priceGen + " :: userAdd = " + getUserProfile().getUserName());
        		}

        	}




            // 22.11.12 Страшный баг, когда заезжает объект уже с кодом, и add не происходит вообще!!!
            finWorker.code = Integer.MIN_VALUE;

            FINWorkerLogic finWorkerLogic = new FINWorkerLogic(connection, userProfile);
            FINWorker distFinWorker = finWorkerLogic.checkUnicFinWorker(finWorker);


            /* если есть такая запись - используем её */
            if (distFinWorker.code != Integer.MIN_VALUE) {

            	// System.out.println("###### FinWorker add old FinWorker tabNumber " + distFinWorker.tabNumber);
                return distFinWorker.code;

            } else {
            /* если изменилось одно из полей - добавляем */

            	// System.out.println("###### FinWorker add new FinWorker tabNumber " + finWorker.tabNumber);
                return super.add(finWorker);
            }

        } finally {
             if (connection != super.getConnection()) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }


    public int[] getUnicFilteredCodeArray(FINWorkerFilter aFilterObject,
            int fromPosition, int quantity) throws PersistenceException {
        return getUnicFilteredCodeArray(
                aFilterObject,
                (aFilterObject == null) ? (null) : (aFilterObject.conditionSQL),
                (aFilterObject == null) ? (null) : (aFilterObject.orderBySQL),
                fromPosition, quantity, null);
    }

    public int[] getUnicFilteredCodeArray(FINWorker aFilterObject,
            String anCondition, String anOrderBy, int fromPosition,
            int quantity, Vector aBindObjects) throws PersistenceException {
        Vector result = new Vector();

        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;
        String selectStr = "SELECT MAX(FINWORKER.CODE) FROM FINWORKER";
        String whereStr = "";
        String condition = processCondition(anCondition);
        String groupBy = processCondition(anOrderBy);

        /* !!! group By !!! */
        if (groupBy.length() == 0)
        	groupBy = " name, tabnumber, positionname, positioncode, departmentname, " +
                    " departmentcode, pricegen, fincode, " +
                    " issentassignment, kindrefcode, chargepercent, chargerefcode, categorid, worktimeid, positionid";

        if (quantity < 0)
            quantity = Integer.MAX_VALUE / 2;

        if (getUserProfile() == null)
            throw new PersistenceException(
                    "Internal Error (User Profile Is Undefined)");

        if (aFilterObject != null) {
            if (aFilterObject.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINWORKER.CODE = ?";
            }
            if (aFilterObject.name != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.name.indexOf('*', 0) < 0
                        && aFilterObject.name.indexOf('?', 0) < 0)
                    whereStr = whereStr + "  FINWORKER.NAME = ?";
                else
                    whereStr = whereStr + "  FINWORKER.NAME LIKE ?";
            }


            if (aFilterObject.tabNumber != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.tabNumber.indexOf('*', 0) < 0
                        && aFilterObject.tabNumber.indexOf('?', 0) < 0)
                    whereStr = whereStr + "  FINWORKER.TABNUMBER = ?";
                else
                    whereStr = whereStr + "  FINWORKER.TABNUMBER LIKE ?";
            }

            if (aFilterObject.positionName != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.positionName.indexOf('*', 0) < 0
                        && aFilterObject.positionName.indexOf('?', 0) < 0)
                    whereStr = whereStr + "  FINWORKER.POSITIONNAME = ?";
                else
                    whereStr = whereStr + "  FINWORKER.POSITIONNAME LIKE ?";
            }
            if (aFilterObject.positionCode != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINWORKER.POSITIONCODE = ?";
            }
            if (aFilterObject.departmentName != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.departmentName.indexOf('*', 0) < 0
                        && aFilterObject.departmentName.indexOf('?', 0) < 0)
                    whereStr = whereStr + "  FINWORKER.DEPARTMENTNAME = ?";
                else
                    whereStr = whereStr + "  FINWORKER.DEPARTMENTNAME LIKE ?";
            }
            if (aFilterObject.departmentCode != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.departmentCode.indexOf('*', 0) < 0
                        && aFilterObject.departmentCode.indexOf('?', 0) < 0)
                    whereStr = whereStr + "  FINWORKER.DEPARTMENTCODE = ?";
                else
                    whereStr = whereStr + "  FINWORKER.DEPARTMENTCODE LIKE ?";
            }
            if (aFilterObject.priceGen != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINWORKER.PRICEGEN = ?";
            }

            if (aFilterObject.categor != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINWORKER.CATEGOR = ?";
            }

            if (aFilterObject.finCode != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINWORKER.FINCODE = ?";
            }
            if (aFilterObject.isSentAssignment != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINWORKER.ISSENTASSIGNMENT = ?";
            }
            if (aFilterObject.chargePercent != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINWORKER.CHARGEPERCENT = ?";
            }

            if(aFilterObject.categorId != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINWORKER.CATEGORID = ?";
            }

            if (aFilterObject.categorName != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.categorName.indexOf('*',0) < 0 && aFilterObject.categorName.indexOf('?',0) < 0)
                    whereStr = whereStr + "  FINWORKER.CATEGORNAME = ?";
                else
                    whereStr = whereStr + "  FINWORKER.CATEGORNAME LIKE ?";
            }

           if (aFilterObject.workTimeId != null) {
               if(whereStr.length() != 0)
                   whereStr = whereStr + " AND ";
               if (aFilterObject.workTimeId.indexOf('*',0) < 0 && aFilterObject.workTimeId.indexOf('?',0) < 0)
                   whereStr = whereStr + "  FINWORKER.WORKTIMEID = ?";
               else
                   whereStr = whereStr + "  FINWORKER.WORKTIMEID LIKE ?";
           }


            if (aFilterObject.domain_info != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.domain_info.indexOf('*', 0) < 0
                        && aFilterObject.domain_info.indexOf('?', 0) < 0)
                    whereStr = whereStr + "  FINWORKER.DOMAIN_INFO = ?";
                else
                    whereStr = whereStr + "  FINWORKER.DOMAIN_INFO LIKE ?";
            }
            if (aFilterObject.modify_time != Long.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINWORKER.MODIFY_TIME = ?";
            }
            if (aFilterObject.kindRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + " FINWORKER.KINDREFCODE = ? ";
            }
            if (aFilterObject.chargeRef.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + " FINWORKER.CHARGEREFCODE = ? ";
            }


            if (aFilterObject.positionId != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.positionId.indexOf('*', 0) < 0
                        && aFilterObject.positionId.indexOf('?', 0) < 0)
                    whereStr = whereStr + "  FINWORKER.POSITIONID = ?";
                else
                    whereStr = whereStr + "  FINWORKER.POSITIONID LIKE ?";
            }

        }

        if (condition.length() != 0) {
            if (whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + " (" + condition + ")";
        }

        if (whereStr.length() != 0)
            selectStr = selectStr + " WHERE" + whereStr;

        selectStr = selectStr + " GROUP BY " + groupBy;

        try {
            statement = connection.prepareStatement(selectStr);
            int number = 0;
            if (aFilterObject != null) {
                if (aFilterObject.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.code);
                }
                if (aFilterObject.name != null) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (aFilterObject.name.indexOf('*', 0) < 0
                            && aFilterObject.name.indexOf('?', 0) < 0)
                        whereStr = whereStr + " FINWORKER.NAME = ?";
                    else
                        whereStr = whereStr + " FINWORKER.NAME LIKE ?";

                    if (aFilterObject.name != null) {
                        number++;
                        StringBuffer likeStr = new StringBuffer();
                        likeStr.append(aFilterObject.name);
                        for (int i = 0; i < likeStr.length(); i++) {
                            if (likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i, '%');
                            if (likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i, '_');
                        }
                        statement.setString(number, likeStr.toString());
                    }
                }


                if (aFilterObject.tabNumber != null) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (aFilterObject.tabNumber.indexOf('*', 0) < 0
                            && aFilterObject.tabNumber.indexOf('?', 0) < 0)
                        whereStr = whereStr + " FINWORKER.TABNUMBER = ?";
                    else
                        whereStr = whereStr + " FINWORKER.TABNUMBER LIKE ?";

                    if (aFilterObject.tabNumber != null) {
                        number++;
                        StringBuffer likeStr = new StringBuffer();
                        likeStr.append(aFilterObject.tabNumber);
                        for (int i = 0; i < likeStr.length(); i++) {
                            if (likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i, '%');
                            if (likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i, '_');
                        }
                        statement.setString(number, likeStr.toString());
                    }
                }


                if (aFilterObject.positionName != null) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (aFilterObject.positionName.indexOf('*', 0) < 0
                            && aFilterObject.positionName.indexOf('?', 0) < 0)
                        whereStr = whereStr + " FINWORKER.POSITIONNAME = ?";
                    else
                        whereStr = whereStr + " FINWORKER.POSITIONNAME LIKE ?";

                    if (aFilterObject.positionName != null) {
                        number++;
                        StringBuffer likeStr = new StringBuffer();
                        likeStr.append(aFilterObject.positionName);
                        for (int i = 0; i < likeStr.length(); i++) {
                            if (likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i, '%');
                            if (likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i, '_');
                        }
                        statement.setString(number, likeStr.toString());
                    }
                }
                if (aFilterObject.positionCode != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.positionCode);
                }
                if (aFilterObject.departmentName != null) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (aFilterObject.departmentName.indexOf('*', 0) < 0
                            && aFilterObject.departmentName.indexOf('?', 0) < 0)
                        whereStr = whereStr + " FINWORKER.DEPARTMENTNAME = ?";
                    else
                        whereStr = whereStr
                                + " FINWORKER.DEPARTMENTNAME LIKE ?";

                    if (aFilterObject.departmentName != null) {
                        number++;
                        StringBuffer likeStr = new StringBuffer();
                        likeStr.append(aFilterObject.departmentName);
                        for (int i = 0; i < likeStr.length(); i++) {
                            if (likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i, '%');
                            if (likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i, '_');
                        }
                        statement.setString(number, likeStr.toString());
                    }
                }
                if (aFilterObject.departmentCode != null) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (aFilterObject.departmentCode.indexOf('*', 0) < 0
                            && aFilterObject.departmentCode.indexOf('?', 0) < 0)
                        whereStr = whereStr + " FINWORKER.DEPARTMENTCODE = ?";
                    else
                        whereStr = whereStr
                                + " FINWORKER.DEPARTMENTCODE LIKE ?";

                    if (aFilterObject.departmentCode != null) {
                        number++;
                        StringBuffer likeStr = new StringBuffer();
                        likeStr.append(aFilterObject.departmentCode);
                        for (int i = 0; i < likeStr.length(); i++) {
                            if (likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i, '%');
                            if (likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i, '_');
                        }
                        statement.setString(number, likeStr.toString());
                    }
                }
                if (aFilterObject.priceGen != null) {
                    number++;
                    aFilterObject.priceGen = aFilterObject.priceGen.setScale(2,
                            java.math.BigDecimal.ROUND_HALF_UP);
                    statement.setBigDecimal(number, aFilterObject.priceGen);
                }
                if (aFilterObject.categor != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.categor);
                }
                if (aFilterObject.finCode != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.finCode);
                }
                if (aFilterObject.isSentAssignment != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.isSentAssignment);
                }
                if (aFilterObject.chargePercent != null) {
                    number++;
                    aFilterObject.chargePercent = aFilterObject.chargePercent
                            .setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
                    statement
                            .setBigDecimal(number, aFilterObject.chargePercent);
                }

                if(aFilterObject.categorId != Integer.MIN_VALUE){
                    number++;
                    statement.setInt(number,aFilterObject.categorId);
                }
                if (aFilterObject.categorName != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (aFilterObject.categorName.indexOf('*',0) < 0 && aFilterObject.categorName.indexOf('?',0) < 0)
                        whereStr = whereStr + " FINWORKER.CATEGORNAME = ?";
                    else
                        whereStr = whereStr + " FINWORKER.CATEGORNAME LIKE ?";

                  if(aFilterObject.categorName != null){
                      number++;
                      StringBuffer likeStr = new StringBuffer();
                      likeStr.append(aFilterObject.categorName);
                      for(int i = 0;i < likeStr.length();i++){
                           if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                           if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                      }
                      statement.setString(number,likeStr.toString());
                  }
                }

                if (aFilterObject.workTimeId != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (aFilterObject.workTimeId.indexOf('*',0) < 0 && aFilterObject.workTimeId.indexOf('?',0) < 0)
                        whereStr = whereStr + " FINWORKER.WORKTIMEID = ?";
                    else
                        whereStr = whereStr + " FINWORKER.WORKTIMEID LIKE ?";

                  if(aFilterObject.workTimeId != null){
                      number++;
                      StringBuffer likeStr = new StringBuffer();
                      likeStr.append(aFilterObject.workTimeId);
                      for(int i = 0;i < likeStr.length();i++){
                           if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                           if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                      }
                      statement.setString(number,likeStr.toString());
                  }
                }


                if (aFilterObject.domain_info != null) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (aFilterObject.domain_info.indexOf('*', 0) < 0
                            && aFilterObject.domain_info.indexOf('?', 0) < 0)
                        whereStr = whereStr + " FINWORKER.DOMAIN_INFO = ?";
                    else
                        whereStr = whereStr + " FINWORKER.DOMAIN_INFO LIKE ?";

                    if (aFilterObject.domain_info != null) {
                        number++;
                        StringBuffer likeStr = new StringBuffer();
                        likeStr.append(aFilterObject.domain_info);
                        for (int i = 0; i < likeStr.length(); i++) {
                            if (likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i, '%');
                            if (likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i, '_');
                        }
                        statement.setString(number, likeStr.toString());
                    }
                }
                if (aFilterObject.modify_time != Long.MIN_VALUE) {
                    number++;
                    if (aFilterObject.modify_time == Long.MIN_VALUE)
                        statement.setBigDecimal(number, null);
                    else
                        statement.setBigDecimal(number,
                                new java.math.BigDecimal(
                                        aFilterObject.modify_time));
                }
                if (aFilterObject.kindRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.kindRef.code);
                }
                if (aFilterObject.chargeRef.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.chargeRef.code);
                }

                if (aFilterObject.positionId != null) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (aFilterObject.positionId.indexOf('*', 0) < 0
                            && aFilterObject.positionId.indexOf('?', 0) < 0)
                        whereStr = whereStr + " FINWORKER.POSITIONID = ?";
                    else
                        whereStr = whereStr + " FINWORKER.POSITIONID LIKE ?";

                    if (aFilterObject.positionId != null) {
                        number++;
                        StringBuffer likeStr = new StringBuffer();
                        likeStr.append(aFilterObject.positionId);
                        for (int i = 0; i < likeStr.length(); i++) {
                            if (likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i, '%');
                            if (likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i, '_');
                        }
                        statement.setString(number, likeStr.toString());
                    }
                }

            }

            if (condition.length() > 0 && aBindObjects != null)
                _bindObjectsToPreparedStatement(statement, aBindObjects, number);

            set = statement.executeQuery();
            int i;
            for (i = 0; set.next(); i++) {
                if (i < fromPosition)
                    continue;
                else if (i >= fromPosition + quantity) {
                    i++;
                    break;
                }

                result.add(new Integer(set.getInt(1)));
            }

            int[] array;

            array = new int[result.size()];
            for (int j = 0; j < result.size(); j++)
                array[j] = ((Integer) result.get(j)).intValue();

            return array;
        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + selectStr);
            EnergyproPersistenceExceptionAnalyzer.analyser
                    .throwPersistenceException(e);
            return null;
        } finally {
            try {
                if (set != null)
                    set.close();
            } catch (SQLException e) {
            }
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            if (connection != super.getConnection()) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }

    }



    /**
    *
    * Список работников на дату
    *
    * @param aFilterObject фильтр работников
    * @param fromPosition с какой позиции
    * @param quantity количество
    * @param isShowCEO показывать ли директоров
    * @param dateIn дата выборки
    * @return FINWorkerShortList список работников
    * @throws PersistenceException
    */
   public FINWorkerShortList getFINWorkerListForReport(FINWorkerFilter aFilterObject,int fromPosition,int quantity, java.util.Date dateIn1, boolean isShowCEO) throws PersistenceException
   {



        Date dateIn = new Date();

//         Calendar calendar = Calendar.getInstance();
//         calendar.setTime(dateIn);
//         calendar.set(1900, 1, 1);
//
//         calendar.add(Calendar.DATE,-1);
//
//         dateIn = calendar.getTime();



    FINWorkerShortList result = new FINWorkerShortList();
    FINWorkerShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;

    String     whereStr = " ";

    String     condition = aFilterObject.conditionSQL == null ? "" :  aFilterObject.conditionSQL ; //processCondition(anCondition);
    String     orderBy = aFilterObject.orderBySQL == null ? "" : aFilterObject.orderBySQL ; //processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = " fio.F||' '||fio.I||' '||fio.O, kr.TabN, n.Date_Start desc";


    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");




     selectStr =
         " SELECT  " +
         "  " +
         //"   /*+ RULE */  " +
         " n.karta_id idkadry, " +
         " fio.f || ' ' || fio.i || ' ' || fio.o fio, " +
         //" kr.tabn tabn," +
         " trim(to_char(kr.tabn, '000000')) as tabn, " +
         " ps.post_id post_id, " +
         " RTRIM (ps.post_nazv) post_nazv, " +
         " pd.podr_id podrcod," +
         " pd.podr_nazv podrname, " +
         " /*SUPP-2238*/decode(pd.podr_id," + FKConsts.PODR_MANAGEMENT_ID + ",0,NVL (nd.oklad, dd.oklad)) oklad," +
         " NULL date_uvol, " +
         " NULL katgor, " +
         " kr.prim, " +
         " n.doljnost_id doljnostid, " +
         " pd.ceh_id cehid, " +
         " pd.ceh_nazv cehNazv " + //14

		/// 25.03.2015 выборка категории персонала , айдишник графика рабочего времени (из zarpherson.work_time)
		" , k.id as kategory_id " + // 15
		" , k.nazv as kategory_nazv " + // 16
		" , ( select kdv.work_time_id from zarpherson.kadry_day kdv " +
		"     where kdv.rowid = (select zarpherson.get_kadry_rowid(kkk.idkadry, ?) " +
		"                 from zarpherson.kadry_day_view kkk " +
		"                where kkk.tabn = kr.tabn) ) as work_time_id " + // 17
		"  , ( select nazv from  kadry.kategory where id = ps.kategory_id ) as position_kategory   "  + //18
         "               FROM " +
         "  kadry.Prom            prom, " +
         "  kadry.Kategory        k, " +
         "  kadry.Doljnost      d, " +
         "  kadry.Doljnost_Day  dd, " +
         "  (SELECT p.Id             Podr_Id, " +
         "          p.Date_Start     Podr_Date_Start, " +
         "          p.Date_Finish    Podr_Date_Finish, " +
         "          pd.ROWID         Podr_Day_Row_Id, " +
         "          pd.Podr_Id       Podr_Day_Podr_Id, " +
         "          pd.Date_Start    Podr_Day_Date_Start, " +
         "          pd.Main_Podr_Id  Main_Podr_Id, " +
         "          pd.Podr_Vid_Id   Podr_Vid_Id, " +
         "          pd.Nazv          Podr_Nazv, " +
         "          pd.Sokr_Nazv     Podr_Sokr_Nazv, " +
         "          pd.Kod           Podr_Kod, " +
         "          pd.Prom_Id       Podr_Prom_Id, " +
         "          pd.Pos           Podr_Pos, " +
         "          pd.Vne_Shtata    Vne_Shtata, " +
         "          ceh.ROWID        Ceh_Row_Id, " +
         "          ceh.Podr_Id      Ceh_Id, " +
         "          ceh.Date_Start   Ceh_Date_Start, " +
         "          ceh.Main_Podr_Id Ceh_Main_Podr_Id, " +
         "          ceh.Podr_Vid_Id  Ceh_Vid_Id, " +
         "          ceh.Nazv         Ceh_Nazv, " +
         "          ceh.Sokr_Nazv    Ceh_Sokr_Nazv, " +
         "          ceh.Kod          Ceh_Kod, " +
         "          ceh.Prom_Id      Ceh_Prom_Id, " +
         "          ceh.Pos          Ceh_Pos " +
         "     FROM kadry.Podr_Day  ceh, " +
         "          kadry.Podr_Day  pd, " +
         "          kadry.Podr      p " +
         "    WHERE pd.Podr_Id(+) = p.Id " +
         "      AND (pd.Podr_Id IS NULL " +
         "        OR pd.ROWID = (SELECT SUBSTR(MAX(TO_CHAR(pd1.Date_Start,'J')||ROWID),8) " +
         "                          FROM kadry.Podr_Day pd1 " +
         "                         WHERE pd1.Podr_Id=pd.Podr_Id " +
         "                           /*AND pd1.Date_Start<= параметр */ ) " +
         "          ) " +
         "      AND ceh.Podr_Id = kadry.pkg_podr_utils.Get_Struct_Ed_Id_Buf(p.Id, ?) " +
         "      AND ceh.ROWID = (SELECT SUBSTR(MAX(TO_CHAR(ceh1.date_start,'J')||ROWID),8) " +
         "                          FROM kadry.Podr_Day ceh1 " +
         "                         WHERE ceh1.Podr_Id=ceh.Podr_Id " +
         "                           AND ceh1.Date_Start<=?) " +
         "             ) pd, " +
         "  kadry.v_Post       ps, " +
         "  kadry.v_Post       ps1, " +
         "  " +
         //" -- предыдущее назначение " +
         "  kadry.Perevod_Vid  pv, " +
         "  kadry.perevod_usl  pu, " +
         "  kadry.Osnova       os, " +
         "  kadry.Nazn         n2, " +
         "  kadry.Doljnost     d2, " +
         "  kadry.Post         ps2, " +
         "  kadry.Razr         rz2, " +
         "  kadry.Prof         pf2, " +
         //" --  Podr_Day     pd2, " +
         //" -- следующее назначение " +
         "  kadry.Perevod_Vid  pv3, " +
         "  kadry.perevod_usl  pu3, " +
         "  kadry.Osnova       os3, " +
         "  kadry.Nazn         n3, " +
         "  kadry.Doljnost     d3, " +
         "  kadry.Post         ps3, " +
         "  kadry.Razr         rz3, " +
         "  kadry.Prof         pf3, " +
         //" --  Podr_Day     pd3, " +
         //" --  " +
         "  " +
         "  kadry.FIO          fio, " +
         "  kadry.Karta        kr, " +
         "  kadry.Nazn_Vid     nv, " +
         "  kadry.Pricaz       pr1, " +
         "  kadry.Pricaz       pr2, " +
         "  kadry.Pricaz       pr3, " +
         "  kadry.Regim        r, " +
         "  kadry.Nazn_Day     nd, " +
         "  kadry.Nazn         n " +
         //" --  " +
         " WHERE ((nd.Nazn_Id = n.Id " +
         //"  -- Выбор параметров на дату среза " +
         "  AND nd.Date_Start <= GREATEST(n.Date_Start, ?) " +
         "  AND NOT EXISTS " +
         "     (SELECT NULL FROM kadry.s_Nazn_Day nd2 " +
         "       WHERE nd2.Nazn_Id = nd.Nazn_Id " +
         "         AND nd2.Date_Start <= GREATEST(n.Date_Start, ?) " +
         "         AND nd2.Date_Start > nd.Date_Start) " +
         "  AND n.Start_Pricaz_Id  = pr1.Id " +
         "  AND n.Finish_Pricaz_Id = pr2.Id " +
         "  AND nd.Pricaz_Id       = pr3.Id " +
         //"  -- " +
         "  AND n.Doljnost_Id = d.Id " +
         "  AND pd.Podr_Id = d.Podr_Id " +
         "  " +
         "  AND ps.Post_Id = NVL(nd.Post_Id, d.Post_Id) " +
         "  AND ps1.Post_Id = d.Post_Id " +
         "  AND k.Id = d.Kategory_Id " +
         "  AND prom.Id = DECODE(k.Prom_Id, 3,pd.Podr_Prom_Id, k.Prom_Id) " +
         //"  -- " +
         "  AND dd.Doljnost_Id(+) = d.Id " +
         //"  -- Выбор параметров должности на дату " +
         "  AND (dd.Doljnost_Id IS NULL " +
         "    OR (dd.Date_Start <= LEAST(n.Date_Finish, ?) " +
         //" --    OR (dd.Date_Start <= n.Date_Finish " +
         "      AND NOT EXISTS (SELECT NULL FROM kadry.Doljnost_Day dd2 " +
         "                      WHERE dd2.Doljnost_Id = dd.Doljnost_Id " +
         "                        AND dd2.Date_Start <= LEAST(n.Date_Finish, ?) " +
         //" --                        AND dd2.Date_Start <= n.Date_Finish " +
         "                        AND dd2.Date_Start > dd.Date_Start))) " +
         //" -- предыдущее назначение " +
         "  AND pv.Id(+) = n.Perevod_Vid_Id " +
         "  AND pu.id(+) = n.Perevod_Usl_id " +
         "  AND os.Id(+) = n.Perevod_Osnova_Id " +
         "  AND n.Perevod_Nazn_Id = n2.Id(+) " +
         "  AND n2.Doljnost_Id = d2.Id(+) " +
         "  AND ps2.Id(+) = d2.Post_Id " +
         "  AND pf2.Id(+) = ps2.Prof_Id " +
         "  AND rz2.Id(+) = ps2.Razr_Id  "+ //-- сдедующее назначение " +
         "  AND n.Id = n3.Perevod_Nazn_Id(+) " +
         "  AND pu3.id(+) = n3.perevod_Usl_id " +
         "  AND pv3.Id(+) = n3.Perevod_Vid_Id " +
         "  AND os3.Id(+) = n3.Perevod_Osnova_Id " +
         "  AND d3.Id(+)  = n3.Doljnost_Id " +
         "  AND ps3.Id(+) = d3.Post_Id " +
         "  AND pf3.Id(+) = ps3.Prof_Id " +
         "  AND rz3.Id(+) = ps3.Razr_Id  " +
         "  " +
         "  AND n.Karta_Id     = kr.Id " +
         "  AND fio.Id         = kr.FIO_Id " +
         "  AND nd.Nazn_Vid_Id = nv.Id(+) " +
         "  AND nd.Regim_Id  = r.Id(+) " +
         //" -- график назначения " +
         //" ) AND ? BETWEEN n.Date_Start AND n.Date_Finish /* открытые */ " +
         " )" +
         // " AND параметр BETWEEN n.Date_Start AND n.Date_Finish " +
         " ) " +
         //"AND INSTR(kadry.pkg_Podr_Utils.Get_Path_Id(d.Podr_Id, GREATEST(n.Date_Start, ?)),  " +
         //" '_'||1||'_')>0 " +
         " and n.date_start = (select max( date_start) from kadry.nazn nnn where nnn.karta_id in " +
         "         ( select kkk.id from  kadry.karta kkk where kkk.tabn = kr.tabn  )  " +
         " ) " +
         /*SUPP-2238*/((isShowCEO) ? "" : "    AND pd.podr_id <> " + FKConsts.PODR_MANAGEMENT_ID + " " +
         /*NET-4442*/                     "    AND nvl(ps.sokr_prof_dopoln, '-') <> 'n' ");





      if(aFilterObject != null)
      {

         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(fio.F||' '||fio.I||' '||fio.O) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(fio.F||' '||fio.I||' '||fio.O) LIKE UPPER(?)";
         }

        if(aFilterObject.tabNumber != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  kr.TabN = ?";
        }


         if (aFilterObject.departmentCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
              whereStr = whereStr + "  pd.Podr_Id = ?";
         }

         if (aFilterObject.departmentName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.departmentName.indexOf('*',0) < 0 && aFilterObject.departmentName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(pd.Podr_Nazv) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(pd.Podr_Nazv) LIKE UPPER(?)";
         }
         if (aFilterObject.positionName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.positionName.indexOf('*',0) < 0 && aFilterObject.positionName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(RTRIM(ps.Post_Nazv)) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(RTRIM(ps.Post_Nazv)) LIKE UPPER(?)";
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
         selectStr = selectStr +  whereStr;

    // selectStr = selectStr + ") ";

    selectStr = selectStr + " ORDER BY " + orderBy;

    try
     {
      statement = connection.prepareStatement(selectStr);


      statement.setDate(1, new java.sql.Date(dateIn.getTime()));
      statement.setDate(2, new java.sql.Date(dateIn.getTime()));
      statement.setDate(3, new java.sql.Date(dateIn.getTime()));
      statement.setDate(4, new java.sql.Date(dateIn.getTime()));
      statement.setDate(5, new java.sql.Date(dateIn.getTime()));
      statement.setDate(6, new java.sql.Date(dateIn.getTime()));
      statement.setDate(7, new java.sql.Date(dateIn.getTime()));
     // statement.setDate(7, new java.sql.Date(dateIn.getTime()));
     // statement.setDate(8, new java.sql.Date(dateIn.getTime()));

      //statement.setDate(9, new java.sql.Date(dateIn_1.getTime()));

      int number = 7;

      if(aFilterObject != null){

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


         if(aFilterObject.tabNumber != null){
             number++;
             StringBuffer likeStr = new StringBuffer();
             likeStr.append(aFilterObject.tabNumber);
             for(int i = 0;i < likeStr.length();i++){
                  if(likeStr.charAt(i) == '*')
                       likeStr.setCharAt(i,'%');
                  if(likeStr.charAt(i) == '?')
                       likeStr.setCharAt(i,'_');
             }
             statement.setString(number,likeStr.toString());
         }

           if(aFilterObject.departmentCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.departmentCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.departmentName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.departmentName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.positionName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.positionName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

      }

      //if(condition.length() > 0 && aBindObjects != null)
      // _bindObjectsToPreparedStatement(statement,aBindObjects,number);

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

        anObject = new FINWorkerShort();

        //selectStr = "select kdv.idkadry, kdv.fio, kdv.tabn, s.post_id, s.post_nazv, p.podrcod, p.podrname, kdv.oklad, kdv.date_uvol, kdv.categor "+


        anObject.name = set.getString(2);
        anObject.tabNumber = set.getString(3);

        anObject.positionName = set.getString(5);
        anObject.positionCode = set.getInt(4);
        if ( set.wasNull() )
            anObject.positionCode = Integer.MIN_VALUE;
        anObject.departmentName = set.getString(7);
        anObject.departmentCode = set.getString(6);
        anObject.priceGen = set.getBigDecimal(8);
        if(anObject.priceGen != null)
            anObject.priceGen = anObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

        // выведем ЛЮДЕЙ .. и закинем признак - может ли он быть в НПЗ !!!
        // это поле все равно везде НАЛЛ ...

        anObject.categor = set.getInt(10);
        if ( set.wasNull() )
            anObject.categor = Integer.MIN_VALUE;


       /* if ( set.getString(11) != null ){
            if (set.getString(11).toUpperCase().startsWith("НВЗ_Е")){
                 anObject.categor = FINWorkerKind.ESBYT;
          }
          else
          if (set.getString(11).toUpperCase().startsWith("НВЗ")){
         anObject.categor = FINWorkerKind.PROM;
          }
        } */
        // SUPP-34938 - признак НВЗ теперь берется с категории профессии , а не с примечания в карточке работника
        if ( set.getString(18) != null ){
            if (set.getString(18).toUpperCase().contains("НВЗ_Е")){
                 anObject.categor = FINWorkerKind.ESBYT;
          }
          else
          if (set.getString(18).toUpperCase().contains("НВЗ")){
         anObject.categor = FINWorkerKind.PROM;
          }
        }

        anObject.doljnostid = set.getInt(12);
        if ( set.wasNull() )
            anObject.doljnostid = Integer.MIN_VALUE;
        anObject.cehid = set.getInt(13);
        if ( set.wasNull() )
            anObject.cehid = Integer.MIN_VALUE;

        anObject.cehNazv = set.getString(14);


        anObject.finCode = set.getInt(1);
        if ( set.wasNull() )
            anObject.finCode = Integer.MIN_VALUE;


        anObject.categorId = set.getInt(15);
        if ( set.wasNull() )
            anObject.categorId = Integer.MIN_VALUE;

        anObject.categorName = set.getString(16);
        anObject.workTimeId = set.getString(17);

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



   /****
    * test
    *  для апдейта таблицы финворкер график рабочего времени и категория персонала
 * @throws DatasourceConnectException
    * */

   public FINWorkerShortList getFInworkerListForCategorAndWorktimeId() throws PersistenceException, DatasourceConnectException
   {
    FINWorkerShortList result = new FINWorkerShortList();
    FINWorkerShort anObject;
    result.list = new Vector();

    String     selectStr;

    //Connection connection = getConnection();
    Connection connection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";




    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = " Select fw.tabnumber , to_char(plan.datestart,'dd.mm.yyyy') datestart from enhumenitem hi , finworker fw , enplanwork plan   \n" +
    		" 			where hi.planrefcode = plan.code    \n" +
    		"     		 and plan.kindcode in (3,4)  \n" +
    		//" 			              and plan.datestart between '01.01.2015' and '28.02.2015'  \n" +
    		"     		 and hi.finworkercode = fw.code    \n" +
    		"     		 and ( (fw.categorid is null ) or ( fw.categorname = '' ) or ( fw.worktimeid is null) )  \n" +
    		//"     		 and fw.tabnumber = 11757     \n" +
    		"     		 group by fw.tabnumber , plan.datestart  \n" +
    		" union all  \n" +
    		" Select fw.tabnumber , to_char(plan.datestart,'dd.mm.yyyy') datestart from entransportitem ti , finworker fw , enplanwork plan   \n" +
    		" 			where ti.planrefcode = plan.code    \n" +
    		"     		 and plan.kindcode in (3,4)  \n" +
    		//" 			              and plan.datestart between '01.01.2015' and '01.02.2015'  \n" +
    		"     		 and ti.finworkercode = fw.code    \n" +
    		"     		 and ( (fw.categorid is null ) or ( fw.categorname = '' ) or ( fw.worktimeid is null) )  \n" +
    		//"     		 and fw.tabnumber = 11757     \n" +
    		"     		 group by fw.tabnumber , plan.datestart  \n" +
    		"     	 \n" +
    		"  \n" +
    		" 	 order by tabnumber , datestart   \n" +
    		// "     		 limit 100000  \n" +
    		 "  \n" ;


    try
     {
      statement = connection.prepareStatement(selectStr);
      int number = 0;

      set = statement.executeQuery();
      int i;
      for(i = 0;set.next();i++)
       {


        anObject = new FINWorkerShort();

        anObject.tabNumber = set.getString(1);
        anObject.positionName= set.getString(2); // тута дата старта с плана

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
      //if(connection != super.getConnection())
       {
        try{connection.close();} catch(SQLException e){}
       }
     }
   }



} // end of FINWorkerDAO

