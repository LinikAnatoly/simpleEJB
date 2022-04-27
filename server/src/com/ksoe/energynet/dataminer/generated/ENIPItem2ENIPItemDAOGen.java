
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer.generated;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;

import java.util.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Connection;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.energynet.valueobject.ENIPItem2ENIPItem;
import com.ksoe.energynet.valueobject.filter.ENIPItem2ENIPItemFilter;
import com.ksoe.energynet.valueobject.brief.ENIPItem2ENIPItemShort;
import com.ksoe.energynet.valueobject.lists.ENIPItem2ENIPItemShortList;


/**
 * DAO Object for ENIPItem2ENIPItem;
 *
 */

public class ENIPItem2ENIPItemDAOGen extends GenericDataMiner {

   public ENIPItem2ENIPItemDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENIPItem2ENIPItemDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   private boolean isEqual(ENIPItem2ENIPItem inObject) throws PersistenceException
   {
      ENIPItem2ENIPItem obj = new ENIPItem2ENIPItem();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.userAdd != obj.userAdd){
       return false;
     }

     if ( ! inObject.dateAdd.equals(obj.dateAdd)){
       return false;
     }

     if (inObject.userGen != obj.userGen){
       return false;
     }

     if ( ! inObject.dateEdit.equals(obj.dateEdit)){
       return false;
     }
     if (inObject.ipItemInRef.code != obj.ipItemInRef.code){
        return false;
     }
     if (inObject.ipItemOutRef.code != obj.ipItemOutRef.code){
        return false;
     }
      return true;
   }

   public int add(ENIPItem2ENIPItem anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENIPItem2ENIPItem anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

  anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENIPITEM2ENIPITEM (CODE,MODIFY_TIME,USERADD,DATEADD,USERGEN,DATEEDIT,IPITEMINREFCODE,IPITEMOUTREFCODE) VALUES (?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(2,null);
      else
        statement.setBigDecimal(2,new java.math.BigDecimal(anObject.modify_time));
      statement.setString(3,anObject.userAdd);
      if (anObject.dateAdd == null)
        statement.setTimestamp(4,null);
      else
        statement.setTimestamp(4,new java.sql.Timestamp(anObject.dateAdd.getTime()));
      statement.setString(5,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(6,null);
      else
        statement.setTimestamp(6,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.ipItemInRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENIPItemDAOGen(connection,getUserProfile()).exists(anObject.ipItemInRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENIPItem2ENIPItem.ipItemInRef.code%} = {%"+anObject.ipItemInRef.code+"%}");
        statement.setInt(7,anObject.ipItemInRef.code);
      }
      else
        statement.setNull(7,java.sql.Types.INTEGER);
      if (anObject.ipItemOutRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENIPItemDAOGen(connection,getUserProfile()).exists(anObject.ipItemOutRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENIPItem2ENIPItem.ipItemOutRef.code%} = {%"+anObject.ipItemOutRef.code+"%}");
        statement.setInt(8,anObject.ipItemOutRef.code);
      }
      else
        statement.setNull(8,java.sql.Types.INTEGER);

      statement.execute();
      return anObject.code;
     }
    catch(SQLException e)
     {
           _sequenceTable.clear();
           throw new SystemException(e.getMessage(), e);
      //return Integer.MIN_VALUE;
     }
        catch(Exception e)
     {
      _sequenceTable.clear();
      throw new PersistenceException("Error in method {%ENIPItem2ENIPItemDAOGen.add%}",e);
     }
        finally
     {
      try {if (statement != null) statement.close();} catch (SQLException e) {}
      if(connection != super.getConnection())
       {
        try{connection.close();} catch(SQLException e){}
       }
     }
   }

   public void save(ENIPItem2ENIPItem anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENIPItem2ENIPItem anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENIPItem2ENIPItem oldObject = new ENIPItem2ENIPItem();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENIPItem2ENIPItem.modify_time_Field+" FROM  ENIPITEM2ENIPITEM WHERE CODE = ?";

      ResultSet set = null;
      try
       {
        statement = connection.prepareStatement(oldObjectSelectStr);
        statement.setInt(1,oldObject.code);
        set = statement.executeQuery();
        if(!set.next())
           throw new PersistenceException("Can't get old object.");
       oldObject.modify_time = set.getLong(1);
        if(set.wasNull())
         oldObject.modify_time = Long.MIN_VALUE;
       }
      catch(SQLException e)
       {
        System.out.println(e.getMessage()+"\nstatement - "+oldObjectSelectStr);
        throw new SystemException(e.getMessage(), e);
       }
      finally
       {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
       }

      if(oldObject.modify_time != anObject.modify_time)
       throw new PersistenceException("Can't update object (optimistic locking).");

      anObject.modify_time = System.currentTimeMillis();
      String selectStr;

      Vector fields = null;
      if(anAttributes != null)
       {
        String fieldNameStr;
        fields = new Vector();
        for(int attrIndex = 0;attrIndex < anAttributes.length;attrIndex++)
         {
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("MODIFY_TIME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("USERADD") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATEADD") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("USERGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATEEDIT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("IPITEMINREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("IPITEMOUTREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
         }
       if(fields.size() == 0)
         return;
       }
      if(fields == null)
       {
        selectStr =
        "UPDATE ENIPITEM2ENIPITEM SET  MODIFY_TIME = ? , USERADD = ? , DATEADD = ? , USERGEN = ? , DATEEDIT = ? , IPITEMINREFCODE = ? , IPITEMOUTREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENIPITEM2ENIPITEM SET ";
        for(int fldIndex = 0;fldIndex < fields.size();fldIndex++)
         {
          selectStr+=(String)fields.get(fldIndex);
          if(fldIndex > 0)
           selectStr+=",";
         }
        selectStr += " WHERE CODE = ?";
       }

      statement = null;

      try
       {
        statement = connection.prepareStatement(selectStr);
        if(fields == null)
         {
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(1,null);
      else
        statement.setBigDecimal(1,new java.math.BigDecimal(anObject.modify_time));
      statement.setString(2,anObject.userAdd);
      if (anObject.dateAdd == null)
        statement.setTimestamp(3,null);
      else
        statement.setTimestamp(3,new java.sql.Timestamp(anObject.dateAdd.getTime()));
      statement.setString(4,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(5,null);
      else
        statement.setTimestamp(5,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.ipItemInRef.code != Integer.MIN_VALUE)
        statement.setInt(6,anObject.ipItemInRef.code);
      else
        statement.setNull(6,java.sql.Types.INTEGER);
      if (anObject.ipItemOutRef.code != Integer.MIN_VALUE)
        statement.setInt(7,anObject.ipItemOutRef.code);
      else
        statement.setNull(7,java.sql.Types.INTEGER);
          statement.setInt(8,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.modify_time == Long.MIN_VALUE)
                    statement.setBigDecimal(i+1,null);
                else
                     statement.setBigDecimal(i+1,new java.math.BigDecimal(anObject.modify_time));
                continue;
             }
            if("USERADD".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.userAdd);
                continue;
             }
            if("DATEADD".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dateAdd == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateAdd.getTime()));
                continue;
             }
            if("USERGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.userGen);
                continue;
             }
            if("DATEEDIT".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dateEdit == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateEdit.getTime()));
                continue;
             }
            if("IPITEMINREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.ipItemInRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.ipItemInRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("IPITEMOUTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.ipItemOutRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.ipItemOutRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            }
         statement.setInt(fields.size(),anObject.code);
         }

        statement.execute();
       }
      catch(SQLException e)
       {
        System.out.println(e.getMessage()+"\nstatement - "+selectStr);
        throw new SystemException(e.getMessage(), e);
       }
      finally
       {
        try {if (statement != null) statement.close();} catch (SQLException e) {}
       }
     }
    finally
     {
      if(connection != super.getConnection())
       {
        try{connection.close();} catch(SQLException e){}
       }
     }

   } // end of save(ENIPItem2ENIPItem anObject,String[] anAttributes)


 public ENIPItem2ENIPItemShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENIPItem2ENIPItem filterObject = new ENIPItem2ENIPItem();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENIPItem2ENIPItemShort)list.get(0);
   return null;
  }

  public ENIPItem2ENIPItemShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENIPItem2ENIPItemShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENIPItem2ENIPItemShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENIPItem2ENIPItemShortList getFilteredList(ENIPItem2ENIPItem filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENIPItem2ENIPItemShortList getScrollableFilteredList(ENIPItem2ENIPItem aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENIPItem2ENIPItemShortList getScrollableFilteredList(ENIPItem2ENIPItem aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENIPItem2ENIPItemShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENIPItem2ENIPItemShortList getScrollableFilteredList(ENIPItem2ENIPItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENIPItem2ENIPItemShortList getScrollableFilteredList(ENIPItem2ENIPItemFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENIPItem2ENIPItemShortList getScrollableFilteredList(ENIPItem2ENIPItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENIPItem2ENIPItemShortList getScrollableFilteredList(ENIPItem2ENIPItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENIPItem2ENIPItemShortList result = new ENIPItem2ENIPItemShortList();
    ENIPItem2ENIPItemShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENIPITEM2ENIPITEM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENIPITEM2ENIPITEM.CODE"+
     ",ENIPITEM2ENIPITEM.USERADD"+
     ",ENIPITEM2ENIPITEM.DATEADD"+
     ",ENIPITEM2ENIPITEM.USERGEN"+
     ",ENIPITEM2ENIPITEM.DATEEDIT"+

      ", ENIPITEM.CODE " +
      ", ENIPITEM.NAME " +
      ", ENIPITEM.BUHNAME " +
      ", ENIPITEM.ITEMNUMBER " +
      ", ENIPITEM.INVNUMBER " +
      ", ENIPITEM.ISPROJECTDOCUMENT " +
      ", ENIPITEM.FINANCING " +
      ", ENIPITEM.COMMENTGEN " +
      ", ENIPITEM.COUNTGEN " +
      ", ENIPITEM.PRICE " +
      ", ENIPITEM.SUMGEN " +
      ", ENIPITEM.QUARTER1COUNT " +
      ", ENIPITEM.QUARTER1SUM " +
      ", ENIPITEM.QUARTER2COUNT " +
      ", ENIPITEM.QUARTER2SUM " +
      ", ENIPITEM.QUARTER3COUNT " +
      ", ENIPITEM.QUARTER3SUM " +
      ", ENIPITEM.QUARTER4COUNT " +
      ", ENIPITEM.QUARTER4SUM " +
      ", ENIPITEM.COUNTGENINSIDE " +
      ", ENIPITEM.PRICEINSIDE " +
      ", ENIPITEM.SUMGENINSIDE " +
      ", ENIPITEM.QUARTER1COUNTINSIDE " +
      ", ENIPITEM.QUARTER1SUMINSIDE " +
      ", ENIPITEM.QUARTER2COUNTINSIDE " +
      ", ENIPITEM.QUARTER2SUMINSIDE " +
      ", ENIPITEM.QUARTER3COUNTINSIDE " +
      ", ENIPITEM.QUARTER3SUMINSIDE " +
      ", ENIPITEM.QUARTER4COUNTINSIDE " +
      ", ENIPITEM.QUARTER4SUMINSIDE " +
      ", ENIPITEM.USERADD " +
      ", ENIPITEM.DATEADD " +
      ", ENIPITEM.USERGEN " +
      ", ENIPITEM.DATEEDIT " +
      ", ENIPITEM.CODE " +
      ", ENIPITEM.NAME " +
      ", ENIPITEM.BUHNAME " +
      ", ENIPITEM.ITEMNUMBER " +
      ", ENIPITEM.INVNUMBER " +
      ", ENIPITEM.ISPROJECTDOCUMENT " +
      ", ENIPITEM.FINANCING " +
      ", ENIPITEM.COMMENTGEN " +
      ", ENIPITEM.COUNTGEN " +
      ", ENIPITEM.PRICE " +
      ", ENIPITEM.SUMGEN " +
      ", ENIPITEM.QUARTER1COUNT " +
      ", ENIPITEM.QUARTER1SUM " +
      ", ENIPITEM.QUARTER2COUNT " +
      ", ENIPITEM.QUARTER2SUM " +
      ", ENIPITEM.QUARTER3COUNT " +
      ", ENIPITEM.QUARTER3SUM " +
      ", ENIPITEM.QUARTER4COUNT " +
      ", ENIPITEM.QUARTER4SUM " +
      ", ENIPITEM.COUNTGENINSIDE " +
      ", ENIPITEM.PRICEINSIDE " +
      ", ENIPITEM.SUMGENINSIDE " +
      ", ENIPITEM.QUARTER1COUNTINSIDE " +
      ", ENIPITEM.QUARTER1SUMINSIDE " +
      ", ENIPITEM.QUARTER2COUNTINSIDE " +
      ", ENIPITEM.QUARTER2SUMINSIDE " +
      ", ENIPITEM.QUARTER3COUNTINSIDE " +
      ", ENIPITEM.QUARTER3SUMINSIDE " +
      ", ENIPITEM.QUARTER4COUNTINSIDE " +
      ", ENIPITEM.QUARTER4SUMINSIDE " +
      ", ENIPITEM.USERADD " +
      ", ENIPITEM.DATEADD " +
      ", ENIPITEM.USERGEN " +
      ", ENIPITEM.DATEEDIT " +
     " FROM ENIPITEM2ENIPITEM " +
     ", ENIPITEM " +
     ", ENIPITEM " +
     //" WHERE "
  "";
     whereStr = " ENIPITEM.CODE = ENIPITEM2ENIPITEM.IPITEMINREFCODE" ; //+
      whereStr = whereStr +" AND ENIPITEM.CODE = ENIPITEM2ENIPITEM.IPITEMOUTREFCODE" ; //+
    //selectStr = selectStr + " ${s} ENIPITEM2ENIPITEM.CODE IN ( SELECT ENIPITEM2ENIPITEM.CODE FROM ENIPITEM2ENIPITEM ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENIPITEM2ENIPITEM.CODE = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENIPITEM2ENIPITEM.MODIFY_TIME = ?";
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENIPITEM2ENIPITEM.USERADD) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENIPITEM2ENIPITEM.USERADD) LIKE UPPER(?)";
         }
        if(aFilterObject.dateAdd != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENIPITEM2ENIPITEM.DATEADD = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENIPITEM2ENIPITEM.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENIPITEM2ENIPITEM.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENIPITEM2ENIPITEM.DATEEDIT = ?";
        }
        if(aFilterObject.ipItemInRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENIPITEM2ENIPITEM.IPITEMINREFCODE = ? ";
        }
        if(aFilterObject.ipItemOutRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENIPITEM2ENIPITEM.IPITEMOUTREFCODE = ? ";
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
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }

           if(aFilterObject.userAdd != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.userAdd);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.dateAdd != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateAdd.getTime()));
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
       if(aFilterObject.ipItemInRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.ipItemInRef.code);
       }
       if(aFilterObject.ipItemOutRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.ipItemOutRef.code);
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

        anObject = new ENIPItem2ENIPItemShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.userAdd = set.getString(2);
        anObject.dateAdd = set.getTimestamp(3);
        anObject.userGen = set.getString(4);
        anObject.dateEdit = set.getTimestamp(5);

        anObject.ipItemInRefCode = set.getInt(6);
    if(set.wasNull())
      anObject.ipItemInRefCode = Integer.MIN_VALUE;
        anObject.ipItemInRefName = set.getString(7);
        anObject.ipItemInRefBuhName = set.getString(8);
        anObject.ipItemInRefItemNumber = set.getString(9);
        anObject.ipItemInRefInvNumber = set.getString(10);
        anObject.ipItemInRefIsProjectDocument = set.getInt(11);
    if(set.wasNull())
      anObject.ipItemInRefIsProjectDocument = Integer.MIN_VALUE;
        anObject.ipItemInRefFinancing = set.getString(12);
        anObject.ipItemInRefCommentGen = set.getString(13);
        anObject.ipItemInRefCountGen = set.getBigDecimal(14);
        if(anObject.ipItemInRefCountGen != null)
          anObject.ipItemInRefCountGen = anObject.ipItemInRefCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemInRefPrice = set.getBigDecimal(15);
        if(anObject.ipItemInRefPrice != null)
          anObject.ipItemInRefPrice = anObject.ipItemInRefPrice.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemInRefSumGen = set.getBigDecimal(16);
        if(anObject.ipItemInRefSumGen != null)
          anObject.ipItemInRefSumGen = anObject.ipItemInRefSumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemInRefQuarter1count = set.getBigDecimal(17);
        if(anObject.ipItemInRefQuarter1count != null)
          anObject.ipItemInRefQuarter1count = anObject.ipItemInRefQuarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemInRefQuarter1sum = set.getBigDecimal(18);
        if(anObject.ipItemInRefQuarter1sum != null)
          anObject.ipItemInRefQuarter1sum = anObject.ipItemInRefQuarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemInRefQuarter2count = set.getBigDecimal(19);
        if(anObject.ipItemInRefQuarter2count != null)
          anObject.ipItemInRefQuarter2count = anObject.ipItemInRefQuarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemInRefQuarter2sum = set.getBigDecimal(20);
        if(anObject.ipItemInRefQuarter2sum != null)
          anObject.ipItemInRefQuarter2sum = anObject.ipItemInRefQuarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemInRefQuarter3count = set.getBigDecimal(21);
        if(anObject.ipItemInRefQuarter3count != null)
          anObject.ipItemInRefQuarter3count = anObject.ipItemInRefQuarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemInRefQuarter3sum = set.getBigDecimal(22);
        if(anObject.ipItemInRefQuarter3sum != null)
          anObject.ipItemInRefQuarter3sum = anObject.ipItemInRefQuarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemInRefQuarter4count = set.getBigDecimal(23);
        if(anObject.ipItemInRefQuarter4count != null)
          anObject.ipItemInRefQuarter4count = anObject.ipItemInRefQuarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemInRefQuarter4sum = set.getBigDecimal(24);
        if(anObject.ipItemInRefQuarter4sum != null)
          anObject.ipItemInRefQuarter4sum = anObject.ipItemInRefQuarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemInRefCountGenInside = set.getBigDecimal(25);
        if(anObject.ipItemInRefCountGenInside != null)
          anObject.ipItemInRefCountGenInside = anObject.ipItemInRefCountGenInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemInRefPriceInside = set.getBigDecimal(26);
        if(anObject.ipItemInRefPriceInside != null)
          anObject.ipItemInRefPriceInside = anObject.ipItemInRefPriceInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemInRefSumGenInside = set.getBigDecimal(27);
        if(anObject.ipItemInRefSumGenInside != null)
          anObject.ipItemInRefSumGenInside = anObject.ipItemInRefSumGenInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemInRefQuarter1countInside = set.getBigDecimal(28);
        if(anObject.ipItemInRefQuarter1countInside != null)
          anObject.ipItemInRefQuarter1countInside = anObject.ipItemInRefQuarter1countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemInRefQuarter1sumInside = set.getBigDecimal(29);
        if(anObject.ipItemInRefQuarter1sumInside != null)
          anObject.ipItemInRefQuarter1sumInside = anObject.ipItemInRefQuarter1sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemInRefQuarter2countInside = set.getBigDecimal(30);
        if(anObject.ipItemInRefQuarter2countInside != null)
          anObject.ipItemInRefQuarter2countInside = anObject.ipItemInRefQuarter2countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemInRefQuarter2sumInside = set.getBigDecimal(31);
        if(anObject.ipItemInRefQuarter2sumInside != null)
          anObject.ipItemInRefQuarter2sumInside = anObject.ipItemInRefQuarter2sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemInRefQuarter3countInside = set.getBigDecimal(32);
        if(anObject.ipItemInRefQuarter3countInside != null)
          anObject.ipItemInRefQuarter3countInside = anObject.ipItemInRefQuarter3countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemInRefQuarter3sumInside = set.getBigDecimal(33);
        if(anObject.ipItemInRefQuarter3sumInside != null)
          anObject.ipItemInRefQuarter3sumInside = anObject.ipItemInRefQuarter3sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemInRefQuarter4countInside = set.getBigDecimal(34);
        if(anObject.ipItemInRefQuarter4countInside != null)
          anObject.ipItemInRefQuarter4countInside = anObject.ipItemInRefQuarter4countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemInRefQuarter4sumInside = set.getBigDecimal(35);
        if(anObject.ipItemInRefQuarter4sumInside != null)
          anObject.ipItemInRefQuarter4sumInside = anObject.ipItemInRefQuarter4sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemInRefUserAdd = set.getString(36);
        anObject.ipItemInRefDateAdd = set.getTimestamp(37);
        anObject.ipItemInRefUserGen = set.getString(38);
        anObject.ipItemInRefDateEdit = set.getTimestamp(39);
        anObject.ipItemOutRefCode = set.getInt(40);
    if(set.wasNull())
      anObject.ipItemOutRefCode = Integer.MIN_VALUE;
        anObject.ipItemOutRefName = set.getString(41);
        anObject.ipItemOutRefBuhName = set.getString(42);
        anObject.ipItemOutRefItemNumber = set.getString(43);
        anObject.ipItemOutRefInvNumber = set.getString(44);
        anObject.ipItemOutRefIsProjectDocument = set.getInt(45);
    if(set.wasNull())
      anObject.ipItemOutRefIsProjectDocument = Integer.MIN_VALUE;
        anObject.ipItemOutRefFinancing = set.getString(46);
        anObject.ipItemOutRefCommentGen = set.getString(47);
        anObject.ipItemOutRefCountGen = set.getBigDecimal(48);
        if(anObject.ipItemOutRefCountGen != null)
          anObject.ipItemOutRefCountGen = anObject.ipItemOutRefCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemOutRefPrice = set.getBigDecimal(49);
        if(anObject.ipItemOutRefPrice != null)
          anObject.ipItemOutRefPrice = anObject.ipItemOutRefPrice.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemOutRefSumGen = set.getBigDecimal(50);
        if(anObject.ipItemOutRefSumGen != null)
          anObject.ipItemOutRefSumGen = anObject.ipItemOutRefSumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemOutRefQuarter1count = set.getBigDecimal(51);
        if(anObject.ipItemOutRefQuarter1count != null)
          anObject.ipItemOutRefQuarter1count = anObject.ipItemOutRefQuarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemOutRefQuarter1sum = set.getBigDecimal(52);
        if(anObject.ipItemOutRefQuarter1sum != null)
          anObject.ipItemOutRefQuarter1sum = anObject.ipItemOutRefQuarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemOutRefQuarter2count = set.getBigDecimal(53);
        if(anObject.ipItemOutRefQuarter2count != null)
          anObject.ipItemOutRefQuarter2count = anObject.ipItemOutRefQuarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemOutRefQuarter2sum = set.getBigDecimal(54);
        if(anObject.ipItemOutRefQuarter2sum != null)
          anObject.ipItemOutRefQuarter2sum = anObject.ipItemOutRefQuarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemOutRefQuarter3count = set.getBigDecimal(55);
        if(anObject.ipItemOutRefQuarter3count != null)
          anObject.ipItemOutRefQuarter3count = anObject.ipItemOutRefQuarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemOutRefQuarter3sum = set.getBigDecimal(56);
        if(anObject.ipItemOutRefQuarter3sum != null)
          anObject.ipItemOutRefQuarter3sum = anObject.ipItemOutRefQuarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemOutRefQuarter4count = set.getBigDecimal(57);
        if(anObject.ipItemOutRefQuarter4count != null)
          anObject.ipItemOutRefQuarter4count = anObject.ipItemOutRefQuarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemOutRefQuarter4sum = set.getBigDecimal(58);
        if(anObject.ipItemOutRefQuarter4sum != null)
          anObject.ipItemOutRefQuarter4sum = anObject.ipItemOutRefQuarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemOutRefCountGenInside = set.getBigDecimal(59);
        if(anObject.ipItemOutRefCountGenInside != null)
          anObject.ipItemOutRefCountGenInside = anObject.ipItemOutRefCountGenInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemOutRefPriceInside = set.getBigDecimal(60);
        if(anObject.ipItemOutRefPriceInside != null)
          anObject.ipItemOutRefPriceInside = anObject.ipItemOutRefPriceInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemOutRefSumGenInside = set.getBigDecimal(61);
        if(anObject.ipItemOutRefSumGenInside != null)
          anObject.ipItemOutRefSumGenInside = anObject.ipItemOutRefSumGenInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemOutRefQuarter1countInside = set.getBigDecimal(62);
        if(anObject.ipItemOutRefQuarter1countInside != null)
          anObject.ipItemOutRefQuarter1countInside = anObject.ipItemOutRefQuarter1countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemOutRefQuarter1sumInside = set.getBigDecimal(63);
        if(anObject.ipItemOutRefQuarter1sumInside != null)
          anObject.ipItemOutRefQuarter1sumInside = anObject.ipItemOutRefQuarter1sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemOutRefQuarter2countInside = set.getBigDecimal(64);
        if(anObject.ipItemOutRefQuarter2countInside != null)
          anObject.ipItemOutRefQuarter2countInside = anObject.ipItemOutRefQuarter2countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemOutRefQuarter2sumInside = set.getBigDecimal(65);
        if(anObject.ipItemOutRefQuarter2sumInside != null)
          anObject.ipItemOutRefQuarter2sumInside = anObject.ipItemOutRefQuarter2sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemOutRefQuarter3countInside = set.getBigDecimal(66);
        if(anObject.ipItemOutRefQuarter3countInside != null)
          anObject.ipItemOutRefQuarter3countInside = anObject.ipItemOutRefQuarter3countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemOutRefQuarter3sumInside = set.getBigDecimal(67);
        if(anObject.ipItemOutRefQuarter3sumInside != null)
          anObject.ipItemOutRefQuarter3sumInside = anObject.ipItemOutRefQuarter3sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemOutRefQuarter4countInside = set.getBigDecimal(68);
        if(anObject.ipItemOutRefQuarter4countInside != null)
          anObject.ipItemOutRefQuarter4countInside = anObject.ipItemOutRefQuarter4countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemOutRefQuarter4sumInside = set.getBigDecimal(69);
        if(anObject.ipItemOutRefQuarter4sumInside != null)
          anObject.ipItemOutRefQuarter4sumInside = anObject.ipItemOutRefQuarter4sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ipItemOutRefUserAdd = set.getString(70);
        anObject.ipItemOutRefDateAdd = set.getTimestamp(71);
        anObject.ipItemOutRefUserGen = set.getString(72);
        anObject.ipItemOutRefDateEdit = set.getTimestamp(73);

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

  public int[] getFilteredCodeArrayOLD(ENIPItem2ENIPItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENIPITEM2ENIPITEM.CODE FROM ENIPITEM2ENIPITEM";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENIPITEM2ENIPITEM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENIPITEM2ENIPITEM.CODE = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENIPITEM2ENIPITEM.MODIFY_TIME = ?";
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENIPITEM2ENIPITEM.USERADD = ?";
             else
                 whereStr = whereStr + "  ENIPITEM2ENIPITEM.USERADD LIKE ?";
         }
        if(aFilterObject.dateAdd != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENIPITEM2ENIPITEM.DATEADD = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENIPITEM2ENIPITEM.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENIPITEM2ENIPITEM.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENIPITEM2ENIPITEM.DATEEDIT = ?";
        }
        if(aFilterObject.ipItemInRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENIPITEM2ENIPITEM.IPITEMINREFCODE = ? ";
        }
        if(aFilterObject.ipItemOutRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENIPITEM2ENIPITEM.IPITEMOUTREFCODE = ? ";
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
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENIPITEM2ENIPITEM.USERADD = ?";
             else
                 whereStr = whereStr + " ENIPITEM2ENIPITEM.USERADD LIKE ?";

           if(aFilterObject.userAdd != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.userAdd);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.dateAdd != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateAdd.getTime()));
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENIPITEM2ENIPITEM.USERGEN = ?";
             else
                 whereStr = whereStr + " ENIPITEM2ENIPITEM.USERGEN LIKE ?";

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
         }
        if(aFilterObject.dateEdit != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
        }
       if(aFilterObject.ipItemInRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.ipItemInRef.code);
       }
       if(aFilterObject.ipItemOutRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.ipItemOutRef.code);
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


    } // end of getFilteredCodeArray

