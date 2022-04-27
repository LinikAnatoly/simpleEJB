
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer.generated;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
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

import com.ksoe.energynet.valueobject.ENCottage2TKClassificationType;
import com.ksoe.energynet.valueobject.filter.ENCottage2TKClassificationTypeFilter;
import com.ksoe.energynet.valueobject.brief.ENCottage2TKClassificationTypeShort;
import com.ksoe.energynet.valueobject.lists.ENCottage2TKClassificationTypeShortList;

import com.ksoe.techcard.dataminer.TKClassificationTypeDAO;

/**
 * DAO Object for ENCottage2TKClassificationType;
 *
 */

public class ENCottage2TKClassificationTypeDAOGen extends GenericDataMiner {

   public ENCottage2TKClassificationTypeDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENCottage2TKClassificationTypeDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   protected boolean isEqual(ENCottage2TKClassificationType inObject) throws PersistenceException
   {
      ENCottage2TKClassificationType obj = new ENCottage2TKClassificationType();
      obj.code = inObject.code;
      loadObject(obj);

	if(inObject.userGen == null && obj.userGen == null){}
	else
		if(inObject.userGen == null || obj.userGen == null) return false;
		else
			if ( ! inObject.userGen.equals(obj.userGen)){
				return false;
			}

	if(inObject.dateEdit == null && obj.dateEdit == null){}
	else
		if(inObject.dateEdit == null || obj.dateEdit == null) return false;
		else
			if ( ! inObject.dateEdit.equals(obj.dateEdit)){
				return false;
			}
     if (inObject.classificationTypeRef.code != obj.classificationTypeRef.code){
        return false;
     }
     if (inObject.cottageRef.code != obj.cottageRef.code){
        return false;
     }
      return true;
   }

   public int add(ENCottage2TKClassificationType anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENCottage2TKClassificationType anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;

  anObject.modify_time = System.currentTimeMillis();

    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENCOTTAGE2TKCLSSFCTNTP (CODE,USERGEN,DATEEDIT,MODIFY_TIME,CLASSIFICATIONTYPERFCD,COTTAGEREFCODE) VALUES (?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      statement.setString(2,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(3,null);
      else
        statement.setTimestamp(3,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(4,null);
      else
        statement.setBigDecimal(4,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.classificationTypeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKClassificationTypeDAOGen(connection,getUserProfile()).exists(anObject.classificationTypeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENCottage2TKClassificationType.classificationTypeRef.code%} = {%"+anObject.classificationTypeRef.code+"%}");
        statement.setInt(5,anObject.classificationTypeRef.code);
      }
      else
        statement.setNull(5,java.sql.Types.INTEGER);
      if (anObject.cottageRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENCottageDAOGen(connection,getUserProfile()).exists(anObject.cottageRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENCottage2TKClassificationType.cottageRef.code%} = {%"+anObject.cottageRef.code+"%}");
        statement.setInt(6,anObject.cottageRef.code);
      }
      else
        statement.setNull(6,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENCottage2TKClassificationTypeDAOGen.add%}",e);
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

   public void save(ENCottage2TKClassificationType anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENCottage2TKClassificationType anObject,String[] anAttributes) throws PersistenceException
   {
    if(anAttributes != null && anAttributes.length == 0)
       return;

    Connection connection = getConnection();
    try
     {
      PreparedStatement statement = null;

      ENCottage2TKClassificationType oldObject = new ENCottage2TKClassificationType();
      oldObject.code = anObject.code;

      String oldObjectSelectStr =
       "SELECT "+ENCottage2TKClassificationType.modify_time_Field+" FROM  ENCOTTAGE2TKCLSSFCTNTP WHERE CODE = ?";

      ResultSet set = null;
      try
       {
        statement = connection.prepareStatement(oldObjectSelectStr);
        statement.setInt(1,oldObject.code);
        set = statement.executeQuery();
        if(!set.next())
           throw new PersistenceException("Can't get old object.");

        oldObject.modify_time = set.getLong(1);
        if(set.wasNull())
          oldObject.modify_time = Long.MIN_VALUE;
       }
      catch(SQLException e)
       {
        System.out.println(e.getMessage()+"\nstatement - "+oldObjectSelectStr);
        throw new SystemException(e.getMessage(), e);
       }
      finally
       {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
       }

      if(oldObject.modify_time != anObject.modify_time)
         throw new PersistenceException("Can't update object (optimistic locking).");

      anObject.modify_time = System.currentTimeMillis();

      String selectStr;

      Vector fields = null;
      if(anAttributes != null)
       {
        String fieldNameStr;
        fields = new Vector();
        for(int attrIndex = 0;attrIndex < anAttributes.length;attrIndex++)
         {
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("USERGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("DATEEDIT") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("MODIFY_TIME") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("CLASSIFICATIONTYPEREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COTTAGEREF") == 0)
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
        "UPDATE ENCOTTAGE2TKCLSSFCTNTP SET  USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , CLASSIFICATIONTYPERFCD = ? , COTTAGEREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENCOTTAGE2TKCLASSIFICATIONTYPE SET ";
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
      statement.setString(1,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(2,null);
      else
        statement.setTimestamp(2,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.modify_time == Long.MIN_VALUE)
        statement.setBigDecimal(3,null);
      else
        statement.setBigDecimal(3,new java.math.BigDecimal(anObject.modify_time));
      if (anObject.classificationTypeRef.code != Integer.MIN_VALUE)
        statement.setInt(4,anObject.classificationTypeRef.code);
      else
        statement.setNull(4,java.sql.Types.INTEGER);
      if (anObject.cottageRef.code != Integer.MIN_VALUE)
        statement.setInt(5,anObject.cottageRef.code);
      else
        statement.setNull(5,java.sql.Types.INTEGER);
          statement.setInt(6,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("USERGEN".compareTo((String)fields.get(i)) == 0)
             {
                statement.setString(i+1,anObject.userGen);
                continue;
             }
            if("DATEEDIT".compareTo((String)fields.get(i)) == 0)
             {
      if (anObject.dateEdit == null)
                statement.setTimestamp(i+1,null);
      else
                statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateEdit.getTime()));
                continue;
             }
            if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.modify_time == Long.MIN_VALUE)
                    statement.setBigDecimal(i+1,null);
                else
                     statement.setBigDecimal(i+1,new java.math.BigDecimal(anObject.modify_time));
                continue;
             }
            if("CLASSIFICATIONTYPEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.classificationTypeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.classificationTypeRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("COTTAGEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.cottageRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.cottageRef.code);
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

   } // end of save(ENCottage2TKClassificationType anObject,String[] anAttributes)


 public ENCottage2TKClassificationTypeShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENCottage2TKClassificationType filterObject = new ENCottage2TKClassificationType();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENCottage2TKClassificationTypeShort)list.get(0);
   return null;
  }

  public ENCottage2TKClassificationTypeShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENCottage2TKClassificationTypeShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENCottage2TKClassificationTypeShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENCottage2TKClassificationTypeShortList getFilteredList(ENCottage2TKClassificationType filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENCottage2TKClassificationTypeShortList getScrollableFilteredList(ENCottage2TKClassificationType aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENCottage2TKClassificationTypeShortList getScrollableFilteredList(ENCottage2TKClassificationType aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENCottage2TKClassificationTypeShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENCottage2TKClassificationTypeShortList getScrollableFilteredList(ENCottage2TKClassificationTypeFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENCottage2TKClassificationTypeShortList getScrollableFilteredList(ENCottage2TKClassificationTypeFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENCottage2TKClassificationTypeShortList getScrollableFilteredList(ENCottage2TKClassificationType aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENCottage2TKClassificationTypeShortList getScrollableFilteredList(ENCottage2TKClassificationType aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    ENCottage2TKClassificationTypeShortList result = new ENCottage2TKClassificationTypeShortList();
    ENCottage2TKClassificationTypeShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCOTTAGE2TKCLSSFCTNTP.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENCOTTAGE2TKCLSSFCTNTP.CODE"+
     ",ENCOTTAGE2TKCLSSFCTNTP.USERGEN"+
     ",ENCOTTAGE2TKCLSSFCTNTP.DATEEDIT"+

      ", TKCLASSIFICATIONTYPE.CODE " +
      ", TKCLASSIFICATIONTYPE.NAME " +
      ", TKCLASSIFICATIONTYPE.KOD " +
      ", ENCOTTAGE.CODE " +
      ", ENCOTTAGE.NUMBERGEN " +
      ", ENCOTTAGE.NUMBERBEDS " +
      ", ENCOTTAGE.DESCRIPTION " +
      ", ENCOTTAGE.COMMENTGEN " +
      ", ENCOTTAGE.USERGEN " +
      ", ENCOTTAGE.DATEEDIT " +
     " FROM ENCOTTAGE2TKCLSSFCTNTP " +
     ", TKCLASSIFICATIONTYPE " +
     ", ENCOTTAGE " +
     //" WHERE "
  "";
     whereStr = " TKCLASSIFICATIONTYPE.CODE = ENCOTTAGE2TKCLSSFCTNTP.CLASSIFICATIONTYPERFCD" ; //+
      whereStr = whereStr +" AND ENCOTTAGE.CODE = ENCOTTAGE2TKCLSSFCTNTP.COTTAGEREFCODE" ; //+
    //selectStr = selectStr + " ${s} ENCOTTAGE2TKCLSSFCTNTP.CODE IN ( SELECT ENCOTTAGE2TKCLSSFCTNTP.CODE FROM ENCOTTAGE2TKCLSSFCTNTP ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCOTTAGE2TKCLSSFCTNTP.CODE = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENCOTTAGE2TKCLSSFCTNTP.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENCOTTAGE2TKCLSSFCTNTP.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCOTTAGE2TKCLSSFCTNTP.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCOTTAGE2TKCLSSFCTNTP.MODIFY_TIME = ?";
        }
        if(aFilterObject.classificationTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENCOTTAGE2TKCLSSFCTNTP.CLASSIFICATIONTYPERFCD = ? ";
        }
        if(aFilterObject.cottageRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENCOTTAGE2TKCLSSFCTNTP.COTTAGEREFCODE = ? ";
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

    selectStr = selectStr + " OFFSET " + fromPosition;
    if (quantity>-1) selectStr = selectStr + " LIMIT " + quantity;

    try
     {
      statement = connection.prepareStatement(selectStr);
      int number = 0;
      if(aFilterObject != null){
         if(aFilterObject.code != Integer.MIN_VALUE){
             number++;
             statement.setInt(number,aFilterObject.code);
         }

           if(aFilterObject.userGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.userGen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
        if(aFilterObject.dateEdit != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.classificationTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.classificationTypeRef.code);
       }
       if(aFilterObject.cottageRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cottageRef.code);
       }
      }

      if(condition.length() > 0 && aBindObjects != null)
       _bindObjectsToPreparedStatement(statement,aBindObjects,number);

      set = statement.executeQuery();
      int i;
      for (i = 0; set.next(); i++) {
        /*
        if (i < fromPosition)
          continue;
        else if (i >= fromPosition + quantity) {
          i++;
          break;
        } */

        anObject = new ENCottage2TKClassificationTypeShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.userGen = set.getString(2);
        anObject.dateEdit = set.getTimestamp(3);

        anObject.classificationTypeRefCode = set.getInt(4);
    if(set.wasNull())
      anObject.classificationTypeRefCode = Integer.MIN_VALUE;
        anObject.classificationTypeRefName = set.getString(5);
        anObject.classificationTypeRefKod = set.getString(6);
        anObject.cottageRefCode = set.getInt(7);
    if(set.wasNull())
      anObject.cottageRefCode = Integer.MIN_VALUE;
        anObject.cottageRefNumberGen = set.getString(8);
        anObject.cottageRefNumberBeds = set.getInt(9);
    if(set.wasNull())
      anObject.cottageRefNumberBeds = Integer.MIN_VALUE;
        anObject.cottageRefDescription = set.getString(10);
        anObject.cottageRefCommentgen = set.getString(11);
        anObject.cottageRefUserGen = set.getString(12);
        anObject.cottageRefDateEdit = set.getTimestamp(13);

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

  public int[] getFilteredCodeArrayOLD(ENCottage2TKClassificationType aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENCOTTAGE2TKCLSSFCTNTP.CODE FROM ENCOTTAGE2TKCLSSFCTNTP";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCOTTAGE2TKCLSSFCTNTP.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCOTTAGE2TKCLSSFCTNTP.CODE = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCOTTAGE2TKCLSSFCTNTP.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENCOTTAGE2TKCLSSFCTNTP.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCOTTAGE2TKCLSSFCTNTP.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCOTTAGE2TKCLSSFCTNTP.MODIFY_TIME = ?";
        }
        if(aFilterObject.classificationTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCOTTAGE2TKCLSSFCTNTP.CLASSIFICATIONTYPERFCD = ? ";
        }
        if(aFilterObject.cottageRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCOTTAGE2TKCLSSFCTNTP.COTTAGEREFCODE = ? ";
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
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCOTTAGE2TKCLSSFCTNTP.USERGEN = ?";
             else
                 whereStr = whereStr + " ENCOTTAGE2TKCLSSFCTNTP.USERGEN LIKE ?";

           if(aFilterObject.userGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.userGen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.dateEdit != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.classificationTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.classificationTypeRef.code);
       }
       if(aFilterObject.cottageRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cottageRef.code);
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

  public int[] getFilteredCodeArray(ENCottage2TKClassificationTypeFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENCottage2TKClassificationType aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENCOTTAGE2TKCLSSFCTNTP.CODE FROM ENCOTTAGE2TKCLSSFCTNTP";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENCOTTAGE2TKCLSSFCTNTP.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCOTTAGE2TKCLSSFCTNTP.CODE = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENCOTTAGE2TKCLSSFCTNTP.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENCOTTAGE2TKCLSSFCTNTP.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCOTTAGE2TKCLSSFCTNTP.DATEEDIT = ?";
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENCOTTAGE2TKCLSSFCTNTP.MODIFY_TIME = ?";
        }
        if(aFilterObject.classificationTypeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCOTTAGE2TKCLSSFCTNTP.CLASSIFICATIONTYPERFCD = ? ";
        }
        if(aFilterObject.cottageRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENCOTTAGE2TKCLSSFCTNTP.COTTAGEREFCODE = ? ";
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
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENCOTTAGE2TKCLSSFCTNTP.USERGEN = ?";
             else
                 whereStr = whereStr + " ENCOTTAGE2TKCLSSFCTNTP.USERGEN LIKE ?";

           if(aFilterObject.userGen != null){
               number++;
               StringBuffer likeStr = new StringBuffer();
               likeStr.append(aFilterObject.userGen);
               for(int i = 0;i < likeStr.length();i++){
                    if(likeStr.charAt(i) == '*')
                         likeStr.setCharAt(i,'%');
                    if(likeStr.charAt(i) == '?')
                         likeStr.setCharAt(i,'_');
               }
               statement.setString(number,likeStr.toString());
           }
         }
        if(aFilterObject.dateEdit != null){
            number++;
            statement.setTimestamp(number,new java.sql.Timestamp(aFilterObject.dateEdit.getTime()));
        }
        if(aFilterObject.modify_time != Long.MIN_VALUE){
            number++;
            if(aFilterObject.modify_time == Long.MIN_VALUE)
                statement.setBigDecimal(number,null);
            else
                statement.setBigDecimal(number,new java.math.BigDecimal(aFilterObject.modify_time));
        }
       if(aFilterObject.classificationTypeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.classificationTypeRef.code);
       }
       if(aFilterObject.cottageRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.cottageRef.code);
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


   public ENCottage2TKClassificationType getObject(int uid) throws PersistenceException
   {
    ENCottage2TKClassificationType result = new ENCottage2TKClassificationType();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENCottage2TKClassificationType anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENCOTTAGE2TKCLSSFCTNTP.CODE, ENCOTTAGE2TKCLSSFCTNTP.USERGEN, ENCOTTAGE2TKCLSSFCTNTP.DATEEDIT, ENCOTTAGE2TKCLSSFCTNTP.MODIFY_TIME, ENCOTTAGE2TKCLSSFCTNTP.CLASSIFICATIONTYPERFCD, ENCOTTAGE2TKCLSSFCTNTP.COTTAGEREFCODE "
    +" FROM ENCOTTAGE2TKCLSSFCTNTP WHERE ENCOTTAGE2TKCLSSFCTNTP.CODE = ?";

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
        anObject.userGen = set.getString(2);
        anObject.dateEdit = set.getTimestamp(3);
        anObject.modify_time = set.getLong(4);
        if(set.wasNull())
         anObject.modify_time = Long.MIN_VALUE;
        anObject.classificationTypeRef.code = set.getInt(5);
        if ( set.wasNull() )
            anObject.classificationTypeRef.code = Integer.MIN_VALUE;
        anObject.cottageRef.code = set.getInt(6);
        if ( set.wasNull() )
            anObject.cottageRef.code = Integer.MIN_VALUE;
        if(anObject.classificationTypeRef.code != Integer.MIN_VALUE)
        {
           anObject.setClassificationTypeRef(
      new com.ksoe.techcard.dataminer.generated.TKClassificationTypeDAOGen(connection,getUserProfile()).getRef(anObject.classificationTypeRef.code));
    }
        if(anObject.cottageRef.code != Integer.MIN_VALUE)
        {
           anObject.setCottageRef(
      new com.ksoe.energynet.dataminer.generated.ENCottageDAOGen(connection,getUserProfile()).getRef(anObject.cottageRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENCottage2TKClassificationTypeRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENCottage2TKClassificationTypeRef ref = new com.ksoe.energynet.valueobject.references.ENCottage2TKClassificationTypeRef();
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

    selectStr = "DELETE FROM  ENCOTTAGE2TKCLSSFCTNTP WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENCottage2TKClassificationType object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENCottage2TKClassificationType.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENCottage2TKClassificationType.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENCottage2TKClassificationType.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENCottage2TKClassificationType.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENCottage2TKClassificationType.getObject%} access denied");

    selectStr =

    "SELECT  ENCOTTAGE2TKCLSSFCTNTP.CODE FROM  ENCOTTAGE2TKCLSSFCTNTP WHERE  ENCOTTAGE2TKCLSSFCTNTP.CODE = ?";
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
    _checkConditionToken(condition,"code","ENCOTTAGE2TKCLSSFCTNTP.CODE");
    _checkConditionToken(condition,"usergen","ENCOTTAGE2TKCLSSFCTNTP.USERGEN");
    _checkConditionToken(condition,"dateedit","ENCOTTAGE2TKCLSSFCTNTP.DATEEDIT");
    _checkConditionToken(condition,"modify_time","ENCOTTAGE2TKCLSSFCTNTP.MODIFY_TIME");
      // relationship conditions
    _checkConditionToken(condition,"classificationtyperef","CLASSIFICATIONTYPERFCD");
    _checkConditionToken(condition,"classificationtyperef.code","CLASSIFICATIONTYPERFCD");
    _checkConditionToken(condition,"cottageref","COTTAGEREFCODE");
    _checkConditionToken(condition,"cottageref.code","COTTAGEREFCODE");
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

  private void _collectAutoIncrementFields(ENCottage2TKClassificationType anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENCOTTAGE2TKCLSSFCTNTP", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENCOTTAGE2TKCLSSFCTNTP", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENCOTTAGE2TKCLSSFCTNTP", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENCOTTAGE2TKCLSSFCTNTP");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENCottage2TKClassificationTypeDAO
