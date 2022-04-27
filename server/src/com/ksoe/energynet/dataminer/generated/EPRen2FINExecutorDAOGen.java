
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

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.valueobject.EPRen2FINExecutor;
import com.ksoe.energynet.valueobject.brief.EPRen2FINExecutorShort;
import com.ksoe.energynet.valueobject.filter.EPRen2FINExecutorFilter;
import com.ksoe.energynet.valueobject.lists.EPRen2FINExecutorShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;

/**
 * DAO Object for EPRen2FINExecutor;
 *
 */

public class EPRen2FINExecutorDAOGen extends GenericDataMiner {

  public EPRen2FINExecutorDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public EPRen2FINExecutorDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(EPRen2FINExecutor inObject) throws PersistenceException
   {
      EPRen2FINExecutor obj = new EPRen2FINExecutor();
      obj.code = inObject.code;
      loadObject(obj);
     if (inObject.renRef.code != obj.renRef.code){
        return false;
     }
     if (inObject.finExecutorRef.code != obj.finExecutorRef.code){
        return false;
     }
     if (inObject.departmentRef.code != obj.departmentRef.code){
        return false;
     }
      return true;
   }

   public int add(EPRen2FINExecutor anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(EPRen2FINExecutor anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO EPREN2FINEXECUTOR (CODE,RENREFCODE,FINEXECUTORREFCODE,DEPARTMENTREFCODE) VALUES (?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.renRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energypro.dataminer.generated.EPRenDAOGen(connection,getUserProfile()).exists(anObject.renRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energypro.valueobject.EPRen2FINExecutor.renRef.code%} = {%"+anObject.renRef.code+"%}");
        statement.setInt(2,anObject.renRef.code);
      }
      else
        statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.finExecutorRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.FINExecutorDAOGen(connection,getUserProfile()).exists(anObject.finExecutorRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.EPRen2FINExecutor.finExecutorRef.code%} = {%"+anObject.finExecutorRef.code+"%}");
        statement.setInt(3,anObject.finExecutorRef.code);
      }
      else
        statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.departmentRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).exists(anObject.departmentRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.EPRen2FINExecutor.departmentRef.code%} = {%"+anObject.departmentRef.code+"%}");
        statement.setInt(4,anObject.departmentRef.code);
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
      throw new PersistenceException("Error in method {%EPRen2FINExecutorDAOGen.add%}",e);
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

