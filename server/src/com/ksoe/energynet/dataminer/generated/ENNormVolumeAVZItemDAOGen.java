
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
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

import com.ksoe.energynet.valueobject.ENNormVolumeAVZItem;
import com.ksoe.energynet.valueobject.filter.ENNormVolumeAVZItemFilter;
import com.ksoe.energynet.valueobject.brief.ENNormVolumeAVZItemShort;
import com.ksoe.energynet.valueobject.lists.ENNormVolumeAVZItemShortList;

import com.ksoe.techcard.dataminer.TKMaterialsDAO;

/**
 * DAO Object for ENNormVolumeAVZItem;
 *
 */

public class ENNormVolumeAVZItemDAOGen extends GenericDataMiner {

   public ENNormVolumeAVZItemDAOGen(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile,aConnection);
   }

   public ENNormVolumeAVZItemDAOGen(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection,anUserProfile);
   }

   protected boolean isEqual(ENNormVolumeAVZItem inObject) throws PersistenceException
   {
      ENNormVolumeAVZItem obj = new ENNormVolumeAVZItem();
      obj.code = inObject.code;
      loadObject(obj);

	if(inObject.countGen == null && obj.countGen == null){}
	else
		if(inObject.countGen == null || obj.countGen == null) return false;
		else
			if ( ! inObject.countGen.equals(obj.countGen)){
				return false;
			}

	if(inObject.countRequired == null && obj.countRequired == null){}
	else
		if(inObject.countRequired == null || obj.countRequired == null) return false;
		else
			if ( ! inObject.countRequired.equals(obj.countRequired)){
				return false;
			}

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
     if (inObject.materialRef.code != obj.materialRef.code){
        return false;
     }
     if (inObject.normativeVolumeRef.code != obj.normativeVolumeRef.code){
        return false;
     }
      return true;
   }

   public int add(ENNormVolumeAVZItem anObject) throws PersistenceException
   {
    return add(anObject,true);
   }

   public int add(ENNormVolumeAVZItem anObject, boolean aUseSequential) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;


    if(aUseSequential)
     _collectAutoIncrementFields(anObject,connection);


    selectStr = "INSERT INTO ENNORMVOLUMEAVZITEM (CODE,COUNTGEN,COUNTREQUIRED,USERGEN,DATEEDIT,MATERIALREFCODE,NORMATIVEVOLUMEREFCODE) VALUES (?,?,?,?,?,?,?)";

    try
     {
      statement = connection.prepareStatement(selectStr);
      if (anObject.code != Integer.MIN_VALUE )
         statement.setInt(1,anObject.code);
      else
         statement.setNull(1,java.sql.Types.INTEGER);
      if (anObject.countGen != null)
        anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.countGen);
      if (anObject.countRequired != null)
        anObject.countRequired = anObject.countRequired.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(3,anObject.countRequired);
      statement.setString(4,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(5,null);
      else
        statement.setTimestamp(5,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.materialRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.techcard.dataminer.generated.TKMaterialsDAOGen(connection,getUserProfile()).exists(anObject.materialRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENNormVolumeAVZItem.materialRef.code%} = {%"+anObject.materialRef.code+"%}");
        statement.setInt(6,anObject.materialRef.code);
      }
      else
        statement.setNull(6,java.sql.Types.INTEGER);
      if (anObject.normativeVolumeRef.code != Integer.MIN_VALUE){
        if( ! new com.ksoe.energynet.dataminer.generated.ENNormativeVolumeAVZDAOGen(connection,getUserProfile()).exists(anObject.normativeVolumeRef.code))
           throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENNormVolumeAVZItem.normativeVolumeRef.code%} = {%"+anObject.normativeVolumeRef.code+"%}");
        statement.setInt(7,anObject.normativeVolumeRef.code);
      }
      else
        statement.setNull(7,java.sql.Types.INTEGER);

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
      throw new PersistenceException("Error in method {%ENNormVolumeAVZItemDAOGen.add%}",e);
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

   public void save(ENNormVolumeAVZItem anObject) throws PersistenceException
   {
    save(anObject,null);
   }

   public void save(ENNormVolumeAVZItem anObject,String[] anAttributes) throws PersistenceException
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
          if(fieldNameStr.compareTo("COUNTGEN") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("COUNTREQUIRED") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
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
          if(fieldNameStr.compareTo("MATERIALREF") == 0)
           {
            fields.add(fieldNameStr);
            continue;
           }
          fieldNameStr = processCondition(anAttributes[attrIndex]);
          if(fieldNameStr.compareTo("NORMATIVEVOLUMEREF") == 0)
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
        "UPDATE ENNORMVOLUMEAVZITEM SET  COUNTGEN = ? , COUNTREQUIRED = ? , USERGEN = ? , DATEEDIT = ? , MATERIALREFCODE = ? , NORMATIVEVOLUMEREFCODE = ? "
        +" WHERE CODE = ?";
       }
      else
       {
        selectStr =
        "UPDATE ENNORMVOLUMEAVZITEM SET ";
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
      if (anObject.countGen != null)
        anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(1,anObject.countGen);
      if (anObject.countRequired != null)
        anObject.countRequired = anObject.countRequired.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
      statement.setBigDecimal(2,anObject.countRequired);
      statement.setString(3,anObject.userGen);
      if (anObject.dateEdit == null)
        statement.setTimestamp(4,null);
      else
        statement.setTimestamp(4,new java.sql.Timestamp(anObject.dateEdit.getTime()));
      if (anObject.materialRef.code != Integer.MIN_VALUE)
        statement.setInt(5,anObject.materialRef.code);
      else
        statement.setNull(5,java.sql.Types.INTEGER);
      if (anObject.normativeVolumeRef.code != Integer.MIN_VALUE)
        statement.setInt(6,anObject.normativeVolumeRef.code);
      else
        statement.setNull(6,java.sql.Types.INTEGER);
          statement.setInt(7,anObject.code);
         }
        else
         {

          for(int i = 0;i < fields.size();i++)
           {
            if("COUNTGEN".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.countGen != null)
                    anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.countGen);
                continue;
             }
            if("COUNTREQUIRED".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.countRequired != null)
                    anObject.countRequired = anObject.countRequired.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
                statement.setBigDecimal(i+1,anObject.countRequired);
                continue;
             }
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
            if("MATERIALREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.materialRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.materialRef.code);
                else
                     statement.setNull(i+1,java.sql.Types.INTEGER);
                continue;
             }
            if("NORMATIVEVOLUMEREF".compareTo((String)fields.get(i)) == 0)
             {
                if (anObject.normativeVolumeRef.code != Integer.MIN_VALUE)
                     statement.setInt(i+1,anObject.normativeVolumeRef.code);
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

   } // end of save(ENNormVolumeAVZItem anObject,String[] anAttributes)


 public ENNormVolumeAVZItemShort getShortObject(int anObjectCode) throws PersistenceException
  {
   ENNormVolumeAVZItem filterObject = new ENNormVolumeAVZItem();
   Vector list;

   filterObject.code = anObjectCode;
   list = getFilteredList(filterObject).list;
   if(list.size() > 0)
    return (ENNormVolumeAVZItemShort)list.get(0);
   return null;
  }

  public ENNormVolumeAVZItemShortList getList(String aCondition) throws PersistenceException
   {
    return getScrollableFilteredList(null,aCondition,0,-1);
   }

  public ENNormVolumeAVZItemShortList getList() throws PersistenceException
   {
    return getScrollableFilteredList(null,null,0,-1);
   }

  public ENNormVolumeAVZItemShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,null,fromPosition,quantity);
   }

  public ENNormVolumeAVZItemShortList getFilteredList(ENNormVolumeAVZItem filterObject) throws PersistenceException
   {
    return getScrollableFilteredList(filterObject,0,-1);
   }

  public ENNormVolumeAVZItemShortList getScrollableFilteredList(ENNormVolumeAVZItem aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,null,fromPosition,quantity);
   }

   public ENNormVolumeAVZItemShortList getScrollableFilteredList(ENNormVolumeAVZItem aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,anCondition,null,fromPosition,quantity,null);
   }

  public ENNormVolumeAVZItemShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(null,anCondition,fromPosition,quantity);
   }

  public ENNormVolumeAVZItemShortList getScrollableFilteredList(ENNormVolumeAVZItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
   }

  public ENNormVolumeAVZItemShortList getScrollableFilteredList(ENNormVolumeAVZItemFilter aFilterObject,int fromPosition,int quantity, Vector aBindObjects) throws PersistenceException
   {
    return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
   }

