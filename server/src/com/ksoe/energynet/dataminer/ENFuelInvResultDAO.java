
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENFuelInvResultDAOGen;
import com.ksoe.energynet.valueobject.ENFuelInvResult;
import com.ksoe.energynet.valueobject.brief.ENFuelInvResultShort;
import com.ksoe.energynet.valueobject.lists.ENFuelInvResultShortList;

/**
 * DAO Object for ENFuelInvResult;
 *
 */

public class ENFuelInvResultDAO extends ENFuelInvResultDAOGen {

    public ENFuelInvResultDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENFuelInvResultDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    public int add(ENFuelInvResult anObject) throws PersistenceException
    {
     anObject.dateEdit = new Date();
     anObject.userGen = getUserProfile().userName;
     return add(anObject,true);
    }
    
    public void save(ENFuelInvResult anObject) throws PersistenceException
    {
     anObject.dateEdit = new Date();
     anObject.userGen = getUserProfile().userName;
     save(anObject,null);
    }
    
    public ENFuelInvResultShortList summaryFuelList(int inventarizationCode) throws PersistenceException
    {
    ENFuelInvResultShortList result = new ENFuelInvResultShortList();
    ENFuelInvResultShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;


     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");
     
     selectStr = "select abs(sum(cast(t.countfact - t.countgen as numeric(15,2)))) as deltaCount, "
     		+ " case when sum(t.countfact - t.countgen) < 0 then 2 "
     		+ " else 1 end as deltaType,  " 
       /*Для deltaType = 2 будем проводить списание, 
         для delttaType = 1 будем делать приход*/ 
            + " t.fueltyperefcode, ft.name as fuelName "  
            + " from enfuelinventarizatintm t, tkfueltype ft "
            + " where t.inventarizationrefcode = " + inventarizationCode 
            + " and t.fueltyperefcode = ft.code "
            + " and t.countfact - t.countgen <> 0" 
            + "group by t.fueltyperefcode, ft.name" ;

     try
      {
       statement = connection.prepareStatement(selectStr);
       set = statement.executeQuery();
       int i;
       for (i = 0; set.next(); i++) {


         anObject = new ENFuelInvResultShort();

         anObject.deltaCount = set.getBigDecimal(1);
         if(anObject.deltaCount != null)
         anObject.deltaCount = anObject.deltaCount.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             
         anObject.typeRefCode = set.getInt(2);
     if(set.wasNull())
         anObject.typeRefCode = Integer.MIN_VALUE;

         anObject.fuelTypeRefCode = set.getInt(3);
     if(set.wasNull())
         anObject.fuelTypeRefCode = Integer.MIN_VALUE;
     
         anObject.fuelTypeRefName = set.getString(4);
         
      
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
    
    
    public ENFuelInvResultShortList getScrollableFilteredList(ENFuelInvResult aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
    {
     ENFuelInvResultShortList result = new ENFuelInvResultShortList();
     ENFuelInvResultShort anObject;
     result.list = new Vector();

     String     selectStr;
     Connection connection = getConnection();
     PreparedStatement statement = null;
     ResultSet  set = null;
     String     whereStr = "";
     String     condition = processCondition(anCondition);
     String     orderBy = processCondition(anOrderBy);

     if(orderBy.length() == 0)
      orderBy = "ENFUELINVRESULT.CODE";

     if(quantity < 0)
      quantity = Integer.MAX_VALUE/2;

     if(getUserProfile() == null)
      throw new PersistenceException("Internal Error (User Profile Is Undefined)");

     selectStr = "SELECT "+
      "ENFUELINVRESULT.CODE"+
      ",ENFUELINVRESULT.DELTACOUNT"+
      ",ENFUELINVRESULT.USERGEN"+
      ",ENFUELINVRESULT.DATEEDIT"+

       ", ENFUELINVENTARIZATION.CODE " +
       ", ENFUELINVENTARIZATION.NUMBERGEN " +
       ", ENFUELINVENTARIZATION.DATEGEN " +
       ", ENFUELINVENTARIZATION.MOLCODE " +
       ", ENFUELINVENTARIZATION.MOLNAME " +
       ", ENFUELINVENTARIZATION.COMMENTGEN " +
       ", ENFUELINVENTARIZATION.USERADD " +
       ", ENFUELINVENTARIZATION.DATEADD " +
       ", ENFUELINVENTARIZATION.USERGEN " +
       ", ENFUELINVENTARIZATION.DATEEDIT " +
       ", TKFUELTYPE.CODE " +
       ", TKFUELTYPE.NAME " +
       ", ENFUELINVRESULTTYPE.CODE " +
       ", ENFUELINVRESULTTYPE.NAME " +
       ", ENFUELINVRESULT.FKORDERITEMREFCODE" +
       ", ENFUELINVRESULT.ESTIMATEITEMREFCODE " +
      " FROM ENFUELINVRESULT " +
      ", ENFUELINVENTARIZATION " +
      ", TKFUELTYPE " +
      ", ENFUELINVRESULTTYPE ";

      whereStr = " ENFUELINVENTARIZATION.CODE = ENFUELINVRESULT.INVENTARIZATIONREFCODE" ; //+
       whereStr = whereStr +" AND TKFUELTYPE.CODE = ENFUELINVRESULT.FUELTYPEREFCODE" ; //+
       whereStr = whereStr +" AND ENFUELINVRESULTTYPE.CODE = ENFUELINVRESULT.TYPEREFCODE" ; //+

       if(aFilterObject != null)
       {
         if(aFilterObject.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENFUELINVRESULT.CODE = ?";
         }
         if(aFilterObject.deltaCount != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENFUELINVRESULT.DELTACOUNT = ?";
         }
          if (aFilterObject.userGen != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(ENFUELINVRESULT.USERGEN) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(ENFUELINVRESULT.USERGEN) LIKE UPPER(?)";
          }
         if(aFilterObject.dateEdit != null) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENFUELINVRESULT.DATEEDIT = ?";
         }
         if(aFilterObject.modify_time != Long.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "  ENFUELINVRESULT.MODIFY_TIME = ?";
         }
         if(aFilterObject.inventarizationRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENFUELINVRESULT.INVENTARIZATIONREFCODE = ? ";
         }
         if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENFUELINVRESULT.FUELTYPEREFCODE = ? ";
         }
         if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENFUELINVRESULT.TYPEREFCODE = ? ";
         }
         if(aFilterObject.fkorderitemRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENFUELINVRESULT.FKORDERITEMREFCODE = ? ";
         }
         if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
             if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
             whereStr = whereStr + "ENFUELINVRESULT.ESTIMATEITEMREFCODE = ? ";
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
         if(aFilterObject.deltaCount != null){
             number++;
             aFilterObject.deltaCount = aFilterObject.deltaCount.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
             statement.setBigDecimal(number,aFilterObject.deltaCount);
         }

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
         if(aFilterObject.dateEdit != null){
             number++;
             statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
         }
         if(aFilterObject.modify_time != Long.MIN_VALUE){
             number++;
             if(aFilterObject.modify_time == Long.MIN_VALUE)
                 statement.setBigDecimal(number,null);
             else
                 statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
         }
        if(aFilterObject.inventarizationRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.inventarizationRef.code);
        }
        if(aFilterObject.fuelTypeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.fuelTypeRef.code);
        }
        if(aFilterObject.typeRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.typeRef.code);
        }
        if(aFilterObject.fkorderitemRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.fkorderitemRef.code);
        }
        if(aFilterObject.estimateItemRef.code != Integer.MIN_VALUE) {
            number++;
            statement.setInt(number,aFilterObject.estimateItemRef.code);
        }
       }

       if(condition.length() > 0 && aBindObjects != null)
        _bindObjectsToPreparedStatement(statement,aBindObjects,number);

       set = statement.executeQuery();
       int i;
       for (i = 0; set.next(); i++) {

         anObject = new ENFuelInvResultShort();

         anObject.code = set.getInt(1);
         if ( set.wasNull() )
             anObject.code = Integer.MIN_VALUE;
         anObject.deltaCount = set.getBigDecimal(2);
         if(anObject.deltaCount != null)
             anObject.deltaCount = anObject.deltaCount.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
         anObject.userGen = set.getString(3);
         anObject.dateEdit = set.getTimestamp(4);

         anObject.inventarizationRefCode = set.getInt(5);
     if(set.wasNull())
       anObject.inventarizationRefCode = Integer.MIN_VALUE;
         anObject.inventarizationRefNumberGen = set.getString(6);
         anObject.inventarizationRefDateGen = set.getTimestamp(7);
         anObject.inventarizationRefMolCode = set.getString(8);
         anObject.inventarizationRefMolName = set.getString(9);
         anObject.inventarizationRefCommentGen = set.getString(10);
         anObject.inventarizationRefUserAdd = set.getString(11);
         anObject.inventarizationRefDateAdd = set.getTimestamp(12);
         anObject.inventarizationRefUserGen = set.getString(13);
         anObject.inventarizationRefDateEdit = set.getTimestamp(14);
         anObject.fuelTypeRefCode = set.getInt(15);
     if(set.wasNull())
       anObject.fuelTypeRefCode = Integer.MIN_VALUE;
         anObject.fuelTypeRefName = set.getString(16);
         anObject.typeRefCode = set.getInt(17);
     if(set.wasNull())
       anObject.typeRefCode = Integer.MIN_VALUE;
         anObject.typeRefName = set.getString(18);
         anObject.fkorderitemRefCode = set.getInt(19);
     if(set.wasNull())
       anObject.fkorderitemRefCode = Integer.MIN_VALUE;
         anObject.estimateItemRefCode = set.getInt(20);

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

} // end of ENFuelInvResultDAO