   public void save(EPRen2FINExecutor anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(EPRen2FINExecutor anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("RENREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FINEXECUTORREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DEPARTMENTREF") == 0)
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
        "UPDATE EPREN2FINEXECUTOR SET RENREFCODE = ? , FINEXECUTORREFCODE = ? , DEPARTMENTREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE EPREN2FINEXECUTOR SET ";
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
      if (anObject.renRef.code != Integer.MIN_VALUE)
        statement.setInt(1,anObject.renRef.code);
      else
        statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.finExecutorRef.code != Integer.MIN_VALUE)
        statement.setInt(2,anObject.finExecutorRef.code);
      else
        statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.departmentRef.code != Integer.MIN_VALUE)
        statement.setInt(3,anObject.departmentRef.code);
      else
        statement.setNull(3,java.sql.Types.INTEGER);
          statement.setInt(4,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("RENREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.renRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.renRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("FINEXECUTORREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.finExecutorRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.finExecutorRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("DEPARTMENTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.departmentRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.departmentRef.code);
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

   } // end of save(EPRen2FINExecutor anObject,String[] anAttributes)


 public EPRen2FINExecutorShort getShortObject(int anObjectCode) throws PersistenceException
  {
   EPRen2FINExecutor filterObject = new EPRen2FINExecutor();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (EPRen2FINExecutorShort)list.get(0);
   return null;
  }

  public EPRen2FINExecutorShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public EPRen2FINExecutorShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public EPRen2FINExecutorShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public EPRen2FINExecutorShortList getFilteredList(EPRen2FINExecutor filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public EPRen2FINExecutorShortList getScrollableFilteredList(EPRen2FINExecutor aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public EPRen2FINExecutorShortList getScrollableFilteredList(EPRen2FINExecutor aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public EPRen2FINExecutorShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public EPRen2FINExecutorShortList getScrollableFilteredList(EPRen2FINExecutorFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public EPRen2FINExecutorShortList getScrollableFilteredList(EPRen2FINExecutorFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public EPRen2FINExecutorShortList getScrollableFilteredList(EPRen2FINExecutor aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public EPRen2FINExecutorShortList getScrollableFilteredList(EPRen2FINExecutor aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    EPRen2FINExecutorShortList result = new EPRen2FINExecutorShortList();
    EPRen2FINExecutorShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "EPREN2FINEXECUTOR.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "EPREN2FINEXECUTOR.CODE"+

      ", EPREN.CODE " +
      ", EPREN.NAME " +
      ", FINEXECUTOR.CODE " +
      ", FINEXECUTOR.NAME " +
      ", FINEXECUTOR.FINCODE " +
      ", FINEXECUTOR.FINTYPENAME " +
      ", FINEXECUTOR.FINTYPECODE " +
      ", FINEXECUTOR.FINKINDNAME " +
      ", FINEXECUTOR.FINKINDCODE " +
      ", FINEXECUTOR.FINCEHNAME " +
      ", FINEXECUTOR.FINCEHCODE " +
      ", ENDEPARTMENT.CODE " +
      ", ENDEPARTMENT.SHORTNAME " +
      ", ENDEPARTMENT.DATESTART " +
      ", ENDEPARTMENT.DATEFINAL " +
      ", ENDEPARTMENT.RENCODE " +
      ", ENDEPARTMENT.SHPZBALANS " +
      ", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
      ", ENDEPARTMENT.KAU_1884 " +
      ", ENDEPARTMENT.NAME_1884 " +
     " FROM EPREN2FINEXECUTOR " +
     ", EPREN " +
     ", FINEXECUTOR " +
     ", ENDEPARTMENT " +
     //" WHERE "
    "";
     whereStr = " EPREN.CODE = EPREN2FINEXECUTOR.RENREFCODE" ; //+
      whereStr = whereStr +" AND FINEXECUTOR.CODE = EPREN2FINEXECUTOR.FINEXECUTORREFCODE" ; //+
      whereStr = whereStr +" AND ENDEPARTMENT.CODE = EPREN2FINEXECUTOR.DEPARTMENTREFCODE" ; //+
        //selectStr = selectStr + " ${s} EPREN2FINEXECUTOR.CODE IN ( SELECT EPREN2FINEXECUTOR.CODE FROM EPREN2FINEXECUTOR ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  EPREN2FINEXECUTOR.CODE = ?";
        }
        if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "EPREN2FINEXECUTOR.RENREFCODE = ? ";
        }
        if(aFilterObject.finExecutorRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "EPREN2FINEXECUTOR.FINEXECUTORREFCODE = ? ";
        }
        if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "EPREN2FINEXECUTOR.DEPARTMENTREFCODE = ? ";
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
       if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.renRef.code);
       }
       if(aFilterObject.finExecutorRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finExecutorRef.code);
       }
       if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.departmentRef.code);
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

        anObject = new EPRen2FINExecutorShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;

        anObject.renRefCode = set.getInt(2);
        if(set.wasNull())
        anObject.renRefCode = Integer.MIN_VALUE;
        anObject.renRefName = set.getString(3);
        anObject.finExecutorRefCode = set.getInt(4);
        if(set.wasNull())
        anObject.finExecutorRefCode = Integer.MIN_VALUE;
        anObject.finExecutorRefName = set.getString(5);
        anObject.finExecutorRefFinCode = set.getInt(6);
        if(set.wasNull())
        anObject.finExecutorRefFinCode = Integer.MIN_VALUE;
        anObject.finExecutorRefFinTypeName = set.getString(7);
        anObject.finExecutorRefFinTypeCode = set.getInt(8);
        if(set.wasNull())
        anObject.finExecutorRefFinTypeCode = Integer.MIN_VALUE;
        anObject.finExecutorRefFinKindName = set.getString(9);
        anObject.finExecutorRefFinKindCode = set.getInt(10);
        if(set.wasNull())
        anObject.finExecutorRefFinKindCode = Integer.MIN_VALUE;
        anObject.finExecutorRefFinCehName = set.getString(11);
        anObject.finExecutorRefFinCehCode = set.getInt(12);
        if(set.wasNull())
        anObject.finExecutorRefFinCehCode = Integer.MIN_VALUE;
        anObject.departmentRefCode = set.getInt(13);
        if(set.wasNull())
        anObject.departmentRefCode = Integer.MIN_VALUE;
        anObject.departmentRefShortName = set.getString(14);
        anObject.departmentRefDateStart = set.getDate(15);
        anObject.departmentRefDateFinal = set.getDate(16);
        anObject.departmentRefRenCode = set.getInt(17);
        if(set.wasNull())
        anObject.departmentRefRenCode = Integer.MIN_VALUE;
        anObject.departmentRefShpzBalans = set.getString(18);
        anObject.departmentRefKau_table_id_1884 = set.getInt(19);
        if(set.wasNull())
        anObject.departmentRefKau_table_id_1884 = Integer.MIN_VALUE;
        anObject.departmentRefKau_1884 = set.getString(20);
        anObject.departmentRefName_1884 = set.getString(21);

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

  public int[] getFilteredCodeArrayOLD(EPRen2FINExecutor aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT EPREN2FINEXECUTOR.CODE FROM EPREN2FINEXECUTOR";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "EPREN2FINEXECUTOR.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  EPREN2FINEXECUTOR.CODE = ?";
        }
        if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " EPREN2FINEXECUTOR.RENREFCODE = ? ";
        }
        if(aFilterObject.finExecutorRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " EPREN2FINEXECUTOR.FINEXECUTORREFCODE = ? ";
        }
        if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " EPREN2FINEXECUTOR.DEPARTMENTREFCODE = ? ";
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
       if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.renRef.code);
       }
       if(aFilterObject.finExecutorRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finExecutorRef.code);
       }
       if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.departmentRef.code);
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

  public int[] getFilteredCodeArray(EPRen2FINExecutorFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(EPRen2FINExecutor aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT EPREN2FINEXECUTOR.CODE FROM EPREN2FINEXECUTOR";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "EPREN2FINEXECUTOR.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  EPREN2FINEXECUTOR.CODE = ?";
        }
        if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " EPREN2FINEXECUTOR.RENREFCODE = ? ";
        }
        if(aFilterObject.finExecutorRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " EPREN2FINEXECUTOR.FINEXECUTORREFCODE = ? ";
        }
        if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " EPREN2FINEXECUTOR.DEPARTMENTREFCODE = ? ";
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
       if(aFilterObject.renRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.renRef.code);
       }
       if(aFilterObject.finExecutorRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finExecutorRef.code);
       }
       if(aFilterObject.departmentRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.departmentRef.code);
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


   public EPRen2FINExecutor getObject(int uid) throws PersistenceException
   {
    EPRen2FINExecutor result = new EPRen2FINExecutor();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(EPRen2FINExecutor anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  EPREN2FINEXECUTOR.CODE, EPREN2FINEXECUTOR.RENREFCODE, EPREN2FINEXECUTOR.FINEXECUTORREFCODE, EPREN2FINEXECUTOR.DEPARTMENTREFCODE "
    +" FROM EPREN2FINEXECUTOR WHERE EPREN2FINEXECUTOR.CODE = ?";

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
        anObject.renRef.code = set.getInt(2);
        if ( set.wasNull() )
            anObject.renRef.code = Integer.MIN_VALUE;
        anObject.finExecutorRef.code = set.getInt(3);
        if ( set.wasNull() )
            anObject.finExecutorRef.code = Integer.MIN_VALUE;
        anObject.departmentRef.code = set.getInt(4);
        if ( set.wasNull() )
            anObject.departmentRef.code = Integer.MIN_VALUE;
        if(anObject.renRef.code != Integer.MIN_VALUE)
        {
           anObject.setRenRef(
        new com.ksoe.energypro.dataminer.generated.EPRenDAOGen(connection,getUserProfile()).getRef(anObject.renRef.code));
    }
        if(anObject.finExecutorRef.code != Integer.MIN_VALUE)
        {
           anObject.setFinExecutorRef(
        new com.ksoe.energynet.dataminer.generated.FINExecutorDAOGen(connection,getUserProfile()).getRef(anObject.finExecutorRef.code));
    }
        if(anObject.departmentRef.code != Integer.MIN_VALUE)
        {
           anObject.setDepartmentRef(
        new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getRef(anObject.departmentRef.code));
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


  public com.ksoe.energynet.valueobject.references.EPRen2FINExecutorRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.EPRen2FINExecutorRef ref = new com.ksoe.energynet.valueobject.references.EPRen2FINExecutorRef();
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

    selectStr = "DELETE FROM  EPREN2FINEXECUTOR WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    EPRen2FINExecutor object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%EPRen2FINExecutor.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(EPRen2FINExecutor.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%EPRen2FINExecutor.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(EPRen2FINExecutor.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%EPRen2FINExecutor.getObject%} access denied");

    selectStr =

    "SELECT  EPREN2FINEXECUTOR.CODE FROM  EPREN2FINEXECUTOR WHERE  EPREN2FINEXECUTOR.CODE = ?";
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
    _checkConditionToken(condition,"code","EPREN2FINEXECUTOR.CODE");
      // relationship conditions
    _checkConditionToken(condition,"renref","RENREFCODE");
    _checkConditionToken(condition,"renref.code","RENREFCODE");
    _checkConditionToken(condition,"finexecutorref","FINEXECUTORREFCODE");
    _checkConditionToken(condition,"finexecutorref.code","FINEXECUTORREFCODE");
    _checkConditionToken(condition,"departmentref","DEPARTMENTREFCODE");
    _checkConditionToken(condition,"departmentref.code","DEPARTMENTREFCODE");
    return condition.toString();
   }

   @Override
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

   private void _collectAutoIncrementFields(EPRen2FINExecutor anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("EPREN2FINEXECUTOR", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("EPREN2FINEXECUTOR", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("EPREN2FINEXECUTOR", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: EPREN2FINEXECUTOR");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of EPRen2FINExecutorDAO
