
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

import com.ksoe.energynet.valueobject.FINExecutor;
import com.ksoe.energynet.valueobject.filter.FINExecutorFilter;
import com.ksoe.energynet.valueobject.brief.FINExecutorShort;
import com.ksoe.energynet.valueobject.lists.FINExecutorShortList;


/**
 * DAO Object for FINExecutor;
 *
 */

public class FINExecutorDAOGen extends GenericDataMiner {

   public FINExecutorDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public FINExecutorDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   public boolean isEqual(FINExecutor inObject) throws PersistenceException
   {
      FINExecutor obj = new FINExecutor();
      obj.code = inObject.code;
      loadObject(obj);

	if(inObject.name == null && obj.name == null){}
	else
		if(inObject.name == null || obj.name == null) return false;
		else
			if ( ! inObject.name.equals(obj.name)){
				return false;
			}

     if (inObject.finCode != obj.finCode){
				return false;
			}

	if(inObject.finTypeName == null && obj.finTypeName == null){}
	else
		if(inObject.finTypeName == null || obj.finTypeName == null) return false;
		else
			if ( ! inObject.finTypeName.equals(obj.finTypeName)){
				return false;
			}

     if (inObject.finTypeCode != obj.finTypeCode){
				return false;
			}

	if(inObject.finKindName == null && obj.finKindName == null){}
	else
		if(inObject.finKindName == null || obj.finKindName == null) return false;
		else
			if ( ! inObject.finKindName.equals(obj.finKindName)){
				return false;
			}

     if (inObject.finKindCode != obj.finKindCode){
				return false;
			}

	if(inObject.finCehName == null && obj.finCehName == null){}
	else
		if(inObject.finCehName == null || obj.finCehName == null) return false;
		else
			if ( ! inObject.finCehName.equals(obj.finCehName)){
				return false;
			}

     if (inObject.finCehCode != obj.finCehCode){
				return false;
			}

	if(inObject.axOrgId == null && obj.axOrgId == null){}
	else
		if(inObject.axOrgId == null || obj.axOrgId == null) return false;
		else
			if ( ! inObject.axOrgId.equals(obj.axOrgId)){
				return false;
			}

	if(inObject.axParentOrgId == null && obj.axParentOrgId == null){}
	else
		if(inObject.axParentOrgId == null || obj.axParentOrgId == null) return false;
		else
			if ( ! inObject.axParentOrgId.equals(obj.axParentOrgId)){
				return false;
			}

	if(inObject.axParentOrgName == null && obj.axParentOrgName == null){}
	else
		if(inObject.axParentOrgName == null || obj.axParentOrgName == null) return false;
		else
			if ( ! inObject.axParentOrgName.equals(obj.axParentOrgName)){
				return false;
			}

     if (inObject.axOrgTypeId != obj.axOrgTypeId){
				return false;
			}

	if(inObject.axOrgTypeName == null && obj.axOrgTypeName == null){}
	else
		if(inObject.axOrgTypeName == null || obj.axOrgTypeName == null) return false;
		else
			if ( ! inObject.axOrgTypeName.equals(obj.axOrgTypeName)){
				return false;
			}
      return true;
   }

   public int add(FINExecutor anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(FINExecutor anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

  anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO FINEXECUTOR (CODE,NAME,FINCODE,FINTYPENAME,FINTYPECODE,FINKINDNAME,FINKINDCODE,FINCEHNAME,FINCEHCODE,AXORGID,AXPARENTORGID,AXPARENTORGNAME,AXORGTYPEID,AXORGTYPENAME,MODIFY_TIME) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.name);
      if (anObject.finCode != Integer.MIN_VALUE )
         statement.setInt(3,anObject.finCode);
      else
         statement.setNull(3,java.sql.Types.INTEGER);
      statement.setString(4,anObject.finTypeName);
      if (anObject.finTypeCode != Integer.MIN_VALUE )
         statement.setInt(5,anObject.finTypeCode);
      else
         statement.setNull(5,java.sql.Types.INTEGER);
      statement.setString(6,anObject.finKindName);
      if (anObject.finKindCode != Integer.MIN_VALUE )
         statement.setInt(7,anObject.finKindCode);
      else
         statement.setNull(7,java.sql.Types.INTEGER);
      statement.setString(8,anObject.finCehName);
      if (anObject.finCehCode != Integer.MIN_VALUE )
         statement.setInt(9,anObject.finCehCode);
      else
         statement.setNull(9,java.sql.Types.INTEGER);
      statement.setString(10,anObject.axOrgId);
      statement.setString(11,anObject.axParentOrgId);
      statement.setString(12,anObject.axParentOrgName);
      if (anObject.axOrgTypeId != Integer.MIN_VALUE )
         statement.setInt(13,anObject.axOrgTypeId);
      else
         statement.setNull(13,java.sql.Types.INTEGER);
      statement.setString(14,anObject.axOrgTypeName);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(15,null);
      else
        statement.setBigDecimal(15,new java.math.BigDecimal(anObject.modify_time));

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
      throw new PersistenceException("Error in method {%FINExecutorDAOGen.add%}",e);
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

   public void save(FINExecutor anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(FINExecutor anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      FINExecutor oldObject = new FINExecutor();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+FINExecutor.modify_time_Field+" FROM  FINEXECUTOR WHERE CODE = ?";

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
          if(fieldNameStr.compareTo("NAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FINCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FINTYPENAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FINTYPECODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FINKINDNAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FINKINDCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FINCEHNAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FINCEHCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("AXORGID") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("AXPARENTORGID") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("AXPARENTORGNAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("AXORGTYPEID") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("AXORGTYPENAME") == 0)
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
         }
       if(fields.size() == 0)
         return;
       }
      if(fields == null)
       {
        selectStr =
        "UPDATE FINEXECUTOR SET  NAME = ? , FINCODE = ? , FINTYPENAME = ? , FINTYPECODE = ? , FINKINDNAME = ? , FINKINDCODE = ? , FINCEHNAME = ? , FINCEHCODE = ? , AXORGID = ? , AXPARENTORGID = ? , AXPARENTORGNAME = ? , AXORGTYPEID = ? , AXORGTYPENAME = ? , MODIFY_TIME = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE FINEXECUTOR SET ";
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
      statement.setString(1,anObject.name);
      if (anObject.finCode != Integer.MIN_VALUE )
         statement.setInt(2,anObject.finCode);
      else
         statement.setNull(2,java.sql.Types.INTEGER);
      statement.setString(3,anObject.finTypeName);
      if (anObject.finTypeCode != Integer.MIN_VALUE )
         statement.setInt(4,anObject.finTypeCode);
      else
         statement.setNull(4,java.sql.Types.INTEGER);
      statement.setString(5,anObject.finKindName);
      if (anObject.finKindCode != Integer.MIN_VALUE )
         statement.setInt(6,anObject.finKindCode);
      else
         statement.setNull(6,java.sql.Types.INTEGER);
      statement.setString(7,anObject.finCehName);
      if (anObject.finCehCode != Integer.MIN_VALUE )
         statement.setInt(8,anObject.finCehCode);
      else
         statement.setNull(8,java.sql.Types.INTEGER);
      statement.setString(9,anObject.axOrgId);
      statement.setString(10,anObject.axParentOrgId);
      statement.setString(11,anObject.axParentOrgName);
      if (anObject.axOrgTypeId != Integer.MIN_VALUE )
         statement.setInt(12,anObject.axOrgTypeId);
      else
         statement.setNull(12,java.sql.Types.INTEGER);
      statement.setString(13,anObject.axOrgTypeName);
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(14,null);
      else
        statement.setBigDecimal(14,new java.math.BigDecimal(anObject.modify_time));
          statement.setInt(15,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("NAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.name);
                continue;
             }
            if("FINCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.finCode);
                continue;
             }
            if("FINTYPENAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.finTypeName);
                continue;
             }
            if("FINTYPECODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.finTypeCode);
                continue;
             }
            if("FINKINDNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.finKindName);
                continue;
             }
            if("FINKINDCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.finKindCode);
                continue;
             }
            if("FINCEHNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.finCehName);
                continue;
             }
            if("FINCEHCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.finCehCode);
                continue;
             }
            if("AXORGID".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.axOrgId);
                continue;
             }
            if("AXPARENTORGID".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.axParentOrgId);
                continue;
             }
            if("AXPARENTORGNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.axParentOrgName);
                continue;
             }
            if("AXORGTYPEID".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.axOrgTypeId);
                continue;
             }
            if("AXORGTYPENAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.axOrgTypeName);
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

   } // end of save(FINExecutor anObject,String[] anAttributes)


 public FINExecutorShort getShortObject(int anObjectCode) throws PersistenceException
  {
   FINExecutor filterObject = new FINExecutor();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (FINExecutorShort)list.get(0);
   return null;
  }

  public FINExecutorShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public FINExecutorShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public FINExecutorShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public FINExecutorShortList getFilteredList(FINExecutor filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public FINExecutorShortList getScrollableFilteredList(FINExecutor aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public FINExecutorShortList getScrollableFilteredList(FINExecutor aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public FINExecutorShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public FINExecutorShortList getScrollableFilteredList(FINExecutorFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public FINExecutorShortList getScrollableFilteredList(FINExecutorFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public FINExecutorShortList getScrollableFilteredList(FINExecutor aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public FINExecutorShortList getScrollableFilteredList(FINExecutor aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    FINExecutorShortList result = new FINExecutorShortList();
    FINExecutorShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "FINEXECUTOR.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "FINEXECUTOR.CODE"+
     ",FINEXECUTOR.NAME"+
     ",FINEXECUTOR.FINCODE"+
     ",FINEXECUTOR.FINTYPENAME"+
     ",FINEXECUTOR.FINTYPECODE"+
     ",FINEXECUTOR.FINKINDNAME"+
     ",FINEXECUTOR.FINKINDCODE"+
     ",FINEXECUTOR.FINCEHNAME"+
     ",FINEXECUTOR.FINCEHCODE"+
     ",FINEXECUTOR.AXORGID"+
     ",FINEXECUTOR.AXPARENTORGID"+
     ",FINEXECUTOR.AXPARENTORGNAME"+
     ",FINEXECUTOR.AXORGTYPEID"+
     ",FINEXECUTOR.AXORGTYPENAME"+

     " FROM FINEXECUTOR " +
     //" WHERE "
  "";
    //selectStr = selectStr + " ${s} FINEXECUTOR.CODE IN ( SELECT FINEXECUTOR.CODE FROM FINEXECUTOR ";

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(FINEXECUTOR.NAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(FINEXECUTOR.NAME) LIKE UPPER(?)";
         }
        if(aFilterObject.finCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR.FINCODE = ?";
        }
         if (aFilterObject.finTypeName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finTypeName.indexOf('*',0) < 0 && aFilterObject.finTypeName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(FINEXECUTOR.FINTYPENAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(FINEXECUTOR.FINTYPENAME) LIKE UPPER(?)";
         }
        if(aFilterObject.finTypeCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR.FINTYPECODE = ?";
        }
         if (aFilterObject.finKindName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finKindName.indexOf('*',0) < 0 && aFilterObject.finKindName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(FINEXECUTOR.FINKINDNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(FINEXECUTOR.FINKINDNAME) LIKE UPPER(?)";
         }
        if(aFilterObject.finKindCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR.FINKINDCODE = ?";
        }
         if (aFilterObject.finCehName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finCehName.indexOf('*',0) < 0 && aFilterObject.finCehName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(FINEXECUTOR.FINCEHNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(FINEXECUTOR.FINCEHNAME) LIKE UPPER(?)";
         }
        if(aFilterObject.finCehCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR.FINCEHCODE = ?";
        }
         if (aFilterObject.axOrgId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.axOrgId.indexOf('*',0) < 0 && aFilterObject.axOrgId.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(FINEXECUTOR.AXORGID) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(FINEXECUTOR.AXORGID) LIKE UPPER(?)";
         }
         if (aFilterObject.axParentOrgId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.axParentOrgId.indexOf('*',0) < 0 && aFilterObject.axParentOrgId.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(FINEXECUTOR.AXPARENTORGID) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(FINEXECUTOR.AXPARENTORGID) LIKE UPPER(?)";
         }
         if (aFilterObject.axParentOrgName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.axParentOrgName.indexOf('*',0) < 0 && aFilterObject.axParentOrgName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(FINEXECUTOR.AXPARENTORGNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(FINEXECUTOR.AXPARENTORGNAME) LIKE UPPER(?)";
         }
        if(aFilterObject.axOrgTypeId != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR.AXORGTYPEID = ?";
        }
         if (aFilterObject.axOrgTypeName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.axOrgTypeName.indexOf('*',0) < 0 && aFilterObject.axOrgTypeName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(FINEXECUTOR.AXORGTYPENAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(FINEXECUTOR.AXORGTYPENAME) LIKE UPPER(?)";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR.MODIFY_TIME = ?";
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
         if(aFilterObject.finCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finCode);
         }

           if(aFilterObject.finTypeName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finTypeName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.finTypeCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finTypeCode);
         }

           if(aFilterObject.finKindName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finKindName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.finKindCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finKindCode);
         }

           if(aFilterObject.finCehName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finCehName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.finCehCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finCehCode);
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

           if(aFilterObject.axParentOrgId != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.axParentOrgId);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.axParentOrgName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.axParentOrgName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.axOrgTypeId != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.axOrgTypeId);
         }

           if(aFilterObject.axOrgTypeName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.axOrgTypeName);
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

        anObject = new FINExecutorShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.name = set.getString(2);
        anObject.finCode = set.getInt(3);
        if ( set.wasNull() )
            anObject.finCode = Integer.MIN_VALUE;
        anObject.finTypeName = set.getString(4);
        anObject.finTypeCode = set.getInt(5);
        if ( set.wasNull() )
            anObject.finTypeCode = Integer.MIN_VALUE;
        anObject.finKindName = set.getString(6);
        anObject.finKindCode = set.getInt(7);
        if ( set.wasNull() )
            anObject.finKindCode = Integer.MIN_VALUE;
        anObject.finCehName = set.getString(8);
        anObject.finCehCode = set.getInt(9);
        if ( set.wasNull() )
            anObject.finCehCode = Integer.MIN_VALUE;
        anObject.axOrgId = set.getString(10);
        anObject.axParentOrgId = set.getString(11);
        anObject.axParentOrgName = set.getString(12);
        anObject.axOrgTypeId = set.getInt(13);
        if ( set.wasNull() )
            anObject.axOrgTypeId = Integer.MIN_VALUE;
        anObject.axOrgTypeName = set.getString(14);


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

  public int[] getFilteredCodeArrayOLD(FINExecutor aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT FINEXECUTOR.CODE FROM FINEXECUTOR";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "FINEXECUTOR.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINEXECUTOR.NAME = ?";
             else
                 whereStr = whereStr + "  FINEXECUTOR.NAME LIKE ?";
         }
        if(aFilterObject.finCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR.FINCODE = ?";
        }
         if (aFilterObject.finTypeName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finTypeName.indexOf('*',0) < 0 && aFilterObject.finTypeName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINEXECUTOR.FINTYPENAME = ?";
             else
                 whereStr = whereStr + "  FINEXECUTOR.FINTYPENAME LIKE ?";
         }
        if(aFilterObject.finTypeCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR.FINTYPECODE = ?";
        }
         if (aFilterObject.finKindName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finKindName.indexOf('*',0) < 0 && aFilterObject.finKindName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINEXECUTOR.FINKINDNAME = ?";
             else
                 whereStr = whereStr + "  FINEXECUTOR.FINKINDNAME LIKE ?";
         }
        if(aFilterObject.finKindCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR.FINKINDCODE = ?";
        }
         if (aFilterObject.finCehName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finCehName.indexOf('*',0) < 0 && aFilterObject.finCehName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINEXECUTOR.FINCEHNAME = ?";
             else
                 whereStr = whereStr + "  FINEXECUTOR.FINCEHNAME LIKE ?";
         }
        if(aFilterObject.finCehCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR.FINCEHCODE = ?";
        }
         if (aFilterObject.axOrgId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.axOrgId.indexOf('*',0) < 0 && aFilterObject.axOrgId.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINEXECUTOR.AXORGID = ?";
             else
                 whereStr = whereStr + "  FINEXECUTOR.AXORGID LIKE ?";
         }
         if (aFilterObject.axParentOrgId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.axParentOrgId.indexOf('*',0) < 0 && aFilterObject.axParentOrgId.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINEXECUTOR.AXPARENTORGID = ?";
             else
                 whereStr = whereStr + "  FINEXECUTOR.AXPARENTORGID LIKE ?";
         }
         if (aFilterObject.axParentOrgName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.axParentOrgName.indexOf('*',0) < 0 && aFilterObject.axParentOrgName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINEXECUTOR.AXPARENTORGNAME = ?";
             else
                 whereStr = whereStr + "  FINEXECUTOR.AXPARENTORGNAME LIKE ?";
         }
        if(aFilterObject.axOrgTypeId != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR.AXORGTYPEID = ?";
        }
         if (aFilterObject.axOrgTypeName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.axOrgTypeName.indexOf('*',0) < 0 && aFilterObject.axOrgTypeName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINEXECUTOR.AXORGTYPENAME = ?";
             else
                 whereStr = whereStr + "  FINEXECUTOR.AXORGTYPENAME LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR.MODIFY_TIME = ?";
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
                 whereStr = whereStr + " FINEXECUTOR.NAME = ?";
             else
                 whereStr = whereStr + " FINEXECUTOR.NAME LIKE ?";

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
         if(aFilterObject.finCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finCode);
         }
         if (aFilterObject.finTypeName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.finTypeName.indexOf('*',0) < 0 && aFilterObject.finTypeName.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINEXECUTOR.FINTYPENAME = ?";
             else
                 whereStr = whereStr + " FINEXECUTOR.FINTYPENAME LIKE ?";

           if(aFilterObject.finTypeName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finTypeName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.finTypeCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finTypeCode);
         }
         if (aFilterObject.finKindName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.finKindName.indexOf('*',0) < 0 && aFilterObject.finKindName.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINEXECUTOR.FINKINDNAME = ?";
             else
                 whereStr = whereStr + " FINEXECUTOR.FINKINDNAME LIKE ?";

           if(aFilterObject.finKindName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finKindName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.finKindCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finKindCode);
         }
         if (aFilterObject.finCehName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.finCehName.indexOf('*',0) < 0 && aFilterObject.finCehName.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINEXECUTOR.FINCEHNAME = ?";
             else
                 whereStr = whereStr + " FINEXECUTOR.FINCEHNAME LIKE ?";

           if(aFilterObject.finCehName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finCehName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.finCehCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finCehCode);
         }
         if (aFilterObject.axOrgId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.axOrgId.indexOf('*',0) < 0 && aFilterObject.axOrgId.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINEXECUTOR.AXORGID = ?";
             else
                 whereStr = whereStr + " FINEXECUTOR.AXORGID LIKE ?";

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
         if (aFilterObject.axParentOrgId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.axParentOrgId.indexOf('*',0) < 0 && aFilterObject.axParentOrgId.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINEXECUTOR.AXPARENTORGID = ?";
             else
                 whereStr = whereStr + " FINEXECUTOR.AXPARENTORGID LIKE ?";

           if(aFilterObject.axParentOrgId != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.axParentOrgId);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.axParentOrgName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.axParentOrgName.indexOf('*',0) < 0 && aFilterObject.axParentOrgName.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINEXECUTOR.AXPARENTORGNAME = ?";
             else
                 whereStr = whereStr + " FINEXECUTOR.AXPARENTORGNAME LIKE ?";

           if(aFilterObject.axParentOrgName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.axParentOrgName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.axOrgTypeId != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.axOrgTypeId);
         }
         if (aFilterObject.axOrgTypeName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.axOrgTypeName.indexOf('*',0) < 0 && aFilterObject.axOrgTypeName.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINEXECUTOR.AXORGTYPENAME = ?";
             else
                 whereStr = whereStr + " FINEXECUTOR.AXORGTYPENAME LIKE ?";

           if(aFilterObject.axOrgTypeName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.axOrgTypeName);
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

  public int[] getFilteredCodeArray(FINExecutorFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(FINExecutor aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT FINEXECUTOR.CODE FROM FINEXECUTOR";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "FINEXECUTOR.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR.CODE = ?";
        }
         if (aFilterObject.name != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.name.indexOf('*',0) < 0 && aFilterObject.name.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINEXECUTOR.NAME = ?";
             else
                 whereStr = whereStr + "  FINEXECUTOR.NAME LIKE ?";
         }
        if(aFilterObject.finCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR.FINCODE = ?";
        }
         if (aFilterObject.finTypeName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finTypeName.indexOf('*',0) < 0 && aFilterObject.finTypeName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINEXECUTOR.FINTYPENAME = ?";
             else
                 whereStr = whereStr + "  FINEXECUTOR.FINTYPENAME LIKE ?";
         }
        if(aFilterObject.finTypeCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR.FINTYPECODE = ?";
        }
         if (aFilterObject.finKindName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finKindName.indexOf('*',0) < 0 && aFilterObject.finKindName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINEXECUTOR.FINKINDNAME = ?";
             else
                 whereStr = whereStr + "  FINEXECUTOR.FINKINDNAME LIKE ?";
         }
        if(aFilterObject.finKindCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR.FINKINDCODE = ?";
        }
         if (aFilterObject.finCehName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finCehName.indexOf('*',0) < 0 && aFilterObject.finCehName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINEXECUTOR.FINCEHNAME = ?";
             else
                 whereStr = whereStr + "  FINEXECUTOR.FINCEHNAME LIKE ?";
         }
        if(aFilterObject.finCehCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR.FINCEHCODE = ?";
        }
         if (aFilterObject.axOrgId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.axOrgId.indexOf('*',0) < 0 && aFilterObject.axOrgId.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINEXECUTOR.AXORGID = ?";
             else
                 whereStr = whereStr + "  FINEXECUTOR.AXORGID LIKE ?";
         }
         if (aFilterObject.axParentOrgId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.axParentOrgId.indexOf('*',0) < 0 && aFilterObject.axParentOrgId.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINEXECUTOR.AXPARENTORGID = ?";
             else
                 whereStr = whereStr + "  FINEXECUTOR.AXPARENTORGID LIKE ?";
         }
         if (aFilterObject.axParentOrgName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.axParentOrgName.indexOf('*',0) < 0 && aFilterObject.axParentOrgName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINEXECUTOR.AXPARENTORGNAME = ?";
             else
                 whereStr = whereStr + "  FINEXECUTOR.AXPARENTORGNAME LIKE ?";
         }
        if(aFilterObject.axOrgTypeId != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR.AXORGTYPEID = ?";
        }
         if (aFilterObject.axOrgTypeName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.axOrgTypeName.indexOf('*',0) < 0 && aFilterObject.axOrgTypeName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINEXECUTOR.AXORGTYPENAME = ?";
             else
                 whereStr = whereStr + "  FINEXECUTOR.AXORGTYPENAME LIKE ?";
         }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINEXECUTOR.MODIFY_TIME = ?";
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
                 whereStr = whereStr + " FINEXECUTOR.NAME = ?";
             else
                 whereStr = whereStr + " FINEXECUTOR.NAME LIKE ?";

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
         if(aFilterObject.finCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finCode);
         }
         if (aFilterObject.finTypeName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.finTypeName.indexOf('*',0) < 0 && aFilterObject.finTypeName.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINEXECUTOR.FINTYPENAME = ?";
             else
                 whereStr = whereStr + " FINEXECUTOR.FINTYPENAME LIKE ?";

           if(aFilterObject.finTypeName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finTypeName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.finTypeCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finTypeCode);
         }
         if (aFilterObject.finKindName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.finKindName.indexOf('*',0) < 0 && aFilterObject.finKindName.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINEXECUTOR.FINKINDNAME = ?";
             else
                 whereStr = whereStr + " FINEXECUTOR.FINKINDNAME LIKE ?";

           if(aFilterObject.finKindName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finKindName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.finKindCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finKindCode);
         }
         if (aFilterObject.finCehName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.finCehName.indexOf('*',0) < 0 && aFilterObject.finCehName.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINEXECUTOR.FINCEHNAME = ?";
             else
                 whereStr = whereStr + " FINEXECUTOR.FINCEHNAME LIKE ?";

           if(aFilterObject.finCehName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finCehName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.finCehCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finCehCode);
         }
         if (aFilterObject.axOrgId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.axOrgId.indexOf('*',0) < 0 && aFilterObject.axOrgId.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINEXECUTOR.AXORGID = ?";
             else
                 whereStr = whereStr + " FINEXECUTOR.AXORGID LIKE ?";

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
         if (aFilterObject.axParentOrgId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.axParentOrgId.indexOf('*',0) < 0 && aFilterObject.axParentOrgId.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINEXECUTOR.AXPARENTORGID = ?";
             else
                 whereStr = whereStr + " FINEXECUTOR.AXPARENTORGID LIKE ?";

           if(aFilterObject.axParentOrgId != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.axParentOrgId);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.axParentOrgName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.axParentOrgName.indexOf('*',0) < 0 && aFilterObject.axParentOrgName.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINEXECUTOR.AXPARENTORGNAME = ?";
             else
                 whereStr = whereStr + " FINEXECUTOR.AXPARENTORGNAME LIKE ?";

           if(aFilterObject.axParentOrgName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.axParentOrgName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.axOrgTypeId != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.axOrgTypeId);
         }
         if (aFilterObject.axOrgTypeName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.axOrgTypeName.indexOf('*',0) < 0 && aFilterObject.axOrgTypeName.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINEXECUTOR.AXORGTYPENAME = ?";
             else
                 whereStr = whereStr + " FINEXECUTOR.AXORGTYPENAME LIKE ?";

           if(aFilterObject.axOrgTypeName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.axOrgTypeName);
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


   public FINExecutor getObject(int uid) throws PersistenceException
   {
    FINExecutor result = new FINExecutor();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(FINExecutor anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  FINEXECUTOR.CODE, FINEXECUTOR.NAME, FINEXECUTOR.FINCODE, FINEXECUTOR.FINTYPENAME, FINEXECUTOR.FINTYPECODE, FINEXECUTOR.FINKINDNAME, FINEXECUTOR.FINKINDCODE, FINEXECUTOR.FINCEHNAME, FINEXECUTOR.FINCEHCODE, FINEXECUTOR.AXORGID, FINEXECUTOR.AXPARENTORGID, FINEXECUTOR.AXPARENTORGNAME, FINEXECUTOR.AXORGTYPEID, FINEXECUTOR.AXORGTYPENAME, FINEXECUTOR.MODIFY_TIME "
    +" FROM FINEXECUTOR WHERE FINEXECUTOR.CODE = ?";

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
        anObject.finCode = set.getInt(3);
        if ( set.wasNull() )
           anObject.finCode = Integer.MIN_VALUE;
        anObject.finTypeName = set.getString(4);
        anObject.finTypeCode = set.getInt(5);
        if ( set.wasNull() )
           anObject.finTypeCode = Integer.MIN_VALUE;
        anObject.finKindName = set.getString(6);
        anObject.finKindCode = set.getInt(7);
        if ( set.wasNull() )
           anObject.finKindCode = Integer.MIN_VALUE;
        anObject.finCehName = set.getString(8);
        anObject.finCehCode = set.getInt(9);
        if ( set.wasNull() )
           anObject.finCehCode = Integer.MIN_VALUE;
        anObject.axOrgId = set.getString(10);
        anObject.axParentOrgId = set.getString(11);
        anObject.axParentOrgName = set.getString(12);
        anObject.axOrgTypeId = set.getInt(13);
        if ( set.wasNull() )
           anObject.axOrgTypeId = Integer.MIN_VALUE;
        anObject.axOrgTypeName = set.getString(14);
        anObject.modify_time = set.getLong(15);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
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


  public com.ksoe.energynet.valueobject.references.FINExecutorRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.FINExecutorRef ref = new com.ksoe.energynet.valueobject.references.FINExecutorRef();
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

    selectStr = "DELETE FROM  FINEXECUTOR WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    FINExecutor object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%FINExecutor.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(FINExecutor.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%FINExecutor.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(FINExecutor.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%FINExecutor.getObject%} access denied");

    selectStr =

    "SELECT  FINEXECUTOR.CODE FROM  FINEXECUTOR WHERE  FINEXECUTOR.CODE = ?";
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
    _checkConditionToken(condition,"code","FINEXECUTOR.CODE");
    _checkConditionToken(condition,"name","FINEXECUTOR.NAME");
    _checkConditionToken(condition,"fincode","FINEXECUTOR.FINCODE");
    _checkConditionToken(condition,"fintypename","FINEXECUTOR.FINTYPENAME");
    _checkConditionToken(condition,"fintypecode","FINEXECUTOR.FINTYPECODE");
    _checkConditionToken(condition,"finkindname","FINEXECUTOR.FINKINDNAME");
    _checkConditionToken(condition,"finkindcode","FINEXECUTOR.FINKINDCODE");
    _checkConditionToken(condition,"fincehname","FINEXECUTOR.FINCEHNAME");
    _checkConditionToken(condition,"fincehcode","FINEXECUTOR.FINCEHCODE");
    _checkConditionToken(condition,"axorgid","FINEXECUTOR.AXORGID");
    _checkConditionToken(condition,"axparentorgid","FINEXECUTOR.AXPARENTORGID");
    _checkConditionToken(condition,"axparentorgname","FINEXECUTOR.AXPARENTORGNAME");
    _checkConditionToken(condition,"axorgtypeid","FINEXECUTOR.AXORGTYPEID");
    _checkConditionToken(condition,"axorgtypename","FINEXECUTOR.AXORGTYPENAME");
    _checkConditionToken(condition,"modify_time","FINEXECUTOR.MODIFY_TIME");
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

  private void _collectAutoIncrementFields(FINExecutor anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("FINEXECUTOR", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("FINEXECUTOR", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("FINEXECUTOR", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: FINEXECUTOR");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of FINExecutorDAO
