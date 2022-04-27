
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
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
import com.ksoe.energynet.valueobject.FINMol;
import com.ksoe.energynet.valueobject.brief.FINMolShort;
import com.ksoe.energynet.valueobject.filter.FINMolFilter;
import com.ksoe.energynet.valueobject.lists.FINMolShortList;
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
  *  DAO Generated for FINMol;
  *
  */

public class FINMolDAOGen extends GenericDataMiner {

  public FINMolDAOGen() {super();}
  public FINMolDAOGen(Connection aConnection) {super(aConnection);}
  public FINMolDAOGen(UserProfile anUserProfile) {super(anUserProfile);}
  public FINMolDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public FINMolDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(FINMol inObject) throws PersistenceException
   {
      FINMol obj = new FINMol();
      obj.id = inObject.id;
      loadObject(obj);

     if (inObject.text != obj.text){
       return false;
     }

     if (inObject.obj_id != obj.obj_id){
       return false;
     }

     if (inObject.state != obj.state){
       return false;
     }
      return true;
   }

   public String add(FINMol anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public String add(FINMol anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO FINMOL (ID,TEXT,OBJ_ID,STATE) VALUES (?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      //if (anObject.id != Integer.MIN_VALUE )
      statement.setString(1,anObject.id);
      //else
      //   statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.text);
      if (anObject.obj_id != Integer.MIN_VALUE )
         statement.setInt(3,anObject.obj_id);
      else
         statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.state != Integer.MIN_VALUE )
         statement.setInt(4,anObject.state);
      else
         statement.setNull(4,java.sql.Types.INTEGER);

      statement.execute();
      return anObject.id;
     }
    catch(SQLException e)
     {
           _sequenceTable.clear();
           EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
      return null;//Integer.MIN_VALUE;
     }
        catch(Exception e)
     {
      _sequenceTable.clear();
      throw new PersistenceException("Error in method {%FINMolDAOGen.add%}",e);
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

   public void save(FINMol anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(FINMol anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("TEXT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("OBJ_ID") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("STATE") == 0)
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
        "UPDATE FINMOL SET  TEXT = ? , OBJ_ID = ? , STATE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE FINMOL SET ";
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
      statement.setString(1,anObject.text);
      if (anObject.obj_id != Integer.MIN_VALUE )
         statement.setInt(2,anObject.obj_id);
      else
         statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.state != Integer.MIN_VALUE )
         statement.setInt(3,anObject.state);
      else
         statement.setNull(3,java.sql.Types.INTEGER);
          statement.setString(4,anObject.id);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("TEXT".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.text);
                continue;
             }
            if("OBJ_ID".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.obj_id);
                continue;
             }
            if("STATE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.state);
                continue;
             }
            }
         statement.setString(fields.size(),anObject.id);
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

   } // end of save(FINMol anObject,String[] anAttributes)


 public FINMolShort getShortObject(String anObjectCode) throws PersistenceException
  {
   FINMol filterObject = new FINMol();
   Vector list;

   filterObject.id = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (FINMolShort)list.get(0);
   return null;
  }

