
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
import com.ksoe.energynet.valueobject.FinRenCode2FinRenCodeBase;
import com.ksoe.energynet.valueobject.brief.FinRenCode2FinRenCodeBaseShort;
import com.ksoe.energynet.valueobject.filter.FinRenCode2FinRenCodeBaseFilter;
import com.ksoe.energynet.valueobject.lists.FinRenCode2FinRenCodeBaseShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for FinRenCode2FinRenCodeBase;
 *
 */

public class FinRenCode2FinRenCodeBaseDAOGen extends GenericDataMiner {

  public FinRenCode2FinRenCodeBaseDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public FinRenCode2FinRenCodeBaseDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(FinRenCode2FinRenCodeBase inObject) throws PersistenceException
   {
      FinRenCode2FinRenCodeBase obj = new FinRenCode2FinRenCodeBase();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.finRenCode != obj.finRenCode){
       return false;
     }

     if (inObject.finRenCodeOut != obj.finRenCodeOut){
       return false;
     }

     if (inObject.priority != obj.priority){
       return false;
     }
      return true;
   }

   public int add(FinRenCode2FinRenCodeBase anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(FinRenCode2FinRenCodeBase anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO FINRENCODE2FINRENCODBS (CODE,FINRENCODE,FINRENCODEOUT,PRIORITY) VALUES (?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.finRenCode);
      statement.setString(3,anObject.finRenCodeOut);
      if (anObject.priority != Integer.MIN_VALUE )
         statement.setInt(4,anObject.priority);
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
      throw new PersistenceException("Error in method {%FinRenCode2FinRenCodeBaseDAOGen.add%}",e);
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

   public void save(FinRenCode2FinRenCodeBase anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(FinRenCode2FinRenCodeBase anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("FINRENCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FINRENCODEOUT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("PRIORITY") == 0)
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
        "UPDATE FINRENCODE2FINRENCODBS SET  FINRENCODE = ? , FINRENCODEOUT = ? , PRIORITY = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE FINRENCODE2FINRENCODEBASE SET ";
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
      statement.setString(1,anObject.finRenCode);
      statement.setString(2,anObject.finRenCodeOut);
      if (anObject.priority != Integer.MIN_VALUE )
         statement.setInt(3,anObject.priority);
      else
         statement.setNull(3,java.sql.Types.INTEGER);
          statement.setInt(4,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("FINRENCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.finRenCode);
                continue;
             }
            if("FINRENCODEOUT".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.finRenCodeOut);
                continue;
             }
            if("PRIORITY".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.priority);
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

   } // end of save(FinRenCode2FinRenCodeBase anObject,String[] anAttributes)


 public FinRenCode2FinRenCodeBaseShort getShortObject(int anObjectCode) throws PersistenceException
  {
   FinRenCode2FinRenCodeBase filterObject = new FinRenCode2FinRenCodeBase();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (FinRenCode2FinRenCodeBaseShort)list.get(0);
   return null;
  }

  public FinRenCode2FinRenCodeBaseShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public FinRenCode2FinRenCodeBaseShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public FinRenCode2FinRenCodeBaseShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public FinRenCode2FinRenCodeBaseShortList getFilteredList(FinRenCode2FinRenCodeBase filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public FinRenCode2FinRenCodeBaseShortList getScrollableFilteredList(FinRenCode2FinRenCodeBase aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public FinRenCode2FinRenCodeBaseShortList getScrollableFilteredList(FinRenCode2FinRenCodeBase aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public FinRenCode2FinRenCodeBaseShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public FinRenCode2FinRenCodeBaseShortList getScrollableFilteredList(FinRenCode2FinRenCodeBaseFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public FinRenCode2FinRenCodeBaseShortList getScrollableFilteredList(FinRenCode2FinRenCodeBaseFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public FinRenCode2FinRenCodeBaseShortList getScrollableFilteredList(FinRenCode2FinRenCodeBase aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public FinRenCode2FinRenCodeBaseShortList getScrollableFilteredList(FinRenCode2FinRenCodeBase aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    FinRenCode2FinRenCodeBaseShortList result = new FinRenCode2FinRenCodeBaseShortList();
    FinRenCode2FinRenCodeBaseShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "FINRENCODE2FINRENCODBS.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "FINRENCODE2FINRENCODBS.CODE"+
     ",FINRENCODE2FINRENCODBS.FINRENCODE"+
     ",FINRENCODE2FINRENCODBS.FINRENCODEOUT"+
     ",FINRENCODE2FINRENCODBS.PRIORITY"+

     " FROM FINRENCODE2FINRENCODBS " +
     //" WHERE "
    "";
        //selectStr = selectStr + " ${s} FINRENCODE2FINRENCODBS.CODE IN ( SELECT FINRENCODE2FINRENCODBS.CODE FROM FINRENCODE2FINRENCODBS ";

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINRENCODE2FINRENCODBS.CODE = ?";
        }
         if (aFilterObject.finRenCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finRenCode.indexOf('*',0) < 0 && aFilterObject.finRenCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(FINRENCODE2FINRENCODBS.FINRENCODE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(FINRENCODE2FINRENCODBS.FINRENCODE) LIKE UPPER(?)";
         }
         if (aFilterObject.finRenCodeOut != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finRenCodeOut.indexOf('*',0) < 0 && aFilterObject.finRenCodeOut.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(FINRENCODE2FINRENCODBS.FINRENCODEOUT) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(FINRENCODE2FINRENCODBS.FINRENCODEOUT) LIKE UPPER(?)";
         }
        if(aFilterObject.priority != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINRENCODE2FINRENCODBS.PRIORITY = ?";
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

           if(aFilterObject.finRenCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finRenCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.finRenCodeOut != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finRenCodeOut);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.priority != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.priority);
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

        anObject = new FinRenCode2FinRenCodeBaseShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.finRenCode = set.getString(2);
        anObject.finRenCodeOut = set.getString(3);
        anObject.priority = set.getInt(4);
        if ( set.wasNull() )
            anObject.priority = Integer.MIN_VALUE;


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

  public int[] getFilteredCodeArrayOLD(FinRenCode2FinRenCodeBase aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT FINRENCODE2FINRENCODBS.CODE FROM FINRENCODE2FINRENCODBS";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "FINRENCODE2FINRENCODBS.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINRENCODE2FINRENCODBS.CODE = ?";
        }
         if (aFilterObject.finRenCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finRenCode.indexOf('*',0) < 0 && aFilterObject.finRenCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINRENCODE2FINRENCODBS.FINRENCODE = ?";
             else
                 whereStr = whereStr + "  FINRENCODE2FINRENCODBS.FINRENCODE LIKE ?";
         }
         if (aFilterObject.finRenCodeOut != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finRenCodeOut.indexOf('*',0) < 0 && aFilterObject.finRenCodeOut.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINRENCODE2FINRENCODBS.FINRENCODEOUT = ?";
             else
                 whereStr = whereStr + "  FINRENCODE2FINRENCODBS.FINRENCODEOUT LIKE ?";
         }
        if(aFilterObject.priority != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINRENCODE2FINRENCODBS.PRIORITY = ?";
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
         if (aFilterObject.finRenCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.finRenCode.indexOf('*',0) < 0 && aFilterObject.finRenCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINRENCODE2FINRENCODBS.FINRENCODE = ?";
             else
                 whereStr = whereStr + " FINRENCODE2FINRENCODBS.FINRENCODE LIKE ?";

           if(aFilterObject.finRenCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finRenCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.finRenCodeOut != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.finRenCodeOut.indexOf('*',0) < 0 && aFilterObject.finRenCodeOut.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINRENCODE2FINRENCODBS.FINRENCODEOUT = ?";
             else
                 whereStr = whereStr + " FINRENCODE2FINRENCODBS.FINRENCODEOUT LIKE ?";

           if(aFilterObject.finRenCodeOut != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finRenCodeOut);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.priority != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.priority);
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

  public int[] getFilteredCodeArray(FinRenCode2FinRenCodeBaseFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(FinRenCode2FinRenCodeBase aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT FINRENCODE2FINRENCODBS.CODE FROM FINRENCODE2FINRENCODBS";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "FINRENCODE2FINRENCODBS.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINRENCODE2FINRENCODBS.CODE = ?";
        }
         if (aFilterObject.finRenCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finRenCode.indexOf('*',0) < 0 && aFilterObject.finRenCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINRENCODE2FINRENCODBS.FINRENCODE = ?";
             else
                 whereStr = whereStr + "  FINRENCODE2FINRENCODBS.FINRENCODE LIKE ?";
         }
         if (aFilterObject.finRenCodeOut != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.finRenCodeOut.indexOf('*',0) < 0 && aFilterObject.finRenCodeOut.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINRENCODE2FINRENCODBS.FINRENCODEOUT = ?";
             else
                 whereStr = whereStr + "  FINRENCODE2FINRENCODBS.FINRENCODEOUT LIKE ?";
         }
        if(aFilterObject.priority != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINRENCODE2FINRENCODBS.PRIORITY = ?";
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
         if (aFilterObject.finRenCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.finRenCode.indexOf('*',0) < 0 && aFilterObject.finRenCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINRENCODE2FINRENCODBS.FINRENCODE = ?";
             else
                 whereStr = whereStr + " FINRENCODE2FINRENCODBS.FINRENCODE LIKE ?";

           if(aFilterObject.finRenCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finRenCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.finRenCodeOut != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.finRenCodeOut.indexOf('*',0) < 0 && aFilterObject.finRenCodeOut.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINRENCODE2FINRENCODBS.FINRENCODEOUT = ?";
             else
                 whereStr = whereStr + " FINRENCODE2FINRENCODBS.FINRENCODEOUT LIKE ?";

           if(aFilterObject.finRenCodeOut != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.finRenCodeOut);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.priority != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.priority);
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


   public FinRenCode2FinRenCodeBase getObject(int uid) throws PersistenceException
   {
    FinRenCode2FinRenCodeBase result = new FinRenCode2FinRenCodeBase();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(FinRenCode2FinRenCodeBase anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  FINRENCODE2FINRENCODBS.CODE, FINRENCODE2FINRENCODBS.FINRENCODE, FINRENCODE2FINRENCODBS.FINRENCODEOUT, FINRENCODE2FINRENCODBS.PRIORITY "
    +" FROM FINRENCODE2FINRENCODBS WHERE FINRENCODE2FINRENCODBS.CODE = ?";

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
        anObject.finRenCode = set.getString(2);
        anObject.finRenCodeOut = set.getString(3);
        anObject.priority = set.getInt(4);
        if ( set.wasNull() )
           anObject.priority = Integer.MIN_VALUE;
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


  public com.ksoe.energynet.valueobject.references.FinRenCode2FinRenCodeBaseRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.FinRenCode2FinRenCodeBaseRef ref = new com.ksoe.energynet.valueobject.references.FinRenCode2FinRenCodeBaseRef();
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

    selectStr = "DELETE FROM  FINRENCODE2FINRENCODBS WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    FinRenCode2FinRenCodeBase object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%FinRenCode2FinRenCodeBase.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(FinRenCode2FinRenCodeBase.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%FinRenCode2FinRenCodeBase.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(FinRenCode2FinRenCodeBase.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%FinRenCode2FinRenCodeBase.getObject%} access denied");

    selectStr =

    "SELECT  FINRENCODE2FINRENCODBS.CODE FROM  FINRENCODE2FINRENCODBS WHERE  FINRENCODE2FINRENCODBS.CODE = ?";
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
    _checkConditionToken(condition,"code","FINRENCODE2FINRENCODBS.CODE");
    _checkConditionToken(condition,"finrencode","FINRENCODE2FINRENCODBS.FINRENCODE");
    _checkConditionToken(condition,"finrencodeout","FINRENCODE2FINRENCODBS.FINRENCODEOUT");
    _checkConditionToken(condition,"priority","FINRENCODE2FINRENCODBS.PRIORITY");
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

   private void _collectAutoIncrementFields(FinRenCode2FinRenCodeBase anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("FINRENCODE2FINRENCODBS", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("FINRENCODE2FINRENCODBS", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("FINRENCODE2FINRENCODBS", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: FINRENCODE2FINRENCODBS");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of FinRenCode2FinRenCodeBaseDAO
