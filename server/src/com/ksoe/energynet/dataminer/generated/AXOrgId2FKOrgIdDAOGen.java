
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
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
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
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

import com.ksoe.energynet.valueobject.AXOrgId2FKOrgId;
import com.ksoe.energynet.valueobject.filter.AXOrgId2FKOrgIdFilter;
import com.ksoe.energynet.valueobject.brief.AXOrgId2FKOrgIdShort;
import com.ksoe.energynet.valueobject.lists.AXOrgId2FKOrgIdShortList;


/**
 * DAO Object for AXOrgId2FKOrgId;
 *
 */

public class AXOrgId2FKOrgIdDAOGen extends GenericDataMiner {

   public AXOrgId2FKOrgIdDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public AXOrgId2FKOrgIdDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   public boolean isEqual(AXOrgId2FKOrgId inObject) throws PersistenceException
   {
      AXOrgId2FKOrgId obj = new AXOrgId2FKOrgId();
      obj.code = inObject.code;
      loadObject(obj);

	if(inObject.axOrgId == null && obj.axOrgId == null){}
	else
		if(inObject.axOrgId == null || obj.axOrgId == null) return false;
		else
			if ( ! inObject.axOrgId.equals(obj.axOrgId)){
				return false;
			}

	if(inObject.axName == null && obj.axName == null){}
	else
		if(inObject.axName == null || obj.axName == null) return false;
		else
			if ( ! inObject.axName.equals(obj.axName)){
				return false;
			}

	if(inObject.fkOrgId == null && obj.fkOrgId == null){}
	else
		if(inObject.fkOrgId == null || obj.fkOrgId == null) return false;
		else
			if ( ! inObject.fkOrgId.equals(obj.fkOrgId)){
				return false;
			}

	if(inObject.fkName == null && obj.fkName == null){}
	else
		if(inObject.fkName == null || obj.fkName == null) return false;
		else
			if ( ! inObject.fkName.equals(obj.fkName)){
				return false;
			}
      return true;
   }