  public FINMolShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public FINMolShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public FINMolShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public FINMolShortList getFilteredList(FINMol filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public FINMolShortList getScrollableFilteredList(FINMol aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public FINMolShortList getScrollableFilteredList(FINMol aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public FINMolShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public FINMolShortList getScrollableFilteredList(FINMolFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public FINMolShortList getScrollableFilteredList(FINMolFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public FINMolShortList getScrollableFilteredList(FINMol aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public FINMolShortList getScrollableFilteredList(FINMol aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector<? extends Object> aBindObjects) throws PersistenceException
   {
    FINMolShortList result = new FINMolShortList();
    FINMolShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "UMC_DBA.TDIVISION.ID";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "UMC_DBA.TDIVISION.ID"+
     ",UMC_DBA.TDIVISION.TEXT"+
     ",UMC_DBA.TDIVISION.OBJ_ID"+
     ",UMC_DBA.TDIVISION.STATE"+

     " FROM UMC_DBA.TDIVISION " +
     //" WHERE "
    "";
        //selectStr = selectStr + " ${s} FINMOL.CODE IN ( SELECT FINMOL.CODE FROM FINMOL ";

      if(aFilterObject != null)
      {
          if (aFilterObject.id != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.id.indexOf('*',0) < 0 && aFilterObject.id.indexOf('?',0) < 0)
                  whereStr = whereStr + "  UPPER(UMC_DBA.TDIVISION.ID) = UPPER(?)";
              else
                  whereStr = whereStr + " UPPER(UMC_DBA.TDIVISION.ID) LIKE UPPER(?)";
          }
/*
        if(aFilterObject.id != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  UMC_DBA.TDIVISION.ID = ?";
        }
*/
         if (aFilterObject.text != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.text.indexOf('*',0) < 0 && aFilterObject.text.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(UMC_DBA.TDIVISION.TEXT) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(UMC_DBA.TDIVISION.TEXT) LIKE UPPER(?)";
         }
        if(aFilterObject.obj_id != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  UMC_DBA.TDIVISION.OBJ_ID = ?";
        }
        if(aFilterObject.state != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  UMC_DBA.TDIVISION.STATE = ?";
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
         selectStr = selectStr + " WHERE" + whereStr;

    // selectStr = selectStr + ") ";

    selectStr = selectStr + " ORDER BY " + orderBy;

    try
     {
      statement = connection.prepareStatement(selectStr);
      int number = 0;
      if(aFilterObject != null){

        /*
         if(aFilterObject.id != null){
             number++;
             statement.setString(number,aFilterObject.id);
         }
*/

          if(aFilterObject.id != null){
              number++;
              StringBuffer likeStr = new StringBuffer();
              likeStr.append(aFilterObject.id);
              for(int i = 0;i < likeStr.length();i++){
                   if(likeStr.charAt(i) == '*')
                        likeStr.setCharAt(i,'%');
                   if(likeStr.charAt(i) == '?')
                        likeStr.setCharAt(i,'_');
              }
              statement.setString(number,likeStr.toString());
          }

           if(aFilterObject.text != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.text);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.obj_id != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.obj_id);
         }
         if(aFilterObject.state != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.state);
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

        anObject = new FINMolShort();

        anObject.id = set.getString(1); //set.getInt(1);
        //if ( set.wasNull() )
        //    anObject.id = Integer.MIN_VALUE;
        anObject.text = set.getString(2);
        anObject.obj_id = set.getInt(3);
        if ( set.wasNull() )
            anObject.obj_id = Integer.MIN_VALUE;
        anObject.state = set.getInt(4);
        if ( set.wasNull() )
            anObject.state = Integer.MIN_VALUE;


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

/*********************************/

  public int[] getFilteredCodeArray(FINMol aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT FINMOL.CODE FROM FINMOL";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "FINMOL.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
          if (aFilterObject.id != null) {
              if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
              if (aFilterObject.id.indexOf('*',0) < 0 && aFilterObject.id.indexOf('?',0) < 0)
                  whereStr = whereStr + "  FINMOL.ID = ?";
              else
                  whereStr = whereStr + "  FINMOL.ID LIKE ?";
          }
/*
        if(aFilterObject.id != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINMOL.ID = ?";
        }
*/
         if (aFilterObject.text != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.text.indexOf('*',0) < 0 && aFilterObject.text.indexOf('?',0) < 0)
                 whereStr = whereStr + "  FINMOL.TEXT = ?";
             else
                 whereStr = whereStr + "  FINMOL.TEXT LIKE ?";
         }
        if(aFilterObject.obj_id != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINMOL.OBJ_ID = ?";
        }
        if(aFilterObject.state != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  FINMOL.STATE = ?";
        }

      }

      if(condition.length() != 0)
      {
         if(whereStr.length() != 0)
            whereStr = whereStr + " AND ";
         whereStr = whereStr + " (" + condition + ")";
      }

     if(whereStr.length() != 0)
         selectStr = selectStr + " WHERE" + whereStr;

    selectStr = selectStr + " ORDER BY " + orderBy;

    try
     {
      statement = connection.prepareStatement(selectStr);
      int number = 0;
      if(aFilterObject != null){
         if(aFilterObject.id != null){
             number++;
             statement.setString(number,aFilterObject.id);
         }
         if (aFilterObject.text != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.text.indexOf('*',0) < 0 && aFilterObject.text.indexOf('?',0) < 0)
                 whereStr = whereStr + " FINMOL.TEXT = ?";
             else
                 whereStr = whereStr + " FINMOL.TEXT LIKE ?";

           if(aFilterObject.text != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.text);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.obj_id != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.obj_id);
         }
         if(aFilterObject.state != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.state);
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


   public FINMol getObject(String uid) throws PersistenceException
   {
    FINMol result = new FINMol();
    result.id = uid;
    loadObject(result);
    if(result.id == null)
     return null;
    return result;
   }


  public void loadObject(FINMol anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  UMC_DBA.TDIVISION.ID, UMC_DBA.TDIVISION.TEXT, UMC_DBA.TDIVISION.OBJ_ID, UMC_DBA.TDIVISION.STATE "
    +" FROM UMC_DBA.TDIVISION WHERE UMC_DBA.TDIVISION.CODE = ?";

    try
     {
      statement = connection.prepareStatement(selectStr);
      statement.setString(1,anObject.id);
      set = statement.executeQuery();
      if(!set.next())
       anObject.id = null;
      else
       {
        anObject.id = set.getString(1);
        anObject.text = set.getString(2);
        anObject.obj_id = set.getInt(3);
        if ( set.wasNull() )
           anObject.obj_id = Integer.MIN_VALUE;
        anObject.state = set.getInt(4);
        if ( set.wasNull() )
           anObject.state = Integer.MIN_VALUE;
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


  public com.ksoe.energynet.valueobject.references.FINMolRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.FINMolRef ref = new com.ksoe.energynet.valueobject.references.FINMolRef();
    if(exists(anObjectCode))
     ref.id = anObjectCode;
    else
     ref.id = Integer.MIN_VALUE;
    return ref;
   }


   public void remove(String uid) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();

    selectStr = "DELETE FROM  FINMOL WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    FINMol object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%FINMol.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(FINMol.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%FINMol.remove%} access denied");

    PreparedStatement statement = null;
    try
     {
      statement = connection.prepareStatement(selectStr);
      statement.setString(1,uid);
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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(FINMol.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%FINMol.getObject%} access denied");

    selectStr =

    "SELECT  FINMOL.CODE FROM  FINMOL WHERE  FINMOL.CODE = ?";
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
    _checkConditionToken(condition,"id","FINMOL.ID");
    _checkConditionToken(condition,"text","FINMOL.TEXT");
    _checkConditionToken(condition,"obj_id","FINMOL.OBJ_ID");
    _checkConditionToken(condition,"state","FINMOL.STATE");
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
    catch (NamingException e) {throw new EnergyproSystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.ENERGYNET_DATASOURCE+"%}",e);}
    catch (SQLException e)    {throw new EnergyproSystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.ENERGYNET_DATASOURCE+"%}",e);}
   }


   ///////////// PRIVATE SECTION ///////////////
   protected static Hashtable _sequenceTable = new Hashtable();

   private void _collectAutoIncrementFields(FINMol anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("FINMOL", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("FINMOL", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("FINMOL", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: FINMOL");
       } else {
           anObject.id = null; //nextSeqValue.intValue();
           return;
       }
   }


} // end of FINMolDAO

