
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

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.dataminer.generated.ENRouteBytDAOGen;
import com.ksoe.energynet.valueobject.ENRouteByt;
import com.ksoe.energynet.valueobject.brief.ENRouteBytShort;
import com.ksoe.energynet.valueobject.filter.ENRouteBytFilter;
import com.ksoe.energynet.valueobject.lists.ENRouteBytShortList;

  /**
  *  DAO Object for ENRouteByt;  
  * 	
  */

public class ENRouteBytDAO extends ENRouteBytDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENRouteBytDAO() {super();}
  //public ENRouteBytDAO(Connection aConnection) {super(aConnection);}
  //public ENRouteBytDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENRouteBytDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENRouteBytDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

  public ENRouteByt getObjectNOSEGR(int uid) throws PersistenceException
  {
   ENRouteByt result = new ENRouteByt();
   result.code = uid;
   loadObjectNOSEGR(result);
   if(result.code == Integer.MIN_VALUE)
    return null;
   return result;
  }
  
  public void loadObjectNOSEGR(ENRouteByt anObject) throws PersistenceException
  {
   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet set = null;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   /*
   SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENRouteByt.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
   if(segregationInfo.isAccessDenied())
     throw new PersistenceException("{%ENRouteByt.getObject%} access denied");
	*/


   selectStr =
   "SELECT  ENROUTEBYT.CODE, ENROUTEBYT.NAME, ENROUTEBYT.NUMBERGEN, ENROUTEBYT.ROUTECODE, ENROUTEBYT.DOMAIN_INFO, ENROUTEBYT.MODIFY_TIME, ENROUTEBYT.ELEMENTCODE "
   +" FROM ENROUTEBYT WHERE ENROUTEBYT.CODE = ?";
   
   /*
   String segregationWhereStr = SegregationQueryBuilder.addWhere("ENROUTEBYT",segregationInfo,getUserProfile().getDomainInfo());
   if(segregationWhereStr.length() > 0)
    selectStr = selectStr + " AND " + segregationWhereStr;
	*/
   
   try
    {
     statement = connection.prepareStatement(selectStr);
     statement.setInt(1,anObject.code);
     set = statement.executeQuery();
     if(!set.next())
      anObject.code = Integer.MIN_VALUE;
     else
      {
       anObject.code = set.getInt(1);
       anObject.name = set.getString(2);
       anObject.numbergen = set.getString(3);
       anObject.routeCode = set.getInt(4);
       if ( set.wasNull() )
          anObject.routeCode = Integer.MIN_VALUE;
       anObject.domain_info = set.getString(5);
       anObject.modify_time = set.getLong(6);
       if(set.wasNull())
        anObject.modify_time = Long.MIN_VALUE;
       anObject.element.code = set.getInt(7);
       if ( set.wasNull() )
           anObject.element.code = Integer.MIN_VALUE;
       if(anObject.element.code != Integer.MIN_VALUE)
       {
          anObject.setElement(
       new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).getObject(anObject.element.code));
   }
     }
   }
   catch(SQLException e)
    {
     System.out.println(e.getMessage()+"\nstatement - "+selectStr);
     throw new SystemException(e.getMessage(), e);
    }
   finally
    {
     try {if(set != null) set.close(); if (statement != null) statement.close();}
     catch (SQLException e) {}
     if(connection != super.getConnection())
      {
       try{connection.close();} catch(SQLException e){}
      }
    }
  }

  
  public ENRouteBytShortList getScrollableFilteredListNOSEGR(ENRouteBytFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
  {
   return getScrollableFilteredListNOSEGR(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
  }

 public ENRouteBytShortList getScrollableFilteredListNOSEGR(ENRouteBytFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
  {
   return getScrollableFilteredListNOSEGR(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
  }

/*
    public ENRouteBytShortList getScrollableFilteredList(ENRouteByt aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {
return null;
}
**********************************/

 public ENRouteBytShortList getScrollableFilteredListNOSEGR(ENRouteByt aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {
   ENRouteBytShortList result = new ENRouteBytShortList();
   ENRouteBytShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);

   if(orderBy.length() == 0)
    orderBy = "ENROUTEBYT.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "SELECT "+
    "ENROUTEBYT.CODE"+
    ",ENROUTEBYT.NAME"+
    ",ENROUTEBYT.NUMBERGEN"+
    ",ENROUTEBYT.ROUTECODE"+

     ", ENELEMENT.CODE " +
    " FROM ENROUTEBYT " +
    ", ENELEMENT " +
    //" WHERE "
   "";
    whereStr = " ENELEMENT.CODE = ENROUTEBYT.ELEMENTCODE" ; //+
       //selectStr = selectStr + " ${s} ENROUTEBYT.CODE IN ( SELECT ENROUTEBYT.CODE FROM ENROUTEBYT ";

//" ";
     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENROUTEBYT.CODE = ?";
       }
        if (aFilterObject.name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENROUTEBYT.NAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENROUTEBYT.NAME) LIKE UPPER(?)";
        }
        if (aFilterObject.numbergen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.numbergen.indexOf('*',0) < 0 && aFilterObject.numbergen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENROUTEBYT.NUMBERGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENROUTEBYT.NUMBERGEN) LIKE UPPER(?)";
        }
       if(aFilterObject.routeCode != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENROUTEBYT.ROUTECODE = ?";
       }
        if (aFilterObject.domain_info != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.domain_info.indexOf('*',0) < 0 && aFilterObject.domain_info.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENROUTEBYT.DOMAIN_INFO) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENROUTEBYT.DOMAIN_INFO) LIKE UPPER(?)";
        }
       if(aFilterObject.modify_time != Long.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENROUTEBYT.MODIFY_TIME = ?";
       }
       if(aFilterObject.element.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENROUTEBYT.ELEMENTCODE = ? ";
       }

     }


   /*
   SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENRouteByt.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
   if(segregationInfo.isAccessDenied())
     throw new PersistenceException("{%ENRouteByt.getList%} access denied");

   String domainWhereStr = SegregationQueryBuilder.addWhere("ENROUTEBYT",segregationInfo,getUserProfile().getDomainInfo());

   if (domainWhereStr.length() != 0){
   // domainWhereStr = "  AND ENROUTEBYT.DOMAIN_INFO IS NOT NULL";
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
        if(aFilterObject.routeCode != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.routeCode);
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

       anObject = new ENRouteBytShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.name = set.getString(2);
       anObject.numbergen = set.getString(3);
       anObject.routeCode = set.getInt(4);
       if ( set.wasNull() )
           anObject.routeCode = Integer.MIN_VALUE;

       anObject.elementCode = set.getInt(5);
       if(set.wasNull())
       anObject.elementCode = Integer.MIN_VALUE;

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



} // end of ENRouteBytDAO

