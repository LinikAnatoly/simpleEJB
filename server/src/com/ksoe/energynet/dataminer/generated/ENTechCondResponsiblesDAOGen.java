
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

import com.ksoe.energynet.valueobject.ENTechCondResponsibles;
import com.ksoe.energynet.valueobject.filter.ENTechCondResponsiblesFilter;
import com.ksoe.energynet.valueobject.brief.ENTechCondResponsiblesShort;
import com.ksoe.energynet.valueobject.lists.ENTechCondResponsiblesShortList;


/**
 * DAO Object for ENTechCondResponsibles;
 *
 */

public class ENTechCondResponsiblesDAOGen extends GenericDataMiner {

  public ENTechCondResponsiblesDAOGen(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTechCondResponsiblesDAOGen(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

   private boolean isEqual(ENTechCondResponsibles inObject) throws PersistenceException
   {
      ENTechCondResponsibles obj = new ENTechCondResponsibles();
      obj.code = inObject.code;
      loadObject(obj);

     if (inObject.responsibleFIO != obj.responsibleFIO){
       return false;
     }

     if (inObject.responsibleTabNumber != obj.responsibleTabNumber){
       return false;
     }

     if (inObject.responsiblePosition != obj.responsiblePosition){
       return false;
     }

     if (inObject.responsibleDepName != obj.responsibleDepName){
       return false;
     }

     if (inObject.responsibleDepCode != obj.responsibleDepCode){
       return false;
     }

     if (inObject.responsiblePhone != obj.responsiblePhone){
       return false;
     }

     if (inObject.power != obj.power){
       return false;
     }
      return true;
   }

   public int add(ENTechCondResponsibles anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENTechCondResponsibles anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENTECHCONDRESPONSIBLES (CODE,RESPONSIBLEFIO,RESPONSIBLETABNUMBER,RESPONSIBLEPOSITION,RESPONSIBLEDEPNAME,RESPONSIBLEDEPCODE,RESPONSIBLEPHONE,POWER) VALUES (?,?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.responsibleFIO);
      if (anObject.responsibleTabNumber != Integer.MIN_VALUE )
         statement.setInt(3,anObject.responsibleTabNumber);
      else
         statement.setNull(3,java.sql.Types.INTEGER);
      statement.setString(4,anObject.responsiblePosition);
      statement.setString(5,anObject.responsibleDepName);
      statement.setString(6,anObject.responsibleDepCode);
      statement.setString(7,anObject.responsiblePhone);
      if (anObject.power != Integer.MIN_VALUE )
         statement.setInt(8,anObject.power);
      else
         statement.setNull(8,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENTechCondResponsiblesDAOGen.add%}",e);
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

   public void save(ENTechCondResponsibles anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENTechCondResponsibles anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("RESPONSIBLEFIO") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("RESPONSIBLETABNUMBER") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("RESPONSIBLEPOSITION") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("RESPONSIBLEDEPNAME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("RESPONSIBLEDEPCODE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("RESPONSIBLEPHONE") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("POWER") == 0)
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
        "UPDATE ENTECHCONDRESPONSIBLES SET  RESPONSIBLEFIO = ? , RESPONSIBLETABNUMBER = ? , RESPONSIBLEPOSITION = ? , RESPONSIBLEDEPNAME = ? , RESPONSIBLEDEPCODE = ? , RESPONSIBLEPHONE = ? , POWER = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENTECHCONDRESPONSIBLES SET ";
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
      statement.setString(1,anObject.responsibleFIO);
      if (anObject.responsibleTabNumber != Integer.MIN_VALUE )
         statement.setInt(2,anObject.responsibleTabNumber);
      else
         statement.setNull(2,java.sql.Types.INTEGER);
      statement.setString(3,anObject.responsiblePosition);
      statement.setString(4,anObject.responsibleDepName);
      statement.setString(5,anObject.responsibleDepCode);
      statement.setString(6,anObject.responsiblePhone);
      if (anObject.power != Integer.MIN_VALUE )
         statement.setInt(7,anObject.power);
      else
         statement.setNull(7,java.sql.Types.INTEGER);
          statement.setInt(8,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("RESPONSIBLEFIO".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.responsibleFIO);
                continue;
             }
            if("RESPONSIBLETABNUMBER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.responsibleTabNumber);
                continue;
             }
            if("RESPONSIBLEPOSITION".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.responsiblePosition);
                continue;
             }
            if("RESPONSIBLEDEPNAME".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.responsibleDepName);
                continue;
             }
            if("RESPONSIBLEDEPCODE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.responsibleDepCode);
                continue;
             }
            if("RESPONSIBLEPHONE".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.responsiblePhone);
                continue;
             }
            if("POWER".compareTo((String)fields.get(i)) == 0)
             {
                statement.setInt(i+1,anObject.power);
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

   } // end of save(ENTechCondResponsibles anObject,String[] anAttributes)


 public ENTechCondResponsiblesShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENTechCondResponsibles filterObject = new ENTechCondResponsibles();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENTechCondResponsiblesShort)list.get(0);
   return null;
  }

  public ENTechCondResponsiblesShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENTechCondResponsiblesShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENTechCondResponsiblesShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENTechCondResponsiblesShortList getFilteredList(ENTechCondResponsibles filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENTechCondResponsiblesShortList getScrollableFilteredList(ENTechCondResponsibles aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENTechCondResponsiblesShortList getScrollableFilteredList(ENTechCondResponsibles aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENTechCondResponsiblesShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENTechCondResponsiblesShortList getScrollableFilteredList(ENTechCondResponsiblesFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENTechCondResponsiblesShortList getScrollableFilteredList(ENTechCondResponsiblesFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENTechCondResponsiblesShortList getScrollableFilteredList(ENTechCondResponsibles aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENTechCondResponsiblesShortList getScrollableFilteredList(ENTechCondResponsibles aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENTechCondResponsiblesShortList result = new ENTechCondResponsiblesShortList();
    ENTechCondResponsiblesShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTECHCONDRESPONSIBLES.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENTECHCONDRESPONSIBLES.CODE"+
     ",ENTECHCONDRESPONSIBLES.RESPONSIBLEFIO"+
     ",ENTECHCONDRESPONSIBLES.RESPONSIBLETABNUMBER"+
     ",ENTECHCONDRESPONSIBLES.RESPONSIBLEPOSITION"+
     ",ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPNAME"+
     ",ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPCODE"+
     ",ENTECHCONDRESPONSIBLES.RESPONSIBLEPHONE"+
     ",ENTECHCONDRESPONSIBLES.POWER"+

     " FROM ENTECHCONDRESPONSIBLES " +
     //" WHERE "
	"";
		//selectStr = selectStr + " ${s} ENTECHCONDRESPONSIBLES.CODE IN ( SELECT ENTECHCONDRESPONSIBLES.CODE FROM ENTECHCONDRESPONSIBLES ";

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTECHCONDRESPONSIBLES.CODE = ?";
        }
         if (aFilterObject.responsibleFIO != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.responsibleFIO.indexOf('*',0) < 0 && aFilterObject.responsibleFIO.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTECHCONDRESPONSIBLES.RESPONSIBLEFIO) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTECHCONDRESPONSIBLES.RESPONSIBLEFIO) LIKE UPPER(?)";
         }
        if(aFilterObject.responsibleTabNumber != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTECHCONDRESPONSIBLES.RESPONSIBLETABNUMBER = ?";
        }
         if (aFilterObject.responsiblePosition != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.responsiblePosition.indexOf('*',0) < 0 && aFilterObject.responsiblePosition.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTECHCONDRESPONSIBLES.RESPONSIBLEPOSITION) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTECHCONDRESPONSIBLES.RESPONSIBLEPOSITION) LIKE UPPER(?)";
         }
         if (aFilterObject.responsibleDepName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.responsibleDepName.indexOf('*',0) < 0 && aFilterObject.responsibleDepName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPNAME) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPNAME) LIKE UPPER(?)";
         }
         if (aFilterObject.responsibleDepCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.responsibleDepCode.indexOf('*',0) < 0 && aFilterObject.responsibleDepCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPCODE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPCODE) LIKE UPPER(?)";
         }
         if (aFilterObject.responsiblePhone != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.responsiblePhone.indexOf('*',0) < 0 && aFilterObject.responsiblePhone.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENTECHCONDRESPONSIBLES.RESPONSIBLEPHONE) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENTECHCONDRESPONSIBLES.RESPONSIBLEPHONE) LIKE UPPER(?)";
         }
        if(aFilterObject.power != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTECHCONDRESPONSIBLES.POWER = ?";
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

           if(aFilterObject.responsibleFIO != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.responsibleFIO);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.responsibleTabNumber != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.responsibleTabNumber);
         }

           if(aFilterObject.responsiblePosition != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.responsiblePosition);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.responsibleDepName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.responsibleDepName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.responsibleDepCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.responsibleDepCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }

           if(aFilterObject.responsiblePhone != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.responsiblePhone);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         if(aFilterObject.power != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.power);
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

        anObject = new ENTechCondResponsiblesShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.responsibleFIO = set.getString(2);
        anObject.responsibleTabNumber = set.getInt(3);
        if ( set.wasNull() )
            anObject.responsibleTabNumber = Integer.MIN_VALUE;
        anObject.responsiblePosition = set.getString(4);
        anObject.responsibleDepName = set.getString(5);
        anObject.responsibleDepCode = set.getString(6);
        anObject.responsiblePhone = set.getString(7);
        anObject.power = set.getInt(8);
        if ( set.wasNull() )
            anObject.power = Integer.MIN_VALUE;


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

  public int[] getFilteredCodeArrayOLD(ENTechCondResponsibles aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTECHCONDRESPONSIBLES.CODE FROM ENTECHCONDRESPONSIBLES";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTECHCONDRESPONSIBLES.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTECHCONDRESPONSIBLES.CODE = ?";
        }
         if (aFilterObject.responsibleFIO != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.responsibleFIO.indexOf('*',0) < 0 && aFilterObject.responsibleFIO.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTECHCONDRESPONSIBLES.RESPONSIBLEFIO = ?";
             else
                 whereStr = whereStr + "  ENTECHCONDRESPONSIBLES.RESPONSIBLEFIO LIKE ?";
         }
        if(aFilterObject.responsibleTabNumber != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTECHCONDRESPONSIBLES.RESPONSIBLETABNUMBER = ?";
        }
         if (aFilterObject.responsiblePosition != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.responsiblePosition.indexOf('*',0) < 0 && aFilterObject.responsiblePosition.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTECHCONDRESPONSIBLES.RESPONSIBLEPOSITION = ?";
             else
                 whereStr = whereStr + "  ENTECHCONDRESPONSIBLES.RESPONSIBLEPOSITION LIKE ?";
         }
         if (aFilterObject.responsibleDepName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.responsibleDepName.indexOf('*',0) < 0 && aFilterObject.responsibleDepName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPNAME = ?";
             else
                 whereStr = whereStr + "  ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPNAME LIKE ?";
         }
         if (aFilterObject.responsibleDepCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.responsibleDepCode.indexOf('*',0) < 0 && aFilterObject.responsibleDepCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPCODE = ?";
             else
                 whereStr = whereStr + "  ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPCODE LIKE ?";
         }
         if (aFilterObject.responsiblePhone != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.responsiblePhone.indexOf('*',0) < 0 && aFilterObject.responsiblePhone.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTECHCONDRESPONSIBLES.RESPONSIBLEPHONE = ?";
             else
                 whereStr = whereStr + "  ENTECHCONDRESPONSIBLES.RESPONSIBLEPHONE LIKE ?";
         }
        if(aFilterObject.power != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTECHCONDRESPONSIBLES.POWER = ?";
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
         if (aFilterObject.responsibleFIO != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.responsibleFIO.indexOf('*',0) < 0 && aFilterObject.responsibleFIO.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTECHCONDRESPONSIBLES.RESPONSIBLEFIO = ?";
             else
                 whereStr = whereStr + " ENTECHCONDRESPONSIBLES.RESPONSIBLEFIO LIKE ?";

           if(aFilterObject.responsibleFIO != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.responsibleFIO);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.responsibleTabNumber != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.responsibleTabNumber);
         }
         if (aFilterObject.responsiblePosition != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.responsiblePosition.indexOf('*',0) < 0 && aFilterObject.responsiblePosition.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTECHCONDRESPONSIBLES.RESPONSIBLEPOSITION = ?";
             else
                 whereStr = whereStr + " ENTECHCONDRESPONSIBLES.RESPONSIBLEPOSITION LIKE ?";

           if(aFilterObject.responsiblePosition != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.responsiblePosition);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.responsibleDepName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.responsibleDepName.indexOf('*',0) < 0 && aFilterObject.responsibleDepName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPNAME = ?";
             else
                 whereStr = whereStr + " ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPNAME LIKE ?";

           if(aFilterObject.responsibleDepName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.responsibleDepName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.responsibleDepCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.responsibleDepCode.indexOf('*',0) < 0 && aFilterObject.responsibleDepCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPCODE = ?";
             else
                 whereStr = whereStr + " ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPCODE LIKE ?";

           if(aFilterObject.responsibleDepCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.responsibleDepCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.responsiblePhone != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.responsiblePhone.indexOf('*',0) < 0 && aFilterObject.responsiblePhone.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTECHCONDRESPONSIBLES.RESPONSIBLEPHONE = ?";
             else
                 whereStr = whereStr + " ENTECHCONDRESPONSIBLES.RESPONSIBLEPHONE LIKE ?";

           if(aFilterObject.responsiblePhone != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.responsiblePhone);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.power != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.power);
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

  public int[] getFilteredCodeArray(ENTechCondResponsiblesFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
	return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENTechCondResponsibles aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENTECHCONDRESPONSIBLES.CODE FROM ENTECHCONDRESPONSIBLES";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENTECHCONDRESPONSIBLES.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTECHCONDRESPONSIBLES.CODE = ?";
        }
         if (aFilterObject.responsibleFIO != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.responsibleFIO.indexOf('*',0) < 0 && aFilterObject.responsibleFIO.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTECHCONDRESPONSIBLES.RESPONSIBLEFIO = ?";
             else
                 whereStr = whereStr + "  ENTECHCONDRESPONSIBLES.RESPONSIBLEFIO LIKE ?";
         }
        if(aFilterObject.responsibleTabNumber != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTECHCONDRESPONSIBLES.RESPONSIBLETABNUMBER = ?";
        }
         if (aFilterObject.responsiblePosition != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.responsiblePosition.indexOf('*',0) < 0 && aFilterObject.responsiblePosition.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTECHCONDRESPONSIBLES.RESPONSIBLEPOSITION = ?";
             else
                 whereStr = whereStr + "  ENTECHCONDRESPONSIBLES.RESPONSIBLEPOSITION LIKE ?";
         }
         if (aFilterObject.responsibleDepName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.responsibleDepName.indexOf('*',0) < 0 && aFilterObject.responsibleDepName.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPNAME = ?";
             else
                 whereStr = whereStr + "  ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPNAME LIKE ?";
         }
         if (aFilterObject.responsibleDepCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.responsibleDepCode.indexOf('*',0) < 0 && aFilterObject.responsibleDepCode.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPCODE = ?";
             else
                 whereStr = whereStr + "  ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPCODE LIKE ?";
         }
         if (aFilterObject.responsiblePhone != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.responsiblePhone.indexOf('*',0) < 0 && aFilterObject.responsiblePhone.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENTECHCONDRESPONSIBLES.RESPONSIBLEPHONE = ?";
             else
                 whereStr = whereStr + "  ENTECHCONDRESPONSIBLES.RESPONSIBLEPHONE LIKE ?";
         }
        if(aFilterObject.power != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENTECHCONDRESPONSIBLES.POWER = ?";
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
         if (aFilterObject.responsibleFIO != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.responsibleFIO.indexOf('*',0) < 0 && aFilterObject.responsibleFIO.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTECHCONDRESPONSIBLES.RESPONSIBLEFIO = ?";
             else
                 whereStr = whereStr + " ENTECHCONDRESPONSIBLES.RESPONSIBLEFIO LIKE ?";

           if(aFilterObject.responsibleFIO != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.responsibleFIO);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.responsibleTabNumber != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.responsibleTabNumber);
         }
         if (aFilterObject.responsiblePosition != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.responsiblePosition.indexOf('*',0) < 0 && aFilterObject.responsiblePosition.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTECHCONDRESPONSIBLES.RESPONSIBLEPOSITION = ?";
             else
                 whereStr = whereStr + " ENTECHCONDRESPONSIBLES.RESPONSIBLEPOSITION LIKE ?";

           if(aFilterObject.responsiblePosition != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.responsiblePosition);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.responsibleDepName != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.responsibleDepName.indexOf('*',0) < 0 && aFilterObject.responsibleDepName.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPNAME = ?";
             else
                 whereStr = whereStr + " ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPNAME LIKE ?";

           if(aFilterObject.responsibleDepName != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.responsibleDepName);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.responsibleDepCode != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.responsibleDepCode.indexOf('*',0) < 0 && aFilterObject.responsibleDepCode.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPCODE = ?";
             else
                 whereStr = whereStr + " ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPCODE LIKE ?";

           if(aFilterObject.responsibleDepCode != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.responsibleDepCode);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if (aFilterObject.responsiblePhone != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.responsiblePhone.indexOf('*',0) < 0 && aFilterObject.responsiblePhone.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENTECHCONDRESPONSIBLES.RESPONSIBLEPHONE = ?";
             else
                 whereStr = whereStr + " ENTECHCONDRESPONSIBLES.RESPONSIBLEPHONE LIKE ?";

           if(aFilterObject.responsiblePhone != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.responsiblePhone);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
         if(aFilterObject.power != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.power);
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


   public ENTechCondResponsibles getObject(int uid) throws PersistenceException
   {
    ENTechCondResponsibles result = new ENTechCondResponsibles();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENTechCondResponsibles anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENTECHCONDRESPONSIBLES.CODE, ENTECHCONDRESPONSIBLES.RESPONSIBLEFIO, ENTECHCONDRESPONSIBLES.RESPONSIBLETABNUMBER, ENTECHCONDRESPONSIBLES.RESPONSIBLEPOSITION, ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPNAME, ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPCODE, ENTECHCONDRESPONSIBLES.RESPONSIBLEPHONE, ENTECHCONDRESPONSIBLES.POWER "
    +" FROM ENTECHCONDRESPONSIBLES WHERE ENTECHCONDRESPONSIBLES.CODE = ?";

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
        anObject.responsibleFIO = set.getString(2);
        anObject.responsibleTabNumber = set.getInt(3);
        if ( set.wasNull() )
           anObject.responsibleTabNumber = Integer.MIN_VALUE;
        anObject.responsiblePosition = set.getString(4);
        anObject.responsibleDepName = set.getString(5);
        anObject.responsibleDepCode = set.getString(6);
        anObject.responsiblePhone = set.getString(7);
        anObject.power = set.getInt(8);
        if ( set.wasNull() )
           anObject.power = Integer.MIN_VALUE;
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


  public com.ksoe.energynet.valueobject.references.ENTechCondResponsiblesRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENTechCondResponsiblesRef ref = new com.ksoe.energynet.valueobject.references.ENTechCondResponsiblesRef();
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

    selectStr = "DELETE FROM  ENTECHCONDRESPONSIBLES WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENTechCondResponsibles object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENTechCondResponsibles.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENTechCondResponsibles.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENTechCondResponsibles.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTechCondResponsibles.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENTechCondResponsibles.getObject%} access denied");

    selectStr =

    "SELECT  ENTECHCONDRESPONSIBLES.CODE FROM  ENTECHCONDRESPONSIBLES WHERE  ENTECHCONDRESPONSIBLES.CODE = ?";
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
    _checkConditionToken(condition,"code","ENTECHCONDRESPONSIBLES.CODE");
    _checkConditionToken(condition,"responsiblefio","ENTECHCONDRESPONSIBLES.RESPONSIBLEFIO");
    _checkConditionToken(condition,"responsibletabnumber","ENTECHCONDRESPONSIBLES.RESPONSIBLETABNUMBER");
    _checkConditionToken(condition,"responsibleposition","ENTECHCONDRESPONSIBLES.RESPONSIBLEPOSITION");
    _checkConditionToken(condition,"responsibledepname","ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPNAME");
    _checkConditionToken(condition,"responsibledepcode","ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPCODE");
    _checkConditionToken(condition,"responsiblephone","ENTECHCONDRESPONSIBLES.RESPONSIBLEPHONE");
    _checkConditionToken(condition,"power","ENTECHCONDRESPONSIBLES.POWER");
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

	private void _collectAutoIncrementFields(ENTechCondResponsibles anObject,
			Connection connection) throws PersistenceException {
		
		SequenceKey hashKey = new SequenceKey("ENTECHCONDRESPONSIBLES", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENTECHCONDRESPONSIBLES", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENTECHCONDRESPONSIBLES", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}
		
		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
					"Can't obtain auto increment value from: ENTECHCONDRESPONSIBLES");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENTechCondResponsiblesDAO
