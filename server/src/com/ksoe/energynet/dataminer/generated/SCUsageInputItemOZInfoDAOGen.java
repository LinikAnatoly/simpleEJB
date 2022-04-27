
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer.generated;

import com.ksoe.lla.persistence.GenericDataMiner;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;


import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
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

import com.ksoe.energynet.valueobject.SCUsageInputItemOZInfo;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemOZInfoFilter;
import com.ksoe.energynet.valueobject.brief.SCUsageInputItemOZInfoShort;
import com.ksoe.energynet.valueobject.lists.SCUsageInputItemOZInfoShortList;


/**
 * DAO Object for SCUsageInputItemOZInfo;
 *
 */

public class SCUsageInputItemOZInfoDAOGen extends GenericDataMiner {

  public SCUsageInputItemOZInfoDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public SCUsageInputItemOZInfoDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(SCUsageInputItemOZInfo inObject) throws PersistenceException
   {
      SCUsageInputItemOZInfo obj = new SCUsageInputItemOZInfo();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.sourceCode != obj.sourceCode){
       return false;
     }

     if (inObject.account != obj.account){
       return false;
     }

     if (inObject.expensesCode != obj.expensesCode){
       return false;
     }

     if ( ! inObject.sumWithNds.equals(obj.sumWithNds)){
       return false;
     }

     if ( ! inObject.sumNds.equals(obj.sumNds)){
       return false;
     }

