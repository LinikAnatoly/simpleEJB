
//---------------------------------------------------------
// Application: EnergyNET2
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

import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.dataminer.generated.ENPurchasesNoObjectDAOGen;
import com.ksoe.energynet.valueobject.ENPurchasesNoObject;
import com.ksoe.energynet.valueobject.brief.ENPurchasesNoObjectShort;
import com.ksoe.energynet.valueobject.lists.ENPurchasesNoObjectShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;

  /**
  *  DAO Object for ENPurchasesNoObject;
  *
  */

public class ENPurchasesNoObjectDAO extends ENPurchasesNoObjectDAOGen {


  public ENPurchasesNoObjectDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENPurchasesNoObjectDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public void remove(int uid) throws PersistenceException
  {
    ENPurchasesNoObject obj = getObject(uid);

    super.remove(uid);

    ENElementDAO eDao = new ENElementDAO(super.getConnection(), super.getUserProfile() );
    eDao.remove(obj.element.code);

    //super.remove(uid);
  }


  public ENPurchasesNoObjectShortList getScrollableFilteredList(ENPurchasesNoObject aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {
   ENPurchasesNoObjectShortList result = new ENPurchasesNoObjectShortList();
   ENPurchasesNoObjectShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);

   if(orderBy.length() == 0)
    orderBy = "ENPURCHASESNOOBJECT.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "SELECT "+
    "ENPURCHASESNOOBJECT.CODE"+
    ",ENPURCHASESNOOBJECT.NAME"+

    ", budg.CODE " +
    ", budg.SHORTNAME " +
    ", budg.DATESTART " +
    ", budg.DATEFINAL " +

     ", dep.CODE " +
     ", dep.SHORTNAME " +
     ", dep.DATESTART " +
     ", dep.DATEFINAL " +

     ", ENELEMENT.CODE " +

     ", ENPURCHASESNOOBJECTTYP.CODE " +
     ", ENPURCHASESNOOBJECTTYP.NAME " +

    " FROM ENPURCHASESNOOBJECT " +
    ", ENDEPARTMENT dep " +
    ", ENDEPARTMENT budg " +
    ", ENELEMENT " +
    ", ENPURCHASESNOOBJECTTYP " +
    //" WHERE "
    "";
    whereStr = " budg.CODE = ENPURCHASESNOOBJECT.BUDGETCODE" ; //+
     whereStr = whereStr +" AND dep.CODE = ENPURCHASESNOOBJECT.DEPARTMENTCODE" ; //+
     whereStr = whereStr +" AND ENELEMENT.CODE = ENPURCHASESNOOBJECT.ELEMENTCODE" ; //+

     whereStr = whereStr +" AND ENPURCHASESNOOBJECTTYP.CODE = ENPURCHASESNOOBJECT.TYPEREFCODE" ; //+

        //selectStr = selectStr + " ${s} ENPURCHASESNOOBJECT.CODE IN ( SELECT ENPURCHASESNOOBJECT.CODE FROM ENPURCHASESNOOBJECT ";

//" ";
     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPURCHASESNOOBJECT.CODE = ?";
       }
        if (aFilterObject.name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENPURCHASESNOOBJECT.NAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENPURCHASESNOOBJECT.NAME) LIKE UPPER(?)";
        }
        if (aFilterObject.commentGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENPURCHASESNOOBJECT.COMMENTGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENPURCHASESNOOBJECT.COMMENTGEN) LIKE UPPER(?)";
        }
        if (aFilterObject.domain_info != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENPURCHASESNOOBJECT.DOMAIN_INFO) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENPURCHASESNOOBJECT.DOMAIN_INFO) LIKE UPPER(?)";
        }
       if(aFilterObject.modify_time != Long.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPURCHASESNOOBJECT.MODIFY_TIME = ?";
       }
       if(aFilterObject.budget.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPURCHASESNOOBJECT.BUDGETCODE = ? ";
       }
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPURCHASESNOOBJECT.DEPARTMENTCODE = ? ";
       }
       if(aFilterObject.element.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPURCHASESNOOBJECT.ELEMENTCODE = ? ";
       }

       if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPURCHASESNOOBJECT.TYPEREFCODE = ? ";
       }

     }


   SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPurchasesNoObject.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
   if(segregationInfo.isAccessDenied())
     throw new PersistenceException("{%ENPurchasesNoObject.getList%} access denied");

   String domainWhereStr = SegregationQueryBuilder.addWhere("ENPURCHASESNOOBJECT",segregationInfo,getUserProfile().getDomainInfo());

   if (domainWhereStr.length() != 0){
   // domainWhereStr = "  AND ENPURCHASESNOOBJECT.DOMAIN_INFO IS NOT NULL";
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
      if(aFilterObject.budget.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.budget.code);
      }
      if(aFilterObject.department.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.department.code);
      }
      if(aFilterObject.element.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.element.code);
      }

      if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.typeRef.code);
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

       anObject = new ENPurchasesNoObjectShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.name = set.getString(2);


       anObject.budgetCode = set.getInt(3);

       anObject.budgetShortName = set.getString(4);

       anObject.budgetDateStart = set.getDate(5);

       anObject.budgetDateFinal = set.getDate(6);

       anObject.departmentCode = set.getInt(7);

       anObject.departmentShortName = set.getString(8);

       anObject.departmentDateStart = set.getDate(9);

       anObject.departmentDateFinal = set.getDate(10);

       anObject.elementCode = set.getInt(11);

       anObject.typeRefCode = set.getInt(12);
        if(set.wasNull())
        anObject.typeRefCode = Integer.MIN_VALUE;
       anObject.typeRefName = set.getString(13);

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


} // end of ENPurchasesNoObjectDAO

