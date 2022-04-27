
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
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
import com.ksoe.energynet.valueobject.ENActProj2OZ2Date;
import com.ksoe.energynet.valueobject.brief.ENActProj2OZ2DateShort;
import com.ksoe.energynet.valueobject.filter.ENActProj2OZ2DateFilter;
import com.ksoe.energynet.valueobject.lists.ENActProj2OZ2DateShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


  /**
  *  DAO Generated for ENActProj2OZ2Date;
  *
  */

public class ENActProj2OZ2DateDAOGen extends GenericDataMiner {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENActProj2OZ2DateDAOGen() {super();}
  //public ENActProj2OZ2DateDAOGen(Connection aConnection) {super(aConnection);}
  //public ENActProj2OZ2DateDAOGen(UserProfile anUserProfile) {super(anUserProfile);}
  public ENActProj2OZ2DateDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENActProj2OZ2DateDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENActProj2OZ2Date inObject) throws PersistenceException
   {
      ENActProj2OZ2Date obj = new ENActProj2OZ2Date();
      obj.code = inObject.code;
      loadObject(obj);

     if ( ! inObject.dateGen.equals(obj.dateGen)){
       return false;
     }
     if (inObject.ENActProjRef.code != obj.ENActProjRef.code){
        return false;
     }
      return true;
   }

   public int add(ENActProj2OZ2Date anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENActProj2OZ2Date anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENACTPROJ2OZ2DATE (CODE,DATEGEN,ENACTPROJREFCODE) VALUES (?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.dateGen == null)
        statement.setDate(2,null);
      else
        statement.setDate(2,new java.sql.Date(anObject.dateGen.getTime()));
      if (anObject.ENActProjRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENActProj2OZ2DAOGen(connection,getUserProfile()).exists(anObject.ENActProjRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENActProj2OZ2Date.ENActProjRef.code%} = {%"+anObject.ENActProjRef.code+"%}");
        statement.setInt(3,anObject.ENActProjRef.code);
      }
      else
        statement.setNull(3,java.sql.Types.INTEGER);

      statement.execute();
      return anObject.code;
     }
    catch(SQLException e)
     {
           _sequenceTable.clear();
           EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
      return Integer.MIN_VALUE;
     }
        catch(Exception e)
     {
      _sequenceTable.clear();
      throw new PersistenceException("Error in method {%ENActProj2OZ2DateDAOGen.add%}",e);
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

   public void save(ENActProj2OZ2Date anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENActProj2OZ2Date anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("DATEGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("ENACTPROJREF") == 0)
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
        "UPDATE ENACTPROJ2OZ2DATE SET  DATEGEN = ? , ENACTPROJREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENACTPROJ2OZ2DATE SET ";
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
      if (anObject.dateGen == null)
        statement.setDate(1,null);
      else
        statement.setDate(1,new java.sql.Date(anObject.dateGen.getTime()));
      if (anObject.ENActProjRef.code != Integer.MIN_VALUE)
        statement.setInt(2,anObject.ENActProjRef.code);
      else
        statement.setNull(2,java.sql.Types.INTEGER);
          statement.setInt(3,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("DATEGEN".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dateGen == null)
                statement.setDate(i+1,null);
      else
                statement.setDate(i+1,new java.sql.Date(anObject.dateGen.getTime()));
                continue;
             }
            if("ENACTPROJREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.ENActProjRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.ENActProjRef.code);
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
        EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
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

   } // end of save(ENActProj2OZ2Date anObject,String[] anAttributes)


 public ENActProj2OZ2DateShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENActProj2OZ2Date filterObject = new ENActProj2OZ2Date();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENActProj2OZ2DateShort)list.get(0);
   return null;
  }

  public ENActProj2OZ2DateShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENActProj2OZ2DateShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENActProj2OZ2DateShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENActProj2OZ2DateShortList getFilteredList(ENActProj2OZ2Date filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENActProj2OZ2DateShortList getScrollableFilteredList(ENActProj2OZ2Date aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENActProj2OZ2DateShortList getScrollableFilteredList(ENActProj2OZ2Date aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENActProj2OZ2DateShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENActProj2OZ2DateShortList getScrollableFilteredList(ENActProj2OZ2DateFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENActProj2OZ2DateShortList getScrollableFilteredList(ENActProj2OZ2DateFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENActProj2OZ2DateShortList getScrollableFilteredList(ENActProj2OZ2Date aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENActProj2OZ2DateShortList getScrollableFilteredList(ENActProj2OZ2Date aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENActProj2OZ2DateShortList result = new ENActProj2OZ2DateShortList();
    ENActProj2OZ2DateShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACTPROJ2OZ2DATE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENACTPROJ2OZ2DATE.CODE"+
     ",ENACTPROJ2OZ2DATE.DATEGEN"+

      ", ENACTPROJ2OZ2.CODE " +
      ", ENACTPROJ2OZ2.NUMBERGEN " +
      ", ENACTPROJ2OZ2.DATEGEN " +
      ", ENACTPROJ2OZ2.SUMMAGEN " +
      ", ENACTPROJ2OZ2.USERGEN " +
      ", ENACTPROJ2OZ2.DATEEDIT " +
     " FROM ENACTPROJ2OZ2DATE " +
     ", ENACTPROJ2OZ2 " +
     //" WHERE "
    "";
     whereStr = " ENACTPROJ2OZ2.CODE = ENACTPROJ2OZ2DATE.ENACTPROJREFCODE" ; //+
        //selectStr = selectStr + " ${s} ENACTPROJ2OZ2DATE.CODE IN ( SELECT ENACTPROJ2OZ2DATE.CODE FROM ENACTPROJ2OZ2DATE ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTPROJ2OZ2DATE.CODE = ?";
        }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTPROJ2OZ2DATE.DATEGEN = ?";
        }
        if(aFilterObject.ENActProjRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENACTPROJ2OZ2DATE.ENACTPROJREFCODE = ? ";
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
        if(aFilterObject.dateGen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
        }
       if(aFilterObject.ENActProjRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.ENActProjRef.code);
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

        anObject = new ENActProj2OZ2DateShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.dateGen = set.getDate(2);

        anObject.ENActProjRefCode = set.getInt(3);
        if(set.wasNull())
        anObject.ENActProjRefCode = Integer.MIN_VALUE;
        anObject.ENActProjRefNumberGen = set.getString(4);
        anObject.ENActProjRefDateGen = set.getDate(5);
        anObject.ENActProjRefSummaGen = set.getBigDecimal(6);
        if(anObject.ENActProjRefSummaGen != null)
          anObject.ENActProjRefSummaGen = anObject.ENActProjRefSummaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.ENActProjRefUserGen = set.getString(7);
        anObject.ENActProjRefDateEdit = set.getDate(8);

         result.list.add(anObject);
       }

      result.setTotalCount(i);
      return result;
     }
    catch(SQLException e)
     {
      System.out.println(e.getMessage()+"\nstatement - "+selectStr);
      EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
      return null;
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

  public int[] getFilteredCodeArrayOLD(ENActProj2OZ2Date aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENACTPROJ2OZ2DATE.CODE FROM ENACTPROJ2OZ2DATE";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACTPROJ2OZ2DATE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTPROJ2OZ2DATE.CODE = ?";
        }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTPROJ2OZ2DATE.DATEGEN = ?";
        }
        if(aFilterObject.ENActProjRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACTPROJ2OZ2DATE.ENACTPROJREFCODE = ? ";
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
        if(aFilterObject.dateGen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
        }
       if(aFilterObject.ENActProjRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.ENActProjRef.code);
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
      EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
      return null;
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

  public int[] getFilteredCodeArray(ENActProj2OZ2DateFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
    return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENActProj2OZ2Date aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENACTPROJ2OZ2DATE.CODE FROM ENACTPROJ2OZ2DATE";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENACTPROJ2OZ2DATE.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTPROJ2OZ2DATE.CODE = ?";
        }
        if(aFilterObject.dateGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENACTPROJ2OZ2DATE.DATEGEN = ?";
        }
        if(aFilterObject.ENActProjRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENACTPROJ2OZ2DATE.ENACTPROJREFCODE = ? ";
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
        if(aFilterObject.dateGen != null){
            number++;
            statement.setDate(number,new java.sql.Date(aFilterObject.dateGen.getTime()));
        }
       if(aFilterObject.ENActProjRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.ENActProjRef.code);
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
      EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
      return null;
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


   public ENActProj2OZ2Date getObject(int uid) throws PersistenceException
   {
    ENActProj2OZ2Date result = new ENActProj2OZ2Date();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENActProj2OZ2Date anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENACTPROJ2OZ2DATE.CODE, ENACTPROJ2OZ2DATE.DATEGEN, ENACTPROJ2OZ2DATE.ENACTPROJREFCODE "
    +" FROM ENACTPROJ2OZ2DATE WHERE ENACTPROJ2OZ2DATE.CODE = ?";

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
        anObject.dateGen = set.getDate(2);
        anObject.ENActProjRef.code = set.getInt(3);
        if ( set.wasNull() )
            anObject.ENActProjRef.code = Integer.MIN_VALUE;
        if(anObject.ENActProjRef.code != Integer.MIN_VALUE)
        {
           anObject.setENActProjRef(
        new com.ksoe.energynet.dataminer.generated.ENActProj2OZ2DAOGen(connection,getUserProfile()).getRef(anObject.ENActProjRef.code));
    }
      }
    }
    catch(SQLException e)
     {
      System.out.println(e.getMessage()+"\nstatement - "+selectStr);
      EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
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


  public com.ksoe.energynet.valueobject.references.ENActProj2OZ2DateRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENActProj2OZ2DateRef ref = new com.ksoe.energynet.valueobject.references.ENActProj2OZ2DateRef();
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

    selectStr = "DELETE FROM  ENACTPROJ2OZ2DATE WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENActProj2OZ2Date object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENActProj2OZ2Date.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENActProj2OZ2Date.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENActProj2OZ2Date.remove%} access denied");

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
      EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENActProj2OZ2Date.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENActProj2OZ2Date.getObject%} access denied");

    selectStr =

    "SELECT  ENACTPROJ2OZ2DATE.CODE FROM  ENACTPROJ2OZ2DATE WHERE  ENACTPROJ2OZ2DATE.CODE = ?";
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
      EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
      return false;
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
    _checkConditionToken(condition,"code","ENACTPROJ2OZ2DATE.CODE");
    _checkConditionToken(condition,"dategen","ENACTPROJ2OZ2DATE.DATEGEN");
      // relationship conditions
    _checkConditionToken(condition,"enactprojref","ENACTPROJREFCODE");
    _checkConditionToken(condition,"enactprojref.code","ENACTPROJREFCODE");
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
    catch (NamingException e) {throw new EnergyproSystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.ENERGYNET_DATASOURCE+"%}",e);}
    catch (SQLException e)    {throw new EnergyproSystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.ENERGYNET_DATASOURCE+"%}",e);}
   }


   ///////////// PRIVATE SECTION ///////////////
   protected static Hashtable _sequenceTable = new Hashtable();

   private void _collectAutoIncrementFields(ENActProj2OZ2Date anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("ENACTPROJ2OZ2DATE", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("ENACTPROJ2OZ2DATE", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("ENACTPROJ2OZ2DATE", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: ENACTPROJ2OZ2DATE");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of ENActProj2OZ2DateDAO

