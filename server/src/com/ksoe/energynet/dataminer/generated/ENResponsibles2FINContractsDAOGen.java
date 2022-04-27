
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer.generated;

import com.ksoe.lla.persistence.GenericDataMiner;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;


import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
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

import com.ksoe.energynet.valueobject.ENResponsibles2FINContracts;
import com.ksoe.energynet.valueobject.filter.ENResponsibles2FINContractsFilter;
import com.ksoe.energynet.valueobject.brief.ENResponsibles2FINContractsShort;
import com.ksoe.energynet.valueobject.lists.ENResponsibles2FINContractsShortList;


/**
 * DAO Object for ENResponsibles2FINContracts;
 *
 */

public class ENResponsibles2FINContractsDAOGen extends GenericDataMiner {

  public ENResponsibles2FINContractsDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENResponsibles2FINContractsDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENResponsibles2FINContracts inObject) throws PersistenceException
   {
      ENResponsibles2FINContracts obj = new ENResponsibles2FINContracts();
      obj.code = inObject.code;
      loadObject(obj);
     if (inObject.responsiblesRef.code != obj.responsiblesRef.code){
        return false;
     }
     if (inObject.finContracts.code != obj.finContracts.code){
        return false;
     }
      return true;
   }

   public int add(ENResponsibles2FINContracts anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENResponsibles2FINContracts anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENRESPONSBLS2FNCNTRCTS (CODE,RESPONSIBLESREFCODE,FINCONTRACTSCODE) VALUES (?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.responsiblesRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENResponsiblesDAOGen(connection,getUserProfile()).exists(anObject.responsiblesRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENResponsibles2FINContracts.responsiblesRef.code%} = {%"+anObject.responsiblesRef.code+"%}");
        statement.setInt(2,anObject.responsiblesRef.code);
      }
      else
        statement.setNull(2,java.sql.Types.INTEGER);
      if (anObject.finContracts.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.FINContractsDAOGen(connection,getUserProfile()).exists(anObject.finContracts.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENResponsibles2FINContracts.finContracts.code%} = {%"+anObject.finContracts.code+"%}");
        statement.setInt(3,anObject.finContracts.code);
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
      throw new PersistenceException("Error in method {%ENResponsibles2FINContractsDAOGen.add%}",e);
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

   public void save(ENResponsibles2FINContracts anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENResponsibles2FINContracts anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("RESPONSIBLESREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("FINCONTRACTS") == 0)
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
        "UPDATE ENRESPONSBLS2FNCNTRCTS SET RESPONSIBLESREFCODE = ? , FINCONTRACTSCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENRESPONSIBLES2FINCONTRACTS SET ";
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
      if (anObject.responsiblesRef.code != Integer.MIN_VALUE)
        statement.setInt(1,anObject.responsiblesRef.code);
      else
        statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.finContracts.code != Integer.MIN_VALUE)
        statement.setInt(2,anObject.finContracts.code);
      else
        statement.setNull(2,java.sql.Types.INTEGER);
          statement.setInt(3,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("RESPONSIBLESREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.responsiblesRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.responsiblesRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("FINCONTRACTS".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.finContracts.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.finContracts.code);
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

   } // end of save(ENResponsibles2FINContracts anObject,String[] anAttributes)


 public ENResponsibles2FINContractsShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENResponsibles2FINContracts filterObject = new ENResponsibles2FINContracts();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENResponsibles2FINContractsShort)list.get(0);
   return null;
  }

  public ENResponsibles2FINContractsShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENResponsibles2FINContractsShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENResponsibles2FINContractsShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENResponsibles2FINContractsShortList getFilteredList(ENResponsibles2FINContracts filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENResponsibles2FINContractsShortList getScrollableFilteredList(ENResponsibles2FINContracts aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENResponsibles2FINContractsShortList getScrollableFilteredList(ENResponsibles2FINContracts aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENResponsibles2FINContractsShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENResponsibles2FINContractsShortList getScrollableFilteredList(ENResponsibles2FINContractsFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENResponsibles2FINContractsShortList getScrollableFilteredList(ENResponsibles2FINContractsFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENResponsibles2FINContractsShortList getScrollableFilteredList(ENResponsibles2FINContracts aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENResponsibles2FINContractsShortList getScrollableFilteredList(ENResponsibles2FINContracts aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENResponsibles2FINContractsShortList result = new ENResponsibles2FINContractsShortList();
    ENResponsibles2FINContractsShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENRESPONSBLS2FNCNTRCTS.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENRESPONSBLS2FNCNTRCTS.CODE"+

      ", ENRESPONSIBLES.CODE " +
      ", ENRESPONSIBLES.FIO " +
      ", ENRESPONSIBLES.TABNUMBER " +
      ", ENRESPONSIBLES.POSITION " +
      ", ENRESPONSIBLES.DEPNAME " +
      ", ENRESPONSIBLES.DEPCODE " +
      ", ENRESPONSIBLES.PHONE " +
      ", FINCONTRACTS.CODE " +
      ", FINCONTRACTS.CONTRACTNUMBER " +
      ", FINCONTRACTS.CONTRACTDATE " +
      ", FINCONTRACTS.FINDOCCODE " +
      ", FINCONTRACTS.FINDOCID " +
     " FROM ENRESPONSBLS2FNCNTRCTS " +
     ", ENRESPONSIBLES " +
     ", FINCONTRACTS " +
     //" WHERE "
	"";
     whereStr = " ENRESPONSIBLES.CODE = ENRESPONSBLS2FNCNTRCTS.RESPONSIBLESREFCODE" ; //+
      whereStr = whereStr +" AND FINCONTRACTS.CODE = ENRESPONSBLS2FNCNTRCTS.FINCONTRACTSCODE" ; //+
		//selectStr = selectStr + " ${s} ENRESPONSBLS2FNCNTRCTS.CODE IN ( SELECT ENRESPONSBLS2FNCNTRCTS.CODE FROM ENRESPONSBLS2FNCNTRCTS ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRESPONSBLS2FNCNTRCTS.CODE = ?";
        }
        if(aFilterObject.responsiblesRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENRESPONSBLS2FNCNTRCTS.RESPONSIBLESREFCODE = ? ";
        }
        if(aFilterObject.finContracts.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENRESPONSBLS2FNCNTRCTS.FINCONTRACTSCODE = ? ";
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
       if(aFilterObject.responsiblesRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.responsiblesRef.code);
       }
       if(aFilterObject.finContracts.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finContracts.code);
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

        anObject = new ENResponsibles2FINContractsShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;

        anObject.responsiblesRefCode = set.getInt(2);
		if(set.wasNull())
		   anObject.responsiblesRefCode = Integer.MIN_VALUE;
        anObject.responsiblesRefFIO = set.getString(3);
        anObject.responsiblesRefTabNumber = set.getInt(4);
		if(set.wasNull())
		   anObject.responsiblesRefTabNumber = Integer.MIN_VALUE;
        anObject.responsiblesRefPosition = set.getString(5);
        anObject.responsiblesRefDepName = set.getString(6);
        anObject.responsiblesRefDepCode = set.getString(7);
        anObject.responsiblesRefPhone = set.getString(8);
        anObject.finContractsCode = set.getInt(9);
		if(set.wasNull())
		   anObject.finContractsCode = Integer.MIN_VALUE;
        anObject.finContractsContractNumber = set.getString(10);
        anObject.finContractsContractDate = set.getDate(11);
        anObject.finContractsFinDocCode = set.getString(12);
        anObject.finContractsFinDocID = set.getInt(13);
		if(set.wasNull())
		   anObject.finContractsFinDocID = Integer.MIN_VALUE;

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

  public int[] getFilteredCodeArrayOLD(ENResponsibles2FINContracts aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENRESPONSBLS2FNCNTRCTS.CODE FROM ENRESPONSBLS2FNCNTRCTS";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENRESPONSBLS2FNCNTRCTS.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRESPONSBLS2FNCNTRCTS.CODE = ?";
        }
        if(aFilterObject.responsiblesRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENRESPONSBLS2FNCNTRCTS.RESPONSIBLESREFCODE = ? ";
        }
        if(aFilterObject.finContracts.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENRESPONSBLS2FNCNTRCTS.FINCONTRACTSCODE = ? ";
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
       if(aFilterObject.responsiblesRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.responsiblesRef.code);
       }
       if(aFilterObject.finContracts.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finContracts.code);
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

  public int[] getFilteredCodeArray(ENResponsibles2FINContractsFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
	return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENResponsibles2FINContracts aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENRESPONSBLS2FNCNTRCTS.CODE FROM ENRESPONSBLS2FNCNTRCTS";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENRESPONSBLS2FNCNTRCTS.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENRESPONSBLS2FNCNTRCTS.CODE = ?";
        }
        if(aFilterObject.responsiblesRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENRESPONSBLS2FNCNTRCTS.RESPONSIBLESREFCODE = ? ";
        }
        if(aFilterObject.finContracts.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENRESPONSBLS2FNCNTRCTS.FINCONTRACTSCODE = ? ";
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
       if(aFilterObject.responsiblesRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.responsiblesRef.code);
       }
       if(aFilterObject.finContracts.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.finContracts.code);
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


   public ENResponsibles2FINContracts getObject(int uid) throws PersistenceException
   {
    ENResponsibles2FINContracts result = new ENResponsibles2FINContracts();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENResponsibles2FINContracts anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENRESPONSBLS2FNCNTRCTS.CODE, ENRESPONSBLS2FNCNTRCTS.RESPONSIBLESREFCODE, ENRESPONSBLS2FNCNTRCTS.FINCONTRACTSCODE "
    +" FROM ENRESPONSBLS2FNCNTRCTS WHERE ENRESPONSBLS2FNCNTRCTS.CODE = ?";

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
        anObject.responsiblesRef.code = set.getInt(2);
        if ( set.wasNull() )
            anObject.responsiblesRef.code = Integer.MIN_VALUE;
        anObject.finContracts.code = set.getInt(3);
        if ( set.wasNull() )
            anObject.finContracts.code = Integer.MIN_VALUE;
        if(anObject.responsiblesRef.code != Integer.MIN_VALUE)
        {
           anObject.setResponsiblesRef(
		   new com.ksoe.energynet.dataminer.generated.ENResponsiblesDAOGen(connection,getUserProfile()).getRef(anObject.responsiblesRef.code));
	   }
        if(anObject.finContracts.code != Integer.MIN_VALUE)
        {
           anObject.setFinContracts(
		   new com.ksoe.energynet.dataminer.generated.FINContractsDAOGen(connection,getUserProfile()).getObject(anObject.finContracts.code));
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


  public com.ksoe.energynet.valueobject.references.ENResponsibles2FINContractsRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENResponsibles2FINContractsRef ref = new com.ksoe.energynet.valueobject.references.ENResponsibles2FINContractsRef();
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

    selectStr = "DELETE FROM  ENRESPONSBLS2FNCNTRCTS WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENResponsibles2FINContracts object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENResponsibles2FINContracts.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENResponsibles2FINContracts.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENResponsibles2FINContracts.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENResponsibles2FINContracts.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENResponsibles2FINContracts.getObject%} access denied");

    selectStr =

    "SELECT  ENRESPONSBLS2FNCNTRCTS.CODE FROM  ENRESPONSBLS2FNCNTRCTS WHERE  ENRESPONSBLS2FNCNTRCTS.CODE = ?";
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
    _checkConditionToken(condition,"code","ENRESPONSBLS2FNCNTRCTS.CODE");
      // relationship conditions
    _checkConditionToken(condition,"responsiblesref","RESPONSIBLESREFCODE");
    _checkConditionToken(condition,"responsiblesref.code","RESPONSIBLESREFCODE");
    _checkConditionToken(condition,"fincontracts","FINCONTRACTSCODE");
    _checkConditionToken(condition,"fincontracts.code","FINCONTRACTSCODE");
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

	private void _collectAutoIncrementFields(ENResponsibles2FINContracts anObject,
			Connection connection) throws PersistenceException {
		
		SequenceKey hashKey = new SequenceKey("ENRESPONSBLS2FNCNTRCTS", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENRESPONSBLS2FNCNTRCTS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENRESPONSBLS2FNCNTRCTS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}
		
		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
					"Can't obtain auto increment value from: ENRESPONSBLS2FNCNTRCTS");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENResponsibles2FINContractsDAO
