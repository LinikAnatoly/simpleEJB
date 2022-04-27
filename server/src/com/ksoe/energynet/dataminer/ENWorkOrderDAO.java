
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

import com.ksoe.energynet.dataminer.generated.ENWorkOrderDAOGen;
import com.ksoe.energynet.valueobject.ENWorkOrder;
import com.ksoe.energynet.valueobject.brief.ENWorkOrderShort;
import com.ksoe.energynet.valueobject.lists.ENWorkOrderShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENWorkOrder;
  *
  */

public class ENWorkOrderDAO extends ENWorkOrderDAOGen {

  public ENWorkOrderDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENWorkOrderDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public int _collectAutoIncrementNumber()
          throws PersistenceException {

      SequenceKey hashKey = new SequenceKey("ENWORKORDER", "NUMBERINT");
      Integer nextSeqValue = null;
      SequenceValue sequenceValue;
      synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
          if (sequenceValue == null) {
              sequenceValue = getNewSequenceValue("ENWORKORDER", "NUMBERINT");
              _sequenceTable.put(hashKey, sequenceValue);
          }
          if (!sequenceValue.isNextValueAvailable()) {
              sequenceValue = getNewSequenceValue("ENWORKORDER", "NUMBERINT");
              _sequenceTable.put(hashKey, sequenceValue);
          }
      }

      nextSeqValue = sequenceValue.getNextValue();
      if (nextSeqValue == null) {
          throw new PersistenceException(
                  "Can't obtain auto increment value from: ENWORKORDER");
      } else {

          return nextSeqValue.intValue();
      }
  }


  @Override
