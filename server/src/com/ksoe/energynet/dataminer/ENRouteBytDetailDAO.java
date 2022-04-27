
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
import com.ksoe.energynet.dataminer.generated.ENRouteBytDetailDAOGen;
import com.ksoe.energynet.valueobject.ENRouteBytDetail;
import com.ksoe.energynet.valueobject.brief.ENRouteBytDetailShort;
import com.ksoe.energynet.valueobject.lists.ENRouteBytDetailShortList;

  /**
  *  DAO Object for ENRouteBytDetail;  
  * 	
  */

public class ENRouteBytDetailDAO extends ENRouteBytDetailDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENRouteBytDetailDAO() {super();}
  //public ENRouteBytDetailDAO(Connection aConnection) {super(aConnection);}
  //public ENRouteBytDetailDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENRouteBytDetailDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENRouteBytDetailDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public ENRouteBytDetailShortList getScrollableFilteredList(ENRouteBytDetail aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
  {
   ENRouteBytDetailShortList result = new ENRouteBytDetailShortList();
   ENRouteBytDetailShort anObject;
   result.list = new Vector();

   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;
   String     whereStr = "";
   String     condition = processCondition(anCondition);
   String     orderBy = processCondition(anOrderBy);

   if(orderBy.length() == 0)
    orderBy = "ENROUTEBYTDETAIL.CODE";

   if(quantity < 0)
    quantity = Integer.MAX_VALUE/2;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr = "SELECT "+
    "ENROUTEBYTDETAIL.CODE"+
    ",ENROUTEBYTDETAIL.NAME"+
    ",ENROUTEBYTDETAIL.NUMBERGEN"+
    ",ENROUTEBYTDETAIL.ROUTECODE"+
    ",ENROUTEBYTDETAIL.RPCODE"+
    ",ENROUTEBYTDETAIL.RPNAME"+
    ",ENROUTEBYTDETAIL.ENTRYCODE"+
    ",ENROUTEBYTDETAIL.STATUSCODE"+

     ", ENPLANWORK.CODE " +
     ", ENPLANWORK.DATEGEN " +
     ", ENPLANWORK.DATESTART " +
     ", ENPLANWORK.DATEFINAL " +
     ", ENPLANWORK.YEARGEN " +
     ", ENPLANWORK.MONTHGEN " +
     ", ENPLANWORK.YEARORIGINAL " +
     ", ENPLANWORK.MONTHORIGINAL " +
     ", ENPLANWORK.USERGEN " +
     ", ENPLANWORK.DATEEDIT " +
     ", ENPLANWORK.WORKORDERNUMBER " +
     ", ENPLANWORK.DATEWORKORDER " +
     ", ENPLANWORK.PRICONNECTIONNUMBER " +
     ", ENPLANWORK.DATEENDPRICONNECTION " +
     ", ENPLANWORK.INVESTWORKSDESCRIPTION " +
     ", ENPLANWORK.SERVICESFSIDEFINID " +
     ", ENPLANWORK.SERVICESFSIDECNNUM " +
     ", ENPLANWORK.TOTALTIMEHOURS " +
     ", ENPLANWORK.TOTALTIMEDAYS " +
     ", ENPLANWORK.INVESTITEMNUMBER " +
     ", ENROUTEBYTDETAIL.ELEMENTCODE " +
    " FROM ENROUTEBYTDETAIL " +
    ", ENPLANWORK " +
    //", ENELEMENT " +
    //" WHERE "
 "";
    whereStr = " ENPLANWORK.CODE = ENROUTEBYTDETAIL.PLANREFCODE" ; //+
    // whereStr = whereStr +" AND ENELEMENT.CODE = ENROUTEBYTDETAIL.ELEMENTCODE" ; //+
   //selectStr = selectStr + " ${s} ENROUTEBYTDETAIL.CODE IN ( SELECT ENROUTEBYTDETAIL.CODE FROM ENROUTEBYTDETAIL ";

//" ";
     if(aFilterObject != null)
     {
       if(aFilterObject.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENROUTEBYTDETAIL.CODE = ?";
       }
        if (aFilterObject.name != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENROUTEBYTDETAIL.NAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENROUTEBYTDETAIL.NAME) LIKE UPPER(?)";
        }
        if (aFilterObject.numbergen != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.numbergen.indexOf('*',0) < 0 && aFilterObject.numbergen.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENROUTEBYTDETAIL.NUMBERGEN) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENROUTEBYTDETAIL.NUMBERGEN) LIKE UPPER(?)";
        }
       if(aFilterObject.routeCode != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENROUTEBYTDETAIL.ROUTECODE = ?";
       }
       if(aFilterObject.rpCode != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENROUTEBYTDETAIL.RPCODE = ?";
       }
        if (aFilterObject.rpName != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.rpName.indexOf('*',0) < 0 && aFilterObject.rpName.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENROUTEBYTDETAIL.RPNAME) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENROUTEBYTDETAIL.RPNAME) LIKE UPPER(?)";
        }
       if(aFilterObject.entryCode != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENROUTEBYTDETAIL.ENTRYCODE = ?";
       }
       if(aFilterObject.statusCode != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENROUTEBYTDETAIL.STATUSCODE = ?";
       }
        
       if(aFilterObject.modify_time != Long.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "  ENROUTEBYTDETAIL.MODIFY_TIME = ?";
       }
       if(aFilterObject.planRef.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENROUTEBYTDETAIL.PLANREFCODE = ? ";
       }
       if(aFilterObject.element.code != Integer.MIN_VALUE) {
           if(whereStr.length() != 0)
              whereStr = whereStr + " AND ";
           whereStr = whereStr + "ENROUTEBYTDETAIL.ELEMENTCODE = ? ";
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
        selectStr = selectStr + " WHERE " + whereStr;

   // selectStr = selectStr + ") ";

   selectStr = selectStr + " ORDER BY " + orderBy;

   selectStr = selectStr + " OFFSET " + fromPosition;
   if (quantity>-1) selectStr = selectStr + " LIMIT " + quantity;

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
        if(aFilterObject.rpCode != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.rpCode);
        }

          if(aFilterObject.rpName != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.rpName);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }
        if(aFilterObject.entryCode != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.entryCode);
        }
        if(aFilterObject.statusCode != Integer.MIN_VALUE){
            number++;
            statement.setInt(number,aFilterObject.statusCode);
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
      if(aFilterObject.element.code != Integer.MIN_VALUE) {
          number++;
          statement.setInt(number,aFilterObject.element.code);
      }
     }

     if(condition.length() > 0 && aBindObjects != null)
      _bindObjectsToPreparedStatement(statement,aBindObjects,number);

     set = statement.executeQuery();
     int i;
     for (i = 0; set.next(); i++) {
       /*
       if (i < fromPosition)
         continue;
       else if (i >= fromPosition + quantity) {
         i++;
         break;
       } */

       anObject = new ENRouteBytDetailShort();

       anObject.code = set.getInt(1);
       if ( set.wasNull() )
           anObject.code = Integer.MIN_VALUE;
       anObject.name = set.getString(2);
       anObject.numbergen = set.getString(3);
       anObject.routeCode = set.getInt(4);
       if ( set.wasNull() )
           anObject.routeCode = Integer.MIN_VALUE;
       anObject.rpCode = set.getInt(5);
       if ( set.wasNull() )
           anObject.rpCode = Integer.MIN_VALUE;
       anObject.rpName = set.getString(6);
       anObject.entryCode = set.getInt(7);
       if ( set.wasNull() )
           anObject.entryCode = Integer.MIN_VALUE;
       anObject.statusCode = set.getInt(8);
       if ( set.wasNull() )
           anObject.statusCode = Integer.MIN_VALUE;

       anObject.planRefCode = set.getInt(9);
   if(set.wasNull())
     anObject.planRefCode = Integer.MIN_VALUE;
       anObject.planRefDateGen = set.getTimestamp(10);
       anObject.planRefDateStart = set.getDate(11);
       anObject.planRefDateFinal = set.getDate(12);
       anObject.planRefYearGen = set.getInt(13);
   if(set.wasNull())
     anObject.planRefYearGen = Integer.MIN_VALUE;
       anObject.planRefMonthGen = set.getInt(14);
   if(set.wasNull())
     anObject.planRefMonthGen = Integer.MIN_VALUE;
       anObject.planRefYearOriginal = set.getInt(15);
   if(set.wasNull())
     anObject.planRefYearOriginal = Integer.MIN_VALUE;
       anObject.planRefMonthOriginal = set.getInt(16);
   if(set.wasNull())
     anObject.planRefMonthOriginal = Integer.MIN_VALUE;
       anObject.planRefUserGen = set.getString(17);
       anObject.planRefDateEdit = set.getDate(18);
       anObject.planRefWorkOrderNumber = set.getString(19);
       anObject.planRefDateWorkOrder = set.getDate(20);
       anObject.planRefPriConnectionNumber = set.getString(21);
       anObject.planRefDateEndPriConnection = set.getDate(22);
       anObject.planRefInvestWorksDescription = set.getString(23);
       anObject.planRefServicesFSideFinId = set.getInt(24);
   if(set.wasNull())
     anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;
       anObject.planRefServicesFSideCnNum = set.getString(25);
       anObject.planRefTotalTimeHours = set.getBigDecimal(26);
       if(anObject.planRefTotalTimeHours != null)
         anObject.planRefTotalTimeHours = anObject.planRefTotalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.planRefTotalTimeDays = set.getBigDecimal(27);
       if(anObject.planRefTotalTimeDays != null)
         anObject.planRefTotalTimeDays = anObject.planRefTotalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
       anObject.planRefInvestItemNumber = set.getString(28);
       anObject.elementCode = set.getInt(29);
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



} // end of ENRouteBytDetailDAO

