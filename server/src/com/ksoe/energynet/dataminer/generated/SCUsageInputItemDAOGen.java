
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

import com.ksoe.energynet.valueobject.SCUsageInputItem;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemFilter;
import com.ksoe.energynet.valueobject.brief.SCUsageInputItemShort;
import com.ksoe.energynet.valueobject.lists.SCUsageInputItemShortList;


/**
 * DAO Object for SCUsageInputItem;
 *
 */

public class SCUsageInputItemDAOGen extends GenericDataMiner {

  public SCUsageInputItemDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public SCUsageInputItemDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(SCUsageInputItem inObject) throws PersistenceException
   {
      SCUsageInputItem obj = new SCUsageInputItem();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.numberDoc != obj.numberDoc){
       return false;
     }

     if (inObject.numberInt != obj.numberInt){
       return false;
     }

     if (inObject.countGen != obj.countGen){
       return false;
     }

     if (inObject.scCode != obj.scCode){
       return false;
     }

     if (inObject.molCode != obj.molCode){
       return false;
     }

     if (inObject.molName != obj.molName){
       return false;
     }
     if (inObject.usageInputRef.code != obj.usageInputRef.code){
        return false;
     }
     if (inObject.kindRef.code != obj.kindRef.code){
        return false;
     }
      return true;
   }

   public int add(SCUsageInputItem anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(SCUsageInputItem anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

	anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO SCUSAGEINPUTITEM (CODE,NUMBERDOC,NUMBERINT,COUNTGEN,SCCODE,MOLCODE,MOLNAME,MODIFY_TIME,USAGEINPUTREFCODE,KINDREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.numberDoc);
      if (anObject.numberInt != Integer.MIN_VALUE )
         statement.setInt(3,anObject.numberInt);
      else
         statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.countGen != Integer.MIN_VALUE )
         statement.setInt(4,anObject.countGen);
      else
         statement.setNull(4,java.sql.Types.INTEGER);
      if (anObject.scCode != Integer.MIN_VALUE )
         statement.setInt(5,anObject.scCode);
      else
         statement.setNull(5,java.sql.Types.INTEGER);
      statement.setString(6,anObject.molCode);
      statement.setString(7,anObject.molName);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(8,null);
      else
        statement.setBigDecimal(8,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.usageInputRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.SCUsageInputDAOGen(connection,getUserProfile()).exists(anObject.usageInputRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.SCUsageInputItem.usageInputRef.code%} = {%"+anObject.usageInputRef.code+"%}");
        statement.setInt(9,anObject.usageInputRef.code);
      }
      else
        statement.setNull(9,java.sql.Types.INTEGER);
      if (anObject.kindRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.SCUsageInputItemKindDAOGen(connection,getUserProfile()).exists(anObject.kindRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.SCUsageInputItem.kindRef.code%} = {%"+anObject.kindRef.code+"%}");
        statement.setInt(10,anObject.kindRef.code);
      }
      else
        statement.setNull(10,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%SCUsageInputItemDAOGen.add%}",e);
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

   public void save(SCUsageInputItem anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(SCUsageInputItem anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      SCUsageInputItem oldObject = new SCUsageInputItem();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+SCUsageInputItem.modify_time_Field+" FROM  SCUSAGEINPUTITEM WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("NUMBERDOC") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("NUMBERINT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COUNTGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SCCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("MOLCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("MOLNAME") == 0)
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
          if(fieldNameStr.compareTo("USAGEINPUTREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("KINDREF") == 0)
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
        "UPDATE SCUSAGEINPUTITEM SET  NUMBERDOC = ? , NUMBERINT = ? , COUNTGEN = ? , SCCODE = ? , MOLCODE = ? , MOLNAME = ? , MODIFY_TIME = ? , USAGEINPUTREFCODE = ? , KINDREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE SCUSAGEINPUTITEM SET ";
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
      statement.setString(1,anObject.numberDoc);
      if (anObject.numberInt != Integer.MIN_VALUE )
         statement.setInt(2,anObject.numberInt);
      else
         statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.countGen != Integer.MIN_VALUE )
         statement.setInt(3,anObject.countGen);
      else
         statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.scCode != Integer.MIN_VALUE )
         statement.setInt(4,anObject.scCode);
      else
         statement.setNull(4,java.sql.Types.INTEGER);
      statement.setString(5,anObject.molCode);
      statement.setString(6,anObject.molName);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(7,null);
      else
        statement.setBigDecimal(7,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.usageInputRef.code != Integer.MIN_VALUE)
        statement.setInt(8,anObject.usageInputRef.code);
      else
        statement.setNull(8,java.sql.Types.INTEGER);
      if (anObject.kindRef.code != Integer.MIN_VALUE)
        statement.setInt(9,anObject.kindRef.code);
      else
        statement.setNull(9,java.sql.Types.INTEGER);
          statement.setInt(10,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("NUMBERDOC".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.numberDoc);
                continue;
             }
            if("NUMBERINT".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.numberInt);
                continue;
             }
            if("COUNTGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.countGen);
                continue;
             }
            if("SCCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.scCode);
                continue;
             }
            if("MOLCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.molCode);
                continue;
             }
            if("MOLNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.molName);
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
            if("USAGEINPUTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.usageInputRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.usageInputRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("KINDREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.kindRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.kindRef.code);
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

   } // end of save(SCUsageInputItem anObject,String[] anAttributes)


 public SCUsageInputItemShort getShortObject(int anObjectCode) throws PersistenceException
  {
   SCUsageInputItem filterObject = new SCUsageInputItem();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (SCUsageInputItemShort)list.get(0);
   return null;
  }

  public SCUsageInputItemShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public SCUsageInputItemShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public SCUsageInputItemShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public SCUsageInputItemShortList getFilteredList(SCUsageInputItem filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public SCUsageInputItemShortList getScrollableFilteredList(SCUsageInputItem aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public SCUsageInputItemShortList getScrollableFilteredList(SCUsageInputItem aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public SCUsageInputItemShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public SCUsageInputItemShortList getScrollableFilteredList(SCUsageInputItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public SCUsageInputItemShortList getScrollableFilteredList(SCUsageInputItemFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public SCUsageInputItemShortList getScrollableFilteredList(SCUsageInputItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public SCUsageInputItemShortList getScrollableFilteredList(SCUsageInputItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    SCUsageInputItemShortList result = new SCUsageInputItemShortList();
    SCUsageInputItemShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "SCUSAGEINPUTITEM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "SCUSAGEINPUTITEM.CODE"+
     ",SCUSAGEINPUTITEM.NUMBERDOC"+
     ",SCUSAGEINPUTITEM.COUNTGEN"+
     ",SCUSAGEINPUTITEM.SCCODE"+
     ",SCUSAGEINPUTITEM.MOLCODE"+
     ",SCUSAGEINPUTITEM.MOLNAME"+

      ", SCUSAGEINPUT.CODE " +
      ", SCUSAGEINPUT.NUMBERDOC " +
      ", SCUSAGEINPUT.DATEGEN " +
      ", SCUSAGEINPUT.DATESTART " +
      ", SCUSAGEINPUT.DATEFINAL " +
      ", SCUSAGEINPUT.MOLCODE " +
      ", SCUSAGEINPUT.MOLNAME " +
      ", SCUSAGEINPUT.DATEEDIT " +
      ", SCUSAGEINPUT.USERGEN " +
      ", SCUSAGEINPUTITEMKIND.CODE " +
      ", SCUSAGEINPUTITEMKIND.NAME " +
     " FROM SCUSAGEINPUTITEM " +
     ", SCUSAGEINPUT " +
     ", SCUSAGEINPUTITEMKIND " +
     //" WHERE "
	"";
     whereStr = " SCUSAGEINPUT.CODE = SCUSAGEINPUTITEM.USAGEINPUTREFCODE" ; //+
      whereStr = whereStr +" AND SCUSAGEINPUTITEMKIND.CODE = SCUSAGEINPUTITEM.KINDREFCODE" ; //+
		//selectStr = selectStr + " ${s} SCUSAGEINPUTITEM.CODE IN ( SELECT SCUSAGEINPUTITEM.CODE FROM SCUSAGEINPUTITEM ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEM.CODE = ?";
        }
         if (aFilterObject.numberDoc != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numberDoc.indexOf('*',0) < 0 && aFilterObject.numberDoc.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(SCUSAGEINPUTITEM.NUMBERDOC) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(SCUSAGEINPUTITEM.NUMBERDOC) LIKE UPPER(?)";
         }
        if(aFilterObject.numberInt != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEM.NUMBERINT = ?";
        }
        if(aFilterObject.countGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEM.COUNTGEN = ?";
        }
        if(aFilterObject.scCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEM.SCCODE = ?";
        }
         if (aFilterObject.molCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.molCode.indexOf('*',0) < 0 && aFilterObject.molCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(SCUSAGEINPUTITEM.MOLCODE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(SCUSAGEINPUTITEM.MOLCODE) LIKE UPPER(?)";
         }
         if (aFilterObject.molName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.molName.indexOf('*',0) < 0 && aFilterObject.molName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(SCUSAGEINPUTITEM.MOLNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(SCUSAGEINPUTITEM.MOLNAME) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEM.MODIFY_TIME = ?";
        }
        if(aFilterObject.usageInputRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "SCUSAGEINPUTITEM.USAGEINPUTREFCODE = ? ";
        }
        if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "SCUSAGEINPUTITEM.KINDREFCODE = ? ";
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

           if(aFilterObject.numberDoc != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.numberDoc);
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
         if(aFilterObject.countGen != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.countGen);
         }
         if(aFilterObject.scCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.scCode);
         }

           if(aFilterObject.molCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.molCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.molName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.molName);
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
       if(aFilterObject.usageInputRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.usageInputRef.code);
       }
       if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.kindRef.code);
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

        anObject = new SCUsageInputItemShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.numberDoc = set.getString(2);
        anObject.countGen = set.getInt(3);
        if ( set.wasNull() )
            anObject.countGen = Integer.MIN_VALUE;
        anObject.scCode = set.getInt(4);
        if ( set.wasNull() )
            anObject.scCode = Integer.MIN_VALUE;
        anObject.molCode = set.getString(5);
        anObject.molName = set.getString(6);

        anObject.usageInputRefCode = set.getInt(7);
		if(set.wasNull())
		   anObject.usageInputRefCode = Integer.MIN_VALUE;
        anObject.usageInputRefNumberDoc = set.getString(8);
        anObject.usageInputRefDateGen = set.getDate(9);
        anObject.usageInputRefDateStart = set.getDate(10);
        anObject.usageInputRefDateFinal = set.getDate(11);
        anObject.usageInputRefMolCode = set.getString(12);
        anObject.usageInputRefMolName = set.getString(13);
        anObject.usageInputRefDateEdit = set.getTimestamp(14);
        anObject.usageInputRefUserGen = set.getString(15);
        anObject.kindRefCode = set.getInt(16);
		if(set.wasNull())
		   anObject.kindRefCode = Integer.MIN_VALUE;
        anObject.kindRefName = set.getString(17);

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

  public int[] getFilteredCodeArrayOLD(SCUsageInputItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT SCUSAGEINPUTITEM.CODE FROM SCUSAGEINPUTITEM";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "SCUSAGEINPUTITEM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEM.CODE = ?";
        }
         if (aFilterObject.numberDoc != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numberDoc.indexOf('*',0) < 0 && aFilterObject.numberDoc.indexOf('?',0) < 0)
                 whereStr = whereStr + "  SCUSAGEINPUTITEM.NUMBERDOC = ?";
             else
                 whereStr = whereStr + "  SCUSAGEINPUTITEM.NUMBERDOC LIKE ?";
         }
        if(aFilterObject.numberInt != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEM.NUMBERINT = ?";
        }
        if(aFilterObject.countGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEM.COUNTGEN = ?";
        }
        if(aFilterObject.scCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEM.SCCODE = ?";
        }
         if (aFilterObject.molCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.molCode.indexOf('*',0) < 0 && aFilterObject.molCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  SCUSAGEINPUTITEM.MOLCODE = ?";
             else
                 whereStr = whereStr + "  SCUSAGEINPUTITEM.MOLCODE LIKE ?";
         }
         if (aFilterObject.molName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.molName.indexOf('*',0) < 0 && aFilterObject.molName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  SCUSAGEINPUTITEM.MOLNAME = ?";
             else
                 whereStr = whereStr + "  SCUSAGEINPUTITEM.MOLNAME LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEM.MODIFY_TIME = ?";
        }
        if(aFilterObject.usageInputRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " SCUSAGEINPUTITEM.USAGEINPUTREFCODE = ? ";
        }
        if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " SCUSAGEINPUTITEM.KINDREFCODE = ? ";
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
         if (aFilterObject.numberDoc != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.numberDoc.indexOf('*',0) < 0 && aFilterObject.numberDoc.indexOf('?',0) < 0)
                 whereStr = whereStr + " SCUSAGEINPUTITEM.NUMBERDOC = ?";
             else
                 whereStr = whereStr + " SCUSAGEINPUTITEM.NUMBERDOC LIKE ?";

           if(aFilterObject.numberDoc != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.numberDoc);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.numberInt != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.numberInt);
         }
         if(aFilterObject.countGen != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.countGen);
         }
         if(aFilterObject.scCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.scCode);
         }
         if (aFilterObject.molCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.molCode.indexOf('*',0) < 0 && aFilterObject.molCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " SCUSAGEINPUTITEM.MOLCODE = ?";
             else
                 whereStr = whereStr + " SCUSAGEINPUTITEM.MOLCODE LIKE ?";

           if(aFilterObject.molCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.molCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.molName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.molName.indexOf('*',0) < 0 && aFilterObject.molName.indexOf('?',0) < 0)
                 whereStr = whereStr + " SCUSAGEINPUTITEM.MOLNAME = ?";
             else
                 whereStr = whereStr + " SCUSAGEINPUTITEM.MOLNAME LIKE ?";

           if(aFilterObject.molName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.molName);
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
       if(aFilterObject.usageInputRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.usageInputRef.code);
       }
       if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.kindRef.code);
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

  public int[] getFilteredCodeArray(SCUsageInputItemFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
	return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(SCUsageInputItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT SCUSAGEINPUTITEM.CODE FROM SCUSAGEINPUTITEM";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "SCUSAGEINPUTITEM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEM.CODE = ?";
        }
         if (aFilterObject.numberDoc != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.numberDoc.indexOf('*',0) < 0 && aFilterObject.numberDoc.indexOf('?',0) < 0)
                 whereStr = whereStr + "  SCUSAGEINPUTITEM.NUMBERDOC = ?";
             else
                 whereStr = whereStr + "  SCUSAGEINPUTITEM.NUMBERDOC LIKE ?";
         }
        if(aFilterObject.numberInt != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEM.NUMBERINT = ?";
        }
        if(aFilterObject.countGen != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEM.COUNTGEN = ?";
        }
        if(aFilterObject.scCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEM.SCCODE = ?";
        }
         if (aFilterObject.molCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.molCode.indexOf('*',0) < 0 && aFilterObject.molCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  SCUSAGEINPUTITEM.MOLCODE = ?";
             else
                 whereStr = whereStr + "  SCUSAGEINPUTITEM.MOLCODE LIKE ?";
         }
         if (aFilterObject.molName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.molName.indexOf('*',0) < 0 && aFilterObject.molName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  SCUSAGEINPUTITEM.MOLNAME = ?";
             else
                 whereStr = whereStr + "  SCUSAGEINPUTITEM.MOLNAME LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  SCUSAGEINPUTITEM.MODIFY_TIME = ?";
        }
        if(aFilterObject.usageInputRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " SCUSAGEINPUTITEM.USAGEINPUTREFCODE = ? ";
        }
        if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " SCUSAGEINPUTITEM.KINDREFCODE = ? ";
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
         if (aFilterObject.numberDoc != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.numberDoc.indexOf('*',0) < 0 && aFilterObject.numberDoc.indexOf('?',0) < 0)
                 whereStr = whereStr + " SCUSAGEINPUTITEM.NUMBERDOC = ?";
             else
                 whereStr = whereStr + " SCUSAGEINPUTITEM.NUMBERDOC LIKE ?";

           if(aFilterObject.numberDoc != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.numberDoc);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.numberInt != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.numberInt);
         }
         if(aFilterObject.countGen != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.countGen);
         }
         if(aFilterObject.scCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.scCode);
         }
         if (aFilterObject.molCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.molCode.indexOf('*',0) < 0 && aFilterObject.molCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " SCUSAGEINPUTITEM.MOLCODE = ?";
             else
                 whereStr = whereStr + " SCUSAGEINPUTITEM.MOLCODE LIKE ?";

           if(aFilterObject.molCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.molCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.molName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.molName.indexOf('*',0) < 0 && aFilterObject.molName.indexOf('?',0) < 0)
                 whereStr = whereStr + " SCUSAGEINPUTITEM.MOLNAME = ?";
             else
                 whereStr = whereStr + " SCUSAGEINPUTITEM.MOLNAME LIKE ?";

           if(aFilterObject.molName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.molName);
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
       if(aFilterObject.usageInputRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.usageInputRef.code);
       }
       if(aFilterObject.kindRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.kindRef.code);
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


   public SCUsageInputItem getObject(int uid) throws PersistenceException
   {
    SCUsageInputItem result = new SCUsageInputItem();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(SCUsageInputItem anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  SCUSAGEINPUTITEM.CODE, SCUSAGEINPUTITEM.NUMBERDOC, SCUSAGEINPUTITEM.NUMBERINT, SCUSAGEINPUTITEM.COUNTGEN, SCUSAGEINPUTITEM.SCCODE, SCUSAGEINPUTITEM.MOLCODE, SCUSAGEINPUTITEM.MOLNAME, SCUSAGEINPUTITEM.MODIFY_TIME, SCUSAGEINPUTITEM.USAGEINPUTREFCODE, SCUSAGEINPUTITEM.KINDREFCODE "
    +" FROM SCUSAGEINPUTITEM WHERE SCUSAGEINPUTITEM.CODE = ?";

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
        anObject.numberDoc = set.getString(2);
        anObject.numberInt = set.getInt(3);
        if ( set.wasNull() )
           anObject.numberInt = Integer.MIN_VALUE;
        anObject.countGen = set.getInt(4);
        if ( set.wasNull() )
           anObject.countGen = Integer.MIN_VALUE;
        anObject.scCode = set.getInt(5);
        if ( set.wasNull() )
           anObject.scCode = Integer.MIN_VALUE;
        anObject.molCode = set.getString(6);
        anObject.molName = set.getString(7);
        anObject.modify_time = set.getLong(8);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.usageInputRef.code = set.getInt(9);
        if ( set.wasNull() )
            anObject.usageInputRef.code = Integer.MIN_VALUE;
        anObject.kindRef.code = set.getInt(10);
        if ( set.wasNull() )
            anObject.kindRef.code = Integer.MIN_VALUE;
        if(anObject.usageInputRef.code != Integer.MIN_VALUE)
        {
           anObject.setUsageInputRef(
		   new com.ksoe.energynet.dataminer.generated.SCUsageInputDAOGen(connection,getUserProfile()).getRef(anObject.usageInputRef.code));
	   }
        if(anObject.kindRef.code != Integer.MIN_VALUE)
        {
           anObject.setKindRef(
		   new com.ksoe.energynet.dataminer.generated.SCUsageInputItemKindDAOGen(connection,getUserProfile()).getRef(anObject.kindRef.code));
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


  public com.ksoe.energynet.valueobject.references.SCUsageInputItemRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.SCUsageInputItemRef ref = new com.ksoe.energynet.valueobject.references.SCUsageInputItemRef();
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

    selectStr = "DELETE FROM  SCUSAGEINPUTITEM WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    SCUsageInputItem object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%SCUsageInputItem.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(SCUsageInputItem.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%SCUsageInputItem.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(SCUsageInputItem.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%SCUsageInputItem.getObject%} access denied");

    selectStr =

    "SELECT  SCUSAGEINPUTITEM.CODE FROM  SCUSAGEINPUTITEM WHERE  SCUSAGEINPUTITEM.CODE = ?";
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
    _checkConditionToken(condition,"code","SCUSAGEINPUTITEM.CODE");
    _checkConditionToken(condition,"numberdoc","SCUSAGEINPUTITEM.NUMBERDOC");
    _checkConditionToken(condition,"numberint","SCUSAGEINPUTITEM.NUMBERINT");
    _checkConditionToken(condition,"countgen","SCUSAGEINPUTITEM.COUNTGEN");
    _checkConditionToken(condition,"sccode","SCUSAGEINPUTITEM.SCCODE");
    _checkConditionToken(condition,"molcode","SCUSAGEINPUTITEM.MOLCODE");
    _checkConditionToken(condition,"molname","SCUSAGEINPUTITEM.MOLNAME");
    _checkConditionToken(condition,"modify_time","SCUSAGEINPUTITEM.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"usageinputref","USAGEINPUTREFCODE");
    _checkConditionToken(condition,"usageinputref.code","USAGEINPUTREFCODE");
    _checkConditionToken(condition,"kindref","KINDREFCODE");
    _checkConditionToken(condition,"kindref.code","KINDREFCODE");
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

	private void _collectAutoIncrementFields(SCUsageInputItem anObject,
			Connection connection) throws PersistenceException {
		
		SequenceKey hashKey = new SequenceKey("SCUSAGEINPUTITEM", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("SCUSAGEINPUTITEM", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("SCUSAGEINPUTITEM", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}
		
		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
					"Can't obtain auto increment value from: SCUSAGEINPUTITEM");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of SCUsageInputItemDAO