   public int add(AXOrgId2FKOrgId anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(AXOrgId2FKOrgId anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO AXORGID2FKORGID (CODE,AXORGID,AXNAME,FKORGID,FKNAME) VALUES (?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.axOrgId);
      statement.setString(3,anObject.axName);
      statement.setString(4,anObject.fkOrgId);
      statement.setString(5,anObject.fkName);

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
      throw new PersistenceException("Error in method {%AXOrgId2FKOrgIdDAOGen.add%}",e);
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

   public void save(AXOrgId2FKOrgId anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(AXOrgId2FKOrgId anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;


      String selectStr;

      Vector fields = null;
      if(anAttributes != null)
       {
        String fieldNameStr;
        fields = new Vector();
        for(int attrIndex = 0;attrIndex < anAttributes.length;attrIndex++)
         {
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("AXORGID") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("AXNAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FKORGID") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FKNAME") == 0)
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
        "UPDATE AXORGID2FKORGID SET  AXORGID = ? , AXNAME = ? , FKORGID = ? , FKNAME = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE AXORGID2FKORGID SET ";
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
      statement.setString(1,anObject.axOrgId);
      statement.setString(2,anObject.axName);
      statement.setString(3,anObject.fkOrgId);
      statement.setString(4,anObject.fkName);
          statement.setInt(5,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("AXORGID".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.axOrgId);
                continue;
             }
            if("AXNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.axName);
                continue;
             }
            if("FKORGID".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.fkOrgId);
                continue;
             }
            if("FKNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.fkName);
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

   } // end of save(AXOrgId2FKOrgId anObject,String[] anAttributes)


 public AXOrgId2FKOrgIdShort getShortObject(int anObjectCode) throws PersistenceException
  {
   AXOrgId2FKOrgId filterObject = new AXOrgId2FKOrgId();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (AXOrgId2FKOrgIdShort)list.get(0);
   return null;
  }

  public AXOrgId2FKOrgIdShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public AXOrgId2FKOrgIdShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public AXOrgId2FKOrgIdShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public AXOrgId2FKOrgIdShortList getFilteredList(AXOrgId2FKOrgId filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public AXOrgId2FKOrgIdShortList getScrollableFilteredList(AXOrgId2FKOrgId aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public AXOrgId2FKOrgIdShortList getScrollableFilteredList(AXOrgId2FKOrgId aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public AXOrgId2FKOrgIdShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public AXOrgId2FKOrgIdShortList getScrollableFilteredList(AXOrgId2FKOrgIdFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public AXOrgId2FKOrgIdShortList getScrollableFilteredList(AXOrgId2FKOrgIdFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public AXOrgId2FKOrgIdShortList getScrollableFilteredList(AXOrgId2FKOrgId aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public AXOrgId2FKOrgIdShortList getScrollableFilteredList(AXOrgId2FKOrgId aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    AXOrgId2FKOrgIdShortList result = new AXOrgId2FKOrgIdShortList();
    AXOrgId2FKOrgIdShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "AXORGID2FKORGID.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "AXORGID2FKORGID.CODE"+
     ",AXORGID2FKORGID.AXORGID"+
     ",AXORGID2FKORGID.AXNAME"+
     ",AXORGID2FKORGID.FKORGID"+
     ",AXORGID2FKORGID.FKNAME"+

     " FROM AXORGID2FKORGID " +
     //" WHERE "
  "";
    //selectStr = selectStr + " ${s} AXORGID2FKORGID.CODE IN ( SELECT AXORGID2FKORGID.CODE FROM AXORGID2FKORGID ";

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  AXORGID2FKORGID.CODE = ?";
        }
         if (aFilterObject.axOrgId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.axOrgId.indexOf('*',0) < 0 && aFilterObject.axOrgId.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(AXORGID2FKORGID.AXORGID) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(AXORGID2FKORGID.AXORGID) LIKE UPPER(?)";
         }
         if (aFilterObject.axName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.axName.indexOf('*',0) < 0 && aFilterObject.axName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(AXORGID2FKORGID.AXNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(AXORGID2FKORGID.AXNAME) LIKE UPPER(?)";
         }
         if (aFilterObject.fkOrgId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.fkOrgId.indexOf('*',0) < 0 && aFilterObject.fkOrgId.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(AXORGID2FKORGID.FKORGID) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(AXORGID2FKORGID.FKORGID) LIKE UPPER(?)";
         }
         if (aFilterObject.fkName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.fkName.indexOf('*',0) < 0 && aFilterObject.fkName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(AXORGID2FKORGID.FKNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(AXORGID2FKORGID.FKNAME) LIKE UPPER(?)";
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

           if(aFilterObject.axOrgId != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.axOrgId);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.axName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.axName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.fkOrgId != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.fkOrgId);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.fkName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.fkName);
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
      for (i = 0; set.next(); i++) {
        /*
        if (i < fromPosition)
          continue;
        else if (i >= fromPosition + quantity) {
          i++;
          break;
        } */

        anObject = new AXOrgId2FKOrgIdShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.axOrgId = set.getString(2);
        anObject.axName = set.getString(3);
        anObject.fkOrgId = set.getString(4);
        anObject.fkName = set.getString(5);


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

  public int[] getFilteredCodeArrayOLD(AXOrgId2FKOrgId aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT AXORGID2FKORGID.CODE FROM AXORGID2FKORGID";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "AXORGID2FKORGID.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  AXORGID2FKORGID.CODE = ?";
        }
         if (aFilterObject.axOrgId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.axOrgId.indexOf('*',0) < 0 && aFilterObject.axOrgId.indexOf('?',0) < 0)
                 whereStr = whereStr + "  AXORGID2FKORGID.AXORGID = ?";
             else
                 whereStr = whereStr + "  AXORGID2FKORGID.AXORGID LIKE ?";
         }
         if (aFilterObject.axName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.axName.indexOf('*',0) < 0 && aFilterObject.axName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  AXORGID2FKORGID.AXNAME = ?";
             else
                 whereStr = whereStr + "  AXORGID2FKORGID.AXNAME LIKE ?";
         }
         if (aFilterObject.fkOrgId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.fkOrgId.indexOf('*',0) < 0 && aFilterObject.fkOrgId.indexOf('?',0) < 0)
                 whereStr = whereStr + "  AXORGID2FKORGID.FKORGID = ?";
             else
                 whereStr = whereStr + "  AXORGID2FKORGID.FKORGID LIKE ?";
         }
         if (aFilterObject.fkName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.fkName.indexOf('*',0) < 0 && aFilterObject.fkName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  AXORGID2FKORGID.FKNAME = ?";
             else
                 whereStr = whereStr + "  AXORGID2FKORGID.FKNAME LIKE ?";
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
         if (aFilterObject.axOrgId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.axOrgId.indexOf('*',0) < 0 && aFilterObject.axOrgId.indexOf('?',0) < 0)
                 whereStr = whereStr + " AXORGID2FKORGID.AXORGID = ?";
             else
                 whereStr = whereStr + " AXORGID2FKORGID.AXORGID LIKE ?";

           if(aFilterObject.axOrgId != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.axOrgId);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.axName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.axName.indexOf('*',0) < 0 && aFilterObject.axName.indexOf('?',0) < 0)
                 whereStr = whereStr + " AXORGID2FKORGID.AXNAME = ?";
             else
                 whereStr = whereStr + " AXORGID2FKORGID.AXNAME LIKE ?";

           if(aFilterObject.axName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.axName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.fkOrgId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.fkOrgId.indexOf('*',0) < 0 && aFilterObject.fkOrgId.indexOf('?',0) < 0)
                 whereStr = whereStr + " AXORGID2FKORGID.FKORGID = ?";
             else
                 whereStr = whereStr + " AXORGID2FKORGID.FKORGID LIKE ?";

           if(aFilterObject.fkOrgId != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.fkOrgId);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.fkName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.fkName.indexOf('*',0) < 0 && aFilterObject.fkName.indexOf('?',0) < 0)
                 whereStr = whereStr + " AXORGID2FKORGID.FKNAME = ?";
             else
                 whereStr = whereStr + " AXORGID2FKORGID.FKNAME LIKE ?";

           if(aFilterObject.fkName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.fkName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
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

  public int[] getFilteredCodeArray(AXOrgId2FKOrgIdFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(AXOrgId2FKOrgId aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT AXORGID2FKORGID.CODE FROM AXORGID2FKORGID";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "AXORGID2FKORGID.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  AXORGID2FKORGID.CODE = ?";
        }
         if (aFilterObject.axOrgId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.axOrgId.indexOf('*',0) < 0 && aFilterObject.axOrgId.indexOf('?',0) < 0)
                 whereStr = whereStr + "  AXORGID2FKORGID.AXORGID = ?";
             else
                 whereStr = whereStr + "  AXORGID2FKORGID.AXORGID LIKE ?";
         }
         if (aFilterObject.axName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.axName.indexOf('*',0) < 0 && aFilterObject.axName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  AXORGID2FKORGID.AXNAME = ?";
             else
                 whereStr = whereStr + "  AXORGID2FKORGID.AXNAME LIKE ?";
         }
         if (aFilterObject.fkOrgId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.fkOrgId.indexOf('*',0) < 0 && aFilterObject.fkOrgId.indexOf('?',0) < 0)
                 whereStr = whereStr + "  AXORGID2FKORGID.FKORGID = ?";
             else
                 whereStr = whereStr + "  AXORGID2FKORGID.FKORGID LIKE ?";
         }
         if (aFilterObject.fkName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.fkName.indexOf('*',0) < 0 && aFilterObject.fkName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  AXORGID2FKORGID.FKNAME = ?";
             else
                 whereStr = whereStr + "  AXORGID2FKORGID.FKNAME LIKE ?";
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
         if (aFilterObject.axOrgId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.axOrgId.indexOf('*',0) < 0 && aFilterObject.axOrgId.indexOf('?',0) < 0)
                 whereStr = whereStr + " AXORGID2FKORGID.AXORGID = ?";
             else
                 whereStr = whereStr + " AXORGID2FKORGID.AXORGID LIKE ?";

           if(aFilterObject.axOrgId != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.axOrgId);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.axName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.axName.indexOf('*',0) < 0 && aFilterObject.axName.indexOf('?',0) < 0)
                 whereStr = whereStr + " AXORGID2FKORGID.AXNAME = ?";
             else
                 whereStr = whereStr + " AXORGID2FKORGID.AXNAME LIKE ?";

           if(aFilterObject.axName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.axName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.fkOrgId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.fkOrgId.indexOf('*',0) < 0 && aFilterObject.fkOrgId.indexOf('?',0) < 0)
                 whereStr = whereStr + " AXORGID2FKORGID.FKORGID = ?";
             else
                 whereStr = whereStr + " AXORGID2FKORGID.FKORGID LIKE ?";

           if(aFilterObject.fkOrgId != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.fkOrgId);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.fkName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.fkName.indexOf('*',0) < 0 && aFilterObject.fkName.indexOf('?',0) < 0)
                 whereStr = whereStr + " AXORGID2FKORGID.FKNAME = ?";
             else
                 whereStr = whereStr + " AXORGID2FKORGID.FKNAME LIKE ?";

           if(aFilterObject.fkName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.fkName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
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


   public AXOrgId2FKOrgId getObject(int uid) throws PersistenceException
   {
    AXOrgId2FKOrgId result = new AXOrgId2FKOrgId();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(AXOrgId2FKOrgId anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  AXORGID2FKORGID.CODE, AXORGID2FKORGID.AXORGID, AXORGID2FKORGID.AXNAME, AXORGID2FKORGID.FKORGID, AXORGID2FKORGID.FKNAME "
    +" FROM AXORGID2FKORGID WHERE AXORGID2FKORGID.CODE = ?";

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
        anObject.axOrgId = set.getString(2);
        anObject.axName = set.getString(3);
        anObject.fkOrgId = set.getString(4);
        anObject.fkName = set.getString(5);
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


  public com.ksoe.energynet.valueobject.references.AXOrgId2FKOrgIdRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.AXOrgId2FKOrgIdRef ref = new com.ksoe.energynet.valueobject.references.AXOrgId2FKOrgIdRef();
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

    selectStr = "DELETE FROM  AXORGID2FKORGID WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    AXOrgId2FKOrgId object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%AXOrgId2FKOrgId.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(AXOrgId2FKOrgId.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%AXOrgId2FKOrgId.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(AXOrgId2FKOrgId.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%AXOrgId2FKOrgId.getObject%} access denied");

    selectStr =

    "SELECT  AXORGID2FKORGID.CODE FROM  AXORGID2FKORGID WHERE  AXORGID2FKORGID.CODE = ?";
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
    _checkConditionToken(condition,"code","AXORGID2FKORGID.CODE");
    _checkConditionToken(condition,"axorgid","AXORGID2FKORGID.AXORGID");
    _checkConditionToken(condition,"axname","AXORGID2FKORGID.AXNAME");
    _checkConditionToken(condition,"fkorgid","AXORGID2FKORGID.FKORGID");
    _checkConditionToken(condition,"fkname","AXORGID2FKORGID.FKNAME");
      // relationship conditions
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

  private void _collectAutoIncrementFields(AXOrgId2FKOrgId anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("AXORGID2FKORGID", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("AXORGID2FKORGID", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("AXORGID2FKORGID", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: AXORGID2FKORGID");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of AXOrgId2FKOrgIdDAO
