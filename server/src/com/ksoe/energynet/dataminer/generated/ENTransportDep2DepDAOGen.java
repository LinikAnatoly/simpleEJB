
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
import com.ksoe.energynet.valueobject.ENTransportDep2Dep;
import com.ksoe.energynet.valueobject.brief.ENTransportDep2DepShort;
import com.ksoe.energynet.valueobject.filter.ENTransportDep2DepFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportDep2DepShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENTransportDep2Dep;
 *
 */

public class ENTransportDep2DepDAOGen extends GenericDataMiner {

  public ENTransportDep2DepDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTransportDep2DepDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENTransportDep2Dep inObject) throws PersistenceException
   {
      ENTransportDep2Dep obj = new ENTransportDep2Dep();
      obj.code = inObject.code;
      loadObject(obj);
     if (inObject.transportDepartment.code != obj.transportDepartment.code){
        return false;
     }
     if (inObject.department.code != obj.department.code){
        return false;
     }
      return true;
   }

   public int add(ENTransportDep2Dep anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENTransportDep2Dep anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENTRANSPORTDEP2DEP (CODE,TRANSPORTDEPARTMENTCOD,DEPARTMENTCODE) VALUES (?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.transportDepartment.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENTransportDepartmentDAOGen(connection,getUserProfile()).exists(anObject.transportDepartment.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTransportDep2Dep.transportDepartment.code%} = {%"+anObject.transportDepartment.code+"%}");
        statement.setInt(2,anObject.transportDepartment.code);
      }
      else
        statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.department.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).exists(anObject.department.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENTransportDep2Dep.department.code%} = {%"+anObject.department.code+"%}");
        statement.setInt(3,anObject.department.code);
      }
      else
        statement.setNull(3,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENTransportDep2DepDAOGen.add%}",e);
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

   public void save(ENTransportDep2Dep anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENTransportDep2Dep anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("TRANSPORTDEPARTMENT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DEPARTMENT") == 0)
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
        "UPDATE ENTRANSPORTDEP2DEP SET TRANSPORTDEPARTMENTCOD = ? , DEPARTMENTCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENTRANSPORTDEP2DEP SET ";
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
      if (anObject.transportDepartment.code != Integer.MIN_VALUE)
        statement.setInt(1,anObject.transportDepartment.code);
      else
        statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.department.code != Integer.MIN_VALUE)
        statement.setInt(2,anObject.department.code);
      else
        statement.setNull(2,java.sql.Types.INTEGER);
          statement.setInt(3,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("TRANSPORTDEPARTMENT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.transportDepartment.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.transportDepartment.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("DEPARTMENT".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.department.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.department.code);
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

   } // end of save(ENTransportDep2Dep anObject,String[] anAttributes)


 public ENTransportDep2DepShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENTransportDep2Dep filterObject = new ENTransportDep2Dep();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENTransportDep2DepShort)list.get(0);
   return null;
  }

  public ENTransportDep2DepShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENTransportDep2DepShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENTransportDep2DepShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENTransportDep2DepShortList getFilteredList(ENTransportDep2Dep filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENTransportDep2DepShortList getScrollableFilteredList(ENTransportDep2Dep aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENTransportDep2DepShortList getScrollableFilteredList(ENTransportDep2Dep aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENTransportDep2DepShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENTransportDep2DepShortList getScrollableFilteredList(ENTransportDep2DepFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENTransportDep2DepShortList getScrollableFilteredList(ENTransportDep2DepFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENTransportDep2DepShortList getScrollableFilteredList(ENTransportDep2Dep aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENTransportDep2DepShortList getScrollableFilteredList(ENTransportDep2Dep aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENTransportDep2DepShortList result = new ENTransportDep2DepShortList();
    ENTransportDep2DepShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRANSPORTDEP2DEP.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENTRANSPORTDEP2DEP.CODE"+

      ", ENTRANSPORTDEPARTMENT.CODE " +
      ", ENTRANSPORTDEPARTMENT.NAME " +
      ", ENDEPARTMENT.CODE " +
      ", ENDEPARTMENT.SHORTNAME " +
      ", ENDEPARTMENT.DATESTART " +
      ", ENDEPARTMENT.DATEFINAL " +
      ", ENDEPARTMENT.RENCODE " +
      ", ENDEPARTMENT.SHPZBALANS " +
      ", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
      ", ENDEPARTMENT.KAU_1884 " +
      ", ENDEPARTMENT.NAME_1884 " +
     " FROM ENTRANSPORTDEP2DEP " +
     ", ENTRANSPORTDEPARTMENT " +
     ", ENDEPARTMENT " +
     //" WHERE "
    "";
     whereStr = " ENTRANSPORTDEPARTMENT.CODE = ENTRANSPORTDEP2DEP.TRANSPORTDEPARTMENTCOD" ; //+
      whereStr = whereStr +" AND ENDEPARTMENT.CODE = ENTRANSPORTDEP2DEP.DEPARTMENTCODE" ; //+
        //selectStr = selectStr + " ${s} ENTRANSPORTDEP2DEP.CODE IN ( SELECT ENTRANSPORTDEP2DEP.CODE FROM ENTRANSPORTDEP2DEP ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTDEP2DEP.CODE = ?";
        }
        if(aFilterObject.transportDepartment.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPORTDEP2DEP.TRANSPORTDEPARTMENTCOD = ? ";
        }
        if(aFilterObject.department.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENTRANSPORTDEP2DEP.DEPARTMENTCODE = ? ";
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
       if(aFilterObject.transportDepartment.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportDepartment.code);
       }
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.department.code);
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

        anObject = new ENTransportDep2DepShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;

        anObject.transportDepartmentCode = set.getInt(2);
        if(set.wasNull())
        anObject.transportDepartmentCode = Integer.MIN_VALUE;
        anObject.transportDepartmentName = set.getString(3);
        anObject.departmentCode = set.getInt(4);
        if(set.wasNull())
        anObject.departmentCode = Integer.MIN_VALUE;
        anObject.departmentShortName = set.getString(5);
        anObject.departmentDateStart = set.getDate(6);
        anObject.departmentDateFinal = set.getDate(7);

        anObject.departmentShpzBalans = set.getString(9);
        anObject.departmentKau_table_id_1884 = set.getInt(10);
        if(set.wasNull())
        anObject.departmentKau_table_id_1884 = Integer.MIN_VALUE;
        anObject.departmentKau_1884 = set.getString(11);
        anObject.departmentName_1884 = set.getString(12);

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

  public int[] getFilteredCodeArrayOLD(ENTransportDep2Dep aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRANSPORTDEP2DEP.CODE FROM ENTRANSPORTDEP2DEP";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRANSPORTDEP2DEP.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTDEP2DEP.CODE = ?";
        }
        if(aFilterObject.transportDepartment.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTDEP2DEP.TRANSPORTDEPARTMENTCOD = ? ";
        }
        if(aFilterObject.department.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTDEP2DEP.DEPARTMENTCODE = ? ";
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
       if(aFilterObject.transportDepartment.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportDepartment.code);
       }
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.department.code);
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

  public int[] getFilteredCodeArray(ENTransportDep2DepFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENTransportDep2Dep aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTRANSPORTDEP2DEP.CODE FROM ENTRANSPORTDEP2DEP";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTRANSPORTDEP2DEP.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTRANSPORTDEP2DEP.CODE = ?";
        }
        if(aFilterObject.transportDepartment.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTDEP2DEP.TRANSPORTDEPARTMENTCOD = ? ";
        }
        if(aFilterObject.department.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENTRANSPORTDEP2DEP.DEPARTMENTCODE = ? ";
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
       if(aFilterObject.transportDepartment.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.transportDepartment.code);
       }
       if(aFilterObject.department.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.department.code);
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


   public ENTransportDep2Dep getObject(int uid) throws PersistenceException
   {
    ENTransportDep2Dep result = new ENTransportDep2Dep();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENTransportDep2Dep anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENTRANSPORTDEP2DEP.CODE, ENTRANSPORTDEP2DEP.TRANSPORTDEPARTMENTCOD, ENTRANSPORTDEP2DEP.DEPARTMENTCODE "
    +" FROM ENTRANSPORTDEP2DEP WHERE ENTRANSPORTDEP2DEP.CODE = ?";

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
        anObject.transportDepartment.code = set.getInt(2);
        if ( set.wasNull() )
            anObject.transportDepartment.code = Integer.MIN_VALUE;
        anObject.department.code = set.getInt(3);
        if ( set.wasNull() )
            anObject.department.code = Integer.MIN_VALUE;
        if(anObject.transportDepartment.code != Integer.MIN_VALUE)
        {
           anObject.setTransportDepartment(
        new com.ksoe.energynet.dataminer.generated.ENTransportDepartmentDAOGen(connection,getUserProfile()).getObject(anObject.transportDepartment.code));
    }
        if(anObject.department.code != Integer.MIN_VALUE)
        {
           anObject.setDepartment(
        new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getObject(anObject.department.code));
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


  public com.ksoe.energynet.valueobject.references.ENTransportDep2DepRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENTransportDep2DepRef ref = new com.ksoe.energynet.valueobject.references.ENTransportDep2DepRef();
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

    selectStr = "DELETE FROM  ENTRANSPORTDEP2DEP WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENTransportDep2Dep object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENTransportDep2Dep.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENTransportDep2Dep.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENTransportDep2Dep.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTransportDep2Dep.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENTransportDep2Dep.getObject%} access denied");

    selectStr =

    "SELECT  ENTRANSPORTDEP2DEP.CODE FROM  ENTRANSPORTDEP2DEP WHERE  ENTRANSPORTDEP2DEP.CODE = ?";
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
    _checkConditionToken(condition,"code","ENTRANSPORTDEP2DEP.CODE");
      // relationship conditions
    _checkConditionToken(condition,"transportdepartment","TRANSPORTDEPARTMENTCOD");
    _checkConditionToken(condition,"transportdepartment.code","TRANSPORTDEPARTMENTCOD");
    _checkConditionToken(condition,"department","DEPARTMENTCODE");
    _checkConditionToken(condition,"department.code","DEPARTMENTCODE");
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

    private void _collectAutoIncrementFields(ENTransportDep2Dep anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENTRANSPORTDEP2DEP", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENTRANSPORTDEP2DEP", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENTRANSPORTDEP2DEP", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENTRANSPORTDEP2DEP");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENTransportDep2DepDAO