/*********************************/

  public int[] getFilteredCodeArray(ENIPItem2ENIPItemFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENIPItem2ENIPItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENIPITEM2ENIPITEM.CODE FROM ENIPITEM2ENIPITEM";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENIPITEM2ENIPITEM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENIPITEM2ENIPITEM.CODE = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENIPITEM2ENIPITEM.MODIFY_TIME = ?";
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENIPITEM2ENIPITEM.USERADD = ?";
             else
                 whereStr = whereStr + "  ENIPITEM2ENIPITEM.USERADD LIKE ?";
         }
        if(aFilterObject.dateAdd != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENIPITEM2ENIPITEM.DATEADD = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENIPITEM2ENIPITEM.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENIPITEM2ENIPITEM.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENIPITEM2ENIPITEM.DATEEDIT = ?";
        }
        if(aFilterObject.ipItemInRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENIPITEM2ENIPITEM.IPITEMINREFCODE = ? ";
        }
        if(aFilterObject.ipItemOutRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENIPITEM2ENIPITEM.IPITEMOUTREFCODE = ? ";
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
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
         if (aFilterObject.userAdd != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userAdd.indexOf('*',0) < 0 && aFilterObject.userAdd.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENIPITEM2ENIPITEM.USERADD = ?";
             else
                 whereStr = whereStr + " ENIPITEM2ENIPITEM.USERADD LIKE ?";

           if(aFilterObject.userAdd != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.userAdd);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.dateAdd != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateAdd.getTime()));
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENIPITEM2ENIPITEM.USERGEN = ?";
             else
                 whereStr = whereStr + " ENIPITEM2ENIPITEM.USERGEN LIKE ?";

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
         }
        if(aFilterObject.dateEdit != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
        }
       if(aFilterObject.ipItemInRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.ipItemInRef.code);
       }
       if(aFilterObject.ipItemOutRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.ipItemOutRef.code);
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


    } // end of getFilteredCodeArray


   public ENIPItem2ENIPItem getObject(int uid) throws PersistenceException
   {
    ENIPItem2ENIPItem result = new ENIPItem2ENIPItem();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENIPItem2ENIPItem anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENIPITEM2ENIPITEM.CODE, ENIPITEM2ENIPITEM.MODIFY_TIME, ENIPITEM2ENIPITEM.USERADD, ENIPITEM2ENIPITEM.DATEADD, ENIPITEM2ENIPITEM.USERGEN, ENIPITEM2ENIPITEM.DATEEDIT, ENIPITEM2ENIPITEM.IPITEMINREFCODE, ENIPITEM2ENIPITEM.IPITEMOUTREFCODE "
    +" FROM ENIPITEM2ENIPITEM WHERE ENIPITEM2ENIPITEM.CODE = ?";

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
        anObject.modify_time = set.getLong(2);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.userAdd = set.getString(3);
        anObject.dateAdd = set.getTimestamp(4);
        anObject.userGen = set.getString(5);
        anObject.dateEdit = set.getTimestamp(6);
        anObject.ipItemInRef.code = set.getInt(7);
        if ( set.wasNull() )
            anObject.ipItemInRef.code = Integer.MIN_VALUE;
        anObject.ipItemOutRef.code = set.getInt(8);
        if ( set.wasNull() )
            anObject.ipItemOutRef.code = Integer.MIN_VALUE;
        if(anObject.ipItemInRef.code != Integer.MIN_VALUE)
        {
           anObject.setIpItemInRef(
      new com.ksoe.energynet.dataminer.generated.ENIPItemDAOGen(connection,getUserProfile()).getRef(anObject.ipItemInRef.code));
    }
        if(anObject.ipItemOutRef.code != Integer.MIN_VALUE)
        {
           anObject.setIpItemOutRef(
      new com.ksoe.energynet.dataminer.generated.ENIPItemDAOGen(connection,getUserProfile()).getRef(anObject.ipItemOutRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENIPItem2ENIPItemRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENIPItem2ENIPItemRef ref = new com.ksoe.energynet.valueobject.references.ENIPItem2ENIPItemRef();
    if(exists(anObjectCode))
     ref.code = anObjectCode;
    else
     ref.code = Integer.MIN_VALUE;
    return ref;
   }


   public void remove(int uid) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();

    selectStr = "DELETE FROM  ENIPITEM2ENIPITEM WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENIPItem2ENIPItem object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENIPItem2ENIPItem.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENIPItem2ENIPItem.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENIPItem2ENIPItem.remove%} access denied");

    PreparedStatement statement = null;
    try
     {
      statement = connection.prepareStatement(selectStr);
      statement.setInt(1,uid);
      statement.execute();
     }
    catch(SQLException e)
     {
      System.out.println(e.getMessage()+"\nstatement - "+selectStr);
      throw new SystemException(e.getMessage(), e);
     }
    finally
     {
      try {if (statement != null) statement.close();} catch (SQLException e) {}
      if(connection != super.getConnection())
       {
        try{connection.close();} catch(SQLException e){}
       }
     }
   }

   public boolean exists(int anObjectCode) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;

    if(anObjectCode == Integer.MIN_VALUE)
     return false;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENIPItem2ENIPItem.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENIPItem2ENIPItem.getObject%} access denied");

    selectStr =

    "SELECT  ENIPITEM2ENIPITEM.CODE FROM  ENIPITEM2ENIPITEM WHERE  ENIPITEM2ENIPITEM.CODE = ?";
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
      throw new SystemException(e.getMessage(), e);
      //return false;
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

  public static String processCondition(String aCondition)
   {
    if(aCondition == null || aCondition.length() == 0)
     return "";

    StringBuffer condition = new StringBuffer(aCondition);
    _checkConditionToken(condition,";"," ");
    _checkConditionToken(condition,"--"," ");
    _checkConditionToken(condition,"\r"," ");
    _checkConditionToken(condition,"\n"," ");
    _checkConditionToken(condition,"||"," OR ");
    _checkConditionToken(condition,"&&"," AND ");
    _checkConditionToken(condition,"==","=");
    _checkConditionToken(condition,"!=","<>");
    _checkConditionToken(condition,"code","ENIPITEM2ENIPITEM.CODE");
    _checkConditionToken(condition,"modify_time","ENIPITEM2ENIPITEM.MODIFY_TIME");
    _checkConditionToken(condition,"useradd","ENIPITEM2ENIPITEM.USERADD");
    _checkConditionToken(condition,"dateadd","ENIPITEM2ENIPITEM.DATEADD");
    _checkConditionToken(condition,"usergen","ENIPITEM2ENIPITEM.USERGEN");
    _checkConditionToken(condition,"dateedit","ENIPITEM2ENIPITEM.DATEEDIT");
      // relationship conditions
    _checkConditionToken(condition,"ipiteminref","IPITEMINREFCODE");
    _checkConditionToken(condition,"ipiteminref.code","IPITEMINREFCODE");
    _checkConditionToken(condition,"ipitemoutref","IPITEMOUTREFCODE");
    _checkConditionToken(condition,"ipitemoutref.code","IPITEMOUTREFCODE");
    return condition.toString();
   }

   public Connection getConnection()
   {
    try
     {
      if(super.getConnection() != null && !super.getConnection().isClosed())
       return super.getConnection();

      InitialContext initialContext = new InitialContext();
      DataSource dataSource = (DataSource)initialContext.lookup(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
      return dataSource.getConnection();
     }
    catch (NamingException e) {throw new SystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.ENERGYNET_DATASOURCE+"%}",e);}
    catch (SQLException e)    {throw new SystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.ENERGYNET_DATASOURCE+"%}",e);}
   }


  ///////////// PRIVATE SECTION ///////////////
  protected static Hashtable _sequenceTable = new Hashtable();

  private void _collectAutoIncrementFields(ENIPItem2ENIPItem anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENIPITEM2ENIPITEM", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENIPITEM2ENIPITEM", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENIPITEM2ENIPITEM", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENIPITEM2ENIPITEM");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENIPItem2ENIPItemDAO