     if ( ! inObject.sumGen.equals(obj.sumGen)){
       return false;
     }
     if (inObject.usageInputItemOZRef.code != obj.usageInputItemOZRef.code){
        return false;
     }
      return true;
   }

   public int add(SCUsageInputItemOZInfo anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(SCUsageInputItemOZInfo anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

	anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO SCUSAGEINPUTITEMOZINFO (CODE,SOURCECODE,ACCOUNT,EXPENSESCODE,SUMWITHNDS,SUMNDS,SUMGEN,MODIFY_TIME,USAGEINPUTITEMOZREFCOD) VALUES (?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.sourceCode);
      statement.setString(3,anObject.account);
      statement.setString(4,anObject.expensesCode);
      if (anObject.sumWithNds != null)
        anObject.sumWithNds = anObject.sumWithNds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.sumWithNds);
      if (anObject.sumNds != null)
        anObject.sumNds = anObject.sumNds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.sumNds);
      if (anObject.sumGen != null)
        anObject.sumGen = anObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(7,anObject.sumGen);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(8,null);
      else
        statement.setBigDecimal(8,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.usageInputItemOZRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.SCUsageInputItemOZDAOGen(connection,getUserProfile()).exists(anObject.usageInputItemOZRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.SCUsageInputItemOZInfo.usageInputItemOZRef.code%} = {%"+anObject.usageInputItemOZRef.code+"%}");
        statement.setInt(9,anObject.usageInputItemOZRef.code);
      }
      else
        statement.setNull(9,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%SCUsageInputItemOZInfoDAOGen.add%}",e);
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

   public void save(SCUsageInputItemOZInfo anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(SCUsageInputItemOZInfo anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      SCUsageInputItemOZInfo oldObject = new SCUsageInputItemOZInfo();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+SCUsageInputItemOZInfo.modify_time_Field+" FROM  SCUSAGEINPUTITEMOZINFO WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("SOURCECODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ACCOUNT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("EXPENSESCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUMWITHNDS") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUMNDS") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUMGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("MODIFY_TIME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("USAGEINPUTITEMOZREF") == 0)
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
        "UPDATE SCUSAGEINPUTITEMOZINFO SET  SOURCECODE = ? , ACCOUNT = ? , EXPENSESCODE = ? , SUMWITHNDS = ? , SUMNDS = ? , SUMGEN = ? , MODIFY_TIME = ? , USAGEINPUTITEMOZREFCOD = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE SCUSAGEINPUTITEMOZINFO SET ";
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
      statement.setString(1,anObject.sourceCode);
      statement.setString(2,anObject.account);
      statement.setString(3,anObject.expensesCode);
      if (anObject.sumWithNds != null)
        anObject.sumWithNds = anObject.sumWithNds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(4,anObject.sumWithNds);
      if (anObject.sumNds != null)
        anObject.sumNds = anObject.sumNds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(5,anObject.sumNds);
      if (anObject.sumGen != null)
        anObject.sumGen = anObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(6,anObject.sumGen);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(7,null);
      else
        statement.setBigDecimal(7,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.usageInputItemOZRef.code != Integer.MIN_VALUE)
        statement.setInt(8,anObject.usageInputItemOZRef.code);
      else
        statement.setNull(8,java.sql.Types.INTEGER);
          statement.setInt(9,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("SOURCECODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.sourceCode);
                continue;
             }
            if("ACCOUNT".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.account);
                continue;
             }
            if("EXPENSESCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.expensesCode);
                continue;
             }
            if("SUMWITHNDS".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sumWithNds != null)
                    anObject.sumWithNds = anObject.sumWithNds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sumWithNds);
                continue;
             }
            if("SUMNDS".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sumNds != null)
                    anObject.sumNds = anObject.sumNds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sumNds);
                continue;
             }
            if("SUMGEN".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.sumGen != null)
                    anObject.sumGen = anObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.sumGen);
                continue;
             }
            if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.modify_time == Long.MIN_VALUE)
                    statement.setBigDecimal(i+1,null);
                else
                     statement.setBigDecimal(i+1,new java.math.BigDecimal(anObject.modify_time));
                continue;
             }
            if("USAGEINPUTITEMOZREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.usageInputItemOZRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.usageInputItemOZRef.code);
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

   } // end of save(SCUsageInputItemOZInfo anObject,String[] anAttributes)


 public SCUsageInputItemOZInfoShort getShortObject(int anObjectCode) throws PersistenceException
  {
   SCUsageInputItemOZInfo filterObject = new SCUsageInputItemOZInfo();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (SCUsageInputItemOZInfoShort)list.get(0);
   return null;
  }

  public SCUsageInputItemOZInfoShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public SCUsageInputItemOZInfoShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public SCUsageInputItemOZInfoShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public SCUsageInputItemOZInfoShortList getFilteredList(SCUsageInputItemOZInfo filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public SCUsageInputItemOZInfoShortList getScrollableFilteredList(SCUsageInputItemOZInfo aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public SCUsageInputItemOZInfoShortList getScrollableFilteredList(SCUsageInputItemOZInfo aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public SCUsageInputItemOZInfoShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public SCUsageInputItemOZInfoShortList getScrollableFilteredList(SCUsageInputItemOZInfoFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public SCUsageInputItemOZInfoShortList getScrollableFilteredList(SCUsageInputItemOZInfoFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public SCUsageInputItemOZInfoShortList getScrollableFilteredList(SCUsageInputItemOZInfo aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public SCUsageInputItemOZInfoShortList getScrollableFilteredList(SCUsageInputItemOZInfo aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    SCUsageInputItemOZInfoShortList result = new SCUsageInputItemOZInfoShortList();
    SCUsageInputItemOZInfoShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "SCUSAGEINPUTITEMOZINFO.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "SCUSAGEINPUTITEMOZINFO.CODE"+
     ",SCUSAGEINPUTITEMOZINFO.SOURCECODE"+
     ",SCUSAGEINPUTITEMOZINFO.ACCOUNT"+
     ",SCUSAGEINPUTITEMOZINFO.EXPENSESCODE"+
     ",SCUSAGEINPUTITEMOZINFO.SUMWITHNDS"+
     ",SCUSAGEINPUTITEMOZINFO.SUMNDS"+
     ",SCUSAGEINPUTITEMOZINFO.SUMGEN"+

      ", SCUSAGEINPUTITEMOZ.CODE " +
      ", SCUSAGEINPUTITEMOZ.NUMBERDOC " +
      ", SCUSAGEINPUTITEMOZ.COUNTERTYPE " +
      ", SCUSAGEINPUTITEMOZ.ACCOUNT " +
      ", SCUSAGEINPUTITEMOZ.COST " +
      ", SCUSAGEINPUTITEMOZ.COUNTGEN " +
      ", SCUSAGEINPUTITEMOZ.SCCODE " +
     " FROM SCUSAGEINPUTITEMOZINFO " +
     ", SCUSAGEINPUTITEMOZ " +
     //" WHERE "
	"";
     whereStr = " SCUSAGEINPUTITEMOZ.CODE = SCUSAGEINPUTITEMOZINFO.USAGEINPUTITEMOZREFCOD" ; //+
		//selectStr = selectStr + " ${s} SCUSAGEINPUTITEMOZINFO.CODE IN ( SELECT SCUSAGEINPUTITEMOZINFO.CODE FROM SCUSAGEINPUTITEMOZINFO ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEMOZINFO.CODE = ?";
        }
         if (aFilterObject.sourceCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.sourceCode.indexOf('*',0) < 0 && aFilterObject.sourceCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(SCUSAGEINPUTITEMOZINFO.SOURCECODE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(SCUSAGEINPUTITEMOZINFO.SOURCECODE) LIKE UPPER(?)";
         }
         if (aFilterObject.account != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.account.indexOf('*',0) < 0 && aFilterObject.account.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(SCUSAGEINPUTITEMOZINFO.ACCOUNT) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(SCUSAGEINPUTITEMOZINFO.ACCOUNT) LIKE UPPER(?)";
         }
         if (aFilterObject.expensesCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.expensesCode.indexOf('*',0) < 0 && aFilterObject.expensesCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(SCUSAGEINPUTITEMOZINFO.EXPENSESCODE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(SCUSAGEINPUTITEMOZINFO.EXPENSESCODE) LIKE UPPER(?)";
         }
        if(aFilterObject.sumWithNds != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEMOZINFO.SUMWITHNDS = ?";
        }
        if(aFilterObject.sumNds != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEMOZINFO.SUMNDS = ?";
        }
        if(aFilterObject.sumGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEMOZINFO.SUMGEN = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEMOZINFO.MODIFY_TIME = ?";
        }
        if(aFilterObject.usageInputItemOZRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "SCUSAGEINPUTITEMOZINFO.USAGEINPUTITEMOZREFCOD = ? ";
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

           if(aFilterObject.sourceCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.sourceCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.account != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.account);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.expensesCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.expensesCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.sumWithNds != null){
            number++;
            aFilterObject.sumWithNds = aFilterObject.sumWithNds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumWithNds);
        }
        if(aFilterObject.sumNds != null){
            number++;
            aFilterObject.sumNds = aFilterObject.sumNds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumNds);
        }
        if(aFilterObject.sumGen != null){
            number++;
            aFilterObject.sumGen = aFilterObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGen);
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.usageInputItemOZRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.usageInputItemOZRef.code);
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

        anObject = new SCUsageInputItemOZInfoShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.sourceCode = set.getString(2);
        anObject.account = set.getString(3);
        anObject.expensesCode = set.getString(4);
        anObject.sumWithNds = set.getBigDecimal(5);
        if(anObject.sumWithNds != null)
            anObject.sumWithNds = anObject.sumWithNds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumNds = set.getBigDecimal(6);
        if(anObject.sumNds != null)
            anObject.sumNds = anObject.sumNds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumGen = set.getBigDecimal(7);
        if(anObject.sumGen != null)
            anObject.sumGen = anObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);

        anObject.usageInputItemOZRefCode = set.getInt(8);
		if(set.wasNull())
		   anObject.usageInputItemOZRefCode = Integer.MIN_VALUE;
        anObject.usageInputItemOZRefNumberDoc = set.getString(9);
        anObject.usageInputItemOZRefCounterType = set.getString(10);
        anObject.usageInputItemOZRefAccount = set.getString(11);
        anObject.usageInputItemOZRefCost = set.getBigDecimal(12);
        if(anObject.usageInputItemOZRefCost != null)
          anObject.usageInputItemOZRefCost = anObject.usageInputItemOZRefCost.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.usageInputItemOZRefCountGen = set.getInt(13);
		if(set.wasNull())
		   anObject.usageInputItemOZRefCountGen = Integer.MIN_VALUE;
        anObject.usageInputItemOZRefScCode = set.getInt(14);
		if(set.wasNull())
		   anObject.usageInputItemOZRefScCode = Integer.MIN_VALUE;

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

  public int[] getFilteredCodeArrayOLD(SCUsageInputItemOZInfo aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT SCUSAGEINPUTITEMOZINFO.CODE FROM SCUSAGEINPUTITEMOZINFO";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "SCUSAGEINPUTITEMOZINFO.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEMOZINFO.CODE = ?";
        }
         if (aFilterObject.sourceCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.sourceCode.indexOf('*',0) < 0 && aFilterObject.sourceCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  SCUSAGEINPUTITEMOZINFO.SOURCECODE = ?";
             else
                 whereStr = whereStr + "  SCUSAGEINPUTITEMOZINFO.SOURCECODE LIKE ?";
         }
         if (aFilterObject.account != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.account.indexOf('*',0) < 0 && aFilterObject.account.indexOf('?',0) < 0)
                 whereStr = whereStr + "  SCUSAGEINPUTITEMOZINFO.ACCOUNT = ?";
             else
                 whereStr = whereStr + "  SCUSAGEINPUTITEMOZINFO.ACCOUNT LIKE ?";
         }
         if (aFilterObject.expensesCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.expensesCode.indexOf('*',0) < 0 && aFilterObject.expensesCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  SCUSAGEINPUTITEMOZINFO.EXPENSESCODE = ?";
             else
                 whereStr = whereStr + "  SCUSAGEINPUTITEMOZINFO.EXPENSESCODE LIKE ?";
         }
        if(aFilterObject.sumWithNds != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEMOZINFO.SUMWITHNDS = ?";
        }
        if(aFilterObject.sumNds != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEMOZINFO.SUMNDS = ?";
        }
        if(aFilterObject.sumGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEMOZINFO.SUMGEN = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEMOZINFO.MODIFY_TIME = ?";
        }
        if(aFilterObject.usageInputItemOZRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " SCUSAGEINPUTITEMOZINFO.USAGEINPUTITEMOZREFCOD = ? ";
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
         if (aFilterObject.sourceCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.sourceCode.indexOf('*',0) < 0 && aFilterObject.sourceCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " SCUSAGEINPUTITEMOZINFO.SOURCECODE = ?";
             else
                 whereStr = whereStr + " SCUSAGEINPUTITEMOZINFO.SOURCECODE LIKE ?";

           if(aFilterObject.sourceCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.sourceCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.account != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.account.indexOf('*',0) < 0 && aFilterObject.account.indexOf('?',0) < 0)
                 whereStr = whereStr + " SCUSAGEINPUTITEMOZINFO.ACCOUNT = ?";
             else
                 whereStr = whereStr + " SCUSAGEINPUTITEMOZINFO.ACCOUNT LIKE ?";

           if(aFilterObject.account != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.account);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.expensesCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.expensesCode.indexOf('*',0) < 0 && aFilterObject.expensesCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " SCUSAGEINPUTITEMOZINFO.EXPENSESCODE = ?";
             else
                 whereStr = whereStr + " SCUSAGEINPUTITEMOZINFO.EXPENSESCODE LIKE ?";

           if(aFilterObject.expensesCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.expensesCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.sumWithNds != null){
            number++;
            aFilterObject.sumWithNds = aFilterObject.sumWithNds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumWithNds);
        }
        if(aFilterObject.sumNds != null){
            number++;
            aFilterObject.sumNds = aFilterObject.sumNds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumNds);
        }
        if(aFilterObject.sumGen != null){
            number++;
            aFilterObject.sumGen = aFilterObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGen);
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.usageInputItemOZRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.usageInputItemOZRef.code);
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

  public int[] getFilteredCodeArray(SCUsageInputItemOZInfoFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
	return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(SCUsageInputItemOZInfo aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT SCUSAGEINPUTITEMOZINFO.CODE FROM SCUSAGEINPUTITEMOZINFO";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "SCUSAGEINPUTITEMOZINFO.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEMOZINFO.CODE = ?";
        }
         if (aFilterObject.sourceCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.sourceCode.indexOf('*',0) < 0 && aFilterObject.sourceCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  SCUSAGEINPUTITEMOZINFO.SOURCECODE = ?";
             else
                 whereStr = whereStr + "  SCUSAGEINPUTITEMOZINFO.SOURCECODE LIKE ?";
         }
         if (aFilterObject.account != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.account.indexOf('*',0) < 0 && aFilterObject.account.indexOf('?',0) < 0)
                 whereStr = whereStr + "  SCUSAGEINPUTITEMOZINFO.ACCOUNT = ?";
             else
                 whereStr = whereStr + "  SCUSAGEINPUTITEMOZINFO.ACCOUNT LIKE ?";
         }
         if (aFilterObject.expensesCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.expensesCode.indexOf('*',0) < 0 && aFilterObject.expensesCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  SCUSAGEINPUTITEMOZINFO.EXPENSESCODE = ?";
             else
                 whereStr = whereStr + "  SCUSAGEINPUTITEMOZINFO.EXPENSESCODE LIKE ?";
         }
        if(aFilterObject.sumWithNds != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEMOZINFO.SUMWITHNDS = ?";
        }
        if(aFilterObject.sumNds != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEMOZINFO.SUMNDS = ?";
        }
        if(aFilterObject.sumGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEMOZINFO.SUMGEN = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEMOZINFO.MODIFY_TIME = ?";
        }
        if(aFilterObject.usageInputItemOZRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " SCUSAGEINPUTITEMOZINFO.USAGEINPUTITEMOZREFCOD = ? ";
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
         if (aFilterObject.sourceCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.sourceCode.indexOf('*',0) < 0 && aFilterObject.sourceCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " SCUSAGEINPUTITEMOZINFO.SOURCECODE = ?";
             else
                 whereStr = whereStr + " SCUSAGEINPUTITEMOZINFO.SOURCECODE LIKE ?";

           if(aFilterObject.sourceCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.sourceCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.account != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.account.indexOf('*',0) < 0 && aFilterObject.account.indexOf('?',0) < 0)
                 whereStr = whereStr + " SCUSAGEINPUTITEMOZINFO.ACCOUNT = ?";
             else
                 whereStr = whereStr + " SCUSAGEINPUTITEMOZINFO.ACCOUNT LIKE ?";

           if(aFilterObject.account != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.account);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.expensesCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.expensesCode.indexOf('*',0) < 0 && aFilterObject.expensesCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " SCUSAGEINPUTITEMOZINFO.EXPENSESCODE = ?";
             else
                 whereStr = whereStr + " SCUSAGEINPUTITEMOZINFO.EXPENSESCODE LIKE ?";

           if(aFilterObject.expensesCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.expensesCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.sumWithNds != null){
            number++;
            aFilterObject.sumWithNds = aFilterObject.sumWithNds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumWithNds);
        }
        if(aFilterObject.sumNds != null){
            number++;
            aFilterObject.sumNds = aFilterObject.sumNds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumNds);
        }
        if(aFilterObject.sumGen != null){
            number++;
            aFilterObject.sumGen = aFilterObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.sumGen);
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.usageInputItemOZRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.usageInputItemOZRef.code);
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


   public SCUsageInputItemOZInfo getObject(int uid) throws PersistenceException
   {
    SCUsageInputItemOZInfo result = new SCUsageInputItemOZInfo();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(SCUsageInputItemOZInfo anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  SCUSAGEINPUTITEMOZINFO.CODE, SCUSAGEINPUTITEMOZINFO.SOURCECODE, SCUSAGEINPUTITEMOZINFO.ACCOUNT, SCUSAGEINPUTITEMOZINFO.EXPENSESCODE, SCUSAGEINPUTITEMOZINFO.SUMWITHNDS, SCUSAGEINPUTITEMOZINFO.SUMNDS, SCUSAGEINPUTITEMOZINFO.SUMGEN, SCUSAGEINPUTITEMOZINFO.MODIFY_TIME, SCUSAGEINPUTITEMOZINFO.USAGEINPUTITEMOZREFCOD "
    +" FROM SCUSAGEINPUTITEMOZINFO WHERE SCUSAGEINPUTITEMOZINFO.CODE = ?";

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
        anObject.sourceCode = set.getString(2);
        anObject.account = set.getString(3);
        anObject.expensesCode = set.getString(4);
        anObject.sumWithNds = set.getBigDecimal(5);
        if(anObject.sumWithNds != null)
            anObject.sumWithNds = anObject.sumWithNds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumNds = set.getBigDecimal(6);
        if(anObject.sumNds != null)
            anObject.sumNds = anObject.sumNds.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.sumGen = set.getBigDecimal(7);
        if(anObject.sumGen != null)
            anObject.sumGen = anObject.sumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.modify_time = set.getLong(8);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.usageInputItemOZRef.code = set.getInt(9);
        if ( set.wasNull() )
            anObject.usageInputItemOZRef.code = Integer.MIN_VALUE;
        if(anObject.usageInputItemOZRef.code != Integer.MIN_VALUE)
        {
           anObject.setUsageInputItemOZRef(
		   new com.ksoe.energynet.dataminer.generated.SCUsageInputItemOZDAOGen(connection,getUserProfile()).getRef(anObject.usageInputItemOZRef.code));
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


  public com.ksoe.energynet.valueobject.references.SCUsageInputItemOZInfoRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.SCUsageInputItemOZInfoRef ref = new com.ksoe.energynet.valueobject.references.SCUsageInputItemOZInfoRef();
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

    selectStr = "DELETE FROM  SCUSAGEINPUTITEMOZINFO WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    SCUsageInputItemOZInfo object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%SCUsageInputItemOZInfo.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(SCUsageInputItemOZInfo.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%SCUsageInputItemOZInfo.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(SCUsageInputItemOZInfo.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%SCUsageInputItemOZInfo.getObject%} access denied");

    selectStr =

    "SELECT  SCUSAGEINPUTITEMOZINFO.CODE FROM  SCUSAGEINPUTITEMOZINFO WHERE  SCUSAGEINPUTITEMOZINFO.CODE = ?";
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
    _checkConditionToken(condition,"code","SCUSAGEINPUTITEMOZINFO.CODE");
    _checkConditionToken(condition,"sourcecode","SCUSAGEINPUTITEMOZINFO.SOURCECODE");
    _checkConditionToken(condition,"account","SCUSAGEINPUTITEMOZINFO.ACCOUNT");
    _checkConditionToken(condition,"expensescode","SCUSAGEINPUTITEMOZINFO.EXPENSESCODE");
    _checkConditionToken(condition,"sumwithnds","SCUSAGEINPUTITEMOZINFO.SUMWITHNDS");
    _checkConditionToken(condition,"sumnds","SCUSAGEINPUTITEMOZINFO.SUMNDS");
    _checkConditionToken(condition,"sumgen","SCUSAGEINPUTITEMOZINFO.SUMGEN");
    _checkConditionToken(condition,"modify_time","SCUSAGEINPUTITEMOZINFO.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"usageinputitemozref","USAGEINPUTITEMOZREFCOD");
    _checkConditionToken(condition,"usageinputitemozref.code","USAGEINPUTITEMOZREFCOD");
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

	private void _collectAutoIncrementFields(SCUsageInputItemOZInfo anObject,
			Connection connection) throws PersistenceException {
		
		SequenceKey hashKey = new SequenceKey("SCUSAGEINPUTITEMOZINFO", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("SCUSAGEINPUTITEMOZINFO", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("SCUSAGEINPUTITEMOZINFO", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}
		
		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
					"Can't obtain auto increment value from: SCUSAGEINPUTITEMOZINFO");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of SCUsageInputItemOZInfoDAO
