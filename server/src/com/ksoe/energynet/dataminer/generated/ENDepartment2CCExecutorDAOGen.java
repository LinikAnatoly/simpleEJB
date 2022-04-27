
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer.generated;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.valueobject.ENDepartment2CCExecutor;
import com.ksoe.energynet.valueobject.brief.ENDepartment2CCExecutorShort;
import com.ksoe.energynet.valueobject.filter.ENDepartment2CCExecutorFilter;
import com.ksoe.energynet.valueobject.lists.ENDepartment2CCExecutorShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENDepartment2CCExecutor;
 *
 */

public class ENDepartment2CCExecutorDAOGen extends GenericDataMiner {

  public ENDepartment2CCExecutorDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENDepartment2CCExecutorDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENDepartment2CCExecutor inObject) throws PersistenceException
   {
      ENDepartment2CCExecutor obj = new ENDepartment2CCExecutor();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.ccExecutorCode != obj.ccExecutorCode){
       return false;
     }
     if (inObject.budgetRef.code != obj.budgetRef.code){
        return false;
     }
     if (inObject.responsibilityRef.code != obj.responsibilityRef.code){
        return false;
     }
      return true;
   }

   public int add(ENDepartment2CCExecutor anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENDepartment2CCExecutor anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENDEPARTMENT2CCEXECUTR (CODE,CCEXECUTORCODE,BUDGETREFCODE,RESPONSIBILITYREFCODE) VALUES (?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.ccExecutorCode != Integer.MIN_VALUE )
         statement.setInt(2,anObject.ccExecutorCode);
      else
         statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.budgetRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).exists(anObject.budgetRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENDepartment2CCExecutor.budgetRef.code%} = {%"+anObject.budgetRef.code+"%}");
        statement.setInt(3,anObject.budgetRef.code);
      }
      else
        statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.responsibilityRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).exists(anObject.responsibilityRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENDepartment2CCExecutor.responsibilityRef.code%} = {%"+anObject.responsibilityRef.code+"%}");
        statement.setInt(4,anObject.responsibilityRef.code);
      }
      else
        statement.setNull(4,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENDepartment2CCExecutorDAOGen.add%}",e);
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

   public void save(ENDepartment2CCExecutor anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENDepartment2CCExecutor anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("CCEXECUTORCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("BUDGETREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("RESPONSIBILITYREF") == 0)
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
        "UPDATE ENDEPARTMENT2CCEXECUTR SET  CCEXECUTORCODE = ? , BUDGETREFCODE = ? , RESPONSIBILITYREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENDEPARTMENT2CCEXECUTOR SET ";
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
      if (anObject.ccExecutorCode != Integer.MIN_VALUE )
         statement.setInt(1,anObject.ccExecutorCode);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.budgetRef.code != Integer.MIN_VALUE)
        statement.setInt(2,anObject.budgetRef.code);
      else
        statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.responsibilityRef.code != Integer.MIN_VALUE)
        statement.setInt(3,anObject.responsibilityRef.code);
      else
        statement.setNull(3,java.sql.Types.INTEGER);
          statement.setInt(4,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("CCEXECUTORCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.ccExecutorCode);
                continue;
             }
            if("BUDGETREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.budgetRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.budgetRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("RESPONSIBILITYREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.responsibilityRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.responsibilityRef.code);
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

   } // end of save(ENDepartment2CCExecutor anObject,String[] anAttributes)


 public ENDepartment2CCExecutorShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENDepartment2CCExecutor filterObject = new ENDepartment2CCExecutor();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENDepartment2CCExecutorShort)list.get(0);
   return null;
  }

  public ENDepartment2CCExecutorShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENDepartment2CCExecutorShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENDepartment2CCExecutorShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENDepartment2CCExecutorShortList getFilteredList(ENDepartment2CCExecutor filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENDepartment2CCExecutorShortList getScrollableFilteredList(ENDepartment2CCExecutor aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENDepartment2CCExecutorShortList getScrollableFilteredList(ENDepartment2CCExecutor aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENDepartment2CCExecutorShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENDepartment2CCExecutorShortList getScrollableFilteredList(ENDepartment2CCExecutorFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENDepartment2CCExecutorShortList getScrollableFilteredList(ENDepartment2CCExecutorFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENDepartment2CCExecutorShortList getScrollableFilteredList(ENDepartment2CCExecutor aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENDepartment2CCExecutorShortList getScrollableFilteredList(ENDepartment2CCExecutor aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENDepartment2CCExecutorShortList result = new ENDepartment2CCExecutorShortList();
    ENDepartment2CCExecutorShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENDEPARTMENT2CCEXECUTR.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENDEPARTMENT2CCEXECUTR.CODE"+

      ", ENDEPARTMENT.CODE " +
      ", ENDEPARTMENT.SHORTNAME " +
      ", ENDEPARTMENT.DATESTART " +
      ", ENDEPARTMENT.DATEFINAL " +
      ", ENDEPARTMENT.RENCODE " +
      ", ENDEPARTMENT.SHPZBALANS " +
      ", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
      ", ENDEPARTMENT.KAU_1884 " +
      ", ENDEPARTMENT.NAME_1884 " +
      ", ENDEPARTMENT.CODE " +
      ", ENDEPARTMENT.SHORTNAME " +
      ", ENDEPARTMENT.DATESTART " +
      ", ENDEPARTMENT.DATEFINAL " +
      ", ENDEPARTMENT.RENCODE " +
      ", ENDEPARTMENT.SHPZBALANS " +
      ", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
      ", ENDEPARTMENT.KAU_1884 " +
      ", ENDEPARTMENT.NAME_1884 " +
     " FROM ENDEPARTMENT2CCEXECUTR " +
     ", ENDEPARTMENT " +
     ", ENDEPARTMENT " +
     //" WHERE "
    "";
     whereStr = " ENDEPARTMENT.CODE = ENDEPARTMENT2CCEXECUTR.BUDGETREFCODE" ; //+
      whereStr = whereStr +" AND ENDEPARTMENT.CODE = ENDEPARTMENT2CCEXECUTR.RESPONSIBILITYREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENDEPARTMENT2CCEXECUTR.CODE IN ( SELECT ENDEPARTMENT2CCEXECUTR.CODE FROM ENDEPARTMENT2CCEXECUTR ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT2CCEXECUTR.CODE = ?";
        }
        if(aFilterObject.ccExecutorCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT2CCEXECUTR.CCEXECUTORCODE = ?";
        }
        if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENDEPARTMENT2CCEXECUTR.BUDGETREFCODE = ? ";
        }
        if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENDEPARTMENT2CCEXECUTR.RESPONSIBILITYREFCODE = ? ";
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
         if(aFilterObject.ccExecutorCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.ccExecutorCode);
         }
       if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.budgetRef.code);
       }
       if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.responsibilityRef.code);
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

        anObject = new ENDepartment2CCExecutorShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;

        anObject.budgetRefCode = set.getInt(2);
        if(set.wasNull())
        anObject.budgetRefCode = Integer.MIN_VALUE;
        anObject.budgetRefShortName = set.getString(3);
        anObject.budgetRefDateStart = set.getDate(4);
        anObject.budgetRefDateFinal = set.getDate(5);
        anObject.budgetRefRenCode = set.getInt(6);
        if(set.wasNull())
        anObject.budgetRefRenCode = Integer.MIN_VALUE;
        anObject.budgetRefShpzBalans = set.getString(7);
        anObject.budgetRefKau_table_id_1884 = set.getInt(8);
        if(set.wasNull())
        anObject.budgetRefKau_table_id_1884 = Integer.MIN_VALUE;
        anObject.budgetRefKau_1884 = set.getString(9);
        anObject.budgetRefName_1884 = set.getString(10);
        anObject.responsibilityRefCode = set.getInt(11);
        if(set.wasNull())
        anObject.responsibilityRefCode = Integer.MIN_VALUE;
        anObject.responsibilityRefShortName = set.getString(12);
        anObject.responsibilityRefDateStart = set.getDate(13);
        anObject.responsibilityRefDateFinal = set.getDate(14);
        anObject.responsibilityRefRenCode = set.getInt(15);
        if(set.wasNull())
        anObject.responsibilityRefRenCode = Integer.MIN_VALUE;
        anObject.responsibilityRefShpzBalans = set.getString(16);
        anObject.responsibilityRefKau_table_id_1884 = set.getInt(17);
        if(set.wasNull())
        anObject.responsibilityRefKau_table_id_1884 = Integer.MIN_VALUE;
        anObject.responsibilityRefKau_1884 = set.getString(18);
        anObject.responsibilityRefName_1884 = set.getString(19);

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

  public int[] getFilteredCodeArrayOLD(ENDepartment2CCExecutor aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENDEPARTMENT2CCEXECUTR.CODE FROM ENDEPARTMENT2CCEXECUTR";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENDEPARTMENT2CCEXECUTR.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT2CCEXECUTR.CODE = ?";
        }
        if(aFilterObject.ccExecutorCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT2CCEXECUTR.CCEXECUTORCODE = ?";
        }
        if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDEPARTMENT2CCEXECUTR.BUDGETREFCODE = ? ";
        }
        if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDEPARTMENT2CCEXECUTR.RESPONSIBILITYREFCODE = ? ";
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
         if(aFilterObject.ccExecutorCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.ccExecutorCode);
         }
       if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.budgetRef.code);
       }
       if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.responsibilityRef.code);
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

  public int[] getFilteredCodeArray(ENDepartment2CCExecutorFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENDepartment2CCExecutor aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENDEPARTMENT2CCEXECUTR.CODE FROM ENDEPARTMENT2CCEXECUTR";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENDEPARTMENT2CCEXECUTR.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT2CCEXECUTR.CODE = ?";
        }
        if(aFilterObject.ccExecutorCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENDEPARTMENT2CCEXECUTR.CCEXECUTORCODE = ?";
        }
        if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDEPARTMENT2CCEXECUTR.BUDGETREFCODE = ? ";
        }
        if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENDEPARTMENT2CCEXECUTR.RESPONSIBILITYREFCODE = ? ";
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
         if(aFilterObject.ccExecutorCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.ccExecutorCode);
         }
       if(aFilterObject.budgetRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.budgetRef.code);
       }
       if(aFilterObject.responsibilityRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.responsibilityRef.code);
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


   public ENDepartment2CCExecutor getObject(int uid) throws PersistenceException
   {
    ENDepartment2CCExecutor result = new ENDepartment2CCExecutor();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENDepartment2CCExecutor anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENDEPARTMENT2CCEXECUTR.CODE, ENDEPARTMENT2CCEXECUTR.CCEXECUTORCODE, ENDEPARTMENT2CCEXECUTR.BUDGETREFCODE, ENDEPARTMENT2CCEXECUTR.RESPONSIBILITYREFCODE "
    +" FROM ENDEPARTMENT2CCEXECUTR WHERE ENDEPARTMENT2CCEXECUTR.CODE = ?";

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
        anObject.ccExecutorCode = set.getInt(2);
        if ( set.wasNull() )
           anObject.ccExecutorCode = Integer.MIN_VALUE;
        anObject.budgetRef.code = set.getInt(3);
        if ( set.wasNull() )
            anObject.budgetRef.code = Integer.MIN_VALUE;
        anObject.responsibilityRef.code = set.getInt(4);
        if ( set.wasNull() )
            anObject.responsibilityRef.code = Integer.MIN_VALUE;
        if(anObject.budgetRef.code != Integer.MIN_VALUE)
        {
           anObject.setBudgetRef(
        new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getRef(anObject.budgetRef.code));
    }
        if(anObject.responsibilityRef.code != Integer.MIN_VALUE)
        {
           anObject.setResponsibilityRef(
        new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getRef(anObject.responsibilityRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENDepartment2CCExecutorRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENDepartment2CCExecutorRef ref = new com.ksoe.energynet.valueobject.references.ENDepartment2CCExecutorRef();
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

    selectStr = "DELETE FROM  ENDEPARTMENT2CCEXECUTR WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENDepartment2CCExecutor object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENDepartment2CCExecutor.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENDepartment2CCExecutor.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENDepartment2CCExecutor.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENDepartment2CCExecutor.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENDepartment2CCExecutor.getObject%} access denied");

    selectStr =

    "SELECT  ENDEPARTMENT2CCEXECUTR.CODE FROM  ENDEPARTMENT2CCEXECUTR WHERE  ENDEPARTMENT2CCEXECUTR.CODE = ?";
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
    _checkConditionToken(condition,"code","ENDEPARTMENT2CCEXECUTR.CODE");
    _checkConditionToken(condition,"ccexecutorcode","ENDEPARTMENT2CCEXECUTR.CCEXECUTORCODE");
      // relationship conditions
    _checkConditionToken(condition,"budgetref","BUDGETREFCODE");
    _checkConditionToken(condition,"budgetref.code","BUDGETREFCODE");
    _checkConditionToken(condition,"responsibilityref","RESPONSIBILITYREFCODE");
    _checkConditionToken(condition,"responsibilityref.code","RESPONSIBILITYREFCODE");
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

   private void _collectAutoIncrementFields(ENDepartment2CCExecutor anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("ENDEPARTMENT2CCEXECUTR", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("ENDEPARTMENT2CCEXECUTR", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("ENDEPARTMENT2CCEXECUTR", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: ENDEPARTMENT2CCEXECUTR");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of ENDepartment2CCExecutorDAO
