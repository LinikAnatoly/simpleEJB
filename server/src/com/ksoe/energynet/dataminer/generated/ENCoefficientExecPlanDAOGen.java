
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

import com.ksoe.energynet.valueobject.ENCoefficientExecPlan;
import com.ksoe.energynet.valueobject.filter.ENCoefficientExecPlanFilter;
import com.ksoe.energynet.valueobject.brief.ENCoefficientExecPlanShort;
import com.ksoe.energynet.valueobject.lists.ENCoefficientExecPlanShortList;


/**
 * DAO Object for ENCoefficientExecPlan;
 *
 */

public class ENCoefficientExecPlanDAOGen extends GenericDataMiner {

   public ENCoefficientExecPlanDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENCoefficientExecPlanDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   public boolean isEqual(ENCoefficientExecPlan inObject) throws PersistenceException
   {
      ENCoefficientExecPlan obj = new ENCoefficientExecPlan();
      obj.code = inObject.code;
      loadObject(obj);

	if(inObject.coefficient == null && obj.coefficient == null){}
	else
		if(inObject.coefficient == null || obj.coefficient == null) return false;
		else
			if ( ! inObject.coefficient.equals(obj.coefficient)){
				return false;
			}

	if(inObject.dateGen == null && obj.dateGen == null){}
	else
		if(inObject.dateGen == null || obj.dateGen == null) return false;
		else
			if (inObject.dateGen.compareTo(obj.dateGen) != 0){
				return false;
			}

     if (inObject.finPodrCode != obj.finPodrCode){
				return false;
			}

	if(inObject.axOrgId == null && obj.axOrgId == null){}
	else
		if(inObject.axOrgId == null || obj.axOrgId == null) return false;
		else
			if ( ! inObject.axOrgId.equals(obj.axOrgId)){
				return false;
			}
      return true;
   }

   public int add(ENCoefficientExecPlan anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENCoefficientExecPlan anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENCOEFFICIENTEXECPLAN (CODE,COEFFICIENT,DATEGEN,FINPODRCODE,AXORGID) VALUES (?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.coefficient != null)
        anObject.coefficient = anObject.coefficient.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.coefficient);
      if (anObject.dateGen == null)
        statement.setTimestamp(3,null);
      else
        statement.setTimestamp(3,new java.sql.Timestamp(anObject.dateGen.getTime()));
      if (anObject.finPodrCode != Integer.MIN_VALUE )
         statement.setInt(4,anObject.finPodrCode);
      else
         statement.setNull(4,java.sql.Types.INTEGER);
      statement.setString(5,anObject.axOrgId);

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
      throw new PersistenceException("Error in method {%ENCoefficientExecPlanDAOGen.add%}",e);
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

   public void save(ENCoefficientExecPlan anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENCoefficientExecPlan anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("COEFFICIENT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATEGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FINPODRCODE") == 0)
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
         }
       if(fields.size() == 0)
         return;
       }
      if(fields == null)
       {
        selectStr =
        "UPDATE ENCOEFFICIENTEXECPLAN SET  COEFFICIENT = ? , DATEGEN = ? , FINPODRCODE = ? , AXORGID = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENCOEFFICIENTEXECPLAN SET ";
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
      if (anObject.coefficient != null)
        anObject.coefficient = anObject.coefficient.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(1,anObject.coefficient);
      if (anObject.dateGen == null)
        statement.setTimestamp(2,null);
      else
        statement.setTimestamp(2,new java.sql.Timestamp(anObject.dateGen.getTime()));
      if (anObject.finPodrCode != Integer.MIN_VALUE )
         statement.setInt(3,anObject.finPodrCode);
      else
         statement.setNull(3,java.sql.Types.INTEGER);
      statement.setString(4,anObject.axOrgId);
          statement.setInt(5,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("COEFFICIENT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.coefficient != null)
                    anObject.coefficient = anObject.coefficient.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.coefficient);
                continue;
             }
            if("DATEGEN".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dateGen == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateGen.getTime()));
                continue;
             }
            if("FINPODRCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.finPodrCode);
                continue;
             }
            if("AXORGID".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.axOrgId);
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

   } // end of save(ENCoefficientExecPlan anObject,String[] anAttributes)


 public ENCoefficientExecPlanShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENCoefficientExecPlan filterObject = new ENCoefficientExecPlan();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENCoefficientExecPlanShort)list.get(0);
   return null;
  }

  public ENCoefficientExecPlanShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENCoefficientExecPlanShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENCoefficientExecPlanShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENCoefficientExecPlanShortList getFilteredList(ENCoefficientExecPlan filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENCoefficientExecPlanShortList getScrollableFilteredList(ENCoefficientExecPlan aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENCoefficientExecPlanShortList getScrollableFilteredList(ENCoefficientExecPlan aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENCoefficientExecPlanShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENCoefficientExecPlanShortList getScrollableFilteredList(ENCoefficientExecPlanFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENCoefficientExecPlanShortList getScrollableFilteredList(ENCoefficientExecPlanFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENCoefficientExecPlanShortList getScrollableFilteredList(ENCoefficientExecPlan aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENCoefficientExecPlanShortList getScrollableFilteredList(ENCoefficientExecPlan aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENCoefficientExecPlanShortList result = new ENCoefficientExecPlanShortList();
    ENCoefficientExecPlanShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCOEFFICIENTEXECPLAN.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENCOEFFICIENTEXECPLAN.CODE"+
     ",ENCOEFFICIENTEXECPLAN.COEFFICIENT"+
     ",ENCOEFFICIENTEXECPLAN.DATEGEN"+
     ",ENCOEFFICIENTEXECPLAN.FINPODRCODE"+
     ",ENCOEFFICIENTEXECPLAN.AXORGID"+

     " FROM ENCOEFFICIENTEXECPLAN " +
     //" WHERE "
  "";
    //selectStr = selectStr + " ${s} ENCOEFFICIENTEXECPLAN.CODE IN ( SELECT ENCOEFFICIENTEXECPLAN.CODE FROM ENCOEFFICIENTEXECPLAN ";

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCOEFFICIENTEXECPLAN.CODE = ?";
        }
        if(aFilterObject.coefficient != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCOEFFICIENTEXECPLAN.COEFFICIENT = ?";
        }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCOEFFICIENTEXECPLAN.DATEGEN = ?";
        }
        if(aFilterObject.finPodrCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCOEFFICIENTEXECPLAN.FINPODRCODE = ?";
        }
         if (aFilterObject.axOrgId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.axOrgId.indexOf('*',0) < 0 && aFilterObject.axOrgId.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCOEFFICIENTEXECPLAN.AXORGID) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCOEFFICIENTEXECPLAN.AXORGID) LIKE UPPER(?)";
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
        if(aFilterObject.coefficient != null){
            number++;
            aFilterObject.coefficient = aFilterObject.coefficient.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.coefficient);
        }
        if(aFilterObject.dateGen != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateGen.getTime()));
        }
         if(aFilterObject.finPodrCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finPodrCode);
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

        anObject = new ENCoefficientExecPlanShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.coefficient = set.getBigDecimal(2);
        if(anObject.coefficient != null)
            anObject.coefficient = anObject.coefficient.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.dateGen = set.getTimestamp(3);
        anObject.finPodrCode = set.getInt(4);
        if ( set.wasNull() )
            anObject.finPodrCode = Integer.MIN_VALUE;
        anObject.axOrgId = set.getString(5);


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

  public int[] getFilteredCodeArrayOLD(ENCoefficientExecPlan aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENCOEFFICIENTEXECPLAN.CODE FROM ENCOEFFICIENTEXECPLAN";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCOEFFICIENTEXECPLAN.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCOEFFICIENTEXECPLAN.CODE = ?";
        }
        if(aFilterObject.coefficient != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCOEFFICIENTEXECPLAN.COEFFICIENT = ?";
        }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCOEFFICIENTEXECPLAN.DATEGEN = ?";
        }
        if(aFilterObject.finPodrCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCOEFFICIENTEXECPLAN.FINPODRCODE = ?";
        }
         if (aFilterObject.axOrgId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.axOrgId.indexOf('*',0) < 0 && aFilterObject.axOrgId.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCOEFFICIENTEXECPLAN.AXORGID = ?";
             else
                 whereStr = whereStr + "  ENCOEFFICIENTEXECPLAN.AXORGID LIKE ?";
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
        if(aFilterObject.coefficient != null){
            number++;
            aFilterObject.coefficient = aFilterObject.coefficient.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.coefficient);
        }
        if(aFilterObject.dateGen != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateGen.getTime()));
        }
         if(aFilterObject.finPodrCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finPodrCode);
         }
         if (aFilterObject.axOrgId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.axOrgId.indexOf('*',0) < 0 && aFilterObject.axOrgId.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCOEFFICIENTEXECPLAN.AXORGID = ?";
             else
                 whereStr = whereStr + " ENCOEFFICIENTEXECPLAN.AXORGID LIKE ?";

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

  public int[] getFilteredCodeArray(ENCoefficientExecPlanFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENCoefficientExecPlan aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENCOEFFICIENTEXECPLAN.CODE FROM ENCOEFFICIENTEXECPLAN";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCOEFFICIENTEXECPLAN.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCOEFFICIENTEXECPLAN.CODE = ?";
        }
        if(aFilterObject.coefficient != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCOEFFICIENTEXECPLAN.COEFFICIENT = ?";
        }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCOEFFICIENTEXECPLAN.DATEGEN = ?";
        }
        if(aFilterObject.finPodrCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCOEFFICIENTEXECPLAN.FINPODRCODE = ?";
        }
         if (aFilterObject.axOrgId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.axOrgId.indexOf('*',0) < 0 && aFilterObject.axOrgId.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCOEFFICIENTEXECPLAN.AXORGID = ?";
             else
                 whereStr = whereStr + "  ENCOEFFICIENTEXECPLAN.AXORGID LIKE ?";
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
        if(aFilterObject.coefficient != null){
            number++;
            aFilterObject.coefficient = aFilterObject.coefficient.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.coefficient);
        }
        if(aFilterObject.dateGen != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateGen.getTime()));
        }
         if(aFilterObject.finPodrCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.finPodrCode);
         }
         if (aFilterObject.axOrgId != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.axOrgId.indexOf('*',0) < 0 && aFilterObject.axOrgId.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCOEFFICIENTEXECPLAN.AXORGID = ?";
             else
                 whereStr = whereStr + " ENCOEFFICIENTEXECPLAN.AXORGID LIKE ?";

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


   public ENCoefficientExecPlan getObject(int uid) throws PersistenceException
   {
    ENCoefficientExecPlan result = new ENCoefficientExecPlan();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENCoefficientExecPlan anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENCOEFFICIENTEXECPLAN.CODE, ENCOEFFICIENTEXECPLAN.COEFFICIENT, ENCOEFFICIENTEXECPLAN.DATEGEN, ENCOEFFICIENTEXECPLAN.FINPODRCODE, ENCOEFFICIENTEXECPLAN.AXORGID "
    +" FROM ENCOEFFICIENTEXECPLAN WHERE ENCOEFFICIENTEXECPLAN.CODE = ?";

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
        anObject.coefficient = set.getBigDecimal(2);
        if(anObject.coefficient != null)
            anObject.coefficient = anObject.coefficient.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.dateGen = set.getTimestamp(3);
        anObject.finPodrCode = set.getInt(4);
        if ( set.wasNull() )
           anObject.finPodrCode = Integer.MIN_VALUE;
        anObject.axOrgId = set.getString(5);
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


  public com.ksoe.energynet.valueobject.references.ENCoefficientExecPlanRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENCoefficientExecPlanRef ref = new com.ksoe.energynet.valueobject.references.ENCoefficientExecPlanRef();
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

    selectStr = "DELETE FROM  ENCOEFFICIENTEXECPLAN WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENCoefficientExecPlan object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENCoefficientExecPlan.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENCoefficientExecPlan.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENCoefficientExecPlan.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENCoefficientExecPlan.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENCoefficientExecPlan.getObject%} access denied");

    selectStr =

    "SELECT  ENCOEFFICIENTEXECPLAN.CODE FROM  ENCOEFFICIENTEXECPLAN WHERE  ENCOEFFICIENTEXECPLAN.CODE = ?";
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
    _checkConditionToken(condition,"code","ENCOEFFICIENTEXECPLAN.CODE");
    _checkConditionToken(condition,"coefficient","ENCOEFFICIENTEXECPLAN.COEFFICIENT");
    _checkConditionToken(condition,"dategen","ENCOEFFICIENTEXECPLAN.DATEGEN");
    _checkConditionToken(condition,"finpodrcode","ENCOEFFICIENTEXECPLAN.FINPODRCODE");
    _checkConditionToken(condition,"axorgid","ENCOEFFICIENTEXECPLAN.AXORGID");
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

  private void _collectAutoIncrementFields(ENCoefficientExecPlan anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENCOEFFICIENTEXECPLAN", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENCOEFFICIENTEXECPLAN", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENCOEFFICIENTEXECPLAN", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENCOEFFICIENTEXECPLAN");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENCoefficientExecPlanDAO
