
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
import com.ksoe.energynet.valueobject.ENActIncome2ENAct;
import com.ksoe.energynet.valueobject.brief.ENActIncome2ENActShort;
import com.ksoe.energynet.valueobject.filter.ENActIncome2ENActFilter;
import com.ksoe.energynet.valueobject.lists.ENActIncome2ENActShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENActIncome2ENAct;
 *
 */

public class ENActIncome2ENActDAOGen extends GenericDataMiner {

  public ENActIncome2ENActDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENActIncome2ENActDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENActIncome2ENAct inObject) throws PersistenceException
   {
      ENActIncome2ENAct obj = new ENActIncome2ENAct();
      obj.code = inObject.code;
      loadObject(obj);
     if (inObject.actIncomeRef.code != obj.actIncomeRef.code){
        return false;
     }
     if (inObject.actRef.code != obj.actRef.code){
        return false;
     }
      return true;
   }

   public int add(ENActIncome2ENAct anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENActIncome2ENAct anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENACTINCOME2ENACT (CODE,ACTINCOMEREFCODE,ACTREFCODE) VALUES (?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.actIncomeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENActIncomeDAOGen(connection,getUserProfile()).exists(anObject.actIncomeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENActIncome2ENAct.actIncomeRef.code%} = {%"+anObject.actIncomeRef.code+"%}");
        statement.setInt(2,anObject.actIncomeRef.code);
      }
      else
        statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.actRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENActDAOGen(connection,getUserProfile()).exists(anObject.actRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENActIncome2ENAct.actRef.code%} = {%"+anObject.actRef.code+"%}");
        statement.setInt(3,anObject.actRef.code);
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
      throw new PersistenceException("Error in method {%ENActIncome2ENActDAOGen.add%}",e);
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

   public void save(ENActIncome2ENAct anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENActIncome2ENAct anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("ACTINCOMEREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ACTREF") == 0)
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
        "UPDATE ENACTINCOME2ENACT SET ACTINCOMEREFCODE = ? , ACTREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENACTINCOME2ENACT SET ";
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
      if (anObject.actIncomeRef.code != Integer.MIN_VALUE)
        statement.setInt(1,anObject.actIncomeRef.code);
      else
        statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.actRef.code != Integer.MIN_VALUE)
        statement.setInt(2,anObject.actRef.code);
      else
        statement.setNull(2,java.sql.Types.INTEGER);
          statement.setInt(3,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("ACTINCOMEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.actIncomeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.actIncomeRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("ACTREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.actRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.actRef.code);
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

   } // end of save(ENActIncome2ENAct anObject,String[] anAttributes)


 public ENActIncome2ENActShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENActIncome2ENAct filterObject = new ENActIncome2ENAct();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENActIncome2ENActShort)list.get(0);
   return null;
  }

  public ENActIncome2ENActShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENActIncome2ENActShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENActIncome2ENActShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENActIncome2ENActShortList getFilteredList(ENActIncome2ENAct filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENActIncome2ENActShortList getScrollableFilteredList(ENActIncome2ENAct aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENActIncome2ENActShortList getScrollableFilteredList(ENActIncome2ENAct aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENActIncome2ENActShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENActIncome2ENActShortList getScrollableFilteredList(ENActIncome2ENActFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENActIncome2ENActShortList getScrollableFilteredList(ENActIncome2ENActFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENActIncome2ENActShortList getScrollableFilteredList(ENActIncome2ENAct aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENActIncome2ENActShortList getScrollableFilteredList(ENActIncome2ENAct aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENActIncome2ENActShortList result = new ENActIncome2ENActShortList();
    ENActIncome2ENActShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACTINCOME2ENACT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENACTINCOME2ENACT.CODE"+

      ", ENACTINCOME.CODE " +
      ", ENACTINCOME.NUMBERGEN " +
      ", ENACTINCOME.DATEGEN " +
      ", ENACTINCOME.ACTDATESTART " +
      ", ENACTINCOME.ACTDATEEND " +
      ", ENACTINCOME.CONTRACTNUMBER " +
      ", ENACTINCOME.CONTRACTDATE " +
      ", ENACTINCOME.PARTNERNAME " +
      ", ENACTINCOME.PARTNERCODE " +
      ", ENACTINCOME.FINDOCCODE " +
      ", ENACTINCOME.FINDOCID " +
      ", ENACT.CODE " +
      ", ENACT.NUMBERGEN " +
      ", ENACT.DATEGEN " +
      ", ENACT.FINDOCCODE " +
      ", ENACT.FINDOCMECHANICCODE " +
      ", ENACT.FINMOLNAME " +
      ", ENACT.FINMECHANICNAME " +
      ", ENACT.INVNUMBER " +
      ", ENACT.USERGEN " +
      ", ENACT.DATEEDIT " +
      ", ENACT.DATEACT " +
     " FROM ENACTINCOME2ENACT " +
     ", ENACTINCOME " +
     ", ENACT " +
     //" WHERE "
    "";
     whereStr = " ENACTINCOME.CODE = ENACTINCOME2ENACT.ACTINCOMEREFCODE" ; //+
      whereStr = whereStr +" AND ENACT.CODE = ENACTINCOME2ENACT.ACTREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENACTINCOME2ENACT.CODE IN ( SELECT ENACTINCOME2ENACT.CODE FROM ENACTINCOME2ENACT ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOME2ENACT.CODE = ?";
        }
        if(aFilterObject.actIncomeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACTINCOME2ENACT.ACTINCOMEREFCODE = ? ";
        }
        if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACTINCOME2ENACT.ACTREFCODE = ? ";
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
       if(aFilterObject.actIncomeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.actIncomeRef.code);
       }
       if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.actRef.code);
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

        anObject = new ENActIncome2ENActShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;

        anObject.actIncomeRefCode = set.getInt(2);
        if(set.wasNull())
        anObject.actIncomeRefCode = Integer.MIN_VALUE;
        anObject.actIncomeRefNumbergen = set.getString(3);
        anObject.actIncomeRefDategen = set.getDate(4);

        anObject.actIncomeRefContractNumber = set.getString(7);
        anObject.actIncomeRefContractDate = set.getDate(8);
        anObject.actIncomeRefPartnername = set.getString(9);
        anObject.actIncomeRefPartnerCode = set.getString(10);
        anObject.actIncomeRefFinDocCode = set.getString(11);
        anObject.actIncomeRefFinDocID = set.getInt(12);
        if(set.wasNull())
        anObject.actIncomeRefFinDocID = Integer.MIN_VALUE;
        anObject.actRefCode = set.getInt(13);
        if(set.wasNull())
        anObject.actRefCode = Integer.MIN_VALUE;


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

  public int[] getFilteredCodeArrayOLD(ENActIncome2ENAct aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENACTINCOME2ENACT.CODE FROM ENACTINCOME2ENACT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACTINCOME2ENACT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOME2ENACT.CODE = ?";
        }
        if(aFilterObject.actIncomeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACTINCOME2ENACT.ACTINCOMEREFCODE = ? ";
        }
        if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACTINCOME2ENACT.ACTREFCODE = ? ";
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
       if(aFilterObject.actIncomeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.actIncomeRef.code);
       }
       if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.actRef.code);
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

  public int[] getFilteredCodeArray(ENActIncome2ENActFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENActIncome2ENAct aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENACTINCOME2ENACT.CODE FROM ENACTINCOME2ENACT";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACTINCOME2ENACT.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTINCOME2ENACT.CODE = ?";
        }
        if(aFilterObject.actIncomeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACTINCOME2ENACT.ACTINCOMEREFCODE = ? ";
        }
        if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACTINCOME2ENACT.ACTREFCODE = ? ";
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
       if(aFilterObject.actIncomeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.actIncomeRef.code);
       }
       if(aFilterObject.actRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.actRef.code);
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


   public ENActIncome2ENAct getObject(int uid) throws PersistenceException
   {
    ENActIncome2ENAct result = new ENActIncome2ENAct();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENActIncome2ENAct anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENACTINCOME2ENACT.CODE, ENACTINCOME2ENACT.ACTINCOMEREFCODE, ENACTINCOME2ENACT.ACTREFCODE "
    +" FROM ENACTINCOME2ENACT WHERE ENACTINCOME2ENACT.CODE = ?";

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
        anObject.actIncomeRef.code = set.getInt(2);
        if ( set.wasNull() )
            anObject.actIncomeRef.code = Integer.MIN_VALUE;
        anObject.actRef.code = set.getInt(3);
        if ( set.wasNull() )
            anObject.actRef.code = Integer.MIN_VALUE;
        if(anObject.actIncomeRef.code != Integer.MIN_VALUE)
        {
           anObject.setActIncomeRef(
        new com.ksoe.energynet.dataminer.generated.ENActIncomeDAOGen(connection,getUserProfile()).getRef(anObject.actIncomeRef.code));
    }
        if(anObject.actRef.code != Integer.MIN_VALUE)
        {
           anObject.setActRef(
        new com.ksoe.energynet.dataminer.generated.ENActDAOGen(connection,getUserProfile()).getRef(anObject.actRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENActIncome2ENActRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENActIncome2ENActRef ref = new com.ksoe.energynet.valueobject.references.ENActIncome2ENActRef();
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

    selectStr = "DELETE FROM  ENACTINCOME2ENACT WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENActIncome2ENAct object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENActIncome2ENAct.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENActIncome2ENAct.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENActIncome2ENAct.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENActIncome2ENAct.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENActIncome2ENAct.getObject%} access denied");

    selectStr =

    "SELECT  ENACTINCOME2ENACT.CODE FROM  ENACTINCOME2ENACT WHERE  ENACTINCOME2ENACT.CODE = ?";
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
    _checkConditionToken(condition,"code","ENACTINCOME2ENACT.CODE");
      // relationship conditions
    _checkConditionToken(condition,"actincomeref","ACTINCOMEREFCODE");
    _checkConditionToken(condition,"actincomeref.code","ACTINCOMEREFCODE");
    _checkConditionToken(condition,"actref","ACTREFCODE");
    _checkConditionToken(condition,"actref.code","ACTREFCODE");
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

    private void _collectAutoIncrementFields(ENActIncome2ENAct anObject,
            Connection connection) throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENACTINCOME2ENACT", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENACTINCOME2ENACT", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENACTINCOME2ENACT", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENACTINCOME2ENACT");
        } else {
            anObject.code = nextSeqValue.intValue();
            return;
        }
    }

} // end of ENActIncome2ENActDAO