/*
     public ENNormVolumeAVZItemShortList getScrollableFilteredList(ENNormVolumeAVZItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
 return null;
 }
**********************************/

  public ENNormVolumeAVZItemShortList getScrollableFilteredList(ENNormVolumeAVZItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector<? extends Object> aBindObjects) throws PersistenceException
   {
    ENNormVolumeAVZItemShortList result = new ENNormVolumeAVZItemShortList();
    ENNormVolumeAVZItemShort anObject;
    result.list = new Vector();

    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENNORMVOLUMEAVZITEM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    selectStr = "SELECT "+
     "ENNORMVOLUMEAVZITEM.CODE"+
     ",ENNORMVOLUMEAVZITEM.COUNTGEN"+
     ",ENNORMVOLUMEAVZITEM.COUNTREQUIRED"+
     ",ENNORMVOLUMEAVZITEM.USERGEN"+
     ",ENNORMVOLUMEAVZITEM.DATEEDIT"+

      ", TKMATERIALS.CODE " +
      ", TKMATERIALS.NAME " +
      ", TKMATERIALS.COST " +
      ", TKMATERIALS.DELIVERYDATE " +
      ", TKMATERIALS.NUMKATALOG " +
      ", TKMATERIALS.IDENTID " +
      ", ENNORMATIVEVOLUMEAVZ.CODE " +
      ", ENNORMATIVEVOLUMEAVZ.USERGEN " +
      ", ENNORMATIVEVOLUMEAVZ.DATEEDIT " +
     " FROM ENNORMVOLUMEAVZITEM " +
     ", TKMATERIALS " +
     ", ENNORMATIVEVOLUMEAVZ " +
     //" WHERE "
  "";
     whereStr = " TKMATERIALS.CODE = ENNORMVOLUMEAVZITEM.MATERIALREFCODE" ; //+
      whereStr = whereStr +" AND ENNORMATIVEVOLUMEAVZ.CODE = ENNORMVOLUMEAVZITEM.NORMATIVEVOLUMEREFCODE" ; //+
    //selectStr = selectStr + " ${s} ENNORMVOLUMEAVZITEM.CODE IN ( SELECT ENNORMVOLUMEAVZITEM.CODE FROM ENNORMVOLUMEAVZITEM ";

// " ";
      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENNORMVOLUMEAVZITEM.CODE = ?";
        }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENNORMVOLUMEAVZITEM.COUNTGEN = ?";
        }
        if(aFilterObject.countRequired != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENNORMVOLUMEAVZITEM.COUNTREQUIRED = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  UPPER(ENNORMVOLUMEAVZITEM.USERGEN) = UPPER(?)";
             else
                 whereStr = whereStr + " UPPER(ENNORMVOLUMEAVZITEM.USERGEN) LIKE UPPER(?)";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENNORMVOLUMEAVZITEM.DATEEDIT = ?";
        }
        if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENNORMVOLUMEAVZITEM.MATERIALREFCODE = ? ";
        }
        if(aFilterObject.normativeVolumeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "ENNORMVOLUMEAVZITEM.NORMATIVEVOLUMEREFCODE = ? ";
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
        if(aFilterObject.countGen != null){
            number++;
            aFilterObject.countGen = aFilterObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.countRequired != null){
            number++;
            aFilterObject.countRequired = aFilterObject.countRequired.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countRequired);
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
       if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.materialRef.code);
       }
       if(aFilterObject.normativeVolumeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.normativeVolumeRef.code);
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

        anObject = new ENNormVolumeAVZItemShort();

        anObject.code = set.getInt(1);
        if ( set.wasNull() )
            anObject.code = Integer.MIN_VALUE;
        anObject.countGen = set.getBigDecimal(2);
        if(anObject.countGen != null)
            anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.countRequired = set.getBigDecimal(3);
        if(anObject.countRequired != null)
            anObject.countRequired = anObject.countRequired.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userGen = set.getString(4);
        anObject.dateEdit = set.getTimestamp(5);

        anObject.materialRefCode = set.getInt(6);
    if(set.wasNull())
      anObject.materialRefCode = Integer.MIN_VALUE;
        anObject.materialRefName = set.getString(7);
        anObject.materialRefCost = set.getBigDecimal(8);
        if(anObject.materialRefCost != null)
          anObject.materialRefCost = anObject.materialRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.materialRefDeliveryDate = set.getInt(9);
    if(set.wasNull())
      anObject.materialRefDeliveryDate = Integer.MIN_VALUE;
        anObject.materialRefNumkatalog = set.getString(10);
        anObject.materialRefIdentid = set.getString(11);
        anObject.normativeVolumeRefCode = set.getInt(12);
    if(set.wasNull())
      anObject.normativeVolumeRefCode = Integer.MIN_VALUE;
        anObject.normativeVolumeRefUserGen = set.getString(13);
        anObject.normativeVolumeRefDateEdit = set.getTimestamp(14);

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

  public int[] getFilteredCodeArrayOLD(ENNormVolumeAVZItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENNORMVOLUMEAVZITEM.CODE FROM ENNORMVOLUMEAVZITEM";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENNORMVOLUMEAVZITEM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENNORMVOLUMEAVZITEM.CODE = ?";
        }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENNORMVOLUMEAVZITEM.COUNTGEN = ?";
        }
        if(aFilterObject.countRequired != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENNORMVOLUMEAVZITEM.COUNTREQUIRED = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENNORMVOLUMEAVZITEM.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENNORMVOLUMEAVZITEM.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENNORMVOLUMEAVZITEM.DATEEDIT = ?";
        }
        if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENNORMVOLUMEAVZITEM.MATERIALREFCODE = ? ";
        }
        if(aFilterObject.normativeVolumeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENNORMVOLUMEAVZITEM.NORMATIVEVOLUMEREFCODE = ? ";
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
        if(aFilterObject.countGen != null){
            number++;
            aFilterObject.countGen = aFilterObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.countRequired != null){
            number++;
            aFilterObject.countRequired = aFilterObject.countRequired.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countRequired);
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENNORMVOLUMEAVZITEM.USERGEN = ?";
             else
                 whereStr = whereStr + " ENNORMVOLUMEAVZITEM.USERGEN LIKE ?";

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
       if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.materialRef.code);
       }
       if(aFilterObject.normativeVolumeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.normativeVolumeRef.code);
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

  public int[] getFilteredCodeArray(ENNormVolumeAVZItemFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException
    {
  return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
    }


  public int[] getFilteredCodeArray(ENNormVolumeAVZItem aFilterObject,String anCondition,String anOrderBy,int fromPosition,int quantity,Vector aBindObjects) throws PersistenceException
   {
    Vector result = new Vector();

    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet  set = null;
    String     selectStr = "SELECT ENNORMVOLUMEAVZITEM.CODE FROM ENNORMVOLUMEAVZITEM";
    String     whereStr = "";
    String     condition = processCondition(anCondition);
    String     orderBy = processCondition(anOrderBy);

    if(orderBy.length() == 0)
     orderBy = "ENNORMVOLUMEAVZITEM.CODE";

    if(quantity < 0)
     quantity = Integer.MAX_VALUE/2;

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

      if(aFilterObject != null)
      {
        if(aFilterObject.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENNORMVOLUMEAVZITEM.CODE = ?";
        }
        if(aFilterObject.countGen != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENNORMVOLUMEAVZITEM.COUNTGEN = ?";
        }
        if(aFilterObject.countRequired != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENNORMVOLUMEAVZITEM.COUNTREQUIRED = ?";
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND ";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + "  ENNORMVOLUMEAVZITEM.USERGEN = ?";
             else
                 whereStr = whereStr + "  ENNORMVOLUMEAVZITEM.USERGEN LIKE ?";
         }
        if(aFilterObject.dateEdit != null) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + "  ENNORMVOLUMEAVZITEM.DATEEDIT = ?";
        }
        if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENNORMVOLUMEAVZITEM.MATERIALREFCODE = ? ";
        }
        if(aFilterObject.normativeVolumeRef.code != Integer.MIN_VALUE) {
            if(whereStr.length() != 0)
               whereStr = whereStr + " AND ";
            whereStr = whereStr + " ENNORMVOLUMEAVZITEM.NORMATIVEVOLUMEREFCODE = ? ";
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
        if(aFilterObject.countGen != null){
            number++;
            aFilterObject.countGen = aFilterObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countGen);
        }
        if(aFilterObject.countRequired != null){
            number++;
            aFilterObject.countRequired = aFilterObject.countRequired.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
            statement.setBigDecimal(number,aFilterObject.countRequired);
        }
         if (aFilterObject.userGen != null) {
             if(whereStr.length() != 0)
                 whereStr = whereStr + " AND";
             if (aFilterObject.userGen.indexOf('*',0) < 0 && aFilterObject.userGen.indexOf('?',0) < 0)
                 whereStr = whereStr + " ENNORMVOLUMEAVZITEM.USERGEN = ?";
             else
                 whereStr = whereStr + " ENNORMVOLUMEAVZITEM.USERGEN LIKE ?";

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
       if(aFilterObject.materialRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.materialRef.code);
       }
       if(aFilterObject.normativeVolumeRef.code != Integer.MIN_VALUE) {
           number++;
           statement.setInt(number,aFilterObject.normativeVolumeRef.code);
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


   public ENNormVolumeAVZItem getObject(int uid) throws PersistenceException
   {
    ENNormVolumeAVZItem result = new ENNormVolumeAVZItem();
    result.code = uid;
    loadObject(result);
    if(result.code == Integer.MIN_VALUE)
     return null;
    return result;
   }


  public void loadObject(ENNormVolumeAVZItem anObject) throws PersistenceException
   {
    String     selectStr;
    Connection connection = getConnection();
    PreparedStatement statement = null;
    ResultSet set = null;



    selectStr =
    "SELECT  ENNORMVOLUMEAVZITEM.CODE, ENNORMVOLUMEAVZITEM.COUNTGEN, ENNORMVOLUMEAVZITEM.COUNTREQUIRED, ENNORMVOLUMEAVZITEM.USERGEN, ENNORMVOLUMEAVZITEM.DATEEDIT, ENNORMVOLUMEAVZITEM.MATERIALREFCODE, ENNORMVOLUMEAVZITEM.NORMATIVEVOLUMEREFCODE "
    +" FROM ENNORMVOLUMEAVZITEM WHERE ENNORMVOLUMEAVZITEM.CODE = ?";

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
        anObject.countGen = set.getBigDecimal(2);
        if(anObject.countGen != null)
            anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.countRequired = set.getBigDecimal(3);
        if(anObject.countRequired != null)
            anObject.countRequired = anObject.countRequired.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
        anObject.userGen = set.getString(4);
        anObject.dateEdit = set.getTimestamp(5);
        anObject.materialRef.code = set.getInt(6);
        if ( set.wasNull() )
            anObject.materialRef.code = Integer.MIN_VALUE;
        anObject.normativeVolumeRef.code = set.getInt(7);
        if ( set.wasNull() )
            anObject.normativeVolumeRef.code = Integer.MIN_VALUE;
        if(anObject.materialRef.code != Integer.MIN_VALUE)
        {
           anObject.setMaterialRef(
      new com.ksoe.techcard.dataminer.generated.TKMaterialsDAOGen(connection,getUserProfile()).getRef(anObject.materialRef.code));
    }
        if(anObject.normativeVolumeRef.code != Integer.MIN_VALUE)
        {
           anObject.setNormativeVolumeRef(
      new com.ksoe.energynet.dataminer.generated.ENNormativeVolumeAVZDAOGen(connection,getUserProfile()).getRef(anObject.normativeVolumeRef.code));
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


  public com.ksoe.energynet.valueobject.references.ENNormVolumeAVZItemRef getRef(int anObjectCode) throws PersistenceException
   {
    com.ksoe.energynet.valueobject.references.ENNormVolumeAVZItemRef ref = new com.ksoe.energynet.valueobject.references.ENNormVolumeAVZItemRef();
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

    selectStr = "DELETE FROM  ENNORMVOLUMEAVZITEM WHERE CODE = ?";

    if(getUserProfile() == null)
     throw new PersistenceException("Internal Error (User Profile Is Undefined)");

    ENNormVolumeAVZItem object = getObject(uid);

    if(object == null)
     throw new PersistenceException("{%ENNormVolumeAVZItem.getObject%} access denied");

    if(new SegregationProcessor().getSegregationInfoForDataAccess(ENNormVolumeAVZItem.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied())
     throw new PersistenceException("{%ENNormVolumeAVZItem.remove%} access denied");

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

    SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENNormVolumeAVZItem.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
    if(segregationInfo.isAccessDenied())
      throw new PersistenceException("{%ENNormVolumeAVZItem.getObject%} access denied");

    selectStr =

    "SELECT  ENNORMVOLUMEAVZITEM.CODE FROM  ENNORMVOLUMEAVZITEM WHERE  ENNORMVOLUMEAVZITEM.CODE = ?";
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
    _checkConditionToken(condition,"code","ENNORMVOLUMEAVZITEM.CODE");
    _checkConditionToken(condition,"countgen","ENNORMVOLUMEAVZITEM.COUNTGEN");
    _checkConditionToken(condition,"countrequired","ENNORMVOLUMEAVZITEM.COUNTREQUIRED");
    _checkConditionToken(condition,"usergen","ENNORMVOLUMEAVZITEM.USERGEN");
    _checkConditionToken(condition,"dateedit","ENNORMVOLUMEAVZITEM.DATEEDIT");
      // relationship conditions
    _checkConditionToken(condition,"materialref","MATERIALREFCODE");
    _checkConditionToken(condition,"materialref.code","MATERIALREFCODE");
    _checkConditionToken(condition,"normativevolumeref","NORMATIVEVOLUMEREFCODE");
    _checkConditionToken(condition,"normativevolumeref.code","NORMATIVEVOLUMEREFCODE");
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

  private void _collectAutoIncrementFields(ENNormVolumeAVZItem anObject,
      Connection connection) throws PersistenceException {

    SequenceKey hashKey = new SequenceKey("ENNORMVOLUMEAVZITEM", "CODE");
    Integer nextSeqValue = null;
    SequenceValue sequenceValue;
    synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
      if (sequenceValue == null) {
        sequenceValue = getNewSequenceValue("ENNORMVOLUMEAVZITEM", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
      if (!sequenceValue.isNextValueAvailable()) {
        sequenceValue = getNewSequenceValue("ENNORMVOLUMEAVZITEM", "CODE");
        _sequenceTable.put(hashKey, sequenceValue);
      }
    }

    nextSeqValue = sequenceValue.getNextValue();
    if (nextSeqValue == null) {
      throw new PersistenceException(
          "Can't obtain auto increment value from: ENNORMVOLUMEAVZITEM");
    } else {
      anObject.code = nextSeqValue.intValue();
      return;
    }
  }

} // end of ENNormVolumeAVZItemDAO