public ENWorkOrderShortList getScrollableFilteredList(ENWorkOrder aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENWorkOrderShortList result = new ENWorkOrderShortList();
    ENWorkOrderShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENWORKORDER.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENWORKORDER.CODE"+
     ",ENWORKORDER.WORKORDERNUMBER"+
     ",ENWORKORDER.DATEGEN"+
     ",ENWORKORDER.FINMOLNAME"+
     ",ENWORKORDER.FINMECHANICNAME"+
     ",ENWORKORDER.USERGEN"+
     ",ENWORKORDER.DATEEDIT"+

      ", ENDEPARTMENT.CODE " +
      ", ENDEPARTMENT.SHORTNAME " +
      ", ENDEPARTMENT.DATESTART " +
      ", ENDEPARTMENT.DATEFINAL " +
      ", ENWORKORDERSTATUS.CODE " +
      ", ENWORKORDERSTATUS.NAME " +

    ", ENWORKORDER.FINMOLCODE " +
     ", ENWORKORDER.FINMECHANICCODE " +
    ", (select qq.plancode from enworkorder2enplanwork qq where qq.workordercode = ENWORKORDER.CODE )" +
     " FROM ENWORKORDER " +
     ", ENDEPARTMENT " +
     ", ENWORKORDERSTATUS " +
     //" WHERE "
    "";
     whereStr = " ENDEPARTMENT.CODE = ENWORKORDER.DEPARTMENTCODE" ; //+
      whereStr = whereStr +" AND ENWORKORDERSTATUS.CODE = ENWORKORDER.STATUSWORKORDERCODE" ; //+
        //selectStr = selectStr + " ${s} ENWORKORDER.CODE IN ( SELECT ENWORKORDER.CODE FROM ENWORKORDER ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDER.CODE = ?";
        }
         if (aFilterObject.workOrderNumber != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.workOrderNumber.indexOf('*',0) < 0 && aFilterObject.workOrderNumber.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENWORKORDER.WORKORDERNUMBER) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENWORKORDER.WORKORDERNUMBER) LIKE UPPER(?)";
         }
        if(aFilterObject.numberInt != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDER.NUMBERINT = ?";
        }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDER.DATEGEN = ?";
        }
         if (aFilterObject.commentGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.commentGen.indexOf('*',0) < 0 && aFilterObject.commentGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENWORKORDER.COMMENTGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENWORKORDER.COMMENTGEN) LIKE UPPER(?)";
         }
         if (aFilterObject.finMolCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finMolCode.indexOf('*',0) < 0 && aFilterObject.finMolCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENWORKORDER.FINMOLCODE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENWORKORDER.FINMOLCODE) LIKE UPPER(?)";
         }
         if (aFilterObject.finMolName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finMolName.indexOf('*',0) < 0 && aFilterObject.finMolName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENWORKORDER.FINMOLNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENWORKORDER.FINMOLNAME) LIKE UPPER(?)";
         }
         if (aFilterObject.finMechanicCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finMechanicCode.indexOf('*',0) < 0 && aFilterObject.finMechanicCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENWORKORDER.FINMECHANICCODE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENWORKORDER.FINMECHANICCODE) LIKE UPPER(?)";
         }
         if (aFilterObject.finMechanicName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finMechanicName.indexOf('*',0) < 0 && aFilterObject.finMechanicName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENWORKORDER.FINMECHANICNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENWORKORDER.FINMECHANICNAME) LIKE UPPER(?)";
         }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENWORKORDER.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENWORKORDER.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDER.DATEEDIT = ?";
        }

        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENWORKORDER.MODIFY_TIME = ?";
        }
        if(aFilterObject.department.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENWORKORDER.DEPARTMENTCODE = ? ";
        }
        if(aFilterObject.statusWorkOrder.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENWORKORDER.STATUSWORKORDERCODE = ? ";
        }
        if (aFilterObject.defectShortDesc != null) {
            if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            if (aFilterObject.defectShortDesc.indexOf('*',0) < 0 && aFilterObject.defectShortDesc.indexOf('?',0) < 0)
                whereStr = whereStr + "  UPPER(ENWORKORDER.DEFECTSHORTDESC) = UPPER(?)";
            else
                whereStr = whereStr + " UPPER(ENWORKORDER.DEFECTSHORTDESC) LIKE UPPER(?)";
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

           if(aFilterObject.workOrderNumber != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.workOrderNumber);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.numberInt != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.numberInt);
         }
        if(aFilterObject.dateGen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
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

           if(aFilterObject.finMolCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finMolCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.finMolName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finMolName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.finMechanicCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finMechanicCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.finMechanicName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finMechanicName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
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
            statement.setDate(number,new java.sql.Date(aFilterObject.dateEdit.getTime()));
        }

        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.department.code);
       }
       if(aFilterObject.statusWorkOrder.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.statusWorkOrder.code);
       }
       if(aFilterObject.defectShortDesc != null){
           number++;
           StringBuffer likeStr = new StringBuffer();
           likeStr.append(aFilterObject.defectShortDesc);
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

        anObject = new ENWorkOrderShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.workOrderNumber = set.getString(2);
        anObject.dateGen = set.getDate(3);
        anObject.finMolName = set.getString(4);
        anObject.finMechanicName = set.getString(5);
        anObject.userGen = set.getString(6);
        anObject.dateEdit = set.getDate(7);


        anObject.departmentCode = set.getInt(8);

        anObject.departmentShortName = set.getString(9);

        anObject.departmentDateStart = set.getDate(10);

        anObject.departmentDateFinal = set.getDate(11);

        anObject.statusWorkOrderCode = set.getInt(12);

        anObject.statusWorkOrderName = set.getString(13);

        anObject.finMolCode = set.getString(14);

        anObject.finMechanicCode = set.getString(15);

        anObject.planRefCode = set.getInt(16);
        if ( set.wasNull() )
            anObject.planRefCode = Integer.MIN_VALUE;

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

  public boolean existsNOSEGR(int anObjectCode) throws PersistenceException
  {
   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet  set = null;

   if(anObjectCode == Integer.MIN_VALUE)
    return false;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr =

   "SELECT  ENWORKORDER.CODE FROM  ENWORKORDER WHERE  ENWORKORDER.CODE = ?";

   try
    {
     statement = connection.prepareStatement(selectStr);
     statement.setInt(1,anObjectCode);
     set = statement.executeQuery();
     if(set.next())
      return true;
     return false;
    }
   catch(SQLException e)
    {
     System.out.println(e.getMessage()+"\nstatement - "+selectStr);
     EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
     return false;
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


  public ENWorkOrder getObjectNOSEGR(int uid) throws PersistenceException
  {
   ENWorkOrder result = new ENWorkOrder();
   result.code = uid;
   loadObjectNOSEGR(result);
   if(result.code == Integer.MIN_VALUE)
    return null;
   return result;
  }


 public void loadObjectNOSEGR(ENWorkOrder anObject) throws PersistenceException
  {
   String     selectStr;
   Connection connection = getConnection();
   PreparedStatement statement = null;
   ResultSet set = null;

   if(getUserProfile() == null)
    throw new PersistenceException("Internal Error (User Profile Is Undefined)");

   selectStr =
   "SELECT  ENWORKORDER.CODE, ENWORKORDER.WORKORDERNUMBER, ENWORKORDER.NUMBERINT, ENWORKORDER.DATEGEN, ENWORKORDER.COMMENTGEN, ENWORKORDER.DEFECTSHORTDESC, ENWORKORDER.FINMOLCODE, ENWORKORDER.FINMOLNAME, ENWORKORDER.FINMECHANICCODE, ENWORKORDER.FINMECHANICNAME, ENWORKORDER.USERGEN, ENWORKORDER.DATEEDIT, ENWORKORDER.MODIFY_TIME, ENWORKORDER.DEPARTMENTCODE, ENWORKORDER.STATUSWORKORDERCODE "
   +" FROM ENWORKORDER WHERE ENWORKORDER.CODE = ?";

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
       anObject.workOrderNumber = set.getString(2);
       anObject.numberInt = set.getInt(3);
       if ( set.wasNull() )
          anObject.numberInt = Integer.MIN_VALUE;
       anObject.dateGen = set.getDate(4);
       anObject.commentGen = set.getString(5);
       anObject.defectShortDesc = set.getString(6);
       anObject.finMolCode = set.getString(7);
       anObject.finMolName = set.getString(8);
       anObject.finMechanicCode = set.getString(9);
       anObject.finMechanicName = set.getString(10);
       anObject.userGen = set.getString(11);
       anObject.dateEdit = set.getDate(12);

       anObject.modify_time = set.getLong(13);
       if(set.wasNull())
        anObject.modify_time = Long.MIN_VALUE;
       anObject.department.code = set.getInt(14);
       if ( set.wasNull() )
           anObject.department.code = Integer.MIN_VALUE;
       anObject.statusWorkOrder.code = set.getInt(15);
       if ( set.wasNull() )
           anObject.statusWorkOrder.code = Integer.MIN_VALUE;
       if(anObject.department.code != Integer.MIN_VALUE)
       {
          anObject.setDepartment(
       new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getObject(anObject.department.code));
   }
       if(anObject.statusWorkOrder.code != Integer.MIN_VALUE)
       {
          anObject.setStatusWorkOrder(
       new com.ksoe.energynet.dataminer.generated.ENWorkOrderStatusDAOGen(connection,getUserProfile()).getObject(anObject.statusWorkOrder.code));
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



} // end of ENWorkOrderDAO

