
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2010 SIT
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
import com.ksoe.energynet.valueobject.CNRole2DomainInfo;
import com.ksoe.energynet.valueobject.brief.CNRole2DomainInfoShort;
import com.ksoe.energynet.valueobject.filter.CNRole2DomainInfoFilter;
import com.ksoe.energynet.valueobject.lists.CNRole2DomainInfoShortList;
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
  *  DAO Generated for CNRole2DomainInfo;
  *
  */

public class CNRole2DomainInfoDAOGen extends GenericDataMiner {

  public CNRole2DomainInfoDAOGen() {super();}
  public CNRole2DomainInfoDAOGen(Connection aConnection) {super(aConnection);}
  public CNRole2DomainInfoDAOGen(UserProfile anUserProfile) {super(anUserProfile);}
  public CNRole2DomainInfoDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public CNRole2DomainInfoDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(CNRole2DomainInfo inObject) throws PersistenceException
   {
      CNRole2DomainInfo obj = new CNRole2DomainInfo();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.domainCode != obj.domainCode){
       return false;
     }

     if (inObject.cnRoleCode != obj.cnRoleCode){
       return false;
     }

     if (inObject.cnStartStateCode != obj.cnStartStateCode){
       return false;
     }
     if (inObject.subsystemRef.code != obj.subsystemRef.code){
        return false;
     }
      return true;
   }

   public int add(CNRole2DomainInfo anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(CNRole2DomainInfo anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO CNROLE2DOMAININFO (CODE,DOMAINCODE,CNROLECODE,CNSTARTSTATECODE,SUBSYSTEMREFCODE) VALUES (?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.domainCode != Integer.MIN_VALUE )
         statement.setInt(2,anObject.domainCode);
      else
         statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.cnRoleCode != Integer.MIN_VALUE )
         statement.setInt(3,anObject.cnRoleCode);
      else
         statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.cnStartStateCode != Integer.MIN_VALUE )
         statement.setInt(4,anObject.cnStartStateCode);
      else
         statement.setNull(4,java.sql.Types.INTEGER);
      if (anObject.subsystemRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.CNSubsystemTypeDAOGen(connection,getUserProfile()).exists(anObject.subsystemRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.CNRole2DomainInfo.subsystemRef.code%} = {%"+anObject.subsystemRef.code+"%}");
        statement.setInt(5,anObject.subsystemRef.code);
      }
      else
        statement.setNull(5,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%CNRole2DomainInfoDAOGen.add%}",e);
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

   public void save(CNRole2DomainInfo anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(CNRole2DomainInfo anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("DOMAINCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CNROLECODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CNSTARTSTATECODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("SUBSYSTEMREF") == 0)
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
        "UPDATE CNROLE2DOMAININFO SET  DOMAINCODE = ? , CNROLECODE = ? , CNSTARTSTATECODE = ? , SUBSYSTEMREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE CNROLE2DOMAININFO SET ";
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
      if (anObject.domainCode != Integer.MIN_VALUE )
         statement.setInt(1,anObject.domainCode);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.cnRoleCode != Integer.MIN_VALUE )
         statement.setInt(2,anObject.cnRoleCode);
      else
         statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.cnStartStateCode != Integer.MIN_VALUE )
         statement.setInt(3,anObject.cnStartStateCode);
      else
         statement.setNull(3,java.sql.Types.INTEGER);
      if (anObject.subsystemRef.code != Integer.MIN_VALUE)
        statement.setInt(4,anObject.subsystemRef.code);
      else
        statement.setNull(4,java.sql.Types.INTEGER);
          statement.setInt(5,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("DOMAINCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.domainCode);
                continue;
             }
            if("CNROLECODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.cnRoleCode);
                continue;
             }
            if("CNSTARTSTATECODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.cnStartStateCode);
                continue;
             }
            if("SUBSYSTEMREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.subsystemRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.subsystemRef.code);
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

   } // end of save(CNRole2DomainInfo anObject,String[] anAttributes)


 public CNRole2DomainInfoShort getShortObject(int anObjectCode) throws PersistenceException
  {
   CNRole2DomainInfo filterObject = new CNRole2DomainInfo();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (CNRole2DomainInfoShort)list.get(0);
   return null;
  }

  public CNRole2DomainInfoShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public CNRole2DomainInfoShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public CNRole2DomainInfoShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public CNRole2DomainInfoShortList getFilteredList(CNRole2DomainInfo filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public CNRole2DomainInfoShortList getScrollableFilteredList(CNRole2DomainInfo aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public CNRole2DomainInfoShortList getScrollableFilteredList(CNRole2DomainInfo aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public CNRole2DomainInfoShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public CNRole2DomainInfoShortList getScrollableFilteredList(CNRole2DomainInfoFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public CNRole2DomainInfoShortList getScrollableFilteredList(CNRole2DomainInfoFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public CNRole2DomainInfoShortList getScrollableFilteredList(CNRole2DomainInfo aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public CNRole2DomainInfoShortList getScrollableFilteredList(CNRole2DomainInfo aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    CNRole2DomainInfoShortList result = new CNRole2DomainInfoShortList();
    CNRole2DomainInfoShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "CNROLE2DOMAININFO.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "CNROLE2DOMAININFO.CODE"+
     ",CNROLE2DOMAININFO.DOMAINCODE"+
     ",CNROLE2DOMAININFO.CNROLECODE"+
     ",CNROLE2DOMAININFO.CNSTARTSTATECODE"+

      ", CNSUBSYSTEMTYPE.CODE " +
      ", CNSUBSYSTEMTYPE.NAME " +
     " FROM CNROLE2DOMAININFO " +
     ", CNSUBSYSTEMTYPE " +
     //" WHERE "
    "";
     whereStr = " CNSUBSYSTEMTYPE.CODE = CNROLE2DOMAININFO.SUBSYSTEMREFCODE" ; //+
        //selectStr = selectStr + " ${s} CNROLE2DOMAININFO.CODE IN ( SELECT CNROLE2DOMAININFO.CODE FROM CNROLE2DOMAININFO ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNROLE2DOMAININFO.CODE = ?";
        }
        if(aFilterObject.domainCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNROLE2DOMAININFO.DOMAINCODE = ?";
        }
        if(aFilterObject.cnRoleCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNROLE2DOMAININFO.CNROLECODE = ?";
        }
        if(aFilterObject.cnStartStateCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNROLE2DOMAININFO.CNSTARTSTATECODE = ?";
        }
        if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "CNROLE2DOMAININFO.SUBSYSTEMREFCODE = ? ";
        }

      }



      if(condition.length() != 0)
      {
         if(whereStr.length() != 0)
            whereStr = whereStr + " AND ";

         whereStr = whereStr + " (" + condition + ")";
      }
// + " WHERE" +  ������� ���� ????
     if(whereStr.length() != 0)
         selectStr = selectStr + " WHERE" + whereStr;

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
         if(aFilterObject.domainCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.domainCode);
         }
         if(aFilterObject.cnRoleCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.cnRoleCode);
         }
         if(aFilterObject.cnStartStateCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.cnStartStateCode);
         }
       if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.subsystemRef.code);
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

        anObject = new CNRole2DomainInfoShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.domainCode = set.getInt(2);
        if ( set.wasNull() )
            anObject.domainCode = Integer.MIN_VALUE;
        anObject.cnRoleCode = set.getInt(3);
        if ( set.wasNull() )
            anObject.cnRoleCode = Integer.MIN_VALUE;
        anObject.cnStartStateCode = set.getInt(4);
        if ( set.wasNull() )
            anObject.cnStartStateCode = Integer.MIN_VALUE;


        anObject.subsystemRefCode = set.getInt(5);

        anObject.subsystemRefName = set.getString(6);

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

  public int[] getFilteredCodeArray(CNRole2DomainInfo aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT CNROLE2DOMAININFO.CODE FROM CNROLE2DOMAININFO";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "CNROLE2DOMAININFO.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNROLE2DOMAININFO.CODE = ?";
        }
        if(aFilterObject.domainCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNROLE2DOMAININFO.DOMAINCODE = ?";
        }
        if(aFilterObject.cnRoleCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNROLE2DOMAININFO.CNROLECODE = ?";
        }
        if(aFilterObject.cnStartStateCode != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  CNROLE2DOMAININFO.CNSTARTSTATECODE = ?";
        }
        if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " CNROLE2DOMAININFO.SUBSYSTEMREFCODE = ? ";
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
         if(aFilterObject.code != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.code);
         }
         if(aFilterObject.domainCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.domainCode);
         }
         if(aFilterObject.cnRoleCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.cnRoleCode);
         }
         if(aFilterObject.cnStartStateCode != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.cnStartStateCode);
         }
       if(aFilterObject.subsystemRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.subsystemRef.code);
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


   public CNRole2DomainInfo getObject(int uid) throws PersistenceException
   {
    CNRole2DomainInfo result = new CNRole2DomainInfo();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(CNRole2DomainInfo anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  CNROLE2DOMAININFO.CODE, CNROLE2DOMAININFO.DOMAINCODE, CNROLE2DOMAININFO.CNROLECODE, CNROLE2DOMAININFO.CNSTARTSTATECODE, CNROLE2DOMAININFO.SUBSYSTEMREFCODE "
    +" FROM CNROLE2DOMAININFO WHERE CNROLE2DOMAININFO.CODE = ?";

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
        anObject.domainCode = set.getInt(2);
        if ( set.wasNull() )
           anObject.domainCode = Integer.MIN_VALUE;
        anObject.cnRoleCode = set.getInt(3);
        if ( set.wasNull() )
           anObject.cnRoleCode = Integer.MIN_VALUE;
        anObject.cnStartStateCode = set.getInt(4);
        if ( set.wasNull() )
           anObject.cnStartStateCode = Integer.MIN_VALUE;
        anObject.subsystemRef.code = set.getInt(5);
        if ( set.wasNull() )
            anObject.subsystemRef.code = Integer.MIN_VALUE;
        if(anObject.subsystemRef.code != Integer.MIN_VALUE)
        {
           anObject.setSubsystemRef(
        new com.ksoe.energynet.dataminer.generated.CNSubsystemTypeDAOGen(connection,getUserProfile()).getRef(anObject.subsystemRef.code));
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


  public com.ksoe.energynet.valueobject.references.CNRole2DomainInfoRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.CNRole2DomainInfoRef ref = new com.ksoe.energynet.valueobject.references.CNRole2DomainInfoRef();
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

    selectStr = "DELETE FROM  CNROLE2DOMAININFO WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    CNRole2DomainInfo object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%CNRole2DomainInfo.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(CNRole2DomainInfo.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%CNRole2DomainInfo.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(CNRole2DomainInfo.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%CNRole2DomainInfo.getObject%} access denied");

    selectStr =

    "SELECT  CNROLE2DOMAININFO.CODE FROM  CNROLE2DOMAININFO WHERE  CNROLE2DOMAININFO.CODE = ?";
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
    _checkConditionToken(condition,"code","CNROLE2DOMAININFO.CODE");
    _checkConditionToken(condition,"domaincode","CNROLE2DOMAININFO.DOMAINCODE");
    _checkConditionToken(condition,"cnrolecode","CNROLE2DOMAININFO.CNROLECODE");
    _checkConditionToken(condition,"cnstartstatecode","CNROLE2DOMAININFO.CNSTARTSTATECODE");
      // relationship conditions
    _checkConditionToken(condition,"subsystemref","SUBSYSTEMREFCODE");
    _checkConditionToken(condition,"subsystemref.code","SUBSYSTEMREFCODE");
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

   private void _collectAutoIncrementFields(CNRole2DomainInfo anObject,
           Connection connection) throws PersistenceException {

       SequenceKey hashKey = new SequenceKey("CNROLE2DOMAININFO", "CODE");
       Integer nextSeqValue = null;
       SequenceValue sequenceValue;
       synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
           if (sequenceValue == null) {
               sequenceValue = getNewSequenceValue("CNROLE2DOMAININFO", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
           if (!sequenceValue.isNextValueAvailable()) {
               sequenceValue = getNewSequenceValue("CNROLE2DOMAININFO", "CODE");
               _sequenceTable.put(hashKey, sequenceValue);
           }
       }

       nextSeqValue = sequenceValue.getNextValue();
       if (nextSeqValue == null) {
           throw new PersistenceException(
                   "Can't obtain auto increment value from: CNROLE2DOMAININFO");
       } else {
           anObject.code = nextSeqValue.intValue();
           return;
       }
   }


} // end of CNRole2DomainInfoDAO

