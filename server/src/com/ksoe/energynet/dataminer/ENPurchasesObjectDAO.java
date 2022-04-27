
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
import com.ksoe.energynet.dataminer.generated.ENPurchasesObjectDAOGen;
import com.ksoe.energynet.valueobject.ENPurchasesObject;
import com.ksoe.energynet.valueobject.brief.ENPurchasesObjectShort;
import com.ksoe.energynet.valueobject.lists.ENPurchasesObjectShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;

  /**
  *  DAO Object for ENPurchasesObject;  
  * 	
  */

public class ENPurchasesObjectDAO extends ENPurchasesObjectDAOGen {

  
  public ENPurchasesObjectDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENPurchasesObjectDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

  
 

  public void remove(int uid) throws PersistenceException
  {
	  ENPurchasesObject obj = getObject(uid);
	  
	  super.remove(uid);
  
	  ENElementDAO eDao = new ENElementDAO(super.getConnection(), super.getUserProfile() );
	  eDao.remove(obj.element.code);
	  
	  //super.remove(uid);
  }

  public ENPurchasesObjectShortList getScrollableFilteredList(ENPurchasesObject aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {   
   ENPurchasesObjectShortList result = new ENPurchasesObjectShortList();
   ENPurchasesObjectShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);
	
   if(orderBy.length() == 0)
    orderBy = "ENPURCHASESOBJECT.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");
	 
   selectStr = "SELECT "+
    "ENPURCHASESOBJECT.CODE"+
    ",ENPURCHASESOBJECT.NAME"+

     ", ENPURCHASESOBJECTREASN.CODE " +
     ", ENPURCHASESOBJECTREASN.NAME " +
     ", ENELEMENTTYPE.CODE " +
     ", ENELEMENTTYPE.NAME " +
     ", budg.CODE " +
     ", budg.SHORTNAME " +
     ", budg.DATESTART " +
     ", budg.DATEFINAL " +
     ", dep.CODE " +
     ", dep.SHORTNAME " +
     ", dep.DATESTART " +
     ", budg.DATEFINAL " +
     ", ENELEMENT.CODE " +
     ", ENPURCHASESOBJECT.EXPANDMATERIALSIP"+
    " FROM ENPURCHASESOBJECT " +
    ", ENPURCHASESOBJECTREASN " +
    ", ENELEMENTTYPE " +
    ", ENDEPARTMENT dep " +
    ", ENDEPARTMENT budg " +
    ", ENELEMENT " +
    //" WHERE " 
	""; 
    whereStr = " ENPURCHASESOBJECTREASN.CODE = ENPURCHASESOBJECT.PURCHASESREASONCODE" ; //+
     whereStr = whereStr +" AND ENELEMENTTYPE.CODE = ENPURCHASESOBJECT.ELEMENTTYPEREFCODE" ; //+
     whereStr = whereStr +" AND budg.CODE = ENPURCHASESOBJECT.BUDGETCODE" ; //+
     whereStr = whereStr +" AND dep.CODE = ENPURCHASESOBJECT.DEPARTMENTCODE" ; //+
     whereStr = whereStr +" AND ENELEMENT.CODE = ENPURCHASESOBJECT.ELEMENTCODE" ; //+
		//selectStr = selectStr + " ${s} ENPURCHASESOBJECT.CODE IN ( SELECT ENPURCHASESOBJECT.CODE FROM ENPURCHASESOBJECT ";

//" ";
     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPURCHASESOBJECT.CODE = ?";
       }
        if (aFilterObject.name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENPURCHASESOBJECT.NAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENPURCHASESOBJECT.NAME) LIKE UPPER(?)";
        }
        if (aFilterObject.commentGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENPURCHASESOBJECT.COMMENTGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENPURCHASESOBJECT.COMMENTGEN) LIKE UPPER(?)";
        }
        if (aFilterObject.domain_info != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENPURCHASESOBJECT.DOMAIN_INFO) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENPURCHASESOBJECT.DOMAIN_INFO) LIKE UPPER(?)";
        }
       if(aFilterObject.modify_time != Long.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPURCHASESOBJECT.MODIFY_TIME = ?";
       }
       if(aFilterObject.purchasesReason.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPURCHASESOBJECT.PURCHASESREASONCODE = ? ";
       }
       if(aFilterObject.elementTypeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPURCHASESOBJECT.ELEMENTTYPEREFCODE = ? ";
       }
       if(aFilterObject.budget.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPURCHASESOBJECT.BUDGETCODE = ? ";
       }
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPURCHASESOBJECT.DEPARTMENTCODE = ? ";
       }
       if(aFilterObject.element.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENPURCHASESOBJECT.ELEMENTCODE = ? ";
       }

     }

	  
   SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPurchasesObject.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
   if(segregationInfo.isAccessDenied())
     throw new PersistenceException("{%ENPurchasesObject.getList%} access denied");

   String domainWhereStr = SegregationQueryBuilder.addWhere("ENPURCHASESOBJECT",segregationInfo,getUserProfile().getDomainInfo());

   if (domainWhereStr.length() != 0){
   // domainWhereStr = "  AND ENPURCHASESOBJECT.DOMAIN_INFO IS NOT NULL";
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
      if(aFilterObject.purchasesReason.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.purchasesReason.code);
      }
      if(aFilterObject.elementTypeRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.elementTypeRef.code);
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

       anObject = new ENPurchasesObjectShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.name = set.getString(2);


       anObject.purchasesReasonCode = set.getInt(3);

       anObject.purchasesReasonName = set.getString(4);

       anObject.elementTypeRefCode = set.getInt(5);

       anObject.elementTypeRefName = set.getString(6);

       anObject.budgetCode = set.getInt(7);

       anObject.budgetShortName = set.getString(8);

       anObject.budgetDateStart = set.getDate(9);

       anObject.budgetDateFinal = set.getDate(10);

       anObject.departmentCode = set.getInt(11);

       anObject.departmentShortName = set.getString(12);

       anObject.departmentDateStart = set.getDate(13);

       anObject.departmentDateFinal = set.getDate(14);

       anObject.elementCode = set.getInt(15);
       
       anObject.expandMaterialsIP = set.getInt(16);
       
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

  
  public int[] getFilteredCodeArrayNOSEGR(ENPurchasesObject aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {
   Vector result = new Vector();

   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     selectStr = "SELECT ENPURCHASESOBJECT.CODE FROM ENPURCHASESOBJECT";
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);

   if(orderBy.length() == 0)
    orderBy = "ENPURCHASESOBJECT.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");
   
   /*
   SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPurchasesObject.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
   if(segregationInfo.isAccessDenied())
     throw new PersistenceException("{%ENPurchasesObject.getList%} access denied");
	
	whereStr = SegregationQueryBuilder.addWhere("ENPURCHASESOBJECT",segregationInfo,getUserProfile().getDomainInfo());
	
   if(whereStr.length() == 0)
    whereStr = " (ENPURCHASESOBJECT.DOMAIN_INFO IS NOT NULL) ";
   else
    whereStr = " "+whereStr;	
	*/
   
     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPURCHASESOBJECT.CODE = ?";
       }
        if (aFilterObject.name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                whereStr = whereStr + "  ENPURCHASESOBJECT.NAME = ?";
            else
                whereStr = whereStr + "  ENPURCHASESOBJECT.NAME LIKE ?";
        }
        if (aFilterObject.commentGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                whereStr = whereStr + "  ENPURCHASESOBJECT.COMMENTGEN = ?";
            else
                whereStr = whereStr + "  ENPURCHASESOBJECT.COMMENTGEN LIKE ?";
        }
       if(aFilterObject.expandMaterialsIP != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPURCHASESOBJECT.EXPANDMATERIALSIP = ?";
       }
        if (aFilterObject.domain_info != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                whereStr = whereStr + "  ENPURCHASESOBJECT.DOMAIN_INFO = ?";
            else
                whereStr = whereStr + "  ENPURCHASESOBJECT.DOMAIN_INFO LIKE ?";
        }
       if(aFilterObject.modify_time != Long.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENPURCHASESOBJECT.MODIFY_TIME = ?";
       }
       if(aFilterObject.purchasesReason.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + " ENPURCHASESOBJECT.PURCHASESREASONCODE = ? ";
       }
       if(aFilterObject.elementTypeRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + " ENPURCHASESOBJECT.ELEMENTTYPEREFCODE = ? ";
       }
       if(aFilterObject.budget.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + " ENPURCHASESOBJECT.BUDGETCODE = ? ";
       }
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + " ENPURCHASESOBJECT.DEPARTMENTCODE = ? ";
       }
       if(aFilterObject.element.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + " ENPURCHASESOBJECT.ELEMENTCODE = ? ";
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
        if (aFilterObject.name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND";
            if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                whereStr = whereStr + " ENPURCHASESOBJECT.NAME = ?";
            else
                whereStr = whereStr + " ENPURCHASESOBJECT.NAME LIKE ?";

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
        }
        if (aFilterObject.commentGen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND";
            if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                whereStr = whereStr + " ENPURCHASESOBJECT.COMMENTGEN = ?";
            else
                whereStr = whereStr + " ENPURCHASESOBJECT.COMMENTGEN LIKE ?";

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
        if(aFilterObject.expandMaterialsIP != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.expandMaterialsIP);
        }
        if (aFilterObject.domain_info != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND";
            if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                whereStr = whereStr + " ENPURCHASESOBJECT.DOMAIN_INFO = ?";
            else
                whereStr = whereStr + " ENPURCHASESOBJECT.DOMAIN_INFO LIKE ?";

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
        }
       if(aFilterObject.modify_time != Long.MIN_VALUE){
           number++;
           if(aFilterObject.modify_time == Long.MIN_VALUE)
               statement.setBigDecimal(number,null);
           else
               statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
       }
      if(aFilterObject.purchasesReason.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.purchasesReason.code);
      }
      if(aFilterObject.elementTypeRef.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.elementTypeRef.code);
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


   } // end of getFilteredCodeArrayNOSEGR

  
} // end of ENPurchasesObjectDAO

